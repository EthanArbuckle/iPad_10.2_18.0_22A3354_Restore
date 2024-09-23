@implementation AXAirPodSettingsManager

- (id)_productIdentifierForBTDevice:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = objc_msgSend(v4, "vendorId");
  v6 = objc_msgSend(v4, "productId");

  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%d,%d"), v5, v6);
}

- (NSArray)pairedAirPods
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  AXLogAirPodSettings();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "enabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v7, "bluetoothState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_18C62B000, v2, OS_LOG_TYPE_DEFAULT, "state: %@ %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pairedDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__AXAirPodSettingsManager_pairedAirPods__block_invoke;
  v15[3] = &unk_1E24C57A0;
  v12 = v9;
  v16 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);

  AXLogAirPodSettings();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl(&dword_18C62B000, v13, OS_LOG_TYPE_INFO, "Air!: %@", buf, 0xCu);
  }

  return (NSArray *)v12;
}

void __40__AXAirPodSettingsManager_pairedAirPods__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AXLogAirPodSettings();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "vendorId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "productId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v3;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_INFO, "BT device: %@ %@ %@", (uint8_t *)&v8, 0x20u);

  }
  if (objc_msgSend(v3, "vendorId") == 76
    && (objc_msgSend(v3, "productId") == 8206
     || objc_msgSend(v3, "productId") == 8202
     || objc_msgSend(v3, "productId") == 8211
     || objc_msgSend(v3, "productId") == 8212
     || objc_msgSend(v3, "productId") == 8228
     || objc_msgSend(v3, "productId") == 8217
     || objc_msgSend(v3, "productId") == 8219
     || objc_msgSend(v3, "productId") == 8222
     || objc_msgSend(v3, "productId") == 8223
     || AXIsBeatsProductId(v3)))
  {
    AXLogAirPodSettings();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_INFO, "Air!: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

- (BOOL)supportsSpatialAudio
{
  if (supportsSpatialAudio_onceToken != -1)
    dispatch_once(&supportsSpatialAudio_onceToken, &__block_literal_global_6);
  return supportsSpatialAudio_SupportsSpatialAudio;
}

uint64_t __47__AXAirPodSettingsManager_supportsSpatialAudio__block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  supportsSpatialAudio_SupportsSpatialAudio = result ^ 1;
  return result;
}

- (BOOL)pairedAirPodsSupportSpatialAudio
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXAirPodSettingsManager pairedAirPods](self, "pairedAirPods", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "vendorId") != 76 || objc_msgSend(v7, "productId") != 8203)
        {
          v8 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)titleForSettings
{
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  AXAirPodsLocalizedStringForKey(CFSTR("AirPodTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[AXAirPodSettingsManager pairedAirPods](self, "pairedAirPods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__AXAirPodSettingsManager_titleForSettings__block_invoke;
  v8[3] = &unk_1E24C57E8;
  v8[4] = &v13;
  v8[5] = &v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  if (*((_BYTE *)v10 + 24))
  {
    if (*((_BYTE *)v14 + 24))
      v5 = CFSTR("AirPodTitleBoth");
    else
      v5 = CFSTR("AirPodTitleBeats");
    AXAirPodsB494LocalizedStringForKey(v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v3;
}

void __43__AXAirPodSettingsManager_titleForSettings__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  _BOOL4 v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "productId") == 8206
    || objc_msgSend(v6, "productId") == 8202
    || objc_msgSend(v6, "productId") == 8211
    || objc_msgSend(v6, "productId") == 8212
    || objc_msgSend(v6, "productId") == 8228
    || objc_msgSend(v6, "productId") == 8217
    || objc_msgSend(v6, "productId") == 8219
    || objc_msgSend(v6, "productId") == 8222
    || objc_msgSend(v6, "productId") == 8223)
  {
    v3 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4 = v6;
  }
  else
  {
    v5 = AXIsBeatsProductId(v6);
    v4 = v6;
    if (!v5)
      goto LABEL_12;
    v3 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  *v3 = 1;
LABEL_12:

}

- (id)disambiguationString
{
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  AXAirPodsLocalizedStringForKey(CFSTR("AirPodSelection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[AXAirPodSettingsManager pairedAirPods](self, "pairedAirPods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__AXAirPodSettingsManager_disambiguationString__block_invoke;
  v8[3] = &unk_1E24C57E8;
  v8[4] = &v13;
  v8[5] = &v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  if (*((_BYTE *)v10 + 24))
  {
    if (*((_BYTE *)v14 + 24))
      v5 = CFSTR("AirPodSelectionBoth");
    else
      v5 = CFSTR("AirPodSelectionBeats");
    AXAirPodsB494LocalizedStringForKey(v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v3;
}

void __47__AXAirPodSettingsManager_disambiguationString__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  _BOOL4 v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "productId") == 8206
    || objc_msgSend(v6, "productId") == 8202
    || objc_msgSend(v6, "productId") == 8211
    || objc_msgSend(v6, "productId") == 8212
    || objc_msgSend(v6, "productId") == 8228
    || objc_msgSend(v6, "productId") == 8217
    || objc_msgSend(v6, "productId") == 8219
    || objc_msgSend(v6, "productId") == 8222
    || objc_msgSend(v6, "productId") == 8223)
  {
    v3 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4 = v6;
  }
  else
  {
    v5 = AXIsBeatsProductId(v6);
    v4 = v6;
    if (!v5)
      goto LABEL_12;
    v3 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  *v3 = 1;
LABEL_12:

}

- (BOOL)isBeatsProduct:(id)a3
{
  return AXIsBeatsProductId(a3);
}

- (BOOL)isAirPodProduct:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "vendorId") == 76
    && (objc_msgSend(v3, "productId") == 8206
     || objc_msgSend(v3, "productId") == 8202
     || objc_msgSend(v3, "productId") == 8211
     || objc_msgSend(v3, "productId") == 8212
     || objc_msgSend(v3, "productId") == 8228
     || objc_msgSend(v3, "productId") == 8217
     || objc_msgSend(v3, "productId") == 8219
     || objc_msgSend(v3, "productId") == 8222
     || objc_msgSend(v3, "productId") == 8223);

  return v4;
}

- (id)_deviceWithDeviceAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[AXAirPodSettingsManager pairedAirPods](self, "pairedAirPods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__AXAirPodSettingsManager__deviceWithDeviceAddress___block_invoke;
  v9[3] = &unk_1E24C5810;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__AXAirPodSettingsManager__deviceWithDeviceAddress___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)supportsTapSpeedForDeviceAddress:(id)a3
{
  AXAirPodSettingsManager *v3;
  void *v4;

  v3 = self;
  -[AXAirPodSettingsManager _deviceWithDeviceAddress:](self, "_deviceWithDeviceAddress:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[AXAirPodSettingsManager isAirPodProduct:](v3, "isAirPodProduct:", v4);

  return (char)v3;
}

- (float)tapSpeedForDeviceAddress:(id)a3
{
  float result;

  _AXSAirPodsTapSpeed();
  return result;
}

- (void)setTapSpeed:(float)a3 forDeviceAddress:(id)a4
{
  double v6;
  id v7;

  v7 = a4;
  _AXSSetAirPodsTapSpeed();
  *(float *)&v6 = a3;
  -[AXAirPodSettingsManager nps_setTapSpeed:forDeviceAddress:](self, "nps_setTapSpeed:forDeviceAddress:", v7, v6);

}

- (BOOL)supportsNoiseCancellationEnabledForDeviceAddress:(id)a3
{
  void *v3;
  BOOL v4;

  -[AXAirPodSettingsManager _deviceWithDeviceAddress:](self, "_deviceWithDeviceAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "vendorId") == 76
    && (objc_msgSend(v3, "productId") == 8206
     || objc_msgSend(v3, "productId") == 8210
     || objc_msgSend(v3, "productId") == 8212
     || objc_msgSend(v3, "productId") == 8228
     || objc_msgSend(v3, "productId") == 8219
     || objc_msgSend(v3, "productId") == 8221);

  return v4;
}

- (BOOL)noiseCancellationEnabledWithOneUnitForDeviceAddress:(id)a3
{
  return _AXSAirPodsNoiseCancellationWithOneUnit() != 0;
}

- (void)setNoiseCancellationEnabledWithOneUnit:(BOOL)a3 forDeviceAddress:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  _AXSSetAirPodsNoiseCancellationWithOneUnit();
  -[AXAirPodSettingsManager nps_setNoiseCancellationEnabledWithOneUnit:forDeviceAddress:](self, "nps_setNoiseCancellationEnabledWithOneUnit:forDeviceAddress:", v4, v6);

}

- (BOOL)supportsToneVolumeForDeviceAddress:(id)a3
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AXAirPodSettingsManager _deviceWithDeviceAddress:](self, "_deviceWithDeviceAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getAACPCapabilityInteger:", 7);
  v5 = objc_msgSend(v3, "connected");
  AXLogAirPodSettings();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v3;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_DEFAULT, "BT Device has AACP Capability: %@ = %@ and connected %@", (uint8_t *)&v11, 0x20u);

  }
  if (v4)
    v9 = v5;
  else
    v9 = 0;

  return v9;
}

- (BOOL)supportsCaseTonesForDeviceAddress:(id)a3
{
  void *v3;
  int v4;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AXAirPodSettingsManager _deviceWithDeviceAddress:](self, "_deviceWithDeviceAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productId");
  v6 = v4 == 8230 || v4 == 8221;
  v7 = objc_msgSend(v3, "connected");
  AXLogAirPodSettings();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v3;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "BT Device supports Case Tones: %@ = %@ and connected %@", (uint8_t *)&v12, 0x20u);

  }
  return v7 & v6;
}

- (void)setCaseTonesEnabled:(BOOL)a3 forDeviceAddress:(id)a4
{
  _AXSSetHeadsetCaseTonesEnabled();
}

- (BOOL)caseTonesEnabledForDeviceAddress:(id)a3
{
  return _AXSHeadsetCaseTonesEnabled() != 0;
}

- (unsigned)defaultToneVolumeForDeviceAddress:(id)a3
{
  return _AXSAirPodsDefaultToneVolume();
}

- (unsigned)toneVolumeForDeviceAddress:(id)a3
{
  return _AXSAirPodsToneVolume();
}

- (void)setToneVolume:(unsigned int)a3 forDeviceAddress:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  AXLogAirPodSettings();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_DEFAULT, "Setting tone volume %@ for %@", (uint8_t *)&v10, 0x16u);

  }
  _AXSSetAirPodsToneVolume();
  *(float *)&v9 = (float)v4;
  -[AXAirPodSettingsManager nps_setToneVolume:forDeviceAddress:](self, "nps_setToneVolume:forDeviceAddress:", v6, v9);

}

- (BOOL)supportsHoldDurationForDeviceAddress:(id)a3
{
  AXAirPodSettingsManager *v3;
  void *v4;

  v3 = self;
  -[AXAirPodSettingsManager _deviceWithDeviceAddress:](self, "_deviceWithDeviceAddress:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[AXAirPodSettingsManager isAirPodProduct:](v3, "isAirPodProduct:", v4);

  return (char)v3;
}

- (float)holdDurationForDeviceAddress:(id)a3
{
  float result;

  _AXSAirPodsHoldDuration();
  return result;
}

- (void)setHoldDuration:(float)a3 forDeviceAddress:(id)a4
{
  double v6;
  id v7;

  v7 = a4;
  _AXSSetAirPodsHoldDuration();
  *(float *)&v6 = a3;
  -[AXAirPodSettingsManager nps_setHoldDuration:forDeviceAddress:](self, "nps_setHoldDuration:forDeviceAddress:", v7, v6);

}

- (BOOL)supportsVolumeSwipeForDeviceAddress:(id)a3
{
  void *v3;
  BOOL v4;

  -[AXAirPodSettingsManager _deviceWithDeviceAddress:](self, "_deviceWithDeviceAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "vendorId") == 76
    && (objc_msgSend(v3, "productId") == 8212 || objc_msgSend(v3, "productId") == 8228);

  return v4;
}

- (BOOL)volumeSwipeEnabledForDeviceAddress:(id)a3
{
  return _AXSAirPodsVolumeSwipeEnabled() != 0;
}

- (void)setVolumeSwipeEnabled:(BOOL)a3 forDeviceAddress:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  _AXSSetAirPodsVolumeSwipeEnabled();
  -[AXAirPodSettingsManager nps_setVolumeSwipeEnabled:forDeviceAddress:](self, "nps_setVolumeSwipeEnabled:forDeviceAddress:", v4, v6);

}

- (float)volumeSwipeDurationForDeviceAddress:(id)a3
{
  float result;

  _AXSAirPodsVolumeSwipeDuration();
  return result;
}

- (void)setVolumeSwipeDuration:(float)a3 forDeviceAddress:(id)a4
{
  double v6;
  id v7;

  v7 = a4;
  _AXSSetAirPodsVolumeSwipeDuration();
  *(float *)&v6 = a3;
  -[AXAirPodSettingsManager nps_setVolumeSwipeDuration:forDeviceAddress:](self, "nps_setVolumeSwipeDuration:forDeviceAddress:", v7, v6);

}

- (BOOL)supportsSpatialAudioForDeviceAddress:(id)a3
{
  void *v3;
  BOOL v4;

  -[AXAirPodSettingsManager _deviceWithDeviceAddress:](self, "_deviceWithDeviceAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "vendorId") != 76
    || objc_msgSend(v3, "productId") != 8203 && objc_msgSend(v3, "productId") != 8230;

  return v4;
}

- (id)accessibilityDomainAccessor
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D516D8]),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "BOOLValue"),
        v4,
        (v5 & 1) == 0))
  {
    v7 = objc_alloc(MEMORY[0x1E0D51610]);
    v6 = (void *)objc_msgSend(v7, "initWithDomain:pairedDevice:", *MEMORY[0x1E0DDDF40], v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_nps_airPodsDictionaryForPreference:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[AXAirPodSettingsManager accessibilityDomainAccessor](self, "accessibilityDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "synchronize");
  objc_msgSend(v5, "dictionaryForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_nps_updateAirPodsDictionaryForPreference:(id)a3 deviceAddress:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  AXLogAirPodSettings();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v9;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_INFO, "[NPS] Updating device %@, %@ => %@", buf, 0x20u);
  }

  if (objc_msgSend(v8, "length") && (v12 = objc_msgSend(v9, "length"), v10) && v12)
  {
    -[AXAirPodSettingsManager accessibilityDomainAccessor](self, "accessibilityDomainAccessor");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[AXAirPodSettingsManager _nps_airPodsDictionaryForPreference:](self, "_nps_airPodsDictionaryForPreference:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = objc_msgSend(v14, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;
      -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v10, v9);
      -[NSObject setObject:forKey:](v13, "setObject:forKey:", v16, v8);
      v17 = (id)-[NSObject synchronize](v13, "synchronize");
      v18 = (void *)objc_opt_new();
      -[NSObject domain](v13, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0C99E60];
      v23 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "synchronizeNanoDomain:keys:", v19, v22);

    }
    else
    {
      AXLogAirPodSettings();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C62B000, v16, OS_LOG_TYPE_INFO, "[NPS] No domain accessor!", buf, 2u);
      }
    }

  }
  else
  {
    AXLogAirPodSettings();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v13, OS_LOG_TYPE_INFO, "[NPS] invalid parameters!", buf, 2u);
    }
  }

}

- (float)nps_tapSpeedForDeviceAddress:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  float v8;
  float v9;

  v4 = *MEMORY[0x1E0DDDFB0];
  v5 = a3;
  -[AXAirPodSettingsManager _nps_airPodsDictionaryForPreference:](self, "_nps_airPodsDictionaryForPreference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.25;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      v8 = v9;
    }
  }

  return v8;
}

- (void)nps_setTapSpeed:(float)a3 forDeviceAddress:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  id v10;

  v6 = *MEMORY[0x1E0DDDFB0];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  *(float *)&v9 = a3;
  objc_msgSend(v7, "numberWithFloat:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAirPodSettingsManager _nps_updateAirPodsDictionaryForPreference:deviceAddress:value:](self, "_nps_updateAirPodsDictionaryForPreference:deviceAddress:value:", v6, v8, v10);

}

- (BOOL)nps_noiseCancellationEnabledWithOneUnitForDeviceAddress:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = *MEMORY[0x1E0DDDF90];
  v5 = a3;
  -[AXAirPodSettingsManager _nps_airPodsDictionaryForPreference:](self, "_nps_airPodsDictionaryForPreference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = 0;

  return v8;
}

- (void)nps_setNoiseCancellationEnabledWithOneUnit:(BOOL)a3 forDeviceAddress:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v6 = *MEMORY[0x1E0DDDF90];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithBool:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAirPodSettingsManager _nps_updateAirPodsDictionaryForPreference:deviceAddress:value:](self, "_nps_updateAirPodsDictionaryForPreference:deviceAddress:value:", v6, v8, v9);

}

- (float)nps_holdDurationForDeviceAddress:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  float v8;
  float v9;

  v4 = *MEMORY[0x1E0DDDF80];
  v5 = a3;
  -[AXAirPodSettingsManager _nps_airPodsDictionaryForPreference:](self, "_nps_airPodsDictionaryForPreference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.5;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      v8 = v9;
    }
  }

  return v8;
}

- (void)nps_setHoldDuration:(float)a3 forDeviceAddress:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  id v10;

  v6 = *MEMORY[0x1E0DDDF80];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  *(float *)&v9 = a3;
  objc_msgSend(v7, "numberWithFloat:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAirPodSettingsManager _nps_updateAirPodsDictionaryForPreference:deviceAddress:value:](self, "_nps_updateAirPodsDictionaryForPreference:deviceAddress:value:", v6, v8, v10);

}

- (unsigned)nps_defaultToneVolumeForDeviceAddress:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v4 = *MEMORY[0x1E0DDDF70];
  v5 = a3;
  -[AXAirPodSettingsManager _nps_airPodsDictionaryForPreference:](self, "_nps_airPodsDictionaryForPreference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = objc_msgSend(v7, "unsignedIntValue");
  else
    v8 = 80;

  return v8;
}

- (float)nps_toneVolumeForDeviceAddress:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  float v8;
  float v9;

  v4 = *MEMORY[0x1E0DDDFA8];
  v5 = a3;
  -[AXAirPodSettingsManager _nps_airPodsDictionaryForPreference:](self, "_nps_airPodsDictionaryForPreference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "floatValue");
    v9 = v8;
  }
  else
  {
    v9 = 80.0;
  }

  return v9;
}

- (void)nps_setToneVolume:(float)a3 forDeviceAddress:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  id v10;

  v6 = *MEMORY[0x1E0DDDFA8];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  *(float *)&v9 = a3;
  objc_msgSend(v7, "numberWithFloat:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAirPodSettingsManager _nps_updateAirPodsDictionaryForPreference:deviceAddress:value:](self, "_nps_updateAirPodsDictionaryForPreference:deviceAddress:value:", v6, v8, v10);

}

- (BOOL)nps_volumeSwipeEnabledForDeviceAddress:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = *MEMORY[0x1E0DDDFD0];
  v5 = a3;
  -[AXAirPodSettingsManager _nps_airPodsDictionaryForPreference:](self, "_nps_airPodsDictionaryForPreference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = 1;

  return v8;
}

- (void)nps_setVolumeSwipeEnabled:(BOOL)a3 forDeviceAddress:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v6 = *MEMORY[0x1E0DDDFD0];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithBool:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAirPodSettingsManager _nps_updateAirPodsDictionaryForPreference:deviceAddress:value:](self, "_nps_updateAirPodsDictionaryForPreference:deviceAddress:value:", v6, v8, v9);

}

- (float)nps_volumeSwipeDurationForDeviceAddress:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  float v8;
  float v9;

  v4 = *MEMORY[0x1E0DDDFC0];
  v5 = a3;
  -[AXAirPodSettingsManager _nps_airPodsDictionaryForPreference:](self, "_nps_airPodsDictionaryForPreference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.5;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      v8 = v9;
    }
  }

  return v8;
}

- (void)nps_setVolumeSwipeDuration:(float)a3 forDeviceAddress:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  id v10;

  v6 = *MEMORY[0x1E0DDDFC0];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  *(float *)&v9 = a3;
  objc_msgSend(v7, "numberWithFloat:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAirPodSettingsManager _nps_updateAirPodsDictionaryForPreference:deviceAddress:value:](self, "_nps_updateAirPodsDictionaryForPreference:deviceAddress:value:", v6, v8, v10);

}

- (void)_serviceEventForDevice:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 eventType:(int)a5 specificEvent:(unsigned int)a6 result:(int)a7
{
  AXDispatchTimer *delayTimer;
  _QWORD v8[5];

  delayTimer = self->_delayTimer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__AXAirPodSettingsManager__serviceEventForDevice_serviceMask_eventType_specificEvent_result___block_invoke;
  v8[3] = &unk_1E24C4C38;
  v8[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](delayTimer, "afterDelay:processBlock:", v8, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, 0.5);
}

uint64_t __93__AXAirPodSettingsManager__serviceEventForDevice_serviceMask_eventType_specificEvent_result___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_probeAccessories");
}

- (void)_accessoryEventForManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6
{
  AXDispatchTimer *delayTimer;
  _QWORD v7[5];

  delayTimer = self->_delayTimer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__AXAirPodSettingsManager__accessoryEventForManager_event_device_state___block_invoke;
  v7[3] = &unk_1E24C4C38;
  v7[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](delayTimer, "afterDelay:processBlock:", v7, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, 0.5);
}

uint64_t __72__AXAirPodSettingsManager__accessoryEventForManager_event_device_state___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_probeAccessories");
  return objc_msgSend(*(id *)(a1 + 32), "_retrieveSettingsFromDevices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

- (BOOL)isConnectedToBluetoothSystem
{
  return self->_session != 0;
}

- (void)_sessionEventForSession:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  NSObject *v7;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if ((a4 - 1) >= 3)
  {
    if (a4)
      return;
    SWCHLogHW();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v9, OS_LOG_TYPE_DEFAULT, "BTSession attached.", buf, 2u);
    }

    if (!a5)
    {
      -[AXAirPodSettingsManager _didConnectWithSession:](self, "_didConnectWithSession:", a3);
      return;
    }
    goto LABEL_10;
  }
  SWCHLogHW();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_DEFAULT, "BTSession detached.", v10, 2u);
  }

  if (self->_session == a3)
LABEL_10:
    -[AXAirPodSettingsManager _didDisconnect](self, "_didDisconnect");
}

- (void)_didConnectWithSession:(BTSessionImpl *)a3
{
  NSObject *v5;
  NSObject *queue;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[8];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  AXLogAirPodSettings();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = (_DWORD)a3;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "Connecting to BT session for AirPod settings: %d", buf, 8u);
  }

  if (!self->_session)
  {
    self->_session = a3;
    BTAccessoryManagerGetDefault();
    BTLocalDeviceGetDefault();
    v12 = 0;
    v13 = 0;
    *(_QWORD *)buf = accessoryEventCallback;
    v11 = 0;
    BTAccessoryManagerAddCallbacks();
    BTServiceAddCallbacks();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AXAirPodSettingsManager__didConnectWithSession___block_invoke;
    block[3] = &unk_1E24C4C38;
    block[4] = self;
    dispatch_async(queue, block);
    -[AXAirPodSettingsManager readyBlock](self, "readyBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AXAirPodSettingsManager readyBlock](self, "readyBlock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(MEMORY[0x1E0C80D38], v8);

    }
  }
}

uint64_t __50__AXAirPodSettingsManager__didConnectWithSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_probeAccessories");
}

- (void)_didDisconnect
{
  -[NSMutableSet removeAllObjects](self->_deviceMap, "removeAllObjects");
  if (self->_session)
  {
    BTServiceRemoveCallbacks();
    BTSessionDetachWithQueue();
    self->_session = 0;
  }
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __41__AXAirPodSettingsManager__didDisconnect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  AXLogAirPodSettings();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C62B000, v2, OS_LOG_TYPE_DEFAULT, "BT disconnected, restarting session", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)_probeAccessories
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18C62B000, a2, OS_LOG_TYPE_ERROR, "BTLocalDeviceGetConnectedDevices failed: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_retrieveSettingsFromDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[AXAirPodSettingsManager _retrieveSettingsForAddress:](self, "_retrieveSettingsForAddress:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_applySettings
{
  NSObject *v3;
  NSObject *v4;
  NSMutableSet *deviceMap;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  NSMutableSet *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableSet count](self->_deviceMap, "count"))
  {
    AXLogAirPodSettings();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_DEFAULT, "Trying to apply settings, but no devices, so probing immediately", buf, 2u);
    }

    -[AXAirPodSettingsManager _probeAccessories](self, "_probeAccessories");
  }
  AXLogAirPodSettings();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    deviceMap = self->_deviceMap;
    *(_DWORD *)buf = 138412290;
    v17 = deviceMap;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "Applying airpod settings to: %@", buf, 0xCu);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_deviceMap;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[AXAirPodSettingsManager _applySettingsForAddress:](self, "_applySettingsForAddress:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_retrieveSettingsForAddress:(id)a3
{
  id v4;
  NSObject *v5;
  int ControlCommand;
  int v7;
  NSObject *v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  NSObject *v15;
  float v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  int v21;
  NSObject *v22;
  float v23;
  int v24;
  NSObject *v25;
  uint8_t buf[4];
  _BYTE v27[14];
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  BTDeviceAddressFromString();
  if (BTDeviceFromAddress())
  {
    AXLogAirPodSettings();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AXAirPodSettingsManager _retrieveSettingsForAddress:].cold.3();

  }
  else
  {
    -[AXAirPodSettingsManager setIgnoreSettingNotifications:](self, "setIgnoreSettingNotifications:", 1);
    ControlCommand = BTAccessoryManagerGetControlCommand();
    if (ControlCommand)
    {
      v7 = ControlCommand;
      AXLogAirPodSettings();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v27 = v7;
        *(_WORD *)&v27[4] = 2112;
        *(_QWORD *)&v27[6] = v4;
        v28 = 1024;
        v29 = 0;
        _os_log_error_impl(&dword_18C62B000, v8, OS_LOG_TYPE_ERROR, "could not get click speed[%d] for air pods: %@ -> [%d]", buf, 0x18u);
      }
    }
    else
    {
      _AXSAirPodsTapSpeed();
      if (v9 != 0.25)
        _AXSSetAirPodsTapSpeed();
      AXLogAirPodSettings();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 0;
        _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "retrieved click speed for air pods: %@ -> [%d]", buf, 0x12u);
      }
    }

    v10 = BTAccessoryManagerGetControlCommand();
    if ((_DWORD)v10)
    {
      v11 = v10;
      AXLogAirPodSettings();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXAirPodSettingsManager _retrieveSettingsForAddress:].cold.2((uint64_t)v4, v11, v12);
    }
    else
    {
      AXLogAirPodSettings();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXAirPodSettingsManager _retrieveSettingsForAddress:].cold.1();
    }

    v13 = BTAccessoryManagerGetControlCommand();
    if (v13)
    {
      v14 = v13;
      AXLogAirPodSettings();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v27 = v14;
        *(_WORD *)&v27[4] = 2112;
        *(_QWORD *)&v27[6] = v4;
        v28 = 1024;
        v29 = 0;
        _os_log_error_impl(&dword_18C62B000, v15, OS_LOG_TYPE_ERROR, "could not get hold duration [%d] for air pods: %@ -> [%d]", buf, 0x18u);
      }
    }
    else
    {
      _AXSAirPodsHoldDuration();
      if (v16 != 0.5)
        _AXSSetAirPodsHoldDuration();
      AXLogAirPodSettings();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 0;
        _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_DEFAULT, "retrieved hold duration for air pods: %@ -> [%d]", buf, 0x12u);
      }
    }

    v17 = BTAccessoryManagerGetControlCommand();
    if (v17)
    {
      AXLogAirPodSettings();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v27 = v17;
        *(_WORD *)&v27[4] = 2112;
        *(_QWORD *)&v27[6] = v4;
        v28 = 1024;
        v29 = 2;
        _os_log_error_impl(&dword_18C62B000, v19, OS_LOG_TYPE_ERROR, "could not get volume swipe mode[%d]: %@ -> %d", buf, 0x18u);
      }
    }
    else
    {
      v18 = 2;
      if (_AXSAirPodsVolumeSwipeEnabled() != (v18 == 1))
        _AXSSetAirPodsVolumeSwipeEnabled();
      AXLogAirPodSettings();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 2;
        _os_log_impl(&dword_18C62B000, v19, OS_LOG_TYPE_DEFAULT, "retrieved volume swipe enabled for air pods: %@ -> [%d]", buf, 0x12u);
      }
    }

    v20 = BTAccessoryManagerGetControlCommand();
    if (v20)
    {
      v21 = v20;
      AXLogAirPodSettings();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v27 = v21;
        *(_WORD *)&v27[4] = 2112;
        *(_QWORD *)&v27[6] = v4;
        v28 = 1024;
        v29 = 0;
        _os_log_error_impl(&dword_18C62B000, v22, OS_LOG_TYPE_ERROR, "could not get volume swipe duration [%d] for air pods: %@ -> [%d]", buf, 0x18u);
      }
    }
    else
    {
      _AXSAirPodsVolumeSwipeDuration();
      if (v23 != 0.5)
        _AXSSetAirPodsVolumeSwipeDuration();
      AXLogAirPodSettings();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 0;
        _os_log_impl(&dword_18C62B000, v22, OS_LOG_TYPE_DEFAULT, "retrieved volume swipe duration for air pods: %@ -> [%d]", buf, 0x12u);
      }
    }

    v24 = BTAccessoryManagerGetControlCommand();
    if (v24)
    {
      AXLogAirPodSettings();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v27 = v24;
        *(_WORD *)&v27[4] = 2112;
        *(_QWORD *)&v27[6] = v4;
        v28 = 1024;
        v29 = 2;
        _os_log_error_impl(&dword_18C62B000, v25, OS_LOG_TYPE_ERROR, "could not get case tones mode[%d]: %@ -> %d", buf, 0x18u);
      }
    }
    else
    {
      if (_AXSHeadsetCaseTonesEnabled())
        _AXSSetHeadsetCaseTonesEnabled();
      AXLogAirPodSettings();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 0;
        _os_log_impl(&dword_18C62B000, v25, OS_LOG_TYPE_DEFAULT, "retrieved case tones enabled for beats: %@ -> [%d]", buf, 0x12u);
      }
    }

    -[AXAirPodSettingsManager setIgnoreSettingNotifications:](self, "setIgnoreSettingNotifications:", 0);
  }

}

- (void)_applySettingsForAddress:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  float v16;
  double v17;
  int v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  float v22;
  double v23;
  int v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  float v37;
  double v38;
  int v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint8_t buf[4];
  _BYTE v52[18];
  __int16 v53;
  double v54;
  __int16 v55;
  id v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  double v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AXLogAirPodSettings();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v52 = v3;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "Applying AirPod settings for %@", buf, 0xCu);
  }

  WORD2(v50) = 0;
  LODWORD(v50) = 0;
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v5, "UTF8String");
  BTDeviceAddressFromString();
  if (BTDeviceFromAddress())
  {
    AXLogAirPodSettings();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXAirPodSettingsManager _retrieveSettingsForAddress:].cold.3();
LABEL_76:

    goto LABEL_77;
  }
  v7 = _AXSAirPodsToneVolume();
  v8 = _AXSAirPodsDefaultToneVolume();
  v9 = v7 | ((_DWORD)v8 << 8);
  v10 = BTAccessoryManagerSendControlCommand();
  AXLogAirPodSettings();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9, 0, v50);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v52 = v12;
    *(_WORD *)&v52[8] = 2112;
    *(_QWORD *)&v52[10] = v13;
    v53 = 2112;
    v54 = *(double *)&v14;
    v55 = 2112;
    v56 = v5;
    _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_DEFAULT, "Set tone volume: %@ (%@/%@) on %@", buf, 0x2Au);

  }
  if (v10)
  {
    AXLogAirPodSettings();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AXAirPodSettingsManager _applySettingsForAddress:].cold.4((uint64_t)v5, v9);

  }
  _AXSAirPodsTapSpeed();
  v17 = v16;
  if (fabs(v16 + -0.25) < 0.001)
    goto LABEL_17;
  if (fabs(v17 + -0.45) < 0.001)
  {
    v18 = 1;
    goto LABEL_18;
  }
  if (fabs(v17 + -0.65) >= 0.001)
LABEL_17:
    v18 = 0;
  else
    v18 = 2;
LABEL_18:
  v19 = BTAccessoryManagerSendControlCommand();
  AXLogAirPodSettings();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v18;
    *(_WORD *)&v52[4] = 2112;
    *(_QWORD *)&v52[6] = v5;
    _os_log_impl(&dword_18C62B000, v20, OS_LOG_TYPE_INFO, "Set double click mode: %d on %@", buf, 0x12u);
  }

  if (v19)
  {
    AXLogAirPodSettings();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v52 = v5;
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = v17;
      v53 = 1024;
      LODWORD(v54) = v18;
      _os_log_error_impl(&dword_18C62B000, v21, OS_LOG_TYPE_ERROR, "could not set click speed for air pods: %@ -> [%f > %d]", buf, 0x1Cu);
    }

  }
  _AXSAirPodsHoldDuration();
  v23 = v22;
  if (fabs(v22 + -0.5) < 0.001)
    goto LABEL_29;
  if (fabs(v23 + -0.4) >= 0.001)
  {
    if (fabs(v23 + -0.35) < 0.001)
    {
      v24 = 2;
      goto LABEL_30;
    }
LABEL_29:
    v24 = 0;
    goto LABEL_30;
  }
  v24 = 1;
LABEL_30:
  v25 = BTAccessoryManagerSendControlCommand();
  AXLogAirPodSettings();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v24;
    *(_WORD *)&v52[4] = 2112;
    *(_QWORD *)&v52[6] = v5;
    _os_log_impl(&dword_18C62B000, v26, OS_LOG_TYPE_DEFAULT, "Set hold duration mode: %d on %@", buf, 0x12u);
  }

  if (v25)
  {
    AXLogAirPodSettings();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v52 = v5;
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = v23;
      v53 = 1024;
      LODWORD(v54) = v24;
      _os_log_error_impl(&dword_18C62B000, v27, OS_LOG_TYPE_ERROR, "could not set hold duration for air pods: %@ -> [%f > %d]", buf, 0x1Cu);
    }

  }
  v28 = _AXSAirPodsNoiseCancellationWithOneUnit();
  if (v28)
    v29 = 1;
  else
    v29 = 2;
  AXLogAirPodSettings();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v29;
    *(_WORD *)&v52[4] = 2112;
    *(_QWORD *)&v52[6] = v5;
    _os_log_impl(&dword_18C62B000, v30, OS_LOG_TYPE_DEFAULT, "Set noise cancellation with one bud: %d on %@", buf, 0x12u);
  }

  if (BTAccessoryManagerSendControlCommand())
  {
    AXLogAirPodSettings();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[AXAirPodSettingsManager _applySettingsForAddress:].cold.3();

  }
  v32 = _AXSAirPodsVolumeSwipeEnabled();
  if (v32)
    v33 = 1;
  else
    v33 = 2;
  AXLogAirPodSettings();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v52 = v35;
    _os_log_impl(&dword_18C62B000, v34, OS_LOG_TYPE_DEFAULT, "Set volume swipe enabled: %@", buf, 0xCu);

  }
  if (BTAccessoryManagerSendControlCommand())
  {
    AXLogAirPodSettings();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[AXAirPodSettingsManager _applySettingsForAddress:].cold.2();

  }
  _AXSAirPodsVolumeSwipeDuration();
  v38 = v37;
  if (fabs(v37 + -0.5) < 0.001)
    goto LABEL_59;
  if (fabs(v38 + -0.4) < 0.001)
  {
    v39 = 1;
    goto LABEL_60;
  }
  if (fabs(v38 + -0.35) >= 0.001)
LABEL_59:
    v39 = 0;
  else
    v39 = 2;
LABEL_60:
  v40 = BTAccessoryManagerSendControlCommand();
  AXLogAirPodSettings();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v39;
    *(_WORD *)&v52[4] = 2112;
    *(_QWORD *)&v52[6] = v5;
    _os_log_impl(&dword_18C62B000, v41, OS_LOG_TYPE_DEFAULT, "Set volume swipe duration mode: %d on %@", buf, 0x12u);
  }

  if (v40)
  {
    AXLogAirPodSettings();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v52 = v5;
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = v38;
      v53 = 1024;
      LODWORD(v54) = v39;
      _os_log_error_impl(&dword_18C62B000, v42, OS_LOG_TYPE_ERROR, "could not set volume swipe duration for air pods: %@ -> [%f > %d]", buf, 0x1Cu);
    }

  }
  AXLogAirPodSettings();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v29);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    *(_QWORD *)v52 = v5;
    *(_WORD *)&v52[8] = 2048;
    *(double *)&v52[10] = v17;
    v53 = 2048;
    v54 = v23;
    v55 = 2112;
    v56 = v44;
    v57 = 1024;
    v58 = v28;
    v59 = 1024;
    v60 = v32;
    v61 = 2048;
    v62 = v38;
    _os_log_impl(&dword_18C62B000, v43, OS_LOG_TYPE_DEFAULT, "Set click and hold speed for airpod: %@ [click %f, hold %f, ANC: (BT:%@, setting:%d)] Vol Swipe [%d, %lf]", buf, 0x40u);

  }
  v45 = _AXSHeadsetCaseTonesEnabled();
  if ((_DWORD)v45)
    v46 = 1;
  else
    v46 = 2;
  AXLogAirPodSettings();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v52 = v48;
    *(_WORD *)&v52[8] = 2112;
    *(_QWORD *)&v52[10] = v49;
    _os_log_impl(&dword_18C62B000, v47, OS_LOG_TYPE_DEFAULT, "Set case tones enabled: %@, BT value: %@", buf, 0x16u);

  }
  if (BTAccessoryManagerSendControlCommand())
  {
    AXLogAirPodSettings();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXAirPodSettingsManager _applySettingsForAddress:].cold.1();
    goto LABEL_76;
  }
LABEL_77:

}

- (id)initSharedInstance
{
  AXAirPodSettingsManager *v2;
  uint64_t v3;
  NSMutableSet *deviceMap;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  AXDispatchTimer *delayTimer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXAirPodSettingsManager;
  v2 = -[AXAirPodSettingsManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    deviceMap = v2->_deviceMap;
    v2->_deviceMap = (NSMutableSet *)v3;

    v5 = dispatch_queue_create("airpod-bt-monitor-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF3978]), "initWithTargetSerialQueue:", v2->_queue);
    delayTimer = v2->_delayTimer;
    v2->_delayTimer = (AXDispatchTimer *)v7;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_delayTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  }
  return v2;
}

- (void)start
{
  -[AXAirPodSettingsManager startWithCallback:](self, "startWithCallback:", &__block_literal_global_247);
}

- (void)startWithCallback:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v12;
  __CFNotificationCenter *v13;
  __CFNotificationCenter *v14;
  __CFNotificationCenter *v15;
  __CFNotificationCenter *v16;
  __CFNotificationCenter *v17;
  __CFNotificationCenter *v18;
  NSObject *v19;
  uint8_t v20[8];
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, void *);

  -[AXAirPodSettingsManager setReadyBlock:](self, "setReadyBlock:", a3);
  v21 = sessionEventCallback;
  if (BTSessionAttachWithQueue())
  {
    AXLogAirPodSettings();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AXAirPodSettingsManager startWithCallback:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E0DDDF98], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v12 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v12, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E0DDDF78], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v13 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v13, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E0DDDF88], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v14 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v14, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E0DDDFA0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v15 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v15, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E0DDDF68], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v16 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v16, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E0DDDFC8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v17 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v17, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E0DDDFB8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v18 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v18, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E0DDE108], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  AXLogAirPodSettings();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_18C62B000, v19, OS_LOG_TYPE_INFO, "Listening for AirPods and Beats", v20, 2u);
  }

}

- (void)dealloc
{
  objc_super v3;

  if (self->_session)
    BTSessionDetachWithQueue();
  v3.receiver = self;
  v3.super_class = (Class)AXAirPodSettingsManager;
  -[AXAirPodSettingsManager dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_251);
  return (id)sharedInstance_shared;
}

void __41__AXAirPodSettingsManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXAirPodSettingsManager initSharedInstance]([AXAirPodSettingsManager alloc], "initSharedInstance");
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;

}

- (id)readyBlock
{
  return self->_readyBlock;
}

- (void)setReadyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)ignoreSettingNotifications
{
  return self->_ignoreSettingNotifications;
}

- (void)setIgnoreSettingNotifications:(BOOL)a3
{
  self->_ignoreSettingNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readyBlock, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceListeners, 0);
}

- (void)_retrieveSettingsForAddress:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_18C62B000, v1, v2, "default tone volume is not valid [%@] for air pods: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)_retrieveSettingsForAddress:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 2) = a1;
  OUTLINED_FUNCTION_0_1(&dword_18C62B000, a2, a3, "could not get tone volume [%d] for air pods: %@", v3, (_QWORD)v4, WORD4(v4));
  OUTLINED_FUNCTION_5();
}

- (void)_retrieveSettingsForAddress:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18C62B000, v0, v1, "In sending control message, failed to look up BT address %@: %d");
  OUTLINED_FUNCTION_5();
}

- (void)_applySettingsForAddress:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18C62B000, v0, v1, "could not set case tones mode: %@ -> %d");
  OUTLINED_FUNCTION_5();
}

- (void)_applySettingsForAddress:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18C62B000, v0, v1, "could not set volume swipe mode: %@ -> %d");
  OUTLINED_FUNCTION_5();
}

- (void)_applySettingsForAddress:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18C62B000, v0, v1, "could not set one bud mode: %@ -> %d");
  OUTLINED_FUNCTION_5();
}

- (void)_applySettingsForAddress:(uint64_t)a1 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_18C62B000, v2, v3, "could not set tone volume for air pods: %@ -> [%@]", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)startWithCallback:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18C62B000, a1, a3, "Could not attach to BT session", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
