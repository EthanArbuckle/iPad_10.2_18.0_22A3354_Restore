@implementation NSFileProviderManager

uint64_t __78__NSFileProviderManager_BRCAdditions__br_removeDomain_sync_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int8x16_t v17;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "br_isNSXPCConnectionError") & 1) != 0
    && (v7 = *(_QWORD *)(a1 + 64),
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "xpcConnectionFailureRetries"),
        v8,
        v7 < v9))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v11 = WeakRetained;
    if (WeakRetained)
    {
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0D10EA0];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke_2;
        v14[3] = &unk_1E8767370;
        v16 = *(id *)(a1 + 48);
        v14[4] = v11;
        v15 = *(id *)(a1 + 40);
        v17 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
        objc_msgSend(v13, "performWithPersonaID:block:", v12, v14);

      }
      else
      {
        objc_msgSend(WeakRetained, "_br_removeDomain:options:retries:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 48));
      }
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke_2_cold_1((uint64_t)v4, v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_br_removeDomain:options:retries:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 48));
  }

}

uint64_t __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  v3 = (void *)a1[4];
  v2 = a1[5];
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "removeDomain:options:preservedLocation:error:", v2, v4, &obj, a2);
  objc_storeStrong((id *)(v5 + 40), obj);
  return v6;
}

void __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke_6(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  v7 = a2;
  if (v6)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      v10 = a1[4];
      v11 = 138412802;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1CBD43000, v9, (os_log_type_t)0x90u, "[ERROR] couldn't remove domain %@: %@%@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke_6_cold_1((uint64_t)a1, (uint64_t)v8, v9);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __102__NSFileProviderManager_BRCAdditions__br_importDomain_forProviderIdentifier_fromDirectoryAtURL_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CAAD28], "importDomain:forProviderIdentifier:fromDirectoryAtURL:error:", a1[4], a1[5], a1[6], a2);
}

uint64_t __115__NSFileProviderManager_BRCAdditions__br_importDomain_forProviderIdentifier_fromDirectoryAtURL_knownFolders_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CAAD28], "importDomain:forProviderIdentifier:fromDirectoryAtURL:knownFolders:error:", a1[4], a1[5], a1[6], a1[7], a2);
}

uint64_t __80__NSFileProviderManager_BRCAdditions__br_addDomain_forProviderIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CAAD28], "addDomain:forProviderIdentifier:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __70__NSFileProviderManager_BRCAdditions__br_addDomain_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDomain:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __103__NSFileProviderManager_BRCAdditions__br_signalEnumeratorForContainerItemIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalEnumeratorForContainerItemIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to adopt persona for _br_removeDomain retry%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke_6_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CBD43000, a2, a3, "[DEBUG] Successfully removed domain %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end
