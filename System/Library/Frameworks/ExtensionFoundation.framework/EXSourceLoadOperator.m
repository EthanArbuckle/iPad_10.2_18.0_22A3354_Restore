@implementation EXSourceLoadOperator

void __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;

  v2 = *(_QWORD *)(a1 + 72);
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke_2;
  v7[3] = &unk_1E2CFD510;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 96);
  v11 = *(_OWORD *)(a1 + 80);
  v12 = v6;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v4, "_loadItemOfClass:forTypeIdentifier:options:coerceForCoding:completionHandler:", v2, v8, v5, 1, v7);

}

void __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  _EXItemProviderSandboxedResource *v9;
  __int128 v10;
  _EXItemProviderSandboxedResource *v11;
  id v12;
  NSObject *v13;
  _EXItemProviderSandboxedResource *v14;
  __int128 v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  _BYTE buf[32];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(const __CFString **)(a1 + 32);
  if (v7)
  {
    if (UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E0CA5C90]))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "objectWithItemProviderData:typeIdentifier:error:", v5, *(_QWORD *)(a1 + 32), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v8, "isFileURL"))
            {
              v9 = [_EXItemProviderSandboxedResource alloc];
              v25 = 0;
              v10 = *(_OWORD *)(a1 + 72);
              *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
              *(_OWORD *)&buf[16] = v10;
              v11 = -[_EXItemProviderSandboxedResource initWithContentsOfURL:auditToken:error:](v9, "initWithContentsOfURL:auditToken:error:", v8, buf, &v25);
              v12 = v25;
              if (v11)
              {
                v13 = v5;
                v5 = v11;
              }
              else
              {
                _EXDefaultLog();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
                  __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke_2_cold_1();
              }

            }
          }
        }

      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSObject isFileURL](v5, "isFileURL"))
  {
    v14 = [_EXItemProviderSandboxedResource alloc];
    v24 = v6;
    v15 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
    *(_OWORD *)&buf[16] = v15;
    v16 = -[_EXItemProviderSandboxedResource initWithContentsOfURL:auditToken:error:](v14, "initWithContentsOfURL:auditToken:error:", v5, buf, &v24);
    v17 = v24;

    v6 = v17;
    v5 = v16;
  }
  _EXDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v5)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v21;
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v23 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v6;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __65___EXSourceLoadOperator_previewImageWithClassName_options_reply___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65___EXSourceLoadOperator_previewImageWithClassName_options_reply___block_invoke_2;
  v4[3] = &unk_1E2CFC890;
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_loadPreviewImageOfClass:options:coerceForCoding:completionHandler:", v3, v2, 1, v4);

}

uint64_t __65___EXSourceLoadOperator_previewImageWithClassName_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_190C25000, v0, OS_LOG_TYPE_DEBUG, "Unable to create sandbox resource with error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

@end
