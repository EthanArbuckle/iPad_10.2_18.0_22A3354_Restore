@implementation ATXSetAlarmTimeOfDayDataSource

- (ATXSetAlarmTimeOfDayDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXSetAlarmTimeOfDayDataSource *v6;
  ATXSetAlarmTimeOfDayDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSetAlarmTimeOfDayDataSource;
  v6 = -[ATXSetAlarmTimeOfDayDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (id)_recentIntentDonationsForBundleId:(id)a3 limit:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  unint64_t v21;
  _QWORD v22[4];
  id v23;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "App");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke;
  v22[3] = &unk_1E82C55F0;
  v23 = v5;
  v12 = v5;
  objc_msgSend(v10, "filterWithIsIncluded:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_5;
  v19[3] = &unk_1E82C5638;
  v14 = v6;
  v20 = v14;
  v21 = a4;
  v15 = (id)objc_msgSend(v13, "sinkWithCompletion:shouldContinue:", &__block_literal_global_12, v19);

  v16 = v20;
  v17 = v14;

  return v17;
}

uint64_t __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_heuristic();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_2_cold_1(v2, v4);

  }
}

BOOL __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "count") != *(_QWORD *)(a1 + 40);

  return v7;
}

+ (id)timeOfDayFromDonations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "intentClass");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("MTCreateAlarmIntent"));

        if (v13)
        {
          v18 = 0;
          v19 = 0;
          v17 = 0;
          objc_msgSend(v11, "absoluteTimestamp");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "getHour:minute:second:nanosecond:fromDate:", &v19, &v18, &v17, 0, v14);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3600 * v19 + 60 * v18 + v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)medianFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v6, "count") >> 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &unk_1E82D5698;
  }

  return v7;
}

- (void)alarmTimeOfDay:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  NSObject *v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5560) & 1) != 0)
  {
    -[ATXSetAlarmTimeOfDayDataSource _recentIntentDonationsForBundleId:limit:](self, "_recentIntentDonationsForBundleId:limit:", CFSTR("com.apple.mobiletimer"), 20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXSetAlarmTimeOfDayDataSource timeOfDayFromDonations:](ATXSetAlarmTimeOfDayDataSource, "timeOfDayFromDonations:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXSetAlarmTimeOfDayDataSource medianFrom:](ATXSetAlarmTimeOfDayDataSource, "medianFrom:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;
    objc_msgSend(v7, "floatValue");
    v11 = v10;
    __atxlog_handle_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134218496;
      v14 = vcvtms_u32_f32(v9 / 3600.0);
      v15 = 2048;
      v16 = vcvtms_u32_f32((float)(v11 - (float)(3600 * v14)) / 60.0);
      v17 = 2048;
      v18 = objc_msgSend(v6, "count");
      _os_log_debug_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_DEBUG, "Median time to set alarm: %tu:%02tu (based on %tu donations)", (uint8_t *)&v13, 0x20u);
    }

    v4[2](v4, v7, 0);
  }
  else
  {
    v4[2](v4, &unk_1E82D5698, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

void __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "Could not traverse intent stream to find recent intent donations: %@", (uint8_t *)&v4, 0xCu);

}

@end
