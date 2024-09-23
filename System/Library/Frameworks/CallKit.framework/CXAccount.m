@implementation CXAccount

- (CXAccount)init
{
  -[CXAccount doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CXAccount)initWithUUID:(id)a3 description:(id)a4 serviceName:(id)a5 isoCountryCode:(id)a6 handle:(id)a7
{
  return -[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:](self, "initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:", a3, a4, a5, a6, a7, &stru_1E4B8CB80);
}

- (CXAccount)initWithUUID:(id)a3 description:(id)a4 serviceName:(id)a5 isoCountryCode:(id)a6 handle:(id)a7 shortLabel:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CXAccount *v21;
  uint64_t v22;
  NSString *accountDescription;
  uint64_t v24;
  NSString *serviceName;
  uint64_t v26;
  NSString *isoCountryCode;
  uint64_t v28;
  NSString *shortLabel;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)CXAccount;
  v21 = -[CXAccount init](&v31, sel_init);
  if (v21)
  {
    if (v15)
    {
      if (v16)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", CFSTR("UUID"));
      if (v16)
      {
LABEL_4:
        if (v17)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", CFSTR("description"));
    if (v17)
    {
LABEL_5:
      if (v18)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", CFSTR("serviceName"));
    if (v18)
    {
LABEL_6:
      if (v20)
      {
LABEL_7:
        objc_storeStrong((id *)&v21->_UUID, a3);
        v22 = objc_msgSend(v16, "copy");
        accountDescription = v21->_accountDescription;
        v21->_accountDescription = (NSString *)v22;

        v24 = objc_msgSend(v17, "copy");
        serviceName = v21->_serviceName;
        v21->_serviceName = (NSString *)v24;

        v26 = objc_msgSend(v18, "copy");
        isoCountryCode = v21->_isoCountryCode;
        v21->_isoCountryCode = (NSString *)v26;

        objc_storeStrong((id *)&v21->_handle, a7);
        v28 = objc_msgSend(v20, "copy");
        shortLabel = v21->_shortLabel;
        v21->_shortLabel = (NSString *)v28;

        goto LABEL_8;
      }
LABEL_13:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", CFSTR("shortLabel"));
      goto LABEL_7;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", CFSTR("isoCountryCode"));
    if (v20)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_8:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXAccount UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount accountDescription](self, "accountDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount isoCountryCode](self, "isoCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount handle](self, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithUUID:description:serviceName:isoCountryCode:handle:", v5, v6, v7, v8, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXAccount)initWithCoder:(id)a3
{
  id v4;
  CXAccount *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *accountDescription;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CXHandle *handle;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *isoCountryCode;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *serviceName;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSUUID *UUID;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSString *shortLabel;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CXAccount;
  v5 = -[CXAccount init](&v31, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_accountDescription);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    accountDescription = v5->_accountDescription;
    v5->_accountDescription = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_handle);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (CXHandle *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_isoCountryCode);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_serviceName);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_shortLabel);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    shortLabel = v5->_shortLabel;
    v5->_shortLabel = (NSString *)v28;

  }
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
  void *v15;
  id v16;

  v4 = a3;
  -[CXAccount accountDescription](self, "accountDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXAccount handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[CXAccount isoCountryCode](self, "isoCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isoCountryCode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[CXAccount serviceName](self, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_serviceName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[CXAccount UUID](self, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[CXAccount shortLabel](self, "shortLabel");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shortLabel);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

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

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_UUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isoCountryCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount isoCountryCode](self, "isoCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_accountDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount accountDescription](self, "accountDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v8, v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_shortLabel);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount shortLabel](self, "shortLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v10, v11);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_serviceName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount serviceName](self, "serviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v12, v13);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_handle);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAccount handle](self, "handle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v14, v15);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CXAccount isEqualToAccount:](self, "isEqualToAccount:", v4);

  return v5;
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

  -[CXAccount accountDescription](self, "accountDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXAccount isoCountryCode](self, "isoCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CXAccount handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CXAccount serviceName](self, "serviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[CXAccount UUID](self, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[CXAccount shortLabel](self, "shortLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (BOOL)isEqualToAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[CXAccount accountDescription](self, "accountDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CXAccount isoCountryCode](self, "isoCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isoCountryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[CXAccount handle](self, "handle");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v9 | v10 && !objc_msgSend((id)v9, "isEqual:", v10))
      {
        v15 = 0;
      }
      else
      {
        -[CXAccount serviceName](self, "serviceName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          v19 = v11;
          -[CXAccount UUID](self, "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v20 = v13;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqual:"))
          {
            -[CXAccount shortLabel](self, "shortLabel");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "shortLabel");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqual:", v17);

          }
          else
          {
            v15 = 0;
          }
          v11 = v19;

        }
        else
        {
          v15 = 0;
        }

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (NSSet)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
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

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (NSString)shortLabel
{
  return self->_shortLabel;
}

- (CXHandle)handle
{
  return self->_handle;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_shortLabel, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
