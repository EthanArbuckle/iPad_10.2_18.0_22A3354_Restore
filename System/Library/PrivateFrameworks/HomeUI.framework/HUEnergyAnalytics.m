@implementation HUEnergyAnalytics

+ (void)saveViewVisitEvent:(unint64_t)a3 withData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gridID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gridID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D303D8]);

    if (a3 == 44)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0D303D0];
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D303D0]);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HEUIEnergyDashboardDoublePaneEnabled"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D303C8]);

      v30[0] = CFSTR("eventType");
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HEUIEnergyDashboardDoublePaneEnabled"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        v19 = 10;
      else
        v19 = 9;
      objc_msgSend(v17, "numberWithUnsignedInteger:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = CFSTR("state");
      v31[0] = v20;
      v31[1] = &unk_1E7040D08;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToNumber:", &unk_1E7040D20);

      if (!v22)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "isEqualToNumber:", &unk_1E7040D38) & 1) != 0
          || objc_msgSend(v23, "isEqualToNumber:", &unk_1E7040D50))
        {

          v23 = &unk_1E7040D68;
        }
        v29[0] = v23;
        v28[0] = CFSTR("state");
        v28[1] = CFSTR("gridID");
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gridID"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v24;
        v28[2] = CFSTR("windowStart");
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v29[2] = v25;
        v28[3] = CFSTR("windowEnd");
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29[3] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "sendToUTFWithData:withSubsystem:withCategory:", v27, CFSTR("HomeEnergy"), CFSTR("CleanEnergyForecast"));
        goto LABEL_16;
      }
    }
    else
    {
      if (a3 != 51)
      {
        v12 = 0;
        goto LABEL_16;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("adviceText"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D303E0]);

      v32[0] = CFSTR("eventType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "getUTFAnalyticsEventTypeFrom:", 51));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = CFSTR("state");
      v33[0] = v11;
      v33[1] = &unk_1E7040D08;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1, "sendEnergyWindowsToUTFFromData:", v6);
LABEL_16:
    objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", a3, v8);
    objc_msgSend(a1, "sendToUTFWithData:withSubsystem:withCategory:", v12, CFSTR("HomeEnergy"), CFSTR("HomeAppUIInteractions"));

    goto LABEL_17;
  }
LABEL_18:

}

+ (void)sendToUTFWithData:(id)a3 withSubsystem:(id)a4 withCategory:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_get_global_queue(9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HUEnergyAnalytics_sendToUTFWithData_withSubsystem_withCategory___block_invoke;
  block[3] = &unk_1E6F4E020;
  v15 = v8;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v8;
  dispatch_async(v10, block);

}

+ (void)sendEnergyWindowsToUTFFromData:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("energyWindows"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") == 2)
      {
        v13[0] = &unk_1E7040D20;
        v12[0] = CFSTR("state");
        v12[1] = CFSTR("gridID");
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gridID"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13[1] = v8;
        v12[2] = CFSTR("windowStart");
        objc_msgSend(v7, "objectForKey:", CFSTR("HEUIGridForecastEnergyWindowStartTime"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2] = v9;
        v12[3] = CFSTR("windowEnd");
        objc_msgSend(v7, "objectForKey:", CFSTR("HEUIGridForecastEnergyWindowEndTime"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[3] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "sendToUTFWithData:withSubsystem:withCategory:", v11, CFSTR("HomeEnergy"), CFSTR("CleanEnergyForecast"));
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }

}

+ (unint64_t)getUTFAnalyticsEventTypeFrom:(unint64_t)a3
{
  if (a3 - 44 > 0xB)
    return 0;
  else
    return qword_1B9442438[a3 - 44];
}

uint64_t __66__HUEnergyAnalytics_sendToUTFWithData_withSubsystem_withCategory___block_invoke_2()
{
  uint64_t result;

  _MergedGlobals_622 = PPSCreateTelemetryIdentifier();
  result = PPSCreateTelemetryIdentifier();
  qword_1ED580AF8 = result;
  return result;
}

void __66__HUEnergyAnalytics_sendToUTFWithData_withSubsystem_withCategory___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HUEnergyAnalytics_sendToUTFWithData_withSubsystem_withCategory___block_invoke_2;
  block[3] = &unk_1E6F4D988;
  v3 = *(id *)(a1 + 32);
  if (qword_1ED580B00 != -1)
    dispatch_once(&qword_1ED580B00, block);
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("HomeAppUIInteractions")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("CleanEnergyForecast")))
  {
    PPSSendTelemetry();
  }

}

+ (void)saveViewVisitEvent:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:");
  v7[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "getUTFAnalyticsEventTypeFrom:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("state");
  v8[0] = v5;
  v8[1] = &unk_1E7040D08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendToUTFWithData:withSubsystem:withCategory:", v6, CFSTR("HomeEnergy"), CFSTR("HomeAppUIInteractions"));
}

+ (void)saveViewVisitEvent:(unint64_t)a3 withState:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D303A8]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", a3, v7);
  v12[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "getUTFAnalyticsEventTypeFrom:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("state");
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendToUTFWithData:withSubsystem:withCategory:", v11, CFSTR("HomeEnergy"), CFSTR("HomeAppUIInteractions"));
}

+ (void)saveTapEvent:(unint64_t)a3 withInteractionType:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30318]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", a3, v7);
  v11[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "getUTFAnalyticsEventTypeFrom:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("state");
  v12[0] = v9;
  v12[1] = &unk_1E7040D80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendToUTFWithData:withSubsystem:withCategory:", v10, CFSTR("HomeEnergy"), CFSTR("HomeAppUIInteractions"));
}

+ (void)saveViewDurationEvent:(unint64_t)a3 withDuration:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D303E8]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", a3, v8);
  v11[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "getUTFAnalyticsEventTypeFrom:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("state");
  v12[0] = v9;
  v12[1] = &unk_1E7040D80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendToUTFWithData:withSubsystem:withCategory:", v10, CFSTR("HomeEnergy"), CFSTR("HomeAppUIInteractions"));
}

+ (void)saveViewDurationEvent:(unint64_t)a3 withDuration:(id)a4 withUserHasAccessories:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v5 = a5;
  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a4;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D303B8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D303C0]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", a3, v10);
  v14[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "getUTFAnalyticsEventTypeFrom:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("state");
  v15[0] = v12;
  v15[1] = &unk_1E7040D80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendToUTFWithData:withSubsystem:withCategory:", v13, CFSTR("HomeEnergy"), CFSTR("HomeAppUIInteractions"));
}

+ (void)saveViewAccessedFromURLEvent:(unint64_t)a3 deepLinkFrom:(id)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  if (!-[__CFString length](v6, "length"))
  {

    v6 = CFSTR("unspecified");
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D303B0]);
  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", a3, v7);
  v10[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "getUTFAnalyticsEventTypeFrom:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("state");
  v11[0] = v8;
  v11[1] = &unk_1E7040D98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendToUTFWithData:withSubsystem:withCategory:", v9, CFSTR("HomeEnergy"), CFSTR("HomeAppUIInteractions"));
}

+ (void)saveWidgetSettingsEvent:(unint64_t)a3 withLocation:(unint64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D303F0]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", a3, v7);
}

@end
