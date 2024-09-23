@implementation HFAccessorySettingDeviceOptionsAdapterUtility

- (HFAccessorySettingDeviceOptionsAdapterUtility)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4 groupedAccessory:(BOOL)a5 delegate:(id)a6
{
  id v9;
  id v10;
  HFAccessorySettingDeviceOptionsAdapterUtility *v11;
  HFAccessorySettingDeviceOptionsAdapterUtility *v12;
  id v13;
  void *v14;
  void *v15;
  HFMediaProfileContainer *v16;
  HFMediaProfileContainer *mediaProfileContainer;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  HFAccessorySettingDeviceOptionsAdapterUtility *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (a4)
  {
    v11 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)HFAccessorySettingDeviceOptionsAdapterUtility;
    v12 = -[HFAccessorySettingDeviceOptionsAdapterUtility init](&v20, sel_init);
    if (v12)
    {
      v13 = v9;
      v14 = &unk_1F0449888;
      if (objc_msgSend(v13, "conformsToProtocol:", v14))
        v15 = v13;
      else
        v15 = 0;
      v16 = v15;

      mediaProfileContainer = v12->_mediaProfileContainer;
      v12->_mediaProfileContainer = v16;

      objc_storeWeak((id *)&v12->_delegate, v10);
      HFLogForCategory(0x37uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v22 = v12;
        v23 = 2080;
        v24 = "-[HFAccessorySettingDeviceOptionsAdapterUtility initWithHomeKitSettingsVendor:mode:groupedAccessory:delegate:]";
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%s Instantiated utility class, about to reset rapport client, with media profile container %@", buf, 0x20u);
      }

      -[HFAccessorySettingDeviceOptionsAdapterUtility _resetRapportClientWithInvalidation:](v12, "_resetRapportClientWithInvalidation:", 1);
    }
    self = v12;
    v11 = self;
  }

  return v11;
}

- (id)requestSysdiagnose:(id)a3 options:(id)a4
{
  return -[HFAccessorySettingDeviceOptionsAdapterUtility _sendRapportMessageToAccessoryWithRequestID:request:options:](self, "_sendRapportMessageToAccessoryWithRequestID:request:options:", CFSTR("com.apple.homepod.SysdiagnoseOnly"), a3, a4);
}

- (id)identifyAccessory
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x37uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HFAccessorySettingDeviceOptionsAdapterUtility identifyAccessory]";
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[HFAccessorySettingDeviceOptionsAdapterUtility _sendRapportMessageToAccessoryWithRequestID:request:options:](self, "_sendRapportMessageToAccessoryWithRequestID:request:options:", CFSTR("com.apple.identify"), 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)restartAccessory
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x37uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HFAccessorySettingDeviceOptionsAdapterUtility restartAccessory]";
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[HFAccessorySettingDeviceOptionsAdapterUtility _sendRapportMessageToAccessoryWithRequestID:request:options:](self, "_sendRapportMessageToAccessoryWithRequestID:request:options:", CFSTR("com.apple.SoundBoard.RebootDeviceRequest"), 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)restartAccessories
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x37uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HFAccessorySettingDeviceOptionsAdapterUtility restartAccessories]";
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[HFAccessorySettingDeviceOptionsAdapterUtility _sendRapportMessageToAccessoriesWithRequestID:request:options:](self, "_sendRapportMessageToAccessoriesWithRequestID:request:options:", CFSTR("com.apple.SoundBoard.RebootDeviceRequest"), 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)resetAccessory
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x37uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HFAccessorySettingDeviceOptionsAdapterUtility resetAccessory]";
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[HFAccessorySettingDeviceOptionsAdapterUtility _sendRapportMessageToAccessoryWithRequestID:request:options:](self, "_sendRapportMessageToAccessoryWithRequestID:request:options:", CFSTR("com.apple.SoundBoard.ObliterateRequest"), 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requestAirDrop:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[3];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x37uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Sending AirDrop request for results: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sysdiagnosePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    +[HFUtilities deviceAirDropIdentifier](HFUtilities, "deviceAirDropIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v20[0] = v7;
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date", CFSTR("airDropDeviceIdentifier"), CFSTR("com.apple.Home.RapportRequest"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      objc_msgSend(v8, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = CFSTR("sysdiagnosePath");
      v20[1] = v10;
      v20[2] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFAccessorySettingDeviceOptionsAdapterUtility _sendRapportMessageToAccessoryWithRequestID:request:options:](self, "_sendRapportMessageToAccessoryWithRequestID:request:options:", CFSTR("com.apple.homepod.AirDropFile"), v11, 0);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      HFLogForCategory(0x37uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Invalid (Empty) airDropID", buf, 2u);
      }

      v17 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 25, CFSTR("Invalid AirDrop ID"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "futureWithError:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v12;

  }
  else
  {
    HFLogForCategory(0x37uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Invalid (Empty) Sysdiagnose Path", buf, 2u);
    }

    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 25, CFSTR("Invalid Sysdiagnose Path"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)extractWiFiInfo
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x37uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HFAccessorySettingDeviceOptionsAdapterUtility extractWiFiInfo]";
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[HFAccessorySettingDeviceOptionsAdapterUtility _sendRapportMessageToAccessoryWithRequestID:request:options:](self, "_sendRapportMessageToAccessoryWithRequestID:request:options:", CFSTR("com.apple.SoundBoard.ExtractWiFiInfo"), 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setupRapportClient
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  -[HFAccessorySettingDeviceOptionsAdapterUtility discoveryLink](self, "discoveryLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc_init(MEMORY[0x1E0D83900]);
    objc_msgSend(v4, "setControlFlags:", 2054);
    v5 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke;
    v17[3] = &unk_1EA728AE8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v4, "setInvalidationHandler:", v17);
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_275;
    v15[3] = &unk_1EA728AE8;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v4, "setInterruptionHandler:", v15);
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_276;
    v13[3] = &unk_1EA7334D0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "setDeviceFoundHandler:", v13);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_278;
    v11[3] = &unk_1EA7334D0;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "setDeviceLostHandler:", v11);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_279;
    v10[3] = &unk_1EA7334F8;
    v10[4] = self;
    objc_msgSend(v4, "setDeviceChangedHandler:", v10);
    HFLogForCategory(0x37uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Now Activating RPCompanionLinkClient...", buf, 2u);
    }

    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_281;
    v7[3] = &unk_1EA727818;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "activateWithCompletion:", v7);
    -[HFAccessorySettingDeviceOptionsAdapterUtility setDiscoveryLink:](self, "setDiscoveryLink:", v4);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetRapportClientWithInvalidation:", 0);
  HFLogForCategory(0x37uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "RPCompanionLinkClient was invalidated.", v3, 2u);
  }

}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_275(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetRapportClientWithInvalidation:", 1);
  HFLogForCategory(0x37uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "RPCompanionLinkClient was interrupted.", v3, 2u);
  }

}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_276(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x37uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_debug_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEBUG, "Device Found from Rapport..%@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateRapportReachable");

}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_278(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x37uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_debug_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEBUG, "Device lost from Rapport..%@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateRapportReachable");

}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_279(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x37uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_debug_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEBUG, "device changed from Rapport..%@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateRapportReachable");
}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_281(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3)
  {
    HFLogForCategory(0x37uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "RPCompanionLinkClient failed to activate: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v5, "setRapportClientActivationFailCount:", objc_msgSend(v5, "rapportClientActivationFailCount") + 1);
    objc_msgSend(v5, "_resetRapportClientWithInvalidation:", 1);
  }
  else
  {
    objc_msgSend(WeakRetained, "_updateRapportReachable");
  }

}

- (void)_resetRapportClientWithInvalidation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[HFAccessorySettingDeviceOptionsAdapterUtility discoveryLink](self, "discoveryLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  -[HFAccessorySettingDeviceOptionsAdapterUtility discoveryLink](self, "discoveryLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceFoundHandler:", 0);

  -[HFAccessorySettingDeviceOptionsAdapterUtility discoveryLink](self, "discoveryLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceLostHandler:", 0);

  -[HFAccessorySettingDeviceOptionsAdapterUtility discoveryLink](self, "discoveryLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterruptionHandler:", 0);

  -[HFAccessorySettingDeviceOptionsAdapterUtility discoveryLink](self, "discoveryLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInvalidationHandler:", 0);

  -[HFAccessorySettingDeviceOptionsAdapterUtility setDiscoveryLink:](self, "setDiscoveryLink:", 0);
  if (-[HFAccessorySettingDeviceOptionsAdapterUtility rapportClientActivationFailCount](self, "rapportClientActivationFailCount") > 2)
  {
    HFLogForCategory(0x37uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 134217984;
      v11 = 3;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "RPCompanionLinkClient activation exceeded  (%lu) activation attempts. Seems like a bug in Rapport. Please file a bug.", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    -[HFAccessorySettingDeviceOptionsAdapterUtility _setupRapportClient](self, "_setupRapportClient");
  }
}

- (void)_updateRapportReachable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[HFAccessorySettingDeviceOptionsAdapterUtility mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HFAccessorySettingDeviceOptionsAdapterUtility__updateRapportReachable__block_invoke;
  v8[3] = &unk_1EA733520;
  v8[4] = self;
  objc_msgSend(v5, "na_flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingDeviceOptionsAdapterUtility delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryReachableOverRapport:", objc_msgSend(v6, "count") != 0);

}

uint64_t __72__HFAccessorySettingDeviceOptionsAdapterUtility__updateRapportReachable__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reachableDevices:", a2);
}

- (id)_reachableDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  -[HFAccessorySettingDeviceOptionsAdapterUtility discoveryLink](self, "discoveryLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__HFAccessorySettingDeviceOptionsAdapterUtility__reachableDevices___block_invoke;
  v21[3] = &unk_1EA733548;
  v8 = v4;
  v22 = v8;
  objc_msgSend(v6, "na_filter:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingDeviceOptionsAdapterUtility discoveryLink](self, "discoveryLink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7;
  v17 = 3221225472;
  v18 = __67__HFAccessorySettingDeviceOptionsAdapterUtility__reachableDevices___block_invoke_2;
  v19 = &unk_1EA733548;
  v20 = v8;
  v12 = v8;
  objc_msgSend(v11, "na_filter:", &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v13, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __67__HFAccessorySettingDeviceOptionsAdapterUtility__reachableDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "homeKitIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __67__HFAccessorySettingDeviceOptionsAdapterUtility__reachableDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "statusFlags") & 2) != 0)
  {
    objc_msgSend(v3, "idsDeviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", v7);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_sendRapportMessageToAccessoryWithRequestID:(id)a3 request:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HFAccessorySettingDeviceOptionsAdapterUtility mediaProfileContainer](self, "mediaProfileContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingDeviceOptionsAdapterUtility _reachableDevices:](self, "_reachableDevices:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingDeviceOptionsAdapterUtility _sendRapportMessageToDevice:requestID:request:options:](self, "_sendRapportMessageToDevice:requestID:request:options:", v15, v10, v9, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_sendRapportMessageToAccessoriesWithRequestID:(id)a3 request:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HFAccessorySettingDeviceOptionsAdapterUtility mediaProfileContainer](self, "mediaProfileContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __111__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToAccessoriesWithRequestID_request_options___block_invoke;
  v28[3] = &unk_1EA733520;
  v28[4] = self;
  objc_msgSend(v13, "na_map:", v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __111__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToAccessoriesWithRequestID_request_options___block_invoke_2;
  v24[3] = &unk_1EA733570;
  v24[4] = self;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  objc_msgSend(v15, "na_map:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reschedule:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __111__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToAccessoriesWithRequestID_request_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reachableDevices:", a2);
}

id __111__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToAccessoriesWithRequestID_request_options___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)a1[4];
  objc_msgSend(a2, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendRapportMessageToDevice:requestID:request:options:", v4, a1[5], a1[6], a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_sendRapportMessageToDevice:(id)a3 requestID:(id)a4 request:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v33 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x37uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v12;
    v49 = 2112;
    v50 = v9;
    _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "(Request %@) Preparing to send rapport message to '%@'", buf, 0x16u);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0D83900]);
  objc_msgSend(v14, "setDestinationDevice:", v9);
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke;
  v43[3] = &unk_1EA7270A0;
  v18 = v15;
  v44 = v18;
  v19 = v14;
  v45 = v19;
  v20 = v12;
  v46 = v20;
  objc_msgSend(v16, "afterDelay:performBlock:", v43, 10.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = v17;
  v34[1] = 3221225472;
  v34[2] = __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke_288;
  v34[3] = &unk_1EA7335C0;
  v35 = v21;
  v36 = v20;
  v22 = v18;
  v37 = v22;
  v38 = v19;
  v39 = v11;
  v40 = v10;
  v41 = v33;
  v42 = v9;
  v23 = v9;
  v24 = v33;
  v25 = v10;
  v26 = v11;
  v27 = v19;
  v28 = v20;
  v29 = v21;
  objc_msgSend(v27, "activateWithCompletion:", v34);
  v30 = v42;
  v31 = v22;

  return v31;
}

void __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_timeoutError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v3);

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    HFLogForCategory(0x37uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "(Request %@) Timeout trying to find send!", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke_288(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  if (v3)
  {
    HFLogForCategory(0x37uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v23 = v15;
      v24 = 2112;
      v25 = v3;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "(Request %@) Companion link is invalid; error '%@'",
        buf,
        0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
    objc_msgSend(*(id *)(a1 + 56), "invalidate");
  }
  else
  {
    v5 = *(void **)(a1 + 64);
    if (!v5)
      v5 = (void *)MEMORY[0x1E0C9AA70];
    v6 = v5;
    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v20 = CFSTR("com.apple.Home.RapportRequest");
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSince1970");
      objc_msgSend(v9, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = *(void **)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 88), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke_289;
    v16[3] = &unk_1EA733598;
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v12, "sendRequestID:request:destinationID:options:responseHandler:", v13, v8, v14, v6, v16);

  }
}

void __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke_289(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  HFLogForCategory(0x37uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "(Request %@) rapport message send failed with error: %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v9);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "(Request %@) rapport message sent; response: %@ / options: %@",
        (uint8_t *)&v14,
        0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v7);
  }
  objc_msgSend(*(id *)(a1 + 48), "invalidate");

}

- (HFAccessorySettingDeviceOptionsAdapterUtilityDelegate)delegate
{
  return (HFAccessorySettingDeviceOptionsAdapterUtilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, a3);
}

- (RPCompanionLinkClient)discoveryLink
{
  return self->_discoveryLink;
}

- (void)setDiscoveryLink:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryLink, a3);
}

- (unint64_t)rapportClientActivationFailCount
{
  return self->_rapportClientActivationFailCount;
}

- (void)setRapportClientActivationFailCount:(unint64_t)a3
{
  self->_rapportClientActivationFailCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryLink, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
