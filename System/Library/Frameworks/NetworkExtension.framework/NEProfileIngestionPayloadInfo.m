@implementation NEProfileIngestionPayloadInfo

- (NEProfileIngestionPayloadInfo)init
{
  NEProfileIngestionPayloadInfo *v2;
  void *v3;
  uint64_t v4;
  NSString *systemVersion;
  uint64_t v6;
  NSDate *profileIngestionDate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NEProfileIngestionPayloadInfo;
  v2 = -[NEProfileIngestionPayloadInfo init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "operatingSystemVersionString");
    v4 = objc_claimAutoreleasedReturnValue();
    systemVersion = v2->_systemVersion;
    v2->_systemVersion = (NSString *)v4;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    profileIngestionDate = v2->_profileIngestionDate;
    v2->_profileIngestionDate = (NSDate *)v6;

  }
  return v2;
}

- (NEProfileIngestionPayloadInfo)initWithCoder:(id)a3
{
  id v4;
  NEProfileIngestionPayloadInfo *v5;
  uint64_t v6;
  NSString *payloadProtocolType;
  uint64_t v8;
  NSString *payloadUUID;
  uint64_t v10;
  NSString *payloadOrganization;
  uint64_t v12;
  NSString *profileIdentifier;
  uint64_t v14;
  NSString *profileUUID;
  uint64_t v16;
  NSString *profileOrganization;
  uint64_t v18;
  NSDate *profileIngestionDate;
  uint64_t v20;
  NSString *systemVersion;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEProfileIngestionPayloadInfo;
  v5 = -[NEProfileIngestionPayloadInfo init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PayloadType"));
    v6 = objc_claimAutoreleasedReturnValue();
    payloadProtocolType = v5->_payloadProtocolType;
    v5->_payloadProtocolType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PayloadUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    payloadUUID = v5->_payloadUUID;
    v5->_payloadUUID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PayloadOrganization"));
    v10 = objc_claimAutoreleasedReturnValue();
    payloadOrganization = v5->_payloadOrganization;
    v5->_payloadOrganization = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProfileIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProfileUUID"));
    v14 = objc_claimAutoreleasedReturnValue();
    profileUUID = v5->_profileUUID;
    v5->_profileUUID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProfileOrganization"));
    v16 = objc_claimAutoreleasedReturnValue();
    profileOrganization = v5->_profileOrganization;
    v5->_profileOrganization = (NSString *)v16;

    v5->_isSetAside = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSetAside"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileIngestionDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    profileIngestionDate = v5->_profileIngestionDate;
    v5->_profileIngestionDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemVersion"));
    v20 = objc_claimAutoreleasedReturnValue();
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v20;

    v5->_profileSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("profileSource"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[NEProfileIngestionPayloadInfo payloadProtocolType](self, "payloadProtocolType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("PayloadType"));

  -[NEProfileIngestionPayloadInfo payloadUUID](self, "payloadUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("PayloadUUID"));

  -[NEProfileIngestionPayloadInfo payloadOrganization](self, "payloadOrganization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("PayloadOrganization"));

  -[NEProfileIngestionPayloadInfo profileIdentifier](self, "profileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("ProfileIdentifier"));

  -[NEProfileIngestionPayloadInfo profileUUID](self, "profileUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("ProfileUUID"));

  -[NEProfileIngestionPayloadInfo profileOrganization](self, "profileOrganization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("ProfileOrganization"));

  objc_msgSend(v12, "encodeBool:forKey:", -[NEProfileIngestionPayloadInfo isSetAside](self, "isSetAside"), CFSTR("isSetAside"));
  -[NEProfileIngestionPayloadInfo profileIngestionDate](self, "profileIngestionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("profileIngestionDate"));

  -[NEProfileIngestionPayloadInfo systemVersion](self, "systemVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("systemVersion"));

  objc_msgSend(v12, "encodeInteger:forKey:", -[NEProfileIngestionPayloadInfo profileSource](self, "profileSource"), CFSTR("profileSource"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEProfileIngestionPayloadInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = -[NEProfileIngestionPayloadInfo init](+[NEProfileIngestionPayloadInfo allocWithZone:](NEProfileIngestionPayloadInfo, "allocWithZone:", a3), "init");
  -[NEProfileIngestionPayloadInfo payloadProtocolType](self, "payloadProtocolType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setPayloadProtocolType:](v4, "setPayloadProtocolType:", v5);

  -[NEProfileIngestionPayloadInfo payloadUUID](self, "payloadUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setPayloadUUID:](v4, "setPayloadUUID:", v6);

  -[NEProfileIngestionPayloadInfo payloadOrganization](self, "payloadOrganization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setPayloadOrganization:](v4, "setPayloadOrganization:", v7);

  -[NEProfileIngestionPayloadInfo profileIdentifier](self, "profileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setProfileIdentifier:](v4, "setProfileIdentifier:", v8);

  -[NEProfileIngestionPayloadInfo profileUUID](self, "profileUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setProfileUUID:](v4, "setProfileUUID:", v9);

  -[NEProfileIngestionPayloadInfo profileOrganization](self, "profileOrganization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setProfileOrganization:](v4, "setProfileOrganization:", v10);

  -[NEProfileIngestionPayloadInfo setIsSetAside:](v4, "setIsSetAside:", -[NEProfileIngestionPayloadInfo isSetAside](self, "isSetAside"));
  -[NEProfileIngestionPayloadInfo profileIngestionDate](self, "profileIngestionDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setProfileIngestionDate:](v4, "setProfileIngestionDate:", v11);

  -[NEProfileIngestionPayloadInfo systemVersion](self, "systemVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setSystemVersion:](v4, "setSystemVersion:", v12);

  -[NEProfileIngestionPayloadInfo setProfileSource:](v4, "setProfileSource:", -[NEProfileIngestionPayloadInfo profileSource](self, "profileSource"));
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  const __CFString *v17;
  const __CFString *v18;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NEProfileIngestionPayloadInfo payloadUUID](self, "payloadUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("payloadUUID"), v5, a4);

  -[NEProfileIngestionPayloadInfo payloadOrganization](self, "payloadOrganization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("payloadOrganization"), v5, a4 | 1);

  -[NEProfileIngestionPayloadInfo profileUUID](self, "profileUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("profileUUID"), v5, a4);

  -[NEProfileIngestionPayloadInfo profileIdentifier](self, "profileIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("profileIdentifier"), v5, a4 | 1);

  -[NEProfileIngestionPayloadInfo profileOrganization](self, "profileOrganization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("profileOrganization"), v5, a4 | 1);

  -[NEProfileIngestionPayloadInfo payloadProtocolType](self, "payloadProtocolType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("payloadProtocolType"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProfileIngestionPayloadInfo isSetAside](self, "isSetAside"), CFSTR("isSetAside"), v5, a4);
  -[NEProfileIngestionPayloadInfo profileIngestionDate](self, "profileIngestionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("profileIngestionDate"), v5, a4);

  -[NEProfileIngestionPayloadInfo systemVersion](self, "systemVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("systemVersion"), v5, a4);

  v16 = -[NEProfileIngestionPayloadInfo profileSource](self, "profileSource");
  v17 = CFSTR("unknown");
  if (v16 == 2)
    v17 = CFSTR("mdm");
  if (v16 == 1)
    v18 = CFSTR("user");
  else
    v18 = v17;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("profileSource"), v5, a4);
  return v7;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  NEProfileIngestionPayloadInfo *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSString *payloadProtocolType;
  void *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSString *payloadUUID;
  void *v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSString *payloadOrganization;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSString *profileIdentifier;
  void *v32;
  int v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSString *profileUUID;
  void *v38;
  int v39;
  id v40;
  void *v41;
  uint64_t v42;
  NSString *profileOrganization;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)NEProfileIngestionPayloadInfo;
  v5 = -[NEProfileIngestionPayloadInfo init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = isa_nsstring(v6);

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithString:", v9);
      payloadProtocolType = v5->_payloadProtocolType;
      v5->_payloadProtocolType = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = isa_nsstring(v12);

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithString:", v15);
      payloadUUID = v5->_payloadUUID;
      v5->_payloadUUID = (NSString *)v16;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadOrganization"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = isa_nsstring(v18);

    if (v19)
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadOrganization"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "initWithString:", v21);
      payloadOrganization = v5->_payloadOrganization;
      v5->_payloadOrganization = (NSString *)v22;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadRoot"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && isa_nsdictionary(v24))
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PayloadIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = isa_nsstring(v26);

      if (v27)
      {
        v28 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PayloadIdentifier"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "initWithString:", v29);
        profileIdentifier = v5->_profileIdentifier;
        v5->_profileIdentifier = (NSString *)v30;

      }
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = isa_nsstring(v32);

      if (v33)
      {
        v34 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "initWithString:", v35);
        profileUUID = v5->_profileUUID;
        v5->_profileUUID = (NSString *)v36;

      }
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PayloadOrganization"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = isa_nsstring(v38);

      if (v39)
      {
        v40 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PayloadOrganization"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "initWithString:", v41);
        profileOrganization = v5->_profileOrganization;
        v5->_profileOrganization = (NSString *)v42;

      }
    }

  }
  return v5;
}

- (id)copyLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  if (!v3)
    goto LABEL_16;
  if (self->_payloadUUID)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", self->_payloadUUID);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PayloadUUID"));

  }
  if (self->_payloadOrganization)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", self->_payloadOrganization);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PayloadOrganization"));

  }
  if (!self->_profileIdentifier && !self->_profileUUID && !self->_profileOrganization)
    goto LABEL_15;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  if (!v6)
  {
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  v7 = (void *)v6;
  if (self->_profileIdentifier)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", self->_profileIdentifier);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("PayloadIdentifier"));

  }
  if (self->_profileUUID)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", self->_profileUUID);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("PayloadUUID"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PayloadRoot"));

LABEL_15:
  v10 = v3;
LABEL_17:

  return v10;
}

- (NSString)payloadProtocolType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPayloadProtocolType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)payloadUUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPayloadUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)payloadOrganization
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPayloadOrganization:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)profileOrganization
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProfileOrganization:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProfileIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)profileUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProfileUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSDate)profileIngestionDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProfileIngestionDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)systemVersion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (BOOL)isSetAside
{
  return self->_isSetAside;
}

- (void)setIsSetAside:(BOOL)a3
{
  self->_isSetAside = a3;
}

- (int64_t)profileSource
{
  return self->_profileSource;
}

- (void)setProfileSource:(int64_t)a3
{
  self->_profileSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_profileIngestionDate, 0);
  objc_storeStrong((id *)&self->_profileUUID, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_profileOrganization, 0);
  objc_storeStrong((id *)&self->_payloadOrganization, 0);
  objc_storeStrong((id *)&self->_payloadUUID, 0);
  objc_storeStrong((id *)&self->_payloadProtocolType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
