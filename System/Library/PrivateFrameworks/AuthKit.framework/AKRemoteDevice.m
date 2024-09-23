@implementation AKRemoteDevice

- (AKRemoteDevice)initWithInfo:(id)a3
{
  id v4;
  AKRemoteDevice *v5;
  AKRemoteDevice *v6;

  v4 = a3;
  v5 = -[AKRemoteDevice init](self, "init");
  v6 = v5;
  if (v5)
    -[AKRemoteDevice _initWithInfo:](v5, "_initWithInfo:", v4);

  return v6;
}

- (void)_initWithInfo:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  id v7;
  NSString *v8;
  NSString *serialNumber;
  id v10;
  NSString *v11;
  NSString *buildNumber;
  id v13;
  NSString *v14;
  NSString *operatingSystemName;
  id v16;
  NSString *v17;
  NSString *operatingSystemVersion;
  id v19;
  NSString *v20;
  NSString *model;
  id v22;
  NSString *v23;
  NSString *machineId;
  id v25;
  NSString *v26;
  NSString *pushToken;
  void *v28;
  id v29;
  id v30;
  double v31;
  NSDate *v32;
  NSDate *lastUpdatedDate;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSString *v39;
  NSString *colorCode;
  id v41;
  NSString *v42;
  NSString *enclosureColorCode;
  id v44;
  NSString *v45;
  NSString *coverGlassColorCode;
  id v47;
  NSString *v48;
  NSString *housingColorCode;
  id v50;
  NSString *v51;
  NSString *backingColorCode;
  id v53;
  NSDictionary *v54;
  NSDictionary *additionalInfo;
  id v56;
  id v57;
  void *v58;
  double v59;
  NSDate *v60;
  NSDate *lastCacheUpdatedDate;
  id v62;
  id v63;
  NSString *v64;
  NSString *services;
  id v66;
  id v67;
  void *v68;
  double v69;
  NSDate *v70;
  NSDate *deletedDate;
  id v72;
  id v73;
  id v74;

  v74 = a3;
  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (NSString *)v4;
  else
    v5 = 0;

  name = self->_name;
  self->_name = v5;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("serialNumber"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = (NSString *)v7;
  else
    v8 = 0;

  serialNumber = self->_serialNumber;
  self->_serialNumber = v8;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("buildNumber"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = (NSString *)v10;
  else
    v11 = 0;

  buildNumber = self->_buildNumber;
  self->_buildNumber = v11;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("os"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = (NSString *)v13;
  else
    v14 = 0;

  operatingSystemName = self->_operatingSystemName;
  self->_operatingSystemName = v14;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("osVersion"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = (NSString *)v16;
  else
    v17 = 0;

  operatingSystemVersion = self->_operatingSystemVersion;
  self->_operatingSystemVersion = v17;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("model"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = (NSString *)v19;
  else
    v20 = 0;

  model = self->_model;
  self->_model = v20;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("mid"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = (NSString *)v22;
  else
    v23 = 0;

  machineId = self->_machineId;
  self->_machineId = v23;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("ptkn"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = (NSString *)v25;
  else
    v26 = 0;

  pushToken = self->_pushToken;
  self->_pushToken = v26;

  v28 = (void *)MEMORY[0x1E0C99D68];
  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("lastUpdatedDate"));
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v29;
  else
    v30 = 0;

  objc_msgSend(v30, "doubleValue");
  objc_msgSend(v28, "dateWithTimeIntervalSince1970:", v31 / 1000.0);
  v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdatedDate = self->_lastUpdatedDate;
  self->_lastUpdatedDate = v32;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("trusted"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = v34;
  else
    v35 = 0;

  self->_trusted = objc_msgSend(v35, "BOOLValue");
  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("circleStatus"));
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v37 = v36;
  else
    v37 = 0;

  self->_inCircle = objc_msgSend(v37, "BOOLValue");
  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("dc"));
  v38 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v39 = (NSString *)v38;
  else
    v39 = 0;

  colorCode = self->_colorCode;
  self->_colorCode = v39;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("dec"));
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v42 = (NSString *)v41;
  else
    v42 = 0;

  enclosureColorCode = self->_enclosureColorCode;
  self->_enclosureColorCode = v42;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("clcg"));
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v45 = (NSString *)v44;
  else
    v45 = 0;

  coverGlassColorCode = self->_coverGlassColorCode;
  self->_coverGlassColorCode = v45;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("clhs"));
  v47 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v48 = (NSString *)v47;
  else
    v48 = 0;

  housingColorCode = self->_housingColorCode;
  self->_housingColorCode = v48;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("clbg"));
  v50 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v51 = (NSString *)v50;
  else
    v51 = 0;

  backingColorCode = self->_backingColorCode;
  self->_backingColorCode = v51;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("additionalInfo"));
  v53 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v54 = (NSDictionary *)v53;
  else
    v54 = 0;

  additionalInfo = self->_additionalInfo;
  self->_additionalInfo = v54;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("lastCacheUpdatedDate"));
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v57 = v56;
  else
    v57 = 0;

  if (v57)
  {
    v58 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v57, "doubleValue");
    objc_msgSend(v58, "dateWithTimeIntervalSince1970:", v59 / 1000.0);
    v60 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastCacheUpdatedDate = self->_lastCacheUpdatedDate;
    self->_lastCacheUpdatedDate = v60;

  }
  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("services"));
  v62 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v63 = v62;
  else
    v63 = 0;

  objc_msgSend(v63, "stringByReplacingOccurrencesOfString:withString:", CFSTR("|"), CFSTR(","));
  v64 = (NSString *)objc_claimAutoreleasedReturnValue();
  services = self->_services;
  self->_services = v64;

  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("deletedDate"));
  v66 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v67 = v66;
  else
    v67 = 0;

  if (v67)
  {
    v68 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v67, "doubleValue");
    objc_msgSend(v68, "dateWithTimeIntervalSince1970:", v69 / 1000.0);
    v70 = (NSDate *)objc_claimAutoreleasedReturnValue();
    deletedDate = self->_deletedDate;
    self->_deletedDate = v70;

  }
  objc_opt_class();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("reason"));
  v72 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v73 = v72;
  else
    v73 = 0;

  self->_removalReason = objc_msgSend(v73, "integerValue");
}

- (void)setDeviceRestrictionState:(id)a3
{
  id v4;
  AKDeviceSafetyRestrictionState *v5;
  void *v6;
  uint64_t v7;
  AKDeviceSafetyRestrictionState *v8;
  AKDeviceSafetyRestrictionState *deviceRestrictionState;
  id v10;

  v4 = a3;
  v5 = [AKDeviceSafetyRestrictionState alloc];
  -[AKRemoteDevice machineId](self, "machineId");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AKRemoteDevice serialNumber](self, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "reason");

  v8 = -[AKDeviceSafetyRestrictionState initWithDeviceMID:serialNumber:restrictionReason:](v5, "initWithDeviceMID:serialNumber:restrictionReason:", v10, v6, v7);
  deviceRestrictionState = self->_deviceRestrictionState;
  self->_deviceRestrictionState = v8;

}

- (AKRemoteDevice)initWithCoder:(id)a3
{
  id v4;
  AKRemoteDevice *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *serialNumber;
  uint64_t v10;
  NSString *buildNumber;
  uint64_t v12;
  NSString *operatingSystemName;
  uint64_t v14;
  NSString *operatingSystemVersion;
  uint64_t v16;
  NSString *model;
  uint64_t v18;
  NSString *machineId;
  uint64_t v20;
  NSString *pushToken;
  uint64_t v22;
  NSDate *lastUpdatedDate;
  uint64_t v24;
  NSString *colorCode;
  uint64_t v26;
  NSString *enclosureColorCode;
  uint64_t v28;
  NSString *coverGlassColorCode;
  uint64_t v30;
  NSString *housingColorCode;
  uint64_t v32;
  NSString *backingColorCode;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSDictionary *additionalInfo;
  uint64_t v39;
  NSString *services;
  uint64_t v41;
  NSDate *lastCacheUpdatedDate;
  uint64_t v43;
  NSDate *deletedDate;
  uint64_t v45;
  AKDeviceSafetyRestrictionState *deviceRestrictionState;
  objc_super v48;
  _QWORD v49[5];

  v49[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)AKRemoteDevice;
  v5 = -[AKRemoteDevice init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_buildNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    buildNumber = v5->_buildNumber;
    v5->_buildNumber = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_operatingSystemName"));
    v12 = objc_claimAutoreleasedReturnValue();
    operatingSystemName = v5->_operatingSystemName;
    v5->_operatingSystemName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_operatingSystemVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    operatingSystemVersion = v5->_operatingSystemVersion;
    v5->_operatingSystemVersion = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_model"));
    v16 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_machineId"));
    v18 = objc_claimAutoreleasedReturnValue();
    machineId = v5->_machineId;
    v5->_machineId = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pushToken"));
    v20 = objc_claimAutoreleasedReturnValue();
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastUpdatedDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v22;

    v5->_trusted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_trusted"));
    v5->_inCircle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_inCircle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_colorCode"));
    v24 = objc_claimAutoreleasedReturnValue();
    colorCode = v5->_colorCode;
    v5->_colorCode = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_enclosureColorCode"));
    v26 = objc_claimAutoreleasedReturnValue();
    enclosureColorCode = v5->_enclosureColorCode;
    v5->_enclosureColorCode = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_coverGlassColorCode"));
    v28 = objc_claimAutoreleasedReturnValue();
    coverGlassColorCode = v5->_coverGlassColorCode;
    v5->_coverGlassColorCode = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_housingColorCode"));
    v30 = objc_claimAutoreleasedReturnValue();
    housingColorCode = v5->_housingColorCode;
    v5->_housingColorCode = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingColorCode"));
    v32 = objc_claimAutoreleasedReturnValue();
    backingColorCode = v5->_backingColorCode;
    v5->_backingColorCode = (NSString *)v32;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    v49[2] = objc_opt_class();
    v49[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("_additionalInfo"));
    v37 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_services"));
    v39 = objc_claimAutoreleasedReturnValue();
    services = v5->_services;
    v5->_services = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastCacheUpdatedDate"));
    v41 = objc_claimAutoreleasedReturnValue();
    lastCacheUpdatedDate = v5->_lastCacheUpdatedDate;
    v5->_lastCacheUpdatedDate = (NSDate *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deletedDate"));
    v43 = objc_claimAutoreleasedReturnValue();
    deletedDate = v5->_deletedDate;
    v5->_deletedDate = (NSDate *)v43;

    v5->_removalReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_removalReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceRestrictionState"));
    v45 = objc_claimAutoreleasedReturnValue();
    deviceRestrictionState = v5->_deviceRestrictionState;
    v5->_deviceRestrictionState = (AKDeviceSafetyRestrictionState *)v45;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("_serialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buildNumber, CFSTR("_buildNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operatingSystemName, CFSTR("_operatingSystemName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operatingSystemVersion, CFSTR("_operatingSystemVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("_model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_machineId, CFSTR("_machineId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushToken, CFSTR("_pushToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("_lastUpdatedDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_trusted, CFSTR("_trusted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_inCircle, CFSTR("_inCircle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_colorCode, CFSTR("_colorCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enclosureColorCode, CFSTR("_enclosureColorCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coverGlassColorCode, CFSTR("_coverGlassColorCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_housingColorCode, CFSTR("_housingColorCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backingColorCode, CFSTR("_backingColorCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalInfo, CFSTR("_additionalInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_services, CFSTR("_services"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastCacheUpdatedDate, CFSTR("_lastCacheUpdatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deletedDate, CFSTR("_deletedDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_removalReason, CFSTR("_removalReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceRestrictionState, CFSTR("_deviceRestrictionState"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> Name: %@, SN: %@, Build: %@, OS: %@, Version: %@, Model: %@, Timestamp: %@, Trusted: %d, Safety State' %@, Circle Status: %d, Color Code: %@, Additional Info %@, services: %@, lastCacheUpdatedDate: %@, deletedDate: %@, removalReason: %ld "), objc_opt_class(), self, self->_name, self->_serialNumber, self->_buildNumber, self->_operatingSystemName, self->_operatingSystemVersion, self->_model, self->_lastUpdatedDate, self->_trusted, self->_deviceRestrictionState, self->_inCircle, self->_colorCode, self->_additionalInfo, self->_services, self->_lastCacheUpdatedDate,
               self->_deletedDate,
               self->_removalReason);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (void)setBuildNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)operatingSystemName
{
  return self->_operatingSystemName;
}

- (void)setOperatingSystemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)operatingSystemVersion
{
  return self->_operatingSystemVersion;
}

- (void)setOperatingSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)enclosureColorCode
{
  return self->_enclosureColorCode;
}

- (void)setEnclosureColorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)coverGlassColorCode
{
  return self->_coverGlassColorCode;
}

- (void)setCoverGlassColorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)housingColorCode
{
  return self->_housingColorCode;
}

- (void)setHousingColorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)backingColorCode
{
  return self->_backingColorCode;
}

- (void)setBackingColorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)trusted
{
  return self->_trusted;
}

- (void)setTrusted:(BOOL)a3
{
  self->_trusted = a3;
}

- (BOOL)inCircle
{
  return self->_inCircle;
}

- (void)setInCircle:(BOOL)a3
{
  self->_inCircle = a3;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)machineId
{
  return self->_machineId;
}

- (void)setMachineId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDate)deletedDate
{
  return self->_deletedDate;
}

- (void)setDeletedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)removalReason
{
  return self->_removalReason;
}

- (void)setRemovalReason:(int64_t)a3
{
  self->_removalReason = a3;
}

- (AKDeviceSafetyRestrictionState)deviceRestrictionState
{
  return self->_deviceRestrictionState;
}

- (NSDate)lastCacheUpdatedDate
{
  return self->_lastCacheUpdatedDate;
}

- (void)setLastCacheUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCacheUpdatedDate, 0);
  objc_storeStrong((id *)&self->_deviceRestrictionState, 0);
  objc_storeStrong((id *)&self->_deletedDate, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_machineId, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_backingColorCode, 0);
  objc_storeStrong((id *)&self->_housingColorCode, 0);
  objc_storeStrong((id *)&self->_coverGlassColorCode, 0);
  objc_storeStrong((id *)&self->_enclosureColorCode, 0);
  objc_storeStrong((id *)&self->_colorCode, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_operatingSystemVersion, 0);
  objc_storeStrong((id *)&self->_operatingSystemName, 0);
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
