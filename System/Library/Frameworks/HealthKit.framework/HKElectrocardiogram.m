@implementation HKElectrocardiogram

+ (id)_electrocardiogramWithStartDate:(id)a3 device:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HKObjectType electrocardiogramType](HKElectrocardiogramType, "electrocardiogramType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v15 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v11, v9, v10, 0, v13, v14);

  return v15;
}

- (NSArray)leadNames
{
  id v3;
  char *begin;
  char *i;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  begin = (char *)self->_reading._leads._v.__begin_;
  for (i = (char *)self->_reading._leads._v.__end_; begin != i; begin += 8)
  {
    if ((*(_BYTE *)(*(_QWORD *)begin + 60) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(int *)(*(_QWORD *)begin + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

    }
  }
  return (NSArray *)v3;
}

- (NSInteger)numberOfVoltageMeasurements
{
  void *begin;

  begin = self->_reading._leads._v.__begin_;
  if (self->_reading._leads._v.__end_ == begin)
    return 0;
  else
    return (uint64_t)(*(_QWORD *)(*(_QWORD *)begin + 40) - *(_QWORD *)(*(_QWORD *)begin + 32)) >> 2;
}

- (HKQuantity)samplingFrequency
{
  Electrocardiogram *p_reading;
  void *v3;
  void *v4;

  p_reading = &self->_reading;
  if ((*(_BYTE *)&self->_reading._has & 1) != 0)
  {
    +[HKUnit hertzUnit](HKUnit, "hertzUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, p_reading->_frequency);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (HKQuantity *)v3;
}

- (HKQuantity)averageHeartRate
{
  return self->_averageHeartRate;
}

- (int64_t)symptoms
{
  return self->_symptomsStatus;
}

- (HKElectrocardiogramClassification)classification
{
  unint64_t v2;

  v2 = -[HKElectrocardiogram privateClassification](self, "privateClassification");
  if (v2 - 1 > 9)
    return 0;
  else
    return qword_19A44D338[v2 - 1];
}

- (unint64_t)privateClassification
{
  return self->_privateClassification;
}

- (NSNumber)_algorithmVersion
{
  void *v2;
  void *v3;
  id v4;

  -[HKObject metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HKMetadataKeyAppleECGAlgorithmVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &unk_1E3896A30;

  return (NSNumber *)v4;
}

- (void)setReading:(Electrocardiogram *)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  binarysample::Electrocardiogram::operator=((uint64_t)&self->_reading, (const binarysample::Electrocardiogram *)a3);
  -[HKElectrocardiogram samplingFrequency](self, "samplingFrequency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit hertzUnit](HKUnit, "hertzUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValueForUnit:", v5);
  v7 = v6;

  -[HKSample _startTimestamp](self, "_startTimestamp");
  -[HKSample _setEndTimestamp:](self, "_setEndTimestamp:", v8 + (double)-[HKElectrocardiogram numberOfVoltageMeasurements](self, "numberOfVoltageMeasurements") / v7);
}

- (void)_setAverageHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRate, a3);
}

- (void)_setPrivateClassification:(unint64_t)a3
{
  self->_privateClassification = a3;
}

- (void)_setSymptomsStatus:(int64_t)a3
{
  self->_symptomsStatus = a3;
}

- (void)copyMeasurementValuesForLead:(int64_t)a3 count:(unint64_t)a4 target:(float *)a5
{
  char *begin;
  char *i;
  uint64_t v10;
  const void *v11;
  unint64_t v12;

  begin = (char *)self->_reading._leads._v.__begin_;
  for (i = (char *)self->_reading._leads._v.__end_; begin != i; begin += 8)
  {
    v10 = *(_QWORD *)begin;
    if ((*(_BYTE *)(*(_QWORD *)begin + 60) & 1) != 0 && *(_DWORD *)(v10 + 56) == a3)
    {
      v11 = *(const void **)(v10 + 32);
      v12 = (uint64_t)(*(_QWORD *)(v10 + 40) - (_QWORD)v11) >> 2;
      if (v12 >= a4)
        v12 = a4;
      if (v12)
        memmove(a5, v11, 4 * v12);
    }
  }
}

- (void)copyMeasurementFlagsForLead:(int64_t)a3 count:(unint64_t)a4 target:(char *)a5
{
  char *begin;
  char *end;
  uint64_t v7;
  int64_t v8;
  uint64_t i;

  begin = (char *)self->_reading._leads._v.__begin_;
  end = (char *)self->_reading._leads._v.__end_;
  while (begin != end)
  {
    v7 = *(_QWORD *)begin;
    if ((*(_BYTE *)(*(_QWORD *)begin + 60) & 1) != 0 && *(_DWORD *)(v7 + 56) == a3)
    {
      v8 = (uint64_t)(*(_QWORD *)(v7 + 16) - *(_QWORD *)(v7 + 8)) >> 2;
      if (v8 >= a4)
        v8 = a4;
      if (v8 >= 1)
      {
        for (i = 0; i != v8; ++i)
          a5[i] = *(_DWORD *)(*(_QWORD *)(v7 + 8) + 4 * i);
      }
    }
    begin += 8;
  }
}

- (void)_enumerateDataForLead:(int64_t)a3 block:(id)a4
{
  void (**v6)(id, unint64_t, uint8_t *, float);
  void *v7;
  char *begin;
  char *end;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, unint64_t, uint8_t *, float))a4;
  -[HKElectrocardiogram samplingFrequency](self, "samplingFrequency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    begin = (char *)self->_reading._leads._v.__begin_;
    end = (char *)self->_reading._leads._v.__end_;
    while (begin != end)
    {
      v10 = *(_QWORD *)begin;
      if ((*(_BYTE *)(*(_QWORD *)begin + 60) & 1) != 0 && *(_DWORD *)(v10 + 56) == a3)
      {
        v14 = *(_QWORD *)(v10 + 32);
        if (*(_QWORD *)(v10 + 40) != v14)
        {
          v15 = 0;
          do
          {
            v16[0] = 0;
            v6[2](v6, v15, v16, *(float *)(v14 + 4 * v15));
            if (v16[0])
              break;
            ++v15;
            v14 = *(_QWORD *)(v10 + 32);
          }
          while (v15 < (*(_QWORD *)(v10 + 40) - v14) >> 2);
        }
        break;
      }
      begin += 8;
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = (id)HKLogHeartRhythm;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[HKObject UUID](self, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKElectrocardiogram _enumerateDataForLead:block:].cold.1(v13, v16, v11, v12);
    }

  }
}

- (id)voltageMeasurementEnumerator
{
  char *begin;
  char *end;
  uint64_t v4;

  begin = (char *)self->_reading._leads._v.__begin_;
  end = (char *)self->_reading._leads._v.__end_;
  if (begin == end)
    return 0;
  while (1)
  {
    v4 = *(_QWORD *)begin;
    if ((*(_BYTE *)(*(_QWORD *)begin + 60) & 1) != 0 && *(_DWORD *)(v4 + 56) == 1)
      break;
    begin += 8;
    if (begin == end)
      return 0;
  }
  return -[_HKElectrocardiogramVoltageMeasurementEnumerator initWithElectrocardiogram:leadIMicroVoltsBegin:end:]([_HKElectrocardiogramVoltageMeasurementEnumerator alloc], "initWithElectrocardiogram:leadIMicroVoltsBegin:end:", self, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40));
}

- (void)_setPayload:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const unsigned __int8 *v7;
  _BYTE v8[48];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = (const unsigned __int8 *)objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "length");
    PB::Reader::Reader((PB::Reader *)v8, v7);
    (*((void (**)(Electrocardiogram *, _BYTE *))self->_reading._vptr$Base + 2))(&self->_reading, v8);
  }
  else
  {
    binarysample::Electrocardiogram::Electrocardiogram((uint64_t)v8);
    binarysample::Electrocardiogram::operator=((uint64_t)&self->_reading, (uint64_t)v8);
    binarysample::Electrocardiogram::~Electrocardiogram((binarysample::Electrocardiogram *)v8);
  }

}

- (id)payload
{
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  PB::Writer::Writer((PB::Writer *)&v6);
  (*((void (**)(Electrocardiogram *, uint64_t *))self->_reading._vptr$Base + 3))(&self->_reading, &v6);
  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  v4 = (void *)objc_msgSend(v3, "initWithBytes:length:", v7, v6 - v7);
  PB::Writer::~Writer((PB::Writer *)&v6);
  return v4;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char *end;
  char *begin;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogram;
  -[HKSample _validateWithConfiguration:](&v15, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    begin = (char *)self->_reading._leads._v.__begin_;
    end = (char *)self->_reading._leads._v.__end_;
    if (end == begin)
    {
LABEL_8:
      v8 = 0;
      goto LABEL_9;
    }
    v11 = *(_QWORD *)(*(_QWORD *)begin + 40) - *(_QWORD *)(*(_QWORD *)begin + 32);
    while (v11 == *(_QWORD *)(*(_QWORD *)begin + 40) - *(_QWORD *)(*(_QWORD *)begin + 32))
    {
      begin += 8;
      if (begin == end)
        goto LABEL_8;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = objc_opt_class();
    objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v14, a2, CFSTR("%@ %@ requires each lead to have an identical number of data"), objc_opt_class(), self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (BOOL)prepareForSaving:(id *)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;

  if (self->_reading._leads._v.__end_ == self->_reading._leads._v.__begin_)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = objc_opt_class();
    objc_msgSend(v11, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v12, a2, CFSTR("%@ %@ requires at least one lead"), objc_opt_class(), self);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v16)
    {
      if (a3)
      {
LABEL_13:
        v13 = objc_retainAutorelease(v13);
        *a3 = v13;
        goto LABEL_15;
      }
LABEL_14:
      _HKLogDroppedError(v16);
    }
  }
  else
  {
    -[HKObject metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_HKPrivateMetadataKeyElectrocardiogramSymptoms"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    if (v8 == 1 || (v8 & 1) == 0)
      return 1;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = objc_opt_class();
    objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v15, a2, CFSTR("%@ %@ metadata cannot have both no symptoms and a symptom"), objc_opt_class(), self);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v16)
    {
      if (a3)
        goto LABEL_13;
      goto LABEL_14;
    }
  }
LABEL_15:

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKElectrocardiogram;
  -[HKSample encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HKElectrocardiogram payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("payload"));

  -[HKElectrocardiogram averageHeartRate](self, "averageHeartRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("averageHeartRate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HKElectrocardiogram privateClassification](self, "privateClassification"), CFSTR("classification"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKElectrocardiogram symptoms](self, "symptoms"), CFSTR("symptoms_status"));

}

- (HKElectrocardiogram)initWithCoder:(id)a3
{
  id v4;
  HKElectrocardiogram *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKElectrocardiogram;
  v5 = -[HKSample initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogram _setPayload:](v5, "_setPayload:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageHeartRate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogram _setAverageHeartRate:](v5, "_setAverageHeartRate:", v7);

    -[HKElectrocardiogram _setPrivateClassification:](v5, "_setPrivateClassification:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("classification")));
    -[HKElectrocardiogram _setSymptomsStatus:](v5, "_setSymptomsStatus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("symptoms_status")));
  }

  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  id v5;
  NSInteger v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  char v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  HKElectrocardiogramSymptomsStatus v23;
  objc_super v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v24.receiver = self;
    v24.super_class = (Class)HKElectrocardiogram;
    if (!-[HKSample isEquivalent:](&v24, sel_isEquivalent_, v5))
      goto LABEL_17;
    v6 = -[HKElectrocardiogram numberOfVoltageMeasurements](self, "numberOfVoltageMeasurements");
    if (v6 != objc_msgSend(v5, "numberOfVoltageMeasurements"))
      goto LABEL_17;
    -[HKElectrocardiogram samplingFrequency](self, "samplingFrequency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "samplingFrequency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {

    }
    else
    {
      objc_msgSend(v5, "samplingFrequency");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_16;
      -[HKElectrocardiogram samplingFrequency](self, "samplingFrequency");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "samplingFrequency");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) == 0)
        goto LABEL_17;
    }
    -[HKElectrocardiogram payload](self, "payload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToData:", v15);

    if ((v16 & 1) == 0)
      goto LABEL_17;
    v17 = -[HKElectrocardiogram privateClassification](self, "privateClassification");
    if (v17 != objc_msgSend(v5, "privateClassification"))
      goto LABEL_17;
    -[HKElectrocardiogram averageHeartRate](self, "averageHeartRate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "averageHeartRate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {

LABEL_21:
      v23 = -[HKElectrocardiogram symptomsStatus](self, "symptomsStatus");
      v13 = v23 == objc_msgSend(v5, "symptomsStatus");
      goto LABEL_18;
    }
    objc_msgSend(v5, "averageHeartRate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[HKElectrocardiogram averageHeartRate](self, "averageHeartRate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "averageHeartRate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if ((v21 & 1) != 0)
        goto LABEL_21;
LABEL_17:
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_16:

    goto LABEL_17;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

+ (id)_localizedClassification:(unint64_t)a3 withActiveAlgorithmVersion:(int64_t)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  switch(a3)
  {
    case 1uLL:
      if (a4 == 2)
      {
        HKHealthKitFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_POOR_RECORDING"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        HKConditionallyRedactedHeartRhythmString(v5);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a4 != 1)
          goto LABEL_7;
        HKHealthKitFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_INCONCLUSIVE_POOR_READING"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        HKConditionallyRedactedHeartRhythmString(v5);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_14;
    case 2uLL:
      HKHealthKitFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_INCONCLUSIVE_OTHER"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 3uLL:
      HKHealthKitFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_SINUS_RHYTHM_HEART_RATE_50_TO_100"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4uLL:
    case 8uLL:
    case 9uLL:
      HKHealthKitFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_ATRIAL_FIBRILLATION"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 5uLL:
      HKHealthKitFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_HEART_RATE_ABOVE_120"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 6uLL:
      HKHealthKitFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_HEART_RATE_BELOW_50"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 7uLL:
      HKHealthKitFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_SINUS_RHYTHM_HEART_RATE_100_TO_150"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 0xAuLL:
      HKHealthKitFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_HEART_RATE_ABOVE_150"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString(v5);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v7 = (void *)v6;

      break;
    default:
LABEL_7:
      v7 = 0;
      break;
  }
  return v7;
}

- (id)_localizedClassificationWithActiveAlgorithmVersion:(int64_t)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_localizedClassification:withActiveAlgorithmVersion:", -[HKElectrocardiogram privateClassification](self, "privateClassification"), a3);
}

- (NSArray)_localizedSymptoms
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  _HKPrivateElectrocardiogramSymptomsGetList(-[HKElectrocardiogram privateSymptoms](self, "privateSymptoms", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "integerValue");
        v9 = 0;
        if (v8 > 63)
        {
          if (v8 > 255)
          {
            if (v8 == 256)
            {
              HKHealthKitFrameworkBundle();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SYMPTOM_SHORTNESS_OF_BREATH"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              HKConditionallyRedactedHeartRhythmString(v11);
              v12 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v8 != 512)
                goto LABEL_25;
              HKHealthKitFrameworkBundle();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SYMPTOM_SKIPPED_HEARTBEAT"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              HKConditionallyRedactedHeartRhythmString(v11);
              v12 = objc_claimAutoreleasedReturnValue();
            }
          }
          else if (v8 == 64)
          {
            HKHealthKitFrameworkBundle();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SYMPTOM_OTHER"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            HKConditionallyRedactedHeartRhythmString(v11);
            v12 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v8 != 128)
              goto LABEL_25;
            HKHealthKitFrameworkBundle();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SYMPTOM_RAPID_POUNDING_OR_FLUTTERING_HEARTBEAT"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            HKConditionallyRedactedHeartRhythmString(v11);
            v12 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          switch(v8)
          {
            case 1:
              HKHealthKitFrameworkBundle();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SYMPTOM_NO_SYMPTOMS"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              HKConditionallyRedactedHeartRhythmString(v11);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
            case 2:
              HKHealthKitFrameworkBundle();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SYMPTOM_CHEST_TIGHTNESS_OR_PAIN"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              HKConditionallyRedactedHeartRhythmString(v11);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
            case 3:
            case 5:
            case 6:
            case 7:
              goto LABEL_25;
            case 4:
              HKHealthKitFrameworkBundle();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SYMPTOM_DIZZINESS"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              HKConditionallyRedactedHeartRhythmString(v11);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
            case 8:
              HKHealthKitFrameworkBundle();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SYMPTOM_FATIGUE"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              HKConditionallyRedactedHeartRhythmString(v11);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              if (v8 != 16)
                goto LABEL_25;
              HKHealthKitFrameworkBundle();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SYMPTOM_FAINTING"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              HKConditionallyRedactedHeartRhythmString(v11);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        v9 = (void *)v12;

        if (v9)
          objc_msgSend(v3, "addObject:", v9);
LABEL_25:

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (unint64_t)privateSymptoms
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HKObject metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_HKPrivateMetadataKeyElectrocardiogramSymptoms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (HKElectrocardiogramSymptomsStatus)symptomsStatus
{
  return self->_symptomsStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
  binarysample::Electrocardiogram::~Electrocardiogram((binarysample::Electrocardiogram *)&self->_reading);
}

- (id).cxx_construct
{
  binarysample::Electrocardiogram::Electrocardiogram((uint64_t)&self->_reading);
  return self;
}

- (void)_enumerateDataForLead:(os_log_t)log block:(void *)a4 .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Sample %{public}@ has no measurement frequency", buf, 0xCu);

}

@end
