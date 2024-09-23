@implementation ACXApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACXApplication)initWithCoder:(id)a3
{
  id v4;
  ACXApplication *v5;
  void *v6;
  uint64_t v7;
  NSURL *watchAppURL;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *clockFaceExtensionPaths;
  void *v15;
  uint64_t v16;
  NSURL *companionAppURL;
  uint64_t v18;
  NSString *sourceAppIdentifier;
  uint64_t v20;
  NSString *companionAppName;
  void *v22;
  uint64_t v23;
  ACXApplicationStatus *deviceStatus;
  ACXApplication *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ACXApplication;
  v5 = -[ACXRemoteApplication initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_6;
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("watchAppURL")))
    goto LABEL_8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchAppURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  watchAppURL = v5->_watchAppURL;
  v5->_watchAppURL = (NSURL *)v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lsSequenceNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_lsSequenceNumber = objc_msgSend(v9, "unsignedIntegerValue");

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("clockFaceExtensionPaths"));
  v13 = objc_claimAutoreleasedReturnValue();
  clockFaceExtensionPaths = v5->_clockFaceExtensionPaths;
  v5->_clockFaceExtensionPaths = (NSArray *)v13;

  v5->_isTrusted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTrusted"));
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("companionAppURL")) & 1) == 0)
  {
LABEL_8:
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_10;
LABEL_9:
    MOLogWrite();
LABEL_10:
    v25 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionAppURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  companionAppURL = v5->_companionAppURL;
  v5->_companionAppURL = (NSURL *)v16;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAppIdentifier"));
  v18 = objc_claimAutoreleasedReturnValue();
  sourceAppIdentifier = v5->_sourceAppIdentifier;
  v5->_sourceAppIdentifier = (NSString *)v18;

  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("companionAppName")) & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionAppName"));
  v20 = objc_claimAutoreleasedReturnValue();
  companionAppName = v5->_companionAppName;
  v5->_companionAppName = (NSString *)v20;

  v5->_isPurchasedReDownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPurchasedReDownload"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoInstallOverride"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_autoInstallOverride = objc_msgSend(v22, "unsignedIntegerValue");

  v5->_isEmbeddedPlaceholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmbeddedPlaceholder"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceStatus"));
  v23 = objc_claimAutoreleasedReturnValue();
  deviceStatus = v5->_deviceStatus;
  v5->_deviceStatus = (ACXApplicationStatus *)v23;

LABEL_6:
  v25 = v5;
LABEL_11:

  return v25;
}

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACXApplication;
  return -[ACXRemoteApplication initForTesting](&v3, sel_initForTesting);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACXApplication;
  v4 = a3;
  -[ACXRemoteApplication encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[NSURL absoluteString](self->_watchAppURL, "absoluteString", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("watchAppURL"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lsSequenceNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lsSequenceNumber"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_clockFaceExtensionPaths, CFSTR("clockFaceExtensionPaths"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isTrusted, CFSTR("isTrusted"));
  -[NSURL absoluteString](self->_companionAppURL, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("companionAppURL"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceAppIdentifier, CFSTR("sourceAppIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_companionAppName, CFSTR("companionAppName"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isPurchasedReDownload, CFSTR("isPurchasedReDownload"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_autoInstallOverride);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("autoInstallOverride"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_isEmbeddedPlaceholder, CFSTR("isEmbeddedPlaceholder"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceStatus, CFSTR("deviceStatus"));

}

- (ACXApplication)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACXApplication;
  return -[ACXRemoteApplication init](&v3, sel_init);
}

- (ACXApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACXApplication;
  return -[ACXRemoteApplication initWithBundleID:databaseUUID:sequenceNumber:](&v6, sel_initWithBundleID_databaseUUID_sequenceNumber_, a3, a4, a5);
}

- (ACXApplication)initWithSerializedDictionary:(id)a3
{
  return -[ACXApplication initWithSerializedDictionary:reevaluatingTrust:](self, "initWithSerializedDictionary:reevaluatingTrust:", a3, 0);
}

- (ACXApplication)initWithSerializedDictionary:(id)a3 reevaluatingTrust:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ACXApplication *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSURL *watchAppURL;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSURL *companionAppURL;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  NSString *v31;
  NSString *companionAppName;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  ACXApplication *v40;
  objc_super v42;

  v4 = a4;
  v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ACXApplication;
  v7 = -[ACXRemoteApplication initWithSerializedDictionary:](&v42, sel_initWithSerializedDictionary_, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LSSequenceNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (!v10)
      goto LABEL_60;
    v7->_lsSequenceNumber = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("watchAppURLString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_15;
    }
    else if (!-[ACXRemoteApplication isSystemApp](v7, "isSystemApp"))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_37;
LABEL_36:
      MOLogWrite();
LABEL_37:

LABEL_63:
      v40 = 0;
      goto LABEL_64;
    }
    if (!-[ACXRemoteApplication isSystemApp](v7, "isSystemApp"))
      goto LABEL_34;
    v14 = 0;
LABEL_15:
    watchAppURL = v7->_watchAppURL;
    v7->_watchAppURL = (NSURL *)v14;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ACXClockfaceExtensionPaths"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    if (v18)
      objc_storeStrong((id *)&v7->_clockFaceExtensionPaths, v18);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isTrusted"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    if (!v21)
      goto LABEL_60;
    v7->_isTrusted = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("companionAppURLString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v23;
    else
      v13 = 0;

    if (!v13)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_63;
LABEL_62:
      MOLogWrite();
      goto LABEL_63;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      companionAppURL = v7->_companionAppURL;
      v7->_companionAppURL = (NSURL *)v24;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceAppIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v27 = v26;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;

      if (v28)
        objc_storeStrong((id *)&v7->_sourceAppIdentifier, v28);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("companionAppName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v30 = v29;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = (NSString *)v30;
      else
        v31 = 0;

      if (v31)
      {
        companionAppName = v7->_companionAppName;
        v7->_companionAppName = v31;

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPurchaseReDownload"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v34 = v33;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v34;
        else
          v35 = 0;

        if (v35)
        {
          v7->_isPurchasedReDownload = objc_msgSend(v35, "BOOLValue");
        }
        else if (!-[ACXRemoteApplication isSystemApp](v7, "isSystemApp"))
        {
          goto LABEL_60;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autoInstallOverride"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        _ACXValidateObject(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          v7->_autoInstallOverride = objc_msgSend(v37, "unsignedIntegerValue");

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        _ACXValidateObject(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          v7->_isEmbeddedPlaceholder = objc_msgSend(v39, "BOOLValue");

          if (v4)
            -[ACXApplication _evaluateTrustInfoForReevaluation:](v7, "_evaluateTrustInfoForReevaluation:", 1);
          goto LABEL_59;
        }
      }
LABEL_60:
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_63;
      goto LABEL_62;
    }
LABEL_34:
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_59:
  v40 = v7;
LABEL_64:

  return v40;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ACXApplication;
  -[ACXRemoteApplication serialize](&v19, sel_serialize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ACXApplication watchAppURL](self, "watchAppURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("watchAppURLString"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ACXApplication lsSequenceNumber](self, "lsSequenceNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("LSSequenceNumber"));

  -[ACXApplication clockFaceExtensionPaths](self, "clockFaceExtensionPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("ACXClockfaceExtensionPaths"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACXApplication isTrusted](self, "isTrusted"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("isTrusted"));

  -[ACXApplication companionAppURL](self, "companionAppURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("companionAppURLString"));

  -[ACXApplication sourceAppIdentifier](self, "sourceAppIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("sourceAppIdentifier"));

  -[ACXApplication companionAppName](self, "companionAppName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("companionAppName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACXApplication isPurchasedReDownload](self, "isPurchasedReDownload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("isPurchaseReDownload"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ACXApplication autoInstallOverride](self, "autoInstallOverride"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("autoInstallOverride"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACXApplication isEmbeddedPlaceholder](self, "isEmbeddedPlaceholder"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("isPlaceholder"));

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

- (id)serializeAsRemoteApplication
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACXApplication;
  -[ACXRemoteApplication serialize](&v3, sel_serialize);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
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
  _QWORD *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ACXApplication;
  v4 = -[ACXRemoteApplication copyWithZone:](&v25, sel_copyWithZone_, a3);
  if (v4)
  {
    -[ACXApplication watchAppURL](self, "watchAppURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)v4[32];
    v4[32] = v6;

    v4[33] = -[ACXApplication lsSequenceNumber](self, "lsSequenceNumber");
    -[ACXApplication clockFaceExtensionPaths](self, "clockFaceExtensionPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = (void *)v4[34];
    v4[34] = v9;

    *((_BYTE *)v4 + 248) = -[ACXApplication isTrusted](self, "isTrusted");
    -[ACXApplication companionAppURL](self, "companionAppURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = (void *)v4[35];
    v4[35] = v12;

    -[ACXApplication sourceAppIdentifier](self, "sourceAppIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    v16 = (void *)v4[37];
    v4[37] = v15;

    -[ACXApplication companionAppName](self, "companionAppName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    v19 = (void *)v4[36];
    v4[36] = v18;

    *((_BYTE *)v4 + 249) = -[ACXApplication isPurchasedReDownload](self, "isPurchasedReDownload");
    v4[39] = -[ACXApplication autoInstallOverride](self, "autoInstallOverride");
    *((_BYTE *)v4 + 250) = -[ACXApplication isEmbeddedPlaceholder](self, "isEmbeddedPlaceholder");
    -[ACXApplication deviceStatus](self, "deviceStatus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    v22 = (void *)v4[38];
    v4[38] = v21;

    v23 = v4;
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
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACXSyncedApplication bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACXApplication watchAppURL](self, "watchAppURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@<%p> bundleID=%@ path=%@>"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isLocallyAvailable
{
  return 1;
}

- (id)_parseArchitectureSlicesForWatchKitAppExecutableURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  id v15;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v5 = objc_retainAutorelease(v3);
    v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __70__ACXApplication__parseArchitectureSlicesForWatchKitAppExecutableURL___block_invoke;
    v14 = &unk_1E98831F0;
    v7 = v4;
    v15 = v7;
    if ((parse_macho_iterate_slices(v6, (uint64_t)&v11) & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v10 = v5;
      MOLogWrite();
    }
    v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __70__ACXApplication__parseArchitectureSlicesForWatchKitAppExecutableURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = *(unsigned int *)(a3 + 4);
  v4 = *(unsigned int *)(a3 + 8);
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    v11 = *(unsigned int *)(a3 + 4);
    v12 = *(unsigned int *)(a3 + 8);
    MOLogWrite();
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  return 1;
}

- (void)_populateStoreMetadata
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (-[ACXSyncedApplication isDeletable](self, "isDeletable")
    || -[ACXSyncedApplication applicationType](self, "applicationType") == 2)
  {
    v11 = 0;
    -[ACXApplication _storeMetadataWithError:](self, "_storeMetadataWithError:", &v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v11;
    v5 = v4;
    if (v3)
    {
      -[ACXRemoteApplication setStoreMetadata:](self, "setStoreMetadata:", v3);
LABEL_13:

      return;
    }
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == 260)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[ACXSyncedApplication bundleIdentifier](self, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    goto LABEL_12;
  }
}

+ (id)gizmoApplicationsFromCompanionAppRecord:(id)a3 databaseUUID:(id)a4 startingSequenceNumber:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v7, "counterpartIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = v11;
      obj = v11;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        while (2)
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(obj);
            v16 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithApplicationRecord:gizmoBundleIdentifier:databaseUUID:sequenceNumber:", v7, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15), v8, a5 + v15);
            if (!v16)
            {

              v18 = 0;
              v11 = v20;
              goto LABEL_21;
            }
            v17 = (void *)v16;
            objc_msgSend(v9, "addObject:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          a5 += v15;
          if (v13)
            continue;
          break;
        }
      }

      v11 = v20;
    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithApplicationRecord:gizmoBundleIdentifier:databaseUUID:sequenceNumber:", v7, 0, v8, a5);
      if (!v18)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v9, "addObject:", v18);

    }
    v18 = (void *)objc_msgSend(v9, "copy", v20);
    goto LABEL_21;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v18 = 0;
LABEL_22:

  return v18;
}

- (ACXApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  return -[ACXApplication initWithApplicationRecord:gizmoBundleIdentifier:databaseUUID:sequenceNumber:](self, "initWithApplicationRecord:gizmoBundleIdentifier:databaseUUID:sequenceNumber:", a3, 0, a4, a5);
}

- (ACXApplication)initWithApplicationRecord:(id)a3 gizmoBundleIdentifier:(id)a4 databaseUUID:(id)a5 sequenceNumber:(unint64_t)a6
{
  id v9;
  ACXApplication *v10;
  void *v11;
  char v12;
  uint64_t v13;
  ACXApplication *v14;
  void *v15;
  uint64_t v16;
  NSString *sourceAppIdentifier;
  uint64_t v18;
  NSURL *companionAppURL;
  uint64_t v20;
  NSString *companionAppName;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  char v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  void *v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t k;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _BOOL4 v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t m;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  NSArray *clockFaceExtensionPaths;
  void *v123;
  BOOL v124;
  void *v125;
  void *v126;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  id v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  id obj;
  void *v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  void *v160;
  uint64_t v161;
  void *v162;
  id v163;
  id v164;
  void *v165;
  void *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _QWORD v179[5];
  uint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  char v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  uint64_t v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  BOOL v197;
  objc_super v198;
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v164 = a4;
  v198.receiver = self;
  v198.super_class = (Class)ACXApplication;
  v165 = v9;
  v163 = a5;
  v10 = -[ACXRemoteApplication initWithApplicationRecord:databaseUUID:sequenceNumber:](&v198, sel_initWithApplicationRecord_databaseUUID_sequenceNumber_, v9);

  if (!v10)
    goto LABEL_259;
  if (v9)
  {
    if (objc_msgSend(v9, "isPlaceholder"))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_30;
      goto LABEL_6;
    }
    objc_msgSend(v9, "bundleIdentifier");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isInstalled");

    if ((v12 & 1) == 0)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();

      goto LABEL_30;
    }
    objc_msgSend(v9, "compatibilityObject");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v154, "compatibilityState"))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_29;
      goto LABEL_28;
    }
    if ((objc_msgSend(v9, "ACX_shouldBeTrackedByAppConduit") & 1) != 0)
    {
      if (v160)
      {
        objc_msgSend(v9, "typeForInstallMachinery");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v152, "isEqualToString:", *MEMORY[0x1E0CA5830]) & 1) != 0)
        {
          v13 = 2;
        }
        else
        {
          if ((objc_msgSend(v152, "isEqualToString:", *MEMORY[0x1E0CA5820]) & 1) == 0)
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              goto LABEL_257;
            goto LABEL_78;
          }
          v13 = 1;
        }
        -[ACXSyncedApplication setApplicationType:](v10, "setApplicationType:", v13);
        -[ACXRemoteApplication setIsProfileValidated:](v10, "setIsProfileValidated:", objc_msgSend(v9, "isProfileValidated"));
        -[ACXRemoteApplication setCompanionAppBundleID:](v10, "setCompanionAppBundleID:", v160);
        -[ACXRemoteApplication setIsBetaApp:](v10, "setIsBetaApp:", objc_msgSend(v9, "isBeta"));
        -[ACXSyncedApplication setIsDeletable:](v10, "setIsDeletable:", objc_msgSend(v9, "isDeletable"));
        objc_msgSend(v9, "iTunesMetadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sourceApp");
        v16 = objc_claimAutoreleasedReturnValue();
        sourceAppIdentifier = v10->_sourceAppIdentifier;
        v10->_sourceAppIdentifier = (NSString *)v16;

        objc_msgSend(v9, "URL");
        v18 = objc_claimAutoreleasedReturnValue();
        companionAppURL = v10->_companionAppURL;
        v10->_companionAppURL = (NSURL *)v18;

        if (!v10->_companionAppURL)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            goto LABEL_257;
          goto LABEL_78;
        }
        objc_msgSend((id)objc_opt_class(), "localizedAppNameFromRecord:", v9);
        v20 = objc_claimAutoreleasedReturnValue();
        companionAppName = v10->_companionAppName;
        v10->_companionAppName = (NSString *)v20;

        if (!v10->_companionAppName)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            goto LABEL_257;
          goto LABEL_78;
        }
        v10->_lsSequenceNumber = objc_msgSend(v9, "sequenceNumber");
        if (-[ACXRemoteApplication isSystemApp](v10, "isSystemApp"))
        {
          if (v164 && objc_msgSend(v164, "length"))
          {
            -[ACXSyncedApplication setBundleIdentifier:](v10, "setBundleIdentifier:", v164);
            objc_msgSend(v9, "counterpartIdentifiers");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v22, "containsObject:", v164) & 1) != 0)
            {
              -[ACXApplication setIsTrusted:](v10, "setIsTrusted:", 1);
              objc_msgSend((id)objc_opt_class(), "localizedAppNameFromRecord:", v9);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[ACXSyncedApplication setApplicationName:](v10, "setApplicationName:", v23);

              objc_msgSend(v9, "ACX_watchKitAppExtensionBundleID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                -[ACXRemoteApplication setWatchKitAppExtensionBundleID:](v10, "setWatchKitAppExtensionBundleID:", v24);
                -[ACXRemoteApplication setWatchKitVersion:](v10, "setWatchKitVersion:", CFSTR("2.0"));
                -[ACXRemoteApplication setTeamID:](v10, "setTeamID:", &stru_1E9884358);
              }
              -[ACXRemoteApplication setApplicationMode:](v10, "setApplicationMode:", 0);

              goto LABEL_258;
            }
            objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              MOLogWrite();

            goto LABEL_257;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            goto LABEL_257;
LABEL_78:
          MOLogWrite();
          goto LABEL_257;
        }
        v197 = 0;
        -[ACXApplication _mostCurrentWKAppURLInCompanionAppRecord:isPlaceholder:](v10, "_mostCurrentWKAppURLInCompanionAppRecord:isPlaceholder:", v9, &v197);
        v149 = (id)objc_claimAutoreleasedReturnValue();
        if (!v149)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            MOLogWrite();
          goto LABEL_257;
        }
        v10->_isEmbeddedPlaceholder = v197;
        -[ACXApplication _URLsOfExtensionsInBundleURL:mayNotExist:](v10, "_URLsOfExtensionsInBundleURL:mayNotExist:", v149, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = (void *)objc_opt_new();
        v195 = 0u;
        v196 = 0u;
        v193 = 0u;
        v194 = 0u;
        obj = v25;
        v161 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
        if (v161)
        {
          v26 = 0;
          v157 = *(id *)v194;
          do
          {
            for (i = 0; i != v161; ++i)
            {
              if (*(id *)v194 != v157)
                objc_enumerationMutation(obj);
              v28 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * i);
              -[ACXApplication _infoPlistForPluginBundle:](v10, "_infoPlistForPluginBundle:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v29, v28);
                objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("NSExtension"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.watchkit")))
                {
                  -[ACXApplication _URLsOfExtensionsInBundleURL:mayNotExist:](v10, "_URLsOfExtensionsInBundleURL:mayNotExist:", v28, 1);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v155 = v32;
                  v33 = v32;
                  if (v32)
                  {
                    v34 = objc_msgSend(v32, "count");
                    v33 = v155;
                    if (v34)
                    {
                      v191 = 0u;
                      v192 = 0u;
                      v189 = 0u;
                      v190 = 0u;
                      v35 = v155;
                      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v189, v203, 16);
                      if (v36)
                      {
                        v37 = *(_QWORD *)v190;
                        do
                        {
                          for (j = 0; j != v36; ++j)
                          {
                            if (*(_QWORD *)v190 != v37)
                              objc_enumerationMutation(v35);
                            v39 = *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * j);
                            -[ACXApplication _infoPlistForPluginBundle:](v10, "_infoPlistForPluginBundle:", v39);
                            v40 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v40)
                              objc_msgSend(v166, "setObject:forKeyedSubscript:", v40, v39);

                          }
                          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v189, v203, 16);
                        }
                        while (v36);
                      }

                      v33 = v155;
                    }
                  }

                  v26 = 1;
                }

              }
            }
            v161 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
          }
          while (v161);
        }
        else
        {
          v26 = 0;
        }

        v41 = *MEMORY[0x1E0C9AE90];
        v42 = *MEMORY[0x1E0C9AAF0];
        v146 = *MEMORY[0x1E0C9AE78];
        v158 = (id)*MEMORY[0x1E0C9AE70];
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE90], *MEMORY[0x1E0C9AAF0], *MEMORY[0x1E0C9AAC8], *MEMORY[0x1E0C9AE88], *MEMORY[0x1E0C9AE70], CFSTR("MinimumOSVersion"), CFSTR("UIRequiredDeviceCapabilities"), CFSTR("NSUserActivityTypes"), CFSTR("WKRunsIndependentlyOfCompanionApp"), CFSTR("WKApplication"), 0);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        ACXLoadInfoPlist(v149, v145);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = v43;
        if (v43)
        {
          if (objc_msgSend(v43, "count"))
          {
            objc_msgSend(v148, "objectForKeyedSubscript:", v146);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            _ACXValidateObject(v44);
            v144 = (void *)objc_claimAutoreleasedReturnValue();

            if (v144)
            {
              objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("WKApplication"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = ACXBooleanValue(v45, 0);

              if (((v46 | v26) & 1) != 0)
              {
                -[ACXSyncedApplication setBundleIdentifier:](v10, "setBundleIdentifier:", v144);
                objc_msgSend(v148, "objectForKeyedSubscript:", v41);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                _ACXValidateObject(v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[ACXRemoteApplication setBundleVersion:](v10, "setBundleVersion:", v48);

                objc_msgSend(v148, "objectForKeyedSubscript:", v42);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                _ACXValidateObject(v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[ACXRemoteApplication setBundleShortVersion:](v10, "setBundleShortVersion:", v50);

                -[ACXApplication _watchKitApplicationNameFromWKAppInfoPlist:containerRecord:](v10, "_watchKitApplicationNameFromWKAppInfoPlist:containerRecord:", v148, v165);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                -[ACXSyncedApplication setApplicationName:](v10, "setApplicationName:", v51);

                -[ACXApplication _evaluateTrustInfoForReevaluation:](v10, "_evaluateTrustInfoForReevaluation:", 0);
                v188 = 0;
                MobileInstallationCopyAppMetadata();
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                v140 = 0;
                if (v138)
                {
                  if (!v197)
                  {
                    objc_msgSend(v138, "watchKitAppExecutableHash");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ACXRemoteApplication setWatchKitAppExecutableHash:](v10, "setWatchKitAppExecutableHash:", v52);

                  }
                  v10->_autoInstallOverride = objc_msgSend(v138, "autoInstallOverride");
                }
                else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                {
                  v128 = v160;
                  v134 = v140;
                  MOLogWrite();
                }
                objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("MinimumOSVersion"), v128, v134);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                _ACXValidateObject(v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                -[ACXRemoteApplication setMinimumOSVersion:](v10, "setMinimumOSVersion:", v56);

                objc_msgSend(v165, "iTunesMetadata");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v10->_isPurchasedReDownload = objc_msgSend(v57, "isPurchasedRedownload");

                objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("UIRequiredDeviceCapabilities"));
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v137)
                {
LABEL_130:
                  -[ACXRemoteApplication setWatchKitVersion:](v10, "setWatchKitVersion:", CFSTR("2.0"));
                  objc_msgSend(v165, "teamIdentifier");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ACXRemoteApplication setTeamID:](v10, "setTeamID:", v66);

                  -[ACXRemoteApplication teamID](v10, "teamID");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v67
                    || (-[ACXRemoteApplication teamID](v10, "teamID"),
                        v68 = (void *)objc_claimAutoreleasedReturnValue(),
                        v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("0000000000")),
                        v68,
                        v67,
                        v69))
                  {
                    -[ACXRemoteApplication setTeamID:](v10, "setTeamID:", &stru_1E9884358);
                  }
                  objc_storeStrong((id *)&v10->_watchAppURL, v149);
                  if (v197)
                    goto LABEL_141;
                  objc_msgSend(v148, "objectForKeyedSubscript:", v158);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  _ACXValidateObject(v70);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v71)
                  {
                    objc_msgSend(v149, "URLByAppendingPathComponent:isDirectory:", v71, 0);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ACXApplication _parseArchitectureSlicesForWatchKitAppExecutableURL:](v10, "_parseArchitectureSlicesForWatchKitAppExecutableURL:", v72);
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ACXRemoteApplication setArchitectureSlices:](v10, "setArchitectureSlices:", v73);

                  }
                  else
                  {
                    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      goto LABEL_140;
                    objc_msgSend(v149, "path");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v129 = v72;
                    MOLogWrite();
                  }

LABEL_140:
LABEL_141:
                  objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("NSUserActivityTypes"), v129);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  _ACXValidateObject(v74);
                  v139 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v139)
                  {
                    objc_opt_class();
                    if (ACXArrayContainsOnlyClass(v139))
                    {
                      -[ACXRemoteApplication setUserActivityTypes:](v10, "setUserActivityTypes:", v139);
                    }
                    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                    {
                      objc_msgSend(v149, "path");
                      v130 = (void *)objc_claimAutoreleasedReturnValue();
                      MOLogWrite();

                    }
                  }
                  objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("WKRunsIndependentlyOfCompanionApp"), v130);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  _ACXValidateObject(v75);
                  v136 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v136 && (objc_msgSend(v136, "BOOLValue") & 1) != 0)
                    v76 = 2;
                  else
                    v76 = 1;
                  -[ACXRemoteApplication setApplicationMode:](v10, "setApplicationMode:", v76);
                  v141 = (void *)objc_opt_new();
                  v177 = 0u;
                  v178 = 0u;
                  v175 = 0u;
                  v176 = 0u;
                  v156 = v166;
                  v151 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v175, v201, 16);
                  if (v151)
                  {
                    v147 = 0;
                    v150 = *(_QWORD *)v176;
LABEL_153:
                    v77 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v176 != v150)
                        objc_enumerationMutation(v156);
                      v78 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * v77);
                      objc_msgSend(v156, "objectForKeyedSubscript:", v78, v131);
                      v162 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v162, "objectForKeyedSubscript:", CFSTR("NSExtension"));
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      _ACXValidateObject(v79);
                      v80 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v80)
                        break;
                      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        goto LABEL_195;
                      objc_msgSend(v78, "path");
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      v131 = v80;
                      MOLogWrite();
LABEL_194:

LABEL_195:
                      if (++v77 == v151)
                      {
                        v120 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v175, v201, 16);
                        v151 = v120;
                        if (v120)
                          goto LABEL_153;
                        goto LABEL_249;
                      }
                    }
                    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    _ACXValidateObject(v81);
                    v159 = (id)objc_claimAutoreleasedReturnValue();

                    v82 = v159;
                    if (v159)
                    {
                      if (objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.watchkit")))
                      {
                        v83 = v78;

                        objc_msgSend(v162, "objectForKeyedSubscript:", CFSTR("CLKComplicationPrincipalClass"));
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v84)
                        {
                          objc_opt_class();
                          _ACXValidateObject(v84);
                          v85 = (void *)objc_claimAutoreleasedReturnValue();
                          v86 = v85 == 0;

                          if (v86)
                          {
                            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                            {
                              v131 = v160;
                              v135 = v84;
                              MOLogWrite();
                            }

                            v84 = 0;
                          }
                        }
                        objc_msgSend(v162, "objectForKeyedSubscript:", CFSTR("CLKComplicationSupportedFamilies"), v131, v135);
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v87)
                        {
                          objc_opt_class();
                          _ACXValidateObject(v87);
                          v88 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v88
                            || (objc_opt_class(), v89 = ACXArrayContainsOnlyClass(v87),
                                                  v88,
                                                  (v89 & 1) == 0))
                          {
                            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                            {
                              v132 = v160;
                              v135 = v87;
                              MOLogWrite();
                            }

                            v87 = 0;
                          }
                        }
                        if (v84)
                          -[ACXRemoteApplication setComplicationPrincipalClass:](v10, "setComplicationPrincipalClass:", v84);
                        if (v87)
                          -[ACXRemoteApplication setSupportedComplicationFamilies:](v10, "setSupportedComplicationFamilies:", v87);
                        objc_msgSend(v162, "objectForKeyedSubscript:", v146, v132);
                        v90 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        _ACXValidateObject(v90);
                        v91 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v91)
                        {
                          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                          {
                            objc_msgSend(v83, "path");
                            v133 = (void *)objc_claimAutoreleasedReturnValue();
                            MOLogWrite();

                          }
                          v54 = 1;
                          goto LABEL_252;
                        }
                        -[ACXRemoteApplication setWatchKitAppExtensionBundleID:](v10, "setWatchKitAppExtensionBundleID:", v91);
                        objc_msgSend(v162, "objectForKeyedSubscript:", CFSTR("WKRunsIndependentlyOfCompanionApp"));
                        v92 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        _ACXValidateObject(v92);
                        v93 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v93 && (objc_msgSend(v93, "BOOLValue") & 1) != 0)
                          v94 = 2;
                        else
                          v94 = 1;
                        -[ACXRemoteApplication setApplicationMode:](v10, "setApplicationMode:", v94);

                        v147 = v83;
                        goto LABEL_191;
                      }
                      if (objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.clockface")))
                      {
                        objc_msgSend(v78, "path");
                        v95 = objc_claimAutoreleasedReturnValue();
                        v84 = (void *)v95;
                        if (v95)
                        {
                          objc_msgSend(v141, "addObject:", v95);
                          v84 = (void *)v95;
                        }
                        goto LABEL_191;
                      }
                      if (!objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.intents-service")))
                        goto LABEL_192;
                      objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      _ACXValidateObject(v96);
                      v143 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v143)
                      {
                        objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        _ACXValidateObject(v97);
                        v142 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v142)
                        {
                          objc_opt_class();
                          if ((ACXArrayContainsOnlyClass(v142) & 1) == 0)
                          {
                            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                            {
                              objc_msgSend(v78, "path");
                              v131 = (void *)objc_claimAutoreleasedReturnValue();
                              MOLogWrite();

                            }
LABEL_241:
                            v84 = v143;
                            goto LABEL_191;
                          }
                          if (objc_msgSend(v142, "count"))
                          {
                            -[ACXRemoteApplication intentsSupported](v10, "intentsSupported");
                            v98 = (void *)objc_claimAutoreleasedReturnValue();
                            v99 = v98 == 0;

                            if (v99)
                            {
                              -[ACXRemoteApplication setIntentsSupported:](v10, "setIntentsSupported:", v142);
                            }
                            else
                            {
                              -[ACXRemoteApplication intentsSupported](v10, "intentsSupported");
                              v100 = (void *)objc_claimAutoreleasedReturnValue();
                              v101 = (void *)objc_msgSend(v100, "mutableCopy");

                              v173 = 0u;
                              v174 = 0u;
                              v171 = 0u;
                              v172 = 0u;
                              v102 = v142;
                              v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v171, v200, 16);
                              if (v103)
                              {
                                v104 = *(_QWORD *)v172;
                                do
                                {
                                  for (k = 0; k != v103; ++k)
                                  {
                                    if (*(_QWORD *)v172 != v104)
                                      objc_enumerationMutation(v102);
                                    v106 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * k);
                                    if ((objc_msgSend(v101, "containsObject:", v106) & 1) == 0)
                                      objc_msgSend(v101, "addObject:", v106);
                                  }
                                  v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v171, v200, 16);
                                }
                                while (v103);
                              }

                              v107 = (void *)objc_msgSend(v101, "copy");
                              -[ACXRemoteApplication setIntentsSupported:](v10, "setIntentsSupported:", v107);

                            }
                          }
                        }
                        objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("IntentsRestrictedWhileLocked"));
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        _ACXValidateObject(v108);
                        v109 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v109)
                        {
                          objc_opt_class();
                          if ((ACXArrayContainsOnlyClass(v109) & 1) == 0)
                          {
                            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                            {
                              objc_msgSend(v78, "path");
                              v131 = (void *)objc_claimAutoreleasedReturnValue();
                              MOLogWrite();

                            }
                            goto LABEL_194;
                          }
                          if (objc_msgSend(v109, "count"))
                          {
                            -[ACXRemoteApplication intentsRestrictedWhileLocked](v10, "intentsRestrictedWhileLocked");
                            v110 = (void *)objc_claimAutoreleasedReturnValue();
                            v111 = v110 == 0;

                            if (v111)
                            {
                              -[ACXRemoteApplication setIntentsRestrictedWhileLocked:](v10, "setIntentsRestrictedWhileLocked:", v109);
                            }
                            else
                            {
                              -[ACXRemoteApplication intentsRestrictedWhileLocked](v10, "intentsRestrictedWhileLocked");
                              v112 = (void *)objc_claimAutoreleasedReturnValue();
                              v113 = (void *)objc_msgSend(v112, "mutableCopy");

                              v169 = 0u;
                              v170 = 0u;
                              v167 = 0u;
                              v168 = 0u;
                              v114 = v109;
                              v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v167, v199, 16);
                              if (v115)
                              {
                                v116 = *(_QWORD *)v168;
                                do
                                {
                                  for (m = 0; m != v115; ++m)
                                  {
                                    if (*(_QWORD *)v168 != v116)
                                      objc_enumerationMutation(v114);
                                    v118 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * m);
                                    if ((objc_msgSend(v113, "containsObject:", v118) & 1) == 0)
                                      objc_msgSend(v113, "addObject:", v118);
                                  }
                                  v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v167, v199, 16);
                                }
                                while (v115);
                              }

                              v119 = (void *)objc_msgSend(v113, "copy");
                              -[ACXRemoteApplication setIntentsRestrictedWhileLocked:](v10, "setIntentsRestrictedWhileLocked:", v119);

                            }
                          }
                        }

                        goto LABEL_241;
                      }
                      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        goto LABEL_192;
                    }
                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_193;
                    }
                    objc_msgSend(v78, "path");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    v131 = v84;
                    MOLogWrite();
LABEL_191:

LABEL_192:
                    v82 = v159;
LABEL_193:

                    goto LABEL_194;
                  }
                  v147 = 0;
LABEL_249:

                  v121 = objc_msgSend(v141, "copy");
                  clockFaceExtensionPaths = v10->_clockFaceExtensionPaths;
                  v10->_clockFaceExtensionPaths = (NSArray *)v121;

                  -[ACXApplication clockFaceExtensionPaths](v10, "clockFaceExtensionPaths");
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  v124 = objc_msgSend(v123, "count") == 0;

                  if (!v124)
                    -[ACXRemoteApplication setHasClockfaces:](v10, "setHasClockfaces:", 1);
                  objc_msgSend((id)objc_opt_class(), "buildLocalizedInfoPlistStringsDictForAppBundleURL:watchKitExtensionURL:", v10->_watchAppURL, v147);
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ACXSyncedApplication setLocalizedInfoPlistStrings:](v10, "setLocalizedInfoPlistStrings:", v125);

                  objc_msgSend(v165, "ACX_externalVersionIdentifier");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ACXSyncedApplication setExternalVersionIdentifier:](v10, "setExternalVersionIdentifier:", v126);

                  -[ACXApplication _populateStoreMetadata](v10, "_populateStoreMetadata");
                  v54 = 0;
                  v83 = v147;
LABEL_252:

                  goto LABEL_253;
                }
                objc_opt_class();
                _ACXValidateObject(v137);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                if (v58)
                {
                  objc_opt_class();
                  if (!ACXArrayContainsOnlyClass(v58))
                  {
LABEL_129:

                    goto LABEL_130;
                  }
                  v59 = (void *)objc_opt_new();
                  v186 = 0u;
                  v187 = 0u;
                  v184 = 0u;
                  v185 = 0u;
                  v60 = v58;
                  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v184, v202, 16);
                  if (v61)
                  {
                    v62 = *(_QWORD *)v185;
                    v63 = MEMORY[0x1E0C9AAB0];
                    do
                    {
                      for (n = 0; n != v61; ++n)
                      {
                        if (*(_QWORD *)v185 != v62)
                          objc_enumerationMutation(v60);
                        objc_msgSend(v59, "setObject:forKeyedSubscript:", v63, *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * n));
                      }
                      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v184, v202, 16);
                    }
                    while (v61);
                  }

                  -[ACXRemoteApplication setRequiredCapabilities:](v10, "setRequiredCapabilities:", v59);
                }
                else
                {
                  objc_opt_class();
                  _ACXValidateObject(v137);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = v65;
                  if (v65)
                  {
                    v180 = 0;
                    v181 = &v180;
                    v182 = 0x2020000000;
                    v183 = 1;
                    v179[0] = MEMORY[0x1E0C809B0];
                    v179[1] = 3221225472;
                    v179[2] = __94__ACXApplication_initWithApplicationRecord_gizmoBundleIdentifier_databaseUUID_sequenceNumber___block_invoke;
                    v179[3] = &unk_1E9883218;
                    v179[4] = &v180;
                    objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v179);
                    if (*((_BYTE *)v181 + 24))
                      -[ACXRemoteApplication setRequiredCapabilities:](v10, "setRequiredCapabilities:", v59);
                    _Block_object_dispose(&v180, 8);
                  }
                }

                goto LABEL_129;
              }
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              {
LABEL_106:
                objc_msgSend(v149, "path");
                v140 = (id)objc_claimAutoreleasedReturnValue();
                MOLogWrite();
                v54 = 1;
LABEL_253:

                goto LABEL_254;
              }
            }
            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              goto LABEL_106;
            }
LABEL_107:
            v54 = 1;
LABEL_254:

            goto LABEL_255;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            v54 = 1;
LABEL_255:
            v43 = v148;
LABEL_256:

            if (!v54)
            {
LABEL_258:

LABEL_259:
              v14 = v10;
              goto LABEL_260;
            }
LABEL_257:

            goto LABEL_30;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          v54 = 1;
          goto LABEL_256;
        }
        objc_msgSend(v149, "path");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
        goto LABEL_107;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_29;
    }
    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
      goto LABEL_29;
    }
LABEL_28:
    MOLogWrite();
LABEL_29:

    goto LABEL_30;
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    goto LABEL_30;
LABEL_6:
  MOLogWrite();
LABEL_30:
  v14 = 0;
LABEL_260:

  return v14;
}

void __94__ACXApplication_initWithApplicationRecord_gizmoBundleIdentifier_databaseUUID_sequenceNumber___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  v11 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_7;
  }
  if (!v11)
    goto LABEL_6;
  objc_opt_class();
  v9 = v8;
  v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;

  if (!v10)
    goto LABEL_6;
LABEL_7:

}

- (void)_evaluateTrustInfoForReevaluation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;

  v3 = a3;
  if (!-[ACXRemoteApplication isProfileValidated](self, "isProfileValidated"))
  {
    v8 = 1;
LABEL_7:
    -[ACXApplication setIsTrusted:](self, "setIsTrusted:", v8);
    return;
  }
  v5 = (void *)objc_opt_class();
  -[ACXApplication companionAppURL](self, "companionAppURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "_systemTrustsApplicationWithBundleURL:", v6);

  if (!v3 || v7 != 2)
  {
    v8 = v7 == 1;
    goto LABEL_7;
  }
}

- (id)appWithReevaluatedTrust
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[ACXRemoteApplication companionAppBundleID](self, "companionAppBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v12);
  v6 = v12;

  if (v5)
  {
    v7 = objc_alloc((Class)objc_opt_class());
    -[ACXSyncedApplication bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACXSyncedApplication databaseUUID](self, "databaseUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithApplicationRecord:gizmoBundleIdentifier:databaseUUID:sequenceNumber:", v5, v8, v9, -[ACXSyncedApplication sequenceNumber](self, "sequenceNumber"));

  }
  else
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[ACXRemoteApplication companionAppBundleID](self, "companionAppBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
    v10 = 0;
  }

LABEL_7:
  return v10;
}

+ (BOOL)_isIndeterminateMISError:(int)a3
{
  BOOL v3;

  if (a3)
    v3 = a3 == -402620405;
  else
    v3 = 1;
  return !v3 && (a3 + 402620379) > 1;
}

+ (int)_systemTrustsApplicationWithBundleURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0DE7300];
  v15[0] = *MEMORY[0x1E0DE7328];
  v15[1] = v5;
  v16[0] = MEMORY[0x1E0C9AAB0];
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MISValidateSignature();

  if ((_DWORD)v8)
  {
    v9 = (void *)MISCopyErrorStringForErrorCode();
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v4, "path");
      v13 = v8;
      v14 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    if (objc_msgSend(a1, "_isIndeterminateMISError:", v8, v12, v13, v14))
      v10 = 2;
    else
      v10 = 0;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)_infoPlistForPluginBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v14;

  v3 = a3;
  if (_infoPlistForPluginBundle__onceToken != -1)
    dispatch_once(&_infoPlistForPluginBundle__onceToken, &__block_literal_global);
  ACXLoadInfoPlist(v3, (void *)_infoPlistForPluginBundle__keysToLoad);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSExtension"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v7 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;

      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;

        if (v12)
        {
          v9 = v5;
LABEL_29:

          goto LABEL_30;
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          objc_msgSend(v3, "path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
LABEL_28:
        v9 = 0;
        goto LABEL_29;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v3, "path");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
        goto LABEL_28;
      }
LABEL_13:
      v9 = 0;
LABEL_30:

      goto LABEL_31;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
LABEL_12:
      objc_msgSend(v3, "path");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
      goto LABEL_13;
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    goto LABEL_12;
  }
  v9 = 0;
LABEL_31:

  return v9;
}

void __44__ACXApplication__infoPlistForPluginBundle___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE78], CFSTR("CLKComplicationPrincipalClass"), CFSTR("CLKComplicationSupportedFamilies"), CFSTR("NSExtension"), CFSTR("WKRunsIndependentlyOfCompanionApp"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_infoPlistForPluginBundle__keysToLoad;
  _infoPlistForPluginBundle__keysToLoad = v0;

}

- (id)_URLOfFirstItemWithExtension:(id)a3 inDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  char v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 5, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;

  if (v8)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v8;
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v18 = v9;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "pathExtension");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v5);

          if ((v16 & 1) != 0)
          {
            v11 = v14;
            goto LABEL_12;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v11)
          continue;
        break;
      }
LABEL_12:
      v9 = v18;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_mostCurrentWKAppURLInCompanionAppRecord:(id)a3 isPlaceholder:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("Watch"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACXApplication _URLOfFirstItemWithExtension:inDirectory:](self, "_URLOfFirstItemWithExtension:inDirectory:", CFSTR("app"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      if (a4)
        *a4 = 0;
    }
    else
    {
      objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.WatchPlaceholder"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACXApplication _URLOfFirstItemWithExtension:inDirectory:](self, "_URLOfFirstItemWithExtension:inDirectory:", CFSTR("app"), v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v13;
      if (a4 && v13)
        *a4 = 1;

    }
  }
  else
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
      v11 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
    v11 = 0;
  }

LABEL_13:
  return v11;
}

- (id)_URLsOfExtensionsInBundleURL:(id)a3 mayNotExist:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v13;
  id v14;

  v4 = a4;
  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlugIns"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 5, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (!v7)
  {
    if (v4)
    {
      objc_msgSend(v8, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        v10 = objc_msgSend(v8, "code");

        if (v10 == 260)
          goto LABEL_11;
      }
      else
      {

      }
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v5, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  v11 = v7;
LABEL_11:

  return v7;
}

- (id)_watchKitApplicationNameFromWKAppInfoPlist:(id)a3 containerRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = (__CFString *)v8;
  else
    v9 = 0;

  if (!v9)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = (__CFString *)v11;
    else
      v9 = 0;

    if (!v9)
    {
      objc_msgSend(v6, "localizedShortName");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
        v9 = (__CFString *)v12;
      else
        v9 = CFSTR("Unknown Name");
    }
  }

  return v9;
}

- (id)_storeMetadataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  -[ACXApplication companionAppURL](self, "companionAppURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("iTunesMetadata.plist"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0D4E438], "metadataFromPlistAtURL:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v8;
  if (a3 && !v7)
    *a3 = objc_retainAutorelease(v8);

  return v7;
}

- (NSURL)watchAppURL
{
  return self->_watchAppURL;
}

- (unint64_t)lsSequenceNumber
{
  return self->_lsSequenceNumber;
}

- (NSArray)clockFaceExtensionPaths
{
  return self->_clockFaceExtensionPaths;
}

- (BOOL)isTrusted
{
  return self->_isTrusted;
}

- (void)setIsTrusted:(BOOL)a3
{
  self->_isTrusted = a3;
}

- (NSURL)companionAppURL
{
  return self->_companionAppURL;
}

- (NSString)companionAppName
{
  return self->_companionAppName;
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (BOOL)isPurchasedReDownload
{
  return self->_isPurchasedReDownload;
}

- (BOOL)isEmbeddedPlaceholder
{
  return self->_isEmbeddedPlaceholder;
}

- (ACXApplicationStatus)deviceStatus
{
  return self->_deviceStatus;
}

- (void)setDeviceStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (unint64_t)autoInstallOverride
{
  return self->_autoInstallOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceStatus, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_companionAppName, 0);
  objc_storeStrong((id *)&self->_companionAppURL, 0);
  objc_storeStrong((id *)&self->_clockFaceExtensionPaths, 0);
  objc_storeStrong((id *)&self->_watchAppURL, 0);
}

@end
