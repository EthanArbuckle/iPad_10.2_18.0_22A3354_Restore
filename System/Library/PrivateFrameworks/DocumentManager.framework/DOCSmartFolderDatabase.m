@implementation DOCSmartFolderDatabase

- (DOCSmartFolderDatabase)init
{
  void *v3;
  void *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  DOCSmartFolderDatabase *v8;
  NSObject **v9;
  NSObject *v10;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.DocumentManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("smartfolders.db"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSObject **)MEMORY[0x24BE2DFD0];
    v7 = *MEMORY[0x24BE2DFD0];
    if (v5)
    {
      if (!v7)
      {
        DOCInitLogging();
        v7 = *v6;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[DOCSmartFolderDatabase init].cold.3();
      self = -[DOCSmartFolderDatabase initWithURL:](self, "initWithURL:", v5);
      v8 = self;
    }
    else
    {
      if (!v7)
      {
        DOCInitLogging();
        v7 = *v6;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[DOCSmartFolderDatabase init].cold.2();
      v8 = 0;
    }

  }
  else
  {
    v9 = (NSObject **)MEMORY[0x24BE2DFD0];
    v10 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase init].cold.1();
    v8 = 0;
  }

  return v8;
}

- (DOCSmartFolderDatabase)initWithURL:(id)a3
{
  id v5;
  DOCSmartFolderDatabase *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workingQueue;
  dispatch_time_t v11;
  NSObject *v12;
  id *v13;
  DOCSmartFolderDatabase *v14;
  _QWORD block[4];
  id *v17;
  objc_super v18;

  v5 = a3;
  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)DOCSmartFolderDatabase;
    v6 = -[DOCSmartFolderDatabase init](&v18, sel_init);
    if (v6)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = dispatch_queue_create("com.apple.DocumentManager.DOCSmartFolderManager.workingQueue", v8);
      workingQueue = v6->_workingQueue;
      v6->_workingQueue = (OS_dispatch_queue *)v9;

      v11 = dispatch_time(0, 10000000000);
      v12 = v6->_workingQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__DOCSmartFolderDatabase_initWithURL___block_invoke;
      block[3] = &unk_24C0F0C70;
      v13 = v6;
      v17 = v13;
      dispatch_after(v11, v12, block);
      objc_storeStrong(v13 + 1, a3);

    }
    self = v6;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __38__DOCSmartFolderDatabase_initWithURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "purgeOldEntries");
}

- (void)registerFilenameHit:(id)a3 fileTypeHit:(id)a4 smartScoreBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *workingQueue;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  SEL v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "type"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCSmartFolderDatabase.m"), 248, CFSTR("bad type for file name hit"));

  }
  if (objc_msgSend(v10, "type") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCSmartFolderDatabase.m"), 249, CFSTR("bad type for file type hit"));

  }
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__DOCSmartFolderDatabase_registerFilenameHit_fileTypeHit_smartScoreBlock___block_invoke;
  block[3] = &unk_24C0F16C0;
  v21 = v11;
  v22 = a2;
  block[4] = self;
  v19 = v9;
  v20 = v10;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  dispatch_async(workingQueue, block);

}

void __74__DOCSmartFolderDatabase_registerFilenameHit_fileTypeHit_smartScoreBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject **v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_existingFileNameHitsSimilarToHit:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v4)
      goto LABEL_14;
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v23;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v11 = (*(double (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        if (v11 > v8)
        {
          v12 = v11;
          if (v11 > 0.6)
          {
            v13 = v10;

            v8 = v12;
            v6 = v13;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "lastUsedDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateFrecencyAtDate:", v14);

      objc_msgSend(*(id *)(a1 + 32), "_registerHit:", v6);
    }
    else
    {
LABEL_14:
      objc_msgSend(*(id *)(a1 + 32), "_registerHit:", *(_QWORD *)(a1 + 40));
      v6 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_existingFiletypeHitSimilarToHit:", *(_QWORD *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 48), "lastUsedDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateFrecencyAtDate:", v16);

      v17 = *(void **)(a1 + 32);
      v18 = v15;
    }
    else
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(void **)(a1 + 48);
    }
    objc_msgSend(v17, "_registerHit:", v18);

    goto LABEL_25;
  }
  v19 = (NSObject **)MEMORY[0x24BE2DFD0];
  v20 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v20 = *v19;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __74__DOCSmartFolderDatabase_registerFilenameHit_fileTypeHit_smartScoreBlock___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("DOCSmartFolderDatabase.m"), 255, CFSTR("nil db connection"));
LABEL_25:

  }
}

- (void)_registerHit:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  NSObject **v14;
  NSObject *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 1)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "folderItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastUsedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frecency");
    v13 = v12;
    objc_msgSend(v4, "rowId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCSmartFolderDatabase _registerSavingFileType:inFolder:atDate:withFrecencyScore:rowId:](self, "_registerSavingFileType:inFolder:atDate:withFrecencyScore:rowId:", v6, v7, v8, v11, v13);
    goto LABEL_5;
  }
  if (!v5)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "folderItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastUsedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frecency");
    v10 = v9;
    objc_msgSend(v4, "rowId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCSmartFolderDatabase _registerSavingFile:inFolder:atDate:withFrecencyScore:rowId:](self, "_registerSavingFile:inFolder:atDate:withFrecencyScore:rowId:", v6, v7, v8, v11, v10);
LABEL_5:

    goto LABEL_10;
  }
  v14 = (NSObject **)MEMORY[0x24BE2DFD0];
  v15 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[DOCSmartFolderDatabase _registerHit:].cold.1();
LABEL_10:

}

- (id)_existingFileNameHitsSimilarToHit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  DOCSmartFolderHit *v21;
  NSObject *v22;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[DOCSmartFolderDatabase connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  objc_msgSend(v4, "folderItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT rowid, fp_folder_id, fp_folder_item, file_name, last_hit_date, frecency_at_last_hit_date FROM filenames WHERE fp_folder_id = %@ ORDER BY last_hit_date DESC LIMIT 500"), v7);

  if (objc_msgSend(v8, "next"))
  {
    do
    {
      v9 = (void *)MEMORY[0x20BD0CD4C]();
      objc_msgSend(v8, "numberAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringAtIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dataAtIndex:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringAtIndex:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateAtIndex:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleAtIndex:", 5);
      v16 = v15;
      v17 = (void *)MEMORY[0x24BDD1620];
      v18 = objc_msgSend(MEMORY[0x24BDC82D8], "classForKeyedUnarchiver");
      v26 = 0;
      objc_msgSend(v17, "unarchivedObjectOfClass:fromData:error:", v18, v12, &v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v26;
      if (v20 || !v19)
      {
        v22 = *MEMORY[0x24BE2DFD0];
        if (!*MEMORY[0x24BE2DFD0])
        {
          DOCInitLogging();
          v22 = *MEMORY[0x24BE2DFD0];
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v20;
          _os_log_error_impl(&dword_209052000, v22, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
        }
      }
      else
      {
        v21 = -[DOCSmartFolderHit initWithRowId:folder:type:value:lastUsedDate:frecency:]([DOCSmartFolderHit alloc], "initWithRowId:folder:type:value:lastUsedDate:frecency:", v10, v19, 0, v13, v14, v16);
        objc_msgSend(v25, "addObject:", v21);

      }
      objc_autoreleasePoolPop(v9);
    }
    while ((objc_msgSend(v8, "next") & 1) != 0);
  }

  return v25;
}

- (id)previousHits
{
  NSObject *workingQueue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__DOCSmartFolderDatabase_previousHits__block_invoke;
  block[3] = &unk_24C0F16E8;
  block[5] = &v8;
  block[6] = a2;
  block[4] = self;
  dispatch_sync(workingQueue, block);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __38__DOCSmartFolderDatabase_previousHits__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  DOCSmartFolderHit *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  DOCSmartFolderHit *v34;
  NSObject *v35;
  NSObject **v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v43 = a1;
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT rowid, fp_folder_id, fp_folder_item, file_name, last_hit_date, frecency_at_last_hit_date FROM filenames ORDER BY last_hit_date DESC LIMIT 500"));

    if (objc_msgSend(v4, "next"))
    {
      *(_QWORD *)&v5 = 138412290;
      v42 = v5;
      do
      {
        v6 = (void *)MEMORY[0x20BD0CD4C]();
        objc_msgSend(v4, "numberAtIndex:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringAtIndex:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dataAtIndex:", 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringAtIndex:", 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dateAtIndex:", 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "doubleAtIndex:", 5);
        v13 = v12;
        v14 = (void *)MEMORY[0x24BDD1620];
        v15 = objc_msgSend(MEMORY[0x24BDC82D8], "classForKeyedUnarchiver");
        v45 = 0;
        objc_msgSend(v14, "unarchivedObjectOfClass:fromData:error:", v15, v9, &v45);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v45;
        if (v17 || !v16)
        {
          v19 = *MEMORY[0x24BE2DFD0];
          if (!*MEMORY[0x24BE2DFD0])
          {
            DOCInitLogging();
            v19 = *MEMORY[0x24BE2DFD0];
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            v47 = v17;
            _os_log_error_impl(&dword_209052000, v19, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
          }
        }
        else
        {
          v18 = -[DOCSmartFolderHit initWithRowId:folder:type:value:lastUsedDate:frecency:]([DOCSmartFolderHit alloc], "initWithRowId:folder:type:value:lastUsedDate:frecency:", v7, v16, 0, v10, v11, v13);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v43 + 40) + 8) + 40), "addObject:", v18);

        }
        objc_autoreleasePoolPop(v6);
      }
      while ((objc_msgSend(v4, "next") & 1) != 0);
    }
    objc_msgSend(*(id *)(v43 + 32), "connection", v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "fetch:", CFSTR("SELECT rowid, fp_folder_id, fp_folder_item, file_type, last_hit_date, frecency_at_last_hit_date FROM filetypes ORDER BY last_hit_date DESC LIMIT 500"));

    if (objc_msgSend(v21, "next"))
    {
      do
      {
        v22 = (void *)MEMORY[0x20BD0CD4C]();
        objc_msgSend(v21, "numberAtIndex:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringAtIndex:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dataAtIndex:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringAtIndex:", 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dateAtIndex:", 4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleAtIndex:", 5);
        v29 = v28;
        v30 = (void *)MEMORY[0x24BDD1620];
        v31 = objc_msgSend(MEMORY[0x24BDC82D8], "classForKeyedUnarchiver");
        v44 = 0;
        objc_msgSend(v30, "unarchivedObjectOfClass:fromData:error:", v31, v25, &v44);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v44;
        if (v33 || !v32)
        {
          v35 = *MEMORY[0x24BE2DFD0];
          if (!*MEMORY[0x24BE2DFD0])
          {
            DOCInitLogging();
            v35 = *MEMORY[0x24BE2DFD0];
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v33;
            _os_log_error_impl(&dword_209052000, v35, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
          }
        }
        else
        {
          v34 = -[DOCSmartFolderHit initWithRowId:folder:type:value:lastUsedDate:frecency:]([DOCSmartFolderHit alloc], "initWithRowId:folder:type:value:lastUsedDate:frecency:", v23, v32, 1, v26, v27, v29);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v43 + 40) + 8) + 40), "addObject:", v34);

        }
        objc_autoreleasePoolPop(v22);
      }
      while ((objc_msgSend(v21, "next") & 1) != 0);
    }
  }
  else
  {
    v36 = (NSObject **)MEMORY[0x24BE2DFD0];
    v37 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v37 = *v36;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      __38__DOCSmartFolderDatabase_previousHits__block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("DOCSmartFolderDatabase.m"), 346, CFSTR("nil db connection"));

    }
    v39 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v40 + 40);
    *(_QWORD *)(v40 + 40) = v39;
  }

}

- (void)registerEvent:(id)a3
{
  id v5;
  NSObject *workingQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__DOCSmartFolderDatabase_registerEvent___block_invoke;
  block[3] = &unk_24C0F1710;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(workingQueue, block);

}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject **v19;
  NSObject *v20;
  NSObject **v21;
  NSObject *v22;
  void *v23;
  NSObject **v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject **v30;
  NSObject *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_existingEventSimilarToEvent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "lastUsedDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateFrecencyAtDate:", v6);

      v7 = v5;
      v4 = v7;
    }
    v8 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v4, "folderItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v36);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v36;

    if (v11 || !v10)
    {
      v24 = (NSObject **)MEMORY[0x24BE2DFD0];
      v25 = *MEMORY[0x24BE2DFD0];
      if (!*MEMORY[0x24BE2DFD0])
      {
        DOCInitLogging();
        v25 = *v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_2(v25, v4);
      goto LABEL_27;
    }
    objc_msgSend(v4, "rowId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*v2, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v4, "lastUsedDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "frecency");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rowId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v13, "execute:", CFSTR("UPDATE hotfolders SET last_hit_date = %@, frecency_at_last_hit_date = %@ WHERE rowid = %@"), v14, v16, v17);

      if (v18)
      {
LABEL_8:
        v19 = (NSObject **)MEMORY[0x24BE2DFD0];
        v20 = *MEMORY[0x24BE2DFD0];
        if (!*MEMORY[0x24BE2DFD0])
        {
          DOCInitLogging();
          v20 = *v19;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_3(v20, v4);
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      objc_msgSend(v4, "appBundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "folderItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "itemIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "type"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastUsedDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "frecency");
      objc_msgSend(v28, "numberWithDouble:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v13, "execute:", CFSTR("INSERT INTO hotfolders(app_bundle_id, fp_folder_id, fp_folder_item, event_type, last_hit_date, frecency_at_last_hit_date) VALUES (%@, %@, %@, %@, %@, %@)"), v35, v33, v10, v26, v27, v29);

      if ((v32 & 1) != 0)
        goto LABEL_8;
    }
    v30 = (NSObject **)MEMORY[0x24BE2DFD0];
    v31 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v31 = *v30;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_4(v31, v4, (uint64_t)v2);
    goto LABEL_27;
  }
  v21 = (NSObject **)MEMORY[0x24BE2DFD0];
  v22 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v22 = *v21;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_1(a1, v22);
  objc_msgSend(*v2, "connection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("DOCSmartFolderDatabase.m"), 409, CFSTR("nil db connection"));
LABEL_28:

  }
}

- (id)_existingEventSimilarToEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  BOOL v23;
  BOOL v24;
  NSObject *v25;
  DOCHotFolderEvent *v26;
  void *v28;
  DOCHotFolderEvent *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  -[DOCSmartFolderDatabase connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT rowid, app_bundle_id, fp_folder_item, event_type, last_hit_date, frecency_at_last_hit_date FROM hotfolders WHERE app_bundle_id = %@ AND fp_folder_id = %@ AND event_type = %@ ORDER BY last_hit_date DESC LIMIT 500;"),
                  v6,
                  v8,
                  v9);

  v29 = 0;
  do
  {
    if (!objc_msgSend(v10, "next"))
      break;
    v11 = (void *)MEMORY[0x20BD0CD4C]();
    objc_msgSend(v10, "numberAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringAtIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataAtIndex:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "unsignedIntegerAtIndex:", 3);
    objc_msgSend(v10, "dateAtIndex:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleAtIndex:", 5);
    v18 = v17;
    v19 = (void *)MEMORY[0x24BDD1620];
    v20 = objc_msgSend(MEMORY[0x24BDC82D8], "classForKeyedUnarchiver");
    v30 = 0;
    objc_msgSend(v19, "unarchivedObjectOfClass:fromData:error:", v20, v14, &v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v30;
    v23 = v22 || v21 == 0;
    v24 = v23;
    if (v23)
    {
      v25 = *MEMORY[0x24BE2DFD0];
      if (!*MEMORY[0x24BE2DFD0])
      {
        DOCInitLogging();
        v25 = *MEMORY[0x24BE2DFD0];
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v22;
        _os_log_error_impl(&dword_209052000, v25, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
      }
    }
    else
    {
      v26 = -[DOCHotFolderEvent initWithRowId:appBundleIdentifier:folderItem:type:lastUsedDate:frecency:]([DOCHotFolderEvent alloc], "initWithRowId:appBundleIdentifier:folderItem:type:lastUsedDate:frecency:", v12, v13, v21, v15, v16, v18);

      v29 = v26;
    }

    objc_autoreleasePoolPop(v11);
  }
  while (v24);

  return v29;
}

- (id)previousEventsForAppBundleIdentifier:(id)a3 excluding:(id)a4
{
  id v7;
  id v8;
  NSObject *workingQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  SEL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__DOCSmartFolderDatabase_previousEventsForAppBundleIdentifier_excluding___block_invoke;
  block[3] = &unk_24C0F1738;
  v17 = &v19;
  v18 = a2;
  block[4] = self;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_sync(workingQueue, block);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __73__DOCSmartFolderDatabase_previousEventsForAppBundleIdentifier_excluding___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject **v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  DOCHotFolderEvent *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      v6 = objc_msgSend(v4, "fetch:", CFSTR("SELECT rowid, app_bundle_id, fp_folder_item, event_type, last_hit_date, frecency_at_last_hit_date FROM hotfolders WHERE app_bundle_id = %@ AND fp_folder_id <> %@ ORDER BY last_hit_date DESC LIMIT 500;"),
             *(_QWORD *)(a1 + 48),
             *(_QWORD *)(a1 + 40));
    else
      v6 = objc_msgSend(v4, "fetch:", CFSTR("SELECT rowid, app_bundle_id, fp_folder_item, event_type, last_hit_date, frecency_at_last_hit_date FROM hotfolders WHERE app_bundle_id = %@ ORDER BY last_hit_date DESC LIMIT 500;"),
             *(_QWORD *)(a1 + 48),
             v28);
    v12 = (void *)v6;

    if (objc_msgSend(v12, "next"))
    {
      do
      {
        v13 = (void *)MEMORY[0x20BD0CD4C]();
        objc_msgSend(v12, "numberAtIndex:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringAtIndex:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataAtIndex:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v12, "unsignedIntegerAtIndex:", 3);
        objc_msgSend(v12, "dateAtIndex:", 4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleAtIndex:", 5);
        v20 = v19;
        v21 = (void *)MEMORY[0x24BDD1620];
        v22 = objc_msgSend(MEMORY[0x24BDC82D8], "classForKeyedUnarchiver");
        v29 = 0;
        objc_msgSend(v21, "unarchivedObjectOfClass:fromData:error:", v22, v16, &v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v29;
        if (v24 || !v23)
        {
          v26 = *MEMORY[0x24BE2DFD0];
          if (!*MEMORY[0x24BE2DFD0])
          {
            DOCInitLogging();
            v26 = *MEMORY[0x24BE2DFD0];
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v24;
            _os_log_error_impl(&dword_209052000, v26, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
          }
        }
        else
        {
          v25 = -[DOCHotFolderEvent initWithRowId:appBundleIdentifier:folderItem:type:lastUsedDate:frecency:]([DOCHotFolderEvent alloc], "initWithRowId:appBundleIdentifier:folderItem:type:lastUsedDate:frecency:", v14, *(_QWORD *)(a1 + 48), v23, v17, v18, v20);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v25);

        }
        objc_autoreleasePoolPop(v13);
      }
      while ((objc_msgSend(v12, "next") & 1) != 0);
    }
  }
  else
  {
    v7 = (NSObject **)MEMORY[0x24BE2DFD0];
    v8 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__DOCSmartFolderDatabase_previousEventsForAppBundleIdentifier_excluding___block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("DOCSmartFolderDatabase.m"), 481, CFSTR("nil db connection"));

    }
    v10 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

}

- (void)deleteFolderWithIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  NSObject *workingQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  workingQueue = self->_workingQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke;
  v12[3] = &unk_24C0F1760;
  v12[4] = self;
  v13 = v8;
  v14 = v7;
  v15 = a2;
  v10 = v7;
  v11 = v8;
  dispatch_async(workingQueue, v12);

}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  NSObject **v8;
  NSObject *v9;
  NSObject **v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v5 = (_QWORD *)(a1 + 48);
    v7 = objc_msgSend(v4, "execute:", CFSTR("DELETE FROM hotfolders WHERE app_bundle_id = %@ AND fp_folder_id = %@"), *(v5 - 1), v6);

    v8 = (NSObject **)MEMORY[0x24BE2DFD0];
    v9 = *MEMORY[0x24BE2DFD0];
    if (v7)
    {
      if (!v9)
      {
        DOCInitLogging();
        v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_6();
    }
    else
    {
      if (!v9)
      {
        DOCInitLogging();
        v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v20 = *(v5 - 1);
        v21 = *v5;
        v22 = *v2;
        v23 = v9;
        objc_msgSend(v22, "connection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastError");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v20;
        v28 = 2112;
        v29 = v21;
        v30 = 2112;
        v31 = v25;
        _os_log_error_impl(&dword_209052000, v23, OS_LOG_TYPE_ERROR, "Could not delete hotfolders events for app %@ into folderID %@ : %@.", buf, 0x20u);

      }
    }
    objc_msgSend(*v2, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "execute:", CFSTR("DELETE FROM filenames WHERE fp_folder_id = %@"), *v5);

    v16 = *v8;
    if (v15)
    {
      if (!v16)
      {
        DOCInitLogging();
        v16 = *v8;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_4();
    }
    else
    {
      if (!v16)
      {
        DOCInitLogging();
        v16 = *v8;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_5((uint64_t)v5, (uint64_t)v2, v16);
    }
    objc_msgSend(*v2, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "execute:", CFSTR("DELETE FROM filetypes WHERE fp_folder_id = %@"), *v5);

    v19 = *v8;
    if (v18)
    {
      if (!v19)
      {
        DOCInitLogging();
        v19 = *v8;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_2();
    }
    else
    {
      if (!v19)
      {
        DOCInitLogging();
        v19 = *v8;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_3((uint64_t)v5, (uint64_t)v2, v19);
    }
  }
  else
  {
    v10 = (NSObject **)MEMORY[0x24BE2DFD0];
    v11 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_1();
    objc_msgSend(*v2, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("DOCSmartFolderDatabase.m"), 526, CFSTR("nil db connection"));

    }
  }
}

- (void)purgeOldEntries
{
  NSObject *workingQueue;
  _QWORD v3[6];

  workingQueue = self->_workingQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke;
  v3[3] = &unk_24C0F1788;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(workingQueue, v3);
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject **v7;
  NSObject *v8;
  NSObject **v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -7890000.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "execute:", CFSTR("DELETE FROM hotfolders WHERE last_hit_date < %@"), v4);

    v7 = (NSObject **)MEMORY[0x24BE2DFD0];
    v8 = *MEMORY[0x24BE2DFD0];
    if (v6)
    {
      if (!v8)
      {
        DOCInitLogging();
        v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_6();
    }
    else
    {
      if (!v8)
      {
        DOCInitLogging();
        v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_7((uint64_t)v2, v8);
    }
    objc_msgSend(*v2, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "execute:", CFSTR("DELETE FROM filenames WHERE last_hit_date < %@"), v4);

    v14 = *v7;
    if (v13)
    {
      if (!v14)
      {
        DOCInitLogging();
        v14 = *v7;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_4();
    }
    else
    {
      if (!v14)
      {
        DOCInitLogging();
        v14 = *v7;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_5((uint64_t)v2, v14);
    }
    objc_msgSend(*v2, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "execute:", CFSTR("DELETE FROM filetypes WHERE last_hit_date < %@"), v4);

    v17 = *v7;
    if (v16)
    {
      if (!v17)
      {
        DOCInitLogging();
        v17 = *v7;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_2();
    }
    else
    {
      if (!v17)
      {
        DOCInitLogging();
        v17 = *v7;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_3((uint64_t)v2, v17);
    }
    goto LABEL_35;
  }
  v9 = (NSObject **)MEMORY[0x24BE2DFD0];
  v10 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_1();
  objc_msgSend(*v2, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("DOCSmartFolderDatabase.m"), 560, CFSTR("nil db connection"));
LABEL_35:

  }
}

- (void)_registerSavingFile:(id)a3 inFolder:(id)a4 atDate:(id)a5 withFrecencyScore:(double)a6 rowId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  NSObject **v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject **v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject **v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  v39 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v39);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v39;
  if (v17 || !v16)
  {
    v26 = (NSObject **)MEMORY[0x24BE2DFD0];
    v27 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _registerSavingFile:inFolder:atDate:withFrecencyScore:rowId:].cold.1(v27, v13);
  }
  else
  {
    v38 = v12;
    -[DOCSmartFolderDatabase connection](self, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "execute:", CFSTR("UPDATE filenames SET last_hit_date = %@, frecency_at_last_hit_date = %@ WHERE rowid = %@"), v14, v19, v15);

      if (v20)
      {
LABEL_5:
        v21 = (NSObject **)MEMORY[0x24BE2DFD0];
        v22 = *MEMORY[0x24BE2DFD0];
        if (!*MEMORY[0x24BE2DFD0])
        {
          DOCInitLogging();
          v22 = *v21;
        }
        v12 = v38;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v23 = v22;
          objc_msgSend(v13, "itemIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v41 = v38;
          v42 = 2112;
          v43 = v24;
          v44 = 2112;
          v45 = v14;
          v46 = 2112;
          v47 = v25;
          _os_log_debug_impl(&dword_209052000, v23, OS_LOG_TYPE_DEBUG, "Successfully registered saving %@ into folderID %@ at date %@ with frecencyScore %@.", buf, 0x2Au);

        }
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(v13, "itemIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v18, "execute:", CFSTR("INSERT INTO filenames(fp_folder_id, fp_folder_item, file_name, last_hit_date, frecency_at_last_hit_date) VALUES (%@, %@, %@, %@, %@)"), v28, v16, v38, v14, v29);

      if ((v30 & 1) != 0)
        goto LABEL_5;
    }
    v31 = (NSObject **)MEMORY[0x24BE2DFD0];
    v32 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v32 = *v31;
    }
    v12 = v38;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = v32;
      objc_msgSend(v13, "itemIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCSmartFolderDatabase connection](self, "connection");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastError");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v41 = v38;
      v42 = 2112;
      v43 = v34;
      v44 = 2112;
      v45 = v14;
      v46 = 2112;
      v47 = v35;
      v48 = 2112;
      v49 = v37;
      _os_log_error_impl(&dword_209052000, v33, OS_LOG_TYPE_ERROR, "Could not register saving %@ into folderID %@ at date %@ with frecencyScore %@: %@.", buf, 0x34u);

      v12 = v38;
    }
  }
LABEL_18:

}

- (void)_registerSavingFileType:(id)a3 inFolder:(id)a4 atDate:(id)a5 withFrecencyScore:(double)a6 rowId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  NSObject **v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject **v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject **v32;
  NSObject *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v34 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v34;
  if (v17)
    v18 = 1;
  else
    v18 = v16 == 0;
  if (v18)
  {
    v19 = (NSObject **)MEMORY[0x24BE2DFD0];
    v20 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _registerSavingFile:inFolder:atDate:withFrecencyScore:rowId:].cold.1(v20, v13);
    goto LABEL_20;
  }
  -[DOCSmartFolderDatabase connection](self, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "execute:", CFSTR("UPDATE filetypes SET last_hit_date = %@, frecency_at_last_hit_date = %@ WHERE rowid = %@"), v14, v22, v15);

    if (v23)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(v13, "itemIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v21, "execute:", CFSTR("INSERT INTO filetypes(fp_folder_id, fp_folder_item, file_type, last_hit_date, frecency_at_last_hit_date) VALUES (%@, %@, %@, %@, %@)"), v29, v16, v12, v14, v30);

    if ((v31 & 1) != 0)
    {
LABEL_12:
      v24 = (NSObject **)MEMORY[0x24BE2DFD0];
      v25 = *MEMORY[0x24BE2DFD0];
      if (!*MEMORY[0x24BE2DFD0])
      {
        DOCInitLogging();
        v25 = *v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = v25;
        objc_msgSend(v13, "itemIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v36 = v12;
        v37 = 2112;
        v38 = v27;
        v39 = 2112;
        v40 = v14;
        v41 = 2112;
        v42 = v28;
        _os_log_debug_impl(&dword_209052000, v26, OS_LOG_TYPE_DEBUG, "Successfully registered saving %@ into folderID %@ at date %@ with frecencyScore %@.", buf, 0x2Au);
LABEL_22:

        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  v32 = (NSObject **)MEMORY[0x24BE2DFD0];
  v33 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v33 = *v32;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v26 = v33;
    objc_msgSend(v13, "itemIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v36 = v12;
    v37 = 2112;
    v38 = v27;
    v39 = 2112;
    v40 = v14;
    v41 = 2112;
    v42 = v28;
    _os_log_error_impl(&dword_209052000, v26, OS_LOG_TYPE_ERROR, "Could not register saving %@ into folderID %@ at date %@ with frecencyScore %@.", buf, 0x2Au);
    goto LABEL_22;
  }
LABEL_20:

}

- (id)_existingFiletypeHitSimilarToHit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  BOOL v21;
  BOOL v22;
  NSObject *v23;
  DOCSmartFolderHit *v24;
  void *v26;
  DOCSmartFolderHit *v27;
  void *context;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DOCSmartFolderDatabase connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT rowid, fp_folder_id, fp_folder_item, file_type, last_hit_date, frecency_at_last_hit_date FROM filetypes WHERE fp_folder_id = %@ AND file_type = %@ ORDER BY last_hit_date DESC LIMIT 500"), v7, v8);

  v27 = 0;
  do
  {
    if (!objc_msgSend(v9, "next"))
      break;
    context = (void *)MEMORY[0x20BD0CD4C]();
    objc_msgSend(v9, "numberAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringAtIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataAtIndex:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringAtIndex:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateAtIndex:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleAtIndex:", 5);
    v16 = v15;
    v17 = (void *)MEMORY[0x24BDD1620];
    v18 = objc_msgSend(MEMORY[0x24BDC82D8], "classForKeyedUnarchiver");
    v29 = 0;
    objc_msgSend(v17, "unarchivedObjectOfClass:fromData:error:", v18, v12, &v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v29;
    v21 = v20 || v19 == 0;
    v22 = v21;
    if (v21)
    {
      v23 = *MEMORY[0x24BE2DFD0];
      if (!*MEMORY[0x24BE2DFD0])
      {
        DOCInitLogging();
        v23 = *MEMORY[0x24BE2DFD0];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_error_impl(&dword_209052000, v23, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
      }
    }
    else
    {
      v24 = -[DOCSmartFolderHit initWithRowId:folder:type:value:lastUsedDate:frecency:]([DOCSmartFolderHit alloc], "initWithRowId:folder:type:value:lastUsedDate:frecency:", v10, v19, 1, v13, v14, v16);

      v27 = v24;
    }

    objc_autoreleasePoolPop(context);
  }
  while (v22);

  return v27;
}

- (void)open
{
  NSObject *workingQueue;
  _QWORD block[5];

  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__DOCSmartFolderDatabase_open__block_invoke;
  block[3] = &unk_24C0F0C70;
  block[4] = self;
  dispatch_async(workingQueue, block);
}

void __30__DOCSmartFolderDatabase_open__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  NSObject **v4;
  NSObject *v5;
  void *v6;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[2])
  {
    v4 = (NSObject **)MEMORY[0x24BE2DFD0];
    v5 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __30__DOCSmartFolderDatabase_open__block_invoke_cold_1();
    v3 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v3, "_openConnectionToDatabaseAtURL:", v3[1]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v6);

  objc_sync_exit(v2);
}

- (id)_openConnectionToDatabaseAtURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject **v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  id v24;
  NSObject **v25;
  NSObject *v26;
  NSObject **v27;
  NSObject *v28;
  NSObject **v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  id v39;
  uint8_t buf[8];
  id v41;
  id v42;
  id v43;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  v43 = 0;
  -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:](self, "_createDatabaseIfNeededAtURL:error:", v4, &v43);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v43;
  if (!v5)
  {
    v7 = (NSObject **)MEMORY[0x24BE2DFD0];
    v8 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.7();
    v9 = objc_msgSend(v6, "code");
    if (v9 > 0x1A || ((1 << v9) & 0x5000800) == 0)
      goto LABEL_42;
    v10 = *v7;
    if (!*v7)
    {
      DOCInitLogging();
      v10 = *v7;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.6();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v11, "removeItemAtURL:error:", v4, &v42);
    v12 = v42;

    if (v12)
    {
      v13 = *v7;
      if (!*v7)
      {
        DOCInitLogging();
        v13 = *v7;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.5();
    }
    v41 = v6;
    -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:](self, "_createDatabaseIfNeededAtURL:error:", v4, &v41);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v41;

    v6 = v14;
    if (!v5)
    {
LABEL_42:
      v31 = *v7;
      if (!*v7)
      {
        DOCInitLogging();
        v31 = *v7;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.1();
      goto LABEL_51;
    }
  }
  objc_msgSend(v5, "userVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  if (v16 == 5)
  {
    v17 = v6;
  }
  else
  {
    objc_msgSend(v5, "close:", 0);
    v18 = (NSObject **)MEMORY[0x24BE2DFD0];
    v19 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209052000, v19, OS_LOG_TYPE_INFO, "Database changed during development, nuking it", buf, 2u);
    }
    if (unlink(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation")) < 0)
    {
      v32 = *v18;
      if (!*v18)
      {
        DOCInitLogging();
        v32 = *v18;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.4((uint64_t)self, v32);

      goto LABEL_51;
    }
    v39 = v6;
    -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:](self, "_createDatabaseIfNeededAtURL:error:", v4, &v39);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v39;

    if (!v20)
    {
      v21 = 0;
      v6 = v17;
      goto LABEL_52;
    }
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __57__DOCSmartFolderDatabase__openConnectionToDatabaseAtURL___block_invoke;
    v36[3] = &unk_24C0F17B0;
    v5 = v20;
    v37 = v5;
    v38 = v16;
    objc_msgSend(v5, "performWithFlags:action:", 10, v36);

  }
  v35 = v17;
  -[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:](self, "_setupDatabaseTablesIfNeeded:error:", v5, &v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v35;

  if (!v21)
  {
    v29 = (NSObject **)MEMORY[0x24BE2DFD0];
    v30 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v30 = *v29;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.2();
LABEL_51:
    v21 = 0;
    goto LABEL_52;
  }
  -[DOCSmartFolderDatabase _setUpDatabaseWatcher:](self, "_setUpDatabaseWatcher:", v21);
  v22 = *MEMORY[0x24BDBCC68];
  v34 = v6;
  v23 = objc_msgSend(v4, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v22, &v34);
  v24 = v34;

  if ((v23 & 1) == 0)
  {
    v25 = (NSObject **)MEMORY[0x24BE2DFD0];
    v26 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v26 = *v25;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.3();
  }
  v27 = (NSObject **)MEMORY[0x24BE2DFD0];
  v28 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v28 = *v27;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209052000, v28, OS_LOG_TYPE_INFO, "SmartFolder Database opened and upgraded", buf, 2u);
  }
  v6 = v24;
LABEL_52:

  return v21;
}

uint64_t __57__DOCSmartFolderDatabase__openConnectionToDatabaseAtURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject **v5;
  NSObject *v6;
  id v8;

  v2 = *(void **)(a1 + 32);
  v8 = 0;
  v3 = doc_smartfolder_create_tables_initial(v2, &v8);
  v4 = v8;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setUserVersion:", 5);
  }
  else
  {
    v5 = (NSObject **)MEMORY[0x24BE2DFD0];
    v6 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __57__DOCSmartFolderDatabase__openConnectionToDatabaseAtURL___block_invoke_cold_1(a1, v6);
  }

  return v3;
}

- (id)_createDatabaseIfNeededAtURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  void *v15;
  NSObject *v16;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  id *v24;
  _QWORD v25[6];
  _QWORD v26[4];

  v6 = a3;
  v7 = (NSObject **)MEMORY[0x24BE2DFD0];
  v8 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:].cold.4();
  if ((objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
LABEL_9:
    v12 = objc_alloc_init(MEMORY[0x24BEDD630]);
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0;
    v13 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke;
    v25[3] = &unk_24C0F17D8;
    v25[4] = self;
    v25[5] = v26;
    objc_msgSend(v12, "setSqliteErrorHandler:", v25);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2;
    v21[3] = &unk_24C0F16E8;
    v24 = a4;
    v9 = v12;
    v22 = v9;
    v23 = v26;
    v14 = (void (**)(_QWORD))MEMORY[0x20BD0CEF0](v21);
    objc_msgSend(v9, "setLabel:", CFSTR("SmartFolder Database"));
    if ((objc_msgSend(v9, "openAtURL:sharedCache:error:", v6, 0, a4) & 1) != 0)
    {
      if (objc_msgSend(v9, "setupPragmas"))
      {
        objc_msgSend(v9, "setSynchronousMode:", 1);
        objc_msgSend(v9, "lastError");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v20[0] = v13;
          v20[1] = 3221225472;
          v20[2] = __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_131;
          v20[3] = &unk_24C0F1800;
          v20[4] = self;
          objc_msgSend(v9, "setSqliteErrorHandler:", v20);
          v19 = *v7;
          if (!*v7)
          {
            DOCInitLogging();
            v19 = *v7;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:].cold.1();
          a4 = (id *)v9;
          goto LABEL_18;
        }
      }
      v14[2](v14);
    }
    else
    {
      v16 = *v7;
      if (!*v7)
      {
        DOCInitLogging();
        v16 = *v7;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:].cold.2();
    }
    objc_msgSend(v9, "close:", 0);
    a4 = 0;
LABEL_18:

    _Block_object_dispose(v26, 8);
    goto LABEL_19;
  }
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 0, 0, a4),
        v10,
        (v11 & 1) != 0))
  {

    goto LABEL_9;
  }
  if (a4)
  {
    v18 = *v7;
    if (!*v7)
    {
      DOCInitLogging();
      v18 = *v7;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:].cold.3();
    a4 = 0;
  }
LABEL_19:

  return a4;
}

void __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  uint64_t v9;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  objc_msgSend(v7, "logError:onDB:statement:", v8, a2, a3);
  v9 = objc_msgSend(v8, "code");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
}

void __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject **v9;
  NSObject *v10;
  id v11;

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastError");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      if (!objc_msgSend(v2, "code"))
      {
        v4 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v3, "domain");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        objc_msgSend(v3, "userInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, v6, v7);
        v8 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v8;
      }
    }
    else
    {
      v9 = (NSObject **)MEMORY[0x24BE2DFD0];
      v10 = *MEMORY[0x24BE2DFD0];
      if (!*MEMORY[0x24BE2DFD0])
      {
        DOCInitLogging();
        v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2_cold_1();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEDD658], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_retainAutorelease(v3);
    **(_QWORD **)(a1 + 48) = v11;

  }
}

uint64_t __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_131(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "logError:onDB:statement:", a4, a2, a3);
}

- (void)_setUpDatabaseWatcher:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *watcher;
  OS_dispatch_source *v8;
  id v9;
  const char *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  int v17;
  _QWORD handler[4];
  id v19;
  id v20;
  id location;
  _QWORD v22[5];
  _QWORD v23[6];

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  objc_msgSend(v5, "useSerialQueueWithTarget:", self->_workingQueue);
  objc_msgSend(v5, "useBatchingWithDelay:changeCount:", 500, 2.0);
  v6 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke;
  v23[3] = &unk_24C0F1828;
  v23[4] = self;
  v23[5] = a2;
  objc_msgSend(v5, "setWillBeginBatchingHook:", v23);
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_145;
  v22[3] = &unk_24C0F1850;
  v22[4] = self;
  objc_msgSend(v5, "setDidFinishBatchingHook:", v22);
  watcher = self->_watcher;
  if (watcher)
  {
    dispatch_source_cancel(watcher);
    v8 = self->_watcher;
    self->_watcher = 0;

  }
  objc_msgSend(v5, "url");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

  LODWORD(v9) = open(v10, 32772);
  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA28], (int)v9, 1uLL, 0);
  v12 = self->_watcher;
  self->_watcher = v11;

  objc_initWeak(&location, self);
  v13 = self->_watcher;
  handler[0] = v6;
  handler[1] = 3221225472;
  handler[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_146;
  handler[3] = &unk_24C0F1878;
  objc_copyWeak(&v20, &location);
  v19 = v5;
  v14 = v5;
  dispatch_source_set_event_handler(v13, handler);
  v15 = self->_watcher;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_2;
  v16[3] = &__block_descriptor_36_e5_v8__0l;
  v17 = (int)v9;
  dispatch_source_set_cancel_handler(v15, v16);
  dispatch_resume((dispatch_object_t)self->_watcher);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE2DFD0];
  v5 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_cold_2();
  objc_msgSend(*(id *)(a1 + 32), "processAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("DOCSmartFolderDatabase.m"), 850, CFSTR("Trying to acquire an assertion, but we already have one"));

  }
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskNow"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BE80B10]);
  objc_msgSend(MEMORY[0x24BE80D38], "currentProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithExplanation:target:attributes:", CFSTR("Finishing SQL Batch"), v9, v10);
  objc_msgSend(*(id *)(a1 + 32), "setProcessAssertion:", v11);

  objc_msgSend(*(id *)(a1 + 32), "processAssertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  LOBYTE(v10) = objc_msgSend(v12, "acquireWithError:", &v16);
  v13 = v16;

  if ((v10 & 1) == 0)
  {
    v14 = *v4;
    if (!*v4)
    {
      DOCInitLogging();
      v14 = *v4;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "setProcessAssertion:", 0);
  }

}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_145(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  void *v6;

  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE2DFD0];
  v5 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_145_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "processAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setProcessAssertion:", 0);
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_146(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v2 = (NSObject **)MEMORY[0x24BE2DFD0];
  v3 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_146_cold_1();
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_147;
    v7[3] = &unk_24C0F0648;
    v7[4] = WeakRetained;
    v8 = *(id *)(a1 + 32);
    dispatch_sync(v6, v7);

  }
}

uint64_t __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_147(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetDatabaseOnItsQueue:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (id)_setupDatabaseTablesIfNeeded:(id)a3 error:(id *)a4
{
  id v5;
  NSObject **v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  _QWORD v26[5];
  int v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (NSObject **)MEMORY[0x24BE2DFD0];
  v7 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:].cold.4();
  objc_msgSend(v5, "userVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "unsignedIntValue");
    if (v10)
    {
      v11 = v10;
      v12 = *v6;
      if (!*v6)
      {
        DOCInitLogging();
        v12 = *v6;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:].cold.3(v11, v12);
      v13 = 1;
    }
    else
    {
      v16 = *v6;
      if (!*v6)
      {
        DOCInitLogging();
        v16 = *v6;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        v29 = 0;
        v30 = 1024;
        v31 = 0;
        _os_log_debug_impl(&dword_209052000, v16, OS_LOG_TYPE_DEBUG, "Migrating Smart Folder Database from version %d to %d", buf, 0xEu);
      }
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __61__DOCSmartFolderDatabase__setupDatabaseTablesIfNeeded_error___block_invoke;
      v26[3] = &__block_descriptor_44_e23_B16__0__PQLConnection_8l;
      v27 = 0;
      v26[4] = a4;
      v13 = objc_msgSend(v5, "performWithFlags:action:", 10, v26);
      objc_msgSend(v5, "userVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntValue");

      if (v18 != 1)
      {
        v19 = *v6;
        if (!*v6)
        {
          DOCInitLogging();
          v19 = *v6;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = v19;
          objc_msgSend(v5, "userVersion");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "unsignedIntValue");
          *(_DWORD *)buf = 67109376;
          v29 = v22;
          v30 = 1024;
          v31 = 1;
          _os_log_impl(&dword_209052000, v20, OS_LOG_TYPE_INFO, "Database is at version %u instead of %d", buf, 0xEu);

        }
      }
    }
    objc_msgSend(v5, "userVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntValue");
    if (v13 && !v24)
      -[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:].cold.2();

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v5, "close:", 0);

      v5 = 0;
    }
    v5 = v5;
    v15 = v5;
  }
  else
  {
    if (a4)
    {
      objc_msgSend(v5, "lastError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      v14 = *v6;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:].cold.1(v14);
    objc_msgSend(v5, "close:", 0);
    v15 = 0;
  }

  return v15;
}

uint64_t __61__DOCSmartFolderDatabase__setupDatabaseTablesIfNeeded_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject **v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  v3 = doc_smartfolder_create_tables_initial(a2, &v8);
  v4 = v8;
  if ((v3 & 1) == 0)
  {
    v5 = (NSObject **)MEMORY[0x24BE2DFD0];
    v6 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__DOCSmartFolderDatabase__setupDatabaseTablesIfNeeded_error___block_invoke_cold_1((int *)(a1 + 40), (uint64_t)v4, v6);
    if (*(_QWORD *)(a1 + 32))
      **(_QWORD **)(a1 + 32) = objc_retainAutorelease(v4);
  }

  return v3;
}

- (void)_cleanUpAfterClose
{
  NSObject *watcher;
  OS_dispatch_source *v4;

  watcher = self->_watcher;
  if (watcher)
  {
    dispatch_source_cancel(watcher);
    v4 = self->_watcher;
    self->_watcher = 0;

  }
}

- (void)_closeDatabaseOnItsQueue:(id)a3
{
  PQLConnection *v4;
  char v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v9;

  v4 = (PQLConnection *)a3;
  v9 = 0;
  v5 = -[PQLConnection close:](v4, "close:", &v9);
  v6 = v9;
  if ((v5 & 1) == 0)
  {
    v7 = (NSObject **)MEMORY[0x24BE2DFD0];
    v8 = *MEMORY[0x24BE2DFD0];
    if (!*MEMORY[0x24BE2DFD0])
    {
      DOCInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _closeDatabaseOnItsQueue:].cold.1((uint64_t)v4);
  }
  if (self->_connection == v4)
  {
    self->_connection = 0;

  }
}

- (void)close
{
  NSObject *workingQueue;
  _QWORD block[5];

  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__DOCSmartFolderDatabase_close__block_invoke;
  block[3] = &unk_24C0F0C70;
  block[4] = self;
  dispatch_sync(workingQueue, block);
}

uint64_t __31__DOCSmartFolderDatabase_close__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_closeDatabaseOnItsQueue:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpAfterClose");
}

- (void)_resetDatabaseOnItsQueue:(id)a3
{
  id v4;
  DOCSmartFolderDatabase *v5;
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSURL *url;
  char v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (NSObject **)MEMORY[0x24BE2DFD0];
  v7 = *MEMORY[0x24BE2DFD0];
  if (!*MEMORY[0x24BE2DFD0])
  {
    DOCInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_209052000, v7, OS_LOG_TYPE_INFO, "%@: Resetting the SmartFolder Database", buf, 0xCu);
  }
  -[DOCSmartFolderDatabase _closeDatabaseOnItsQueue:](v5, "_closeDatabaseOnItsQueue:", v4);
  -[DOCSmartFolderDatabase _cleanUpAfterClose](v5, "_cleanUpAfterClose");
  v8 = *v6;
  if (!*v6)
  {
    DOCInitLogging();
    v8 = *v6;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DOCSmartFolderDatabase _resetDatabaseOnItsQueue:].cold.3();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  url = v5->_url;
  v16 = 0;
  v11 = objc_msgSend(v9, "removeItemAtURL:error:", url, &v16);
  v12 = v16;

  if ((v11 & 1) == 0)
  {
    v13 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      v13 = *v6;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase _resetDatabaseOnItsQueue:].cold.2();
  }
  v14 = *v6;
  if (!*v6)
  {
    DOCInitLogging();
    v14 = *v6;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[DOCSmartFolderDatabase _resetDatabaseOnItsQueue:].cold.1();
  -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:](v5, "_openConnectionToDatabaseAtURL:", v5->_url);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_storeStrong((id *)&v5->_connection, v15);

  objc_sync_exit(v5);
}

- (void)logError:(id)a3 onDB:(id)a4 statement:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject **v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (NSObject **)MEMORY[0x24BE2DFD0];
  v11 = *MEMORY[0x24BE2DFD0];
  if (v9)
  {
    if (!v11)
    {
      DOCInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_209052000, v11, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error [%@]", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    if (!v11)
    {
      DOCInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DOCSmartFolderDatabase logError:onDB:statement:].cold.1((uint64_t)v8);
  }

}

- (NSURL)url
{
  return self->_url;
}

- (PQLConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_source)watcher
{
  return self->_watcher;
}

- (void)setWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_watcher, a3);
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_processAssertion, a3);
}

- (OS_dispatch_queue)workingQueue
{
  return self->_workingQueue;
}

- (void)setWorkingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingQueue, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_watcher, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_209052000, v0, v1, "Init SmartFolder Database at : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __74__DOCSmartFolderDatabase_registerFilenameHit_fileTypeHit_smartScoreBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "Can't register filename save to DB because it's not open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_registerHit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "Trying to register unsupported hit type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __38__DOCSmartFolderDatabase_previousHits__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "Can't build hit list because DB is not open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "folderItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v2, v6, "Can't register hot folder event for folder %@.", v7);

  OUTLINED_FUNCTION_0_2();
}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_19(a1);
  objc_msgSend(a2, "folderItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v3, v6, "Can't archive folder (%@) to register hot folder event: %@.", v7);

  OUTLINED_FUNCTION_0_2();
}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_3(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint8_t v14[34];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "folderItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "lastUsedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "frecency");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  v15 = v9;
  v16 = v12;
  v17 = v13;
  _os_log_debug_impl(&dword_209052000, v4, OS_LOG_TYPE_DEBUG, "Successfully registered event (%@) for app %@ into folderID %@ at date %@ with frecencyScore %@.", v14, 0x34u);

}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_4(void *a1, void *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint8_t v17[34];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a1;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "appBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "folderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "lastUsedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "frecency");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)a3 + 16), "lastError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  v18 = v11;
  v19 = v15;
  v20 = v13;
  v21 = v15;
  v22 = v16;
  _os_log_error_impl(&dword_209052000, v6, OS_LOG_TYPE_ERROR, "Could not register event (%@) for app %@ into folderID %@ at date %@ with frecencyScore %@ : %@.", v17, 0x3Eu);

}

void __73__DOCSmartFolderDatabase_previousEventsForAppBundleIdentifier_excluding___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "Can't build hot folder list because DB is not open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v0, v1, "Can't delete hot folder for app %@ and folder %@.", v2);
  OUTLINED_FUNCTION_3();
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_209052000, v0, v1, "Successfully delete filetypes events for folderID %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_3(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  OUTLINED_FUNCTION_20(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v3, v6, "Could not delete filetypes events for folderID %@ : %@.", v7);

  OUTLINED_FUNCTION_0_2();
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_209052000, v0, v1, "Successfully delete filenames events for folderID %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_5(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  OUTLINED_FUNCTION_20(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v3, v6, "Could not delete filenames events for folderID %@ : %@.", v7);

  OUTLINED_FUNCTION_0_2();
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_6()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_18();
  _os_log_debug_impl(&dword_209052000, v0, OS_LOG_TYPE_DEBUG, "Successfully delete hotfolders events for app %@ into folderID %@.", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "Can't purge Hot/SmartFolders because connection is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_209052000, v0, v1, "Successfully delete filetypes events older than 3 months.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_3(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v2, v5, "Could not delete filetypes events older than 3 months: %@.", v6);

  OUTLINED_FUNCTION_0_2();
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_209052000, v0, v1, "Successfully delete filenames events older than 3 months.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_5(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v2, v5, "Could not delete filenames events older than 3 months: %@.", v6);

  OUTLINED_FUNCTION_0_2();
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_209052000, v0, v1, "Successfully delete hotfolders events older than 3 months.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_7(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v2, v5, "Could not delete hotfolders events older than 3 months: %@.", v6);

  OUTLINED_FUNCTION_0_2();
}

- (void)_registerSavingFile:(void *)a1 inFolder:(void *)a2 atDate:withFrecencyScore:rowId:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_19(a1);
  objc_msgSend(a2, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v3, v5, "Can't archive folder (%@) to register hit: %@.", v6);

  OUTLINED_FUNCTION_0_2();
}

void __30__DOCSmartFolderDatabase_open__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_209052000, v0, v1, "Database is already open", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_openConnectionToDatabaseAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v0, v1, "Could not create SmartFolder Database after resetting it. Error: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_openConnectionToDatabaseAtURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v0, v1, "Could not setup the tables of the SmartFolder Database. Error: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_openConnectionToDatabaseAtURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v0, v1, "Could not exclude the SmartFolder database URL from backups. Migrating this database to a different device via D2D might generate a lot of inode lookup errors! Error: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_openConnectionToDatabaseAtURL:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v2, v5, "Can't unlink '%@'", v6);

}

- (void)_openConnectionToDatabaseAtURL:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v0, v1, "Could not remove SmartFolder Database file. Error: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_openConnectionToDatabaseAtURL:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "Corrupt SmartFolder Database. Resetting the database and retrying.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_openConnectionToDatabaseAtURL:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v0, v1, "Could not open the SmartFolder Database. Error: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __57__DOCSmartFolderDatabase__openConnectionToDatabaseAtURL___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v4, v6, "Can't recreate tables after nuking version %@: %@", v7);

  OUTLINED_FUNCTION_0_2();
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_209052000, v0, v1, "Successfully opened SmartFolder Database %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_209052000, v0, v1, "Opening the SmartFolder Database failed with error: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_209052000, v0, v1, "Failed to create directory hierarchy with error: %@.", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_209052000, v0, v1, "Opening SmartFolder Database at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_209052000, v0, v1, "Prequelite failed, but did not indicate what the error was! Since we received error %lu before, using that.", v2);
  OUTLINED_FUNCTION_3();
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v0, v1, "Failed to acquire background assertion: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_209052000, v0, v1, "Batching starts, acquiring a task assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_145_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_209052000, v0, v1, "Batching ended, invalidating the task assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_146_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "Someone removed our database under our feet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setupDatabaseTablesIfNeeded:(void *)a1 error:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v1, v3, "Hit error %@, closing connection %@", v4);

  OUTLINED_FUNCTION_0_2();
}

- (void)_setupDatabaseTablesIfNeeded:error:.cold.2()
{
  __assert_rtn("-[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:]", "DOCSmartFolderDatabase.m", 993, "(connection.userVersion.unsignedIntValue >= DOCSmartFolderDatabaseVersionMax) || !result");
}

- (void)_setupDatabaseTablesIfNeeded:(int)a1 error:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109632;
  v2[1] = a1;
  v3 = 1024;
  v4 = 0;
  v5 = 1024;
  v6 = 1;
  _os_log_debug_impl(&dword_209052000, a2, OS_LOG_TYPE_DEBUG, "No database migration (db at version %d, migration range [%d,%d[)", (uint8_t *)v2, 0x14u);
  OUTLINED_FUNCTION_3();
}

- (void)_setupDatabaseTablesIfNeeded:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_209052000, v0, v1, "Upgrading SmartFolder Database %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61__DOCSmartFolderDatabase__setupDatabaseTablesIfNeeded_error___block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a1 + 1;
  v5[0] = 67109634;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_209052000, log, OS_LOG_TYPE_ERROR, "Can't migrate from version %d to %d: %@", (uint8_t *)v5, 0x18u);
  OUTLINED_FUNCTION_3();
}

- (void)_closeDatabaseOnItsQueue:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v1, (uint64_t)v1, "Could not close SmartFolder Database %@: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

- (void)_resetDatabaseOnItsQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_209052000, v0, v1, "%@: re-opening database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_resetDatabaseOnItsQueue:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  v2 = 138412546;
  v3 = v0;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v1, (uint64_t)v1, "Can't remove database at URL %@: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

- (void)_resetDatabaseOnItsQueue:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_209052000, v0, v1, "%@: Removing file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)logError:(uint64_t)a1 onDB:statement:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_5_0(&dword_209052000, v1, (uint64_t)v1, "Sqlite failed on %@ with error [%@]", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

@end
