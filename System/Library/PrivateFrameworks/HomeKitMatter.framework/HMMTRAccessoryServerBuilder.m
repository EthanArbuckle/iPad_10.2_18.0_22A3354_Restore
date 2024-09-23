@implementation HMMTRAccessoryServerBuilder

- (HMMTRAccessoryServerBuilder)initWithKeystore:(id)a3 browser:(id)a4
{
  id v6;
  id v7;
  HMMTRAccessoryServerBuilder *v8;
  HMMTRAccessoryServer *v9;
  HMMTRAccessoryServer *accessoryServer;
  id v11;
  HMMTRAccessoryServer *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMMTRAccessoryServerBuilder;
  v8 = -[HMMTRAccessoryServerBuilder init](&v16, sel_init);
  if (v8)
  {
    v9 = -[HMMTRAccessoryServer initWithKeystore:browser:]([HMMTRAccessoryServer alloc], "initWithKeystore:browser:", v6, v7);
    accessoryServer = v8->_accessoryServer;
    v8->_accessoryServer = v9;

    v11 = objc_alloc(MEMORY[0x24BE1B998]);
    v12 = v8->_accessoryServer;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *MEMORY[0x24BE1BCA0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithServer:instanceID:", v12, v13);
    -[HMMTRAccessoryServer setPrimaryAccessory:](v8->_accessoryServer, "setPrimaryAccessory:", v14);

  }
  return v8;
}

- (id)name:(id)a3
{
  HMMTRAccessoryServer *accessoryServer;
  id v5;
  void *v6;

  accessoryServer = self->_accessoryServer;
  v5 = a3;
  -[HAPAccessoryServer setName:](accessoryServer, "setName:", v5);
  -[HMMTRAccessoryServer primaryAccessory](self->_accessoryServer, "primaryAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v5);

  return self;
}

- (id)nodeID:(id)a3
{
  -[HMMTRAccessoryServer setNodeID:](self->_accessoryServer, "setNodeID:", a3);
  return self;
}

- (id)identifier:(id)a3
{
  HMMTRAccessoryServer *accessoryServer;
  id v5;
  void *v6;
  void *v7;

  accessoryServer = self->_accessoryServer;
  v5 = a3;
  -[HAPAccessoryServer setIdentifier:](accessoryServer, "setIdentifier:", v5);
  -[HMMTRAccessoryServer primaryAccessory](self->_accessoryServer, "primaryAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v5);

  -[HMMTRAccessoryServer primaryAccessory](self->_accessoryServer, "primaryAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerIdentifier:", v5);

  return self;
}

- (id)category:(id)a3
{
  -[HAPAccessoryServer setCategory:](self->_accessoryServer, "setCategory:", a3);
  return self;
}

- (id)manufacturer:(id)a3
{
  HMMTRAccessoryServer *accessoryServer;
  id v5;
  void *v6;

  accessoryServer = self->_accessoryServer;
  v5 = a3;
  -[HMMTRAccessoryServer primaryAccessory](accessoryServer, "primaryAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setManufacturer:", v5);

  return self;
}

- (id)model:(id)a3
{
  HMMTRAccessoryServer *accessoryServer;
  id v5;
  void *v6;

  accessoryServer = self->_accessoryServer;
  v5 = a3;
  -[HMMTRAccessoryServer primaryAccessory](accessoryServer, "primaryAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setModel:", v5);

  return self;
}

- (id)serialNumber:(id)a3
{
  HMMTRAccessoryServer *accessoryServer;
  id v5;
  void *v6;

  accessoryServer = self->_accessoryServer;
  v5 = a3;
  -[HMMTRAccessoryServer primaryAccessory](accessoryServer, "primaryAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSerialNumber:", v5);

  return self;
}

- (id)setUpPinCode:(id)a3
{
  -[HMMTRAccessoryServer setSetUpPINCode:](self->_accessoryServer, "setSetUpPINCode:", a3);
  return self;
}

- (id)discriminator:(id)a3
{
  -[HMMTRAccessoryServer setDiscriminator:](self->_accessoryServer, "setDiscriminator:", a3);
  return self;
}

- (id)vendorID:(id)a3
{
  -[HMMTRAccessoryServer setVendorID:](self->_accessoryServer, "setVendorID:", a3);
  return self;
}

- (id)productID:(id)a3
{
  -[HMMTRAccessoryServer setProductID:](self->_accessoryServer, "setProductID:", a3);
  return self;
}

- (id)vendorName:(id)a3
{
  -[HMMTRAccessoryServer setVendorNameFromDcl:](self->_accessoryServer, "setVendorNameFromDcl:", a3);
  return self;
}

- (id)productName:(id)a3
{
  -[HMMTRAccessoryServer setProductNameFromDcl:](self->_accessoryServer, "setProductNameFromDcl:", a3);
  return self;
}

- (id)addService:(id)a3
{
  HMMTRAccessoryServer *accessoryServer;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  accessoryServer = self->_accessoryServer;
  v5 = a3;
  -[HMMTRAccessoryServer primaryAccessory](accessoryServer, "primaryAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessory:", v6);

  -[HMMTRAccessoryServer primaryAccessory](self->_accessoryServer, "primaryAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "services");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v8);
  -[HMMTRAccessoryServer primaryAccessory](self->_accessoryServer, "primaryAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setServices:", v9);

  return self;
}

- (id)build
{
  return self->_accessoryServer;
}

- (HMMTRAccessoryServer)accessoryServer
{
  return self->_accessoryServer;
}

- (void)setAccessoryServer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryServer, 0);
}

@end
