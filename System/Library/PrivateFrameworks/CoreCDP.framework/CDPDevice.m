@implementation CDPDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CDPDevice *v4;
  uint64_t v5;
  NSString *localizedName;
  uint64_t v7;
  NSString *model;
  uint64_t v9;
  NSString *modelVersion;
  uint64_t v11;
  NSString *modelClass;
  uint64_t v13;
  NSString *recordID;
  uint64_t v15;
  NSString *machineID;
  uint64_t v17;
  NSData *simplePublicKey;
  uint64_t v19;
  NSDictionary *recordInfo;
  uint64_t v21;
  OTEscrowRecord *record;
  uint64_t v23;
  NSDate *recordDate;
  uint64_t v25;
  NSNumber *numericSecretLength;
  uint64_t v27;
  NSString *serialNumber;

  v4 = objc_alloc_init(CDPDevice);
  v5 = -[NSString copy](self->_localizedName, "copy");
  localizedName = v4->_localizedName;
  v4->_localizedName = (NSString *)v5;

  v7 = -[NSString copy](self->_model, "copy");
  model = v4->_model;
  v4->_model = (NSString *)v7;

  v9 = -[NSString copy](self->_modelVersion, "copy");
  modelVersion = v4->_modelVersion;
  v4->_modelVersion = (NSString *)v9;

  v11 = -[NSString copy](self->_modelClass, "copy");
  modelClass = v4->_modelClass;
  v4->_modelClass = (NSString *)v11;

  v4->_platform = self->_platform;
  v13 = -[NSString copy](self->_recordID, "copy");
  recordID = v4->_recordID;
  v4->_recordID = (NSString *)v13;

  v15 = -[NSString copy](self->_machineID, "copy");
  machineID = v4->_machineID;
  v4->_machineID = (NSString *)v15;

  v17 = -[NSData copy](self->_simplePublicKey, "copy");
  simplePublicKey = v4->_simplePublicKey;
  v4->_simplePublicKey = (NSData *)v17;

  v19 = -[NSDictionary copy](self->_recordInfo, "copy");
  recordInfo = v4->_recordInfo;
  v4->_recordInfo = (NSDictionary *)v19;

  v21 = -[OTEscrowRecord copy](self->_record, "copy");
  record = v4->_record;
  v4->_record = (OTEscrowRecord *)v21;

  v23 = -[NSDate copy](self->_recordDate, "copy");
  recordDate = v4->_recordDate;
  v4->_recordDate = (NSDate *)v23;

  v4->_hasRandomSecret = self->_hasRandomSecret;
  v4->_hasNumericSecret = self->_hasNumericSecret;
  v25 = -[NSNumber copy](self->_numericSecretLength, "copy");
  numericSecretLength = v4->_numericSecretLength;
  v4->_numericSecretLength = (NSNumber *)v25;

  v4->_isUsingMultipleiCSC = self->_isUsingMultipleiCSC;
  v4->_remainingAttempts = self->_remainingAttempts;
  v27 = -[NSString copy](self->_serialNumber, "copy");
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v27;

  v4->_isCurrentDevice = self->_isCurrentDevice;
  objc_storeStrong((id *)&v4->_deviceColor, self->_deviceColor);
  objc_storeStrong((id *)&v4->_enclosureColor, self->_enclosureColor);
  return v4;
}

- (NSString)description
{
  unint64_t platform;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *recordID;
  NSString *model;
  NSString *localizedName;
  void *v12;
  NSDate *recordDate;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  void *v19;

  platform = self->_platform;
  v4 = CFSTR("Unknown");
  if (platform == 2)
    v4 = CFSTR("OSX");
  if (platform == 1)
    v5 = CFSTR("iOS");
  else
    v5 = v4;
  v18 = v5;
  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_machineID != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_simplePublicKey != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  recordID = self->_recordID;
  localizedName = self->_localizedName;
  model = self->_model;
  v12 = (void *)MEMORY[0x24BDD16E0];
  recordDate = self->_recordDate;
  -[NSDictionary objectForKeyedSubscript:](self->_recordInfo, "objectForKeyedSubscript:", CFSTR("encodedMetadata"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", v14 != 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p - hasMID=%@ isBottled=%@ recordID=%@ name=%@ model=%@ platform=%@ date=%@ encodedMetadata=%@>"), v6, self, v7, v8, recordID, localizedName, model, v18, recordDate, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (CDPDevice)initWithCoder:(id)a3
{
  id v4;
  CDPDevice *v5;
  uint64_t v6;
  NSString *localizedName;
  uint64_t v8;
  NSString *model;
  uint64_t v10;
  NSString *modelVersion;
  uint64_t v12;
  NSString *modelClass;
  uint64_t v14;
  NSString *recordID;
  uint64_t v16;
  NSString *machineID;
  uint64_t v18;
  NSDate *recordDate;
  uint64_t v20;
  NSNumber *numericSecretLength;
  uint64_t v22;
  NSString *serialNumber;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSDictionary *recordInfo;
  uint64_t v33;
  NSString *deviceColor;
  uint64_t v35;
  NSString *enclosureColor;

  v4 = a3;
  v5 = -[CDPDevice init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizedName"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_model"));
    v8 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modelVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    modelVersion = v5->_modelVersion;
    v5->_modelVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modelClass"));
    v12 = objc_claimAutoreleasedReturnValue();
    modelClass = v5->_modelClass;
    v5->_modelClass = (NSString *)v12;

    v5->_platform = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_platform"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordID"));
    v14 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_machineID"));
    v16 = objc_claimAutoreleasedReturnValue();
    machineID = v5->_machineID;
    v5->_machineID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    recordDate = v5->_recordDate;
    v5->_recordDate = (NSDate *)v18;

    v5->_hasRandomSecret = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasRandomSecret"));
    v5->_hasNumericSecret = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasNumericSecret"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_numericSecretLength"));
    v20 = objc_claimAutoreleasedReturnValue();
    numericSecretLength = v5->_numericSecretLength;
    v5->_numericSecretLength = (NSNumber *)v20;

    v5->_isUsingMultipleiCSC = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isUsingMultipleiCSC"));
    v5->_remainingAttempts = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_remainingAttempts"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serialNumber"));
    v22 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v22;

    v5->_isCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCurrentDevice"));
    v24 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("recordInfo"));
    v31 = objc_claimAutoreleasedReturnValue();
    recordInfo = v5->_recordInfo;
    v5->_recordInfo = (NSDictionary *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceColor"));
    v33 = objc_claimAutoreleasedReturnValue();
    deviceColor = v5->_deviceColor;
    v5->_deviceColor = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_enclosureColor"));
    v35 = objc_claimAutoreleasedReturnValue();
    enclosureColor = v5->_enclosureColor;
    v5->_enclosureColor = (NSString *)v35;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedName;
  id v5;

  localizedName = self->_localizedName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedName, CFSTR("_localizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("_model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelVersion, CFSTR("_modelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelClass, CFSTR("_modelClass"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_platform, CFSTR("_platform"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordID, CFSTR("_recordID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_machineID, CFSTR("_machineID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordDate, CFSTR("_recordDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasRandomSecret, CFSTR("_hasRandomSecret"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasNumericSecret, CFSTR("_hasNumericSecret"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numericSecretLength, CFSTR("_numericSecretLength"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUsingMultipleiCSC, CFSTR("_isUsingMultipleiCSC"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_remainingAttempts, CFSTR("_remainingAttempts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("_serialNumber"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCurrentDevice, CFSTR("_isCurrentDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordInfo, CFSTR("recordInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceColor, CFSTR("_deviceColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enclosureColor, CFSTR("_enclosureColor"));

}

- (unint64_t)localSecretType
{
  unint64_t platform;

  platform = self->_platform;
  if (platform == 1)
    return 1;
  else
    return 2 * (platform == 2);
}

- (BOOL)isVirtualMachine
{
  return +[CDPUtilities isVirtualMachine](CDPUtilities, "isVirtualMachine");
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)modelClass
{
  return self->_modelClass;
}

- (void)setModelClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)machineID
{
  return self->_machineID;
}

- (void)setMachineID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)recordDate
{
  return self->_recordDate;
}

- (void)setRecordDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)hasRandomSecret
{
  return self->_hasRandomSecret;
}

- (void)setHasRandomSecret:(BOOL)a3
{
  self->_hasRandomSecret = a3;
}

- (BOOL)hasNumericSecret
{
  return self->_hasNumericSecret;
}

- (void)setHasNumericSecret:(BOOL)a3
{
  self->_hasNumericSecret = a3;
}

- (NSNumber)numericSecretLength
{
  return self->_numericSecretLength;
}

- (void)setNumericSecretLength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isUsingMultipleiCSC
{
  return self->_isUsingMultipleiCSC;
}

- (void)setIsUsingMultipleiCSC:(BOOL)a3
{
  self->_isUsingMultipleiCSC = a3;
}

- (unint64_t)remainingAttempts
{
  return self->_remainingAttempts;
}

- (void)setRemainingAttempts:(unint64_t)a3
{
  self->_remainingAttempts = a3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isCurrentDevice
{
  return self->_isCurrentDevice;
}

- (void)setIsCurrentDevice:(BOOL)a3
{
  self->_isCurrentDevice = a3;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)enclosureColor
{
  return self->_enclosureColor;
}

- (void)setEnclosureColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)recoveryStatus
{
  return self->_recoveryStatus;
}

- (void)setRecoveryStatus:(unint64_t)a3
{
  self->_recoveryStatus = a3;
}

- (NSNumber)coolOffPeriod
{
  return self->_coolOffPeriod;
}

- (void)setCoolOffPeriod:(id)a3
{
  objc_storeStrong((id *)&self->_coolOffPeriod, a3);
}

- (NSDictionary)recordInfo
{
  return self->_recordInfo;
}

- (void)setRecordInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OTEscrowRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)simplePublicKey
{
  return self->_simplePublicKey;
}

- (void)setSimplePublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coolOffPeriod, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_numericSecretLength, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordInfo, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);
  objc_storeStrong((id *)&self->_simplePublicKey, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
