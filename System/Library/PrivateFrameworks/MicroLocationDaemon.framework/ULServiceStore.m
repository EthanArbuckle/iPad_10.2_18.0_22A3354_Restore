@implementation ULServiceStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULServicesTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511ED8A0, "unsignedIntValue");
  v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return CFSTR("lastActiveTimestamp");
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMiLoServiceTable,ULServiceMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoServiceTable::Entry,)_fetchServicesByAndPredicates:(ULServiceStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMiLoServiceTable::Entry, std::allocator<CLMiLoServiceTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMiLoServiceTable,ULServiceMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMiLoServiceTable::Entry,)fetchAllRecordsWithLimit:(ULServiceStore *)self
{
  vector<CLMiLoServiceTable::Entry, std::allocator<CLMiLoServiceTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMiLoServiceTable,ULServiceMO>(self, a4, retstr);
  return result;
}

- (BOOL)deleteServiceForUUID:(uuid)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uuid v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v11);
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("serviceUUID"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v9, v4, 0, 0);

  return (char)self;
}

- (BOOL)deleteAllServicesWithUUIDs:()vector<boost:(std::allocator<boost::uuids::uuid>> *)a3 :uuids::uuid
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint8_t buf[16];

  if (a3->var0 == a3->var1)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_44);
    v10 = logObject_MicroLocation_Default;
    v9 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "#Warning No UUIDs were passed in to delete services", buf, 2u);
      return 0;
    }
  }
  else
  {
    ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("serviceUUID"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v8, v5, 0, 0);

  }
  return v9;
}

- (BOOL)deleteAllServicesWithExceptions:(const void *)a3
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
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("clientId"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v13, v5, 0, 0);

  return v14;
}

- (vector<CLMiLoServiceTable::Entry,)fetchAllServicesForServiceType:(ULServiceStore *)self
{
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  vector<CLMiLoServiceTable::Entry, std::allocator<CLMiLoServiceTable::Entry>> *result;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%u"), CFSTR("serviceType"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastActiveTimestamp"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceStore _fetchServicesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchServicesByAndPredicates:sortDescriptors:andLimit:", v7, v10, v6);

  return result;
}

- (vector<CLMiLoServiceTable::Entry,)fetchAllServicesForClientId:(ULServiceStore *)self andUserId:(SEL)a3
{
  unsigned int v8;
  void *v9;
  void *v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  const void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  vector<CLMiLoServiceTable::Entry, std::allocator<CLMiLoServiceTable::Entry>> *result;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1758];
  if (*((char *)a4 + 23) >= 0)
    v11 = a4;
  else
    v11 = *(const void **)a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("clientId"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v13);

  v14 = (void *)MEMORY[0x24BDD1758];
  if (*((char *)a5 + 23) >= 0)
    v15 = a5;
  else
    v15 = *(const void **)a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("userId"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v17);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastActiveTimestamp"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceStore _fetchServicesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchServicesByAndPredicates:sortDescriptors:andLimit:", v9, v19, v8);

  return result;
}

- (optional<CLMiLoServiceTable::Entry>)fetchServiceByUUID:()basic_string<char
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  char *v15;
  unint64_t v16;
  char v17;
  optional<CLMiLoServiceTable::Entry> *result;
  _QWORD v19[3];
  void **v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = v3;
  v23 = v4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v22);
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("serviceUUID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastActiveTimestamp"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceStore _fetchServicesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchServicesByAndPredicates:sortDescriptors:andLimit:", v7, v12, 1);

  v13 = v19[0];
  if (v19[0] == v19[1])
  {
    v17 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    v14 = *(_OWORD *)(v19[0] + 16);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v19[0];
    *((_OWORD *)&retstr->var0.var2.var0.var0.var0.var1 + 1) = v14;
    *(_OWORD *)&retstr->var0.var2.var0.var1.var0[1] = *(_OWORD *)(v13 + 32);
    *(_QWORD *)(v13 + 32) = 0;
    *(_QWORD *)(v13 + 40) = 0;
    v15 = *(char **)(v13 + 48);
    v16 = *(_QWORD *)(v13 + 56);
    *(_QWORD *)(v13 + 48) = 0;
    retstr[1].var0.var2.var0.var0.var0.var1.var0 = v15;
    retstr[1].var0.var2.var0.var0.var0.var1.var1 = v16;
    *((_OWORD *)&retstr[1].var0.var2.var0.var0.var0.var1 + 1) = *(_OWORD *)(v13 + 64);
    retstr[1].var0.var2.var0.var1.var0[1] = *(_QWORD *)(v13 + 80);
    *(_QWORD *)(v13 + 64) = 0;
    *(_QWORD *)(v13 + 72) = 0;
    v17 = 1;
    *(_QWORD *)(v13 + 80) = 0;
  }
  LOBYTE(retstr[1].var0.var2.var0.var1.var0[2]) = v17;
  v20 = (void **)v19;
  std::vector<CLMiLoServiceTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v20);

  return result;
}

- (BOOL)updateLastActiveTime:(uint64_t)a3 forService:(uint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  double v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v23[0] = a4;
  v23[1] = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v23);
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("serviceUUID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50__ULServiceStore_updateLastActiveTime_forService___block_invoke;
  v15[3] = &unk_2511D4FB8;
  v15[4] = a1;
  v12 = v7;
  v18 = a2;
  v16 = v12;
  v17 = &v19;
  objc_msgSend(v11, "performBlockAndWait:", v15);

  v13 = *((_BYTE *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __50__ULServiceStore_updateLastActiveTime_forService___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v4, *(_QWORD *)(a1 + 40), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setLastActiveTimestamp:", *(double *)(a1 + 56), (_QWORD)v11);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "commitChangesToStore");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reset");

  }
}

- (BOOL)updateServiceLocationTypes:(uuid)a3 withLocationTypes:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uuid v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v21);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("serviceUUID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__ULServiceStore_updateServiceLocationTypes_withLocationTypes___block_invoke;
  v13[3] = &unk_2511D4FB8;
  v13[4] = self;
  v11 = v6;
  v15 = &v17;
  v16 = a4;
  v14 = v11;
  objc_msgSend(v10, "performBlockAndWait:", v13);

  LOBYTE(v6) = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  return (char)v6;
}

void __63__ULServiceStore_updateServiceLocationTypes_withLocationTypes___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v4, *(_QWORD *)(a1 + 40), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setLocationTypes:", *(_QWORD *)(a1 + 56), (_QWORD)v11);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "commitChangesToStore");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reset");

  }
}

- (id)getServiceUUIDsWithServiceType:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%u"), CFSTR("serviceType"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v8, CFSTR("serviceUUID"), 1, v5, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getAllServiceUUIDs:(unint64_t)a3
{
  objc_class *v5;
  void *v6;
  void *v7;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v6, CFSTR("serviceUUID"), 1, 0, 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)deleteOldestsServicesPerClientAboveMaxCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  std::string::size_type *v34;
  NSObject *v35;
  std::string::size_type v36;
  uint64_t v37;
  uint64_t v38;
  std::string::size_type *v39;
  _QWORD *v40;
  std::string::size_type v41;
  _QWORD **v42;
  _QWORD *v43;
  _QWORD **v44;
  std::string::size_type v45;
  _QWORD *v46;
  NSObject *v47;
  std::string::size_type v48;
  uint64_t *v49;
  uint64_t *v50;
  BOOL v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  NSObject *v55;
  std::string::size_type v56;
  __int128 *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  _OWORD *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  char v72;
  NSObject *v73;
  char *v74;
  NSObject *v75;
  ULServiceStore *v77;
  void *__p;
  void *v79;
  uint64_t v80;
  void *v81;
  char *v82;
  char *v83;
  std::string *v84;
  _QWORD *v85[2];
  uint64_t *v86;
  _QWORD *v87[2];
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  std::string v91;
  uint64_t v92;
  __int16 v93;
  unint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  -[ULServiceStore fetchAllRecordsWithLimit:](self, "fetchAllRecordsWithLimit:", 0);
  if (v88 != v89)
  {
    v87[0] = 0;
    v87[1] = 0;
    v86 = (uint64_t *)v87;
    +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultsDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMaximumNumberOfCreatedUnsupervisedServicesPerClientAfterMaintenance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = objc_msgSend(v6, "unsignedLongValue");
    else
      v7 = objc_msgSend(&unk_2511ED858, "unsignedLongValue");
    v8 = v7;

    v91.__r_.__value_.__r.__words[0] = 1;
    v84 = &v91;
    std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)&v91, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = v8;
    +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultsDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMaximumNumberOfCreatedBinaryRoiServicesPerClientAfterMaintenance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v13 = objc_msgSend(v12, "unsignedLongValue");
    else
      v13 = objc_msgSend(&unk_2511ED858, "unsignedLongValue");
    v14 = v13;

    v91.__r_.__value_.__r.__words[0] = 2;
    v84 = &v91;
    std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)&v91, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = v14;
    +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "defaultsDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMaximumNumberOfCreatedMulticlassServicesPerClientAfterMaintenance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v19 = objc_msgSend(v18, "unsignedLongValue");
    else
      v19 = objc_msgSend(&unk_2511ED858, "unsignedLongValue");
    v20 = v19;

    v91.__r_.__value_.__r.__words[0] = 3;
    v84 = &v91;
    std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)&v91, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = v20;
    +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "defaultsDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMaximumNumberOfCreatedSimilarityListServicesPerClientAfterMaintenance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v25 = objc_msgSend(v24, "unsignedLongValue");
    else
      v25 = objc_msgSend(&unk_2511ED870, "unsignedLongValue");
    v26 = v25;

    v91.__r_.__value_.__r.__words[0] = 4;
    v84 = &v91;
    std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)&v91, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = v26;
    v85[0] = 0;
    v85[1] = 0;
    v84 = (std::string *)v85;
    v27 = v88;
    v28 = v89;
    if (v88 == v89)
      goto LABEL_86;
    v77 = self;
    do
    {
      if (*(char *)(v27 + 55) < 0)
      {
        std::string::__init_copy_ctor_external(&v91, *(const std::string::value_type **)(v27 + 32), *(_QWORD *)(v27 + 40));
      }
      else
      {
        v29 = *(_OWORD *)(v27 + 32);
        v91.__r_.__value_.__r.__words[2] = *(_QWORD *)(v27 + 48);
        *(_OWORD *)&v91.__r_.__value_.__l.__data_ = v29;
      }
      v92 = *(_QWORD *)v27;
      v81 = &v91;
      v30 = std::__tree<std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>,std::__map_value_compare<std::pair<std::string,unsigned long long>,std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>,std::less<std::pair<std::string,unsigned long long>>,true>,std::allocator<std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>>>::__emplace_unique_key_args<std::pair<std::string,unsigned long long>,std::piecewise_construct_t const&,std::tuple<std::pair<std::string,unsigned long long>&&>,std::tuple<>>((uint64_t **)&v84, (const void **)&v91.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (__int128 **)&v81);
      v31 = v30[9];
      if (v31 >= v30[10])
      {
        v32 = std::vector<CLMiLoServiceTable::Entry>::__emplace_back_slow_path<CLMiLoServiceTable::Entry const&>(v30 + 8, v27);
      }
      else
      {
        std::allocator<CLMiLoServiceTable::Entry>::construct[abi:ne180100]<CLMiLoServiceTable::Entry,CLMiLoServiceTable::Entry const&>((uint64_t)(v30 + 10), v31, v27);
        v32 = v31 + 88;
        v30[9] = v31 + 88;
      }
      v30[9] = v32;
      if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v91.__r_.__value_.__l.__data_);
      v27 += 88;
    }
    while (v27 != v28);
    v33 = (uint64_t *)v84;
    v81 = 0;
    v82 = 0;
    v83 = 0;
    if (v84 == (std::string *)v85)
    {
LABEL_86:
      v72 = 1;
    }
    else
    {
      do
      {
        if (onceToken_MicroLocation_Default != -1)
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_44);
        v34 = (std::string::size_type *)(v33 + 4);
        v35 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (std::string::size_type)(v33 + 4);
          if (*((char *)v33 + 55) < 0)
            v36 = *v34;
          v37 = v33[7];
          v38 = 0x2E8BA2E8BA2E8BA3 * ((v33[9] - v33[8]) >> 3);
          LODWORD(v91.__r_.__value_.__l.__data_) = 136315650;
          *(std::string::size_type *)((char *)v91.__r_.__value_.__r.__words + 4) = v36;
          WORD2(v91.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v91.__r_.__value_.__r.__words[1] + 6) = v38;
          HIWORD(v91.__r_.__value_.__r.__words[2]) = 2048;
          v92 = v37;
          _os_log_impl(&dword_2419D9000, v35, OS_LOG_TYPE_DEFAULT, "Pre-Maintenance for services: client: %s has: %ld services of serviceType: %llU", (uint8_t *)&v91, 0x20u);
        }
        v39 = (std::string::size_type *)(v33 + 7);
        v40 = v87[0];
        if (!v87[0])
          goto LABEL_45;
        v41 = *v39;
        v42 = v87;
        do
        {
          v43 = v40;
          v44 = v42;
          v45 = v40[4];
          v46 = v40 + 1;
          if (v45 >= v41)
          {
            v46 = v43;
            v42 = (_QWORD **)v43;
          }
          v40 = (_QWORD *)*v46;
        }
        while (v40);
        if (v42 == v87)
          goto LABEL_45;
        if (v45 < v41)
          v43 = v44;
        if (v41 >= v43[4])
        {
          v90 = v33 + 7;
          v52 = std::__tree<std::__value_type<unsigned long long,unsigned long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v86, (unint64_t *)v33 + 7, (uint64_t)&std::piecewise_construct, &v90)[5];
          v53 = 0x2E8BA2E8BA2E8BA3 * ((v33[9] - v33[8]) >> 3);
          v54 = v53 - v52;
          if (v53 > v52)
          {
            if (onceToken_MicroLocation_Default != -1)
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_44);
            v55 = logObject_MicroLocation_Default;
            if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
            {
              if (*((char *)v33 + 55) < 0)
                v34 = (std::string::size_type *)*v34;
              v56 = *v39;
              LODWORD(v91.__r_.__value_.__l.__data_) = 134218754;
              *(std::string::size_type *)((char *)v91.__r_.__value_.__r.__words + 4) = v53 - v52;
              WORD2(v91.__r_.__value_.__r.__words[1]) = 2080;
              *(std::string::size_type *)((char *)&v91.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v34;
              HIWORD(v91.__r_.__value_.__r.__words[2]) = 2048;
              v92 = v56;
              v93 = 2048;
              v94 = v52;
              _os_log_impl(&dword_2419D9000, v55, OS_LOG_TYPE_DEFAULT, "%ld entries to be deleted for client: %s serviceType: %llU (max allowed: %ld)", (uint8_t *)&v91, 0x2Au);
            }
            v57 = (__int128 *)v33[8];
            v58 = v33[9];
            v59 = 126 - 2 * __clz(0x2E8BA2E8BA2E8BA3 * ((v58 - (uint64_t)v57) >> 3));
            if ((__int128 *)v58 == v57)
              v60 = 0;
            else
              v60 = v59;
            std::__introsort<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *,false>(v57, v58, v60, 1);
            if (v53 != v52)
            {
              v61 = v33[8];
              v62 = v82;
              do
              {
                v63 = (_OWORD *)(v61 + 8);
                if (v62 >= v83)
                {
                  v64 = (v62 - (_BYTE *)v81) >> 4;
                  if ((unint64_t)(v64 + 1) >> 60)
                    std::vector<CLMicroLocationProto::ConfidenceReason>::__throw_length_error[abi:ne180100]();
                  v65 = (v83 - (_BYTE *)v81) >> 3;
                  if (v65 <= v64 + 1)
                    v65 = v64 + 1;
                  if ((unint64_t)(v83 - (_BYTE *)v81) >= 0x7FFFFFFFFFFFFFF0)
                    v66 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v66 = v65;
                  if (v66)
                    v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<boost::uuids::uuid>>((uint64_t)&v83, v66);
                  else
                    v67 = 0;
                  v68 = &v67[16 * v64];
                  *(_OWORD *)v68 = *v63;
                  v70 = (char *)v81;
                  v69 = v82;
                  v71 = v68;
                  if (v82 != v81)
                  {
                    do
                    {
                      *((_OWORD *)v71 - 1) = *((_OWORD *)v69 - 1);
                      v71 -= 16;
                      v69 -= 16;
                    }
                    while (v69 != v70);
                    v69 = (char *)v81;
                  }
                  v62 = v68 + 16;
                  v81 = v71;
                  v82 = v68 + 16;
                  v83 = &v67[16 * v66];
                  if (v69)
                    operator delete(v69);
                }
                else
                {
                  *(_OWORD *)v62 = *v63;
                  v62 += 16;
                }
                v82 = v62;
                v61 += 88;
              }
              while (v61 != v33[8] + 88 * v54);
            }
          }
        }
        else
        {
LABEL_45:
          if (onceToken_MicroLocation_Default != -1)
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_44);
          v47 = logObject_MicroLocation_Default;
          if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
          {
            v48 = *v39;
            LODWORD(v91.__r_.__value_.__l.__data_) = 134217984;
            *(std::string::size_type *)((char *)v91.__r_.__value_.__r.__words + 4) = v48;
            _os_log_impl(&dword_2419D9000, v47, OS_LOG_TYPE_ERROR, "serviceType %llU not handled in delete old services per client", (uint8_t *)&v91, 0xCu);
          }
        }
        v49 = (uint64_t *)v33[1];
        if (v49)
        {
          do
          {
            v50 = v49;
            v49 = (uint64_t *)*v49;
          }
          while (v49);
        }
        else
        {
          do
          {
            v50 = (uint64_t *)v33[2];
            v51 = *v50 == (_QWORD)v33;
            v33 = v50;
          }
          while (!v51);
        }
        v33 = v50;
      }
      while (v50 != (uint64_t *)v85);
      v74 = v82;
      if (v81 == v82)
      {
        v72 = 1;
        if (!v82)
          goto LABEL_101;
      }
      else
      {
        if (onceToken_MicroLocation_Default != -1)
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_44);
        v75 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v91.__r_.__value_.__l.__data_) = 134217984;
          *(std::string::size_type *)((char *)v91.__r_.__value_.__r.__words + 4) = (v82 - (_BYTE *)v81) >> 4;
          _os_log_impl(&dword_2419D9000, v75, OS_LOG_TYPE_DEFAULT, "Deleting total %ld service entries", (uint8_t *)&v91, 0xCu);
        }
        __p = 0;
        v79 = 0;
        v80 = 0;
        std::vector<boost::uuids::uuid>::__init_with_size[abi:ne180100]<boost::uuids::uuid*,boost::uuids::uuid*>(&__p, v81, (uint64_t)v82, (v82 - (_BYTE *)v81) >> 4);
        v72 = -[ULServiceStore deleteAllServicesWithUUIDs:](v77, "deleteAllServicesWithUUIDs:", &__p);
        if (__p)
        {
          v79 = __p;
          operator delete(__p);
        }
        v74 = (char *)v81;
        if (!v81)
          goto LABEL_101;
      }
      v82 = v74;
      operator delete(v74);
    }
LABEL_101:
    std::__tree<std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>,std::__map_value_compare<std::pair<std::string,unsigned long long>,std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>,std::less<std::pair<std::string,unsigned long long>>,true>,std::allocator<std::__value_type<std::pair<std::string,unsigned long long>,std::vector<CLMiLoServiceTable::Entry>>>>::destroy((uint64_t)&v84, v85[0]);
    std::__tree<std::__value_type<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes,double>,std::__map_value_compare<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes,std::__value_type<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes,double>,std::less<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes>,true>,std::allocator<std::__value_type<CLMicroLocationLocalizationSettings::LocalizerSettingsTypes,double>>>::destroy((uint64_t)&v86, v87[0]);
    goto LABEL_102;
  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_44);
  v73 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v91.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_2419D9000, v73, OS_LOG_TYPE_DEFAULT, "Pre-Maintenance for services: no services found.", (uint8_t *)&v91, 2u);
  }
  v72 = 1;
LABEL_102:
  v91.__r_.__value_.__r.__words[0] = (std::string::size_type)&v88;
  std::vector<CLMiLoServiceTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v91);
  return v72;
}

- (BOOL)updateAllServicesWithMatchingServiceUUID:(uuid)a3 withNewServiceUUID:(uuid)a4
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

- (BOOL)updateAllServicesWithMatchingClientId:()basic_string<char withNewClientId:()std:(std::allocator<char>> *)var0 :char_traits<char>
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

- (void)deleteOldestsServicesPerClientAboveMaxCount
{
  char *v6;
  __int128 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  unint64_t v15;
  double v16;
  uint64_t v17;
  void **v18;
  char v19;
  uint64_t v20;
  void **v21;
  __int128 v22;
  char v23;
  double v24;
  char *v25;
  unint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  void **v30;
  char v31;
  uint64_t v32;
  char v33;
  void **v34;
  __int128 v35;
  char v36;
  __int128 *v37;
  unint64_t v38;
  double v39;
  double v40;
  unint64_t v41;
  double v42;
  __int128 *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  _BOOL4 v50;
  double *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  __int128 *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 **v63;
  uint64_t *v64;
  char *v65;
  BOOL v67;
  uint64_t v68;
  __int128 *v69;
  char *v70;
  __int128 v71;
  double v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  __int128 v76;
  char v77;
  uint64_t v78;
  char *v79;
  __int128 v80;
  void **v81;
  char *v82;
  char *v83;
  uint64_t v84;
  __int128 v85;
  int64_t v86;
  int64_t v87;
  int64_t v88;
  uint64_t v89;
  double *v90;
  double v91;
  double *v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  double *v96;
  __int128 v97;
  void **v98;
  __int128 v99;
  void **v100;
  __int128 v101;
  uint64_t v102;
  __int128 v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  int64_t v107;
  uint64_t v108;
  char *v109;
  __int128 v110;
  uint64_t v111;
  uint64_t v112;
  __int128 *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  int64_t v117;
  __int128 v118;
  void **v119;
  void **v120;
  __int128 v121;
  void **v122;
  __int128 v123;
  void **v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  int v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  double v134;
  __int128 v135;
  void *v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  char *v140;
  __int128 v141;
  void **v142;
  void **v143;
  __int128 v144;
  char *v145;
  _QWORD *v146;
  uint64_t v147;
  void **v148;
  char *v149;
  __int128 v150;
  char *v151;
  __int128 v152;
  uint64_t v153;
  int v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  uint64_t v158;
  __int128 v159;
  _BYTE *v161;
  __int128 *v162;
  __int128 v163;
  double v164;
  uint64_t v165;
  char v166;
  uint64_t v167;
  char v168;
  __int128 v169;
  char v170;
  _BYTE *v171;
  void **v172;
  _BYTE *v173;
  uint64_t v174;
  __int128 v175;
  uint64_t v176;
  int v177;
  uint64_t v178;
  __int128 v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char v185;
  uint64_t v186;
  void *v187;
  char v188;
  char v189;
  char v190;
  char v191;
  int v192;
  char v193;
  char v194;
  uint64_t v195;
  char v196;
  uint64_t v197;
  char *v198;
  char *v199;
  char v200;
  char v201;
  char *v202;
  __int128 *v203;
  _BYTE v204[15];
  _BYTE v205[15];
  __int128 v206;
  __int128 v207;
  _BYTE v208[22];
  _BYTE v209[15];
  _BYTE v210[24];
  uint64_t v211;

  v6 = (char *)a2;
  v7 = a1;
  v211 = *MEMORY[0x24BDAC8D0];
  v202 = (char *)a2;
  v203 = a1;
  while (2)
  {
    v8 = v6 - (char *)v7;
    v9 = 0x2E8BA2E8BA2E8BA3 * ((v6 - (char *)v7) >> 3);
    switch(v9)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v202 = v6 - 88;
        if (*((double *)v6 - 8) < *((double *)v7 + 3))
        {
          v63 = &v203;
          v64 = (uint64_t *)&v202;
          goto LABEL_76;
        }
        return;
      case 3uLL:
        v202 = v6 - 88;
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((double *)v7, (double *)v7 + 11, (uint64_t)(v6 - 88));
        return;
      case 4uLL:
        v202 = v6 - 88;
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((uint64_t)v7, (double *)v7 + 11, (uint64_t)(v7 + 11), (uint64_t)(v6 - 88));
        return;
      case 5uLL:
        v202 = v6 - 88;
        *(_QWORD *)&v206 = v7;
        *(_QWORD *)v210 = (char *)v7 + 88;
        *(_QWORD *)v208 = v7 + 11;
        *(_QWORD *)v209 = (char *)v7 + 264;
        *(_QWORD *)v205 = v6 - 88;
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((uint64_t)v7, (double *)v7 + 11, (uint64_t)(v7 + 11), (uint64_t)v7 + 264);
        if (*((double *)v6 - 8) < *((double *)v7 + 36))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((__int128 **)v209, (uint64_t *)v205);
          if (*(double *)(*(_QWORD *)v209 + 24) < *((double *)v7 + 25))
          {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((__int128 **)v208, (uint64_t *)v209);
            if (*(double *)(*(_QWORD *)v208 + 24) < *((double *)v7 + 14))
            {
              std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((__int128 **)v210, (uint64_t *)v208);
              if (*(double *)(*(_QWORD *)v210 + 24) < *((double *)v7 + 3))
              {
                v63 = (__int128 **)&v206;
                v64 = (uint64_t *)v210;
LABEL_76:
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>(v63, v64);
              }
            }
          }
        }
        return;
      default:
        if (v8 <= 2111)
        {
          v65 = (char *)v7 + 88;
          v67 = v7 == (__int128 *)v6 || v65 == v6;
          if ((a4 & 1) != 0)
          {
            if (!v67)
            {
              v68 = 0;
              v69 = v7;
              v198 = v6;
              do
              {
                v70 = v65;
                if (*((double *)v69 + 14) < *((double *)v69 + 3))
                {
                  v71 = *(_OWORD *)v65;
                  *(_QWORD *)&v207 = *((_QWORD *)v65 + 2);
                  v206 = v71;
                  v72 = *((double *)v65 + 3);
                  v73 = *((_QWORD *)v69 + 15);
                  *(_QWORD *)v208 = *((_QWORD *)v69 + 16);
                  *(_QWORD *)&v208[7] = *(_QWORD *)((char *)v69 + 135);
                  v74 = *((_BYTE *)v69 + 143);
                  *((_QWORD *)v69 + 15) = 0;
                  *((_QWORD *)v69 + 16) = 0;
                  *((_QWORD *)v69 + 17) = 0;
                  v75 = *((_QWORD *)v69 + 18);
                  v193 = *((_BYTE *)v69 + 152);
                  v76 = *(__int128 *)((char *)v69 + 153);
                  *(_QWORD *)&v210[14] = *(_QWORD *)((char *)v69 + 167);
                  v77 = *((_BYTE *)v69 + 175);
                  *((_QWORD *)v69 + 19) = 0;
                  *((_QWORD *)v69 + 20) = 0;
                  *((_QWORD *)v69 + 21) = 0;
                  v78 = v68;
                  *(_OWORD *)v210 = v76;
                  while (1)
                  {
                    v79 = (char *)v7 + v78;
                    v80 = *(__int128 *)((char *)v7 + v78 + 16);
                    *(_OWORD *)(v79 + 88) = *(__int128 *)((char *)v7 + v78);
                    *(_OWORD *)(v79 + 104) = v80;
                    v81 = (void **)((char *)v7 + v78 + 120);
                    if (*((char *)v7 + v78 + 143) < 0)
                      operator delete(*v81);
                    *(_OWORD *)v81 = *((_OWORD *)v79 + 2);
                    *(_QWORD *)((char *)v7 + v78 + 136) = *((_QWORD *)v79 + 6);
                    v79[55] = 0;
                    v79[32] = 0;
                    *((_QWORD *)v79 + 18) = *((_QWORD *)v79 + 7);
                    v82 = v79 + 152;
                    if (v79[175] < 0)
                      operator delete(*(void **)v82);
                    v83 = (char *)v7 + v78;
                    *(_OWORD *)v82 = *(__int128 *)((char *)v7 + v78 + 64);
                    *((_QWORD *)v82 + 2) = *(_QWORD *)((char *)v7 + v78 + 80);
                    v83[87] = 0;
                    v83[64] = 0;
                    if (!v78)
                      break;
                    v78 -= 88;
                    if (v72 >= *((double *)v83 - 8))
                    {
                      v84 = (uint64_t)v7 + v78 + 88;
                      goto LABEL_103;
                    }
                  }
                  v84 = (uint64_t)v7;
LABEL_103:
                  v85 = v206;
                  *(_QWORD *)(v84 + 16) = v207;
                  *(_OWORD *)v84 = v85;
                  *(double *)(v84 + 24) = v72;
                  if (*(char *)(v84 + 55) < 0)
                    operator delete(*((void **)v83 + 4));
                  *((_QWORD *)v83 + 4) = v73;
                  *(_QWORD *)(v84 + 40) = *(_QWORD *)v208;
                  *(_QWORD *)(v84 + 47) = *(_QWORD *)&v208[7];
                  *(_BYTE *)(v84 + 55) = v74;
                  *(_QWORD *)(v84 + 56) = v75;
                  v6 = v198;
                  if (*(char *)(v84 + 87) < 0)
                    operator delete(*((void **)v83 + 8));
                  v83[64] = v193;
                  *(_OWORD *)(v84 + 65) = *(_OWORD *)v210;
                  *(_QWORD *)(v84 + 79) = *(_QWORD *)&v210[14];
                  *(_BYTE *)(v84 + 87) = v77;
                }
                v65 = v70 + 88;
                v68 += 88;
                v69 = (__int128 *)v70;
              }
              while (v70 + 88 != v6);
            }
          }
          else if (!v67)
          {
            v161 = (char *)v7 + 175;
            do
            {
              v162 = (__int128 *)v65;
              if (*((double *)v7 + 14) < *((double *)v7 + 3))
              {
                v163 = *(_OWORD *)v65;
                *(_QWORD *)&v207 = *((_QWORD *)v65 + 2);
                v206 = v163;
                v164 = *((double *)v65 + 3);
                v165 = *((_QWORD *)v7 + 15);
                *(_QWORD *)v208 = *((_QWORD *)v7 + 16);
                *(_QWORD *)&v208[7] = *(_QWORD *)((char *)v7 + 135);
                v166 = *((_BYTE *)v7 + 143);
                *((_QWORD *)v7 + 15) = 0;
                *((_QWORD *)v7 + 16) = 0;
                *((_QWORD *)v7 + 17) = 0;
                v167 = *((_QWORD *)v7 + 18);
                v168 = *((_BYTE *)v7 + 152);
                v169 = *(__int128 *)((char *)v7 + 153);
                *(_QWORD *)&v210[14] = *(_QWORD *)((char *)v7 + 167);
                v170 = *((_BYTE *)v7 + 175);
                *((_QWORD *)v7 + 19) = 0;
                *((_QWORD *)v7 + 20) = 0;
                *((_QWORD *)v7 + 21) = 0;
                v171 = v161;
                *(_OWORD *)v210 = v169;
                do
                {
                  *(_OWORD *)(v171 - 87) = *(_OWORD *)(v171 - 175);
                  *(_OWORD *)(v171 - 71) = *(_OWORD *)(v171 - 159);
                  v172 = (void **)(v171 - 55);
                  if ((char)*(v171 - 32) < 0)
                    operator delete(*v172);
                  *(_OWORD *)v172 = *(_OWORD *)(v171 - 143);
                  *(_QWORD *)(v171 - 39) = *(_QWORD *)(v171 - 127);
                  *(v171 - 120) = 0;
                  *(v171 - 143) = 0;
                  *(_QWORD *)(v171 - 31) = *(_QWORD *)(v171 - 119);
                  v173 = v171 - 23;
                  if ((char)*v171 < 0)
                    operator delete(*(void **)v173);
                  v174 = *(_QWORD *)(v171 - 95);
                  *(v171 - 88) = 0;
                  v171 -= 88;
                  *((_QWORD *)v173 + 2) = v174;
                  *(_OWORD *)v173 = *(_OWORD *)(v171 - 23);
                  *(v171 - 23) = 0;
                }
                while (v164 < *(double *)(v171 - 151));
                v175 = v206;
                *(_QWORD *)(v171 - 71) = v207;
                *(_OWORD *)(v171 - 87) = v175;
                *(double *)(v171 - 63) = v164;
                if ((char)*(v171 - 32) < 0)
                {
                  operator delete(*(void **)(v171 - 55));
                  v177 = (char)*v171;
                  *(_QWORD *)(v171 - 55) = v165;
                  v178 = *(_QWORD *)&v208[7];
                  *(_QWORD *)(v171 - 47) = *(_QWORD *)v208;
                  *((_QWORD *)v171 - 5) = v178;
                  *(v171 - 32) = v166;
                  *(_QWORD *)(v171 - 31) = v167;
                  if (v177 < 0)
                    operator delete(*(void **)(v171 - 23));
                }
                else
                {
                  *(_QWORD *)(v171 - 55) = v165;
                  v176 = *(_QWORD *)v208;
                  *((_QWORD *)v171 - 5) = *(_QWORD *)&v208[7];
                  *(_QWORD *)(v171 - 47) = v176;
                  *(v171 - 32) = v166;
                  *(_QWORD *)(v171 - 31) = v167;
                }
                *(v171 - 23) = v168;
                v179 = *(_OWORD *)v210;
                *((_QWORD *)v171 - 1) = *(_QWORD *)&v210[14];
                *(_OWORD *)(v171 - 22) = v179;
                *v171 = v170;
              }
              v65 = (char *)v162 + 88;
              v161 += 88;
              v7 = v162;
            }
            while ((char *)v162 + 88 != v6);
          }
        }
        else if (a3)
        {
          v10 = v9 >> 1;
          v11 = (uint64_t)(v6 - 88);
          if ((unint64_t)v8 < 0x2C01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((double *)v7 + 11 * (v9 >> 1), (double *)v7, v11);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((double *)v7, (double *)v7 + 11 * (v9 >> 1), v11);
            v12 = 88 * v10;
            v13 = 88 * v10 - 88;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((double *)v203 + 11, (double *)((char *)v203 + v13), (uint64_t)(v202 - 176));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((double *)v203 + 22, (double *)((char *)v203 + v12 + 88), (uint64_t)(v202 - 264));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((double *)((char *)v203 + v13), (double *)((char *)v203 + v12), (uint64_t)v203 + v12 + 88);
            *(_QWORD *)&v206 = (char *)v203 + v12;
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>(&v203, (uint64_t *)&v206);
          }
          v14 = v203;
          v197 = a3 - 1;
          if ((a4 & 1) != 0)
          {
            v192 = a4;
            v15 = (unint64_t)v202;
            v16 = *((double *)v203 + 3);
          }
          else
          {
            v16 = *((double *)v203 + 3);
            v15 = (unint64_t)v202;
            if (*((double *)v203 - 8) >= v16)
            {
              *(_QWORD *)v205 = v202;
              v206 = *v203;
              *(_QWORD *)&v207 = *((_QWORD *)v203 + 2);
              v30 = (void **)(v203 + 2);
              v29 = *((_QWORD *)v203 + 4);
              *(_QWORD *)v208 = *((_QWORD *)v203 + 5);
              *(_QWORD *)&v208[7] = *(_QWORD *)((char *)v203 + 47);
              v31 = *((_BYTE *)v203 + 55);
              *((_QWORD *)v203 + 4) = 0;
              *((_QWORD *)v14 + 5) = 0;
              *((_QWORD *)v14 + 6) = 0;
              v32 = *((_QWORD *)v14 + 7);
              v34 = (void **)(v14 + 4);
              v33 = *((_BYTE *)v14 + 64);
              v35 = *(__int128 *)((char *)v14 + 65);
              *(_QWORD *)&v210[14] = *(_QWORD *)((char *)v14 + 79);
              *(_OWORD *)v210 = v35;
              v36 = *((_BYTE *)v14 + 87);
              *((_QWORD *)v14 + 8) = 0;
              *((_QWORD *)v14 + 9) = 0;
              *((_QWORD *)v14 + 10) = 0;
              if (v16 >= *(double *)(v15 - 64))
              {
                v51 = (double *)v14 + 11;
                do
                {
                  v38 = (unint64_t)v51;
                  if ((unint64_t)v51 >= v15)
                    break;
                  v52 = v51[3];
                  v51 += 11;
                }
                while (v16 >= v52);
              }
              else
              {
                v37 = v14;
                do
                {
                  v38 = (unint64_t)v37 + 88;
                  v39 = *((double *)v37 + 14);
                  v37 = (__int128 *)((char *)v37 + 88);
                }
                while (v16 >= v39);
              }
              *(_QWORD *)v209 = v38;
              if (v38 >= v15)
                goto LABEL_55;
              do
              {
                v53 = *(double *)(v15 - 64);
                v15 -= 88;
              }
              while (v16 < v53);
              while (1)
              {
                *(_QWORD *)v205 = v15;
LABEL_55:
                if (v38 >= v15)
                  break;
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((__int128 **)v209, (uint64_t *)v205);
                v38 = *(_QWORD *)v209;
                do
                {
                  v54 = *(double *)(v38 + 112);
                  v38 += 88;
                }
                while (v16 >= v54);
                *(_QWORD *)v209 = v38;
                v15 = *(_QWORD *)v205;
                do
                {
                  v55 = *(double *)(v15 - 64);
                  v15 -= 88;
                }
                while (v16 < v55);
              }
              v56 = (__int128 *)(v38 - 88);
              if ((__int128 *)(v38 - 88) != v14)
              {
                v57 = *(_OWORD *)(v38 - 72);
                *v14 = *v56;
                v14[1] = v57;
                if (*((char *)v14 + 55) < 0)
                  operator delete(*v30);
                v58 = *(_OWORD *)(v38 - 56);
                *((_QWORD *)v14 + 6) = *(_QWORD *)(v38 - 40);
                *(_OWORD *)v30 = v58;
                *(_BYTE *)(v38 - 33) = 0;
                *(_BYTE *)(v38 - 56) = 0;
                *((_QWORD *)v14 + 7) = *(_QWORD *)(v38 - 32);
                if (*((char *)v14 + 87) < 0)
                  operator delete(*v34);
                v59 = *(_OWORD *)(v38 - 24);
                *((_QWORD *)v14 + 10) = *(_QWORD *)(v38 - 8);
                *(_OWORD *)v34 = v59;
                *(_BYTE *)(v38 - 1) = 0;
                *(_BYTE *)(v38 - 24) = 0;
              }
              v60 = v206;
              *(_QWORD *)(v38 - 72) = v207;
              *v56 = v60;
              *(double *)(v38 - 64) = v16;
              if (*(char *)(v38 - 33) < 0)
                operator delete(*(void **)(v38 - 56));
              *(_QWORD *)(v38 - 56) = v29;
              v61 = *(_QWORD *)v208;
              *(_QWORD *)(v38 - 41) = *(_QWORD *)&v208[7];
              *(_QWORD *)(v38 - 48) = v61;
              *(_BYTE *)(v38 - 33) = v31;
              *(_QWORD *)(v38 - 32) = v32;
              if (*(char *)(v38 - 1) < 0)
                operator delete(*(void **)(v38 - 24));
              a4 = 0;
              *(_BYTE *)(v38 - 24) = v33;
              v62 = *(_OWORD *)v210;
              *(_QWORD *)(v38 - 9) = *(_QWORD *)&v210[14];
              *(_OWORD *)(v38 - 23) = v62;
              *(_BYTE *)(v38 - 1) = v36;
              v7 = *(__int128 **)v209;
              v203 = *(__int128 **)v209;
              a3 = v197;
LABEL_72:
              v6 = v202;
              continue;
            }
            v192 = a4;
          }
          v17 = 0;
          v206 = *v203;
          *(_QWORD *)&v207 = *((_QWORD *)v203 + 2);
          v18 = (void **)(v203 + 2);
          v184 = *((_QWORD *)v203 + 4);
          *(_QWORD *)v208 = *((_QWORD *)v203 + 5);
          *(_QWORD *)&v208[7] = *(_QWORD *)((char *)v203 + 47);
          v19 = *((_BYTE *)v203 + 55);
          *((_QWORD *)v203 + 4) = 0;
          *((_QWORD *)v14 + 5) = 0;
          *((_QWORD *)v14 + 6) = 0;
          v20 = *((_QWORD *)v14 + 7);
          v21 = (void **)(v14 + 4);
          v188 = *((_BYTE *)v14 + 64);
          v22 = *(__int128 *)((char *)v14 + 65);
          *(_QWORD *)&v210[14] = *(_QWORD *)((char *)v14 + 79);
          *(_OWORD *)v210 = v22;
          v23 = *((_BYTE *)v14 + 87);
          *((_QWORD *)v14 + 8) = 0;
          *((_QWORD *)v14 + 9) = 0;
          *((_QWORD *)v14 + 10) = 0;
          do
          {
            v24 = *(double *)((char *)v14 + v17 + 112);
            v17 += 88;
          }
          while (v24 < v16);
          v25 = (char *)v14 + v17;
          *(_QWORD *)v209 = (char *)v14 + v17;
          if (v17 == 88)
          {
            while ((unint64_t)v25 < v15)
            {
              v26 = v15 - 88;
              v28 = *(double *)(v15 - 64);
              v15 -= 88;
              if (v28 < v16)
                goto LABEL_25;
            }
            v26 = v15;
          }
          else
          {
            do
            {
              v26 = v15 - 88;
              v27 = *(double *)(v15 - 64);
              v15 -= 88;
            }
            while (v27 >= v16);
          }
LABEL_25:
          *(_QWORD *)v205 = v26;
          v7 = (__int128 *)((char *)v14 + v17);
          if ((unint64_t)v25 < v26)
          {
            do
            {
              std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMiLoServiceTable::Entry *&,CLMiLoServiceTable::Entry *&>((__int128 **)v209, (uint64_t *)v205);
              v7 = *(__int128 **)v209;
              do
              {
                v40 = *((double *)v7 + 14);
                v7 = (__int128 *)((char *)v7 + 88);
              }
              while (v40 < v16);
              *(_QWORD *)v209 = v7;
              v41 = *(_QWORD *)v205;
              do
              {
                v42 = *(double *)(v41 - 64);
                v41 -= 88;
              }
              while (v42 >= v16);
              *(_QWORD *)v205 = v41;
            }
            while ((unint64_t)v7 < v41);
          }
          v43 = (__int128 *)((char *)v7 - 88);
          if ((__int128 *)((char *)v7 - 88) != v14)
          {
            v44 = *(__int128 *)((char *)v7 - 72);
            *v14 = *v43;
            v14[1] = v44;
            if (*((char *)v14 + 55) < 0)
              operator delete(*v18);
            v45 = *(__int128 *)((char *)v7 - 56);
            *((_QWORD *)v14 + 6) = *((_QWORD *)v7 - 5);
            *(_OWORD *)v18 = v45;
            *((_BYTE *)v7 - 33) = 0;
            *((_BYTE *)v7 - 56) = 0;
            *((_QWORD *)v14 + 7) = *((_QWORD *)v7 - 4);
            if (*((char *)v14 + 87) < 0)
              operator delete(*v21);
            v46 = *(__int128 *)((char *)v7 - 24);
            *((_QWORD *)v14 + 10) = *((_QWORD *)v7 - 1);
            *(_OWORD *)v21 = v46;
            *((_BYTE *)v7 - 1) = 0;
            *((_BYTE *)v7 - 24) = 0;
          }
          v47 = v206;
          *((_QWORD *)v7 - 9) = v207;
          *v43 = v47;
          *((double *)v7 - 8) = v16;
          if (*((char *)v7 - 33) < 0)
            operator delete(*((void **)v7 - 7));
          *((_QWORD *)v7 - 7) = v184;
          v48 = *(_QWORD *)v208;
          *(_QWORD *)((char *)v7 - 41) = *(_QWORD *)&v208[7];
          *((_QWORD *)v7 - 6) = v48;
          *((_BYTE *)v7 - 33) = v19;
          *((_QWORD *)v7 - 4) = v20;
          if (*((char *)v7 - 1) < 0)
            operator delete(*((void **)v7 - 3));
          *((_BYTE *)v7 - 24) = v188;
          v49 = *(_OWORD *)v210;
          *(_QWORD *)((char *)v7 - 9) = *(_QWORD *)&v210[14];
          *(__int128 *)((char *)v7 - 23) = v49;
          *((_BYTE *)v7 - 1) = v23;
          a3 = v197;
          a4 = v192;
          if ((unint64_t)v25 < v26)
          {
LABEL_42:
            std::__introsort<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *,false>(v203, (char *)v7 - 88, v197, v192 & 1);
            a4 = 0;
LABEL_43:
            v203 = v7;
            goto LABEL_72;
          }
          v50 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((uint64_t)v203, (uint64_t)v7 - 88);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULServiceStore deleteOldestsServicesPerClientAboveMaxCount]::$_0 &,CLMiLoServiceTable::Entry *>((uint64_t)v7, (uint64_t)v202))
          {
            if (v50)
              goto LABEL_43;
            goto LABEL_42;
          }
          if (!v50)
          {
            v202 = (char *)v7 - 88;
            v7 = v203;
            goto LABEL_72;
          }
        }
        else if (v7 != (__int128 *)v6)
        {
          v86 = (v9 - 2) >> 1;
          v87 = v86;
          v199 = v6;
          do
          {
            v88 = v87;
            if (v86 >= v87)
            {
              v89 = (2 * v87) | 1;
              v90 = (double *)v7 + 11 * v89;
              if (2 * v88 + 2 < (uint64_t)v9 && *((double *)v7 + 11 * v89 + 3) < v90[14])
              {
                v90 += 11;
                v89 = 2 * v88 + 2;
              }
              v91 = *((double *)v7 + 11 * v88 + 3);
              if (v90[3] >= v91)
              {
                v92 = (double *)v7 + 11 * v88;
                v93 = *(_OWORD *)v92;
                *(double *)&v207 = v92[2];
                v206 = v93;
                v181 = *((_QWORD *)v92 + 4);
                v94 = *((_QWORD *)v92 + 5);
                *(double *)&v208[7] = *(double *)((char *)v92 + 47);
                *(_QWORD *)v208 = v94;
                v185 = *((_BYTE *)v92 + 55);
                v92[4] = 0.0;
                v92[5] = 0.0;
                v92[6] = 0.0;
                v180 = *((_QWORD *)v92 + 7);
                v194 = *((_BYTE *)v92 + 64);
                v95 = *(_QWORD *)((char *)v92 + 79);
                *(_OWORD *)v210 = *(_OWORD *)((char *)v92 + 65);
                *(_QWORD *)&v210[14] = v95;
                v189 = *((_BYTE *)v92 + 87);
                v92[8] = 0.0;
                v92[9] = 0.0;
                v92[10] = 0.0;
                do
                {
                  v96 = v90;
                  v97 = *((_OWORD *)v90 + 1);
                  *(_OWORD *)v92 = *(_OWORD *)v90;
                  *((_OWORD *)v92 + 1) = v97;
                  v98 = (void **)(v92 + 4);
                  if (*((char *)v92 + 55) < 0)
                    operator delete(*v98);
                  v99 = *((_OWORD *)v96 + 2);
                  v92[6] = v96[6];
                  *(_OWORD *)v98 = v99;
                  *((_BYTE *)v96 + 55) = 0;
                  *((_BYTE *)v96 + 32) = 0;
                  v92[7] = v96[7];
                  v100 = (void **)(v92 + 8);
                  if (*((char *)v92 + 87) < 0)
                    operator delete(*v100);
                  v101 = *((_OWORD *)v96 + 4);
                  v92[10] = v96[10];
                  *(_OWORD *)v100 = v101;
                  *((_BYTE *)v96 + 87) = 0;
                  *((_BYTE *)v96 + 64) = 0;
                  if (v86 < v89)
                    break;
                  v102 = (2 * v89) | 1;
                  v90 = (double *)v7 + 11 * v102;
                  if (2 * v89 + 2 < (uint64_t)v9 && *((double *)v7 + 11 * v102 + 3) < v90[14])
                  {
                    v90 += 11;
                    v102 = 2 * v89 + 2;
                  }
                  v92 = v96;
                  v89 = v102;
                }
                while (v90[3] >= v91);
                v103 = v206;
                *((_QWORD *)v96 + 2) = v207;
                *(_OWORD *)v96 = v103;
                v96[3] = v91;
                if (*((char *)v96 + 55) < 0)
                {
                  operator delete(*((void **)v96 + 4));
                  v105 = *((char *)v96 + 87);
                  v106 = *(_QWORD *)v208;
                  *((_QWORD *)v96 + 4) = v181;
                  *((_QWORD *)v96 + 5) = v106;
                  *(double *)((char *)v96 + 47) = *(double *)&v208[7];
                  *((_BYTE *)v96 + 55) = v185;
                  *((_QWORD *)v96 + 7) = v180;
                  v6 = v199;
                  if (v105 < 0)
                    operator delete(*((void **)v96 + 8));
                }
                else
                {
                  v104 = *(_QWORD *)v208;
                  *((_QWORD *)v96 + 4) = v181;
                  *((_QWORD *)v96 + 5) = v104;
                  *(double *)((char *)v96 + 47) = *(double *)&v208[7];
                  *((_BYTE *)v96 + 55) = v185;
                  *((_QWORD *)v96 + 7) = v180;
                  v6 = v199;
                }
                *((_BYTE *)v96 + 64) = v194;
                *(_OWORD *)((char *)v96 + 65) = *(_OWORD *)v210;
                *(double *)((char *)v96 + 79) = *(double *)&v210[14];
                *((_BYTE *)v96 + 87) = v189;
              }
            }
            v87 = v88 - 1;
          }
          while (v88);
          v107 = v8 / 0x58uLL;
          do
          {
            v108 = 0;
            v109 = v6;
            v110 = v7[1];
            v206 = *v7;
            v207 = v110;
            v111 = *((_QWORD *)v7 + 4);
            *(_QWORD *)v205 = *((_QWORD *)v7 + 5);
            *(_QWORD *)&v205[7] = *(_QWORD *)((char *)v7 + 47);
            v190 = *((_BYTE *)v7 + 55);
            *((_QWORD *)v7 + 5) = 0;
            *((_QWORD *)v7 + 6) = 0;
            *((_QWORD *)v7 + 4) = 0;
            v182 = v111;
            v186 = *((_QWORD *)v7 + 7);
            v195 = *((_QWORD *)v7 + 8);
            v112 = *((_QWORD *)v7 + 9);
            *(_QWORD *)&v204[7] = *(_QWORD *)((char *)v7 + 79);
            *(_QWORD *)v204 = v112;
            v200 = *((_BYTE *)v7 + 87);
            *((_QWORD *)v7 + 8) = 0;
            *((_QWORD *)v7 + 9) = 0;
            v113 = v7;
            *((_QWORD *)v7 + 10) = 0;
            do
            {
              v114 = v108 + 1;
              v115 = (char *)v113 + 88 * v108 + 88;
              v116 = 2 * v108;
              v108 = (2 * v108) | 1;
              v117 = v116 + 2;
              if (v117 < v107 && *((double *)v113 + 11 * v114 + 3) < *((double *)v115 + 14))
              {
                v115 += 88;
                v108 = v117;
              }
              v118 = *((_OWORD *)v115 + 1);
              *v113 = *(_OWORD *)v115;
              v113[1] = v118;
              v119 = (void **)(v113 + 2);
              if (*((char *)v113 + 55) < 0)
                operator delete(*v119);
              v120 = (void **)(v115 + 32);
              v121 = *((_OWORD *)v115 + 2);
              *((_QWORD *)v113 + 6) = *((_QWORD *)v115 + 6);
              *(_OWORD *)v119 = v121;
              v115[55] = 0;
              v115[32] = 0;
              *((_QWORD *)v113 + 7) = *((_QWORD *)v115 + 7);
              v122 = (void **)(v113 + 4);
              if (*((char *)v113 + 87) < 0)
                operator delete(*v122);
              v123 = *((_OWORD *)v115 + 4);
              *((_QWORD *)v113 + 10) = *((_QWORD *)v115 + 10);
              *(_OWORD *)v122 = v123;
              v115[87] = 0;
              v115[64] = 0;
              v113 = (__int128 *)v115;
            }
            while (v108 <= (uint64_t)((unint64_t)(v107 - 2) >> 1));
            v124 = (void **)(v115 + 64);
            v6 -= 88;
            if (v115 == v109 - 88)
            {
              v128 = v207;
              *(_OWORD *)v115 = v206;
              *((_OWORD *)v115 + 1) = v128;
              if (v115[55] < 0)
              {
                operator delete(*((void **)v115 + 4));
                v154 = v115[87];
                *((_QWORD *)v115 + 4) = v182;
                v155 = *(_QWORD *)&v205[7];
                *((_QWORD *)v115 + 5) = *(_QWORD *)v205;
                *(_QWORD *)(v115 + 47) = v155;
                v115[55] = v190;
                *((_QWORD *)v115 + 7) = v186;
                if (v154 < 0)
                  operator delete(*v124);
              }
              else
              {
                *((_QWORD *)v115 + 4) = v182;
                v129 = *(_QWORD *)v205;
                *(_QWORD *)(v115 + 47) = *(_QWORD *)&v205[7];
                *((_QWORD *)v115 + 5) = v129;
                v115[55] = v190;
                *((_QWORD *)v115 + 7) = v186;
              }
              *((_QWORD *)v115 + 8) = v195;
              v156 = *(_QWORD *)v204;
              *(_QWORD *)(v115 + 79) = *(_QWORD *)&v204[7];
              *((_QWORD *)v115 + 9) = v156;
              v115[87] = v200;
            }
            else
            {
              v125 = *(_OWORD *)(v109 - 72);
              *(_OWORD *)v115 = *(_OWORD *)v6;
              *((_OWORD *)v115 + 1) = v125;
              if (v115[55] < 0)
                operator delete(*v120);
              v126 = *(_OWORD *)(v109 - 56);
              *((_QWORD *)v115 + 6) = *((_QWORD *)v109 - 5);
              *(_OWORD *)v120 = v126;
              *(v109 - 33) = 0;
              *(v109 - 56) = 0;
              *((_QWORD *)v115 + 7) = *((_QWORD *)v109 - 4);
              if (v115[87] < 0)
                operator delete(*v124);
              v127 = *(_OWORD *)(v109 - 24);
              *((_QWORD *)v115 + 10) = *((_QWORD *)v109 - 1);
              *(_OWORD *)v124 = v127;
              *(v109 - 1) = 0;
              *(v109 - 24) = 0;
              *(_OWORD *)v6 = v206;
              *(_OWORD *)(v109 - 72) = v207;
              if (*(v109 - 33) < 0)
              {
                operator delete(*((void **)v109 - 7));
                v130 = *(v109 - 1);
                *((_QWORD *)v109 - 7) = v182;
                *((_QWORD *)v109 - 6) = *(_QWORD *)v205;
                *(_QWORD *)(v109 - 41) = *(_QWORD *)&v205[7];
                *(v109 - 33) = v190;
                *((_QWORD *)v109 - 4) = v186;
                if (v130 < 0)
                  operator delete(*((void **)v109 - 3));
              }
              else
              {
                *((_QWORD *)v109 - 7) = v182;
                *((_QWORD *)v109 - 6) = *(_QWORD *)v205;
                *(_QWORD *)(v109 - 41) = *(_QWORD *)&v205[7];
                *(v109 - 33) = v190;
                *((_QWORD *)v109 - 4) = v186;
              }
              v131 = *(_QWORD *)v204;
              *((_QWORD *)v109 - 3) = v195;
              *((_QWORD *)v109 - 2) = v131;
              *(_QWORD *)(v109 - 9) = *(_QWORD *)&v204[7];
              *(v109 - 1) = v200;
              v132 = v115 + 88 - (char *)v7;
              if (v132 >= 89)
              {
                v133 = (v132 / 0x58uLL - 2) >> 1;
                v134 = *((double *)v115 + 3);
                if (*((double *)v7 + 11 * v133 + 3) < v134)
                {
                  v135 = *(_OWORD *)v115;
                  *(_QWORD *)&v210[16] = *((_QWORD *)v115 + 2);
                  *(_OWORD *)v210 = v135;
                  v136 = (void *)*((_QWORD *)v115 + 4);
                  v137 = *((_QWORD *)v115 + 5);
                  *(_QWORD *)&v209[7] = *(_QWORD *)(v115 + 47);
                  *(_QWORD *)v209 = v137;
                  v138 = v115[55];
                  *v120 = 0;
                  *((_QWORD *)v115 + 5) = 0;
                  *((_QWORD *)v115 + 6) = 0;
                  v183 = *((_QWORD *)v115 + 7);
                  v187 = v136;
                  v201 = v115[64];
                  v139 = *(_QWORD *)(v115 + 79);
                  *(_OWORD *)v208 = *(_OWORD *)(v115 + 65);
                  *(_QWORD *)&v208[14] = v139;
                  v191 = v138;
                  v196 = v115[87];
                  *v124 = 0;
                  *((_QWORD *)v115 + 9) = 0;
                  *((_QWORD *)v115 + 10) = 0;
                  do
                  {
                    v140 = (char *)v7 + 88 * v133;
                    v141 = *((_OWORD *)v140 + 1);
                    *(_OWORD *)v115 = *(_OWORD *)v140;
                    *((_OWORD *)v115 + 1) = v141;
                    v142 = (void **)(v115 + 32);
                    if (v115[55] < 0)
                      operator delete(*v142);
                    v143 = (void **)(v140 + 32);
                    v144 = *((_OWORD *)v140 + 2);
                    *((_QWORD *)v115 + 6) = *((_QWORD *)v140 + 6);
                    *(_OWORD *)v142 = v144;
                    v140[55] = 0;
                    v140[32] = 0;
                    v145 = (char *)v7 + 88 * v133;
                    v147 = *((_QWORD *)v145 + 7);
                    v146 = v145 + 56;
                    *((_QWORD *)v115 + 7) = v147;
                    v148 = (void **)(v115 + 64);
                    if (v115[87] < 0)
                      operator delete(*v148);
                    v149 = (char *)v7 + 88 * v133;
                    v150 = *((_OWORD *)v149 + 4);
                    *((_QWORD *)v115 + 10) = *((_QWORD *)v149 + 10);
                    *(_OWORD *)v148 = v150;
                    v140[87] = 0;
                    v149[64] = 0;
                    if (!v133)
                      break;
                    v133 = (v133 - 1) >> 1;
                    v115 = v140;
                  }
                  while (*((double *)v7 + 11 * v133 + 3) < v134);
                  v151 = v149 + 64;
                  v152 = *(_OWORD *)v210;
                  *((_QWORD *)v140 + 2) = *(_QWORD *)&v210[16];
                  *(_OWORD *)v140 = v152;
                  *((double *)v140 + 3) = v134;
                  if (v140[55] < 0)
                  {
                    operator delete(*v143);
                    v157 = v140[87];
                    *v143 = v187;
                    v158 = *(_QWORD *)&v209[7];
                    *((_QWORD *)v140 + 5) = *(_QWORD *)v209;
                    *(_QWORD *)(v140 + 47) = v158;
                    v140[55] = v191;
                    *v146 = v183;
                    if (v157 < 0)
                      operator delete(*(void **)v151);
                  }
                  else
                  {
                    *v143 = v187;
                    v153 = *(_QWORD *)v209;
                    *(_QWORD *)(v140 + 47) = *(_QWORD *)&v209[7];
                    *((_QWORD *)v140 + 5) = v153;
                    v140[55] = v191;
                    *v146 = v183;
                  }
                  *v151 = v201;
                  v159 = *(_OWORD *)v208;
                  *(_QWORD *)(v151 + 15) = *(_QWORD *)&v208[14];
                  *(_OWORD *)(v151 + 1) = v159;
                  v151[23] = v196;
                }
              }
            }
          }
          while (v107-- > 2);
        }
        return;
    }
  }
}

@end
