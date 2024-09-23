@implementation LiveFSAppleDoubleManager

+ (id)AppleDoubleManagerForMount:(id)a3
{
  id v3;
  LiveFSAppleDoubleManager *v4;

  v3 = a3;
  v4 = -[LiveFSAppleDoubleManager initWithMount:]([LiveFSAppleDoubleManager alloc], "initWithMount:", v3);

  return v4;
}

- (LiveFSAppleDoubleManager)initWithMount:(id)a3
{
  id v4;
  LiveFSAppleDoubleManager *v5;
  uint64_t v6;
  id v7;
  dispatch_queue_t v8;
  NSObject *v9;
  uint64_t v10;
  NSMutableSet *ADActiveForBaseHandleSet;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LiveFSAppleDoubleManager;
  v5 = -[LiveFSAppleDoubleManager init](&v14, sel_init);
  if (v5)
  {
    v13 = 0;
    v6 = objc_msgSend(v4, "newConnectionIDOrError:", &v13);
    v7 = v13;
    -[LiveFSAppleDoubleManager setClientID:](v5, "setClientID:", v6);
    if (-[LiveFSAppleDoubleManager clientID](v5, "clientID"))
    {
      -[LiveFSAppleDoubleManager setMount:](v5, "setMount:", v4);
      v8 = dispatch_queue_create("com.apple.LiveFSAppleDoubleManager", 0);
      -[LiveFSAppleDoubleManager setQueue:](v5, "setQueue:", v8);

      -[LiveFSAppleDoubleManager queue](v5, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_activate(v9);

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v10 = objc_claimAutoreleasedReturnValue();
      ADActiveForBaseHandleSet = v5->_ADActiveForBaseHandleSet;
      v5->_ADActiveForBaseHandleSet = (NSMutableSet *)v10;

      pthread_rwlock_init(&v5->_ADActiveForBaseHandleSetRWLock, 0);
      pthread_mutex_init(&v5->_ADActiveForBaseHandleSetMutex, 0);
      pthread_cond_init(&v5->_ADActiveForBaseHandleSetCond, 0);
      v5->_ADAcctiveForBaseHandleSetWaiters = 0;
    }

  }
  return v5;
}

- (void)dealloc
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_22BD61000, v0, v1, "ADM:dealoc[%s]:start:[0x%llx]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_14();
}

- (id)AppleDoubleNameForFileNamed:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("._%@"), a3);
}

- (id)AppleDoubleForReadingWithBaseFile:(id)a3 named:(id)a4 inDirectory:(id)a5
{
  id v8;
  id v9;
  id v10;
  LiveFSAppleDouble *v11;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[LiveFSAppleDoubleManager acquireForBaseFile:](self, "acquireForBaseFile:", v8);
  v11 = -[LiveFSAppleDouble initWithManager:baseFileHandle:name:andDirectoryHandle:andPurpose:]([LiveFSAppleDouble alloc], "initWithManager:baseFileHandle:name:andDirectoryHandle:andPurpose:", self, v8, v10, v9, 0);

  if (!v11)
    -[LiveFSAppleDoubleManager releaseForBaseFile:](self, "releaseForBaseFile:", v8);

  return v11;
}

- (id)AppleDoubleForWritingWithBaseFile:(id)a3 named:(id)a4 inDirectory:(id)a5
{
  id v8;
  id v9;
  id v10;
  LiveFSAppleDouble *v11;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[LiveFSAppleDoubleManager acquireForBaseFile:](self, "acquireForBaseFile:", v8);
  v11 = -[LiveFSAppleDouble initWithManager:baseFileHandle:name:andDirectoryHandle:andPurpose:]([LiveFSAppleDouble alloc], "initWithManager:baseFileHandle:name:andDirectoryHandle:andPurpose:", self, v8, v10, v9, 1);

  if (!v11)
    -[LiveFSAppleDoubleManager releaseForBaseFile:](self, "releaseForBaseFile:", v8);

  return v11;
}

- (id)AppleDoubleForNamespaceWithBaseFile:(id)a3 named:(id)a4 inDirectory:(id)a5
{
  id v8;
  id v9;
  id v10;
  LiveFSAppleDouble *v11;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[LiveFSAppleDoubleManager acquireForBaseFile:](self, "acquireForBaseFile:", v8);
  v11 = -[LiveFSAppleDouble initWithManager:baseFileHandle:name:andDirectoryHandle:andPurpose:]([LiveFSAppleDouble alloc], "initWithManager:baseFileHandle:name:andDirectoryHandle:andPurpose:", self, v8, v10, v9, 2);

  if (!v11)
    -[LiveFSAppleDoubleManager releaseForBaseFile:](self, "releaseForBaseFile:", v8);

  return v11;
}

- (id)AppleDoubleForPurpose:(int)a3 withBaseFile:(id)a4 named:(id)a5 inDirectory:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  LiveFSAppleDouble *v13;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  if (v8 > 2)
  {
    v13 = 0;
  }
  else
  {
    v11 = a6;
    v12 = a5;
    -[LiveFSAppleDoubleManager acquireForBaseFile:](self, "acquireForBaseFile:", v10);
    v13 = -[LiveFSAppleDouble initWithManager:baseFileHandle:name:andDirectoryHandle:andPurpose:]([LiveFSAppleDouble alloc], "initWithManager:baseFileHandle:name:andDirectoryHandle:andPurpose:", self, v10, v12, v11, v8);

    if (!v13)
      -[LiveFSAppleDoubleManager releaseForBaseFile:](self, "releaseForBaseFile:", v10);
  }

  return v13;
}

- (BOOL)enumerateDirectory:(id)a3 intoArray:(id)a4
{
  dispatch_semaphore_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  char v11;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  NSObject *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD v23[4];
  _QWORD v24[4];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v13 = a3;
  v14 = a4;
  v6 = dispatch_semaphore_create(0);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  livefs_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[LiveFSAppleDoubleManager enumerateDirectory:intoArray:].cold.2(v7);

  if (!*((_BYTE *)v30 + 24))
  {
    v8 = MEMORY[0x24BDAC760];
    do
    {
      -[LiveFSAppleDoubleManager queue](self, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke;
      block[3] = &unk_24F64C738;
      v19 = v24;
      block[4] = self;
      v16 = v13;
      v20 = v23;
      v21 = &v29;
      v22 = &v25;
      v17 = v14;
      v18 = v6;
      dispatch_sync(v9, block);

    }
    while (!*((_BYTE *)v30 + 24));
  }
  livefs_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[LiveFSAppleDoubleManager enumerateDirectory:intoArray:].cold.1();

  v11 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v11;
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(*(_QWORD *)(v4 + 8) + 24);
  v9[0] = MEMORY[0x24BDAC760];
  v6 = *(_OWORD *)(a1 + 72);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v9[1] = 3221225472;
  v9[2] = __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7;
  v9[3] = &unk_24F64C710;
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 88);
  v14 = v4;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v3, "readDirectory:amount:cookie:verifier:requestID:reply:", v8, 0x10000, v5, v7, -1, v9);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  char v19;
  _BYTE v20[15];
  char v21;
  _BYTE v22[15];
  char v23;
  _BYTE v24[15];

  v8 = a5;
  livefs_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_5(v9);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a4;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    if (a2 != -1001)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_9;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_4(v10, v11, v12);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    while (1)
    {
      v13 = *(unsigned __int16 *)(v10 + 18);
      if (v13 < 3 || *(_BYTE *)(v10 + 21) != 46 || *(_BYTE *)(v10 + 22) != 95 || *(_BYTE *)(v10 + 20) != 1)
        break;
      livefs_std_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_3(&v19, v20);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10 + 21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(v10 + 8);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == -1)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      }
      else
      {
        if (!*(_WORD *)(v10 + 16))
        {

          goto LABEL_9;
        }
        v10 += *(unsigned __int16 *)(v10 + 16);
      }

LABEL_33:
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        goto LABEL_9;
    }
    if (v13 == 2)
    {
      if (*(_BYTE *)(v10 + 21) == 46)
      {
        v16 = *(unsigned __int8 *)(v10 + 22);
LABEL_24:
        if (v16 == 46)
        {
          livefs_std_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_2(&v23, v24);

          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == -1)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          }
          else
          {
            if (!*(_WORD *)(v10 + 16))
              goto LABEL_9;
            v10 += *(unsigned __int16 *)(v10 + 16);
          }
          goto LABEL_33;
        }
      }
    }
    else if (v13 == 1)
    {
      v16 = *(unsigned __int8 *)(v10 + 21);
      goto LABEL_24;
    }
    livefs_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_1(&v21, v22);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_33;
  }
LABEL_9:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (BOOL)scrubDirectoryNamed:(id)a3 inDirectory:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  LiveFSAppleDoubleManager *v29;
  NSObject *v30;
  uint64_t *v31;
  _QWORD v32[6];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD block[5];
  id v45;
  id v46;
  NSObject *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = dispatch_semaphore_create(0);
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__4;
  v53 = __Block_byref_object_dispose__4;
  v54 = 0;
  livefs_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[LiveFSAppleDoubleManager scrubDirectoryNamed:inDirectory:].cold.4();

  -[LiveFSAppleDoubleManager queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke;
  block[3] = &unk_24F64C788;
  block[4] = self;
  v24 = v7;
  v45 = v24;
  v25 = v6;
  v46 = v25;
  v48 = &v49;
  v26 = v8;
  v47 = v26;
  dispatch_sync(v10, block);

  if (v50[5])
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    if (-[LiveFSAppleDoubleManager enumerateDirectory:intoArray:](self, "enumerateDirectory:intoArray:", v50[5]))
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v11 = v23;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v41;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v41 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            v36 = 0;
            v37 = &v36;
            v38 = 0x2020000000;
            v39 = 0;
            -[LiveFSAppleDoubleManager queue](self, "queue");
            v16 = objc_claimAutoreleasedReturnValue();
            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_13;
            v32[3] = &unk_24F64C800;
            v32[4] = self;
            v32[5] = v15;
            v34 = &v49;
            v35 = &v36;
            v33 = v26;
            dispatch_sync(v16, v32);

            LOBYTE(v15) = *((_DWORD *)v37 + 6) == 0;
            _Block_object_dispose(&v36, 8);
            if ((v15 & 1) == 0)
            {
              v17 = 0;
              goto LABEL_19;
            }
          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
          if (v12)
            continue;
          break;
        }
      }
      v17 = 1;
LABEL_19:

    }
    else
    {
      v17 = 0;
    }
    livefs_std_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[LiveFSAppleDoubleManager scrubDirectoryNamed:inDirectory:].cold.3();

    -[LiveFSAppleDoubleManager queue](self, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_15;
    v27[3] = &unk_24F64C828;
    v28 = v25;
    v29 = self;
    v31 = &v49;
    v30 = v26;
    dispatch_sync(v20, v27);

    livefs_std_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[LiveFSAppleDoubleManager scrubDirectoryNamed:inDirectory:].cold.2();

    v18 = v23;
  }
  else
  {
    livefs_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[LiveFSAppleDoubleManager scrubDirectoryNamed:inDirectory:].cold.1();
    v17 = 0;
  }

  _Block_object_dispose(&v49, 8);
  return v17;
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;

  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_cold_1(v2);

  objc_msgSend(*(id *)(a1 + 32), "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = objc_msgSend(*(id *)(a1 + 32), "clientID");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_10;
  v9[3] = &unk_24F64C760;
  v8 = *(_OWORD *)(a1 + 56);
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(v3, "lookupin:name:forClient:usingFlags:requestID:reply:", v5, v4, v6, 0, -1, v9);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_10(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;

  v7 = a4;
  if (!a2)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_13(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "mount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_msgSend(*(id *)(a1 + 32), "clientID");
  v8[1] = 3221225472;
  v7 = *(_OWORD *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_2;
  v8[3] = &unk_24F64C7D8;
  v11 = *(_QWORD *)(a1 + 64);
  v6 = (id)v7;
  v10 = v7;
  objc_msgSend(v2, "lookupin:name:forClient:usingFlags:requestID:reply:", v3, v4, v5, 0, -1, v8);

}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v6 = a4;
  if (a2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_3;
    v11[3] = &unk_24F64C7B0;
    v13 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "removeItem:from:named:usingFlags:requestID:reply:", v6, v9, v10, 0, -1, v11);

  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_3(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_15_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v5 = objc_msgSend(*(id *)(a1 + 40), "clientID");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_16;
  v6[3] = &unk_24F64C2C0;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "reclaim:forClient:requestID:reply:", v4, v5, -1, v6);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_16(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isDotUnderBarFileName:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("._"));
}

- (LiveFSVolume)mount
{
  return (LiveFSVolume *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 344, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unint64_t)a3
{
  self->_clientID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->mount, 0);
  objc_storeStrong((id *)&self->_ADActiveForBaseHandleSet, 0);
}

- (void)enumerateDirectory:intoArray:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_23(&dword_22BD61000, v1, (uint64_t)v1, "ADM: enumerateDirectory:intoArray: returning %d with [%@]", v2);
  OUTLINED_FUNCTION_2();
}

- (void)enumerateDirectory:(NSObject *)a1 intoArray:.cold.2(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_22BD61000, a1, v2, "ADM: enumarateDirectory:intoArray: starting on %s", v3);
  OUTLINED_FUNCTION_10();
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_22BD61000, v0, v1, "ADM: enumarateDirectory:intoArray: starting READDIR on %s for cookie %#llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_22(a1, a2);
  OUTLINED_FUNCTION_5(&dword_22BD61000, v2, (uint64_t)v2, "ADM: enumarateDirectory:intoArray: found non ._ entry, we are done", v3);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_22(a1, a2);
  OUTLINED_FUNCTION_5(&dword_22BD61000, v2, (uint64_t)v2, "ADM: enumarateDirectory:intoArray: skipping over . or ..", v3);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_22(a1, a2);
  OUTLINED_FUNCTION_5(&dword_22BD61000, v2, (uint64_t)v2, "ADM: enumarateDirectory:intoArray: add ._ into array", v3);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = a1 + 21;
  OUTLINED_FUNCTION_7(&dword_22BD61000, a2, a3, "ADM: enumarateDirectory:intoArray: direntry: %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_5(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_22BD61000, a1, v2, "ADM: enumarateDirectory:intoArray: processing READDIR results on %s", v3);
  OUTLINED_FUNCTION_10();
}

- (void)scrubDirectoryNamed:inDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_22BD61000, v0, v1, "ADM: scrubDirectoryNamed: asked to scrub %@, but it's not there!", v2);
  OUTLINED_FUNCTION_2();
}

- (void)scrubDirectoryNamed:inDirectory:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17(&dword_22BD61000, v0, v1, "ADM: scrubDirectoryNamed: finish on %s for %@/%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_18();
}

- (void)scrubDirectoryNamed:inDirectory:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_22BD61000, v0, v1, "ADM: scrubDirectoryNamed: done with the to scrub %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)scrubDirectoryNamed:inDirectory:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17(&dword_22BD61000, v0, v1, "ADM: scrubDirectoryNamed: start on %s for %@/%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_18();
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_cold_1(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_22BD61000, a1, v2, "ADM: scrubDirectoryNamed: doing lookup on %s", v3);
  OUTLINED_FUNCTION_10();
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_15_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_22BD61000, v0, v1, "ADM: scrubDirectoryNamed: reclaiming state for %@ on %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

@end
