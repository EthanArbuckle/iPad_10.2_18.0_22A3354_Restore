@implementation AAProvisioningResponse

- (AAProvisioningResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AAProvisioningResponse *v4;
  AAProvisioningResponse *v5;
  NSHTTPURLResponse *httpResponse;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *icloud;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AAProvisioningResponse;
  v4 = -[AAAuthenticationResponse initWithHTTPResponse:data:](&v13, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    httpResponse = v4->super.super._httpResponse;
    if (httpResponse)
    {
      if (-[NSHTTPURLResponse statusCode](httpResponse, "statusCode") == 200)
      {
        -[AAResponse responseDictionary](v5, "responseDictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[AAResponse responseDictionary](v5, "responseDictionary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", CFSTR("com.apple.mobileme"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "copy");
          icloud = v5->_icloud;
          v5->_icloud = (NSDictionary *)v10;

        }
        -[AAResponse setError:](v5, "setError:", 0);
      }
    }
  }
  return v5;
}

- (AAProvisioningResponse)initWithDictionary:(id)a3
{
  id v4;
  AAProvisioningResponse *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *icloud;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *appleAccount;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *tokens;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AAProvisioningResponse;
  v5 = -[AAProvisioningResponse init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->super.super._responseDictionary;
    v5->super.super._responseDictionary = (NSDictionary *)v6;

    -[AAResponse responseDictionary](v5, "responseDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[AAResponse responseDictionary](v5, "responseDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.mobileme"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      icloud = v5->_icloud;
      v5->_icloud = (NSDictionary *)v11;

      -[AAResponse responseDictionary](v5, "responseDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("appleAccountInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      appleAccount = v5->super._appleAccount;
      v5->super._appleAccount = (NSDictionary *)v15;

      -[AAResponse responseDictionary](v5, "responseDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", CFSTR("tokens"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      tokens = v5->super._tokens;
      v5->super._tokens = (NSDictionary *)v19;

    }
  }

  return v5;
}

- (NSArray)provisionedDataclasses
{
  return (NSArray *)-[NSDictionary objectForKey:](self->_icloud, "objectForKey:", CFSTR("availableFeatures"));
}

- (NSDictionary)dataclassProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  -[AAProvisioningResponse provisionedDataclasses](self, "provisionedDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSDictionary allKeys](self->_icloud, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple.Dataclass")))
        {
          -[NSDictionary objectForKey:](self->_icloud, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "setObject:forKey:", v12, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return (NSDictionary *)v5;
}

- (NSString)appleID
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("appleId"));
}

- (NSArray)appleIDAliases
{
  return (NSArray *)-[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("appleIdAliases"));
}

- (NSString)firstName
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("firstName"));
}

- (NSString)lastName
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("lastName"));
}

- (NSString)primaryEmail
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("primaryEmail"));
}

- (NSNumber)primaryEmailVerified
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("primaryEmailVerified"));
}

- (NSString)iCloudAuthToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._tokens, "objectForKey:", CFSTR("mmeAuthToken"));
}

- (NSString)fmipAuthToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._tokens, "objectForKey:", CFSTR("mmeFMIPToken"));
}

- (NSString)fmipSiriToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._tokens, "objectForKey:", CFSTR("mmeFMIPSiriToken"));
}

- (NSString)searchPartyToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._tokens, "objectForKey:", CFSTR("searchPartyToken"));
}

- (NSString)keyTransparencyToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._tokens, "objectForKey:", CFSTR("keyTransparencyToken"));
}

- (NSString)fmipAppToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._tokens, "objectForKey:", CFSTR("mmeFMIPAppToken"));
}

- (NSDictionary)regionInfo
{
  return (NSDictionary *)-[NSDictionary objectForKey:](self->super.super._responseDictionary, "objectForKey:", CFSTR("regionInfo"));
}

- (BOOL)isManagedAppleID
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("isManagedAppleID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isNotesMigrated
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("notesMigrated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isRemindersMigrated
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("tantorMigrated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isRemindersAutoMigratableToCK
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("autoMigrateToTantor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isSandboxAccount
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("isSandboxAcct"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isCloudDocsMigrated
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("brMigrated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasOptionalTerms
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("hasOptionalTerms"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isFamilyEligible
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("familyEligible"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)ageCategory
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->super._appleAccount, "objectForKey:", CFSTR("ageCategory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icloud, 0);
}

@end
