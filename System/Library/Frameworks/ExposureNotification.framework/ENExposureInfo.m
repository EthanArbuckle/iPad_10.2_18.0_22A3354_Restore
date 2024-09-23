@implementation ENExposureInfo

- (ENExposureInfo)init
{
  ENExposureInfo *v2;
  ENExposureInfo *v3;
  NSArray *attenuationDurations;
  ENExposureInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ENExposureInfo;
  v2 = -[ENExposureInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    attenuationDurations = v2->_attenuationDurations;
    v2->_attenuationDurations = (NSArray *)&unk_24C397100;

    v3->_daysSinceOnsetOfSymptoms = 0x7FFFFFFFFFFFFFFFLL;
    v5 = v3;
  }

  return v3;
}

- (ENExposureInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureInfo *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  NSArray *attenuationDurations;
  void *v14;
  uint64_t v15;
  NSDictionary *metadata;
  ENExposureInfo *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[ENExposureInfo init](self, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_30;
LABEL_29:
    ENErrorF(2);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_30;
    goto LABEL_29;
  }
  if (!CUXPCDecodeNSArrayOfInteger())
    goto LABEL_30;
  v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_attenuationValue = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_30;
  }
  if (!CUXPCDecodeDouble())
    goto LABEL_30;
  v9 = CUXPCDecodeSInt64RangedEx();
  if (v9 == 6)
  {
    v7->_daysSinceOnsetOfSymptoms = 0;
  }
  else if (v9 == 5)
  {
    goto LABEL_30;
  }
  v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    v7->_diagnosisReportType = 0;
  }
  else if (v10 == 5)
  {
    goto LABEL_30;
  }
  if (!CUXPCDecodeDouble())
    goto LABEL_30;
  v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_totalRiskScore = 0;
  }
  else if (v11 == 5)
  {
    goto LABEL_30;
  }
  if (!CUXPCDecodeDouble())
    goto LABEL_30;
  v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 != 6)
  {
    if (v12 != 5)
      goto LABEL_22;
LABEL_30:
    v17 = 0;
    goto LABEL_25;
  }
  v7->_transmissionRiskLevel = 0;
LABEL_22:
  attenuationDurations = v7->_attenuationDurations;
  if (!attenuationDurations)
    attenuationDurations = (NSArray *)MEMORY[0x24BDBD1A8];
  v19[1] = CFSTR("totalRiskScoreFullRange");
  v20[0] = attenuationDurations;
  v19[0] = CFSTR("attenuationDurations");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7->_totalRiskScoreFullRange);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v15 = objc_claimAutoreleasedReturnValue();
  metadata = v7->_metadata;
  v7->_metadata = (NSDictionary *)v15;

  v17 = v7;
LABEL_25:

  return v17;
}

- (void)encodeWithXPCObject:(id)a3
{
  int64_t daysSinceOnsetOfSymptoms;
  uint64_t diagnosisReportType;
  NSDate *v6;
  NSDate *v7;
  double v8;
  double duration;
  void *v10;
  double totalRiskScoreFullRange;
  xpc_object_t xdict;

  xdict = a3;
  CUXPCEncodeNSArrayOfNSNumber();
  if (self->_attenuationValue)
    xpc_dictionary_set_uint64(xdict, "attV", self->_attenuationValue);
  daysSinceOnsetOfSymptoms = self->_daysSinceOnsetOfSymptoms;
  if (daysSinceOnsetOfSymptoms != 0x7FFFFFFFFFFFFFFFLL)
    xpc_dictionary_set_int64(xdict, "dSOS", daysSinceOnsetOfSymptoms);
  diagnosisReportType = self->_diagnosisReportType;
  if ((_DWORD)diagnosisReportType)
    xpc_dictionary_set_uint64(xdict, "dRT", diagnosisReportType);
  v6 = self->_date;
  v7 = v6;
  if (v6)
  {
    -[NSDate timeIntervalSinceReferenceDate](v6, "timeIntervalSinceReferenceDate");
    if (v8 != 0.0)
      xpc_dictionary_set_double(xdict, "tims", v8);
  }

  duration = self->_duration;
  if (duration != 0.0)
    xpc_dictionary_set_double(xdict, "dura", duration);
  v10 = xdict;
  if (self->_totalRiskScore)
  {
    xpc_dictionary_set_uint64(xdict, "toRS", self->_totalRiskScore);
    v10 = xdict;
  }
  totalRiskScoreFullRange = self->_totalRiskScoreFullRange;
  if (totalRiskScoreFullRange == 0.0)
  {
    CFDictionaryGetDouble();
    v10 = xdict;
  }
  if (totalRiskScoreFullRange != 0.0)
  {
    xpc_dictionary_set_double(xdict, "toRSFR", totalRiskScoreFullRange);
    v10 = xdict;
  }
  xpc_dictionary_set_uint64(v10, "trRL", self->_transmissionRiskLevel);

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  NSArray *v6;
  id v7;
  NSDate *date;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSDate *v16;
  void *v17;

  NSAppendPrintF_safe();
  v3 = 0;
  v4 = v3;
  if (self->_attenuationValue)
  {
    v17 = v3;
    NSAppendPrintF_safe();
    v5 = v17;

    v4 = v5;
  }
  v6 = self->_attenuationDurations;
  if (-[NSArray count](v6, "count"))
  {
    NSAppendPrintF();
    v7 = v4;

    v4 = v7;
  }
  date = self->_date;
  if (date)
  {
    v16 = date;
    NSAppendPrintF_safe();
    v9 = v4;

    v4 = v9;
  }
  if (self->_duration > 0.0)
  {
    NSAppendPrintF_safe();
    v10 = v4;

    v4 = v10;
  }
  if (self->_daysSinceOnsetOfSymptoms != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSAppendPrintF_safe();
    v11 = v4;

    v4 = v11;
  }
  if (self->_diagnosisReportType)
  {
    NSAppendPrintF_safe();
    v12 = v4;

    v4 = v12;
  }
  NSAppendPrintF_safe();
  v13 = v4;

  if (self->_totalRiskScore)
  {
    NSAppendPrintF_safe();
    v14 = v13;

    v13 = v14;
  }

  return v13;
}

- (NSArray)attenuationDurations
{
  return self->_attenuationDurations;
}

- (void)setAttenuationDurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ENAttenuation)attenuationValue
{
  return self->_attenuationValue;
}

- (void)setAttenuationValue:(unsigned __int8)a3
{
  self->_attenuationValue = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSInteger)daysSinceOnsetOfSymptoms
{
  return self->_daysSinceOnsetOfSymptoms;
}

- (void)setDaysSinceOnsetOfSymptoms:(int64_t)a3
{
  self->_daysSinceOnsetOfSymptoms = a3;
}

- (ENDiagnosisReportType)diagnosisReportType
{
  return self->_diagnosisReportType;
}

- (void)setDiagnosisReportType:(unsigned int)a3
{
  self->_diagnosisReportType = a3;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ENRiskScore)totalRiskScore
{
  return self->_totalRiskScore;
}

- (void)setTotalRiskScore:(unsigned __int8)a3
{
  self->_totalRiskScore = a3;
}

- (double)totalRiskScoreFullRange
{
  return self->_totalRiskScoreFullRange;
}

- (void)setTotalRiskScoreFullRange:(double)a3
{
  self->_totalRiskScoreFullRange = a3;
}

- (ENRiskLevel)transmissionRiskLevel
{
  return self->_transmissionRiskLevel;
}

- (void)setTransmissionRiskLevel:(unsigned __int8)a3
{
  self->_transmissionRiskLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_attenuationDurations, 0);
}

@end
