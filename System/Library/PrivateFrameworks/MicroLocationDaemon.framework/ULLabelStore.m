@implementation ULLabelStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULRecordingLabelsTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511ED120, "unsignedIntValue");
  v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return CFSTR("receivedTimestamp");
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationRecordingLabelsTable,ULLabelMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationRecordingLabelsTable::Entry,)_fetchLabelsByAndPredicates:(ULLabelStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationRecordingLabelsTable::Entry, std::allocator<CLMicroLocationRecordingLabelsTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationRecordingLabelsTable,ULLabelMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationRecordingLabelsTable::Entry,)fetchAllRecordsWithLimit:(ULLabelStore *)self
{
  vector<CLMicroLocationRecordingLabelsTable::Entry, std::allocator<CLMicroLocationRecordingLabelsTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationRecordingLabelsTable,ULLabelMO>(self, a4, retstr);
  return result;
}

- (BOOL)deleteSimilarityListLabelsOlderThan:(double)a3 orNewerThan:(double)a4
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
  v8 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K < %@ || %K > %@"), CFSTR("receivedTimestamp"), v9, CFSTR("receivedTimestamp"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  objc_msgSend((id)-[ULStore db](self, "db")[96], "getServiceUUIDsWithServiceType:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("serviceUUID"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v13);

  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v15, v7, 0, 0);

  return (char)self;
}

- (BOOL)deleteRecordingLabelsForClients:(const void *)a3
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

- (BOOL)deleteAllLabelsOfDeletedServices
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
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all labels which refer to deleted services", buf, 2u);
  }
  objc_msgSend((id)-[ULStore db](self, "db")[96], "getAllServiceUUIDs:", ULSettings::get<ULSettings::DatabaseSelectionLimit>());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K in %@)"), CFSTR("serviceUUID"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v8, v5, 0, 0);

  return v9;
}

- (vector<CLMicroLocationRecordingLabelsTable::Entry,)fetchRecordingLabelsForClient:(ULLabelStore *)self limit:(SEL)a3
{
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  vector<CLMicroLocationRecordingLabelsTable::Entry, std::allocator<CLMicroLocationRecordingLabelsTable::Entry>> *result;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1758];
  if (*((char *)a4 + 23) >= 0)
    v10 = a4;
  else
    v10 = *(const void **)a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("clientId"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("receivedTimestamp"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLabelStore _fetchLabelsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchLabelsByAndPredicates:sortDescriptors:andLimit:", v8, v14, a5);

  return result;
}

- (vector<CLMicroLocationRecordingLabelsTable::Entry,)fetchRecordingLabelsForServiceUuid:(ULLabelStore *)self atLoiGroupID:(SEL)a3 fromTime:(const uuid *)a4 limit:(const uuid *)a5
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  vector<CLMicroLocationRecordingLabelsTable::Entry, std::allocator<CLMicroLocationRecordingLabelsTable::Entry>> *result;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)-[ULStore db](self, "db")[88], "getTriggerUUIDsForLoiGroupId:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a4);
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("receivedTimestamp"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v18);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("serviceUUID"), v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v19);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("triggerUUID"), v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v20);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("receivedTimestamp"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLabelStore _fetchLabelsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchLabelsByAndPredicates:sortDescriptors:andLimit:", v12, v22, a7);

  return result;
}

- (vector<std::string,)getAllRecordingLabelsClientIds
{
  unsigned int v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *var1;
  void *v17;
  vector<std::string, std::allocator<std::string>> *result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  _BYTE v24[128];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K!=NIL AND %K!=''"), CFSTR("clientId"), CFSTR("clientId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v8, CFSTR("clientId"), 1, v9, 0, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  std::vector<std::string>::reserve((std::vector<std::string> *)retstr, objc_msgSend(v10, "count"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14)), "UTF8String");
        v23 = v15;
        var1 = (char *)retstr->var1;
        if (var1 >= retstr->var2.var0)
        {
          v17 = (void *)std::vector<std::string>::__emplace_back_slow_path<char const*>((uint64_t *)retstr, &v23);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>((_QWORD *)retstr->var1, v15);
          v17 = var1 + 24;
          retstr->var1 = var1 + 24;
        }
        retstr->var1 = v17;
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v12);
  }

  return result;
}

- (BOOL)updateAllLabelsWithMatchingServiceUUID:(uuid)a3 withNewServiceUUID:(uuid)a4
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

- (BOOL)updateAllLabelsWithMatchingClientId:()basic_string<char withNewClientId:()std:(std::allocator<char>> *)var0 :char_traits<char>
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
