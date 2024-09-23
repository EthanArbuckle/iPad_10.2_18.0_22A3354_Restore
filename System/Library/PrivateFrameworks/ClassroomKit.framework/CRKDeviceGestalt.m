@implementation CRKDeviceGestalt

- (CRKDeviceGestalt)initWithPlatform:(unint64_t)a3 systemVersion:(id)a4
{
  id v6;
  CRKDeviceGestalt *v7;
  CRKDeviceGestalt *v8;
  uint64_t v9;
  NSString *systemVersion;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKDeviceGestalt;
  v7 = -[CRKDeviceGestalt init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_platform = a3;
    v9 = objc_msgSend(v6, "copy");
    systemVersion = v8->_systemVersion;
    v8->_systemVersion = (NSString *)v9;

  }
  return v8;
}

- (CRKDeviceGestalt)initWithDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  CRKDeviceGestalt *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "platform");
  objc_msgSend(v4, "systemVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CRKDeviceGestalt initWithPlatform:systemVersion:](self, "initWithPlatform:systemVersion:", v5, v6);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[CRKDeviceGestalt platform](self, "platform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("platform"));

  -[CRKDeviceGestalt systemVersion](self, "systemVersion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("systemVersion"));

}

- (CRKDeviceGestalt)initWithCoder:(id)a3
{
  id v4;
  CRKDeviceGestalt *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *systemVersion;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKDeviceGestalt;
  v5 = -[CRKDeviceGestalt init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platform"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_platform = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("systemVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v8;

  }
  return v5;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersion, 0);
}

@end
