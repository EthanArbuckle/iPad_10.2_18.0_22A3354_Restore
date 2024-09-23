@implementation HKDeviceContext

- (HKDeviceContext)initWithType:(int64_t)a3 localDevice:(BOOL)a4 productTypeName:(id)a5 currentOSName:(id)a6 currentOSVersion:(id *)a7 modificationDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  HKDeviceContext *v18;
  HKDeviceContext *v19;
  __int128 v20;
  objc_super v22;

  v15 = a5;
  v16 = a6;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HKDeviceContext;
  v18 = -[HKDeviceContext init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    v18->_representsLocalDevice = a4;
    objc_storeStrong((id *)&v18->_modificationDate, a8);
    objc_storeStrong((id *)&v19->_productTypeName, a5);
    objc_storeStrong((id *)&v19->_currentOSName, a6);
    v20 = *(_OWORD *)&a7->var0;
    v19->_currentOSVersion.patchVersion = a7->var2;
    *(_OWORD *)&v19->_currentOSVersion.majorVersion = v20;
  }

  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL8 representsLocalDevice;
  NSString *productTypeName;
  NSString *currentOSName;
  void *v10;
  void *v11;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringForDeviceType(self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  representsLocalDevice = self->_representsLocalDevice;
  currentOSName = self->_currentOSName;
  productTypeName = self->_productTypeName;
  currentOSVersion = self->_currentOSVersion;
  HKNSOperatingSystemVersionString(&currentOSVersion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p type=%@, representsLocalDevice=%d, productType=%@, currentOS=%@, currentOSVersion=%@, modificationDate=%@>"), v5, self, v6, representsLocalDevice, productTypeName, currentOSName, v10, self->_modificationDate);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKDeviceContext *v4;
  _BOOL8 representsLocalDevice;
  NSString *productTypeName;
  NSString *currentOSName;
  int64_t type;
  NSDate *modificationDate;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion;

  v4 = +[HKDeviceContext allocWithZone:](HKDeviceContext, "allocWithZone:", a3);
  representsLocalDevice = self->_representsLocalDevice;
  currentOSName = self->_currentOSName;
  productTypeName = self->_productTypeName;
  type = self->_type;
  modificationDate = self->_modificationDate;
  currentOSVersion = self->_currentOSVersion;
  return -[HKDeviceContext initWithType:localDevice:productTypeName:currentOSName:currentOSVersion:modificationDate:](v4, "initWithType:localDevice:productTypeName:currentOSName:currentOSVersion:modificationDate:", type, representsLocalDevice, productTypeName, currentOSName, &currentOSVersion, modificationDate);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  HKDeviceContext *v7;
  HKDeviceContext *v8;
  int64_t v9;
  _BOOL4 representsLocalDevice;
  NSString *productTypeName;
  NSString *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  char v16;
  NSString *currentOSName;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  NSString *v22;
  $A44FF20282FB96BA82CF1B0FF6945C38 *p_currentOSVersion;
  void *v25;
  __int128 v26;
  int64_t patchVersion;
  _QWORD v28[3];

  v7 = (HKDeviceContext *)a3;
  if (self == v7)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = -[HKDeviceContext type](self, "type");
      if (v9 != -[HKDeviceContext type](v8, "type")
        || (representsLocalDevice = self->_representsLocalDevice,
            representsLocalDevice != -[HKDeviceContext representsLocalDevice](v8, "representsLocalDevice")))
      {
        v16 = 0;
LABEL_26:

        goto LABEL_27;
      }
      productTypeName = self->_productTypeName;
      -[HKDeviceContext productTypeName](v8, "productTypeName");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (productTypeName != v12)
      {
        -[HKDeviceContext productTypeName](v8, "productTypeName");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v16 = 0;
          goto LABEL_25;
        }
        v3 = (void *)v13;
        v14 = self->_productTypeName;
        -[HKDeviceContext productTypeName](v8, "productTypeName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v14, "isEqualToString:", v15))
        {
          v16 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v25 = v15;
      }
      currentOSName = self->_currentOSName;
      -[HKDeviceContext currentOSName](v8, "currentOSName");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (currentOSName != v18)
      {
        -[HKDeviceContext currentOSName](v8, "currentOSName");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {

          v16 = 0;
          goto LABEL_29;
        }
        v4 = (void *)v19;
        v20 = self->_currentOSName;
        -[HKDeviceContext currentOSName](v8, "currentOSName");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v20;
        v5 = (void *)v21;
        if (!-[NSString isEqualToString:](v22, "isEqualToString:", v21))
        {
          v16 = 0;
          goto LABEL_23;
        }
      }
      p_currentOSVersion = &self->_currentOSVersion;
      if (v8)
        -[HKDeviceContext currentOSVersion](v8, "currentOSVersion");
      else
        memset(v28, 0, sizeof(v28));
      v26 = *(_OWORD *)&p_currentOSVersion->majorVersion;
      patchVersion = p_currentOSVersion->patchVersion;
      v16 = HKNSOperatingSystemVersionsEqual((uint64_t)&v26, (uint64_t)v28);
      if (currentOSName != v18)
      {
LABEL_23:
        v15 = v25;

        if (productTypeName != v12)
          goto LABEL_24;
LABEL_25:

        goto LABEL_26;
      }

LABEL_29:
      v15 = v25;
      if (productTypeName == v12)
        goto LABEL_25;
      goto LABEL_24;
    }
    v16 = 0;
  }
LABEL_27:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  void *v6;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("Type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_representsLocalDevice, CFSTR("LocalDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productTypeName, CFSTR("ProductTypeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentOSName, CFSTR("CurrentOSName"));
  currentOSVersion = self->_currentOSVersion;
  HKNSOperatingSystemVersionString(&currentOSVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("CurrentOSVersion"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("ModificationDate"));
}

- (HKDeviceContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKDeviceContext *v11;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LocalDevice"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductTypeName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentOSName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0uLL;
  v16 = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentOSVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKNSOperatingSystemVersionFromString(v9, (uint64_t *)&v15);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModificationDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v7 && v8 && v10)
  {
    v13 = v15;
    v14 = v16;
    self = -[HKDeviceContext initWithType:localDevice:productTypeName:currentOSName:currentOSVersion:modificationDate:](self, "initWithType:localDevice:productTypeName:currentOSName:currentOSVersion:modificationDate:", v5, v6, v7, v8, &v13, v10);
    v11 = self;
  }

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (BOOL)representsLocalDevice
{
  return self->_representsLocalDevice;
}

- (NSString)currentOSName
{
  return self->_currentOSName;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[2];
  return self;
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_currentOSName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
}

@end
