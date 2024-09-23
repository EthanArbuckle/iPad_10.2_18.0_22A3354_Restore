@implementation ULLoggedEventStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULLoggedEventsTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511EDD08, "unsignedIntValue");
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
  return ULDBUtils::insertEntries<CLMicroLocationLoggedEventsTable,ULLoggedEventMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationLoggedEventsTable::Entry,)_fetchLoggedEventsByAndPredicates:(ULLoggedEventStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationLoggedEventsTable::Entry, std::allocator<CLMicroLocationLoggedEventsTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationLoggedEventsTable,ULLoggedEventMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationLoggedEventsTable::Entry,)fetchAllRecordsWithLimit:(ULLoggedEventStore *)self
{
  vector<CLMicroLocationLoggedEventsTable::Entry, std::allocator<CLMicroLocationLoggedEventsTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationLoggedEventsTable,ULLoggedEventMO>(self, a4, retstr);
  return result;
}

- (vector<CLMicroLocationLoggedEventsTable::Entry,)fetchLoggedEventsForTypes:(ULLoggedEventStore *)self fromTime:(SEL)a3 toTime:(const void *)a4 limit:(optional<const double>)a5
{
  unint64_t v7;
  BOOL var1;
  double v9;
  BOOL v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  vector<CLMicroLocationLoggedEventsTable::Entry, std::allocator<CLMicroLocationLoggedEventsTable::Entry>> *result;
  _QWORD v32[2];

  v7 = a7;
  var1 = a6.var1;
  v9 = a6.var0.var1;
  v10 = a5.var1;
  v11 = a5.var0.var1;
  v32[1] = *MEMORY[0x24BDAC8D0];
  if (!a7)
  {
    +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "defaultsDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULDatabaseSelectionLimit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v17 = objc_msgSend(v16, "unsignedIntValue");
    else
      v17 = objc_msgSend(&unk_2511EDCF0, "unsignedIntValue");
    v18 = v17;

    v7 = v18;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v20 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("receivedTimestamp"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v22);

  }
  if (var1)
  {
    v23 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("receivedTimestamp"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v25);

  }
  if (*(_QWORD *)a4 != *((_QWORD *)a4 + 1))
  {
    ULDBUtils::eventTypesToNSArray((unsigned int **)a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("eventType"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v27);

  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("receivedTimestamp"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLoggedEventStore _fetchLoggedEventsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchLoggedEventsByAndPredicates:sortDescriptors:andLimit:", v19, v29, v7);

  return result;
}

- (optional<CLMicroLocationLoggedEventsTable::Entry>)fetchMostRecentLoggedEventBeforeTime:(optional<CLMicroLocationLoggedEventsTable:(ULLoggedEventStore *)self :Entry> *__return_ptr)retstr
{
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  char v6;
  optional<CLMicroLocationLoggedEventsTable::Entry> *result;
  void *__p;
  void *v9;
  uint64_t v10;
  _QWORD v11[3];

  __p = 0;
  v9 = 0;
  v10 = 0;
  -[ULLoggedEventStore fetchLoggedEventsForTypes:fromTime:toTime:limit:](self, "fetchLoggedEventsForTypes:fromTime:toTime:limit:", &__p, 0, 0, v2, 1, 1);
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  v4 = v11[0];
  if (v11[0] == v11[1])
  {
    v6 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    v5 = *(_OWORD *)v11[0];
    *(_OWORD *)((char *)&retstr->var0.var3.var1 + 4) = *(_OWORD *)(v11[0] + 12);
    *(_OWORD *)&retstr->var0.var0 = v5;
    CLMicroLocationProto::ReceivedEvent::ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)&retstr->var0.var3.var4, (const CLMicroLocationProto::ReceivedEvent *)(v4 + 32));
    v6 = 1;
  }
  LOBYTE(retstr[1].var0.var3.var4) = v6;
  __p = v11;
  std::vector<CLMicroLocationLoggedEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return result;
}

- (optional<CLMicroLocationLoggedEventsTable::Entry>)fetchMostRecentLoggedEventForTypes:(optional<CLMicroLocationLoggedEventsTable:(ULLoggedEventStore *)self :Entry> *__return_ptr)retstr BeforeTime:
{
  uint64_t v3;
  __int128 v4;
  char v5;
  optional<CLMicroLocationLoggedEventsTable::Entry> *result;
  _QWORD v7[3];
  void **v8;

  -[ULLoggedEventStore fetchLoggedEventsForTypes:fromTime:toTime:limit:](self, "fetchLoggedEventsForTypes:fromTime:toTime:limit:");
  v3 = v7[0];
  if (v7[0] == v7[1])
  {
    v5 = 0;
    retstr->var0.var0 = 0;
  }
  else
  {
    v4 = *(_OWORD *)v7[0];
    *(_OWORD *)((char *)&retstr->var0.var3.var1 + 4) = *(_OWORD *)(v7[0] + 12);
    *(_OWORD *)&retstr->var0.var0 = v4;
    CLMicroLocationProto::ReceivedEvent::ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)&retstr->var0.var3.var4, (const CLMicroLocationProto::ReceivedEvent *)(v3 + 32));
    v5 = 1;
  }
  LOBYTE(retstr[1].var0.var3.var4) = v5;
  v8 = (void **)v7;
  std::vector<CLMicroLocationLoggedEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v8);
  return result;
}

@end
