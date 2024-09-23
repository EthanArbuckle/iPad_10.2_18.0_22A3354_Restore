@implementation FPProviderDomain

void __81__FPProviderDomain_DOCDomainCache__allowedFileProviderBundleIdentifiersFiltered___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v7 = docLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __81__FPProviderDomain_DOCDomainCache__allowedFileProviderBundleIdentifiersFiltered___block_invoke_cold_1((uint64_t)v6, v7, v8);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5, "allValues", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "supportsEnumeration")
            && objc_msgSend(v14, "isEnabled")
            && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
          {
            v15 = *(void **)(a1 + 32);
            objc_msgSend(v14, "providerID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __81__FPProviderDomain_DOCDomainCache__allowedFileProviderBundleIdentifiersFiltered___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_2090A2000, a2, a3, "Error while trying to search sources. Error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
