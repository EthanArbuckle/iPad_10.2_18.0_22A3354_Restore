@implementation ULRecordingEventStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULRecordingEventsTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511EE098, "unsignedIntValue");
  v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return CFSTR("recordingTimestamp");
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationRecordingEventsTable,ULRecordingEventMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)_fetchRecordingEventsByAndPredicates:(ULRecordingEventStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationRecordingEventsTable,ULRecordingEventMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchAllRecordsWithLimit:(ULRecordingEventStore *)self
{
  vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationRecordingEventsTable,ULRecordingEventMO>(self, a4, retstr);
  return result;
}

- (BOOL)deleteRecordingEventsFromRecordingUUIDs:(const void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint8_t buf[16];

  if (*(_QWORD *)a3 == *((_QWORD *)a3 + 1))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_100);
    v10 = logObject_MicroLocation_Default;
    v9 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "#Warning No UUIDs were passed in to delete recording events", buf, 2u);
      return 0;
    }
  }
  else
  {
    ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v8, v5, 0, 0);

  }
  return v9;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventsFromTriggerUUIDs:(ULRecordingEventStore *)self
{
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *result;
  NSObject *v14;
  uint8_t buf[8];
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)a4 == *((_QWORD *)a4 + 1))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_100);
    v14 = logObject_MicroLocation_Default;
    result = (vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "#Warning passed empty UUIDs so we can't fetch recording events", buf, 2u);
    }
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  else
  {
    v7 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
    ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("triggerUUID"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("receivedTimestamp"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULRecordingEventStore _fetchRecordingEventsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchRecordingEventsByAndPredicates:sortDescriptors:andLimit:", v11, v12, v7);

  }
  return result;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventsForRecordingUUIDs:(ULRecordingEventStore *)self
{
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *result;
  NSObject *v14;
  uint8_t buf[8];
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)a4 == *((_QWORD *)a4 + 1))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_100);
    v14 = logObject_MicroLocation_Default;
    result = (vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "#Warning passed empty UUIDs so we can't fetch recording events", buf, 2u);
    }
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  else
  {
    v7 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
    ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("receivedTimestamp"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULRecordingEventStore _fetchRecordingEventsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchRecordingEventsByAndPredicates:sortDescriptors:andLimit:", v11, v12, v7);

  }
  return result;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)_fetchRecordingEventTriggers:(ULRecordingEventStore *)self atLoiGroupId:(SEL)a3 fromTime:(const void *)a4 toTime:(const void *)a5 withLimit:(optional<const double>)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *result;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  __n128 (*v37)(__n128 *, __n128 *);
  void (*v38)(uint64_t);
  void *v39;
  _QWORD v40[3];
  void **v41;
  void *v42;
  __int128 v43;
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v43 = *(_OWORD *)a5;
  v44 = *((_BYTE *)a5 + 16);
  -[ULRecordingEventStore getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:fromTime:toTime:withLimit:](self, "getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:fromTime:toTime:withLimit:", &v43, *(_QWORD *)&a6.var0.var1, *(_QWORD *)&a6.var1, *(_QWORD *)&a7.var0.var1, *(_QWORD *)&a7.var1, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBB660]);
  objc_msgSend(v11, "setName:", CFSTR("minRecTimestamp"));
  v12 = (void *)MEMORY[0x24BDD1548];
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("recordingTimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "expressionForFunction:arguments:", CFSTR("min:"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setExpression:", v15);

  objc_msgSend(v11, "setExpressionResultType:", 500);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ULDBUtils::eventTypesToNSArray((unsigned int **)a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("eventType"), v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v18);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("recordingTimestamp"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x4812000000;
  v37 = __Block_byref_object_copy__19;
  v38 = __Block_byref_object_dispose__19;
  v39 = &unk_241BEBD1D;
  memset(v40, 0, sizeof(v40));
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __93__ULRecordingEventStore__fetchRecordingEventTriggers_atLoiGroupId_fromTime_toTime_withLimit___block_invoke;
  v28[3] = &unk_2511D46E8;
  v28[4] = self;
  v21 = v11;
  v29 = v21;
  v22 = v16;
  v30 = v22;
  v23 = v19;
  v33 = a8;
  v31 = v23;
  v32 = &v34;
  objc_msgSend(v20, "performBlockAndWait:", v28);

  v24 = v35;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__init_with_size[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry*,CLMicroLocationRecordingEventsTable::Entry*>(retstr, (__int128 *)v24[6], (__int128 *)v24[7], 0xEF7BDEF7BDEF7BDFLL * ((v24[7] - v24[6]) >> 3));

  _Block_object_dispose(&v34, 8);
  v41 = (void **)v40;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v41);

  return result;
}

void __93__ULRecordingEventStore__fetchRecordingEventTriggers_atLoiGroupId_fromTime_toTime_withLimit___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  void **v15;
  uint64_t v16;
  const __CFString *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v18[0] = CFSTR("recordingUUID");
  v18[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("recordingUUID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchManagedObjectsForEntityName:propertiesToFetch:propertiesToGroupBy:byAndPredicates:sortDescriptors:andLimit:", v4, v6, v7, v8, v9, *(unsigned int *)(a1 + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  ULDBUtils::convertManagedObjectsToEntries<CLMicroLocationRecordingEventsTable,ULRecordingEventMO>(v10, (uint64_t *)&v13);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__vdeallocate((void **)(v11 + 48));
  *(_OWORD *)(v11 + 48) = v13;
  *(_QWORD *)(v11 + 64) = v14;
  v14 = 0;
  v13 = 0uLL;
  v15 = (void **)&v13;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v15);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reset");

}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventsWithScanMeasurements:(ULRecordingEventStore *)self fromTime:(SEL)a3 toTime:(const void *)a4 withLimit:(double)a5
{
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  HIBYTE(v8) = 0;
  v9 = 0;
  LODWORD(v8) = a7;
  return -[ULRecordingEventStore _fetchRecordingEventTriggers:atLoiGroupId:fromTime:toTime:withLimit:](self, "_fetchRecordingEventTriggers:atLoiGroupId:fromTime:toTime:withLimit:", a4, (char *)&v8 + 7, *(_QWORD *)&a5, 1, *(_QWORD *)&a6, 1, v8);
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventTriggersForLearningMeasurements:(ULRecordingEventStore *)self atLoiGroupId:(SEL)a3
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  Entry *var1;
  unint64_t v16;
  uint64_t v17;
  vector<CLMicroLocationRecordingEventsTable::Entry, std::allocator<CLMicroLocationRecordingEventsTable::Entry>> *result;
  uint64_t v19;

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultsDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULLearningRecordingLimit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v13 = objc_msgSend(v12, "unsignedIntValue");
  else
    v13 = objc_msgSend(&unk_2511EE068, "unsignedIntValue");
  v14 = v13;

  LODWORD(v19) = v14;
  -[ULRecordingEventStore _fetchRecordingEventTriggers:atLoiGroupId:fromTime:toTime:withLimit:](self, "_fetchRecordingEventTriggers:atLoiGroupId:fromTime:toTime:withLimit:", a4, a5, 0, 0, 0, 0, v19);
  var1 = retstr->var1;
  v16 = 126 - 2 * __clz(0xEF7BDEF7BDEF7BDFLL * (((char *)var1 - (char *)retstr->var0) >> 3));
  if (var1 == retstr->var0)
    v17 = 0;
  else
    v17 = v16;
  std::__introsort<std::_ClassicAlgPolicy,-[ULRecordingEventStore fetchRecordingEventTriggersForLearningMeasurements:atLoiGroupId:]::$_0 &,CLMicroLocationRecordingEventsTable::Entry *,false>((unint64_t *)retstr->var0->var0.var0, (unint64_t *)var1->var0.var0, v17, 1);
  return result;
}

- (vector<CLMicroLocationRecordingEventsTable::Entry,)fetchRecordingEventTriggersForLearningMeasurements:(ULRecordingEventStore *)self
{
  _BYTE v5[17];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v5[16] = 0;
  return -[ULRecordingEventStore fetchRecordingEventTriggersForLearningMeasurements:atLoiGroupId:](self, "fetchRecordingEventTriggersForLearningMeasurements:atLoiGroupId:", a4, v5);
}

- (id)getTriggerUUIDsForLoiGroupId:(const uuid *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  v15[1] = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v15);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != NIL && %K != %@"), CFSTR("triggerUUID"), CFSTR("triggerUUID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v12, CFSTR("triggerUUID"), 1, v5, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unsigned)countRecordingEventsFromTime:(double)a3 toTime:(double)a4 atLoiGroupId:(const uuid *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  unsigned int v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K > %@ && %K <= %@"), CFSTR("recordingTimestamp"), v11, CFSTR("recordingTimestamp"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v13);

  objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v15);

  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore countManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "countManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v17, v9, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = objc_msgSend(v18, "unsignedIntValue");
  else
    v19 = 0;

  return v19;
}

- (vector<boost::uuids::uuid,)fetchDistinctRecordingEventsFromTime:(ULRecordingEventStore *)self toTime:(SEL)a3 atLoiGroupId:(double)a4 withLimit:(double)a5
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  vector<boost::uuids::uuid, std::allocator<boost::uuids::uuid>> *result;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithFormat:", CFSTR("%K > %@ && %K <= %@"), CFSTR("recordingTimestamp"), v15, CFSTR("recordingTimestamp"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v17);

  objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v19);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("recordingTimestamp"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v22, CFSTR("recordingUUID"), 1, v13, v23, a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  ULDBUtils::boostUUIDsFromNSStringArray(v24, retstr);
  return result;
}

- (id)getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:(optional<const boost:(optional<const double>)a4 :(optional<const double>)a5 uuids:(unsigned int)a6 :uuid> *)a3 fromTime:toTime:withLimit:
{
  BOOL var1;
  double v8;
  BOOL v9;
  double v10;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;

  var1 = a5.var1;
  v8 = a5.var0.var1;
  v9 = a4.var1;
  v10 = a4.var0.var1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("eventType"), &unk_2511EE008);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("eventSubType"), &unk_2511EE020);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v15);

  if (v9 && var1)
  {
    v16 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K > %@ && %K <= %@"), CFSTR("recordingTimestamp"), v17, CFSTR("recordingTimestamp"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v19);

  }
  if (a3->var1)
  {
    v20 = (id)-[ULStore db](self, "db")[56];
    v21 = v20;
    if (!a3->var1)
      std::__throw_bad_optional_access[abi:ne180100]();
    objc_msgSend(v20, "getLoiIdsInLoiGroupId:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v23);

  }
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v25, CFSTR("recordingUUID"), 1, v13, 0, a6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)getRecordingUUIDsForLocalizationActionsFromTime:(optional<const double>)a3 toTime:(optional<const double>)a4
{
  BOOL var1;
  double v5;
  BOOL v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;

  var1 = a4.var1;
  v5 = a4.var0.var1;
  v6 = a3.var1;
  v7 = a3.var0.var1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("eventType"), &unk_2511EE008);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("eventSubType"), &unk_2511EE8B0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  if (v6 && var1)
  {
    v12 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K > %@ && %K <= %@"), CFSTR("recordingTimestamp"), v13, CFSTR("recordingTimestamp"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v15);

  }
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v17, CFSTR("recordingUUID"), 1, v9, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)getRecordingUUIDsOlderThan:(double)a3 orNewerThan:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K < %@ || %K > %@"), CFSTR("recordingTimestamp"), v9, CFSTR("recordingTimestamp"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v13, CFSTR("recordingUUID"), 1, v7, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getDistinctRecordingUUIDsWithLimit:(unsigned int)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("recordingTimestamp"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v7, CFSTR("recordingUUID"), 1, 0, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)fetchMostRecentRecordingForLoiGroupId:(_BYTE *)a3@<X8>
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 *v11[3];
  __int128 **v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(objc_msgSend(a1, "db") + 56), "getLoiIdsInLoiGroupId:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("recordingTimestamp"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchRecordingEventsByAndPredicates:sortDescriptors:andLimit:", v6, v10, 1);

  if (v11[0] == v11[1])
  {
    *a3 = 0;
    a3[248] = 0;
  }
  else
  {
    std::__optional_destruct_base<CLMicroLocationRecordingEventsTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((uint64_t)a3, v11[0]);
  }
  v12 = v11;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);

}

- (double)getOldestRecordingTimestamp
{
  double v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  void **v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = cl::chrono::CFAbsoluteTimeClock::now();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("recordingTimestamp"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchRecordingEventsByAndPredicates:sortDescriptors:andLimit:", 0, v4, 1);

  if (v6[1] != v6[0])
    v2 = *(double *)(v6[0] + 16);
  v7 = (void **)v6;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v7);

  return v2;
}

- (vector<std::string,)selectAllRecordingLOITypesFromTime:(ULRecordingEventStore *)self andLimit:(SEL)a3
{
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  char *var0;
  char *var1;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  std::string *v26;
  std::string *v27;
  __int128 v28;
  void *v29;
  int v30;
  vector<std::string, std::allocator<std::string>> *result;
  void *v32;
  void *__p[2];
  std::string::size_type v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  std::__split_buffer<std::string> __v;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("recordingTimestamp"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v11);

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v13, CFSTR("loiType"), 1, v32, 0, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v15);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i)), "UTF8String"));
        var1 = (char *)retstr->var1;
        var0 = (char *)retstr->var2.var0;
        if (var1 >= var0)
        {
          v22 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
          v23 = v22 + 1;
          if (v22 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<CLMicroLocationProto::ConfidenceReason>::__throw_length_error[abi:ne180100]();
          v24 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
          if (2 * v24 > v23)
            v23 = 2 * v24;
          if (v24 >= 0x555555555555555)
            v25 = 0xAAAAAAAAAAAAAAALL;
          else
            v25 = v23;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&retstr->var2;
          if (v25)
            v26 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&retstr->var2, v25);
          else
            v26 = 0;
          v27 = v26 + v22;
          __v.__first_ = v26;
          __v.__begin_ = v27;
          __v.__end_cap_.__value_ = &v26[v25];
          v28 = *(_OWORD *)__p;
          v27->__r_.__value_.__r.__words[2] = v34;
          *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v28;
          __p[1] = 0;
          v34 = 0;
          __p[0] = 0;
          __v.__end_ = v27 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)retstr, &__v);
          v29 = retstr->var1;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v30 = SHIBYTE(v34);
          retstr->var1 = v29;
          if (v30 < 0)
            operator delete(__p[0]);
        }
        else
        {
          v21 = *(_OWORD *)__p;
          *((_QWORD *)var1 + 2) = v34;
          *(_OWORD *)var1 = v21;
          retstr->var1 = var1 + 24;
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v16);
  }

  return result;
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
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("recordingTimestamp"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__ULRecordingEventStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore___block_invoke;
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

void __85__ULRecordingEventStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore___block_invoke(_QWORD *a1)
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

- (BOOL)batchTransferRecordingEventsForRecordingUUIDs:(const void *)a3 withEventTypes:(const void *)a4 batchSize:(unint64_t)a5 andLimit:(unsigned int)a6 intoTargetStore:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  unint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v12 = a7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v15);

  ULDBUtils::eventTypesToNSArray((unsigned int **)a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("eventType"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v17);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("receivedTimestamp"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __121__ULRecordingEventStore_batchTransferRecordingEventsForRecordingUUIDs_withEventTypes_batchSize_andLimit_intoTargetStore___block_invoke;
  v24[3] = &unk_2511DA788;
  v28 = &v31;
  v24[4] = self;
  v20 = v13;
  v25 = v20;
  v21 = v18;
  v26 = v21;
  v29 = a5;
  v30 = a6;
  v22 = v12;
  v27 = v22;
  objc_msgSend(v19, "performBlockAndWait:", v24);

  LOBYTE(v12) = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v31, 8);

  return (char)v12;
}

void __121__ULRecordingEventStore_batchTransferRecordingEventsForRecordingUUIDs_withEventTypes_batchSize_andLimit_intoTargetStore___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v2, "batchTransferManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:batchSize:limit:intoTargetStore:", v4, v5, v6, *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 56));

}

- (unsigned)countRecordingEventsForLoiGroupId:(const uuid *)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore countManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "countManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v9, v5, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = objc_msgSend(v10, "unsignedIntValue");
  else
    v11 = 0;

  return v11;
}

- (void)fetchRecordingEventTriggersForLearningMeasurements:(uint64_t)a3 atLoiGroupId:(char)a4
{
  __int128 *v6;
  unint64_t *v7;
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  __int128 v23;
  unint64_t v24;
  __int128 v25;
  uint64_t v26;
  void **v27;
  __int128 v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  unint64_t *v32;
  __int128 *v33;
  __int128 *v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  __int128 *v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  __int128 *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int v52;
  unint64_t *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void **v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  BOOL v63;
  BOOL v64;
  unint64_t *v65;
  unint64_t v66;
  unint64_t v67;
  int v68;
  unint64_t *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  int v73;
  __int128 *v74;
  __int128 *v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  int v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  int v84;
  __int128 *v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  int v89;
  unint64_t *v90;
  void **v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  void **v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t *v103;
  uint64_t v104;
  CLMicroLocationProto::RecordingEvent *v105;
  unint64_t *v106;
  unint64_t *v107;
  unint64_t v108;
  unint64_t v109;
  int v110;
  __int128 v111;
  const CLMicroLocationProto::RecordingEvent *v112;
  uint64_t v113;
  char *v114;
  void **v115;
  char *v116;
  unint64_t v117;
  unint64_t v118;
  int v119;
  uint64_t v120;
  __int128 v121;
  void **v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  int64_t v126;
  int64_t v127;
  int64_t v128;
  uint64_t v129;
  unint64_t *v130;
  unint64_t v131;
  unint64_t v132;
  int v133;
  unint64_t *v134;
  unint64_t v135;
  unint64_t v136;
  int v137;
  __int128 v138;
  unint64_t *v139;
  __int128 v140;
  __int128 v141;
  unint64_t *v142;
  __int128 v143;
  unint64_t *v144;
  __int128 v145;
  void **v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  unint64_t v150;
  unint64_t v151;
  int v152;
  unint64_t v153;
  unint64_t v154;
  int v155;
  void **v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  int64_t v161;
  uint64_t v162;
  __int128 v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  unint64_t v168;
  int v169;
  __int128 v170;
  void **v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  void **v175;
  __int128 *v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  void **v180;
  __int128 v181;
  unint64_t *v182;
  unint64_t *v183;
  __int128 v184;
  uint64_t v185;
  unint64_t v186;
  unint64_t *v187;
  unint64_t v188;
  unint64_t v189;
  __int128 v190;
  int v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  uint64_t v196;
  __int128 v197;
  void **v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  unint64_t v202;
  unint64_t v203;
  int v204;
  void **v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  int v211;
  unint64_t *v212;
  unint64_t *i;
  unint64_t *v214;
  unint64_t v215;
  unint64_t v216;
  unint64_t *v217;
  int v218;
  __int128 v219;
  unint64_t *v220;
  void **v221;
  unint64_t v222;
  unint64_t v223;
  int v224;
  __int128 v225;
  void **v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  CLMicroLocationProto::RecordingEvent *v230;
  CLMicroLocationProto::RecordingEvent *v232;
  __int128 v234;
  unint64_t v235;
  __int128 v236;
  unint64_t v237;
  _BYTE v238[28];
  _BYTE v239[144];
  __int128 v240;
  char v241;
  __int128 v242;
  unint64_t v243;
  __int128 __p;
  unint64_t v245;
  _OWORD v246[2];
  _BYTE v247[144];
  __int128 v248;
  char v249;
  uint64_t v250;

  v250 = *MEMORY[0x24BDAC8D0];
LABEL_2:
  v6 = (__int128 *)a2;
  v7 = a2 - 31;
  v8 = a1;
  while (2)
  {
    a1 = v8;
    v9 = (char *)v6 - (char *)v8;
    v10 = 0xEF7BDEF7BDEF7BDFLL * (v9 >> 3);
    switch(v10)
    {
      case 0:
      case 1:
        return;
      case 2:
        v101 = bswap64(*(a2 - 31));
        v102 = bswap64(*a1);
        if (v101 != v102 || (v101 = bswap64(*(a2 - 30)), v102 = bswap64(a1[1]), v101 != v102))
        {
          if (v101 < v102)
            v211 = -1;
          else
            v211 = 1;
          if (v211 < 0)
            std::swap[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((__int128 *)a1, (__int128 *)(a2 - 31));
        }
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1, a1 + 31, v7);
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1, a1 + 31, a1 + 62, v7);
        return;
      case 5:
        std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *,0>(a1, a1 + 31, a1 + 62, a1 + 93, v7);
        return;
      default:
        if (v9 > 5951)
        {
          if (!a3)
          {
            if (a1 != (unint64_t *)v6)
            {
              v126 = (unint64_t)(v10 - 2) >> 1;
              v127 = v126;
              do
              {
                v128 = v127;
                if (v126 >= v127)
                {
                  v129 = (2 * v127) | 1;
                  v130 = &a1[31 * v129];
                  if (2 * v127 + 2 < v10)
                  {
                    v131 = bswap64(*v130);
                    v132 = bswap64(v130[31]);
                    if (v131 == v132 && (v131 = bswap64(v130[1]), v132 = bswap64(v130[32]), v131 == v132))
                      v133 = 0;
                    else
                      v133 = v131 < v132 ? -1 : 1;
                    if (v133 < 0)
                    {
                      v130 += 31;
                      v129 = 2 * v127 + 2;
                    }
                  }
                  v134 = &a1[31 * v127];
                  v135 = bswap64(*v130);
                  v136 = bswap64(*v134);
                  if (v135 == v136 && (v135 = bswap64(v130[1]), v136 = bswap64(v134[1]), v135 == v136)
                    || (v135 < v136 ? (v137 = -1) : (v137 = 1), (v137 & 0x80000000) == 0))
                  {
                    v138 = *(_OWORD *)v134;
                    v243 = v134[2];
                    v242 = v138;
                    v139 = &a1[31 * v128];
                    v140 = *(_OWORD *)(v139 + 3);
                    v245 = v139[5];
                    __p = v140;
                    v139[4] = 0;
                    v139[5] = 0;
                    v139[3] = 0;
                    v141 = *((_OWORD *)v139 + 3);
                    *(_OWORD *)((char *)v246 + 12) = *(_OWORD *)((char *)v139 + 60);
                    v246[0] = v141;
                    CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247, (const CLMicroLocationProto::RecordingEvent *)(v139 + 10));
                    v142 = &a1[31 * v128];
                    v143 = *((_OWORD *)v142 + 14);
                    v249 = *((_BYTE *)v142 + 240);
                    v248 = v143;
                    do
                    {
                      v144 = v130;
                      v145 = *(_OWORD *)v130;
                      v134[2] = v130[2];
                      *(_OWORD *)v134 = v145;
                      v146 = (void **)(v134 + 3);
                      if (*((char *)v134 + 47) < 0)
                        operator delete(*v146);
                      v147 = *(_OWORD *)(v144 + 3);
                      v134[5] = v144[5];
                      *(_OWORD *)v146 = v147;
                      *((_BYTE *)v144 + 47) = 0;
                      *((_BYTE *)v144 + 24) = 0;
                      v148 = *((_OWORD *)v144 + 3);
                      *(_OWORD *)((char *)v134 + 60) = *(_OWORD *)((char *)v144 + 60);
                      *((_OWORD *)v134 + 3) = v148;
                      CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v134 + 10), (const CLMicroLocationProto::RecordingEvent *)(v144 + 10));
                      v149 = *((_OWORD *)v144 + 14);
                      *((_BYTE *)v134 + 240) = *((_BYTE *)v144 + 240);
                      *((_OWORD *)v134 + 14) = v149;
                      if (v126 < v129)
                        break;
                      v130 = &a1[31 * ((2 * v129) | 1)];
                      if (2 * v129 + 2 >= v10)
                      {
                        v129 = (2 * v129) | 1;
                      }
                      else
                      {
                        v150 = bswap64(*v130);
                        v151 = bswap64(v130[31]);
                        if (v150 == v151 && (v150 = bswap64(v130[1]), v151 = bswap64(v130[32]), v150 == v151))
                          v152 = 0;
                        else
                          v152 = v150 < v151 ? -1 : 1;
                        if (v152 >= 0)
                        {
                          v129 = (2 * v129) | 1;
                        }
                        else
                        {
                          v130 += 31;
                          v129 = 2 * v129 + 2;
                        }
                      }
                      v153 = bswap64(*v130);
                      v154 = bswap64(v242);
                      if (v153 == v154
                        && (v153 = bswap64(v130[1]), v154 = bswap64(*((unint64_t *)&v242 + 1)), v153 == v154))
                      {
                        v155 = 0;
                      }
                      else
                      {
                        v155 = v153 < v154 ? -1 : 1;
                      }
                      v134 = v144;
                    }
                    while ((v155 & 0x80000000) == 0);
                    v156 = (void **)(v144 + 3);
                    v157 = v242;
                    v144[2] = v243;
                    *(_OWORD *)v144 = v157;
                    if (*((char *)v144 + 47) < 0)
                      operator delete(*v156);
                    v158 = __p;
                    v144[5] = v245;
                    *(_OWORD *)v156 = v158;
                    HIBYTE(v245) = 0;
                    LOBYTE(__p) = 0;
                    v159 = *(_OWORD *)((char *)v246 + 12);
                    *((_OWORD *)v144 + 3) = v246[0];
                    *(_OWORD *)((char *)v144 + 60) = v159;
                    CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v144 + 10), (const CLMicroLocationProto::RecordingEvent *)v247);
                    v160 = v248;
                    *((_BYTE *)v144 + 240) = v249;
                    *((_OWORD *)v144 + 14) = v160;
                    CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247);
                    if (SHIBYTE(v245) < 0)
                      operator delete((void *)__p);
                  }
                }
                v127 = v128 - 1;
              }
              while (v128);
              v161 = v9 / 0xF8uLL;
              v230 = (CLMicroLocationProto::RecordingEvent *)(a1 + 3);
              do
              {
                v235 = a1[2];
                v234 = *(_OWORD *)a1;
                v236 = *(_OWORD *)v230;
                v237 = a1[5];
                a1[4] = 0;
                a1[5] = 0;
                *(_QWORD *)v230 = 0;
                *(_OWORD *)v238 = *((_OWORD *)a1 + 3);
                *(_OWORD *)&v238[12] = *(_OWORD *)((char *)a1 + 60);
                CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v239, (const CLMicroLocationProto::RecordingEvent *)(a1 + 10));
                v162 = 0;
                v163 = *((_OWORD *)a1 + 14);
                v241 = *((_BYTE *)a1 + 240);
                v240 = v163;
                v164 = (uint64_t)a1;
                do
                {
                  v165 = v164 + 248 * v162 + 248;
                  v166 = 2 * v162;
                  v162 = (2 * v162) | 1;
                  if (v166 + 2 < v161)
                  {
                    v167 = bswap64(*(_QWORD *)v165);
                    v168 = bswap64(*(_QWORD *)(v165 + 248));
                    if (v167 == v168
                      && (v167 = bswap64(*(_QWORD *)(v165 + 8)), v168 = bswap64(*(_QWORD *)(v165 + 256)), v167 == v168))
                    {
                      v169 = 0;
                    }
                    else
                    {
                      v169 = v167 < v168 ? -1 : 1;
                    }
                    if (v169 < 0)
                    {
                      v165 += 248;
                      v162 = v166 + 2;
                    }
                  }
                  v170 = *(_OWORD *)v165;
                  *(_QWORD *)(v164 + 16) = *(_QWORD *)(v165 + 16);
                  *(_OWORD *)v164 = v170;
                  v171 = (void **)(v164 + 24);
                  if (*(char *)(v164 + 47) < 0)
                    operator delete(*v171);
                  v172 = *(_OWORD *)(v165 + 24);
                  *(_QWORD *)(v164 + 40) = *(_QWORD *)(v165 + 40);
                  *(_OWORD *)v171 = v172;
                  *(_BYTE *)(v165 + 47) = 0;
                  *(_BYTE *)(v165 + 24) = 0;
                  v173 = *(_OWORD *)(v165 + 48);
                  *(_OWORD *)(v164 + 60) = *(_OWORD *)(v165 + 60);
                  *(_OWORD *)(v164 + 48) = v173;
                  CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v164 + 80), (const CLMicroLocationProto::RecordingEvent *)(v165 + 80));
                  v174 = *(_OWORD *)(v165 + 224);
                  *(_BYTE *)(v164 + 240) = *(_BYTE *)(v165 + 240);
                  *(_OWORD *)(v164 + 224) = v174;
                  v164 = v165;
                }
                while (v162 <= (uint64_t)((unint64_t)(v161 - 2) >> 1));
                v175 = (void **)(v165 + 24);
                v176 = (__int128 *)(v165 + 48);
                v232 = (CLMicroLocationProto::RecordingEvent *)(v165 + 224);
                if ((unint64_t *)v165 == a2 - 31)
                {
                  *(_QWORD *)(v165 + 16) = v235;
                  *(_OWORD *)v165 = v234;
                  if (*(char *)(v165 + 47) < 0)
                    operator delete(*v175);
                  *(_QWORD *)(v165 + 40) = v237;
                  *(_OWORD *)v175 = v236;
                  *(_OWORD *)(v165 + 60) = *(_OWORD *)&v238[12];
                  *v176 = *(_OWORD *)v238;
                  CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v165 + 80), (const CLMicroLocationProto::RecordingEvent *)v239);
                  v190 = v240;
                  *(_BYTE *)(v165 + 240) = v241;
                  *(_OWORD *)v232 = v190;
                }
                else
                {
                  v177 = *(_OWORD *)(a2 - 31);
                  *(_QWORD *)(v165 + 16) = *(a2 - 29);
                  *(_OWORD *)v165 = v177;
                  if (*(char *)(v165 + 47) < 0)
                    operator delete(*v175);
                  v178 = *((_OWORD *)a2 - 14);
                  *(_QWORD *)(v165 + 40) = *(a2 - 26);
                  *(_OWORD *)v175 = v178;
                  *((_BYTE *)a2 - 201) = 0;
                  *((_BYTE *)a2 - 224) = 0;
                  v179 = *(_OWORD *)(a2 - 25);
                  *(_OWORD *)(v165 + 60) = *(_OWORD *)((char *)a2 - 188);
                  *v176 = v179;
                  CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v165 + 80), (const CLMicroLocationProto::RecordingEvent *)(a2 - 21));
                  v180 = (void **)(a2 - 28);
                  v181 = *(_OWORD *)(a2 - 3);
                  *(_BYTE *)(v165 + 240) = *((_BYTE *)a2 - 8);
                  *(_OWORD *)v232 = v181;
                  *(a2 - 29) = v235;
                  *(_OWORD *)(a2 - 31) = v234;
                  if (*((char *)a2 - 201) < 0)
                    operator delete(*v180);
                  v182 = a2 - 25;
                  *(a2 - 26) = v237;
                  *(_OWORD *)v180 = v236;
                  *(_OWORD *)((char *)v182 + 12) = *(_OWORD *)&v238[12];
                  *(_OWORD *)v182 = *(_OWORD *)v238;
                  CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(a2 - 21), (const CLMicroLocationProto::RecordingEvent *)v239);
                  v183 = a2 - 3;
                  v184 = v240;
                  *((_BYTE *)v183 + 16) = v241;
                  *(_OWORD *)v183 = v184;
                  v185 = v165 - (_QWORD)a1 + 248;
                  if (v185 >= 249)
                  {
                    v186 = (v185 / 0xF8uLL - 2) >> 1;
                    v187 = &a1[31 * v186];
                    v188 = bswap64(*v187);
                    v189 = bswap64(*(_QWORD *)v165);
                    if (v188 != v189 || (v188 = bswap64(v187[1]), v189 = bswap64(*(_QWORD *)(v165 + 8)), v188 != v189))
                    {
                      v191 = v188 < v189 ? -1 : 1;
                      if (v191 < 0)
                      {
                        v192 = *(_OWORD *)v165;
                        v243 = *(_QWORD *)(v165 + 16);
                        v242 = v192;
                        v193 = *(_OWORD *)v175;
                        v245 = *(_QWORD *)(v165 + 40);
                        __p = v193;
                        *(_QWORD *)(v165 + 32) = 0;
                        *(_QWORD *)(v165 + 40) = 0;
                        *v175 = 0;
                        v194 = *v176;
                        *(_OWORD *)((char *)v246 + 12) = *(_OWORD *)(v165 + 60);
                        v246[0] = v194;
                        CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247, (const CLMicroLocationProto::RecordingEvent *)(v165 + 80));
                        v195 = *(_OWORD *)v232;
                        v249 = *(_BYTE *)(v165 + 240);
                        v248 = v195;
                        do
                        {
                          v196 = (uint64_t)v187;
                          v197 = *(_OWORD *)v187;
                          *(_QWORD *)(v165 + 16) = v187[2];
                          *(_OWORD *)v165 = v197;
                          v198 = (void **)(v165 + 24);
                          if (*(char *)(v165 + 47) < 0)
                            operator delete(*v198);
                          v199 = *(_OWORD *)(v187 + 3);
                          *(_QWORD *)(v165 + 40) = v187[5];
                          *(_OWORD *)v198 = v199;
                          *((_BYTE *)v187 + 47) = 0;
                          *((_BYTE *)v187 + 24) = 0;
                          v200 = *((_OWORD *)v187 + 3);
                          *(_OWORD *)(v165 + 60) = *(_OWORD *)((char *)v187 + 60);
                          *(_OWORD *)(v165 + 48) = v200;
                          CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v165 + 80), (const CLMicroLocationProto::RecordingEvent *)(v187 + 10));
                          v201 = *((_OWORD *)v187 + 14);
                          *(_BYTE *)(v165 + 240) = *((_BYTE *)v187 + 240);
                          *(_OWORD *)(v165 + 224) = v201;
                          if (!v186)
                            break;
                          v186 = (v186 - 1) >> 1;
                          v187 = &a1[31 * v186];
                          v202 = bswap64(*v187);
                          v203 = bswap64(v242);
                          if (v202 == v203
                            && (v202 = bswap64(v187[1]), v203 = bswap64(*((unint64_t *)&v242 + 1)), v202 == v203))
                          {
                            v204 = 0;
                          }
                          else
                          {
                            v204 = v202 < v203 ? -1 : 1;
                          }
                          v165 = v196;
                        }
                        while (v204 < 0);
                        v205 = (void **)(v196 + 24);
                        v206 = v242;
                        *(_QWORD *)(v196 + 16) = v243;
                        *(_OWORD *)v196 = v206;
                        if (*(char *)(v196 + 47) < 0)
                          operator delete(*v205);
                        v207 = __p;
                        *(_QWORD *)(v196 + 40) = v245;
                        *(_OWORD *)v205 = v207;
                        HIBYTE(v245) = 0;
                        LOBYTE(__p) = 0;
                        v208 = *(_OWORD *)((char *)v246 + 12);
                        *(_OWORD *)(v196 + 48) = v246[0];
                        *(_OWORD *)(v196 + 60) = v208;
                        CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v196 + 80), (const CLMicroLocationProto::RecordingEvent *)v247);
                        v209 = v248;
                        *(_BYTE *)(v196 + 240) = v249;
                        *(_OWORD *)(v196 + 224) = v209;
                        CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247);
                        if (SHIBYTE(v245) < 0)
                          operator delete((void *)__p);
                      }
                    }
                  }
                }
                CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v239);
                a2 -= 31;
              }
              while (v161-- > 2);
            }
            return;
          }
          v11 = (unint64_t)v10 >> 1;
          v12 = &a1[31 * ((unint64_t)v10 >> 1)];
          if ((unint64_t)v9 < 0x7C01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(v12, a1, v7);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1, v12, v7);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1 + 31, &a1[31 * v11 - 31], a2 - 62);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(a1 + 62, &a1[31 * v11 + 31], a2 - 93);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CLMicroLocationLearner::semiSupervisedLearnWrapper(CLMicroLocationClientUtils::ClientIdAndClientServiceId const&,std::vector<CLMicroLocationProto::EventType> const&,CLMicroLocationProto::Model_GenerationAlgorithm,NSMutableDictionary *,std::function<BOOL ()(void)>,CLMicroLocationFingerprintPool &,std::string const&,boost::uuids::uuid const&)::$_2 &,CLMicroLocationRecordingEventsTable::Entry *>(&a1[31 * v11 - 31], v12, &a1[31 * v11 + 31]);
            std::swap[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((__int128 *)a1, (__int128 *)v12);
          }
          --a3;
          if ((a4 & 1) == 0)
          {
            if ((v13 = bswap64(*(a1 - 31)), v14 = bswap64(*a1), v13 == v14)
              && (v13 = bswap64(*(a1 - 30)), v14 = bswap64(a1[1]), v13 == v14)
              || (v13 < v14 ? (v22 = -1) : (v22 = 1), (v22 & 0x80000000) == 0))
            {
              v15 = *(_OWORD *)a1;
              v243 = a1[2];
              v242 = v15;
              v16 = a1[5];
              __p = *(_OWORD *)(a1 + 3);
              v245 = v16;
              a1[4] = 0;
              a1[5] = 0;
              a1[3] = 0;
              v17 = *(_OWORD *)((char *)a1 + 60);
              v246[0] = *((_OWORD *)a1 + 3);
              *(_OWORD *)((char *)v246 + 12) = v17;
              CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247, (const CLMicroLocationProto::RecordingEvent *)(a1 + 10));
              v18 = *((_OWORD *)a1 + 14);
              v249 = *((_BYTE *)a1 + 240);
              v248 = v18;
              v19 = bswap64(v242);
              v20 = bswap64(*v7);
              if (v19 == v20
                && (v19 = bswap64(*((unint64_t *)&v242 + 1)), v20 = bswap64(*(a2 - 30)), v19 == v20))
              {
                v21 = 0;
              }
              else if (v19 < v20)
              {
                v21 = -1;
              }
              else
              {
                v21 = 1;
              }
              if (v21 < 0)
              {
                v69 = a1;
                v8 = a1;
                do
                {
                  v70 = v8[31];
                  v8 += 31;
                  v71 = bswap64(v242);
                  v72 = bswap64(v70);
                  if (v71 == v72
                    && (v71 = bswap64(*((unint64_t *)&v242 + 1)), v72 = bswap64(v69[32]), v71 == v72))
                  {
                    v73 = 0;
                  }
                  else if (v71 < v72)
                  {
                    v73 = -1;
                  }
                  else
                  {
                    v73 = 1;
                  }
                  v69 = v8;
                }
                while ((v73 & 0x80000000) == 0);
              }
              else
              {
                v65 = a1 + 31;
                do
                {
                  v8 = v65;
                  if (v65 >= (unint64_t *)v6)
                    break;
                  v66 = bswap64(v242);
                  v67 = bswap64(*v8);
                  if (v66 == v67 && (v66 = bswap64(*((unint64_t *)&v242 + 1)), v67 = bswap64(v8[1]), v66 == v67))
                    v68 = 0;
                  else
                    v68 = v66 < v67 ? -1 : 1;
                  v65 = v8 + 31;
                }
                while ((v68 & 0x80000000) == 0);
              }
              v74 = v6;
              if (v8 < (unint64_t *)v6)
              {
                v75 = v6;
                v74 = v6;
                do
                {
                  v76 = *((_QWORD *)v74 - 31);
                  v74 = (__int128 *)((char *)v74 - 248);
                  v77 = bswap64(v242);
                  v78 = bswap64(v76);
                  if (v77 == v78
                    && (v77 = bswap64(*((unint64_t *)&v242 + 1)), v78 = bswap64(*((_QWORD *)v75 - 30)),
                                                                         v77 == v78))
                  {
                    v79 = 0;
                  }
                  else if (v77 < v78)
                  {
                    v79 = -1;
                  }
                  else
                  {
                    v79 = 1;
                  }
                  v75 = v74;
                }
                while (v79 < 0);
              }
              while (v8 < (unint64_t *)v74)
              {
                std::swap[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((__int128 *)v8, v74);
                v80 = v8;
                do
                {
                  v81 = v8[31];
                  v8 += 31;
                  v82 = bswap64(v242);
                  v83 = bswap64(v81);
                  if (v82 == v83
                    && (v82 = bswap64(*((unint64_t *)&v242 + 1)), v83 = bswap64(v80[32]), v82 == v83))
                  {
                    v84 = 0;
                  }
                  else if (v82 < v83)
                  {
                    v84 = -1;
                  }
                  else
                  {
                    v84 = 1;
                  }
                  v80 = v8;
                }
                while ((v84 & 0x80000000) == 0);
                v85 = v74;
                do
                {
                  v86 = *((_QWORD *)v74 - 31);
                  v74 = (__int128 *)((char *)v74 - 248);
                  v87 = bswap64(v242);
                  v88 = bswap64(v86);
                  if (v87 == v88
                    && (v87 = bswap64(*((unint64_t *)&v242 + 1)), v88 = bswap64(*((_QWORD *)v85 - 30)),
                                                                         v87 == v88))
                  {
                    v89 = 0;
                  }
                  else if (v87 < v88)
                  {
                    v89 = -1;
                  }
                  else
                  {
                    v89 = 1;
                  }
                  v85 = v74;
                }
                while (v89 < 0);
              }
              v90 = v8 - 31;
              if (v8 - 31 != a1)
              {
                v91 = (void **)(a1 + 3);
                v92 = *(_OWORD *)v90;
                a1[2] = *(v8 - 29);
                *(_OWORD *)a1 = v92;
                if (*((char *)a1 + 47) < 0)
                  operator delete(*v91);
                v93 = *((_OWORD *)v8 - 14);
                a1[5] = *(v8 - 26);
                *(_OWORD *)v91 = v93;
                *((_BYTE *)v8 - 201) = 0;
                *((_BYTE *)v8 - 224) = 0;
                v94 = *(_OWORD *)(v8 - 25);
                *(_OWORD *)((char *)a1 + 60) = *(_OWORD *)((char *)v8 - 188);
                *((_OWORD *)a1 + 3) = v94;
                CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(a1 + 10), (const CLMicroLocationProto::RecordingEvent *)(v8 - 21));
                v95 = *(_OWORD *)(v8 - 3);
                *((_BYTE *)a1 + 240) = *((_BYTE *)v8 - 8);
                *((_OWORD *)a1 + 14) = v95;
              }
              v96 = v242;
              *(v8 - 29) = v243;
              *(_OWORD *)v90 = v96;
              v97 = (void **)(v8 - 28);
              if (*((char *)v8 - 201) < 0)
                operator delete(*v97);
              v98 = __p;
              *(v8 - 26) = v245;
              *(_OWORD *)v97 = v98;
              HIBYTE(v245) = 0;
              LOBYTE(__p) = 0;
              v99 = v246[0];
              *(_OWORD *)((char *)v8 - 188) = *(_OWORD *)((char *)v246 + 12);
              *(_OWORD *)(v8 - 25) = v99;
              CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v8 - 21), (const CLMicroLocationProto::RecordingEvent *)v247);
              v100 = v248;
              *((_BYTE *)v8 - 8) = v249;
              *(_OWORD *)(v8 - 3) = v100;
              CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247);
              if (SHIBYTE(v245) < 0)
                operator delete((void *)__p);
              goto LABEL_79;
            }
          }
          v23 = *(_OWORD *)a1;
          v243 = a1[2];
          v242 = v23;
          v24 = a1[5];
          __p = *(_OWORD *)(a1 + 3);
          v245 = v24;
          a1[4] = 0;
          a1[5] = 0;
          a1[3] = 0;
          v25 = *(_OWORD *)((char *)a1 + 60);
          v246[0] = *((_OWORD *)a1 + 3);
          *(_OWORD *)((char *)v246 + 12) = v25;
          CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247, (const CLMicroLocationProto::RecordingEvent *)(a1 + 10));
          v26 = 0;
          v27 = (void **)(a1 + 3);
          v28 = *((_OWORD *)a1 + 14);
          v249 = *((_BYTE *)a1 + 240);
          v248 = v28;
          do
          {
            v29 = bswap64(a1[v26 + 31]);
            v30 = bswap64(v242);
            if (v29 == v30
              && (v29 = bswap64(a1[v26 + 32]), v30 = bswap64(*((unint64_t *)&v242 + 1)), v29 == v30))
            {
              v31 = 0;
            }
            else if (v29 < v30)
            {
              v31 = -1;
            }
            else
            {
              v31 = 1;
            }
            v26 += 31;
          }
          while (v31 < 0);
          v32 = &a1[v26];
          v33 = v6;
          if (v26 == 31)
          {
            v38 = a2;
            while (v32 < v38)
            {
              v34 = (__int128 *)(v38 - 31);
              v39 = bswap64(*(v38 - 31));
              v40 = bswap64(v242);
              if (v39 == v40
                && (v39 = bswap64(*(v38 - 30)), v40 = bswap64(*((unint64_t *)&v242 + 1)), v39 == v40))
              {
                v41 = 0;
              }
              else if (v39 < v40)
              {
                v41 = -1;
              }
              else
              {
                v41 = 1;
              }
              v38 -= 31;
              if (v41 < 0)
                goto LABEL_47;
            }
            v34 = (__int128 *)v38;
          }
          else
          {
            do
            {
              v34 = (__int128 *)((char *)v33 - 248);
              v35 = bswap64(*((_QWORD *)v33 - 31));
              v36 = bswap64(v242);
              if (v35 == v36
                && (v35 = bswap64(*((_QWORD *)v33 - 30)), v36 = bswap64(*((unint64_t *)&v242 + 1)), v35 == v36))
              {
                v37 = 0;
              }
              else if (v35 < v36)
              {
                v37 = -1;
              }
              else
              {
                v37 = 1;
              }
              v33 = (__int128 *)((char *)v33 - 248);
            }
            while ((v37 & 0x80000000) == 0);
          }
LABEL_47:
          v8 = v32;
          if (v32 < (unint64_t *)v34)
          {
            v42 = v34;
            do
            {
              std::swap[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((__int128 *)v8, v42);
              v43 = v8;
              do
              {
                v44 = v8[31];
                v8 += 31;
                v45 = bswap64(v44);
                v46 = bswap64(v242);
                if (v45 == v46 && (v45 = bswap64(v43[32]), v46 = bswap64(*((unint64_t *)&v242 + 1)), v45 == v46))
                {
                  v47 = 0;
                }
                else if (v45 < v46)
                {
                  v47 = -1;
                }
                else
                {
                  v47 = 1;
                }
                v43 = v8;
              }
              while (v47 < 0);
              v48 = v42;
              do
              {
                v49 = *((_QWORD *)v42 - 31);
                v42 = (__int128 *)((char *)v42 - 248);
                v50 = bswap64(v49);
                v51 = bswap64(v242);
                if (v50 == v51
                  && (v50 = bswap64(*((_QWORD *)v48 - 30)), v51 = bswap64(*((unint64_t *)&v242 + 1)), v50 == v51))
                {
                  v52 = 0;
                }
                else if (v50 < v51)
                {
                  v52 = -1;
                }
                else
                {
                  v52 = 1;
                }
                v48 = v42;
              }
              while ((v52 & 0x80000000) == 0);
            }
            while (v8 < (unint64_t *)v42);
          }
          v53 = v8 - 31;
          if (v8 - 31 != a1)
          {
            v54 = *(_OWORD *)v53;
            a1[2] = *(v8 - 29);
            *(_OWORD *)a1 = v54;
            if (*((char *)a1 + 47) < 0)
              operator delete(*v27);
            v55 = *((_OWORD *)v8 - 14);
            a1[5] = *(v8 - 26);
            *(_OWORD *)v27 = v55;
            *((_BYTE *)v8 - 201) = 0;
            *((_BYTE *)v8 - 224) = 0;
            v56 = *(_OWORD *)(v8 - 25);
            *(_OWORD *)((char *)a1 + 60) = *(_OWORD *)((char *)v8 - 188);
            *((_OWORD *)a1 + 3) = v56;
            CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(a1 + 10), (const CLMicroLocationProto::RecordingEvent *)(v8 - 21));
            v57 = *(_OWORD *)(v8 - 3);
            *((_BYTE *)a1 + 240) = *((_BYTE *)v8 - 8);
            *((_OWORD *)a1 + 14) = v57;
          }
          v58 = v242;
          *(v8 - 29) = v243;
          *(_OWORD *)v53 = v58;
          v59 = (void **)(v8 - 28);
          if (*((char *)v8 - 201) < 0)
            operator delete(*v59);
          v60 = __p;
          *(v8 - 26) = v245;
          *(_OWORD *)v59 = v60;
          HIBYTE(v245) = 0;
          LOBYTE(__p) = 0;
          v61 = v246[0];
          *(_OWORD *)((char *)v8 - 188) = *(_OWORD *)((char *)v246 + 12);
          *(_OWORD *)(v8 - 25) = v61;
          CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v8 - 21), (const CLMicroLocationProto::RecordingEvent *)v247);
          v62 = v248;
          *((_BYTE *)v8 - 8) = v249;
          *(_OWORD *)(v8 - 3) = v62;
          CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247);
          if (SHIBYTE(v245) < 0)
            operator delete((void *)__p);
          v63 = v32 >= (unint64_t *)v34;
          v6 = (__int128 *)a2;
          if (!v63)
            goto LABEL_78;
          v64 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULRecordingEventStore fetchRecordingEventTriggersForLearningMeasurements:atLoiGroupId:]::$_0 &,CLMicroLocationRecordingEventsTable::Entry *>(a1, v8 - 31);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULRecordingEventStore fetchRecordingEventTriggersForLearningMeasurements:atLoiGroupId:]::$_0 &,CLMicroLocationRecordingEventsTable::Entry *>(v8, a2))
          {
            if (v64)
              continue;
LABEL_78:
            std::__introsort<std::_ClassicAlgPolicy,-[ULRecordingEventStore fetchRecordingEventTriggersForLearningMeasurements:atLoiGroupId:]::$_0 &,CLMicroLocationRecordingEventsTable::Entry *,false>(a1, v8 - 31, a3, a4 & 1);
LABEL_79:
            a4 = 0;
            continue;
          }
          a2 = v8 - 31;
          if (v64)
            return;
          goto LABEL_2;
        }
        if ((a4 & 1) == 0)
        {
          if (a1 == (unint64_t *)v6)
            return;
          v212 = a1 + 31;
          if (a1 + 31 == a2)
            return;
          for (i = a1 - 31; ; i += 31)
          {
            v214 = v212;
            v215 = bswap64(a1[31]);
            v216 = bswap64(*a1);
            if (v215 != v216)
              break;
            v215 = bswap64(v214[1]);
            v216 = bswap64(a1[1]);
            v217 = a2;
            if (v215 != v216)
              goto LABEL_280;
LABEL_298:
            v212 = v214 + 31;
            a1 = v214;
            if (v214 + 31 == v217)
              return;
          }
          v217 = a2;
LABEL_280:
          if (v215 < v216)
            v218 = -1;
          else
            v218 = 1;
          if (v218 < 0)
          {
            v219 = *(_OWORD *)v214;
            v243 = v214[2];
            v242 = v219;
            __p = *((_OWORD *)a1 + 17);
            v245 = a1[36];
            a1[34] = 0;
            a1[35] = 0;
            a1[36] = 0;
            v246[0] = *(_OWORD *)(a1 + 37);
            *(_OWORD *)((char *)v246 + 12) = *(_OWORD *)((char *)a1 + 308);
            CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247, (const CLMicroLocationProto::RecordingEvent *)(a1 + 41));
            v249 = *((_BYTE *)a1 + 488);
            v248 = *(_OWORD *)(a1 + 59);
            v220 = i;
            do
            {
              *((_OWORD *)v220 + 31) = *(_OWORD *)(v220 + 31);
              v220[64] = v220[33];
              v221 = (void **)(v220 + 65);
              if (*((char *)v220 + 543) < 0)
                operator delete(*v221);
              *(_OWORD *)v221 = *((_OWORD *)v220 + 17);
              v220[67] = v220[36];
              *((_BYTE *)v220 + 295) = 0;
              *((_BYTE *)v220 + 272) = 0;
              *((_OWORD *)v220 + 34) = *(_OWORD *)(v220 + 37);
              *(_OWORD *)((char *)v220 + 556) = *(_OWORD *)((char *)v220 + 308);
              CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v220 + 72), (const CLMicroLocationProto::RecordingEvent *)(v220 + 41));
              *((_BYTE *)v220 + 736) = *((_BYTE *)v220 + 488);
              *((_OWORD *)v220 + 45) = *(_OWORD *)(v220 + 59);
              v222 = bswap64(v242);
              v223 = bswap64(*v220);
              if (v222 == v223
                && (v222 = bswap64(*((unint64_t *)&v242 + 1)), v223 = bswap64(v220[1]), v222 == v223))
              {
                v224 = 0;
              }
              else if (v222 < v223)
              {
                v224 = -1;
              }
              else
              {
                v224 = 1;
              }
              v220 -= 31;
            }
            while (v224 < 0);
            v225 = v242;
            v220[64] = v243;
            *((_OWORD *)v220 + 31) = v225;
            v226 = (void **)(v220 + 65);
            if (*((char *)v220 + 543) < 0)
              operator delete(*v226);
            v227 = __p;
            v220[67] = v245;
            *(_OWORD *)v226 = v227;
            HIBYTE(v245) = 0;
            LOBYTE(__p) = 0;
            v228 = v246[0];
            *(_OWORD *)((char *)v220 + 556) = *(_OWORD *)((char *)v246 + 12);
            *((_OWORD *)v220 + 34) = v228;
            CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v220 + 72), (const CLMicroLocationProto::RecordingEvent *)v247);
            v229 = v248;
            *((_BYTE *)v220 + 736) = v249;
            *((_OWORD *)v220 + 45) = v229;
            CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v247);
            v217 = a2;
            if (SHIBYTE(v245) < 0)
              operator delete((void *)__p);
          }
          goto LABEL_298;
        }
        if (a1 != (unint64_t *)v6)
        {
          v103 = a1 + 31;
          if (a1 + 31 != a2)
          {
            v104 = 0;
            v105 = (CLMicroLocationProto::RecordingEvent *)v247;
            v106 = a1;
            do
            {
              v107 = v103;
              v108 = bswap64(v106[31]);
              v109 = bswap64(*v106);
              if (v108 != v109 || (v108 = bswap64(v107[1]), v109 = bswap64(v106[1]), v108 != v109))
              {
                v110 = v108 < v109 ? -1 : 1;
                if (v110 < 0)
                {
                  v111 = *(_OWORD *)v107;
                  v243 = v107[2];
                  v242 = v111;
                  __p = *((_OWORD *)v106 + 17);
                  v245 = v106[36];
                  v106[34] = 0;
                  v106[35] = 0;
                  v106[36] = 0;
                  v246[0] = *(_OWORD *)(v106 + 37);
                  *(_OWORD *)((char *)v246 + 12) = *(_OWORD *)((char *)v106 + 308);
                  v112 = v105;
                  CLMicroLocationProto::RecordingEvent::RecordingEvent(v105, (const CLMicroLocationProto::RecordingEvent *)(v106 + 41));
                  v249 = *((_BYTE *)v106 + 488);
                  v248 = *(_OWORD *)(v106 + 59);
                  v113 = v104;
                  while (1)
                  {
                    v114 = (char *)a1 + v113;
                    *(_OWORD *)(v114 + 248) = *(_OWORD *)((char *)a1 + v113);
                    *((_QWORD *)v114 + 33) = *(unint64_t *)((char *)a1 + v113 + 16);
                    v115 = (void **)((char *)a1 + v113 + 272);
                    if (*((char *)a1 + v113 + 295) < 0)
                      operator delete(*v115);
                    *(_OWORD *)v115 = *(_OWORD *)(v114 + 24);
                    *(unint64_t *)((char *)a1 + v113 + 288) = *((_QWORD *)v114 + 5);
                    v114[47] = 0;
                    v114[24] = 0;
                    *(_OWORD *)(v114 + 296) = *((_OWORD *)v114 + 3);
                    *(_OWORD *)(v114 + 308) = *(_OWORD *)(v114 + 60);
                    CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v114 + 328), (const CLMicroLocationProto::RecordingEvent *)(v114 + 80));
                    v116 = (char *)a1 + v113;
                    *(_OWORD *)((char *)a1 + v113 + 472) = *(_OWORD *)((char *)a1 + v113 + 224);
                    *((_BYTE *)a1 + v113 + 488) = *((_BYTE *)a1 + v113 + 240);
                    if (!v113)
                      break;
                    v117 = bswap64(v242);
                    v118 = bswap64(*((_QWORD *)v116 - 31));
                    if (v117 == v118
                      && (v117 = bswap64(*((unint64_t *)&v242 + 1)),
                          v118 = bswap64(*((_QWORD *)v116 - 30)),
                          v117 == v118))
                    {
                      v119 = 0;
                    }
                    else if (v117 < v118)
                    {
                      v119 = -1;
                    }
                    else
                    {
                      v119 = 1;
                    }
                    v113 -= 248;
                    if ((v119 & 0x80000000) == 0)
                    {
                      v120 = (uint64_t)a1 + v113 + 248;
                      goto LABEL_169;
                    }
                  }
                  v120 = (uint64_t)a1;
LABEL_169:
                  v121 = v242;
                  *(_QWORD *)(v120 + 16) = v243;
                  *(_OWORD *)v120 = v121;
                  v122 = (void **)(v116 + 24);
                  if (*(char *)(v120 + 47) < 0)
                    operator delete(*v122);
                  v123 = __p;
                  *((_QWORD *)v116 + 5) = v245;
                  *(_OWORD *)v122 = v123;
                  HIBYTE(v245) = 0;
                  LOBYTE(__p) = 0;
                  v124 = v246[0];
                  *(_OWORD *)(v116 + 60) = *(_OWORD *)((char *)v246 + 12);
                  *((_OWORD *)v116 + 3) = v124;
                  v105 = v112;
                  CLMicroLocationProto::RecordingEvent::CopyFrom((CLMicroLocationProto::RecordingEvent *)(v116 + 80), v112);
                  v125 = v248;
                  v116[240] = v249;
                  *((_OWORD *)v116 + 14) = v125;
                  CLMicroLocationProto::RecordingEvent::~RecordingEvent(v112);
                  if (SHIBYTE(v245) < 0)
                    operator delete((void *)__p);
                }
              }
              v103 = v107 + 31;
              v104 += 248;
              v106 = v107;
            }
            while (v107 + 31 != a2);
          }
        }
        return;
    }
  }
}

@end
