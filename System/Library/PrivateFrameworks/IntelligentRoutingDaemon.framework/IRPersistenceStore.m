@implementation IRPersistenceStore

- (IRPersistenceStore)initWithURL:(id)a3
{
  id v4;
  IRPersistenceStore *v5;
  uint64_t v6;
  NSPersistentStoreDescription *storeDescription;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRPersistenceStore;
  v5 = -[IRPersistenceStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    storeDescription = v5->_storeDescription;
    v5->_storeDescription = (NSPersistentStoreDescription *)v6;

    -[NSPersistentStoreDescription setShouldAddStoreAsynchronously:](v5->_storeDescription, "setShouldAddStoreAsynchronously:", 0);
    -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:](v5->_storeDescription, "setShouldMigrateStoreAutomatically:", 1);
    -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:](v5->_storeDescription, "setShouldInferMappingModelAutomatically:", 1);
    -[NSPersistentStoreDescription setURL:](v5->_storeDescription, "setURL:", v4);
    -[NSPersistentStoreDescription setType:](v5->_storeDescription, "setType:", *MEMORY[0x24BDBB580]);
    -[NSPersistentStoreDescription setOption:forKey:](v5->_storeDescription, "setOption:forKey:", *MEMORY[0x24BDD0CE0], *MEMORY[0x24BDBB4F8]);
    -[NSPersistentStoreDescription setValue:forPragmaNamed:](v5->_storeDescription, "setValue:forPragmaNamed:", CFSTR("WAL"), CFSTR("journal_mode"));
  }

  return v5;
}

- (BOOL)loadWithCoordinator:(id)a3
{
  id v4;
  NSPersistentStoreDescription *storeDescription;
  NSObject *v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v10 = 0;
  v11[0] = &v10;
  v11[1] = 0x3032000000;
  v11[2] = __Block_byref_object_copy__4;
  v11[3] = __Block_byref_object_dispose__4;
  v12 = 0;
  storeDescription = self->_storeDescription;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__IRPersistenceStore_loadWithCoordinator___block_invoke;
  v9[3] = &unk_251044ED0;
  v9[4] = &v10;
  objc_msgSend(v4, "addPersistentStoreWithDescription:completionHandler:", storeDescription, v9);
  if (*(_QWORD *)(v11[0] + 40))
  {
    v6 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRPersistenceStore loadWithCoordinator:].cold.1((uint64_t)v11, v6);
    v7 = *(_QWORD *)(v11[0] + 40) == 0;
  }
  else
  {
    v7 = 1;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __42__IRPersistenceStore_loadWithCoordinator___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (NSURL)url
{
  return -[NSPersistentStoreDescription URL](self->_storeDescription, "URL");
}

- (NSString)storeType
{
  return -[NSPersistentStoreDescription type](self->_storeDescription, "type");
}

- (NSDictionary)options
{
  return -[NSPersistentStoreDescription options](self->_storeDescription, "options");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDescription, 0);
}

- (void)loadWithCoordinator:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_23FFBA000, a2, OS_LOG_TYPE_ERROR, "#persistence-store, [ErrorId - Store Load error] Could not add store with error = %@", (uint8_t *)&v3, 0xCu);
}

@end
