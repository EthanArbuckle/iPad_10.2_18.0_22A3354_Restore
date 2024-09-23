@implementation _HKFitnessMachineSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKFitnessMachineSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKFitnessMachineSessionConfiguration *v5;
  uint64_t v6;
  NSUUID *sessionUUID;
  uint64_t v8;
  NSUUID *connectionUUID;
  uint64_t v10;
  NSUUID *machineUUID;
  uint64_t v12;
  NSString *machineName;
  uint64_t v14;
  NSString *machineBrand;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKFitnessMachineSessionConfiguration;
  v5 = -[_HKFitnessMachineSessionConfiguration init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectionUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    connectionUUID = v5->_connectionUUID;
    v5->_connectionUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("machineUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    machineUUID = v5->_machineUUID;
    v5->_machineUUID = (NSUUID *)v10;

    v5->_machineType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("machineType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("machineName"));
    v12 = objc_claimAutoreleasedReturnValue();
    machineName = v5->_machineName;
    v5->_machineName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("machineBrand"));
    v14 = objc_claimAutoreleasedReturnValue();
    machineBrand = v5->_machineBrand;
    v5->_machineBrand = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sessionUUID;
  id v5;

  sessionUUID = self->_sessionUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_connectionUUID, CFSTR("connectionUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_machineUUID, CFSTR("machineUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_machineType, CFSTR("machineType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_machineName, CFSTR("machineName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_machineBrand, CFSTR("machineBrand"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_sessionUUID, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_connectionUUID, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_machineUUID, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HKStringForFitnessMachineType(self->_machineType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> session %@ connection %@ machine %@ %@ %@ %@"), v5, self, v6, v7, v8, v9, self->_machineName, self->_machineBrand);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (void)_setConnectionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionUUID, a3);
}

- (void)_setMachineUUID:(id)a3
{
  objc_storeStrong((id *)&self->_machineUUID, a3);
}

- (void)_setMachineType:(unint64_t)a3
{
  self->_machineType = a3;
}

- (void)_setMachineName:(id)a3
{
  objc_storeStrong((id *)&self->_machineName, a3);
}

- (void)_setMachineBrand:(id)a3
{
  objc_storeStrong((id *)&self->_machineBrand, a3);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (NSUUID)machineUUID
{
  return self->_machineUUID;
}

- (unint64_t)machineType
{
  return self->_machineType;
}

- (NSString)machineName
{
  return self->_machineName;
}

- (NSString)machineBrand
{
  return self->_machineBrand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machineBrand, 0);
  objc_storeStrong((id *)&self->_machineName, 0);
  objc_storeStrong((id *)&self->_machineUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
