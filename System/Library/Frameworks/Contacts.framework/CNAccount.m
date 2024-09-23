@implementation CNAccount

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1)
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_27);
  return (id)os_log_cn_once_object_1;
}

void __19__CNAccount_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNAccount");
  v1 = (void *)os_log_cn_once_object_1;
  os_log_cn_once_object_1 = (uint64_t)v0;

}

+ (id)localAccount
{
  if (localAccount_cn_once_token_2 != -1)
    dispatch_once(&localAccount_cn_once_token_2, &__block_literal_global_3_3);
  return (id)localAccount_cn_once_object_2;
}

void __25__CNAccount_localAccount__block_invoke()
{
  CNAccount *v0;
  void *v1;

  v0 = -[CNAccount initWithIdentifier:externalIdentifier:]([CNAccount alloc], "initWithIdentifier:externalIdentifier:", CFSTR("local"), 0);
  v1 = (void *)localAccount_cn_once_object_2;
  localAccount_cn_once_object_2 = (uint64_t)v0;

}

+ (id)identifierProvider
{
  if (identifierProvider_cn_once_token_3 != -1)
    dispatch_once(&identifierProvider_cn_once_token_3, &__block_literal_global_5_0);
  return (id)identifierProvider_cn_once_object_3;
}

void __31__CNAccount_identifierProvider__block_invoke()
{
  CNUuidIdentifierProvider *v0;
  void *v1;

  v0 = -[CNUuidIdentifierProvider initWithSuffix:]([CNUuidIdentifierProvider alloc], "initWithSuffix:", CFSTR("ABAccount"));
  v1 = (void *)identifierProvider_cn_once_object_3;
  identifierProvider_cn_once_object_3 = (uint64_t)v0;

}

+ (id)makeIdentifierString
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "identifierProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)requestAccountSyncWithDefaultOptions
{
  return objc_msgSend(a1, "requestAccountSyncWithOptions:", 1);
}

+ (BOOL)ios_requestAccountSyncWithOptions:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifiersEnabledToSyncDataclass:", *MEMORY[0x1E0C8F388]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend((id)getDADConnectionClass(), "sharedConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updateContentsOfAllFoldersForAccountID:andDataclasses:isUserRequested:", v11, 2, v3 & 1);

        objc_msgSend((id)getDADConnectionClass(), "sharedConnection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateFolderListForAccountID:andDataclasses:isUserRequested:", v11, 2, v3 & 1);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v6 != 0;
}

- (CNAccount)init
{
  return -[CNAccount initWithExternalIdentifier:](self, "initWithExternalIdentifier:", 0);
}

- (CNAccount)initWithExternalIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNAccount *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "makeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNAccount initWithIdentifier:externalIdentifier:](self, "initWithIdentifier:externalIdentifier:", v5, v4);

  return v6;
}

- (CNAccount)initWithIdentifier:(id)a3 externalIdentifier:(id)a4
{
  id v6;
  id v7;
  CNAccount *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *externalIdentifierString;
  CNAccount *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAccount;
  v8 = -[CNAccount init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    externalIdentifierString = v8->_externalIdentifierString;
    v8->_externalIdentifierString = (NSString *)v11;

    v8->_iOSLegacyIdentifier = -1;
    v13 = v8;
  }

  return v8;
}

- (CNAccount)initWithIdentifier:(id)a3 externalIdentifier:(id)a4 iOSLegacyIdentifier:(int)a5
{
  id v8;
  id v9;
  CNAccount *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *externalIdentifierString;
  CNAccount *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNAccount;
  v10 = -[CNAccount init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    externalIdentifierString = v10->_externalIdentifierString;
    v10->_externalIdentifierString = (NSString *)v13;

    v10->_iOSLegacyIdentifier = a5;
    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNAccount)initWithCoder:(id)a3
{
  id v4;
  CNAccount *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *externalIdentifierString;
  CNAccount *v12;

  v4 = a3;
  v5 = -[CNAccount initWithIdentifier:externalIdentifier:](self, "initWithIdentifier:externalIdentifier:", 0, 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_externalIdentifierString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    externalIdentifierString = v5->_externalIdentifierString;
    v5->_externalIdentifierString = (NSString *)v10;

    v5->_iOSLegacyIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("iOSLegacyIdentifier"));
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalIdentifierString, CFSTR("_externalIdentifierString"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_iOSLegacyIdentifier, CFSTR("iOSLegacyIdentifier"));

}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_externalIdentifierString, CFSTR("externalIdentifierString"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_iOSLegacyIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("iOSLegacyIdentifier"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNAccount *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v15 = v4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __21__CNAccount_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __21__CNAccount_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v7 = v4;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __21__CNAccount_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __21__CNAccount_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "externalIdentifierString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "externalIdentifierString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD aBlock[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __17__CNAccount_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __17__CNAccount_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __17__CNAccount_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __17__CNAccount_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "externalIdentifierString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)externalIdentifierString
{
  return self->_externalIdentifierString;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIdentifierString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)predicateForAccountWithExternalIdentifier:(id)a3
{
  id v3;
  CNiOSABAccountForExternalIdentifierPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABAccountForExternalIdentifierPredicate initWithAccountExternalIdentifier:]([CNiOSABAccountForExternalIdentifierPredicate alloc], "initWithAccountExternalIdentifier:", v3);

  return v4;
}

+ (id)predicateForAccountForContainerWithIdentifier:(id)a3
{
  id v3;
  CNiOSABAccountForContainerPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABAccountForContainerPredicate initWithContainerIdentifier:]([CNiOSABAccountForContainerPredicate alloc], "initWithContainerIdentifier:", v3);

  return v4;
}

+ (id)predicateForAccountsWithIdentifiers:(id)a3
{
  id v3;
  CNiOSABAccountIdentifiersPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABAccountIdentifiersPredicate initWithIdentifiers:]([CNiOSABAccountIdentifiersPredicate alloc], "initWithIdentifiers:", v3);

  return v4;
}

@end
