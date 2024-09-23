@implementation HFMediaHelper

+ (BOOL)isHomePodMediaSystem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6 != 0;
}

+ (BOOL)isHomePod:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isHomePod");

  return v4;
}

+ (BOOL)isHomePodOriginalMediaSystem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (+[HFMediaHelper isHomePodMediaSystem:](HFMediaHelper, "isHomePodMediaSystem:", v3))
  {
    objc_msgSend(v3, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "homePodVariant") == 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isAnyKindOfGroup:(id)a3
{
  return +[HFMediaHelper isHomePodMediaSystem:](HFMediaHelper, "isHomePodMediaSystem:", a3);
}

+ (BOOL)isHomePodOriginal:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (+[HFMediaHelper isHomePod:](HFMediaHelper, "isHomePod:", v3))
  {
    objc_msgSend(v3, "hf_backingAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "homePodVariant") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isContainedWithinMediaSystem:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (+[HFMediaHelper isHomePodMediaSystem:](HFMediaHelper, "isHomePodMediaSystem:", v3))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "hf_home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_backingAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_mediaSystemForAccessory:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7 != 0;

  }
  return v4;
}

+ (BOOL)isHomePodMiniMediaSystem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (+[HFMediaHelper isHomePodMediaSystem:](HFMediaHelper, "isHomePodMediaSystem:", v3))
  {
    objc_msgSend(v3, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "homePodVariant") == 2;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isHomePodMini:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (+[HFMediaHelper isHomePod:](HFMediaHelper, "isHomePod:", v3))
  {
    objc_msgSend(v3, "hf_backingAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "homePodVariant") == 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isAppleTV:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isAppleTV");

  return v4;
}

+ (BOOL)isAirPortExpress:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isAirPortExpressSpeaker");

  return v4;
}

+ (BOOL)isAudioReceiver:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isAudioReceiver");

  return v4;
}

+ (BOOL)isSiriDisabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;

  v3 = a3;
  objc_msgSend(v3, "hf_settingsValueManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hf_accessorySettingAtKeyPath:", CFSTR("root.siri.allowHeySiri"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "valueForSetting:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    v10 = objc_msgSend(v9, "BOOLValue") ^ 1;
  else
    LOBYTE(v10) = 0;

  return v10;
}

+ (BOOL)isAudioAnalysisSupportedDevice:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hf_isAudioAnalysisSupportedDevice"))
    v5 = objc_msgSend(v4, "hf_isHomePod");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isSiriEndpoint:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isSiriEndpoint");

  return v4;
}

+ (BOOL)canMediaProfileContainer:(id)a3 supportHomeTheaterWithAppleTV:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413058;
    v26 = a1;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Extracted homepod accessory for media profile container. HomePod: %@ mediaProfileContainer: %@", (uint8_t *)&v25, 0x2Au);

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFMediaHelper.m"), 194, CFSTR("Home Theater Accessory candidate should not be nil."));

  }
  if ((objc_msgSend(v8, "hf_isAppleTV") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFMediaHelper.m"), 195, CFSTR("Home Theater Accessory candidate can only be an apple TV."));

  }
  if (objc_msgSend(v10, "homePodVariant") == 3
    && (objc_msgSend(v8, "audioDestinationController"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "supportsSameRoomB620Destinations"),
        v13,
        (v14 & 1) == 0))
  {
    HFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413058;
      v26 = a1;
      v27 = 2112;
      v28 = v21;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Accessory does not support B620 as audio destination. HomePod: %@ Accessory: %@", (uint8_t *)&v25, 0x2Au);

    }
    v20 = 0;
  }
  else
  {
    HFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audioDestinationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413058;
      v26 = a1;
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Checking Accessory %@ with audio destination controller %@ for empty destination.", (uint8_t *)&v25, 0x2Au);

    }
    objc_msgSend(v8, "audioDestinationController");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject destination](v18, "destination");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

  }
  return v20;
}

+ (BOOL)supportsDoorbellChime:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_accessorySettingAtKeyPath:", CFSTR("root.doorbellChime.enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = a1;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ media profile container: %@ has doorbell setting: %@", (uint8_t *)&v19, 0x2Au);

  }
  if (v7 || !objc_msgSend(a1, "isSiriEndpoint:", v5))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v5, "hf_backingAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_mediaAccessoryCommonSettingsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "settingForKeyPath:", HFDoorbellChimeEnabledKeyPath);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413314;
      v20 = a1;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri endpoint media profile container: %@ has doorbell setting: %@, for common settings manager: %@", (uint8_t *)&v19, 0x34u);

    }
    v16 = v13 != 0;
  }
  if (v7)
    v17 = 1;
  else
    v17 = v16;

  return v17;
}

+ (BOOL)isDoorbellChimeEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  objc_msgSend(v4, "hf_settingsValueManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_accessorySettingAtKeyPath:", CFSTR("root.doorbellChime.enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "valueForSetting:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v7 && objc_msgSend(a1, "isSiriEndpoint:", v4))
  {
    objc_msgSend(v4, "hf_backingAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_mediaAccessoryCommonSettingsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "settingValueForKeyPath:", HFDoorbellChimeEnabledKeyPath);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v14;
  }
  if (v10)
    v15 = objc_msgSend(v10, "BOOLValue");
  else
    v15 = 0;

  return v15;
}

+ (id)mediaIconDescriptorForMediaContainer:(id)a3
{
  id v3;
  void *v4;
  HFImageIconDescriptor *v5;
  HFImageIconDescriptor *v6;
  const __CFString *v7;
  HFCAPackageIconDescriptor *v8;
  HFImageIconDescriptor *v9;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "mediaContainerSymbolConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("hifispeaker.fill"), v4);
  if (+[HFMediaHelper isHomePodMiniMediaSystem:](HFMediaHelper, "isHomePodMiniMediaSystem:", v3))
  {
    v6 = [HFImageIconDescriptor alloc];
    v7 = CFSTR("homepodmini.2.fill");
LABEL_13:
    v8 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:](v6, "initWithSystemImageNamed:configuration:", v7, v4);
    goto LABEL_14;
  }
  if (+[HFMediaHelper isHomePodMini:](HFMediaHelper, "isHomePodMini:", v3))
  {
    v6 = [HFImageIconDescriptor alloc];
    v7 = CFSTR("homepodmini.fill");
    goto LABEL_13;
  }
  if (+[HFMediaHelper isHomePodMediaSystem:](HFMediaHelper, "isHomePodMediaSystem:", v3))
  {
    v6 = [HFImageIconDescriptor alloc];
    v7 = CFSTR("homepod.2.fill");
    goto LABEL_13;
  }
  if (+[HFMediaHelper isHomePod:](HFMediaHelper, "isHomePod:", v3))
  {
    v6 = [HFImageIconDescriptor alloc];
    v7 = CFSTR("homepod.fill");
    goto LABEL_13;
  }
  if (+[HFMediaHelper isAppleTV:](HFMediaHelper, "isAppleTV:", v3))
  {
    v6 = [HFImageIconDescriptor alloc];
    v7 = CFSTR("appletv.fill");
    goto LABEL_13;
  }
  if (+[HFMediaHelper isAirPortExpress:](HFMediaHelper, "isAirPortExpress:", v3))
  {
    v6 = [HFImageIconDescriptor alloc];
    v7 = CFSTR("airport.extreme");
    goto LABEL_13;
  }
  if (!+[HFMediaHelper isAudioReceiver:](HFMediaHelper, "isAudioReceiver:", v3))
    goto LABEL_15;
  v8 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierReceiver"));
LABEL_14:
  v9 = (HFImageIconDescriptor *)v8;

  v5 = v9;
LABEL_15:

  return v5;
}

+ (id)mediaContainerSymbolConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithHierarchicalColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5B8], 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationByApplyingConfiguration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_findAccessorySettingSiriLanguageAdapterFor:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "hf_settingsAdapterManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adapterForIdentifier:", CFSTR("SiriLanguageAdapter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)siriLanguageOptionFor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  const char *aSelector;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasOptedToHH2");

    if (v10
      || (objc_msgSend(v7, "accessory"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "hf_isSiriEndpoint"),
          v11,
          v12))
    {
      objc_msgSend(v7, "hf_siriLanguageOptionsManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:](HFMediaHelper, "_findAccessorySettingSiriLanguageAdapterFor:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v13;
    objc_msgSend(v13, "selectedLanguageOption");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v14 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "homeManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasOptedToHH2");

      if (v19)
        objc_msgSend(v16, "hf_siriLanguageOptionsManager");
      else
        +[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:](HFMediaHelper, "_findAccessorySettingSiriLanguageAdapterFor:", v14);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "selectedLanguageOption");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v14, "mediaProfiles");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v21)
      {
        v22 = v21;
        aSelector = a2;
        v23 = 0;
        v24 = *(_QWORD *)v42;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v42 != v24)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "homeManager");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "hasOptedToHH2");

            if (v29
              || (objc_msgSend(v26, "accessory"),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  v31 = objc_msgSend(v30, "hf_isSiriEndpoint"),
                  v30,
                  v31))
            {
              objc_msgSend(v26, "hf_siriLanguageOptionsManager");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              +[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:](HFMediaHelper, "_findAccessorySettingSiriLanguageAdapterFor:", v26);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v33 = v32;
            objc_msgSend(v32, "selectedLanguageOption");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
            {
              HFLogForCategory(0);
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                NSStringFromSelector(aSelector);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v46 = v37;
                v47 = 2112;
                v48 = v26;
                _os_log_impl(&dword_1DD34E000, v36, OS_LOG_TYPE_DEFAULT, "%@ Media Profile %@ does not have a selected language option", buf, 0x16u);

              }
LABEL_38:

              v20 = 0;
              v16 = 0;
              goto LABEL_41;
            }
            if (v23)
            {
              if (!objc_msgSend(v23, "isEqual:", v34))
                goto LABEL_38;
            }
            else
            {
              v23 = v34;
            }

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          v16 = 0;
          if (v22)
            continue;
          break;
        }
      }
      else
      {
        v23 = 0;
      }

      v23 = v23;
      v20 = v23;
LABEL_41:

    }
  }

  return v20;
}

+ (id)changeAllSiriLanguageOptionsFor:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "hmf_isEmpty");
  if (!v7 || v8)
  {
    HFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recognitionLanguage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "%@ No speaker languages changed to %@ for %@", buf, 0x20u);

    }
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v6;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          +[HFMediaHelper changeSiriLanguageOptionFor:to:](HFMediaHelper, "changeSiriLanguageOptionFor:to:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v7, (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "na_safeAddObject:", v15);

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }
  }

  return v9;
}

+ (id)changeSiriLanguageOptionFor:(id)a3 to:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  SEL v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  _BYTE v49[18];
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recognitionLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v47 = a1;
    v48 = 2112;
    *(_QWORD *)v49 = v10;
    *(_WORD *)&v49[8] = 2112;
    *(_QWORD *)&v49[10] = v11;
    v50 = 2112;
    v51 = v7;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: Changing Siri language to [%@] for [%@]", buf, 0x2Au);

  }
  if (!v8)
  {
    HFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = a1;
      v48 = 2112;
      *(_QWORD *)v49 = v39;
      _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "%@:%@: Can't change to an nil Siri language", buf, 0x16u);

    }
    v18 = (void *)MEMORY[0x1E0D519C0];
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = 33;
    goto LABEL_13;
  }
  if ((objc_msgSend(v7, "hf_isReachable") & 1) == 0)
  {
    HFLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v7, "hf_isReachable");
      objc_msgSend(v7, "hf_displayName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v47 = v40;
      v48 = 1024;
      *(_DWORD *)v49 = v41;
      *(_WORD *)&v49[4] = 2112;
      *(_QWORD *)&v49[6] = v42;
      _os_log_error_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_ERROR, "%@ Controller is reachable? %{BOOL}d. Language change failed for [%@]", buf, 0x1Cu);

    }
    v18 = (void *)MEMORY[0x1E0D519C0];
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = 35;
LABEL_13:
    objc_msgSend(v19, "hf_errorWithCode:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasOptedToHH2");

  if (v14)
  {
    +[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:](HFMediaHelper, "_findAccessorySettingSiriLanguageAdapterFor:", v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateSelectedLanguageOption:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v24 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v15 = v25;

    objc_msgSend(v15, "accessory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "hf_isSiriEndpoint");

    if ((v27 & 1) != 0
      || (+[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:](HFMediaHelper, "_findAccessorySettingSiriLanguageAdapterFor:", v24), v28 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v28, "updateSelectedLanguageOption:", v8), v16 = (void *)objc_claimAutoreleasedReturnValue(), v28, !v16))
    {
      objc_opt_class();
      v29 = v24;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
      v31 = v30;

      if (v15)
        v32 = v15;
      else
        v32 = v31;
      objc_msgSend(v32, "hf_siriLanguageOptionsManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "updateSelectedLanguageOption:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __48__HFMediaHelper_changeSiriLanguageOptionFor_to___block_invoke;
    v43[3] = &unk_1EA72C190;
    v45 = a2;
    v44 = v24;
    v34 = (id)objc_msgSend(v16, "addFailureBlock:", v43);

  }
  if (!v16)
  {
    v37 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "futureWithError:", v38);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    goto LABEL_30;
  }
  v23 = v16;
  v22 = v23;
LABEL_29:
  v35 = v23;
LABEL_30:

  return v35;
}

void __48__HFMediaHelper_changeSiriLanguageOptionFor_to___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "%@ Language change failed for %@", (uint8_t *)&v5, 0x16u);

  }
}

+ (id)allAccessoriesContainedIn:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__HFMediaHelper_allAccessoriesContainedIn___block_invoke;
  v8[3] = &unk_1EA72B9A8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "na_each:", v8);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

void __43__HFMediaHelper_allAccessoriesContainedIn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (+[HFMediaHelper isHomePodMediaSystem:](HFMediaHelper, "isHomePodMediaSystem:", v3))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "accessories", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v3, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

+ (id)mediaProfileContainerForItem:(id)a3 forTopLevel:(BOOL)a4
{
  void *v4;
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v5 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_opt_class();
  v12 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v15 = 0;
  if (v11 | v14)
  {
    if (v14
      && (objc_msgSend((id)v14, "service"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "accessory"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "hf_isHomePod"),
          v17,
          v16,
          !v18))
    {
      v15 = 0;
    }
    else
    {
      v19 = a2;
      v35 = a1;
      if (v11)
      {
        objc_msgSend((id)v11, "mediaProfileContainer");
      }
      else
      {
        objc_msgSend((id)v14, "service");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "accessory");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mediaProfile");
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = &unk_1F0449888;
      if (objc_msgSend(v21, "conformsToProtocol:", v22))
        v23 = v21;
      else
        v23 = 0;
      v15 = v23;

      if (!v11)
      {

        v20 = v34;
      }

      if (v5)
      {
        objc_opt_class();
        v15 = v15;
        v24 = (objc_opt_isKindOfClass() & 1) != 0 ? v15 : 0;
        v25 = v24;

        if (!v25)
        {
          objc_msgSend(v15, "hf_home");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "hf_backingAccessory");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "hf_mediaSystemForAccessory:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            v29 = v28;
          else
            v29 = v15;
          v30 = v29;

          v15 = v30;
        }
      }
      HFLogForCategory(0);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(v19);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v37 = v35;
        v38 = 2112;
        v39 = v32;
        v40 = 2112;
        v41 = v11;
        v42 = 2112;
        v43 = v14;
        v44 = 2112;
        v45 = v15;
        _os_log_impl(&dword_1DD34E000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ Found top level of media profile container for this accessory. accessoryItem: %@ serviceItem: %@ mediaProfileContainer: %@", buf, 0x34u);

      }
    }
  }

  return v15;
}

@end
