@implementation ULMigrationStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMigrationTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511ED498, "unsignedIntValue");
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
  return ULDBUtils::insertEntries<CLMicroLocationMigrationTable,ULMigrationMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationMigrationTable::Entry,)_fetchMigrationsByAndPredicates:(ULMigrationStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationMigrationTable::Entry, std::allocator<CLMicroLocationMigrationTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationMigrationTable,ULMigrationMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationMigrationTable::Entry,)fetchAllRecordsWithLimit:(ULMigrationStore *)self
{
  vector<CLMicroLocationMigrationTable::Entry, std::allocator<CLMicroLocationMigrationTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationMigrationTable,ULMigrationMO>(self, a4, retstr);
  return result;
}

- (vector<CLMicroLocationMigrationTable::Entry,)fetchMigrationEntriesWithStates:(ULMigrationStore *)self limit:(SEL)a3
{
  void *v8;
  void *v9;
  unsigned int *v10;
  unsigned int *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  vector<CLMicroLocationMigrationTable::Entry, std::allocator<CLMicroLocationMigrationTable::Entry>> *result;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned int **)a4;
  v11 = (unsigned int *)*((_QWORD *)a4 + 1);
  if (*(unsigned int **)a4 != v11)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      ++v10;
    }
    while (v10 != v11);
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("state"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v13);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULMigrationStore _fetchMigrationsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchMigrationsByAndPredicates:sortDescriptors:andLimit:", v8, v15, a5);

  return result;
}

@end
