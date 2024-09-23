@implementation ACXSyncedApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)localizedInfoPlistKeysLoadAppOnly
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE88], *MEMORY[0x1E0C9AAC8], 0);
}

+ (id)localizedInfoPlistKeysLoadAnywhere
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

+ (id)localizedAppNameFromRecord:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "localizedName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "localizedShortName");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLByDeletingPathExtension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = objc_claimAutoreleasedReturnValue();

      if (v7)
        v4 = (__CFString *)v7;
      else
        v4 = CFSTR("Unknown Name");
    }
  }

  return v4;
}

- (ACXSyncedApplication)initWithCoder:(id)a3
{
  id v4;
  ACXSyncedApplication *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *counterpartIdentifiers;
  void *v16;
  uint64_t v17;
  NSString *applicationName;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDictionary *localizedInfoPlistStrings;
  uint64_t v24;
  NSNumber *externalVersionIdentifier;
  char v26;
  ACXSyncedApplication *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ACXSyncedApplication;
  v5 = -[ACXSyncedApplication init](&v29, sel_init);
  if (!v5)
  {
LABEL_15:
    v27 = v5;
    goto LABEL_16;
  }
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("bundleIdentifier")))
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("databaseUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_storeStrong((id *)&v5->_databaseUUID, v8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sequenceNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sequenceNumber = objc_msgSend(v10, "unsignedIntegerValue");

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("counterpartIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    counterpartIdentifiers = v5->_counterpartIdentifiers;
    v5->_counterpartIdentifiers = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_applicationType = objc_msgSend(v16, "unsignedIntegerValue");

    v5->_isDeletable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeletable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationName"));
    v17 = objc_claimAutoreleasedReturnValue();
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("localizedInfoPlistStrings"));
    v22 = objc_claimAutoreleasedReturnValue();
    localizedInfoPlistStrings = v5->_localizedInfoPlistStrings;
    v5->_localizedInfoPlistStrings = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalVersionIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v24;

    v5->_supportsAlwaysOnDisplay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsAlwaysOnDisplay"));
    v5->_defaultsToPrivateAlwaysOnDisplayTreatment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("defaultsToPrivateAlwaysOnDisplayTreatment"));
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("isEligibleForWatchAppInstall")) & 1) != 0)
      v26 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEligibleForWatchAppInstall"));
    else
      v26 = 1;
    v5->_isEligibleForWatchAppInstall = v26;

    goto LABEL_15;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
LABEL_11:
    MOLogWrite();
LABEL_12:
  v27 = 0;
LABEL_16:

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  void *v5;
  void *v6;
  id v7;

  bundleIdentifier = self->_bundleIdentifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_databaseUUID, CFSTR("databaseUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceNumber);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("sequenceNumber"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_counterpartIdentifiers, CFSTR("counterpartIdentifiers"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_applicationType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("applicationType"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_isDeletable, CFSTR("isDeletable"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_applicationName, CFSTR("applicationName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_localizedInfoPlistStrings, CFSTR("localizedInfoPlistStrings"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_externalVersionIdentifier, CFSTR("externalVersionIdentifier"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_supportsAlwaysOnDisplay, CFSTR("supportsAlwaysOnDisplay"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_defaultsToPrivateAlwaysOnDisplayTreatment, CFSTR("defaultsToPrivateAlwaysOnDisplayTreatment"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isEligibleForWatchAppInstall, CFSTR("isEligibleForWatchAppInstall"));

}

- (ACXSyncedApplication)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACXSyncedApplication;
  return -[ACXSyncedApplication init](&v3, sel_init);
}

- (ACXSyncedApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACXSyncedApplication;
  return -[ACXSyncedApplication init](&v6, sel_init, a3, a4, a5);
}

- (ACXSyncedApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v8;
  id v9;
  ACXSyncedApplication *v10;
  ACXSyncedApplication *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACXSyncedApplication;
  v10 = -[ACXSyncedApplication init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[ACXSyncedApplication setBundleIdentifier:](v10, "setBundleIdentifier:", v8);
    -[ACXSyncedApplication setDatabaseUUID:](v11, "setDatabaseUUID:", v9);
    -[ACXSyncedApplication setSequenceNumber:](v11, "setSequenceNumber:", a5);
  }

  return v11;
}

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACXSyncedApplication;
  return -[ACXSyncedApplication init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
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
  id v23;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[ACXSyncedApplication bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v6;

    -[ACXSyncedApplication databaseUUID](self, "databaseUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v9;

    *(_QWORD *)(v4 + 40) = -[ACXSyncedApplication sequenceNumber](self, "sequenceNumber");
    -[ACXSyncedApplication counterpartIdentifiers](self, "counterpartIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v12;

    *(_QWORD *)(v4 + 56) = -[ACXSyncedApplication applicationType](self, "applicationType");
    *(_BYTE *)(v4 + 8) = -[ACXSyncedApplication isDeletable](self, "isDeletable");
    -[ACXSyncedApplication applicationName](self, "applicationName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    v16 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v15;

    -[ACXSyncedApplication localizedInfoPlistStrings](self, "localizedInfoPlistStrings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    v19 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v18;

    -[ACXSyncedApplication externalVersionIdentifier](self, "externalVersionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    v22 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v21;

    *(_BYTE *)(v4 + 9) = -[ACXSyncedApplication supportsAlwaysOnDisplay](self, "supportsAlwaysOnDisplay");
    *(_BYTE *)(v4 + 10) = -[ACXSyncedApplication defaultsToPrivateAlwaysOnDisplayTreatment](self, "defaultsToPrivateAlwaysOnDisplayTreatment");
    *(_BYTE *)(v4 + 11) = -[ACXSyncedApplication isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall");
    v23 = (id)v4;
  }

  return (id)v4;
}

- (ACXSyncedApplication)initWithSerializedDictionary:(id)a3
{
  id v4;
  ACXSyncedApplication *v5;
  void *v6;
  id v7;
  NSString *v8;
  NSString *bundleIdentifier;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSUUID *databaseUUID;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  ACXSyncedApplication *v21;
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
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ACXSyncedApplication;
  v5 = -[ACXSyncedApplication init](&v47, sel_init);
  if (!v5)
  {
LABEL_69:
    v21 = v5;
    goto LABEL_70;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = (NSString *)v7;
  else
    v8 = 0;

  if (v8)
  {
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DBUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = v10;
    v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;

    if (v12)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
      if (!v13)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          MOLogWrite();

        goto LABEL_24;
      }
      databaseUUID = v5->_databaseUUID;
      v5->_databaseUUID = (NSUUID *)v13;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v16 = v15;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;

      if (v17)
      {
        v5->_sequenceNumber = objc_msgSend(v17, "unsignedIntegerValue");

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("counterpartIdentifiers"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v19 = v18;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;

        if (v20)
          objc_storeStrong((id *)&v5->_counterpartIdentifiers, v20);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationType"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v23 = v22;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 = v23;
        else
          v24 = 0;

        if (v24)
          v5->_applicationType = objc_msgSend(v24, "unsignedIntegerValue");

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDeletable"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v26 = v25;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v27 = v26;
        else
          v27 = 0;

        if (v27)
          v5->_isDeletable = objc_msgSend(v27, "BOOLValue");

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v29 = v28;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;

        if (v30)
          objc_storeStrong((id *)&v5->_applicationName, v30);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedInfoPlistStrings"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v32 = v31;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v33 = v32;
        else
          v33 = 0;

        if (v33)
          objc_storeStrong((id *)&v5->_localizedInfoPlistStrings, v33);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExternalVersionIdentifier"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v35 = v34;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v36 = v35;
        else
          v36 = 0;

        if (v36)
          objc_storeStrong((id *)&v5->_externalVersionIdentifier, v36);

        v5->_supportsAlwaysOnDisplay = 1;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACXSupportsAlwaysOnDisplayKey"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v38 = v37;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v39 = v38;
        else
          v39 = 0;

        if (v39)
          v5->_supportsAlwaysOnDisplay = objc_msgSend(v39, "BOOLValue");

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACXAppDefaultsToPrivateAlwaysOnDisplayTreatmentKey"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v41 = v40;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v42 = v41;
        else
          v42 = 0;

        if (v42)
          v5->_defaultsToPrivateAlwaysOnDisplayTreatment = objc_msgSend(v42, "BOOLValue");

        v5->_isEligibleForWatchAppInstall = 1;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACXIsEligibleForWatchAppInstallKey"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v44 = v43;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v45 = v44;
        else
          v45 = 0;

        if (v45)
          v5->_isEligibleForWatchAppInstall = objc_msgSend(v45, "BOOLValue");

        goto LABEL_69;
      }
    }
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
LABEL_24:
  v21 = 0;
LABEL_70:

  return v21;
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleIdentifier, *MEMORY[0x1E0C9AE78]);
  -[NSUUID UUIDString](self->_databaseUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DBUUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceNumber);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sequenceNumber"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_counterpartIdentifiers, CFSTR("counterpartIdentifiers"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_applicationType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("applicationType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeletable);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isDeletable"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_applicationName, CFSTR("n"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localizedInfoPlistStrings, CFSTR("localizedInfoPlistStrings"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_externalVersionIdentifier, CFSTR("ExternalVersionIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACXSyncedApplication supportsAlwaysOnDisplay](self, "supportsAlwaysOnDisplay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ACXSupportsAlwaysOnDisplayKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACXSyncedApplication defaultsToPrivateAlwaysOnDisplayTreatment](self, "defaultsToPrivateAlwaysOnDisplayTreatment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ACXAppDefaultsToPrivateAlwaysOnDisplayTreatmentKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACXSyncedApplication isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ACXIsEligibleForWatchAppInstallKey"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

+ (id)buildLocalizedInfoPlistStringsDictForAppBundleURL:(id)a3 watchKitExtensionURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "localizedInfoPlistKeysLoadAppOnly");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "localizedInfoPlistKeysLoadAnywhere");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    _FetchLocalizedKeys(v5, v7, v9);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "unionSet:", v9);
  if (v5)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v7, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minusSet:", v13);

  }
  objc_msgSend(v10, "unionSet:", v8);
  _FetchLocalizedKeys(v6, v7, v10);

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

- (id)localizedInfoPlistStringsForKeys:(id)a3 fetchingFirstMatchingLocalizationInList:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  const __CFArray *v13;
  CFArrayRef v14;
  const __CFArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  const __CFArray *v26;
  const __CFArray *v27;
  CFArrayRef v28;
  ACXSyncedApplication *v29;
  id obj;
  void *v31;
  const __CFArray *prefArray;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  prefArray = (const __CFArray *)a4;
  v31 = (void *)objc_opt_new();
  v29 = self;
  -[ACXSyncedApplication localizedInfoPlistStrings](self, "localizedInfoPlistStrings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v7)
  {
    v8 = v7;
    v33 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v34, "objectForKeyedSubscript:", v10, v25, v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "allKeys");
          v13 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
          v14 = CFBundleCopyLocalizationsForPreferences(v13, prefArray);
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            -[ACXSyncedApplication bundleIdentifier](v29, "bundleIdentifier");
            v27 = prefArray;
            v28 = v14;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v13;
            MOLogWrite();

          }
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v15 = v14;
          v16 = -[__CFArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v36;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v36 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v25, v26, v27, v28);
                v20 = objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  v22 = (void *)v20;
                  objc_msgSend(v31, "setObject:forKeyedSubscript:", v20, v10);

                  v21 = v15;
                  goto LABEL_21;
                }
              }
              v17 = -[__CFArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v17)
                continue;
              break;
            }
          }

          objc_msgSend(v12, "objectForKeyedSubscript:", &stru_1E9884358);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v21, v10);
LABEL_21:

          goto LABEL_25;
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          -[ACXSyncedApplication bundleIdentifier](v29, "bundleIdentifier");
          v13 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
          v25 = v10;
          v26 = v13;
          MOLogWrite();
LABEL_25:

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v8);
  }

  v23 = (void *)objc_msgSend(v31, "copy");
  return v23;
}

- (NSString)_rawApplicationName
{
  return self->_applicationName;
}

- (NSString)applicationName
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  NSString *applicationName;
  NSString *v11;

  v3 = *MEMORY[0x1E0C9AAC8];
  v4 = *MEMORY[0x1E0C9AE88];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE88], *MEMORY[0x1E0C9AAC8], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACXSyncedApplication localizedInfoPlistStringsForKeys:fetchingFirstMatchingLocalizationInList:](self, "localizedInfoPlistStringsForKeys:fetchingFirstMatchingLocalizationInList:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  applicationName = v7;
  if (!v7)
  {
    applicationName = (NSString *)v8;
    if (!v8)
      applicationName = self->_applicationName;
  }
  v11 = applicationName;

  return v11;
}

- (BOOL)isSystemApp
{
  return -[ACXSyncedApplication applicationType](self, "applicationType") == 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)databaseUUID
{
  return self->_databaseUUID;
}

- (void)setDatabaseUUID:(id)a3
{
  objc_storeStrong((id *)&self->_databaseUUID, a3);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (NSArray)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (void)setCounterpartIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(unint64_t)a3
{
  self->_applicationType = a3;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (void)setIsDeletable:(BOOL)a3
{
  self->_isDeletable = a3;
}

- (BOOL)supportsAlwaysOnDisplay
{
  return self->_supportsAlwaysOnDisplay;
}

- (void)setSupportsAlwaysOnDisplay:(BOOL)a3
{
  self->_supportsAlwaysOnDisplay = a3;
}

- (BOOL)defaultsToPrivateAlwaysOnDisplayTreatment
{
  return self->_defaultsToPrivateAlwaysOnDisplayTreatment;
}

- (void)setDefaultsToPrivateAlwaysOnDisplayTreatment:(BOOL)a3
{
  self->_defaultsToPrivateAlwaysOnDisplayTreatment = a3;
}

- (BOOL)isEligibleForWatchAppInstall
{
  return self->_isEligibleForWatchAppInstall;
}

- (void)setIsEligibleForWatchAppInstall:(BOOL)a3
{
  self->_isEligibleForWatchAppInstall = a3;
}

- (NSDictionary)localizedInfoPlistStrings
{
  return self->_localizedInfoPlistStrings;
}

- (void)setLocalizedInfoPlistStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_externalVersionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedInfoPlistStrings, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
