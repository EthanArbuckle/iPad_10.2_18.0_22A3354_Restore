@implementation FPCrossDeviceItemIDForItemID

void __FPCrossDeviceItemIDForItemID_block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t a5)
{
  id v9;
  void *v10;
  NSObject *v11;
  void (*v12)(void);
  void *v13;
  NSObject *v14;
  void (*v15)(void);

  v9 = a4;
  v10 = v9;
  if (!a2 || a5)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_8:
    v12();
    goto LABEL_15;
  }
  if (a3)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __FPCrossDeviceItemIDForItemID_block_invoke_cold_1(a1);

    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_8;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@:%@"), CFSTR("deviceSpecific"), v9, a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __FPCrossDeviceItemIDForItemID_block_invoke_cold_1(a1);

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("can't extract path UUID for local only item"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v15();

LABEL_15:
}

void __FPCrossDeviceItemIDForItemID_block_invoke_59(uint64_t a1, void *a2, int a3, char a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  char v21;
  char v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  char v27;
  char v28;

  v11 = a2;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v11 || v13)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v15 = objc_msgSend(v11, "startAccessingSecurityScopedResource");
    if (a3)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __FPCrossDeviceItemIDForItemID_block_invoke_2;
      v23[3] = &unk_1E444C030;
      v27 = v15;
      v24 = v11;
      v26 = *(id *)(a1 + 40);
      v28 = a4;
      v25 = v12;
      legacy_FPUniversalBookmarkableStringFromDocumentURL(v24, v23);

      v16 = v24;
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __FPCrossDeviceItemIDForItemID_block_invoke_3;
      v17[3] = &unk_1E444C030;
      v21 = v15;
      v18 = v11;
      v20 = *(id *)(a1 + 40);
      v22 = a4;
      v19 = v12;
      FPBookmarkableStringFromDocumentURL(v18, v17);

      v16 = v18;
    }

  }
}

uint64_t __FPCrossDeviceItemIDForItemID_block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __FPCrossDeviceItemIDForItemID_block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __FPCrossDeviceItemIDForItemID_block_invoke_4(uint64_t a1, void *a2, char a3, int a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  char v24;
  char v25;

  v9 = a2;
  v10 = a5;
  v11 = v10;
  if (!v9 || v10)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (a4 && objc_msgSend(v9, "isUbiquitous") && (objc_msgSend(v9, "isUploaded") & 1) != 0)
    {
      v12 = 0;
      v13 = 1;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CA5890];
      objc_msgSend(v9, "providerID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleProxyForIdentifier:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "dataContainerURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
    }
    objc_msgSend(v9, "fileURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v9, "itemID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __FPCrossDeviceItemIDForItemID_block_invoke_5;
      v21[3] = &unk_1E444C080;
      v23 = *(id *)(a1 + 48);
      v24 = a3;
      v25 = v13;
      v22 = v12;
      objc_msgSend(v19, "fetchURLForItemID:completionHandler:", v20, v21);

    }
  }

}

uint64_t __FPCrossDeviceItemIDForItemID_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32), a3);
}

void __FPCrossDeviceItemIDForItemID_block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  char v13;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = objc_msgSend(v5, "isiCloudDriveProvider");
    if ((v7 & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "usesUniqueItemIdentifiersAcrossDevices");
    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __FPCrossDeviceItemIDForItemID_block_invoke_7;
    v10[3] = &unk_1E444C0D0;
    v11 = *(id *)(a1 + 48);
    v12 = v7;
    v13 = v8;
    _fetchItemForItemID(v9, v10);

  }
}

uint64_t __FPCrossDeviceItemIDForItemID_block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), a3);
}

void __FPCrossDeviceItemIDForItemID_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v2, (uint64_t)v2, "[DEBUG]  %@ => %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

@end
