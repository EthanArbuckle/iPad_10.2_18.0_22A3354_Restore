@implementation AADeviceInfo

- (id)clientInfoHeader
{
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AADeviceInfo productType](self, "productType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[AADeviceInfo osName](self, "osName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AADeviceInfo osVersion](self, "osVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AADeviceInfo buildVersion](self, "buildVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@;%@;%@"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C9AE90];
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "infoDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@/%@ (%@/%@)"), v19, v14, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@> <%@> <%@>"), v5, v10, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __31__AADeviceInfo_isMultiUserMode__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)MKBUserTypeDeviceMode();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0D4E5A8]))
    isMultiUserMode_isMultiUserMode = 1;

}

uint64_t __31__AADeviceInfo_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  isInternalBuild_isInternalBuild = result;
  return result;
}

void __27__AADeviceInfo_currentInfo__block_invoke()
{
  AADeviceInfo *v0;
  void *v1;

  v0 = objc_alloc_init(AADeviceInfo);
  v1 = (void *)currentInfo_currentInfo;
  currentInfo_currentInfo = (uint64_t)v0;

}

- (id)productType
{
  return (id)MGCopyAnswer();
}

- (id)osVersion
{
  return (id)MGCopyAnswer();
}

- (id)osName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)_CFCopySystemVersionDictionary();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9AB98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)buildVersion
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)_CFCopySystemVersionDictionary();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9AB90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)isMultiUserMode
{
  if (isMultiUserMode_onceToken != -1)
    dispatch_once(&isMultiUserMode_onceToken, &__block_literal_global_87);
  return isMultiUserMode_isMultiUserMode;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_85);
  return isInternalBuild_isInternalBuild;
}

+ (AADeviceInfo)currentInfo
{
  if (currentInfo_onceToken != -1)
    dispatch_once(&currentInfo_onceToken, &__block_literal_global_9);
  return (AADeviceInfo *)(id)currentInfo_currentInfo;
}

+ (BOOL)locationServicesRestricted
{
  void *v2;
  char v3;

  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("location"));

  return v3;
}

- (id)deviceInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AADeviceInfo udid](self, "udid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("udid"));
  -[AADeviceInfo serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("serialNumber"));
  -[AADeviceInfo regionCode](self, "regionCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("regionCode"));

  return v3;
}

- (id)udid
{
  return (id)MGCopyAnswer();
}

- (id)serialNumber
{
  return (id)MGCopyAnswer();
}

- (id)wifiMacAddress
{
  return (id)MGCopyAnswer();
}

- (id)bluetoothMacAddress
{
  return (id)MGCopyAnswer();
}

- (id)productVersion
{
  return (id)MGCopyAnswer();
}

- (id)deviceName
{
  return (id)MGCopyAnswer();
}

- (id)deviceColor
{
  return (id)MGCopyAnswer();
}

- (id)deviceEnclosureColor
{
  return (id)MGCopyAnswer();
}

- (id)deviceCoverGlassColor
{
  return (id)MGCopyAnswer();
}

- (id)deviceHousingColor
{
  return (id)MGCopyAnswer();
}

- (id)deviceBackingColor
{
  return (id)MGCopyAnswer();
}

- (BOOL)hasCellularCapability
{
  if ((MGGetBoolAnswer() & 1) != 0)
    return 1;
  else
    return MGGetBoolAnswer();
}

- (id)mobileEquipmentIdentifier
{
  return (id)MGCopyAnswer();
}

- (id)internationalMobileEquipmentIdentity
{
  return (id)MGCopyAnswer();
}

- (id)storageCapacity
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DE2CC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)regionCode
{
  return (id)MGCopyAnswer();
}

- (id)apnsToken
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CFE148]);
  v3 = (void *)objc_msgSend(v2, "initWithEnvironmentName:", *MEMORY[0x1E0CFE130]);
  objc_msgSend(v3, "publicToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceClass
{
  return (id)MGCopyAnswer();
}

- (id)modelNumber
{
  return (id)MGCopyAnswer();
}

- (id)chipIdentifier
{
  return (id)MGCopyAnswer();
}

- (id)uniqueChipIdentifier
{
  return (id)MGCopyAnswer();
}

- (id)appleIDClientIdentifier
{
  __CFDictionary *Mutable;
  const void *v3;
  OSStatus v4;
  BOOL v5;
  OSStatus v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], CFSTR("AppleIDClientIdentifier"));
  v3 = (const void *)*MEMORY[0x1E0CD7018];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
  result = 0;
  v4 = SecItemCopyMatching(Mutable, &result);
  if (v4)
    v5 = 1;
  else
    v5 = result == 0;
  if (v5)
  {
    v6 = v4;
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 67109120;
        v18 = v6;
        _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching result: %d", buf, 8u);
      }

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68B0]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v11);
      CFDictionaryRemoveValue(Mutable, v3);
      if (SecItemAdd(Mutable, 0))
      {
        _AALogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "There was an error saving the AppleIDClientIdentifier to the keychain", buf, 2u);
        }

      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching succeeded with empty results", buf, 2u);
      }

      v14 = 0;
    }
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = (void *)objc_msgSend(v13, "initWithData:encoding:", result, 4);
    CFRelease(result);
  }
  CFRelease(Mutable);
  return v14;
}

- (id)userAgentHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AADeviceInfo productVersion](self, "productVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AADeviceInfo buildVersion](self, "buildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AADeviceInfo deviceClass](self, "deviceClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("iOS %@ %@ %@ Setup Assistant"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localSecretType
{
  return (id)objc_msgSend(MEMORY[0x1E0CF0E90], "localSecretType");
}

+ (BOOL)hasiCloudSignOutRestriction
{
  return 0;
}

+ (id)infoDictionary
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "deviceInfoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)udid
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "udid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)osVersion
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "osVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)serialNumber
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)apnsToken
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "apnsToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)appleIDClientIdentifier
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "appleIDClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)clientInfoHeader
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "clientInfoHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)userAgentHeader
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "userAgentHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)productVersion
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "productVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
