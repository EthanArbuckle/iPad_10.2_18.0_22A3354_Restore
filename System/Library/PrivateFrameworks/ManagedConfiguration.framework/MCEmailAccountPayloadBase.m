@implementation MCEmailAccountPayloadBase

- (MCEmailAccountPayloadBase)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCEmailAccountPayloadBase *v9;
  uint64_t v10;
  id v11;
  NSNumber *preventMoveNum;
  uint64_t v13;
  NSNumber *preventAppSheetNum;
  uint64_t v15;
  NSNumber *SMIMESigningEnabled;
  void *v17;
  uint64_t v18;
  id *p_SMIMEEncryptionEnabled;
  NSNumber *SMIMEEncryptionEnabled;
  id v21;
  void *v22;
  NSNumber *isRecentsSyncingDisabledNum;
  NSNumber *isMailDropEnabledNum;
  uint64_t v25;
  NSString *VPNUUID;
  uint64_t v27;
  void **p_SMIMEPerMessageSwitchEnabledNum;
  NSNumber *SMIMEPerMessageSwitchEnabledNum;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v41;
  int v42;
  uint64_t v43;
  NSNumber *SMIMEEnabledNum;
  uint64_t v45;
  NSData *SMIMESigningIdentityPersistentID;
  uint64_t v47;
  NSData *SMIMEEncryptionIdentityPersistentID;
  uint64_t v49;
  NSString *SMIMESigningIdentityUUID;
  uint64_t v51;
  NSString *SMIMEEncryptionIdentityUUID;
  uint64_t v53;
  uint64_t v54;
  NSNumber *obja;
  NSNumber *objb;
  id obj;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  objc_super v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v77.receiver = self;
  v77.super_class = (Class)MCEmailAccountPayloadBase;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v77, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (v9)
  {
    v76 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("PreventMove"), 0, &v76);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v76;
    preventMoveNum = v9->_preventMoveNum;
    v9->_preventMoveNum = (NSNumber *)v10;

    if (v11)
      goto LABEL_22;
    v9->_preventMove = -[NSNumber BOOLValue](v9->_preventMoveNum, "BOOLValue");
    v75 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("PreventAppSheet"), 0, &v75);
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = v75;
    preventAppSheetNum = v9->_preventAppSheetNum;
    v9->_preventAppSheetNum = (NSNumber *)v13;

    if (v11)
      goto LABEL_22;
    v9->_preventAppSheet = -[NSNumber BOOLValue](v9->_preventAppSheetNum, "BOOLValue");
    v74 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMESigningEnabled"), 0, &v74);
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = v74;
    SMIMESigningEnabled = v9->_SMIMESigningEnabled;
    v9->_SMIMESigningEnabled = (NSNumber *)v15;

    if (v11)
      goto LABEL_22;
    v73 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMESigningUserOverrideable"), 0, &v73);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v73;
    v9->_SMIMESigningUserOverrideable = objc_msgSend(v17, "BOOLValue");

    if (v11)
      goto LABEL_22;
    v72 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMEEncryptByDefault"), 0, &v72);
    v18 = objc_claimAutoreleasedReturnValue();
    v11 = v72;
    p_SMIMEEncryptionEnabled = (id *)&v9->_SMIMEEncryptionEnabled;
    SMIMEEncryptionEnabled = v9->_SMIMEEncryptionEnabled;
    v9->_SMIMEEncryptionEnabled = (NSNumber *)v18;

    if (v11)
      goto LABEL_22;
    v71 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMEEncryptionEnabled"), 0, &v71);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v21 = v71;
    if (v21)
      goto LABEL_21;
    if (!*p_SMIMEEncryptionEnabled)
      objc_storeStrong((id *)&v9->_SMIMEEncryptionEnabled, v11);
    v70 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMEEncryptByDefaultUserOverrideable"), 0, &v70);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v70;
    v9->_SMIMEEncryptByDefaultUserOverrideable = objc_msgSend(v22, "BOOLValue");

    if (v21)
      goto LABEL_21;
    v69 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("disableMailRecentsSyncing"), 0, &v69);
    obja = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v21 = v69;
    isRecentsSyncingDisabledNum = v9->_isRecentsSyncingDisabledNum;
    v9->_isRecentsSyncingDisabledNum = obja;

    if (v21)
      goto LABEL_21;
    v9->_isRecentsSyncingDisabled = -[NSNumber BOOLValue](v9->_isRecentsSyncingDisabledNum, "BOOLValue");
    v68 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("allowMailDrop"), 0, &v68);
    objb = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v21 = v68;
    isMailDropEnabledNum = v9->_isMailDropEnabledNum;
    v9->_isMailDropEnabledNum = objb;

    if (v21)
      goto LABEL_21;
    v9->_isMailDropEnabled = -[NSNumber BOOLValue](v9->_isMailDropEnabledNum, "BOOLValue");
    v67 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("VPNUUID"), 0, &v67);
    v25 = objc_claimAutoreleasedReturnValue();
    v21 = v67;
    VPNUUID = v9->_VPNUUID;
    v9->_VPNUUID = (NSString *)v25;

    if (v21)
      goto LABEL_21;
    v66 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMEEnableEncryptionPerMessageSwitch"), 0, &v66);
    v27 = objc_claimAutoreleasedReturnValue();
    v21 = v66;
    p_SMIMEPerMessageSwitchEnabledNum = (void **)&v9->_SMIMEPerMessageSwitchEnabledNum;
    SMIMEPerMessageSwitchEnabledNum = v9->_SMIMEPerMessageSwitchEnabledNum;
    v9->_SMIMEPerMessageSwitchEnabledNum = (NSNumber *)v27;

    if (v21)
    {
LABEL_21:

      v11 = v21;
LABEL_22:
      -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11, v53);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (a5)
        *a5 = objc_retainAutorelease(v33);
      v35 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v36 = v35;
        v37 = (void *)objc_opt_class();
        v38 = v37;
        objc_msgSend(v34, "MCVerboseDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v37;
        v80 = 2114;
        v81 = v39;
        _os_log_impl(&dword_19ECC4000, v36, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v9 = 0;
      goto LABEL_27;
    }
    v65 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMEEnablePerMessageSwitch"), 0, &v65);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = v65;
    if (v21)
      goto LABEL_20;
    v30 = *p_SMIMEPerMessageSwitchEnabledNum;
    if (!*p_SMIMEPerMessageSwitchEnabledNum)
    {
      objc_storeStrong((id *)&v9->_SMIMEPerMessageSwitchEnabledNum, obj);
      v30 = *p_SMIMEPerMessageSwitchEnabledNum;
    }
    v9->_SMIMEPerMessageSwitchEnabled = objc_msgSend(v30, "BOOLValue");
    v64 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMESigningCertificateUUIDUserOverrideable"), 0, &v64);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v64;
    v9->_SMIMESigningIdentityUserOverrideable = objc_msgSend(v31, "BOOLValue");

    if (v21
      || (v63 = 0,
          objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMEEncryptionCertificateUUIDUserOverrideable"), 0, &v63), v32 = (void *)objc_claimAutoreleasedReturnValue(), v21 = v63, v9->_SMIMEEncryptionIdentityUserOverrideable = objc_msgSend(v32, "BOOLValue"), v32, v21))
    {
LABEL_20:

      goto LABEL_21;
    }
    -[MCPayload profile](v9, "profile");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isStub");

    if (v42)
    {
      v62 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMEEnabled"), 0, &v62);
      v43 = objc_claimAutoreleasedReturnValue();
      v21 = v62;
      SMIMEEnabledNum = v9->_SMIMEEnabledNum;
      v9->_SMIMEEnabledNum = (NSNumber *)v43;

      if (v21)
        goto LABEL_20;
      v9->_SMIMEEnabled = -[NSNumber BOOLValue](v9->_SMIMEEnabledNum, "BOOLValue");
      v61 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMESigningIdentityPersistentID"), 0, &v61);
      v45 = objc_claimAutoreleasedReturnValue();
      v21 = v61;
      SMIMESigningIdentityPersistentID = v9->_SMIMESigningIdentityPersistentID;
      v9->_SMIMESigningIdentityPersistentID = (NSData *)v45;

      if (v21)
        goto LABEL_20;
      v60 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SMIMEEncryptionIdentityPersistentID"), 0, &v60);
      v47 = objc_claimAutoreleasedReturnValue();
      v21 = v60;
      SMIMEEncryptionIdentityPersistentID = v9->_SMIMEEncryptionIdentityPersistentID;
      v9->_SMIMEEncryptionIdentityPersistentID = (NSData *)v47;

      if (v21)
        goto LABEL_20;
    }
    else
    {
      v59 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SMIMESigningCertificateUUID"), 0, &v59);
      v49 = objc_claimAutoreleasedReturnValue();
      v21 = v59;
      SMIMESigningIdentityUUID = v9->_SMIMESigningIdentityUUID;
      v9->_SMIMESigningIdentityUUID = (NSString *)v49;

      if (v21)
        goto LABEL_20;
      v58 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SMIMEEncryptionCertificateUUID"), 0, &v58);
      v51 = objc_claimAutoreleasedReturnValue();
      v21 = v58;
      SMIMEEncryptionIdentityUUID = v9->_SMIMEEncryptionIdentityUUID;
      v53 = 136;
      v9->_SMIMEEncryptionIdentityUUID = (NSString *)v51;

      if (v21)
        goto LABEL_20;
      if (v9->_SMIMEEncryptionIdentityUUID && !*p_SMIMEEncryptionEnabled)
      {
        *p_SMIMEEncryptionEnabled = (id)MEMORY[0x1E0C9AAB0];

      }
      if (-[NSNumber BOOLValue](v9->_SMIMESigningEnabled, "BOOLValue", 136)
        || (objc_msgSend(*p_SMIMEEncryptionEnabled, "BOOLValue") & 1) != 0
        || v9->_SMIMESigningIdentityUUID
        || *(Class *)((char *)&v9->super.super.isa + v54)
        || v9->_SMIMESigningUserOverrideable
        || v9->_SMIMESigningIdentityUserOverrideable
        || v9->_SMIMEEncryptionIdentityUserOverrideable
        || v9->_SMIMEEncryptByDefaultUserOverrideable)
      {
        v9->_SMIMEEnabled = 1;
      }
    }
    v34 = obj;
LABEL_27:

  }
  return v9;
}

- (id)stubDictionary
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCEmailAccountPayloadBase;
  -[MCPayload stubDictionary](&v15, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preventMove);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PreventMove"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preventAppSheet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("PreventAppSheet"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_SMIMEEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("SMIMEEnabled"));

  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_SMIMESigningEnabled, CFSTR("SMIMESigningEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_SMIMESigningUserOverrideable);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SMIMESigningUserOverrideable"));

  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_SMIMEEncryptionEnabled, CFSTR("SMIMEEncryptionEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRecentsSyncingDisabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("disableMailRecentsSyncing"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMailDropEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("allowMailDrop"));

  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_VPNUUID, CFSTR("VPNUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_SMIMEPerMessageSwitchEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("SMIMEEnablePerMessageSwitch"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_SMIMEEncryptByDefaultUserOverrideable);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("SMIMEEncryptByDefaultUserOverrideable"));

  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_SMIMESigningIdentityPersistentID, CFSTR("SMIMESigningIdentityPersistentID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_SMIMESigningIdentityUserOverrideable);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("SMIMESigningCertificateUUIDUserOverrideable"));

  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_SMIMEEncryptionIdentityPersistentID, CFSTR("SMIMEEncryptionIdentityPersistentID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_SMIMEEncryptionIdentityUserOverrideable);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("SMIMEEncryptionCertificateUUIDUserOverrideable"));

  return v3;
}

- (id)verboseDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  NSNumber *SMIMESigningEnabled;
  const __CFString *v10;
  NSNumber *SMIMEEncryptionEnabled;
  const __CFString *v12;
  objc_super v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v14.receiver = self;
  v14.super_class = (Class)MCEmailAccountPayloadBase;
  -[MCPayload verboseDescription](&v14, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n"), v4);

  -[MCPayload profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isStub");

  if ((v7 & 1) == 0)
  {
    if (self->_preventMove)
      objc_msgSend(v5, "appendFormat:", CFSTR("Prevent Move             : Yes\n"));
    if (self->_preventAppSheet)
      objc_msgSend(v5, "appendFormat:", CFSTR("Prevent App Sheet        : Yes\n"));
    if (self->_isRecentsSyncingDisabled)
      objc_msgSend(v5, "appendFormat:", CFSTR("Recents sync disabled    : Yes\n"));
    if (self->_isMailDropEnabled)
      objc_msgSend(v5, "appendFormat:", CFSTR("Mail Drop enabled        : Yes\n"));
    if (self->_VPNUUID)
      objc_msgSend(v5, "appendFormat:", CFSTR("VPNUUID                  : %@\n"), self->_VPNUUID);
    v8 = self->_SMIMESigningEnabled
      || self->_SMIMESigningUserOverrideable
      || self->_SMIMESigningIdentityUUID
      || self->_SMIMESigningIdentityPersistentID
      || self->_SMIMESigningIdentityUserOverrideable;
    if (self->_SMIMEEnabled)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("S/MIME\n"));
      if (self->_SMIMEEnabled)
        objc_msgSend(v5, "appendFormat:", CFSTR("  Enabled: Yes\n"));
    }
    if (v8)
      objc_msgSend(v5, "appendFormat:", CFSTR("  Signing\n"));
    SMIMESigningEnabled = self->_SMIMESigningEnabled;
    if (SMIMESigningEnabled)
    {
      if (-[NSNumber BOOLValue](SMIMESigningEnabled, "BOOLValue"))
        v10 = CFSTR("Yes");
      else
        v10 = CFSTR("No");
      objc_msgSend(v5, "appendFormat:", CFSTR("    Enabled               : %@\n"), v10);
    }
    if (self->_SMIMESigningUserOverrideable)
      objc_msgSend(v5, "appendFormat:", CFSTR("    User Overrideable     : Enabled\n"));
    if (self->_SMIMESigningIdentityUUID)
      objc_msgSend(v5, "appendFormat:", CFSTR("    Cert                  : %@\n"), self->_SMIMESigningIdentityUUID);
    if (self->_SMIMESigningIdentityPersistentID)
      objc_msgSend(v5, "appendFormat:", CFSTR("    Cert                  : Present\n"));
    if (self->_SMIMESigningIdentityUserOverrideable)
      objc_msgSend(v5, "appendFormat:", CFSTR("    Cert User Overrideable: Enabled\n"));
    if (-[NSNumber BOOLValue](self->_SMIMEEncryptionEnabled, "BOOLValue")
      || self->_SMIMEEncryptionIdentityUUID
      || self->_SMIMEEncryptionIdentityPersistentID
      || self->_SMIMEEncryptionIdentityUserOverrideable
      || self->_SMIMEPerMessageSwitchEnabled
      || self->_SMIMEEncryptByDefaultUserOverrideable)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("  Encryption\n"));
    }
    SMIMEEncryptionEnabled = self->_SMIMEEncryptionEnabled;
    if (SMIMEEncryptionEnabled)
    {
      if (-[NSNumber BOOLValue](SMIMEEncryptionEnabled, "BOOLValue"))
        v12 = CFSTR("Yes");
      else
        v12 = CFSTR("No");
      objc_msgSend(v5, "appendFormat:", CFSTR("    On by Default            : %@\n"), v12);
    }
    if (self->_SMIMEEncryptByDefaultUserOverrideable)
      objc_msgSend(v5, "appendFormat:", CFSTR("    Default user overrideable: Yes\n"));
    if (self->_SMIMEEncryptionIdentityUUID)
      objc_msgSend(v5, "appendFormat:", CFSTR("    Cert                     : %@\n"), self->_SMIMEEncryptionIdentityUUID);
    if (self->_SMIMEEncryptionIdentityPersistentID)
      objc_msgSend(v5, "appendFormat:", CFSTR("    Cert                     : Present\n"));
    if (self->_SMIMEEncryptionIdentityUserOverrideable)
      objc_msgSend(v5, "appendFormat:", CFSTR("    Cert User Overrideable   : Enabled\n"));
    if (self->_SMIMEPerMessageSwitchEnabled)
      objc_msgSend(v5, "appendFormat:", CFSTR("    Per-message switch       : Enabled\n"));
  }
  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  void *v6;
  void *v7;
  MCKeyValue *v8;
  MCKeyValue *v9;
  void *v10;
  void *v11;
  MCKeyValue *v12;
  MCKeyValue *v13;
  void *v14;
  void *v15;
  MCKeyValue *v16;
  MCKeyValue *v17;
  void *v18;
  void *v19;
  MCKeyValue *v20;
  MCKeyValue *v21;
  NSString *VPNUUID;
  void *v23;
  MCKeyValue *v24;
  void *v25;
  uint64_t v26;
  MCKeyValue *v27;
  void *v28;
  void *v29;
  MCKeyValue *v30;
  MCKeyValue *v31;
  void *v32;
  void *v33;
  MCKeyValue *v34;
  MCKeyValue *v35;
  void *v36;
  void *v37;
  MCKeyValue *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  MCKeyValue *v42;
  void *v43;
  MCKeyValue *v44;
  MCKeyValue *v45;
  void *v46;
  void *v47;
  MCKeyValue *v48;
  void *v49;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  if (self->_preventMoveNum)
  {
    v5 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_preventMoveNum, "BOOLValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_PREVENT_MOVE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", v6, v7);
    objc_msgSend(v4, "addObject:", v8);

  }
  if (self->_preventAppSheetNum)
  {
    v9 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_preventAppSheetNum, "BOOLValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_PREVENT_APP_SHEET"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MCKeyValue initWithLocalizedString:localizedKey:](v9, "initWithLocalizedString:localizedKey:", v10, v11);
    objc_msgSend(v4, "addObject:", v12);

  }
  if (self->_isRecentsSyncingDisabledNum)
  {
    v13 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_isRecentsSyncingDisabledNum, "BOOLValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_RECENTS_SYNC_DISABLED"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MCKeyValue initWithLocalizedString:localizedKey:](v13, "initWithLocalizedString:localizedKey:", v14, v15);
    objc_msgSend(v4, "addObject:", v16);

  }
  if (self->_isMailDropEnabledNum)
  {
    v17 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_isMailDropEnabledNum, "BOOLValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_MAIL_DROP_ENABLED"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MCKeyValue initWithLocalizedString:localizedKey:](v17, "initWithLocalizedString:localizedKey:", v18, v19);
    objc_msgSend(v4, "addObject:", v20);

  }
  if (self->_VPNUUID)
  {
    v21 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    MCLocalizedString(CFSTR("ACCOUNT_VPNUUID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCKeyValue initWithLocalizedString:localizedKey:](v21, "initWithLocalizedString:localizedKey:", VPNUUID, v23);

    objc_msgSend(v4, "addObject:", v24);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v25);

    v26 = objc_opt_new();
    v4 = (void *)v26;
  }
  if (self->_SMIMEEnabledNum)
  {
    v27 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_SMIMEEnabledNum, "BOOLValue"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_ENABLED"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MCKeyValue initWithLocalizedString:localizedKey:](v27, "initWithLocalizedString:localizedKey:", v28, v29);
    objc_msgSend(v4, "addObject:", v30);

  }
  if (self->_SMIMESigningEnabled)
  {
    v31 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_SMIMESigningEnabled, "BOOLValue"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_SIGNING_ENABLED"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MCKeyValue initWithLocalizedString:localizedKey:](v31, "initWithLocalizedString:localizedKey:", v32, v33);
    objc_msgSend(v4, "addObject:", v34);

  }
  if (self->_SMIMESigningUserOverrideable)
  {
    v35 = [MCKeyValue alloc];
    MCLocalizedStringForBool(self->_SMIMESigningUserOverrideable);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_SIGNING_USER_OVERRIDEABLE"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[MCKeyValue initWithLocalizedString:localizedKey:](v35, "initWithLocalizedString:localizedKey:", v36, v37);
    objc_msgSend(v4, "addObject:", v38);

  }
  if (self->_SMIMESigningIdentityPersistentID)
  {
    -[MCPayload profile](self, "profile");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "subjectSummaryFromCertificateWithPersistentID:", self->_SMIMESigningIdentityPersistentID);
    v40 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_SMIMESigningIdentityUUID)
      goto LABEL_25;
    -[MCPayload profile](self, "profile");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "subjectSummaryFromCertificatePayloadWithUUID:", self->_SMIMESigningIdentityUUID);
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v40;

  if (v41)
  {
    v42 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_SIGNING_IDENTITY"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[MCKeyValue initWithLocalizedString:localizedKey:](v42, "initWithLocalizedString:localizedKey:", v41, v43);

    objc_msgSend(v4, "addObject:", v44);
  }
LABEL_25:
  if (self->_SMIMESigningIdentityUserOverrideable)
  {
    v45 = [MCKeyValue alloc];
    MCLocalizedStringForBool(self->_SMIMESigningIdentityUserOverrideable);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_SIGNING_IDENTITY_USER_OVERRIDEABLE"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[MCKeyValue initWithLocalizedString:localizedKey:](v45, "initWithLocalizedString:localizedKey:", v46, v47);
    objc_msgSend(v4, "addObject:", v48);

  }
  -[MCEmailAccountPayloadBase addSMIMEEncryptionPayloadKeysTo:](self, "addSMIMEEncryptionPayloadKeysTo:", v4);
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v49);

  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (void)addSMIMEEncryptionPayloadKeysTo:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  MCKeyValue *v9;
  void *v10;
  __CFString *v11;
  MCKeyValue *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  MCKeyValue *v16;
  MCKeyValue *v17;
  void *v18;
  void *v19;
  MCKeyValue *v20;
  MCKeyValue *v21;
  void *v22;
  void *v23;
  MCKeyValue *v24;
  MCKeyValue *v25;
  void *v26;
  MCKeyValue *v27;
  MCKeyValue *v28;
  MCKeyValue *v29;
  void *v30;
  MCKeyValue *v31;
  void *v32;
  id v33;

  v33 = a3;
  v4 = -[NSNumber BOOLValue](self->_SMIMEEncryptionEnabled, "BOOLValue");
  if (self->_SMIMEEncryptionIdentityPersistentID)
  {
    -[MCPayload profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subjectSummaryFromCertificateWithPersistentID:", self->_SMIMEEncryptionIdentityPersistentID);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_SMIMEEncryptionIdentityUUID)
    {
      v7 = 0;
      goto LABEL_6;
    }
    -[MCPayload profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subjectSummaryFromCertificatePayloadWithUUID:", self->_SMIMEEncryptionIdentityUUID);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

LABEL_6:
  if ((v4 & 1) == 0 && !self->_SMIMEPerMessageSwitchEnabled)
  {
    if (!((uint64_t)self->_SMIMEEncryptionIdentityUUID | v7))
    {
      if (!self->_SMIMEEncryptByDefaultUserOverrideable)
        goto LABEL_31;
      goto LABEL_15;
    }
    if (!self->_SMIMEEncryptByDefaultUserOverrideable)
    {
      v9 = [MCKeyValue alloc];
      MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_ENCRYPTION_MISCONFIGURED_NOT_ENABLEABLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("EMAIL_ACCOUNT_SMIME_ENCRYPTION_ENABLED");
      goto LABEL_29;
    }
  }
  if (!v7)
  {
LABEL_15:
    if (self->_SMIMEEncryptionIdentityUserOverrideable)
    {
      v8 = 1;
      goto LABEL_17;
    }
    v9 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_ENCRYPTION_MISCONFIGURED_IDENTITY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("EMAIL_ACCOUNT_SMIME_ENCRYPTION_IDENTITY");
LABEL_29:
    MCLocalizedString(v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[MCKeyValue initWithLocalizedString:localizedKey:](v9, "initWithLocalizedString:localizedKey:", v10, v32);

    objc_msgSend(v33, "addObject:", v29);
    goto LABEL_30;
  }
  v8 = 0;
LABEL_17:
  if (self->_SMIMEEncryptByDefaultUserOverrideable || self->_SMIMEPerMessageSwitchEnabled)
  {
    v12 = [MCKeyValue alloc];
    MCLocalizedStringForBool(v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("EMAIL_ACCOUNT_SMIME_ENCRYPT_BY_DEFAULT");
  }
  else
  {
    v12 = [MCKeyValue alloc];
    MCLocalizedStringForBool(v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("EMAIL_ACCOUNT_SMIME_ENCRYPTION_ENABLED");
  }
  MCLocalizedString(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MCKeyValue initWithLocalizedString:localizedKey:](v12, "initWithLocalizedString:localizedKey:", v13, v15);

  objc_msgSend(v33, "addObject:", v16);
  if (self->_SMIMEEncryptByDefaultUserOverrideable)
  {
    v17 = [MCKeyValue alloc];
    MCLocalizedStringForBool(self->_SMIMEEncryptByDefaultUserOverrideable);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_ENCRYPT_BY_DEFAULT_USER_OVERRIDEABLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MCKeyValue initWithLocalizedString:localizedKey:](v17, "initWithLocalizedString:localizedKey:", v18, v19);

    objc_msgSend(v33, "addObject:", v20);
  }
  if (self->_SMIMEPerMessageSwitchEnabled)
  {
    v21 = [MCKeyValue alloc];
    MCLocalizedStringForBool(self->_SMIMEPerMessageSwitchEnabled);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_PER_MESSAGE_SWITCH_ENABLED"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCKeyValue initWithLocalizedString:localizedKey:](v21, "initWithLocalizedString:localizedKey:", v22, v23);

    objc_msgSend(v33, "addObject:", v24);
  }
  if ((v8 & 1) == 0)
  {
    v25 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_ENCRYPTION_IDENTITY"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MCKeyValue initWithLocalizedString:localizedKey:](v25, "initWithLocalizedString:localizedKey:", v7, v26);

    objc_msgSend(v33, "addObject:", v27);
  }
  if (self->_SMIMEEncryptionIdentityUserOverrideable)
  {
    v28 = [MCKeyValue alloc];
    MCLocalizedStringForBool(self->_SMIMEEncryptionIdentityUserOverrideable);
    v29 = (MCKeyValue *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SMIME_ENCRYPTION_IDENTITY_USER_OVERRIDEABLE"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[MCKeyValue initWithLocalizedString:localizedKey:](v28, "initWithLocalizedString:localizedKey:", v29, v30);
    objc_msgSend(v33, "addObject:", v31);

LABEL_30:
  }
LABEL_31:

}

- (BOOL)containsSensitiveUserInformation
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCEmailAccountPayloadBase;
  if (-[MCPayload containsSensitiveUserInformation](&v9, sel_containsSensitiveUserInformation))
    return 1;
  -[MCEmailAccountPayloadBase SMIMESigningIdentityUUID](self, "SMIMESigningIdentityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    -[MCEmailAccountPayloadBase SMIMEEncryptionIdentityUUID](self, "SMIMEEncryptionIdentityUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = 1;
    }
    else
    {
      -[MCEmailAccountPayloadBase SMIMESigningIdentityPersistentID](self, "SMIMESigningIdentityPersistentID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v3 = 1;
      }
      else
      {
        -[MCEmailAccountPayloadBase SMIMEEncryptionIdentityPersistentID](self, "SMIMEEncryptionIdentityPersistentID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7 != 0;

      }
    }

  }
  return v3;
}

- (BOOL)preventMove
{
  return self->_preventMove;
}

- (void)setPreventMove:(BOOL)a3
{
  self->_preventMove = a3;
}

- (BOOL)preventAppSheet
{
  return self->_preventAppSheet;
}

- (void)setPreventAppSheet:(BOOL)a3
{
  self->_preventAppSheet = a3;
}

- (BOOL)SMIMEEnabled
{
  return self->_SMIMEEnabled;
}

- (void)setSMIMEEnabled:(BOOL)a3
{
  self->_SMIMEEnabled = a3;
}

- (BOOL)isRecentsSyncingDisabled
{
  return self->_isRecentsSyncingDisabled;
}

- (void)setIsRecentsSyncingDisabled:(BOOL)a3
{
  self->_isRecentsSyncingDisabled = a3;
}

- (BOOL)isMailDropEnabled
{
  return self->_isMailDropEnabled;
}

- (void)setIsMailDropEnabled:(BOOL)a3
{
  self->_isMailDropEnabled = a3;
}

- (NSString)VPNUUID
{
  return self->_VPNUUID;
}

- (NSNumber)SMIMESigningEnabled
{
  return self->_SMIMESigningEnabled;
}

- (void)setSMIMESigningEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_SMIMESigningEnabled, a3);
}

- (BOOL)SMIMESigningUserOverrideable
{
  return self->_SMIMESigningUserOverrideable;
}

- (void)setSMIMESigningUserOverrideable:(BOOL)a3
{
  self->_SMIMESigningUserOverrideable = a3;
}

- (NSString)SMIMESigningIdentityUUID
{
  return self->_SMIMESigningIdentityUUID;
}

- (void)setSMIMESigningIdentityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_SMIMESigningIdentityUUID, a3);
}

- (BOOL)SMIMESigningIdentityUserOverrideable
{
  return self->_SMIMESigningIdentityUserOverrideable;
}

- (void)setSMIMESigningIdentityUserOverrideable:(BOOL)a3
{
  self->_SMIMESigningIdentityUserOverrideable = a3;
}

- (NSNumber)SMIMEEncryptionEnabled
{
  return self->_SMIMEEncryptionEnabled;
}

- (void)setSMIMEEncryptionEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_SMIMEEncryptionEnabled, a3);
}

- (BOOL)SMIMEEncryptByDefaultUserOverrideable
{
  return self->_SMIMEEncryptByDefaultUserOverrideable;
}

- (void)setSMIMEEncryptByDefaultUserOverrideable:(BOOL)a3
{
  self->_SMIMEEncryptByDefaultUserOverrideable = a3;
}

- (NSString)SMIMEEncryptionIdentityUUID
{
  return self->_SMIMEEncryptionIdentityUUID;
}

- (void)setSMIMEEncryptionIdentityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_SMIMEEncryptionIdentityUUID, a3);
}

- (BOOL)SMIMEEncryptionIdentityUserOverrideable
{
  return self->_SMIMEEncryptionIdentityUserOverrideable;
}

- (void)setSMIMEEncryptionIdentityUserOverrideable:(BOOL)a3
{
  self->_SMIMEEncryptionIdentityUserOverrideable = a3;
}

- (NSData)SMIMESigningIdentityPersistentID
{
  return self->_SMIMESigningIdentityPersistentID;
}

- (void)setSMIMESigningIdentityPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_SMIMESigningIdentityPersistentID, a3);
}

- (NSData)SMIMEEncryptionIdentityPersistentID
{
  return self->_SMIMEEncryptionIdentityPersistentID;
}

- (void)setSMIMEEncryptionIdentityPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_SMIMEEncryptionIdentityPersistentID, a3);
}

- (BOOL)SMIMEPerMessageSwitchEnabled
{
  return self->_SMIMEPerMessageSwitchEnabled;
}

- (void)setSMIMEPerMessageSwitchEnabled:(BOOL)a3
{
  self->_SMIMEPerMessageSwitchEnabled = a3;
}

- (NSNumber)preventMoveNum
{
  return self->_preventMoveNum;
}

- (void)setPreventMoveNum:(id)a3
{
  objc_storeStrong((id *)&self->_preventMoveNum, a3);
}

- (NSNumber)preventAppSheetNum
{
  return self->_preventAppSheetNum;
}

- (void)setPreventAppSheetNum:(id)a3
{
  objc_storeStrong((id *)&self->_preventAppSheetNum, a3);
}

- (NSNumber)SMIMEEnabledNum
{
  return self->_SMIMEEnabledNum;
}

- (void)setSMIMEEnabledNum:(id)a3
{
  objc_storeStrong((id *)&self->_SMIMEEnabledNum, a3);
}

- (NSNumber)isRecentsSyncingDisabledNum
{
  return self->_isRecentsSyncingDisabledNum;
}

- (void)setIsRecentsSyncingDisabledNum:(id)a3
{
  objc_storeStrong((id *)&self->_isRecentsSyncingDisabledNum, a3);
}

- (NSNumber)isMailDropEnabledNum
{
  return self->_isMailDropEnabledNum;
}

- (void)setIsMailDropEnabledNum:(id)a3
{
  objc_storeStrong((id *)&self->_isMailDropEnabledNum, a3);
}

- (NSNumber)SMIMEPerMessageSwitchEnabledNum
{
  return self->_SMIMEPerMessageSwitchEnabledNum;
}

- (void)setSMIMEPerMessageSwitchEnabledNum:(id)a3
{
  objc_storeStrong((id *)&self->_SMIMEPerMessageSwitchEnabledNum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SMIMEPerMessageSwitchEnabledNum, 0);
  objc_storeStrong((id *)&self->_isMailDropEnabledNum, 0);
  objc_storeStrong((id *)&self->_isRecentsSyncingDisabledNum, 0);
  objc_storeStrong((id *)&self->_SMIMEEnabledNum, 0);
  objc_storeStrong((id *)&self->_preventAppSheetNum, 0);
  objc_storeStrong((id *)&self->_preventMoveNum, 0);
  objc_storeStrong((id *)&self->_SMIMEEncryptionIdentityPersistentID, 0);
  objc_storeStrong((id *)&self->_SMIMESigningIdentityPersistentID, 0);
  objc_storeStrong((id *)&self->_SMIMEEncryptionIdentityUUID, 0);
  objc_storeStrong((id *)&self->_SMIMEEncryptionEnabled, 0);
  objc_storeStrong((id *)&self->_SMIMESigningIdentityUUID, 0);
  objc_storeStrong((id *)&self->_SMIMESigningEnabled, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
}

@end
