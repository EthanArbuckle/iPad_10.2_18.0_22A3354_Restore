@implementation FPItemIDFromCrossDeviceItemID

void __FPItemIDFromCrossDeviceItemID_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __FPItemIDFromCrossDeviceItemID_block_invoke_cold_1(a1, v5);

    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
}

void __FPItemIDFromCrossDeviceItemID_block_invoke_80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    +[FPItemManager defaultManager](FPItemManager, "defaultManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchItemForURL:completionHandler:", a2, *(_QWORD *)(a1 + 40));

  }
}

void __FPItemIDFromCrossDeviceItemID_block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG]  %@ => %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
