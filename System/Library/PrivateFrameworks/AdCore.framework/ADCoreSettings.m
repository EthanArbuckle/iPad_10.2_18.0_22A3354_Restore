@implementation ADCoreSettings

- (NSURL)defaultConfigurationServerURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("ConfigurationAdServerURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithString:", v4);

  return (NSURL *)v5;
}

- (BOOL)isRestrictedRegion
{
  return self->_isRestrictedRegion;
}

- (BOOL)isPersonalizedAdsEnabled
{
  void *v3;
  uint64_t v4;
  char v5;
  BOOL v6;
  void *v8;

  if (-[ADCoreSettings isRestrictedByScreenTime](self, "isRestrictedByScreenTime"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D46F18];
  v5 = objc_msgSend(v3, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x1E0D46F18]);

  if ((v5 & 1) != 0 || -[ADCoreSettings isAccountRestricted](self, "isAccountRestricted"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "effectiveBoolValueForSetting:", v4) == 1;

  return v6;
}

- (BOOL)isRestrictedByScreenTime
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("advertising"));

  return v3;
}

- (BOOL)isAccountRestricted
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;

  +[ADIDManager sharedInstance](ADIDManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDSIDRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "educationModeEnabled");

  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isManagedAppleID");

  v9 = v6 | v8;
  if (!v4)
    goto LABEL_6;
  if ((objc_msgSend(v4, "accountIsU13") & 1) == 0 && (objc_msgSend(v4, "accountIsU18") & 1) == 0)
  {
    v9 |= objc_msgSend(v4, "accountAgeUnknown");
LABEL_6:
    v10 = v9 ^ 1u;
    goto LABEL_7;
  }
  v10 = 0;
  LOBYTE(v9) = 1;
LABEL_7:
  -[ADCoreSettings setIdentifierForAdvertisingAllowed:](self, "setIdentifierForAdvertisingAllowed:", v10);

  return v9;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ADCoreSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_4 != -1)
    dispatch_once(&sharedInstance__onceToken_4, block);
  return (id)sharedInstance__instance_4;
}

- (void)setIdentifierForAdvertisingAllowed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:forSetting:", v3, *MEMORY[0x1E0D47090]);

}

- (BOOL)isManagediCloudAccount
{
  void *v2;
  char v3;

  -[ADCoreSettings iCloudAccount](self, "iCloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ams_isManagedAppleID");

  return v3;
}

- (BOOL)isManagedAppleID
{
  return -[ADCoreSettings isManagediTunesAccount](self, "isManagediTunesAccount")
      || -[ADCoreSettings isManagediCloudAccount](self, "isManagediCloudAccount");
}

- (ADCoreSettings)init
{
  ADCoreSettings *v2;
  void *v3;
  uint64_t v4;
  NSString *osVersionAndBuild;
  uint64_t v6;
  NSString *deviceModel;
  NSString *iTunesStorefront;
  void *v9;
  void *v10;
  void *v11;
  ADCoreSettings *v12;
  void *v13;
  uint64_t v14;
  NSString *bundleIdentifier;
  _QWORD v17[4];
  ADCoreSettings *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ADCoreSettings;
  v2 = -[ADCoreSettings init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "operatingSystemVersionString");
    v4 = objc_claimAutoreleasedReturnValue();
    osVersionAndBuild = v2->_osVersionAndBuild;
    v2->_osVersionAndBuild = (NSString *)v4;

    v2->_runState = 1;
    -[ADCoreSettings deviceDescription](v2, "deviceDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    deviceModel = v2->_deviceModel;
    v2->_deviceModel = (NSString *)v6;

    iTunesStorefront = v2->_iTunesStorefront;
    v2->_iTunesStorefront = (NSString *)CFSTR("NONE");

    -[ADCoreSettings iTunesStoreAccount](v2, "iTunesStoreAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADCoreSettings adprivacydBag](v2, "adprivacydBag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ams_isInRestrictedRegionWithBag:waitForSync:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __22__ADCoreSettings_init__block_invoke;
    v17[3] = &unk_1E82B2318;
    v12 = v2;
    v18 = v12;
    objc_msgSend(v11, "addFinishBlock:", v17);

    v12->_jingleTimeoutInterval = 60.0;
    v12->_adServerTimeoutInterval = 30.0;
    v12->_NSURLConnectionTimeout = 30.0;
    v12->_NSURLTransactionTimeout = 60.0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = (NSString *)v14;

    if (!v12->_bundleIdentifier)
    {
      v12->_bundleIdentifier = (NSString *)CFSTR("com.apple.adplatforms.AdCore");

    }
  }
  return v2;
}

- (void)reloadNoServicesRestrictions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[ADCoreSettings adprivacydBag](self, "adprivacydBag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADCoreSettings iTunesStoreAccount](self, "iTunesStoreAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_isInRestrictedRegionWithBag:waitForSync:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__ADCoreSettings_reloadNoServicesRestrictions__block_invoke;
  v6[3] = &unk_1E82B2318;
  v6[4] = self;
  objc_msgSend(v5, "addFinishBlock:", v6);

}

- (id)adprivacydBag
{
  if (adprivacydBag_onceToken != -1)
    dispatch_once(&adprivacydBag_onceToken, &__block_literal_global_15);
  return (id)adprivacydBag_bag;
}

- (BOOL)isManagediTunesAccount
{
  void *v2;
  char v3;

  -[ADCoreSettings iTunesStoreAccount](self, "iTunesStoreAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ams_isManagedAppleID");

  return v3;
}

- (NSString)iTunesAccountDSID
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;

  -[ADCoreSettings iTunesStoreAccount](self, "iTunesStoreAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("0");
  v6 = v5;

  return v6;
}

- (ACAccount)iTunesStoreAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (ACAccount)iCloudAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (BOOL)educationModeEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharedIPad");

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("educationModeEnabled %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdSettingsLogging"), v6, 0);

  return v3;
}

- (id)deviceDescription
{
  char *v2;
  size_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  sysctlbyname("hw.machine", 0, v4, 0, 0);
  v2 = (char *)v4 - ((v4[0] + 15) & 0xFFFFFFFFFFFFFFF0);
  sysctlbyname("hw.machine", v2, v4, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (NSString)iTunesStorefront
{
  return self->_iTunesStorefront;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (double)adServerTimeoutInterval
{
  return self->_adServerTimeoutInterval;
}

void __31__ADCoreSettings_adprivacydBag__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("adprivacyd"), CFSTR("1"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)adprivacydBag_bag;
  adprivacydBag_bag = v0;

}

- (void)setBundleIdentifier:(id)a3
{
  id v5;
  int v6;

  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
  v5 = a3;
  v6 = -[ADCoreSettings deviceRunStateForBundleIdentifier:](self, "deviceRunStateForBundleIdentifier:", v5);

  self->_runState = v6;
}

- (int)deviceRunStateForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;

  objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signerIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "rangeOfString:", CFSTR("Apple iPhone OS Application Signing"));
    v7 = v6 == 0;
  }
  else
  {
    v7 = MGGetBoolAnswer();
  }
  if (v7)
    v8 = 1;
  else
    v8 = 2;

  return v8;
}

void __32__ADCoreSettings_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_4;
  sharedInstance__instance_4 = (uint64_t)v0;

}

- (void)setITunesStorefront:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)&self->_iTunesStorefront, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No iTunes Storefront provided. Updating Storefront information via the bag. This will incur a performance hit."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdSettingsLogging"), v5, 0);

    -[ADCoreSettings reloadStorefront:](self, "reloadStorefront:", 0);
  }

}

uint64_t __22__ADCoreSettings_init__block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3;

  if (!a3)
  {
    v3 = result;
    result = objc_msgSend(a2, "BOOLValue");
    *(_BYTE *)(*(_QWORD *)(v3 + 32) + 8) = result;
  }
  return result;
}

- (NSString)osIdentifier
{
  return (NSString *)CFSTR("i");
}

- (NSString)longBuildVersion
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES%@"), CFSTR("([0-9]+)([A-Z])([0-9]{1,4})([a-z]*)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MGGetStringAnswer();
  if (objc_msgSend(v2, "evaluateWithObject:", v3))
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSString)shortBuildVersion
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;

  -[ADCoreSettings longBuildVersion](self, "longBuildVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([0-9]+)([A-Z])"), 1, &v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    v5 = objc_msgSend(v3, "rangeOfFirstMatchInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));
    if (!v4 && (v5 != 0x7FFFFFFFFFFFFFFFLL || v6 != 0))
    {
      objc_msgSend(v2, "substringWithRange:", v5, v6);
      v8 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v8;
    }

  }
  return (NSString *)v2;
}

- (NSString)shortModelType
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  -[ADCoreSettings deviceModel](self, "deviceModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("([a-z]+)([0-9]{1,2})([,])([0-9]{1,2})"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "evaluateWithObject:", v3))
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([a-z]+)"), 1, &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    v7 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    if (!v6 && (v7 != 0x7FFFFFFFFFFFFFFFLL || v8 != 0))
    {
      objc_msgSend(v3, "substringWithRange:", v7, v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v10;
    }

    v3 = v3;
    v11 = v3;
  }
  else
  {
    v11 = 0;
  }

  return (NSString *)v11;
}

- (NSURL)defaultServerURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("AdServerURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithString:", v4);

  return (NSURL *)v5;
}

- (void)setStorefrontLocalizationLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontLocalizationLanguage, a3);
}

- (NSString)iCloudAccountIdentifier
{
  void *v2;
  void *v3;

  -[ADCoreSettings iCloudAccount](self, "iCloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)iCloudDSID
{
  void *v2;
  void *v3;
  void *v4;

  -[ADCoreSettings iCloudAccount](self, "iCloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)customJinglePayload
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  int v16;
  int v17;
  int v18;
  int v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  char v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  __CFString *v54;

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("SegmentCountry"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("SegmentGender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForKey:", CFSTR("SegmentAge"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", CFSTR("SegmentZipCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringForKey:", CFSTR("SegmentStorefront"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringForKey:", CFSTR("SegmentAppDownload"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v14 = -[__CFString isEqualToString:](v3, "isEqualToString:", &stru_1E82B34E8) ^ 1;
  else
    v14 = 0;
  v54 = v3;
  if (v5)
  {
    v15 = objc_msgSend(v5, "isEqualToString:", &stru_1E82B34E8) ^ 1;
    if (v7)
    {
LABEL_6:
      v16 = -[__CFString isEqualToString:](v7, "isEqualToString:", &stru_1E82B34E8) ^ 1;
      goto LABEL_9;
    }
  }
  else
  {
    v15 = 0;
    if (v7)
      goto LABEL_6;
  }
  v16 = 0;
LABEL_9:
  v53 = v5;
  if (v9)
    v17 = objc_msgSend(v9, "isEqualToString:", &stru_1E82B34E8) ^ 1;
  else
    LOBYTE(v17) = 0;
  v45 = v17;
  if (v11)
    v18 = -[__CFString isEqualToString:](v11, "isEqualToString:", &stru_1E82B34E8) ^ 1;
  else
    v18 = 0;
  v46 = v18;
  v51 = v9;
  v52 = v7;
  v50 = v11;
  v47 = v13;
  if (v13)
    v19 = objc_msgSend(v13, "isEqualToString:", &stru_1E82B34E8) ^ 1;
  else
    LOBYTE(v19) = 0;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v21, "setValue:forKey:", CFSTR("20170429142657"), CFSTR("gt"));
  v49 = v21;
  objc_msgSend(v20, "setValue:forKey:", v21, CFSTR("mt"));
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v23, "setValue:forKey:", CFSTR("0"), CFSTR("24"));
  objc_msgSend(v23, "setValue:forKey:", CFSTR("0"), CFSTR("31048"));
  objc_msgSend(v23, "setValue:forKey:", CFSTR("0"), CFSTR("31052"));
  objc_msgSend(v22, "setValue:forKey:", v23, CFSTR("sf"));
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v24, "setValue:forKey:", CFSTR("ITC_7001,ITC_7017,ITC_7009,ITC_7015,ITC_7003,ITC_7012,ITC_7010"), CFSTR("21047"));
  objc_msgSend(v24, "setValue:forKey:", CFSTR("ITC_6002,ITC_6016,ITC_6014,ITC_6018,ITC_6005,ITC_6007,ITC_6009,ITC_6003,ITC_6008,ITC_6024"), CFSTR("20"));
  objc_msgSend(v22, "setValue:forKey:", v24, CFSTR("pr"));
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v25, "setValue:forKey:", CFSTR("20150303"), CFSTR("4"));
  objc_msgSend(v25, "setValue:forKey:", CFSTR("17:0.84"), CFSTR("15"));
  if (v14)
  {
    v26 = v25;
    v27 = v54;
  }
  else
  {
    v27 = CFSTR("USA");
    v26 = v25;
  }
  objc_msgSend(v26, "setValue:forKey:", v27, CFSTR("48"));
  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:0.92"), v53);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKey:", v28, CFSTR("14"));

    if (!v16)
    {
LABEL_23:
      v29 = CFSTR("1976");
      v30 = v25;
      goto LABEL_26;
    }
  }
  else
  {
    objc_msgSend(v25, "setValue:forKey:", CFSTR("10:0.92"), CFSTR("14"));
    if (!v16)
      goto LABEL_23;
  }
  v30 = v25;
  v29 = v52;
LABEL_26:
  objc_msgSend(v30, "setValue:forKey:", v29, CFSTR("13"));
  v31 = v19;
  if ((v45 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:0.99"), v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKey:", v32, CFSTR("2"));

  }
  else
  {
    objc_msgSend(v25, "setValue:forKey:", CFSTR("95014-2083"), CFSTR("2"));
  }
  if (v46)
  {
    v33 = v25;
    v34 = v50;
  }
  else
  {
    v34 = CFSTR("143441");
    v33 = v25;
  }
  objc_msgSend(v33, "setValue:forKey:", v34, CFSTR("35"));
  objc_msgSend(v22, "setValue:forKey:", v25, CFSTR("dm"));
  objc_msgSend(v20, "setValue:forKey:", v22, CFSTR("it"));
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v35, "setValue:forKey:", v36, CFSTR("cs"));
  objc_msgSend(v35, "setValue:forKey:", &unk_1E82BEDB8, CFSTR("bl"));
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = v37;
  v48 = v22;
  v39 = v24;
  if ((v31 & 1) != 0)
  {
    v40 = v47;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("1:%@"), v47);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setValue:forKey:", &stru_1E82B34E8, v41);

  }
  else
  {
    objc_msgSend(v37, "setValue:forKey:", &stru_1E82B34E8, CFSTR("1:284910350"));
    v40 = v47;
  }
  objc_msgSend(v35, "setValue:forKey:", v38, CFSTR("is"));
  objc_msgSend(v20, "setValue:forKey:", v35, CFSTR("sg"));
  objc_msgSend(v20, "setValue:forKey:", CFSTR("Basel-Display-v1"), CFSTR("ver"));
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v42, "setValue:forKey:", &unk_1E82BE908, CFSTR("o"));
  objc_msgSend(v20, "setValue:forKey:", v42, CFSTR("st"));
  objc_msgSend(v20, "AD_jsonStringWithPrettyPrint:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v43;
}

- (float)timezone
{
  void *v2;
  void *v3;
  float v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (float)objc_msgSend(v3, "secondsFromGMTForDate:", v2) / 3600.0;

  return v4;
}

void __46__ADCoreSettings_reloadNoServicesRestrictions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v4;
  void *v5;

  if (!a3)
  {
    v4 = objc_msgSend(a2, "BOOLValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The no services regional restriction is: %d"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdSettingsLogging"), v5, 0);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = v4;
  }
}

- (void)reloadStorefront:(id)a3
{
  void (**v4)(_QWORD);
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
  _QWORD v17[4];
  id v18;
  ADCoreSettings *v19;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)MEMORY[0x1CAA460E4]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loading the storefront from the AMS framework."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdSettingsLogging"), v6, 0);

  -[ADCoreSettings iTunesStoreAccount](self, "iTunesStoreAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No active account. Getting storefront from local account."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdSettingsLogging"), v8, 0);

    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ams_localiTunesAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "ams_storefront");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isEqualToString:", &stru_1E82B34E8) & 1) == 0)
  {
    -[ADCoreSettings setITunesStorefront:](self, "setITunesStorefront:", v11);
    ADSaveToPromotedContentKeychain((uint64_t)v11, CFSTR("APIDAccountsSettings.storefront"));
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", CFSTR("kADIDManager_ChangedNotification"), CFSTR("com.apple.AdLib"));

    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storefront was found: %@. Forcing a bag fetch"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdSettingsLogging"), v12, 16);

  -[ADCoreSettings setITunesStorefront:](self, "setITunesStorefront:", CFSTR("NONE"));
  -[ADCoreSettings adprivacydBag](self, "adprivacydBag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForKey:", CFSTR("partiality-segment"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valuePromise");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __35__ADCoreSettings_reloadStorefront___block_invoke;
  v17[3] = &unk_1E82B2360;
  v18 = v7;
  v19 = self;
  objc_msgSend(v15, "addFinishBlock:", v17);

  if (v4)
LABEL_6:
    v4[2](v4);
LABEL_7:

  objc_autoreleasePoolPop(v5);
}

void __35__ADCoreSettings_reloadStorefront___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error fetching bag with promise: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdSettingsLogging"), v6, 16);

  }
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "ams_storefront");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "isEqualToString:", &stru_1E82B34E8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received updated storefront from forced bag fetch. Posting change notification for APIDAccounts."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("iAdSettingsLogging"), v9, 0);

      objc_msgSend(*(id *)(a1 + 40), "setITunesStorefront:", v8);
      ADSaveToPromotedContentKeychain((uint64_t)v8, CFSTR("APIDAccountsSettings.storefront"));
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("kADIDManager_ChangedNotification"), CFSTR("com.apple.AdLib"));

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storefront was found after forced bag fetch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdSettingsLogging"), v8, 16);
  }

}

- (void)setIsPersonalizedAdsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;

  v3 = a3;
  if (!-[ADCoreSettings isRestrictedByScreenTime](self, "isRestrictedByScreenTime"))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D46F18];
    v7 = objc_msgSend(v5, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x1E0D46F18]);

    if ((v7 & 1) == 0 && !-[ADCoreSettings isAccountRestricted](self, "isAccountRestricted"))
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBoolValue:forSetting:", v3, v6);

    }
  }
}

- (int)connectionType
{
  void *v2;
  int v3;

  +[ADNetworkController sharedNetworkController](ADNetworkController, "sharedNetworkController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkType");

  return v3;
}

- (NSString)localeIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)segmentRetrievalInterval
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;

  if (!MGGetBoolAnswer()
    || (+[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "stringForKey:", CFSTR("adprivacydSegmentIntervalOverride")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "integerValue"),
        v3,
        v2,
        v4 <= 0))
  {
    +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", CFSTR("adprivacydSegmentInterval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if (v7)
      return v7;
    else
      return 86400;
  }
  return v4;
}

- (void)setSegmentRetrievalInterval:(int)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setString:forKey:", v5, CFSTR("adprivacydSegmentInterval"));

}

- (int)maxSegmentSendInterval
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;

  if (!MGGetBoolAnswer()
    || (+[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "stringForKey:", CFSTR("adprivacydMaxSegmentSendIntervalOverride")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "integerValue"),
        v3,
        v2,
        v4 <= 0))
  {
    +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", CFSTR("adprivacydMaxSegmentSendInterval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if (v7)
      return v7;
    else
      return 259200;
  }
  return v4;
}

- (void)setMaxSegmentSendInterval:(int)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setString:forKey:", v5, CFSTR("adprivacydMaxSegmentSendInterval"));

}

- (BOOL)unitTesting
{
  if (unitTesting_onceToken != -1)
    dispatch_once(&unitTesting_onceToken, &__block_literal_global_192);
  return unitTesting_areWeUnitTesting;
}

void __29__ADCoreSettings_unitTesting__block_invoke()
{
  void *v0;
  id v1;

  if ((MGGetBoolAnswer() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "arguments");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    unitTesting_areWeUnitTesting = objc_msgSend(v0, "containsObject:", CFSTR("-ADUnitTestingScheme"));

  }
  else
  {
    unitTesting_areWeUnitTesting = 0;
  }
}

- (void)setDefaultServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_defaultServerURL, a3);
}

- (void)setDefaultConfigurationServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConfigurationServerURL, a3);
}

- (double)jingleTimeoutInterval
{
  return self->_jingleTimeoutInterval;
}

- (void)setJingleTimeoutInterval:(double)a3
{
  self->_jingleTimeoutInterval = a3;
}

- (void)setAdServerTimeoutInterval:(double)a3
{
  self->_adServerTimeoutInterval = a3;
}

- (double)NSURLConnectionTimeout
{
  return self->_NSURLConnectionTimeout;
}

- (void)setNSURLConnectionTimeout:(double)a3
{
  self->_NSURLConnectionTimeout = a3;
}

- (double)NSURLTransactionTimeout
{
  return self->_NSURLTransactionTimeout;
}

- (void)setNSURLTransactionTimeout:(double)a3
{
  self->_NSURLTransactionTimeout = a3;
}

- (void)setOsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_osIdentifier, a3);
}

- (void)setOsVersionAndBuild:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionAndBuild, a3);
}

- (void)setLongBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_longBuildVersion, a3);
}

- (void)setShortBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_shortBuildVersion, a3);
}

- (void)setShortModelType:(id)a3
{
  objc_storeStrong((id *)&self->_shortModelType, a3);
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (void)setConnectionType:(int)a3
{
  self->_connectionType = a3;
}

- (void)setTimezone:(float)a3
{
  self->_timezone = a3;
}

- (NSString)storefrontLocalizationLanguage
{
  return self->_storefrontLocalizationLanguage;
}

- (int)runState
{
  return self->_runState;
}

- (void)setRunState:(int)a3
{
  self->_runState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesStorefront, 0);
  objc_storeStrong((id *)&self->_storefrontLocalizationLanguage, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_shortModelType, 0);
  objc_storeStrong((id *)&self->_shortBuildVersion, 0);
  objc_storeStrong((id *)&self->_longBuildVersion, 0);
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_osIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultConfigurationServerURL, 0);
  objc_storeStrong((id *)&self->_defaultServerURL, 0);
}

@end
