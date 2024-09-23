@implementation HKOverlayRoomPillValueProviderSleep

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  void *v7;
  HKOverlayPillValue *v8;

  -[HKOverlayRoomPillValueProviderSleep _minMaxValueFromChartPoints:displayType:unitPreferenceController:](self, "_minMaxValueFromChartPoints:displayType:unitPreferenceController:", a3, a5, a7, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKOverlayPillValue initWithValueString:unitString:]([HKOverlayPillValue alloc], "initWithValueString:unitString:", v7, &stru_1E9C4C428);

  return v8;
}

- (id)_minMaxValueFromChartPoints:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v27;
  void *v29;
  void *v30;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7 || !objc_msgSend(v7, "count"))
    goto LABEL_35;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 1.79769313e308;
    v14 = -1.79769313e308;
    v15 = *(_QWORD *)v43;
    v16 = -1.79769313e308;
    v17 = 1.79769313e308;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v10);
        v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v19;
          objc_msgSend(v20, "asleepValue");
          v22 = v21;
          objc_msgSend(v20, "inBedValue");
          v24 = v23;

          if (v22 >= v16)
            v25 = v22;
          else
            v25 = v16;
          if (v22 > 2.22044605e-16)
            v16 = v25;
          if (v22 < v17 && v22 > 2.22044605e-16)
            v17 = v22;
          if (v24 >= v14)
            v27 = v24;
          else
            v27 = v14;
          if (v24 > 2.22044605e-16)
            v14 = v27;
          if (v24 < v13 && v24 > 2.22044605e-16)
            v13 = v24;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 1.79769313e308;
    v14 = -1.79769313e308;
    v16 = -1.79769313e308;
    v17 = 1.79769313e308;
  }

  if (v17 != 1.79769313e308 || v13 != 1.79769313e308)
  {
    if (v17 >= 1.79769313e308)
      v32 = v13;
    else
      v32 = v17;
    if (v17 >= 1.79769313e308)
      v33 = v14;
    else
      v33 = v16;
    v34 = vabdd_f64(v32, v33);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    HKTimePeriodString(v35, 56);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34 >= 2.22044605e-16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      HKTimePeriodString(v36, 56);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("OVERLAY_RANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", v40, v30, v37, (_QWORD)v42);
      v41 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v41;
    }
  }
  else
  {
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v30;
}

@end
