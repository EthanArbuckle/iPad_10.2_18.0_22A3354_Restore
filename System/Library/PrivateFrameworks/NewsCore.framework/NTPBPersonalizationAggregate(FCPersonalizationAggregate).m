@implementation NTPBPersonalizationAggregate(FCPersonalizationAggregate)

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("clicks");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "clicks");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("impressions");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "impressions");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("eventCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "eventCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  v11[4] = CFSTR("featureKey");
  objc_msgSend(a1, "featureKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)lastModified
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", objc_msgSend(a1, "timestamp"));
}

- (uint64_t)ctr
{
  return objc_msgSend(a1, "personalizationValueWithBaseline:decayRate:", 0, 0.0);
}

- (uint64_t)personalizationValueWithBaseline:()FCPersonalizationAggregate decayRate:
{
  return objc_msgSend(a1, "personalizationValueWithBaseline:decayRate:baselineClicksMultiplier:", a3, 1.0);
}

- (double)personalizationValueWithBaseline:()FCPersonalizationAggregate decayRate:baselineClicksMultiplier:
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "clicks");
    v11 = v10;
    objc_msgSend(v9, "impressions");
    objc_msgSend(a1, "_personalizationValueWithBaselineClicks:baselineImpressions:decayRate:baselineClicksMultiplier:", v11, v12, a2, a3);
LABEL_5:
    v14 = v13;
    goto LABEL_6;
  }
  objc_msgSend(a1, "impressions");
  v14 = 0.0;
  if (v15 > 0.0)
  {
    objc_msgSend(a1, "clicks");
    v17 = v16;
    objc_msgSend(a1, "impressions");
    FCClamp(v17 / v18, 0.0, 1.0);
    goto LABEL_5;
  }
LABEL_6:

  return v14;
}

- (double)personalizationValueWithCorrelatedAggregate:()FCPersonalizationAggregate baseline:decayRate:baselineClicksMultiplier:
{
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  long double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  double v31;

  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (!v10)
  {
    v29 = a1;
    v30 = v12;
LABEL_10:
    objc_msgSend(v29, "personalizationValueWithBaseline:decayRate:baselineClicksMultiplier:", v30, (double)a2, a3);
    goto LABEL_11;
  }
  if (!v11)
  {
    v29 = a1;
    v30 = v10;
    goto LABEL_10;
  }
  objc_msgSend(v11, "clicks");
  v14 = 1.0;
  if (a3 > 0.0)
    v14 = a3;
  v15 = v14 * v13;
  objc_msgSend(v12, "impressions");
  v16 = v15;
  if (v15 <= v17)
  {
    objc_msgSend(v12, "impressions");
    v16 = v18;
  }
  objc_msgSend(v10, "impressions");
  v20 = v19;
  objc_msgSend(v10, "impressions");
  v22 = FCPersonalizationLinearImpressionCount(v21, a2);
  v23 = v20 + pow(a2, v22) * v16;
  objc_msgSend(v10, "clicks");
  v25 = v24;
  objc_msgSend(v10, "impressions");
  v27 = FCPersonalizationLinearImpressionCount(v26, a2);
  objc_msgSend(a1, "_personalizationValueWithBaselineClicks:baselineImpressions:decayRate:baselineClicksMultiplier:", (double)(v25 + pow(a2, v27) * v15), (double)v23, (double)a2, 1.0);
LABEL_11:
  v31 = v28;

  return v31;
}

- (double)powerWithDecayFactor:()FCPersonalizationAggregate
{
  double v3;

  objc_msgSend(a1, "impressions");
  return (1.0 - a2) * v3;
}

- (double)relativePersonalizationValueWithCorrelatedAggregate:()FCPersonalizationAggregate baseline:decayFactor:baselineClicksMultiplier:
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v10 = a6;
  objc_msgSend(a1, "personalizationValueWithCorrelatedAggregate:baseline:decayRate:baselineClicksMultiplier:", a5, v10, a2, a3);
  v12 = v11;
  objc_msgSend(v10, "personalizationValueWithBaseline:decayRate:", 0, a2);
  v14 = v13;

  objc_msgSend(a1, "powerWithDecayFactor:", a2);
  return (v12 - v14) * v15;
}

- (double)_personalizationValueWithBaselineClicks:()FCPersonalizationAggregate baselineImpressions:decayRate:baselineClicksMultiplier:
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double result;

  v7 = 1.0;
  if (a5 > 0.0)
    v7 = a5;
  v8 = v7 * a2;
  if (v7 * a2 <= a3)
    v9 = a3;
  else
    v9 = v7 * a2;
  objc_msgSend(a1, "clicks");
  v11 = v10;
  objc_msgSend(a1, "impressions");
  v13 = FCPersonalizationLinearImpressionCount(v12, a4);
  objc_msgSend(a1, "impressions");
  v15 = v14;
  objc_msgSend(a1, "impressions");
  v17 = FCPersonalizationLinearImpressionCount(v16, a4);
  v18 = v15 + pow(a4, v17) * v9;
  if (v18 <= 0.0)
    return 0.0;
  v19 = (v11 + pow(a4, v13) * v8) / v18;
  FCClamp(v19, 0.0, 1.0);
  return result;
}

@end
