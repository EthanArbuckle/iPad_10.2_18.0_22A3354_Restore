@implementation CRKFetchDeviceGestaltResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchDeviceGestaltResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchDeviceGestaltResultObject *v5;
  void *v6;
  uint64_t v7;
  CRKDeviceGestalt *deviceGestalt;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchDeviceGestaltResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("deviceGestalt"));
    v7 = objc_claimAutoreleasedReturnValue();
    deviceGestalt = v5->_deviceGestalt;
    v5->_deviceGestalt = (CRKDeviceGestalt *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchDeviceGestaltResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKFetchDeviceGestaltResultObject deviceGestalt](self, "deviceGestalt", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("deviceGestalt"));

}

- (CRKDeviceGestalt)deviceGestalt
{
  return self->_deviceGestalt;
}

- (void)setDeviceGestalt:(id)a3
{
  objc_storeStrong((id *)&self->_deviceGestalt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGestalt, 0);
}

@end
