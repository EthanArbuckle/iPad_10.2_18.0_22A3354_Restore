@implementation CCDatabaseSetEnumerator

+ (id)defaultEnumeratorWithUseCase:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  +[CCDataResourceReadAccess defaultInstanceWithUseCase:](CCDataResourceReadAccess, "defaultInstanceWithUseCase:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithReadAccess:", v5);
  return v6;
}

- (CCDatabaseSetEnumerator)initWithReadAccess:(id)a3
{
  id v5;
  CCDatabaseSetEnumerator *v6;
  CCDatabaseSetEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCDatabaseSetEnumerator;
  v6 = -[CCDatabaseSetEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_readAccess, a3);

  return v7;
}

- (BOOL)enumerateAllSets:(id *)a3 usingBlock:(id)a4
{
  return -[CCDatabaseSetEnumerator enumerateAllSets:itemType:usingBlock:](self, "enumerateAllSets:itemType:usingBlock:", a3, (unsigned __int16)CCTypeIdentifierUnknown, a4);
}

- (BOOL)enumerateAllSets:(id *)a3 itemType:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5;
  id v8;
  CCDataResourceReadAccess *readAccess;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD v17[3];

  v5 = a4;
  v8 = a5;
  v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x2020000000;
  v17[2] = 0;
  readAccess = self->_readAccess;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__CCDatabaseSetEnumerator_enumerateAllSets_itemType_usingBlock___block_invoke;
  v13[3] = &unk_250990658;
  v10 = v8;
  v14 = v10;
  v15 = &v16;
  -[CCDataResourceReadAccess enumerateReadableSets:itemType:usingBlock:](readAccess, "enumerateReadableSets:itemType:usingBlock:", a3, v5, v13);
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CCDatabaseSetEnumerator enumerateAllSets:itemType:usingBlock:].cold.1((uint64_t)v17, v11);

  _Block_object_dispose(&v16, 8);
  return 1;
}

void __64__CCDatabaseSetEnumerator_enumerateAllSets_itemType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x23B82079C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (id)allSets:(id *)a3
{
  return -[CCDatabaseSetEnumerator allSetsWithItemType:error:](self, "allSetsWithItemType:error:", (unsigned __int16)CCTypeIdentifierUnknown, a3);
}

- (id)allSetsWithItemType:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__CCDatabaseSetEnumerator_allSetsWithItemType_error___block_invoke;
  v11[3] = &unk_250990328;
  v8 = v7;
  v12 = v8;
  LODWORD(a4) = -[CCDatabaseSetEnumerator enumerateAllSets:itemType:usingBlock:](self, "enumerateAllSets:itemType:usingBlock:", a4, v5, v11);

  if ((_DWORD)a4)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

uint64_t __53__CCDatabaseSetEnumerator_allSetsWithItemType_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readAccess, 0);
}

- (void)enumerateAllSets:(uint64_t)a1 itemType:(NSObject *)a2 usingBlock:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_237B25000, a2, OS_LOG_TYPE_DEBUG, "Enumerated %lu total set(s)", (uint8_t *)&v3, 0xCu);
}

@end
