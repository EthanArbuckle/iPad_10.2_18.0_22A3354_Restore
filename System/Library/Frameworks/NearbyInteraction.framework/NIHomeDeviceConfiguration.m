@implementation NIHomeDeviceConfiguration

- (NIHomeDeviceConfiguration)init
{
  NIHomeDeviceConfiguration *v2;
  NIHomeDeviceConfiguration *v3;
  NSData *sessionKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NIHomeDeviceConfiguration;
  v2 = -[NIConfiguration initInternal](&v6, sel_initInternal);
  v3 = v2;
  if (v2)
  {
    v2->_allowedDevices = 4;
    sessionKey = v2->_sessionKey;
    v2->_sessionKey = 0;

    v3->_anchor = 0;
    v3->_minimumPreferredUpdatedRate = 3;
    v3->_antennaDiversityOverride = 0;
    -[NIHomeDeviceConfiguration setMonitoredRegions:](v3, "setMonitoredRegions:", MEMORY[0x1E0C9AA60]);
  }
  return v3;
}

+ (id)new
{
  return objc_alloc_init(NIHomeDeviceConfiguration);
}

- (NIHomeDeviceConfiguration)initWithRegions:(id)a3
{
  id v4;
  NIHomeDeviceConfiguration *v5;

  v4 = a3;
  v5 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class());

  -[NIHomeDeviceConfiguration setMonitoredRegions:](v5, "setMonitoredRegions:", v4);
  return v5;
}

- (NIHomeDeviceConfiguration)initWithAllowedDevices:(unint64_t)a3 sessionKey:(id)a4 asAnchor:(BOOL)a5 regions:(id)a6
{
  id v11;
  id v12;
  NIHomeDeviceConfiguration *v13;

  v11 = a4;
  v12 = a6;
  v13 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class());

  if (v13)
  {
    v13->_allowedDevices = a3;
    objc_storeStrong((id *)&v13->_sessionKey, a4);
    v13->_anchor = a5;
    -[NIHomeDeviceConfiguration setMonitoredRegions:](v13, "setMonitoredRegions:", v12);
  }

  return v13;
}

- (void)setMonitoredRegions:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredRegions, a3);
  -[NIHomeDeviceConfiguration _updateRegionDescription](self, "_updateRegionDescription");
}

- (NSArray)monitoredRegions
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_monitoredRegions, 1);
}

- (void)_updateRegionDescription
{
  void *v3;
  NSArray *monitoredRegions;
  id v5;
  NSString *regionDescription;
  NSString *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (-[NSArray count](self->_monitoredRegions, "count"))
  {
    v3 = (void *)objc_opt_new();
    monitoredRegions = self->_monitoredRegions;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__NIHomeDeviceConfiguration__updateRegionDescription__block_invoke;
    v9[3] = &unk_1E4362B60;
    v5 = v3;
    v10 = v5;
    -[NSArray enumerateObjectsUsingBlock:](monitoredRegions, "enumerateObjectsUsingBlock:", v9);
    regionDescription = self->_regionDescription;
    self->_regionDescription = (NSString *)v5;
    v8 = v5;

  }
  else
  {
    v7 = self->_regionDescription;
    self->_regionDescription = (NSString *)CFSTR("[none]");

  }
}

void __53__NIHomeDeviceConfiguration__updateRegionDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "shortDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n    [%@] "), v3);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NIHomeDeviceConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v9, sel_copyWithZone_);
  objc_msgSend(v5, "setAllowedDevices:", self->_allowedDevices);
  objc_msgSend(v5, "setSessionKey:", self->_sessionKey);
  objc_msgSend(v5, "setAnchor:", self->_anchor);
  objc_msgSend(v5, "setAntennaDiversityOverride:", self->_antennaDiversityOverride);
  objc_msgSend(v5, "setMinimumPreferredUpdatedRate:", self->_minimumPreferredUpdatedRate);
  if (self->_monitoredRegions)
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3), "initWithArray:copyItems:", self->_monitoredRegions, 1);
    v7 = v5[4];
    v5[4] = (id)v6;

  }
  objc_storeStrong(v5 + 5, self->_regionDescription);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIHomeDeviceConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_allowedDevices, CFSTR("allowedDevices"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sessionKey, CFSTR("sessionKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_anchor, CFSTR("anchor"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_antennaDiversityOverride, CFSTR("antennaDiversityOverride"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_monitoredRegions, CFSTR("monitoredRegions"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minimumPreferredUpdatedRate, CFSTR("minimumPreferredUpdatedRate"));

}

- (NIHomeDeviceConfiguration)initWithCoder:(id)a3
{
  id v4;
  NIHomeDeviceConfiguration *v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NIHomeDeviceConfiguration *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NIHomeDeviceConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5
    && (v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("allowedDevices")),
        +[NIUtils isIntValidRelationshipSpecifier:](NIUtils, "isIntValidRelationshipSpecifier:", v6)))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("anchor"));
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("antennaDiversityOverride"));
    if (+[NIUtils isIntValidAntennaDiversityOverride:](NIUtils, "isIntValidAntennaDiversityOverride:", v9))
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("monitoredRegions"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumPreferredUpdatedRate")),
            +[NIUtils isIntValidNearbyObjectUpdateRate:](NIUtils, "isIntValidNearbyObjectUpdateRate:", v14)))
      {
        v5->_allowedDevices = v6;
        objc_storeStrong((id *)&v5->_sessionKey, v7);
        v5->_anchor = v8;
        v5->_antennaDiversityOverride = v9;
        objc_storeStrong((id *)&v5->_monitoredRegions, v13);
        -[NIHomeDeviceConfiguration _updateRegionDescription](v5, "_updateRegionDescription");
        v5->_minimumPreferredUpdatedRate = v14;
        v15 = v5;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  NIHomeDeviceConfiguration *v4;
  NIHomeDeviceConfiguration *v5;
  uint64_t v6;
  unint64_t allowedDevices;
  _BOOL4 v8;
  int anchor;
  uint64_t v10;
  int64_t antennaDiversityOverride;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  int64_t minimumPreferredUpdatedRate;
  _BOOL4 v27;
  uint64_t v28;
  int64_t v29;

  v4 = (NIHomeDeviceConfiguration *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v14 = 1;
    }
    else
    {
      v6 = -[NIHomeDeviceConfiguration allowedDevices](v4, "allowedDevices");
      allowedDevices = self->_allowedDevices;
      v8 = -[NIHomeDeviceConfiguration isAnchor](v5, "isAnchor");
      anchor = self->_anchor;
      v10 = -[NIHomeDeviceConfiguration antennaDiversityOverride](v5, "antennaDiversityOverride");
      antennaDiversityOverride = self->_antennaDiversityOverride;
      v12 = -[NIHomeDeviceConfiguration minimumPreferredUpdatedRate](v5, "minimumPreferredUpdatedRate");
      v29 = antennaDiversityOverride;
      minimumPreferredUpdatedRate = self->_minimumPreferredUpdatedRate;
      -[NIHomeDeviceConfiguration sessionKey](v5, "sessionKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v12;
      if (v13)
        v27 = 0;
      else
        v27 = self->_sessionKey == 0;
      v28 = v10;

      -[NIHomeDeviceConfiguration sessionKey](v5, "sessionKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v8;
      v17 = objc_msgSend(v15, "isEqualToData:", self->_sessionKey);
      v18 = allowedDevices;
      v19 = v6;

      -[NIHomeDeviceConfiguration monitoredRegions](v5, "monitoredRegions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToArray:", self->_monitoredRegions);

      -[NIHomeDeviceConfiguration monitoredRegions](v5, "monitoredRegions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        v23 = 0;
      else
        v23 = self->_monitoredRegions == 0;

      v14 = 0;
      if (v19 == v18 && anchor == v16 && v28 == v29 && (((v27 | v17) ^ 1) & 1) == 0)
      {
        if (v25 == minimumPreferredUpdatedRate)
          v14 = v21 | v23;
        else
          v14 = 0;
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIHomeDeviceConfiguration *v5;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIHomeDeviceConfiguration *)v4;
    if (v5 == self)
    {
      v7 = 1;
    }
    else if (-[NIHomeDeviceConfiguration canUpdateToConfiguration:](self, "canUpdateToConfiguration:", v5))
    {
      v6 = -[NIConfiguration enabledGestures](self, "enabledGestures");
      v7 = v6 == -[NIConfiguration enabledGestures](v5, "enabledGestures");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t antennaDiversityOverride;

  v3 = self->_allowedDevices ^ self->_anchor ^ -[NSData hash](self->_sessionKey, "hash");
  antennaDiversityOverride = self->_antennaDiversityOverride;
  return v3 ^ antennaDiversityOverride ^ -[NSArray hash](self->_monitoredRegions, "hash") ^ self->_minimumPreferredUpdatedRate;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NIHomeDeviceConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  void *v3;
  const char *v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = +[NIUtils NIRelationshipSpecifierToString:](NIUtils, "NIRelationshipSpecifierToString:", self->_allowedDevices);
  if (self->_anchor)
    v5 = "Yes";
  else
    v5 = "No";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<devices: [%s], ses-key: %@, anchor: %s, ant-div: %s, min-rate: %s, gestures: %d, regions: %@>"), v4, self->_sessionKey, v5, +[NIUtils AntennaDiversityOverrideToString:](NIUtils, "AntennaDiversityOverrideToString:", self->_antennaDiversityOverride), +[NIUtils NINearbyObjectUpdateRateToString:](NIUtils, "NINearbyObjectUpdateRateToString:", self->_minimumPreferredUpdatedRate), -[NIConfiguration enabledGestures](self, "enabledGestures"), self->_regionDescription);
}

- (unint64_t)allowedDevices
{
  return self->_allowedDevices;
}

- (void)setAllowedDevices:(unint64_t)a3
{
  self->_allowedDevices = a3;
}

- (NSData)sessionKey
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)isAnchor
{
  return self->_anchor;
}

- (void)setAnchor:(BOOL)a3
{
  self->_anchor = a3;
}

- (int64_t)minimumPreferredUpdatedRate
{
  return self->_minimumPreferredUpdatedRate;
}

- (void)setMinimumPreferredUpdatedRate:(int64_t)a3
{
  self->_minimumPreferredUpdatedRate = a3;
}

- (int64_t)antennaDiversityOverride
{
  return self->_antennaDiversityOverride;
}

- (void)setAntennaDiversityOverride:(int64_t)a3
{
  self->_antennaDiversityOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_regionDescription, 0);
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
}

@end
