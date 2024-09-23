@implementation CPSWebClipStore

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_2);
  return (id)sharedStore_store;
}

void __30__CPSWebClipStore_sharedStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CPSWebClipStore _init]([CPSWebClipStore alloc], "_init");
  v1 = (void *)sharedStore_store;
  sharedStore_store = (uint64_t)v0;

}

- (id)_init
{
  CPSWebClipStore *v2;
  id v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  CPSWebClipStore *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPSWebClipStore;
  v2 = -[CPSWebClipStore init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.ClipServices.%@.%p"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

+ (id)_urlForWebClipWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  pathForWebClipWithIdentifier(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v3);
  else
    v4 = 0;

  return v4;
}

+ (id)_readWebClipDictionaryRepresentationFromDiskWithWebClipIdentifier:(id)a3
{
  const __CFURL *v3;
  const __CFURL *v4;
  CFDictionaryRef v5;

  objc_msgSend(a1, "_urlForWebClipWithIdentifier:", a3);
  v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = CFBundleCopyInfoDictionaryForURL(v3);
  else
    v5 = 0;

  return v5;
}

- (void)redirectPoweredByWebClipsWithApplicationBundleIdentifier:(id)a3 toParentApplicationBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __130__CPSWebClipStore_redirectPoweredByWebClipsWithApplicationBundleIdentifier_toParentApplicationBundleIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24C3B9748;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __130__CPSWebClipStore_redirectPoweredByWebClipsWithApplicationBundleIdentifier_toParentApplicationBundleIdentifier_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v7 = 0;
  objc_msgSend(v2, "_redirectPoweredByWebClipsWithApplicationBundleIdentifier:toParentApplicationBundleIdentifier:errors:", v3, v4, &v7);
  v5 = v7;
  v6 = a1[7];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

- (BOOL)_redirectPoweredByWebClipsWithApplicationBundleIdentifier:(id)a3 toParentApplicationBundleIdentifier:(id)a4 errors:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  BOOL v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CPSWebClipStore _appClips](self, "_appClips");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v14, "isPoweredBy"))
        {
          objc_msgSend(v14, "applicationBundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (v16)
          {
            objc_msgSend(v14, "setApplicationBundleIdentifier:", v8);
            v21 = 0;
            -[CPSWebClipStore _saveWebClip:error:](self, "_saveWebClip:error:", v14, &v21);
            v17 = v21;
            if (v17)
              objc_msgSend(v20, "addObject:", v17);

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  v18 = objc_msgSend(v20, "count") == 0;
  return v18;
}

- (void)removeWebClipsWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__CPSWebClipStore_removeWebClipsWithApplicationBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __83__CPSWebClipStore_removeWebClipsWithApplicationBundleIdentifier_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v6 = 0;
  objc_msgSend(v2, "_removeWebClipsWithApplicationBundleIdentifier:errors:", v3, &v6);
  v4 = v6;
  v5 = a1[6];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);

}

- (BOOL)_removeWebClipsWithApplicationBundleIdentifier:(id)a3 errors:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  id *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v20 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CPSWebClipStore _appClips](self, "_appClips");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "applicationBundleIdentifier", v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if (v14)
        {
          objc_msgSend(v12, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          -[CPSWebClipStore _removeWebClipWithIdentifier:error:](self, "_removeWebClipWithIdentifier:error:", v15, &v21);
          v16 = v21;
          if (v16)
            objc_msgSend(v6, "addObject:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    v17 = v6;
  else
    v17 = 0;
  *v20 = objc_retainAutorelease(v17);
  v18 = objc_msgSend(v6, "count") == 0;

  return v18;
}

- (void)removeWebClipsWithApplicationBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CPSWebClipStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__CPSWebClipStore_removeWebClipsWithApplicationBundleIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __84__CPSWebClipStore_removeWebClipsWithApplicationBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "_appClips");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "applicationBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "containsObject:", v10);

        if (v11)
        {
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(void **)(a1 + 40);
          v17 = 0;
          objc_msgSend(v13, "_removeWebClipWithIdentifier:error:", v12, &v17);
          v14 = v17;
          if (v14)
            objc_msgSend(v2, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
  {
    if (objc_msgSend(v2, "count"))
      v16 = v2;
    else
      v16 = 0;
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }

}

- (void)removeWebClipWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CPSWebClipStore_removeWebClipWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __65__CPSWebClipStore_removeWebClipWithIdentifier_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v6 = 0;
  objc_msgSend(v2, "_removeWebClipWithIdentifier:error:", v3, &v6);
  v4 = v6;
  v5 = a1[6];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);

}

- (BOOL)_removeWebClipWithIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int v12;
  NSObject *v13;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pathForWebClipWithIdentifier(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtPath:error:", v8, a4);

  v9 = SBSSpringBoardServerPort();
  v10 = objc_retainAutorelease(v6);
  v11 = objc_msgSend(v10, "UTF8String");

  v12 = MEMORY[0x20BD306D0](v9, v11);
  if (v12)
  {
    v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CPSWebClipStore _removeWebClipWithIdentifier:error:].cold.1(v12, v13);
  }
  return !v12 && *a4 == 0;
}

- (void)saveWebClip:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CPSWebClipStore_saveWebClip_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __49__CPSWebClipStore_saveWebClip_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "_saveWebClip:error:", v3, &v7);
  v5 = v7;
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);

}

- (BOOL)_saveWebClip:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "webClipType") == 1)
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    pathForWebClipWithIdentifier(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    iconPathForWebClipWithIdentifier(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "fileExistsAtPath:", v8) & 1) == 0
      && (objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 0, 0, a4) & 1) == 0)
    {
      v33 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[CPSWebClipStore _saveWebClip:error:].cold.5((uint64_t)a4, v33);
      v30 = 0;
      goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v8, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBCC68], a4) & 1) == 0)
    {
      v32 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[CPSWebClipStore _saveWebClip:error:].cold.4((uint64_t)a4, v32);
      v30 = 0;
      goto LABEL_40;
    }
    v43 = v11;
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "writeToFile:atomically:", v12, 1);

    if ((v14 & 1) != 0)
    {
      v42 = v9;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *MEMORY[0x24BDD0CF0];
      v50 = *MEMORY[0x24BDD0CF0];
      v38 = *MEMORY[0x24BDD0CF8];
      v51[0] = *MEMORY[0x24BDD0CF8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      v41 = v12;
      v17 = objc_msgSend(v15, "setAttributes:ofItemAtPath:error:", v16, v12, &v45);
      v18 = v45;

      if ((v17 & 1) == 0)
      {
        v19 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = v19;
          objc_msgSend(v18, "cps_privacyPreservingDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v49 = v21;
          _os_log_impl(&dword_20AD44000, v20, OS_LOG_TYPE_INFO, "Couldn't change WebClip Info.plist's data protection class: %{public}@", buf, 0xCu);

        }
      }
      objc_msgSend(v6, "_temporaryIconPath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22
        && (v23 = -[CPSWebClipStore _copyOrReplaceExistingFileAtPath:withNewFileAtPath:](self, "_copyOrReplaceExistingFileAtPath:withNewFileAtPath:", v42, v22), v23, !v23))
      {
        v35 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[CPSWebClipStore _saveWebClip:error:].cold.2();
        v9 = v42;
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 1);
          v30 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = 0;
        }
      }
      else
      {
        objc_msgSend(v6, "iconImagePath");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v37 = v18;
          v25 = v42;
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v39;
          v47 = v38;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0;
          v40 = v25;
          LOBYTE(v25) = objc_msgSend(v26, "setAttributes:ofItemAtPath:error:", v27, v25, &v44);
          v28 = v44;

          if ((v25 & 1) == 0)
          {
            v29 = CPS_LOG_CHANNEL_PREFIXClipServices();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              -[CPSWebClipStore _saveWebClip:error:].cold.1(v29);
          }

          v18 = v37;
        }
        -[CPSWebClipStore _reloadSpringBoardIconForWebClipWithIdentifier:](self, "_reloadSpringBoardIconForWebClipWithIdentifier:", v7, v37);
        v30 = 1;
        v9 = v42;
      }

      v12 = v41;
      goto LABEL_39;
    }
    v34 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      -[CPSWebClipStore _saveWebClip:error:].cold.3();
      if (a4)
        goto LABEL_29;
    }
    else if (a4)
    {
LABEL_29:
      objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 1);
      v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

      v11 = v43;
LABEL_40:

LABEL_41:
      goto LABEL_42;
    }
    v30 = 0;
    goto LABEL_39;
  }
  v31 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    -[CPSWebClipStore _saveWebClip:error:].cold.6();
    if (a4)
      goto LABEL_20;
LABEL_31:
    v30 = 0;
    goto LABEL_42;
  }
  if (!a4)
    goto LABEL_31;
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 13);
  v30 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

  return v30;
}

- (void)updateWebClipTitle:(id)a3 forAppClipBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__CPSWebClipStore_updateWebClipTitle_forAppClipBundleIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24C3B9748;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

void __83__CPSWebClipStore_updateWebClipTitle_forAppClipBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_webClipsBackedbyAppClipIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isPoweredBy") & 1) == 0)
        {
          objc_msgSend(v8, "title");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 48));

          if ((v10 & 1) == 0)
            objc_msgSend(v8, "setTitle:", *(_QWORD *)(a1 + 48));
          v11 = *(void **)(a1 + 32);
          v14 = v5;
          objc_msgSend(v11, "_saveWebClip:error:", v8, &v14);
          v12 = v14;

          v5 = v12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v5);

}

- (void)updateAppClipIcon:(id)a3 forWebClipWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CPSWebClipStore *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__CPSWebClipStore_updateAppClipIcon_forWebClipWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24C3B9748;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __80__CPSWebClipStore_updateAppClipIcon_forWebClipWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    iconPathForWebClipWithIdentifier(*(void **)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "_copyOrReplaceExistingFileAtPath:withNewFileAtPath:", v3, v4);

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_reloadSpringBoardIconForWebClipWithIdentifier:", *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 56);
  v6 = (void *)v7;
  if (v5)
  {
    (*(void (**)(void))(v5 + 16))();
    v6 = (void *)v7;
  }

}

- (void)removeAppClipIconForWebClipWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__CPSWebClipStore_removeAppClipIconForWebClipWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __79__CPSWebClipStore_removeAppClipIconForWebClipWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  iconPathForWebClipWithIdentifier(*(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeFileFromPath:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_reloadSpringBoardIconForWebClipWithIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (id)_copyOrReplaceExistingFileAtPath:(id)a3 withNewFileAtPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CPSWebClipStore _removeFileFromPath:](self, "_removeFileFromPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(v9, "copyItemAtPath:toPath:error:", v7, v6, &v15);
  v10 = v15;

  if (v10)
  {
    v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = v11;
      objc_msgSend(v10, "cps_privacyPreservingDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v17 = v7;
      v18 = 2113;
      v19 = v6;
      v20 = 2114;
      v21 = v14;
      _os_log_error_impl(&dword_20AD44000, v13, OS_LOG_TYPE_ERROR, "Could not copy icon from path %{private}@ to %{private}@: %{public}@", buf, 0x20u);

    }
  }

  return v10;
}

- (id)_removeFileFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v5, "removeItemAtPath:error:", v3, &v9);
    v6 = v9;

    if (v6)
    {
      v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CPSWebClipStore _removeFileFromPath:].cold.1((uint64_t)v3, v7, v6);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)getAppClipWithIdentifier:(id)a3 receiveOnQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CPSWebClipStore_getAppClipWithIdentifier_receiveOnQueue_completionHandler___block_invoke;
  block[3] = &unk_24C3B99C8;
  v13 = v8;
  v14 = v9;
  block[4] = self;
  v10 = v8;
  v11 = v9;
  dispatch_async((dispatch_queue_t)a4, block);

}

void __77__CPSWebClipStore_getAppClipWithIdentifier_receiveOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "synchronouslyGetAppClipWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)synchronouslyGetAppClipWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_readWebClipDictionaryRepresentationFromDiskWithWebClipIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[CPSWebClip _initWithIdentifier:webClipDictionary:]([CPSWebClip alloc], "_initWithIdentifier:webClipDictionary:", v3, v4);
    if (objc_msgSend(v5, "webClipType") == 1)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)getAppClipWithURLHash:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CPSWebClipStore_getAppClipWithURLHash_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __59__CPSWebClipStore_getAppClipWithURLHash_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__CPSWebClipStore_getAppClipWithURLHash_completionHandler___block_invoke_2;
  v7[3] = &unk_24C3B99F0;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_enumerateAndFilterClipsWithBlock:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }

}

uint64_t __59__CPSWebClipStore_getAppClipWithURLHash_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "registeredURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cps_sha256String");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (void)fetchBookmarkWebClipsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__CPSWebClipStore_fetchBookmarkWebClipsWithCompletionHandler___block_invoke;
    v7[3] = &unk_24C3B9A18;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __62__CPSWebClipStore_fetchBookmarkWebClipsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_bookmarkWebClips");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)fetchAppClipsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__CPSWebClipStore_fetchAppClipsWithCompletionHandler___block_invoke;
    v7[3] = &unk_24C3B9A18;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __54__CPSWebClipStore_fetchAppClipsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_appClips");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_fetchInstalledAppClips
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__CPSWebClipStore__fetchInstalledAppClips__block_invoke;
  v5[3] = &unk_24C3B9978;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__CPSWebClipStore__fetchInstalledAppClips__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_appClips");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &__block_literal_global_13);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __42__CPSWebClipStore__fetchInstalledAppClips__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isApplicationInstalled");
}

- (id)_bookmarkWebClips
{
  return -[CPSWebClipStore _enumerateAndFilterClipsWithBlock:](self, "_enumerateAndFilterClipsWithBlock:", &__block_literal_global_14);
}

BOOL __36__CPSWebClipStore__bookmarkWebClips__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "webClipType") != 1;
}

- (id)_appClips
{
  return -[CPSWebClipStore _enumerateAndFilterClipsWithBlock:](self, "_enumerateAndFilterClipsWithBlock:", &__block_literal_global_15);
}

BOOL __28__CPSWebClipStore__appClips__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "webClipType") == 1;
}

- (id)_enumerateAndFilterClipsWithBlock:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *context;
  void *v27;
  void *v28;
  unsigned int (**v29)(id, id);
  id obj;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v29 = (unsigned int (**)(id, id))a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x20BD308D4]();
  webClipsDirectoryPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, &v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v36;
  if (v8)
  {
    v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CPSWebClipStore _enumerateAndFilterClipsWithBlock:].cold.1(v9);
    objc_msgSend(v7, "count");
    goto LABEL_5;
  }
  if (!objc_msgSend(v7, "count"))
  {
LABEL_5:
    v10 = v3;

    objc_autoreleasePoolPop(v4);
    goto LABEL_26;
  }
  context = v4;
  v27 = v3;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    v28 = v5;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x20BD308D4]();
        objc_msgSend(v5, "stringByAppendingPathComponent:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v17, &v31))
          v18 = v31 == 0;
        else
          v18 = 1;
        if (!v18)
        {
          objc_msgSend(v15, "stringByDeletingPathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            if (objc_msgSend(v6, "fileExistsAtPath:", v20))
            {
              objc_msgSend((id)objc_opt_class(), "_readWebClipDictionaryRepresentationFromDiskWithWebClipIdentifier:", v19);
              v21 = objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v22 = (void *)v21;
                v23 = -[CPSWebClip _initWithIdentifier:webClipDictionary:]([CPSWebClip alloc], "_initWithIdentifier:webClipDictionary:", v19, v21);
                if (v29[2](v29, v23))
                  objc_msgSend(v27, "addObject:", v23);

                v5 = v28;
              }
            }
          }

        }
        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(context);
  v3 = v27;
  v24 = v27;
LABEL_26:

  return v3;
}

- (void)reloadSpringBoardIconForWebClipWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__CPSWebClipStore_reloadSpringBoardIconForWebClipWithIdentifier___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __65__CPSWebClipStore_reloadSpringBoardIconForWebClipWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpringBoardIconForWebClipWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_reloadSpringBoardIconForWebClipWithIdentifier:(id)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x24BEB0B50], "updateWebClipPropertiesWithIdentifier:");
}

- (void)createOrUpdateExistingWebClipWithMetadata:(id)a3 comletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__CPSWebClipStore_createOrUpdateExistingWebClipWithMetadata_comletionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __78__CPSWebClipStore_createOrUpdateExistingWebClipWithMetadata_comletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  unsigned __int8 v8;

  v8 = 0;
  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  objc_msgSend(v2, "_createOrUpdateExistingWebClipWithClipMetadata:createdNewWebClip:error:", v3, &v8, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, void *, _QWORD, id))(v6 + 16))(v6, v4, v8, v5);

}

- (id)_createOrUpdateExistingWebClipWithClipMetadata:(id)a3 createdNewWebClip:(BOOL *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  __int128 v29;
  BOOL *v30;
  id *v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if ((objc_msgSend(v7, "hasFullAppInstalledOnSystem") & 1) != 0)
    objc_msgSend(v7, "fullAppBundleID");
  else
    objc_msgSend(v7, "clipBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clipURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = 0;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[CPSWebClipStore _appClips](self, "_appClips");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (!v10)
  {

LABEL_28:
    v13 = -[CPSWebClip _init]([CPSWebClip alloc], "_init");
    *a4 = 1;
    goto LABEL_29;
  }
  v12 = v10;
  v30 = a4;
  v31 = a5;
  v13 = 0;
  v14 = *(_QWORD *)v36;
  *(_QWORD *)&v11 = 138478083;
  v29 = v11;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v36 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_msgSend(v16, "applicationBundleIdentifier", v29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v8);

      if (v18)
      {
        if ((objc_msgSend(v7, "isPoweredByThirdParty") & 1) != 0 || (objc_msgSend(v16, "isPoweredBy") & 1) != 0)
        {
          if (!v13)
          {
            objc_msgSend(v16, "registeredURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19 == v33)
            {
              v20 = v33;
LABEL_26:
              v13 = v16;

              goto LABEL_27;
            }
            v20 = v19;
            if ((objc_msgSend(v19, "isEqual:") & 1) != 0)
              goto LABEL_26;

            v13 = 0;
          }
        }
        else if (v13)
        {
          objc_msgSend(v16, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0;
          -[CPSWebClipStore _removeWebClipWithIdentifier:error:](self, "_removeWebClipWithIdentifier:error:", v21, &v34);
          v22 = v34;

          v23 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = v23;
            objc_msgSend(v22, "cps_privacyPreservingDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v40 = v8;
            v41 = 2114;
            v42 = v25;
            _os_log_error_impl(&dword_20AD44000, v24, OS_LOG_TYPE_ERROR, "Removed duplicate web clip for %{private}@, error: %{public}@", buf, 0x16u);

          }
        }
        else
        {
          v13 = v16;
        }
      }
    }
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v12)
      continue;
    break;
  }
LABEL_27:

  a4 = v30;
  a5 = v31;
  if (!v13)
    goto LABEL_28;
LABEL_29:
  objc_msgSend(v13, "_updateWithClipMetadata:", v7);
  if (-[CPSWebClipStore _saveWebClip:error:](self, "_saveWebClip:error:", v13, a5))
  {
    v26 = v13;
  }
  else
  {
    v27 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[CPSWebClipStore _createOrUpdateExistingWebClipWithClipMetadata:createdNewWebClip:error:].cold.1();
    v26 = 0;
  }

  return v26;
}

- (void)getWebClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CPSWebClipStore_getWebClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __55__CPSWebClipStore_getWebClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CPSWebClipStore_getWebClipWithURL_completionHandler___block_invoke_2;
  v6[3] = &unk_24C3B99F0;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_enumerateAndFilterClipsWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

uint64_t __55__CPSWebClipStore_getWebClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "pageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)getWebClipsBackedbyAppClipIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CPSWebClipStore_getWebClipsBackedbyAppClipIdentifier_completion___block_invoke;
  block[3] = &unk_24C3B99C8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __67__CPSWebClipStore_getWebClipsBackedbyAppClipIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_webClipsBackedbyAppClipIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_webClipsBackedbyAppClipIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CPSWebClipStore _appClips](self, "_appClips", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "applicationBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)purgeDuplicateWebClipsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__CPSWebClipStore_purgeDuplicateWebClipsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C3B93C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__CPSWebClipStore_purgeDuplicateWebClipsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_appClips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isPoweredBy") & 1) == 0)
        {
          objc_msgSend(v8, "applicationBundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v2, "objectForKeyedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v10)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v9);

            }
            objc_msgSend(v2, "objectForKeyedSubscript:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v8);

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__CPSWebClipStore_purgeDuplicateWebClipsWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_24C3B9AA0;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__CPSWebClipStore_purgeDuplicateWebClipsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          objc_msgSend(v12, "_removeWebClipWithIdentifier:error:", v13, &v19);
          v14 = v19;

          v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = v15;
            objc_msgSend(v14, "cps_privacyPreservingDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478083;
            v25 = v5;
            v26 = 2114;
            v27 = v17;
            _os_log_error_impl(&dword_20AD44000, v16, OS_LOG_TYPE_ERROR, "Removed duplicate web clip for %{private}@, error: %{public}@", buf, 0x16u);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v9);
    }

    v6 = v18;
  }

}

- (void)removePoweredByWebClipsLastActivatedBefore:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CPSWebClipStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CPSWebClipStore_removePoweredByWebClipsLastActivatedBefore_completion___block_invoke;
  block[3] = &unk_24C3B9350;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __73__CPSWebClipStore_removePoweredByWebClipsLastActivatedBefore_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __int128 v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v34 = v3;
    _os_log_impl(&dword_20AD44000, v2, OS_LOG_TYPE_DEFAULT, "Removing powered by web clips last activated before: %@", buf, 0xCu);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "_appClips");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v30;
    *(_QWORD *)&v6 = 138412546;
    v27 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "lastActivatedTime", v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "now");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setLastActivatedTime:", v21);
LABEL_17:

          continue;
        }
        if (objc_msgSend(v10, "isPoweredBy"))
        {
          objc_msgSend(v10, "lastActivatedTime");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "compare:", *(_QWORD *)(a1 + 32));

          if (v13 == -1)
          {
            v14 = CPS_LOG_CHANNEL_PREFIXClipServices();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = v14;
              objc_msgSend(v10, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "lastActivatedTime");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v27;
              v34 = v16;
              v35 = 2112;
              v36 = v17;
              _os_log_impl(&dword_20AD44000, v15, OS_LOG_TYPE_DEFAULT, "Removing web clip with identifier: %@ lastActivatedTime: %@", buf, 0x16u);

            }
            v18 = *(void **)(a1 + 40);
            objc_msgSend(v10, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 0;
            v20 = objc_msgSend(v18, "_removeWebClipWithIdentifier:error:", v19, &v28);
            v21 = v28;

            if ((v20 & 1) == 0)
            {
              v22 = CPS_LOG_CHANNEL_PREFIXClipServices();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                v23 = v22;
                objc_msgSend(v10, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "localizedDescription");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v27;
                v34 = v24;
                v35 = 2112;
                v36 = v25;
                _os_log_error_impl(&dword_20AD44000, v23, OS_LOG_TYPE_ERROR, "Unable to remove expired web clip with identifier: %@ error: %@", buf, 0x16u);

              }
            }
            goto LABEL_17;
          }
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v7);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)removeExpiredPoweredByWebClipsWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDBCE48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -10, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CPSWebClipStore removePoweredByWebClipsLastActivatedBefore:completion:](self, "removePoweredByWebClipsLastActivatedBefore:completion:", v8, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_removeWebClipWithIdentifier:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20AD44000, a2, OS_LOG_TYPE_ERROR, "Unable to remove web clip to Home Screen %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6();
}

- (void)_saveWebClip:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v4, v5, "Couldn't change WebClip icon's data protection class: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_saveWebClip:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, v0, v1, "Could not save WebClip icon", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_saveWebClip:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, v0, v1, "Couldn't save WebClip Info.plist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_saveWebClip:(uint64_t)a1 error:(void *)a2 .cold.4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_1(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v4, v5, "Couldn't exclude WebClip from backup: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_saveWebClip:(uint64_t)a1 error:(void *)a2 .cold.5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_1(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v4, v5, "Couldn't create WebClip bundle: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_saveWebClip:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, v0, v1, "CPSWebClipStore doesn't support writing traditional web clips to disk. Attempting to do so may result in data loss. Use -[UIWebClip createOnDisk] from <UIKit/UIWebClip.h> instead.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_removeFileFromPath:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138478083;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_20AD44000, v5, OS_LOG_TYPE_ERROR, "Could not remove existing icon from path %{private}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)_enumerateAndFilterClipsWithBlock:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v4, v5, "Unable to retrieve contents of the web clip directory: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_createOrUpdateExistingWebClipWithClipMetadata:createdNewWebClip:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, v0, v1, "Unable to update matched web clip on disk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
