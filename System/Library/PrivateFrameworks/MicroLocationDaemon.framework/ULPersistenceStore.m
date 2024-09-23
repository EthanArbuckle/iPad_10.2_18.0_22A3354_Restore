@implementation ULPersistenceStore

- (ULPersistenceStore)initWithURL:(id)a3 useWal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ULPersistenceStore *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  objc_super v20;

  v4 = a4;
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ULPersistenceStore;
  v7 = -[ULPersistenceStore init](&v20, sel_init);
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    -[ULPersistenceStore setStoreDescription:](v7, "setStoreDescription:", v8);

    -[ULPersistenceStore storeDescription](v7, "storeDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldAddStoreAsynchronously:", 0);

    -[ULPersistenceStore storeDescription](v7, "storeDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShouldMigrateStoreAutomatically:", 1);

    -[ULPersistenceStore storeDescription](v7, "storeDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldInferMappingModelAutomatically:", 1);

    -[ULPersistenceStore storeDescription](v7, "storeDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setURL:", v6);

    v13 = *MEMORY[0x24BDBB580];
    -[ULPersistenceStore storeDescription](v7, "storeDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setType:", v13);

    -[ULPersistenceStore storeDescription](v7, "storeDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOption:forKey:", *MEMORY[0x24BDD0CD8], *MEMORY[0x24BDBB4F8]);

    v16 = CFSTR("DELETE");
    if (v4)
      v16 = CFSTR("WAL");
    v17 = v16;
    -[ULPersistenceStore storeDescription](v7, "storeDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forPragmaNamed:", v17, CFSTR("journal_mode"));

  }
  return v7;
}

- (BOOL)loadWithCoordinator:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  v16 = 0;
  -[ULPersistenceStore storeDescription](self, "storeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__ULPersistenceStore_loadWithCoordinator_error___block_invoke;
  v10[3] = &unk_2511D9508;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v6, "addPersistentStoreWithDescription:completionHandler:", v7, v10);

  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __48__ULPersistenceStore_loadWithCoordinator_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) == 0;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_80);
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_FAULT, "Could not add store with error = %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (NSPersistentStoreDescription)storeDescription
{
  return self->_storeDescription;
}

- (void)setStoreDescription:(id)a3
{
  objc_storeStrong((id *)&self->_storeDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDescription, 0);
}

@end
