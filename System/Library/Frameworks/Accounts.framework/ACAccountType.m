@implementation ACAccountType

- (NSSet)accessKeys
{
  ACAccountType *v2;
  NSSet *accessKeys;
  id WeakRetained;
  uint64_t v5;
  NSSet *v6;
  NSSet *v7;

  v2 = self;
  objc_sync_enter(v2);
  accessKeys = v2->_accessKeys;
  if (!accessKeys)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->_accountStore);
    objc_msgSend(WeakRetained, "accessKeysForAccountType:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_accessKeys;
    v2->_accessKeys = (NSSet *)v5;

    accessKeys = v2->_accessKeys;
  }
  v7 = accessKeys;
  objc_sync_exit(v2);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningBundleID, 0);
  objc_storeStrong((id *)&self->_accessKeys, 0);
  objc_storeStrong((id *)&self->_syncableDataclasses, 0);
  objc_storeStrong((id *)&self->_supportedDataclasses, 0);
  objc_destroyWeak((id *)&self->_accountStore);
  objc_storeStrong((id *)&self->_credentialProtectionPolicy, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accountTypeDescription, 0);
}

- (void)setAccountStore:(id)a3
{
  objc_storeWeak((id *)&self->_accountStore, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id WeakRetained;
  uint64_t v23;
  void *v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountTypeDescription, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSURL copyWithZone:](self->_objectID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  *(_DWORD *)(v5 + 40) = self->_visibility;
  v12 = -[NSString copyWithZone:](self->_credentialType, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_credentialProtectionPolicy, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  *(_DWORD *)(v5 + 64) = self->_supportsAuthentication;
  *(_BYTE *)(v5 + 68) = self->_supportsMultipleAccounts;
  v16 = -[NSSet copyWithZone:](self->_supportedDataclasses, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[NSSet copyWithZone:](self->_syncableDataclasses, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = -[NSSet copyWithZone:](self->_accessKeys, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accountStore);
  objc_storeWeak((id *)(v5 + 56), WeakRetained);

  v23 = -[NSString copyWithZone:](self->_owningBundleID, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v23;

  *(_BYTE *)(v5 + 69) = self->_obsolete;
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACAccountType)initWithManagedAccountType:(id)a3
{
  id v4;
  ACAccountType *v5;
  uint64_t v6;
  NSString *accountTypeDescription;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  NSURL *objectID;
  void *v13;
  uint64_t v14;
  NSString *credentialType;
  uint64_t v16;
  NSString *credentialProtectionPolicy;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *owningBundleID;
  void *v22;
  ACAccountType *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ACAccountType;
  v5 = -[ACAccountType init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "accountTypeDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    accountTypeDescription = v5->_accountTypeDescription;
    v5->_accountTypeDescription = (NSString *)v6;

    objc_msgSend(v4, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URIRepresentation");
    v11 = objc_claimAutoreleasedReturnValue();
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v11;

    objc_msgSend(v4, "visibility");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_visibility = objc_msgSend(v13, "intValue");

    objc_msgSend(v4, "credentialType");
    v14 = objc_claimAutoreleasedReturnValue();
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v14;

    objc_msgSend(v4, "credentialProtectionPolicy");
    v16 = objc_claimAutoreleasedReturnValue();
    credentialProtectionPolicy = v5->_credentialProtectionPolicy;
    v5->_credentialProtectionPolicy = (NSString *)v16;

    objc_msgSend(v4, "supportsAuthentication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsAuthentication = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "supportsMultipleAccounts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsMultipleAccounts = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "owningBundleID");
    v20 = objc_claimAutoreleasedReturnValue();
    owningBundleID = v5->_owningBundleID;
    v5->_owningBundleID = (NSString *)v20;

    objc_msgSend(v4, "obsolete");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_obsolete = objc_msgSend(v22, "BOOLValue");

    v23 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[ACAccountType identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[ACAccountType accountTypeDescription](self, "accountTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("accountTypeDescription"));

  -[ACAccountType objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("objectID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ACAccountType visibility](self, "visibility"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("visibility"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_credentialType, CFSTR("credentialType"));
  -[ACAccountType credentialProtectionPolicy](self, "credentialProtectionPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("credentialProtectionPolicy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACAccountType supportsAuthentication](self, "supportsAuthentication") != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("supportsAuthentication"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACAccountType supportsMultipleAccounts](self, "supportsMultipleAccounts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("supportsMultipleAccounts"));

  -[ACAccountType owningBundleID](self, "owningBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("owningBundleID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACAccountType isObsolete](self, "isObsolete"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("obsolete"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_syncableDataclasses, CFSTR("syncableDataclasses"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_supportedDataclasses, CFSTR("supportedDataclasses"));

}

- (NSURL)objectID
{
  return self->_objectID;
}

- (id)credentialProtectionPolicy
{
  ACAccountType *v2;
  NSString *credentialProtectionPolicy;
  uint64_t v4;
  NSString *v5;
  NSString *v6;

  v2 = self;
  objc_sync_enter(v2);
  credentialProtectionPolicy = v2->_credentialProtectionPolicy;
  if (!credentialProtectionPolicy)
  {
    v4 = objc_msgSend((id)*MEMORY[0x1E0CD68A8], "copy");
    v5 = v2->_credentialProtectionPolicy;
    v2->_credentialProtectionPolicy = (NSString *)v4;

    credentialProtectionPolicy = v2->_credentialProtectionPolicy;
  }
  v6 = credentialProtectionPolicy;
  objc_sync_exit(v2);

  return v6;
}

- (int)supportsAuthentication
{
  ACAccountType *v2;
  int supportsAuthentication;

  v2 = self;
  objc_sync_enter(v2);
  supportsAuthentication = v2->_supportsAuthentication;
  if (!supportsAuthentication)
    v2->_supportsAuthentication = 0;
  objc_sync_exit(v2);

  return supportsAuthentication;
}

- (int)visibility
{
  return self->_visibility;
}

- (BOOL)supportsMultipleAccounts
{
  return self->_supportsMultipleAccounts;
}

- (NSString)owningBundleID
{
  return self->_owningBundleID;
}

- (BOOL)isObsolete
{
  return self->_obsolete;
}

- (NSString)accountTypeDescription
{
  return self->_accountTypeDescription;
}

- (ACAccountType)initWithCoder:(id)a3
{
  id v4;
  ACAccountType *v5;
  void *v6;
  uint64_t v7;
  NSString *accountTypeDescription;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSURL *objectID;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *credentialType;
  void *v19;
  uint64_t v20;
  NSString *credentialProtectionPolicy;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *owningBundleID;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSSet *syncableDataclasses;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSSet *supportedDataclasses;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)ACAccountType;
  v5 = -[ACAccountType init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountTypeDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    accountTypeDescription = v5->_accountTypeDescription;
    v5->_accountTypeDescription = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visibility"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_visibility = objc_msgSend(v15, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialProtectionPolicy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    credentialProtectionPolicy = v5->_credentialProtectionPolicy;
    v5->_credentialProtectionPolicy = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsAuthentication"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsAuthentication = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsMultipleAccounts"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsMultipleAccounts = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("owningBundleID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    owningBundleID = v5->_owningBundleID;
    v5->_owningBundleID = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("obsolete"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_obsolete = objc_msgSend(v27, "BOOLValue");

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("syncableDataclasses"));
    v31 = objc_claimAutoreleasedReturnValue();
    syncableDataclasses = v5->_syncableDataclasses;
    v5->_syncableDataclasses = (NSSet *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("supportedDataclasses"));
    v36 = objc_claimAutoreleasedReturnValue();
    supportedDataclasses = v5->_supportedDataclasses;
    v5->_supportedDataclasses = (NSSet *)v36;

  }
  return v5;
}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (ACAccountType)initWithManagedAccountType:(id)a3 accountStore:(id)a4
{
  id v6;
  ACAccountType *v7;
  ACAccountType *v8;

  v6 = a4;
  v7 = -[ACAccountType initWithManagedAccountType:](self, "initWithManagedAccountType:", a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_accountStore, v6);

  return v8;
}

+ (NSSet)allIdentifiers
{
  if (allIdentifiers_onceToken != -1)
    dispatch_once(&allIdentifiers_onceToken, &__block_literal_global_2);
  return (NSSet *)(id)allIdentifiers_allIdentifiers;
}

void __31__ACAccountType_allIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[55];

  v4[54] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.twitter");
  v4[1] = CFSTR("com.apple.sinaweibo");
  v4[2] = CFSTR("com.apple.facebook");
  v4[3] = CFSTR("com.apple.account.SubscribedCalendar");
  v4[4] = CFSTR("com.apple.account.CalDAV");
  v4[5] = CFSTR("com.apple.account.CardDAV");
  v4[6] = CFSTR("com.apple.account.BookmarkDAV");
  v4[7] = CFSTR("com.apple.account.IMAP");
  v4[8] = CFSTR("com.apple.account.POP");
  v4[9] = CFSTR("com.apple.account.SMTP");
  v4[10] = CFSTR("com.apple.account.Exchange");
  v4[11] = CFSTR("com.apple.account.Hotmail");
  v4[12] = CFSTR("com.apple.account.LDAP");
  v4[13] = CFSTR("com.apple.account.Google");
  v4[14] = CFSTR("com.apple.account.Yahoo");
  v4[15] = CFSTR("com.apple.account.OnMyDevice");
  v4[16] = CFSTR("com.apple.account.IMAPNotes");
  v4[17] = CFSTR("com.apple.account.IMAPMail");
  v4[18] = CFSTR("com.apple.account.AppleAccount");
  v4[19] = CFSTR("com.apple.account.AppleID");
  v4[20] = CFSTR("com.apple.account.FaceTime");
  v4[21] = CFSTR("com.apple.account.Madrid");
  v4[22] = CFSTR("com.apple.account.GameCenter");
  v4[23] = CFSTR("com.apple.account.iTunesStore");
  v4[24] = CFSTR("com.apple.account.iTunesStore.sandbox");
  v4[25] = CFSTR("com.apple.flickr");
  v4[26] = CFSTR("com.apple.vimeo");
  v4[27] = CFSTR("com.apple.tudou");
  v4[28] = CFSTR("com.apple.youku");
  v4[29] = CFSTR("com.apple.account.yelp");
  v4[30] = CFSTR("com.apple.account.tencentweibo");
  v4[31] = CFSTR("com.apple.account.IdentityServices");
  v4[32] = CFSTR("com.apple.account.kerberos.sso.");
  v4[33] = CFSTR("com.apple.account.DeviceLocator");
  v4[34] = CFSTR("com.apple.account.HolidayCalendar");
  v4[35] = CFSTR("com.apple.account.FindMyFriends");
  v4[36] = CFSTR("com.apple.account.AppleIDAuthentication");
  v4[37] = CFSTR("com.apple.account.CloudKit");
  v4[38] = CFSTR("com.apple.account.126");
  v4[39] = CFSTR("com.apple.account.163");
  v4[40] = CFSTR("com.apple.account.aol");
  v4[41] = CFSTR("com.apple.account.qq");
  v4[42] = CFSTR("com.apple.account.osxserver");
  v4[43] = CFSTR("com.apple.account.jabber");
  v4[44] = CFSTR("com.apple.account.yahooim");
  v4[45] = CFSTR("com.apple.account.aim");
  v4[46] = CFSTR("com.apple.account.idms");
  v4[47] = CFSTR("com.apple.account.mso");
  v4[48] = CFSTR("com.apple.account.SingleSignOn");
  v4[49] = CFSTR("com.apple.account.facebookLegacy");
  v4[50] = CFSTR("com.apple.account.CalDAVLegacy");
  v4[51] = CFSTR("com.apple.account.CardDAVLegacy");
  v4[52] = CFSTR("com.apple.account.RemoteManagement");
  v4[53] = CFSTR("com.apple.account.PublishedCalendar");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 54);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allIdentifiers_allIdentifiers;
  allIdentifiers_allIdentifiers = v2;

}

- (ACAccountType)initWithIdentifier:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  ACAccountType *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *accountTypeDescription;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACAccountType;
  v8 = -[ACAccountType init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    accountTypeDescription = v8->_accountTypeDescription;
    v8->_accountTypeDescription = (NSString *)v11;

  }
  return v8;
}

- (id)_initWithProtobuf:(id)a3
{
  id v4;
  ACAccountType *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSString *accountTypeDescription;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  void *v13;
  void *v14;
  uint64_t v15;
  NSURL *objectID;
  void *v17;
  uint64_t v18;
  NSString *credentialType;
  void *v20;
  uint64_t v21;
  NSString *credentialProtectionPolicy;
  void *v23;
  uint64_t v24;
  NSString *owningBundleID;
  ACAccountType *v26;

  v4 = a3;
  v5 = -[ACAccountType init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "accountTypeDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    accountTypeDescription = v5->_accountTypeDescription;
    v5->_accountTypeDescription = (NSString *)v8;

    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    objc_msgSend(v6, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v15;

    v5->_visibility = objc_msgSend(v6, "visibility");
    objc_msgSend(v6, "credentialType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v18;

    objc_msgSend(v6, "credentialProtectionPolicy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    credentialProtectionPolicy = v5->_credentialProtectionPolicy;
    v5->_credentialProtectionPolicy = (NSString *)v21;

    v5->_supportsAuthentication = objc_msgSend(v6, "supportsAuthentication");
    v5->_supportsMultipleAccounts = objc_msgSend(v6, "supportsMultipleAccounts");
    objc_msgSend(v6, "owningBundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    owningBundleID = v5->_owningBundleID;
    v5->_owningBundleID = (NSString *)v24;

    LOBYTE(v23) = objc_msgSend(v6, "obsolete");
    v5->_obsolete = (char)v23;
    v26 = v5;
  }

  return v5;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5;
  ACProtobufAccountType *v6;
  ACAccountType *v7;
  void *v9;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACAccountType.m"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length != 0"));

  }
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[ACProtobufAccountType initWithData:]([ACProtobufAccountType alloc], "initWithData:", v5);
    if (v6)
    {
      self = (ACAccountType *)-[ACAccountType _initWithProtobuf:](self, "_initWithProtobuf:", v6);
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
  ACProtobufURL *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAccountTypeDescription:", self->_accountTypeDescription);
  objc_msgSend(v3, "setIdentifier:", self->_identifier);
  v4 = -[ACProtobufURL initWithURL:]([ACProtobufURL alloc], "initWithURL:", self->_objectID);
  objc_msgSend(v3, "setObjectID:", v4);

  objc_msgSend(v3, "setVisibility:", self->_visibility);
  objc_msgSend(v3, "setCredentialType:", self->_credentialType);
  objc_msgSend(v3, "setCredentialProtectionPolicy:", self->_credentialProtectionPolicy);
  objc_msgSend(v3, "setSupportsAuthentication:", self->_supportsAuthentication);
  objc_msgSend(v3, "setSupportsMultipleAccounts:", self->_supportsMultipleAccounts);
  objc_msgSend(v3, "setOwningBundleID:", self->_owningBundleID);
  objc_msgSend(v3, "setObsolete:", self->_obsolete);
  return v3;
}

- (id)_encodeProtobufData
{
  void *v2;
  void *v3;

  -[ACAccountType _encodeProtobuf](self, "_encodeProtobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ACAccountType accountTypeDescription](self, "accountTypeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountType identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ACAccountType identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountType accountTypeDescription](self, "accountTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountType objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ACAccountType supportsAuthentication](self, "supportsAuthentication"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[ACAccountType supportsMultipleAccounts](self, "supportsMultipleAccounts"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[ACAccountType isObsolete](self, "isObsolete"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  -[ACAccountType owningBundleID](self, "owningBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountType supportedDataclasses](self, "supportedDataclasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountType syncableDataclasses](self, "syncableDataclasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier: %@\ndescription: %@\nobjectID: %@\nsupportsAuthentication %@\nsupportsMultipleAccounts %@\nobsolete %@\nowningBundleID %@\nsupportedDataclasses %@\nsyncableDataclasses %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSSet)supportedDataclasses
{
  ACAccountType *v2;
  NSSet *supportedDataclasses;
  id WeakRetained;
  uint64_t v5;
  NSSet *v6;
  NSSet *v7;

  v2 = self;
  objc_sync_enter(v2);
  supportedDataclasses = v2->_supportedDataclasses;
  if (!supportedDataclasses)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->_accountStore);
    objc_msgSend(WeakRetained, "supportedDataclassesForAccountType:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_supportedDataclasses;
    v2->_supportedDataclasses = (NSSet *)v5;

    supportedDataclasses = v2->_supportedDataclasses;
  }
  v7 = supportedDataclasses;
  objc_sync_exit(v2);

  return v7;
}

- (void)setSupportedDataclasses:(id)a3
{
  NSSet *v4;
  NSSet *supportedDataclasses;
  ACAccountType *obj;

  v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  supportedDataclasses = obj->_supportedDataclasses;
  obj->_supportedDataclasses = v4;

  objc_sync_exit(obj);
}

- (NSSet)syncableDataclasses
{
  ACAccountType *v2;
  NSSet *syncableDataclasses;
  id WeakRetained;
  uint64_t v5;
  NSSet *v6;
  NSSet *v7;

  v2 = self;
  objc_sync_enter(v2);
  syncableDataclasses = v2->_syncableDataclasses;
  if (!syncableDataclasses)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->_accountStore);
    objc_msgSend(WeakRetained, "syncableDataclassesForAccountType:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_syncableDataclasses;
    v2->_syncableDataclasses = (NSSet *)v5;

    syncableDataclasses = v2->_syncableDataclasses;
  }
  v7 = syncableDataclasses;
  objc_sync_exit(v2);

  return v7;
}

- (void)setSyncableDataclasses:(id)a3
{
  NSSet *v4;
  NSSet *syncableDataclasses;
  ACAccountType *obj;

  v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  syncableDataclasses = obj->_syncableDataclasses;
  obj->_syncableDataclasses = v4;

  objc_sync_exit(obj);
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (void)setAccountTypeDescription:(id)a3
{
  NSString *v4;
  NSString *accountTypeDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  accountTypeDescription = self->_accountTypeDescription;
  self->_accountTypeDescription = v4;

}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (void)setCredentialType:(id)a3
{
  NSString *v4;
  NSString *credentialType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  credentialType = self->_credentialType;
  self->_credentialType = v4;

}

- (void)setVisibility:(int)a3
{
  self->_visibility = a3;
}

- (void)setCredentialProtectionPolicy:(id)a3
{
  ACAccountType *v4;
  uint64_t v5;
  NSString *credentialProtectionPolicy;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  credentialProtectionPolicy = v4->_credentialProtectionPolicy;
  v4->_credentialProtectionPolicy = (NSString *)v5;

  objc_sync_exit(v4);
}

- (BOOL)accessGranted
{
  ACAccountType *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountStore);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "permissionForAccountType:", v2);

  return (char)v2;
}

- (void)setSupportsAuthentication:(int)a3
{
  ACAccountType *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_supportsAuthentication = a3;
  objc_sync_exit(obj);

}

- (BOOL)isEqual:(id)a3
{
  ACAccountType *v4;
  void *v5;
  NSString *identifier;
  void *v7;
  char v8;

  v4 = (ACAccountType *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    if (objc_msgSend(v5, "isEqual:", objc_opt_class()))
    {
      identifier = self->_identifier;
      -[ACAccountType identifier](v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSString isEqualToString:](identifier, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSString *identifier;
  objc_super v5;

  identifier = self->_identifier;
  if (identifier)
    return -[NSString hash](identifier, "hash");
  v5.receiver = self;
  v5.super_class = (Class)ACAccountType;
  return -[ACAccountType hash](&v5, sel_hash);
}

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)objc_loadWeakRetained((id *)&self->_accountStore);
}

- (void)setSupportsMultipleAccounts:(BOOL)a3
{
  self->_supportsMultipleAccounts = a3;
}

- (void)setObsolete:(BOOL)a3
{
  self->_obsolete = a3;
}

- (void)setOwningBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_owningBundleID, a3);
}

@end
