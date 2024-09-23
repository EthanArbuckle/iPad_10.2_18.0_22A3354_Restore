@implementation NSDateComponentsFormatter(MKRelativeFormatting)

+ (id)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting referenceDate:smallestUnit:timeUntilNextUpdate:
{
  double v8;
  double v9;
  uint64_t v10;
  __int128 v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(a3, "timeIntervalSinceDate:", a4);
  if (v8 < 0.0)
    v9 = -v8;
  else
    v9 = v8;
  *((_QWORD *)&v11 + 1) = a5;
  *(_QWORD *)&v11 = a5 - 16;
  v10 = v11 >> 4;
  if (v10)
  {
    if (v10 == 1)
    {
      v12 = 3600.0;
    }
    else
    {
      v12 = 60.0;
      if (v10 == 7)
        v12 = 10.0;
    }
  }
  else
  {
    v12 = 86400.0;
  }
  v13 = v8 >= 0.0 || v9 < v12;
  if (v13)
  {
    if (a6)
    {
      v14 = v8 + v12;
      v13 = v8 < 0.0;
      v15 = 0.0;
      if (v13)
        v15 = v14;
      *a6 = v15;
    }
    _MKLocalizedStringFromThisBundle(CFSTR("Just now"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9 < 60.0 && v12 < 60.0)
    {
      v21 = vcvtmd_u64_f64(v9);
      _MKLocalizedStringFromThisBundle(CFSTR("Date_relative_time_seconds_ago"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6)
        *a6 = 1.0;
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%d"), &v29, v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v29;
    }
    else if (v9 >= 3600.0 || v12 >= 3600.0)
    {
      if (v9 >= 86400.0 || v12 >= 86400.0)
      {
        v25 = vcvtmd_u64_f64(v9 / 86400.0);
        _MKLocalizedStringFromThisBundle(CFSTR("Date_relative_time_days_ago"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (a6)
          *a6 = -(v9 - (double)(v25 + 1) * 86400.0);
        v26 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%d"), &v26, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v26;
      }
      else
      {
        v24 = vcvtmd_u64_f64(v9 / 3600.0);
        _MKLocalizedStringFromThisBundle(CFSTR("Date_relative_time_hours_ago"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (a6)
          *a6 = -(v9 - (double)(v24 + 1) * 3600.0);
        v27 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%d"), &v27, v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v27;
      }
    }
    else
    {
      v18 = vcvtmd_u64_f64(v9 / 60.0);
      _MKLocalizedStringFromThisBundle(CFSTR("Date_relative_time_minutes_ago"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6)
        *a6 = -(v9 - (double)(v18 + 1) * 60.0);
      v28 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%d"), &v28, v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v28;
    }
    v22 = v20;

  }
  return v16;
}

+ (uint64_t)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting referenceDate:smallestUnit:
{
  return objc_msgSend(a1, "_mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:timeUntilNextUpdate:", a3, a4, a5, 0);
}

+ (uint64_t)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting referenceDate:
{
  return objc_msgSend(a1, "_mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:", a3, a4, 64);
}

+ (id)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapkit_descriptionForTimeSinceDate:referenceDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
