@implementation BMDevice

- (BMDevice)initWithDeviceIdentifier:(id)a3 idsDeviceIdentifier:(id)a4 name:(id)a5 model:(id)a6 platform:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMDevice *v17;
  BMDevice *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMDevice;
  v17 = -[BMDevice init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deviceIdentifier, a3);
    objc_storeStrong((id *)&v18->_idsDeviceIdentifier, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    objc_storeStrong((id *)&v18->_model, a6);
    v18->_platform = a7;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[BMDevice deviceIdentifier](self, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("deviceIdentifier"));

  -[BMDevice idsDeviceIdentifier](self, "idsDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("idsDeviceIdentifier"));

  -[BMDevice name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("name"));

  -[BMDevice model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("model"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[BMDevice platform](self, "platform"), CFSTR("platform"));
}

- (BMDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BMDevice *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsDeviceIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      self = -[BMDevice initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:](self, "initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:", v5, v6, v7, v8, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("platform")));
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v2;
  NSString *deviceIdentifier;
  NSString *idsDeviceIdentifier;
  NSString *model;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  deviceIdentifier = self->_deviceIdentifier;
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  model = self->_model;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_platform);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("identifier: %@ idsIdentifier: %@ model: %@ platform: %@"), deviceIdentifier, idsDeviceIdentifier, model, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (int64_t)platform
{
  return self->_platform;
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
