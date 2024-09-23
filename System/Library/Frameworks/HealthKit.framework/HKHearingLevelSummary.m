@implementation HKHearingLevelSummary

- (HKHearingLevelSummary)initWithLeftEarMetrics:(id)a3 rightEarMetrics:(id)a4
{
  id v7;
  id v8;
  HKHearingLevelSummary *v9;
  HKHearingLevelSummary *v10;
  uint64_t v11;
  HKHearingLevelMetrics *overallMetrics;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKHearingLevelSummary;
  v9 = -[HKHearingLevelSummary init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_leftEarMetrics, a3);
    objc_storeStrong((id *)&v10->_rightEarMetrics, a4);
    +[HKHearingLevelMetrics _overallMetricsFromLeftEarMetrics:rightEarMetrics:]((uint64_t)HKHearingLevelMetrics, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    overallMetrics = v10->_overallMetrics;
    v10->_overallMetrics = (HKHearingLevelMetrics *)v11;

  }
  return v10;
}

+ (HKHearingLevelSummary)emptySummary
{
  objc_opt_self();
  return -[HKHearingLevelSummary initWithLeftEarMetrics:rightEarMetrics:]([HKHearingLevelSummary alloc], "initWithLeftEarMetrics:rightEarMetrics:", 0, 0);
}

+ (id)summaryForAudiogramSample:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  HKHearingLevelMetrics *v35;
  HKHearingLevelMetrics *v36;
  HKHearingLevelSummary *v37;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sensitivityPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v39 = a1;
    +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v7, 1.79769313e308);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9, -1.79769313e308);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v8;
    v12 = v10;
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v13 = v11;
    v14 = v12;
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v40 = v4;
    objc_msgSend(v4, "sensitivityPoints");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v13;
    v41 = v14;
    v42 = v13;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v47)
    {
      v46 = *(_QWORD *)v49;
      v15 = v14;
      v16 = v13;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v49 != v46)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v18, "frequency");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKUnit hertzUnit](HKUnit, "hertzUnit");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValueForUnit:", v21);
          objc_msgSend(v19, "numberWithDouble:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "leftEarSensitivity");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            HKQuantityMin(v13, v23);
            v24 = objc_claimAutoreleasedReturnValue();

            HKQuantityMax(v14, v23);
            v25 = objc_claimAutoreleasedReturnValue();

            HKHearingLevelClassificationPureToneAverageFrequencies();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "containsObject:", v22);

            if (v27)
              objc_msgSend(v44, "addObject:", v23);
            v14 = (id)v25;
            v13 = (id)v24;
          }
          objc_msgSend(v18, "rightEarSensitivity");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            HKQuantityMin(v16, v28);
            v29 = objc_claimAutoreleasedReturnValue();

            HKQuantityMax(v15, v28);
            v30 = objc_claimAutoreleasedReturnValue();

            HKHearingLevelClassificationPureToneAverageFrequencies();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "containsObject:", v22);

            if (v32)
              objc_msgSend(v43, "addObject:", v28);
            v15 = (void *)v30;
            v16 = (void *)v29;
          }

        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v47);
    }

    +[HKHearingLevelSummary _pureToneAverageFromPureToneSensitivityPoints:]((uint64_t)v39, v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKHearingLevelSummary _pureToneAverageFromPureToneSensitivityPoints:]((uint64_t)v39, v43);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[HKHearingLevelMetrics initWithAverageSensitivity:minimumSensitivity:maximumSensitivity:]([HKHearingLevelMetrics alloc], "initWithAverageSensitivity:minimumSensitivity:maximumSensitivity:", v33, v13, v14);
    v36 = -[HKHearingLevelMetrics initWithAverageSensitivity:minimumSensitivity:maximumSensitivity:]([HKHearingLevelMetrics alloc], "initWithAverageSensitivity:minimumSensitivity:maximumSensitivity:", v34, v16, v15);
    v37 = -[HKHearingLevelSummary initWithLeftEarMetrics:rightEarMetrics:]([HKHearingLevelSummary alloc], "initWithLeftEarMetrics:rightEarMetrics:", v35, v36);

    v4 = v40;
  }
  else
  {
    +[HKHearingLevelSummary emptySummary]();
    v37 = (HKHearingLevelSummary *)objc_claimAutoreleasedReturnValue();
  }

  return v37;
}

+ (id)_pureToneAverageFromPureToneSensitivityPoints:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "count") == 4)
  {
    +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "doubleValueForUnit:", v3, (_QWORD)v14);
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
      v11 = v8 * 0.25 * 100.0;
    }
    else
    {
      v11 = 0.0;
    }

    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v3, round(v11) / 100.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  HKHearingLevelSummary *v4;
  HKHearingLevelSummary *v5;
  char v6;

  v4 = (HKHearingLevelSummary *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[HKHearingLevelSummary isEqualToHearingLevelSummary:](self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToHearingLevelSummary:(void *)a1
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a2;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_29;
  }
  objc_msgSend(a1, "leftEarMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftEarMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {
    objc_msgSend(v4, "leftEarMetrics");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v16 = 0;
      goto LABEL_28;
    }
    v2 = (void *)v7;
    objc_msgSend(a1, "leftEarMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leftEarMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v9))
    {
      v16 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v31 = v9;
    v32 = v8;
  }
  objc_msgSend(a1, "rightEarMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightEarMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != v11)
  {
    objc_msgSend(v4, "rightEarMetrics");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(a1, "rightEarMetrics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rightEarMetrics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqual:", v15))
      {
        v27 = v15;
        v28 = v14;
        v29 = v13;
        goto LABEL_11;
      }

    }
    v16 = 0;
LABEL_23:
    v24 = v5 == v6;
    goto LABEL_26;
  }
LABEL_11:
  objc_msgSend(a1, "overallMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overallMetrics");
  v18 = objc_claimAutoreleasedReturnValue();
  v16 = v17 == (void *)v18;
  if (v17 == (void *)v18)
  {

LABEL_20:
    if (v10 != v11)
    {

    }
    goto LABEL_23;
  }
  v19 = (void *)v18;
  v30 = v10;
  objc_msgSend(v4, "overallMetrics");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {

    goto LABEL_20;
  }
  v21 = (void *)v20;
  v26 = v2;
  objc_msgSend(a1, "overallMetrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overallMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v22, "isEqual:", v23);

  if (v30 == v11)
  {

  }
  else
  {

  }
  v24 = v5 == v6;
  v2 = v26;
LABEL_26:
  v9 = v31;
  v8 = v32;
  if (!v24)
    goto LABEL_27;
LABEL_28:

LABEL_29:
  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHearingLevelSummary overallMetrics](self, "overallMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHearingLevelSummary leftEarMetrics](self, "leftEarMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHearingLevelSummary rightEarMetrics](self, "rightEarMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p overall = %@, left ear = %@, right ear = %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HKHearingLevelMetrics)overallMetrics
{
  return self->_overallMetrics;
}

- (HKHearingLevelMetrics)leftEarMetrics
{
  return self->_leftEarMetrics;
}

- (HKHearingLevelMetrics)rightEarMetrics
{
  return self->_rightEarMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarMetrics, 0);
  objc_storeStrong((id *)&self->_leftEarMetrics, 0);
  objc_storeStrong((id *)&self->_overallMetrics, 0);
}

@end
