@implementation HKSample

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSample;
  v4 = a3;
  -[HKObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("StartTS"), self->_startTimestamp, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("EndTS"), self->_endTimestamp);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sampleType, CFSTR("DataType"));

}

- (NSDate)startDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_startTimestamp);
}

- (NSDate)endDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_endTimestamp);
}

+ (id)_newSampleWithType:(id)a3 startDate:(double)a4 endDate:(double)a5 device:(id)a6 metadata:(id)a7 config:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  double v23;
  double v24;

  v14 = a3;
  v15 = a8;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__HKSample__newSampleWithType_startDate_endDate_device_metadata_config___block_invoke;
  v20[3] = &unk_1E37F6F98;
  v23 = a4;
  v24 = a5;
  v21 = v14;
  v22 = v15;
  v16 = v15;
  v17 = v14;
  v18 = (void *)objc_msgSend(a1, "_newDataObjectWithMetadata:device:config:", a7, a6, v20);

  return v18;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKSample;
  result = -[HKObject _init](&v3, sel__init);
  if (result)
  {
    *((_QWORD *)result + 10) = 0x10000000000000;
    *((_QWORD *)result + 11) = 0x10000000000000;
  }
  return result;
}

void __72__HKSample__newSampleWithType_startDate_endDate_device_metadata_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;

  v7 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v7[9];
  v7[9] = v3;

  v5 = v7;
  v7[10] = *(_QWORD *)(a1 + 48);
  v7[11] = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD *))(v6 + 16))(v6, v7);
    v5 = v7;
  }

}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (double)_startTimestamp
{
  return self->_startTimestamp;
}

- (double)_endTimestamp
{
  return self->_endTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleType, 0);
}

- (void)_setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (void)_setEndTimestamp:(double)a3
{
  self->_endTimestamp = a3;
}

- (void)_setSampleType:(id)a3
{
  HKSampleType *v4;
  HKSampleType *sampleType;

  v4 = (HKSampleType *)objc_msgSend(a3, "copy");
  sampleType = self->_sampleType;
  self->_sampleType = v4;

}

- (int64_t)_externalSyncObjectCode
{
  void *v2;
  int64_t v3;

  -[HKSample sampleType](self, "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "code");

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  if (description_onceToken_1 != -1)
    dispatch_once(&description_onceToken_1, &__block_literal_global_125);
  v3 = (void *)description_formatter_0;
  -[HKSample startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)description_formatter_0;
  -[HKSample endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)HKSample;
  -[HKObject description](&v12, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@ - %@)"), v9, v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

uint64_t __23__HKSample_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)description_formatter_0;
  description_formatter_0 = (uint64_t)v0;

  return objc_msgSend((id)description_formatter_0, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
}

- (HKSample)initWithCoder:(id)a3
{
  id v4;
  HKSample *v5;
  uint64_t v6;
  HKSampleType *sampleType;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKSample;
  v5 = -[HKObject initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataType"));
    v6 = objc_claimAutoreleasedReturnValue();
    sampleType = v5->_sampleType;
    v5->_sampleType = (HKSampleType *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("StartTS")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("StartTS"));
      v5->_startTimestamp = v8;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EndTS"));
      v5->_endTimestamp = v9;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartDate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      v5->_startTimestamp = v11;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndDate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v5->_endTimestamp = v13;

    }
  }

  return v5;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)hk_morningIndexRangeWithCalendarWithCalendar:(id)a3
{
  id v4;
  HKSample *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v5 = self;
  -[HKSample overrideDayIndex](v5, "overrideDayIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

LABEL_5:
    -[HKSample startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "hk_morningIndexWithCalendar:", v4);

    -[HKSample endDate](self, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hk_morningIndexWithCalendar:", v4);

    v9 = v12 - v8 + 1;
    goto LABEL_6;
  }
  -[HKSample overrideDayIndex](v5, "overrideDayIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue") - 1;

  v9 = 3;
LABEL_6:

  v13 = v8;
  v14 = v9;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (id)sanitizedSample:(id)a3 forEntitlements:(id)a4
{
  return a3;
}

- (void)_enumerateTimePeriodsWithBlock:(id)a3
{
  (*((void (**)(id, HKSample *))a3 + 2))(a3, self);
}

- (id)asJSONObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKSample;
  -[HKObject asJSONObject](&v13, sel_asJSONObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (asJSONObject_onceToken != -1)
    dispatch_once(&asJSONObject_onceToken, &__block_literal_global_79);
  v4 = (void *)asJSONObject_formatter;
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("startDate"));

  v7 = (void *)asJSONObject_formatter;
  -[HKSample endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("endDate"));

  -[HKSample sampleType](self, "sampleType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sampleType"));

  return v3;
}

uint64_t __33__HKSample_HK_JSON__asJSONObject__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)asJSONObject_formatter;
  asJSONObject_formatter = (uint64_t)v0;

  return objc_msgSend((id)asJSONObject_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
}

+ (id)_newSampleFromDatesWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 config:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if ((objc_msgSend(a1, "_isConcreteObjectClass") & 1) != 0)
  {
    if (v16)
      goto LABEL_3;
LABEL_6:
    v22 = 2.22507386e-308;
    if (v17)
      goto LABEL_4;
LABEL_7:
    v24 = 2.22507386e-308;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSample.m"), 58, CFSTR("%@ should not be used for abstract class %@"), v25, v26);

  if (!v16)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v22 = v21;
  if (!v17)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v24 = v23;
LABEL_8:
  v27 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v15, v18, v19, v20, v22, v24);

  return v27;
}

- (BOOL)_requiresPrivateEntitlementForQueries
{
  return 0;
}

+ (id)_enumerateValidIntervalsWithStartDate:(id)a3 endDate:(id)a4 sampleType:(id)a5 block:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, void *);
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, void *))a6;
  objc_msgSend(a5, "maximumAllowedDuration");
  v13 = v12;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = v9;
  v16 = v15;
  if (objc_msgSend(v15, "hk_isBeforeDate:", v10))
  {
    v17 = v15;
    do
    {
      objc_msgSend(v17, "dateByAddingTimeInterval:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "hk_isAfterDate:", v10))
      {
        v18 = v10;

        v16 = v18;
      }
      v11[2](v11, v17, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v19);

      v17 = v16;
    }
    while ((objc_msgSend(v16, "hk_isBeforeDate:", v10) & 1) != 0);
  }

  return v14;
}

- (id)_timeZone
{
  void *v2;
  void *v3;
  void *v4;

  -[HKObject _timeZoneName](self, "_timeZoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2
    || (objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v2),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  char var0;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double startTimestamp;
  double endTimestamp;
  char v12;
  id v13;
  uint64_t v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  HKSampleType *sampleType;
  uint64_t v25;
  id v26;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  HKSampleType *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  objc_super v44;

  var0 = a3.var0;
  v44.receiver = self;
  v44.super_class = (Class)HKSample;
  -[HKObject _validateWithConfiguration:](&v44, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Invalid data type %@"), self->_sampleType);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    -[HKSample sampleType](self, "sampleType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    startTimestamp = self->_startTimestamp;
    endTimestamp = self->_endTimestamp;
    v43 = 0;
    v12 = objc_msgSend(v9, "_validateStartDate:endDate:error:", &v43, startTimestamp, endTimestamp);
    v13 = v43;

    if ((v12 & 1) == 0)
    {
      v26 = v13;
LABEL_26:

      goto LABEL_15;
    }
    if ((var0 & 2) == 0 && HKProgramSDKAtLeast(0x7E30901FFFFFFFFLL, v14))
      v15 = self->_endTimestamp;
    if ((var0 & 1) == 0 && HKProgramSDKAtLeast(0x7E30901FFFFFFFFLL, v14))
    {
      -[HKSample sampleType](self, "sampleType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isMaximumDurationRestricted") & 1) != 0)
      {
        v17 = self->_endTimestamp - self->_startTimestamp;
        -[HKSample sampleType](self, "sampleType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "maximumAllowedDuration");
        v20 = v19;

        if (v17 > v20)
        {
          v40 = (void *)MEMORY[0x1E0CB35C8];
          v21 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_startTimestamp);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_endTimestamp);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          sampleType = self->_sampleType;
          -[HKSampleType maximumAllowedDuration](sampleType, "maximumAllowedDuration");
          objc_msgSend(v40, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v21, a2, CFSTR("startDate (%@) and endDate (%@) exceed the maximum allowed duration for this sample type. Maximum duration for type %@ is %f"), v22, v23, sampleType, v25);
LABEL_21:
          v26 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_26;
        }
      }
      else
      {

      }
      -[HKSample sampleType](self, "sampleType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "isMinimumDurationRestricted") & 1) != 0)
      {
        v29 = self->_endTimestamp - self->_startTimestamp;
        -[HKSample sampleType](self, "sampleType");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "minimumAllowedDuration");
        v32 = v31;

        if (v29 < v32)
        {
          v41 = (void *)MEMORY[0x1E0CB35C8];
          v33 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_startTimestamp);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_endTimestamp);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = self->_sampleType;
          -[HKSampleType minimumAllowedDuration](v34, "minimumAllowedDuration");
          objc_msgSend(v41, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v33, a2, CFSTR("Duration between startDate (%@) and endDate (%@) is below the minimum allowed duration for this sample type. Minimum duration for type %@ is %f"), v22, v23, v34, v35);
          goto LABEL_21;
        }
      }
      else
      {

      }
    }
    -[HKSample sampleType](self, "sampleType", v15);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKObject metadata](self, "metadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v38 = objc_msgSend(v36, "hk_validateMetadata:sample:error:", v37, self, &v42);
    v39 = v42;

    v26 = 0;
    if ((v38 & 1) == 0)
      v26 = v39;

    goto LABEL_26;
  }
  v8 = v6;
LABEL_14:
  v26 = v8;
LABEL_15:

  return v26;
}

- (void)_setType:(id)a3
{
  HKSampleType *v4;
  HKSampleType *sampleType;

  v4 = (HKSampleType *)objc_msgSend(a3, "copy");
  sampleType = self->_sampleType;
  self->_sampleType = v4;

}

- (void)_setStartDate:(id)a3
{
  double v4;

  if (a3)
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  else
    v4 = 2.22507386e-308;
  -[HKSample _setStartTimestamp:](self, "_setStartTimestamp:", v4);
}

- (void)_setEndDate:(id)a3
{
  double v4;

  if (a3)
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  else
    v4 = 2.22507386e-308;
  -[HKSample _setEndTimestamp:](self, "_setEndTimestamp:", v4);
}

- (BOOL)hasUndeterminedDuration
{
  double endTimestamp;
  void *v3;
  double v4;
  BOOL v5;

  endTimestamp = self->_endTimestamp;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = endTimestamp >= v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsEquivalence
{
  return 0;
}

- (BOOL)isEquivalent:(id)a3
{
  HKSample *v4;
  HKSample *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (HKSample *)a3;
  if (objc_msgSend((id)objc_opt_class(), "supportsEquivalence"))
  {
    if (self == v4)
    {
      v14 = 1;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKSample startDate](self, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSample startDate](v5, "startDate");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKSample startDate](v5, "startDate");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_15;
        v10 = (void *)v9;
        -[HKSample startDate](self, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSample startDate](v5, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToDate:", v12);

        if (!v13)
          goto LABEL_16;
      }
      -[HKSample endDate](self, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSample endDate](v5, "endDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

LABEL_18:
        v14 = 1;
        goto LABEL_19;
      }
      v8 = (void *)v15;
      -[HKSample endDate](v5, "endDate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HKSample endDate](self, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSample endDate](v5, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToDate:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_18;
LABEL_16:
        v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("offsetFromStartDate")))
  {
    v9.receiver = self;
    v9.super_class = (Class)HKSample;
    -[HKSample valueForKey:](&v9, sel_valueForKey_, v4);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (void *)v7;
    goto LABEL_7;
  }
  if (!-[HKSampleType isMaximumDurationRestricted](self->_sampleType, "isMaximumDurationRestricted"))
  {
    -[HKSample endDate](self, "endDate");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSampleType maximumAllowedDuration](self->_sampleType, "maximumAllowedDuration");
  objc_msgSend(v5, "dateByAddingTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v6;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)hk_dayIndexRangeWithCalendar:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v4 = a3;
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hk_dayIndexWithCalendar:", v4);

  -[HKSample endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", v4);

  v9 = v8 - v6 + 1;
  v10 = v6;
  result.var1 = v9;
  result.var0 = v10;
  return result;
}

@end
