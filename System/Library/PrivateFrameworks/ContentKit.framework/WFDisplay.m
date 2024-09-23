@implementation WFDisplay

- (WFDisplay)initWithDisplayUUID:(id)a3 name:(id)a4
{
  return -[WFDisplay initWithDisplayUUID:serializationUUID:localizedName:](self, "initWithDisplayUUID:serializationUUID:localizedName:", a3, a3, a4);
}

- (WFDisplay)initWithDisplayUUID:(id)a3 deviceName:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFDisplay *v11;
  uint64_t v12;
  NSString *UUID;
  uint64_t v14;
  NSString *serializationUUID;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSString *deviceName;
  WFDisplay *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFDisplay;
  v11 = -[WFDisplay init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    UUID = v11->_UUID;
    v11->_UUID = (NSString *)v12;

    v14 = objc_msgSend(v8, "copy");
    serializationUUID = v11->_serializationUUID;
    v11->_serializationUUID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v16;

    v18 = objc_msgSend(v9, "copy");
    deviceName = v11->_deviceName;
    v11->_deviceName = (NSString *)v18;

    v20 = v11;
  }

  return v11;
}

- (WFDisplay)initWithDisplayUUID:(id)a3 serializationUUID:(id)a4 localizedName:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFDisplay *v11;
  uint64_t v12;
  NSString *UUID;
  uint64_t v14;
  NSString *serializationUUID;
  uint64_t v16;
  NSString *name;
  WFDisplay *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFDisplay;
  v11 = -[WFDisplay init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    UUID = v11->_UUID;
    v11->_UUID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    serializationUUID = v11->_serializationUUID;
    v11->_serializationUUID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (WFDisplay)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFDisplay *v8;
  WFDisplay *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializationUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[WFDisplay initWithDisplayUUID:deviceName:name:](self, "initWithDisplayUUID:deviceName:name:", v5, v7, v6);
  else
    v8 = -[WFDisplay initWithDisplayUUID:name:](self, "initWithDisplayUUID:name:", v5, v6);
  v9 = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFDisplay serializationUUID](self, "serializationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serializationUUID"));

  -[WFDisplay name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[WFDisplay deviceName](self, "deviceName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("deviceName"));

}

- (NSString)serializationUUID
{
  return self->_serializationUUID;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_serializationUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
