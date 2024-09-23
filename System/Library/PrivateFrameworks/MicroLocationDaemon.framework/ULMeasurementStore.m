@implementation ULMeasurementStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMeasurementTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511ED900, "unsignedIntValue");
  v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return CFSTR("scanCFTimestamp");
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationMeasurementTable,ULMeasurementMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationMeasurementTable::Entry,)_fetchMeasurementEntriesByAndPredicates:(ULMeasurementStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationMeasurementTable::Entry, std::allocator<CLMicroLocationMeasurementTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationMeasurementTable,ULMeasurementMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationMeasurementTable::Entry,)fetchAllRecordsWithLimit:(ULMeasurementStore *)self
{
  vector<CLMicroLocationMeasurementTable::Entry, std::allocator<CLMicroLocationMeasurementTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationMeasurementTable,ULMeasurementMO>(self, a4, retstr);
  return result;
}

- (BOOL)deleteRecordsOlderThan:(double)a3 orNewerThan:(double)a4
{
  NSObject *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  objc_class *v26;
  void *v27;
  BOOL v28;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_47);
  v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v31 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "Deleting old records for entity: %s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)-[ULStore db](self, "db")[88], "getRecordingUUIDsOlderThan:orNewerThan:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v14, v10, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("scanCFTimestamp"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v19);

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "defaultsDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMeasurementTableMaxOldEntriesToDelete");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v24 = objc_msgSend(v23, "unsignedIntValue");
  else
    v24 = objc_msgSend(&unk_2511ED8D0, "unsignedIntValue");
  v25 = v24;

  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v27, v16, 0, v25);

  return v15 && v28;
}

- (BOOL)deleteMeasurementsFromRecordingUUIDs:(const void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint8_t buf[16];

  if (*(_QWORD *)a3 == *((_QWORD *)a3 + 1))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_47);
    v11 = logObject_MicroLocation_Default;
    v10 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_DEFAULT, "#Warning No UUIDs are passed in to delete measurements entries", buf, 2u);
      return 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v9, v5, 0, 0);

  }
  return v10;
}

- (vector<CLMicroLocationMeasurementTable::Entry,)fetchMeasurementsForRecordingUUIDs:(ULMeasurementStore *)self
{
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  vector<CLMicroLocationMeasurementTable::Entry, std::allocator<CLMicroLocationMeasurementTable::Entry>> *result;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  ULDBUtils::NSStringArrayFromBoostUUIDs((uint64_t *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("scanCFTimestamp"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULMeasurementStore _fetchMeasurementEntriesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchMeasurementEntriesByAndPredicates:sortDescriptors:andLimit:", v8, v11, v6);

  return result;
}

- (vector<CLMicroLocationMeasurementTable::Entry,)fetchLearningMeasurementsAtLoiGroupId:(ULMeasurementStore *)self fromTime:(SEL)a3 toTime:(const uuid *)a4
{
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  vector<CLMicroLocationMeasurementTable::Entry, std::allocator<CLMicroLocationMeasurementTable::Entry>> *result;
  void *v18;
  uuid v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = ULSettings::get<ULSettings::DatabaseSelectionLimit>();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)-[ULStore db](self, "db")[88];
  v19 = *a4;
  v20 = 1;
  objc_msgSend(v12, "getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:fromTime:toTime:withLimit:", &v19, *(_QWORD *)&a5, 1, *(_QWORD *)&a6, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v14);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("scanCFTimestamp"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULMeasurementStore _fetchMeasurementEntriesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchMeasurementEntriesByAndPredicates:sortDescriptors:andLimit:", v11, v16, v10);

  return result;
}

- (vector<CLMicroLocationMeasurementTable::Entry,)fetchAllLocalizingMeasurementsWithLimit:(ULMeasurementStore *)self
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  vector<CLMicroLocationMeasurementTable::Entry, std::allocator<CLMicroLocationMeasurementTable::Entry>> *result;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)-[ULStore db](self, "db")[88], "getRecordingUUIDsForLocalizationActionsFromTime:toTime:", 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("scanCFTimestamp"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULMeasurementStore _fetchMeasurementEntriesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchMeasurementEntriesByAndPredicates:sortDescriptors:andLimit:", v6, v10, a4);

  return result;
}

- (unsigned)numRecordingScansFromTime:(double)a3 toTime:(double)a4
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
  void *v17;
  _BYTE v18[17];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)-[ULStore db](self, "db")[88];
  v18[0] = 0;
  v18[16] = 0;
  objc_msgSend(v8, "getRecordingUUIDsForRecordingEventActionsAtLoiGroupId:fromTime:toTime:withLimit:", v18, *(_QWORD *)&a3, 1, *(_QWORD *)&a4, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("scanMCTimestamp"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v13, CFSTR("scanMCTimestamp"), 1, v7, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = objc_msgSend(v15, "count");
  return self;
}

- (unsigned)numLocalizationScansFromTime:(double)a3 toTime:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)-[ULStore db](self, "db")[88], "getRecordingUUIDsForLocalizationActionsFromTime:toTime:", *(_QWORD *)&a3, 1, *(_QWORD *)&a4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("scanMCTimestamp"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:](self, "fetchPropertyForEntityName:propertyToFetch:distinctResults:byAndPredicates:sortDescriptors:andLimit:", v12, CFSTR("scanMCTimestamp"), 1, v7, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = objc_msgSend(v14, "count");
  return self;
}

- (BOOL)batchTransferRecordsUsingBatchSize:(unint64_t)a3 andLimit:(unint64_t)a4 usingDistinctRecords:(BOOL)a5 intoTargetStore:(id)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  char v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a5;
  v10 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)-[ULStore db](self, "db")[88], "getDistinctRecordingUUIDsWithLimit:", ULSettings::get<ULSettings::DatabaseSelectionLimit>());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("recordingUUID"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("scanCFTimestamp"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __103__ULMeasurementStore_batchTransferRecordsUsingBatchSize_andLimit_usingDistinctRecords_intoTargetStore___block_invoke;
  v21[3] = &unk_2511D5068;
  v25 = &v28;
  v21[4] = self;
  v16 = v11;
  v22 = v16;
  v17 = v14;
  v23 = v17;
  v26 = a3;
  v27 = a4;
  v18 = v10;
  v24 = v18;
  objc_msgSend(v15, "performBlockAndWait:", v21);

  v19 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v28, 8);

  return v19;
}

void __103__ULMeasurementStore_batchTransferRecordsUsingBatchSize_andLimit_usingDistinctRecords_intoTargetStore___block_invoke(_QWORD *a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[5];
  v7[0] = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v2, "batchTransferManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:batchSize:limit:intoTargetStore:", v4, v5, v6, a1[9], a1[10], a1[7]);

}

@end
