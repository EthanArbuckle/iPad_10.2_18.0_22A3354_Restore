@implementation ASDSoftwareUpdate

- (ASDSoftwareUpdate)initWithUpdateDictionary:(id)a3
{
  id v4;
  ASDSoftwareUpdate *v5;
  uint64_t v6;
  NSDictionary *rawUpdateDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSoftwareUpdate;
  v5 = -[ASDSoftwareUpdate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    rawUpdateDictionary = v5->_rawUpdateDictionary;
    v5->_rawUpdateDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSString)bundleIdentifier
{
  void *v3;
  void *v4;
  id v5;

  -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("bundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("bundle-id"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return (NSString *)v5;
}

- (NSString)buyParams
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("buyParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("offers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "valueForKey:", CFSTR("buyParams"));
        v4 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("action-params"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v7 = 0;
          }

          v4 = v7;
        }
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return (NSString *)v4;
}

- (NSNumber)externalVersionIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("externalId"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("offers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("version"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("externalId"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

LABEL_13:
          goto LABEL_14;
        }

      }
    }
    -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("versionId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v8;
      v4 = v3;
    }
    else
    {
      v4 = 0;
      v3 = v8;
    }
    goto LABEL_13;
  }
  v3 = v3;
  v4 = v3;
LABEL_14:

  return (NSNumber *)v4;
}

- (BOOL)isArcade
{
  void *v2;
  char v3;

  if (!self)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](self->_rawUpdateDictionary, "objectForKeyedSubscript:", CFSTR("isArcade"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)parentalControlsRank
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("contentRatingsBySystem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("appsApple"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("value"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = objc_msgSend(v4, "integerValue");
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)releaseDate
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 2);
  objc_msgSend(v3, "setTimeStyle:", 0);
  -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("releaseDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(v3, "dateFromString:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (int64_t)storeItemIdentifier
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSDictionary)updateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[3];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSDictionary mutableCopy](self->_rawUpdateDictionary, "mutableCopy");
  objc_msgSend(v3, "objectForKey:", CFSTR("offers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("buyParams"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("displayVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("externalId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_rawUpdateDictionary, "objectForKey:", CFSTR("fileSize"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v5 && v6 && v7 && v8)
    {
      v22[0] = CFSTR("assets");
      v19[0] = CFSTR("flavor");
      v19[1] = CFSTR("size");
      v20[0] = CFSTR("iosSoftware");
      v20[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v10;
      v23[1] = v5;
      v22[1] = CFSTR("buyParams");
      v22[2] = CFSTR("price");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v11;
      v22[3] = CFSTR("version");
      v17[0] = CFSTR("display");
      v17[1] = CFSTR("externalId");
      v18[0] = v6;
      v18[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[4] = CFSTR("type");
      v23[3] = v12;
      v23[4] = CFSTR("update");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("offers"));
    }

  }
  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDSoftwareUpdate *v5;
  uint64_t v6;
  NSArray *blockedBy;
  uint64_t v8;
  NSDate *installDate;
  uint64_t v10;
  NSDictionary *metrics;
  uint64_t v12;
  NSDictionary *rawUpdateDictionary;
  uint64_t v14;
  NSDate *timestamp;

  v5 = -[ASDSoftwareUpdate init](+[ASDSoftwareUpdate allocWithZone:](ASDSoftwareUpdate, "allocWithZone:"), "init");
  v5->_autoUpdateEnabled = self->_autoUpdateEnabled;
  v6 = -[NSArray copyWithZone:](self->_blockedBy, "copyWithZone:", a3);
  blockedBy = v5->_blockedBy;
  v5->_blockedBy = (NSArray *)v6;

  v5->_deviceFamilies = self->_deviceFamilies;
  v5->_downloaded = self->_downloaded;
  v8 = -[NSDate copyWithZone:](self->_installDate, "copyWithZone:", a3);
  installDate = v5->_installDate;
  v5->_installDate = (NSDate *)v8;

  v5->_iOSBinaryMacOSCompatible = self->_iOSBinaryMacOSCompatible;
  v10 = -[NSDictionary copyWithZone:](self->_metrics, "copyWithZone:", a3);
  metrics = v5->_metrics;
  v5->_metrics = (NSDictionary *)v10;

  v5->_packageType = self->_packageType;
  v5->_perDevice = self->_perDevice;
  v5->_profileValidated = self->_profileValidated;
  v12 = -[NSDictionary copyWithZone:](self->_rawUpdateDictionary, "copyWithZone:", a3);
  rawUpdateDictionary = v5->_rawUpdateDictionary;
  v5->_rawUpdateDictionary = (NSDictionary *)v12;

  v5->_rawUpdateState = self->_rawUpdateState;
  v14 = -[NSDate copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v14;

  v5->_updateState = self->_updateState;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate autoUpdateEnabled](self, "autoUpdateEnabled"), CFSTR("autoUpdateEnabled"));
  -[ASDSoftwareUpdate blockedBy](self, "blockedBy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("blockedBy"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDSoftwareUpdate deviceFamilies](self, "deviceFamilies"), CFSTR("deviceFamilies"));
  -[ASDSoftwareUpdate installDate](self, "installDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("installDate"));

  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate isIOSBinaryMacOSCompatible](self, "isIOSBinaryMacOSCompatible"), CFSTR("iOSBinaryMacOSCompatible"));
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate isDownloaded](self, "isDownloaded"), CFSTR("IsDownloaded"));
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate isPerDevice](self, "isPerDevice"), CFSTR("IsPerDevice"));
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate isProfileValidated](self, "isProfileValidated"), CFSTR("IsProfileValidated"));
  -[ASDSoftwareUpdate metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("metrics"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDSoftwareUpdate packageType](self, "packageType"), CFSTR("packageType"));
  -[ASDSoftwareUpdate rawUpdateDictionary](self, "rawUpdateDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("updateDictionary"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDSoftwareUpdate rawUpdateState](self, "rawUpdateState"), CFSTR("rawUpdateState"));
  -[ASDSoftwareUpdate timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("updateTimestamp"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDSoftwareUpdate updateState](self, "updateState"), CFSTR("updateState"));
}

- (ASDSoftwareUpdate)initWithCoder:(id)a3
{
  id v4;
  ASDSoftwareUpdate *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *blockedBy;
  uint64_t v11;
  NSDate *installDate;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *metrics;
  uint64_t v17;
  NSDate *timestamp;
  void *v19;
  uint64_t v20;
  NSDictionary *rawUpdateDictionary;
  objc_super v23;
  _QWORD v24[5];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDSoftwareUpdate;
  v5 = -[ASDSoftwareUpdate init](&v23, sel_init);
  if (v5)
  {
    v5->_autoUpdateEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoUpdateEnabled"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("blockedBy"));
    v9 = objc_claimAutoreleasedReturnValue();
    blockedBy = v5->_blockedBy;
    v5->_blockedBy = (NSArray *)v9;

    v5->_deviceFamilies = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceFamilies"));
    v5->_downloaded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsDownloaded"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    installDate = v5->_installDate;
    v5->_installDate = (NSDate *)v11;

    v5->_iOSBinaryMacOSCompatible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("iOSBinaryMacOSCompatible"));
    v5->_perDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsPerDevice"));
    v5->_profileValidated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsProfileValidated"));
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    v24[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("metrics"));
    v15 = objc_claimAutoreleasedReturnValue();
    metrics = v5->_metrics;
    v5->_metrics = (NSDictionary *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateTimestamp"));
    v17 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v17;

    v5->_packageType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("packageType"));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("updateDictionary"));
    v20 = objc_claimAutoreleasedReturnValue();
    rawUpdateDictionary = v5->_rawUpdateDictionary;
    v5->_rawUpdateDictionary = (NSDictionary *)v20;

    v5->_rawUpdateState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rawUpdateState"));
    v5->_updateState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateState"));

  }
  return v5;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  self->_autoUpdateEnabled = a3;
}

- (NSArray)blockedBy
{
  return self->_blockedBy;
}

- (void)setBlockedBy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)deviceFamilies
{
  return self->_deviceFamilies;
}

- (void)setDeviceFamilies:(int64_t)a3
{
  self->_deviceFamilies = a3;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isIOSBinaryMacOSCompatible
{
  return self->_iOSBinaryMacOSCompatible;
}

- (void)setIOSBinaryMacOSCompatible:(BOOL)a3
{
  self->_iOSBinaryMacOSCompatible = a3;
}

- (BOOL)isDownloaded
{
  return self->_downloaded;
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (int64_t)packageType
{
  return self->_packageType;
}

- (void)setPackageType:(int64_t)a3
{
  self->_packageType = a3;
}

- (BOOL)isPerDevice
{
  return self->_perDevice;
}

- (void)setPerDevice:(BOOL)a3
{
  self->_perDevice = a3;
}

- (BOOL)isProfileValidated
{
  return self->_profileValidated;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (NSDictionary)rawUpdateDictionary
{
  return self->_rawUpdateDictionary;
}

- (BOOL)requiresRosetta
{
  return self->_requiresRosetta;
}

- (BOOL)runsOnIntel
{
  return self->_runsOnIntel;
}

- (BOOL)runsOnAppleSilicon
{
  return self->_runsOnAppleSilicon;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)updateState
{
  return self->_updateState;
}

- (void)setUpdateState:(int64_t)a3
{
  self->_updateState = a3;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)rawUpdateState
{
  return self->_rawUpdateState;
}

- (void)setRawUpdateState:(int64_t)a3
{
  self->_rawUpdateState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_rawUpdateDictionary, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_blockedBy, 0);
}

@end
