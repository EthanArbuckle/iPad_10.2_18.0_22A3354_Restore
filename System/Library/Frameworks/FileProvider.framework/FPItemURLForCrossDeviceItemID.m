@implementation FPItemURLForCrossDeviceItemID

uint64_t __FPItemURLForCrossDeviceItemID_block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __FPItemURLForCrossDeviceItemID_block_invoke_66(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  if (!a2 || a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CA5890];
    objc_msgSend(a2, "providerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleProxyForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "dataContainerURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "isEqualToString:", v15);

    if ((v16 & 1) != 0)
    {
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __FPItemURLForCrossDeviceItemID_block_invoke_66_cold_1(a1, v10);

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("path UUID doesn't match in resulting item URL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

void __FPItemURLForCrossDeviceItemID_block_invoke_70(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void (*v12)(void);
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = v7;
  if (!a2 || a4)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_9:
    v12();
    goto LABEL_10;
  }
  if (!v7)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __FPItemURLForCrossDeviceItemID_block_invoke_70_cold_1(a1, a2);

    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  CFRetain(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAccessingSecurityScopedResource");
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __FPItemURLForCrossDeviceItemID_block_invoke_71;
  v14[3] = &unk_1E444C198;
  v15 = v9;
  v17 = *(id *)(a1 + 40);
  v16 = v8;
  v11 = v9;
  objc_msgSend(v10, "fetchItemForURL:completionHandler:", v11, v14);

LABEL_10:
}

void __FPItemURLForCrossDeviceItemID_block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "stopAccessingSecurityScopedResource");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __FPItemURLForCrossDeviceItemID_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), a3);
}

uint64_t __FPItemURLForCrossDeviceItemID_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), a3);
}

void __FPItemURLForCrossDeviceItemID_block_invoke_66_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG]  %@ => '%@'", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __FPItemURLForCrossDeviceItemID_block_invoke_70_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG]  %@ => '%@'", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
