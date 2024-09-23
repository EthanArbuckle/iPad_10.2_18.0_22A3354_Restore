@implementation INSettingDevice

- (INSettingDevice)initWithDeviceName:(id)a3 deviceModel:(id)a4 deviceCategory:(int64_t)a5
{
  id v8;
  id v9;
  INSettingDevice *v10;
  uint64_t v11;
  NSString *deviceName;
  uint64_t v13;
  NSString *deviceModel;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)INSettingDevice;
  v10 = -[INSettingDevice init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    deviceName = v10->_deviceName;
    v10->_deviceName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    deviceModel = v10->_deviceModel;
    v10->_deviceModel = (NSString *)v13;

    v10->_deviceCategory = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_deviceName, "hash");
  v4 = -[NSString hash](self->_deviceModel, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceCategory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  INSettingDevice *v4;
  INSettingDevice *v5;
  NSString *deviceName;
  NSString *deviceModel;
  BOOL v8;

  v4 = (INSettingDevice *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      deviceName = self->_deviceName;
      v8 = (deviceName == v5->_deviceName || -[NSString isEqual:](deviceName, "isEqual:"))
        && ((deviceModel = self->_deviceModel, deviceModel == v5->_deviceModel)
         || -[NSString isEqual:](deviceModel, "isEqual:"))
        && self->_deviceCategory == v5->_deviceCategory;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INSettingDevice)initWithCoder:(id)a3
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
  uint64_t v13;
  INSettingDevice *v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("deviceName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("deviceModel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("deviceCategory"));
  v14 = -[INSettingDevice initWithDeviceName:deviceModel:deviceCategory:](self, "initWithDeviceName:deviceModel:deviceCategory:", v8, v12, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  id v5;

  deviceName = self->_deviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceModel, CFSTR("deviceModel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceCategory, CFSTR("deviceCategory"));

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

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_deviceName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("deviceName"));

  objc_msgSend(v6, "encodeObject:", self->_deviceModel);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("deviceModel"));
  v10 = self->_deviceCategory - 1;
  if (v10 > 0xD)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E22948B0[v10];
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("deviceCategory"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INSettingDevice descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INSettingDevice;
  -[INSettingDevice description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSettingDevice _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *deviceName;
  void *v4;
  NSString *deviceModel;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("deviceName");
  deviceName = self->_deviceName;
  v4 = deviceName;
  if (!deviceName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v4;
  v10[1] = CFSTR("deviceModel");
  deviceModel = self->_deviceModel;
  v6 = deviceModel;
  if (!deviceModel)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v6;
  v10[2] = CFSTR("deviceCategory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceCategory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!deviceModel)
  {

    if (deviceName)
      return v8;
LABEL_9:

    return v8;
  }
  if (!deviceName)
    goto LABEL_9;
  return v8;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (int64_t)deviceCategory
{
  return self->_deviceCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceCategory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = INDeviceCategoryWithString(v9);

    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceName:deviceModel:deviceCategory:", v7, v8, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
