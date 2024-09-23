@implementation LSBundleProxiesOfTypeQuery

void __65___LSBundleProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x186DAE7A0]();
  if (objc_msgSend(*(id *)(a1 + 32), "bundleUnitMeetsRequirements:bundleData:context:", a2, a3, *(_QWORD *)(a1 + 48)))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "type") == 5)
    {
      v9 = (void *)_CSStringCopyCFString();
      if (v9)
      {
        +[LSVPNPluginProxy VPNPluginProxyForIdentifier:withContext:](LSVPNPluginProxy, "VPNPluginProxyForIdentifier:withContext:", v9, *(_QWORD *)(a1 + 48));
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

      v11 = (void *)v10;
      if (v10)
        goto LABEL_11;
    }
    else
    {
      +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:](LSApplicationProxy, "applicationProxyWithBundleUnitID:withContext:", a2, *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_11:
        *a4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() ^ 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    _LSDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = a2;
      _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create bundleProxy for bundle %lu", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_12;
  }
LABEL_13:
  objc_autoreleasePoolPop(v8);
}

@end
