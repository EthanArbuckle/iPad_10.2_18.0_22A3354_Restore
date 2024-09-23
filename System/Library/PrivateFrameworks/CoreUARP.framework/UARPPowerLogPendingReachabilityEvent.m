@implementation UARPPowerLogPendingReachabilityEvent

- (id)initModelNumber:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  UARPPowerLogPendingReachabilityEvent *v8;
  uint64_t v9;
  NSString *modelNumber;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UARPPowerLogPendingReachabilityEvent;
  v8 = -[UARPPowerLogPendingReachabilityEvent init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    modelNumber = v8->_modelNumber;
    v8->_modelNumber = (NSString *)v9;

    objc_storeStrong((id *)&v8->_uuid, a4);
  }

  return v8;
}

- (BOOL)allDataPresent
{
  return self->_stagedFirmwareVersion && self->_activeFirmwareVersion != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *uuid;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uuid = self->_uuid;
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](uuid, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ %@>"), v5, self->_modelNumber, self->_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)activeFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActiveFirmwareVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)stagedFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStagedFirmwareVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_activeFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
}

@end
