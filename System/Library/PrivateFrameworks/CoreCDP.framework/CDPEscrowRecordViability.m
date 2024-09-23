@implementation CDPEscrowRecordViability

- (CDPEscrowRecordViability)initWithRecordPresence:(BOOL)a3 isValid:(BOOL)a4 recordId:(id)a5 buildVersion:(id)a6 isForCurrentDevice:(BOOL)a7 hasMachineId:(BOOL)a8 recordViability:(unint64_t)a9 localSecretViability:(unint64_t)a10 tlkRecoveryViability:(unint64_t)a11 sosViability:(unint64_t)a12 pcsRecoveryViability:(unint64_t)a13
{
  id v20;
  id v21;
  CDPEscrowRecordViability *v22;
  CDPEscrowRecordViability *v23;
  CDPEscrowRecordViability *v24;
  objc_super v26;

  v20 = a5;
  v21 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CDPEscrowRecordViability;
  v22 = -[CDPEscrowRecordViability init](&v26, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_hasRecords = a3;
    v22->_recordIsValid = a4;
    objc_storeStrong((id *)&v22->_recordId, a5);
    objc_storeStrong((id *)&v23->_buildVersion, a6);
    v23->_isForCurrentDevice = a7;
    v23->_hasMachineId = a8;
    v23->_recordViability = a9;
    v23->_localSecretViability = a10;
    v23->_tlkRecoveryViability = a11;
    v23->_pcsRecoveryViability = a13;
    v23->_sosViability = a12;
    v24 = v23;
  }

  return v23;
}

- (CDPEscrowRecordViability)initWithDefaultValues
{
  return -[CDPEscrowRecordViability initWithRecordPresence:isValid:recordId:buildVersion:isForCurrentDevice:hasMachineId:recordViability:localSecretViability:tlkRecoveryViability:sosViability:pcsRecoveryViability:](self, "initWithRecordPresence:isValid:recordId:buildVersion:isForCurrentDevice:hasMachineId:recordViability:localSecretViability:tlkRecoveryViability:sosViability:pcsRecoveryViability:", 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 2);
}

- (unint64_t)localViability
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v6;
  NSObject *v7;

  if (!-[CDPEscrowRecordViability hasRecords](self, "hasRecords"))
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CDPEscrowRecordViability localViability].cold.7();
    goto LABEL_16;
  }
  if (!-[CDPEscrowRecordViability recordIsValid](self, "recordIsValid"))
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CDPEscrowRecordViability localViability].cold.6();
    goto LABEL_16;
  }
  if (!-[CDPEscrowRecordViability isForCurrentDevice](self, "isForCurrentDevice"))
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CDPEscrowRecordViability localViability].cold.5();
LABEL_16:

    return 2;
  }
  if (-[CDPEscrowRecordViability recordViability](self, "recordViability") == 1)
  {
    if (!-[CDPEscrowRecordViability hasMachineId](self, "hasMachineId"))
    {
      _CDPLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        -[CDPEscrowRecordViability localViability].cold.3();
      goto LABEL_22;
    }
    if (+[CDPUtilities shouldValidatePasscodeGenerations](CDPUtilities, "shouldValidatePasscodeGenerations")&& -[CDPEscrowRecordViability localSecretViability](self, "localSecretViability") == 3)
    {
      _CDPLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        -[CDPEscrowRecordViability localViability].cold.1();
LABEL_22:

      return 3;
    }
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CDPEscrowRecordViability localViability].cold.2();

    return 1;
  }
  else
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CDPEscrowRecordViability localViability].cold.4();

    return -[CDPEscrowRecordViability recordViability](self, "recordViability");
  }
}

- (int64x2_t)updatedViabiltyWithRecord:(int64x2_t *)a1
{
  id v3;
  CDPDevice *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    a1 = (int64x2_t *)-[int64x2_t copy](a1, "copy");
    if ((-[int64x2_t hasRecords](a1, "hasRecords") & 1) == 0)
    {
      a1->i16[4] = 257;
      a1->i8[11] = 1;
      a1[2].i64[0] = 3;
      a1[3] = vdupq_n_s64(3uLL);
      a1[4].i64[0] = 3;
    }
    if (-[int64x2_t recordViability](a1, "recordViability") == 1)
    {
      _CDPLogSystem();
      v4 = (CDPDevice *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_20D7E6000, &v4->super, OS_LOG_TYPE_DEFAULT, "\"Report already received a viable record.\", (uint8_t *)v11, 2u);
      }
    }
    else
    {
      v4 = -[CDPDevice initWithEscrowRecord:]([CDPDevice alloc], "initWithEscrowRecord:", v3);
      if (objc_msgSend(v3, "recordViability"))
        v5 = objc_msgSend(v3, "recordViability") == 1;
      else
        v5 = 1;
      if ((-[int64x2_t hasMachineId](a1, "hasMachineId") & 1) == 0)
      {
        -[CDPDevice machineID](v4, "machineID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          _CDPLogSystem();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            -[CDPEscrowRecordViability updatedViabiltyWithRecord:].cold.1();

          a1->i8[10] = 1;
        }
      }
      _CDPLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109376;
        v11[1] = v5;
        v12 = 1024;
        v13 = -[int64x2_t hasMachineId](a1, "hasMachineId");
        _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Checking viability. hasRecordViability = (%{BOOL}d), hasMachineId = (%{BOOL}d)\", (uint8_t *)v11, 0xEu);
      }

      if (v5 && -[int64x2_t hasMachineId](a1, "hasMachineId"))
      {
        a1[2].i64[0] = 1;
      }
      else
      {
        _CDPLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_20D7E6000, v9, OS_LOG_TYPE_DEFAULT, "\"Record is not viable.\", (uint8_t *)v11, 2u);
        }

      }
    }

  }
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDPEscrowRecordViability)initWithCoder:(id)a3
{
  id v4;
  CDPEscrowRecordViability *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  NSString *recordId;
  void *v13;
  uint64_t v14;
  NSString *buildVersion;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  CDPEscrowRecordViability *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CDPEscrowRecordViability;
  v5 = -[CDPEscrowRecordViability init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasRecords"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v5->_hasRecords = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordIsValid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v5->_recordIsValid = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v11 = objc_claimAutoreleasedReturnValue();

    recordId = v5->_recordId;
    v5->_recordId = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v14 = objc_claimAutoreleasedReturnValue();

    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isForCurrentDevice"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v16, "BOOLValue");

    v5->_isForCurrentDevice = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasMachineId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v17, "BOOLValue");

    v5->_hasMachineId = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordViability"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedLongValue");

    v5->_recordViability = v19;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localSecretViability"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedLongValue");

    v5->_localSecretViability = v21;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tlkRecoveryViability"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedLongValue");

    v5->_tlkRecoveryViability = v23;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pcsRecoveryViability"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedLongValue");

    v5->_pcsRecoveryViability = v25;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sosViability"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedLongValue");

    v5->_sosViability = v27;
    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 hasRecords;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDD16E0];
  hasRecords = self->_hasRecords;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", hasRecords);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("hasRecords"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_recordIsValid);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("recordIsValid"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_recordId, CFSTR("recordId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_buildVersion, CFSTR("buildVersion"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isForCurrentDevice);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("isForCurrentDevice"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasMachineId);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("hasMachineId"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_recordViability);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("recordViability"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_localSecretViability);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("localSecretViability"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_tlkRecoveryViability);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("tlkRecoveryViability"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_pcsRecoveryViability);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v14, CFSTR("pcsRecoveryViability"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_sosViability);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v15, CFSTR("sosViability"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  CDPEscrowRecordViability *v7;
  _BOOL4 v9;
  CDPEscrowRecordViability *v10;

  v10 = [CDPEscrowRecordViability alloc];
  v9 = -[CDPEscrowRecordViability hasRecords](self, "hasRecords");
  v4 = -[CDPEscrowRecordViability recordIsValid](self, "recordIsValid");
  -[CDPEscrowRecordViability recordId](self, "recordId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscrowRecordViability buildVersion](self, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDPEscrowRecordViability initWithRecordPresence:isValid:recordId:buildVersion:isForCurrentDevice:hasMachineId:recordViability:localSecretViability:tlkRecoveryViability:sosViability:pcsRecoveryViability:](v10, "initWithRecordPresence:isValid:recordId:buildVersion:isForCurrentDevice:hasMachineId:recordViability:localSecretViability:tlkRecoveryViability:sosViability:pcsRecoveryViability:", v9, v4, v5, v6, -[CDPEscrowRecordViability isForCurrentDevice](self, "isForCurrentDevice"), -[CDPEscrowRecordViability hasMachineId](self, "hasMachineId"), -[CDPEscrowRecordViability recordViability](self, "recordViability"), -[CDPEscrowRecordViability localSecretViability](self, "localSecretViability"), -[CDPEscrowRecordViability tlkRecoveryViability](self, "tlkRecoveryViability"), -[CDPEscrowRecordViability sosViability](self, "sosViability"), -[CDPEscrowRecordViability pcsRecoveryViability](self, "pcsRecoveryViability"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  v5 = -[CDPEscrowRecordViability hasRecords](self, "hasRecords");
  if (v5 != objc_msgSend(v4, "hasRecords"))
    goto LABEL_17;
  v6 = -[CDPEscrowRecordViability recordIsValid](self, "recordIsValid");
  if (v6 != objc_msgSend(v4, "recordIsValid"))
    goto LABEL_17;
  -[CDPEscrowRecordViability recordId](self, "recordId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
  {

  }
  else
  {
    -[CDPEscrowRecordViability recordId](self, "recordId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
      goto LABEL_17;
  }
  -[CDPEscrowRecordViability buildVersion](self, "buildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqual:", v12))
  {
    -[CDPEscrowRecordViability buildVersion](self, "buildVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
      goto LABEL_10;
LABEL_17:
    v22 = 0;
    goto LABEL_18;
  }

LABEL_10:
  v15 = -[CDPEscrowRecordViability isForCurrentDevice](self, "isForCurrentDevice");
  if (v15 != objc_msgSend(v4, "isForCurrentDevice"))
    goto LABEL_17;
  v16 = -[CDPEscrowRecordViability hasMachineId](self, "hasMachineId");
  if (v16 != objc_msgSend(v4, "hasMachineId"))
    goto LABEL_17;
  v17 = -[CDPEscrowRecordViability recordViability](self, "recordViability");
  if (v17 != objc_msgSend(v4, "recordViability"))
    goto LABEL_17;
  v18 = -[CDPEscrowRecordViability localSecretViability](self, "localSecretViability");
  if (v18 != objc_msgSend(v4, "localSecretViability"))
    goto LABEL_17;
  v19 = -[CDPEscrowRecordViability tlkRecoveryViability](self, "tlkRecoveryViability");
  if (v19 != objc_msgSend(v4, "tlkRecoveryViability"))
    goto LABEL_17;
  v20 = -[CDPEscrowRecordViability pcsRecoveryViability](self, "pcsRecoveryViability");
  if (v20 != objc_msgSend(v4, "pcsRecoveryViability"))
    goto LABEL_17;
  v21 = -[CDPEscrowRecordViability sosViability](self, "sosViability");
  v22 = v21 == objc_msgSend(v4, "sosViability");
LABEL_18:

  return v22;
}

- (BOOL)hasRecords
{
  return self->_hasRecords;
}

- (NSString)recordId
{
  return self->_recordId;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (BOOL)isForCurrentDevice
{
  return self->_isForCurrentDevice;
}

- (BOOL)hasMachineId
{
  return self->_hasMachineId;
}

- (void)setHasMachineId:(BOOL)a3
{
  self->_hasMachineId = a3;
}

- (BOOL)recordIsValid
{
  return self->_recordIsValid;
}

- (unint64_t)recordViability
{
  return self->_recordViability;
}

- (unint64_t)localSecretViability
{
  return self->_localSecretViability;
}

- (unint64_t)tlkRecoveryViability
{
  return self->_tlkRecoveryViability;
}

- (unint64_t)pcsRecoveryViability
{
  return self->_pcsRecoveryViability;
}

- (unint64_t)sosViability
{
  return self->_sosViability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
}

- (void)localViability
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"localViability: No records found returning NotFound\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updatedViabiltyWithRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
}

@end
