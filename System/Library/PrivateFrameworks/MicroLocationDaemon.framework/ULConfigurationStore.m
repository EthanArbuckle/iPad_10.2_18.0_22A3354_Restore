@implementation ULConfigurationStore

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

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULConfigurationTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511ED6A8, "unsignedIntValue");
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
  return ULDBUtils::insertEntries<CLMicroLocationConfigurationTable,ULConfigurationMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationConfigurationTable::Entry,)_fetchConfigurationsByAndPredicates:(ULConfigurationStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationConfigurationTable::Entry, std::allocator<CLMicroLocationConfigurationTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationConfigurationTable,ULConfigurationMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationConfigurationTable::Entry,)fetchAllRecordsWithLimit:(ULConfigurationStore *)self
{
  vector<CLMicroLocationConfigurationTable::Entry, std::allocator<CLMicroLocationConfigurationTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationConfigurationTable,ULConfigurationMO>(self, a4, retstr);
  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentConfiguration:(optional<CLMicroLocationConfigurationTable:(ULConfigurationStore *)self :(int)a3 Entry> *__return_ptr)retstr atLoiType:(Configuration *)a4 loiGroupId:beforeTime:
{
  uint64_t *v4;
  uint64_t v5;
  double v6;
  char v7;
  char v8;
  double v9;
  uint64_t v10;
  uint64_t *v11;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  optional<CLMicroLocationConfigurationTable::Entry> *result;
  uint64_t v33[3];
  void **v34;
  _QWORD v35[2];

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v35[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", LODWORD(a4->var0));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("configurationType"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v17);

  if (*((_BYTE *)v11 + 24))
  {
    v18 = (void *)MEMORY[0x24BDD1758];
    if (*((char *)v11 + 23) >= 0)
      v19 = v11;
    else
      v19 = (uint64_t *)*v11;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("loiType"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v21);

  }
  if (v8)
  {
    v22 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateWithFormat:", CFSTR("%K<=%@"), CFSTR("generationTimestamp"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v24);

  }
  if (*(_BYTE *)(v10 + 16))
  {
    v25 = (id)-[ULStore db](self, "db")[56];
    v26 = v25;
    if (!*(_BYTE *)(v10 + 16))
      std::__throw_bad_optional_access[abi:ne180100]();
    objc_msgSend(v25, "getLoiIdsInLoiGroupId:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v28);

  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULConfigurationStore _fetchConfigurationsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchConfigurationsByAndPredicates:sortDescriptors:andLimit:", v14, v30, 1);

  if (v33[0] == v33[1])
  {
    retstr->var0.var0 = 0;
    retstr[2].var0.var2.var0.var0.var0.var0.var0[16] = 0;
  }
  else
  {
    std::__optional_destruct_base<CLMicroLocationConfigurationTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationConfigurationTable::Entry>((uint64_t)retstr, v33[0]);
  }
  v34 = (void **)v33;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v34);

  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentConfiguration:(int)a3 atLoiGroupId:(Configuration *)a4 beforeTime:
{
  __int128 *v4;
  uint64_t v5;
  optional<CLMicroLocationConfigurationTable::Entry> *result;
  void *__p;
  char v8;
  char v9;
  __int128 v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  LOBYTE(__p) = 0;
  v9 = 0;
  v10 = *v4;
  v11 = 1;
  result = -[ULConfigurationStore fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:](self, "fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:", a4, &__p, &v10, v5, 1);
  if (v9)
  {
    if (v8 < 0)
      operator delete(__p);
  }
  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentAnchorAppearancesAtLoi:(int)a3
{
  optional<CLMicroLocationConfigurationTable::Entry> *result;
  void *__p;
  char v6;
  char v7;
  int v8;
  __int128 v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 1;
  LOBYTE(__p) = 0;
  v7 = 0;
  v9 = *(_OWORD *)&a4->var0;
  v10 = 1;
  result = -[ULConfigurationStore fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:](self, "fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:", &v8, &__p, &v9, 0, 0);
  if (v7)
  {
    if (v6 < 0)
      operator delete(__p);
  }
  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentClusterAnchorValueStatisticsForModelUUID:(int)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  optional<CLMicroLocationConfigurationTable::Entry> *result;
  uint64_t v13[3];
  void **v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a4);
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("anchorStatsModelUUID"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULConfigurationStore _fetchConfigurationsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchConfigurationsByAndPredicates:sortDescriptors:andLimit:", v8, v11, 1);

  if (v13[0] == v13[1])
  {
    retstr->var0.var0 = 0;
    retstr[2].var0.var2.var0.var0.var0.var0.var0[16] = 0;
  }
  else
  {
    std::__optional_destruct_base<CLMicroLocationConfigurationTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationConfigurationTable::Entry>((uint64_t)retstr, v13[0]);
  }
  v14 = (void **)v13;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v14);

  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentClusterAnchorValueStatisticsForLOIType:(int)a3
{
  optional<CLMicroLocationConfigurationTable::Entry> *result;
  std::string v6;
  char v7;
  std::string __p;
  char v9;
  int v10;
  _BYTE v11[17];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 2;
  if (SHIBYTE(a4->var2) < 0)
  {
    std::string::__init_copy_ctor_external(&v6, (const std::string::value_type *)a4->var0, *(_QWORD *)&a4->var1);
  }
  else
  {
    *(_OWORD *)&v6.__r_.__value_.__l.__data_ = *(_OWORD *)&a4->var0;
    v6.__r_.__value_.__r.__words[2] = (std::string::size_type)a4->var2;
  }
  v7 = 1;
  __p = v6;
  v9 = 1;
  v11[0] = 0;
  v11[16] = 0;
  result = -[ULConfigurationStore fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:](self, "fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:", &v10, &__p, v11, 0, 0, 0, 0, 0);
  if (v9 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v7)
  {
    if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v6.__r_.__value_.__l.__data_);
  }
  return result;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)fetchMostRecentWifiChannelHistogramAtLoi:(int)a3
{
  optional<CLMicroLocationConfigurationTable::Entry> *result;
  void *__p;
  char v6;
  char v7;
  int v8;
  __int128 v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  LOBYTE(__p) = 0;
  v7 = 0;
  v9 = *(_OWORD *)&a4->var0;
  v10 = 1;
  result = -[ULConfigurationStore fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:](self, "fetchMostRecentConfiguration:atLoiType:loiGroupId:beforeTime:", &v8, &__p, &v9, 0, 0);
  if (v7)
  {
    if (v6 < 0)
      operator delete(__p);
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
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __84__ULConfigurationStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore___block_invoke;
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

void __84__ULConfigurationStore_batchTransferRecordsUsingBatchSize_andLimit_intoTargetStore___block_invoke(_QWORD *a1)
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

- (vector<CLMicroLocationConfigurationTable::Entry,)fetchLatestConfigurationPerTypeAtLoi:(ULConfigurationStore *)self withLimit:(SEL)a3
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  vector<CLMicroLocationConfigurationTable::Entry, std::allocator<CLMicroLocationConfigurationTable::Entry>> *result;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  __n128 (*v33)(__n128 *, __n128 *);
  void (*v34)(uint64_t);
  void *v35;
  _QWORD v36[3];
  void **v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDBB660]);
  objc_msgSend(v9, "setName:", CFSTR("maxGenTimestamp"));
  v10 = (void *)MEMORY[0x24BDD1548];
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("generationTimestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expressionForFunction:arguments:", CFSTR("max:"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExpression:", v13);

  objc_msgSend(v9, "setExpressionResultType:", 500);
  objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v14);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x4812000000;
  v33 = __Block_byref_object_copy__7;
  v34 = __Block_byref_object_dispose__7;
  v35 = &unk_241BEBD1D;
  memset(v36, 0, sizeof(v36));
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __71__ULConfigurationStore_fetchLatestConfigurationPerTypeAtLoi_withLimit___block_invoke;
  v24[3] = &unk_2511D46E8;
  v24[4] = self;
  v17 = v9;
  v25 = v17;
  v18 = v23;
  v26 = v18;
  v19 = v15;
  v29 = a5;
  v27 = v19;
  v28 = &v30;
  objc_msgSend(v16, "performBlockAndWait:", v24);

  v20 = v31;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__init_with_size[abi:ne180100]<CLMicroLocationConfigurationTable::Entry*,CLMicroLocationConfigurationTable::Entry*>(retstr, v20[6], v20[7], 0x6DB6DB6DB6DB6DB7 * ((v20[7] - v20[6]) >> 4));

  _Block_object_dispose(&v30, 8);
  v37 = (void **)v36;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v37);

  return result;
}

void __71__ULConfigurationStore_fetchLatestConfigurationPerTypeAtLoi_withLimit___block_invoke(uint64_t a1)
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
  v18[0] = CFSTR("configurationType");
  v18[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("configurationType");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchManagedObjectsForEntityName:propertiesToFetch:propertiesToGroupBy:byAndPredicates:sortDescriptors:andLimit:", v4, v6, v7, v8, v9, *(unsigned int *)(a1 + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  ULDBUtils::convertManagedObjectsToEntries<CLMicroLocationConfigurationTable,ULConfigurationMO>(v10, (uint64_t *)&v13);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  std::vector<CLMicroLocationConfigurationTable::Entry>::__vdeallocate((void **)(v11 + 48));
  *(_OWORD *)(v11 + 48) = v13;
  *(_QWORD *)(v11 + 64) = v14;
  v14 = 0;
  v13 = 0uLL;
  v15 = (void **)&v13;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100](&v15);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reset");

}

- (vector<CLMicroLocationConfigurationTable::Entry,)fetchAllConfigurationsforLoiGroup:(ULConfigurationStore *)self withLimit:(SEL)a3
{
  return -[ULConfigurationStore fetchAllConfigurationsOfType:loiGroupId:withLimit:](self, "fetchAllConfigurationsOfType:loiGroupId:withLimit:", 0, a4, *(_QWORD *)&a5);
}

- (vector<CLMicroLocationConfigurationTable::Entry,)fetchAllConfigurationsOfType:(ULConfigurationStore *)self loiGroupId:(SEL)a3 withLimit:(optional<const CLMicroLocationProto:(const uuid *)a5 :(unsigned int)a6 ConfigurationType>)a4
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  vector<CLMicroLocationConfigurationTable::Entry, std::allocator<CLMicroLocationConfigurationTable::Entry>> *result;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_QWORD *)&a4 & 0xFF00000000) != 0)
  {
    v11 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K=%@"), CFSTR("configurationType"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

  }
  objc_msgSend((id)-[ULStore db](self, "db")[56], "getLoiIdsInLoiGroupId:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("loiId"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v15);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("generationTimestamp"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULConfigurationStore _fetchConfigurationsByAndPredicates:sortDescriptors:andLimit:](self, "_fetchConfigurationsByAndPredicates:sortDescriptors:andLimit:", v10, v17, a6);

  return result;
}

- (void)fetchMostRecentClusterAnchorValueStatisticsForLOIType:(_BYTE *)a1 .cold.1(_BYTE *a1, uint64_t a2)
{
  if (*a1)
  {
    if (*(char *)(a2 + 23) < 0)
      operator delete(*(void **)a2);
  }
}

@end
