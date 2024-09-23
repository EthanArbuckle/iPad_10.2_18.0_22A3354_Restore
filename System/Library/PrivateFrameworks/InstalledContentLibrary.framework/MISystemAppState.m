@implementation MISystemAppState

- (MISystemAppState)init
{
  MISystemAppState *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *appStateQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MISystemAppState;
  v2 = -[MISystemAppState init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MobileInstallation.SystemAppStateQueue", v3);
    appStateQueue = v2->_appStateQueue;
    v2->_appStateQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

+ (id)_systemAppStateFromURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v15;

  v3 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "MI_dictionaryWithContentsOfURL:options:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (!v4)
  {
    objc_msgSend(v5, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v11 = objc_msgSend(v6, "code");

      if (v11 == 260)
        goto LABEL_14;
    }
    else
    {

    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_14;
LABEL_13:
    objc_msgSend(v3, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

LABEL_14:
    v9 = (id)objc_opt_new();
    goto LABEL_15;
  }
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  if ((MIDictionaryContainsOnlyClasses(v4, v7, v8) & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_14;
    goto LABEL_13;
  }
  v9 = v4;
LABEL_15:
  v13 = v9;

  return v13;
}

+ (id)sharedList
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MISystemAppState_sharedList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedList_onceToken != -1)
    dispatch_once(&sharedList_onceToken, block);
  return (id)sharedList_sharedList;
}

void __30__MISystemAppState_sharedList__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedList_sharedList;
  sharedList_sharedList = (uint64_t)v0;

}

- (id)_onQueue_systemAppStateList
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MISystemAppState appStateQueue](self, "appStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MISystemAppState systemAppStateList](self, "systemAppStateList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemAppInstallStateFilePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_systemAppStateFromURL:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MISystemAppState setSystemAppStateList:](self, "setSystemAppStateList:", v4);

  }
  return v4;
}

- (id)_onQueue_retrieveSystemAppStateRestoringBackedUpState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = a3;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v3)
  {
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backupSystemAppInstallStateFilePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_systemAppStateFromURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v11 = v8;
      MOLogWrite();
    }
    -[MISystemAppState _onQueue_setSystemAppStateList:](self, "_onQueue_setSystemAppStateList:", v8, v11);
    -[MISystemAppState systemAppStateList](self, "systemAppStateList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MISystemAppState _onQueue_systemAppStateList](self, "_onQueue_systemAppStateList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)_onQueue_setSystemAppStateList:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MISystemAppState setSystemAppStateList:](self, "setSystemAppStateList:", v4);
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemAppInstallStateFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "count"))
  {
    -[MISystemAppState systemAppStateList](self, "systemAppStateList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v9 = objc_msgSend(v8, "MI_writeToURL:format:options:error:", v7, 200, 268435457, &v14);
    v10 = v14;

    if ((v9 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      objc_msgSend(v7, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else
  {
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v12 = objc_msgSend(v11, "removeItemAtURL:error:", v7, &v15);
    v10 = v15;

    if ((v12 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      MOLogWrite();
  }

}

- (id)systemAppStateDictionaryRestoringBackedUpState:(BOOL)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MISystemAppState_systemAppStateDictionaryRestoringBackedUpState___block_invoke;
  block[3] = &unk_1E6CB6E88;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __67__MISystemAppState_systemAppStateDictionaryRestoringBackedUpState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_retrieveSystemAppStateRestoringBackedUpState:", *(unsigned __int8 *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addIdentifier:(id)a3 withState:(int)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MISystemAppState_addIdentifier_withState___block_invoke;
  block[3] = &unk_1E6CB6EB0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

}

void __44__MISystemAppState_addIdentifier_withState___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_systemAppStateList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  v4 = *(_DWORD *)(a1 + 48);

  if (v4 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_setSystemAppStateList:", v6);
  }

}

- (void)removeIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MISystemAppState_removeIdentifiers___block_invoke;
  block[3] = &unk_1E6CB6ED8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __38__MISystemAppState_removeIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_systemAppStateList");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
  if (v2 != objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_setSystemAppStateList:", v3);

}

- (OS_dispatch_queue)appStateQueue
{
  return self->_appStateQueue;
}

- (NSMutableDictionary)systemAppStateList
{
  return self->_systemAppStateList;
}

- (void)setSystemAppStateList:(id)a3
{
  objc_storeStrong((id *)&self->_systemAppStateList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAppStateList, 0);
  objc_storeStrong((id *)&self->_appStateQueue, 0);
}

@end
