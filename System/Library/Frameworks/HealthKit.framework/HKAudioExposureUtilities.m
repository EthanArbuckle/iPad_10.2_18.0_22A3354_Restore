@implementation HKAudioExposureUtilities

+ (id)localizedDisplayNameForClassification:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "localizedDisplayNameForClassification:isEmbedded:", a3, 0);
}

+ (id)localizedDisplayNameForClassification:(unint64_t)a3 isEmbedded:(BOOL)a4
{
  const __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = CFSTR("AUDIO_EXPOSURE_CLASSIFICATION_UNAVAILABLE");
  if (a3 == 1)
    v4 = CFSTR("AUDIO_EXPOSURE_CLASSIFICATION_OK");
  if (a3 == 2)
    v5 = CFSTR("AUDIO_EXPOSURE_CLASSIFICATION_LOUD");
  else
    v5 = (__CFString *)v4;
  if (a4)
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("_EMBEDDED"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  HKHealthKitFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1E37FD4C0, CFSTR("Localizable-DataTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (unint64_t)classifyLEQ:(id)a3 forDuration:(double)a4 overDays:(int64_t)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  unint64_t v14;

  if (!a3)
    return 0;
  v8 = a3;
  +[HKUnit decibelAWeightedSoundPressureLevelUnit](HKUnit, "decibelAWeightedSoundPressureLevelUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v9);
  v11 = v10;

  objc_msgSend(a1, "_classificationValueWithLEQ:duration:days:", a5, v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (objc_msgSend(v12, "integerValue") < 80)
      v14 = 1;
    else
      v14 = 2;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)computeLEQFromAudioExposureValues:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "duration");
        v12 = v11;
        objc_msgSend(v10, "value");
        v8 = v8 + v12 * __exp10(v13 / 10.0);
        objc_msgSend(v10, "duration");
        v7 = v7 + v14;
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
    if (v7 > 0.0 && v8 > 0.0)
    {
      objc_msgSend(a1, "_rounded:", (double)(log10(v8 / v7) * 10.0));
      v16 = v15;
      +[HKUnit decibelAWeightedSoundPressureLevelUnit](HKUnit, "decibelAWeightedSoundPressureLevelUnit");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v17, v16);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

+ (double)maximumDurationInSecondsForLEQ:(double)a3 days:(int64_t)a4
{
  double v4;
  long double v5;

  if (a4 < 1)
    return 0.0;
  v4 = (80.0 - a3) * 2.30258509 / 10.0;
  v5 = log(40.0 / (double)7uLL * (double)a4);
  return exp(v4 + v5) * (double)0xE10uLL;
}

+ (id)_classificationValueWithLEQ:(double)a3 duration:(double)a4 days:(int64_t)a5
{
  void *v6;

  if (a4 < 2.22507386e-308 || a5 < 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "_rounded:", (double)(a3 + log10(a4 / (double)0xE10uLL / (40.0 / (double)7uLL * (double)a5)) * 10.0));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (double)_rounded:(double)a3
{
  return round(a3 * 100.0) / 100.0;
}

@end
