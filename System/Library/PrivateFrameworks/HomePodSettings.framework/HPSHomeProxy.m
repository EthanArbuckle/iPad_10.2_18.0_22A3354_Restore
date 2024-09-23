@implementation HPSHomeProxy

- (HPSHomeProxy)initWithAccessoryName:(id)a3 validHome:(BOOL)a4
{
  id v7;
  HPSHomeProxy *v8;
  objc_super v10;

  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HPSHomeProxy;
  -[HPSHomeProxy self](&v10, sel_self);
  v8 = (HPSHomeProxy *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_storeStrong((id *)&v8->_accesoryName, a3);
    v8->_hasValidHomeLoaded = a4;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HPSHomeProxy accesoryName](self, "accesoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HPSHomeProxyEncodedNameKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HPSHomeProxy hasValidHomeLoaded](self, "hasValidHomeLoaded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HPSHomeProxyEncodedValidHomeKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HPSHomeProxy minimumMediaUserPrivilege](self, "minimumMediaUserPrivilege"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HPSHomeProxyEncodedMinimumMediaUserPrivilegeKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HPSHomeProxy isMediaPeerToPeerEnabled](self, "isMediaPeerToPeerEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HPSHomeProxyEncodedMediaPeerToPeerEnabledKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HPSHomeProxy isAutoSUEnabled](self, "isAutoSUEnabled"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HPSHomeProxyEncodedAutoSUEnabledKey"));

}

- (HPSHomeProxy)initWithCoder:(id)a3
{
  id v4;
  HPSHomeProxy *v5;
  uint64_t v6;
  NSString *accesoryName;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HPSHomeProxy;
  v5 = -[HPSHomeProxy init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HPSHomeProxyEncodedNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    accesoryName = v5->_accesoryName;
    v5->_accesoryName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HPSHomeProxyEncodedValidHomeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasValidHomeLoaded = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HPSHomeProxyEncodedMinimumMediaUserPrivilegeKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minimumMediaUserPrivilege = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HPSHomeProxyEncodedMediaPeerToPeerEnabledKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isMediaPeerToPeerEnabled = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HPSHomeProxyEncodedAutoSUEnabledKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isAutoSUEnabled = objc_msgSend(v11, "BOOLValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HPSHomeProxy accesoryName](self, "accesoryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AccessoryName:%@, HasValidHome:%d, minimumMediaUserPrivilege:%lu, isMediaPeerToPeerEnabled:%d isAutoSUEnabled: %d"), v4, -[HPSHomeProxy hasValidHomeLoaded](self, "hasValidHomeLoaded"), -[HPSHomeProxy minimumMediaUserPrivilege](self, "minimumMediaUserPrivilege"), -[HPSHomeProxy isMediaPeerToPeerEnabled](self, "isMediaPeerToPeerEnabled"), -[HPSHomeProxy isAutoSUEnabled](self, "isAutoSUEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasValidHomeLoaded
{
  return self->_hasValidHomeLoaded;
}

- (NSString)accesoryName
{
  return self->_accesoryName;
}

- (int64_t)minimumMediaUserPrivilege
{
  return self->_minimumMediaUserPrivilege;
}

- (void)setMinimumMediaUserPrivilege:(int64_t)a3
{
  self->_minimumMediaUserPrivilege = a3;
}

- (BOOL)isMediaPeerToPeerEnabled
{
  return self->_isMediaPeerToPeerEnabled;
}

- (void)setIsMediaPeerToPeerEnabled:(BOOL)a3
{
  self->_isMediaPeerToPeerEnabled = a3;
}

- (BOOL)isAutoSUEnabled
{
  return self->_isAutoSUEnabled;
}

- (void)setIsAutoSUEnabled:(BOOL)a3
{
  self->_isAutoSUEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accesoryName, 0);
}

@end
