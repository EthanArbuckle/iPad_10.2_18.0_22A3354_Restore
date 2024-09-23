@implementation ULLoiStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMiLoLoiTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511ED468, "unsignedIntValue");
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
  return ULDBUtils::insertEntries<CLMiLoLoiTable,ULLoiMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoLoiTable::Entry,)_fetchLoisByAndPredicates:(ULLoiStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMiLoLoiTable::Entry, std::allocator<CLMiLoLoiTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMiLoLoiTable,ULLoiMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMiLoLoiTable::Entry,)fetchAllRecordsWithLimit:(ULLoiStore *)self
{
  vector<CLMiLoLoiTable::Entry, std::allocator<CLMiLoLoiTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMiLoLoiTable,ULLoiMO>(self, a4, retstr);
  return result;
}

- (id)getLoiIdsInLoiGroupId:(const uuid *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  if (a3->var0[0])
  {
LABEL_2:
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiGroupId"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v11, CFSTR("loiId"), 1, v12, v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 1;
    while (v15 != 16)
    {
      if (a3->var0[v15++])
      {
        if ((unint64_t)(v15 - 2) < 0xF)
          goto LABEL_2;
        break;
      }
    }
    v20[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (vector<CLMiLoLoiTable::Entry,)fetchLoiIdEntriesInLoiGroupId:(ULLoiStore *)self
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  vector<CLMiLoLoiTable::Entry, std::allocator<CLMiLoLoiTable::Entry>> *result;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a4);
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiGroupId"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLoiStore _fetchLoisByAndPredicates:sortDescriptors:andLimit:](self, "_fetchLoisByAndPredicates:sortDescriptors:andLimit:", v8, v11, v7);

  return result;
}

- (vector<CLMiLoLoiTable::Entry,)fetchLoiIdEntriesforLoiGroupIds:(ULLoiStore *)self withLimit:(SEL)a3
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  vector<CLMiLoLoiTable::Entry, std::allocator<CLMiLoLoiTable::Entry>> *result;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("loiGroupId"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLoiStore _fetchLoisByAndPredicates:sortDescriptors:andLimit:](self, "_fetchLoisByAndPredicates:sortDescriptors:andLimit:", v8, v11, a5);

  return result;
}

- (vector<CLMiLoLoiTable::Entry,)fetchAllDistinctLoiGroups
{
  int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t *v9;
  vector<CLMiLoLoiTable::Entry, std::allocator<CLMiLoLoiTable::Entry>> *result;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  __n128 (*v18)(__n128 *, __n128 *);
  void (*v19)(uint64_t);
  void *v20;
  _QWORD v21[3];
  void **v22;

  v5 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x4812000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = &unk_241BEBD1D;
  memset(v21, 0, sizeof(v21));
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__ULLoiStore_fetchAllDistinctLoiGroups__block_invoke;
  v11[3] = &unk_2511D3648;
  v11[4] = self;
  v8 = v6;
  v14 = v5;
  v12 = v8;
  v13 = &v15;
  objc_msgSend(v7, "performBlockAndWait:", v11);

  v9 = v16;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<CLMiLoLoiTable::Entry>::__init_with_size[abi:ne180100]<CLMiLoLoiTable::Entry*,CLMiLoLoiTable::Entry*>(retstr, v9[6], v9[7], (v9[7] - v9[6]) >> 6);

  _Block_object_dispose(&v15, 8);
  v22 = (void **)v21;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v22);

  return result;
}

void __39__ULLoiStore_fetchAllDistinctLoiGroups__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  void **v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("loiGroupId");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("loiGroupId");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchManagedObjectsForEntityName:propertiesToFetch:propertiesToGroupBy:byAndPredicates:sortDescriptors:andLimit:", v4, v5, v6, 0, v7, *(unsigned int *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ULDBUtils::convertManagedObjectsToEntries<CLMiLoLoiTable,ULLoiMO>(v8, (uint64_t *)&v11);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  std::vector<CLMiLoLoiTable::Entry>::__vdeallocate((uint64_t *)(v9 + 48));
  *(_OWORD *)(v9 + 48) = v11;
  *(_QWORD *)(v9 + 64) = v12;
  v12 = 0;
  v11 = 0uLL;
  v13 = (void **)&v11;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v13);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reset");

}

- (vector<boost::uuids::uuid,)getDistinctHomeLoiGroupIdsWithLimit:(ULLoiStore *)self
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uuid *v16;
  vector<boost::uuids::uuid, std::allocator<boost::uuids::uuid>> *result;
  __int128 v18;
  uuid *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiType"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v13, CFSTR("loiGroupId"), 1, v7, v14, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  ULDBUtils::boostUUIDsFromNSStringArray(v15, &v18);
  v16 = v19;
  *(_OWORD *)&retstr->var0 = v18;
  retstr->var2.var0 = v16;

  return result;
}

- (unsigned)countDistinctLoiGroups
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v4, CFSTR("loiGroupId"), 1, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "count");
  return v4;
}

- (unsigned)countDistinctLoiTypes:(const void *)a3
{
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((char *)a3 + 23) >= 0)
    v6 = a3;
  else
    v6 = *(const void **)a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiType"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v10, CFSTR("loiGroupId"), 1, v5, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = objc_msgSend(v11, "count");
  return v10;
}

- (optional<boost::uuids::uuid>)getLoiGroupIdForLoi:(SEL)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  optional<boost::uuids::uuid> *result;
  _QWORD v14[3];
  void **v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a4);
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiId"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLoiStore _fetchLoisByAndPredicates:sortDescriptors:andLimit:](self, "_fetchLoisByAndPredicates:sortDescriptors:andLimit:", v8, v11, 1);

  if (v14[0] == v14[1])
  {
    v12 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    retstr->var0 = *($D643929FE2146084CAEF261F1A6E0F21 *)(v14[0] + 24);
    v12 = 1;
  }
  retstr->var1 = v12;
  v15 = (void **)v14;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v15);

  return result;
}

- (optional<std::string>)getLoiTypeForLoi:(optional<std::string> *__return_ptr)retstr
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  char v12;
  optional<std::string> *result;
  _QWORD v14[3];
  void **v15;
  _QWORD v16[2];

  v3 = v1;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v2);
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiId"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fetchLoisByAndPredicates:sortDescriptors:andLimit:", v7, v10, 1);

  v11 = (_QWORD *)v14[0];
  if (v14[0] == v14[1])
  {
    v12 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)(v14[0] + 40);
    *((_QWORD *)&retstr->var0.var1.var0.var0.var0.var1 + 2) = v11[7];
    v11[6] = 0;
    v11[7] = 0;
    v11[5] = 0;
    v12 = 1;
  }
  LOBYTE(retstr->var0.var1.var0.var1.var0[0]) = v12;
  v15 = (void **)v14;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v15);

  return result;
}

- (vector<boost::uuids::uuid,)getLoiGroupIdsForLois:(ULLoiStore *)self
{
  vector<boost::uuids::uuid, std::allocator<boost::uuids::uuid>> *result;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  uuid *v17;
  __int128 v18;
  uuid *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  result = (vector<boost::uuids::uuid, std::allocator<boost::uuids::uuid>> *)ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (*(_QWORD *)a4 != *((_QWORD *)a4 + 1))
  {
    v8 = result;
    ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("loiId"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v14, CFSTR("loiGroupId"), 1, v10, v15, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    ULDBUtils::boostUUIDsFromNSStringArray(v16, &v18);
    v17 = v19;
    *(_OWORD *)&retstr->var0 = v18;
    retstr->var2.var0 = v17;

  }
  return result;
}

- (BOOL)updateLoiIds:(const void *)a3 withLoiGroupId:(const uuid *)a4 andLoiType:(const void *)a5
{
  const void *v5;
  uint64_t v6;
  char *v10;
  uuid *v11;
  BOOL v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uuid *v18;
  char *v19;
  uuid *v20;
  uuid *v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  void ***v40;
  const uuid *v41;
  const void *v42;
  void **v43;
  void ***v44;
  uint64_t v45;
  char v46;
  void *__p;
  char *v48;
  unint64_t v49;
  _QWORD v50[3];
  char v51;

  v5 = *(const void **)a3;
  v6 = *((_QWORD *)a3 + 1);
  if (v5 == (const void *)v6)
    return 1;
  memset(v50, 0, sizeof(v50));
  __p = 0;
  v48 = 0;
  v49 = 0;
  std::vector<boost::uuids::uuid>::__init_with_size[abi:ne180100]<boost::uuids::uuid*,boost::uuids::uuid*>(&__p, v5, v6, (v6 - (uint64_t)v5) >> 4);
  v10 = v48;
  if ((unint64_t)v48 >= v49)
  {
    v13 = (v48 - (_BYTE *)__p) >> 4;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60)
      std::vector<CLMicroLocationProto::ConfidenceReason>::__throw_length_error[abi:ne180100]();
    v15 = v49 - (_QWORD)__p;
    if ((uint64_t)(v49 - (_QWORD)__p) >> 3 > v14)
      v14 = v15 >> 3;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
      v16 = 0xFFFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<boost::uuids::uuid>>((uint64_t)&v49, v16);
    else
      v17 = 0;
    v18 = (uuid *)&v17[16 * v13];
    v19 = &v17[16 * v16];
    *v18 = *a4;
    v11 = v18 + 1;
    v21 = (uuid *)__p;
    v20 = (uuid *)v48;
    if (v48 != __p)
    {
      do
      {
        v18[-1] = v20[-1];
        --v18;
        --v20;
      }
      while (v20 != v21);
      v20 = (uuid *)__p;
    }
    __p = v18;
    v48 = (char *)v11;
    v49 = (unint64_t)v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *(uuid *)v48 = *a4;
    v11 = (uuid *)(v10 + 16);
  }
  v22 = 126 - 2 * __clz(((char *)v11 - (_BYTE *)__p) >> 4);
  v48 = (char *)v11;
  if (v11 == __p)
    v23 = 0;
  else
    v23 = v22;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,boost::uuids::uuid *,false>((unint64_t *)__p, (unint64_t *)v11->var0, (uint64_t)&v51, v23, 1);
  v24 = (char *)std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<boost::uuids::uuid *>,std::__wrap_iter<boost::uuids::uuid *>,std::__equal_to &>(__p, v48);
  if (v48 != v24)
    v48 = v24;
  v25 = objc_alloc(MEMORY[0x24BDBCEB8]);
  ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)&__p);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithArray:", v26);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("loiId"), v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v29);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __53__ULLoiStore_updateLoiIds_withLoiGroupId_andLoiType___block_invoke;
  v36[3] = &unk_2511D3670;
  v36[4] = self;
  v32 = v28;
  v37 = v32;
  v33 = v30;
  v38 = v33;
  v41 = a4;
  v42 = a5;
  v34 = v27;
  v39 = v34;
  v40 = &v43;
  objc_msgSend(v31, "performBlockAndWait:", v36);

  v12 = *((_BYTE *)v44 + 24) != 0;
  _Block_object_dispose(&v43, 8);

  if (__p)
  {
    v48 = (char *)__p;
    operator delete(__p);
  }
  v43 = (void **)v50;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v43);
  return v12;
}

void __53__ULLoiStore_updateLoiIds_withLoiGroupId_andLoiType___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v41[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v4, v5, v6, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = cl::chrono::CFAbsoluteTimeClock::now();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v28;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "setLastSeenTimeStamp:", v7);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", *(_QWORD *)(a1 + 72));
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setLoiGroupId:", v13);

        v14 = *(uint64_t **)(a1 + 80);
        if (*((char *)v14 + 23) < 0)
          v14 = (uint64_t *)*v14;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setLoiType:", v15);

        v16 = *(void **)(a1 + 56);
        objc_msgSend(v11, "loiId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObject:", v17);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v8);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = *(id *)(a1 + 56);
  v18 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v29);
        v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", *(_QWORD *)(a1 + 72));
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(uint64_t **)(a1 + 80);
        if (*((char *)v24 + 23) < 0)
          v24 = (uint64_t *)*v24;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = +[ULLoiMO createWithLastSeenTimeStamp:loiId:loiGroupId:loiType:inManagedObjectContext:](ULLoiMO, "createWithLastSeenTimeStamp:loiId:loiGroupId:loiType:inManagedObjectContext:", v21, v23, v25, v26, v7);

      }
      v18 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v18);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "commitChangesToStore");
}

- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 intoTargetStore:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __74__ULLoiStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore___block_invoke;
  v14[3] = &unk_2511D3698;
  v17 = &v20;
  v14[4] = self;
  v11 = v9;
  v15 = v11;
  v18 = a3;
  v19 = a4;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v10, "performBlockAndWait:", v14);

  LOBYTE(v8) = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return (char)v8;
}

void __74__ULLoiStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore___block_invoke(_QWORD *a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v2, "batchTransferManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:batchSize:limit:intoTargetStore:", v4, 0, v5, a1[8], a1[9], a1[6]);

}

@end
