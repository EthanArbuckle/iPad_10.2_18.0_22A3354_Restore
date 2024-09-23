@implementation CRKFetchSupportedDevicePropertiesResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchSupportedDevicePropertiesResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchSupportedDevicePropertiesResultObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *staticProperties;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *liveProperties;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKFetchSupportedDevicePropertiesResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("staticProperties"));
    v9 = objc_claimAutoreleasedReturnValue();
    staticProperties = v5->_staticProperties;
    v5->_staticProperties = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("liveProperties"));
    v14 = objc_claimAutoreleasedReturnValue();
    liveProperties = v5->_liveProperties;
    v5->_liveProperties = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKFetchSupportedDevicePropertiesResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKFetchSupportedDevicePropertiesResultObject staticProperties](self, "staticProperties", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("staticProperties"));

  -[CRKFetchSupportedDevicePropertiesResultObject liveProperties](self, "liveProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("liveProperties"));

}

- (NSArray)staticProperties
{
  return self->_staticProperties;
}

- (void)setStaticProperties:(id)a3
{
  objc_storeStrong((id *)&self->_staticProperties, a3);
}

- (NSArray)liveProperties
{
  return self->_liveProperties;
}

- (void)setLiveProperties:(id)a3
{
  objc_storeStrong((id *)&self->_liveProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveProperties, 0);
  objc_storeStrong((id *)&self->_staticProperties, 0);
}

@end
