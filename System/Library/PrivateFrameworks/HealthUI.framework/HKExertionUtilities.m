@implementation HKExertionUtilities

+ (id)filterSamplesOfExertionTypeCode:(int64_t)a3 fromExertionSamples:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__HKExertionUtilities_filterSamplesOfExertionTypeCode_fromExertionSamples___block_invoke;
  v5[3] = &__block_descriptor_40_e26__16__0__HKQuantitySample_8l;
  v5[4] = a3;
  objc_msgSend(a4, "hk_map:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __75__HKExertionUtilities_filterSamplesOfExertionTypeCode_fromExertionSamples___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");
  v6 = *(_QWORD *)(a1 + 32);

  if (v5 == v6)
    v7 = v3;
  else
    v7 = 0;

  return v7;
}

+ (id)mostRelevantValueFromExertionSamples:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "mostRelevantSampleFromExertionSamples:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "quantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_value");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)mostRelevantSampleFromExertionSamples:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "_creationDate", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hk_isAfterDate:", v4))
        {
          v12 = v11;

          v13 = v10;
          v4 = v12;
          v7 = v13;
        }

      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);

    if (v7)
      v6 = v7;
    else
      v6 = 0;
  }
  else
  {

  }
  return v6;
}

@end
