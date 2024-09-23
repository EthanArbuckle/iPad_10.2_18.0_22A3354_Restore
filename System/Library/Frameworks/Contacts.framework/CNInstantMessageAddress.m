@implementation CNInstantMessageAddress

+ (id)Username
{
  return &__block_literal_global_41_0;
}

+ (NSString)localizedStringForKey:(NSString *)key
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D13A98], "localizedStringForString:class:returningNilIfNotFound:", key, a1, 0);
}

+ (NSString)localizedStringForService:(NSString *)service
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D13A98];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = service;
  objc_msgSend(v5, "bundleForClass:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForString:bundle:table:returningNilIfNotFound:", v6, v7, CFSTR("MessagingServices"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (CNInstantMessageAddress)instantMessageAddressWithDictionaryRepresentation:(id)a3
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  v3 = a3;
  +[CN instantMessageAddressFromDictionaryTransform](CN, "instantMessageAddressFromDictionaryTransform");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v4)[2](v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNInstantMessageAddress *)v5;
}

- (id)dictionaryRepresentation
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;

  +[CN instantMessageAddressToDictionaryTransform](CN, "instantMessageAddressToDictionaryTransform");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, CNInstantMessageAddress *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNInstantMessageAddress)init
{
  return -[CNInstantMessageAddress initWithUsername:service:](self, "initWithUsername:service:", &stru_1E29FF900, &stru_1E29FF900);
}

- (CNInstantMessageAddress)initWithUsername:(NSString *)username service:(NSString *)service
{
  return -[CNInstantMessageAddress initWithUsername:userIdentifier:service:teamIdentifier:bundleIdentifiers:](self, "initWithUsername:userIdentifier:service:teamIdentifier:bundleIdentifiers:", username, 0, service, 0, 0);
}

- (CNInstantMessageAddress)initWithUsername:(id)a3 userIdentifier:(id)a4 service:(id)a5 teamIdentifier:(id)a6 bundleIdentifiers:(id)a7
{
  id v12;
  id v13;
  __CFString *v14;
  id v15;
  id v16;
  CNInstantMessageAddress *v17;
  CNInstantMessageAddress *v18;
  uint64_t v19;
  NSString *username;
  uint64_t v21;
  NSString *userIdentifier;
  uint64_t v23;
  NSString *service;
  uint64_t v25;
  NSString *teamIdentifier;
  uint64_t v27;
  NSArray *bundleIdentifiers;
  CNInstantMessageAddress *v29;
  objc_super v31;

  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)CNInstantMessageAddress;
  v17 = -[CNInstantMessageAddress init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    if (!v14)
      v14 = &stru_1E29FF900;
    if (v12)
    {
      v19 = objc_msgSend(v12, "copy");
      username = v18->_username;
      v18->_username = (NSString *)v19;
    }
    else
    {
      username = v17->_username;
      v17->_username = (NSString *)&stru_1E29FF900;
    }

    v21 = objc_msgSend(v13, "copy");
    userIdentifier = v18->_userIdentifier;
    v18->_userIdentifier = (NSString *)v21;

    v23 = -[__CFString copy](v14, "copy");
    service = v18->_service;
    v18->_service = (NSString *)v23;

    v25 = objc_msgSend(v15, "copy");
    teamIdentifier = v18->_teamIdentifier;
    v18->_teamIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v16, "copy");
    bundleIdentifiers = v18->_bundleIdentifiers;
    v18->_bundleIdentifiers = (NSArray *)v27;

    v29 = v18;
  }

  return v18;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CNMutableInstantMessageAddress *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNMutableInstantMessageAddress *v10;

  v4 = [CNMutableInstantMessageAddress alloc];
  -[CNInstantMessageAddress username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNInstantMessageAddress userIdentifier](self, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNInstantMessageAddress service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNInstantMessageAddress teamIdentifier](self, "teamIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNInstantMessageAddress bundleIdentifiers](self, "bundleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNInstantMessageAddress initWithUsername:userIdentifier:service:teamIdentifier:bundleIdentifiers:](v4, "initWithUsername:userIdentifier:service:teamIdentifier:bundleIdentifiers:", v5, v6, v7, v8, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNInstantMessageAddress)initWithCoder:(id)a3
{
  id v4;
  CNInstantMessageAddress *v5;
  void *v6;
  uint64_t v7;
  NSString *username;
  void *v9;
  uint64_t v10;
  NSString *userIdentifier;
  void *v12;
  uint64_t v13;
  NSString *service;
  void *v15;
  uint64_t v16;
  NSString *teamIdentifier;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *bundleIdentifiers;
  CNInstantMessageAddress *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CNInstantMessageAddress;
  v5 = -[CNInstantMessageAddress init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_username"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    username = v5->_username;
    v5->_username = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_service"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    service = v5->_service;
    v5->_service = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_teamIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("_bundleIdentifiers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *username;
  id v5;

  username = self->_username;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", username, CFSTR("_username"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentifier, CFSTR("_userIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_service, CFSTR("_service"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teamIdentifier, CFSTR("_teamIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifiers, CFSTR("_bundleIdentifiers"));

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("username"), self->_username);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("userIdentifier"), self->_userIdentifier);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("service"), self->_service);
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("teamIdentifier"), self->_teamIdentifier);
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("bundleIdentifiers"), self->_bundleIdentifiers);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD aBlock[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __35__CNInstantMessageAddress_isEqual___block_invoke;
  v25[3] = &unk_1E29F7D70;
  v25[4] = self;
  v26 = v4;
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __35__CNInstantMessageAddress_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v8 = v26;
  v24 = v8;
  v9 = _Block_copy(aBlock);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __35__CNInstantMessageAddress_isEqual___block_invoke_3;
  v21[3] = &unk_1E29F7D70;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  v11 = _Block_copy(v21);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __35__CNInstantMessageAddress_isEqual___block_invoke_4;
  v19[3] = &unk_1E29F7D70;
  v19[4] = self;
  v12 = v10;
  v20 = v12;
  v13 = _Block_copy(v19);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __35__CNInstantMessageAddress_isEqual___block_invoke_5;
  v17[3] = &unk_1E29F7D70;
  v17[4] = self;
  v18 = v12;
  v14 = v12;
  v15 = _Block_copy(v17);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v14, v6, self, v25, v9, v11, v13, v15, 0);

  return (char)self;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "userIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "userIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "teamIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "teamIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD aBlock[5];
  _QWORD v15[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __31__CNInstantMessageAddress_hash__block_invoke;
  v15[3] = &unk_1E29F7D98;
  v15[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__CNInstantMessageAddress_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __31__CNInstantMessageAddress_hash__block_invoke_3;
  v13[3] = &unk_1E29F7D98;
  v13[4] = self;
  v6 = _Block_copy(v13);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __31__CNInstantMessageAddress_hash__block_invoke_4;
  v12[3] = &unk_1E29F7D98;
  v12[4] = self;
  v7 = _Block_copy(v12);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __31__CNInstantMessageAddress_hash__block_invoke_5;
  v11[3] = &unk_1E29F7D98;
  v11[4] = self;
  v8 = _Block_copy(v11);
  v9 = objc_msgSend(v3, "hashWithBlocks:", v15, v5, v6, v7, v8, 0);

  return v9;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "username");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "userIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "teamIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (BOOL)isValid:(id *)a3
{
  id v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  if (isValid__cn_once_token_0_0 != -1)
    dispatch_once(&isValid__cn_once_token_0_0, &__block_literal_global_52);
  v5 = (id)isValid__cn_once_object_0_0;
  if (isValid__cn_once_token_1_0 != -1)
    dispatch_once(&isValid__cn_once_token_1_0, &__block_literal_global_36);
  v6 = isValid__cn_once_token_2_0;
  v7 = (id)isValid__cn_once_object_1_0;
  if (v6 != -1)
    dispatch_once(&isValid__cn_once_token_2_0, &__block_literal_global_37_0);
  v8 = +[CN areValidKeyPaths:forObject:expectedClasses:allowNil:error:](CN, "areValidKeyPaths:forObject:expectedClasses:allowNil:error:", v5, self, v7, isValid__cn_once_object_2_0, a3);

  return v8;
}

void __35__CNInstantMessageAddress_isValid___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A40650, "copy");
  v1 = (void *)isValid__cn_once_object_0_0;
  isValid__cn_once_object_0_0 = v0;

}

void __35__CNInstantMessageAddress_isValid___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy", v3, v4, v5, v6);
  v2 = (void *)isValid__cn_once_object_1_0;
  isValid__cn_once_object_1_0 = v1;

}

void __35__CNInstantMessageAddress_isValid___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A40668, "copy");
  v1 = (void *)isValid__cn_once_object_2_0;
  isValid__cn_once_object_2_0 = v0;

}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
