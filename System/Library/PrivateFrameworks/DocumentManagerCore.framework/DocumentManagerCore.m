uint64_t DOCProviderDomainIDIsSharedServerDomainID(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple.SMBClientProvider.FileProvider"));
}

BOOL DOCDeviceIsPad()
{
  return MGGetSInt32Answer() != 1;
}

void sub_2090A4DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2090A5280(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2090A5408(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2090A5958(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DOCInitLogging()
{
  if (DOCInitLogging_once != -1)
    dispatch_once(&DOCInitLogging_once, &__block_literal_global_0);
}

void sub_2090A5D80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2090A6028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id DOCTagsFromFPTags(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        DOCTagFromFPTag(*(void **)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8, (_QWORD)v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t DOCProviderDomainIDIsWebDAV(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (DOCProviderDomainIDIsWebDAV_onceToken != -1)
    dispatch_once(&DOCProviderDomainIDIsWebDAV_onceToken, &__block_literal_global_5);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = (id)DOCProviderDomainIDIsWebDAV_webDAVProviderIdentifiers;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(v1, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i), (_QWORD)v7) & 1) != 0)
        {
          v3 = 1;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

DOCTag *DOCTagFromFPTag(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  DOCTag *v5;
  DOCTag *v6;
  void *v7;

  v1 = a1;
  +[DOCTagRegistry sharedInstance](DOCTagRegistry, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagForName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "type") == 1
    || (objc_msgSend(v1, "color") & 0x80000000) != 0
    || (int)objc_msgSend(v1, "color") >= 8)
  {
    v5 = v4;
  }
  else
  {
    v6 = [DOCTag alloc];
    objc_msgSend(v1, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[DOCTag initWithDisplayName:labelIndex:type:](v6, "initWithDisplayName:labelIndex:type:", v7, (int)objc_msgSend(v1, "color"), 0);

  }
  return v5;
}

id DOCContentTypesReadableByApplicationWithBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
  {
    v15[0] = *MEMORY[0x24BDF8430];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v1)
    {
      v3 = v1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "claimRecords");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __DOCContentTypesReadableByApplicationWithBundleIdentifier_block_invoke;
      v13[3] = &unk_24C0FE838;
      v14 = v8;
      v9 = v8;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
      objc_msgSend(MEMORY[0x24BDF8238], "doc_contentTypesForIdentifiers:", v9);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v2, "count"))
      {
        v10 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v10 = docLogHandle;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          DOCContentTypesReadableByApplicationWithBundleIdentifier_cold_2(v10);
      }
    }
    else
    {
      v11 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v11 = docLogHandle;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        DOCContentTypesReadableByApplicationWithBundleIdentifier_cold_1((uint64_t)v1, v11);
      v2 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  return v2;
}

id composedID(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "length"))
  {
    v8[0] = v3;
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

void sub_2090A80C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id containingBundleForBundle(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v3, 0);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "containingBundleRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "setObject:forKey:", v6, v3);
        v6 = v6;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

uint64_t DOCProviderDomainIDIsExternalDevice(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple.filesystems.UserFS.FileProvider"));
}

id DOCLocalizedProviderOnlyDisplayName(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

  if (v3)
    DOCLocalProviderLocalizedDisplayName();
  else
    objc_msgSend(v1, "providerDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id DOCLocalizedDisplayName(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

  if (v3)
  {
    DOCLocalProviderLocalizedDisplayName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "domainDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "providerDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v1, "domainDisplayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR(" — %@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }
  }

  return v4;
}

id DOCLocalProviderLocalizedDisplayName()
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MGCopyAnswer();
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("iPhone")))
  {
    _DocumentManagerBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("On My iPhone");
LABEL_12:
    objc_msgSend(v1, "localizedStringForKey:value:table:", v3, v3, CFSTR("Localizable"));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("iPad")))
  {
    _DocumentManagerBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("On My iPad");
    goto LABEL_12;
  }
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("iPod touch")))
  {
    _DocumentManagerBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("On My iPod");
    goto LABEL_12;
  }
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("Apple Vision")))
  {
    _DocumentManagerBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("On My Apple Vision Pro");
    goto LABEL_12;
  }
  if (!objc_msgSend(v0, "length"))
  {
    _DocumentManagerBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("On My Device");
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("On My %@"), &stru_24C0FF868, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v2, v0);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v6 = (void *)v5;

  return v6;
}

uint64_t _DocumentManagerBundle()
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/DocumentManager.framework"));
}

uint64_t DOCProviderDomainIDIsDefaultSharedServer(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider"));
}

void sub_2090A9514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DOCNodeFromCoder(void *a1)
{
  id v1;
  int v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "decodeIntForKey:", CFSTR("DOCNodeEncodedTypeKey"));
  if (v2)
  {
    if (v2 != 1)
    {
      v4 = 0;
      goto LABEL_6;
    }
    +[DOCNodeStartupManager shared](DOCNodeStartupManager, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startIfNeeded");

  }
  objc_msgSend(v1, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DOCNodeEncodedObjectKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v4;
}

void sub_2090AA090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void DOCRunInMainThread(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (!v1)
    DOCRunInMainThread_cold_1();
  block = v1;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void sub_2090AACC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _FFInitLog(void *a1, int a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = CFSTR("NO");
  if (a2)
    v4 = CFSTR("YES");
  v5 = v4;
  v6 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v6 = docLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_2090A2000, v6, OS_LOG_TYPE_DEFAULT, "[Feature Flag] Initializing %@ to value = %@", (uint8_t *)&v7, 0x16u);
  }

}

BOOL DOCDeviceIsPhone()
{
  return MGGetSInt32Answer() == 1;
}

uint64_t DOCProviderDomainIDIsRemovable(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.SMBClientProvider.FileProvider")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.filesystems.UserFS.FileProvider"));

  return v2;
}

uint64_t DOCProviderDomainIDIsLegacyWebDAV(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  v1 = a1;
  if (DOCProviderDomainIDIsWebDAV(v1))
  {
    objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v1, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isVersion:greaterThanOrEqualToVersion:", v3, CFSTR("5.2"));

    v6 = v5 ^ 1u;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_2090AC760(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void DOCLogAssertionFailureMessage_Swift(void *a1, uint64_t a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t, void *);
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a4;
  v9 = a3;
  v10 = a1;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithFormat:", CFSTR("DocumentManager assertion on %@:%d \"%@\" failed: %@"), v10, a2, v9, v8);

  if (LoadCrashSupportIfNecessary_once != -1)
    dispatch_once(&LoadCrashSupportIfNecessary_once, &__block_literal_global_32);
  v12 = (void (*)(uint64_t, uint64_t, void *))DOCSimulateCrash;
  if (DOCSimulateCrash)
  {
    v13 = getpid();
    v12(v13, 5, v11);
  }
  v14 = docLogHandle;
  if (!docLogHandle)
  {
    if (DOCInitLogging_once != -1)
      dispatch_once(&DOCInitLogging_once, &__block_literal_global_0);
    v14 = docLogHandle;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    DOCLogAssertionFailureMessage_Swift_cold_1((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);

}

void DOCLogAssertionFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void (*v16)(uint64_t, uint64_t, void *);
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v12 = (objc_class *)MEMORY[0x24BDD17C8];
  v13 = a5;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("DocumentManager assertion on %s:%d \"%s\" failed: %@"), a2, a4, a1, v14);
  if (LoadCrashSupportIfNecessary_once != -1)
    dispatch_once(&LoadCrashSupportIfNecessary_once, &__block_literal_global_32);
  v16 = (void (*)(uint64_t, uint64_t, void *))DOCSimulateCrash;
  if (DOCSimulateCrash)
  {
    v17 = getpid();
    v16(v17, 5, v15);
  }
  v18 = docLogHandle;
  if (!docLogHandle)
  {
    if (DOCInitLogging_once != -1)
      dispatch_once(&DOCInitLogging_once, &__block_literal_global_0);
    v18 = docLogHandle;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    DOCLogAssertionFailureMessage_Swift_cold_1((uint64_t)v15, v18, v19, v20, v21, v22, v23, v24);

}

void DOCLogBacktrace(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("%@ %@\n"), CFSTR("[DocMgrBT] "), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v12);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v20 = CFSTR("[DocMgrBT] ");
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_2090A2000, v5, OS_LOG_TYPE_DEFAULT, "%@ %@: '%@'", buf, 0x20u);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl(&dword_2090A2000, v5, OS_LOG_TYPE_DEFAULT, "\n%@", buf, 0xCu);
  }

}

void sub_2090AFF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2090B0514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DOCRandomRankBetween(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  unint64_t __buf;

  v2 = a1 + 1;
  if (a1 + 1 >= a2)
  {
    v5 = 0;
  }
  else
  {
    __buf = 0;
    arc4random_buf(&__buf, 8uLL);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v2 + __buf % (~a1 + a2));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void StartFINode()
{
  if (StartFINode_onceToken != -1)
    dispatch_once(&StartFINode_onceToken, &__block_literal_global_3);
}

id DOCEnumerationLogHandle()
{
  void *v0;

  v0 = (void *)docEnumerationLogHandle;
  if (!docEnumerationLogHandle)
  {
    DOCInitLogging();
    v0 = (void *)docEnumerationLogHandle;
  }
  return v0;
}

void sub_2090B4964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_2090B4CB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2090B4F94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL DOCApplicationWithBundleIdentifierSupportsDocuments(void *a1)
{
  void *v1;
  _BOOL8 v2;

  DOCContentTypesReadableByApplicationWithBundleIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

uint64_t DOCProviderDomainIsSharedServerDomain(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.SMBClientProvider.FileProvider"));

  return v2;
}

void sub_2090B6F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_2090B7C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_2090B7F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_2090B8260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2090B9958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_2090BA038(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2090BA980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DOCShouldApplicationShowRecentsPopover(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v1, 0, 0);
  if ((objc_msgSend(v2, "supportsOpenInPlace") & 1) != 0)
  {
    DOCContentTypesReadableByApplicationWithBundleIdentifier(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v4 = docLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      DOCShouldApplicationShowRecentsPopover_cold_4((uint64_t)v1, v4, v3);
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x24BDF8238], "doc_identifiersForContentTypes:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x24BDF83C0], "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allowedFileProviderBundleIdentifiersForHostBundleIdentifier:", v1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v10 = docLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        DOCShouldApplicationShowRecentsPopover_cold_3((uint64_t)v1, (uint64_t)v3, v10);
      v11 = objc_msgSend(MEMORY[0x24BDC82F0], "isAnyDocumentRecentlyUsed:excludedFileTypes:allowedFileProviderIdentifiers:", v5, v7, v9);
      v12 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v12 = docLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        DOCShouldApplicationShowRecentsPopover_cold_2((uint64_t)v1, v12, v11);

    }
    else
    {
      v20 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v20 = docLogHandle;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        DOCShouldApplicationShowRecentsPopover_cold_1((uint64_t)v1, v20, v21, v22, v23, v24, v25, v26);
      v11 = 0;
    }

  }
  else
  {
    v13 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v13 = docLogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      DOCShouldApplicationShowRecentsPopover_cold_5((uint64_t)v1, v13, v14, v15, v16, v17, v18, v19);
    v11 = 0;
  }

  return v11;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2090BF56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_12()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x2Au);
}

id OUTLINED_FUNCTION_18(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Cu);
}

id OUTLINED_FUNCTION_23(uint64_t a1, uint64_t a2, void *a3)
{
  return a3;
}

void OUTLINED_FUNCTION_24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_25()
{
  void *v0;

  return objc_msgSend(v0, "isHidden");
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  void *v0;

  return objc_msgSend(v0, "isLocked");
}

void OUTLINED_FUNCTION_28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x22u);
}

id documentmanager_perf_log()
{
  if (documentmanager_perf_log_once != -1)
    dispatch_once(&documentmanager_perf_log_once, &__block_literal_global_9);
  return (id)documentmanager_perf_log_logger;
}

void __documentmanager_perf_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.DocumentManager", "performance");
  v1 = (void *)documentmanager_perf_log_logger;
  documentmanager_perf_log_logger = (uint64_t)v0;

}

void sub_2090C028C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

id FPTagFromDOCTag(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "labelIndex");
  v3 = objc_alloc(MEMORY[0x24BDC8340]);
  objc_msgSend(v1, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v3, "initWithLabel:color:", v4, v2);
  return v5;
}

id FPTagsFromDOCTags(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = (void *)MEMORY[0x24BDBCEB8];
  v2 = a1;
  objc_msgSend(v1, "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __FPTagsFromDOCTags_block_invoke;
  v6[3] = &unk_24C0FED98;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

void sub_2090C1868(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2090C1DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

uint64_t hasEqual_defaultEffectiveTabIdentifierForLocationRestore(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "defaultEffectiveTabIdentifierForLocationRestore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultEffectiveTabIdentifierForLocationRestore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v3, "defaultEffectiveTabIdentifierForLocationRestore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultEffectiveTabIdentifierForLocationRestore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  return v9;
}

const __CFString *NSStringFromContentMode(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("????");
  else
    return off_24C0FF040[a1];
}

const __CFString *NSStringFromLandingMode(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("????");
  if (a1 == 1)
    v1 = CFSTR("chin");
  if (a1)
    return v1;
  else
    return CFSTR("fullscreen");
}

void sub_2090C3BA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2090C4444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_2090C5E68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2090C6744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_2090C681C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_7_0(uint64_t a1, void *a2)
{
  return a2;
}

void sub_2090C76D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  void *v0;

  return objc_msgSend(v0, "cacheStatus");
}

uint64_t sub_2090C8258()
{
  sub_2090C8AF0(&qword_2545945E0, (uint64_t (*)(uint64_t))type metadata accessor for DOCUIPBrowserContentMode, (uint64_t)&unk_2090D0904);
  return sub_2090CD568();
}

uint64_t sub_2090C82CC()
{
  sub_2090C8AF0(&qword_2545945E0, (uint64_t (*)(uint64_t))type metadata accessor for DOCUIPBrowserContentMode, (uint64_t)&unk_2090D0904);
  return sub_2090CD55C();
}

uint64_t sub_2090C8330()
{
  sub_2090C8AF0(&qword_2545945D8, (uint64_t (*)(uint64_t))type metadata accessor for DOCUIPDocumentLandingMode, (uint64_t)&unk_2090D093C);
  return sub_2090CD568();
}

uint64_t sub_2090C83A4()
{
  sub_2090C8AF0(&qword_2545945D8, (uint64_t (*)(uint64_t))type metadata accessor for DOCUIPDocumentLandingMode, (uint64_t)&unk_2090D093C);
  return sub_2090CD55C();
}

uint64_t variable initialization expression of DOCUIPBrowserState.contentMode()
{
  return -1;
}

uint64_t DOCUIPBrowserState.contentMode.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR___DOCUIPBrowserState__impl) = result;
  return result;
}

uint64_t (*DOCUIPBrowserState.contentMode.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of DOCUIPBrowserState.documentLandingMode()
{
  return -1;
}

uint64_t DOCUIPBrowserState.documentLandingMode.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DOCUIPBrowserState.documentLandingMode.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR___DOCUIPBrowserState__impl + 8) = result;
  return result;
}

uint64_t (*DOCUIPBrowserState.documentLandingMode.modify())()
{
  return nullsub_1;
}

uint64_t DOCUIPBrowserState.init()()
{
  return -1;
}

uint64_t sub_2090C8464(char *a1, char *a2)
{
  return sub_2090C8470(*a1, *a2);
}

uint64_t sub_2090C8470(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000013;
  else
    v3 = 0x4D746E65746E6F63;
  if (v2)
    v4 = 0xEB0000000065646FLL;
  else
    v4 = 0x80000002090D4310;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000013;
  else
    v5 = 0x4D746E65746E6F63;
  if ((a2 & 1) != 0)
    v6 = 0x80000002090D4310;
  else
    v6 = 0xEB0000000065646FLL;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2090CD5D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2090C8520()
{
  sub_2090CD5EC();
  sub_2090CD544();
  swift_bridgeObjectRelease();
  return sub_2090CD5F8();
}

uint64_t sub_2090C85AC()
{
  sub_2090CD544();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2090C8614()
{
  sub_2090CD5EC();
  sub_2090CD544();
  swift_bridgeObjectRelease();
  return sub_2090CD5F8();
}

uint64_t sub_2090C869C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2090CD5B0();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_2090C86F8(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0x4D746E65746E6F63;
  if (*v1)
    v2 = 0xD000000000000013;
  v3 = 0x80000002090D4310;
  if (!*v1)
    v3 = 0xEB0000000065646FLL;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2090C8744()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000013;
  else
    return 0x4D746E65746E6F63;
}

uint64_t sub_2090C878C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2090CD5B0();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_2090C87EC()
{
  return 0;
}

void sub_2090C87F8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2090C8804()
{
  sub_2090C8A40();
  return sub_2090CD61C();
}

uint64_t sub_2090C882C()
{
  sub_2090C8A40();
  return sub_2090CD628();
}

uint64_t DOCUIPBrowserState.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254594450);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2090C8A40();
  sub_2090CD610();
  v14 = a2;
  v13 = 0;
  type metadata accessor for DOCUIPBrowserContentMode(0);
  sub_2090C8AF0(&qword_254594460, (uint64_t (*)(uint64_t))type metadata accessor for DOCUIPBrowserContentMode, (uint64_t)&protocol conformance descriptor for DOCUIPBrowserContentMode);
  sub_2090CD5C8();
  if (!v3)
  {
    v14 = a3;
    v13 = 1;
    type metadata accessor for DOCUIPDocumentLandingMode(0);
    sub_2090C8AF0(&qword_254594468, (uint64_t (*)(uint64_t))type metadata accessor for DOCUIPDocumentLandingMode, (uint64_t)&protocol conformance descriptor for DOCUIPDocumentLandingMode);
    sub_2090CD5C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD0D784]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2090C8A40()
{
  unint64_t result;

  result = qword_254594458;
  if (!qword_254594458)
  {
    result = MEMORY[0x20BD0D790](&unk_2090D0974, &type metadata for DOCUIPBrowserState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254594458);
  }
  return result;
}

void type metadata accessor for DOCUIPBrowserContentMode(uint64_t a1)
{
  sub_2090C8AAC(a1, &qword_2545945B0);
}

void type metadata accessor for DOCUIPDocumentLandingMode(uint64_t a1)
{
  sub_2090C8AAC(a1, &qword_2545945A8);
}

void sub_2090C8AAC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_2090C8AF0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x20BD0D790](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t DOCUIPBrowserState.init(from:)(_QWORD *a1)
{
  return sub_2090C969C(a1);
}

uint64_t sub_2090C8B44(_QWORD *a1)
{
  uint64_t *v1;

  return DOCUIPBrowserState.encode(to:)(a1, *v1, v1[1]);
}

uint64_t sub_2090C8B5C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_2090C969C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

void __swiftcall DOCUIPBrowserState.init()(DOCUIPBrowserState *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id DOCUIPBrowserState.init()()
{
  uint64_t v0;
  _QWORD *v1;
  objc_super v3;

  v1 = (_QWORD *)(v0 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *v1 = -1;
  v1[1] = -1;
  v3.super_class = (Class)DOCUIPBrowserState;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t DOCUIPBrowserState.contentMode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___DOCUIPBrowserState__impl);
}

uint64_t DOCUIPBrowserState.documentLandingMode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___DOCUIPBrowserState__impl + 8);
}

void __swiftcall DOCUIPBrowserState.init(coder:)(DOCUIPBrowserState_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id DOCUIPBrowserState.init(coder:)(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  objc_super v11;

  v3 = &v1[OBJC_IVAR___DOCUIPBrowserState__impl];
  *(_QWORD *)v3 = -1;
  *((_QWORD *)v3 + 1) = -1;
  v4 = v1;
  v5 = sub_2090C8DCC((void *)0x6C706D69);
  if ((v7 & 1) != 0)
  {

    type metadata accessor for DOCUIPBrowserState(v9);
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    *(_QWORD *)v3 = v5;
    *((_QWORD *)v3 + 1) = v6;

    v11.receiver = v4;
    v11.super_class = (Class)DOCUIPBrowserState;
    v8 = objc_msgSendSuper2(&v11, sel_init);

  }
  return v8;
}

void *sub_2090C8DCC(void *a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  id v7;

  sub_2090C9B70(0, &qword_2545945E8);
  swift_bridgeObjectRetain();
  sub_2090CD550();
  v2 = (void *)sub_2090CD58C();
  swift_bridgeObjectRelease();
  if (v2)
  {
    v3 = sub_2090CD52C();
    v5 = v4;

    v6 = objc_allocWithZone(MEMORY[0x24BDD1620]);
    sub_2090C9C64(v3, v5);
    v7 = sub_2090C9BA8();
    sub_2090C9CA8(v3, v5);
    if (v7)
    {
      sub_2090C9CEC();
      sub_2090CD580();
      v2 = a1;
      objc_msgSend(v7, sel_finishDecoding);

      sub_2090C9CA8(v3, v5);
    }
    else
    {
      sub_2090C9CA8(v3, v5);
      return 0;
    }
  }
  return v2;
}

void sub_2090C8F80()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_, 1);
  sub_2090C9B2C();
  sub_2090CD574();
  objc_msgSend(v1, sel_finishEncoding);
  v2 = objc_msgSend(v1, sel_encodedData);
  if (v2)
  {
    v3 = v2;
    swift_bridgeObjectRetain();
    sub_2090CD550();
    v4 = (void *)sub_2090CD538();
    swift_bridgeObjectRelease();
    objc_msgSend(v0, sel_encodeObject_forKey_, v3, v4);

  }
  else
  {
    __break(1u);
  }
}

uint64_t DOCUIPBrowserState.debugDescription.getter()
{
  void *v0;

  sub_2090CD598();
  sub_2090CD550();
  objc_msgSend(v0, sel_contentMode);
  type metadata accessor for DOCUIPBrowserContentMode(0);
  sub_2090CD5A4();
  sub_2090CD550();
  objc_msgSend(v0, sel_documentLandingMode);
  type metadata accessor for DOCUIPDocumentLandingMode(0);
  sub_2090CD5A4();
  sub_2090CD550();
  return 0;
}

void __swiftcall DOCUIPBrowserState._bridgeToObjectiveC()(DOCUIPBrowserState *__return_ptr retstr)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;

  v3 = v2;
  v4 = v1;
  v5 = (char *)objc_msgSend(objc_allocWithZone((Class)DOCUIPBrowserState), sel_init);
  v6 = &v5[OBJC_IVAR___DOCUIPBrowserState__impl];
  *(_QWORD *)v6 = v4;
  *((_QWORD *)v6 + 1) = v3;
}

__n128 static DOCUIPBrowserState._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, __n128 *a2)
{
  __n128 result;

  result = *(__n128 *)(a1 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *a2 = result;
  a2[1].n128_u8[0] = 0;
  return result;
}

uint64_t static DOCUIPBrowserState._conditionallyBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)(a1 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *(_BYTE *)(a2 + 16) = 0;
  return 1;
}

uint64_t static DOCUIPBrowserState._unconditionallyBridgeFromObjectiveC(_:)(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + OBJC_IVAR___DOCUIPBrowserState__impl);
  __break(1u);
  return result;
}

char *sub_2090C934C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *result;
  char *v4;

  v1 = *v0;
  v2 = v0[1];
  result = (char *)objc_msgSend(objc_allocWithZone((Class)DOCUIPBrowserState), sel_init);
  v4 = &result[OBJC_IVAR___DOCUIPBrowserState__impl];
  *(_QWORD *)v4 = v1;
  *((_QWORD *)v4 + 1) = v2;
  return result;
}

__n128 sub_2090C9390(uint64_t a1, __n128 *a2)
{
  __n128 result;

  result = *(__n128 *)(a1 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *a2 = result;
  a2[1].n128_u8[0] = 0;
  return result;
}

uint64_t sub_2090C93A8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)(a1 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *(_BYTE *)(a2 + 16) = 0;
  return 1;
}

uint64_t sub_2090C93C4@<X0>(uint64_t result@<X0>, _OWORD *a2@<X8>)
{
  if (result)
    *a2 = *(_OWORD *)(result + OBJC_IVAR___DOCUIPBrowserState__impl);
  else
    __break(1u);
  return result;
}

uint64_t DOCUIPBrowserContentMode.debugDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 + 1;
  result = 0x6669636570736E75;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x73746E65636572;
      break;
    case 2:
      result = 0x646572616873;
      break;
    case 3:
      result = 0x726573776F7262;
      break;
    default:
      type metadata accessor for DOCUIPBrowserContentMode(0);
      result = sub_2090CD5E0();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_2090C949C()
{
  _QWORD *v0;
  uint64_t result;

  result = 0x6669636570736E75;
  switch(*v0)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      return result;
    case 0:
      result = 0x73746E65636572;
      break;
    case 1:
      result = 0x646572616873;
      break;
    case 2:
      result = 0x726573776F7262;
      break;
    default:
      result = sub_2090CD5E0();
      __break(1u);
      break;
  }
  return result;
}

uint64_t DOCUIPDocumentLandingMode.debugDescription.getter(uint64_t a1)
{
  unsigned int v1;
  uint64_t result;

  switch(a1)
  {
    case -1:
      return 0x6669636570736E75;
    case 1:
      v1 = 1852401763;
      return v1 | 0x6F72622D00000000;
    case 0:
      v1 = 1819047270;
      return v1 | 0x6F72622D00000000;
  }
  type metadata accessor for DOCUIPDocumentLandingMode(0);
  result = sub_2090CD5E0();
  __break(1u);
  return result;
}

uint64_t sub_2090C95EC()
{
  uint64_t *v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t result;

  v1 = *v0;
  if (*v0 == -1)
    return 0x6669636570736E75;
  if (v1 == 1)
  {
    v2 = 1852401763;
  }
  else
  {
    if (v1)
    {
      result = sub_2090CD5E0();
      __break(1u);
      return result;
    }
    v2 = 1819047270;
  }
  return v2 | 0x6F72622D00000000;
}

_QWORD *sub_2090C9680@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2090C9690(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2090C969C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545945F8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2090C8A40();
  sub_2090CD604();
  type metadata accessor for DOCUIPBrowserContentMode(0);
  HIBYTE(v8) = 0;
  sub_2090C8AF0(&qword_254594600, (uint64_t (*)(uint64_t))type metadata accessor for DOCUIPBrowserContentMode, (uint64_t)&protocol conformance descriptor for DOCUIPBrowserContentMode);
  sub_2090CD5BC();
  v6 = v9;
  type metadata accessor for DOCUIPDocumentLandingMode(0);
  HIBYTE(v8) = 1;
  sub_2090C8AF0(&qword_254594608, (uint64_t (*)(uint64_t))type metadata accessor for DOCUIPDocumentLandingMode, (uint64_t)&protocol conformance descriptor for DOCUIPDocumentLandingMode);
  sub_2090CD5BC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

uint64_t type metadata accessor for DOCUIPBrowserState(uint64_t a1)
{
  return sub_2090C9B70(a1, &qword_2545945A0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DOCUIPBrowserState(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DOCUIPBrowserState(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for DOCUIPBrowserState()
{
  return &type metadata for DOCUIPBrowserState;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DOCUIPBrowserState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DOCUIPBrowserState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2090C99C0 + 4 * byte_2090D05DD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2090C99F4 + 4 * byte_2090D05D8[v4]))();
}

uint64_t sub_2090C99F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2090C99FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2090C9A04);
  return result;
}

uint64_t sub_2090C9A10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2090C9A18);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2090C9A1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2090C9A24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2090C9A30(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2090C9A38(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DOCUIPBrowserState.CodingKeys()
{
  return &type metadata for DOCUIPBrowserState.CodingKeys;
}

unint64_t sub_2090C9A58()
{
  unint64_t result;

  result = qword_2545945B8;
  if (!qword_2545945B8)
  {
    result = MEMORY[0x20BD0D790](&unk_2090D08DC, &type metadata for DOCUIPBrowserState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545945B8);
  }
  return result;
}

unint64_t sub_2090C9AA0()
{
  unint64_t result;

  result = qword_2545945C0;
  if (!qword_2545945C0)
  {
    result = MEMORY[0x20BD0D790](&unk_2090D0814, &type metadata for DOCUIPBrowserState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545945C0);
  }
  return result;
}

unint64_t sub_2090C9AE8()
{
  unint64_t result;

  result = qword_2545945C8;
  if (!qword_2545945C8)
  {
    result = MEMORY[0x20BD0D790](&unk_2090D083C, &type metadata for DOCUIPBrowserState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545945C8);
  }
  return result;
}

unint64_t sub_2090C9B2C()
{
  unint64_t result;

  result = qword_2545945D0;
  if (!qword_2545945D0)
  {
    result = MEMORY[0x20BD0D790](&protocol conformance descriptor for DOCUIPBrowserState, &type metadata for DOCUIPBrowserState);
    atomic_store(result, (unint64_t *)&qword_2545945D0);
  }
  return result;
}

uint64_t sub_2090C9B70(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id sub_2090C9BA8()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_2090CD520();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_2090CD514();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_2090C9C64(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_2090C9CA8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

unint64_t sub_2090C9CEC()
{
  unint64_t result;

  result = qword_2545945F0;
  if (!qword_2545945F0)
  {
    result = MEMORY[0x20BD0D790](&protocol conformance descriptor for DOCUIPBrowserState, &type metadata for DOCUIPBrowserState);
    atomic_store(result, (unint64_t *)&qword_2545945F0);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void DOCLogAssertionFailureMessage_Swift_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2090A2000, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

void DOCContentTypesReadableByApplicationWithBundleIdentifier_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2090A2000, a2, OS_LOG_TYPE_ERROR, "No application found for bundle identifier %@", (uint8_t *)&v2, 0xCu);
}

void DOCContentTypesReadableByApplicationWithBundleIdentifier_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2090A2000, log, OS_LOG_TYPE_ERROR, "No supported document types specified.", v1, 2u);
}

void DOCShouldApplicationShowRecentsPopover_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a2, a3, "%@ does not open any content types.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void DOCShouldApplicationShowRecentsPopover_cold_2(uint64_t a1, void *a2, char a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(v4, "numberWithBool:", a3 & 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_2090A2000, v5, v7, "%@ supports popovers: %@", v8);

  OUTLINED_FUNCTION_3_0();
}

void DOCShouldApplicationShowRecentsPopover_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_3(&dword_2090A2000, a3, (uint64_t)a3, "%@ can open: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void DOCShouldApplicationShowRecentsPopover_cold_4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(a3, "count") != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_2090A2000, v5, v7, "%@ supports recent documents: %@", v8);

  OUTLINED_FUNCTION_3_0();
}

void DOCShouldApplicationShowRecentsPopover_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a2, a3, "%@ doesn't support open in place, so no recents popover.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void DOCRunInMainThread_cold_1()
{
  __assert_rtn("DOCRunInMainThread", "DOCDocumentManagerCoreUtilities.m", 104, "block != nil");
}

uint64_t sub_2090CD508()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2090CD514()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2090CD520()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2090CD52C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2090CD538()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2090CD544()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2090CD550()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2090CD55C()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_2090CD568()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_2090CD574()
{
  return MEMORY[0x24BDCFF70]();
}

uint64_t sub_2090CD580()
{
  return MEMORY[0x24BDCFFA0]();
}

uint64_t sub_2090CD58C()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_2090CD598()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2090CD5A4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2090CD5B0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2090CD5BC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2090CD5C8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2090CD5D4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2090CD5E0()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_2090CD5EC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2090CD5F8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2090CD604()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2090CD610()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2090CD61C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2090CD628()
{
  return MEMORY[0x24BEE4A10]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x24BDD9070]();
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x24BDD9150]();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return MEMORY[0x24BDC80E0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

