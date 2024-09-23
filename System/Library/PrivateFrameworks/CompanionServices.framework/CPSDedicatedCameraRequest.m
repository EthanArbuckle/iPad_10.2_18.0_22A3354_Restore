@implementation CPSDedicatedCameraRequest

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)authType
{
  return 14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  id v5;
  id v6;

  deviceName = self->_deviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_deviceType);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("deviceType"));

}

- (CPSDedicatedCameraRequest)initWithCoder:(id)a3
{
  id v4;
  CPSDedicatedCameraRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *deviceName;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPSDedicatedCameraRequest;
  v5 = -[CPSDedicatedCameraRequest init](&v12, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("deviceName"));
    v7 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("deviceType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceType = objc_msgSend(v10, "integerValue");

  }
  return v5;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
