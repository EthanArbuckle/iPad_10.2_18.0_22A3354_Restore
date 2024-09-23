@implementation AUv3HostIdentifier

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (AUv3HostIdentifier)initWithCoder:(id)a3
{
  id v4;
  AUv3HostIdentifier *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUv3HostIdentifier;
  v5 = -[AUv3HostIdentifier init](&v9, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_name, v7);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUv3HostIdentifier;
  -[AUv3HostIdentifier dealloc](&v2, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
