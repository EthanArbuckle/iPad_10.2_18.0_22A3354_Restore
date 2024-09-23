@implementation NFHardwareSecureElementInfo

- (NSString)serialNumber
{
  return (NSString *)-[NSData NF_asHexString](self->_serialNumberAsData, "NF_asHexString");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFHardwareSecureElementInfo)initWithCoder:(id)a3
{
  id v4;
  NFHardwareSecureElementInfo *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSNumber *compiledFWVersion;
  uint64_t v10;
  NSNumber *sequenceCounter;
  uint64_t v12;
  NSNumber *referenceCounter;
  uint64_t v14;
  NSNumber *otherOSValid;
  uint64_t v16;
  NSNumber *migrationPackages;
  uint64_t v18;
  NSNumber *migrationInstances;
  uint64_t v20;
  NSString *platformIdentifier;
  uint64_t v22;
  NSData *serialNumberAsData;
  uint64_t v24;
  NSData *systemOSSerialNumberAsData;
  uint64_t v26;
  NSData *rsaCertificateAsData;
  uint64_t v28;
  NSData *ecdsaCertificateAsData;
  uint64_t v30;
  NSData *eckaCertificateAsData;
  uint64_t v32;
  NSNumber *persistentConfigID;
  uint64_t v34;
  NSData *manifestQuery;
  uint64_t v36;
  NSString *atrString;
  uint64_t v38;
  NSArray *bootHistory;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NFHardwareSecureElementInfo;
  v5 = -[NFHardwareSecureElementInfo init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_OSVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OSVersion"));
    v5->_fullOSVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fullOSVersion"));
    v5->_firmwareVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("firmwareVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compiledFWVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    compiledFWVersion = v5->_compiledFWVersion;
    v5->_compiledFWVersion = (NSNumber *)v8;

    v5->_hardwareVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hardwareVersion"));
    v5->_deviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sequenceCounter"));
    v10 = objc_claimAutoreleasedReturnValue();
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceCounter"));
    v12 = objc_claimAutoreleasedReturnValue();
    referenceCounter = v5->_referenceCounter;
    v5->_referenceCounter = (NSNumber *)v12;

    v5->_osid = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("osid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherOSValid"));
    v14 = objc_claimAutoreleasedReturnValue();
    otherOSValid = v5->_otherOSValid;
    v5->_otherOSValid = (NSNumber *)v14;

    v5->_restrictedMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictedMode"));
    v5->_osUpdateMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("osUpdateMode"));
    v5->_OSMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OSMode"));
    v5->_signingKeyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("signingKeyType"));
    v5->_migrationState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("migrationState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("migrationPackages"));
    v16 = objc_claimAutoreleasedReturnValue();
    migrationPackages = v5->_migrationPackages;
    v5->_migrationPackages = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("migrationInstances"));
    v18 = objc_claimAutoreleasedReturnValue();
    migrationInstances = v5->_migrationInstances;
    v5->_migrationInstances = (NSNumber *)v18;

    v5->_migrationContext = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("migrationContext"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    platformIdentifier = v5->_platformIdentifier;
    v5->_platformIdentifier = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v22 = objc_claimAutoreleasedReturnValue();
    serialNumberAsData = v5->_serialNumberAsData;
    v5->_serialNumberAsData = (NSData *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemOSSerialNumber"));
    v24 = objc_claimAutoreleasedReturnValue();
    systemOSSerialNumberAsData = v5->_systemOSSerialNumberAsData;
    v5->_systemOSSerialNumberAsData = (NSData *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rsaCertificate"));
    v26 = objc_claimAutoreleasedReturnValue();
    rsaCertificateAsData = v5->_rsaCertificateAsData;
    v5->_rsaCertificateAsData = (NSData *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ecdsaCertificate"));
    v28 = objc_claimAutoreleasedReturnValue();
    ecdsaCertificateAsData = v5->_ecdsaCertificateAsData;
    v5->_ecdsaCertificateAsData = (NSData *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eckaCertificate"));
    v30 = objc_claimAutoreleasedReturnValue();
    eckaCertificateAsData = v5->_eckaCertificateAsData;
    v5->_eckaCertificateAsData = (NSData *)v30;

    v5->_appletMap = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("appletMap"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentConfigID"));
    v32 = objc_claimAutoreleasedReturnValue();
    persistentConfigID = v5->_persistentConfigID;
    v5->_persistentConfigID = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifestQuery"));
    v34 = objc_claimAutoreleasedReturnValue();
    manifestQuery = v5->_manifestQuery;
    v5->_manifestQuery = (NSData *)v34;

    v5->_personalisable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("personalisable"));
    v5->_supportedTechnologies = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedTechnologies"));
    v5->_seType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("seType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("atrString"));
    v36 = objc_claimAutoreleasedReturnValue();
    atrString = v5->_atrString;
    v5->_atrString = (NSString *)v36;

    v5->_jcopTooOld = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("jcopTooOld"));
    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("bootHistory"));
    v38 = objc_claimAutoreleasedReturnValue();
    bootHistory = v5->_bootHistory;
    v5->_bootHistory = (NSArray *)v38;

  }
  return v5;
}

- (BOOL)jcopTooOld
{
  return self->_jcopTooOld;
}

- (unint64_t)OSMode
{
  return self->_OSMode;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)rsaCertificate
{
  return (NSString *)-[NSData NF_asHexString](self->_rsaCertificateAsData, "NF_asHexString");
}

- (NSString)ecdsaCertificate
{
  return (NSString *)-[NSData NF_asHexString](self->_ecdsaCertificateAsData, "NF_asHexString");
}

- (NSString)eckaCertificate
{
  return (NSString *)-[NSData NF_asHexString](self->_eckaCertificateAsData, "NF_asHexString");
}

- (NSString)systemOSSerialNumber
{
  return (NSString *)-[NSData NF_asHexString](self->_systemOSSerialNumberAsData, "NF_asHexString");
}

- (NFHardwareSecureElementInfo)initWithDictionary:(id)a3
{
  id v4;
  NFHardwareSecureElementInfo *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSNumber *compiledFWVersion;
  void *v13;
  void *v14;
  uint64_t v15;
  NSNumber *sequenceCounter;
  uint64_t v17;
  NSNumber *referenceCounter;
  void *v19;
  uint64_t v20;
  NSNumber *otherOSValid;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSNumber *migrationPackages;
  uint64_t v29;
  NSNumber *migrationInstances;
  void *v31;
  uint64_t v32;
  NSString *platformIdentifier;
  uint64_t v34;
  NSData *serialNumberAsData;
  uint64_t v36;
  NSData *systemOSSerialNumberAsData;
  uint64_t v38;
  NSData *rsaCertificateAsData;
  uint64_t v40;
  NSData *ecdsaCertificateAsData;
  uint64_t v42;
  NSData *eckaCertificateAsData;
  void *v44;
  uint64_t v45;
  NSNumber *persistentConfigID;
  uint64_t v47;
  NSData *manifestQuery;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSString *atrString;
  void *v54;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)NFHardwareSecureElementInfo;
  v5 = -[NFHardwareSecureElementInfo init](&v56, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OSVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_OSVersion = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullOSVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fullOSVersion = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firmwareVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_firmwareVersion = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compiledFWVersion"));
    v11 = objc_claimAutoreleasedReturnValue();
    compiledFWVersion = v5->_compiledFWVersion;
    v5->_compiledFWVersion = (NSNumber *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hardwareVersion = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceType = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequenceCounter"));
    v15 = objc_claimAutoreleasedReturnValue();
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referenceCounter"));
    v17 = objc_claimAutoreleasedReturnValue();
    referenceCounter = v5->_referenceCounter;
    v5->_referenceCounter = (NSNumber *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_osid = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("otherOSValid"));
    v20 = objc_claimAutoreleasedReturnValue();
    otherOSValid = v5->_otherOSValid;
    v5->_otherOSValid = (NSNumber *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("restrictedMode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_restrictedMode = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osUpdateMode"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_osUpdateMode = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OSMode"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_OSMode = objc_msgSend(v24, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signingKeyType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_signingKeyType = objc_msgSend(v25, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("migrationState"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_migrationState = objc_msgSend(v26, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("migrationPackages"));
    v27 = objc_claimAutoreleasedReturnValue();
    migrationPackages = v5->_migrationPackages;
    v5->_migrationPackages = (NSNumber *)v27;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("migrationInstances"));
    v29 = objc_claimAutoreleasedReturnValue();
    migrationInstances = v5->_migrationInstances;
    v5->_migrationInstances = (NSNumber *)v29;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("migrationContext"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_migrationContext = objc_msgSend(v31, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platformIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    platformIdentifier = v5->_platformIdentifier;
    v5->_platformIdentifier = (NSString *)v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serialNumber"));
    v34 = objc_claimAutoreleasedReturnValue();
    serialNumberAsData = v5->_serialNumberAsData;
    v5->_serialNumberAsData = (NSData *)v34;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemOSSerialNumber"));
    v36 = objc_claimAutoreleasedReturnValue();
    systemOSSerialNumberAsData = v5->_systemOSSerialNumberAsData;
    v5->_systemOSSerialNumberAsData = (NSData *)v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rsaCertificate"));
    v38 = objc_claimAutoreleasedReturnValue();
    rsaCertificateAsData = v5->_rsaCertificateAsData;
    v5->_rsaCertificateAsData = (NSData *)v38;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ecdsaCertificate"));
    v40 = objc_claimAutoreleasedReturnValue();
    ecdsaCertificateAsData = v5->_ecdsaCertificateAsData;
    v5->_ecdsaCertificateAsData = (NSData *)v40;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eckaCertificate"));
    v42 = objc_claimAutoreleasedReturnValue();
    eckaCertificateAsData = v5->_eckaCertificateAsData;
    v5->_eckaCertificateAsData = (NSData *)v42;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appletMap"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_appletMap = objc_msgSend(v44, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("persistentConfigID"));
    v45 = objc_claimAutoreleasedReturnValue();
    persistentConfigID = v5->_persistentConfigID;
    v5->_persistentConfigID = (NSNumber *)v45;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manifestQuery"));
    v47 = objc_claimAutoreleasedReturnValue();
    manifestQuery = v5->_manifestQuery;
    v5->_manifestQuery = (NSData *)v47;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalisable"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_personalisable = objc_msgSend(v49, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportedTechnologies"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportedTechnologies = objc_msgSend(v50, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seType"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_seType = objc_msgSend(v51, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("atrString"));
    v52 = objc_claimAutoreleasedReturnValue();
    atrString = v5->_atrString;
    v5->_atrString = (NSString *)v52;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jcopTooOld"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_jcopTooOld = objc_msgSend(v54, "BOOLValue");

  }
  return v5;
}

- (void)_setIsInRestrictedMode:(BOOL)a3
{
  self->_restrictedMode = a3;
}

- (void)_setIsInRestrictedPerformanceMode:(BOOL)a3
{
  self->_restrictedPerformanceMode = a3;
}

- (void)setBootHistory:(id)a3
{
  objc_storeStrong((id *)&self->_bootHistory, a3);
}

- (NSNumber)expectedSequenceCounter
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  int v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSNumber *v18;
  BOOL v19;
  NSNumber *v20;
  const void **v21;
  uint64_t Logger;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  void *v35;
  NSNumber *v36;
  NSNumber *v37;
  NSNumber *v38;
  NSNumber *v39;
  NSNumber *v40;
  NSNumber *v41;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE78E8], "TLVWithData:", self->_manifestQuery);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childWithTag:", 65343);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childWithTag:", 135);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = -[NFHardwareSecureElementInfo signingKeyType](self, "signingKeyType");
    if (-[NFHardwareSecureElementInfo seType](self, "seType") == 6
      && -[NFHardwareSecureElementInfo deviceType](self, "deviceType") == 56)
    {
      -[NFHardwareSecureElementInfo persistentConfigID](self, "persistentConfigID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntValue");

      if (HIBYTE(v11) == 80)
        v9 = 1;
    }
    objc_msgSend(v6, "value");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = *(unsigned __int8 *)objc_msgSend(v12, "bytes");
    v14 = (NSNumber *)&unk_1E3B690C0;
    if (v9 == 2)
    {
      v15 = (NSNumber *)&unk_1E3B690C0;
      if (v13 != 210)
        v15 = 0;
      if (v13 != 200)
        v14 = v15;
      v16 = (NSNumber *)&unk_1E3B690C0;
      v17 = (NSNumber *)&unk_1E3B690D8;
      if (v13 != 115)
        v17 = 0;
      if (v13 != 100)
        v16 = v17;
      if (v13 <= 199)
        v14 = v16;
      v18 = (NSNumber *)&unk_1E3B69090;
      v19 = v13 == 56;
      v20 = (NSNumber *)&unk_1E3B690A8;
    }
    else
    {
      v37 = (NSNumber *)&unk_1E3B690C0;
      if (v13 != 210)
        v37 = 0;
      if (v13 != 200)
        v14 = v37;
      v38 = (NSNumber *)&unk_1E3B690C0;
      v39 = (NSNumber *)&unk_1E3B690D8;
      if (v13 != 115)
        v39 = 0;
      if (v13 != 100)
        v38 = v39;
      if (v13 <= 199)
        v14 = v38;
      v18 = (NSNumber *)&unk_1E3B69090;
      v19 = v13 == 56;
      v20 = (NSNumber *)&unk_1E3B690F0;
    }
    if (!v19)
      v20 = 0;
    if (v13 != 55)
      v18 = v20;
    v40 = (NSNumber *)&unk_1E3B69078;
    v41 = (NSNumber *)&unk_1E3B69090;
    if (v13 != 54)
      v41 = 0;
    if (v13 != 44)
      v40 = v41;
    if (v13 <= 54)
      v18 = v40;
    if (v13 <= 99)
      v36 = v18;
    else
      v36 = v14;

  }
  else
  {
    v21 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      -[NSData debugDescription](self->_manifestQuery, "debugDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 45;
      if (isMetaClass)
        v29 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i Invalid manifest query %@", v29, ClassName, Name, 116, v28);

    }
    dispatch_get_specific(*v21);
    NFSharedLogGetLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      -[NSData debugDescription](self->_manifestQuery, "debugDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v44 = v32;
      v45 = 2082;
      v46 = v33;
      v47 = 2082;
      v48 = v34;
      v49 = 1024;
      v50 = 116;
      v51 = 2112;
      v52 = v35;
      _os_log_impl(&dword_19B5EB000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid manifest query %@", buf, 0x2Cu);

    }
    v36 = 0;
  }

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *identifier;
  NSNumber *compiledFWVersion;
  NSNumber *sequenceCounter;
  NSNumber *referenceCounter;
  NSNumber *otherOSValid;
  NSNumber *migrationPackages;
  NSNumber *migrationInstances;
  NSString *platformIdentifier;
  NSData *serialNumberAsData;
  NSData *systemOSSerialNumberAsData;
  void *v15;
  NSData *rsaCertificateAsData;
  NSData *ecdsaCertificateAsData;
  NSData *eckaCertificateAsData;
  NSNumber *persistentConfigID;
  NSData *manifestQuery;
  NSString *atrString;
  NSArray *bootHistory;
  id v23;

  v4 = a3;
  identifier = self->_identifier;
  v23 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("identifier"));
    v4 = v23;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_OSVersion, CFSTR("OSVersion"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_fullOSVersion, CFSTR("fullOSVersion"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_firmwareVersion, CFSTR("firmwareVersion"));
  compiledFWVersion = self->_compiledFWVersion;
  if (compiledFWVersion)
    objc_msgSend(v23, "encodeObject:forKey:", compiledFWVersion, CFSTR("compiledFWVersion"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_hardwareVersion, CFSTR("hardwareVersion"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_deviceType, CFSTR("deviceType"));
  sequenceCounter = self->_sequenceCounter;
  if (sequenceCounter)
    objc_msgSend(v23, "encodeObject:forKey:", sequenceCounter, CFSTR("sequenceCounter"));
  referenceCounter = self->_referenceCounter;
  if (referenceCounter)
    objc_msgSend(v23, "encodeObject:forKey:", referenceCounter, CFSTR("referenceCounter"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_osid, CFSTR("osid"));
  otherOSValid = self->_otherOSValid;
  if (otherOSValid)
    objc_msgSend(v23, "encodeObject:forKey:", otherOSValid, CFSTR("otherOSValid"));
  objc_msgSend(v23, "encodeBool:forKey:", self->_restrictedMode, CFSTR("restrictedMode"));
  objc_msgSend(v23, "encodeBool:forKey:", self->_osUpdateMode, CFSTR("osUpdateMode"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_OSMode, CFSTR("OSMode"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_signingKeyType, CFSTR("signingKeyType"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_migrationState, CFSTR("migrationState"));
  migrationPackages = self->_migrationPackages;
  if (migrationPackages)
    objc_msgSend(v23, "encodeObject:forKey:", migrationPackages, CFSTR("migrationPackages"));
  migrationInstances = self->_migrationInstances;
  if (migrationInstances)
    objc_msgSend(v23, "encodeObject:forKey:", migrationInstances, CFSTR("migrationInstances"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_migrationContext, CFSTR("migrationContext"));
  platformIdentifier = self->_platformIdentifier;
  if (platformIdentifier)
    objc_msgSend(v23, "encodeObject:forKey:", platformIdentifier, CFSTR("platformIdentifier"));
  serialNumberAsData = self->_serialNumberAsData;
  if (serialNumberAsData)
    objc_msgSend(v23, "encodeObject:forKey:", serialNumberAsData, CFSTR("serialNumber"));
  systemOSSerialNumberAsData = self->_systemOSSerialNumberAsData;
  v15 = v23;
  if (systemOSSerialNumberAsData)
  {
    objc_msgSend(v23, "encodeObject:forKey:", systemOSSerialNumberAsData, CFSTR("systemOSSerialNumber"));
    v15 = v23;
  }
  rsaCertificateAsData = self->_rsaCertificateAsData;
  if (rsaCertificateAsData)
  {
    objc_msgSend(v23, "encodeObject:forKey:", rsaCertificateAsData, CFSTR("rsaCertificate"));
    v15 = v23;
  }
  ecdsaCertificateAsData = self->_ecdsaCertificateAsData;
  if (ecdsaCertificateAsData)
  {
    objc_msgSend(v23, "encodeObject:forKey:", ecdsaCertificateAsData, CFSTR("ecdsaCertificate"));
    v15 = v23;
  }
  eckaCertificateAsData = self->_eckaCertificateAsData;
  if (eckaCertificateAsData)
  {
    objc_msgSend(v23, "encodeObject:forKey:", eckaCertificateAsData, CFSTR("eckaCertificate"));
    v15 = v23;
  }
  objc_msgSend(v15, "encodeInteger:forKey:", self->_appletMap, CFSTR("appletMap"));
  persistentConfigID = self->_persistentConfigID;
  if (persistentConfigID)
    objc_msgSend(v23, "encodeObject:forKey:", persistentConfigID, CFSTR("persistentConfigID"));
  manifestQuery = self->_manifestQuery;
  if (manifestQuery)
    objc_msgSend(v23, "encodeObject:forKey:", manifestQuery, CFSTR("manifestQuery"));
  objc_msgSend(v23, "encodeBool:forKey:", self->_personalisable, CFSTR("personalisable"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_supportedTechnologies, CFSTR("supportedTechnologies"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_seType, CFSTR("seType"));
  atrString = self->_atrString;
  if (atrString)
    objc_msgSend(v23, "encodeObject:forKey:", atrString, CFSTR("atrString"));
  objc_msgSend(v23, "encodeBool:forKey:", self->_jcopTooOld, CFSTR("jcopTooOld"));
  bootHistory = self->_bootHistory;
  if (bootHistory)
    objc_msgSend(v23, "encodeObject:forKey:", bootHistory, CFSTR("bootHistory"));

}

- (id)asDictionary
{
  void *v3;
  void *v4;
  const __CFString *identifier;
  NSNumber *compiledFWVersion;
  NSNumber *sequenceCounter;
  NSNumber *referenceCounter;
  NSNumber *otherOSValid;
  NSNumber *migrationPackages;
  NSNumber *migrationInstances;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *platformIdentifier;
  NSData *serialNumberAsData;
  void *v26;
  NSData *systemOSSerialNumberAsData;
  void *v28;
  NSData *rsaCertificateAsData;
  void *v30;
  NSData *ecdsaCertificateAsData;
  void *v32;
  NSData *eckaCertificateAsData;
  void *v34;
  void *v35;
  NSNumber *persistentConfigID;
  void *v37;
  NSArray *bootHistory;
  void *v39;
  void *v40;
  const __CFString *atrString;
  void *v42;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self->_identifier)
    identifier = (const __CFString *)self->_identifier;
  else
    identifier = &stru_1E3B54F18;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  if (self->_compiledFWVersion)
    compiledFWVersion = self->_compiledFWVersion;
  else
    compiledFWVersion = (NSNumber *)&stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", compiledFWVersion, CFSTR("compiledFWVersion"));
  if (self->_sequenceCounter)
    sequenceCounter = self->_sequenceCounter;
  else
    sequenceCounter = (NSNumber *)&stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", sequenceCounter, CFSTR("sequenceCounter"));
  if (self->_referenceCounter)
    referenceCounter = self->_referenceCounter;
  else
    referenceCounter = (NSNumber *)&stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", referenceCounter, CFSTR("referenceCounter"));
  if (self->_otherOSValid)
    otherOSValid = self->_otherOSValid;
  else
    otherOSValid = (NSNumber *)&stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", otherOSValid, CFSTR("otherOSValid"));
  if (self->_migrationPackages)
    migrationPackages = self->_migrationPackages;
  else
    migrationPackages = (NSNumber *)&stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", migrationPackages, CFSTR("migrationPackages"));
  if (self->_migrationInstances)
    migrationInstances = self->_migrationInstances;
  else
    migrationInstances = (NSNumber *)&stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", migrationInstances, CFSTR("migrationInstances"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_OSVersion);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("OSVersion"));

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%06x"), self->_fullOSVersion);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("fullOSVersion"));

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_firmwareVersion);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("firmwareVersion"));

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_hardwareVersion);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("hardwareVersion"));

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_deviceType);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("deviceType"));

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_osid);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("osid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_restrictedMode);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("restrictedMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_osUpdateMode);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("osUpdateMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_OSMode));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("OSMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_signingKeyType));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("signingKeyType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_migrationState));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("migrationState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_migrationContext));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("migrationContext"));

  if (self->_platformIdentifier)
    platformIdentifier = (const __CFString *)self->_platformIdentifier;
  else
    platformIdentifier = &stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", platformIdentifier, CFSTR("platformIdentifier"));
  serialNumberAsData = self->_serialNumberAsData;
  if (serialNumberAsData)
  {
    -[NSData NF_asHexString](serialNumberAsData, "NF_asHexString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("serialNumber"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_1E3B54F18, CFSTR("serialNumber"));
  }
  systemOSSerialNumberAsData = self->_systemOSSerialNumberAsData;
  if (systemOSSerialNumberAsData)
  {
    -[NSData NF_asHexString](systemOSSerialNumberAsData, "NF_asHexString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("systemOSSerialNumber"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_1E3B54F18, CFSTR("systemOSSerialNumber"));
  }
  rsaCertificateAsData = self->_rsaCertificateAsData;
  if (rsaCertificateAsData)
  {
    -[NSData NF_asHexString](rsaCertificateAsData, "NF_asHexString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("rsaCertificate"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_1E3B54F18, CFSTR("rsaCertificate"));
  }
  ecdsaCertificateAsData = self->_ecdsaCertificateAsData;
  if (ecdsaCertificateAsData)
  {
    -[NSData NF_asHexString](ecdsaCertificateAsData, "NF_asHexString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("ecdsaCertificate"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_1E3B54F18, CFSTR("ecdsaCertificate"));
  }
  eckaCertificateAsData = self->_eckaCertificateAsData;
  if (eckaCertificateAsData)
  {
    -[NSData NF_asHexString](eckaCertificateAsData, "NF_asHexString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("eckaCertificate"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_1E3B54F18, CFSTR("eckaCertificate"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_appletMap));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("appletMap"));

  if (self->_persistentConfigID)
    persistentConfigID = self->_persistentConfigID;
  else
    persistentConfigID = (NSNumber *)&stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", persistentConfigID, CFSTR("persistentConfigID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_personalisable);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("personalisable"));

  if (self->_bootHistory)
    bootHistory = self->_bootHistory;
  else
    bootHistory = (NSArray *)&stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", bootHistory, CFSTR("bootHistory"));
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), self->_supportedTechnologies);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("supportedTechnologies"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_seType);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("seType"));

  if (self->_atrString)
    atrString = (const __CFString *)self->_atrString;
  else
    atrString = &stru_1E3B54F18;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", atrString, CFSTR("atrString"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_jcopTooOld);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("jcopTooOld"));

  return v4;
}

- (unint64_t)OSVersion
{
  return self->_OSVersion;
}

- (unint64_t)fullOSVersion
{
  return self->_fullOSVersion;
}

- (unint64_t)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSNumber)compiledFWVersion
{
  return self->_compiledFWVersion;
}

- (unint64_t)hardwareVersion
{
  return self->_hardwareVersion;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (NSNumber)sequenceCounter
{
  return self->_sequenceCounter;
}

- (NSNumber)referenceCounter
{
  return self->_referenceCounter;
}

- (unint64_t)osid
{
  return self->_osid;
}

- (NSNumber)otherOSValid
{
  return self->_otherOSValid;
}

- (BOOL)restrictedMode
{
  return self->_restrictedMode;
}

- (BOOL)restrictedPerformanceMode
{
  return self->_restrictedPerformanceMode;
}

- (BOOL)osUpdateMode
{
  return self->_osUpdateMode;
}

- (unint64_t)signingKeyType
{
  return self->_signingKeyType;
}

- (unint64_t)migrationState
{
  return self->_migrationState;
}

- (unint64_t)migrationContext
{
  return self->_migrationContext;
}

- (NSNumber)migrationPackages
{
  return self->_migrationPackages;
}

- (NSNumber)migrationInstances
{
  return self->_migrationInstances;
}

- (NSString)platformIdentifier
{
  return self->_platformIdentifier;
}

- (unint64_t)appletMap
{
  return self->_appletMap;
}

- (NSNumber)persistentConfigID
{
  return self->_persistentConfigID;
}

- (NSString)rootKeyID
{
  return self->_rootKeyID;
}

- (NSString)osKeyID
{
  return self->_osKeyID;
}

- (NSString)firmwareKeyID
{
  return self->_firmwareKeyID;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSData)manifestQuery
{
  return self->_manifestQuery;
}

- (BOOL)personalisable
{
  return self->_personalisable;
}

- (NSArray)bootHistory
{
  return self->_bootHistory;
}

- (unint64_t)supportedTechnologies
{
  return self->_supportedTechnologies;
}

- (unint64_t)seType
{
  return self->_seType;
}

- (NSString)atrString
{
  return self->_atrString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atrString, 0);
  objc_storeStrong((id *)&self->_bootHistory, 0);
  objc_storeStrong((id *)&self->_manifestQuery, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_firmwareKeyID, 0);
  objc_storeStrong((id *)&self->_osKeyID, 0);
  objc_storeStrong((id *)&self->_rootKeyID, 0);
  objc_storeStrong((id *)&self->_persistentConfigID, 0);
  objc_storeStrong((id *)&self->_platformIdentifier, 0);
  objc_storeStrong((id *)&self->_migrationInstances, 0);
  objc_storeStrong((id *)&self->_migrationPackages, 0);
  objc_storeStrong((id *)&self->_otherOSValid, 0);
  objc_storeStrong((id *)&self->_referenceCounter, 0);
  objc_storeStrong((id *)&self->_sequenceCounter, 0);
  objc_storeStrong((id *)&self->_compiledFWVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_systemOSSerialNumberAsData, 0);
  objc_storeStrong((id *)&self->_serialNumberAsData, 0);
  objc_storeStrong((id *)&self->_eckaCertificateAsData, 0);
  objc_storeStrong((id *)&self->_ecdsaCertificateAsData, 0);
  objc_storeStrong((id *)&self->_rsaCertificateAsData, 0);
}

@end
