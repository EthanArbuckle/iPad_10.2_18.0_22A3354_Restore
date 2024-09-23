@implementation HFAccessoryNetworkInfoItem

- (HFAccessoryNetworkInfoItem)initWithAccessory:(id)a3 home:(id)a4
{
  HFAccessoryNetworkInfoItem *v4;
  HFAccessoryNetworkInfoItem *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAccessoryNetworkInfoItem;
  v4 = -[HFAccessoryInfoItem initWithAccessory:infoType:home:](&v8, sel_initWithAccessory_infoType_home_, a3, 3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_networkInfoType = 2;
    -[HFAccessoryNetworkInfoItem setFakeNetworkStrength:](v4, "setFakeNetworkStrength:", -1);
    -[HFAccessoryNetworkInfoItem setInitialSetup:](v5, "setInitialSetup:", 1);
    v6 = -[HFAccessoryNetworkInfoItem _updateAccessoryWifiInfo](v5, "_updateAccessoryWifiInfo");
  }
  return v5;
}

- (void)toggleNetworkInfoType
{
  -[HFAccessoryNetworkInfoItem setNetworkInfoType:](self, "setNetworkInfoType:", -[HFAccessoryNetworkInfoItem _nextNetworkInfoType](self, "_nextNetworkInfoType"));
}

- (BOOL)supportsWiFiStrengthDisplay
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  -[HFAccessoryInfoItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if (!v5)
    return 0;
  -[HFAccessoryInfoItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFAccessoryNetworkInfoItem _isFirstPartyAccessory:](self, "_isFirstPartyAccessory:", v6);

  if (v7)
  {
    -[HFAccessoryInfoItem accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "softwareVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hf_canProvideWifiStrength");
    goto LABEL_7;
  }
  if (!_os_feature_enabled_impl())
    return 0;
  -[HFAccessoryNetworkInfoItem wifiInfo](self, "wifiInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = 0;
    goto LABEL_8;
  }
  -[HFAccessoryNetworkInfoItem wifiInfo](self, "wifiInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HMAccessoryLinkQualityNetworkSupported"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11 != 0;

LABEL_7:
LABEL_8:

  return v10;
}

- (unint64_t)infoType
{
  return 3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19[2];
  _QWORD v20[5];
  objc_super v21;
  id location;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_initWeak(&location, self);
  v21.receiver = self;
  v21.super_class = (Class)HFAccessoryNetworkInfoItem;
  -[HFAccessoryInfoItem _subclass_updateWithOptions:](&v21, sel__subclass_updateWithOptions_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  -[HFAccessoryNetworkInfoItem _updateAccessoryWifiInfo](self, "_updateAccessoryWifiInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke;
  v20[3] = &unk_1EA728350;
  v20[4] = self;
  objc_msgSend(v7, "flatMap:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combineAllFutures:scheduler:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_2;
  v17[3] = &unk_1EA72FB20;
  objc_copyWeak(v19, &location);
  v14 = v5;
  v18 = v14;
  v19[1] = (id)a2;
  objc_msgSend(v13, "flatMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  return v15;
}

id __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "initialSetup"))
  {
    objc_msgSend(*(id *)(a1 + 32), "toggleNetworkInfoType");
    objc_msgSend(*(id *)(a1 + 32), "setInitialSetup:", 0);
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  char v32;
  _QWORD v33[5];
  id v34;
  char v35;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(WeakRetained, "_localizedTitleForType:", objc_msgSend(WeakRetained, "networkInfoType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("title"));

  objc_msgSend(WeakRetained, "_localizedDescriptionForType:", objc_msgSend(WeakRetained, "networkInfoType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("description"));

  v11 = objc_msgSend(WeakRetained, "_hiddenForType:", objc_msgSend(WeakRetained, "networkInfoType"));
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(WeakRetained, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "hf_currentUserIsRestrictedGuest") | v11;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("hidden"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("AccessoryDetails.NetworkInfo"), CFSTR("HFResultDisplayAccessibilityIDKey"));
  v14 = (void *)MEMORY[0x1E0CB37E8];
  +[HFAccessoryInfoDetailsItemProvider preferredCharacteristicOrderArray](HFAccessoryInfoDetailsItemProvider, "preferredCharacteristicOrderArray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "indexOfObject:", CFSTR("HFAccessoryInfoTypeNetworkPreferredOrderKey")));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("accessoryInfoDetailPreferredOrder"));

  if (objc_msgSend(WeakRetained, "_showSignalStrength:", objc_msgSend(WeakRetained, "networkInfoType")))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (!v18)
    {
      objc_msgSend(WeakRetained, "accessory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_extractWiFiInfo:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_3;
      v33[3] = &unk_1EA72FAD0;
      v33[4] = WeakRetained;
      v25 = v8;
      v34 = v25;
      v35 = 0;
      objc_msgSend(v23, "flatMap:", v33);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v24;
      v29[1] = 3221225472;
      v29[2] = __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_4;
      v29[3] = &unk_1EA72FAF8;
      v27 = *(_QWORD *)(a1 + 48);
      v29[4] = WeakRetained;
      v31 = v27;
      v30 = v25;
      v32 = 0;
      objc_msgSend(v26, "recover:", v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    objc_msgSend(WeakRetained, "wifiInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_getSignalStrengthIcon:forFastUpdate:", v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("icon"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v21;
}

uint64_t __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setWifiInfo:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_getSignalStrengthIcon:forFastUpdate:", v4, *(unsigned __int8 *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, CFSTR("icon"));
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 40));
}

id __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Failed to get wifiInfo with error %@", (uint8_t *)&v12, 0x20u);

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "wifiInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_getSignalStrengthIcon:forFastUpdate:", v8, *(unsigned __int8 *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, CFSTR("icon"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)_nextNetworkInfoType
{
  unint64_t v3;
  int64_t v4;

  v3 = -[HFAccessoryNetworkInfoItem networkInfoType](self, "networkInfoType");
  do
  {
    if (!v3)
    {
      v4 = -[HFAccessoryNetworkInfoItem fakeNetworkStrength](self, "fakeNetworkStrength");
      -[HFAccessoryNetworkInfoItem setFakeNetworkStrength:](self, "setFakeNetworkStrength:", ~(5 * ((v4 + 2) / 5)) + v4 + 2);
    }
    v3 = (v3 + 1) % 3;
  }
  while (-[HFAccessoryNetworkInfoItem _hiddenForType:](self, "_hiddenForType:", v3)
       && v3 != -[HFAccessoryNetworkInfoItem networkInfoType](self, "networkInfoType"));
  return v3;
}

- (id)_localizedTitleForType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  HFLocalizedWiFiString(off_1EA72FBB8[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_localizedDescriptionForType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  switch(a3)
  {
    case 0uLL:
      -[HFAccessoryNetworkInfoItem _accessoryNetworkSSID](self, "_accessoryNetworkSSID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = v4;
      }
      else
      {
        _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryInfoTypeNetworkNotConnected"), CFSTR("HFAccessoryInfoTypeNetworkNotConnected"), 1);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v3 = v6;
      goto LABEL_11;
    case 2uLL:
      -[HFAccessoryInfoItem accessory](self, "accessory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hf_networkConfigurationProfiles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "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");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      return v3;
    case 1uLL:
      -[HFAccessoryNetworkInfoItem _accessoryMACAddress](self, "_accessoryMACAddress");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (BOOL)_showSignalStrength:(unint64_t)a3
{
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v19;

  v5 = -[HFAccessoryNetworkInfoItem supportsWiFiStrengthDisplay](self, "supportsWiFiStrengthDisplay");
  v6 = 0;
  if (a3 || !v5)
    return v6;
  -[HFAccessoryInfoItem accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_fakeNetworkStrengthError");

  if ((v8 & 1) != 0)
    return 1;
  -[HFAccessoryNetworkInfoItem _accessoryNetworkSSID](self, "_accessoryNetworkSSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryNetworkInfoItem _currentDeviceNetworkSSID](self, "_currentDeviceNetworkSSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (!v11)
  {
    -[HFAccessoryNetworkInfoItem wifiInfo](self, "wifiInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14 != 0;
LABEL_9:

    return v6;
  }
  -[HFAccessoryInfoItem accessory](self, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaProfile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hf_isReachable") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[HFAccessoryNetworkInfoItem wifiInfo](self, "wifiInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15 != 0;

  }
  if (_os_feature_enabled_impl())
  {
    -[HFAccessoryInfoItem accessory](self, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hf_isHomePod");

    if ((v17 & 1) == 0)
    {
      -[HFAccessoryInfoItem accessory](self, "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isReachable"))
      {
        -[HFAccessoryNetworkInfoItem wifiInfo](self, "wifiInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v19 != 0;

      }
      else
      {
        v6 = 0;
      }
      goto LABEL_9;
    }
  }
  return v6;
}

- (id)_getSignalStrengthIcon:(id)a3 forFastUpdate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HFVariableImageIconDescriptor *v14;
  HFVariableImageIconDescriptor *v15;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CEA650];
  v7 = (void *)MEMORY[0x1E0CEA478];
  v8 = a3;
  objc_msgSend(v7, "systemGrayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithHierarchicalColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB538]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationByApplyingConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HFAccessoryNetworkInfoItem _getWiFiStrength:forFastUpdate:](self, "_getWiFiStrength:forFastUpdate:", v8, v4);

  if (v13 == -1)
    v14 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("wifi.exclamationmark"), v12);
  else
    v14 = -[HFVariableImageIconDescriptor initWithSystemImageNamed:variableValue:configuration:]([HFVariableImageIconDescriptor alloc], "initWithSystemImageNamed:variableValue:configuration:", CFSTR("wifi"), v12, (double)v13 / 3.0);
  v15 = v14;

  return v15;
}

- (int64_t)_getWiFiStrength:(id)a3 forFastUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a4;
  v6 = a3;
  -[HFAccessoryInfoItem accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_fakeNetworkStrengthError");

  if (v8)
  {
    v9 = -[HFAccessoryNetworkInfoItem fakeNetworkStrength](self, "fakeNetworkStrength");
  }
  else if (v6)
  {
    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("num3BarsRSSI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v9 = objc_msgSend(v12, "integerValue");
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RSSI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      if (v15)
      {
        v16 = objc_msgSend(v15, "integerValue");
        v17 = 2;
        if (v16 >= -70)
          v17 = 3;
        if (v16 >= -80)
          v9 = v17;
        else
          v9 = 1;
      }
      else if (_os_feature_enabled_impl()
             && ((objc_opt_class(),
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HMAccessoryLinkQuality")),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  (objc_opt_isKindOfClass() & 1) == 0)
               ? (v19 = 0)
               : (v19 = v18),
                 v20 = v19,
                 v18,
                 v20))
      {
        if (objc_msgSend(v20, "integerValue") <= 2)
        {
          if (objc_msgSend(v20, "integerValue") > 1)
            v9 = 2;
          else
            v9 = objc_msgSend(v20, "integerValue");
        }
        else
        {
          v9 = 3;
        }

      }
      else
      {
        v9 = -1;
      }

    }
  }
  else
  {
    v9 = v4 - 1;
  }

  return v9;
}

- (id)_updateAccessoryWifiInfo
{
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[6];
  _QWORD v19[4];
  id v20[2];
  id location;

  -[HFAccessoryInfoItem accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFAccessoryNetworkInfoItem _isFirstPartyAccessory:](self, "_isFirstPartyAccessory:", v4);

  if (!v5 && (_os_feature_enabled_impl() & 1) == 0)
    goto LABEL_6;
  -[HFAccessoryNetworkInfoItem debounceDate](self, "debounceDate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
  v7 = (void *)v6;
  -[HFAccessoryNetworkInfoItem debounceDate](self, "debounceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  if (v9 >= 5.0)
  {

    goto LABEL_8;
  }
  v10 = -[HFAccessoryNetworkInfoItem initialSetup](self, "initialSetup");

  if (v10)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryNetworkInfoItem setDebounceDate:](self, "setDebounceDate:", v12);

    objc_initWeak(&location, self);
    -[HFAccessoryInfoItem accessory](self, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryNetworkInfoItem _extractWiFiInfo:](self, "_extractWiFiInfo:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__HFAccessoryNetworkInfoItem__updateAccessoryWifiInfo__block_invoke;
    v19[3] = &unk_1EA72FB48;
    objc_copyWeak(v20, &location);
    v20[1] = (id)a2;
    objc_msgSend(v14, "flatMap:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __54__HFAccessoryNetworkInfoItem__updateAccessoryWifiInfo__block_invoke_44;
    v18[3] = &unk_1EA72FB70;
    v18[4] = self;
    v18[5] = a2;
    objc_msgSend(v16, "recover:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
    return v11;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  return v11;
}

id __54__HFAccessoryNetworkInfoItem__updateAccessoryWifiInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3 && objc_msgSend(v3, "count"))
    objc_msgSend(WeakRetained, "setWifiInfo:", v3);
  HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "wifiInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413570;
    v15 = WeakRetained;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v3;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ received result for accessory %@[%@]: result: %@, wifiInfo: %@", (uint8_t *)&v14, 0x3Eu);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __54__HFAccessoryNetworkInfoItem__updateAccessoryWifiInfo__block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ _extractWifiInfo failed with error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_extractWiFiInfo:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  SEL v28;
  uint8_t buf[4];
  HFAccessoryNetworkInfoItem *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "hf_isHomePod"))
  {
    objc_msgSend(v5, "mediaProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_settingsAdapterManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adapterForIdentifier:", CFSTR("DeviceOptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = self;
        v31 = 2112;
        v32 = v11;
        v33 = 2112;
        v34 = v6;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to send extract WiFi message to accessory: %@", buf, 0x20u);

      }
      objc_msgSend(v8, "extractWiFiInfo");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v30 = self;
        v31 = 2112;
        v32 = v23;
        v33 = 2112;
        v34 = v5;
        v35 = 2112;
        v36 = v24;
        _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "%@:%@ Device options adapter missing for accessory %@: %@", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (id)v12;

  }
  else
  {
    v13 = _os_feature_enabled_impl();
    v14 = (void *)MEMORY[0x1E0D519C0];
    if (v13)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      HFLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = self;
        v31 = 2112;
        v32 = v17;
        v33 = 2112;
        v34 = v5;
        _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to call extract WiFi api to homekit for accessory: %@", buf, 0x20u);

      }
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __47__HFAccessoryNetworkInfoItem__extractWiFiInfo___block_invoke;
      v25[3] = &unk_1EA72FB98;
      v25[4] = self;
      v28 = a2;
      v26 = v5;
      v18 = v15;
      v27 = v18;
      objc_msgSend(v26, "queryLinkQualityWithCompletion:", v25);
      v19 = v27;
      v20 = v18;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 38);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "futureWithError:", v21);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v20;
}

void __47__HFAccessoryNetworkInfoItem__extractWiFiInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v19 = 138413058;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v6;
      v11 = "%@:%@ Failed to extract WiFi info for accessory: %@ error: %@";
LABEL_8:
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, 0x2Au);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "supported") & 1) == 0)
  {
    HFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v19 = 138413058;
      v20 = v17;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = 0;
      v11 = "%@:%@ WiFi info is not supported for accessory: %@ error: %@";
      goto LABEL_8;
    }
LABEL_9:

    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", MEMORY[0x1E0C9AA70]);
    goto LABEL_10;
  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "linkQuality"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("HMAccessoryLinkQuality"));

  objc_msgSend(v5, "macAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("HMAccessoryLinkQualityMacAddress"));

  objc_msgSend(v5, "networkName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("HMAccessoryLinkQualityNetworkName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "supported"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("HMAccessoryLinkQualityNetworkSupported"));

  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v12);
LABEL_10:

}

- (BOOL)_isFirstPartyAccessory:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hf_isHomePod") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hf_isAppleTV");

  return v4;
}

- (id)_currentDeviceNetworkSSID
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  HFAccessoryNetworkInfoItem *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HFAccessoryNetworkInfoItem forceCurrentDeviceNetworkSSID](self, "forceCurrentDeviceNetworkSSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HFAccessoryNetworkInfoItem forceCurrentDeviceNetworkSSID](self, "forceCurrentDeviceNetworkSSID");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BA50]), "initWithServiceType:", 3);
    objc_msgSend(v6, "resume");
    objc_msgSend(v6, "networkName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v6 || !objc_msgSend(v7, "length"))
    {
      HFLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "networkName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138413058;
        v13 = self;
        v14 = 2112;
        v15 = v10;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = v11;
        _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "%@:%@ Can't find WiFi network SSID name: interface = %@, name = %@", (uint8_t *)&v12, 0x2Au);

      }
    }
    objc_msgSend(v6, "invalidate");

    return v8;
  }
}

- (id)_accessoryNetworkSSID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnosticInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryInfoItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wifiNetworkInfoForAccessory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl()
    && (-[HFAccessoryInfoItem accessory](self, "accessory"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = -[HFAccessoryNetworkInfoItem _isFirstPartyAccessory:](self, "_isFirstPartyAccessory:", v8),
        v8,
        !v9))
  {
    -[HFAccessoryNetworkInfoItem wifiInfo](self, "wifiInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_opt_class();
      -[HFAccessoryNetworkInfoItem wifiInfo](self, "wifiInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HMAccessoryLinkQualityNetworkName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v10 = v16;

    }
    else
    {
      v10 = 0;
    }
  }
  else if (v7)
  {
    v10 = v7;
  }
  else
  {
    -[HFAccessoryInfoItem accessory](self, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wifiNetworkInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "SSID");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_accessoryMACAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnosticInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryInfoItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wifiNetworkInfoForAccessory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MACAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl()
    && (-[HFAccessoryInfoItem accessory](self, "accessory"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = -[HFAccessoryNetworkInfoItem _isFirstPartyAccessory:](self, "_isFirstPartyAccessory:", v8),
        v8,
        !v9))
  {
    objc_opt_class();
    -[HFAccessoryNetworkInfoItem wifiInfo](self, "wifiInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HMAccessoryLinkQualityMacAddress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v10 = v16;

  }
  else if (v7)
  {
    objc_msgSend(v7, "formattedString");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFAccessoryInfoItem accessory](self, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wifiNetworkInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MACAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "formattedString");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)_hiddenForType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  -[HFAccessoryNetworkInfoItem _localizedDescriptionForType:](self, "_localizedDescriptionForType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 1;
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      -[HFAccessoryInfoItem accessory](self, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "hf_isNetworkCredentialManagementEnabled"))
      {
        -[HFAccessoryInfoItem accessory](self, "accessory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hf_hasManagedNetworkCredential");

        return !v14;
      }

    }
    return 0;
  }
  if (!_os_feature_enabled_impl())
  {
    -[HFAccessoryInfoItem accessory](self, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wifiNetworkInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return !v12;
  }
  -[HFAccessoryNetworkInfoItem wifiInfo](self, "wifiInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    -[HFAccessoryInfoItem accessory](self, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wifiNetworkInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16 == 0;

  }
  return v8;
}

- (unint64_t)networkInfoType
{
  return self->_networkInfoType;
}

- (void)setNetworkInfoType:(unint64_t)a3
{
  self->_networkInfoType = a3;
}

- (NSDate)debounceDate
{
  return self->_debounceDate;
}

- (void)setDebounceDate:(id)a3
{
  objc_storeStrong((id *)&self->_debounceDate, a3);
}

- (int64_t)fakeNetworkStrength
{
  return self->_fakeNetworkStrength;
}

- (void)setFakeNetworkStrength:(int64_t)a3
{
  self->_fakeNetworkStrength = a3;
}

- (NSDictionary)wifiInfo
{
  return self->_wifiInfo;
}

- (void)setWifiInfo:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInfo, a3);
}

- (NSString)forceCurrentDeviceNetworkSSID
{
  return self->_forceCurrentDeviceNetworkSSID;
}

- (void)setForceCurrentDeviceNetworkSSID:(id)a3
{
  objc_storeStrong((id *)&self->_forceCurrentDeviceNetworkSSID, a3);
}

- (BOOL)initialSetup
{
  return self->_initialSetup;
}

- (void)setInitialSetup:(BOOL)a3
{
  self->_initialSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceCurrentDeviceNetworkSSID, 0);
  objc_storeStrong((id *)&self->_wifiInfo, 0);
  objc_storeStrong((id *)&self->_debounceDate, 0);
}

@end
