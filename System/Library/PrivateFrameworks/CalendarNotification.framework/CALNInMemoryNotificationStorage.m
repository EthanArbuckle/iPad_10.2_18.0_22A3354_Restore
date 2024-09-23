@implementation CALNInMemoryNotificationStorage

- (CALNInMemoryNotificationStorage)init
{
  CALNInMemoryNotificationStorage *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  uint64_t v8;
  NSMutableDictionary *recordMap;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CALNInMemoryNotificationStorage;
  v2 = -[CALNInMemoryNotificationStorage init](&v11, sel_init);
  if (v2)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    recordMap = v2->_recordMap;
    v2->_recordMap = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (id)notificationRecords
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[CALNInMemoryNotificationStorage workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__CALNInMemoryNotificationStorage_notificationRecords__block_invoke;
  v6[3] = &unk_24D484A08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__CALNInMemoryNotificationStorage_notificationRecords__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_notificationRecords");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_notificationRecords
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[CALNInMemoryNotificationStorage workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CALNInMemoryNotificationStorage recordMap](self, "recordMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addNotificationRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNInMemoryNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CALNInMemoryNotificationStorage_addNotificationRecord___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __57__CALNInMemoryNotificationStorage_addNotificationRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addNotificationRecord:", *(_QWORD *)(a1 + 40));
}

- (void)_addNotificationRecord:(id)a3
{
  id v4;
  NSObject *v5;
  CALNNotificationIdentifier *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  int v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNInMemoryNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((objc_msgSend(v4, "hasAlertContent") & 1) != 0)
  {
    if ((objc_msgSend(v4, "shouldPresentAlert") & 1) != 0)
    {
      v6 = [CALNNotificationIdentifier alloc];
      objc_msgSend(v4, "sourceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceClientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:](v6, "initWithSourceIdentifier:sourceClientIdentifier:", v7, v8);

      if (v9)
      {
        -[CALNInMemoryNotificationStorage recordMap](self, "recordMap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, v9);

        +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "sourceIdentifier");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sourceClientIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
          v16 = 138543618;
          v17 = v12;
          v18 = 2114;
          v19 = v13;
          v14 = "Added record, source identifier = %{public}@, source client identifier = %{public}@";
LABEL_13:
          _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x16u);

          goto LABEL_14;
        }
      }
      else
      {
        +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "sourceIdentifier");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sourceClientIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
          v16 = 138543618;
          v17 = v12;
          v18 = 2114;
          v19 = v13;
          v14 = "Cannot add record because notification identifier could not be created with record's source identifier a"
                "nd record's source client identifier. Record source identifier: %{public}@. Record source client identif"
                "ier: %{public}@.";
          goto LABEL_13;
        }
      }
LABEL_15:

      goto LABEL_16;
    }
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "sourceIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceClientIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      v15 = "Cannot add record that should not be presented, source identifier = %{public}@, source client identifier = %{public}@";
      goto LABEL_10;
    }
  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "sourceIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceClientIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      v15 = "Cannot add record without alert content, source identifier = %{public}@, source client identifier = %{public}@";
LABEL_10:
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v16, 0x16u);
LABEL_14:

      goto LABEL_15;
    }
  }
LABEL_16:

}

- (void)addNotificationRecords:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  CALNInMemoryNotificationStorage *v9;

  v4 = a3;
  -[CALNInMemoryNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CALNInMemoryNotificationStorage_addNotificationRecords___block_invoke;
  block[3] = &unk_24D484760;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __58__CALNInMemoryNotificationStorage_addNotificationRecords___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_addNotificationRecord:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)removeNotificationRecordsPassingTest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNInMemoryNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__CALNInMemoryNotificationStorage_removeNotificationRecordsPassingTest___block_invoke;
  block[3] = &unk_24D484A30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __72__CALNInMemoryNotificationStorage_removeNotificationRecordsPassingTest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeNotificationRecordsPassingTest:", *(_QWORD *)(a1 + 40));
}

- (void)_removeNotificationRecordsPassingTest:(id)a3
{
  unsigned int (**v4)(id, void *);
  NSObject *v5;
  CALNInMemoryNotificationStorage *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CALNNotificationIdentifier *v15;
  void *v16;
  void *v17;
  CALNNotificationIdentifier *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  CALNNotificationIdentifier *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, void *))a3;
  -[CALNInMemoryNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = self;
  -[CALNInMemoryNotificationStorage recordMap](self, "recordMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v4[2](v4, v14))
        {
          v15 = [CALNNotificationIdentifier alloc];
          objc_msgSend(v14, "sourceIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sourceClientIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:](v15, "initWithSourceIdentifier:sourceClientIdentifier:", v16, v17);

          if (v18)
          {
            -[CALNInMemoryNotificationStorage recordMap](v6, "recordMap");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, v18);

            +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v18;
              _os_log_debug_impl(&dword_215D9B000, v20, OS_LOG_TYPE_DEBUG, "Removed notification record with identifier = %{public}@", buf, 0xCu);
            }

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v11);
  }

}

- (void)removeAllNotificationRecords
{
  NSObject *v3;
  _QWORD block[5];

  -[CALNInMemoryNotificationStorage workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CALNInMemoryNotificationStorage_removeAllNotificationRecords__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __63__CALNInMemoryNotificationStorage_removeAllNotificationRecords__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeNotificationRecordsPassingTest:", &__block_literal_global_11);
}

uint64_t __63__CALNInMemoryNotificationStorage_removeAllNotificationRecords__block_invoke_2()
{
  return 1;
}

- (NSMutableDictionary)recordMap
{
  return self->_recordMap;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_recordMap, 0);
}

@end
