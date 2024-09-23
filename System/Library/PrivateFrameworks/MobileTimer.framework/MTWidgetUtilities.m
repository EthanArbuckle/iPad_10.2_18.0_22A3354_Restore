@implementation MTWidgetUtilities

+ (id)timeZonesForCurrentClockWidgets
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v3 = (void *)getCHSWidgetConfigurationReaderClass_softClass;
  v16 = getCHSWidgetConfigurationReaderClass_softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getCHSWidgetConfigurationReaderClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getCHSWidgetConfigurationReaderClass_block_invoke;
    v12[3] = &unk_1E39CB690;
    v12[4] = &v13;
    __getCHSWidgetConfigurationReaderClass_block_invoke((uint64_t)v12);
    v3 = (void *)v14[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v13, 8);
  v6 = objc_alloc_init(v5);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __52__MTWidgetUtilities_timeZonesForCurrentClockWidgets__block_invoke;
  v9[3] = &unk_1E39CB648;
  v11 = a1;
  v7 = (id)objc_opt_new();
  v10 = v7;
  objc_msgSend(v6, "allConfiguredWidgetsWithCompletion:", v9);

  return v7;
}

void __52__MTWidgetUtilities_timeZonesForCurrentClockWidgets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    obj = v5;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v43 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    v8 = 0;
    if (!v43)
      goto LABEL_33;
    v42 = *(_QWORD *)v52;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v52 != v42)
          objc_enumerationMutation(obj);
        v44 = v9;
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v9), "widgetConfigurations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v45 = v10;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v11)
        {
          v12 = v11;
          v46 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v48 != v46)
                objc_enumerationMutation(v45);
              v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              objc_msgSend(v14, "widget");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "intent");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                v17 = a1;
                objc_msgSend(v14, "widget");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "intent");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "_className");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (objc_class *)objc_opt_class();
                NSStringFromClass(v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v20, "isEqualToString:", v22);

                if (v23)
                {
                  MTLogForCategory(8);
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    a1 = v17;
                    v25 = *(_QWORD *)(v17 + 40);
                    *(_DWORD *)buf = 138543362;
                    v56 = v25;
                    v26 = v24;
                    v27 = "%{public}@ read widget intent ClocksIntent";
                    goto LABEL_22;
                  }
                  a1 = v17;
                  goto LABEL_24;
                }
                objc_msgSend(v14, "widget");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "intent");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "_className");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (objc_class *)objc_opt_class();
                NSStringFromClass(v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v30, "isEqualToString:", v32);

                if (v33)
                {
                  MTLogForCategory(8);
                  v24 = objc_claimAutoreleasedReturnValue();
                  a1 = v17;
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    v34 = *(_QWORD *)(v17 + 40);
                    *(_DWORD *)buf = 138543362;
                    v56 = v34;
                    v26 = v24;
                    v27 = "%{public}@ read widget intent ClocksSingleIntent";
LABEL_22:
                    _os_log_impl(&dword_19AC4E000, v26, OS_LOG_TYPE_INFO, v27, buf, 0xCu);
                  }
LABEL_24:

                  objc_msgSend(v14, "widget");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "intent");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "valueForKey:", CFSTR("cities"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(*(id *)(a1 + 40), "timeZoneFromCities:", v37);
                  v38 = objc_claimAutoreleasedReturnValue();

                  v8 = (void *)v38;
                }
                else
                {
                  a1 = v17;
                }
                MTLogForCategory(8);
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  v40 = *(_QWORD *)(a1 + 40);
                  *(_DWORD *)buf = 138543618;
                  v56 = v40;
                  v57 = 2114;
                  v58 = v8;
                  _os_log_impl(&dword_19AC4E000, v39, OS_LOG_TYPE_INFO, "%{public}@ read clock widget timezones: %{public}@", buf, 0x16u);
                }

                continue;
              }
            }
            v12 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          }
          while (v12);
        }

        v9 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (!v43)
      {
LABEL_33:
        objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v8);

        v6 = 0;
        v5 = obj;
        goto LABEL_34;
      }
    }
  }
  MTLogForCategory(8);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __52__MTWidgetUtilities_timeZonesForCurrentClockWidgets__block_invoke_cold_1(a1, (uint64_t)v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
LABEL_34:

}

+ (id)timeZoneFromCities:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_2);
}

uint64_t __40__MTWidgetUtilities_timeZoneFromCities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timeZoneName");
}

+ (id)reloadAlarmWidgetTimeline
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 buf;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading widget timeline", (uint8_t *)&buf, 0xCu);
  }

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)getCHSTimelineControllerClass_softClass;
  v13 = getCHSTimelineControllerClass_softClass;
  if (!getCHSTimelineControllerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v15 = __getCHSTimelineControllerClass_block_invoke;
    v16 = &unk_1E39CB690;
    v17 = &v10;
    __getCHSTimelineControllerClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  v6 = [v5 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithExtensionBundleIdentifier:kind:", CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer.alarm"), v10);
  objc_msgSend(v7, "reloadTimelineWithReason:", CFSTR("alarm update"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __52__MTWidgetUtilities_timeZonesForCurrentClockWidgets__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ error reading into widgets config: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
