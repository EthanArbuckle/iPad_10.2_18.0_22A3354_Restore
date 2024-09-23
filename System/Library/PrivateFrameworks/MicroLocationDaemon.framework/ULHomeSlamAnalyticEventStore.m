@implementation ULHomeSlamAnalyticEventStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULAnalyticEventsTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511EDB10, "unsignedIntValue");
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
  return ULDBUtils::insertEntries<CLMiLoHomeSlamAnalyticEventTable,ULHomeSlamAnalyticEventMO>(self, (uint64_t)a3);
}

- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)_fetchAnalyticEventsByAndPredicates:(ULHomeSlamAnalyticEventStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMiLoHomeSlamAnalyticEventTable::Entry, std::allocator<CLMiLoHomeSlamAnalyticEventTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMiLoHomeSlamAnalyticEventTable,ULHomeSlamAnalyticEventMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)fetchAllRecordsWithLimit:(ULHomeSlamAnalyticEventStore *)self
{
  vector<CLMiLoHomeSlamAnalyticEventTable::Entry, std::allocator<CLMiLoHomeSlamAnalyticEventTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMiLoHomeSlamAnalyticEventTable,ULHomeSlamAnalyticEventMO>(self, a4, retstr);
  return result;
}

- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)fetchAnalyticEventsASCFromTime:(ULHomeSlamAnalyticEventStore *)self toTime:(SEL)a3
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  vector<CLMiLoHomeSlamAnalyticEventTable::Entry, std::allocator<CLMiLoHomeSlamAnalyticEventTable::Entry>> *result;
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
  -[ULHomeSlamAnalyticEventStore _fetchAnalyticEventsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchAnalyticEventsByAndPredicates:sortDescriptors:andLimit:", v8, v14, +[ULHomeSlamAnalyticEventStore maxEntriesInTable](ULHomeSlamAnalyticEventStore, "maxEntriesInTable"));

  return result;
}

- (optional<CLMiLoHomeSlamAnalyticEventTable::Entry>)fetchLatestAnalyticEventType:(ULHomeSlamAnalyticEventStore *)self beforeTime:
{
  __int16 **v1;
  uint64_t v2;
  double v3;
  double v4;
  __int16 **v5;
  uint64_t v7;
  void *v8;
  void *v9;
  __int16 *v10;
  __int16 *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  _OWORD *v22;
  _QWORD v23[2];
  optional<CLMiLoHomeSlamAnalyticEventTable::Entry> result;

  v4 = v3;
  v5 = v1;
  v7 = v2;
  v23[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *v5;
  v11 = v5[1];
  if (*v5 != v11)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      ++v10;
    }
    while (v10 != v11);
  }
  v13 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("timestamp"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v15);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("event"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v16);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULHomeSlamAnalyticEventStore _fetchAnalyticEventsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchAnalyticEventsByAndPredicates:sortDescriptors:andLimit:", v8, v18, 1);

  if (v21 != v22)
  {
    *(_OWORD *)v7 = *v21;
    *(_BYTE *)(v7 + 16) = 1;
LABEL_6:
    operator delete(v21);
    goto LABEL_7;
  }
  *(_BYTE *)v7 = 0;
  *(_BYTE *)(v7 + 16) = 0;
  if (v21)
    goto LABEL_6;
LABEL_7:

  *((_QWORD *)&result.var0.var2 + 1) = v20;
  *(_QWORD *)&result.var0.var0 = v19;
  return result;
}

- (optional<CLMiLoHomeSlamAnalyticEventTable::Entry>)fetchFirstEvent
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  _QWORD v12[2];
  optional<CLMiLoHomeSlamAnalyticEventTable::Entry> result;

  v3 = v1;
  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULHomeSlamAnalyticEventStore _fetchAnalyticEventsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchAnalyticEventsByAndPredicates:sortDescriptors:andLimit:", v4, v6, 1);

  v7 = v10;
  if (v10 != v11)
  {
    *(_OWORD *)v3 = *v10;
    *(_BYTE *)(v3 + 16) = 1;
LABEL_4:
    v11 = v7;
    operator delete(v7);
    goto LABEL_5;
  }
  *(_BYTE *)v3 = 0;
  *(_BYTE *)(v3 + 16) = 0;
  if (v7)
    goto LABEL_4;
LABEL_5:

  *((_QWORD *)&result.var0.var2 + 1) = v9;
  *(_QWORD *)&result.var0.var0 = v8;
  return result;
}

@end
