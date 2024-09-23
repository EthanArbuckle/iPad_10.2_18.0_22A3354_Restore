@implementation ULCustomLoiStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMiLoCustomLoiTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511EDE28, "unsignedIntValue");
  v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return CFSTR("lastSeenTimeStamp");
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMiLoCustomLoiTable,ULCustomLoiMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoCustomLoiTable::Entry,)_fetchCustomLoisByAndPredicates:(ULCustomLoiStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMiLoCustomLoiTable::Entry, std::allocator<CLMiLoCustomLoiTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMiLoCustomLoiTable,ULCustomLoiMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMiLoCustomLoiTable::Entry,)fetchAllRecordsWithLimit:(ULCustomLoiStore *)self
{
  vector<CLMiLoCustomLoiTable::Entry, std::allocator<CLMiLoCustomLoiTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMiLoCustomLoiTable,ULCustomLoiMO>(self, a4, retstr);
  return result;
}

- (BOOL)removeServiceToCustomLoiMapping:(const uuid *)a3 loiId:(const uuid *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a4);
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiId"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("serviceId"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v13);

  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v15, v7, 0, 0);

  return (char)self;
}

- (BOOL)addServiceToCustomLoiMapping:(const uuid *)a3 loiId:(const uuid *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  _OWORD *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  char *v18;
  char *v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  BOOL v23;
  NSObject *v24;
  void *__p;
  void *v27;
  char *v28;
  uint8_t buf[16];
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!-[ULCustomLoiStore removeServiceToCustomLoiMapping:loiId:](self, "removeServiceToCustomLoiMapping:loiId:"))
    return 0;
  __p = 0;
  v27 = 0;
  v28 = 0;
  v7 = *(_QWORD *)a3->var0;
  v8 = *(_QWORD *)&a3->var0[8];
  v9 = *(_QWORD *)a4->var0;
  v10 = *(_QWORD *)&a4->var0[8];
  v11 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMiLoCustomLoiTable::Entry::Entry((uint64_t)buf, v7, v8, v9, v10, v11);
  v12 = std::__allocate_at_least[abi:ne180100]<std::allocator<CLMiLoCustomLoiTable::Entry>>((uint64_t)&v28, 1uLL);
  v13 = 0;
  v15 = (char *)v12 + 40 * v14;
  v16 = v31;
  v17 = v30;
  *v12 = *(_OWORD *)buf;
  v12[1] = v17;
  *((_QWORD *)v12 + 4) = v16;
  v18 = (char *)v12 + 40;
  v19 = (char *)__p;
  if (__p)
  {
    v20 = v12;
    do
    {
      v21 = *(_OWORD *)(v13 - 40);
      v22 = *(_OWORD *)(v13 - 24);
      v12 = (_OWORD *)((char *)v20 - 40);
      *((_QWORD *)v20 - 1) = *((_QWORD *)v13 - 1);
      *(_OWORD *)((char *)v20 - 24) = v22;
      *(_OWORD *)((char *)v20 - 40) = v21;
      v13 -= 40;
      v20 = (_OWORD *)((char *)v20 - 40);
    }
    while (v13 != v19);
  }
  __p = v12;
  v27 = v18;
  v28 = v15;
  if (v19)
    operator delete(v19);
  v27 = v18;
  v23 = -[ULCustomLoiStore insertEntries:](self, "insertEntries:", &__p);
  if (!v23)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_88);
    v24 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v24, OS_LOG_TYPE_ERROR, "#Warning Failed to add Service Id to LOI Id mapping", buf, 2u);
    }
  }
  if (__p)
  {
    v27 = __p;
    operator delete(__p);
  }
  return v23;
}

- (vector<boost::uuids::uuid,)getAllServicesEnabledAtCustomLoiId:(ULCustomLoiStore *)self
{
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  vector<boost::uuids::uuid, std::allocator<boost::uuids::uuid>> *result;
  id v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a4);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiId"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v9);

  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v11, CFSTR("serviceId"), 0, v14, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  ULDBUtils::boostUUIDsFromNSStringArray(v12, retstr);
  return result;
}

- (vector<boost::uuids::uuid,)getAllCustomLoiIdsForServiceId:(ULCustomLoiStore *)self
{
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  vector<boost::uuids::uuid, std::allocator<boost::uuids::uuid>> *result;
  id v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a4);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("serviceId"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v9);

  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v11, CFSTR("loiId"), 0, v14, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  ULDBUtils::boostUUIDsFromNSStringArray(v12, retstr);
  return result;
}

- (vector<boost::uuids::uuid,)getAllDistinctCustomLoiIds
{
  unsigned int v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  vector<boost::uuids::uuid, std::allocator<boost::uuids::uuid>> *result;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v8, CFSTR("loiId"), 1, 0, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  ULDBUtils::boostUUIDsFromNSStringArray(v10, retstr);
  return result;
}

- (BOOL)updateAllCustomLoiIdsWithMatchingServiceUUID:(const uuid *)a3 withNewServiceUUID:(const uuid *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a4);
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("serviceId"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("serviceId");
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ULStore batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:](self, "batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:", v13, v10, v11);

  return (char)self;
}

- (BOOL)deleteAllCustomLoiOfDeletedServices
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  BOOL v9;
  uint8_t buf[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_88);
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all Custom Lois which refer to deleted services", buf, 2u);
  }
  objc_msgSend((id)-[ULStore db](self, "db")[96], "getAllServiceUUIDs:", ULSettings::get<ULSettings::DatabaseSelectionLimit>());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K in %@)"), CFSTR("serviceId"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v8, v5, 0, 0);

  return v9;
}

@end
