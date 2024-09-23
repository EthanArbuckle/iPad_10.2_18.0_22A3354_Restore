@implementation _CDCoreDataContextPersisting

- (BOOL)withMOFromEntityWithName:(id)a3 andUniqunessPredicate:(id)a4 update:(id)a5
{
  return -[_CDCoreDataContextPersisting _withMOFromEntityWithName:andUniqunessPredicate:insert:update:](self, "_withMOFromEntityWithName:andUniqunessPredicate:insert:update:", a3, a4, 0, a5);
}

- (id)uniqunessPredicateForRegistration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("identifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_deleteKeyPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEphemeral")
          && !-[NSCountedSet countForObject:](self->_keyPathRegistrationCount, "countForObject:", v11))
        {
          v12 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v11, "key");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "isUserCentric"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deviceID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "predicateWithFormat:", CFSTR("key == %@ AND isUserCentric == %@ AND deviceID == %@"), v13, v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v17 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "orPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDCoreDataContextPersisting fromEntityWithName:deleteObjectsMatching:](self, "fromEntityWithName:deleteObjectsMatching:", CFSTR("ContextualKeyPath"), v19);
}

- (BOOL)_withMOFromEntityWithName:(id)a3 andUniqunessPredicate:(id)a4 insert:(BOOL)a5 update:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  -[_CDCoreDataContextPersisting getMOC](self, "getMOC");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_CDCoreDataContextPersisting _withMOFromEntityWithName:andUniqunessPredicate:insert:update:].cold.1(v14);

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke;
  v21[3] = &unk_1E26D4BA0;
  v15 = v10;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  v17 = v13;
  v24 = v17;
  v27 = a5;
  v18 = v12;
  v25 = v18;
  v26 = &v28;
  objc_msgSend(v17, "performWithOptions:andBlock:", 4, v21);
  v19 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (BOOL)fromEntityWithName:(id)a3 deleteObjectsMatching:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  char v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[_CDCoreDataContextPersisting getMOC](self, "getMOC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73___CDCoreDataContextPersisting_fromEntityWithName_deleteObjectsMatching___block_invoke;
  v14[3] = &unk_1E26D4BC8;
  v9 = v6;
  v15 = v9;
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v18 = &v19;
  objc_msgSend(v11, "performWithOptions:andBlock:", 4, v14);
  v12 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)getMOC
{
  return (id)-[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
}

- (void)deleteRegistration:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___CDCoreDataContextPersisting_deleteRegistration___block_invoke;
  block[3] = &unk_1E26D46A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (_CDCoreDataContextPersisting)initWithStorage:(id)a3
{
  id v5;
  _CDCoreDataContextPersisting *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSCountedSet *keyPathRegistrationCount;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CDCoreDataContextPersisting;
  v6 = -[_CDCoreDataContextPersisting init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.coreduetcontext.service.coredatapersistence", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_storage, a3);
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    keyPathRegistrationCount = v6->_keyPathRegistrationCount;
    v6->_keyPathRegistrationCount = (NSCountedSet *)v10;

  }
  return v6;
}

+ (id)persistenceWithDirectory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("_DKDataModel"), CFSTR("momd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D159D0]), "initWithDirectory:databaseName:modelURL:readOnly:localOnly:", v5, CFSTR("knowledge"), v8, 0, 1);

  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStorage:", v9);
  return v10;
}

+ (id)persistenceWithStorage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStorage:", v4);

  return v5;
}

- (BOOL)withMOFromEntityWithName:(id)a3 andUniqunessPredicate:(id)a4 insertOrUpdate:(id)a5
{
  return -[_CDCoreDataContextPersisting _withMOFromEntityWithName:andUniqunessPredicate:insert:update:](self, "_withMOFromEntityWithName:andUniqunessPredicate:insert:update:", a3, a4, 1, a5);
}

- (BOOL)fromEntityWithName:(id)a3 fetchAllObjectsMatchingPredicate:(id)a4 handlingMOs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_CDCoreDataContextPersisting getMOC](self, "getMOC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96___CDCoreDataContextPersisting_fromEntityWithName_fetchAllObjectsMatchingPredicate_handlingMOs___block_invoke;
  v17[3] = &unk_1E26D4BF0;
  v18 = v8;
  v19 = v9;
  v20 = v11;
  v21 = v10;
  v12 = v10;
  v13 = v11;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v13, "performWithOptions:andBlock:", 4, v17);

  return 0;
}

- (id)uniquenessPredicateForKeyPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  if (v4)
  {
    objc_msgSend(v3, "deviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("deviceID == %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deviceID == NULL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v3, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("key == %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v3, "isUserCentric");
  v12 = (void *)MEMORY[0x1E0CB3880];
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isUserCentric"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("isUserCentric == %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isUserCentric == NULL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = objc_msgSend(v3, "isEphemeral");
  v16 = (void *)MEMORY[0x1E0CB3880];
  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isEphemeral"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithFormat:", CFSTR("isEphemeral == %@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isEphemeral == NULL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)MEMORY[0x1E0CB3528];
  v23[0] = v10;
  v23[1] = v7;
  v23[2] = v14;
  v23[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)saveValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _CDCoreDataContextPersisting *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___CDCoreDataContextPersisting_saveValue_forKeyPath___block_invoke;
  block[3] = &unk_1E26D4680;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

- (void)saveRegistration:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  _CDCoreDataContextPersisting *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___CDCoreDataContextPersisting_saveRegistration___block_invoke;
  block[3] = &unk_1E26D46A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)deleteAllData
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___CDCoreDataContextPersisting_deleteAllData__block_invoke;
  block[3] = &unk_1E26D46E0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)deleteDataCreatedBefore:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  _CDCoreDataContextPersisting *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___CDCoreDataContextPersisting_deleteDataCreatedBefore___block_invoke;
  block[3] = &unk_1E26D46A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)loadValues
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  _CDCoreDataContextPersisting *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __42___CDCoreDataContextPersisting_loadValues__block_invoke;
  v11 = &unk_1E26D46A8;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(queue, &v8);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadRegistrations
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  _CDCoreDataContextPersisting *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke;
  v11 = &unk_1E26D46A8;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(queue, &v8);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (_DKCoreDataStorage)storage
{
  return self->_storage;
}

- (NSCountedSet)keyPathRegistrationCount
{
  return self->_keyPathRegistrationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathRegistrationCount, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_withMOFromEntityWithName:(os_log_t)log andUniqunessPredicate:insert:update:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DD73000, log, OS_LOG_TYPE_ERROR, "Error: null managed object context", v1, 2u);
}

@end
