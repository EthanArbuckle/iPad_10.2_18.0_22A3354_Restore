@implementation NSURL(WFFilePathDisplay)

- (id)wf_displayPathComponents
{
  void *v2;
  void *v3;
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  NSObject *v16;
  _BYTE *v17;
  id v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getFPItemManagerClass(), "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v2, "itemForURL:error:", a1, &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;

  if (v3)
  {
    v5 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v20 = __Block_byref_object_copy__13942;
    v21 = __Block_byref_object_dispose__13943;
    v22 = 0;
    objc_msgSend(getFPItemManagerClass(), "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__NSURL_WFFilePathDisplay__wf_displayPathComponents__block_invoke;
    v15[3] = &unk_24C4E03C0;
    v17 = buf;
    v8 = v5;
    v16 = v8;
    objc_msgSend(v6, "fetchParentsForItemID:recursively:completionHandler:", v7, 1, v15);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v9 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v9)
    {
      objc_msgSend(v9, "reverseObjectEnumerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObject:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "if_map:", &__block_literal_global_13944);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    getWFFilesLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[NSURL(WFFilePathDisplay) wf_displayPathComponents]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_DEFAULT, "%s Item not found when creating display components with error: %@", buf, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)wf_displayPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_displayPathComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsJoinedByString:", CFSTR("/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wf_localizedDisplayName
{
  int v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v3, "itemForURL:error:", a1, &v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v21;

  if (v2)
    objc_msgSend(a1, "stopAccessingSecurityScopedResource");
  if (v4)
  {
    objc_msgSend(v4, "providerDomainID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0)
    {
      objc_msgSend(v4, "itemIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC8228]);

      if (v8)
      {
        objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localStorageDisplayName");
        v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
        v15 = v5;
        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "displayName");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(a1, "URLByStandardizingPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v12 = *MEMORY[0x24BDBCCC0];
  v19 = 0;
  v13 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v20, v12, &v19);
  v14 = v20;
  v15 = v19;

  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (v16)
  {
    getWFFilesLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[NSURL(WFFilePathDisplay) wf_localizedDisplayName]";
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_20BBAD000, v17, OS_LOG_TYPE_ERROR, "%s Could not get localized name resource from URL: %@", buf, 0x16u);
    }

    v10 = 0;
  }
  else
  {
    v10 = v14;
  }

LABEL_19:
  return v10;
}

@end
