@implementation HKWheelchairUseCharacteristicCache

void __59___HKWheelchairUseCharacteristicCache_initWithHealthStore___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 16;
    v3 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 16);
    -[os_unfair_lock_s _lock_fetchWheelchairUse](v3, "_lock_fetchWheelchairUse");
    os_unfair_lock_unlock(v2);
    WeakRetained = v3;
  }

}

void __63___HKWheelchairUseCharacteristicCache__lock_fetchWheelchairUse__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12 = 0;
  objc_msgSend(v2, "wheelchairUseWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___HKWheelchairUseCharacteristicCache__lock_fetchWheelchairUse__block_invoke_2;
  v8[3] = &unk_1E37E6738;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v5;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __63___HKWheelchairUseCharacteristicCache__lock_fetchWheelchairUse__block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_handleFetchSuccess:");
  else
    return objc_msgSend(v2, "_handleFetchError:", a1[6]);
}

void __57___HKWheelchairUseCharacteristicCache__handleFetchError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  if ((HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    v2 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v4 = 134217984;
      v5 = v3;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "Retrying wheelchair characteristic fetch. Retry attempt: %zd", (uint8_t *)&v4, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_lock_fetchWheelchairUse");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
}

@end
