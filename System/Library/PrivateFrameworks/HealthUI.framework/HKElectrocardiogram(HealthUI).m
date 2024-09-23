@implementation HKElectrocardiogram(HealthUI)

- (id)hk_waveformPathsWithNumberOfValues:()HealthUI fitToWidth:pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:
{
  double v11;
  double v12;
  CGAffineTransform v14;

  CGAffineTransformMakeScale(&v14, a2 / (double)a7, a3 / 1000.0);
  *(float *)&v11 = a4 * 1000.0;
  *(float *)&v12 = a5 * 1000.0;
  objc_msgSend(a1, "_hk_waveformPathsWithNumberOfValues:transform:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:", a7, &v14, 0, 0, 0, v11, v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_hk_waveformPathsWithNumberOfValues:()HealthUI transform:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:
{
  __int128 v17;
  id v18;
  _QWORD v20[9];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float v24;
  float v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __197__HKElectrocardiogram_HealthUI___hk_waveformPathsWithNumberOfValues_transform_maximumNumberOfValuesPerPath_shouldResetXValues_initialValuesToOmit_minimumValueInMicrovolts_maximumValueInMicrovolts___block_invoke;
  v20[3] = &unk_1E9C3FF80;
  v20[6] = a9;
  v20[7] = a5;
  v20[8] = a7;
  v26 = a8;
  v20[4] = &v27;
  v20[5] = &v33;
  v24 = a3;
  v25 = a2;
  v17 = a6[1];
  v21 = *a6;
  v22 = v17;
  v23 = a6[2];
  objc_msgSend(a1, "_enumerateDataForLead:block:", 1, v20);
  objc_msgSend((id)v34[5], "addObject:", v28[5]);
  v18 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v18;
}

- (uint64_t)hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:
{
  *(float *)&a5 = *(float *)&a5 * 1000.0;
  *(float *)&a6 = *(float *)&a6 * 1000.0;
  return objc_msgSend(a1, "_hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:", 2560, 0, 0, a3, a4, a5, a6);
}

- (uint64_t)hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:wrappingDuration:omittingInitialDuration:
{
  LODWORD(a7) = -1081711002;
  LODWORD(a8) = 1073951539;
  return objc_msgSend(a1, "hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:wrappingDuration:omittingInitialDuration:minimumValueInMillivolts:maximumValueInMillivolts:", a3, a4, a5, a6, a7, a8);
}

- (uint64_t)hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:wrappingDuration:omittingInitialDuration:minimumValueInMillivolts:maximumValueInMillivolts:
{
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  objc_msgSend(a1, "samplingFrequency");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "hertzUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValueForUnit:", v15);
  v17 = v16;

  *(float *)&v18 = a6 * 1000.0;
  *(float *)&v19 = a7 * 1000.0;
  return objc_msgSend(a1, "_hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:", vcvtpd_s64_f64(v17 * a4), 1, vcvtpd_s64_f64(v17 * a5), a2, a3, v18, v19);
}

- (id)_hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:
{
  void *v17;
  void *v18;
  double v19;
  double v20;
  CGFloat v21;
  uint64_t v22;
  double v23;
  double v24;
  CGAffineTransform v26;

  objc_msgSend(a1, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v18);
  v20 = v19 * a2;

  v21 = v20 / (double)objc_msgSend(a1, "numberOfVoltageMeasurements");
  v22 = objc_msgSend(a1, "numberOfVoltageMeasurements");
  CGAffineTransformMakeScale(&v26, v21, a3 / 1000.0);
  *(float *)&v23 = a4;
  *(float *)&v24 = a5;
  objc_msgSend(a1, "_hk_waveformPathsWithNumberOfValues:transform:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:", v22, &v26, a7, a8, a9, v23, v24);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hk_isClassificationSupported
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "privateClassification");
  return (v1 < 0xB) & (0x7FEu >> v1);
}

- (uint64_t)hk_isPossibleAtrialFibrillation
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "privateClassification");
  return (v1 < 0xA) & (0x310u >> v1);
}

- (BOOL)hk_hasPositiveSymptoms
{
  return objc_msgSend(a1, "symptomsStatus") == 2;
}

- (BOOL)hk_isSymptomsNotSet
{
  return objc_msgSend(a1, "symptomsStatus") == 0;
}

- (BOOL)hk_isSymptomsNoSymptoms
{
  return objc_msgSend(a1, "symptomsStatus") == 1;
}

- (id)hk_cardHeaderColor
{
  int v1;
  void *v2;

  v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalHeaderColorAndStyle");
  v2 = (void *)objc_opt_class();
  if (v1)
    objc_msgSend(v2, "hk_abnormalCardHeaderColor");
  else
    objc_msgSend(v2, "hk_defaultCardHeaderColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hk_cardBackgroundColor
{
  return objc_msgSend((id)objc_opt_class(), "hk_defaultCardBackgroundColor");
}

- (id)hk_classificationTextColor
{
  int v1;
  void *v2;

  v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalHeaderColorAndStyle");
  v2 = (void *)objc_opt_class();
  if (v1)
    objc_msgSend(v2, "hk_abnormalClassificationTextColor");
  else
    objc_msgSend(v2, "hk_defaultClassificationTextColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hk_timeStampTextColor
{
  int v1;
  void *v2;

  v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalHeaderColorAndStyle");
  v2 = (void *)objc_opt_class();
  if (v1)
    objc_msgSend(v2, "hk_abnormalTimeStampTextColor");
  else
    objc_msgSend(v2, "hk_defaultTimeStampTextColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hk_timeStampCompositingFilter
{
  int v1;
  void *v2;

  v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalHeaderColorAndStyle");
  v2 = (void *)objc_opt_class();
  if (v1)
    objc_msgSend(v2, "hk_abnormalTimeStampCompositingFilter");
  else
    objc_msgSend(v2, "hk_defaultTimeStampCompositingFilter");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hk_BPMTextColor
{
  int v1;
  void *v2;

  v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalBPMFontColorAndStyle");
  v2 = (void *)objc_opt_class();
  if (v1)
    objc_msgSend(v2, "hk_abnormalBPMTextColor");
  else
    objc_msgSend(v2, "hk_defaultBPMTextColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hk_numSymptomsTextColor
{
  int v1;
  void *v2;

  v1 = objc_msgSend(a1, "hk_hasPositiveSymptoms");
  v2 = (void *)objc_opt_class();
  if (v1)
    objc_msgSend(v2, "hk_positiveNumSymptomsTextColor");
  else
    objc_msgSend(v2, "hk_defaultNumSymptomsTextColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hk_defaultCardHeaderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "hk_electrocardiogramCardHeaderColor");
}

+ (uint64_t)hk_defaultCardBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "hk_electrocardiogramCardBackgroundColor");
}

+ (uint64_t)hk_defaultClassificationTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)hk_abnormalClassificationTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (uint64_t)hk_defaultTimeStampTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (uint64_t)hk_abnormalTimeStampTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (id)hk_defaultTimeStampCompositingFilter
{
  return (id)*MEMORY[0x1E0CD2E70];
}

+ (uint64_t)hk_defaultBPMTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (uint64_t)hk_defaultNumSymptomsTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (uint64_t)hk_abnormalCardHeaderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
}

+ (id)hk_abnormalTimeStampCompositingFilter
{
  return (id)*MEMORY[0x1E0CD2E98];
}

+ (uint64_t)hk_abnormalBPMTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
}

+ (id)hk_positiveNumSymptomsTextColor
{
  void *v0;
  void *v1;

  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", 11);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "color");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)hk_onboardingCardHeaderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "hk_electrocardiogramCardOnboardingHeaderColor");
}

+ (uint64_t)hk_onboardingCardBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "hk_electrocardiogramCardOnboardingBackgroundColor");
}

+ (id)hk_localizedAverageBPM:()HealthUI
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

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "_beatsPerMinute");
    objc_msgSend(v3, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37F0], "hk_heartRateNumberFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromNumber:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AVERAGE_BEATS_PER_MINUTE_SHORT_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Cinnamon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NO_AVERAGE_BEATS_PER_MINUTE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Cinnamon"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)hk_localizedAverageBPM
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "averageHeartRate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_localizedAverageBPM:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hk_localizedDuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3570], "hk_fullStyleDateComponentsFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:toDate:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (__CFString)hk_localizedNumSymptoms
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "_localizedSymptoms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "hk_isSymptomsNotSet") & 1) != 0)
  {
    v5 = &stru_1E9C4C428;
  }
  else
  {
    if (objc_msgSend(a1, "hk_isSymptomsNoSymptoms"))
    {

      v4 = &unk_1E9CEADA8;
    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SYMPTOM_COUNT_NUMBERED_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Cinnamon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v9, objc_msgSend(v4, "integerValue"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)hk_localizedUppercaseNumSymptoms
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hk_localizedNumSymptoms");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedUppercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_hk_classificationHasAbnormalHeaderColorAndStyle
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "privateClassification");
  return (v1 < 0xB) & (0x770u >> v1);
}

- (uint64_t)_hk_classificationHasAbnormalBPMFontColorAndStyle
{
  objc_msgSend(a1, "privateClassification");
  return 0;
}

@end
