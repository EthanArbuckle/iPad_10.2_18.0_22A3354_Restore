@implementation HMAccessory(HFMediaAdditions)

- (uint64_t)hf_isMediaAccessory
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "hf_siriEndpointProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "category");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hf_isMediaAccessory");

    if (!v4)
      return 0;
  }
  objc_msgSend(a1, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(a1, "hf_isCategorizedAsMediaAccessory");
  else
    v6 = 0;

  return v6;
}

- (uint64_t)hf_isHomePod
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7A58]);
  return v3;
}

- (uint64_t)hf_isAppleTV
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7A18]);
  return v3;
}

- (uint64_t)hf_isCategorizedAsMediaAccessory
{
  if ((objc_msgSend(a1, "hf_isHomePod") & 1) != 0
    || (objc_msgSend(a1, "hf_isAppleTV") & 1) != 0
    || (objc_msgSend(a1, "hf_isSpeaker") & 1) != 0
    || (objc_msgSend(a1, "hf_isDumbSpeaker") & 1) != 0
    || (objc_msgSend(a1, "hf_isAirPortExpressSpeaker") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "hf_isAudioReceiver");
  }
}

- (uint64_t)hf_isAirPortExpressSpeaker
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7A08]);
  return v3;
}

- (uint64_t)hf_isDumbSpeaker
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7AA8]);
  return v3;
}

- (uint64_t)hf_isSpeaker
{
  if ((objc_msgSend(a1, "hf_isDumbSpeaker") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_isAirPortExpressSpeaker");
}

- (uint64_t)hf_isAudioReceiver
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7A20]);
  return v3;
}

- (BOOL)hf_isSiriEndpoint
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hf_siriEndpointProfile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)hf_supportsMultiUserLanguage:()HFMediaAdditions
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  if ((objc_msgSend(a1, "hf_isSiriEndpoint") & 1) != 0
    || (+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "homeManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasOptedToHH2"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(a1, "mediaProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_siriLanguageOptionsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "selectedLanguageOption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "mediaProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_settingsAdapterManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "adapterForIdentifier:", CFSTR("SiriLanguageAdapter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    objc_msgSend(v15, "selectedLanguageOption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "recognitionLanguage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "containsObject:", v16);

  return v17;
}

- (uint64_t)hf_mediaAccessControlCapabilities
{
  uint64_t v2;

  if (objc_msgSend(MEMORY[0x1E0CBA528], "accessorySupportsMediaAccessControl:", a1))
    v2 = 5;
  else
    v2 = 0;
  if ((objc_msgSend(a1, "hf_isHomePod") & 1) != 0 || objc_msgSend(a1, "hf_isAppleTV"))
    return v2 | 2;
  return v2;
}

- (uint64_t)hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem
{
  uint64_t result;

  result = objc_msgSend(a1, "hf_isHomePod");
  if ((_DWORD)result)
  {
    result = objc_msgSend(MEMORY[0x1E0CBA668], "canSupportMediaSystem:", a1);
    if ((_DWORD)result)
      return objc_msgSend(MEMORY[0x1E0CBA668], "supportsMediaSystem:", a1) ^ 1;
  }
  return result;
}

- (id)hf_identifyHomePod
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mediaProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_settingsAdapterManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adapterForIdentifier:", CFSTR("DeviceOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v2;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Preparing to send identify message to accessory: %@", buf, 0xCu);
    }

    objc_msgSend(v4, "identifyAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__HMAccessory_HFMediaAdditions__hf_identifyHomePod__block_invoke;
    v10[3] = &unk_1EA72CBB8;
    v11 = v2;
    objc_msgSend(v6, "addCompletionBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSLog(CFSTR("Device Options Adapter does not exist for accessory %@"), a1);
    v8 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (uint64_t)hf_shouldShowSoftwareUpdateInfo
{
  uint64_t result;

  result = objc_msgSend(a1, "isControllable");
  if ((_DWORD)result)
    return objc_msgSend(a1, "hf_softwareUpdatePossessesNecessaryDocumentation");
  return result;
}

- (uint64_t)hf_shouldDisplayManualFixOptionForSymptom:()HFMediaAdditions
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  if ((objc_msgSend(a1, "hf_fakeShouldDisplayManualFixOption") & 1) != 0)
    return 1;
  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    return 0;
  +[HFSymptomFixManager sharedManager](HFSymptomFixManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", a3);
  if (a3 <= 0x14 && ((1 << a3) & 0x100006) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = 0;
    if ((objc_msgSend(v6, "anySymptomIsBeingFixedForFixableObject:", a1) & 1) == 0 && v7)
    {
      objc_msgSend(a1, "symptomsHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "newFixSessionForSymptom:", v7);
      v5 = v10 != 0;

    }
  }

  return v5;
}

- (uint64_t)hf_fakeUnreachableError
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeUnreachableError"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeWiFiSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeWiFiSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeWiFiPerformanceSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeWiFiPerformanceSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeInternetFixSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeInternetFixSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeHardwareFixSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeHardwareFixSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeGeneralFixSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeGeneralFixSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeHomeKitSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeHomeKitSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeICloudSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeICloudSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeITunesSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeITunesSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeCDPSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeCDPSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)hf_fakeShouldDisplayManualFixOption
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hf_fakeDebugSymptoms");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (uint64_t)hf_fakeWiFiMismatchSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeWiFiNetworkMismatchSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_setFakeWiFiMismatchSymptom:()HFMediaAdditions
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  objc_msgSend(a1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    v8 = CFSTR("YES");
  else
    v8 = 0;
  HFPreferencesAccessorySetValueForKey(v6, CFSTR("fakeWiFiNetworkMismatchSymptom"), v8);

  return objc_msgSend(a1, "_pushSymptomUpdate");
}

- (uint64_t)hf_fakeCaptiveLeaseRenewalSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeCaptiveLeaseRenewalSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_setFakeCaptiveLeaseRenewalSymptom:()HFMediaAdditions
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  objc_msgSend(a1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    v8 = CFSTR("YES");
  else
    v8 = 0;
  HFPreferencesAccessorySetValueForKey(v6, CFSTR("fakeCaptiveLeaseRenewalSymptom"), v8);

  return objc_msgSend(a1, "_pushSymptomUpdate");
}

- (uint64_t)hf_fakeVPNProfileExpired
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeVPNProfileExpiredSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fake8021xNetworkSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fake8021xNetworkSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeNetworkProfileFixSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeNetworkProfileFixSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeNetworkProfileInstallSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeNetworkProfileInstallSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeNetworkNotShareableSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeNetworkNotShareableSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeNetworkStrengthError
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeNetworkStrengthError"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)_pushSymptomUpdate
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a1, "symptomsHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__HMAccessory_HFMediaAdditions___pushSymptomUpdate__block_invoke;
  v4[3] = &unk_1EA72CBE0;
  v5 = v1;
  v3 = v1;
  objc_msgSend(v2, "dispatchSymptomsHandlerMessage:sender:", v4, 0);

}

- (id)hf_fakeDebugSymptoms
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "hf_fakeWiFiSymptom"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 4);
    objc_msgSend(v2, "addObject:", v3);

  }
  if (objc_msgSend(a1, "hf_fakeWiFiPerformanceSymptom"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 5);
    objc_msgSend(v2, "addObject:", v4);

  }
  if (objc_msgSend(a1, "hf_fakeInternetFixSymptom"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 6);
    objc_msgSend(v2, "addObject:", v5);

  }
  if (objc_msgSend(a1, "hf_fakeHardwareFixSymptom"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 7);
    objc_msgSend(v2, "addObject:", v6);

  }
  if (objc_msgSend(a1, "hf_fakeGeneralFixSymptom"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 999);
    objc_msgSend(v2, "addObject:", v7);

  }
  if (objc_msgSend(a1, "hf_fakeHomeKitSymptom"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 3);
    objc_msgSend(v2, "addObject:", v8);

  }
  if (objc_msgSend(a1, "hf_fakeITunesSymptom"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 2);
    objc_msgSend(v2, "addObject:", v9);

  }
  if (objc_msgSend(a1, "hf_fakeICloudSymptom"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 1);
    objc_msgSend(v2, "addObject:", v10);

  }
  if (objc_msgSend(a1, "hf_fakeCDPSymptom"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 20);
    objc_msgSend(v2, "addObject:", v11);

  }
  if (objc_msgSend(a1, "hf_fakeWiFiMismatchSymptom"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 11);
    objc_msgSend(v2, "addObject:", v12);

  }
  if (objc_msgSend(a1, "hf_fakeCaptiveLeaseRenewalSymptom"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 19);
    objc_msgSend(v2, "addObject:", v13);

  }
  if (objc_msgSend(a1, "hf_fakeVPNProfileExpired"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 13);
    objc_msgSend(v2, "addObject:", v14);

  }
  if (objc_msgSend(a1, "hf_fake8021xNetworkSymptom"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 14);
    objc_msgSend(v2, "addObject:", v15);

  }
  if (objc_msgSend(a1, "hf_fakeNetworkProfileFixSymptom"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 16);
    objc_msgSend(v2, "addObject:", v16);

  }
  if (objc_msgSend(a1, "hf_fakeNetworkProfileInstallSymptom"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 17);
    objc_msgSend(v2, "addObject:", v17);

  }
  if (objc_msgSend(a1, "hf_fakeNetworkNotShareableSymptom"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 18);
    objc_msgSend(v2, "addObject:", v18);

  }
  objc_msgSend(v2, "na_each:", &__block_literal_global_49);
  return v2;
}

@end
