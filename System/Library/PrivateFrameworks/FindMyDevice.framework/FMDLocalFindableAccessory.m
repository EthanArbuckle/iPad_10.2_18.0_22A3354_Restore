@implementation FMDLocalFindableAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDLocalFindableAccessory)initWithIdentifier:(id)a3 name:(id)a4 connected:(BOOL)a5
{
  id v9;
  id v10;
  FMDLocalFindableAccessory *v11;
  FMDLocalFindableAccessory *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FMDLocalFindableAccessory;
  v11 = -[FMDLocalFindableAccessory init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_connected = a5;
  }

  return v12;
}

- (FMDLocalFindableAccessory)initWithCoder:(id)a3
{
  id v4;
  FMDLocalFindableAccessory *v5;
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
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMDLocalFindableAccessory;
  v5 = -[FMDLocalFindableAccessory init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setBaUUID:](v5, "setBaUUID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setName:](v5, "setName:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connected"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setConnected:](v5, "setConnected:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setSerialNumber:](v5, "setSerialNumber:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternateSerialNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setAlternateSerialNumber:](v5, "setAlternateSerialNumber:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("irkData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setIrkData:](v5, "setIrkData:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("btAddress"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setBtAddress:](v5, "setBtAddress:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firmwareVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setFirmwareVersion:](v5, "setFirmwareVersion:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setVendorId:](v5, "setVendorId:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLocalFindableAccessory setProductId:](v5, "setProductId:", v16);

  }
  return v5;
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
  id v15;

  v4 = a3;
  -[FMDLocalFindableAccessory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[FMDLocalFindableAccessory baUUID](self, "baUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("baUUID"));

  -[FMDLocalFindableAccessory name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FMDLocalFindableAccessory isConnected](self, "isConnected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("connected"));

  -[FMDLocalFindableAccessory serialNumber](self, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("serialNumber"));

  -[FMDLocalFindableAccessory alternateSerialNumber](self, "alternateSerialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("alternateSerialNumber"));

  -[FMDLocalFindableAccessory irkData](self, "irkData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("irkData"));

  -[FMDLocalFindableAccessory btAddress](self, "btAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("btAddress"));

  -[FMDLocalFindableAccessory firmwareVersion](self, "firmwareVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("firmwareVersion"));

  -[FMDLocalFindableAccessory vendorId](self, "vendorId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("vendorId"));

  -[FMDLocalFindableAccessory productId](self, "productId");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("productId"));

}

- (FMDIdentifiable)accessoryIdentifier
{
  return self->accessoryIdentifier;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)alternateSerialNumber
{
  return self->_alternateSerialNumber;
}

- (void)setAlternateSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (void)setBtAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_alternateSerialNumber, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->accessoryIdentifier, 0);
}

@end
