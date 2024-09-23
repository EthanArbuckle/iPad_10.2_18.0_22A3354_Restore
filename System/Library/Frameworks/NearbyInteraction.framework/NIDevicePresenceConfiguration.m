@implementation NIDevicePresenceConfiguration

- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NIRegionPredicate *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NIDevicePresenceConfiguration *v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NIDevicePresenceConfiguration;
  v10 = -[NIConfiguration initInternal](&v21, sel_initInternal);
  if (!v10)
    goto LABEL_6;
  v11 = objc_msgSend(v8, "copy");
  v12 = (void *)v10[7];
  v10[7] = v11;

  v13 = objc_msgSend(v9, "copy");
  v14 = (void *)v10[8];
  v10[8] = v13;

  v10[5] = 1;
  v10[6] = 2;
  if (!v9)
  {
    v15 = -[NIRegionPredicate initWithName:devicePresencePreset:]([NIRegionPredicate alloc], "initWithName:devicePresencePreset:", CFSTR("default-max-sensor-region"), 5);
    v16 = (void *)v10[8];
    v10[8] = v15;

  }
  v22[0] = v10[7];
  v22[1] = v10[8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v10[9];
  v10[9] = v17;

  if (+[NIDevicePresenceConfiguration _validateRegionPredicates:outer:](NIDevicePresenceConfiguration, "_validateRegionPredicates:outer:", v10[7], v10[8]))
  {
    *((_BYTE *)v10 + 32) = 0;
LABEL_6:
    v19 = v10;
    goto LABEL_10;
  }
  if (a5)
  {
    NIInternalErrorWithCodeAndUserInfo(-10013, 0);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_10:

  return v19;
}

- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 monitoringOption:(unint64_t)a5 allowedDevices:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  NIDevicePresenceConfiguration *v14;

  v12 = a3;
  v13 = a4;
  v14 = (NIDevicePresenceConfiguration *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInnerBoundary:outerBoundary:error:", v12, v13, a7);

  if (v14)
  {
    v14->_allowedDevices = a6;
    v14->_monitoringOption = a5;
  }

  return v14;
}

- (NIDevicePresenceConfiguration)initWithDiscoveryToken:(id)a3 regions:(id)a4 preferredUpdateRate:(int64_t)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NIDevicePresenceConfiguration *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *monitoredRegions;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NIDevicePresenceConfiguration *)objc_msgSend(v13, "initWithInnerBoundary:outerBoundary:error:", v14, v15, a6);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_token, a3);
    v16->_allowedDevices = 2;
    v16->_monitoringOption = 1;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v12;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20++), "setPreferredUpdateRate:", a5, (_QWORD)v24);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v18);
    }

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v17, 1);
    monitoredRegions = v16->_monitoredRegions;
    v16->_monitoredRegions = (NSArray *)v21;

  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NIDevicePresenceConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v15, sel_copyWithZone_);
  objc_msgSend(v5, "setAllowedDevices:", self->_allowedDevices);
  objc_msgSend(v5, "setMonitoringOption:", self->_monitoringOption);
  objc_msgSend(v5, "setCameraAssistanceEnabled:", self->_cameraAssistanceEnabled);
  v6 = -[NIRegionPredicate copyWithZone:](self->_innerBoundary, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NIRegionPredicate copyWithZone:](self->_outerBoundary, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  v10 = -[NSArray copyWithZone:](self->_monitoredRegions, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  v12 = -[NIDiscoveryToken copyWithZone:](self->_token, "copyWithZone:", a3);
  v13 = (void *)v5[10];
  v5[10] = v12;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIDevicePresenceConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_innerBoundary, CFSTR("innerboundary"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outerBoundary, CFSTR("outerboundary"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_monitoredRegions, CFSTR("monitoredRegions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_token, CFSTR("token"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_allowedDevices, CFSTR("allowedDevices"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_monitoringOption, CFSTR("monitoringOption"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceEnabled, CFSTR("cameraAssistanceEnabled"));

}

- (NIDevicePresenceConfiguration)initWithCoder:(id)a3
{
  id v4;
  NIDevicePresenceConfiguration *v5;
  uint64_t v6;
  NSArray *monitoredRegions;
  uint64_t v8;
  NIRegionPredicate *innerBoundary;
  uint64_t v10;
  NIRegionPredicate *outerBoundary;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NIDiscoveryToken *token;
  NIDevicePresenceConfiguration *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NIDevicePresenceConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("monitoredRegions"));
  v6 = objc_claimAutoreleasedReturnValue();
  monitoredRegions = v5->_monitoredRegions;
  v5->_monitoredRegions = (NSArray *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("innerboundary"));
  v8 = objc_claimAutoreleasedReturnValue();
  innerBoundary = v5->_innerBoundary;
  v5->_innerBoundary = (NIRegionPredicate *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outerboundary"));
  v10 = objc_claimAutoreleasedReturnValue();
  outerBoundary = v5->_outerBoundary;
  v5->_outerBoundary = (NIRegionPredicate *)v10;

  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("allowedDevices"));
  if (!+[NIUtils isIntValidRelationshipSpecifier:](NIUtils, "isIntValidRelationshipSpecifier:", v12))
    goto LABEL_5;
  v5->_allowedDevices = v12;
  v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("monitoringOption"));
  if ((unint64_t)(v13 - 1) < 3)
  {
    v5->_monitoringOption = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v14 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NIDiscoveryToken *)v14;

    v5->_cameraAssistanceEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceEnabled"));
    v16 = v5;
  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIDevicePresenceConfiguration *v5;
  NIDevicePresenceConfiguration *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  int v15;
  uint64_t v16;
  unint64_t monitoringOption;
  NIDiscoveryToken *v18;
  _BOOL4 v19;
  NIDiscoveryToken *token;
  int v23;
  uint64_t v24;
  unint64_t allowedDevices;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIDevicePresenceConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v13 = 1;
    }
    else
    {
      -[NIDevicePresenceConfiguration innerBoundary](v5, "innerBoundary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", self->_innerBoundary);

      -[NIDevicePresenceConfiguration outerBoundary](v6, "outerBoundary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", self->_outerBoundary);

      -[NIDevicePresenceConfiguration outerBoundary](v6, "outerBoundary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = 0;
      else
        v12 = self->_outerBoundary == 0;

      -[NIDevicePresenceConfiguration monitoredRegions](v6, "monitoredRegions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToArray:", self->_monitoredRegions);

      v16 = -[NIDevicePresenceConfiguration allowedDevices](v6, "allowedDevices");
      v23 = v15;
      allowedDevices = self->_allowedDevices;
      v24 = -[NIDevicePresenceConfiguration monitoringOption](v6, "monitoringOption");
      monitoringOption = self->_monitoringOption;
      -[NIDevicePresenceConfiguration token](v6, "token");
      v18 = (NIDiscoveryToken *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = v8;
      token = self->_token;

      v19 = -[NIDevicePresenceConfiguration isCameraAssistanceEnabled](v6, "isCameraAssistanceEnabled");
      v13 = 0;
      if ((v14 & (v10 | v12)) == 1
        && v16 == allowedDevices
        && v24 == monitoringOption
        && ((v23 ^ 1) & 1) == 0)
      {
        v13 = v18 == token && self->_cameraAssistanceEnabled == v19;
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NIRegionPredicate hash](self->_innerBoundary, "hash");
  v4 = -[NIRegionPredicate hash](self->_outerBoundary, "hash") ^ v3;
  v5 = self->_allowedDevices ^ self->_monitoringOption;
  v6 = v4 ^ v5 ^ -[NIDiscoveryToken hash](self->_token, "hash");
  return v6 ^ -[NSArray hash](self->_monitoredRegions, "hash") ^ self->_cameraAssistanceEnabled;
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
  -[NIDevicePresenceConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  void *v3;
  NIRegionPredicate *innerBoundary;
  NIRegionPredicate *outerBoundary;
  const char *v6;
  const char *v7;
  const char *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  innerBoundary = self->_innerBoundary;
  outerBoundary = self->_outerBoundary;
  v6 = +[NIUtils NIRelationshipSpecifierToString:](NIUtils, "NIRelationshipSpecifierToString:", self->_allowedDevices);
  v7 = +[NIDevicePresenceConfiguration _NIDevicePresenceMonitoringOptionToString:](NIDevicePresenceConfiguration, "_NIDevicePresenceMonitoringOptionToString:", self->_monitoringOption);
  if (self->_cameraAssistanceEnabled)
    v8 = "Yes";
  else
    v8 = "No";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<innerboundary: %@, outerboundary: %@, allowedDevices: %s, monitoringOption: %s>, isCameraAssistanceEnabled: %s"), innerBoundary, outerBoundary, v6, v7, v8);
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

+ (BOOL)_validateRegionPredicates:(id)a3 outer:(id)a4
{
  id v5;
  id v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  if (+[NIDevicePresenceConfiguration _validateRegionIsPreset:](NIDevicePresenceConfiguration, "_validateRegionIsPreset:", v5)&& +[NIDevicePresenceConfiguration _validateRegionIsPreset:](NIDevicePresenceConfiguration, "_validateRegionIsPreset:", v6))
  {
    +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:](NIDevicePresenceConfiguration, "_radiusFromDevicePresencePreset:", objc_msgSend(v6, "devicePresencePreset"));
    v8 = v7;
    +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:](NIDevicePresenceConfiguration, "_radiusFromDevicePresencePreset:", objc_msgSend(v5, "devicePresencePreset"));
    v10 = v8 >= v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_validateRegionIsPreset:(id)a3
{
  return objc_msgSend(a3, "devicePresencePreset") != 0;
}

+ (float)_radiusFromDevicePresencePreset:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 3.4028e38;
  else
    return flt_1A036F008[a3 - 1];
}

+ (const)_NIDevicePresenceMonitoringOptionToString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return "N/A";
  else
    return off_1E4362AB8[a3 - 1];
}

- (unint64_t)monitoringOption
{
  return self->_monitoringOption;
}

- (void)setMonitoringOption:(unint64_t)a3
{
  self->_monitoringOption = a3;
}

- (unint64_t)allowedDevices
{
  return self->_allowedDevices;
}

- (void)setAllowedDevices:(unint64_t)a3
{
  self->_allowedDevices = a3;
}

- (NIRegionPredicate)innerBoundary
{
  return (NIRegionPredicate *)objc_getProperty(self, a2, 56, 1);
}

- (NIRegionPredicate)outerBoundary
{
  return (NIRegionPredicate *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)monitoredRegions
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NIDiscoveryToken)token
{
  return (NIDiscoveryToken *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_cameraAssistanceEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_outerBoundary, 0);
  objc_storeStrong((id *)&self->_innerBoundary, 0);
}

@end
