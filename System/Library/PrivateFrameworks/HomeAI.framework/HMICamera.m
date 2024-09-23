@implementation HMICamera

- (HMICamera)initWithIdentifier:(id)a3 name:(id)a4 manufacturer:(id)a5 model:(id)a6
{
  return -[HMICamera initWithIdentifier:name:manufacturer:model:firmwareVersion:hasBattery:](self, "initWithIdentifier:name:manufacturer:model:firmwareVersion:hasBattery:", a3, a4, a5, a6, 0, 0);
}

- (HMICamera)initWithIdentifier:(id)a3 name:(id)a4 manufacturer:(id)a5 model:(id)a6 firmwareVersion:(id)a7
{
  return -[HMICamera initWithIdentifier:name:manufacturer:model:firmwareVersion:hasBattery:](self, "initWithIdentifier:name:manufacturer:model:firmwareVersion:hasBattery:", a3, a4, a5, a6, a7, 0);
}

- (HMICamera)initWithIdentifier:(id)a3 name:(id)a4 manufacturer:(id)a5 model:(id)a6 firmwareVersion:(id)a7 hasBattery:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMICamera *v20;
  uint64_t v21;
  NSUUID *identifier;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  NSString *manufacturer;
  uint64_t v27;
  NSString *model;
  uint64_t v29;
  NSString *firmwareVersion;
  void *v32;
  SEL v33;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v15)
  {
LABEL_7:
    v32 = (void *)_HMFPreconditionFailure();
    return (HMICamera *)+[HMICamera logCategory](v32, v33);
  }
  v19 = v18;
  v34.receiver = self;
  v34.super_class = (Class)HMICamera;
  v20 = -[HMICamera init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSUUID *)v21;

    v23 = objc_msgSend(v15, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    manufacturer = v20->_manufacturer;
    v20->_manufacturer = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    model = v20->_model;
    v20->_model = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    firmwareVersion = v20->_firmwareVersion;
    v20->_firmwareVersion = (NSString *)v29;

    v20->_hasBattery = a8;
  }

  return v20;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMICamera identifier](self, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMICamera name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Name"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMICamera manufacturer](self, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Manufacturer"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMICamera model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Model"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMICamera firmwareVersion](self, "firmwareVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Firmware Version"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMICamera hasBattery](self, "hasBattery"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Has Battery"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  HMICamera *v4;
  HMICamera *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  uint64_t v20;
  void *v21;
  char v22;
  BOOL v23;
  char v24;

  v4 = (HMICamera *)a3;
  if (v4 == self)
  {
    v24 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMICamera identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMICamera identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = HMFEqualObjects();

      -[HMICamera name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMICamera name](v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = HMFEqualObjects();

      v12 = v8 & v11;
      -[HMICamera manufacturer](self, "manufacturer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMICamera manufacturer](v5, "manufacturer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = HMFEqualObjects();

      -[HMICamera model](self, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMICamera model](v5, "model");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = HMFEqualObjects();

      v19 = v12 & v15 & v18;
      -[HMICamera firmwareVersion](self, "firmwareVersion");
      v20 = objc_claimAutoreleasedReturnValue();
      -[HMICamera firmwareVersion](v5, "firmwareVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

      v23 = -[HMICamera hasBattery](self, "hasBattery");
      LOBYTE(v20) = -[HMICamera hasBattery](v5, "hasBattery");

      v24 = v19 & v22 & (v23 ^ v20 ^ 1);
    }
    else
    {
      v24 = 0;
    }
  }

  return v24;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMICamera identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMICamera)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HMICamera *v22;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_name);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_manufacturer);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_model);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_opt_class();
  NSStringFromSelector(sel_firmwareVersion);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_hasBattery);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v4, "decodeBoolForKey:", v20);

  v22 = -[HMICamera initWithIdentifier:name:manufacturer:model:firmwareVersion:hasBattery:](self, "initWithIdentifier:name:manufacturer:model:firmwareVersion:hasBattery:", v7, v10, v13, v16, v19, v21);
  return v22;
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
  _BOOL8 v15;
  id v16;

  v4 = a3;
  -[HMICamera identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[HMICamera name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[HMICamera manufacturer](self, "manufacturer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_manufacturer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[HMICamera model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_model);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[HMICamera firmwareVersion](self, "firmwareVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_firmwareVersion);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  v15 = -[HMICamera hasBattery](self, "hasBattery");
  NSStringFromSelector(sel_hasBattery);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)hasBattery
{
  return self->_hasBattery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
