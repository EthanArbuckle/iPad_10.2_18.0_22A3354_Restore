@implementation CRKGenerateIdentityRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

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
  v6.super_class = (Class)CRKGenerateIdentityRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKGenerateIdentityRequest commonName](self, "commonName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("commonName"));

}

- (CRKGenerateIdentityRequest)initWithCoder:(id)a3
{
  id v4;
  CRKGenerateIdentityRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *commonName;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKGenerateIdentityRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("commonName"));
    v7 = objc_claimAutoreleasedReturnValue();
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v7;

  }
  return v5;
}

- (NSString)commonName
{
  return self->_commonName;
}

- (void)setCommonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonName, 0);
}

@end
