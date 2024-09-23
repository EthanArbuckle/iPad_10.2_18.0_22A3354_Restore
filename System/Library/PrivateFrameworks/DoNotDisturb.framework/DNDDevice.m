@implementation DNDDevice

+ (id)currentDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__DNDDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, block);
  return (id)currentDevice_device;
}

void __26__DNDDevice_currentDevice__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v2 = MGGetSInt32Answer();
  v3 = DNDDeviceClassFromMGDeviceClass(v2);
  v4 = MGGetBoolAnswer();
  if (_DNDCurrentFrameworkVersion_onceToken != -1)
    dispatch_once(&_DNDCurrentFrameworkVersion_onceToken, &__block_literal_global_2);
  v10 = _DNDCurrentFrameworkVersion_currentVersion;
  v11 = qword_1ED0275D0;
  v5 = objc_alloc(*(Class *)(a1 + 32));
  v8 = v10;
  v9 = v11;
  v6 = objc_msgSend(v5, "initWithClass:deviceCapabilities:frameworkVersion:", v3, v4, &v8);
  v7 = (void *)currentDevice_device;
  currentDevice_device = v6;

}

+ (id)deviceWithClass:(unint64_t)a3 deviceCapabilities:(unint64_t)a4
{
  _QWORD v5[3];

  memset(v5, 0, sizeof(v5));
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithClass:deviceCapabilities:frameworkVersion:", a3, a4, v5);
}

- (DNDDevice)initWithClass:(unint64_t)a3 deviceCapabilities:(unint64_t)a4 frameworkVersion:(id *)a5
{
  DNDDevice *result;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DNDDevice;
  result = -[DNDDevice init](&v10, sel_init);
  if (result)
  {
    result->_deviceClass = a3;
    result->_deviceCapabilities = a4;
    v9 = *(_OWORD *)&a5->var0;
    result->_frameworkVersion.patchVersion = a5->var2;
    *(_OWORD *)&result->_frameworkVersion.majorVersion = v9;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[3];

  v3 = -[DNDDevice deviceClass](self, "deviceClass");
  v4 = -[DNDDevice deviceCapabilities](self, "deviceCapabilities") ^ v3;
  -[DNDDevice frameworkVersion](self, "frameworkVersion");
  DNDStringFromOperatingSystemVersion(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  DNDDevice *v4;
  DNDDevice *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];

  v4 = (DNDDevice *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDDevice deviceClass](self, "deviceClass");
      if (v6 == -[DNDDevice deviceClass](v5, "deviceClass")
        && (v7 = -[DNDDevice deviceCapabilities](self, "deviceCapabilities"),
            v7 == -[DNDDevice deviceCapabilities](v5, "deviceCapabilities")))
      {
        -[DNDDevice frameworkVersion](self, "frameworkVersion");
        DNDStringFromOperatingSystemVersion(v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          -[DNDDevice frameworkVersion](v5, "frameworkVersion");
        else
          memset(v20, 0, sizeof(v20));
        DNDStringFromOperatingSystemVersion(v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v10)
        {
          v9 = 1;
        }
        else
        {
          -[DNDDevice frameworkVersion](self, "frameworkVersion");
          DNDStringFromOperatingSystemVersion(v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            if (v5)
              -[DNDDevice frameworkVersion](v5, "frameworkVersion");
            else
              memset(v18, 0, sizeof(v18));
            DNDStringFromOperatingSystemVersion(v18);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              -[DNDDevice frameworkVersion](self, "frameworkVersion");
              DNDStringFromOperatingSystemVersion(v17);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v5)
                -[DNDDevice frameworkVersion](v5, "frameworkVersion");
              else
                memset(v16, 0, sizeof(v16));
              DNDStringFromOperatingSystemVersion(v16);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = objc_msgSend(v13, "isEqual:", v14);

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

        }
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
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  DNDStringFromDeviceClass(-[DNDDevice deviceClass](self, "deviceClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DNDStringFromDeviceCapabilities(-[DNDDevice deviceCapabilities](self, "deviceCapabilities"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDDevice frameworkVersion](self, "frameworkVersion");
  DNDStringFromOperatingSystemVersion(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; deviceClass: %@; deviceCapabilities: %@; frameworkVersion: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (unint64_t)deviceCapabilities
{
  return self->_deviceCapabilities;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)frameworkVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[1];
  return self;
}

@end
