@implementation DACarKeyAdditionalCrossPlatformSharingData

- (DACarKeyAdditionalCrossPlatformSharingData)initWithSharingSessionUUID:(id)a3 bindingAttestation:(id)a4 targetDeviceType:(int64_t)a5 initiatorIdsPseudonym:(id)a6
{
  id v11;
  id v12;
  id v13;
  DACarKeyAdditionalCrossPlatformSharingData *v14;
  DACarKeyAdditionalCrossPlatformSharingData *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DACarKeyAdditionalCrossPlatformSharingData;
  v14 = -[DACarKeyAdditionalCrossPlatformSharingData init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sharingSessionUUID, a3);
    objc_storeStrong((id *)&v15->_bindingAttestation, a4);
    v15->_targetDeviceType = a5;
    objc_storeStrong((id *)&v15->_initiatorIdsPseudonym, a6);
  }

  return v15;
}

- (DACarKeyAdditionalCrossPlatformSharingData)initWithDictionary:(id)a3
{
  id v4;
  DACarKeyAdditionalCrossPlatformSharingData *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSUUID *sharingSessionUUID;
  void *v11;
  uint64_t v12;
  NSData *bindingAttestation;
  void *v14;
  uint64_t v15;
  NSString *initiatorIdsPseudonym;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DACarKeyAdditionalCrossPlatformSharingData;
  v5 = -[DACarKeyAdditionalCrossPlatformSharingData init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("sharingSessionUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingSessionUUID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "initWithUUIDString:", v8);
      sharingSessionUUID = v5->_sharingSessionUUID;
      v5->_sharingSessionUUID = (NSUUID *)v9;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bindingAttestation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    kmlUtilDataForHexString(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    bindingAttestation = v5->_bindingAttestation;
    v5->_bindingAttestation = (NSData *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetDeviceType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_targetDeviceType = objc_msgSend(v14, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initiatorIdsPseudonym"));
    v15 = objc_claimAutoreleasedReturnValue();
    initiatorIdsPseudonym = v5->_initiatorIdsPseudonym;
    v5->_initiatorIdsPseudonym = (NSString *)v15;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DACarKeyAdditionalCrossPlatformSharingData *v5;
  uint64_t v6;
  NSUUID *sharingSessionUUID;
  uint64_t v8;
  NSData *bindingAttestation;
  uint64_t v10;
  NSString *initiatorIdsPseudonym;

  v5 = -[DACarKeyAdditionalCrossPlatformSharingData init](+[DACarKeyAdditionalCrossPlatformSharingData allocWithZone:](DACarKeyAdditionalCrossPlatformSharingData, "allocWithZone:"), "init");
  if (v5)
  {
    v6 = -[NSUUID copyWithZone:](self->_sharingSessionUUID, "copyWithZone:", a3);
    sharingSessionUUID = v5->_sharingSessionUUID;
    v5->_sharingSessionUUID = (NSUUID *)v6;

    v8 = -[NSData copyWithZone:](self->_bindingAttestation, "copyWithZone:", a3);
    bindingAttestation = v5->_bindingAttestation;
    v5->_bindingAttestation = (NSData *)v8;

    v5->_targetDeviceType = self->_targetDeviceType;
    v10 = -[NSString copyWithZone:](self->_initiatorIdsPseudonym, "copyWithZone:", a3);
    initiatorIdsPseudonym = v5->_initiatorIdsPseudonym;
    v5->_initiatorIdsPseudonym = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DACarKeyAdditionalCrossPlatformSharingData sharingSessionUUID](self, "sharingSessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sharingSessionUUID"));

  -[DACarKeyAdditionalCrossPlatformSharingData bindingAttestation](self, "bindingAttestation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bindingAttestation"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DACarKeyAdditionalCrossPlatformSharingData targetDeviceType](self, "targetDeviceType"), CFSTR("targetDeviceType"));
  -[DACarKeyAdditionalCrossPlatformSharingData initiatorIdsPseudonym](self, "initiatorIdsPseudonym");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("initiatorIdsPseudonym"));

}

- (DACarKeyAdditionalCrossPlatformSharingData)initWithCoder:(id)a3
{
  id v4;
  DACarKeyAdditionalCrossPlatformSharingData *v5;
  uint64_t v6;
  NSUUID *sharingSessionUUID;
  uint64_t v8;
  NSData *bindingAttestation;
  uint64_t v10;
  NSString *initiatorIdsPseudonym;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DACarKeyAdditionalCrossPlatformSharingData;
  v5 = -[DACarKeyAdditionalCrossPlatformSharingData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingSessionUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingSessionUUID = v5->_sharingSessionUUID;
    v5->_sharingSessionUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bindingAttestation"));
    v8 = objc_claimAutoreleasedReturnValue();
    bindingAttestation = v5->_bindingAttestation;
    v5->_bindingAttestation = (NSData *)v8;

    v5->_targetDeviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("targetDeviceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initiatorIdsPseudonym"));
    v10 = objc_claimAutoreleasedReturnValue();
    initiatorIdsPseudonym = v5->_initiatorIdsPseudonym;
    v5->_initiatorIdsPseudonym = (NSString *)v10;

  }
  return v5;
}

- (id)encodeWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = decodeWithData_error__pred_279;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&decodeWithData_error__pred_279, &__block_literal_global_281);
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", decodeWithData_error__allowedClasses_280, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __67__DACarKeyAdditionalCrossPlatformSharingData_decodeWithData_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)decodeWithData_error__allowedClasses_280;
  decodeWithData_error__allowedClasses_280 = v0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SharingSession UUID       : %@\n"), self->_sharingSessionUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BindingAttestation        : %@\n"), self->_bindingAttestation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Target Device Type        : %ld\n"), self->_targetDeviceType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Initiator IDS Pseudonym   : %@\n"), self->_initiatorIdsPseudonym);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  return v3;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_sharingSessionUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sharingSessionUUID"));

  kmlUtilHexStringFromData(self->_bindingAttestation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bindingAttestation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_targetDeviceType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("targetDeviceType"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_initiatorIdsPseudonym, CFSTR("initiatorIdsPseudonym"));
  return v3;
}

- (NSUUID)sharingSessionUUID
{
  return self->_sharingSessionUUID;
}

- (NSData)bindingAttestation
{
  return self->_bindingAttestation;
}

- (void)setBindingAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_bindingAttestation, a3);
}

- (int64_t)targetDeviceType
{
  return self->_targetDeviceType;
}

- (NSString)initiatorIdsPseudonym
{
  return self->_initiatorIdsPseudonym;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorIdsPseudonym, 0);
  objc_storeStrong((id *)&self->_bindingAttestation, 0);
  objc_storeStrong((id *)&self->_sharingSessionUUID, 0);
}

@end
