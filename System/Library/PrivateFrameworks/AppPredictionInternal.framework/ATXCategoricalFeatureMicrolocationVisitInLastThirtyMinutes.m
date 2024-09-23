@implementation ATXCategoricalFeatureMicrolocationVisitInLastThirtyMinutes

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  BOOL v15;
  __CFString *v17;

  v4 = a3;
  objc_msgSend(v4, "microlocationVisitEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = CFSTR("Microlocation NA");
  if (v5)
  {
    objc_msgSend(v5, "dominantMicrolocationUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "timeContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = v13;

    if (v9)
      v15 = v14 > 1800.0;
    else
      v15 = 1;
    if (v15 || v14 < 0.0)
      v17 = CFSTR("Microlocation NA");
    else
      v17 = v9;
    v7 = v17;

  }
  return v7;
}

@end
