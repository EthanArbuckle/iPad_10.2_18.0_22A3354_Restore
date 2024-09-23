@implementation INDeviceDetail

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INDeviceDetail deviceOwner](self, "deviceOwner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_intents_cacheableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  if (objc_msgSend(v3, "count"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INDeviceDetail deviceOwner](self, "deviceOwner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

}

- (INDeviceDetail)initWithIdentifier:(id)a3 deviceName:(id)a4 deviceClass:(int64_t)a5 productName:(id)a6 category:(id)a7 deviceOwner:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  INDeviceDetail *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  INSpeakableString *deviceName;
  uint64_t v24;
  INSpeakableString *productName;
  uint64_t v26;
  INSpeakableString *category;
  uint64_t v28;
  INPerson *deviceOwner;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)INDeviceDetail;
  v19 = -[INDeviceDetail init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    deviceName = v19->_deviceName;
    v19->_deviceName = (INSpeakableString *)v22;

    v19->_deviceClass = a5;
    v24 = objc_msgSend(v16, "copy");
    productName = v19->_productName;
    v19->_productName = (INSpeakableString *)v24;

    v26 = objc_msgSend(v17, "copy");
    category = v19->_category;
    v19->_category = (INSpeakableString *)v26;

    v28 = objc_msgSend(v18, "copy");
    deviceOwner = v19->_deviceOwner;
    v19->_deviceOwner = (INPerson *)v28;

  }
  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[INSpeakableString hash](self->_deviceName, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ -[INSpeakableString hash](self->_productName, "hash") ^ v6;
  v8 = -[INSpeakableString hash](self->_category, "hash");
  v9 = v7 ^ v8 ^ -[INPerson hash](self->_deviceOwner, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  INDeviceDetail *v4;
  INDeviceDetail *v5;
  NSString *identifier;
  INSpeakableString *deviceName;
  INSpeakableString *productName;
  INSpeakableString *category;
  INPerson *deviceOwner;
  BOOL v11;

  v4 = (INDeviceDetail *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v11 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        deviceName = self->_deviceName;
        if ((deviceName == v5->_deviceName || -[INSpeakableString isEqual:](deviceName, "isEqual:"))
          && self->_deviceClass == v5->_deviceClass)
        {
          productName = self->_productName;
          if (productName == v5->_productName || -[INSpeakableString isEqual:](productName, "isEqual:"))
          {
            category = self->_category;
            if (category == v5->_category || -[INSpeakableString isEqual:](category, "isEqual:"))
            {
              deviceOwner = self->_deviceOwner;
              if (deviceOwner == v5->_deviceOwner || -[INPerson isEqual:](deviceOwner, "isEqual:"))
                v11 = 1;
            }
          }
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (INDeviceDetail)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  INDeviceDetail *v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("deviceClass"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceOwner"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INDeviceDetail initWithIdentifier:deviceName:deviceClass:productName:category:deviceOwner:](self, "initWithIdentifier:deviceName:deviceClass:productName:category:deviceOwner:", v8, v9, v10, v11, v12, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productName, CFSTR("productName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceOwner, CFSTR("deviceOwner"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("identifier"));

  objc_msgSend(v6, "encodeObject:", self->_deviceName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("deviceName"));

  v10 = self->_deviceClass - 1;
  if (v10 > 8)
    v11 = CFSTR("unknown");
  else
    v11 = *(&off_1E2294170 + v10);
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("deviceClass"));

  objc_msgSend(v6, "encodeObject:", self->_productName);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("productName"));

  objc_msgSend(v6, "encodeObject:", self->_category);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("category"));

  objc_msgSend(v6, "encodeObject:", self->_deviceOwner);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("deviceOwner"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INDeviceDetail descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INDeviceDetail;
  -[INDeviceDetail description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INDeviceDetail _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *identifier;
  uint64_t v4;
  INSpeakableString *deviceName;
  uint64_t v6;
  void *v7;
  INSpeakableString *productName;
  void *v9;
  INSpeakableString *category;
  void *v11;
  INPerson *deviceOwner;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("identifier");
  identifier = self->_identifier;
  v4 = (uint64_t)identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v4;
  v19[0] = v4;
  v18[1] = CFSTR("deviceName");
  deviceName = self->_deviceName;
  v6 = (uint64_t)deviceName;
  if (!deviceName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v6;
  v19[1] = v6;
  v18[2] = CFSTR("deviceClass");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceClass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("productName");
  productName = self->_productName;
  v9 = productName;
  if (!productName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[3] = v9;
  v18[4] = CFSTR("category");
  category = self->_category;
  v11 = category;
  if (!category)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[4] = v11;
  v18[5] = CFSTR("deviceOwner");
  deviceOwner = self->_deviceOwner;
  v13 = deviceOwner;
  if (!deviceOwner)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (deviceOwner)
  {
    if (category)
      goto LABEL_13;
LABEL_18:

    if (productName)
      goto LABEL_14;
    goto LABEL_19;
  }

  if (!category)
    goto LABEL_18;
LABEL_13:
  if (productName)
    goto LABEL_14;
LABEL_19:

LABEL_14:
  if (!deviceName)
  {

    if (identifier)
      return v14;
LABEL_21:

    return v14;
  }
  if (!identifier)
    goto LABEL_21;
  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (INSpeakableString)deviceName
{
  return self->_deviceName;
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (INSpeakableString)productName
{
  return self->_productName;
}

- (INSpeakableString)category
{
  return self->_category;
}

- (INPerson)deviceOwner
{
  return self->_deviceOwner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOwner, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deviceName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deviceClass"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = INDeviceClassWithString(v13);

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("productName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("category"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deviceOwner"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:deviceName:deviceClass:productName:category:deviceOwner:", v9, v12, v14, v17, v20, v23);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end
