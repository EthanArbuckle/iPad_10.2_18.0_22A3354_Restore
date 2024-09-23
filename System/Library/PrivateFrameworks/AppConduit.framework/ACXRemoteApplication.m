@implementation ACXRemoteApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)localizedInfoPlistKeysLoadAppOnly
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ACXRemoteApplication;
  objc_msgSendSuper2(&v6, sel_localizedInfoPlistKeysLoadAppOnly);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE88], *MEMORY[0x1E0C9AAC8], *MEMORY[0x1E0C9AAF0], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)localizedInfoPlistKeysLoadAnywhere
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ACXRemoteApplication;
  objc_msgSendSuper2(&v6, sel_localizedInfoPlistKeysLoadAnywhere);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("NSLocationAlwaysUsageDescription"), CFSTR("NSLocationWhenInUseUsageDescription"), CFSTR("NSLocationAlwaysAndWhenInUseUsageDescription"), CFSTR("NSHealthUpdateUsageDescription"), CFSTR("NSHealthShareUsageDescription"), CFSTR("NSHealthClinicalHealthRecordsShareUsageDescription"), CFSTR("NSHealthResearchStudyUsageDescription"), CFSTR("NSHealthCDARequestUsageDescription"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ACXRemoteApplication)initWithCoder:(id)a3
{
  id v4;
  ACXRemoteApplication *v5;
  ACXRemoteApplication *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *companionAppBundleID;
  uint64_t v11;
  NSString *watchKitVersion;
  uint64_t v13;
  NSString *teamID;
  uint64_t v15;
  NSString *complicationPrincipalClass;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *supportedComplicationFamilies;
  uint64_t v22;
  NSString *watchKitAppExtensionBundleID;
  uint64_t v24;
  NSString *bundleVersion;
  uint64_t v26;
  NSString *bundleShortVersion;
  uint64_t v28;
  NSString *minimumOSVersion;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *intentsRestrictedWhileLocked;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSArray *intentsSupported;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSDictionary *requiredCapabilities;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSArray *architectureSlices;
  uint64_t v51;
  NSString *watchKitAppExecutableHash;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSArray *userActivityTypes;
  uint64_t v58;
  MIStoreMetadata *storeMetadata;
  uint64_t v60;
  NSString *sdkVersion;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  NSArray *backgroundModes;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  NSArray *uiBackgroundModes;
  ACXRemoteApplication *v72;
  objc_super v74;
  objc_super v75;

  v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)ACXRemoteApplication;
  v5 = -[ACXSyncedApplication initWithCoder:](&v75, sel_initWithCoder_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_8;
  v74.receiver = v5;
  v74.super_class = (Class)ACXRemoteApplication;
  -[ACXSyncedApplication _rawApplicationName](&v74, sel__rawApplicationName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_15;
LABEL_14:
    MOLogWrite();
LABEL_15:
    v72 = 0;
    goto LABEL_16;
  }
  v6->_isBetaApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBetaApp"));
  v6->_isProfileValidated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isProfileValidated"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_applicationMode = objc_msgSend(v8, "unsignedIntegerValue");

  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("companionAppBundleID")))
    goto LABEL_10;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionAppBundleID"));
  v9 = objc_claimAutoreleasedReturnValue();
  companionAppBundleID = v6->_companionAppBundleID;
  v6->_companionAppBundleID = (NSString *)v9;

  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("watchKitVersion")) & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchKitVersion"));
  v11 = objc_claimAutoreleasedReturnValue();
  watchKitVersion = v6->_watchKitVersion;
  v6->_watchKitVersion = (NSString *)v11;

  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("teamID")) & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamID"));
  v13 = objc_claimAutoreleasedReturnValue();
  teamID = v6->_teamID;
  v6->_teamID = (NSString *)v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("complicationPrincipalClass"));
  v15 = objc_claimAutoreleasedReturnValue();
  complicationPrincipalClass = v6->_complicationPrincipalClass;
  v6->_complicationPrincipalClass = (NSString *)v15;

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("supportedComplicationFamilies"));
  v20 = objc_claimAutoreleasedReturnValue();
  supportedComplicationFamilies = v6->_supportedComplicationFamilies;
  v6->_supportedComplicationFamilies = (NSArray *)v20;

  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("watchKitAppExtensionBundleID")) & 1) == 0)
  {
LABEL_10:
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchKitAppExtensionBundleID"));
  v22 = objc_claimAutoreleasedReturnValue();
  watchKitAppExtensionBundleID = v6->_watchKitAppExtensionBundleID;
  v6->_watchKitAppExtensionBundleID = (NSString *)v22;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
  v24 = objc_claimAutoreleasedReturnValue();
  bundleVersion = v6->_bundleVersion;
  v6->_bundleVersion = (NSString *)v24;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleShortVersion"));
  v26 = objc_claimAutoreleasedReturnValue();
  bundleShortVersion = v6->_bundleShortVersion;
  v6->_bundleShortVersion = (NSString *)v26;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumOSVersion"));
  v28 = objc_claimAutoreleasedReturnValue();
  minimumOSVersion = v6->_minimumOSVersion;
  v6->_minimumOSVersion = (NSString *)v28;

  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("intentsRestrictedWhileLocked"));
  v33 = objc_claimAutoreleasedReturnValue();
  intentsRestrictedWhileLocked = v6->_intentsRestrictedWhileLocked;
  v6->_intentsRestrictedWhileLocked = (NSArray *)v33;

  v35 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("intentsSupported"));
  v38 = objc_claimAutoreleasedReturnValue();
  intentsSupported = v6->_intentsSupported;
  v6->_intentsSupported = (NSArray *)v38;

  v40 = (void *)MEMORY[0x1E0C99E60];
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  objc_msgSend(v40, "setWithObjects:", v41, v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("requiredCapabilities"));
  v44 = objc_claimAutoreleasedReturnValue();
  requiredCapabilities = v6->_requiredCapabilities;
  v6->_requiredCapabilities = (NSDictionary *)v44;

  v46 = (void *)MEMORY[0x1E0C99E60];
  v47 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("architectureSlices"));
  v49 = objc_claimAutoreleasedReturnValue();
  architectureSlices = v6->_architectureSlices;
  v6->_architectureSlices = (NSArray *)v49;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchKitAppExecutableHash"));
  v51 = objc_claimAutoreleasedReturnValue();
  watchKitAppExecutableHash = v6->_watchKitAppExecutableHash;
  v6->_watchKitAppExecutableHash = (NSString *)v51;

  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v55, CFSTR("userActivityTypes"));
  v56 = objc_claimAutoreleasedReturnValue();
  userActivityTypes = v6->_userActivityTypes;
  v6->_userActivityTypes = (NSArray *)v56;

  v6->_isLocallyAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLocallyAvailable"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeMetadata"));
  v58 = objc_claimAutoreleasedReturnValue();
  storeMetadata = v6->_storeMetadata;
  v6->_storeMetadata = (MIStoreMetadata *)v58;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdkVersion"));
  v60 = objc_claimAutoreleasedReturnValue();
  sdkVersion = v6->_sdkVersion;
  v6->_sdkVersion = (NSString *)v60;

  v62 = (void *)MEMORY[0x1E0C99E60];
  v63 = objc_opt_class();
  objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v64, CFSTR("backgroundModes"));
  v65 = objc_claimAutoreleasedReturnValue();
  backgroundModes = v6->_backgroundModes;
  v6->_backgroundModes = (NSArray *)v65;

  v67 = (void *)MEMORY[0x1E0C99E60];
  v68 = objc_opt_class();
  objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v69, CFSTR("uiBackgroundModes"));
  v70 = objc_claimAutoreleasedReturnValue();
  uiBackgroundModes = v6->_uiBackgroundModes;
  v6->_uiBackgroundModes = (NSArray *)v70;

LABEL_8:
  v72 = v6;
LABEL_16:

  return v72;
}

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACXRemoteApplication;
  return -[ACXSyncedApplication initForTesting](&v3, sel_initForTesting);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACXRemoteApplication;
  v4 = a3;
  -[ACXSyncedApplication encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBetaApp, CFSTR("isBetaApp"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isProfileValidated, CFSTR("isProfileValidated"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_applicationMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("applicationMode"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_companionAppBundleID, CFSTR("companionAppBundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_watchKitVersion, CFSTR("watchKitVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_teamID, CFSTR("teamID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_complicationPrincipalClass, CFSTR("complicationPrincipalClass"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedComplicationFamilies, CFSTR("supportedComplicationFamilies"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_watchKitAppExtensionBundleID, CFSTR("watchKitAppExtensionBundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleVersion, CFSTR("bundleVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleShortVersion, CFSTR("bundleShortVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_minimumOSVersion, CFSTR("minimumOSVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentsRestrictedWhileLocked, CFSTR("intentsRestrictedWhileLocked"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentsSupported, CFSTR("intentsSupported"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_requiredCapabilities, CFSTR("requiredCapabilities"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_architectureSlices, CFSTR("architectureSlices"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_watchKitAppExecutableHash, CFSTR("watchKitAppExecutableHash"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userActivityTypes, CFSTR("userActivityTypes"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isLocallyAvailable, CFSTR("isLocallyAvailable"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeMetadata, CFSTR("storeMetadata"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sdkVersion, CFSTR("sdkVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundModes, CFSTR("backgroundModes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uiBackgroundModes, CFSTR("uiBackgroundModes"));

}

- (ACXRemoteApplication)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACXRemoteApplication;
  return -[ACXSyncedApplication init](&v3, sel_init);
}

- (ACXRemoteApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v8;
  id v9;
  ACXRemoteApplication *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACXRemoteApplication;
  v10 = -[ACXSyncedApplication initWithApplicationRecord:databaseUUID:sequenceNumber:](&v13, sel_initWithApplicationRecord_databaseUUID_sequenceNumber_, v8, v9, a5);
  if (v10)
  {
    objc_msgSend(v8, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACXSyncedApplication setBundleIdentifier:](v10, "setBundleIdentifier:", v11);

    -[ACXSyncedApplication setDatabaseUUID:](v10, "setDatabaseUUID:", v9);
    -[ACXSyncedApplication setSequenceNumber:](v10, "setSequenceNumber:", a5);
    -[ACXSyncedApplication setSupportsAlwaysOnDisplay:](v10, "setSupportsAlwaysOnDisplay:", objc_msgSend(v8, "supportsAlwaysOnDisplay"));
    -[ACXSyncedApplication setDefaultsToPrivateAlwaysOnDisplayTreatment:](v10, "setDefaultsToPrivateAlwaysOnDisplayTreatment:", objc_msgSend(v8, "defaultsToPrivateAlwaysOnDisplayTreatment"));
    -[ACXSyncedApplication setIsEligibleForWatchAppInstall:](v10, "setIsEligibleForWatchAppInstall:", objc_msgSend(v8, "isEligibleForWatchAppInstall"));
  }

  return v10;
}

- (ACXRemoteApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACXRemoteApplication;
  return -[ACXSyncedApplication initWithBundleID:databaseUUID:sequenceNumber:](&v6, sel_initWithBundleID_databaseUUID_sequenceNumber_, a3, a4, a5);
}

- (ACXRemoteApplication)initWithSerializedDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  ACXRemoteApplication *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  MIStoreMetadata *v67;
  MIStoreMetadata *storeMetadata;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  objc_super v79;
  objc_super v80;

  v4 = a3;
  if (v4)
  {
    v80.receiver = self;
    v80.super_class = (Class)ACXRemoteApplication;
    self = -[ACXSyncedApplication initWithSerializedDictionary:](&v80, sel_initWithSerializedDictionary_, v4);

    if (!self)
    {
LABEL_124:
      self = self;
      v9 = self;
      goto LABEL_125;
    }
    v79.receiver = self;
    v79.super_class = (Class)ACXRemoteApplication;
    -[ACXSyncedApplication _rawApplicationName](&v79, sel__rawApplicationName);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WKBetaAppKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v7 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;

      if (v8)
        self->_isBetaApp = objc_msgSend(v8, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationMode"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v11 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;

      if (v12)
        self->_applicationMode = objc_msgSend(v12, "unsignedIntegerValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validatedByProfile"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v14 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;

      if (v15)
        self->_isProfileValidated = objc_msgSend(v15, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SPContainerAppBundleId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = v16;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;

      if (v18)
        objc_storeStrong((id *)&self->_companionAppBundleID, v18);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WKWatchKitVersion"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v20 = v19;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;

      if (v21)
        objc_storeStrong((id *)&self->_watchKitVersion, v21);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SPApplicationTeamID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v23 = v22;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;

      if (v24)
        objc_storeStrong((id *)&self->_teamID, v24);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CLKComplicationPrincipalClass"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v26 = v25;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;

      if (v27)
        objc_storeStrong((id *)&self->_complicationPrincipalClass, v27);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CLKComplicationSupportedFamilies"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v29 = v28;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;

      if (v30)
        objc_storeStrong((id *)&self->_supportedComplicationFamilies, v30);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SPPluginBundleIdKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v32 = v31;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v33 = v32;
      else
        v33 = 0;

      if (v33)
        objc_storeStrong((id *)&self->_watchKitAppExtensionBundleID, v33);

      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v35 = v34;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v36 = v35;
      else
        v36 = 0;

      if (v36)
        objc_storeStrong((id *)&self->_bundleVersion, v36);

      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAF0]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v38 = v37;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = v38;
      else
        v39 = 0;

      if (v39)
        objc_storeStrong((id *)&self->_bundleShortVersion, v39);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchKitAppSlices"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v41 = v40;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v42 = v41;
      else
        v42 = 0;

      if (v42)
        objc_storeStrong((id *)&self->_architectureSlices, v42);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumOSVersion"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v44 = v43;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v45 = v44;
      else
        v45 = 0;

      if (v45)
        objc_storeStrong((id *)&self->_minimumOSVersion, v45);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntentsRestrictedWhileLockedAgg"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v47 = v46;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v48 = v47;
      else
        v48 = 0;

      if (v48)
        objc_storeStrong((id *)&self->_intentsRestrictedWhileLocked, v48);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntentsSupportedAgg"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v50 = v49;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v51 = v50;
      else
        v51 = 0;

      if (v51)
        objc_storeStrong((id *)&self->_intentsSupported, v51);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIRequiredDeviceCapabilities"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v53 = v52;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v54 = v53;
      else
        v54 = 0;

      if (v54)
        objc_storeStrong((id *)&self->_requiredCapabilities, v54);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchKitAppExecutableHash"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v56 = v55;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v57 = v56;
      else
        v57 = 0;

      if (v57)
        objc_storeStrong((id *)&self->_watchKitAppExecutableHash, v57);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSUserActivityTypes"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v59 = v58;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v60 = v59;
      else
        v60 = 0;

      if (v60)
        objc_storeStrong((id *)&self->_userActivityTypes, v60);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLocallyAvailable"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v62 = v61;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v63 = v62;
      else
        v63 = 0;

      if (v63)
        self->_isLocallyAvailable = objc_msgSend(v63, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeMetadata"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v65 = v64;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v66 = v65;
      else
        v66 = 0;

      if (v66)
      {
        objc_msgSend(MEMORY[0x1E0D4E438], "metadataFromDictionary:", v66);
        v67 = (MIStoreMetadata *)objc_claimAutoreleasedReturnValue();
        storeMetadata = self->_storeMetadata;
        self->_storeMetadata = v67;

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACXSDKVersionKey"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v70 = v69;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v71 = v70;
      else
        v71 = 0;

      if (v71)
        objc_storeStrong((id *)&self->_sdkVersion, v71);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACXBackgroundModesKey"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v73 = v72;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v74 = v73;
      else
        v74 = 0;

      if (v74)
        objc_storeStrong((id *)&self->_backgroundModes, v74);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACXUIBackgroundModesKey"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v76 = v75;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v77 = v76;
      else
        v77 = 0;

      if (v77)
        objc_storeStrong((id *)&self->_uiBackgroundModes, v77);

      goto LABEL_124;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  v9 = 0;
LABEL_125:

  return v9;
}

- (id)serialize
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)ACXRemoteApplication;
  -[ACXSyncedApplication serialize](&v37, sel_serialize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ACXSyncedApplication bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C9AE78]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACXRemoteApplication isBetaApp](self, "isBetaApp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("WKBetaAppKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ACXRemoteApplication applicationMode](self, "applicationMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("applicationMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACXRemoteApplication isProfileValidated](self, "isProfileValidated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("validatedByProfile"));

  -[ACXRemoteApplication companionAppBundleID](self, "companionAppBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("SPContainerAppBundleId"));

  -[ACXRemoteApplication watchKitVersion](self, "watchKitVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("WKWatchKitVersion"));

  -[ACXRemoteApplication teamID](self, "teamID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("SPApplicationTeamID"));

  -[ACXRemoteApplication complicationPrincipalClass](self, "complicationPrincipalClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("CLKComplicationPrincipalClass"));

  -[ACXRemoteApplication supportedComplicationFamilies](self, "supportedComplicationFamilies");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("CLKComplicationSupportedFamilies"));

  -[ACXRemoteApplication watchKitAppExtensionBundleID](self, "watchKitAppExtensionBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ACXRemoteApplication watchKitAppExtensionBundleID](self, "watchKitAppExtensionBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("SPPluginBundleIdKey"));

  }
  -[ACXRemoteApplication bundleVersion](self, "bundleVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ACXRemoteApplication bundleVersion](self, "bundleVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C9AE90]);

  }
  -[ACXRemoteApplication bundleShortVersion](self, "bundleShortVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ACXRemoteApplication bundleShortVersion](self, "bundleShortVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0C9AAF0]);

  }
  -[ACXRemoteApplication minimumOSVersion](self, "minimumOSVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("MinimumOSVersion"));

  -[ACXRemoteApplication intentsRestrictedWhileLocked](self, "intentsRestrictedWhileLocked");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("IntentsRestrictedWhileLockedAgg"));

  -[ACXRemoteApplication intentsSupported](self, "intentsSupported");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("IntentsSupportedAgg"));

  -[ACXRemoteApplication requiredCapabilities](self, "requiredCapabilities");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("UIRequiredDeviceCapabilities"));

  -[ACXRemoteApplication architectureSlices](self, "architectureSlices");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("watchKitAppSlices"));

  -[ACXRemoteApplication watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("watchKitAppExecutableHash"));

  -[ACXRemoteApplication userActivityTypes](self, "userActivityTypes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("NSUserActivityTypes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACXRemoteApplication isLocallyAvailable](self, "isLocallyAvailable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("isLocallyAvailable"));

  -[ACXRemoteApplication storeMetadata](self, "storeMetadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryRepresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("storeMetadata"));

  -[ACXRemoteApplication sdkVersion](self, "sdkVersion");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("ACXSDKVersionKey"));

  -[ACXRemoteApplication backgroundModes](self, "backgroundModes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[ACXRemoteApplication backgroundModes](self, "backgroundModes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("ACXBackgroundModesKey"));

  }
  -[ACXRemoteApplication uiBackgroundModes](self, "uiBackgroundModes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[ACXRemoteApplication uiBackgroundModes](self, "uiBackgroundModes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("ACXUIBackgroundModesKey"));

  }
  v35 = (void *)objc_msgSend(v4, "copy");

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  _BYTE *v62;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)ACXRemoteApplication;
  v4 = -[ACXSyncedApplication copyWithZone:](&v64, sel_copyWithZone_, a3);
  if (v4)
  {
    v4[80] = -[ACXRemoteApplication isBetaApp](self, "isBetaApp");
    v4[81] = -[ACXRemoteApplication isProfileValidated](self, "isProfileValidated");
    *((_QWORD *)v4 + 11) = -[ACXRemoteApplication applicationMode](self, "applicationMode");
    -[ACXRemoteApplication companionAppBundleID](self, "companionAppBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)*((_QWORD *)v4 + 17);
    *((_QWORD *)v4 + 17) = v6;

    -[ACXRemoteApplication watchKitVersion](self, "watchKitVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = (void *)*((_QWORD *)v4 + 16);
    *((_QWORD *)v4 + 16) = v9;

    -[ACXRemoteApplication teamID](self, "teamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = (void *)*((_QWORD *)v4 + 20);
    *((_QWORD *)v4 + 20) = v12;

    -[ACXRemoteApplication complicationPrincipalClass](self, "complicationPrincipalClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    v16 = (void *)*((_QWORD *)v4 + 21);
    *((_QWORD *)v4 + 21) = v15;

    -[ACXRemoteApplication supportedComplicationFamilies](self, "supportedComplicationFamilies");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    v19 = (void *)*((_QWORD *)v4 + 22);
    *((_QWORD *)v4 + 22) = v18;

    -[ACXRemoteApplication watchKitAppExtensionBundleID](self, "watchKitAppExtensionBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    v22 = (void *)*((_QWORD *)v4 + 19);
    *((_QWORD *)v4 + 19) = v21;

    -[ACXRemoteApplication bundleVersion](self, "bundleVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    v25 = (void *)*((_QWORD *)v4 + 12);
    *((_QWORD *)v4 + 12) = v24;

    -[ACXRemoteApplication bundleShortVersion](self, "bundleShortVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    v28 = (void *)*((_QWORD *)v4 + 13);
    *((_QWORD *)v4 + 13) = v27;

    -[ACXRemoteApplication minimumOSVersion](self, "minimumOSVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    v31 = (void *)*((_QWORD *)v4 + 14);
    *((_QWORD *)v4 + 14) = v30;

    -[ACXRemoteApplication intentsRestrictedWhileLocked](self, "intentsRestrictedWhileLocked");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    v34 = (void *)*((_QWORD *)v4 + 23);
    *((_QWORD *)v4 + 23) = v33;

    -[ACXRemoteApplication intentsSupported](self, "intentsSupported");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    v37 = (void *)*((_QWORD *)v4 + 24);
    *((_QWORD *)v4 + 24) = v36;

    -[ACXRemoteApplication requiredCapabilities](self, "requiredCapabilities");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "copy");
    v40 = (void *)*((_QWORD *)v4 + 15);
    *((_QWORD *)v4 + 15) = v39;

    -[ACXRemoteApplication architectureSlices](self, "architectureSlices");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "copy");
    v43 = (void *)*((_QWORD *)v4 + 26);
    *((_QWORD *)v4 + 26) = v42;

    -[ACXRemoteApplication watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "copy");
    v46 = (void *)*((_QWORD *)v4 + 18);
    *((_QWORD *)v4 + 18) = v45;

    -[ACXRemoteApplication userActivityTypes](self, "userActivityTypes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "copy");
    v49 = (void *)*((_QWORD *)v4 + 25);
    *((_QWORD *)v4 + 25) = v48;

    v4[83] = -[ACXRemoteApplication isLocallyAvailable](self, "isLocallyAvailable");
    -[ACXRemoteApplication storeMetadata](self, "storeMetadata");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "copy");
    v52 = (void *)*((_QWORD *)v4 + 27);
    *((_QWORD *)v4 + 27) = v51;

    -[ACXRemoteApplication sdkVersion](self, "sdkVersion");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "copy");
    v55 = (void *)*((_QWORD *)v4 + 28);
    *((_QWORD *)v4 + 28) = v54;

    -[ACXRemoteApplication backgroundModes](self, "backgroundModes");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "copy");
    v58 = (void *)*((_QWORD *)v4 + 29);
    *((_QWORD *)v4 + 29) = v57;

    -[ACXRemoteApplication uiBackgroundModes](self, "uiBackgroundModes");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "copy");
    v61 = (void *)*((_QWORD *)v4 + 30);
    *((_QWORD *)v4 + 30) = v60;

    v62 = v4;
  }

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACXSyncedApplication bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@<%p> bundleID=%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isSystemApp
{
  return (-[ACXSyncedApplication applicationType](self, "applicationType") & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)hasComplication
{
  void *v2;
  BOOL v3;

  -[ACXRemoteApplication complicationPrincipalClass](self, "complicationPrincipalClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)counterpartIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  id v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[ACXRemoteApplication companionAppBundleID](self, "companionAppBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)ACXRemoteApplication;
  -[ACXSyncedApplication counterpartIdentifiers](&v11, sel_counterpartIdentifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    if ((objc_msgSend(v4, "containsObject:", v3) & 1) == 0)
    {
      objc_msgSend(v5, "arrayByAddingObject:", v3);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v4)
    v7 = 1;
  else
    v7 = v3 == 0;
  if (v7)
  {
LABEL_12:
    v8 = v5;
    goto LABEL_14;
  }
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v9 = v8;

  return v9;
}

- (BOOL)isCompatibleWithOSVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[ACXRemoteApplication minimumOSVersion](self, "minimumOSVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ACXRemoteApplication minimumOSVersion](self, "minimumOSVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "compare:options:", v6, 64) != -1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isRuntimeCompatibleWithOSVersion:(id)a3
{
  return 1;
}

- (BOOL)isCompatibleWithCPUType:(int)a3 subtype:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  int v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    -[ACXSyncedApplication bundleIdentifier](self, "bundleIdentifier");
    v20 = v5;
    v21 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  if (-[ACXSyncedApplication applicationType](self, "applicationType", v19, v20, v21) != 2)
    return 1;
  -[ACXRemoteApplication architectureSlices](self, "architectureSlices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 1;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ACXRemoteApplication architectureSlices](self, "architectureSlices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "intValue") == (_DWORD)v5)
        {
          v15 = 1;
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "intValue");

          if (v17 == (_DWORD)v4)
            goto LABEL_18;
        }
        else
        {

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)isTheSameAppAs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (!-[ACXRemoteApplication isProfileValidated](self, "isProfileValidated")
    && (objc_msgSend(v4, "isProfileValidated") & 1) == 0)
  {
    -[ACXSyncedApplication externalVersionIdentifier](self, "externalVersionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externalVersionIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v10;
    if (!v6 || !v10)
    {
      -[ACXRemoteApplication bundleVersion](self, "bundleVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACXRemoteApplication bundleShortVersion](self, "bundleShortVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleShortVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (ACXObjectsAreTheSameOrSameNullness(v12, v14) && ACXObjectsAreTheSameOrSameNullness(v13, v15))
      {

        v9 = 1;
      }
      else
      {

        v9 = 0;
      }
      goto LABEL_10;
    }
    v8 = objc_msgSend(v6, "isEqualToNumber:", v10);
LABEL_9:
    v9 = v8;
LABEL_10:

    goto LABEL_11;
  }
  -[ACXRemoteApplication watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ACXRemoteApplication watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchKitAppExecutableHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = ACXObjectsAreTheSameOrSameNullness(v6, v7);
    goto LABEL_9;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)applicationMode
{
  return self->_applicationMode;
}

- (void)setApplicationMode:(unint64_t)a3
{
  self->_applicationMode = a3;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)bundleShortVersion
{
  return self->_bundleShortVersion;
}

- (void)setBundleShortVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (void)setMinimumOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)watchKitVersion
{
  return self->_watchKitVersion;
}

- (void)setWatchKitVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)companionAppBundleID
{
  return self->_companionAppBundleID;
}

- (void)setCompanionAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)watchKitAppExecutableHash
{
  return self->_watchKitAppExecutableHash;
}

- (void)setWatchKitAppExecutableHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)watchKitAppExtensionBundleID
{
  return self->_watchKitAppExtensionBundleID;
}

- (void)setWatchKitAppExtensionBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (void)setIsBetaApp:(BOOL)a3
{
  self->_isBetaApp = a3;
}

- (BOOL)isProfileValidated
{
  return self->_isProfileValidated;
}

- (void)setIsProfileValidated:(BOOL)a3
{
  self->_isProfileValidated = a3;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)complicationPrincipalClass
{
  return self->_complicationPrincipalClass;
}

- (void)setComplicationPrincipalClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)supportedComplicationFamilies
{
  return self->_supportedComplicationFamilies;
}

- (void)setSupportedComplicationFamilies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)hasClockfaces
{
  return self->_hasClockfaces;
}

- (void)setHasClockfaces:(BOOL)a3
{
  self->_hasClockfaces = a3;
}

- (NSArray)intentsRestrictedWhileLocked
{
  return self->_intentsRestrictedWhileLocked;
}

- (void)setIntentsRestrictedWhileLocked:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)intentsSupported
{
  return self->_intentsSupported;
}

- (void)setIntentsSupported:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSArray)userActivityTypes
{
  return self->_userActivityTypes;
}

- (void)setUserActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)architectureSlices
{
  return self->_architectureSlices;
}

- (void)setArchitectureSlices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)isLocallyAvailable
{
  return self->_isLocallyAvailable;
}

- (void)setIsLocallyAvailable:(BOOL)a3
{
  self->_isLocallyAvailable = a3;
}

- (MIStoreMetadata)storeMetadata
{
  return self->_storeMetadata;
}

- (void)setStoreMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (void)setSdkVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)backgroundModes
{
  return self->_backgroundModes;
}

- (void)setBackgroundModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSArray)uiBackgroundModes
{
  return self->_uiBackgroundModes;
}

- (void)setUiBackgroundModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiBackgroundModes, 0);
  objc_storeStrong((id *)&self->_backgroundModes, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_architectureSlices, 0);
  objc_storeStrong((id *)&self->_userActivityTypes, 0);
  objc_storeStrong((id *)&self->_intentsSupported, 0);
  objc_storeStrong((id *)&self->_intentsRestrictedWhileLocked, 0);
  objc_storeStrong((id *)&self->_supportedComplicationFamilies, 0);
  objc_storeStrong((id *)&self->_complicationPrincipalClass, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_watchKitAppExtensionBundleID, 0);
  objc_storeStrong((id *)&self->_watchKitAppExecutableHash, 0);
  objc_storeStrong((id *)&self->_companionAppBundleID, 0);
  objc_storeStrong((id *)&self->_watchKitVersion, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
}

@end
