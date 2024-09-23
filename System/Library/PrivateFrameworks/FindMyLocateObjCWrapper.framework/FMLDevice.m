@implementation FMLDevice

- (FMLDevice)initWithIdentifier:(id)a3 deviceName:(id)a4 idsDeviceId:(id)a5 isActive:(BOOL)a6 isThisDevice:(BOOL)a7 isCompanion:(BOOL)a8 isAutoMeCapable:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  FMLDevice *v18;
  FMLDevice *v19;
  objc_super v21;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)FMLDevice;
  v18 = -[FMLDevice init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    -[FMLDevice setIdentifier:](v18, "setIdentifier:", v15);
    -[FMLDevice setDeviceName:](v19, "setDeviceName:", v16);
    -[FMLDevice setIdsDeviceId:](v19, "setIdsDeviceId:", v17);
    -[FMLDevice setIsActive:](v19, "setIsActive:", v11);
    -[FMLDevice setIsThisDevice:](v19, "setIsThisDevice:", v10);
    -[FMLDevice setIsCompanion:](v19, "setIsCompanion:", v9);
    -[FMLDevice setIsAutoMeCapable:](v19, "setIsAutoMeCapable:", a9);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FMLDevice comparisonIdentifier](self, "comparisonIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "comparisonIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FMLDevice comparisonIdentifier](self, "comparisonIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[FMLDevice identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[FMLDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [%@]>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)idsDeviceId
{
  return self->_idsDeviceId;
}

- (void)setIdsDeviceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isThisDevice
{
  return self->_isThisDevice;
}

- (void)setIsThisDevice:(BOOL)a3
{
  self->_isThisDevice = a3;
}

- (BOOL)isCompanion
{
  return self->_isCompanion;
}

- (void)setIsCompanion:(BOOL)a3
{
  self->_isCompanion = a3;
}

- (BOOL)isAutoMeCapable
{
  return self->_isAutoMeCapable;
}

- (void)setIsAutoMeCapable:(BOOL)a3
{
  self->_isAutoMeCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceId, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
