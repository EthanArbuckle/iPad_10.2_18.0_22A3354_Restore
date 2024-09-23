@implementation HMDBackingStoreCacheFetchRecords

- (HMDBackingStoreCacheFetchRecords)initWithGroup:(id)a3 uuids:(id)a4 fetchResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDBackingStoreCacheFetchRecords *v12;
  HMDBackingStoreCacheFetchRecords *v13;
  void *v14;
  id fetchResult;
  HMDBackingStoreCacheFetchRecords *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchRecords;
  v12 = -[HMDBackingStoreOperation init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    objc_storeStrong((id *)&v13->_uuids, a4);
    v14 = _Block_copy(v11);
    fetchResult = v13->_fetchResult;
    v13->_fetchResult = v14;

    v16 = v13;
  }

  return v13;
}

- (HMDBackingStoreCacheFetchRecords)initWithGroup:(id)a3 parentUuids:(id)a4 fetchResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDBackingStoreCacheFetchRecords *v12;
  HMDBackingStoreCacheFetchRecords *v13;
  void *v14;
  id fetchResult;
  HMDBackingStoreCacheFetchRecords *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchRecords;
  v12 = -[HMDBackingStoreOperation init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    objc_storeStrong((id *)&v13->_parentUuids, a4);
    v14 = _Block_copy(v11);
    fetchResult = v13->_fetchResult;
    v13->_fetchResult = v14;

    v16 = v13;
  }

  return v13;
}

- (HMDBackingStoreCacheFetchRecords)initWithGroup:(id)a3 records:(id)a4 fetchResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDBackingStoreCacheFetchRecords *v12;
  HMDBackingStoreCacheFetchRecords *v13;
  void *v14;
  id fetchResult;
  HMDBackingStoreCacheFetchRecords *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchRecords;
  v12 = -[HMDBackingStoreOperation init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    objc_storeStrong((id *)&v13->_recordNames, a4);
    v14 = _Block_copy(v11);
    fetchResult = v13->_fetchResult;
    v13->_fetchResult = v14;

    v16 = v13;
  }

  return v13;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  uint64_t *v30;
  id v31;
  id location;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__16441;
  v37 = __Block_byref_object_dispose__16442;
  v38 = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HMDBackingStoreCacheFetchRecords_mainReturningError__block_invoke;
  aBlock[3] = &unk_1E89A6168;
  objc_copyWeak(&v31, &location);
  v30 = &v33;
  v5 = v3;
  v28 = v5;
  v6 = v4;
  v29 = v6;
  v7 = _Block_copy(aBlock);
  -[HMDBackingStoreCacheFetchRecords uuids](self, "uuids");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDBackingStoreOperation store](self, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "local");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreCacheFetchRecords group](self, "group");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "groupID");
    -[HMDBackingStoreCacheFetchRecords uuids](self, "uuids");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_fetchRecordsWithGroupID:uuids:callback:", v12, v13, v7);
LABEL_5:

    goto LABEL_6;
  }
  -[HMDBackingStoreCacheFetchRecords recordNames](self, "recordNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HMDBackingStoreOperation store](self, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "local");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreCacheFetchRecords group](self, "group");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "groupID");
    -[HMDBackingStoreCacheFetchRecords recordNames](self, "recordNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_fetchRecordsWithGroupID:names:callback:", v15, v13, v7);
    goto LABEL_5;
  }
  -[HMDBackingStoreCacheFetchRecords parentUuids](self, "parentUuids");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  v22 = MEMORY[0x1E0C9AA60];
  while (1)
  {
    v9 = (void *)v21;

    if (!objc_msgSend(v9, "count"))
      break;
    objc_msgSend(v6, "removeAllObjects");
    -[HMDBackingStoreOperation store](self, "store");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "local");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreCacheFetchRecords group](self, "group");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_fetchRecordsWithGroupID:parentUuids:callback:", objc_msgSend(v25, "groupID"), v9, v7);

    if (v34[5] || !-[HMDBackingStoreCacheFetchRecords recursive](self, "recursive"))
      break;
    v26 = objc_msgSend(v6, "count");
    v20 = v9;
    v21 = v22;
    if (v26)
    {
      v21 = objc_msgSend(v6, "copy");
      v20 = v9;
    }
  }
LABEL_6:

  if (v34[5])
  {

    v5 = 0;
  }
  -[HMDBackingStoreCacheFetchRecords fetchResult](self, "fetchResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HMDBackingStoreCacheFetchRecords fetchResult](self, "fetchResult");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, uint64_t))v17)[2](v17, v5, v34[5]);

  }
  v18 = (id)v34[5];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSArray)recordNames
{
  return self->_recordNames;
}

- (void)setRecordNames:(id)a3
{
  objc_storeStrong((id *)&self->_recordNames, a3);
}

- (NSArray)uuids
{
  return self->_uuids;
}

- (void)setUuids:(id)a3
{
  objc_storeStrong((id *)&self->_uuids, a3);
}

- (NSArray)parentUuids
{
  return self->_parentUuids;
}

- (void)setParentUuids:(id)a3
{
  objc_storeStrong((id *)&self->_parentUuids, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentUuids, 0);
  objc_storeStrong((id *)&self->_uuids, 0);
  objc_storeStrong((id *)&self->_recordNames, 0);
  objc_storeStrong(&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

BOOL __54__HMDBackingStoreCacheFetchRecords_mainReturningError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  HMDBackingStoreCacheFetchRecordResult *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  HMDBackingStoreCacheFetchRecordResult *v25;
  void *v27;
  id v28;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v14)
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = v14;
    v18 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;
  }
  else
  {
    v28 = v11;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v11, 0);
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSString:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(a1 + 32);
    v20 = [HMDBackingStoreCacheFetchRecordResult alloc];
    objc_msgSend(WeakRetained, "group");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithCoder:", v18);
    v23 = a3;
    v24 = (void *)v22;
    v25 = -[HMDBackingStoreCacheFetchRecordResult initWithGroup:record:data:encoding:uuid:](v20, "initWithGroup:record:data:encoding:uuid:", v21, v22, v12, v23, v19);
    objc_msgSend(v27, "addObject:", v25);

    if (v19)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);

    v11 = v28;
  }

  return v14 == 0;
}

@end
