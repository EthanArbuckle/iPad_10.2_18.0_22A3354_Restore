@implementation _HKAudiogramFrequencyAxisDimension

- (double)niceStepSizeLargerThan:(double)a3
{
  return 1.0;
}

- (double)ticksPerStepSize:(double)a3
{
  return 0.0;
}

- (id)formatterForLabelStepSize:(double)a3
{
  return 0;
}

- (id)endingLabelsFactorOverride
{
  return 0;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  double v4;
  double v5;
  __CFString *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(a3, "doubleValue");
  v5 = v4;
  if (v4 >= 0.0 && v4 <= 6.0)
  {
    +[HKAudiogramChartPoint frequencyFromAxisValue:](HKAudiogramChartPoint, "frequencyFromAxisValue:", v4);
    v9 = v8;
    HKNumberFormatterFromTemplate(1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 / 1000.0 >= 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 / 1000.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringFromNumber:", v15);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("KILOHERTZ_NUMBERLESS_UNIT");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringFromNumber:", v11);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v5 != 0.0)
      {
LABEL_12:

        return v7;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("HERTZ_NUMBERLESS_UNIT");
    }
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v17;
    goto LABEL_12;
  }
  v7 = &stru_1E9C4C428;
  return v7;
}

@end
