@implementation ENExposureClassification

- (ENExposureClassification)initWithCoder:(id)a3
{
  id v4;
  ENExposureClassification *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  ENExposureClassification *v10;
  _QWORD v12[4];
  id v13;
  objc_super v14;
  uint64_t v15;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ENExposureClassification;
  v5 = -[ENExposureClassification init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_storeStrong((id *)&v5->_name, v6);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_storeStrong((id *)&v5->_date, v7);
        v15 = 0;
        if (NSDecodeSInt64RangedIfPresent())
          v5->_index = v15;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reg"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_storeStrong((id *)&v5->_region, v8);
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __42__ENExposureClassification_initWithCoder___block_invoke;
          v12[3] = &unk_24C38AF00;
          v13 = v4;
          v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD2F464](v12);
          ((void (**)(_QWORD, NSNumber **, const __CFString *))v9)[2](v9, &v5->_confirmedTestPerDaySumERVAboveThreshold, CFSTR("ctestS"));
          ((void (**)(_QWORD, NSNumber **, const __CFString *))v9)[2](v9, &v5->_clinicalDiagnosisPerDaySumERVAboveThreshold, CFSTR("cdiagS"));
          ((void (**)(_QWORD, NSNumber **, const __CFString *))v9)[2](v9, &v5->_selfReportPerDaySumERVAboveThreshold, CFSTR("selfS"));
          ((void (**)(_QWORD, NSNumber **, const __CFString *))v9)[2](v9, &v5->_recursivePerDaySumERVAboveThreshold, CFSTR("recurS"));
          ((void (**)(_QWORD, NSNumber **, const __CFString *))v9)[2](v9, &v5->_perDayMaxERVAboveThreshold, CFSTR("pdM"));
          ((void (**)(_QWORD, NSNumber **, const __CFString *))v9)[2](v9, &v5->_perDaySumERVAboveThreshold, CFSTR("pdS"));
          ((void (**)(_QWORD, NSNumber **, const __CFString *))v9)[2](v9, &v5->_weightedDurationAtAttenuationAboveThreshold, CFSTR("wdaa"));
          v10 = v5;

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __42__ENExposureClassification_initWithCoder___block_invoke(uint64_t a1, void **a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsValueForKey:"))
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 32), "decodeDoubleForKey:", v8);
    objc_msgSend(v5, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *a2;
    *a2 = (void *)v6;

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, CFSTR("date"));
  if (self->_index)
    objc_msgSend(v4, "encodeInteger:forKey:");
  objc_msgSend(v4, "encodeObject:forKey:", self->_region, CFSTR("reg"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__ENExposureClassification_encodeWithCoder___block_invoke;
  v7[3] = &unk_24C38AF28;
  v8 = v4;
  v5 = v4;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD2F464](v7);
  ((void (**)(_QWORD, NSNumber *, const __CFString *))v6)[2](v6, self->_confirmedTestPerDaySumERVAboveThreshold, CFSTR("ctestS"));
  ((void (**)(_QWORD, NSNumber *, const __CFString *))v6)[2](v6, self->_clinicalDiagnosisPerDaySumERVAboveThreshold, CFSTR("cdiagS"));
  ((void (**)(_QWORD, NSNumber *, const __CFString *))v6)[2](v6, self->_selfReportPerDaySumERVAboveThreshold, CFSTR("selfS"));
  ((void (**)(_QWORD, NSNumber *, const __CFString *))v6)[2](v6, self->_recursivePerDaySumERVAboveThreshold, CFSTR("recurS"));
  ((void (**)(_QWORD, NSNumber *, const __CFString *))v6)[2](v6, self->_perDayMaxERVAboveThreshold, CFSTR("pdM"));
  ((void (**)(_QWORD, NSNumber *, const __CFString *))v6)[2](v6, self->_perDaySumERVAboveThreshold, CFSTR("pdS"));
  ((void (**)(_QWORD, NSNumber *, const __CFString *))v6)[2](v6, self->_weightedDurationAtAttenuationAboveThreshold, CFSTR("wdaa"));

}

void __44__ENExposureClassification_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a3;
    objc_msgSend(a2, "doubleValue");
    objc_msgSend(v4, "encodeDouble:forKey:", v5);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  id v5;
  ENRegion *region;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  ENRegion *v24;
  void *v25;
  NSString *name;
  uint64_t index;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34[2];
  id v35;
  uint64_t v36;

  v36 = 0;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  index = self->_index;
  NSAppendPrintF_safe();
  v5 = 0;

  v35 = v5;
  region = self->_region;
  if (!region)
    region = (ENRegion *)CFSTR("<>");
  v24 = region;
  NSAppendPrintF_safe();
  v7 = v35;

  v34[1] = v7;
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate", v24, name, index);
  CUPrintDateCF();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v8 = v7;

  v34[0] = v8;
  __39__ENExposureClassification_description__block_invoke(v9, (uint64_t)v34, self->_confirmedTestPerDaySumERVAboveThreshold, CFSTR("CTest"));
  v10 = v34[0];

  v33 = v10;
  __39__ENExposureClassification_description__block_invoke(v11, (uint64_t)&v33, self->_clinicalDiagnosisPerDaySumERVAboveThreshold, CFSTR("CClin"));
  v12 = v33;

  v32 = v12;
  __39__ENExposureClassification_description__block_invoke(v13, (uint64_t)&v32, self->_selfReportPerDaySumERVAboveThreshold, CFSTR("SelfRep"));
  v14 = v32;

  v31 = v14;
  __39__ENExposureClassification_description__block_invoke(v15, (uint64_t)&v31, self->_recursivePerDaySumERVAboveThreshold, CFSTR("Recurs"));
  v16 = v31;

  v30 = v16;
  __39__ENExposureClassification_description__block_invoke(v17, (uint64_t)&v30, self->_perDayMaxERVAboveThreshold, CFSTR("PDayMax"));
  v18 = v30;

  v29 = v18;
  __39__ENExposureClassification_description__block_invoke(v19, (uint64_t)&v29, self->_perDaySumERVAboveThreshold, CFSTR("PDaySum"));
  v20 = v29;

  v28 = v20;
  __39__ENExposureClassification_description__block_invoke(v21, (uint64_t)&v28, self->_weightedDurationAtAttenuationAboveThreshold, CFSTR("WDuration"));
  v22 = v28;

  return v22;
}

void __39__ENExposureClassification_description__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;

  if (a3)
  {
    v5 = a4;
    objc_msgSend(a3, "doubleValue");
    NSAppendPrintF_safe();

  }
}

- (BOOL)anyThresholdsExceeded
{
  return self->_confirmedTestPerDaySumERVAboveThreshold
      || self->_clinicalDiagnosisPerDaySumERVAboveThreshold
      || self->_selfReportPerDaySumERVAboveThreshold
      || self->_recursivePerDaySumERVAboveThreshold
      || self->_perDayMaxERVAboveThreshold
      || self->_perDaySumERVAboveThreshold
      || self->_weightedDurationAtAttenuationAboveThreshold != 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned __int8)a3
{
  self->_index = a3;
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)confirmedTestPerDaySumERVAboveThreshold
{
  return self->_confirmedTestPerDaySumERVAboveThreshold;
}

- (void)setConfirmedTestPerDaySumERVAboveThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)clinicalDiagnosisPerDaySumERVAboveThreshold
{
  return self->_clinicalDiagnosisPerDaySumERVAboveThreshold;
}

- (void)setClinicalDiagnosisPerDaySumERVAboveThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)selfReportPerDaySumERVAboveThreshold
{
  return self->_selfReportPerDaySumERVAboveThreshold;
}

- (void)setSelfReportPerDaySumERVAboveThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)recursivePerDaySumERVAboveThreshold
{
  return self->_recursivePerDaySumERVAboveThreshold;
}

- (void)setRecursivePerDaySumERVAboveThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)perDayMaxERVAboveThreshold
{
  return self->_perDayMaxERVAboveThreshold;
}

- (void)setPerDayMaxERVAboveThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)perDaySumERVAboveThreshold
{
  return self->_perDaySumERVAboveThreshold;
}

- (void)setPerDaySumERVAboveThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)weightedDurationAtAttenuationAboveThreshold
{
  return self->_weightedDurationAtAttenuationAboveThreshold;
}

- (void)setWeightedDurationAtAttenuationAboveThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightedDurationAtAttenuationAboveThreshold, 0);
  objc_storeStrong((id *)&self->_perDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_perDayMaxERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_recursivePerDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_selfReportPerDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_clinicalDiagnosisPerDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_confirmedTestPerDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
