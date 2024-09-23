@implementation CRKDumpASMCredentialsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKDumpASMCredentialsResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKDumpASMCredentialsResultObject credentials](self, "credentials", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("credentials"));

}

- (CRKDumpASMCredentialsResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKDumpASMCredentialsResultObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *credentials;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKDumpASMCredentialsResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v20 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    v18 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("credentials"));
    v15 = objc_claimAutoreleasedReturnValue();
    credentials = v5->_credentials;
    v5->_credentials = (NSDictionary *)v15;

  }
  return v5;
}

- (NSDictionary)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
