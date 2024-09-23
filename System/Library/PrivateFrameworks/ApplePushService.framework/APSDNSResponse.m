@implementation APSDNSResponse

- (id)initResponseForHostname:(id)a3 ipv4Address:(id)a4 ipv6Address:(id)a5
{
  id v8;
  id v9;
  id v10;
  APSDNSResponse *v11;
  uint64_t v12;
  NSString *hostname;
  uint64_t v14;
  NSArray *ipv4Address;
  uint64_t v16;
  NSArray *ipv6Address;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APSDNSResponse;
  v11 = -[APSDNSResponse init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    hostname = v11->_hostname;
    v11->_hostname = (NSString *)v12;

    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(","));
    v14 = objc_claimAutoreleasedReturnValue();
    ipv4Address = v11->_ipv4Address;
    v11->_ipv4Address = (NSArray *)v14;

    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
    v16 = objc_claimAutoreleasedReturnValue();
    ipv6Address = v11->_ipv6Address;
    v11->_ipv6Address = (NSArray *)v16;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APSDNSResponse)initWithCoder:(id)a3
{
  id v4;
  APSDNSResponse *v5;
  uint64_t v6;
  NSString *hostname;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *ipv4Address;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *ipv6Address;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)APSDNSResponse;
  v5 = -[APSDNSResponse init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APSDNSHostname"));
    v6 = objc_claimAutoreleasedReturnValue();
    hostname = v5->_hostname;
    v5->_hostname = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("APSDNSIPv4Address"));
    v11 = objc_claimAutoreleasedReturnValue();
    ipv4Address = v5->_ipv4Address;
    v5->_ipv4Address = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("APSDNSIPv6Address"));
    v16 = objc_claimAutoreleasedReturnValue();
    ipv6Address = v5->_ipv6Address;
    v5->_ipv6Address = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *hostname;
  id v5;

  hostname = self->_hostname;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", hostname, CFSTR("APSDNSHostname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipv4Address, CFSTR("APSDNSIPv4Address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipv6Address, CFSTR("APSDNSIPv6Address"));

}

- (NSString)hostname
{
  return self->_hostname;
}

- (NSArray)ipv4Address
{
  return self->_ipv4Address;
}

- (NSArray)ipv6Address
{
  return self->_ipv6Address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6Address, 0);
  objc_storeStrong((id *)&self->_ipv4Address, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end
