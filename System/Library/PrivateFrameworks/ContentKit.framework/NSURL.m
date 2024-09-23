@implementation NSURL

id __54__NSURL_DCURLUtilities__dc_queryItemsFromQueryString___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("="));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subarrayWithRange:", 1, objc_msgSend(v2, "count") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("="));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByRemovingPercentEncoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", v3, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __52__NSURL_WFFilePathDisplay__wf_displayPathComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    getWFFilesLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[NSURL(WFFilePathDisplay) wf_displayPathComponents]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_ERROR, "%s Could not fetch parent items due to error: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __52__NSURL_WFFilePathDisplay__wf_displayPathComponents__block_invoke_1(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = a2;
  objc_msgSend(v2, "providerDomainID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v2, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v5 = (_QWORD *)getNSFileProviderRootContainerItemIdentifierSymbolLoc_ptr;
  v16 = getNSFileProviderRootContainerItemIdentifierSymbolLoc_ptr;
  if (!getNSFileProviderRootContainerItemIdentifierSymbolLoc_ptr)
  {
    v6 = FileProviderLibrary();
    v5 = dlsym(v6, "NSFileProviderRootContainerItemIdentifier");
    v14[3] = (uint64_t)v5;
    getNSFileProviderRootContainerItemIdentifierSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v13, 8);
  if (v5)
  {
    v7 = objc_msgSend(v4, "isEqualToString:", *v5);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localStorageDisplayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      v10 = v9;
      return;
    }
LABEL_8:
    objc_msgSend(v2, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSFileProviderRootContainerItemIdentifier(void)");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSURL+WFFilePathDisplay.m"), 22, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
