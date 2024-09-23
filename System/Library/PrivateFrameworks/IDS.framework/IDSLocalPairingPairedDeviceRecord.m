@implementation IDSLocalPairingPairedDeviceRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSLocalPairingPairedDeviceRecord)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *cbuuid;
  IDSLocalPairingPairedDeviceRecord *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCBUUID"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  cbuuid = self->_cbuuid;
  self->_cbuuid = v5;

  v9.receiver = self;
  v9.super_class = (Class)IDSLocalPairingPairedDeviceRecord;
  v7 = -[IDSLocalPairingRecord initWithCoder:](&v9, sel_initWithCoder_, v4);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[IDSLocalPairingPairedDeviceRecord cbuuid](self, "cbuuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCBUUID"));

  v6.receiver = self;
  v6.super_class = (Class)IDSLocalPairingPairedDeviceRecord;
  -[IDSLocalPairingRecord encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);

}

- (IDSLocalPairingPairedDeviceRecord)initWithCBUUID:(id)a3 publicIdentityDataClassA:(id)a4 classC:(id)a5 classD:(id)a6
{
  id v11;
  IDSLocalPairingPairedDeviceRecord *v12;
  IDSLocalPairingPairedDeviceRecord *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSLocalPairingPairedDeviceRecord;
  v12 = -[IDSLocalPairingRecord initWithIdentityDataClassA:classC:classD:](&v15, sel_initWithIdentityDataClassA_classC_classD_, a4, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_cbuuid, a3);

  return v13;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  id v17;

  v17 = 0;
  -[IDSLocalPairingPairedDeviceRecord publicIdentityClassA:](self, "publicIdentityClassA:", &v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v17;
  v16 = 0;
  -[IDSLocalPairingPairedDeviceRecord publicIdentityClassC:](self, "publicIdentityClassC:", &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  v15 = 0;
  -[IDSLocalPairingPairedDeviceRecord publicIdentityClassD:](self, "publicIdentityClassD:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSLocalPairingPairedDeviceRecord cbuuid](self, "cbuuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p cbuuid: %@ classA: %@, errorClassA: %@, classC: %@, errorClassC: %@, classD: %@, errorClassD: %@>"), v11, self, v12, v3, v4, v5, v6, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_publicIdenityForDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  NSObject *v7;

  -[IDSLocalPairingRecord identityDataForDataProtectionClass:error:](self, "identityDataForDataProtectionClass:error:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D34DC8], "identityWithData:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "NRPairing");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F0C6C();

    v6 = 0;
  }

  return v6;
}

- (id)publicIdentityClassA:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__publicIdenityForDataProtectionClass_error_);
}

- (id)publicIdentityClassC:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__publicIdenityForDataProtectionClass_error_);
}

- (id)publicIdentityClassD:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__publicIdenityForDataProtectionClass_error_);
}

- (NSUUID)cbuuid
{
  return self->_cbuuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbuuid, 0);
}

@end
