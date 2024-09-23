@implementation FAUICreatePDFFromDocumentURLs

void __FAUICreatePDFFromDocumentURLs_block_invoke(uint64_t a1)
{
  _FAUICreatePDFFromDocumentURLs(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void ___FAUICreatePDFFromDocumentURLs_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  int v8;
  __CFString *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v5 = fauiLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_3(a1, (_QWORD *)(a1 + 32), v5);
    goto LABEL_20;
  }
  v6 = objc_msgSend(v3, "startAccessingSecurityScopedResource");
  v15 = 0;
  v7 = *MEMORY[0x24BDBCCF0];
  v14 = 0;
  v8 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v15, v7, &v14);
  v9 = (__CFString *)v15;
  v10 = v14;
  if (!v8)
  {
    v12 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v12 = fauiLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_2();
    goto LABEL_17;
  }
  if (UTTypeConformsTo(v9, (CFStringRef)*MEMORY[0x24BDC17A0]))
  {
    _AppendImageToDocument(v4, *(void **)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
  }
  else
  {
    if (!UTTypeConformsTo(v9, (CFStringRef)*MEMORY[0x24BDC1808]))
    {
      v13 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v13 = fauiLogHandle;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_1();
      goto LABEL_17;
    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)getPDFDocumentClass()), "initWithURL:", v4);
    _AppendDocumentToDocument(v11, *(void **)(a1 + 48));
  }

LABEL_17:
  if (v6)
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");

LABEL_20:
}

uint64_t ___FAUICreatePDFFromDocumentURLs_block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22E113000, v0, v1, "Error: Unexpected UTI: %@ for file: %@");
  OUTLINED_FUNCTION_1();
}

void ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22E113000, v0, v1, "Error: Unable to determine UTI for file: %@ error: %@");
  OUTLINED_FUNCTION_1();
}

void ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_3(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2(&dword_22E113000, (uint64_t)a2, a3, "Failed to take a coordinated read on url: %@ error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

@end
