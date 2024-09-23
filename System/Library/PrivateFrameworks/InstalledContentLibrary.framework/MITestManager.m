@implementation MITestManager

- (MITestManager)init
{
  MITestManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MITestManager;
  v2 = -[MITestManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.installd.testMode", v3);
    -[MITestManager setTestModeQueue:](v2, "setTestModeQueue:", v4);

    v5 = (void *)objc_opt_new();
    -[MITestManager setSourceForPID:](v2, "setSourceForPID:", v5);

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MITestManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_sharedInstance;
}

void __31__MITestManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (id)_testModeSentinelURL
{
  void *v2;
  void *v3;
  void *v4;

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("sMITestMode"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isRunningInTestMode:(BOOL *)a3 outError:(id *)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasInternalContent");

  if (v7)
  {
    -[MITestManager _testModeSentinelURL](self, "_testModeSentinelURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "itemExistsAtURL:", v8);

    if (!a3)
      return 1;
    goto LABEL_5;
  }
  v10 = 0;
  if (a3)
LABEL_5:
    *a3 = v10;
  return 1;
}

- (BOOL)_onQueue_setIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  int v24;
  _QWORD handler[4];
  id v26;
  int v27;
  id location;
  id v29;

  v5 = *(_QWORD *)&a3;
  -[MITestManager testModeQueue](self, "testModeQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MITestManager _testModeSentinelURL](self, "_testModeSentinelURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v9 = objc_msgSend(&stru_1E6CC0B98, "writeToURL:atomically:encoding:error:", v8, 1, 4, &v29);
  v10 = v29;
  if ((v9 & 1) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v8, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    -[MITestManager sourceForPID](self, "sourceForPID", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_initWeak(&location, self);
      -[MITestManager testModeQueue](self, "testModeQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_source_create(MEMORY[0x1E0C80DB0], (int)v5, 0x80000000uLL, v14);

      v16 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __76__MITestManager__onQueue_setIsRunningInTestModeForProcessWithPID_withError___block_invoke;
      handler[3] = &unk_1E6CB7548;
      objc_copyWeak(&v26, &location);
      v27 = v5;
      dispatch_source_set_event_handler(v15, handler);
      v22[0] = v16;
      v22[1] = 3221225472;
      v22[2] = __76__MITestManager__onQueue_setIsRunningInTestModeForProcessWithPID_withError___block_invoke_2;
      v22[3] = &unk_1E6CB7548;
      objc_copyWeak(&v23, &location);
      v24 = v5;
      dispatch_source_set_cancel_handler(v15, v22);
      -[MITestManager sourceForPID](self, "sourceForPID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v18);

      dispatch_activate(v15);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v26);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v8, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v9;
}

void __76__MITestManager__onQueue_setIsRunningInTestModeForProcessWithPID_withError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  char v4;
  id v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v6 = *(unsigned int *)(a1 + 40);
      MOLogWrite();
    }
    v3 = *(unsigned int *)(a1 + 40);
    v7 = 0;
    v4 = objc_msgSend(WeakRetained, "_onQueue_clearIsRunningInTestModeForProcessWithPID:withError:", v3, &v7, v6);
    v5 = v7;
    if ((v4 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      MOLogWrite();

  }
}

void __76__MITestManager__onQueue_setIsRunningInTestModeForProcessWithPID_withError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "sourceForPID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v4);

    WeakRetained = v5;
  }

}

- (BOOL)setIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4
{
  void *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  uint64_t v17[7];
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasInternalContent");

  if ((v8 & 1) != 0)
  {
    -[MITestManager testModeQueue](self, "testModeQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = (uint64_t)__67__MITestManager_setIsRunningInTestModeForProcessWithPID_withError___block_invoke;
    v17[3] = (uint64_t)&unk_1E6CB7570;
    v17[4] = (uint64_t)self;
    v17[5] = (uint64_t)&v25;
    v18 = a3;
    v17[6] = (uint64_t)&v19;
    dispatch_sync(v10, v17);

    v11 = v26;
    if (*((_BYTE *)v26 + 24))
      *((_BYTE *)v26 + 24) = 1;
  }
  else
  {
    _CreateError((uint64_t)"-[MITestManager setIsRunningInTestModeForProcessWithPID:withError:]", 151, CFSTR("MIInstallerErrorDomain"), 157, 0, 0, CFSTR("Missing required internal content variant"), v9, v17[0]);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v20[5];
    v20[5] = v12;

    v11 = v26;
  }
  v14 = *((unsigned __int8 *)v11 + 24);
  if (a4 && !v14)
  {
    *a4 = objc_retainAutorelease((id)v20[5]);
    v14 = *((unsigned __int8 *)v26 + 24);
  }
  v15 = v14 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __67__MITestManager_setIsRunningInTestModeForProcessWithPID_withError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_onQueue_setIsRunningInTestModeForProcessWithPID:withError:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
}

- (BOOL)_onQueue_clearIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  char v15;
  void *v17;
  id v18;

  v5 = *(_QWORD *)&a3;
  -[MITestManager testModeQueue](self, "testModeQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MITestManager sourceForPID](self, "sourceForPID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MITestManager _testModeSentinelURL](self, "_testModeSentinelURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = objc_msgSend(v11, "removeItemAtURL:error:", v12, &v18);
  v14 = v18;
  if ((v13 & 1) != 0)
  {
    -[MITestManager _onQueue_clearTestFlags:](self, "_onQueue_clearTestFlags:", -1);
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    objc_msgSend(v12, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  if (v10)
    dispatch_source_cancel(v10);
  if (a4)
    v15 = v13;
  else
    v15 = 1;
  if ((v15 & 1) == 0)
    *a4 = objc_retainAutorelease(v14);

  return v13;
}

- (BOOL)clearIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4
{
  void *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v16[7];
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasInternalContent");

  if ((v8 & 1) != 0)
  {
    -[MITestManager testModeQueue](self, "testModeQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = (uint64_t)__69__MITestManager_clearIsRunningInTestModeForProcessWithPID_withError___block_invoke;
    v16[3] = (uint64_t)&unk_1E6CB7570;
    v16[4] = (uint64_t)self;
    v16[5] = (uint64_t)&v18;
    v17 = a3;
    v16[6] = (uint64_t)&v22;
    dispatch_sync(v10, v16);

    v11 = *((unsigned __int8 *)v19 + 24);
    if (*((_BYTE *)v19 + 24))
    {
      v11 = 1;
      *((_BYTE *)v19 + 24) = 1;
      goto LABEL_8;
    }
  }
  else
  {
    _CreateError((uint64_t)"-[MITestManager clearIsRunningInTestModeForProcessWithPID:withError:]", 213, CFSTR("MIInstallerErrorDomain"), 157, 0, 0, CFSTR("Missing required internal content variant"), v9, v16[0]);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v23[5];
    v23[5] = v12;

    v11 = *((unsigned __int8 *)v19 + 24);
  }
  if (a4 && !v11)
  {
    *a4 = objc_retainAutorelease((id)v23[5]);
    v11 = *((unsigned __int8 *)v19 + 24);
  }
LABEL_8:
  v14 = v11 != 0;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __69__MITestManager_clearIsRunningInTestModeForProcessWithPID_withError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_onQueue_clearIsRunningInTestModeForProcessWithPID:withError:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
}

- (void)_onQueue_setTestFlags:(unint64_t)a3
{
  NSObject *v5;
  unint64_t testFlags;

  -[MITestManager testModeQueue](self, "testModeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  testFlags = self->_testFlags;
  self->_testFlags = testFlags | a3;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
  if ((a3 & 1) != 0 && (testFlags & 1) == 0)
    MIReduceAvailableMemoryForValidationForTesting();
}

- (void)setTestFlags:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[MITestManager testModeQueue](self, "testModeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__MITestManager_setTestFlags___block_invoke;
  v6[3] = &unk_1E6CB7598;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

uint64_t __30__MITestManager_setTestFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_setTestFlags:", *(_QWORD *)(a1 + 40));
}

- (void)_onQueue_clearTestFlags:(unint64_t)a3
{
  NSObject *v5;
  unint64_t testFlags;

  -[MITestManager testModeQueue](self, "testModeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  testFlags = self->_testFlags;
  self->_testFlags = testFlags & ~a3;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
  if ((a3 & 1) != 0 && (testFlags & 1) != 0)
    MIRestoreAvailableMemoryForValidationAfterTesting();
}

- (void)clearTestFlags:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[MITestManager testModeQueue](self, "testModeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__MITestManager_clearTestFlags___block_invoke;
  v6[3] = &unk_1E6CB7598;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

uint64_t __32__MITestManager_clearTestFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearTestFlags:", *(_QWORD *)(a1 + 40));
}

- (BOOL)testFlagsAreSet:(unint64_t)a3
{
  MITestManager *v4;
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[MITestManager testModeQueue](self, "testModeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MITestManager_testFlagsAreSet___block_invoke;
  block[3] = &unk_1E6CB75C0;
  block[5] = &v8;
  block[6] = a3;
  block[4] = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

uint64_t __33__MITestManager_testFlagsAreSet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(*(id *)(a1 + 32), "testFlags");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == (*(_QWORD *)(a1 + 48) & result);
  return result;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (OS_dispatch_queue)testModeQueue
{
  return self->_testModeQueue;
}

- (void)setTestModeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_testModeQueue, a3);
}

- (NSMutableDictionary)sourceForPID
{
  return self->_sourceForPID;
}

- (void)setSourceForPID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceForPID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceForPID, 0);
  objc_storeStrong((id *)&self->_testModeQueue, 0);
}

@end
