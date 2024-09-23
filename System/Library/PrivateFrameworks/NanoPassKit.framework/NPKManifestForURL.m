@implementation NPKManifestForURL

void ___NPKManifestForURL_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v24 = 138412546;
        v25 = v12;
        v26 = 2112;
        v27 = (id)objc_opt_class();
        v13 = v27;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Warning: manifest.json for unique ID %@ should map filenames to SHA1 hash strings. Found key of class %@", (uint8_t *)&v24, 0x16u);

      }
    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

    *a4 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 32);
        v20 = (void *)objc_opt_class();
        v24 = 138412546;
        v25 = v19;
        v26 = 2112;
        v27 = v20;
        v21 = v20;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Warning: manifest.json for unique ID %@ should map filenames to SHA1 hash strings. Found object of class %@", (uint8_t *)&v24, 0x16u);

      }
    }
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = 0;

    *a4 = 1;
  }

}

@end
