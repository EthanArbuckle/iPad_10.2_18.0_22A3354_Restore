@implementation HKLocationShifter

void __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  CLLocationCoordinate2D v4;
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
  double v15;
  void *v16;
  id v17;

  v4 = CLLocationCoordinate2DMake(a2, a3);
  v5 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(*(id *)(a1 + 32), "altitude");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "horizontalAccuracy");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "verticalAccuracy");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "course");
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "speed");
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v5, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v16, v4.latitude, v4.longitude, v7, v9, v11, v13, v15);

  objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 56), v17);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v6, v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_11(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  int v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v12);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

  if ((double)(unint64_t)objc_msgSend(v2, "count") >= ceilf((float)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "count")* 0.5))
  {
    _HKInitializeLogging();
    v9 = (void *)HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = objc_msgSend(v2, "count");
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "[routes] Shifted %d valid locations", buf, 8u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "[routes] Error shifting coordinate at index %d: %{public}@", (uint8_t *)v4, 0x12u);
}

@end
