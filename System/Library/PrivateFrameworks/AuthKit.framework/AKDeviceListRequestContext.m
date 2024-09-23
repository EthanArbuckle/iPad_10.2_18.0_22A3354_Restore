@implementation AKDeviceListRequestContext

- (AKDeviceListRequestContext)init
{
  AKDeviceListRequestContext *v2;
  uint64_t v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKDeviceListRequestContext;
  v2 = -[AKDeviceListRequestContext init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v2->_forceFetch = 0;
    v2->_type = 1;
  }
  return v2;
}

- (AKDeviceListRequestContext)initWithCoder:(id)a3
{
  id v4;
  AKDeviceListRequestContext *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *altDSID;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *services;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *operatingSystems;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *serialNumbers;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKDeviceListRequestContext;
  v5 = -[AKDeviceListRequestContext init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_services"));
    v13 = objc_claimAutoreleasedReturnValue();
    services = v5->_services;
    v5->_services = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_operatingSystems"));
    v18 = objc_claimAutoreleasedReturnValue();
    operatingSystems = v5->_operatingSystems;
    v5->_operatingSystems = (NSArray *)v18;

    v5->_includeUntrustedDevices = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeUntrustedDevices"));
    v5->_includeFamilyDevices = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeFamilyDevices"));
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("_serialNumbers"));
    v23 = objc_claimAutoreleasedReturnValue();
    serialNumbers = v5->_serialNumbers;
    v5->_serialNumbers = (NSArray *)v23;

    v5->_forceFetch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_forceFetch"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v5->_fetchDeviceSafetyState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_fetchDeviceSafetyState"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:", identifier);
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_services, CFSTR("_services"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operatingSystems, CFSTR("_operatingSystems"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeUntrustedDevices, CFSTR("_includeUntrustedDevices"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeFamilyDevices, CFSTR("_includeFamilyDevices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumbers, CFSTR("_serialNumbers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceFetch, CFSTR("_forceFetch"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fetchDeviceSafetyState, CFSTR("_fetchDeviceSafetyState"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  int64_t type;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  type = self->_type;
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{<%@:%p>: type: %ld, identifier: %@,altDSID: %@, forceFetch: %d, fetchDeviceSafetyState: %d, os: %@, services: %@, untrusted: %d, family: %d, serialNumbers: %@, }"), v4, self, type, v6, self->_altDSID, self->_forceFetch, self->_fetchDeviceSafetyState, self->_operatingSystems, self->_services, self->_includeUntrustedDevices, self->_includeFamilyDevices, self->_serialNumbers);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)fetchDeviceSafetyState
{
  return self->_fetchDeviceSafetyState;
}

- (void)setFetchDeviceSafetyState:(BOOL)a3
{
  self->_fetchDeviceSafetyState = a3;
}

- (BOOL)includeUntrustedDevices
{
  return self->_includeUntrustedDevices;
}

- (void)setIncludeUntrustedDevices:(BOOL)a3
{
  self->_includeUntrustedDevices = a3;
}

- (BOOL)includeFamilyDevices
{
  return self->_includeFamilyDevices;
}

- (void)setIncludeFamilyDevices:(BOOL)a3
{
  self->_includeFamilyDevices = a3;
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)operatingSystems
{
  return self->_operatingSystems;
}

- (void)setOperatingSystems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isForceFetch
{
  return self->_forceFetch;
}

- (void)setForceFetch:(BOOL)a3
{
  self->_forceFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_operatingSystems, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
