@implementation EMDeliveryAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_commonInitName:(id)a3 hostname:(id)a4 builder:(id)a5
{
  NSString *v9;
  void (**v10)(id, EMDeliveryAccount *);
  NSString *hostname;
  id v12;

  v12 = a3;
  v9 = (NSString *)a4;
  objc_storeStrong((id *)&self->_name, a3);
  v10 = (void (**)(id, EMDeliveryAccount *))a5;
  hostname = self->_hostname;
  self->_hostname = v9;

  v10[2](v10, self);
}

- (EMDeliveryAccount)initWithCoder:(id)a3
{
  id v4;
  EMDeliveryAccount *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMDeliveryAccount;
  v5 = -[EMObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_hostname"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__EMDeliveryAccount_initWithCoder___block_invoke;
    v9[3] = &unk_1E70F2A88;
    v10 = v4;
    -[EMDeliveryAccount _commonInitName:hostname:builder:](v5, "_commonInitName:hostname:builder:", v6, v7, v9);

  }
  return v5;
}

void __35__EMDeliveryAccount_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_username"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsername:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("EFPropertyKey_maximumMessageBytes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumMessageBytes:", objc_msgSend(v6, "unsignedLongLongValue"));

  objc_msgSend(v7, "setPrimaryiCloudAccount:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_primaryiCloudAccount")));
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setPrimaryiCloudAccount:(BOOL)a3
{
  self->_primaryiCloudAccount = a3;
}

- (void)setMaximumMessageBytes:(unint64_t)a3
{
  self->_maximumMessageBytes = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMDeliveryAccount;
  -[EMObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[EMDeliveryAccount name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_name"));

  -[EMDeliveryAccount hostname](self, "hostname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_hostname"));

  -[EMDeliveryAccount username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_username"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[EMDeliveryAccount maximumMessageBytes](self, "maximumMessageBytes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_maximumMessageBytes"));

  objc_msgSend(v4, "encodeBool:forKey:", -[EMDeliveryAccount isPrimaryiCloudAccount](self, "isPrimaryiCloudAccount"), CFSTR("EFPropertyKey_primaryiCloudAccount"));
}

- (NSString)username
{
  return self->_username;
}

- (id)name
{
  return self->_name;
}

- (unint64_t)maximumMessageBytes
{
  return self->_maximumMessageBytes;
}

- (BOOL)isPrimaryiCloudAccount
{
  return self->_primaryiCloudAccount;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (EMDeliveryAccount)initWithObjectID:(id)a3 name:(id)a4 hostname:(id)a5 builder:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, EMDeliveryAccount *);
  EMDeliveryAccount *v15;
  EMDeliveryAccount *v16;
  void *v18;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, EMDeliveryAccount *))a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMDeliveryAccount.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v19.receiver = self;
  v19.super_class = (Class)EMDeliveryAccount;
  v15 = -[EMObject initWithObjectID:](&v19, sel_initWithObjectID_, v11);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a4);
    objc_storeStrong((id *)&v16->_hostname, a5);
    v14[2](v14, v16);
  }

  return v16;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
