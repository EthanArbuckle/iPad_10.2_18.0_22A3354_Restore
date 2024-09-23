@implementation ENTemporaryExposureKey

- (ENTemporaryExposureKey)init
{
  ENTemporaryExposureKey *v2;
  ENTemporaryExposureKey *v3;
  ENTemporaryExposureKey *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENTemporaryExposureKey;
  v2 = -[ENTemporaryExposureKey init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_daysSinceOnsetOfSymptoms = 0x7FFFFFFFFFFFFFFFLL;
    v2->_rollingPeriod = 144;
    v4 = v2;
  }

  return v3;
}

- (ENTemporaryExposureKey)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENTemporaryExposureKey *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  ENTemporaryExposureKey *v13;

  v6 = a3;
  v7 = -[ENTemporaryExposureKey init](self, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_25;
LABEL_24:
    ENErrorF(2);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_25;
    goto LABEL_24;
  }
  v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_daysSinceOnsetOfSymptoms = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_25;
  }
  v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_diagnosisReportType = 0;
  }
  else if (v9 == 5)
  {
    goto LABEL_25;
  }
  if (!CUXPCDecodeNSDataOfLength())
    goto LABEL_25;
  v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    v7->_rollingStartNumber = 0;
  }
  else if (v10 == 5)
  {
    goto LABEL_25;
  }
  v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_transmissionRiskLevel = 0;
  }
  else if (v11 == 5)
  {
    goto LABEL_25;
  }
  v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 != 6)
  {
    if (v12 != 5)
      goto LABEL_19;
LABEL_25:
    v13 = 0;
    goto LABEL_20;
  }
  v7->_variantOfConcernType = 0;
LABEL_19:
  v7->_revised = xpc_dictionary_get_BOOL(v6, "tekRv");
  v7->_rollingPeriod = xpc_dictionary_get_uint64(v6, "rlgP");
  v7->_vaccinated = xpc_dictionary_get_BOOL(v6, "vaccinated");
  v13 = v7;
LABEL_20:

  return v13;
}

- (void)encodeWithXPCObject:(id)a3
{
  int64_t daysSinceOnsetOfSymptoms;
  uint64_t diagnosisReportType;
  NSData *keyData;
  NSData *v7;
  id v8;
  NSData *v9;
  uint64_t v10;
  const char *v11;
  size_t v12;
  uint64_t rollingStartNumber;
  void *v14;
  uint64_t variantOfConcernType;
  xpc_object_t xdict;

  xdict = a3;
  daysSinceOnsetOfSymptoms = self->_daysSinceOnsetOfSymptoms;
  if (daysSinceOnsetOfSymptoms != 0x7FFFFFFFFFFFFFFFLL)
    xpc_dictionary_set_int64(xdict, "dSOS", daysSinceOnsetOfSymptoms);
  diagnosisReportType = self->_diagnosisReportType;
  if ((_DWORD)diagnosisReportType)
    xpc_dictionary_set_uint64(xdict, "dRT", diagnosisReportType);
  keyData = self->_keyData;
  if (keyData)
  {
    v7 = objc_retainAutorelease(keyData);
    v8 = xdict;
    v9 = v7;
    v10 = -[NSData bytes](v9, "bytes");
    if (v10)
      v11 = (const char *)v10;
    else
      v11 = "";
    v12 = -[NSData length](v9, "length");

    xpc_dictionary_set_data(v8, "keyD", v11, v12);
  }
  rollingStartNumber = self->_rollingStartNumber;
  if ((_DWORD)rollingStartNumber)
    xpc_dictionary_set_uint64(xdict, "rlSN", rollingStartNumber);
  v14 = xdict;
  if (self->_transmissionRiskLevel)
  {
    xpc_dictionary_set_uint64(xdict, "trRL", self->_transmissionRiskLevel);
    v14 = xdict;
  }
  variantOfConcernType = self->_variantOfConcernType;
  if ((_DWORD)variantOfConcernType)
  {
    xpc_dictionary_set_uint64(xdict, "vcRT", variantOfConcernType);
    v14 = xdict;
  }
  xpc_dictionary_set_BOOL(v14, "tekRv", self->_revised);
  xpc_dictionary_set_uint64(xdict, "rlgP", self->_rollingPeriod);
  xpc_dictionary_set_BOOL(xdict, "vaccinated", self->_vaccinated);

}

- (void)deriveRollingProximityIdentifiersWithBuffer:(id *)a3 count:(unint64_t)a4
{
  void *v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  if (!-[ENTemporaryExposureKey isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENCommon.m"), 558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valid"));

  }
  v9[2] = 0;
  v9[3] = 0;
  -[NSData bytes](self->_keyData, "bytes");
  if (-[NSData length](self->_keyData, "length") <= 0xF)
    -[NSData length](self->_keyData, "length");
  __memcpy_chk();
  v9[0] = 0;
  v9[1] = 0;
  ENRPIKDerive();
  ENRPIDeriveBatch((uint64_t)a3, (uint64_t)v9, self->_rollingStartNumber, a4);
}

- (void)getAEMBytes:(void *)a3 input:(const void *)a4 length:(unint64_t)a5 RPI:(id *)a6
{
  void *v8;

  if (!-[ENTemporaryExposureKey isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENCommon.m"), 575, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valid"));

  }
  -[NSData bytes](self->_keyData, "bytes");
  if (-[NSData length](self->_keyData, "length") <= 0xF)
    -[NSData length](self->_keyData, "length");
  __memcpy_chk();
  ENAEMKDerive();
  ENAEMCrypt();
}

- (BOOL)isValid
{
  return -[NSData length](self->_keyData, "length") == 16;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v17;
  id v18;
  _QWORD v19[3];
  id v20;
  uint64_t v21;

  v21 = 0;
  NSAppendPrintF_safe();
  v3 = 0;
  v4 = v3;
  if (self->_revised)
  {
    v20 = v3;
    v17 = "yes";
    NSAppendPrintF_safe();
    v5 = v20;

    v4 = v5;
  }
  v19[2] = v4;
  -[NSData bytes](self->_keyData, "bytes", v17);
  -[NSData length](self->_keyData, "length");
  NSAppendPrintF();
  v6 = v4;

  v19[1] = v6;
  NSAppendPrintF_safe();
  v7 = v6;

  if (self->_daysSinceOnsetOfSymptoms == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = v7;
    v8 = &v18;
  }
  else
  {
    v19[0] = v7;
    v8 = (id *)v19;
  }
  NSAppendPrintF_safe();
  v9 = *v8;

  NSAppendPrintF_safe();
  v10 = v9;

  NSAppendPrintF_safe();
  v11 = v10;

  NSAppendPrintF_safe();
  v12 = v11;

  NSAppendPrintF_safe();
  v13 = v12;

  NSAppendPrintF_safe();
  v14 = v13;

  NSAppendPrintF_safe();
  v15 = v14;

  return v15;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(NSData *)keyData
{
  objc_setProperty_nonatomic_copy(self, a2, keyData, 32);
}

- (ENIntervalNumber)rollingPeriod
{
  return self->_rollingPeriod;
}

- (void)setRollingPeriod:(ENIntervalNumber)rollingPeriod
{
  self->_rollingPeriod = rollingPeriod;
}

- (ENIntervalNumber)rollingStartNumber
{
  return self->_rollingStartNumber;
}

- (void)setRollingStartNumber:(ENIntervalNumber)rollingStartNumber
{
  self->_rollingStartNumber = rollingStartNumber;
}

- (ENRiskLevel)transmissionRiskLevel
{
  return self->_transmissionRiskLevel;
}

- (void)setTransmissionRiskLevel:(ENRiskLevel)transmissionRiskLevel
{
  self->_transmissionRiskLevel = transmissionRiskLevel;
}

- (int64_t)daysSinceOnsetOfSymptoms
{
  return self->_daysSinceOnsetOfSymptoms;
}

- (void)setDaysSinceOnsetOfSymptoms:(int64_t)a3
{
  self->_daysSinceOnsetOfSymptoms = a3;
}

- (unsigned)diagnosisReportType
{
  return self->_diagnosisReportType;
}

- (void)setDiagnosisReportType:(unsigned int)a3
{
  self->_diagnosisReportType = a3;
}

- (BOOL)vaccinated
{
  return self->_vaccinated;
}

- (void)setVaccinated:(BOOL)a3
{
  self->_vaccinated = a3;
}

- (BOOL)revised
{
  return self->_revised;
}

- (void)setRevised:(BOOL)a3
{
  self->_revised = a3;
}

- (unsigned)variantOfConcernType
{
  return self->_variantOfConcernType;
}

- (void)setVariantOfConcernType:(unsigned int)a3
{
  self->_variantOfConcernType = a3;
}

- (unsigned)originalVariantOfConcernType
{
  return self->_originalVariantOfConcernType;
}

- (void)setOriginalVariantOfConcernType:(unsigned int)a3
{
  self->_originalVariantOfConcernType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
}

@end
