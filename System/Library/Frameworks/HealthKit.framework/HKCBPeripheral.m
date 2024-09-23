@implementation HKCBPeripheral

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = objc_alloc((Class)objc_opt_class());
  -[HKCBPeripheral identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCBPeripheral name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCBPeripheral properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)objc_msgSend(v5, "_initWithIdentifer:name:properties:", v6, v7, v8);

  if (v9)
  {
    -[HKCBPeripheral name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copyWithZone:", a3);
    v12 = (void *)v9[1];
    v9[1] = v11;

    -[HKCBPeripheral identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copyWithZone:", a3);
    v15 = (void *)v9[2];
    v9[2] = v14;

    -[HKCBPeripheral properties](self, "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copyWithZone:", a3);
    v18 = (void *)v9[3];
    v9[3] = v17;

  }
  return v9;
}

- (id)_initWithIdentifer:(id)a3 name:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKCBPeripheral *v11;
  uint64_t v12;
  NSUUID *identifier;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSDictionary *properties;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKCBPeripheral;
  v11 = -[HKCBPeripheral init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    properties = v11->_properties;
    v11->_properties = (NSDictionary *)v16;

  }
  return v11;
}

- (HKCBPeripheral)initWithCBPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HKCBPeripheral *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "customPropertyNames", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "customProperty:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKCBPeripheral _initWithIdentifer:name:properties:](self, "_initWithIdentifer:name:properties:", v13, v14, v5);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  HKCBPeripheral *v4;
  NSUUID *identifier;
  NSUUID *v6;
  HKCBPeripheral *v7;
  NSString *name;
  NSString *v9;
  int v10;

  v4 = (HKCBPeripheral *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      v6 = v4->_identifier;
      v7 = v4;
      LODWORD(identifier) = -[NSUUID isEqual:](identifier, "isEqual:", v6);
      name = self->_name;
      v9 = v7->_name;

      v10 = identifier & -[NSString isEqual:](name, "isEqual:", v9);
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (HKCBPeripheral)initWithCoder:(id)a3
{
  id v4;
  HKCBPeripheral *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSUUID *identifier;
  uint64_t v10;
  NSDictionary *properties;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKCBPeripheral;
  v5 = -[HKCBPeripheral init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HealthPeripheralName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HealthPeripheralIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HealthPeripheralIProperties"));
    v10 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("HealthPeripheralName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("HealthPeripheralIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_properties, CFSTR("HealthPeripheralIProperties"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *name;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@) %@ %@"), v5, name, v7, self->_properties);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
