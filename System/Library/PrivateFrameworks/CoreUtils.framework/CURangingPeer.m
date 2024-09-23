@implementation CURangingPeer

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return NSPrintF((uint64_t)"DA %@, Md %@, IRK %{mask}", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_deviceAddress);
}

- (BOOL)isEqual:(id)a3
{
  CURangingPeer *v4;
  CURangingPeer *v5;
  NSData *deviceAddress;
  void *v7;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  int v11;
  char v12;
  NSData *deviceIRK;
  void *v14;
  NSData *v15;
  int v16;
  NSString *deviceModel;
  void *v18;
  NSData *v19;

  v4 = (CURangingPeer *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      deviceAddress = self->_deviceAddress;
      -[CURangingPeer deviceAddress](v5, "deviceAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = deviceAddress;
      v9 = v7;
      if (v8 == v9)
      {

      }
      else
      {
        v10 = v9;
        if ((v8 == 0) == (v9 != 0))
          goto LABEL_18;
        v11 = -[NSData isEqual:](v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_13;
      }
      deviceIRK = self->_deviceIRK;
      -[CURangingPeer deviceIRK](v5, "deviceIRK");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = deviceIRK;
      v15 = v14;
      if (v8 == v15)
      {

      }
      else
      {
        v10 = v15;
        if ((v8 == 0) == (v15 != 0))
          goto LABEL_18;
        v16 = -[NSData isEqual:](v8, "isEqual:", v15);

        if (!v16)
        {
LABEL_13:
          v12 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      deviceModel = self->_deviceModel;
      -[CURangingPeer deviceModel](v5, "deviceModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = deviceModel;
      v19 = v18;
      if (v8 == v19)
      {
        v12 = 1;
        v10 = v8;
        goto LABEL_19;
      }
      v10 = v19;
      if ((v8 == 0) != (v19 != 0))
      {
        v12 = -[NSData isEqual:](v8, "isEqual:", v19);
LABEL_19:

        goto LABEL_20;
      }
LABEL_18:
      v12 = 0;
      goto LABEL_19;
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_deviceAddress, "hash");
  v4 = -[NSData hash](self->_deviceIRK, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_deviceModel, "hash");
}

- (NSData)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)deviceIRK
{
  return self->_deviceIRK;
}

- (void)setDeviceIRK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceIRK, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

@end
