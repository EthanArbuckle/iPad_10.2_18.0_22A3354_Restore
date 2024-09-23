@implementation SFRequestDesktopSiteQuirksSnapshot

void __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke_cold_2(v12, (uint64_t)v8, (uint64_t)v7);
    goto LABEL_7;
  }
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  if (v9 >= 2)
  {
    v10 = v9;
    v11 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke_cold_1((uint64_t)v7, v10, v11);
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_1_5(&dword_1A3B2D000, a3, (uint64_t)a3, "Invalied value %lu for key %@ in request desktop site quirks", (uint8_t *)&v3);
}

void __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v6 = 138412546;
  v7 = objc_opt_class();
  v8 = 2112;
  v9 = a3;
  OUTLINED_FUNCTION_1_5(&dword_1A3B2D000, v4, v5, "Unexpected value %@ for key %@ in request desktop site quirks", (uint8_t *)&v6);

}

@end
