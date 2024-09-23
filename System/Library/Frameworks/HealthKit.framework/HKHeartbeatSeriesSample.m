@implementation HKHeartbeatSeriesSample

- (HKHeartbeatSeriesSample)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

+ (id)_heartbeatSeriesSampleWithData:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;

  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  +[HKSeriesType heartbeatSeriesType](HKSeriesType, "heartbeatSeriesType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v19 = v18;

  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v21 = v20;

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__HKHeartbeatSeriesSample__heartbeatSeriesSampleWithData_startDate_endDate_device_metadata___block_invoke;
  v25[3] = &unk_1E37F4E90;
  v26 = v12;
  v22 = v12;
  v23 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v17, v14, v13, v25, v19, v21);

  return v23;
}

uint64_t __92__HKHeartbeatSeriesSample__heartbeatSeriesSampleWithData_startDate_endDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setPayload:", *(_QWORD *)(a1 + 32));
}

+ (id)heartbeatSequenceSampleWithData:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6
{
  return (id)objc_msgSend(a1, "_heartbeatSeriesSampleWithData:startDate:endDate:device:metadata:", a3, a4, a5, 0, a6);
}

- (void)enumerateHeartbeatDataWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HKHeartbeatSeriesSample_enumerateHeartbeatDataWithBlock___block_invoke;
  v6[3] = &unk_1E37F4EB8;
  v7 = v4;
  v5 = v4;
  -[HKHeartbeatSeriesSample _enumerateHeartbeatDataWithBlock:](self, "_enumerateHeartbeatDataWithBlock:", v6);

}

uint64_t __59__HKHeartbeatSeriesSample_enumerateHeartbeatDataWithBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (BOOL)_shouldNotifyOnInsert
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  uint64_t v25;
  _QWORD v26[8];
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)HKHeartbeatSeriesSample;
  -[HKSeriesSample _validateWithConfiguration:](&v37, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_8:
    v18 = v7;
    goto LABEL_9;
  }
  -[HKSample sampleType](self, "sampleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSeriesType heartbeatSeriesType](HKSeriesType, "heartbeatSeriesType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v13 = CFSTR("Invalid data type %@");
    v25 = v17;
    v14 = v15;
    v12 = v16;
    goto LABEL_7;
  }
  if ((-[NSData length](self->_heartbeatData, "length") & 0xF) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = objc_opt_class();
    v13 = CFSTR("Heartbeat sequence data is incorrectly formatted");
    v14 = v11;
LABEL_7:
    objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v12, a2, v13, v25);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__48;
  v35 = __Block_byref_object_dispose__48;
  v36 = 0;
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x2020000000;
  v30 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __54__HKHeartbeatSeriesSample__validateWithConfiguration___block_invoke;
  v26[3] = &unk_1E37F4EE0;
  v26[4] = self;
  v26[5] = &v31;
  v26[6] = &v27;
  v26[7] = a2;
  -[HKHeartbeatSeriesSample _enumerateHeartbeatDataWithBlock:](self, "_enumerateHeartbeatDataWithBlock:", v26);
  -[HKSample startDate](self, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dateByAddingTimeInterval:", v28[3]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSample endDate](self, "endDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "hk_isBeforeOrEqualToDate:", v22);

  if ((v23 & 1) != 0)
  {
    v24 = (id)v32[5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Heartbeat sequence end date is incorrect"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v24;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

LABEL_9:
  return v18;
}

uint64_t __54__HKHeartbeatSeriesSample__validateWithConfiguration___block_invoke(_QWORD *a1, double a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  if (a2 < 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = objc_opt_class();
    v6 = a1[7];
    v7 = CFSTR("Heartbeat datum time since sequence start (%f) must be nonnegative");
LABEL_7:
    objc_msgSend(v4, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v5, v6, v7, *(_QWORD *)&a2, v12);
    goto LABEL_8;
  }
  if (*(double *)(*(_QWORD *)(a1[6] + 8) + 24) > a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[7], CFSTR("Heartbeat datum time since sequence start (%f) must not be less than previous datum (%f)"), *(_QWORD *)&a2, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
LABEL_8:
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[5] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    goto LABEL_9;
  }
  if (a2 > 10000.0)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = objc_opt_class();
    v6 = a1[7];
    v7 = CFSTR("Heartbeat datum time since sequence start (%f) greater than expected maxiumum 10000");
    goto LABEL_7;
  }
LABEL_9:
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  return 1;
}

- (unint64_t)count
{
  return self->_numberOfDataPoints & ~(self->_numberOfDataPoints >> 63);
}

- (NSNumber)_minimumBeatsPerMinute
{
  NSNumber *cachedMinBeatsPerMinute;

  cachedMinBeatsPerMinute = self->_cachedMinBeatsPerMinute;
  if (!cachedMinBeatsPerMinute || !self->_cachedMaxBeatsPerMinute)
  {
    -[HKHeartbeatSeriesSample _computeMinimumAndMaximumBeatsPerMinute](self, "_computeMinimumAndMaximumBeatsPerMinute");
    cachedMinBeatsPerMinute = self->_cachedMinBeatsPerMinute;
  }
  return cachedMinBeatsPerMinute;
}

- (NSNumber)_maximumBeatsPerMinute
{
  NSNumber *cachedMaxBeatsPerMinute;

  if (!self->_cachedMinBeatsPerMinute || (cachedMaxBeatsPerMinute = self->_cachedMaxBeatsPerMinute) == 0)
  {
    -[HKHeartbeatSeriesSample _computeMinimumAndMaximumBeatsPerMinute](self, "_computeMinimumAndMaximumBeatsPerMinute");
    cachedMaxBeatsPerMinute = self->_cachedMaxBeatsPerMinute;
  }
  return cachedMaxBeatsPerMinute;
}

- (void)_computeMinimumAndMaximumBeatsPerMinute
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  _QWORD v7[8];
  _QWORD v8[3];
  char v9;
  _QWORD v10[4];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0x7FEFFFFFFFFFFFFFLL;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HKHeartbeatSeriesSample__computeMinimumAndMaximumBeatsPerMinute__block_invoke;
  v7[3] = &unk_1E37F4F08;
  v7[4] = v8;
  v7[5] = v10;
  v7[6] = &v11;
  v7[7] = &v15;
  -[HKHeartbeatSeriesSample _enumerateHeartbeatDataWithBlock:](self, "_enumerateHeartbeatDataWithBlock:", v7);
  v3 = v16[3];
  if (v3 == 1.79769313e308)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16[3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_cachedMinBeatsPerMinute, v4);
  if (v3 != 1.79769313e308)

  v5 = v12[3];
  if (v5 == 0.0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12[3]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_cachedMaxBeatsPerMinute, v6);
  if (v5 != 0.0)

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

uint64_t __66__HKHeartbeatSeriesSample__computeMinimumAndMaximumBeatsPerMinute__block_invoke(_QWORD *a1, char a2, double a3)
{
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;

  if ((a2 & 1) == 0 && !*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    v3 = 1.0 / ((a3 - *(double *)(*(_QWORD *)(a1[5] + 8) + 24)) / 60.0);
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(double *)(v4 + 24);
    if (v5 < v3)
      v5 = 1.0 / ((a3 - *(double *)(*(_QWORD *)(a1[5] + 8) + 24)) / 60.0);
    *(double *)(v4 + 24) = v5;
    v6 = *(_QWORD *)(a1[7] + 8);
    if (*(double *)(v6 + 24) < v3)
      v3 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v3;
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  return 1;
}

- (void)_enumerateHeartbeatDataWithBlock:(id)a3
{
  uint64_t (**v4)(id, BOOL, double);
  uint64_t v5;
  int64_t v6;
  double v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, BOOL, double))a3;
  if (self->_numberOfDataPoints >= 1)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      -[NSData getBytes:range:](self->_heartbeatData, "getBytes:range:", &v7, v5, 16);
      if ((v4[2](v4, v8 != 0, v7) & 1) == 0)
        break;
      ++v6;
      v5 += 16;
    }
    while (v6 < self->_numberOfDataPoints);
  }

}

- (id)payload
{
  return self->_heartbeatData;
}

- (void)_setPayload:(id)a3
{
  NSData *v4;
  NSData *heartbeatData;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v6);
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  heartbeatData = self->_heartbeatData;
  self->_heartbeatData = v4;

  self->_numberOfDataPoints = (unint64_t)objc_msgSend(v6, "length") >> 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKHeartbeatSeriesSample)initWithCoder:(id)a3
{
  id v4;
  HKHeartbeatSeriesSample *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKHeartbeatSeriesSample;
  v5 = -[HKSeriesSample initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("heartbeatData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHeartbeatSeriesSample _setPayload:](v5, "_setPayload:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKHeartbeatSeriesSample;
  v4 = a3;
  -[HKSeriesSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_heartbeatData, CFSTR("heartbeatData"), v5.receiver, v5.super_class);

}

+ (id)_heartbeatSeriesSampleFromCSV:(id)a3 startDate:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  char v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  double v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", a3, 4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v31 = v10;
    v30 = v11;
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 16 * objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      v18 = 0.0;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "rangeOfString:", CFSTR(","));
          if (v21 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v22 = v21;
            objc_msgSend(v20, "substringToIndex:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "substringFromIndex:", v22 + 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "doubleValue");
            v18 = v25;
            v26 = objc_msgSend(v24, "BOOLValue");
            v38 = 0;
            v37 = v18;
            if ((v26 & 1) == 0)
              LOBYTE(v38) = 1;
            objc_msgSend(v13, "appendBytes:length:", &v37, 16);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 0.0;
    }

    objc_msgSend(v9, "dateByAddingTimeInterval:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v31;
    +[HKHeartbeatSeriesSample _heartbeatSeriesSampleWithData:startDate:endDate:device:metadata:](HKHeartbeatSeriesSample, "_heartbeatSeriesSampleWithData:startDate:endDate:device:metadata:", v13, v9, v28, 0, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v30;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSData)heartbeatData
{
  return self->_heartbeatData;
}

- (int64_t)numberOfDataPoints
{
  return self->_numberOfDataPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMaxBeatsPerMinute, 0);
  objc_storeStrong((id *)&self->_cachedMinBeatsPerMinute, 0);
  objc_storeStrong((id *)&self->_heartbeatData, 0);
}

@end
