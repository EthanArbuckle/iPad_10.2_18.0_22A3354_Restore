@implementation ULOdometryStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULOdometryTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511EE290, "unsignedIntValue");
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
  return ULDBUtils::insertEntries<CLMiLoOdometryTable,ULOdometryMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoOdometryTable::Entry,)_fetchOdometryByAndPredicates:(ULOdometryStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMiLoOdometryTable::Entry, std::allocator<CLMiLoOdometryTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMiLoOdometryTable,ULOdometryMO>(self, a4, a5, a6, (uint64_t)retstr);
  return result;
}

- (vector<CLMiLoOdometryTable::Entry,)fetchAllRecordsWithLimit:(ULOdometryStore *)self
{
  vector<CLMiLoOdometryTable::Entry, std::allocator<CLMiLoOdometryTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMiLoOdometryTable,ULOdometryMO>(self, a4, (uint64_t)retstr);
  return result;
}

- (vector<CLMiLoOdometryTable::Entry,)fetchOdometryASCFromTime:(ULOdometryStore *)self toTime:(SEL)a3
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  vector<CLMiLoOdometryTable::Entry, std::allocator<CLMiLoOdometryTable::Entry>> *result;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K > %@ && %K <= %@"), CFSTR("timestamp"), v10, CFSTR("timestamp"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULOdometryStore _fetchOdometryByAndPredicates:sortDescriptors:andLimit:](self, "_fetchOdometryByAndPredicates:sortDescriptors:andLimit:", v8, v14, +[ULOdometryStore maxEntriesInTable](ULOdometryStore, "maxEntriesInTable"));

  return result;
}

@end
