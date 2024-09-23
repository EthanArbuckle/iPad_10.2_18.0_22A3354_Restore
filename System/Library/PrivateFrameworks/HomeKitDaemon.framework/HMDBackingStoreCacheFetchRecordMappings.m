@implementation HMDBackingStoreCacheFetchRecordMappings

- (HMDBackingStoreCacheFetchRecordMappings)initWithGroup:(id)a3 fetchResult:(id)a4
{
  id v7;
  id v8;
  HMDBackingStoreCacheFetchRecordMappings *v9;
  HMDBackingStoreCacheFetchRecordMappings *v10;
  void *v11;
  id fetchResult;
  HMDBackingStoreCacheFetchRecordMappings *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreCacheFetchRecordMappings;
  v9 = -[HMDBackingStoreOperation init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    v11 = _Block_copy(v8);
    fetchResult = v10->_fetchResult;
    v10->_fetchResult = v11;

    v13 = v10;
  }

  return v10;
}

- (id)mainReturningError
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, void *, void *, void *, void *, void *);
  void *v16;
  id v17;
  uint64_t *v18;
  id v19;
  id location;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__23149;
  v25 = __Block_byref_object_dispose__23150;
  v26 = 0;
  objc_initWeak(&location, self);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __61__HMDBackingStoreCacheFetchRecordMappings_mainReturningError__block_invoke;
  v16 = &unk_24E778640;
  objc_copyWeak(&v19, &location);
  v18 = &v21;
  v4 = v3;
  v17 = v4;
  v5 = _Block_copy(&v13);
  -[HMDBackingStoreOperation store](self, "store", v13, v14, v15, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "local");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchRecordMappings group](self, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_fetchRecordMapWithGroupID:callback:", objc_msgSend(v8, "groupID"), v5);

  if (v22[5])
  {

    v4 = 0;
  }
  -[HMDBackingStoreCacheFetchRecordMappings fetchResult](self, "fetchResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDBackingStoreCacheFetchRecordMappings fetchResult](self, "fetchResult");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, uint64_t))v10)[2](v10, v4, v22[5]);

  }
  v11 = (id)v22[5];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v21, 8);

  return v11;
}

- (HMDBackingStoreCacheGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (void)setFetchResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

BOOL __61__HMDBackingStoreCacheFetchRecordMappings_mainReturningError__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  uint64_t v17;
  id v18;
  void *v19;
  HMDBackingStoreCacheFetchRecordMappingResult *v20;
  void *v21;
  void *v22;
  HMDBackingStoreCacheFetchRecordMappingResult *v23;
  void *v25;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v15)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = v15;
    v19 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v11)
  {
    v25 = *(void **)(a1 + 32);
    v20 = [HMDBackingStoreCacheFetchRecordMappingResult alloc];
    objc_msgSend(WeakRetained, "group");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F210], "hmf_cachedInstanceForNSString:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F210], "hmf_cachedInstanceForNSString:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDBackingStoreCacheFetchRecordMappingResult initWithGroup:recordName:uuid:parentUuid:type:](v20, "initWithGroup:recordName:uuid:parentUuid:type:", v19, v11, v21, v22, v14);
    objc_msgSend(v25, "addObject:", v23);

    goto LABEL_5;
  }
LABEL_6:

  return v15 != 0;
}

@end
