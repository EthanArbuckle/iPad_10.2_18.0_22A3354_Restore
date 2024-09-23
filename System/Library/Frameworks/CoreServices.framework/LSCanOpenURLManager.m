@implementation LSCanOpenURLManager

void __37___LSCanOpenURLManager_sharedManager__block_invoke()
{
  _LSCanOpenURLManager *v0;
  void *v1;

  v0 = objc_alloc_init(_LSCanOpenURLManager);
  v1 = (void *)+[_LSCanOpenURLManager sharedManager]::result;
  +[_LSCanOpenURLManager sharedManager]::result = (uint64_t)v0;

}

void __74___LSCanOpenURLManager_resetSchemeQueryLimitForApplicationWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "writeSchemesMap");
  }
  JUMPOUT(0x186DAF214);
}

void __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3)
  {
    objc_msgSend((id)__LSDefaultsGetSharedInstance(), "queriedSchemesMapFileURL");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("LSCanOpenURLManager.mm"), 172, CFSTR("Failed to get URL for lsd-schemes file"));

    }
    v11 = v4;
    v6 = objc_msgSend(v3, "writeToURL:options:error:", v5, 268435457, &v11);
    v7 = v11;

    if ((v6 & 1) == 0)
    {
      _LSDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[NSObject path](v5, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke_cold_2(v9, (uint64_t)v7, buf, v8);
      }

    }
  }
  else
  {
    _LSDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke_cold_1((uint64_t)v4, v5);
    v7 = v4;
  }

}

void __111___LSCanOpenURLManager_PrivateSchemeChecking__legacy_isBundleID_bundleData_context_allowedToCheckScheme_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __111___LSCanOpenURLManager_PrivateSchemeChecking__legacy_isBundleID_bundleData_context_allowedToCheckScheme_error___block_invoke_60(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "arrayByAddingObject:", *(_QWORD *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v4;
  }
  else
  {
    v6[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));
  MEMORY[0x186DAF214](objc_msgSend(*(id *)(a1 + 32), "writeSchemesMap"));

}

void __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Could not serialize lsd-schemes file: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke_cold_2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Could not store lsd-schemes file at %@: %@", buf, 0x16u);

}

@end
