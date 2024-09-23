@implementation AKDeviceSafetyRestrictionState

- (AKDeviceSafetyRestrictionState)initWithDeviceMID:(id)a3 serialNumber:(id)a4 restrictionReason:(int64_t)a5
{
  id v9;
  id v10;
  AKDeviceSafetyRestrictionState *v11;
  AKDeviceSafetyRestrictionState *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKDeviceSafetyRestrictionState;
  v11 = -[AKDeviceSafetyRestrictionState init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_machineId, a3);
    objc_storeStrong((id *)&v12->_serialNumber, a4);
    v12->_reason = a5;
  }

  return v12;
}

- (AKDeviceSafetyRestrictionState)initWithResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  AKDeviceSafetyRestrictionState *v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mid"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = (unint64_t)v10;
    else
      v11 = 0;

    objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sn"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = (unint64_t)v14;
    else
      v15 = 0;

    if (v11 | v15)
    {
      objc_opt_class();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lostMode"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;

      if (v18)
      {
        if (objc_msgSend(v18, "BOOLValue"))
          v19 = 2;
        else
          v19 = 1;
      }
      else
      {
        v19 = 1;
      }
      self = -[AKDeviceSafetyRestrictionState initWithDeviceMID:serialNumber:restrictionReason:](self, "initWithDeviceMID:serialNumber:restrictionReason:", v11, v15, v19);

      v13 = self;
    }
    else
    {
      _AKLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[AKDeviceSafetyRestrictionState initWithResponse:error:].cold.2(v16);

      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ak_deviceListErrorWithCode:", -14005);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
    }

  }
  else
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AKDeviceSafetyRestrictionState initWithResponse:error:].cold.1(v12);

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_deviceListErrorWithCode:", -14005);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> machineId: %@, serial: %@, reason: %d, "), objc_opt_class(), self, self->_serialNumber, self->_machineId, self->_reason);
}

- (NSString)machineId
{
  return self->_machineId;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_machineId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKDeviceSafetyRestrictionState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AKDeviceSafetyRestrictionState *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("machineId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));

  v8 = -[AKDeviceSafetyRestrictionState initWithDeviceMID:serialNumber:restrictionReason:](self, "initWithDeviceMID:serialNumber:restrictionReason:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AKDeviceSafetyRestrictionState machineId](self, "machineId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("machineId"));

  -[AKDeviceSafetyRestrictionState serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("serialNumber"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[AKDeviceSafetyRestrictionState reason](self, "reason"), CFSTR("reason"));
}

- (void)initWithResponse:(os_log_t)log error:.cold.1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = CFSTR("deviceInfo");
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Did not receive %{public}@ key on device restriction state, failing init", (uint8_t *)&v1, 0xCu);
}

- (void)initWithResponse:(os_log_t)log error:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Did not receive a serial or machineID on device restriction state, failing init", v1, 2u);
}

@end
