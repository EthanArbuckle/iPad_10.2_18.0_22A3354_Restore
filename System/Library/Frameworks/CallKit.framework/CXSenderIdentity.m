@implementation CXSenderIdentity

- (CXSenderIdentity)initWithUUID:(id)a3 handle:(id)a4 localizedName:(id)a5
{
  id v8;
  id v9;
  id v10;
  CXAccount *v11;
  void *v12;
  CXAccount *v13;
  CXSenderIdentity *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [CXAccount alloc];
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  v13 = -[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:](v11, "initWithUUID:description:serviceName:isoCountryCode:handle:", v12, v8, CFSTR("Unknown Service"), CFSTR("xw"), v9);

  v14 = -[CXSenderIdentity initWithUUID:account:](self, "initWithUUID:account:", v10, v13);
  return v14;
}

- (CXSenderIdentity)initWithUUID:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  CXSenderIdentity *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CXSenderIdentity;
  v9 = -[CXSenderIdentity init](&v11, sel_init);
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        objc_storeStrong((id *)&v9->_UUID, a3);
        objc_storeStrong((id *)&v9->_account, a4);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXSenderIdentity initWithUUID:account:]", CFSTR("UUID"));
      if (v8)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXSenderIdentity initWithUUID:account:]", CFSTR("account"));
    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (CXHandle)handle
{
  void *v2;
  void *v3;

  -[CXSenderIdentity account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CXHandle *)v3;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[CXSenderIdentity account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXSenderIdentity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXSenderIdentity account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUUID:account:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSenderIdentity)initWithCoder:(id)a3
{
  id v4;
  CXSenderIdentity *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CXAccount *account;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSUUID *UUID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CXSenderIdentity;
  v5 = -[CXSenderIdentity init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_account);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (CXAccount *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CXSenderIdentity account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_account);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXSenderIdentity UUID](self, "UUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_UUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXSenderIdentity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_account);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXSenderIdentity account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CXSenderIdentity isEqualToSenderIdentity:](self, "isEqualToSenderIdentity:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CXSenderIdentity account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXSenderIdentity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqualToSenderIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CXSenderIdentity account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToAccount:", v6))
  {
    -[CXSenderIdentity UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (CXAccount)account
{
  return self->_account;
}

- (NSString)localizedShortName
{
  return self->_localizedShortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
