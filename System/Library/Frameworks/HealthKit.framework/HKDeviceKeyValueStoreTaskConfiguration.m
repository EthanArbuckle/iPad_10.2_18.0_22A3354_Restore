@implementation HKDeviceKeyValueStoreTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  HKDeviceKeyValueStoreTaskConfiguration *v4;
  void *v5;

  v4 = objc_alloc_init(HKDeviceKeyValueStoreTaskConfiguration);
  v5 = (void *)-[NSString copy](self->_domain, "copy");
  -[HKDeviceKeyValueStoreTaskConfiguration setDomain:](v4, "setDomain:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKDeviceKeyValueStoreTaskConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKDeviceKeyValueStoreTaskConfiguration *v5;
  uint64_t v6;
  NSString *domain;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDeviceKeyValueStoreTaskConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Domain"));
    v6 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKDeviceKeyValueStoreTaskConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_domain, CFSTR("Domain"), v5.receiver, v5.super_class);

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
