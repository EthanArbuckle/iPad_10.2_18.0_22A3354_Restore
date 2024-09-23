@implementation ULModelStore

+ (unsigned)maxEntriesInTable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULModelTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511ED4B0, "unsignedIntValue");
  v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return CFSTR("generationTimestamp");
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationModelTable,ULModelMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationModelTable::Entry,)_fetchModelEntriesByAndPredicates:(ULModelStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationModelTable::Entry, std::allocator<CLMicroLocationModelTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationModelTable,ULModelMO>(self, a4, a5, a6, (CLMicroLocationModelTable::Entry *)retstr);
  return result;
}

- (vector<CLMicroLocationModelTable::Entry,)fetchAllRecordsWithLimit:(ULModelStore *)self
{
  vector<CLMicroLocationModelTable::Entry, std::allocator<CLMicroLocationModelTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationModelTable,ULModelMO>(self, a4, (CLMicroLocationModelTable::Entry *)retstr);
  return result;
}

- (BOOL)deleteUnneededModelsWithNumNonLslsModeltoKeep:(unsigned int)a3 numLSLModelsToKeep:(unsigned int)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  char v9;
  unsigned int v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v23;
  void *v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_17);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240448;
    v26 = a4;
    v27 = 1026;
    v28 = a3;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEBUG, "Keeping %{public}d models for LSL models, %{public}d models per other types", buf, 0xEu);
  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 1;
  do
  {
    if ((_DWORD)v8 == 2)
      v10 = a4;
    else
      v10 = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%d"), CFSTR("modelType"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULStore countManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "countManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v14, v11, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "unsignedIntValue") > v10)
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v18, v11, v19, objc_msgSend(v16, "unsignedIntValue") - v10);

      v9 &= v20;
    }

    v8 = (v8 + 1);
  }
  while ((_DWORD)v8 != 4);

  return v9 & 1;
}

- (BOOL)deleteAllModelsOfDeletedServices
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  BOOL v16;
  uint8_t buf[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_17);
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all models which refer to deleted services", buf, 2u);
  }
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULDatabaseSelectionLimit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = objc_msgSend(v7, "unsignedIntValue");
  else
    v8 = objc_msgSend(&unk_2511ED4C8, "unsignedIntValue");
  v9 = v8;

  objc_msgSend((id)-[ULStore db](self, "db")[96], "getAllServiceUUIDs:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K!=%d"), CFSTR("modelType"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K in %@) && %K!=NIL && %K!=''"), CFSTR("serviceUUID"), v10, CFSTR("serviceUUID"), CFSTR("serviceUUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v13);

  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v15, v11, 0, 0);

  return v16;
}

- (BOOL)deleteModelsForClients:(const void *)a3
{
  void *v5;
  void *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  BOOL v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(uint64_t **)a3;
  v8 = (uint64_t *)*((_QWORD *)a3 + 1);
  if (*(uint64_t **)a3 != v8)
  {
    do
    {
      v9 = v7;
      if (*((char *)v7 + 23) < 0)
        v9 = (uint64_t *)*v7;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v10);

      v7 += 3;
    }
    while (v7 != v8);
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("clientId"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v13, v5, 0, 0);

  return v14;
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelOfModelType:(optional<CLMicroLocationModelTable:(ULModelStore *)self :(uuid)a3 Entry> *__return_ptr)retstr ForClient:atLoiGroupId:
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  optional<CLMicroLocationModelTable::Entry> *result;
  _QWORD v24[3];
  void **v25;
  _QWORD v26[2];

  v5 = v4;
  v6 = v3;
  v7 = *(_QWORD *)&a3.var0[8];
  v26[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%d"), CFSTR("modelType"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v12 = (void *)MEMORY[0x24BDD1758];
  if (*((char *)v6 + 23) >= 0)
    v13 = v6;
  else
    v13 = (uint64_t *)*v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("clientId"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v15);

  if (*(_BYTE *)(v5 + 16))
  {
    v16 = (id)-[ULStore db](self, "db")[56];
    v17 = v16;
    if (!*(_BYTE *)(v5 + 16))
      std::__throw_bad_optional_access[abi:ne180100]();
    objc_msgSend(v16, "getLoiIdsInLoiGroupId:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULModelStore _fetchModelEntriesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchModelEntriesByAndPredicates:sortDescriptors:andLimit:", v10, v21, 1);

  if (v24[0] == v24[1])
  {
    v22 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    CLMicroLocationModelTable::Entry::Entry(retstr, v24[0]);
    v22 = 1;
  }
  *((_BYTE *)&retstr[1].var0.var4 + 96) = v22;
  v25 = (void **)v24;
  std::vector<CLMicroLocationModelTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v25);

  return result;
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelOfModelType:(optional<CLMicroLocationModelTable:(ULModelStore *)self :(uuid)a3 Entry> *__return_ptr)retstr ForService:atLoiGroupId:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  optional<CLMicroLocationModelTable::Entry> *result;
  _QWORD v24[3];
  void **v25;
  _QWORD v26[2];

  v5 = v4;
  v6 = v3;
  v7 = *(_QWORD *)&a3.var0[8];
  v26[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%d"), CFSTR("modelType"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  if (*(_BYTE *)(v6 + 16))
  {
    v12 = objc_alloc(MEMORY[0x24BDD1880]);
    if (!*(_BYTE *)(v6 + 16))
      std::__throw_bad_optional_access[abi:ne180100]();
    v13 = (void *)objc_msgSend(v12, "initWithUUIDBytes:", v6);
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("serviceUUID"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

  }
  if (*(_BYTE *)(v5 + 16))
  {
    v16 = (id)-[ULStore db](self, "db")[56];
    v17 = v16;
    if (!*(_BYTE *)(v5 + 16))
      std::__throw_bad_optional_access[abi:ne180100]();
    objc_msgSend(v16, "getLoiIdsInLoiGroupId:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULModelStore _fetchModelEntriesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchModelEntriesByAndPredicates:sortDescriptors:andLimit:", v10, v21, 1);

  if (v24[0] == v24[1])
  {
    v22 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    CLMicroLocationModelTable::Entry::Entry(retstr, v24[0]);
    v22 = 1;
  }
  *((_BYTE *)&retstr[1].var0.var4 + 96) = v22;
  v25 = (void **)v24;
  std::vector<CLMicroLocationModelTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v25);

  return result;
}

- (vector<CLMicroLocationModelTable::Entry,)fetchModelsAtLoiGroupId:(ULModelStore *)self andLimit:(SEL)a3
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  vector<CLMicroLocationModelTable::Entry, std::allocator<CLMicroLocationModelTable::Entry>> *result;
  void *v13;
  uuid v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULModelStore _fetchModelEntriesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchModelEntriesByAndPredicates:sortDescriptors:andLimit:", v7, v11, a5);

  return result;
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelOfModelType:(uuid)a3 atLoiGroupId:
{
  __int128 *v3;
  __int128 v5;
  char v6;
  _BYTE v7[17];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7[0] = 0;
  v7[16] = 0;
  v5 = *v3;
  v6 = *((_BYTE *)v3 + 16);
  return -[ULModelStore fetchMostRecentModelOfModelType:ForService:atLoiGroupId:](self, "fetchMostRecentModelOfModelType:ForService:atLoiGroupId:", *(_QWORD *)&a3.var0[8], v7, &v5);
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentMagicalMomentsModelForClient:(uuid)a3 atLoiGroupId:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = v3;
  v7 = v4;
  v8 = 1;
  return -[ULModelStore fetchMostRecentModelOfModelType:ForClient:atLoiGroupId:](self, "fetchMostRecentModelOfModelType:ForClient:atLoiGroupId:", 0, *(_QWORD *)&a3.var0[8], &v6);
}

- (optional<CLMicroLocationModelTable::Entry>)fetchMostRecentModelForServiceUuid:(uuid)a3 atLoiGroupId:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  optional<CLMicroLocationModelTable::Entry> *result;
  _QWORD v18[3];
  void **v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = *(_QWORD *)&a3.var0[8];
  v24 = v3;
  v21 = v4;
  v22 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v23);
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("serviceUUID"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

  objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v13);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULModelStore _fetchModelEntriesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchModelEntriesByAndPredicates:sortDescriptors:andLimit:", v8, v15, 1);

  if (v18[0] == v18[1])
  {
    v16 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    CLMicroLocationModelTable::Entry::Entry(retstr, v18[0]);
    v16 = 1;
  }
  *((_BYTE *)&retstr[1].var0.var4 + 96) = v16;
  v19 = (void **)v18;
  std::vector<CLMicroLocationModelTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v19);

  return result;
}

- (vector<CLMicroLocationModelTable::Entry,)fetchMostRecentModels
{
  uint64_t v5;
  Entry *var1;
  Entry *v7;
  vector<CLMicroLocationModelTable::Entry, std::allocator<CLMicroLocationModelTable::Entry>> *result;
  _BYTE v9[16];
  __int16 v10;
  char v11;
  _BYTE v12[320];
  uint64_t v13;

  v5 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  do
  {
    v10 = 0;
    v11 = 0;
    v9[0] = 0;
    -[ULModelStore fetchMostRecentModelOfModelType:ForService:atLoiGroupId:](self, "fetchMostRecentModelOfModelType:ForService:atLoiGroupId:", v5, (char *)&v10 + 1, v9);
    if (v12[312])
    {
      var1 = retstr->var1;
      if (var1 >= retstr->var2.var0)
      {
        v7 = (Entry *)std::vector<CLMicroLocationModelTable::Entry>::__push_back_slow_path<CLMicroLocationModelTable::Entry const&>((uint64_t *)retstr, (const CLMicroLocationModelTable::Entry *)v12);
      }
      else
      {
        CLMicroLocationModelTable::Entry::Entry((CLMicroLocationModelTable::Entry *)retstr->var1, (const CLMicroLocationModelTable::Entry *)v12);
        v7 = (Entry *)((char *)var1 + 312);
        retstr->var1 = (Entry *)((char *)var1 + 312);
      }
      retstr->var1 = v7;
    }
    result = (vector<CLMicroLocationModelTable::Entry, std::allocator<CLMicroLocationModelTable::Entry>> *)std::__optional_destruct_base<CLMicroLocationModelTable::Entry,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v12);
    v5 = (v5 + 1);
  }
  while ((_DWORD)v5 != 4);
  return result;
}

- (BOOL)updateAllModelsWithMatchingServiceUUID:(uuid)a3 withNewServiceUUID:(uuid)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  const __CFString *v14;
  void *v15;
  uuid v16;
  uuid v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v16 = a4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v17);
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v16);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("serviceUUID"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("serviceUUID");
  v15 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ULStore batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:](self, "batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:", v12, v9, v10);

  return (char)self;
}

- (BOOL)updateAllModelsWithMatchingClientId:()basic_string<char withNewClientId:()std:(std::allocator<char>> *)var0 :char_traits<char>
{
  uint64_t *v3;
  uint64_t *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  BOOL v12;
  const __CFString *v14;
  _QWORD v15[2];

  v4 = v3;
  v15[1] = *MEMORY[0x24BDAC8D0];
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((char *)v4 + 23) < 0)
    v4 = (uint64_t *)*v4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("clientId"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("clientId");
  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ULStore batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:](self, "batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:", v11, v8, v9);

  return v12;
}

@end
