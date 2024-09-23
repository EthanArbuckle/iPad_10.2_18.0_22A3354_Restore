@implementation ACAccountCredential

- (void)setCredentialItem:(id)a3 forKey:(id)a4
{
  id v6;
  ACAccountCredential *v7;
  void *v8;
  ACZeroingString *v9;
  uint64_t v10;
  NSDictionary *credentialItems;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)-[NSDictionary mutableCopy](v7->_credentialItems, "mutableCopy");
  if (v12)
  {
    v9 = -[ACZeroingString initWithString:]([ACZeroingString alloc], "initWithString:", v12);
    objc_msgSend(v8, "setObject:forKey:", v9, v6);

  }
  else
  {
    objc_msgSend(v8, "removeObjectForKey:", v6);
  }
  v10 = objc_msgSend(v8, "copy");
  credentialItems = v7->_credentialItems;
  v7->_credentialItems = (NSDictionary *)v10;

  objc_sync_exit(v7);
  -[ACAccountCredential _markPropertyDirty:](v7, "_markPropertyDirty:", CFSTR("credentialItems"));

}

- (void)_markPropertyDirty:(id)a3
{
  id v4;
  NSMutableSet *dirtyProperties;
  NSMutableSet *v6;
  NSMutableSet *v7;
  ACAccount **p_owningAccount;
  id WeakRetained;
  id v10;
  id v11;

  v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  v11 = v4;
  if (!dirtyProperties)
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    v4 = v11;
    dirtyProperties = self->_dirtyProperties;
  }
  -[NSMutableSet addObject:](dirtyProperties, "addObject:", v4);
  p_owningAccount = &self->_owningAccount;
  WeakRetained = objc_loadWeakRetained((id *)p_owningAccount);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)p_owningAccount);
    objc_msgSend(v10, "_markCredentialDirty");

  }
}

- (ACAccountCredential)initWithCoder:(id)a3
{
  id v4;
  ACAccountCredential *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *credentialItems;
  void *v13;
  uint64_t v14;
  NSString *credentialType;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableSet *dirtyProperties;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ACAccountCredential;
  v5 = -[ACAccountCredential init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("credentialItems"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    credentialItems = v5->_credentialItems;
    v5->_credentialItems = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("dirtyProperties"));
    v19 = objc_claimAutoreleasedReturnValue();
    dirtyProperties = v5->_dirtyProperties;
    v5->_dirtyProperties = (NSMutableSet *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requiresTouchID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requiresTouchID = objc_msgSend(v21, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *credentialItems;
  id v5;
  id v6;

  credentialItems = self->_credentialItems;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", credentialItems, CFSTR("credentialItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialType, CFSTR("credentialType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dirtyProperties, CFSTR("dirtyProperties"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresTouchID);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_requiresTouchID"));

}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (NSString)oauthTokenNoSync
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("oauth-token-nosync"));
}

- (id)keysForCredentialItems
{
  return -[NSDictionary allKeys](self->_credentialItems, "allKeys");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)token
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("token"));
}

- (id)credentialItemForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_credentialItems, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "_newZStringWithString:", v3);
  else
    v4 = 0;

  return v4;
}

- (NSString)password
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("password"));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningAccount);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_credentialItems, 0);
}

- (void)_setOwningAccount:(id)a3
{
  objc_storeWeak((id *)&self->_owningAccount, a3);
}

+ (BOOL)credentialPolicyIsMixedForAccountTypeIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.account.FindMyFriends")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.account.DeviceLocator"));

  return v4;
}

- (void)setCredentialType:(id)a3
{
  NSString *v4;
  NSString *credentialType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  credentialType = self->_credentialType;
  self->_credentialType = v4;

  -[ACAccountCredential _markPropertyDirty:](self, "_markPropertyDirty:", CFSTR("credentialType"));
}

- (ACAccountCredential)init
{
  ACAccountCredential *v2;
  ACAccountCredential *v3;
  NSDictionary *credentialItems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACAccountCredential;
  v2 = -[ACAccountCredential init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    credentialItems = v2->_credentialItems;
    v2->_credentialItems = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v3;
}

+ (id)additionalServiceSegmentForAccountTypeIdentifier:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.account.Yahoo")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.twitter")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.account.aol")))
  {
    v4 = CFSTR("com.apple.iOS");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

+ (id)supportedKeysForAccountTypeIdentifier:(id)a3 credentialType:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[9];

  v39[8] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.idms")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.FaceTime"))
      || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.Madrid")))
    {
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = CFSTR("password");
LABEL_6:
      v22 = v9;
      v23 = 0;
LABEL_12:
      v12 = CFSTR("token");
LABEL_13:
      objc_msgSend(v8, "arrayWithObjects:", v12, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
LABEL_14:
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.GameCenter"))
      || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.IdentityServices")))
    {
      v8 = (void *)MEMORY[0x1E0C99D20];
      v24 = 0;
LABEL_10:
      v10 = CFSTR("rpassword");
      v11 = CFSTR("password");
LABEL_11:
      v22 = v11;
      v23 = v10;
      goto LABEL_12;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.DeviceLocator")))
    {
      v8 = (void *)MEMORY[0x1E0C99D20];
      v24 = 0;
      v10 = CFSTR("find-my-iphone-siri-token");
      v11 = CFSTR("find-my-iphone-app-token");
      goto LABEL_11;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.FindMyFriends")))
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("find-my-friends-app-token"), CFSTR("find-my-friends-token"), 0, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
      goto LABEL_14;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.AppleAccount")))
    {
      v8 = (void *)MEMORY[0x1E0C99D20];
      v35 = CFSTR("key-transparency-token");
      v36 = 0;
      v33 = CFSTR("find-my-iphone-siri-token");
      v34 = CFSTR("search-party-token");
      v31 = CFSTR("find-my-friends-app-token");
      v32 = CFSTR("mdm-server-token");
      v29 = CFSTR("cloudkit-token");
      v30 = CFSTR("find-my-friends-token");
      v27 = CFSTR("maps-token");
      v28 = CFSTR("hsa-token");
      v25 = CFSTR("find-my-iphone-token");
      v26 = CFSTR("find-my-iphone-app-token");
      v24 = CFSTR("old-password");
      goto LABEL_10;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.iTunesStore")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.iTunesStore.sandbox")))
    {
      v8 = (void *)MEMORY[0x1E0C99D20];
      v22 = CFSTR("rpassword");
      v23 = 0;
LABEL_26:
      v12 = CFSTR("password");
      goto LABEL_13;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.tencentweibo")))
    {
      v8 = (void *)MEMORY[0x1E0C99D20];
      v26 = CFSTR("oauth-token-nosync");
      v27 = 0;
      v15 = CFSTR("tencent-weibo-client-consumer-key");
LABEL_29:
      v24 = CFSTR("purpose");
      v25 = v15;
      v16 = CFSTR("oauth-expiry-date");
LABEL_33:
      v17 = CFSTR("oath-refresh-token");
LABEL_34:
      v22 = v17;
      v23 = v16;
      goto LABEL_35;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.Google")))
    {
      v8 = (void *)MEMORY[0x1E0C99D20];
      v25 = CFSTR("oauth-token-nosync");
      v26 = 0;
      v24 = CFSTR("oauth-expiry-date");
      goto LABEL_32;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.Yahoo")))
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("oauth-token"), CFSTR("oath-refresh-token"), CFSTR("oauth-token-nosync"), CFSTR("password"), CFSTR("oauth-expiry-date"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = CFSTR("yahoo-xympki-token");
      v38[1] = CFSTR("yahoo-xympki-cookie-y");
      v38[2] = CFSTR("yahoo-xympki-cookie-t");
      v38[3] = CFSTR("yahoo-xympki-cookie-crumb");
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = v38;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.aol")))
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.Hotmail")))
        {
          if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.account.Exchange")))
          {
            v8 = (void *)MEMORY[0x1E0C99D20];
            v27 = CFSTR("oauth-graphAPI-token");
            v28 = 0;
            v26 = CFSTR("password");
          }
          else
          {
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("oauth")))
            {
              v8 = (void *)MEMORY[0x1E0C99D20];
              v24 = 0;
              v16 = CFSTR("oauth-token-nosync");
              v17 = CFSTR("oauth-token-secret");
              goto LABEL_34;
            }
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("password")))
            {
              v8 = (void *)MEMORY[0x1E0C99D20];
              v22 = 0;
              goto LABEL_26;
            }
            if (!objc_msgSend(v6, "isEqualToString:", CFSTR("oauth2")))
            {
              if (objc_msgSend(v6, "isEqualToString:", CFSTR("Kerberos")))
                goto LABEL_56;
              if (objc_msgSend(v6, "isEqualToString:", CFSTR("yahoo-xympki-tokens")))
              {
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("yahoo-xympki-token"), CFSTR("yahoo-xympki-cookie-y"), CFSTR("yahoo-xympki-cookie-t"), CFSTR("yahoo-xympki-cookie-crumb"), 0, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
                goto LABEL_14;
              }
              if (objc_msgSend(v6, "isEqualToString:", CFSTR("token")))
              {
LABEL_56:
                v8 = (void *)MEMORY[0x1E0C99D20];
                v22 = 0;
                goto LABEL_12;
              }
              if (!objc_msgSend(v6, "isEqualToString:", CFSTR("hybrid")))
              {
                if (!objc_msgSend(v6, "isEqualToString:", CFSTR("appleid-authentication")))
                {
                  v13 = 0;
                  goto LABEL_16;
                }
                v8 = (void *)MEMORY[0x1E0C99D20];
                v9 = CFSTR("token-expiry-date");
                goto LABEL_6;
              }
              v8 = (void *)MEMORY[0x1E0C99D20];
              v25 = CFSTR("password");
              v26 = 0;
              v23 = CFSTR("token");
              v24 = CFSTR("oath-refresh-token");
              v22 = CFSTR("oauth-token-secret");
LABEL_35:
              v12 = CFSTR("oauth-token");
              goto LABEL_13;
            }
            v8 = (void *)MEMORY[0x1E0C99D20];
            v26 = 0;
          }
          v15 = CFSTR("oauth-token-nosync");
          goto LABEL_29;
        }
        v8 = (void *)MEMORY[0x1E0C99D20];
        v24 = CFSTR("oauth-graphAPI-token");
        v25 = 0;
LABEL_32:
        v16 = CFSTR("password");
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("oauth-token"), CFSTR("oath-refresh-token"), CFSTR("oauth-token-nosync"), CFSTR("password"), CFSTR("oauth-expiry-date"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = CFSTR("yahoo-xympki-token");
      v37[1] = CFSTR("yahoo-xympki-cookie-y");
      v37[2] = CFSTR("yahoo-xympki-cookie-t");
      v37[3] = CFSTR("yahoo-xympki-cookie-crumb");
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = v37;
    }
    objc_msgSend(v19, "arrayWithObjects:count:", v20, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v39[0] = CFSTR("token");
  v39[1] = CFSTR("heartbeat-token");
  v39[2] = CFSTR("heartbeat-token-creation");
  v39[3] = CFSTR("continuation-key");
  v39[4] = CFSTR("continuation-key-creation");
  v39[5] = CFSTR("password-reset-token");
  v39[6] = CFSTR("password-reset-token-creation");
  v39[7] = CFSTR("password-reset-token-backup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 8);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v13 = (void *)v7;
LABEL_16:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  ACAccountCredential *v4;
  ACAccountCredential *v5;
  NSString *credentialType;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  char v11;
  NSDictionary *credentialItems;
  uint64_t v13;
  NSDictionary *v14;
  NSDictionary *v15;
  void *v16;

  v4 = (ACAccountCredential *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      credentialType = self->_credentialType;
      -[ACAccountCredential credentialType](v5, "credentialType");
      v7 = objc_claimAutoreleasedReturnValue();
      if (credentialType == (NSString *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_credentialType;
        -[ACAccountCredential credentialType](v5, "credentialType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = -[NSString isEqual:](v9, "isEqual:", v10);

        if (!(_DWORD)v9)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      credentialItems = self->_credentialItems;
      -[ACAccountCredential credentialItems](v5, "credentialItems");
      v13 = objc_claimAutoreleasedReturnValue();
      if (credentialItems == (NSDictionary *)v13)
      {
        v11 = 1;
      }
      else
      {
        v14 = (NSDictionary *)v13;
        v15 = self->_credentialItems;
        -[ACAccountCredential credentialItems](v5, "credentialItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSDictionary isEqual:](v15, "isEqual:", v16);

        credentialItems = v14;
      }

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACAccountCredential;
  v3 = -[ACAccountCredential hash](&v6, sel_hash);
  v4 = -[NSDictionary hash](self->_credentialItems, "hash");
  return (unint64_t)v3 + v4 + -[NSString hash](self->_credentialType, "hash");
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
  id WeakRetained;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_credentialItems, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_credentialType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSMutableSet mutableCopyWithZone:](self->_dirtyProperties, "mutableCopyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  *(_BYTE *)(v5 + 40) = self->_requiresTouchID;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningAccount);
  objc_storeWeak((id *)(v5 + 32), WeakRetained);

  return (id)v5;
}

- (ACAccountCredential)initWithOAuth2Token:(NSString *)token refreshToken:(NSString *)refreshToken expiryDate:(NSDate *)expiryDate
{
  NSString *v8;
  NSString *v9;
  NSDate *v10;
  ACAccountCredential *v11;
  ACAccountCredential *v12;
  NSDictionary *credentialItems;
  uint64_t v14;
  NSString *credentialType;
  objc_super v17;

  v8 = token;
  v9 = refreshToken;
  v10 = expiryDate;
  v17.receiver = self;
  v17.super_class = (Class)ACAccountCredential;
  v11 = -[ACAccountCredential init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    credentialItems = v11->_credentialItems;
    v11->_credentialItems = (NSDictionary *)MEMORY[0x1E0C9AA70];

    -[ACAccountCredential setOauthToken:](v12, "setOauthToken:", v8);
    -[ACAccountCredential setOauthRefreshToken:](v12, "setOauthRefreshToken:", v9);
    -[ACAccountCredential setExpiryDate:](v12, "setExpiryDate:", v10);
    v14 = objc_msgSend(CFSTR("oauth2"), "copy");
    credentialType = v12->_credentialType;
    v12->_credentialType = (NSString *)v14;

  }
  return v12;
}

- (ACAccountCredential)initWithOAuthToken:(NSString *)token tokenSecret:(NSString *)secret
{
  NSString *v6;
  NSString *v7;
  ACAccountCredential *v8;
  ACAccountCredential *v9;
  NSDictionary *credentialItems;
  uint64_t v11;
  NSString *credentialType;
  objc_super v14;

  v6 = token;
  v7 = secret;
  v14.receiver = self;
  v14.super_class = (Class)ACAccountCredential;
  v8 = -[ACAccountCredential init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    credentialItems = v8->_credentialItems;
    v8->_credentialItems = (NSDictionary *)MEMORY[0x1E0C9AA70];

    -[ACAccountCredential setOauthToken:](v9, "setOauthToken:", v6);
    -[ACAccountCredential setOauthTokenSecret:](v9, "setOauthTokenSecret:", v7);
    v11 = objc_msgSend(CFSTR("oauth"), "copy");
    credentialType = v9->_credentialType;
    v9->_credentialType = (NSString *)v11;

  }
  return v9;
}

- (ACAccountCredential)initWithPassword:(id)a3
{
  id v4;
  ACAccountCredential *v5;
  ACAccountCredential *v6;
  NSDictionary *credentialItems;
  uint64_t v8;
  NSString *credentialType;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACAccountCredential;
  v5 = -[ACAccountCredential init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    credentialItems = v5->_credentialItems;
    v5->_credentialItems = (NSDictionary *)MEMORY[0x1E0C9AA70];

    -[ACAccountCredential setPassword:](v6, "setPassword:", v4);
    v8 = objc_msgSend(CFSTR("password"), "copy");
    credentialType = v6->_credentialType;
    v6->_credentialType = (NSString *)v8;

  }
  return v6;
}

- (NSString)description
{
  void *v3;
  NSString *credentialType;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  credentialType = self->_credentialType;
  -[NSDictionary allKeys](self->_credentialItems, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ACAccountCredential:'%@'-(%@)(TouchID:%d)>"), credentialType, v6, self->_requiresTouchID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (ACAccountCredential)credentialWithOAuthToken:(id)a3 tokenSecret:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOAuthToken:tokenSecret:", v6, v5);

  return (ACAccountCredential *)v7;
}

+ (ACAccountCredential)credentialWithPassword:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPassword:", v3);

  return (ACAccountCredential *)v4;
}

+ (NSSet)allSupportedKeys
{
  if (allSupportedKeys_onceToken != -1)
    dispatch_once(&allSupportedKeys_onceToken, &__block_literal_global_6);
  return (NSSet *)(id)allSupportedKeys_keys;
}

void __39__ACAccountCredential_allSupportedKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[37];

  v4[36] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("oauth-token");
  v4[1] = CFSTR("oauth-token-secret");
  v4[2] = CFSTR("oath-refresh-token");
  v4[3] = CFSTR("oauth-expiry-date");
  v4[4] = CFSTR("password");
  v4[5] = CFSTR("purpose");
  v4[6] = CFSTR("token");
  v4[7] = CFSTR("oauth-token-nosync");
  v4[8] = CFSTR("oauth-graphAPI-token");
  v4[9] = CFSTR("rpassword");
  v4[10] = CFSTR("old-password");
  v4[11] = CFSTR("find-my-iphone-token");
  v4[12] = CFSTR("find-my-iphone-app-token");
  v4[13] = CFSTR("find-my-iphone-siri-token");
  v4[14] = CFSTR("maps-token");
  v4[15] = CFSTR("hsa-token");
  v4[16] = CFSTR("find-my-friends-token");
  v4[17] = CFSTR("find-my-friends-app-token");
  v4[18] = CFSTR("token-expiry-date");
  v4[19] = CFSTR("heartbeat-token");
  v4[20] = CFSTR("heartbeat-token-creation");
  v4[21] = CFSTR("continuation-key");
  v4[22] = CFSTR("continuation-key-creation");
  v4[23] = CFSTR("password-reset-token");
  v4[24] = CFSTR("password-reset-token-creation");
  v4[25] = CFSTR("password-reset-token-backup");
  v4[26] = CFSTR("yahoo-xympki-token");
  v4[27] = CFSTR("yahoo-xympki-cookie-y");
  v4[28] = CFSTR("yahoo-xympki-cookie-t");
  v4[29] = CFSTR("yahoo-xympki-cookie-crumb");
  v4[30] = CFSTR("tencent-weibo-client-consumer-key");
  v4[31] = CFSTR("container-user-id");
  v4[32] = CFSTR("cloudkit-token");
  v4[33] = CFSTR("mdm-server-token");
  v4[34] = CFSTR("search-party-token");
  v4[35] = CFSTR("key-transparency-token");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 36);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allSupportedKeys_keys;
  allSupportedKeys_keys = v2;

}

+ (id)nonPersistentKeysForAccountTypeIdentifier:(id)a3 credentialType:(id)a4
{
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.account.FaceTime"))
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.account.Madrid")))
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.account.IdentityServices"))
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.account.GameCenter")))
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.account.AppleAccount")))
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("password"), CFSTR("rpassword"), CFSTR("old-password"), CFSTR("find-my-iphone-token"), CFSTR("hsa-token"), 0);
        goto LABEL_11;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.account.iTunesStore")) & 1) == 0
        && !objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.account.iTunesStore.sandbox")))
      {
        v5 = 0;
        goto LABEL_12;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("password"), CFSTR("rpassword"), 0, v8, v9, v10);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("password"), 0, v7, v8, v9, v10);
LABEL_11:
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v5;
}

- (id)_initWithProtobuf:(id)a3
{
  id v4;
  ACAccountCredential *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSString *credentialType;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSMutableSet *dirtyProperties;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSDictionary *credentialItems;
  ACAccountCredential *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ACAccountCredential init](self, "init");
  if (v5)
  {
    v31 = v4;
    v6 = v4;
    objc_msgSend(v6, "credentialType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v8;

    v5->_requiresTouchID = objc_msgSend(v6, "requiresTouchID");
    objc_msgSend(v6, "dirtyProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v6, "dirtyProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "initWithArray:", v12);
      dirtyProperties = v5->_dirtyProperties;
      v5->_dirtyProperties = (NSMutableSet *)v13;

    }
    v15 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "credentialItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v6, "credentialItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v23, "value");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[ACZeroingString stringWithString:](ACZeroingString, "stringWithString:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "key");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v26);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v20);
    }

    v27 = objc_msgSend(v17, "copy");
    credentialItems = v5->_credentialItems;
    v5->_credentialItems = (NSDictionary *)v27;

    v29 = v5;
    v4 = v31;
  }

  return v5;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5;
  ACProtobufAccountCredential *v6;
  ACAccountCredential *v7;
  void *v9;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACAccountCredential.m"), 358, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length != 0"));

  }
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[ACProtobufAccountCredential initWithData:]([ACProtobufAccountCredential alloc], "initWithData:", v5);
    if (v6)
    {
      self = (ACAccountCredential *)-[ACAccountCredential _initWithProtobuf:](self, "_initWithProtobuf:", v6);
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
  void *v6;
  NSDictionary *credentialItems;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setCredentialType:", self->_credentialType);
  objc_msgSend(v3, "setRequiresTouchID:", self->_requiresTouchID);
  -[NSMutableSet allObjects](self->_dirtyProperties, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setDirtyProperties:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSDictionary count](self->_credentialItems, "count"));
  credentialItems = self->_credentialItems;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__ACAccountCredential__encodeProtobuf__block_invoke;
  v10[3] = &unk_1E4894238;
  v11 = v6;
  v8 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](credentialItems, "enumerateKeysAndObjectsUsingBlock:", v10);
  objc_msgSend(v3, "setCredentialItems:", v8);

  return v3;
}

void __38__ACAccountCredential__encodeProtobuf__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  ACProtobufKeyValuePair *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = -[ACProtobufKeyValuePair initWithValue:forKey:]([ACProtobufKeyValuePair alloc], "initWithValue:forKey:", v5, v6);

  objc_msgSend(v4, "addObject:", v7);
}

- (id)_encodeProtobufData
{
  void *v2;
  void *v3;

  -[ACAccountCredential _encodeProtobuf](self, "_encodeProtobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isDirty
{
  return -[NSMutableSet count](self->_dirtyProperties, "count") != 0;
}

- (BOOL)isEmpty
{
  return -[NSDictionary count](self->_credentialItems, "count") == 0;
}

- (NSSet)dirtyProperties
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_dirtyProperties, "copy");
}

- (void)_clearDirtyProperties
{
  NSMutableSet *dirtyProperties;

  dirtyProperties = self->_dirtyProperties;
  self->_dirtyProperties = 0;

}

- (id)credentialItems
{
  return self->_credentialItems;
}

- (void)setToken:(id)a3
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", a3, CFSTR("token"));
}

- (NSString)oauthToken
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("oauth-token"));
}

- (void)setOauthToken:(NSString *)oauthToken
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", oauthToken, CFSTR("oauth-token"));
}

- (NSString)oauthTokenSecret
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("oauth-token-secret"));
}

- (void)setOauthTokenSecret:(id)a3
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", a3, CFSTR("oauth-token-secret"));
}

- (void)setOauthTokenNoSync:(id)a3
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", a3, CFSTR("oauth-token-nosync"));
}

- (NSString)oauthRefreshToken
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("oath-refresh-token"));
}

- (void)setOauthRefreshToken:(id)a3
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", a3, CFSTR("oath-refresh-token"));
}

- (NSDate)expiryDate
{
  void *v2;
  void *v3;
  void *v4;

  -[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("oauth-expiry-date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setExpiryDate:(id)a3
{
  uint64_t v4;
  id v5;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", v5, CFSTR("oauth-expiry-date"));

}

- (void)setPassword:(id)a3
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", a3, CFSTR("password"));
}

- (NSString)findMyiPhoneToken
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("find-my-iphone-token"));
}

- (void)setFindMyiPhoneToken:(id)a3
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", a3, CFSTR("find-my-iphone-token"));
}

- (NSString)mapsToken
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("maps-token"));
}

- (void)setMapsToken:(id)a3
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", a3, CFSTR("maps-token"));
}

- (NSString)hsaToken
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("hsa-token"));
}

- (void)setHsaToken:(id)a3
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", a3, CFSTR("hsa-token"));
}

- (NSString)mdmServerToken
{
  return (NSString *)-[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("mdm-server-token"));
}

- (void)setMdmServerToken:(id)a3
{
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", a3, CFSTR("mdm-server-token"));
}

- (NSDate)tokenExpiryDate
{
  void *v2;
  void *v3;
  void *v4;

  -[ACAccountCredential credentialItemForKey:](self, "credentialItemForKey:", CFSTR("token-expiry-date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setTokenExpiryDate:(id)a3
{
  uint64_t v4;
  id v5;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ACAccountCredential setCredentialItem:forKey:](self, "setCredentialItem:forKey:", v5, CFSTR("token-expiry-date"));

}

+ (id)credentialPolicyForAccountTypeIdentifier:(id)a3 key:(id)a4 clientID:(id)a5
{
  id v6;
  id v7;
  char v8;
  id *v9;
  id *v10;
  char v11;
  id v12;
  char v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.account.AppleIDAuthentication"));
  v9 = (id *)MEMORY[0x1E0CD68A8];
  v10 = (id *)MEMORY[0x1E0CD68A8];
  if ((v8 & 1) != 0)
    goto LABEL_13;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.account.FindMyFriends")))
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("find-my-friends-token")) & 1) != 0)
      goto LABEL_12;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("find-my-friends-app-token")) & 1) != 0)
    {
      v10 = (id *)MEMORY[0x1E0CD68A8];
      goto LABEL_13;
    }
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.account.DeviceLocator")))
  {
    v11 = objc_msgSend(v7, "isEqualToString:", CFSTR("find-my-iphone-siri-token"));
    v10 = (id *)MEMORY[0x1E0CD68A8];
    if ((v11 & 1) == 0 && !objc_msgSend(v7, "isEqualToString:", CFSTR("find-my-iphone-app-token")))
      v10 = (id *)MEMORY[0x1E0CD68C0];
    goto LABEL_13;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.account.HolidayCalendar")) & 1) != 0)
  {
LABEL_12:
    v10 = (id *)MEMORY[0x1E0CD68C0];
    goto LABEL_13;
  }
  v14 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.account.Exchange"));
  v10 = (id *)MEMORY[0x1E0CD68B0];
  if ((v14 & 1) == 0 && !objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.account.Hotmail")))
    v10 = v9;
LABEL_13:
  v12 = *v10;

  return v12;
}

- (BOOL)requiresTouchID
{
  return self->_requiresTouchID;
}

- (void)setRequiresTouchID:(BOOL)a3
{
  self->_requiresTouchID = a3;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void)setEmpty:(BOOL)a3
{
  self->_empty = a3;
}

@end
