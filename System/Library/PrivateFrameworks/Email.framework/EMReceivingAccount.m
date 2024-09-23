@implementation EMReceivingAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMReceivingAccount)initWithCoder:(id)a3
{
  id v4;
  EMReceivingAccount *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMReceivingAccount;
  v5 = -[EMObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_hostname"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__EMReceivingAccount_initWithCoder___block_invoke;
    v9[3] = &unk_1E70F5768;
    v10 = v4;
    -[EMReceivingAccount _commonInitName:hostname:builder:](v5, "_commonInitName:hostname:builder:", v6, v7, v9);

  }
  return v5;
}

- (EMReceivingAccount)initWithObjectID:(id)a3 name:(id)a4 hostname:(id)a5 builder:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EMReceivingAccount *v15;
  EMReceivingAccount *v16;
  void *v18;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMReceivingAccount.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v19.receiver = self;
  v19.super_class = (Class)EMReceivingAccount;
  v15 = -[EMObject initWithObjectID:](&v19, sel_initWithObjectID_, v11);
  v16 = v15;
  if (v15)
    -[EMReceivingAccount _commonInitName:hostname:builder:](v15, "_commonInitName:hostname:builder:", v12, v13, v14);

  return v16;
}

- (void)_commonInitName:(id)a3 hostname:(id)a4 builder:(id)a5
{
  NSString *v9;
  void (**v10)(id, EMReceivingAccount *);
  NSString *hostname;
  id v12;

  v12 = a3;
  v9 = (NSString *)a4;
  objc_storeStrong((id *)&self->_name, a3);
  v10 = (void (**)(id, EMReceivingAccount *))a5;
  hostname = self->_hostname;
  self->_hostname = v9;

  v10[2](v10, self);
}

void __36__EMReceivingAccount_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_username"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsername:", v3);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_statisticsKind"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStatisticsKind:", v4);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_deliveryAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDeliveryAccount:", v5);

  objc_msgSend(v11, "setSourceIsManaged:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_sourceIsManaged")));
  objc_msgSend(v11, "setShouldArchiveByDefault:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_shouldArchiveByDefault")));
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v9, CFSTR("EFPropertyKey_emailAddresses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEmailAddresses:", v10);

  objc_msgSend(v11, "setPrimaryiCloudAccount:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_primaryiCloudAccount")));
  objc_msgSend(v11, "setIsLocalAccount:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isLocalAccount")));

}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setStatisticsKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setSourceIsManaged:(BOOL)a3
{
  self->_sourceIsManaged = a3;
}

- (void)setShouldArchiveByDefault:(BOOL)a3
{
  self->_shouldArchiveByDefault = a3;
}

- (void)setPrimaryiCloudAccount:(BOOL)a3
{
  self->_primaryiCloudAccount = a3;
}

- (void)setIsLocalAccount:(BOOL)a3
{
  self->_isLocalAccount = a3;
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (void)setDeliveryAccount:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryAccount, a3);
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
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMReceivingAccount;
  -[EMObject encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[EMReceivingAccount name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_name"));

  -[EMReceivingAccount hostname](self, "hostname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_hostname"));

  -[EMReceivingAccount username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_username"));

  -[EMReceivingAccount statisticsKind](self, "statisticsKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_statisticsKind"));

  -[EMReceivingAccount deliveryAccount](self, "deliveryAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_deliveryAccount"));

  -[EMReceivingAccount emailAddresses](self, "emailAddresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_emailAddresses"));

  objc_msgSend(v4, "encodeBool:forKey:", -[EMReceivingAccount sourceIsManaged](self, "sourceIsManaged"), CFSTR("EFPropertyKey_sourceIsManaged"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMReceivingAccount shouldArchiveByDefault](self, "shouldArchiveByDefault"), CFSTR("EFPropertyKey_shouldArchiveByDefault"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMReceivingAccount isPrimaryiCloudAccount](self, "isPrimaryiCloudAccount"), CFSTR("EFPropertyKey_primaryiCloudAccount"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMReceivingAccount isLocalAccount](self, "isLocalAccount"), CFSTR("EFPropertyKey_isLocalAccount"));

}

- (id)name
{
  return self->_name;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)statisticsKind
{
  return self->_statisticsKind;
}

- (BOOL)sourceIsManaged
{
  return self->_sourceIsManaged;
}

- (BOOL)shouldArchiveByDefault
{
  return self->_shouldArchiveByDefault;
}

- (BOOL)isPrimaryiCloudAccount
{
  return self->_primaryiCloudAccount;
}

- (BOOL)isLocalAccount
{
  return self->_isLocalAccount;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (EMDeliveryAccount)deliveryAccount
{
  return self->_deliveryAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsKind, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (ECEmailAddress)identityEmailAddress
{
  void *v3;
  void *v4;

  EFAtomicObjectLoad();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EMReceivingAccount _calculateIdentityEmailAddress](self, "_calculateIdentityEmailAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    EFAtomicObjectSetIfNil();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (ECEmailAddress *)v3;
}

- (id)_calculateIdentityEmailAddress
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[EMReceivingAccount emailAddresses](self, "emailAddresses");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v36, "count") <= 1)
  {
    objc_msgSend(v36, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  -[EMReceivingAccount hostname](self, "hostname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v4;
  objc_msgSend(v4, "_lp_highLevelDomainFromHost");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMReceivingAccount username](self, "username");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localPart");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v33;
  if (v6)
    v8 = (void *)v6;
  v34 = v8;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v36;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v9)
  {

LABEL_37:
    objc_msgSend(obj, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v37 = 0;
    v35 = 0;
    v39 = 0;
    v10 = 0;
    goto LABEL_38;
  }
  v10 = 0;
  v39 = 0;
  v35 = 0;
  v37 = 0;
  v32 = 0;
  v11 = *(_QWORD *)v42;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v42 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
      if ((objc_msgSend(v5, "isEqual:", v13) & 1) != 0)
      {
        v3 = v13;

        goto LABEL_38;
      }
      if (!v10)
      {
        objc_msgSend(v13, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "ef_caseInsensitiveIsEqualToString:", v4);

        if ((v15 & 1) != 0)
        {
          v16 = v13;
          v17 = v39;
          v18 = v37;
LABEL_14:
          v19 = v13;
          v10 = v16;
          v39 = v17;
          v37 = v18;
          goto LABEL_17;
        }
        if (v39)
        {
          v10 = 0;
        }
        else
        {
          objc_msgSend(v13, "localPart");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "ef_caseInsensitiveIsEqualToString:", v34);

          v22 = (void *)MEMORY[0x1E0D1EF18];
          objc_msgSend(v13, "domain");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v22) = objc_msgSend(v22, "domain:isSubdomainOfDomain:", v4, v23);

          if ((_DWORD)v22)
          {
            v24 = v35;
            if (!v35)
              v24 = v13;
            v35 = v24;
            v16 = 0;
            v10 = 0;
            v39 = 0;
            v17 = v13;
            v18 = v37;
            if ((v21 & 1) != 0)
              goto LABEL_14;
          }
          else if (v37)
          {
            v10 = 0;
            v39 = 0;
          }
          else
          {
            objc_msgSend(v13, "highLevelDomain");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "ef_caseInsensitiveIsEqualToString:", v31);

            if (v26)
            {
              v27 = v32;
              if (!v32)
                v27 = v13;
              v32 = v27;
              v16 = 0;
              v17 = 0;
              v10 = 0;
              v39 = 0;
              v37 = 0;
              v18 = v13;
              if (v21)
                goto LABEL_14;
            }
            else
            {
              v10 = 0;
              v39 = 0;
              v37 = 0;
            }
          }
        }
      }
LABEL_17:
      ++v12;
      v4 = v40;
    }
    while (v9 != v12);
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    v9 = v28;
  }
  while (v28);

  if (v10)
  {
    v29 = v10;
    goto LABEL_45;
  }
  v29 = v39;
  if (v39)
    goto LABEL_45;
  v29 = v35;
  if (v35)
    goto LABEL_42;
  if (v37)
  {
    v35 = 0;
    v39 = 0;
    v29 = v37;
    goto LABEL_45;
  }
  v29 = v32;
  if (!v32)
    goto LABEL_37;
  v37 = 0;
  v35 = 0;
LABEL_42:
  v39 = 0;
LABEL_45:
  v3 = v29;
LABEL_38:

LABEL_39:
  return v3;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end
