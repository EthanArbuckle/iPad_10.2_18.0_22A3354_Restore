@implementation ActivityBarSeries

void __77___ActivityBarSeries_updateLegendsForTimeScope_range_drawingDuringScrolling___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  _GoalDetailCollator *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  NSObject *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  void *v26;
  HKLegendEntry *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  HKLegendEntry *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a3)
  {
    v30 = a1;
    v31 = v8;
    v10 = objc_alloc_init(_GoalDetailCollator);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      v15 = -1;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v17, "userInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_GoalDetailCollator processCoordinateUserInfo:](v10, "processCoordinateUserInfo:", v18);

          objc_msgSend(v17, "userInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v17, "userInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v21, "activityValue");

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v13);
    }
    else
    {
      v15 = -1;
    }

    if ((*(_QWORD *)(v30 + 40) & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v30 + 32) + 296));
      objc_msgSend(WeakRetained, "activitySummaryForCurrentRange");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v30 + 32), "unitPreferenceController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GoalDetailCollator activitySummaryDetailStringWithActivitySummary:unitPreferenceController:activityValue:displayTypeController:](v10, "activitySummaryDetailStringWithActivitySummary:unitPreferenceController:activityValue:displayTypeController:", v24, v25, v15, *(_QWORD *)(*(_QWORD *)(v30 + 32) + 304));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[_GoalDetailCollator detailStringWithTimeScope:](v10, "detailStringWithTimeScope:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v31;
    if (v26 && objc_msgSend(v26, "length"))
    {
      v27 = objc_alloc_init(HKLegendEntry);
      -[HKLegendEntry setTitle:](v27, "setTitle:", v26);
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityLegendLabelColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKLegendEntry setLabelColor:](v27, "setLabelColor:", v28);

      v36 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v30 + 32), "setDetailLegendEntries:", v29);

    }
    else
    {
      objc_msgSend(*(id *)(v30 + 32), "setDetailLegendEntries:", MEMORY[0x1E0C9AA60]);
    }
    objc_msgSend(*(id *)(v30 + 32), "setLastLegendUpdateTime:", *(double *)(v30 + 48));

  }
  else
  {
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __77___ActivityBarSeries_updateLegendsForTimeScope_range_drawingDuringScrolling___block_invoke_cold_1((uint64_t)v9, v22);
  }

}

void __119___ActivityBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double x;
  double y;
  double height;
  double v32;
  double v33;
  double v34;
  void *v35;
  _OWORD v36[4];
  _OWORD v37[2];
  CGRect v38;
  CGRect v39;

  v5 = a2;
  objc_msgSend(v5, "min");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "max");
  v11 = v10;
  v13 = v12;
  v14 = *(double *)(a1 + 80);
  if (*(double *)(a1 + 72) - v7 <= v14 && v7 - *(double *)(a1 + 88) <= v14)
  {
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v5, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "hasActivityGoal") && (objc_msgSend(v18, "activityValueGoalMet") & 1) == 0)
      {
        v19 = *(id *)(a1 + 40);

        v15 = v19;
      }
      if (objc_msgSend(v18, "activityPaused"))
      {
        v20 = *(id *)(a1 + 48);

        v15 = v20;
      }

    }
    if (*(_BYTE *)(a1 + 168))
    {
      v21 = a3[1];
      v37[0] = *a3;
      v37[1] = v21;
      v22 = *(_OWORD *)(a1 + 112);
      v36[0] = *(_OWORD *)(a1 + 96);
      v36[1] = v22;
      v23 = *(_OWORD *)(a1 + 144);
      v36[2] = *(_OWORD *)(a1 + 128);
      v36[3] = v23;
      if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v37, (uint64_t *)v36))
      {
        v24 = *(id *)(a1 + 56);

        v15 = v24;
      }
    }
    if (v7 - v11 >= 0.0)
      v25 = v7 - v11;
    else
      v25 = -(v7 - v11);
    if (v9 - v13 >= 0.0)
      v26 = v9 - v13;
    else
      v26 = -(v9 - v13);
    v27 = v11;
    v28 = v13;
    v38 = CGRectStandardize(*(CGRect *)(&v25 - 2));
    v39 = CGRectOffset(v38, *(double *)(a1 + 160) * -0.5, 0.0);
    x = v39.origin.x;
    y = v39.origin.y;
    height = v39.size.height;
    v32 = *(double *)(a1 + 160) + v39.size.width;
    objc_msgSend(*(id *)(a1 + 64), "cornerRadii");
    +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", 3, x, y, v32, height, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendPath:", v35);

  }
}

void __77___ActivityBarSeries_updateLegendsForTimeScope_range_drawingDuringScrolling___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Unable to determine points for chart legend update: %@", (uint8_t *)&v2, 0xCu);
}

@end
