@implementation ULAssociatedStateStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULAssociatedStateTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511EE338, "unsignedIntValue");
  v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return CFSTR("timestamp");
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationAssociatedStateTable,ULAssociatedStateMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationAssociatedStateTable::Entry,)_fetchAssociatedStatesByAndPredicates:(ULAssociatedStateStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationAssociatedStateTable::Entry, std::allocator<CLMicroLocationAssociatedStateTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationAssociatedStateTable,ULAssociatedStateMO>(self, a4, a5, a6, (std::string *)retstr);
  return result;
}

- (vector<CLMicroLocationAssociatedStateTable::Entry,)fetchAllRecordsWithLimit:(ULAssociatedStateStore *)self
{
  vector<CLMicroLocationAssociatedStateTable::Entry, std::allocator<CLMicroLocationAssociatedStateTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationAssociatedStateTable,ULAssociatedStateMO>(self, a4, (std::string *)retstr);
  return result;
}

- (vector<boost::uuids::uuid,)getAllDistinctAssociatedStateLoiIds
{
  unsigned int v5;
  objc_class *v6;
  void *v7;
  vector<boost::uuids::uuid, std::allocator<boost::uuids::uuid>> *result;
  id v9;

  v5 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v7, CFSTR("loiId"), 1, 0, 0, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  ULDBUtils::boostUUIDsFromNSStringArray(v9, retstr);
  return result;
}

- (vector<CLMicroLocationAssociatedStateTable::Entry,)fetchAllAssociatedStateBetweenTimes:(ULAssociatedStateStore *)self toTime:(SEL)a3 atLoiGroupId:(double)a4
{
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  vector<CLMicroLocationAssociatedStateTable::Entry, std::allocator<CLMicroLocationAssociatedStateTable::Entry>> *result;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v10 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K > %@ && %K <= %@"), CFSTR("timestamp"), v13, CFSTR("timestamp"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v15);

  objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v17);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULAssociatedStateStore _fetchAssociatedStatesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchAssociatedStatesByAndPredicates:sortDescriptors:andLimit:", v11, v19, v10);

  return result;
}

@end
