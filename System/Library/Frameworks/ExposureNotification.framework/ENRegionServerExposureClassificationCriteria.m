@implementation ENRegionServerExposureClassificationCriteria

+ (BOOL)getCriteria:(id *)a3 fromDictionary:(id)a4 index:(unsigned __int8)a5
{
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  unsigned int (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  _BOOL4 v15;
  id v16;
  ENRegionServerExposureClassificationCriteria *v17;
  uint64_t v18;
  NSString *classificationName;
  uint64_t v20;
  NSDictionary *perDaySumERVThresholdsByDiagnosisReportType;
  ENRegionServerExposureClassificationCriteria *v22;
  ENRegionServerExposureClassificationCriteria *v23;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  unsigned __int8 v31;

  v7 = a4;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __81__ENRegionServerExposureClassificationCriteria_getCriteria_fromDictionary_index___block_invoke;
    v29[3] = &unk_24C38B208;
    v31 = a5;
    v30 = v7;
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD2F464](v29);
    ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("classificationName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("perDaySumERVThreshold"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (UInt64NumIsInRange(v25))
      {
        ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("perDayMaxERVThreshold"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (UInt64NumIsInRange(v10))
        {
          v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v27[0] = v8;
          v27[1] = 3221225472;
          v27[2] = __81__ENRegionServerExposureClassificationCriteria_getCriteria_fromDictionary_index___block_invoke_2;
          v27[3] = &unk_24C38B230;
          v12 = v9;
          v27[4] = v11;
          v28 = v12;
          v13 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD2F464](v27);
          if (((unsigned int (**)(_QWORD, uint64_t, const __CFString *))v13)[2](v13, 1, CFSTR("confirmedTestPerDaySumERVThreshold"))&& ((unsigned int (**)(_QWORD, uint64_t, const __CFString *))v13)[2](v13, 2, CFSTR("clinicalDiagnosisPerDaySumERVThreshold"))&& ((unsigned int (**)(_QWORD, uint64_t, const __CFString *))v13)[2](v13, 3, CFSTR("selfReportPerDaySumERVThreshold"))&& ((unsigned int (**)(_QWORD, uint64_t, const __CFString *))v13)[2](v13, 4, CFSTR("recursivePerDaySumERVThreshold")))
          {
            ((void (**)(_QWORD, const __CFString *))v9)[2](v12, CFSTR("weightedDurationAtAttenuationThreshold"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = UInt64NumIsInRange(v14);
            if (v15)
            {
              v16 = v7;
              v17 = objc_alloc_init(ENRegionServerExposureClassificationCriteria);
              v18 = objc_msgSend(v26, "copy");
              classificationName = v17->_classificationName;
              v17->_classificationName = (NSString *)v18;

              v17->_index = a5;
              v17->_perDaySumERVThreshold = objc_msgSend(v25, "unsignedIntValue");
              v17->_perDayMaxERVThreshold = objc_msgSend(v10, "unsignedIntValue");
              v20 = objc_msgSend(v11, "copy");
              perDaySumERVThresholdsByDiagnosisReportType = v17->_perDaySumERVThresholdsByDiagnosisReportType;
              v17->_perDaySumERVThresholdsByDiagnosisReportType = (NSDictionary *)v20;

              v17->_weightedDurationAtAttenuationThreshold = objc_msgSend(v14, "unsignedIntValue");
              v22 = v17;
              v7 = v16;
              v23 = objc_retainAutorelease(v22);
              *a3 = v23;

            }
          }
          else
          {
            LOBYTE(v15) = 0;
          }

        }
        else
        {
          LOBYTE(v15) = 0;
        }

      }
      else
      {
        LOBYTE(v15) = 0;
      }

    }
    else
    {
      *a3 = 0;
      LOBYTE(v15) = 1;
    }

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

id __81__ENRegionServerExposureClassificationCriteria_getCriteria_fromDictionary_index___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@_%d"), v4, *(unsigned __int8 *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __81__ENRegionServerExposureClassificationCriteria_getCriteria_fromDictionary_index___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (!UInt64NumIsInRange(v4))
    {
      v8 = 0;
      goto LABEL_5;
    }
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
  v8 = 1;
LABEL_5:

  return v8;
}

- (ENRegionServerExposureClassificationCriteria)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ENRegionServerExposureClassificationCriteria *v10;
  ENRegionServerExposureClassificationCriteria *v11;
  ENRegionServerExposureClassificationCriteria *v12;
  objc_super v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCF20]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("pdsThDRT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)ENRegionServerExposureClassificationCriteria;
    v10 = -[ENRegionServerExposureClassificationCriteria init](&v14, sel_init);
    self = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_classificationName, v5);
      v15 = 0;
      if (NSDecodeSInt64RangedIfPresent())
        self->_index = v15;
      self->_perDaySumERVThreshold = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pdsTh"));
      self->_perDayMaxERVThreshold = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pdsMax"));
      objc_storeStrong((id *)&self->_perDaySumERVThresholdsByDiagnosisReportType, v9);
      self->_weightedDurationAtAttenuationThreshold = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("wdaa"));
      v11 = self;
    }

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_classificationName, CFSTR("name"));
  if (self->_index)
    objc_msgSend(v4, "encodeInteger:forKey:");
  objc_msgSend(v4, "encodeInt64:forKey:", self->_perDaySumERVThreshold, CFSTR("pdsTh"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_perDayMaxERVThreshold, CFSTR("pdsMax"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_perDaySumERVThresholdsByDiagnosisReportType, CFSTR("pdsThDRT"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_weightedDurationAtAttenuationThreshold, CFSTR("wdaa"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)classificationName
{
  return self->_classificationName;
}

- (unsigned)index
{
  return self->_index;
}

- (unsigned)perDaySumERVThreshold
{
  return self->_perDaySumERVThreshold;
}

- (unsigned)perDayMaxERVThreshold
{
  return self->_perDayMaxERVThreshold;
}

- (NSDictionary)perDaySumERVThresholdsByDiagnosisReportType
{
  return self->_perDaySumERVThresholdsByDiagnosisReportType;
}

- (unsigned)weightedDurationAtAttenuationThreshold
{
  return self->_weightedDurationAtAttenuationThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perDaySumERVThresholdsByDiagnosisReportType, 0);
  objc_storeStrong((id *)&self->_classificationName, 0);
}

@end
