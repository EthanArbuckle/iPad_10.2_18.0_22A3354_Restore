@implementation VSAccount

- (VSAccount)init
{
  VSAccount *v2;
  VSOptional *v3;
  VSOptional *optionalIdentityProviderDisplayName;
  VSOptional *v5;
  VSOptional *identityProviderID;
  VSOptional *v7;
  VSOptional *authenticationToken;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSAccount;
  v2 = -[VSAccount init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    optionalIdentityProviderDisplayName = v2->_optionalIdentityProviderDisplayName;
    v2->_optionalIdentityProviderDisplayName = v3;

    v5 = objc_alloc_init(VSOptional);
    identityProviderID = v2->_identityProviderID;
    v2->_identityProviderID = v5;

    v7 = objc_alloc_init(VSOptional);
    authenticationToken = v2->_authenticationToken;
    v2->_authenticationToken = v7;

    v2->_version = 1;
  }
  return v2;
}

- (unint64_t)contentsHash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[VSAccount username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v15 = v4;
  -[VSAccount preferredAppID](self, "preferredAppID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v13[3] ^= v6;

  -[VSAccount authenticationToken](self, "authenticationToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __25__VSAccount_contentsHash__block_invoke;
  v11[3] = &unk_1E93A0AB0;
  v11[4] = &v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __25__VSAccount_contentsHash__block_invoke_2;
  v10[3] = &unk_1E939EE88;
  objc_msgSend(v7, "conditionallyUnwrapObject:otherwise:", v11, v10);

  v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __25__VSAccount_contentsHash__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= objc_msgSend(v4, "hash");

  objc_msgSend(v3, "expirationDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= objc_msgSend(v5, "hash");
}

void __25__VSAccount_contentsHash__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  VSErrorLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __25__VSAccount_contentsHash__block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (id)effectiveModificationDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[VSAccount keychainItem](self, "keychainItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[VSAccount legacyKeychainItem](self, "legacyKeychainItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modificationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v7;
    }
    else
    {
      VSErrorLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[VSAccount effectiveModificationDate].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);

      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (NSString)identityProviderDisplayName
{
  void *v2;
  void *v3;

  -[VSAccount optionalIdentityProviderDisplayName](self, "optionalIdentityProviderDisplayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isSynchronizable
{
  return !-[VSAccount version](self, "version") || self->_synchronizable;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VSAccount)initWithCoder:(id)a3
{
  id v4;
  VSAccount *v5;
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
  void *v18;
  id v19;
  uint64_t v20;
  __objc2_class **v21;
  void *v22;
  void *v23;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  v5 = -[VSAccount init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountTypeDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAccount setAccountTypeDescription:](v5, "setAccountTypeDescription:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAccount setAccountDescription:](v5, "setAccountDescription:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identityProviderDisplayName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAccount setOptionalIdentityProviderDisplayName:](v5, "setOptionalIdentityProviderDisplayName:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identityProviderID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAccount setIdentityProviderID:](v5, "setIdentityProviderID:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAccount setUsername:](v5, "setUsername:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredAppID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAccount setPreferredAppID:](v5, "setPreferredAppID:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAccount setVersion:](v5, "setVersion:", objc_msgSend(v15, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("synchronizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAccount setSynchronizable:](v5, "setSynchronizable:", objc_msgSend(v16, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationToken"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
LABEL_10:

      goto LABEL_11;
    }
    v19 = v17;
    v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("authenticationTokenKind"));
    if (v20)
    {
      if (v20 != 1)
      {
        v22 = 0;
        goto LABEL_9;
      }
      v21 = off_1E939D830;
    }
    else
    {
      v21 = off_1E939D880;
    }
    v22 = (void *)objc_msgSend(objc_alloc(*v21), "initWithSerializedData:", v19);
LABEL_9:
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAccount setAuthenticationToken:](v5, "setAuthenticationToken:", v23);

    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  -[VSAccount accountTypeDescription](self, "accountTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountTypeDescription"));

  -[VSAccount accountDescription](self, "accountDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountDescription"));

  -[VSAccount identityProviderDisplayName](self, "identityProviderDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("identityProviderDisplayName"));

  -[VSAccount identityProviderID](self, "identityProviderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("identityProviderID"));

  -[VSAccount username](self, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("username"));

  -[VSAccount preferredAppID](self, "preferredAppID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("preferredAppID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VSAccount version](self, "version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VSAccount isSynchronizable](self, "isSynchronizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("synchronizable"));

  -[VSAccount authenticationToken](self, "authenticationToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __29__VSAccount_encodeWithCoder___block_invoke;
  v16[3] = &unk_1E93A0AD8;
  v17 = v4;
  v15 = v4;
  objc_msgSend(v14, "conditionallyUnwrapObject:", v16);

}

void __29__VSAccount_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", objc_msgSend(v3, "isOpaque"), CFSTR("authenticationTokenKind"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "serializedData");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("authenticationToken"));
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[VSAccount accountTypeDescription](self, "accountTypeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VSAccount accountDescription](self, "accountDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[VSAccount optionalIdentityProviderDisplayName](self, "optionalIdentityProviderDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[VSAccount identityProviderID](self, "identityProviderID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[VSAccount username](self, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[VSAccount authenticationToken](self, "authenticationToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  VSAccount *v4;
  VSAccount *v5;
  VSAccount *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  VSAccount *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  char v32;

  v4 = (VSAccount *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    if (v4)
    {
      v6 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = 0;
LABEL_31:

        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpectedly, object was %@, instead of VSAccount."), v10);

      }
      v11 = v6;
      -[VSAccount accountTypeDescription](self, "accountTypeDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccount accountTypeDescription](v11, "accountTypeDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v15 = v13;
      if (v14 == v15)
      {

      }
      else
      {
        v16 = v15;
        if (!v14 || !v15)
          goto LABEL_28;
        v17 = objc_msgSend(v14, "isEqual:", v15);

        if ((v17 & 1) == 0)
          goto LABEL_27;
      }
      -[VSAccount accountDescription](self, "accountDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccount accountDescription](v11, "accountDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      v21 = v20;
      if (v14 == v21)
      {

      }
      else
      {
        v16 = v21;
        if (!v14 || !v21)
          goto LABEL_28;
        v22 = objc_msgSend(v14, "isEqual:", v21);

        if ((v22 & 1) == 0)
          goto LABEL_27;
      }
      -[VSAccount optionalIdentityProviderDisplayName](self, "optionalIdentityProviderDisplayName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccount optionalIdentityProviderDisplayName](v11, "optionalIdentityProviderDisplayName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_27;
      -[VSAccount identityProviderID](self, "identityProviderID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccount identityProviderID](v11, "identityProviderID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (!v28)
        goto LABEL_27;
      -[VSAccount username](self, "username");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccount username](v11, "username");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v29;
      v31 = v30;
      if (v14 == v31)
      {

LABEL_34:
        -[VSAccount authenticationToken](self, "authenticationToken");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        -[VSAccount authenticationToken](v11, "authenticationToken");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v14, "isEqual:", v16);
        goto LABEL_29;
      }
      v16 = v31;
      if (v14 && v31)
      {
        v32 = objc_msgSend(v14, "isEqual:", v31);

        if ((v32 & 1) == 0)
        {
LABEL_27:
          v18 = 0;
LABEL_30:

          goto LABEL_31;
        }
        goto LABEL_34;
      }
LABEL_28:

      v18 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v18 = 0;
  }
LABEL_32:

  return v18;
}

- (id)description
{
  id v3;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccount accountTypeDescription](self, "accountTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("accountTypeDescription"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccount accountDescription](self, "accountDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("accountDescription"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccount identityProviderDisplayName](self, "identityProviderDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("identityProviderDisplayName"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccount identityProviderID](self, "identityProviderID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("identityProviderID"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccount username](self, "username");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("username"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccount authenticationToken](self, "authenticationToken");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("authenticationToken"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  v22 = (void *)MEMORY[0x1E0CB3940];
  v27.receiver = self;
  v27.super_class = (Class)VSAccount;
  -[VSAccount description](&v27, sel_description);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@ %@>"), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (VSAccountStore)accountStore
{
  return (VSAccountStore *)objc_loadWeakRetained((id *)&self->_accountStore);
}

- (void)setAccountStore:(id)a3
{
  objc_storeWeak((id *)&self->_accountStore, a3);
}

- (NSString)accountTypeDescription
{
  return self->_accountTypeDescription;
}

- (void)setAccountTypeDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (void)setAccountDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (VSOptional)optionalIdentityProviderDisplayName
{
  return self->_optionalIdentityProviderDisplayName;
}

- (void)setOptionalIdentityProviderDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_optionalIdentityProviderDisplayName, a3);
}

- (VSOptional)identityProviderID
{
  return self->_identityProviderID;
}

- (void)setIdentityProviderID:(id)a3
{
  objc_storeStrong((id *)&self->_identityProviderID, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)preferredAppID
{
  return self->_preferredAppID;
}

- (void)setPreferredAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (VSOptional)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationToken, a3);
}

- (void)setSynchronizable:(BOOL)a3
{
  self->_synchronizable = a3;
}

- (VSKeychainGenericPassword)keychainItem
{
  return self->_keychainItem;
}

- (void)setKeychainItem:(id)a3
{
  objc_storeStrong((id *)&self->_keychainItem, a3);
}

- (VSKeychainGenericPassword)legacyKeychainItem
{
  return self->_legacyKeychainItem;
}

- (void)setLegacyKeychainItem:(id)a3
{
  objc_storeStrong((id *)&self->_legacyKeychainItem, a3);
}

- (NSNumber)legacyItemHash
{
  return self->_legacyItemHash;
}

- (void)setLegacyItemHash:(id)a3
{
  objc_storeStrong((id *)&self->_legacyItemHash, a3);
}

- (NSData)channelsData
{
  return self->_channelsData;
}

- (void)setChannelsData:(id)a3
{
  objc_storeStrong((id *)&self->_channelsData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelsData, 0);
  objc_storeStrong((id *)&self->_legacyItemHash, 0);
  objc_storeStrong((id *)&self->_legacyKeychainItem, 0);
  objc_storeStrong((id *)&self->_keychainItem, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_preferredAppID, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_identityProviderID, 0);
  objc_storeStrong((id *)&self->_optionalIdentityProviderDisplayName, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_accountTypeDescription, 0);
  objc_destroyWeak((id *)&self->_accountStore);
}

void __25__VSAccount_contentsHash__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D2419000, a2, a3, "Attempted to calculate contents hash for account with no authenticationToken: %@", a5, a6, a7, a8, 2u);
}

- (void)effectiveModificationDate
{
  OUTLINED_FUNCTION_0_2(&dword_1D2419000, a2, a3, "VSAccount has neither a legacy or modern item with a modification date: %@", a5, a6, a7, a8, 2u);
}

@end
