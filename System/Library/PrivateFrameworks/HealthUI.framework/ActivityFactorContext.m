@implementation ActivityFactorContext

uint64_t __109___ActivityFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContextItemForDateInterval:overlayController:timeScope:resolution:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
}

void __109___ActivityFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HKOverlayPillValue *v15;
  void *v16;
  void *v17;
  HKOverlayPillValue *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  HKOverlayPillValue *v23;
  void *v24;
  void *v25;
  HKOverlayPillValue *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (a4)
  {
    v11 = *(_QWORD *)(a1 + 80);
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKOverlayRoomFactorContext factorDateIntervalsWithChartPoints:dateInterval:timeScope:calendar:intersection:](HKOverlayRoomFactorContext, "factorDateIntervalsWithChartPoints:dateInterval:timeScope:calendar:intersection:", v8, v12, v11, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = [HKOverlayPillValue alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HKOverlayPillValue initWithValueString:unitString:](v15, "initWithValueString:unitString:", v17, &stru_1E9C4C428);

    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(*(id *)(a1 + 48), "activityCurrentValueView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "computeVisibleSummaryForGraphView:timeScope:filterDateIntervals:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v20, "hasNoData") & 1) == 0)
      {
        objc_msgSend(v20, "summaryResult");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isPaused");

        if (v22)
        {
          v23 = [HKOverlayPillValue alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_PAUSED_FACTOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[HKOverlayPillValue initWithValueString:unitString:](v23, "initWithValueString:unitString:", v25, &stru_1E9C4C428);

        }
        else
        {
          v27 = *(void **)(a1 + 48);
          objc_msgSend(v20, "summaryResult");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_moveStringForSummary:", v47);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v46;
          objc_msgSend(v20, "summaryResult");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "appleExerciseTime");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "summaryResult");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "appleExerciseTime");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          HKLocalizedDisplayStringForAppleExerciseTime(v43, v42, 1, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v52[1] = v41;
          objc_msgSend(v20, "summaryResult");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "appleStandHours");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "summaryResult");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "appleStandHoursGoal");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          HKLocalizedDisplayStringForAppleStandHours(v39, v29, 1, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v52[2] = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 48), "activityCurrentValueView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "effectiveUserInterfaceLayoutDirection");

          if (v32 == 1)
          {
            objc_msgSend(v48, "reverseObjectEnumerator");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "allObjects");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v34 = v48;
          }
          v49 = v34;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_FACTOR_DIVIDER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "componentsJoinedByString:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = -[HKOverlayPillValue initWithValueString:unitString:]([HKOverlayPillValue alloc], "initWithValueString:unitString:", v37, &stru_1E9C4C428);
        }
        v18 = v26;
      }

    }
    v38 = *(_QWORD *)(a1 + 80);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __109___ActivityFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3;
    v50[3] = &unk_1E9C41C00;
    v51 = *(id *)(a1 + 64);
    objc_msgSend(WeakRetained, "setLastUpdatedItemFromPillValue:timeScope:completion:", v18, v38, v50);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __109___ActivityFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
