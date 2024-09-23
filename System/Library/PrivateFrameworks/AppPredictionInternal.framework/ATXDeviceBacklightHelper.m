@implementation ATXDeviceBacklightHelper

+ (id)getScreenOnIntervalsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[5];
  id v24;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA48B6C]();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__63;
  v23[4] = __Block_byref_object_dispose__63;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v8 = (void *)objc_opt_new();
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Display");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Backlight");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v5, v6, 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke_4;
  v17[3] = &unk_1E82E58D8;
  v19 = v21;
  v20 = v23;
  v14 = v8;
  v18 = v14;
  v15 = (id)objc_msgSend(v13, "sinkWithCompletion:receiveInput:", &__block_literal_global_137, v17);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  objc_autoreleasePoolPop(v7);
  return v14;
}

void __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_metrics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke_cold_1(v2, v4);

  }
}

void __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a2;
  objc_msgSend(v25, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backlightLevel");

  if (v4 == 1 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v25, "eventBody");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  objc_msgSend(v25, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "backlightLevel");

  v10 = v25;
  if (!v9)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(v25, "eventBody");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "absoluteTimestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "absoluteTimestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v17 = v16;

      if (v14 > v17)
      {
        v18 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "absoluteTimestamp");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "eventBody");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "absoluteTimestamp");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v18, "initWithStartDate:endDate:", v19, v21);

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v22);
      }
    }
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = 0;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v10 = v25;
  }

}

void __73__ATXDeviceBacklightHelper_getScreenOnIntervalsBetweenStartDate_endDate___block_invoke_cold_1(void *a1, NSObject *a2)
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
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXDeviceUsageModeLoggingPipeline: Error querying Backlight stream: %@", (uint8_t *)&v4, 0xCu);

}

@end
