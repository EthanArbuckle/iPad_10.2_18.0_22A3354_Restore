@implementation NTKBundleBundleComplicationLoader

void __61___NTKBundleBundleComplicationLoader__loadClassesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  NTKBundleComplicationDataSourceClassesFromBundle(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

uint64_t __56___NTKBundleBundleComplicationLoader__enumerateBundles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v9;

  v3 = a2;
  if ((objc_msgSend(v3, "isLoaded") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("NSPrincipalClass"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "load");

LABEL_4:
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    v7 = 1;
    goto LABEL_7;
  }
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __41__NTKFaceBundleLoader__enumerateBundles___block_invoke_cold_1(v3, v9);

  v7 = 0;
LABEL_7:

  return v7;
}

void __56___NTKBundleBundleComplicationLoader__enumerateBundles___block_invoke()
{
  NTKBundleLoader *v0;
  void *v1;

  v0 = objc_alloc_init(NTKBundleLoader);
  v1 = (void *)_enumerateBundles____complicationBundleLoader;
  _enumerateBundles____complicationBundleLoader = (uint64_t)v0;

}

@end
