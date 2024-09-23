@implementation IDSLocalPairingLocalDeviceRecord

- (IDSLocalPairingLocalDeviceRecord)initWithWithFullIdentityDataClassA:(id)a3 classC:(id)a4 classD:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IDSLocalPairingLocalDeviceRecord;
  return -[IDSLocalPairingRecord initWithIdentityDataClassA:classC:classD:](&v6, sel_initWithIdentityDataClassA_classC_classD_, a3, a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v14;
  id v15;
  id v16;

  v16 = 0;
  -[IDSLocalPairingLocalDeviceRecord fullIdentityClassA:](self, "fullIdentityClassA:", &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  v15 = 0;
  -[IDSLocalPairingLocalDeviceRecord fullIdentityClassC:](self, "fullIdentityClassC:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  v14 = 0;
  -[IDSLocalPairingLocalDeviceRecord fullIdentityClassD:](self, "fullIdentityClassD:", &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p classA: %@, errorClassA: %@, classC: %@, errorClassC: %@, classD: %@, errorClassD: %@>"), v11, self, v3, v4, v5, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_fullIdenityForDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  NSObject *v7;

  -[IDSLocalPairingRecord identityDataForDataProtectionClass:error:](self, "identityDataForDataProtectionClass:error:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D34DC0], "identityWithData:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "NRPairing");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F0CFC();

    v6 = 0;
  }

  return v6;
}

- (id)fullIdentityClassA:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__fullIdenityForDataProtectionClass_error_);
}

- (id)fullIdentityClassC:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__fullIdenityForDataProtectionClass_error_);
}

- (id)fullIdentityClassD:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__fullIdenityForDataProtectionClass_error_);
}

@end
