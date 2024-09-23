@implementation ACAccount

- (NSString)parentAccountIdentifier
{
  ACAccount *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[ACAccount identifier](v2->_parentAccount, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSString)identifier
{
  ACAccount *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_identifier;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)modificationID
{
  ACAccount *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_modificationID;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountPropertiesTransformer, 0);
  objc_storeStrong((id *)&self->_credentialsDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_dirtyDataclassProperties, 0);
  objc_storeStrong((id *)&self->_dirtyAccountProperties, 0);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_trackedEnabledDataclasses, 0);
  objc_storeStrong((id *)&self->_trackedProvisionedDataclasses, 0);
  objc_storeStrong((id *)&self->_childAccounts, 0);
  objc_storeStrong((id *)&self->_parentAccount, 0);
  objc_storeStrong((id *)&self->_modificationID, 0);
  objc_storeStrong((id *)&self->_lastCredentialRenewalRejectionDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_dataclassProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_clientToken, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_owningBundleID, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_accountStore);
}

- (void)_setAccountStore:(id)a3
{
  ACAccount *v4;
  ACAccount *parentAccount;
  id obj;

  obj = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_accountStore, obj);
  -[ACAccountType setAccountStore:](v4->_accountType, "setAccountStore:", obj);
  parentAccount = v4->_parentAccount;
  if (parentAccount)
    -[ACAccount _setAccountStore:](parentAccount, "_setAccountStore:", obj);
  objc_sync_exit(v4);

}

- (id)accountPropertyForKey:(id)a3
{
  id v4;
  ACAccount *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_properties, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  ACAccount *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  id WeakRetained;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;

  v5 = (id *)(id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_sync_enter(v5);
  v6 = self;
  objc_sync_enter(v6);
  v7 = -[ACAccountType copyWithZone:](v6->_accountType, "copyWithZone:", a3);
  v8 = v5[9];
  v5[9] = (id)v7;

  v9 = -[ACAccountCredential copyWithZone:](v6->_credential, "copyWithZone:", a3);
  v10 = v5[10];
  v5[10] = (id)v9;

  v11 = -[NSString copyWithZone:](v6->_identifier, "copyWithZone:", a3);
  v12 = v5[2];
  v5[2] = (id)v11;

  v13 = -[NSString copyWithZone:](v6->_accountDescription, "copyWithZone:", a3);
  v14 = v5[3];
  v5[3] = (id)v13;

  v15 = -[NSString copyWithZone:](v6->_username, "copyWithZone:", a3);
  v16 = v5[5];
  v5[5] = (id)v15;

  v17 = -[NSMutableDictionary mutableCopyWithZone:](v6->_properties, "mutableCopyWithZone:", a3);
  v18 = v5[11];
  v5[11] = (id)v17;

  *((_BYTE *)v5 + 210) = v6->_authenticated;
  v19 = -[NSDate copyWithZone:](v6->_lastCredentialRenewalRejectionDate, "copyWithZone:", a3);
  v20 = v5[15];
  v5[15] = (id)v19;

  *((_BYTE *)v5 + 211) = v6->_active;
  *((_BYTE *)v5 + 212) = v6->_warmingUp;
  *((_BYTE *)v5 + 214) = v6->_visible;
  *((_BYTE *)v5 + 213) = v6->_supportsAuthentication;
  v21 = -[NSMutableDictionary mutableCopyWithZone:](v6->_dataclassProperties, "mutableCopyWithZone:", a3);
  v22 = v5[12];
  v5[12] = (id)v21;

  v23 = -[NSURL copyWithZone:](v6->_objectID, "copyWithZone:", a3);
  v24 = v5[13];
  v5[13] = (id)v23;

  v25 = -[ACAccount copyWithZone:](v6->_parentAccount, "copyWithZone:", a3);
  v26 = v5[17];
  v5[17] = (id)v25;

  v27 = -[ACTrackedSet mutableCopyWithZone:](v6->_trackedProvisionedDataclasses, "mutableCopyWithZone:", a3);
  v28 = v5[19];
  v5[19] = (id)v27;

  *((_BYTE *)v5 + 216) = v6->_wasProvisionedDataclassesReset;
  v29 = -[ACTrackedSet mutableCopyWithZone:](v6->_trackedEnabledDataclasses, "mutableCopyWithZone:", a3);
  v30 = v5[20];
  v5[20] = (id)v29;

  *((_BYTE *)v5 + 217) = v6->_wasEnabledDataclassesReset;
  v31 = -[NSString copyWithZone:](v6->_authenticationType, "copyWithZone:", a3);
  v32 = v5[6];
  v5[6] = (id)v31;

  v33 = -[NSString copyWithZone:](v6->_credentialType, "copyWithZone:", a3);
  v34 = v5[7];
  v5[7] = (id)v33;

  v35 = -[NSString copyWithZone:](v6->_owningBundleID, "copyWithZone:", a3);
  v36 = v5[4];
  v5[4] = (id)v35;

  v37 = -[NSMutableSet mutableCopyWithZone:](v6->_dirtyProperties, "mutableCopyWithZone:", a3);
  v38 = v5[21];
  v5[21] = (id)v37;

  v39 = -[NSMutableSet mutableCopyWithZone:](v6->_dirtyAccountProperties, "mutableCopyWithZone:", a3);
  v40 = v5[22];
  v5[22] = (id)v39;

  v41 = -[NSMutableSet mutableCopyWithZone:](v6->_dirtyDataclassProperties, "mutableCopyWithZone:", a3);
  v42 = v5[23];
  v5[23] = (id)v41;

  v43 = -[NSDate copyWithZone:](v6->_date, "copyWithZone:", a3);
  v44 = v5[14];
  v5[14] = (id)v43;

  WeakRetained = objc_loadWeakRetained((id *)&v6->_accountStore);
  objc_storeWeak(v5 + 1, WeakRetained);

  *((_BYTE *)v5 + 209) = v6->_accountAccessAvailable;
  v46 = -[ACAccount copyWithZone:](v6->_parentAccount, "copyWithZone:", a3);
  v47 = v5[17];
  v5[17] = (id)v46;

  *((_BYTE *)v5 + 215) = v6->_haveCheckedForChildAccounts;
  v48 = -[NSArray copyWithZone:](v6->_childAccounts, "copyWithZone:", a3);
  v49 = v5[18];
  v5[18] = (id)v48;

  v50 = objc_msgSend(v6->_accountPropertiesTransformer, "copyWithZone:", a3);
  v51 = v5[25];
  v5[25] = (id)v50;

  v52 = -[NSString copyWithZone:](v6->_modificationID, "copyWithZone:", a3);
  v53 = v5[16];
  v5[16] = (id)v52;

  if (v5[10])
    objc_msgSend(v5, "_installCredentialsChangedObserver");
  objc_sync_exit(v6);

  objc_sync_exit(v5);
  return v5;
}

- (ACAccount)init
{
  return -[ACAccount initWithAccountType:](self, "initWithAccountType:", 0);
}

- (ACAccount)initWithAccountType:(ACAccountType *)type
{
  ACAccountType *v5;
  ACAccount *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v5 = type;
  v11.receiver = self;
  v11.super_class = (Class)ACAccount;
  v6 = -[ACAccount init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_storeStrong((id *)&v6->_accountType, type);
    *(_WORD *)&v6->_authenticated = 256;
    v6->_visible = 1;
    v6->_supportsAuthentication = -[ACAccountType supportsAuthentication](v5, "supportsAuthentication") != 0;
    v6->_warmingUp = 0;
    -[ACAccount _unsafe_markPropertyDirty:](v6, "_unsafe_markPropertyDirty:", CFSTR("identifier"));
    -[ACAccount _unsafe_markPropertyDirty:](v6, "_unsafe_markPropertyDirty:", CFSTR("accountType"));
    -[ACAccount _unsafe_markPropertyDirty:](v6, "_unsafe_markPropertyDirty:", CFSTR("active"));
    -[ACAccount _unsafe_markPropertyDirty:](v6, "_unsafe_markPropertyDirty:", CFSTR("supportsAuthentication"));
    -[ACAccount _unsafe_markPropertyDirty:](v6, "_unsafe_markPropertyDirty:", CFSTR("visible"));
    -[ACAccount _unsafe_markPropertyDirty:](v6, "_unsafe_markPropertyDirty:", CFSTR("authenticated"));
  }

  return v6;
}

- (void)_unsafe_markPropertyDirty:(id)a3
{
  id v4;
  NSMutableSet *dirtyProperties;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  v8 = v4;
  if (!dirtyProperties)
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  -[NSMutableSet addObject:](dirtyProperties, "addObject:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_credentialsDidChangeObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_credentialsDidChangeObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)ACAccount;
  -[ACAccount dealloc](&v4, sel_dealloc);
}

- (unint64_t)notifyGenerationID
{
  ACAccount *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSString hash](v2->_modificationID, "hash");
  v4 = -[ACAccount notifyGenerationID](v2->_parentAccount, "notifyGenerationID");
  if ((unint64_t)(v4 + v3) <= 1)
    v5 = 2;
  else
    v5 = v4 + v3;
  objc_sync_exit(v2);

  return v5;
}

- (void)_clearCachedTrackedSets
{
  ACMutableTrackedSet *trackedProvisionedDataclasses;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  ACAccount *obj;

  obj = self;
  objc_sync_enter(obj);
  trackedProvisionedDataclasses = obj->_trackedProvisionedDataclasses;
  obj->_trackedProvisionedDataclasses = 0;

  trackedEnabledDataclasses = obj->_trackedEnabledDataclasses;
  obj->_trackedEnabledDataclasses = 0;

  objc_sync_exit(obj);
}

- (void)_clearCachedCredentials
{
  ACAccountCredential *credential;
  ACAccount *obj;

  obj = self;
  objc_sync_enter(obj);
  credential = obj->_credential;
  obj->_credential = 0;

  objc_sync_exit(obj);
}

- (void)_clearCachedChildAccounts
{
  NSArray *childAccounts;
  ACAccount *obj;

  obj = self;
  objc_sync_enter(obj);
  childAccounts = obj->_childAccounts;
  obj->_childAccounts = 0;

  obj->_haveCheckedForChildAccounts = 0;
  objc_sync_exit(obj);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)qualifiedUsername
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Hostname"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAAccountHost"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAAccountHost"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  -[ACAccount accountType](self, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.account.Exchange"));

  if (v8)
  {
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("EWSRootFolderID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("EWSInternalURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "host");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v11, "length"))
    {
      _ACLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[ACAccount qualifiedUsername].cold.1();

      v14 = v11;
      v3 = v14;
    }

  }
  if (!objc_msgSend(v3, "length"))
  {
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("IdentityEmailAddress"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      -[ACAccount username](self, "username");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsString:", CFSTR("@"));

      if ((v20 & 1) == 0)
      {
        v21 = CFSTR("IdentityEmailAddress");
        goto LABEL_22;
      }
    }
    else
    {

    }
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("DAAccountEmailAddress"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (!v23)
    {
      -[ACAccount username](self, "username");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v21 = CFSTR("DAAccountEmailAddress");
LABEL_22:
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v21);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v17 = (void *)v24;
    goto LABEL_25;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  -[ACAccount username](self, "username");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@@%@"), v16, v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v17;
}

- (ACAccountType)accountType
{
  ACAccount *v2;
  ACAccountType *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_accountType;
  objc_sync_exit(v2);

  return v3;
}

- (ACAccount)initWithManagedAccount:(id)a3
{
  ACAccount *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  ACAccountType *v8;
  void *v9;
  uint64_t v10;
  ACAccountType *accountType;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *accountDescription;
  uint64_t v16;
  NSString *username;
  void *v18;
  uint64_t v19;
  NSDate *lastCredentialRenewalRejectionDate;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSURL *objectID;
  uint64_t v28;
  NSString *authenticationType;
  uint64_t v30;
  NSString *credentialType;
  uint64_t v32;
  NSDate *date;
  uint64_t v34;
  NSString *owningBundleID;
  uint64_t v36;
  NSString *modificationID;
  void *v38;
  ACAccount *v39;
  ACAccount *parentAccount;
  void *v41;
  uint64_t v42;
  NSMutableDictionary *dataclassProperties;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  ACAccount *v53;
  NSObject *v54;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  uint8_t v66[128];
  uint8_t buf[4];
  id v68;
  __int16 v69;
  _BOOL4 v70;
  __int16 v71;
  _BOOL4 v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v65.receiver = self;
  v65.super_class = (Class)ACAccount;
  v4 = -[ACAccount init](&v65, sel_init);
  if (!v4)
  {
LABEL_20:
    v4 = v4;
    v53 = v4;
    goto LABEL_24;
  }
  objc_msgSend(v60, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v60, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (!v7)
    {
      v8 = [ACAccountType alloc];
      objc_msgSend(v60, "accountType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ACAccountType initWithManagedAccountType:](v8, "initWithManagedAccountType:", v9);
      accountType = v4->_accountType;
      v4->_accountType = (ACAccountType *)v10;

      objc_msgSend(v60, "identifier");
      v12 = objc_claimAutoreleasedReturnValue();
      identifier = v4->_identifier;
      v4->_identifier = (NSString *)v12;

      objc_msgSend(v60, "accountDescription");
      v14 = objc_claimAutoreleasedReturnValue();
      accountDescription = v4->_accountDescription;
      v4->_accountDescription = (NSString *)v14;

      objc_msgSend(v60, "username");
      v16 = objc_claimAutoreleasedReturnValue();
      username = v4->_username;
      v4->_username = (NSString *)v16;

      objc_msgSend(v60, "authenticated");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_authenticated = objc_msgSend(v18, "BOOLValue");

      objc_msgSend(v60, "lastCredentialRenewalRejectionDate");
      v19 = objc_claimAutoreleasedReturnValue();
      lastCredentialRenewalRejectionDate = v4->_lastCredentialRenewalRejectionDate;
      v4->_lastCredentialRenewalRejectionDate = (NSDate *)v19;

      objc_msgSend(v60, "active");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_active = objc_msgSend(v21, "BOOLValue");

      objc_msgSend(v60, "warmingUp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_warmingUp = objc_msgSend(v22, "BOOLValue");

      objc_msgSend(v60, "visible");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_visible = objc_msgSend(v23, "BOOLValue");

      objc_msgSend(v60, "supportsAuthentication");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_supportsAuthentication = objc_msgSend(v24, "BOOLValue");

      objc_msgSend(v60, "objectID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URIRepresentation");
      v26 = objc_claimAutoreleasedReturnValue();
      objectID = v4->_objectID;
      v4->_objectID = (NSURL *)v26;

      objc_msgSend(v60, "authenticationType");
      v28 = objc_claimAutoreleasedReturnValue();
      authenticationType = v4->_authenticationType;
      v4->_authenticationType = (NSString *)v28;

      objc_msgSend(v60, "credentialType");
      v30 = objc_claimAutoreleasedReturnValue();
      credentialType = v4->_credentialType;
      v4->_credentialType = (NSString *)v30;

      objc_msgSend(v60, "date");
      v32 = objc_claimAutoreleasedReturnValue();
      date = v4->_date;
      v4->_date = (NSDate *)v32;

      objc_msgSend(v60, "owningBundleID");
      v34 = objc_claimAutoreleasedReturnValue();
      owningBundleID = v4->_owningBundleID;
      v4->_owningBundleID = (NSString *)v34;

      objc_msgSend(v60, "modificationID");
      v36 = objc_claimAutoreleasedReturnValue();
      modificationID = v4->_modificationID;
      v4->_modificationID = (NSString *)v36;

      v38 = v60;
      objc_msgSend(v60, "parentAccount");
      v58 = objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        v39 = -[ACAccount initWithManagedAccount:]([ACAccount alloc], "initWithManagedAccount:", v58);
        parentAccount = v4->_parentAccount;
        v4->_parentAccount = v39;

        v38 = v60;
      }
      objc_msgSend(v38, "dataclassProperties", v58);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "mutableCopy");
      dataclassProperties = v4->_dataclassProperties;
      v4->_dataclassProperties = (NSMutableDictionary *)v42;

      v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      objc_msgSend(v60, "customProperties");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v62 != v47)
              objc_enumerationMutation(v45);
            v49 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_msgSend(v49, "value");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              objc_msgSend(v49, "key");
              v51 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setObject:forKey:", v50, v51);
            }
            else
            {
              _ACLogSystem();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v49, "key");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                -[ACAccount initWithManagedAccount:].cold.1(v52, buf, &v68, v51);
              }
            }

          }
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        }
        while (v46);
      }

      if (objc_msgSend(v44, "count"))
        objc_storeStrong((id *)&v4->_properties, v44);

      goto LABEL_20;
    }
  }
  _ACLogSystem();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v60, "accountType");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "identifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v68 = v60;
    v69 = 1024;
    v70 = v56 != 0;
    v71 = 1024;
    v72 = v57 != 0;
    _os_log_error_impl(&dword_1A2BCD000, v54, OS_LOG_TYPE_ERROR, "\"ACAccount initializer just ran into an account (%@) missing required properties: accountType:%d identifier:%d\", buf, 0x18u);

  }
  v53 = 0;
LABEL_24:

  return v53;
}

- (NSString)username
{
  ACAccount *v3;
  NSString *v4;

  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v3 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount username](v3, "username");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self;
    objc_sync_enter(v3);
    v4 = v3->_username;
    objc_sync_exit(v3);
  }

  return v4;
}

- (BOOL)_useParentForCredentials
{
  void *v2;
  char v3;

  -[ACAccount authenticationType](self, "authenticationType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("parent"));

  return v3;
}

- (NSString)authenticationType
{
  ACAccount *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_authenticationType;
  objc_sync_exit(v2);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  ACAccount *v5;
  ACAccountCredential *credential;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "encodeObject:forKey:", v5->_accountType, CFSTR("accountType"));
  credential = v5->_credential;
  if (credential)
    objc_msgSend(v4, "encodeObject:forKey:", credential, CFSTR("credential"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_accountDescription, CFSTR("accountDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_username, CFSTR("username"));
  -[ACAccount accountProperties](v5, "accountProperties");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ACAccount accountPropertiesTransformer](v5, "accountPropertiesTransformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ACAccount accountPropertiesTransformer](v5, "accountPropertiesTransformer");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v9)[2](v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v10;
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v7);
          -[ACAccount _markAccountPropertyDirty:](v5, "_markAccountPropertyDirty:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13++), (_QWORD)v21);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

  }
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("accountProperties"), (_QWORD)v21);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5->_authenticated);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("authenticated"));

  objc_msgSend(v4, "encodeObject:forKey:", v5->_lastCredentialRenewalRejectionDate, CFSTR("lastCredentialRenewalRejectionDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5->_active);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("active"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5->_warmingUp);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("warmingUp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5->_visible);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("visible"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5->_supportsAuthentication);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("supportsAuthentication"));

  objc_msgSend(v4, "encodeObject:forKey:", v5->_dataclassProperties, CFSTR("dataclassProperties"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_objectID, CFSTR("objectID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_parentAccount, CFSTR("parent"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_trackedProvisionedDataclasses, CFSTR("trackedProvisionedDataclasses"));
  objc_msgSend(v4, "encodeBool:forKey:", v5->_wasProvisionedDataclassesReset, CFSTR("wasProvisionedDataclassesReset"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_trackedEnabledDataclasses, CFSTR("trackedEnabledDataclasses"));
  objc_msgSend(v4, "encodeBool:forKey:", v5->_wasEnabledDataclassesReset, CFSTR("wasEnabledDataclassesReset"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_authenticationType, CFSTR("authenticationType"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_credentialType, CFSTR("credentialType"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_date, CFSTR("date"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_owningBundleID, CFSTR("owningBundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_dirtyProperties, CFSTR("dirtyProperties"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_dirtyAccountProperties, CFSTR("dirtyAccountProperties"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_dirtyDataclassProperties, CFSTR("dirtyDataclassProperties"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_modificationID, CFSTR("modificationID"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5->_trackedProvisionedDataclasses)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithTrackedSet:", v5->_trackedProvisionedDataclasses);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("provisionedDataclasses"));

      }
    }
    if (v5->_trackedEnabledDataclasses)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithTrackedSet:", v5->_trackedEnabledDataclasses);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("enabledDataclasses"));

      }
    }
  }

  objc_sync_exit(v5);
}

- (NSDictionary)accountProperties
{
  ACAccount *v2;
  NSMutableDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_properties;
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (id)accountPropertiesTransformer
{
  return objc_getProperty(self, a2, 200, 1);
}

- (id)personaIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;

  -[ACAccount parentAccount](self, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PersonaIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return v5;
  }
  else
  {
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PersonaIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      return v5;
  }
  -[ACAccount dirtyProperties](self, "dirtyProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("PersonaIdentifier"));

  if (v7)
  {
    _ACPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ACAccount isDataSeparatedAccount].cold.1();

    -[ACAccount dirtyProperties](self, "dirtyProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("PersonaIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSString)accountDescription
{
  void *v3;
  void *v4;
  ACAccount *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;

  -[ACAccount parentAccount](self, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[ACAccount parentAccount](self, "parentAccount");
    v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount accountDescription](v5, "accountDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount accountType](self, "accountType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountTypeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ - %@"), v6, v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    v9 = v5->_accountDescription;
    objc_sync_exit(v5);
  }

  return v9;
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Dataclass.DeviceLocator")))
  {
    _ACLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ACAccount isEnabledForDataclass:].cold.1();

  }
  -[ACAccount enabledDataclasses](self, "enabledDataclasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (NSMutableSet)enabledDataclasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  ACAccount *v9;
  ACAccount *v10;

  -[ACAccount parentAccount](self, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enabledDataclasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACAccount accountType](self, "accountType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncableDataclasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "intersectSet:", v7);

  }
  else
  {
    v9 = self;
    objc_sync_enter(v9);
    if (v9->_trackedEnabledDataclasses)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithTrackedSet:");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_sync_exit(v9);

    if (!v8)
    {
      v10 = v9;
      objc_sync_enter(v10);
      -[ACAccount _unsafe_loadEnabledDataclasses](v10, "_unsafe_loadEnabledDataclasses");
      if (v9->_trackedEnabledDataclasses)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithTrackedSet:");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      objc_sync_exit(v10);

      if (!v8)
        v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    }
  }
  return (NSMutableSet *)v8;
}

- (ACAccount)parentAccount
{
  ACAccount *v2;
  ACAccount *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_parentAccount;
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)dirtyProperties
{
  ACAccount *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableSet copy](v2->_dirtyProperties, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (ACAccount)initWithCoder:(id)a3
{
  id v4;
  ACAccount *v5;
  uint64_t v6;
  ACAccountType *accountType;
  uint64_t v8;
  ACAccountCredential *credential;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  void *v13;
  uint64_t v14;
  NSString *accountDescription;
  void *v16;
  uint64_t v17;
  NSString *username;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSMutableDictionary *properties;
  void *v31;
  uint64_t v32;
  NSDate *lastCredentialRenewalRejectionDate;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSMutableDictionary *dataclassProperties;
  void *v50;
  uint64_t v51;
  NSURL *objectID;
  void *v53;
  uint64_t v54;
  ACAccount *parentAccount;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  ACMutableTrackedSet *trackedProvisionedDataclasses;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  void *v68;
  uint64_t v69;
  NSString *authenticationType;
  void *v71;
  uint64_t v72;
  NSString *credentialType;
  uint64_t v74;
  NSDate *date;
  void *v76;
  uint64_t v77;
  NSString *owningBundleID;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  NSMutableSet *dirtyProperties;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSMutableSet *dirtyAccountProperties;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  NSMutableSet *dirtyDataclassProperties;
  void *v94;
  uint64_t v95;
  NSString *modificationID;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  ACMutableTrackedSet *v101;
  ACMutableTrackedSet *v102;
  ACMutableTrackedSet *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  ACMutableTrackedSet *v109;
  ACMutableTrackedSet *v110;
  ACMutableTrackedSet *v111;
  void *v112;
  ACAccountCredential *v113;
  void *v115;
  void *v116;
  objc_super v117;

  v4 = a3;
  v117.receiver = self;
  v117.super_class = (Class)ACAccount;
  v5 = -[ACAccount init](&v117, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountType"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountType = v5->_accountType;
    v5->_accountType = (ACAccountType *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credential"));
    v8 = objc_claimAutoreleasedReturnValue();
    credential = v5->_credential;
    v5->_credential = (ACAccountCredential *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountDescription"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    accountDescription = v5->_accountDescription;
    v5->_accountDescription = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    username = v5->_username;
    v5->_username = (NSString *)v17;

    v115 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v115, "setWithObjects:", v19, v20, v21, v22, v23, v24, v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("accountProperties"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "mutableCopy");
    properties = v5->_properties;
    v5->_properties = (NSMutableDictionary *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticated"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_authenticated = objc_msgSend(v31, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastCredentialRenewalRejectionDate"));
    v32 = objc_claimAutoreleasedReturnValue();
    lastCredentialRenewalRejectionDate = v5->_lastCredentialRenewalRejectionDate;
    v5->_lastCredentialRenewalRejectionDate = (NSDate *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("active"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_active = objc_msgSend(v34, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("warmingUp"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_warmingUp = objc_msgSend(v35, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visible"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_visible = objc_msgSend(v36, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsAuthentication"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsAuthentication = objc_msgSend(v37, "BOOLValue");

    v116 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    v45 = objc_opt_class();
    objc_msgSend(v116, "setWithObjects:", v38, v39, v40, v41, v42, v43, v44, v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("dataclassProperties"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "mutableCopy");
    dataclassProperties = v5->_dataclassProperties;
    v5->_dataclassProperties = (NSMutableDictionary *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "copy");
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parent"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "copy");
    parentAccount = v5->_parentAccount;
    v5->_parentAccount = (ACAccount *)v54;

    v56 = (void *)MEMORY[0x1E0C99E60];
    v57 = objc_opt_class();
    objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v58, CFSTR("trackedProvisionedDataclasses"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "mutableCopy");
    trackedProvisionedDataclasses = v5->_trackedProvisionedDataclasses;
    v5->_trackedProvisionedDataclasses = (ACMutableTrackedSet *)v60;

    v5->_wasProvisionedDataclassesReset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasProvisionedDataclassesReset"));
    v62 = (void *)MEMORY[0x1E0C99E60];
    v63 = objc_opt_class();
    objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v64, CFSTR("trackedEnabledDataclasses"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "mutableCopy");
    trackedEnabledDataclasses = v5->_trackedEnabledDataclasses;
    v5->_trackedEnabledDataclasses = (ACMutableTrackedSet *)v66;

    v5->_wasEnabledDataclassesReset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasEnabledDataclassesReset"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationType"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "copy");
    authenticationType = v5->_authenticationType;
    v5->_authenticationType = (NSString *)v69;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialType"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "copy");
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v74 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("owningBundleID"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "copy");
    owningBundleID = v5->_owningBundleID;
    v5->_owningBundleID = (NSString *)v77;

    v79 = (void *)MEMORY[0x1E0C99E60];
    v80 = objc_opt_class();
    objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v81, CFSTR("dirtyProperties"));
    v82 = objc_claimAutoreleasedReturnValue();
    dirtyProperties = v5->_dirtyProperties;
    v5->_dirtyProperties = (NSMutableSet *)v82;

    v84 = (void *)MEMORY[0x1E0C99E60];
    v85 = objc_opt_class();
    objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v86, CFSTR("dirtyAccountProperties"));
    v87 = objc_claimAutoreleasedReturnValue();
    dirtyAccountProperties = v5->_dirtyAccountProperties;
    v5->_dirtyAccountProperties = (NSMutableSet *)v87;

    v89 = (void *)MEMORY[0x1E0C99E60];
    v90 = objc_opt_class();
    objc_msgSend(v89, "setWithObjects:", v90, objc_opt_class(), 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v91, CFSTR("dirtyDataclassProperties"));
    v92 = objc_claimAutoreleasedReturnValue();
    dirtyDataclassProperties = v5->_dirtyDataclassProperties;
    v5->_dirtyDataclassProperties = (NSMutableSet *)v92;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationID"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "copy");
    modificationID = v5->_modificationID;
    v5->_modificationID = (NSString *)v95;

    if (!v5->_trackedProvisionedDataclasses)
    {
      v97 = (void *)MEMORY[0x1E0C99E60];
      v98 = objc_opt_class();
      objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v99, CFSTR("provisionedDataclasses"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      if (v100)
      {
        v101 = objc_alloc_init(ACMutableTrackedSet);
        v102 = v5->_trackedProvisionedDataclasses;
        v5->_trackedProvisionedDataclasses = v101;

        v103 = v5->_trackedProvisionedDataclasses;
        objc_msgSend(v100, "allObjects");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACMutableTrackedSet addObjectsFromArray:](v103, "addObjectsFromArray:", v104);

        v5->_wasProvisionedDataclassesReset = 1;
      }

    }
    if (!v5->_trackedEnabledDataclasses)
    {
      v105 = (void *)MEMORY[0x1E0C99E60];
      v106 = objc_opt_class();
      objc_msgSend(v105, "setWithObjects:", v106, objc_opt_class(), 0);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v107, CFSTR("enabledDataclasses"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      if (v108)
      {
        v109 = objc_alloc_init(ACMutableTrackedSet);
        v110 = v5->_trackedEnabledDataclasses;
        v5->_trackedEnabledDataclasses = v109;

        v111 = v5->_trackedEnabledDataclasses;
        objc_msgSend(v108, "allObjects");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACMutableTrackedSet addObjectsFromArray:](v111, "addObjectsFromArray:", v112);

        v5->_wasEnabledDataclassesReset = 1;
      }

    }
    v113 = v5->_credential;
    if (v113)
    {
      -[ACAccountCredential _setOwningAccount:](v113, "_setOwningAccount:", v5);
      -[ACAccount _installCredentialsChangedObserver](v5, "_installCredentialsChangedObserver");
    }
  }

  return v5;
}

- (ACAccount)initWithManagedAccount:(id)a3 accountStore:(id)a4
{
  id v6;
  ACAccount *v7;
  ACAccount *v8;

  v6 = a4;
  v7 = -[ACAccount initWithManagedAccount:](self, "initWithManagedAccount:", a3);
  v8 = v7;
  if (v7)
    -[ACAccount _setAccountStore:](v7, "_setAccountStore:", v6);

  return v8;
}

- (id)credentialWithError:(id *)a3
{
  ACAccount *v5;
  ACAccountCredential *v6;
  ACAccount *v7;
  id *p_credential;
  void *v9;

  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount credentialWithError:](v5, "credentialWithError:", a3);
    v6 = (ACAccountCredential *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    return v6;
  }
  v7 = self;
  objc_sync_enter(v7);
  p_credential = (id *)&v7->_credential;
  v6 = v7->_credential;
  objc_sync_exit(v7);

  if (!v6)
  {
    -[ACAccount accountStore](v7, "accountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "credentialForAccount:error:", v7, a3);
    v6 = (ACAccountCredential *)objc_claimAutoreleasedReturnValue();

    v5 = v7;
    objc_sync_enter(v5);
    objc_storeStrong(p_credential, v6);
    if (!v5->_credentialsDidChangeObserver)
      -[ACAccount _installCredentialsChangedObserver](v5, "_installCredentialsChangedObserver");
    objc_sync_exit(v5);
    goto LABEL_7;
  }
  return v6;
}

- (void)reload
{
  void *v3;
  void *v4;
  void *v5;
  ACAccount *v6;
  void *v7;
  uint64_t v8;
  NSString *accountDescription;
  void *v10;
  uint64_t v11;
  NSString *username;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *properties;
  void *v16;
  uint64_t v17;
  NSString *owningBundleID;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *dataclassProperties;
  uint64_t v22;
  NSDate *lastCredentialRenewalRejectionDate;
  void *v24;
  uint64_t v25;
  NSURL *objectID;
  void *v27;
  uint64_t v28;
  ACAccountType *accountType;
  void *v30;
  uint64_t v31;
  NSString *credentialType;
  void *v33;
  uint64_t v34;
  NSString *authenticationType;
  ACAccountCredential *credential;
  void *v37;
  uint64_t v38;
  ACAccount *parentAccount;
  NSArray *childAccounts;
  ACMutableTrackedSet *trackedProvisionedDataclasses;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  void *v43;
  uint64_t v44;
  NSString *modificationID;
  NSMutableSet *dirtyProperties;
  NSMutableSet *dirtyAccountProperties;
  NSMutableSet *dirtyDataclassProperties;
  id v49;

  -[ACAccount accountStore](self, "accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountWithIdentifier:", v4);
  v49 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v49;
  if (v49)
  {
    v6 = self;
    objc_sync_enter(v6);
    objc_msgSend(v49, "accountDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    accountDescription = v6->_accountDescription;
    v6->_accountDescription = (NSString *)v8;

    objc_msgSend(v49, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    username = v6->_username;
    v6->_username = (NSString *)v11;

    -[ACAccount willChangeValueForKey:](v6, "willChangeValueForKey:", CFSTR("accountProperties"));
    objc_msgSend(v49, "accountProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");
    properties = v6->_properties;
    v6->_properties = (NSMutableDictionary *)v14;

    -[ACAccount didChangeValueForKey:](v6, "didChangeValueForKey:", CFSTR("accountProperties"));
    objc_msgSend(v49, "owningBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    owningBundleID = v6->_owningBundleID;
    v6->_owningBundleID = (NSString *)v17;

    -[ACAccount willChangeValueForKey:](v6, "willChangeValueForKey:", CFSTR("dataclassProperties"));
    objc_msgSend(v49, "dataclassProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "mutableCopy");
    dataclassProperties = v6->_dataclassProperties;
    v6->_dataclassProperties = (NSMutableDictionary *)v20;

    -[ACAccount didChangeValueForKey:](v6, "didChangeValueForKey:", CFSTR("dataclassProperties"));
    v6->_authenticated = objc_msgSend(v49, "isAuthenticated");
    objc_msgSend(v49, "lastCredentialRenewalRejectionDate");
    v22 = objc_claimAutoreleasedReturnValue();
    lastCredentialRenewalRejectionDate = v6->_lastCredentialRenewalRejectionDate;
    v6->_lastCredentialRenewalRejectionDate = (NSDate *)v22;

    v6->_active = objc_msgSend(v49, "isActive");
    v6->_warmingUp = objc_msgSend(v49, "isWarmingUp");
    objc_msgSend(v49, "objectID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    objectID = v6->_objectID;
    v6->_objectID = (NSURL *)v25;

    objc_msgSend(v49, "accountType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    accountType = v6->_accountType;
    v6->_accountType = (ACAccountType *)v28;

    objc_msgSend(v49, "credentialType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    credentialType = v6->_credentialType;
    v6->_credentialType = (NSString *)v31;

    objc_msgSend(v49, "authenticationType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    authenticationType = v6->_authenticationType;
    v6->_authenticationType = (NSString *)v34;

    credential = v6->_credential;
    v6->_credential = 0;

    objc_msgSend(v49, "parentAccount");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "copy");
    parentAccount = v6->_parentAccount;
    v6->_parentAccount = (ACAccount *)v38;

    v6->_haveCheckedForChildAccounts = 0;
    childAccounts = v6->_childAccounts;
    v6->_childAccounts = 0;

    trackedProvisionedDataclasses = v6->_trackedProvisionedDataclasses;
    v6->_trackedProvisionedDataclasses = 0;

    v6->_wasProvisionedDataclassesReset = 0;
    trackedEnabledDataclasses = v6->_trackedEnabledDataclasses;
    v6->_trackedEnabledDataclasses = 0;

    v6->_wasEnabledDataclassesReset = 0;
    objc_msgSend(v49, "modificationID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "copy");
    modificationID = v6->_modificationID;
    v6->_modificationID = (NSString *)v44;

    dirtyProperties = v6->_dirtyProperties;
    v6->_dirtyProperties = 0;

    dirtyAccountProperties = v6->_dirtyAccountProperties;
    v6->_dirtyAccountProperties = 0;

    dirtyDataclassProperties = v6->_dirtyDataclassProperties;
    v6->_dirtyDataclassProperties = 0;

    objc_sync_exit(v6);
    v5 = v49;
  }

}

- (BOOL)isActive
{
  ACAccount *v2;
  BOOL active;

  v2 = self;
  objc_sync_enter(v2);
  active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (id)childAccountsWithAccountTypeIdentifier:(id)a3
{
  id v4;
  ACAccount *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  ACAccount *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_childAccounts)
  {
    obj = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5->_childAccounts;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "accountType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
            objc_msgSend(v6, "addObject:", v11);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v15 = obj;
    objc_sync_exit(obj);
  }
  else
  {
    objc_sync_exit(v5);

    -[ACAccount accountStore](v5, "accountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "childAccountsForAccount:withTypeIdentifier:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (ACAccountStore)accountStore
{
  ACAccount *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_accountStore);

  if (WeakRetained)
  {
    v4 = (uint64_t)objc_loadWeakRetained((id *)&v2->_accountStore);
  }
  else
  {
    +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  objc_sync_exit(v2);

  return (ACAccountStore *)v5;
}

+ (id)keypathsRequiredForInitialization
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("accountType");
  v3[1] = CFSTR("customProperties");
  v3[2] = CFSTR("parent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)dataclassProperties
{
  ACAccount *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_dataclassProperties, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (id)owningBundleID
{
  ACAccount *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_owningBundleID;
  objc_sync_exit(v2);

  return v3;
}

- (NSURL)objectID
{
  ACAccount *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_objectID;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastCredentialRenewalRejectionDate
{
  ACAccount *v3;
  NSDate *v4;

  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v3 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount lastCredentialRenewalRejectionDate](v3, "lastCredentialRenewalRejectionDate");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self;
    objc_sync_enter(v3);
    v4 = v3->_lastCredentialRenewalRejectionDate;
    objc_sync_exit(v3);
  }

  return v4;
}

- (BOOL)isWarmingUp
{
  ACAccount *v2;
  BOOL warmingUp;

  v2 = self;
  objc_sync_enter(v2);
  warmingUp = v2->_warmingUp;
  objc_sync_exit(v2);

  return warmingUp;
}

- (BOOL)isAuthenticated
{
  ACAccount *v2;
  void *v3;
  char authenticated;

  v2 = self;
  objc_sync_enter(v2);
  if (-[ACAccount _useParentForCredentials](v2, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](v2, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    authenticated = objc_msgSend(v3, "isAuthenticated");

  }
  else
  {
    authenticated = v2->_authenticated;
  }
  objc_sync_exit(v2);

  return authenticated;
}

- (NSString)credentialType
{
  ACAccount *v3;
  NSString *v4;

  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v3 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount credentialType](v3, "credentialType");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self;
    objc_sync_enter(v3);
    v4 = v3->_credentialType;
    objc_sync_exit(v3);
  }

  return v4;
}

- (void)_installCredentialsChangedObserver
{
  void *v3;
  NSObject *v4;
  NSObject *credentialsDidChangeObserver;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__ACAccount__installCredentialsChangedObserver__block_invoke;
  v6[3] = &unk_1E4892568;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("ACAccountCredentialsDidChangeNotification"), 0, 0, v6);
  v4 = objc_claimAutoreleasedReturnValue();
  credentialsDidChangeObserver = self->_credentialsDidChangeObserver;
  self->_credentialsDidChangeObserver = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (ACAccountCredential)credential
{
  return (ACAccountCredential *)-[ACAccount credentialWithError:](self, "credentialWithError:", 0);
}

- (void)_resetParentAccount:(id)a3
{
  ACAccount *v4;
  ACAccount *parentAccount;
  ACAccount *obj;

  v4 = (ACAccount *)a3;
  obj = self;
  objc_sync_enter(obj);
  parentAccount = obj->_parentAccount;
  obj->_parentAccount = v4;

  objc_sync_exit(obj);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ACAccount username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setActive:(BOOL)a3
{
  ACAccount *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_active = a3;
  -[ACAccount _unsafe_markPropertyDirty:](obj, "_unsafe_markPropertyDirty:", CFSTR("active"));
  objc_sync_exit(obj);

}

- (void)setAccountType:(ACAccountType *)accountType
{
  ACAccount *v5;
  ACAccountType *v6;

  v6 = accountType;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_accountType, accountType);
  -[ACAccount _unsafe_markPropertyDirty:](v5, "_unsafe_markPropertyDirty:", CFSTR("accountType"));
  objc_sync_exit(v5);

}

- (id)propertiesForDataclass:(id)a3
{
  id v4;
  ACAccount *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_dataclassProperties, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

void __47__ACAccount__installCredentialsChangedObserver__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "credentialsChanged:", v3);

}

- (id)_initWithProtobuf:(id)a3
{
  id v4;
  ACAccountType *v5;
  void *v6;
  id v7;
  ACAccount *v8;
  ACAccountCredential *v9;
  void *v10;
  uint64_t v11;
  ACAccountCredential *credential;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  void *v16;
  uint64_t v17;
  NSString *accountDescription;
  void *v19;
  uint64_t v20;
  NSString *username;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *properties;
  void *v25;
  uint64_t v26;
  NSDate *lastCredentialRenewalRejectionDate;
  void *v28;
  uint64_t v29;
  NSMutableDictionary *dataclassProperties;
  void *v31;
  uint64_t v32;
  NSURL *objectID;
  ACAccount *v34;
  void *v35;
  uint64_t v36;
  ACAccount *parentAccount;
  ACMutableTrackedSet *v38;
  ACMutableTrackedSet *trackedProvisionedDataclasses;
  ACMutableTrackedSet *v40;
  void *v41;
  ACMutableTrackedSet *v42;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  ACMutableTrackedSet *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSString *authenticationType;
  void *v49;
  uint64_t v50;
  NSString *credentialType;
  void *v52;
  uint64_t v53;
  NSDate *date;
  uint64_t v55;
  NSString *owningBundleID;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  NSMutableSet *dirtyProperties;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  NSMutableSet *dirtyAccountProperties;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  NSMutableSet *dirtyDataclassProperties;
  uint64_t v72;
  NSString *modificationID;
  ACAccountCredential *v74;
  ACAccount *v75;

  v4 = a3;
  v5 = [ACAccountType alloc];
  objc_msgSend(v4, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ACAccountType _initWithProtobuf:](v5, "_initWithProtobuf:", v6);

  v8 = -[ACAccount initWithAccountType:](self, "initWithAccountType:", v7);
  if (v8)
  {
    if (objc_msgSend(v4, "hasCredential"))
    {
      v9 = [ACAccountCredential alloc];
      objc_msgSend(v4, "credential");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[ACAccountCredential _initWithProtobuf:](v9, "_initWithProtobuf:", v10);
      credential = v8->_credential;
      v8->_credential = (ACAccountCredential *)v11;

    }
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v14;

    objc_msgSend(v4, "accountDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    accountDescription = v8->_accountDescription;
    v8->_accountDescription = (NSString *)v17;

    objc_msgSend(v4, "username");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    username = v8->_username;
    v8->_username = (NSString *)v20;

    objc_msgSend(v4, "propertiesDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "mutableCopy");
    properties = v8->_properties;
    v8->_properties = (NSMutableDictionary *)v23;

    v8->_authenticated = objc_msgSend(v4, "authenticated");
    if (objc_msgSend(v4, "hasLastCredentialRenewalRejectionDate"))
    {
      objc_msgSend(v4, "lastCredentialRenewalRejectionDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "date");
      v26 = objc_claimAutoreleasedReturnValue();
      lastCredentialRenewalRejectionDate = v8->_lastCredentialRenewalRejectionDate;
      v8->_lastCredentialRenewalRejectionDate = (NSDate *)v26;

    }
    v8->_active = objc_msgSend(v4, "active");
    v8->_warmingUp = objc_msgSend(v4, "warmingUp");
    v8->_visible = objc_msgSend(v4, "visible");
    v8->_supportsAuthentication = objc_msgSend(v4, "supportsAuthentication");
    objc_msgSend(v4, "dataclassPropertiesDictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "mutableCopy");
    dataclassProperties = v8->_dataclassProperties;
    v8->_dataclassProperties = (NSMutableDictionary *)v29;

    if (objc_msgSend(v4, "hasObjectID"))
    {
      objc_msgSend(v4, "objectID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "url");
      v32 = objc_claimAutoreleasedReturnValue();
      objectID = v8->_objectID;
      v8->_objectID = (NSURL *)v32;

    }
    if (objc_msgSend(v4, "hasParentAccount"))
    {
      v34 = [ACAccount alloc];
      objc_msgSend(v4, "parentAccount");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[ACAccount _initWithProtobuf:](v34, "_initWithProtobuf:", v35);
      parentAccount = v8->_parentAccount;
      v8->_parentAccount = (ACAccount *)v36;

    }
    v38 = objc_alloc_init(ACMutableTrackedSet);
    trackedProvisionedDataclasses = v8->_trackedProvisionedDataclasses;
    v8->_trackedProvisionedDataclasses = v38;

    v40 = v8->_trackedProvisionedDataclasses;
    objc_msgSend(v4, "provisionedDataclasses");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACMutableTrackedSet addObjectsFromArray:](v40, "addObjectsFromArray:", v41);

    v42 = objc_alloc_init(ACMutableTrackedSet);
    trackedEnabledDataclasses = v8->_trackedEnabledDataclasses;
    v8->_trackedEnabledDataclasses = v42;

    v44 = v8->_trackedEnabledDataclasses;
    objc_msgSend(v4, "enabledDataclasses");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACMutableTrackedSet addObjectsFromArray:](v44, "addObjectsFromArray:", v45);

    objc_msgSend(v4, "authenticationType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "copy");
    authenticationType = v8->_authenticationType;
    v8->_authenticationType = (NSString *)v47;

    objc_msgSend(v4, "credentialType");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "copy");
    credentialType = v8->_credentialType;
    v8->_credentialType = (NSString *)v50;

    objc_msgSend(v4, "date");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "date");
    v53 = objc_claimAutoreleasedReturnValue();
    date = v8->_date;
    v8->_date = (NSDate *)v53;

    objc_msgSend(v4, "owningBundleID");
    v55 = objc_claimAutoreleasedReturnValue();
    owningBundleID = v8->_owningBundleID;
    v8->_owningBundleID = (NSString *)v55;

    objc_msgSend(v4, "dirtyProperties");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      v58 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v4, "dirtyProperties");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "initWithArray:", v59);
      dirtyProperties = v8->_dirtyProperties;
      v8->_dirtyProperties = (NSMutableSet *)v60;

    }
    objc_msgSend(v4, "dirtyAccountProperties");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      v63 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v4, "dirtyAccountProperties");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v63, "initWithArray:", v64);
      dirtyAccountProperties = v8->_dirtyAccountProperties;
      v8->_dirtyAccountProperties = (NSMutableSet *)v65;

    }
    objc_msgSend(v4, "dirtyDataclassProperties");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      v68 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v4, "dirtyDataclassProperties");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v68, "initWithArray:", v69);
      dirtyDataclassProperties = v8->_dirtyDataclassProperties;
      v8->_dirtyDataclassProperties = (NSMutableSet *)v70;

    }
    objc_msgSend(v4, "modificationID");
    v72 = objc_claimAutoreleasedReturnValue();
    modificationID = v8->_modificationID;
    v8->_modificationID = (NSString *)v72;

    v74 = v8->_credential;
    if (v74)
    {
      -[ACAccountCredential _setOwningAccount:](v74, "_setOwningAccount:", v8);
      -[ACAccount _installCredentialsChangedObserver](v8, "_installCredentialsChangedObserver");
    }
    v75 = v8;
  }

  return v8;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5;
  ACProtobufAccount *v6;
  ACAccount *v7;
  void *v9;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACAccount.m"), 471, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length != 0"));

  }
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[ACProtobufAccount initWithData:]([ACProtobufAccount alloc], "initWithData:", v5);
    if (v6)
    {
      self = (ACAccount *)-[ACAccount _initWithProtobuf:](self, "_initWithProtobuf:", v6);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_encodeProtobuf
{
  void *v3;
  void *v4;
  void *v5;
  ACProtobufDate *v6;
  ACProtobufURL *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ACProtobufDate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_opt_new();
  -[ACAccountType _encodeProtobuf](self->_accountType, "_encodeProtobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountType:", v4);

  -[ACAccountCredential _encodeProtobuf](self->_credential, "_encodeProtobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCredential:", v5);

  objc_msgSend(v3, "setIdentifier:", self->_identifier);
  objc_msgSend(v3, "setAccountDescription:", self->_accountDescription);
  objc_msgSend(v3, "setUsername:", self->_username);
  if (-[NSMutableDictionary count](self->_properties, "count"))
    objc_msgSend(v3, "setPropertiesDictionary:", self->_properties);
  objc_msgSend(v3, "setAuthenticated:", self->_authenticated);
  if (self->_lastCredentialRenewalRejectionDate)
  {
    v6 = -[ACProtobufDate initWithDate:]([ACProtobufDate alloc], "initWithDate:", self->_lastCredentialRenewalRejectionDate);
    objc_msgSend(v3, "setLastCredentialRenewalRejectionDate:", v6);

  }
  objc_msgSend(v3, "setActive:", self->_active);
  objc_msgSend(v3, "setWarmingUp:", self->_warmingUp);
  objc_msgSend(v3, "setVisible:", self->_visible);
  objc_msgSend(v3, "setSupportsAuthentication:", self->_supportsAuthentication);
  if (-[NSMutableDictionary count](self->_dataclassProperties, "count"))
    objc_msgSend(v3, "setDataclassPropertiesDictionary:", self->_dataclassProperties);
  if (self->_objectID)
  {
    v7 = -[ACProtobufURL initWithURL:]([ACProtobufURL alloc], "initWithURL:", self->_objectID);
    objc_msgSend(v3, "setObjectID:", v7);

  }
  -[ACAccount _encodeProtobuf](self->_parentAccount, "_encodeProtobuf");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setParentAccount:", v8);

  -[ACTrackedSet allObjects](self->_trackedProvisionedDataclasses, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v3, "setProvisionedDataclasses:", v10);

  -[ACTrackedSet allObjects](self->_trackedEnabledDataclasses, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v3, "setEnabledDataclasses:", v12);

  objc_msgSend(v3, "setAuthenticationType:", self->_authenticationType);
  objc_msgSend(v3, "setCredentialType:", self->_credentialType);
  if (self->_date)
  {
    v13 = -[ACProtobufDate initWithDate:]([ACProtobufDate alloc], "initWithDate:", self->_date);
    objc_msgSend(v3, "setDate:", v13);

  }
  objc_msgSend(v3, "setOwningBundleID:", self->_owningBundleID);
  if (-[NSMutableSet count](self->_dirtyProperties, "count"))
  {
    -[NSMutableSet allObjects](self->_dirtyProperties, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v3, "setDirtyProperties:", v15);

  }
  if (-[NSMutableSet count](self->_dirtyAccountProperties, "count"))
  {
    -[NSMutableSet allObjects](self->_dirtyAccountProperties, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v3, "setDirtyAccountProperties:", v17);

  }
  if (-[NSMutableSet count](self->_dirtyDataclassProperties, "count"))
  {
    -[NSMutableSet allObjects](self->_dirtyDataclassProperties, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v3, "setDirtyDataclassProperties:", v19);

  }
  objc_msgSend(v3, "setModificationID:", self->_modificationID);
  return v3;
}

- (id)_encodeProtobufData
{
  void *v2;
  void *v3;

  -[ACAccount _encodeProtobuf](self, "_encodeProtobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)portableCopy
{
  void *v2;

  v2 = (void *)-[ACAccount copy](self, "copy");
  objc_msgSend(v2, "_loadAllCachedProperties");
  objc_msgSend(v2, "_setObjectID:", 0);
  return v2;
}

- (id)fullDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
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

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setTimeStyle:", 4);
  objc_msgSend(v3, "setDateStyle:", 4);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  -[ACAccount creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB3940];
  -[ACAccount accountType](self, "accountType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount identifier](self, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount accountDescription](self, "accountDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount username](self, "username");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount objectID](self, "objectID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount provisionedDataclasses](self, "provisionedDataclasses");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount enabledDataclasses](self, "enabledDataclasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount dataclassProperties](self, "dataclassProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount accountProperties](self, "accountProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount parentAccountIdentifier](self, "parentAccountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount owningBundleID](self, "owningBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ACAccount isAuthenticated](self, "isAuthenticated"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v18 = v7;
  -[ACAccount lastCredentialRenewalRejectionDate](self, "lastCredentialRenewalRejectionDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ACAccount supportsAuthentication](self, "supportsAuthentication"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v16 = v8;
  -[ACAccount authenticationType](self, "authenticationType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount credentialType](self, "credentialType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount credential](self, "credential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ACAccount isActive](self, "isActive"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (-[ACAccount isVisible](self, "isVisible"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (-[ACAccount isWarmingUp](self, "isWarmingUp"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v25, "stringWithFormat:", CFSTR("type:%@\nidentifier: %@\naccountDescription: %@\nusername: %@\nobjectID: %@\nprovisionedDataclasses: %@\nenabledDataclasses: %@\ndataclassProperties: %@\nproperties: %@\nparentAccount: %@\nowningBundleID:%@\nauthenticated: %@\nlastCredentialRenewalRejectedDate: %@\nsupportsAuthentication: %@\nauthenticationType: %@\ncredentialType: %@\ncredential: %@\ncreated: %@\nactive: %@\nvisible: %@\nwarmingUp: %@"), v31, v30, v29, v24, v23, v22, v21, v28, v20, v6, v19, v18, v17, v16, v9, v10,
    v11,
    v32,
    v12,
    v13,
    v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)credentialsChanged:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ACAccountIdentifierKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[ACAccount identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v5))
  {
    v6 = -[ACAccount isPropertyDirty:](self, "isPropertyDirty:", CFSTR("credential"));

    if (!v6)
      -[ACAccount _clearCachedCredentials](self, "_clearCachedCredentials");
  }
  else
  {

  }
}

- (BOOL)isDirty
{
  ACAccount *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableSet count](v2->_dirtyProperties, "count") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isPropertyDirty:(id)a3
{
  id v4;
  ACAccount *v5;
  char v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableSet containsObject:](v5->_dirtyProperties, "containsObject:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (void)markAllPropertiesDirty
{
  ACAccount *v2;
  NSMutableSet *dirtyProperties;
  uint64_t v4;
  NSMutableSet *v5;
  uint64_t v6;
  NSMutableSet *dirtyAccountProperties;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  dirtyProperties = v2->_dirtyProperties;
  if (!dirtyProperties)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 17);
    v5 = v2->_dirtyProperties;
    v2->_dirtyProperties = (NSMutableSet *)v4;

    dirtyProperties = v2->_dirtyProperties;
  }
  -[NSMutableSet addObject:](dirtyProperties, "addObject:", CFSTR("accountDescription"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("accountProperties"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("accountType"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("active"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("warmingUp"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("authenticated"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("lastCredentialRenewalRejectionDate"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("credential"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("dataclassProperties"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("date"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("enabledDataclasses"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("provisionedDataclasses"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("identifier"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("owningBundleID"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("parent"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("supportsAuthentication"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("username"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("visible"));
  -[NSMutableSet addObject:](v2->_dirtyProperties, "addObject:", CFSTR("modificationID"));
  if (!v2->_dirtyAccountProperties)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableDictionary count](v2->_properties, "count"));
    dirtyAccountProperties = v2->_dirtyAccountProperties;
    v2->_dirtyAccountProperties = (NSMutableSet *)v6;

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v2->_properties;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        -[NSMutableSet addObject:](v2->_dirtyAccountProperties, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_sync_exit(v2);
}

- (void)setDirty:(BOOL)a3 forProperty:(id)a4
{
  _BOOL4 v4;
  ACAccount *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  v6 = self;
  objc_sync_enter(v6);
  if (v4)
    -[ACAccount _unsafe_markPropertyDirty:](v6, "_unsafe_markPropertyDirty:", v7);
  else
    -[NSMutableSet removeObject:](v6->_dirtyProperties, "removeObject:", v7);
  objc_sync_exit(v6);

}

- (void)_markPropertyDirty:(id)a3
{
  ACAccount *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ACAccount _unsafe_markPropertyDirty:](v4, "_unsafe_markPropertyDirty:", v5);
  objc_sync_exit(v4);

}

- (void)_markAccountPropertyDirty:(id)a3
{
  ACAccount *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ACAccount _unsafe_markAccountPropertyDirty:](v4, "_unsafe_markAccountPropertyDirty:", v5);
  objc_sync_exit(v4);

}

- (void)_unsafe_markAccountPropertyDirty:(id)a3
{
  id v4;
  NSMutableSet *dirtyAccountProperties;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  dirtyAccountProperties = self->_dirtyAccountProperties;
  v8 = v4;
  if (!dirtyAccountProperties)
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v7 = self->_dirtyAccountProperties;
    self->_dirtyAccountProperties = v6;

    v4 = v8;
    dirtyAccountProperties = self->_dirtyAccountProperties;
  }
  -[NSMutableSet addObject:](dirtyAccountProperties, "addObject:", v4);

}

- (void)_markDataclassPropertyDirty:(id)a3
{
  ACAccount *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ACAccount _unsafe_markDataclassPropertyDirty:](v4, "_unsafe_markDataclassPropertyDirty:", v5);
  objc_sync_exit(v4);

}

- (void)_unsafe_markDataclassPropertyDirty:(id)a3
{
  id v4;
  NSMutableSet *dirtyDataclassProperties;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  dirtyDataclassProperties = self->_dirtyDataclassProperties;
  v8 = v4;
  if (!dirtyDataclassProperties)
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v7 = self->_dirtyDataclassProperties;
    self->_dirtyDataclassProperties = v6;

    v4 = v8;
    dirtyDataclassProperties = self->_dirtyDataclassProperties;
  }
  -[NSMutableSet addObject:](dirtyDataclassProperties, "addObject:", v4);

}

- (void)_markCredentialDirty
{
  -[ACAccount _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("credential"));
}

- (void)_clearDirtyProperties
{
  NSMutableSet *dirtyProperties;
  NSMutableSet *dirtyAccountProperties;
  NSMutableSet *dirtyDataclassProperties;
  ACAccount *v5;
  ACMutableTrackedSet *v6;
  void *v7;
  uint64_t v8;
  ACMutableTrackedSet *trackedProvisionedDataclasses;
  ACMutableTrackedSet *v10;
  void *v11;
  uint64_t v12;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  ACAccountCredential *credential;
  ACAccount *obj;

  obj = self;
  objc_sync_enter(obj);
  dirtyProperties = obj->_dirtyProperties;
  obj->_dirtyProperties = 0;

  dirtyAccountProperties = obj->_dirtyAccountProperties;
  obj->_dirtyAccountProperties = 0;

  dirtyDataclassProperties = obj->_dirtyDataclassProperties;
  obj->_dirtyDataclassProperties = 0;

  v5 = obj;
  if (obj->_trackedProvisionedDataclasses)
  {
    v6 = [ACMutableTrackedSet alloc];
    -[ACTrackedSet allObjects](obj->_trackedProvisionedDataclasses, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ACTrackedSet initWithArray:](v6, "initWithArray:", v7);
    trackedProvisionedDataclasses = obj->_trackedProvisionedDataclasses;
    obj->_trackedProvisionedDataclasses = (ACMutableTrackedSet *)v8;

    v5 = obj;
  }
  v5->_wasProvisionedDataclassesReset = 0;
  if (v5->_trackedEnabledDataclasses)
  {
    v10 = [ACMutableTrackedSet alloc];
    -[ACTrackedSet allObjects](obj->_trackedEnabledDataclasses, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ACTrackedSet initWithArray:](v10, "initWithArray:", v11);
    trackedEnabledDataclasses = obj->_trackedEnabledDataclasses;
    obj->_trackedEnabledDataclasses = (ACMutableTrackedSet *)v12;

    v5 = obj;
  }
  v5->_wasEnabledDataclassesReset = 0;
  credential = v5->_credential;
  if (credential)
    -[ACAccountCredential _clearDirtyProperties](credential, "_clearDirtyProperties");
  objc_sync_exit(obj);

}

- (void)setIdentifier:(id)a3
{
  ACAccount *v4;
  uint64_t v5;
  NSString *identifier;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  -[ACAccount _unsafe_markPropertyDirty:](v4, "_unsafe_markPropertyDirty:", CFSTR("identifier"));
  objc_sync_exit(v4);

}

- (void)setAuthenticationType:(id)a3
{
  ACAccount *v4;
  uint64_t v5;
  NSString *authenticationType;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  authenticationType = v4->_authenticationType;
  v4->_authenticationType = (NSString *)v5;

  -[ACAccount _unsafe_markPropertyDirty:](v4, "_unsafe_markPropertyDirty:", CFSTR("authenticationType"));
  objc_sync_exit(v4);

}

- (void)setCredentialType:(id)a3
{
  ACAccount *v4;
  uint64_t v5;
  NSString *credentialType;
  id v7;

  v7 = a3;
  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v4 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setCredentialType:](v4, "setCredentialType:", v7);
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = objc_msgSend(v7, "copy");
    credentialType = v4->_credentialType;
    v4->_credentialType = (NSString *)v5;

    -[ACAccount _unsafe_markPropertyDirty:](v4, "_unsafe_markPropertyDirty:", CFSTR("credentialType"));
    objc_sync_exit(v4);
  }

}

- (void)setUsername:(NSString *)username
{
  ACAccount *v4;
  uint64_t v5;
  NSString *v6;
  NSString *v7;

  v7 = username;
  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v4 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setUsername:](v4, "setUsername:", v7);
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = -[NSString copy](v7, "copy");
    v6 = v4->_username;
    v4->_username = (NSString *)v5;

    -[ACAccount _unsafe_markPropertyDirty:](v4, "_unsafe_markPropertyDirty:", CFSTR("username"));
    objc_sync_exit(v4);
  }

}

- (NSString)userFullName
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("firstName"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("lastName")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("firstName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGivenName:", v7);

    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("middleName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMiddleName:", v8);

    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("lastName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFamilyName:", v9);

    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v6, 2, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ACAccount accountProperties](self, "accountProperties");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("ACPropertyFullName"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return (NSString *)v11;
}

- (void)setCredential:(ACAccountCredential *)credential
{
  ACAccount *v5;
  ACAccountCredential *v6;

  v6 = credential;
  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setCredential:](v5, "setCredential:", v6);
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    -[ACAccountCredential _setOwningAccount:](v5->_credential, "_setOwningAccount:", 0);
    objc_storeStrong((id *)&v5->_credential, credential);
    if (!v5->_credentialsDidChangeObserver)
      -[ACAccount _installCredentialsChangedObserver](v5, "_installCredentialsChangedObserver");
    -[ACAccountCredential _setOwningAccount:](v5->_credential, "_setOwningAccount:", v5);
    -[ACAccount _unsafe_markPropertyDirty:](v5, "_unsafe_markPropertyDirty:", CFSTR("credential"));
    -[ACAccount setLastCredentialRenewalRejectionDate:](v5, "setLastCredentialRenewalRejectionDate:", 0);
    objc_sync_exit(v5);
  }

}

- (ACAccountCredential)internalCredential
{
  ACAccount *v3;
  ACAccountCredential *v4;

  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v3 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount internalCredential](v3, "internalCredential");
    v4 = (ACAccountCredential *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self;
    objc_sync_enter(v3);
    v4 = v3->_credential;
    objc_sync_exit(v3);
  }

  return v4;
}

- (void)setAccountDescription:(NSString *)accountDescription
{
  void *v4;
  ACAccount *v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;

  v8 = accountDescription;
  -[ACAccount parentAccount](self, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = -[NSString copy](v8, "copy");
    v7 = v5->_accountDescription;
    v5->_accountDescription = (NSString *)v6;

    -[ACAccount _unsafe_markPropertyDirty:](v5, "_unsafe_markPropertyDirty:", CFSTR("accountDescription"));
    objc_sync_exit(v5);

  }
}

- (void)setOwningBundleID:(id)a3
{
  ACAccount *v4;
  uint64_t v5;
  NSString *owningBundleID;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  owningBundleID = v4->_owningBundleID;
  v4->_owningBundleID = (NSString *)v5;

  -[ACAccount _unsafe_markPropertyDirty:](v4, "_unsafe_markPropertyDirty:", CFSTR("owningBundleID"));
  objc_sync_exit(v4);

}

- (NSDate)creationDate
{
  ACAccount *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_date;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCreationDate:(id)a3
{
  ACAccount *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_date, a3);
  -[ACAccount _unsafe_markPropertyDirty:](v5, "_unsafe_markPropertyDirty:", CFSTR("date"));
  objc_sync_exit(v5);

}

- (void)setAccountProperties:(id)a3
{
  id v4;
  ACAccount *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *properties;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v5->_properties;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        -[ACAccount _markAccountPropertyDirty:](v5, "_markAccountPropertyDirty:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  -[ACAccount willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("accountProperties"));
  v10 = objc_msgSend(v4, "mutableCopy");
  properties = v5->_properties;
  v5->_properties = (NSMutableDictionary *)v10;

  -[ACAccount didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("accountProperties"));
  -[ACAccount _unsafe_markPropertyDirty:](v5, "_unsafe_markPropertyDirty:", CFSTR("accountProperties"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v5->_properties;
  v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        -[ACAccount _markAccountPropertyDirty:](v5, "_markAccountPropertyDirty:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  objc_sync_exit(v5);
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6;
  ACAccount *v7;
  NSMutableDictionary *properties;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  properties = v7->_properties;
  if (!properties)
  {
    -[ACAccount willChangeValueForKey:](v7, "willChangeValueForKey:", CFSTR("accountProperties"));
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v7->_properties;
    v7->_properties = v9;

    -[ACAccount didChangeValueForKey:](v7, "didChangeValueForKey:", CFSTR("accountProperties"));
    properties = v7->_properties;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v12 && (!v12 || (objc_msgSend(v11, "isEqual:", v12) & 1) == 0))
  {
    -[NSMutableDictionary setValue:forKey:](v7->_properties, "setValue:forKey:", v12, v6);
    -[ACAccount _unsafe_markPropertyDirty:](v7, "_unsafe_markPropertyDirty:", CFSTR("accountProperties"));
    -[ACAccount _markAccountPropertyDirty:](v7, "_markAccountPropertyDirty:", v6);
  }

  objc_sync_exit(v7);
}

- (void)setAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  ACAccount *obj;

  v3 = a3;
  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    obj = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setAuthenticated:](obj, "setAuthenticated:", v3);
  }
  else
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_authenticated = v3;
    -[ACAccount _unsafe_markPropertyDirty:](obj, "_unsafe_markPropertyDirty:", CFSTR("authenticated"));
    if (v3)
      -[ACAccount setLastCredentialRenewalRejectionDate:](obj, "setLastCredentialRenewalRejectionDate:", 0);
    objc_sync_exit(obj);
  }

}

- (void)setLastCredentialRenewalRejectionDate:(id)a3
{
  ACAccount *v5;
  id v6;

  v6 = a3;
  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setLastCredentialRenewalRejectionDate:](v5, "setLastCredentialRenewalRejectionDate:", v6);
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    objc_storeStrong((id *)&v5->_lastCredentialRenewalRejectionDate, a3);
    -[ACAccount _unsafe_markPropertyDirty:](v5, "_unsafe_markPropertyDirty:", CFSTR("lastCredentialRenewalRejectionDate"));
    objc_sync_exit(v5);
  }

}

- (void)setWarmingUp:(BOOL)a3
{
  ACAccount *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_warmingUp = a3;
  -[ACAccount _unsafe_markPropertyDirty:](obj, "_unsafe_markPropertyDirty:", CFSTR("warmingUp"));
  objc_sync_exit(obj);

}

- (unint64_t)credentialLocation
{
  ACAccount *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  -[ACAccount propertyForKey:](v2, "propertyForKey:", CFSTR("CredentialStorageLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") <= 1)
  {
    v4 = (void *)objc_msgSend(v3, "unsignedIntegerValue");
  }
  else
  {
    -[ACAccount parentAccount](v2, "parentAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ACAccount parentAccount](v2, "parentAccount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v5, "credentialLocation");

    }
  }

  objc_sync_exit(v2);
  return (unint64_t)v4;
}

- (void)setCredentialLocation:(unint64_t)a3
{
  NSObject *v4;
  id v5;

  if (a3 > 1)
  {
    _ACLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ACAccount setCredentialLocation:].cold.1();

    -[ACAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", &unk_1E48A1998, CFSTR("CredentialStorageLocation"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ACAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("CredentialStorageLocation"));

  }
}

- (BOOL)isVisible
{
  ACAccount *v2;
  BOOL visible;

  v2 = self;
  objc_sync_enter(v2);
  visible = v2->_visible;
  objc_sync_exit(v2);

  return visible;
}

- (void)setVisible:(BOOL)a3
{
  ACAccount *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_visible = a3;
  -[ACAccount _unsafe_markPropertyDirty:](obj, "_unsafe_markPropertyDirty:", CFSTR("visible"));
  objc_sync_exit(obj);

}

- (BOOL)supportsAuthentication
{
  ACAccount *v3;
  BOOL supportsAuthentication;

  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v3 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    supportsAuthentication = -[ACAccount supportsAuthentication](v3, "supportsAuthentication");
  }
  else
  {
    v3 = self;
    objc_sync_enter(v3);
    supportsAuthentication = v3->_supportsAuthentication;
    objc_sync_exit(v3);
  }

  return supportsAuthentication;
}

- (void)setSupportsAuthentication:(BOOL)a3
{
  _BOOL8 v3;
  ACAccount *obj;

  v3 = a3;
  if (-[ACAccount _useParentForCredentials](self, "_useParentForCredentials"))
  {
    -[ACAccount parentAccount](self, "parentAccount");
    obj = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setSupportsAuthentication:](obj, "setSupportsAuthentication:", v3);
  }
  else
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_supportsAuthentication = v3;
    -[ACAccount _unsafe_markPropertyDirty:](obj, "_unsafe_markPropertyDirty:", CFSTR("supportsAuthentication"));
    objc_sync_exit(obj);
  }

}

- (BOOL)supportsPush
{
  ACAccount *v2;
  void *v3;

  v2 = self;
  -[ACAccount accountStore](self, "accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isPushSupportedForAccount:", v2);

  return (char)v2;
}

- (void)setParentAccount:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  ACAccount *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  objc_msgSend(v12, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v13 = CFSTR("account");
    v14[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("ACAccount can't be its own parent"), v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  v8 = self;
  objc_sync_enter(v8);
  objc_storeStrong((id *)&v8->_parentAccount, a3);
  -[ACAccount _unsafe_markPropertyDirty:](v8, "_unsafe_markPropertyDirty:", CFSTR("parent"));
  objc_sync_exit(v8);

}

- (ACAccount)displayAccount
{
  void *v3;
  void *v4;
  ACAccount *v5;
  ACAccount *v6;

  -[ACAccount parentAccount](self, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "displayAccount");
    v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self;
  }
  v6 = v5;

  return v6;
}

- (NSArray)childAccounts
{
  void *v3;
  void *v4;
  ACAccount *v5;
  ACAccount *v6;
  NSArray *v7;

  if (self->_haveCheckedForChildAccounts)
  {
    v3 = 0;
  }
  else
  {
    self->_haveCheckedForChildAccounts = 1;
    -[ACAccount accountStore](self, "accountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "childAccountsForAccount:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = self;
    objc_sync_enter(v5);
    objc_storeStrong((id *)&v5->_childAccounts, v3);
    objc_sync_exit(v5);

  }
  v6 = self;
  objc_sync_enter(v6);
  v7 = v6->_childAccounts;
  objc_sync_exit(v6);

  return v7;
}

- (void)_setModID:(id)a3
{
  NSString *v4;
  NSString *modificationID;
  ACAccount *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  modificationID = obj->_modificationID;
  obj->_modificationID = v4;

  objc_sync_exit(obj);
}

- (ACTrackedSet)trackedProvisionedDataclasses
{
  ACAccount *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[ACMutableTrackedSet copy](v2->_trackedProvisionedDataclasses, "copy");
  objc_sync_exit(v2);

  return (ACTrackedSet *)v3;
}

- (id)changeTypeForProvisionedDataclass:(id)a3
{
  id v4;
  void *v5;
  ACAccount *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;

  v4 = a3;
  -[ACAccount parentAccount](self, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v6 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount changeTypeForProvisionedDataclass:](v6, "changeTypeForProvisionedDataclass:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    if (v6->_trackedEnabledDataclasses)
    {
      -[ACTrackedSet allModifications](v6->_trackedProvisionedDataclasses, "allModifications");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("ACChangeTypeNone");
      if (v9)
        v11 = (__CFString *)v9;
      v7 = v11;

    }
    else
    {
      v7 = CFSTR("ACChangeTypeNone");
    }
    objc_sync_exit(v6);
  }

  return v7;
}

- (NSMutableSet)provisionedDataclasses
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  ACAccount *v9;
  ACAccount *v10;

  -[ACAccount parentAccount](self, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provisionedDataclasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (id)objc_msgSend(v5, "mutableCopy");
    -[ACAccount accountType](self, "accountType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "supportedDataclasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intersectSet:", v8);

  }
  else
  {
    v9 = self;
    objc_sync_enter(v9);
    if (v9->_trackedProvisionedDataclasses)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithTrackedSet:");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_sync_exit(v9);

    if (!v6)
    {
      v10 = v9;
      objc_sync_enter(v10);
      -[ACAccount _unsafe_loadProvisionedDataclasses](v10, "_unsafe_loadProvisionedDataclasses");
      if (v9->_trackedProvisionedDataclasses)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithTrackedSet:");
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      objc_sync_exit(v10);

      if (!v6)
        v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    }
  }
  return (NSMutableSet *)v6;
}

- (void)_unsafe_loadProvisionedDataclasses
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A2BCD000, v0, v1, "\"Failed to fetch provisioned dataclasses, error: %@\", v2);
  OUTLINED_FUNCTION_0();
}

- (void)setProvisionedDataclasses:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ACAccount *v13;
  ACMutableTrackedSet *v14;
  ACMutableTrackedSet *trackedProvisionedDataclasses;
  ACMutableTrackedSet *v16;
  void *v17;

  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACAccount setProvisionedDataclasses:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = self;
  objc_sync_enter(v13);
  v14 = objc_alloc_init(ACMutableTrackedSet);
  trackedProvisionedDataclasses = v13->_trackedProvisionedDataclasses;
  v13->_trackedProvisionedDataclasses = v14;

  v16 = v13->_trackedProvisionedDataclasses;
  objc_msgSend(v4, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACMutableTrackedSet addObjectsFromArray:](v16, "addObjectsFromArray:", v17);

  v13->_wasProvisionedDataclassesReset = 1;
  -[ACAccount _unsafe_markPropertyDirty:](v13, "_unsafe_markPropertyDirty:", CFSTR("provisionedDataclasses"));
  objc_sync_exit(v13);

}

- (BOOL)isProvisionedForDataclass:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ACAccount provisionedDataclasses](self, "provisionedDataclasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setProvisioned:(BOOL)a3 forDataclass:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  ACAccount *v9;
  void *v10;
  void *v11;
  ACAccount *v12;
  NSObject *v13;
  ACAccount *v14;
  ACMutableTrackedSet *v15;
  ACMutableTrackedSet *trackedProvisionedDataclasses;
  id v17;
  _QWORD v18[4];
  id v19;
  ACAccount *v20;
  BOOL v21;

  v6 = a4;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__ACAccount_setProvisioned_forDataclass___block_invoke;
  v18[3] = &unk_1E4893C88;
  v21 = a3;
  v7 = v6;
  v19 = v7;
  v20 = self;
  v8 = (void (**)(_QWORD))MEMORY[0x1A858A038](v18);
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_trackedProvisionedDataclasses)
  {
    v8[2](v8);
    objc_sync_exit(v9);
  }
  else
  {
    objc_sync_exit(v9);

    -[ACAccount accountStore](v9, "accountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v10, "provisionedDataclassesForAccount:error:", v9, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (ACAccount *)v17;

    if (v12)
    {
      _ACLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ACAccount _unsafe_loadProvisionedDataclasses].cold.2();

    }
    v14 = v9;
    objc_sync_enter(v14);
    if (!v9->_trackedProvisionedDataclasses)
    {
      if (v11)
        v15 = -[ACTrackedSet initWithSet:]([ACMutableTrackedSet alloc], "initWithSet:", v11);
      else
        v15 = objc_alloc_init(ACMutableTrackedSet);
      trackedProvisionedDataclasses = v9->_trackedProvisionedDataclasses;
      v9->_trackedProvisionedDataclasses = v15;

    }
    ((void (*)(void (**)(_QWORD), ACMutableTrackedSet *))v8[2])(v8, v9->_trackedProvisionedDataclasses);
    objc_sync_exit(v14);

    v9 = v12;
  }

}

uint64_t __41__ACAccount_setProvisioned_forDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(a2, "addObject:", v3);
  else
    objc_msgSend(a2, "removeObject:", v3);
  return objc_msgSend(*(id *)(a1 + 40), "_unsafe_markPropertyDirty:", CFSTR("provisionedDataclasses"));
}

- (ACTrackedSet)trackedEnabledDataclasses
{
  ACAccount *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[ACMutableTrackedSet copy](v2->_trackedEnabledDataclasses, "copy");
  objc_sync_exit(v2);

  return (ACTrackedSet *)v3;
}

- (id)changeTypeForEnabledDataclass:(id)a3
{
  id v4;
  void *v5;
  ACAccount *v6;
  __CFString *v7;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;

  v4 = a3;
  -[ACAccount parentAccount](self, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v6 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount changeTypeForEnabledDataclass:](v6, "changeTypeForEnabledDataclass:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    trackedEnabledDataclasses = v6->_trackedEnabledDataclasses;
    if (trackedEnabledDataclasses)
    {
      -[ACTrackedSet allModifications](trackedEnabledDataclasses, "allModifications");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v4);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("ACChangeTypeNone");
      if (v10)
        v12 = (__CFString *)v10;
      v7 = v12;

    }
    else
    {
      v7 = CFSTR("ACChangeTypeNone");
    }
    objc_sync_exit(v6);
  }

  return v7;
}

- (void)_unsafe_loadEnabledDataclasses
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A2BCD000, v0, v1, "\"Failed to fetch enabled dataclasses, error: %@\", v2);
  OUTLINED_FUNCTION_0();
}

- (void)setEnabledDataclasses:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ACAccount *v15;
  ACMutableTrackedSet *v16;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  ACMutableTrackedSet *v18;
  void *v19;
  void *v20;

  v5 = a3;
  -[ACAccount parentAccount](self, "parentAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACAccount.m"), 1509, CFSTR("You can't enable dataclasses on child accounts"));

  }
  _ACLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACAccount setEnabledDataclasses:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  v15 = self;
  objc_sync_enter(v15);
  v16 = objc_alloc_init(ACMutableTrackedSet);
  trackedEnabledDataclasses = v15->_trackedEnabledDataclasses;
  v15->_trackedEnabledDataclasses = v16;

  v18 = v15->_trackedEnabledDataclasses;
  objc_msgSend(v5, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACMutableTrackedSet addObjectsFromArray:](v18, "addObjectsFromArray:", v19);

  v15->_wasEnabledDataclassesReset = 1;
  -[ACAccount _unsafe_markPropertyDirty:](v15, "_unsafe_markPropertyDirty:", CFSTR("enabledDataclasses"));
  objc_sync_exit(v15);

}

- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  ACAccount *v11;
  void *v12;
  void *v13;
  ACAccount *v14;
  NSObject *v15;
  ACAccount *v16;
  ACMutableTrackedSet *v17;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  ACAccount *v23;
  BOOL v24;

  v7 = a4;
  -[ACAccount parentAccount](self, "parentAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACAccount.m"), 1532, CFSTR("You can't enable dataclasses on child accounts"));

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __37__ACAccount_setEnabled_forDataclass___block_invoke;
  v21[3] = &unk_1E4893C88;
  v24 = a3;
  v9 = v7;
  v22 = v9;
  v23 = self;
  v10 = (void (**)(_QWORD))MEMORY[0x1A858A038](v21);
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_trackedEnabledDataclasses)
  {
    v10[2](v10);
    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    -[ACAccount accountStore](v11, "accountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v12, "enabledDataclassesForAccount:error:", v11, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (ACAccount *)v20;

    if (v14)
    {
      _ACLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ACAccount _unsafe_loadEnabledDataclasses].cold.2();

    }
    v16 = v11;
    objc_sync_enter(v16);
    if (!v11->_trackedEnabledDataclasses)
    {
      if (v13)
        v17 = -[ACTrackedSet initWithSet:]([ACMutableTrackedSet alloc], "initWithSet:", v13);
      else
        v17 = objc_alloc_init(ACMutableTrackedSet);
      trackedEnabledDataclasses = v11->_trackedEnabledDataclasses;
      v11->_trackedEnabledDataclasses = v17;

    }
    ((void (*)(void (**)(_QWORD), ACMutableTrackedSet *))v10[2])(v10, v11->_trackedEnabledDataclasses);
    objc_sync_exit(v16);

    v11 = v14;
  }

}

uint64_t __37__ACAccount_setEnabled_forDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(a2, "addObject:", v3);
  else
    objc_msgSend(a2, "removeObject:", v3);
  return objc_msgSend(*(id *)(a1 + 40), "_unsafe_markPropertyDirty:", CFSTR("enabledDataclasses"));
}

- (BOOL)isEnabledToSyncDataclass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[ACAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", v4))
  {
    -[ACAccount accountType](self, "accountType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncableDataclasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setDataclassProperties:(id)a3
{
  id v4;
  ACAccount *v5;
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5->_dataclassProperties;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        -[ACAccount _markDataclassPropertyDirty:](v5, "_markDataclassPropertyDirty:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        -[ACAccount _markDataclassPropertyDirty:](v5, "_markDataclassPropertyDirty:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  -[ACAccount willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("dataclassProperties"));
  objc_storeStrong((id *)&v5->_dataclassProperties, v6);
  -[ACAccount didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("dataclassProperties"));
  -[ACAccount _unsafe_markPropertyDirty:](v5, "_unsafe_markPropertyDirty:", CFSTR("dataclassProperties"));

  objc_sync_exit(v5);
}

- (void)setProperties:(id)a3 forDataclass:(id)a4
{
  id v6;
  ACAccount *v7;
  id v8;
  NSMutableDictionary *dataclassProperties;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[ACAccount propertiesForDataclass:](v7, "propertiesForDataclass:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v12 && (!v8 || (objc_msgSend(v8, "isEqual:", v12) & 1) == 0))
  {
    dataclassProperties = v7->_dataclassProperties;
    if (!dataclassProperties)
    {
      -[ACAccount willChangeValueForKey:](v7, "willChangeValueForKey:", CFSTR("dataclassProperties"));
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = v7->_dataclassProperties;
      v7->_dataclassProperties = v10;

      -[ACAccount didChangeValueForKey:](v7, "didChangeValueForKey:", CFSTR("dataclassProperties"));
      dataclassProperties = v7->_dataclassProperties;
    }
    -[NSMutableDictionary setObject:forKey:](dataclassProperties, "setObject:forKey:", v12, v6);
    -[ACAccount _markDataclassPropertyDirty:](v7, "_markDataclassPropertyDirty:", v6);
    -[ACAccount _unsafe_markPropertyDirty:](v7, "_unsafe_markPropertyDirty:", CFSTR("dataclassProperties"));
  }

  objc_sync_exit(v7);
}

- (void)_setObjectID:(id)a3
{
  ACAccount *v4;
  uint64_t v5;
  NSURL *objectID;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  objectID = v4->_objectID;
  v4->_objectID = (NSURL *)v5;

  objc_sync_exit(v4);
}

- (void)takeValuesFromModifiedAccount:(id)a3
{
  ACAccount *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSString *accountDescription;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  NSString *username;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *properties;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  NSString *owningBundleID;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  NSMutableDictionary *dataclassProperties;
  void *v30;
  int v31;
  void *v32;
  int v33;
  uint64_t v34;
  NSDate *lastCredentialRenewalRejectionDate;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  uint64_t v44;
  ACAccountType *accountType;
  void *v46;
  int v47;
  uint64_t v48;
  ACAccountCredential *credential;
  void *v50;
  int v51;
  uint64_t v52;
  ACAccount *parentAccount;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  ACMutableTrackedSet *trackedProvisionedDataclasses;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  void *v64;
  int v65;
  uint64_t v66;
  NSString *credentialType;
  void *v68;
  int v69;
  uint64_t v70;
  NSString *authenticationType;
  void *v72;
  int v73;
  uint64_t v74;
  NSString *modificationID;
  NSMutableSet *dirtyProperties;
  uint64_t v77;
  NSMutableSet *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  NSMutableSet *v82;
  NSMutableSet *dirtyAccountProperties;
  uint64_t v84;
  NSMutableSet *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSMutableSet *v89;
  NSMutableSet *dirtyDataclassProperties;
  uint64_t v91;
  NSMutableSet *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  NSMutableSet *v96;
  _BYTE *v97;

  v97 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v97, "dirtyProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("accountDescription"));

  if (v6)
  {
    objc_msgSend(v97, "accountDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    accountDescription = v4->_accountDescription;
    v4->_accountDescription = (NSString *)v8;

  }
  objc_msgSend(v97, "dirtyProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("username"));

  if (v11)
  {
    objc_msgSend(v97, "username");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    username = v4->_username;
    v4->_username = (NSString *)v13;

  }
  objc_msgSend(v97, "dirtyProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", CFSTR("accountProperties"));

  if (v16)
  {
    -[ACAccount willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("accountProperties"));
    objc_msgSend(v97, "accountProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "mutableCopy");
    properties = v4->_properties;
    v4->_properties = (NSMutableDictionary *)v18;

    -[ACAccount didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("accountProperties"));
  }
  objc_msgSend(v97, "dirtyProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", CFSTR("owningBundleID"));

  if (v21)
  {
    objc_msgSend(v97, "owningBundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    owningBundleID = v4->_owningBundleID;
    v4->_owningBundleID = (NSString *)v23;

  }
  objc_msgSend(v97, "dirtyProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "containsObject:", CFSTR("dataclassProperties"));

  if (v26)
  {
    -[ACAccount willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("dataclassProperties"));
    objc_msgSend(v97, "dataclassProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "mutableCopy");
    dataclassProperties = v4->_dataclassProperties;
    v4->_dataclassProperties = (NSMutableDictionary *)v28;

    -[ACAccount didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("dataclassProperties"));
  }
  objc_msgSend(v97, "dirtyProperties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "containsObject:", CFSTR("authenticated"));

  if (v31)
    v4->_authenticated = objc_msgSend(v97, "isAuthenticated");
  objc_msgSend(v97, "dirtyProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "containsObject:", CFSTR("lastCredentialRenewalRejectionDate"));

  if (v33)
  {
    objc_msgSend(v97, "lastCredentialRenewalRejectionDate");
    v34 = objc_claimAutoreleasedReturnValue();
    lastCredentialRenewalRejectionDate = v4->_lastCredentialRenewalRejectionDate;
    v4->_lastCredentialRenewalRejectionDate = (NSDate *)v34;

  }
  objc_msgSend(v97, "dirtyProperties");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "containsObject:", CFSTR("active"));

  if (v37)
    v4->_active = objc_msgSend(v97, "isActive");
  objc_msgSend(v97, "dirtyProperties");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "containsObject:", CFSTR("warmingUp"));

  if (v39)
    v4->_warmingUp = objc_msgSend(v97, "isWarmingUp");
  objc_msgSend(v97, "dirtyProperties");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v40, "containsObject:", CFSTR("accountType")) & 1) != 0)
  {
    objc_msgSend(v97, "accountType");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount identifier](v4, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if ((v43 & 1) == 0)
    {
      -[ACAccount willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("accountType"));
      objc_msgSend(v97, "accountType");
      v44 = objc_claimAutoreleasedReturnValue();
      accountType = v4->_accountType;
      v4->_accountType = (ACAccountType *)v44;

      -[ACAccount didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("accountType"));
    }
  }
  else
  {

  }
  objc_msgSend(v97, "dirtyProperties");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "containsObject:", CFSTR("credential"));

  if (v47)
  {
    objc_msgSend(v97, "internalCredential");
    v48 = objc_claimAutoreleasedReturnValue();
    credential = v4->_credential;
    v4->_credential = (ACAccountCredential *)v48;

    if (!v4->_credentialsDidChangeObserver)
      -[ACAccount _installCredentialsChangedObserver](v4, "_installCredentialsChangedObserver");
  }
  objc_msgSend(v97, "dirtyProperties");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "containsObject:", CFSTR("parent"));

  if (v51)
  {
    objc_msgSend(v97, "parentAccount");
    v52 = objc_claimAutoreleasedReturnValue();
    parentAccount = v4->_parentAccount;
    v4->_parentAccount = (ACAccount *)v52;

  }
  objc_msgSend(v97, "dirtyProperties");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "containsObject:", CFSTR("provisionedDataclasses"));

  if (v55)
  {
    objc_msgSend(v97, "trackedProvisionedDataclasses");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "mutableCopy");
    trackedProvisionedDataclasses = v4->_trackedProvisionedDataclasses;
    v4->_trackedProvisionedDataclasses = (ACMutableTrackedSet *)v57;

    v4->_wasProvisionedDataclassesReset = v97[216];
  }
  objc_msgSend(v97, "dirtyProperties");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "containsObject:", CFSTR("enabledDataclasses"));

  if (v60)
  {
    objc_msgSend(v97, "trackedEnabledDataclasses");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "mutableCopy");
    trackedEnabledDataclasses = v4->_trackedEnabledDataclasses;
    v4->_trackedEnabledDataclasses = (ACMutableTrackedSet *)v62;

    v4->_wasEnabledDataclassesReset = v97[217];
  }
  objc_msgSend(v97, "dirtyProperties");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "containsObject:", CFSTR("credentialType"));

  if (v65)
  {
    objc_msgSend(v97, "credentialType");
    v66 = objc_claimAutoreleasedReturnValue();
    credentialType = v4->_credentialType;
    v4->_credentialType = (NSString *)v66;

  }
  objc_msgSend(v97, "dirtyProperties");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "containsObject:", CFSTR("authenticationType"));

  if (v69)
  {
    objc_msgSend(v97, "authenticationType");
    v70 = objc_claimAutoreleasedReturnValue();
    authenticationType = v4->_authenticationType;
    v4->_authenticationType = (NSString *)v70;

  }
  objc_msgSend(v97, "dirtyProperties");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "containsObject:", CFSTR("modificationID"));

  if (v73)
  {
    objc_msgSend(v97, "modificationID");
    v74 = objc_claimAutoreleasedReturnValue();
    modificationID = v4->_modificationID;
    v4->_modificationID = (NSString *)v74;

  }
  dirtyProperties = v4->_dirtyProperties;
  if (!dirtyProperties)
  {
    v77 = objc_opt_new();
    v78 = v4->_dirtyProperties;
    v4->_dirtyProperties = (NSMutableSet *)v77;

    dirtyProperties = v4->_dirtyProperties;
  }
  objc_msgSend(v97, "dirtyProperties");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet setByAddingObjectsFromSet:](dirtyProperties, "setByAddingObjectsFromSet:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "mutableCopy");
  v82 = v4->_dirtyProperties;
  v4->_dirtyProperties = (NSMutableSet *)v81;

  dirtyAccountProperties = v4->_dirtyAccountProperties;
  if (!dirtyAccountProperties)
  {
    v84 = objc_opt_new();
    v85 = v4->_dirtyAccountProperties;
    v4->_dirtyAccountProperties = (NSMutableSet *)v84;

    dirtyAccountProperties = v4->_dirtyAccountProperties;
  }
  objc_msgSend(v97, "dirtyAccountProperties");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet setByAddingObjectsFromSet:](dirtyAccountProperties, "setByAddingObjectsFromSet:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "mutableCopy");
  v89 = v4->_dirtyAccountProperties;
  v4->_dirtyAccountProperties = (NSMutableSet *)v88;

  dirtyDataclassProperties = v4->_dirtyDataclassProperties;
  if (!dirtyDataclassProperties)
  {
    v91 = objc_opt_new();
    v92 = v4->_dirtyDataclassProperties;
    v4->_dirtyDataclassProperties = (NSMutableSet *)v91;

    dirtyDataclassProperties = v4->_dirtyDataclassProperties;
  }
  objc_msgSend(v97, "dirtyDataclassProperties");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet setByAddingObjectsFromSet:](dirtyDataclassProperties, "setByAddingObjectsFromSet:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "mutableCopy");
  v96 = v4->_dirtyDataclassProperties;
  v4->_dirtyDataclassProperties = (NSMutableSet *)v95;

  objc_sync_exit(v4);
}

- (void)refresh
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ACAccount *v7;
  void *v8;
  uint64_t v9;
  NSString *accountDescription;
  void *v11;
  uint64_t v12;
  NSString *username;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  NSString *owningBundleID;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  char v53;
  void *v54;
  uint64_t v55;
  NSMutableDictionary *dataclassProperties;
  uint64_t v57;
  NSDate *lastCredentialRenewalRejectionDate;
  void *v59;
  uint64_t v60;
  NSURL *objectID;
  uint64_t v62;
  ACAccountType *accountType;
  ACAccountCredential *credential;
  uint64_t v65;
  NSString *authenticationType;
  uint64_t v67;
  NSString *credentialType;
  uint64_t v69;
  ACAccount *parentAccount;
  void *v71;
  uint64_t v72;
  NSString *modificationID;
  ACMutableTrackedSet *trackedProvisionedDataclasses;
  ACMutableTrackedSet *trackedEnabledDataclasses;
  NSArray *childAccounts;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  -[ACAccount dirtyProperties](self, "dirtyProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[ACAccount accountStore](self, "accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithIdentifier:", v6);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      v7 = self;
      objc_sync_enter(v7);
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("accountDescription")) & 1) == 0)
      {
        objc_msgSend(v77, "accountDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "copy");
        accountDescription = v7->_accountDescription;
        v7->_accountDescription = (NSString *)v9;

      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("username")) & 1) == 0)
      {
        objc_msgSend(v77, "username");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "copy");
        username = v7->_username;
        v7->_username = (NSString *)v12;

      }
      -[ACAccount willChangeValueForKey:](v7, "willChangeValueForKey:", CFSTR("accountProperties"));
      objc_msgSend(v77, "accountProperties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v91;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v91 != v18)
              objc_enumerationMutation(v16);
            v20 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v19);
            -[ACAccount dirtyAccountProperties](v7, "dirtyAccountProperties");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "containsObject:", v20);

            if ((v22 & 1) == 0)
            {
              objc_msgSend(v77, "objectForKeyedSubscript:", v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_properties, "setObject:forKeyedSubscript:", v23, v20);

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
        }
        while (v17);
      }

      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      -[ACAccount accountProperties](v7, "accountProperties");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allKeys");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v87;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v87 != v27)
              objc_enumerationMutation(v25);
            v29 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v28);
            -[ACAccount dirtyAccountProperties](v7, "dirtyAccountProperties");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "containsObject:", v29);

            if ((v31 & 1) == 0 && (objc_msgSend(v16, "containsObject:", v29) & 1) == 0)
              -[NSMutableDictionary removeObjectForKey:](v7->_properties, "removeObjectForKey:", v29);
            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
        }
        while (v26);
      }

      -[ACAccount didChangeValueForKey:](v7, "didChangeValueForKey:", CFSTR("accountProperties"));
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("owningBundleID")) & 1) == 0)
      {
        objc_msgSend(v77, "owningBundleID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "copy");
        owningBundleID = v7->_owningBundleID;
        v7->_owningBundleID = (NSString *)v33;

      }
      -[ACAccount willChangeValueForKey:](v7, "willChangeValueForKey:", CFSTR("dataclassProperties"));
      objc_msgSend(v77, "dataclassProperties");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "allKeys");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v37 = v36;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v83;
        do
        {
          v40 = 0;
          do
          {
            if (*(_QWORD *)v83 != v39)
              objc_enumerationMutation(v37);
            v41 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v40);
            -[ACAccount dirtyDataclassProperties](v7, "dirtyDataclassProperties");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "containsObject:", v41);

            if ((v43 & 1) == 0)
            {
              objc_msgSend(v77, "dataclassProperties");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objectForKeyedSubscript:", v41);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_dataclassProperties, "setObject:forKeyedSubscript:", v45, v41);

            }
            ++v40;
          }
          while (v38 != v40);
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
        }
        while (v38);
      }

      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      -[ACAccount accountProperties](v7, "accountProperties");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "allKeys");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v79;
        do
        {
          v50 = 0;
          do
          {
            if (*(_QWORD *)v79 != v49)
              objc_enumerationMutation(v47);
            v51 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v50);
            -[ACAccount dirtyDataclassProperties](v7, "dirtyDataclassProperties");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "containsObject:", v51);

            if ((v53 & 1) == 0 && (objc_msgSend(v37, "containsObject:", v51) & 1) == 0)
              -[NSMutableDictionary removeObjectForKey:](v7->_dataclassProperties, "removeObjectForKey:", v51);
            ++v50;
          }
          while (v48 != v50);
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
        }
        while (v48);
      }

      -[ACAccount didChangeValueForKey:](v7, "didChangeValueForKey:", CFSTR("dataclassProperties"));
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("dataclassProperties")) & 1) == 0)
      {
        objc_msgSend(v77, "dataclassProperties");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "mutableCopy");
        dataclassProperties = v7->_dataclassProperties;
        v7->_dataclassProperties = (NSMutableDictionary *)v55;

      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("authenticated")) & 1) == 0)
        v7->_authenticated = objc_msgSend(v77, "isAuthenticated");
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("lastCredentialRenewalRejectionDate")) & 1) == 0)
      {
        objc_msgSend(v77, "lastCredentialRenewalRejectionDate");
        v57 = objc_claimAutoreleasedReturnValue();
        lastCredentialRenewalRejectionDate = v7->_lastCredentialRenewalRejectionDate;
        v7->_lastCredentialRenewalRejectionDate = (NSDate *)v57;

      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("active")) & 1) == 0)
        v7->_active = objc_msgSend(v77, "isActive");
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("warmingUp")) & 1) == 0)
        v7->_warmingUp = objc_msgSend(v77, "isWarmingUp");
      objc_msgSend(v77, "objectID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "copy");
      objectID = v7->_objectID;
      v7->_objectID = (NSURL *)v60;

      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("accountType")) & 1) == 0)
      {
        objc_msgSend(v77, "accountType");
        v62 = objc_claimAutoreleasedReturnValue();
        accountType = v7->_accountType;
        v7->_accountType = (ACAccountType *)v62;

      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("credential")) & 1) == 0)
      {
        credential = v7->_credential;
        v7->_credential = 0;

      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("authenticationType")) & 1) == 0)
      {
        objc_msgSend(v77, "authenticationType");
        v65 = objc_claimAutoreleasedReturnValue();
        authenticationType = v7->_authenticationType;
        v7->_authenticationType = (NSString *)v65;

      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("credentialType")) & 1) == 0)
      {
        objc_msgSend(v77, "credentialType");
        v67 = objc_claimAutoreleasedReturnValue();
        credentialType = v7->_credentialType;
        v7->_credentialType = (NSString *)v67;

      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("parent")) & 1) == 0)
      {
        objc_msgSend(v77, "parentAccount");
        v69 = objc_claimAutoreleasedReturnValue();
        parentAccount = v7->_parentAccount;
        v7->_parentAccount = (ACAccount *)v69;

      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("modificationID")) & 1) == 0)
      {
        objc_msgSend(v77, "modificationID");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "copy");
        modificationID = v7->_modificationID;
        v7->_modificationID = (NSString *)v72;

      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("provisionedDataclasses")) & 1) == 0)
      {
        trackedProvisionedDataclasses = v7->_trackedProvisionedDataclasses;
        v7->_trackedProvisionedDataclasses = 0;

        v7->_wasProvisionedDataclassesReset = 0;
      }
      if ((-[NSMutableSet containsObject:](v7->_dirtyProperties, "containsObject:", CFSTR("enabledDataclasses")) & 1) == 0)
      {
        trackedEnabledDataclasses = v7->_trackedEnabledDataclasses;
        v7->_trackedEnabledDataclasses = 0;

        v7->_wasEnabledDataclassesReset = 0;
      }
      childAccounts = v7->_childAccounts;
      v7->_childAccounts = 0;

      v7->_haveCheckedForChildAccounts = 0;
      objc_sync_exit(v7);

    }
  }
  else
  {
    -[ACAccount reload](self, "reload");
  }
}

- (void)_loadAllCachedProperties
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = -[ACAccount enabledDataclasses](self, "enabledDataclasses");
  v4 = -[ACAccount provisionedDataclasses](self, "provisionedDataclasses");
  v5 = -[ACAccount credential](self, "credential");
  -[ACAccount parentAccount](self, "parentAccount");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_loadAllCachedProperties");

}

- (id)accountByCleaningThirdPartyTransformations
{
  void *v3;
  ACAccount *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *properties;

  -[ACAccount accountPropertiesTransformer](self, "accountPropertiesTransformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (ACAccount *)-[ACAccount copy](self, "copy");
    (*((void (**)(void))v4->_accountPropertiesTransformer + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mutableCopy");
    properties = v4->_properties;
    v4->_properties = (NSMutableDictionary *)v6;

  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (NSString)clientToken
{
  void *v3;
  NSString *v4;
  NSString *v5;
  ACAccount *v6;
  NSString *v7;
  void *v8;
  ACAccount *v9;
  NSString *clientToken;

  -[ACAccount parentAccount](self, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[NSString clientToken](v4, "clientToken");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = v6->_clientToken;
    objc_sync_exit(v6);

    if (!v7)
    {
      if (v6->_haveCheckedForClientToken)
      {
        v7 = 0;
      }
      else
      {
        v6->_haveCheckedForClientToken = 1;
        -[ACAccount accountStore](v6, "accountStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "clientTokenForAccount:", v6);
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();

      }
    }
    v9 = v6;
    objc_sync_enter(v9);
    clientToken = v6->_clientToken;
    v6->_clientToken = v7;
    v4 = v7;

    v5 = v6->_clientToken;
    objc_sync_exit(v9);

  }
  return v5;
}

- (BOOL)addClientToken:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  ACAccount *v8;
  void *v9;
  int v10;

  v5 = a3;
  -[ACAccount parentAccount](self, "parentAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6 == 0;
  if (v6)
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v8 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    -[ACAccount addClientToken:](v8, "addClientToken:", v5);
  }
  else
  {
    if (!v5
      || (-[ACAccount accountStore](self, "accountStore"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "addClientToken:forAccount:", v5, self),
          v9,
          !v10))
    {
      v7 = 0;
      goto LABEL_8;
    }
    v8 = self;
    objc_sync_enter(v8);
    objc_storeStrong((id *)&v8->_clientToken, a3);
    objc_sync_exit(v8);
  }

LABEL_8:
  return v7;
}

- (id)defaultAutodiscoverDomainForChildType:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;

  v4 = (__CFString *)a3;
  -[ACAccount accountType](self, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("com.apple.account.IMAP");
  v8 = CFSTR("com.apple.account.CalDAV");
  v9 = CFSTR("com.apple.account.CardDAV");
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __51__ACAccount_defaultAutodiscoverDomainForChildType___block_invoke;
  v25 = &unk_1E4893CB0;
  v10 = v7;
  v26 = v10;
  v11 = v8;
  v27 = v11;
  v12 = v9;
  v28 = v12;
  v29 = CFSTR("fallback");
  if (defaultAutodiscoverDomainForChildType__onceToken != -1)
    dispatch_once(&defaultAutodiscoverDomainForChildType__onceToken, &v22);
  -[ACAccount username](self, "username", v22, v23, v24, v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsString:", CFSTR("@yahoo.co.jp"));

  if (v14)
  {
    if ((-[__CFString isEqualToString:](v4, "isEqualToString:", v11) & 1) != 0)
    {
      v15 = CFSTR("caldav.calendar.yahoo.co.jp");
      goto LABEL_15;
    }
    if ((-[__CFString isEqualToString:](v4, "isEqualToString:", v12) & 1) != 0)
    {
      v15 = CFSTR("carddav.address.yahoo.co.jp");
      goto LABEL_15;
    }
  }
  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.account.POP")) & 1) != 0
    || -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.account.SMTP")))
  {
    v16 = v10;

    v4 = v16;
  }
  objc_msgSend((id)defaultAutodiscoverDomainForChildType__domainMap, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v15 = v18;
  }
  else
  {
    objc_msgSend((id)defaultAutodiscoverDomainForChildType__domainMap, "objectForKeyedSubscript:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("fallback"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_15:

  return v15;
}

void __51__ACAccount_defaultAutodiscoverDomainForChildType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[3];
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];
  __int128 v20;
  uint64_t v21;
  _QWORD v22[3];
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[4];
  _QWORD v33[7];
  _QWORD v34[8];

  v34[7] = *MEMORY[0x1E0C80C00];
  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(_OWORD *)(a1 + 40);
  v32[0] = CFSTR("gmail.com");
  v32[1] = CFSTR("apidata.googleusercontent.com");
  v31 = *(_QWORD *)(a1 + 56);
  v32[2] = CFSTR("www.googleapis.com");
  v32[3] = CFSTR("google.com");
  v33[0] = CFSTR("com.apple.account.Google");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v29, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v2;
  v33[1] = CFSTR("com.apple.account.aol");
  v26 = *(_OWORD *)(a1 + 40);
  v28[0] = CFSTR("caldav.aol.com");
  v28[1] = CFSTR("carddav.aol.com");
  v27 = *(_QWORD *)(a1 + 56);
  v28[2] = CFSTR("aol.com");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v26, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v3;
  v33[2] = CFSTR("com.apple.account.Yahoo");
  v23 = *(_OWORD *)(a1 + 40);
  v25[0] = CFSTR("caldav.calendar.yahoo.com");
  v25[1] = CFSTR("carddav.address.yahoo.com");
  v24 = *(_QWORD *)(a1 + 56);
  v25[2] = CFSTR("yahoo.com");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v23, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v4;
  v33[3] = CFSTR("com.apple.facebook");
  v20 = *(_OWORD *)(a1 + 40);
  v22[0] = CFSTR("webdav.facebook.com");
  v22[1] = CFSTR("webdav.facebook.com");
  v21 = *(_QWORD *)(a1 + 56);
  v22[2] = CFSTR("facebook.com");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v20, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v5;
  v33[4] = CFSTR("com.apple.account.qq");
  v17 = *(_OWORD *)(a1 + 40);
  v19[0] = CFSTR("dav.qq.com");
  v19[1] = CFSTR("dav.qq.com");
  v18 = *(_QWORD *)(a1 + 56);
  v19[2] = CFSTR("qq.com");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v17, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v6;
  v33[5] = CFSTR("com.apple.account.126");
  v14 = *(_OWORD *)(a1 + 40);
  v16[0] = CFSTR("caldav.126.com");
  v16[1] = CFSTR("contacts.126.com");
  v15 = *(_QWORD *)(a1 + 56);
  v16[2] = CFSTR("126.com");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v14, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v7;
  v33[6] = CFSTR("com.apple.account.163");
  v11 = *(_OWORD *)(a1 + 40);
  v13[0] = CFSTR("caldav.163.com");
  v13[1] = CFSTR("contacts.163.com");
  v12 = *(_QWORD *)(a1 + 56);
  v13[2] = CFSTR("163.com");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)defaultAutodiscoverDomainForChildType__domainMap;
  defaultAutodiscoverDomainForChildType__domainMap = v9;

}

- (NSSet)dirtyAccountProperties
{
  ACAccount *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableSet copy](v2->_dirtyAccountProperties, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (NSSet)dirtyDataclassProperties
{
  ACAccount *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableSet copy](v2->_dirtyDataclassProperties, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (NSString)shortDebugName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ACAccount username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\" (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_applyDirtyStateFromAccount:(id)a3
{
  id v4;
  ACAccount *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  ACAccountCredential *credential;
  _QWORD v29[5];
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
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
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v4, "dirtyProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v40;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v6);
        -[ACAccount _unsafe_markPropertyDirty:](v5, "_unsafe_markPropertyDirty:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v7);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v4, "dirtyAccountProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v36;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v10);
        -[ACAccount _unsafe_markAccountPropertyDirty:](v5, "_unsafe_markAccountPropertyDirty:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v11);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "dirtyDataclassProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v14);
        -[ACAccount _unsafe_markDataclassPropertyDirty:](v5, "_unsafe_markDataclassPropertyDirty:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v15);
  }

  objc_msgSend(v4, "trackedEnabledDataclasses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[ACAccount trackedEnabledDataclasses](v5, "trackedEnabledDataclasses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
      -[ACAccount _unsafe_loadEnabledDataclasses](v5, "_unsafe_loadEnabledDataclasses");
  }
  objc_msgSend(v4, "trackedEnabledDataclasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __41__ACAccount__applyDirtyStateFromAccount___block_invoke;
  v30[3] = &unk_1E4893CD8;
  v30[4] = v5;
  objc_msgSend(v21, "enumerateModificationsUsingBlock:", v30);

  objc_msgSend(v4, "trackedProvisionedDataclasses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ACAccount trackedProvisionedDataclasses](v5, "trackedProvisionedDataclasses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24 == 0;

    if (v25)
      -[ACAccount _unsafe_loadProvisionedDataclasses](v5, "_unsafe_loadProvisionedDataclasses");
  }
  objc_msgSend(v4, "trackedProvisionedDataclasses");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v22;
  v29[1] = 3221225472;
  v29[2] = __41__ACAccount__applyDirtyStateFromAccount___block_invoke_2;
  v29[3] = &unk_1E4893CD8;
  v29[4] = v5;
  objc_msgSend(v26, "enumerateModificationsUsingBlock:", v29);

  objc_msgSend(v4, "internalCredential");
  v27 = objc_claimAutoreleasedReturnValue();
  credential = v5->_credential;
  v5->_credential = (ACAccountCredential *)v27;

  objc_sync_exit(v5);
}

void __41__ACAccount__applyDirtyStateFromAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("ACChangeTypeAdded")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addObject:", v6);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ACChangeTypeRemoved")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObject:", v6);
  }

}

void __41__ACAccount__applyDirtyStateFromAccount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("ACChangeTypeAdded")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addObject:", v6);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ACChangeTypeRemoved")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeObject:", v6);
  }

}

- (BOOL)_isDifferentFrom:(id)a3
{
  id v4;
  ACAccount *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSDate *lastCredentialRenewalRejectionDate;
  void *v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  int active;
  int v19;
  NSString *identifier;
  void *v21;
  id v22;
  NSDate *date;
  void *v24;
  id v25;
  NSString *authenticationType;
  void *v27;
  id v28;
  NSString *accountDescription;
  void *v30;
  id v31;
  NSString *owningBundleID;
  void *v33;
  char v34;
  NSString *username;
  void *v36;
  NSString *credentialType;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    objc_msgSend(v4, "dirtyProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (!v9)
      goto LABEL_62;
    v10 = *(_QWORD *)v46;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v11);
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("lastCredentialRenewalRejectionDate")))
        {
          lastCredentialRenewalRejectionDate = v5->_lastCredentialRenewalRejectionDate;
          objc_msgSend(v4, "lastCredentialRenewalRejectionDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = lastCredentialRenewalRejectionDate;
          v16 = v14;
          v17 = (unint64_t)v16;
          if (v15 && v16)
          {
LABEL_10:
            if ((objc_msgSend((id)v15, "isEqual:", v17) & 1) == 0)
              goto LABEL_60;
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:
          if (v15 | v17)
          {
LABEL_60:

LABEL_61:
            LOBYTE(v9) = 1;
            goto LABEL_62;
          }
          goto LABEL_37;
        }
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("dataclassProperties")) & 1) != 0)
          goto LABEL_61;
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("active")))
        {
          active = v5->_active;
          v19 = objc_msgSend(v4, "isActive");
          goto LABEL_19;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("warmingUp")))
        {
          active = v5->_warmingUp;
          v19 = objc_msgSend(v4, "isWarmingUp");
          goto LABEL_19;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("authenticated")))
        {
          active = v5->_authenticated;
          v19 = objc_msgSend(v4, "isAuthenticated");
          goto LABEL_19;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("identifier")))
        {
          identifier = v5->_identifier;
          objc_msgSend(v4, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = identifier;
          v22 = v21;
          v17 = (unint64_t)v22;
          if (v15 && v22)
            goto LABEL_10;
          goto LABEL_36;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("date")))
        {
          date = v5->_date;
          objc_msgSend(v4, "creationDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = date;
          v25 = v24;
          v17 = (unint64_t)v25;
          if (v15 && v25)
            goto LABEL_10;
          goto LABEL_36;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("authenticationType")))
        {
          authenticationType = v5->_authenticationType;
          objc_msgSend(v4, "authenticationType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = authenticationType;
          v28 = v27;
          v17 = (unint64_t)v28;
          if (v15 && v28)
            goto LABEL_10;
          goto LABEL_36;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("accountDescription")))
        {
          accountDescription = v5->_accountDescription;
          objc_msgSend(v4, "accountDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = accountDescription;
          v31 = v30;
          v17 = (unint64_t)v31;
          if (v15 && v31)
            goto LABEL_10;
          goto LABEL_36;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("supportsAuthentication")))
        {
          active = v5->_supportsAuthentication;
          v19 = objc_msgSend(v4, "supportsAuthentication");
LABEL_19:
          if (active != v19)
            goto LABEL_61;
          goto LABEL_38;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("owningBundleID")))
        {
          owningBundleID = v5->_owningBundleID;
          objc_msgSend(v4, "owningBundleID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = ACIsEqualOrNil(owningBundleID, v33);

          goto LABEL_48;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("username")))
        {
          username = v5->_username;
          objc_msgSend(v4, "username");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = ACIsEqualOrNil(username, v36);

          goto LABEL_48;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("credentialType")))
        {
          credentialType = v5->_credentialType;
          objc_msgSend(v4, "credentialType");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = ACIsEqualOrNil(credentialType, v38);

LABEL_48:
          if ((v34 & 1) == 0)
            goto LABEL_61;
          goto LABEL_38;
        }
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("provisionedDataclasses")) & 1) != 0)
          goto LABEL_61;
        if (!objc_msgSend(v12, "isEqualToString:", CFSTR("accountType")))
        {
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("enabledDataclasses")) & 1) != 0
            || !objc_msgSend(v12, "isEqualToString:", CFSTR("visible")))
          {
            goto LABEL_61;
          }
          active = v5->_visible;
          v19 = objc_msgSend(v4, "isVisible");
          goto LABEL_19;
        }
        -[ACAccountType identifier](v5->_accountType, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accountType");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = ACIsEqualOrNil(v44, v40);

        if ((v43 & 1) == 0)
          goto LABEL_61;
LABEL_38:
        ++v11;
      }
      while (v9 != v11);
      v41 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      v9 = v41;
      if (!v41)
      {
LABEL_62:

        goto LABEL_63;
      }
    }
  }
  LOBYTE(v9) = 0;
LABEL_63:
  objc_sync_exit(v5);

  return v9;
}

- (void)setSecIdentity:(__SecIdentity *)a3
{
  __CFDictionary *Mutable;
  uint64_t v6;
  NSObject *v7;
  CFTypeRef result;

  if (a3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70E8], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7020], (const void *)*MEMORY[0x1E0C9AE50]);
    result = 0;
    v6 = SecItemAdd(Mutable, &result);
    if ((_DWORD)v6 == -25299)
      v6 = SecItemCopyMatching(Mutable, &result);
    v7 = result;
    if (!result || (_DWORD)v6)
    {
      _ACLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ACAccount setSecIdentity:].cold.1(v6, v7);
    }
    else
    {
      -[ACAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", result, CFSTR("SecIdentityPersistentRef"));
    }

    CFRelease(Mutable);
  }
  else
  {
    -[ACAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", 0, CFSTR("SecIdentityPersistentRef"));
  }
}

- (__SecIdentity)copySecIdentity
{
  void *v2;
  __CFDictionary *Mutable;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  CFTypeRef result;

  result = 0;
  -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("SecIdentityPersistentRef"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CB0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7028], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70E0], v2);
  v4 = SecItemCopyMatching(Mutable, &result);
  if ((_DWORD)v4)
  {
    v5 = v4;
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACAccount setSecIdentity:].cold.1(v5, v6);

  }
  CFRelease(Mutable);
  return (__SecIdentity *)result;
}

- (void)setSecCertificates:(id)a3
{
  id v4;
  unint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  void *v11;
  __CFDictionary *Mutable;
  uint64_t v13;
  NSObject *v14;
  ACAccount *v15;
  void *v16;
  const __CFAllocator *allocator;
  CFTypeRef result;
  int v19;
  _DWORD v20[7];

  *(_QWORD *)&v20[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = self;
    v16 = (void *)objc_opt_new();
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v6 = (const void *)*MEMORY[0x1E0CD6C98];
      v7 = (const void *)*MEMORY[0x1E0CD6CA0];
      v8 = (const void *)*MEMORY[0x1E0CD70E8];
      v9 = (const void *)*MEMORY[0x1E0CD7020];
      v10 = (const void *)*MEMORY[0x1E0C9AE50];
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        result = 0;
        Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
        CFDictionaryAddValue(Mutable, v6, v7);
        CFDictionaryAddValue(Mutable, v8, v11);
        CFDictionaryAddValue(Mutable, v9, v10);
        v13 = SecItemAdd(Mutable, &result);
        if ((_DWORD)v13 == -25299)
          v13 = SecItemCopyMatching(Mutable, &result);
        if ((_DWORD)v13)
        {
          _ACLogSystem();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[ACAccount setSecCertificates:].cold.1(&v19, v13, v20);
        }
        else
        {
          v14 = result;
          objc_msgSend(v16, "addObject:", result);
        }

        CFRelease(Mutable);
        ++v5;
      }
      while (objc_msgSend(v4, "count") > v5);
    }
    if (objc_msgSend(v16, "count"))
      -[ACAccount setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v16, CFSTR("SecCertificatePersistentRefs"));

  }
  else
  {
    -[ACAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", 0, CFSTR("SecCertificatePersistentRefs"));
  }

}

- (id)secCertificates
{
  const __CFAllocator *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  void *v12;
  void *v13;
  __CFDictionary *Mutable;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  ACAccount *v21;
  __CFArray *theArray;
  void *value;
  CFTypeRef result;
  int v25;
  _DWORD v26[7];

  *(_QWORD *)&v26[5] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("SecCertificatePersistentRefs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("SecCertificatePersistentRefs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      v8 = (const void *)*MEMORY[0x1E0CD6C98];
      value = (void *)*MEMORY[0x1E0CD6CA0];
      v9 = (const void *)*MEMORY[0x1E0CD7028];
      v10 = (const void *)*MEMORY[0x1E0C9AE50];
      v11 = (const void *)*MEMORY[0x1E0CD70E0];
      v21 = self;
      do
      {
        -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("SecCertificatePersistentRefs"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        result = 0;
        Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
        CFDictionaryAddValue(Mutable, v8, value);
        CFDictionaryAddValue(Mutable, v9, v10);
        CFDictionaryAddValue(Mutable, v11, v13);
        v15 = SecItemCopyMatching(Mutable, &result);
        v16 = v15;
        if (!result || (_DWORD)v15)
        {
          _ACLogSystem();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[ACAccount setSecCertificates:].cold.1(&v25, v16, v26);

          self = v21;
          if (!Mutable)
            goto LABEL_12;
        }
        else
        {
          CFArrayAppendValue(theArray, result);
          if (!Mutable)
            goto LABEL_12;
        }
        CFRelease(Mutable);
LABEL_12:
        if (result)
          CFRelease(result);
        ++v7;
        -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("SecCertificatePersistentRefs"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

      }
      while (v19 > v7);
    }
  }
  else
  {
    theArray = 0;
  }
  return theArray;
}

- (BOOL)isDataSeparatedAccount
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;

  -[ACAccount personaIdentifier](self, "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  -[ACAccount dirtyProperties](self, "dirtyProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("PersonaIdentifier"));

  if (!v9)
    return 0;
  _ACPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACAccount isDataSeparatedAccount].cold.1();

  -[ACAccount dirtyProperties](self, "dirtyProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("PersonaIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
LABEL_2:
  +[ACPersonaManager sharedInstance](ACPersonaManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enterprisePersonaUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5
     || (objc_msgSend(v4, "updatePersonasUIDs"),
         objc_msgSend(v4, "enterprisePersonaUID"),
         (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    && (objc_msgSend(v5, "isEqualToString:", v3) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "guestPersonasUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v3);

  }
  return v6;
}

- (BOOL)correctPersonaScopedForAccount
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEnterprisePersona") & 1) != 0)
  {
    if (-[ACAccount isDataSeparatedAccount](self, "isDataSeparatedAccount"))
      goto LABEL_12;
    goto LABEL_9;
  }
  v5 = objc_msgSend(v4, "isGuestPersona");
  if (-[ACAccount isDataSeparatedAccount](self, "isDataSeparatedAccount"))
  {
    if ((v5 & 1) == 0)
    {
      _ACPLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[ACAccount correctPersonaScopedForAccount].cold.2((uint64_t)self, v4);
      goto LABEL_11;
    }
LABEL_12:
    v7 = 1;
    goto LABEL_13;
  }
  if (!v5)
    goto LABEL_12;
LABEL_9:
  _ACPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ACAccount correctPersonaScopedForAccount].cold.1((uint64_t)self, v4);
LABEL_11:

  v7 = 0;
LABEL_13:

  return v7;
}

- (id)childCardDAVAccountIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[ACAccount childAccountsWithAccountTypeIdentifier:](self, "childAccountsWithAccountTypeIdentifier:", CFSTR("com.apple.account.CardDAV"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!-[ACAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", CFSTR("com.apple.Dataclass.Contacts")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "identifier");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("childCardDAVAccountIdentifier"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (void)setChildCardDAVAccountIdentifier:(id)a3
{
  -[ACAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", a3, CFSTR("childCardDAVAccountIdentifier"));
}

- (NSString)managingOwnerIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[ACAccount parentAccount](self, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ManagingOwnerIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("ManagingOwnerIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (void)setManagingOwnerIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[ACAccount parentAccount](self, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACAccount setManagingOwnerIdentifier:].cold.1();

  }
  else
  {
    -[ACAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("ManagingOwnerIdentifier"));
  }

}

- (NSString)managingSourceName
{
  void *v3;
  void *v4;
  void *v5;

  -[ACAccount parentAccount](self, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACAccount parentAccount](self, "parentAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ManagingSourceName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("ManagingSourceName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (void)setManagingSourceName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[ACAccount parentAccount](self, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACAccount setManagingSourceName:].cold.1();

  }
  else
  {
    -[ACAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("ManagingSourceName"));
  }

}

- (void)setTrackedProvisionedDataclasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)wasProvisionedDataclassesReset
{
  return self->_wasProvisionedDataclassesReset;
}

- (void)setTrackedEnabledDataclasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)wasEnabledDataclassesReset
{
  return self->_wasEnabledDataclassesReset;
}

- (void)setAccountPropertiesTransformer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void)initWithManagedAccount:(_QWORD *)a3 .cold.1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A2BCD000, a4, (uint64_t)a3, "\"Unexpecteed nil value for %@\", a2);

}

- (void)setCredentialLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A2BCD000, v0, v1, "\"Invalid ACAccountCredentialStorageOption %lu, falling back to qualified username\", v2);
  OUTLINED_FUNCTION_0();
}

- (void)setProvisionedDataclasses:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, a1, a3, "\"%{private}s Deprecated method called, please file a radar!\", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_0();
}

- (void)setEnabledDataclasses:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, a1, a3, "\"%{private}s Deprecated method called, please file a radar!\", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_0();
}

- (void)isEnabledForDataclass:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1A2BCD000, v0, v1, "\"-[ACAccount isEnabledForDataclass:] should not be relied on to get the status of FMiP. It may return inaccurate results. Use AAUIDeviceLocatorService instead.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)qualifiedUsername
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "\"Exchange qualified: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)setSecIdentity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A2BCD000, a2, v4, "\"Failed with status %@\", v5);

  OUTLINED_FUNCTION_6_0();
}

- (void)setSecCertificates:(_QWORD *)a3 .cold.1(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_9_0(&dword_1A2BCD000, v6, v7, "\"Failed with status %@\");

  OUTLINED_FUNCTION_12_0();
}

- (void)isDataSeparatedAccount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1A2BCD000, v0, v1, "\"Dirty properties contain Persona identifier. Gotta use it or we will find nothing\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)correctPersonaScopedForAccount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13_0(a1, a2);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_8_0(&dword_1A2BCD000, v2, v3, "\"Operation not scoped in enterprise or guest persona for data separated account %@, persona type %ld\", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_0();
}

- (void)setManagingOwnerIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"no-op: setManagingOwnerIdentifier called on child account\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)setManagingSourceName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"no-op: setManagingSourceName called on child account\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
