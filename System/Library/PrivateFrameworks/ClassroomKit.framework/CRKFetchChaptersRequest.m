@implementation CRKFetchChaptersRequest

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL result;
  void *v12;
  id v13;

  -[CRKFetchChaptersRequest path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    if (!a3)
      return 0;
    v12 = &unk_24DA07DC8;
LABEL_11:
    CRKErrorWithCodeAndUserInfo(2, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v13;
    return result;
  }
  -[CRKFetchChaptersRequest identifierType](self, "identifierType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    if (!a3)
      return 0;
    v12 = &unk_24DA07DF0;
    goto LABEL_11;
  }
  -[CRKFetchChaptersRequest identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
    return 1;
  if (a3)
  {
    v12 = &unk_24DA07E18;
    goto LABEL_11;
  }
  return 0;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchChaptersRequest)initWithCoder:(id)a3
{
  id v4;
  CRKFetchChaptersRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *path;
  void *v9;
  uint64_t v10;
  NSString *identifierType;
  void *v12;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKFetchChaptersRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("path"));
    v7 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("identifierType"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifierType = v5->_identifierType;
    v5->_identifierType = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("identifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKFetchChaptersRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CRKFetchChaptersRequest path](self, "path", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("path"));

  -[CRKFetchChaptersRequest identifierType](self, "identifierType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifierType"));

  -[CRKFetchChaptersRequest identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("identifier"));

}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifierType
{
  return self->_identifierType;
}

- (void)setIdentifierType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_identifierType, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
