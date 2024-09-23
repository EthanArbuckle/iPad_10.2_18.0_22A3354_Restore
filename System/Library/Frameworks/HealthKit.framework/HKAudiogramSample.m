@implementation HKAudiogramSample

+ (HKAudiogramSample)audiogramSampleWithSensitivityPoints:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7
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
  +[HKObjectType audiogramSampleType](HKObjectType, "audiogramSampleType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v19 = v18;

  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v21 = v20;

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__HKAudiogramSample_audiogramSampleWithSensitivityPoints_startDate_endDate_device_metadata___block_invoke;
  v25[3] = &unk_1E37F1F70;
  v26 = v12;
  v22 = v12;
  v23 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v17, v14, v13, v25, v19, v21);

  return (HKAudiogramSample *)v23;
}

void __92__HKAudiogramSample_audiogramSampleWithSensitivityPoints_startDate_endDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[HKAudiogramSample _encodeSensitivityPoints:](HKAudiogramSample, "_encodeSensitivityPoints:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setPayload:", v4);

}

+ (HKAudiogramSample)audiogramSampleWithSensitivityPoints:(NSArray *)sensitivityPoints startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata
{
  return (HKAudiogramSample *)objc_msgSend(a1, "audiogramSampleWithSensitivityPoints:startDate:endDate:device:metadata:", sensitivityPoints, startDate, endDate, 0, metadata);
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKAudiogramSample;
  -[HKSample _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HKAudiogramSample _validateSensitivityPointsOrderedAscending](self, "_validateSensitivityPointsOrderedAscending");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_validateSensitivityPointsOrderedAscending
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint64_t v22;

  -[HKAudiogramSample sensitivityPoints](self, "sensitivityPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[HKAudiogramSample sensitivityPoints](self, "sensitivityPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit hertzUnit](HKUnit, "hertzUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= 0x1F)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Audiograms are limited to %d sensitivity points per sample"), 30);
LABEL_10:
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v5)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = objc_opt_class();
    v19 = CFSTR("An audiogram sample must have at least 1 sensitivity point");
LABEL_9:
    objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v18, a2, v19, v22);
    goto LABEL_10;
  }
  v8 = 1;
  while (v5 != v8)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v8 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frequency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v7);
    v12 = v11;

    objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frequency");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValueForUnit:", v7);
    v16 = v15;

    ++v8;
    if (v12 >= v16)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = objc_opt_class();
      v19 = CFSTR("Audiogram frequencies must be unique and in ascending order.");
      goto LABEL_9;
    }
  }
  v20 = 0;
LABEL_11:

  return v20;
}

+ (id)_encodeSensitivityPoints:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (!v3)
  {
    _HKInitializeLogging();
    v5 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[HKAudiogramSample _encodeSensitivityPoints:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return v3;
}

+ (id)_decodeSensitivityData:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v7, v4, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v18;
  if (!v8)
  {
    _HKInitializeLogging();
    v10 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[HKAudiogramSample _decodeSensitivityData:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (NSArray)sensitivityPoints
{
  void *v2;
  void *v3;

  -[HKAudiogramSample encodedSensitivityPoints](self, "encodedSensitivityPoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAudiogramSample _decodeSensitivityData:](HKAudiogramSample, "_decodeSensitivityData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (HKHearingLevelSummary)hearingLevelSummary
{
  HKHearingLevelSummary *hearingLevelSummary;
  HKHearingLevelSummary *v4;
  HKHearingLevelSummary *v5;

  hearingLevelSummary = self->_hearingLevelSummary;
  if (!hearingLevelSummary)
  {
    +[HKHearingLevelSummary summaryForAudiogramSample:](HKHearingLevelSummary, "summaryForAudiogramSample:", self);
    v4 = (HKHearingLevelSummary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_hearingLevelSummary;
    self->_hearingLevelSummary = v4;

    hearingLevelSummary = self->_hearingLevelSummary;
  }
  return hearingLevelSummary;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAudiogramSample)initWithCoder:(id)a3
{
  id v4;
  HKAudiogramSample *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKAudiogramSample;
  v5 = -[HKSample initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AudiogramDataKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAudiogramSample _setPayload:](v5, "_setPayload:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKAudiogramSample;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HKAudiogramSample encodedSensitivityPoints](self, "encodedSensitivityPoints", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AudiogramDataKey"));

}

- (unint64_t)diagnostic
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overallMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HKHearingLevelClassificationForSensitivity(v4);

  return v5;
}

- (unint64_t)leftEarDiagnostic
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftEarMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HKHearingLevelClassificationForSensitivity(v4);

  return v5;
}

- (unint64_t)rightEarDiagnostic
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightEarMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HKHearingLevelClassificationForSensitivity(v4);

  return v5;
}

- (id)averageLeftEarSensitivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftEarMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)averageRightEarSensitivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightEarMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)roundedAverageLeftEarSensitivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftEarMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roundedAverageSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)roundedAverageRightEarSensitivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightEarMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roundedAverageSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)minimumSensitivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overallMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)maximumSensitivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overallMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)roundedMinimumSensitivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overallMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roundedMinimumSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)roundedMaximumSensitivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HKAudiogramSample hearingLevelSummary](self, "hearingLevelSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overallMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roundedMaximumSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)randomAudiogramSampleWithClassification:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7
{
  return (id)objc_msgSend(a1, "randomAudiogramSampleWithLeftEarClassification:rightEarClassification:startDate:endDate:device:metadata:", a3, a3, a4, a5, a6, a7);
}

+ (id)randomAudiogramSampleWithLeftEarClassification:(unint64_t)a3 rightEarClassification:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = objc_msgSend(&unk_1E389DE10, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(&unk_1E389DE10);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
        +[HKUnit hertzUnit](HKUnit, "hertzUnit", v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "randomSensitivityValueForClassification:", a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "randomSensitivityValueForClassification:", a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        objc_msgSend(a1, "_sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:", v18, v19, v20, &v37);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v37;
        if (v21)
        {
          objc_msgSend(v34, "addObject:", v21);
        }
        else
        {
          _HKInitializeLogging();
          v23 = (void *)HKLogHearing;
          if (os_log_type_enabled((os_log_t)HKLogHearing, OS_LOG_TYPE_ERROR))
          {
            v24 = v23;
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v33;
            v44 = 2114;
            v45 = v22;
            _os_log_error_impl(&dword_19A0E6000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Error creating sensitivity point: %{public}@", buf, 0x16u);

          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(&unk_1E389DE10, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v13);
  }
  v26 = v29;
  +[HKAudiogramSample audiogramSampleWithSensitivityPoints:startDate:endDate:device:metadata:](HKAudiogramSample, "audiogramSampleWithSensitivityPoints:startDate:endDate:device:metadata:", v34, v32, v31, v30, v29, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)_sensitivityPointWithFrequency:(id)a3 leftEarSensitivity:(id)a4 rightEarSensitivity:(id)a5 error:(id *)a6
{
  return +[HKAudiogramSensitivityPoint sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:](HKAudiogramSensitivityPoint, "sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:", a3, a4, a5, a6);
}

+ (id)randomSensitivityValueForClassification:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  HKMinimumDecibelQuantityForHearingLevelClassification(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKMaximumDecibelQuantityForHearingLevelClassification(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v7);
  v9 = fmax(v8, 0.0);
  objc_msgSend(v6, "doubleValueForUnit:", v7);
  objc_msgSend(a1, "_randomDecibelValueInRangeFromStart:end:", v9, v10);
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (double)_randomDecibelValueInRangeFromStart:(double)a3 end:(double)a4
{
  void *v9;

  if (a3 >= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKAudiogramSample.m"), 695, CFSTR("Start of range must be before the end."));

  }
  return (double)arc4random_uniform((a4 - a3)) + a3;
}

+ (HKAudiogramSample)audiogramSampleWithLeftEarAverageSensitivity:(id)a3 rightEarAverageSensitivity:(id)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v31 = a8;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = objc_msgSend(&unk_1E389DE10, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(&unk_1E389DE10);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v19);
        +[HKUnit hertzUnit](HKUnit, "hertzUnit", v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = 0;
        objc_msgSend(a1, "_sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:", v22, v14, v15, &v37);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v37;
        if (v23)
        {
          objc_msgSend(v36, "addObject:", v23);
        }
        else
        {
          _HKInitializeLogging();
          v25 = (void *)HKLogHearing;
          if (os_log_type_enabled((os_log_t)HKLogHearing, OS_LOG_TYPE_ERROR))
          {
            v26 = v25;
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v35;
            v44 = 2114;
            v45 = v24;
            _os_log_error_impl(&dword_19A0E6000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Error creating sensitivity point: %{public}@", buf, 0x16u);

          }
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(&unk_1E389DE10, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v17);
  }
  v28 = v31;
  +[HKAudiogramSample audiogramSampleWithSensitivityPoints:startDate:endDate:device:metadata:](HKAudiogramSample, "audiogramSampleWithSensitivityPoints:startDate:endDate:device:metadata:", v36, v34, v33, v32, v31, v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKAudiogramSample *)v29;
}

- (NSData)encodedSensitivityPoints
{
  return self->_encodedSensitivityPoints;
}

- (void)setEncodedSensitivityPoints:(id)a3
{
  objc_storeStrong((id *)&self->_encodedSensitivityPoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedSensitivityPoints, 0);
  objc_storeStrong((id *)&self->_hearingLevelSummary, 0);
}

+ (void)_encodeSensitivityPoints:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Unable to encode the sensitivity points for an HKAudiogramSample instance: %@", a5, a6, a7, a8, 2u);
}

+ (void)_decodeSensitivityData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Unable to decode the sensitivity points for an HKAudiogramSample instance: %@", a5, a6, a7, a8, 2u);
}

@end
