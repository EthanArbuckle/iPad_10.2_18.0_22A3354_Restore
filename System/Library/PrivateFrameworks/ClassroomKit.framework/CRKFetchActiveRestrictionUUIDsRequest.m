@implementation CRKFetchActiveRestrictionUUIDsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchActiveRestrictionUUIDsRequest)initWithCoder:(id)a3
{
  id v4;
  CRKFetchActiveRestrictionUUIDsRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *clientType;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchActiveRestrictionUUIDsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("clientType"));
    v7 = objc_claimAutoreleasedReturnValue();
    clientType = v5->_clientType;
    v5->_clientType = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchActiveRestrictionUUIDsRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKFetchActiveRestrictionUUIDsRequest clientType](self, "clientType", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientType"));

}

- (NSString)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientType, 0);
}

@end
