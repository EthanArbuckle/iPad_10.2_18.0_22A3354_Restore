@implementation ULRapportStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULRapportTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511EDEB8, "unsignedIntValue");
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
  return ULDBUtils::insertEntries<CLMicroLocationRapportTable,ULRapportMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationRapportTable::Entry,)_fetchRapportsByAndPredicates:(ULRapportStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationRapportTable::Entry, std::allocator<CLMicroLocationRapportTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationRapportTable,ULRapportMO>(self, a4, a5, a6, (__n128 *)retstr);
  return result;
}

- (vector<CLMicroLocationRapportTable::Entry,)fetchAllRecordsWithLimit:(ULRapportStore *)self
{
  vector<CLMicroLocationRapportTable::Entry, std::allocator<CLMicroLocationRapportTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationRapportTable,ULRapportMO>(self, a4, (__n128 *)retstr);
  return result;
}

- (vector<CLMicroLocationRapportTable::Entry,)fetchRapportEntriesAtLoiFromTime:(ULRapportStore *)self toTime:(SEL)a3 loiType:(double)a4 loiGroupId:(double)a5
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  void *v19;
  const void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  vector<CLMicroLocationRapportTable::Entry, std::allocator<CLMicroLocationRapportTable::Entry>> *result;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultsDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULDatabaseSelectionLimit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v16 = objc_msgSend(v15, "unsignedIntValue");
  else
    v16 = objc_msgSend(&unk_2511EDED0, "unsignedIntValue");
  v17 = v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)a6 + 24))
  {
    v19 = (void *)MEMORY[0x24BDD1758];
    if (*((char *)a6 + 23) >= 0)
      v20 = a6;
    else
      v20 = *(const void **)a6;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiType"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v22);

  }
  if (*((_BYTE *)a7 + 16))
  {
    v23 = (id)-[ULStore db](self, "db")[56];
    v24 = v23;
    if (!*((_BYTE *)a7 + 16))
      std::__throw_bad_optional_access[abi:ne180100]();
    objc_msgSend(v23, "getLoiIdsInLoiGroupId:", a7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v26);

  }
  v27 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "predicateWithFormat:", CFSTR("%K > %@ && %K <= %@"), CFSTR("generationTimestamp"), v28, CFSTR("generationTimestamp"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v30);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULRapportStore _fetchRapportsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchRapportsByAndPredicates:sortDescriptors:andLimit:", v18, v32, v17);

  return result;
}

@end
