@implementation DAAdapterAccessory

+ (id)accessoryWithIdentifier:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:attributes:", v7, v6);

  return v8;
}

- (DAAdapterAccessory)initWithIdentifier:(id)a3 attributes:(id)a4
{
  id v7;
  id v8;
  DAAdapterAccessory *v9;
  DAAdapterAccessory *v10;
  void *v11;
  uint64_t v12;
  NSString *name;
  NSString *v14;
  const __CFString *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DAAdapterAccessory;
  v9 = -[DAAdapterAccessory init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Accessory.SmartBatteryCase")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DAAdapterAccessory attributes](v10, "attributes"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name")));
      name = v10->_name;
      v10->_name = (NSString *)v12;

      v14 = v10->_name;
      if (!v14)
      {
        v15 = CFSTR("Smart Battery Case");
LABEL_9:
        v10->_name = &v15->isa;

      }
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("Accessory.SmartKeyboard")))
      {
        v14 = v10->_name;
        v15 = CFSTR("Smart Keyboard");
        goto LABEL_9;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("Accessory.ApplePencil")))
      {
        v14 = v10->_name;
        v15 = CFSTR("Apple Pencil");
        goto LABEL_9;
      }
    }
  }

  return v10;
}

- (id)serialNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DAAdapterAccessory attributes](self, "attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("serialNumber")));

  return v3;
}

- (id)modelNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DAAdapterAccessory attributes](self, "attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("modelNumber")));

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
