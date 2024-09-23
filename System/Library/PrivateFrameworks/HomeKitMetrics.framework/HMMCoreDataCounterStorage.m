@implementation HMMCoreDataCounterStorage

- (HMMCoreDataCounterStorage)initWithModelName:(id)a3 atPath:(id)a4
{
  id v6;
  id v7;
  HMMCoreDataCounterStorage *v8;
  uint64_t v9;
  NSString *dataModelName;
  uint64_t v11;
  NSString *path;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMMCoreDataCounterStorage;
  v8 = -[HMMCoreDataCounterStorage init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    dataModelName = v8->_dataModelName;
    v8->_dataModelName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    path = v8->_path;
    v8->_path = (NSString *)v11;

  }
  return v8;
}

- (BOOL)loadPersistentStoreWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSPersistentContainer *v11;
  NSPersistentContainer *persistentContainer;
  void *v13;
  void *v14;
  void *v15;
  NSPersistentContainer *v16;
  void *v17;
  NSManagedObjectContext *v18;
  NSManagedObjectContext *currentContext;
  void *v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMCoreDataCounterStorage dataModelName](self, "dataModelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v6, CFSTR("momd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v7);
  v9 = objc_alloc(MEMORY[0x1E0C97BC8]);
  -[HMMCoreDataCounterStorage dataModelName](self, "dataModelName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSPersistentContainer *)objc_msgSend(v9, "initWithName:managedObjectModel:", v10, v8);
  persistentContainer = self->_persistentContainer;
  self->_persistentContainer = v11;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", -[NSString UTF8String](self->_path, "UTF8String"), 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97C08], "persistentStoreDescriptionWithURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPersistentContainer setPersistentStoreDescriptions:](self->_persistentContainer, "setPersistentStoreDescriptions:", v15);

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v16 = self->_persistentContainer;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__HMMCoreDataCounterStorage_loadPersistentStoreWithError___block_invoke;
  v22[3] = &unk_1E898A3C8;
  v22[4] = self;
  v22[5] = &v23;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v16, "loadPersistentStoresWithCompletionHandler:", v22);
  v17 = (void *)v24[5];
  if (v17)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v17);
  }
  else
  {
    v18 = -[NSPersistentContainer newBackgroundContext](self->_persistentContainer, "newBackgroundContext");
    currentContext = self->_currentContext;
    self->_currentContext = v18;

    objc_msgSend(MEMORY[0x1E0C97BA8], "mergeByPropertyObjectTrumpMergePolicy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSManagedObjectContext setMergePolicy:](self->_currentContext, "setMergePolicy:", v20);

  }
  _Block_object_dispose(&v23, 8);

  return v17 == 0;
}

- (void)executeWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMMCoreDataCounterStorage *v7;
  SEL v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[HMMCoreDataCounterStorage currentContext](self, "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__HMMCoreDataCounterStorage_executeWithManagedObjectContext___block_invoke;
    v11[3] = &unk_1E898A3F0;
    v12 = v5;
    v13 = v4;
    v6 = v5;
    v10 = v4;
    objc_msgSend(v6, "performBlockAndWait:", v11);

  }
  else
  {
    v7 = (HMMCoreDataCounterStorage *)_HMFPreconditionFailure();
    -[HMMCoreDataCounterStorage executeWithManagedObjectContextAndWait:](v7, v8, v9);
  }
}

- (void)executeWithManagedObjectContextAndWait:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMMCoreDataCounterStorage *v7;
  SEL v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[HMMCoreDataCounterStorage currentContext](self, "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__HMMCoreDataCounterStorage_executeWithManagedObjectContextAndWait___block_invoke;
    v10[3] = &unk_1E898A3F0;
    v11 = v5;
    v12 = v4;
    v6 = v5;
    v9 = v4;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  else
  {
    v7 = (HMMCoreDataCounterStorage *)_HMFPreconditionFailure();
    -[HMMCoreDataCounterStorage save](v7, v8);
  }
}

- (void)save
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__HMMCoreDataCounterStorage_save__block_invoke;
  v2[3] = &unk_1E898A8E0;
  v2[4] = self;
  -[HMMCoreDataCounterStorage executeWithManagedObjectContextAndWait:](self, "executeWithManagedObjectContextAndWait:", v2);
}

- (NSString)dataModelName
{
  return self->_dataModelName;
}

- (NSString)path
{
  return self->_path;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (NSManagedObjectContext)currentContext
{
  return self->_currentContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_dataModelName, 0);
}

void __33__HMMCoreDataCounterStorage_save__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "hasChanges"))
  {
    v10 = 0;
    v4 = objc_msgSend(v3, "save:", &v10);
    v5 = v10;
    if ((v4 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1D17B78FC]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v12 = v9;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1CD029000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to save context: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }
  }
  else
  {
    v5 = 0;
  }

}

uint64_t __68__HMMCoreDataCounterStorage_executeWithManagedObjectContextAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __61__HMMCoreDataCounterStorage_executeWithManagedObjectContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__HMMCoreDataCounterStorage_loadPersistentStoreWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B78FC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1CD029000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error loading persistent store: %{public}@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

@end
