@implementation FBKFileCollector

- (FBKFileCollector)initWithFilerForm:(id)a3 attachmentDescriptors:(id)a4
{
  id v7;
  id v8;
  FBKFileCollector *v9;
  FBKFileCollector *v10;
  uint64_t v11;
  NSMutableSet *attachments;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  NSURL *submissionDir;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FBKFileCollector;
  v9 = -[FBKFileCollector init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_filerForm, a3);
    objc_storeStrong((id *)&v10->_attachmentDescriptors, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 3);
    attachments = v10->__attachments;
    v10->__attachments = (NSMutableSet *)v11;

    v13 = +[FBKSharedConstants usesTemporaryDraftsDirectory](FBKSharedConstants, "usesTemporaryDraftsDirectory");
    -[FBKFileCollector filerForm](v10, "filerForm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      +[FBKFileManager temporaryDraftDirectoryForFilerForm:](FBKFileManager, "temporaryDraftDirectoryForFilerForm:", v14);
    else
      +[FBKFileManager draftDirectoryForFilerForm:](FBKFileManager, "draftDirectoryForFilerForm:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    submissionDir = v10->_submissionDir;
    v10->_submissionDir = (NSURL *)v15;

  }
  return v10;
}

- (id)currentDeviceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thisDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attachDraftFiles:(id)a3 withRequirements:(id)a4
{
  return -[FBKFileCollector attachLocalFiles:withRequirements:shouldCopyFiles:](self, "attachLocalFiles:withRequirements:shouldCopyFiles:", a3, a4, 0);
}

- (id)attachURLSchemeFiles:(id)a3 withRequirements:(id)a4
{
  return -[FBKFileCollector attachLocalFiles:withRequirements:shouldCopyFiles:](self, "attachLocalFiles:withRequirements:shouldCopyFiles:", a3, a4, 1);
}

- (id)attachLocalFiles:(id)a3 withRequirements:(id)a4 shouldCopyFiles:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  FBKAttachment *v18;
  void *v19;
  void *v20;
  FBKAttachment *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  FBKAttachment *v25;
  id v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  void *v36;
  _QWORD block[5];
  id v38;
  FBKAttachment *v39;
  BOOL v40;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v30 = v8;
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v36 = v7;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v12)
  {
    v13 = v12;
    v34 = *(_QWORD *)v43;
    v14 = MEMORY[0x24BDAC760];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v15);
        +[FBKLog attachHandle](FBKLog, "attachHandle");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v16;
          _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_DEFAULT, "will create attachment for URL attached file with identifier [%{public}@]", buf, 0xCu);
        }

        v18 = [FBKAttachment alloc];
        -[FBKFileCollector identifier](self, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKFileCollector currentDeviceIdentifier](self, "currentDeviceIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[FBKAttachment initWithCollectorIdentifier:deviceUUID:](v18, "initWithCollectorIdentifier:deviceUUID:", v19, v20);

        -[FBKAttachment setAttachmentType:](v21, "setAttachmentType:", 5);
        -[FBKAttachment setFileComesFromFBK:](v21, "setFileComesFromFBK:", 1);
        v41[0] = v14;
        v41[1] = 3221225472;
        v41[2] = __70__FBKFileCollector_attachLocalFiles_withRequirements_shouldCopyFiles___block_invoke;
        v41[3] = &unk_24E1582D8;
        v41[4] = v16;
        objc_msgSend(v11, "ded_findWithBlock:", v41);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          +[FBKLog attachHandle](FBKLog, "attachHandle");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v22, "deBundleIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKeyedSubscript:", v32);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "deBundleIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v47 = v27;
            v48 = 2114;
            v49 = v31;
            _os_log_debug_impl(&dword_21D9A9000, v23, OS_LOG_TYPE_DEBUG, "Found pending match [%{public}@] for requirement [%{public}@]", buf, 0x16u);

          }
          -[FBKAttachment setAttachmentType:](v21, "setAttachmentType:", 1);
          -[FBKAttachment setRequirement:](v21, "setRequirement:", v22);
          objc_msgSend(v11, "removeObject:", v22);
        }
        objc_msgSend(v36, "objectForKeyedSubscript:", v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKAttachment setState:](v21, "setState:", 1);
        block[0] = v14;
        block[1] = 3221225472;
        block[2] = __70__FBKFileCollector_attachLocalFiles_withRequirements_shouldCopyFiles___block_invoke_34;
        block[3] = &unk_24E158300;
        v40 = a5;
        block[4] = self;
        v38 = v24;
        v39 = v21;
        v25 = v21;
        v26 = v24;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

uint64_t __70__FBKFileCollector_attachLocalFiles_withRequirements_shouldCopyFiles___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "deBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __70__FBKFileCollector_attachLocalFiles_withRequirements_shouldCopyFiles___block_invoke_34(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_attachURL:toAttachment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "attachmentDescriptors");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setLocalizedAttachmentInfo:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2CA20], "itemWithURL:", *(_QWORD *)(a1 + 40));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setItem:originalURL:");
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "attachmentDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setLocalizedAttachmentInfo:", v8);

    objc_msgSend(*(id *)(a1 + 48), "setState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_addAttachment:", *(_QWORD *)(a1 + 48));
  }

}

+ (void)findExistingFilesForFilerForm:(id)a3 matcherPredicates:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  +[FBKFileManager draftDirectoryForFilerForm:](FBKFileManager, "draftDirectoryForFilerForm:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "diskAccessQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__FBKFileCollector_findExistingFilesForFilerForm_matcherPredicates_completion___block_invoke;
  block[3] = &unk_24E157138;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __79__FBKFileCollector_findExistingFilesForFilerForm_matcherPredicates_completion___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  NSObject *obj;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v1 = (id *)a1;
  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", *(_QWORD *)(a1 + 32));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1[5], "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

  if ((v5 & 1) != 0)
  {
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    v43 = 0u;
    objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v1[5]);
    v6 = objc_claimAutoreleasedReturnValue();
    v32 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v32)
    {
      v30 = *(_QWORD *)v44;
      v31 = v1;
      obj = v6;
      do
      {
        v7 = 0;
        do
        {
          v8 = v2;
          if (*(_QWORD *)v44 != v30)
            objc_enumerationMutation(obj);
          v33 = v7;
          v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v7);
          objc_msgSend(v9, "lastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v11 = v1[4];
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v40 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v16, "fileMatcher");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "matchesFilename:", v10);

                if (v18)
                {
                  objc_msgSend(v34, "removeObject:", v16);
                  objc_msgSend(v16, "deBundleIdentifier");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v19);

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v13);
          }

          v2 = v8;
          objc_msgSend(v8, "allValues");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v9);

          if ((v21 & 1) == 0)
          {
            objc_msgSend(v9, "path");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v22);

          }
          v7 = v33 + 1;
          v1 = v31;
        }
        while (v33 + 1 != v32);
        v6 = obj;
        v32 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v32);
    }
  }
  else
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v23 = v1[5];
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_INFO, "Drafts directory does not exist yet [%{public}@]", buf, 0xCu);
    }
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__FBKFileCollector_findExistingFilesForFilerForm_matcherPredicates_completion___block_invoke_42;
  block[3] = &unk_24E157200;
  v26 = v1[6];
  v37 = v25;
  v38 = v26;
  v36 = v24;
  v27 = v25;
  v28 = v24;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __79__FBKFileCollector_findExistingFilesForFilerForm_matcherPredicates_completion___block_invoke_42(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addAttachmentWithItemProvider:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasItemConformingToTypeIdentifier:", v5);

  if (v6)
  {
    -[FBKFileCollector addVideoFromItemProvider:](self, "addVideoFromItemProvider:", v4);
  }
  else if (objc_msgSend(v4, "canLoadObjectOfClass:", objc_opt_class()))
  {
    -[FBKFileCollector addImageWithItemProvider:](self, "addImageWithItemProvider:", v4);
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x24BDF8430], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "hasItemConformingToTypeIdentifier:", v7);

    if (v8)
    {
      -[FBKFileCollector addFileFromItemProvider:](self, "addFileFromItemProvider:", v4);
    }
    else
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FBKFileCollector addAttachmentWithItemProvider:].cold.1();

    }
  }

}

- (id)diskAccessQueue
{
  return (id)objc_msgSend((id)objc_opt_class(), "diskAccessQueue");
}

+ (id)diskAccessQueue
{
  if (diskAccessQueue_onceToken != -1)
    dispatch_once(&diskAccessQueue_onceToken, &__block_literal_global_18);
  return (id)diskAccessQueue_imageProcessingQueue;
}

void __35__FBKFileCollector_diskAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.appleseed.FeedbackAssistant.diskAccess", 0);
  v1 = (void *)diskAccessQueue_imageProcessingQueue;
  diskAccessQueue_imageProcessingQueue = (uint64_t)v0;

}

- (void)addImageWithItemProvider:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v4 = a3;
  v5 = -[FBKFileCollector newAttachmentWithType:](self, "newAttachmentWithType:", 3);
  -[FBKFileCollector submissionDir](self, "submissionDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proposedFileNameForLocalFiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKFileCollector _addAttachment:](self, "_addAttachment:", v5);
  -[FBKFileCollector listener](self, "listener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachmentProvider:didStartAttaching:", self, v5);

  v10 = objc_opt_class();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__FBKFileCollector_addImageWithItemProvider___block_invoke;
  v14[3] = &unk_24E158370;
  v14[4] = self;
  v15 = v5;
  v16 = v8;
  v11 = v8;
  v12 = v5;
  v13 = (id)objc_msgSend(v4, "loadObjectOfClass:completionHandler:", v10, v14);

}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v5;
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v38 = v10;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "Will add image [%{public}@]", buf, 0xCu);
    }

    objc_msgSend(v8, "correctlyRotatedPNGData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "writeToURL:atomically:", *(_QWORD *)(a1 + 48), 1))
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        v38 = v14;
        _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_DEFAULT, "Did add image [%{public}@]", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BE2CA20], "itemWithURL:", *(_QWORD *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__FBKFileCollector_addImageWithItemProvider___block_invoke_48;
      block[3] = &unk_24E158348;
      v30 = *(id *)(a1 + 40);
      v31 = v15;
      v16 = *(id *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 32);
      v32 = v16;
      v33 = v17;
      v18 = v15;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __45__FBKFileCollector_addImageWithItemProvider___block_invoke_2;
      v25[3] = &unk_24E157F78;
      v22 = *(id *)(a1 + 48);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(a1 + 40);
      v26 = v22;
      v27 = v23;
      v28 = v24;
      dispatch_async(MEMORY[0x24BDAC9B8], v25);

      v18 = v26;
    }

  }
  else
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __45__FBKFileCollector_addImageWithItemProvider___block_invoke_cold_1(v7, v19);

    FBKErrorOfType(-1018);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __45__FBKFileCollector_addImageWithItemProvider___block_invoke_47;
    v34[3] = &unk_24E157F78;
    v21 = *(void **)(a1 + 40);
    v34[4] = *(_QWORD *)(a1 + 32);
    v35 = v21;
    v36 = v20;
    v8 = v20;
    dispatch_async(MEMORY[0x24BDAC9B8], v34);

  }
}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_47(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateAttachment:withState:", *(_QWORD *)(a1 + 40), 3);
  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentProvider:didFinishAttaching:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_48(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setItem:originalURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "attachmentDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLocalizedAttachmentInfo:", v5);

  objc_msgSend(*(id *)(a1 + 56), "_updateAttachment:withState:", *(_QWORD *)(a1 + 32), 2);
  objc_msgSend(*(id *)(a1 + 56), "listener");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentProvider:didFinishAttaching:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), 0);

}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__FBKFileCollector_addImageWithItemProvider___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "_updateAttachment:withState:", *(_QWORD *)(a1 + 48), 3);
  objc_msgSend(*(id *)(a1 + 40), "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentProvider:didFinishAttaching:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

- (void)addVideoFromItemProvider:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v4 = a3;
  v5 = -[FBKFileCollector newAttachmentWithType:](self, "newAttachmentWithType:", 4);
  -[FBKFileCollector submissionDir](self, "submissionDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proposedFileNameForLocalFiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKFileCollector _addAttachment:](self, "_addAttachment:", v5);
  -[FBKFileCollector listener](self, "listener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachmentProvider:didStartAttaching:", self, v5);

  objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__FBKFileCollector_addVideoFromItemProvider___block_invoke;
  v14[3] = &unk_24E158398;
  v14[4] = self;
  v15 = v5;
  v16 = v8;
  v11 = v8;
  v12 = v5;
  v13 = (id)objc_msgSend(v4, "loadFileRepresentationForTypeIdentifier:completionHandler:", v10, v14);

}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  _QWORD block[5];
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && !v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v40 = v5;
      v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Will copy video url [%{public}@] to [%{public}@] ", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isReadableFileAtPath:", v11);

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BE2C9A0];
      objc_msgSend(*(id *)(a1 + 32), "submissionDir");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "copyAndReturn:toDir:", v5, v14);

      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 48);
        v35 = 0;
        objc_msgSend(v16, "moveItemAtURL:toURL:error:", v15, v17, &v35);
        v18 = v35;
        if (!v18)
        {
          objc_msgSend(MEMORY[0x24BE2CA20], "itemWithURL:", *(_QWORD *)(a1 + 48));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_51;
          v30[3] = &unk_24E158348;
          v31 = *(id *)(a1 + 40);
          v32 = v24;
          v25 = v5;
          v26 = *(_QWORD *)(a1 + 32);
          v33 = v25;
          v34 = v26;
          v27 = v24;
          dispatch_async(MEMORY[0x24BDAC9B8], v30);

          goto LABEL_20;
        }
        v19 = v18;
        +[FBKLog attachHandle](FBKLog, "attachHandle");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_2();

        goto LABEL_19;
      }
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_1((uint64_t)v5, (id *)(a1 + 32), v15);
    }
    else
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_3();
    }
    v19 = 0;
LABEL_19:

    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_52;
    v28[3] = &unk_24E157020;
    v23 = *(void **)(a1 + 40);
    v28[4] = *(_QWORD *)(a1 + 32);
    v29 = v23;
    dispatch_async(MEMORY[0x24BDAC9B8], v28);

    v15 = v19;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_4(v6, v8);

  FBKErrorOfType(-1017);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_50;
  block[3] = &unk_24E157F78;
  v22 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v37 = v22;
  v38 = v21;
  v15 = v21;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

LABEL_20:
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_50(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateAttachment:withState:", *(_QWORD *)(a1 + 40), 3);
  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentProvider:didFinishAttaching:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_51(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setItem:originalURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "attachmentDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLocalizedAttachmentInfo:", v5);

  objc_msgSend(*(id *)(a1 + 56), "_updateAttachment:withState:", *(_QWORD *)(a1 + 32), 2);
  objc_msgSend(*(id *)(a1 + 56), "listener");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentProvider:didFinishAttaching:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), 0);

}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_52(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateAttachment:withState:", *(_QWORD *)(a1 + 40), 3);
  FBKErrorOfType(-1017);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentProvider:didFinishAttaching:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3);

}

- (id)newAttachmentWithType:(int64_t)a3
{
  FBKAttachment *v5;
  void *v6;
  void *v7;
  FBKAttachment *v8;
  void *v9;

  v5 = [FBKAttachment alloc];
  -[FBKFileCollector identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFileCollector currentDeviceIdentifier](self, "currentDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FBKAttachment initWithCollectorIdentifier:deviceUUID:](v5, "initWithCollectorIdentifier:deviceUUID:", v6, v7);

  -[FBKAttachment setAttachmentType:](v8, "setAttachmentType:", a3);
  -[FBKAttachment setState:](v8, "setState:", 1);
  -[FBKAttachment setFileComesFromFBK:](v8, "setFileComesFromFBK:", 1);
  -[FBKFileCollector getUniqueFileNameForAttachmentType:](self, "getUniqueFileNameForAttachmentType:", -[FBKAttachment attachmentType](v8, "attachmentType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment setProposedFileNameForLocalFiles:](v8, "setProposedFileNameForLocalFiles:", v9);

  return v8;
}

- (id)_fileProcessingQueue
{
  if (_fileProcessingQueue_onceToken != -1)
    dispatch_once(&_fileProcessingQueue_onceToken, &__block_literal_global_54);
  return (id)_fileProcessingQueue_fileProcessingQueue;
}

void __40__FBKFileCollector__fileProcessingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.appleseed.FeedbackAssistant.FileProcessing", 0);
  v1 = (void *)_fileProcessingQueue_fileProcessingQueue;
  _fileProcessingQueue_fileProcessingQueue = (uint64_t)v0;

}

- (void)addFileFromItemProvider:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  FBKFileCollector *v12;

  v4 = a3;
  v5 = -[FBKFileCollector newAttachmentWithType:](self, "newAttachmentWithType:", 5);
  -[FBKFileCollector listener](self, "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentProvider:didStartAttaching:", self, v5);

  objc_msgSend((id)*MEMORY[0x24BDF8430], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__FBKFileCollector_addFileFromItemProvider___block_invoke;
  v10[3] = &unk_24E1583E0;
  v11 = v5;
  v12 = self;
  v8 = v5;
  v9 = (id)objc_msgSend(v4, "loadFileRepresentationForTypeIdentifier:completionHandler:", v7, v10);

}

void __44__FBKFileCollector_addFileFromItemProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  int8x16_t v13;
  _QWORD v14[4];
  int8x16_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__FBKFileCollector_addFileFromItemProvider___block_invoke_2;
  block[3] = &unk_24E157F78;
  v17 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 40);
  v18 = v8;
  v19 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if (!v8 || v6)
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __44__FBKFileCollector_addFileFromItemProvider___block_invoke_cold_1(v6, v10);

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __44__FBKFileCollector_addFileFromItemProvider___block_invoke_57;
    v14[3] = &unk_24E157020;
    v13 = *(int8x16_t *)(a1 + 32);
    v12 = (id)v13.i64[0];
    v15 = vextq_s8(v13, v13, 8uLL);
    objc_msgSend(v11, "addOperationWithBlock:", v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "processFileFromURL:movingFile:forAttachment:", v8, 0, *(_QWORD *)(a1 + 32));
  }

}

uint64_t __44__FBKFileCollector_addFileFromItemProvider___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProposedFileNameForLocalFiles:", v3);

  return objc_msgSend(*(id *)(a1 + 48), "_addAttachment:", *(_QWORD *)(a1 + 32));
}

void __44__FBKFileCollector_addFileFromItemProvider___block_invoke_57(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateAttachment:withState:", *(_QWORD *)(a1 + 40), 3);
  FBKErrorOfType(-1019);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentProvider:didFinishAttaching:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3);

}

- (void)addFileFromURL:(id)a3 byMoving:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v6 = a3;
  v7 = -[FBKFileCollector newAttachmentWithType:](self, "newAttachmentWithType:", 5);
  objc_msgSend(v6, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProposedFileNameForLocalFiles:", v8);

  -[FBKFileCollector _fileProcessingQueue](self, "_fileProcessingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__FBKFileCollector_addFileFromURL_byMoving___block_invoke;
  v12[3] = &unk_24E158300;
  v12[4] = self;
  v13 = v6;
  v15 = a4;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

uint64_t __44__FBKFileCollector_addFileFromURL_byMoving___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processFileFromURL:movingFile:forAttachment:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (id)existingAttachmentRegexMatchingFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FBKFileCollector diagnosticExtensionAttachments](self, "diagnosticExtensionAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__FBKFileCollector_existingAttachmentRegexMatchingFile___block_invoke;
  v9[3] = &unk_24E158408;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ded_findWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __56__FBKFileCollector_existingAttachmentRegexMatchingFile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "requirement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasRegularExpression");

  if (v5 && (objc_msgSend(v3, "hasFiles") & 1) == 0)
  {
    objc_msgSend(v3, "requirement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileMatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "matchesFilename:", v9);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)diagnosticExtensionAttachments
{
  void *v2;
  void *v3;

  -[FBKFileCollector deCollector](self, "deCollector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)processFileFromURL:(id)a3 movingFile:(BOOL)a4 forAttachment:(id)a5
{
  _BOOL4 v6;
  __CFString *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  int v21;
  void *v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  int v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  __CFString *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD block[5];
  id v51;
  uint8_t buf[4];
  const __CFString *v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v6 = a4;
  v58 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a5;
  if ((-[__CFString checkResourceIsReachableAndReturnError:](v8, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    v10 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke;
    block[3] = &unk_24E157020;
    block[4] = self;
    v11 = v9;
    v51 = v11;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__0;
    v48 = __Block_byref_object_dispose__0;
    -[FBKFileCollector submissionDir](self, "submissionDir");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "proposedFileNameForLocalFiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v13);
    v49 = (id)objc_claimAutoreleasedReturnValue();

    -[FBKFileCollector diskAccessQueue](self, "diskAccessQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v43[0] = v10;
    v43[1] = 3221225472;
    v43[2] = __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke_59;
    v43[3] = &unk_24E156A30;
    v43[4] = &v44;
    dispatch_sync(v14, v43);

    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("copy");
      v17 = (void *)v45[5];
      if (v6)
        v16 = CFSTR("move");
      *(_DWORD *)buf = 138543874;
      v53 = v16;
      v54 = 2114;
      v55 = v8;
      v56 = 2114;
      v57 = v17;
      _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_INFO, "Will %{public}@ file url [%{public}@] to [%{public}@] ", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v45[5];
    if (v6)
    {
      v42 = 0;
      v20 = (id *)&v42;
      v21 = objc_msgSend(v18, "moveItemAtURL:toURL:error:", v8, v19, &v42);
    }
    else
    {
      v41 = 0;
      v20 = (id *)&v41;
      v21 = objc_msgSend(v18, "copyItemAtURL:toURL:error:", v8, v19, &v41);
    }
    v28 = v21;
    v29 = *v20;

    if (v29)
      v30 = 0;
    else
      v30 = v28;
    if (v30 == 1)
    {
      objc_msgSend(MEMORY[0x24BE2CA20], "itemWithURL:", v45[5]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v10;
      v37[1] = 3221225472;
      v37[2] = __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke_64;
      v37[3] = &unk_24E158348;
      v37[4] = self;
      v38 = v11;
      v33 = v31;
      v39 = v33;
      v40 = v8;
      objc_msgSend(v32, "addOperationWithBlock:", v37);

    }
    else
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = (__CFString *)v45[5];
        objc_msgSend(v29, "localizedDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v8;
        v54 = 2114;
        v55 = v35;
        v56 = 2114;
        v57 = v36;
        _os_log_error_impl(&dword_21D9A9000, v34, OS_LOG_TYPE_ERROR, "Failed to process file [%{public}@] to [%{public}@]: %{public}@", buf, 0x20u);

      }
      FBKErrorOfType(-1019);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      -[FBKFileCollector reportAttachingErrorWithAttachment:userFriendlyError:](self, "reportAttachingErrorWithAttachment:userFriendlyError:", v11, v33);
    }

    _Block_object_dispose(&v44, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isUbiquitousItemAtURL:", v8);

    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
        -[FBKFileCollector processFileFromURL:movingFile:forAttachment:].cold.1();

      FBKErrorOfType(-1021);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKFileCollector reportAttachingErrorWithAttachment:userFriendlyError:](self, "reportAttachingErrorWithAttachment:userFriendlyError:", v9, v26);

    }
    else
    {
      if (v25)
        -[FBKFileCollector processFileFromURL:movingFile:forAttachment:].cold.2();

      FBKErrorOfType(-1019);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKFileCollector reportAttachingErrorWithAttachment:userFriendlyError:](self, "reportAttachingErrorWithAttachment:userFriendlyError:", v9, v27);

    }
  }

}

void __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentProvider:didStartAttaching:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke_59(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[FBKFileManager getUniqueDestinationURLForURL:alwaysIndex:](FBKFileManager, "getUniqueDestinationURLForURL:alwaysIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke_64(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentProvider:didFinishAttaching:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(*(id *)(a1 + 40), "setItem:originalURL:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "attachmentDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLocalizedAttachmentInfo:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 40));

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  if ((v6 & 1) != 0)
    return objc_msgSend(v8, "_updateAttachment:withState:", v9, 2);
  else
    return objc_msgSend(v8, "_addAttachment:", v9);
}

- (void)reportAttachingErrorWithAttachment:(id)a3 userFriendlyError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__FBKFileCollector_reportAttachingErrorWithAttachment_userFriendlyError___block_invoke;
  v11[3] = &unk_24E157F78;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

}

void __73__FBKFileCollector_reportAttachingErrorWithAttachment_userFriendlyError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentProvider:didFinishAttaching:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "_attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_updateAttachment:withState:", *(_QWORD *)(a1 + 40), 3);
}

- (id)getUniqueFileNameForAttachmentType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  _QWORD v13[5];

  -[FBKFileCollector attachments](self, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__FBKFileCollector_getUniqueFileNameForAttachmentType___block_invoke;
  v13[3] = &__block_descriptor_40_e23_B16__0__FBKAttachment_8l;
  v13[4] = a3;
  objc_msgSend(v4, "ded_selectItemsPassingTest:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ded_flatMapWithBlock:", &__block_literal_global_66);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 4)
  {
    v7 = CFSTR(".mov");
    v8 = CFSTR("Video");
  }
  else
  {
    if (a3 != 3)
    {
      v11 = &stru_24E15EAF8;
      goto LABEL_9;
    }
    v7 = CFSTR(".png");
    v8 = CFSTR("Image");
  }
  v9 = 0;
  v10 = 1;
  do
  {
    -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR("_%.2d%@"), v10, v7);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v10 = (v10 + 1);
    v9 = v11;
  }
  while ((objc_msgSend(v6, "containsObject:", v11) & 1) != 0);
LABEL_9:

  return v11;
}

BOOL __55__FBKFileCollector_getUniqueFileNameForAttachmentType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attachmentType") == *(_QWORD *)(a1 + 32);
}

uint64_t __55__FBKFileCollector_getUniqueFileNameForAttachmentType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proposedFileNameForLocalFiles");
}

- (void)commitWithForm:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(id, _QWORD);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[FBKFileCollector _attachments](self, "_attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[FBKFileCollector _attachments](self, "_attachments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ded_selectItemsPassingTest:", &__block_literal_global_71);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[FBKFileCollector commitWithForm:withCompletion:].cold.1(v11, v12);

      v7[2](v7, 0);
    }
    else
    {
      -[FBKFileCollector _attachments](self, "_attachments");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ded_flatMapWithBlock:", &__block_literal_global_75);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_2;
      v17[3] = &unk_24E1584F0;
      v17[4] = self;
      v18 = v7;
      +[FBKDEDHelper sendLocalFilesToDED:withForm:withCompletion:](FBKDEDHelper, "sendLocalFilesToDED:withForm:withCompletion:", v16, v6, v17);

    }
  }
  else
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_DEFAULT, "No local files in file collector: nothing to commit", buf, 2u);
    }

    v7[2](v7, 0);
  }

}

uint64_t __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCollecting");
}

id __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_74(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachedPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_2_cold_1();
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_attachments", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "remove");
        }
        while (v9 != v11);
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)saveDraftsDirectory
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "Failed to created Drafts Directory: [%{public}@]", v5);

  OUTLINED_FUNCTION_2_1();
}

id __39__FBKFileCollector_saveDraftsDirectory__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachedPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)requirements
{
  void *v2;
  void *v3;

  -[FBKFileCollector attachments](self, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ded_flatMapWithBlock:", &__block_literal_global_79);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __32__FBKFileCollector_requirements__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requirement");
}

- (void)updateRequirements:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FBKFileCollector _attachments](self, "_attachments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "requirement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "requirement");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v4, "containsObject:", v12);

          if ((v13 & 1) != 0)
          {
            objc_msgSend(v10, "requirement");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "removeObject:", v14);
          }
          else
          {
            objc_msgSend(v10, "setRequirement:", 0);
            -[FBKFileCollector listener](self, "listener");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "attachmentProvider:didUpdateAttachment:", self, v10);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (BOOL)hasFilePromises
{
  void *v2;
  void *v3;
  BOOL v4;

  -[FBKFileCollector _attachments](self, "_attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ded_findWithBlock:", &__block_literal_global_80);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __35__FBKFileCollector_hasFilePromises__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hasFiles") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isCollecting");

  return v3;
}

- (BOOL)hasUnmetRequirements
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[FBKFileCollector _attachments](self, "_attachments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v6, "hasFiles") & 1) != 0)
          v7 = 1;
        else
          v7 = objc_msgSend(v6, "isCollecting");
        objc_msgSend(v6, "requirement");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          v9 = v7 == 0;
        else
          v9 = 0;
        if (v9)
        {
          LOBYTE(v3) = 1;
          goto LABEL_17;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_17:

  return v3;
}

- (void)removeAllAttachments
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[FBKFileCollector attachments](self, "attachments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[FBKFileCollector removeAttachment:](self, "removeAttachment:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)cancelCollection:(id)a3
{
  NSObject *v3;

  +[FBKLog attachHandle](FBKLog, "attachHandle", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[FBKFileCollector cancelCollection:].cold.1(v3);

}

- (void)removeAttachment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  FBKFileCollector *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138543618;
    v11 = v4;
    v12 = 2114;
    v13 = self;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "Will remove [%{public}@] in [%{public}@]", (uint8_t *)&v10, 0x16u);
  }

  -[FBKFileCollector _attachments](self, "_attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v4;
      v12 = 2114;
      v13 = self;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "removing [%{public}@] in [%{public}@]", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(v4, "remove");
    -[FBKFileCollector _removeAttachment:](self, "_removeAttachment:", v4);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBKFileCollector removeAttachment:].cold.1();

  }
}

- (id)attachments
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[FBKFileCollector _attachments](self, "_attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)platform
{
  void *v2;
  void *v3;

  +[FBKGroupedDevice currentGroupedDevice](FBKGroupedDevice, "currentGroupedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)submissionDir
{
  FBKFileCollector *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  uint64_t submissionDir;
  void *v9;
  NSURL *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](v2->_submissionDir, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2C9A0], "createDirectoryWithClassCDataProtection:", v2->_submissionDir);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        submissionDir = (uint64_t)v2->_submissionDir;
        objc_msgSend(v6, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKFileCollector submissionDir].cold.1(submissionDir, v9, (uint64_t)v12, v7);
      }

    }
  }
  v10 = v2->_submissionDir;
  objc_sync_exit(v2);

  return v10;
}

- (void)setSubmissionDir:(id)a3
{
  NSURL *v4;
  NSURL *submissionDir;
  FBKFileCollector *obj;

  v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  submissionDir = obj->_submissionDir;
  obj->_submissionDir = v4;

  objc_sync_exit(obj);
}

- (void)_attachURL:(id)a3 toAttachment:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  FBKFileCollector *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v30 = 0;
    objc_msgSend(v6, "getResourceValue:forKey:error:", &v30, *MEMORY[0x24BDBCC60], 0);
    v8 = v30;
    v9 = v8;
    if (v8 && objc_msgSend(v8, "BOOLValue"))
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v6;
        _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "attaching dir [%{public}@]", buf, 0xCu);
      }

      -[FBKFileCollector submissionDir](self, "submissionDir");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBKFileManager getUniqueDestinationURLForURL:alwaysIndex:forSourceURL:](FBKFileManager, "getUniqueDestinationURLForURL:alwaysIndex:forSourceURL:", v11, 0, v6);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v6;
        _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_DEFAULT, "attaching file [%{public}@]", buf, 0xCu);
      }

      -[FBKFileCollector submissionDir](self, "submissionDir");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByAppendingPathComponent:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[FBKFileManager getUniqueDestinationURLForURL:alwaysIndex:](FBKFileManager, "getUniqueDestinationURLForURL:alwaysIndex:", v11, 0);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v12;

    objc_msgSend(MEMORY[0x24BE2CA20], "itemWithURL:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setItem:originalURL:", v17, v6);
    -[FBKFileCollector attachmentDescriptors](self, "attachmentDescriptors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v7, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocalizedAttachmentInfo:", v20);

    -[FBKFileCollector _addAttachment:](self, "_addAttachment:", v7);
    if (objc_msgSend(v7, "state") != 1)
      -[FBKFileCollector _updateAttachment:withState:](self, "_updateAttachment:withState:", v7, 1);
    dispatch_get_global_queue(25, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __44__FBKFileCollector__attachURL_toAttachment___block_invoke;
    v24[3] = &unk_24E158578;
    v25 = v9;
    v26 = v16;
    v27 = v6;
    v28 = self;
    v29 = v7;
    v22 = v16;
    v23 = v9;
    dispatch_async(v21, v24);

  }
  else
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[FBKFileCollector _attachURL:toAttachment:].cold.1();
  }

}

void __44__FBKFileCollector__attachURL_toAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 40);
    v35 = 0;
    objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v35);
    v6 = v35;

    if (v6)
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __44__FBKFileCollector__attachURL_toAttachment___block_invoke_cold_1();

    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);

        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      }
      while (v10);
    }

    v13 = *v5;
  }
  else
  {
    v14 = (void *)MEMORY[0x24BE2C9A0];
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "submissionDir");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v14, "copyAndReturn:toDir:withNewFileName:", v15, v16, v17);

  }
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 64), "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v37 = v19;
    v38 = 2114;
    v39 = v20;
    v40 = 2114;
    v41 = v21;
    _os_log_impl(&dword_21D9A9000, v18, OS_LOG_TYPE_DEFAULT, "attached url [%{public}@] to attachment [%{public}@] with file name [%{public}@]", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BE2CA20], "itemWithURL:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __44__FBKFileCollector__attachURL_toAttachment___block_invoke_82;
  v26[3] = &unk_24E158348;
  v27 = *(id *)(a1 + 64);
  v28 = v22;
  v23 = *(id *)(a1 + 48);
  v24 = *(_QWORD *)(a1 + 56);
  v29 = v23;
  v30 = v24;
  v25 = v22;
  dispatch_async(MEMORY[0x24BDAC9B8], v26);

}

uint64_t __44__FBKFileCollector__attachURL_toAttachment___block_invoke_82(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setItem:originalURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "attachmentDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLocalizedAttachmentInfo:", v5);

  return objc_msgSend(*(id *)(a1 + 56), "_updateAttachment:withState:", *(_QWORD *)(a1 + 32), 2);
}

- (void)_addAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBKFileCollector _attachments](self, "_attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[FBKFileCollector listener](self, "listener");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentProvider:didAddAttachment:", self, v4);

}

- (void)_updateAttachment:(id)a3 withState:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(v6, "setState:", a4);
  -[FBKFileCollector listener](self, "listener");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentProvider:didUpdateAttachment:", self, v6);

}

- (void)_removeAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBKFileCollector _attachments](self, "_attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[FBKFileCollector listener](self, "listener");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentProvider:didRemoveAttachment:", self, v4);

}

- (FBKAttachmentListenerDelegate)listener
{
  return (FBKAttachmentListenerDelegate *)objc_loadWeakRetained((id *)&self->_listener);
}

- (void)setListener:(id)a3
{
  objc_storeWeak((id *)&self->_listener, a3);
}

- (FBKDECollector)deCollector
{
  return self->_deCollector;
}

- (void)setDeCollector:(id)a3
{
  objc_storeStrong((id *)&self->_deCollector, a3);
}

- (NSArray)attachmentDescriptors
{
  return self->_attachmentDescriptors;
}

- (void)setAttachmentDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentDescriptors, a3);
}

- (NSMutableSet)_attachments
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_attachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (FBKFilerForm)filerForm
{
  return self->_filerForm;
}

- (void)setFilerForm:(id)a3
{
  objc_storeStrong((id *)&self->_filerForm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filerForm, 0);
  objc_storeStrong((id *)&self->__attachments, 0);
  objc_storeStrong((id *)&self->_attachmentDescriptors, 0);
  objc_storeStrong((id *)&self->_deCollector, 0);
  objc_destroyWeak((id *)&self->_listener);
  objc_storeStrong((id *)&self->_submissionDir, 0);
}

- (void)addAttachmentWithItemProvider:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "File Collector cannot attach file [%{public}@]", v2);
  OUTLINED_FUNCTION_7();
}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "Couldn't load image with error: [%{public}@]", v5);

  OUTLINED_FUNCTION_2_1();
}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "Failed to write image to URL [%{public}@]", v2);
  OUTLINED_FUNCTION_7();
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a2, "submissionDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_4(&dword_21D9A9000, a3, v6, "Failed to copy video [%{public}@] to [%{public}@]", (uint8_t *)&v7);

}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_4(&dword_21D9A9000, v1, (uint64_t)v1, "Failed to move video [%{public}@] to [%{public}@]", v2);
  OUTLINED_FUNCTION_7();
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "Failed to copy video [%{public}@]: URL not reachable", v2);
  OUTLINED_FUNCTION_7();
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "Couldn't load video with error: [%{public}@]", v5);

  OUTLINED_FUNCTION_2_1();
}

void __44__FBKFileCollector_addFileFromItemProvider___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "Couldn't load file from item provider with error: [%{public}@]", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)processFileFromURL:movingFile:forAttachment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "Failed to download Ubiquitous Item %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)processFileFromURL:movingFile:forAttachment:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "Failed to process file [%{public}@]: URL not reachable", v2);
  OUTLINED_FUNCTION_7();
}

- (void)commitWithForm:(void *)a1 withCompletion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "valueForKeyPath:", CFSTR("displayName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_FAULT, "local File Attachments [%{public}@] are still gathering, cannot submit these files", v4, 0xCu);

  OUTLINED_FUNCTION_2_1();
}

void __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "error sending local files to DED: [%{public}@]", v2);
  OUTLINED_FUNCTION_7();
}

- (void)cancelCollection:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "cancelCollection not supported for file collector", v1, 2u);
}

- (void)removeAttachment:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_4(&dword_21D9A9000, v1, (uint64_t)v1, "[%{public}@] cannot remove [%{public}@]: Attachment not found", v2);
  OUTLINED_FUNCTION_7();
}

- (void)submissionDir
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4(&dword_21D9A9000, a4, a3, "Failed to create draft directory [%{public}@] with error %{public}@", (uint8_t *)a3);

}

- (void)_attachURL:toAttachment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "cannot copy URL for attachment [%{public}@]: URL is nil", v2);
  OUTLINED_FUNCTION_7();
}

void __44__FBKFileCollector__attachURL_toAttachment___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "Failed to create destination dir [%{public}@]", v2);
  OUTLINED_FUNCTION_7();
}

@end
