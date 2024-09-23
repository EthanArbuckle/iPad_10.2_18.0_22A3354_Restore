@implementation DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject)initWithCoder:(id)a3
{
  id v4;
  DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject *v5;
  void *v6;
  uint64_t v7;
  NSString *serialNumber;
  void *v9;
  uint64_t v10;
  NSString *deviceUDID;
  void *v12;
  uint64_t v13;
  NSString *modelIdentifier;
  void *v15;
  uint64_t v16;
  NSString *modelName;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("serialNumber"));
    v7 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("deviceUDID"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("modelIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("modelName"));
    v16 = objc_claimAutoreleasedReturnValue();
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject serialNumber](self, "serialNumber", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serialNumber"));

  -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject deviceUDID](self, "deviceUDID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deviceUDID"));

  -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject modelIdentifier](self, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("modelIdentifier"));

  -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject modelName](self, "modelName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("modelName"));

}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setModelIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
