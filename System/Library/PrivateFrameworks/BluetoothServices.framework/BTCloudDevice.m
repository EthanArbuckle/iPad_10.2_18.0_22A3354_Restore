@implementation BTCloudDevice

+ (id)deviceWithBluetoothAddress:(id)a3
{
  id v3;
  BTCloudDevice *v4;

  v3 = a3;
  v4 = -[BTCloudDevice initWithBluetoothAddress:]([BTCloudDevice alloc], "initWithBluetoothAddress:", v3);

  return v4;
}

- (BTCloudDevice)initWithBluetoothAddress:(id)a3
{
  id v4;
  BTCloudDevice *v5;
  BTCloudDevice *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTCloudDevice;
  v5 = -[BTCloudDevice init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BTCloudDevice setBluetoothAddress:](v5, "setBluetoothAddress:", v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[BTCloudDevice bluetoothAddress](self, "bluetoothAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bluetoothAddress);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[BTCloudDevice manufacturer](self, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_manufacturer);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[BTCloudDevice modelNumber](self, "modelNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_modelNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[BTCloudDevice nickname](self, "nickname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_nickname);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[BTCloudDevice productID](self, "productID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_productID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[BTCloudDevice vendorID](self, "vendorID");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_vendorID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

- (BTCloudDevice)initWithCoder:(id)a3
{
  id v4;
  BTCloudDevice *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BTCloudDevice *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BTCloudDevice;
  v5 = -[BTCloudDevice init](&v26, sel_init);
  if (!v5)
    goto LABEL_4;
  v6 = objc_opt_class();
  NSStringFromSelector(sel_bluetoothAddress);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BTCloudDevice setBluetoothAddress:](v5, "setBluetoothAddress:", v8);
    v9 = objc_opt_class();
    NSStringFromSelector(sel_manufacturer);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDevice setManufacturer:](v5, "setManufacturer:", v11);

    v12 = objc_opt_class();
    NSStringFromSelector(sel_modelNumber);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDevice setModelNumber:](v5, "setModelNumber:", v14);

    v15 = objc_opt_class();
    NSStringFromSelector(sel_nickname);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDevice setNickname:](v5, "setNickname:", v17);

    v18 = objc_opt_class();
    NSStringFromSelector(sel_productID);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDevice setProductID:](v5, "setProductID:", v20);

    v21 = objc_opt_class();
    NSStringFromSelector(sel_vendorID);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDevice setVendorID:](v5, "setVendorID:", v23);

LABEL_4:
    v24 = v5;
    goto LABEL_10;
  }
  if (gLogCategory_BTCloudDevice <= 90 && (gLogCategory_BTCloudDevice != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v24 = 0;
LABEL_10:

  return v24;
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BTCloudDevice bluetoothAddress](self, "bluetoothAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDevice nickname](self, "nickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDevice manufacturer](self, "manufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDevice modelNumber](self, "modelNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDevice productID](self, "productID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDevice vendorID](self, "vendorID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("BTCloudDevice: %@, %@, %@, %@, %@, %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothAddress, a3);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_storeStrong((id *)&self->_modelNumber, a3);
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_storeStrong((id *)&self->_productID, a3);
}

- (NSString)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_storeStrong((id *)&self->_vendorID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end
