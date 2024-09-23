@implementation HKSleepApneaUtilities

+ (id)localizedTitleForBreathingDisturbancesClassification:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SLEEP_BREATHING_DISTURBANCES_CLASSIFICATION_ELEVATED");
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SLEEP_BREATHING_DISTURBANCES_CLASSIFICATION_NOT_ELEVATED");
LABEL_5:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Nebula"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)localizedTitleForBreathingDisturbances:(id)a3
{
  void *v4;
  void *v5;

  HKAppleSleepingBreathingDisturbancesClassificationForQuantity();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedTitleForBreathingDisturbancesClassification:", objc_msgSend(v4, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)averageBreathingDisturbancesForChartData:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v19;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "value", (_QWORD)v18);
          v9 = v9 + v12 * (double)objc_msgSend(v11, "recordCount");
          v7 += objc_msgSend(v11, "recordCount");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
      v13 = (double)v7;
    }
    else
    {
      v9 = 0.0;
      v13 = 0.0;
    }

    v15 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "quantityWithUnit:doubleValue:", v16, v9 / v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)mostFrequentBreathingDisturbancesClassificationForChartData:(id)a3
{
  id v3;
  uint64_t (**v4)(void *, _QWORD);
  int v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__HKSleepApneaUtilities_mostFrequentBreathingDisturbancesClassificationForChartData___block_invoke;
    aBlock[3] = &unk_1E9C3FFC8;
    v9 = v3;
    v4 = (uint64_t (**)(void *, _QWORD))_Block_copy(aBlock);
    v5 = v4[2](v4, 0);
    if ((int)v4[2](v4, 1) >= v5)
      v6 = &unk_1E9CEADC0;
    else
      v6 = &unk_1E9CEADD8;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __85__HKSleepApneaUtilities_mostFrequentBreathingDisturbancesClassificationForChartData___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__HKSleepApneaUtilities_mostFrequentBreathingDisturbancesClassificationForChartData___block_invoke_2;
  v6[3] = &__block_descriptor_40_e43_B16__0__HKInteractiveChartSinglePointData_8l;
  v6[4] = a2;
  objc_msgSend(v2, "hk_filter:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

uint64_t __85__HKSleepApneaUtilities_mostFrequentBreathingDisturbancesClassificationForChartData___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CB6A28];
  v4 = (void *)MEMORY[0x1E0CB6CD0];
  v5 = a2;
  objc_msgSend(v4, "countUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v8 = v7;

  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HKAppleSleepingBreathingDisturbancesClassificationForQuantity();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  return v12;
}

@end
