@implementation CTServiceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_domain, CFSTR("domain"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_instance, CFSTR("instance"));

}

- (NSString)identifier
{
  NSString *identifier;
  NSString *v4;
  NSString *v5;
  void *__p[2];
  uint64_t v8;
  unsigned int v9;
  unsigned int __src;
  std::vector<char> v11;

  identifier = self->_identifier;
  if (!identifier)
  {
    memset(&v11, 0, sizeof(v11));
    __src = bswap32(self->_domain);
    v9 = bswap32(-[NSNumber unsignedIntValue](self->_instance, "unsignedIntValue"));
    std::vector<unsigned char>::reserve(&v11, 8uLL);
    std::vector<unsigned char>::__insert_with_size[abi:nn180100]<unsigned char const*,unsigned char const*>((uint64_t)&v11, v11.__end_, (char *)&__src, (char *)&v11, 4);
    std::vector<unsigned char>::__insert_with_size[abi:nn180100]<unsigned char const*,unsigned char const*>((uint64_t)&v11, v11.__end_, (char *)&v9, (char *)&__src, 4);
    __p[0] = 0;
    __p[1] = 0;
    v8 = 0;
    ctu::hex();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __p);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_identifier;
    self->_identifier = v4;

    if (SHIBYTE(v8) < 0)
      operator delete(__p[0]);
    if (v11.__begin_)
    {
      v11.__end_ = v11.__begin_;
      operator delete(v11.__begin_);
    }
    identifier = self->_identifier;
  }
  return identifier;
}

+ (id)descriptorWithSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "telephonyDescriptorWithInstance:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)telephonyDescriptorWithInstance:(id)a3
{
  id v3;
  CTServiceDescriptor *v4;

  v3 = a3;
  v4 = -[CTServiceDescriptor initWithDomain:instance:]([CTServiceDescriptor alloc], "initWithDomain:instance:", 1, v3);

  return v4;
}

- (CTServiceDescriptor)initWithDomain:(int64_t)a3 instance:(id)a4
{
  id v7;
  CTServiceDescriptor *v8;
  CTServiceDescriptor *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CTServiceDescriptor;
  v8 = -[CTServiceDescriptor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_domain = a3;
    objc_storeStrong((id *)&v8->_instance, a4);
  }

  return v9;
}

- (CTServiceDescriptor)initWithCoder:(id)a3
{
  id v4;
  CTServiceDescriptor *v5;
  uint64_t v6;
  NSNumber *instance;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTServiceDescriptor;
  v5 = -[CTServiceDescriptor init](&v9, sel_init);
  if (v5)
  {
    v5->_domain = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("domain"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instance"));
    v6 = objc_claimAutoreleasedReturnValue();
    instance = v5->_instance;
    v5->_instance = (NSNumber *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTServiceDescriptor domain](self, "domain");
  -[CTServiceDescriptor instance](self, "instance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", domain=%ld, instance=%@>"), v4, v5);

  return v3;
}

- (NSNumber)instance
{
  return self->_instance;
}

- (int64_t)domain
{
  return self->_domain;
}

- (BOOL)isEqual:(id)a3
{
  CTServiceDescriptor *v4;
  CTServiceDescriptor *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CTServiceDescriptor *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[CTServiceDescriptor domain](self, "domain");
      if (v6 == -[CTServiceDescriptor domain](v5, "domain"))
      {
        -[CTServiceDescriptor instance](self, "instance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTServiceDescriptor instance](v5, "instance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDomain:", self->_domain);
  v5 = (void *)-[NSNumber copy](self->_instance, "copy");
  objc_msgSend(v4, "setInstance:", v5);

  return v4;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (void)setInstance:(id)a3
{
  objc_storeStrong((id *)&self->_instance, a3);
}

@end
