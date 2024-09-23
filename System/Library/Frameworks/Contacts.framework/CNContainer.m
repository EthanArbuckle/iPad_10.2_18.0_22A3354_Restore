@implementation CNContainer

void __33__CNContainer_identifierProvider__block_invoke()
{
  CNUuidIdentifierProvider *v0;
  void *v1;

  v0 = -[CNUuidIdentifierProvider initWithSuffix:]([CNUuidIdentifierProvider alloc], "initWithSuffix:", CFSTR("ABContainer"));
  v1 = (void *)identifierProvider_cn_once_object_0_1;
  identifierProvider_cn_once_object_0_1 = (uint64_t)v0;

}

- (CNContainer)init
{
  void *v3;
  void *v4;
  CNContainer *v5;

  objc_msgSend((id)objc_opt_class(), "makeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "makeDefaultContainerPermissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContainer initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:](self, "initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:", v3, 0, &stru_1E29FF900, 0, v4, 0);

  return v5;
}

- (CNContainer)initWithIdentifier:(id)a3 accountIdentifier:(id)a4 name:(id)a5 type:(int64_t)a6 permissions:(id)a7 externalIdentifier:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[CNContainer initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:](self, "initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:", a3, a5, a6, 0xFFFFFFFFLL, a4, 1, a7, a8, 0, 0, 0, 0, 0, 0, v9,
           0,
           0,
           0);
}

- (CNContainer)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 iOSLegacyIdentifier:(int)a6 accountIdentifier:(id)a7 enabled:(BOOL)a8 permissions:(id)a9 externalIdentifier:(id)a10 externalModificationTag:(id)a11 externalSyncTag:(id)a12 externalSyncData:(id)a13 constraintsPath:(id)a14 meIdentifier:(id)a15 restrictions:(unint64_t)a16 guardianRestricted:(BOOL)a17 lastSyncDate:(id)a18 providerIdentifier:(id)a19 providerMetadata:(id)a20
{
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  CNContainer *v33;
  uint64_t v34;
  NSString *identifier;
  uint64_t v36;
  NSString *name;
  uint64_t v38;
  NSString *accountIdentifier;
  uint64_t v40;
  CNContainerPermissions *permissions;
  uint64_t v42;
  NSString *externalIdentifier;
  uint64_t v44;
  NSString *externalModificationTag;
  uint64_t v46;
  NSString *externalSyncTag;
  uint64_t v48;
  NSData *externalSyncData;
  uint64_t v50;
  NSString *constraintsPath;
  uint64_t v52;
  NSString *meIdentifier;
  uint64_t v54;
  NSDate *lastSyncDate;
  uint64_t v56;
  NSString *providerIdentifier;
  uint64_t v58;
  CNProviderMetadata *providerMetadata;
  CNContainer *v60;
  id v66;
  id v67;
  id v68;
  id v69;
  objc_super v70;

  v22 = a3;
  v23 = a4;
  v24 = a7;
  v69 = a9;
  v68 = a10;
  v67 = a11;
  v25 = v24;
  v66 = a12;
  v26 = a13;
  v27 = a14;
  v28 = v23;
  v29 = a15;
  v30 = a18;
  v31 = a19;
  v32 = a20;
  v70.receiver = self;
  v70.super_class = (Class)CNContainer;
  v33 = -[CNContainer init](&v70, sel_init);
  if (v33)
  {
    v34 = objc_msgSend(v22, "copy");
    identifier = v33->_identifier;
    v33->_identifier = (NSString *)v34;

    v36 = objc_msgSend(v28, "copy");
    name = v33->_name;
    v33->_name = (NSString *)v36;

    v33->_type = a5;
    v33->_iOSLegacyIdentifier = a6;
    v33->_enabled = a8;
    v38 = objc_msgSend(v25, "copy");
    accountIdentifier = v33->_accountIdentifier;
    v33->_accountIdentifier = (NSString *)v38;

    v40 = objc_msgSend(v69, "copy");
    permissions = v33->_permissions;
    v33->_permissions = (CNContainerPermissions *)v40;

    v42 = objc_msgSend(v68, "copy");
    externalIdentifier = v33->_externalIdentifier;
    v33->_externalIdentifier = (NSString *)v42;

    v44 = objc_msgSend(v67, "copy");
    externalModificationTag = v33->_externalModificationTag;
    v33->_externalModificationTag = (NSString *)v44;

    v46 = objc_msgSend(v66, "copy");
    externalSyncTag = v33->_externalSyncTag;
    v33->_externalSyncTag = (NSString *)v46;

    v48 = objc_msgSend(v26, "copy");
    externalSyncData = v33->_externalSyncData;
    v33->_externalSyncData = (NSData *)v48;

    v50 = objc_msgSend(v27, "copy");
    constraintsPath = v33->_constraintsPath;
    v33->_constraintsPath = (NSString *)v50;

    v52 = objc_msgSend(v29, "copy");
    meIdentifier = v33->_meIdentifier;
    v33->_meIdentifier = (NSString *)v52;

    v33->_restrictions = a16;
    v33->_guardianRestricted = a17;
    v54 = objc_msgSend(v30, "copy");
    lastSyncDate = v33->_lastSyncDate;
    v33->_lastSyncDate = (NSDate *)v54;

    v56 = objc_msgSend(v31, "copy");
    providerIdentifier = v33->_providerIdentifier;
    v33->_providerIdentifier = (NSString *)v56;

    v58 = objc_msgSend(v32, "copy");
    providerMetadata = v33->_providerMetadata;
    v33->_providerMetadata = (CNProviderMetadata *)v58;

    v60 = v33;
  }

  return v33;
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

+ (id)makeDefaultContainerPermissions
{
  if (makeDefaultContainerPermissions_cn_once_token_1 != -1)
    dispatch_once(&makeDefaultContainerPermissions_cn_once_token_1, &__block_literal_global_2_1);
  return (id)makeDefaultContainerPermissions_cn_once_object_1;
}

+ (id)identifierProvider
{
  if (identifierProvider_cn_once_token_0_1 != -1)
    dispatch_once(&identifierProvider_cn_once_token_0_1, &__block_literal_global_72);
  return (id)identifierProvider_cn_once_object_0_1;
}

- (BOOL)isGuardianRestricted
{
  return self->_guardianRestricted;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CNContainerType)type
{
  return self->_type;
}

void __46__CNContainer_makeDefaultContainerPermissions__block_invoke()
{
  CNContainerPermissions *v0;
  void *v1;

  v0 = -[CNContainerPermissions initWithCanCreateContacts:canDeleteContacts:canCreateGroups:]([CNContainerPermissions alloc], "initWithCanCreateContacts:canDeleteContacts:canCreateGroups:", 0, 0, 0);
  v1 = (void *)makeDefaultContainerPermissions_cn_once_object_1;
  makeDefaultContainerPermissions_cn_once_object_1 = (uint64_t)v0;

}

+ (NSPredicate)predicateForContainerOfContactWithIdentifier:(NSString *)contactIdentifier
{
  NSString *v3;
  CNiOSABContainerOfContactPredicate *v4;

  v3 = contactIdentifier;
  v4 = -[CNiOSABContainerOfContactPredicate initWithContactIdentifier:]([CNiOSABContainerOfContactPredicate alloc], "initWithContactIdentifier:", v3);

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForContainersWithIdentifiers:(NSArray *)identifiers
{
  NSArray *v3;
  CNiOSABContainerIdentifiersPredicate *v4;

  v3 = identifiers;
  v4 = -[CNiOSABContainerIdentifiersPredicate initWithIdentifiers:]([CNiOSABContainerIdentifiersPredicate alloc], "initWithIdentifiers:", v3);

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForContainerOfGroupWithIdentifier:(NSString *)groupIdentifier
{
  NSString *v3;
  CNiOSABContainerOfGroupPredicate *v4;

  v3 = groupIdentifier;
  v4 = -[CNiOSABContainerOfGroupPredicate initWithGroupIdentifier:]([CNiOSABContainerOfGroupPredicate alloc], "initWithGroupIdentifier:", v3);

  return (NSPredicate *)v4;
}

+ (id)predicateForContainersInAccountWithIdentifier:(id)a3 includingDisabledContainers:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  CNiOSABContainersForAccountPredicate *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[CNiOSABContainersForAccountPredicate initWithAccountIdentifier:includingDisabledContainers:]([CNiOSABContainersForAccountPredicate alloc], "initWithAccountIdentifier:includingDisabledContainers:", v5, v4);

  return v6;
}

+ (id)predicateForContainersInAccountWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForContainersInAccountWithIdentifier:includingDisabledContainers:", a3, 0);
}

+ (id)predicateForContainersInAccountWithExternalIdentifier:(id)a3
{
  id v3;
  CNiOSABContainersForAccountExternalIdentifierPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABContainersForAccountExternalIdentifierPredicate initWithAccountExternalIdentifier:]([CNiOSABContainersForAccountExternalIdentifierPredicate alloc], "initWithAccountExternalIdentifier:", v3);

  return v4;
}

+ (id)predicateForDefaultContainerForAccountWithIdentifier:(id)a3
{
  id v3;
  CNiOSABDefaultContainerForAccountPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABDefaultContainerForAccountPredicate initWithAccountIdentifier:]([CNiOSABDefaultContainerForAccountPredicate alloc], "initWithAccountIdentifier:", v3);

  return v4;
}

+ (id)predicateForContainersWithType:(int64_t)a3
{
  return -[CNiOSABContainersForTypePredicate initWithType:]([CNiOSABContainersForTypePredicate alloc], "initWithType:", a3);
}

+ (id)predicateForContainerWithExternalIdentifier:(id)a3
{
  id v3;
  CNiOSABContainerExternalIdentifierPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABContainerExternalIdentifierPredicate initWithExternalIdentifier:]([CNiOSABContainerExternalIdentifierPredicate alloc], "initWithExternalIdentifier:", v3);

  return v4;
}

+ (id)predicateForContainerWithProviderIdentifier:(id)a3
{
  id v3;
  CNiOSABContainerProviderIdentifierPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABContainerProviderIdentifierPredicate initWithProviderIdentifier:]([CNiOSABContainerProviderIdentifierPredicate alloc], "initWithProviderIdentifier:", v3);

  return v4;
}

+ (id)predicateForContainersIncludingDisabled:(BOOL)a3
{
  return -[CNiOSABDisabledContainersPredicate initWithDisabledContainersIncluded:]([CNiOSABDisabledContainersPredicate alloc], "initWithDisabledContainersIncluded:", a3);
}

+ (id)predicateForLocalContainerIncludingDisabled:(BOOL)a3
{
  return -[CNiOSABLocalContainerPredicate initWithDisabledContainerIncluded:]([CNiOSABLocalContainerPredicate alloc], "initWithDisabledContainerIncluded:", a3);
}

+ (id)predicateForiOSLegacyIdentifier:(int)a3
{
  return -[CNiOSABContaineriOSLegacyIdentifierPredicate initWithiOSLegacyIdentifier:]([CNiOSABContaineriOSLegacyIdentifierPredicate alloc], "initWithiOSLegacyIdentifier:", *(_QWORD *)&a3);
}

- (CNContainer)initWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNContainer *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "makeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "makeDefaultContainerPermissions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNContainer initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:](self, "initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:", v5, 0, v4, 0, v6, 0);

  return v7;
}

- (CNContainer)initWithName:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  CNContainer *v9;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "makeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "makeDefaultContainerPermissions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNContainer initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:](self, "initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:", v7, 0, v6, a4, v8, 0);

  return v9;
}

- (CNContainer)initWithName:(id)a3 type:(int64_t)a4 externalIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  CNContainer *v12;

  v8 = a5;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "makeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "makeDefaultContainerPermissions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNContainer initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:](self, "initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:", v10, 0, v9, a4, v11, v8);

  return v12;
}

- (CNContainer)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  CNContainer *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "makeDefaultContainerPermissions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNContainer initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:](self, "initWithIdentifier:accountIdentifier:name:type:permissions:externalIdentifier:", v9, 0, v8, a5, v10, 0);

  return v11;
}

- (CNContainer)initWithContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  CNContainer *v24;
  void *v25;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v3, "type");
  v19 = objc_msgSend(v3, "iOSLegacyIdentifier");
  objc_msgSend(v3, "accountIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "isEnabled");
  objc_msgSend(v3, "permissions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalModificationTag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalSyncTag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalSyncData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintsPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "restrictions");
  v7 = objc_msgSend(v3, "isGuardianRestricted");
  objc_msgSend(v3, "lastSyncDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v12) = v7;
  v24 = -[CNContainer initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:](self, "initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:", v22, v21, v20, v19, v18, v17, v25, v16, v14, v15, v13, v4, v5, v6, v12,
          v8,
          v9,
          v10);

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContainer)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CNContainer *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  CNContainer *snapshot;
  CNContainer *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("iOSLegacyIdentifier"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeBoolForKey:", CFSTR("enabled"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("permissions"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalModificationTag"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalSyncTag"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalSyncData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("constraintsPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("meIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restrictions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("guardianRestricted"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSyncDate"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerMetadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v11;
  v28 = v11;
  LOBYTE(v27) = v10;
  v33 = (void *)v4;
  v26 = v4;
  v14 = (void *)v34;
  v15 = (void *)v32;
  v16 = -[CNContainer initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:](self, "initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:", v30, v37, v36, v26, v5, v6, v7, v9, v27, v28, v12, v13);
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = v18;
    v14 = (void *)v34;
    v15 = (void *)v32;
    objc_msgSend(v17, "setWithObjects:", v20, v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v21, CFSTR("snapshot"));
    v22 = objc_claimAutoreleasedReturnValue();
    snapshot = v16->_snapshot;
    v16->_snapshot = (CNContainer *)v22;

    v24 = v16;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_iOSLegacyIdentifier, CFSTR("iOSLegacyIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_permissions, CFSTR("permissions"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_externalIdentifier, CFSTR("externalIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_externalModificationTag, CFSTR("externalModificationTag"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_externalSyncTag, CFSTR("externalSyncTag"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_externalSyncData, CFSTR("externalSyncData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_constraintsPath, CFSTR("constraintsPath"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_meIdentifier, CFSTR("meIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_restrictions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("restrictions"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_snapshot, CFSTR("snapshot"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_guardianRestricted, CFSTR("guardianRestricted"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lastSyncDate, CFSTR("lastSyncDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_providerIdentifier, CFSTR("providerIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_providerMetadata, CFSTR("providerMetadata"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CNMutableContainer *v4;
  CNContainer *snapshot;
  CNContainer *v6;

  v4 = -[CNContainer initWithContainer:]([CNMutableContainer alloc], "initWithContainer:", self);
  snapshot = self->_snapshot;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (CNContainer *)objc_claimAutoreleasedReturnValue();

  if (snapshot == v6)
    -[CNMutableContainer setSnapshot:](v4, "setSnapshot:", self);
  return v4;
}

- (CNContainer)snapshot
{
  CNContainer *v3;
  CNContainer *v4;
  CNContainer *v5;

  v3 = self->_snapshot;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (CNContainer *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    v5 = self;

    v3 = v5;
  }
  return v3;
}

+ (id)descriptionForContainerType:(int64_t)a3
{
  id result;

  if (a3 <= 999)
  {
    switch(a3)
    {
      case 1:
        return CFSTR("Local");
      case 2:
        return CFSTR("Exchange");
      case 3:
        return CFSTR("CardDAV");
      default:
        return CFSTR("<unknown container type>");
    }
  }
  else
  {
    switch(a3)
    {
      case 1000:
        result = CFSTR("CardDAVSearch");
        break;
      case 1001:
        result = CFSTR("ExchangeGAL");
        break;
      case 1002:
        result = CFSTR("LDAP");
        break;
      case 1003:
        result = CFSTR("ContactProvider");
        break;
      default:
        return CFSTR("<unknown container type>");
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t type;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  type = self->_type;
  objc_msgSend((id)objc_opt_class(), "descriptionForContainerType:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%ld(%@)"), type, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, CFSTR("name"));
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_iOSLegacyIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("iOSLegacyIdentifier"));

  v13 = (id)objc_msgSend(v3, "appendObject:withName:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("enabled"));

  v16 = (id)objc_msgSend(v3, "appendObject:withName:", self->_externalIdentifier, CFSTR("externalIdentifier"));
  v17 = (id)objc_msgSend(v3, "appendObject:withName:", self->_externalModificationTag, CFSTR("externalModificationTag"));
  v18 = (id)objc_msgSend(v3, "appendObject:withName:", self->_externalSyncTag, CFSTR("externalSyncTag"));
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", self->_externalSyncData, CFSTR("externalSyncData"));
  v20 = (id)objc_msgSend(v3, "appendObject:withName:", self->_constraintsPath, CFSTR("constraintsPath"));
  v21 = (id)objc_msgSend(v3, "appendObject:withName:", self->_meIdentifier, CFSTR("meIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_restrictions);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v3, "appendObject:withName:", v22, CFSTR("restrictions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_guardianRestricted);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v3, "appendObject:withName:", v24, CFSTR("guardianRestricted"));

  v26 = (id)objc_msgSend(v3, "appendObject:withName:", self->_lastSyncDate, CFSTR("lastSyncDate"));
  v27 = (id)objc_msgSend(v3, "appendObject:withName:", self->_providerIdentifier, CFSTR("providerIdentifier"));
  objc_msgSend(v3, "build");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  CNContainer *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  CNContainerType v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _BOOL4 v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  BOOL v36;

  v4 = (CNContainer *)a3;
  if (self == v4)
    goto LABEL_34;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_35;
  v5 = (unint64_t)-[CNContainer identifier](self, "identifier");
  v6 = (unint64_t)-[CNContainer identifier](v4, "identifier");
  if (v5 | v6)
  {
    if (!objc_msgSend((id)v5, "isEqual:", v6))
      goto LABEL_35;
  }
  v7 = (unint64_t)-[CNContainer name](self, "name");
  v8 = (unint64_t)-[CNContainer name](v4, "name");
  if (v7 | v8)
  {
    if (!objc_msgSend((id)v7, "isEqual:", v8))
      goto LABEL_35;
  }
  v9 = -[CNContainer type](self, "type");
  if (v9 != -[CNContainer type](v4, "type"))
    goto LABEL_35;
  v10 = -[CNContainer iOSLegacyIdentifier](self, "iOSLegacyIdentifier");
  if (v10 != -[CNContainer iOSLegacyIdentifier](v4, "iOSLegacyIdentifier"))
    goto LABEL_35;
  v11 = (unint64_t)-[CNContainer accountIdentifier](self, "accountIdentifier");
  v12 = (unint64_t)-[CNContainer accountIdentifier](v4, "accountIdentifier");
  if (v11 | v12)
  {
    if (!objc_msgSend((id)v11, "isEqual:", v12))
      goto LABEL_35;
  }
  v13 = -[CNContainer isEnabled](self, "isEnabled");
  if (v13 != -[CNContainer isEnabled](v4, "isEnabled"))
    goto LABEL_35;
  v14 = (unint64_t)-[CNContainer permissions](self, "permissions");
  v15 = (unint64_t)-[CNContainer permissions](v4, "permissions");
  if (v14 | v15)
  {
    if (!objc_msgSend((id)v14, "isEqual:", v15))
      goto LABEL_35;
  }
  v16 = (unint64_t)-[CNContainer externalIdentifier](self, "externalIdentifier");
  v17 = (unint64_t)-[CNContainer externalIdentifier](v4, "externalIdentifier");
  if (v16 | v17)
  {
    if (!objc_msgSend((id)v16, "isEqual:", v17))
      goto LABEL_35;
  }
  v18 = (unint64_t)-[CNContainer externalModificationTag](self, "externalModificationTag");
  v19 = (unint64_t)-[CNContainer externalModificationTag](v4, "externalModificationTag");
  if (v18 | v19)
  {
    if (!objc_msgSend((id)v18, "isEqual:", v19))
      goto LABEL_35;
  }
  v20 = (unint64_t)-[CNContainer externalSyncTag](self, "externalSyncTag");
  v21 = (unint64_t)-[CNContainer externalSyncTag](v4, "externalSyncTag");
  if (v20 | v21)
  {
    if (!objc_msgSend((id)v20, "isEqual:", v21))
      goto LABEL_35;
  }
  v22 = (unint64_t)-[CNContainer externalSyncData](self, "externalSyncData");
  v23 = (unint64_t)-[CNContainer externalSyncData](v4, "externalSyncData");
  if (v22 | v23)
  {
    if (!objc_msgSend((id)v22, "isEqual:", v23))
      goto LABEL_35;
  }
  v24 = (unint64_t)-[CNContainer constraintsPath](self, "constraintsPath");
  v25 = (unint64_t)-[CNContainer constraintsPath](v4, "constraintsPath");
  if (v24 | v25)
  {
    if (!objc_msgSend((id)v24, "isEqual:", v25))
      goto LABEL_35;
  }
  v26 = (unint64_t)-[CNContainer meIdentifier](self, "meIdentifier");
  v27 = (unint64_t)-[CNContainer meIdentifier](v4, "meIdentifier");
  if (v26 | v27)
  {
    if (!objc_msgSend((id)v26, "isEqual:", v27))
      goto LABEL_35;
  }
  v28 = -[CNContainer isGuardianRestricted](self, "isGuardianRestricted");
  if (v28 != -[CNContainer isGuardianRestricted](v4, "isGuardianRestricted"))
    goto LABEL_35;
  v29 = -[CNContainer restrictions](self, "restrictions");
  if (v29 != -[CNContainer restrictions](v4, "restrictions"))
    goto LABEL_35;
  v30 = (unint64_t)-[CNContainer lastSyncDate](self, "lastSyncDate");
  v31 = (unint64_t)-[CNContainer lastSyncDate](v4, "lastSyncDate");
  if (v30 | v31)
  {
    if (!objc_msgSend((id)v30, "isEqual:", v31))
      goto LABEL_35;
  }
  if (((v32 = (unint64_t)-[CNContainer providerIdentifier](self, "providerIdentifier"),
         v33 = (unint64_t)-[CNContainer providerIdentifier](v4, "providerIdentifier"),
         !(v32 | v33))
     || objc_msgSend((id)v32, "isEqual:", v33))
    && ((v34 = (unint64_t)-[CNContainer providerMetadata](self, "providerMetadata"),
         v35 = (unint64_t)-[CNContainer providerMetadata](v4, "providerMetadata"),
         !(v34 | v35))
     || objc_msgSend((id)v34, "isEqual:", v35)))
  {
LABEL_34:
    v36 = 1;
  }
  else
  {
LABEL_35:
    v36 = 0;
  }

  return v36;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CNContainerType v9;
  CNContainerType v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unint64_t v50;

  v3 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "objectHash:", v4);

  v6 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "objectHash:", v7) - v5 + 32 * v5;

  v9 = -[CNContainer type](self, "type");
  if (v9 >= CNContainerTypeUnassigned)
    v10 = v9;
  else
    v10 = -(uint64_t)v9;
  v11 = 31 * (v10 - v8 + 32 * v8);
  v12 = -[CNContainer iOSLegacyIdentifier](self, "iOSLegacyIdentifier");
  if (v12 >= 0)
    v13 = v12;
  else
    v13 = -v12;
  v14 = v11 + v13;
  v15 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer accountIdentifier](self, "accountIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 31 * (objc_msgSend(v15, "objectHash:", v16) - v14 + 32 * v14);

  v18 = v17 + -[CNContainer isEnabled](self, "isEnabled");
  v19 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer permissions](self, "permissions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "objectHash:", v20) - v18 + 32 * v18;

  v22 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer externalIdentifier](self, "externalIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "objectHash:", v23) - v21 + 32 * v21;

  v25 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer externalModificationTag](self, "externalModificationTag");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "objectHash:", v26) - v24 + 32 * v24;

  v28 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer externalSyncTag](self, "externalSyncTag");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "objectHash:", v29) - v27 + 32 * v27;

  v31 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer externalSyncData](self, "externalSyncData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v31, "objectHash:", v32) - v30 + 32 * v30;

  v34 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer constraintsPath](self, "constraintsPath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "objectHash:", v35) - v33 + 32 * v33;

  v37 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer meIdentifier](self, "meIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "objectHash:", v38) - v36 + 32 * v36;

  v40 = 31 * (-[CNContainer restrictions](self, "restrictions") - v39 + 32 * v39);
  v41 = v40 + -[CNContainer isGuardianRestricted](self, "isGuardianRestricted");
  v42 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer lastSyncDate](self, "lastSyncDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v42, "objectHash:", v43) - v41 + 32 * v41;

  v45 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer providerIdentifier](self, "providerIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v45, "objectHash:", v46) - v44 + 32 * v44;

  v48 = (void *)MEMORY[0x1E0D13A78];
  -[CNContainer providerMetadata](self, "providerMetadata");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v48, "objectHash:", v49) - v47 + 32 * v47 + 0x76BB734BA8507DD1;

  return v50;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (NSString)externalSyncTag
{
  return self->_externalSyncTag;
}

- (NSData)externalSyncData
{
  return self->_externalSyncData;
}

- (NSString)constraintsPath
{
  return self->_constraintsPath;
}

- (NSString)meIdentifier
{
  return self->_meIdentifier;
}

- (unint64_t)restrictions
{
  return self->_restrictions;
}

- (BOOL)isGuardianStateDirty
{
  return self->_guardianStateDirty;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CNContainerPermissions)permissions
{
  return self->_permissions;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (CNProviderMetadata)providerMetadata
{
  return self->_providerMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerMetadata, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_meIdentifier, 0);
  objc_storeStrong((id *)&self->_constraintsPath, 0);
  objc_storeStrong((id *)&self->_externalSyncData, 0);
  objc_storeStrong((id *)&self->_externalSyncTag, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
