@implementation CNFRegControllerLoadStoreServicesLibraryIfNecessary

void __CNFRegControllerLoadStoreServicesLibraryIfNecessary_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  const char *v3;
  NSObject *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  MEMORY[0x2199B8A78]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/StoreServices.framework/StoreServices"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_retainAutorelease(v1);
  v3 = (const char *)objc_msgSend(v2, "fileSystemRepresentation");
  CNFRegControllerLoadStoreServicesLibraryIfNecessary___SSLibraryHandle = (uint64_t)dlopen(v3, 2);
  if (CNFRegControllerLoadStoreServicesLibraryIfNecessary___SSLibraryHandle)
  {
    __SSAccountStoreClass = (uint64_t)NSClassFromString(CFSTR("SSAccountStore"));
  }
  else
  {
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v6 = v3;
      v7 = 2080;
      v8 = dlerror();
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Could not load framework {%s} : %s", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      dlerror();
      IMLogString();
    }
  }

}

@end
