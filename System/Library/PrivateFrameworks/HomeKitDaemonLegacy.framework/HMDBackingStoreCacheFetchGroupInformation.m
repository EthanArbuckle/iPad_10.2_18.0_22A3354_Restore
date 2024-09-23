@implementation HMDBackingStoreCacheFetchGroupInformation

- (HMDBackingStoreCacheFetchGroupInformation)initWithGroup:(id)a3 fetchResult:(id)a4
{
  id v7;
  id v8;
  HMDBackingStoreCacheFetchGroupInformation *v9;
  HMDBackingStoreCacheFetchGroupInformation *v10;
  void *v11;
  id fetchResult;
  HMDBackingStoreCacheFetchGroupInformation *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreCacheFetchGroupInformation;
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16441;
  v16 = __Block_byref_object_dispose__16442;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__HMDBackingStoreCacheFetchGroupInformation_mainReturningError__block_invoke;
  v11[3] = &unk_1E89A6140;
  v11[4] = &v12;
  v11[5] = &v18;
  v3 = _Block_copy(v11);
  -[HMDBackingStoreOperation store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchGroupInformation group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_fetchRecordCountWithGroupID:callback:", objc_msgSend(v6, "groupID"), v3);

  -[HMDBackingStoreCacheFetchGroupInformation fetchResult](self, "fetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDBackingStoreCacheFetchGroupInformation fetchResult](self, "fetchResult");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, v19[3], v13[5]);

  }
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
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

BOOL __63__HMDBackingStoreCacheFetchGroupInformation_mainReturningError__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

  return v6 == 0;
}

@end
