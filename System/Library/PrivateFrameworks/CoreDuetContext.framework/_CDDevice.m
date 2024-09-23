@implementation _CDDevice

+ (id)localDevice
{
  if (localDevice_onceToken != -1)
    dispatch_once(&localDevice_onceToken, &__block_literal_global_16);
  return (id)localDevice_localDevice;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (_CDDevice)initWithName:(id)a3 deviceID:(id)a4 deviceClass:(int64_t)a5 model:(id)a6 companion:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  _CDDevice *v16;
  _CDDevice *v17;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = -[_CDDevice init](self, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_deviceID, a4);
    v17->_identifier = +[_CDDevice identifierForDeviceID:](_CDDevice, "identifierForDeviceID:", v14);
    v17->_deviceClass = a5;
    objc_storeStrong((id *)&v17->_model, a6);
    v17->_companion = a7;
  }

  return v17;
}

+ (unint64_t)identifierForDeviceID:(id)a3
{
  if (a3)
  {
    strlen((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
    __memcpy_chk();
  }
  return 0;
}

- (_CDDevice)initWithName:(id)a3 identifier:(unint64_t)a4 deviceClass:(int64_t)a5
{
  id v9;
  _CDDevice *v10;
  _CDDevice *v11;

  v9 = a3;
  v10 = -[_CDDevice init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_identifier = a4;
    v11->_deviceClass = a5;
  }

  return v11;
}

- (_CDDevice)initWithName:(id)a3 deviceID:(id)a4 model:(id)a5 companion:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _CDDevice *v15;
  int v17;
  id v18;
  uint64_t v19;

  v6 = a6;
  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v12, "localizedCaseInsensitiveContainsString:", CFSTR("Mac")))
  {
    if (objc_msgSend(v12, "localizedCaseInsensitiveContainsString:", CFSTR("book")))
      v13 = 4;
    else
      v13 = 3;
  }
  else if ((objc_msgSend(v12, "localizedCaseInsensitiveContainsString:", CFSTR("iPhone")) & 1) != 0)
  {
    v13 = 1;
  }
  else if ((objc_msgSend(v12, "localizedCaseInsensitiveContainsString:", CFSTR("iPad")) & 1) != 0)
  {
    v13 = 0;
  }
  else if ((objc_msgSend(v12, "localizedCaseInsensitiveContainsString:", CFSTR("Watch")) & 1) != 0)
  {
    v13 = 6;
  }
  else if ((objc_msgSend(v12, "localizedCaseInsensitiveContainsString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v13 = 5;
  }
  else if ((objc_msgSend(v12, "localizedCaseInsensitiveContainsString:", CFSTR("AudioAccessory")) & 1) != 0)
  {
    v13 = 7;
  }
  else if ((objc_msgSend(v12, "localizedCaseInsensitiveContainsString:", CFSTR("iPod")) & 1) != 0)
  {
    v13 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_18DD73000, v14, OS_LOG_TYPE_INFO, "Unrecognized model: %@", (uint8_t *)&v17, 0xCu);
    }

    v13 = -1;
  }
  v15 = -[_CDDevice initWithName:deviceID:deviceClass:model:companion:](self, "initWithName:deviceID:deviceClass:model:companion:", v10, v11, v13, v12, v6);

  return v15;
}

- (BOOL)matchesDeviceTypes:(unint64_t)a3
{
  int v3;
  unint64_t v5;
  uint8_t v7[16];

  v3 = a3;
  if (a3 == 0x1000000)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Companion requested without a specific device type.", v7, 2u);
    }
    LODWORD(v5) = 1;
LABEL_15:
    if ((v3 & 0x1000000) != 0 && (_DWORD)v5)
      LOBYTE(v5) = self->_companion;
  }
  else
  {
    switch(self->_deviceClass)
    {
      case 0:
        LODWORD(v5) = a3 & 1;
        goto LABEL_15;
      case 1:
        v5 = (a3 >> 1) & 1;
        goto LABEL_15;
      case 2:
        v5 = (a3 >> 2) & 1;
        goto LABEL_15;
      case 3:
        v5 = (a3 >> 3) & 1;
        goto LABEL_15;
      case 4:
        v5 = (a3 >> 4) & 1;
        goto LABEL_15;
      case 5:
        v5 = (a3 >> 5) & 1;
        goto LABEL_15;
      case 6:
        v5 = (a3 >> 6) & 1;
        goto LABEL_15;
      case 7:
        v5 = (a3 >> 7) & 1;
        goto LABEL_15;
      default:
        LOBYTE(v5) = 0;
        break;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  void *v5;
  id v6;

  name = self->_name;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_deviceID, CFSTR("deviceID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("deviceClass"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_companion, CFSTR("companion"));

}

- (_CDDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _CDDevice *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("companion"));

  v11 = (_CDDevice *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:deviceID:deviceClass:model:companion:", v5, v6, v8, v9, v10);
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_CDDevice initWithName:deviceID:deviceClass:model:companion:](+[_CDDevice allocWithZone:](_CDDevice, "allocWithZone:", a3), "initWithName:deviceID:deviceClass:model:companion:", self->_name, self->_deviceID, self->_deviceClass, self->_model, self->_companion);
}

- (BOOL)isEqual:(id)a3
{
  _CDDevice *v4;
  NSString *deviceID;
  void *v6;
  char v7;

  v4 = (_CDDevice *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      deviceID = self->_deviceID;
      -[_CDDevice deviceID](v4, "deviceID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqualToString:](deviceID, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_deviceClass ^ -[NSString hash](self->_deviceID, "hash");
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = -[_CDDevice deviceClass](self, "deviceClass");
  if (v3 > 7)
    v4 = CFSTR("??");
  else
    v4 = off_1E26D4D98[v3];
  if (self->_companion)
    v5 = CFSTR("<_CDDevice: %@: '%@' (%@), %@ (paired companion)>");
  else
    v5 = CFSTR("<_CDDevice: %@: '%@' (%@), %@>");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, v4, self->_name, self->_deviceID, self->_model);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int64_t)a3
{
  self->_deviceClass = a3;
}

- (NSString)model
{
  return self->_model;
}

- (BOOL)isCompanion
{
  return self->_companion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
