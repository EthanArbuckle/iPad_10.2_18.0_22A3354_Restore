@implementation CMPedometer

uint64_t __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke_271(_QWORD *a1, void *a2)
{
  id v3;
  void (*v4)(void);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void (**)(void))(a1[5] + 16);
  if (v3)
  {
    v4();
    objc_msgSend(v3, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hd_datestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v6);
    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1[6] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      v12 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning pedometer updates from %{public}@.", buf, 0x16u);
    }
    v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke_273;
    v15[3] = &unk_1E6D0F718;
    v14 = (void *)a1[5];
    v16 = (id)a1[4];
    v17 = v14;
    objc_msgSend(v16, "startPedometerUpdatesFromDate:withHandler:", v13, v15);

  }
  else
  {
    v4();
  }

}

void __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke_273(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Received datum %@, error: %{public}@.", buf, 0x20u);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }

}

@end
