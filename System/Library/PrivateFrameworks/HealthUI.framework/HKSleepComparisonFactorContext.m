@implementation HKSleepComparisonFactorContext

void __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v13 = WeakRetained;
  if (a4)
  {
    objc_msgSend(WeakRetained, "displayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKOverlayPillValueProvidingFactory overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:](HKOverlayPillValueProvidingFactory, "overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:", v14, 0, +[HKOverlayPillValueProvidingFactory interfaceLayoutForController:](HKOverlayPillValueProvidingFactory, "interfaceLayoutForController:", *(_QWORD *)(a1 + 32)));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 72);
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKOverlayRoomFactorContext factorDateIntervalsWithChartPoints:dateInterval:timeScope:calendar:intersection:](HKOverlayRoomFactorContext, "factorDateIntervalsWithChartPoints:dateInterval:timeScope:calendar:intersection:", v9, v17, v16, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count"))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 72);
      v22 = *(_QWORD *)(a1 + 80);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
      v34[3] = &unk_1E9C457A8;
      v23 = *(void **)(a1 + 56);
      v34[4] = *(_QWORD *)(a1 + 48);
      v36 = v21;
      v35 = v23;
      objc_msgSend(v13, "chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:", 0, v19, v20, 0, v21, v22, v34);

    }
    else
    {
      objc_msgSend(v13, "displayType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 72);
      objc_msgSend(v13, "applicationItems");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "unitController");
      v31 = v15;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "valueFromChartPoints:unit:displayType:timeScope:unitPreferenceController:", MEMORY[0x1E0C9AA60], v10, v24, v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = *(_QWORD *)(a1 + 72);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_4;
      v32[3] = &unk_1E9C41C00;
      v33 = *(id *)(a1 + 56);
      v30 = v29;
      v15 = v31;
      objc_msgSend(v13, "setLastUpdatedItemFromPillValue:timeScope:completion:", v28, v30, v32);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  if (a4)
  {
    objc_msgSend(a2, "hk_map:", &__block_literal_global_76);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sleepChartFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedSelectedRangeLabelDataWithChartData:context:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithString:", v9);

    objc_msgSend(v6, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "attributedString");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }
    objc_msgSend(*(id *)(a1 + 32), "_setContextItem:timeScope:completion:", v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInfo");
}

uint64_t __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72___HKSleepComparisonFactorContext__setContextItem_timeScope_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
