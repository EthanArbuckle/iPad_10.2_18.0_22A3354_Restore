@implementation FMDBluetoothDiscoveryXPCAdapterDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDBluetoothDiscoveryXPCAdapterDevice)initWithBluetoothDevice:(id)a3
{
  id v4;
  FMDBluetoothDiscoveryXPCAdapterDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMDBluetoothDiscoveryXPCAdapterDevice;
  v5 = -[FMDBluetoothDiscoveryXPCAdapterDevice init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    -[FMDBluetoothDiscoveryXPCAdapterDevice setIdentifier:](v5, "setIdentifier:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advertisementFields"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCAdapterDevice _xpcSafeAdvertisementKeys:](v5, "_xpcSafeAdvertisementKeys:", v7));
    -[FMDBluetoothDiscoveryXPCAdapterDevice setAdvertisementFields:](v5, "setAdvertisementFields:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[FMDBluetoothDiscoveryXPCAdapterDevice setName:](v5, "setName:", v9);

    -[FMDBluetoothDiscoveryXPCAdapterDevice setRssi:](v5, "setRssi:", objc_msgSend(v4, "rssi"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));
    v11 = objc_msgSend(v10, "copy");
    -[FMDBluetoothDiscoveryXPCAdapterDevice setBluetoothAddress:](v5, "setBluetoothAddress:", v11);

  }
  return v5;
}

- (FMDBluetoothDiscoveryXPCAdapterDevice)initWithCoder:(id)a3
{
  id v4;
  FMDBluetoothDiscoveryXPCAdapterDevice *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FMDBluetoothDiscoveryXPCAdapterDevice;
  v5 = -[FMDBluetoothDiscoveryXPCAdapterDevice init](&v20, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[FMDBluetoothDiscoveryXPCAdapterDevice setIdentifier:](v5, "setIdentifier:", v7);

    v8 = objc_opt_class(NSString);
    v9 = objc_opt_class(NSArray);
    v10 = objc_opt_class(NSDictionary);
    v11 = objc_opt_class(NSData);
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(NSNumber), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("advertisementFields")));
    -[FMDBluetoothDiscoveryXPCAdapterDevice setAdvertisementFields:](v5, "setAdvertisementFields:", v14);

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[FMDBluetoothDiscoveryXPCAdapterDevice setName:](v5, "setName:", v16);

    -[FMDBluetoothDiscoveryXPCAdapterDevice setRssi:](v5, "setRssi:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rssi")));
    v17 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("bluetoothAddress"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[FMDBluetoothDiscoveryXPCAdapterDevice setBluetoothAddress:](v5, "setBluetoothAddress:", v18);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCAdapterDevice identifier](self, "identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCAdapterDevice advertisementFields](self, "advertisementFields"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("advertisementFields"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCAdapterDevice name](self, "name"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("name"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[FMDBluetoothDiscoveryXPCAdapterDevice rssi](self, "rssi"), CFSTR("rssi"));
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCAdapterDevice bluetoothAddress](self, "bluetoothAddress"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bluetoothAddress"));

}

- (id)_xpcSafeAdvertisementKeys:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hsStatus")));
  objc_msgSend(v4, "fm_safelySetObject:forKey:", v5, CFSTR("hsStatus"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cc")));
  objc_msgSend(v4, "fm_safelySetObject:forKey:", v6, CFSTR("cc"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hbT")));
  objc_msgSend(v4, "fm_safelySetObject:forKey:", v7, CFSTR("hbT"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cc")));
  objc_msgSend(v4, "fm_safelySetObject:forKey:", v8, CFSTR("cc"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ccR")));
  objc_msgSend(v4, "fm_safelySetObject:forKey:", v9, CFSTR("ccR"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ccC")));
  objc_msgSend(v4, "fm_safelySetObject:forKey:", v10, CFSTR("ccC"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lc")));
  objc_msgSend(v4, "fm_safelySetObject:forKey:", v11, CFSTR("lc"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("aState")));
  objc_msgSend(v4, "fm_safelySetObject:forKey:", v12, CFSTR("aState"));

  v13 = objc_msgSend(v4, "copy");
  return v13;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)advertisementFields
{
  return self->_advertisementFields;
}

- (void)setAdvertisementFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_advertisementFields, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
