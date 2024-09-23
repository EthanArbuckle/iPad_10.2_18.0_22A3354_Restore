@implementation HKKeyValueDomainServerConfiguration

- (HKKeyValueDomainServerConfiguration)initWithCategory:(int64_t)a3 domainName:(id)a4
{
  id v6;
  HKKeyValueDomainServerConfiguration *v7;
  HKKeyValueDomainServerConfiguration *v8;
  uint64_t v9;
  NSString *domainName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKKeyValueDomainServerConfiguration;
  v7 = -[HKKeyValueDomainServerConfiguration init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_category = a3;
    v9 = objc_msgSend(v6, "copy");
    domainName = v8->_domainName;
    v8->_domainName = (NSString *)v9;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = -[HKKeyValueDomainServerConfiguration category](self, "category");
  -[HKKeyValueDomainServerConfiguration domainName](self, "domainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[2];
  v4[2] = v6;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKKeyValueDomainServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKKeyValueDomainServerConfiguration *v5;
  uint64_t v6;
  NSString *domainName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKKeyValueDomainServerConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Category"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DomainName"));
    v6 = objc_claimAutoreleasedReturnValue();
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKKeyValueDomainServerConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_category, CFSTR("Category"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_domainName, CFSTR("DomainName"));

}

- (int64_t)category
{
  return self->_category;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainName, 0);
}

@end
