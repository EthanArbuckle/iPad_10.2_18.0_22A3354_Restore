@implementation MTSDeviceSetupDevicePredicate

- (id)copyWithZone:(_NSZone *)a3
{
  MTSDeviceSetupDevicePredicate *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(MTSDeviceSetupDevicePredicate);
  -[MTSDeviceSetupDevicePredicate uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSDeviceSetupDevicePredicate setUuid:](v4, "setUuid:", v5);

  -[MTSDeviceSetupDevicePredicate serialNumber](self, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSDeviceSetupDevicePredicate setSerialNumber:](v4, "setSerialNumber:", v6);

  -[MTSDeviceSetupDevicePredicate vendorID](self, "vendorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSDeviceSetupDevicePredicate setVendorID:](v4, "setVendorID:", v7);

  -[MTSDeviceSetupDevicePredicate productID](self, "productID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSDeviceSetupDevicePredicate setProductID:](v4, "setProductID:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_9;
  -[MTSDeviceSetupDevicePredicate uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_9;
  -[MTSDeviceSetupDevicePredicate serialNumber](self, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_9;
  -[MTSDeviceSetupDevicePredicate vendorID](self, "vendorID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vendorID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if (v15)
  {
    -[MTSDeviceSetupDevicePredicate productID](self, "productID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = HMFEqualObjects();

  }
  else
  {
LABEL_9:
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTSDeviceSetupDevicePredicate uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (MTSDeviceSetupDevicePredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MTSDeviceSetupDevicePredicate *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDSDP.uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDSDP.serialNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDSDP.productID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDSDP.vendorID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MTSDeviceSetupDevicePredicate init](self, "init");
  -[MTSDeviceSetupDevicePredicate setUuid:](v9, "setUuid:", v5);
  -[MTSDeviceSetupDevicePredicate setSerialNumber:](v9, "setSerialNumber:", v6);
  -[MTSDeviceSetupDevicePredicate setProductID:](v9, "setProductID:", v7);
  -[MTSDeviceSetupDevicePredicate setVendorID:](v9, "setVendorID:", v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MTSDeviceSetupDevicePredicate uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSDSDP.uuid"));

  -[MTSDeviceSetupDevicePredicate serialNumber](self, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MTSDSDP.serialNumber"));

  -[MTSDeviceSetupDevicePredicate productID](self, "productID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MTSDSDP.productID"));

  -[MTSDeviceSetupDevicePredicate vendorID](self, "vendorID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MTSDSDP.vendorID"));

}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProductID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
