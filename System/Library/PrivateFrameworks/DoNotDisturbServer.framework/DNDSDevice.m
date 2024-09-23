@implementation DNDSDevice

+ (id)currentDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__DNDSDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, block);
  return (id)currentDevice_device;
}

void __27__DNDSDevice_currentDevice__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[3];
  objc_super v10;

  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___DNDSDevice;
  objc_msgSendSuper2(&v10, sel_currentDevice);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)IDSCopyLocalDeviceUniqueID();
  v4 = objc_alloc(*(Class *)(a1 + 32));
  v5 = objc_msgSend(v2, "deviceClass");
  v6 = objc_msgSend(v2, "deviceCapabilities");
  if (v2)
    objc_msgSend(v2, "frameworkVersion");
  else
    memset(v9, 0, sizeof(v9));
  v7 = objc_msgSend(v4, "_initWithClass:deviceCapabilities:identifier:frameworkVersion:", v5, v6, v3, v9);
  v8 = (void *)currentDevice_device;
  currentDevice_device = v7;

}

- (id)_initWithClass:(unint64_t)a3 deviceCapabilities:(unint64_t)a4 identifier:(id)a5 frameworkVersion:(id *)a6
{
  id v10;
  DNDSDevice *v11;
  uint64_t v12;
  NSString *identifier;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v15;
  objc_super v16;

  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DNDSDevice;
  v15 = *a6;
  v11 = -[DNDDevice initWithClass:deviceCapabilities:frameworkVersion:](&v16, sel_initWithClass_deviceCapabilities_frameworkVersion_, a3, a4, &v15);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DNDSDevice;
  v3 = -[DNDDevice hash](&v7, sel_hash);
  -[DNDSDevice identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DNDSDevice *v4;
  DNDSDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (DNDSDevice *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)DNDSDevice;
      if (-[DNDDevice isEqual:](&v14, sel_isEqual_, v5))
      {
        -[DNDSDevice identifier](self, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSDevice identifier](v5, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 == v7)
        {
          v12 = 1;
        }
        else
        {
          -[DNDSDevice identifier](self, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            -[DNDSDevice identifier](v5, "identifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              -[DNDSDevice identifier](self, "identifier");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSDevice identifier](v5, "identifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v10, "isEqual:", v11);

            }
            else
            {
              v12 = 0;
            }

          }
          else
          {
            v12 = 0;
          }

        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDDevice deviceClass](self, "deviceClass");
  DNDStringFromDeviceClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDDevice deviceCapabilities](self, "deviceCapabilities");
  DNDStringFromDeviceCapabilities();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSDevice identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDDevice frameworkVersion](self, "frameworkVersion");
  DNDStringFromOperatingSystemVersion();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; deviceClass: %@; deviceCapabilities: %@; identifier: %@; frameworkVersion: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
