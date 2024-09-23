@implementation HMDBackingStoreCacheFetchModelObjects

- (HMDBackingStoreCacheFetchModelObjects)initWithUUIDs:(id)a3 fetchResult:(id)a4
{
  id v7;
  id v8;
  HMDBackingStoreCacheFetchModelObjects *v9;
  void *v10;
  id fetchResult;
  HMDBackingStoreCacheFetchModelObjects *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  v9 = -[HMDBackingStoreOperation init](&v14, sel_init);
  if (v9)
  {
    v10 = _Block_copy(v8);
    fetchResult = v9->_fetchResult;
    v9->_fetchResult = v10;

    objc_storeStrong((id *)&v9->_uuids, a3);
    v12 = v9;
  }

  return v9;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithGroup:(id)a3 uuids:(id)a4 fetchResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDBackingStoreCacheFetchModelObjects *v12;
  HMDBackingStoreCacheFetchModelObjects *v13;
  void *v14;
  id fetchResult;
  HMDBackingStoreCacheFetchModelObjects *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  v12 = -[HMDBackingStoreOperation init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    v14 = _Block_copy(v11);
    fetchResult = v13->_fetchResult;
    v13->_fetchResult = v14;

    objc_storeStrong((id *)&v13->_uuids, a4);
    v16 = v13;
  }

  return v13;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithNames:(id)a3 fetchResult:(id)a4
{
  id v7;
  id v8;
  HMDBackingStoreCacheFetchModelObjects *v9;
  void *v10;
  id fetchResult;
  HMDBackingStoreCacheFetchModelObjects *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  v9 = -[HMDBackingStoreOperation init](&v14, sel_init);
  if (v9)
  {
    v10 = _Block_copy(v8);
    fetchResult = v9->_fetchResult;
    v9->_fetchResult = v10;

    objc_storeStrong((id *)&v9->_names, a3);
    v12 = v9;
  }

  return v9;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithGroup:(id)a3 names:(id)a4 fetchResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDBackingStoreCacheFetchModelObjects *v12;
  HMDBackingStoreCacheFetchModelObjects *v13;
  void *v14;
  id fetchResult;
  HMDBackingStoreCacheFetchModelObjects *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  v12 = -[HMDBackingStoreOperation init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    v14 = _Block_copy(v11);
    fetchResult = v13->_fetchResult;
    v13->_fetchResult = v14;

    objc_storeStrong((id *)&v13->_names, a4);
    v16 = v13;
  }

  return v13;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithParent:(id)a3 type:(id)a4 fetchResult:(id)a5
{
  id v8;
  id v9;
  HMDBackingStoreCacheFetchModelObjects *v10;
  void *v11;
  id fetchResult;
  HMDBackingStoreCacheFetchModelObjects *v13;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  v10 = -[HMDBackingStoreOperation init](&v15, sel_init);
  if (v10)
  {
    v11 = _Block_copy(v9);
    fetchResult = v10->_fetchResult;
    v10->_fetchResult = v11;

    objc_storeStrong((id *)&v10->_parent, a3);
    v13 = v10;
  }

  return v10;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithGroup:(id)a3 parent:(id)a4 type:(id)a5 fetchResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMDBackingStoreCacheFetchModelObjects *v13;
  HMDBackingStoreCacheFetchModelObjects *v14;
  void *v15;
  id fetchResult;
  HMDBackingStoreCacheFetchModelObjects *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  v13 = -[HMDBackingStoreOperation init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_group, a3);
    v15 = _Block_copy(v12);
    fetchResult = v14->_fetchResult;
    v14->_fetchResult = v15;

    objc_storeStrong((id *)&v14->_parent, a4);
    v17 = v14;
  }

  return v14;
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
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  id v19;
  _QWORD aBlock[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__23149;
  v28 = __Block_byref_object_dispose__23150;
  v29 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HMDBackingStoreCacheFetchModelObjects_mainReturningError__block_invoke;
  aBlock[3] = &unk_24E778618;
  v23 = &v24;
  aBlock[4] = self;
  v4 = v3;
  v22 = v4;
  v5 = _Block_copy(aBlock);
  -[HMDBackingStoreCacheFetchModelObjects names](self, "names");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDBackingStoreOperation store](self, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "local");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreCacheFetchModelObjects group](self, "group");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "groupID");
    -[HMDBackingStoreCacheFetchModelObjects names](self, "names");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_fetchRecordsWithGroupID:names:callback:", v10, v11, v5);
  }
  else
  {
    -[HMDBackingStoreCacheFetchModelObjects uuids](self, "uuids");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HMDBackingStoreOperation store](self, "store");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "local");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreCacheFetchModelObjects group](self, "group");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "groupID");
      -[HMDBackingStoreCacheFetchModelObjects uuids](self, "uuids");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_fetchRecordsWithGroupID:uuids:callback:", v13, v11, v5);
    }
    else
    {
      -[HMDBackingStoreCacheFetchModelObjects parent](self, "parent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_8;
      -[HMDBackingStoreOperation store](self, "store");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "local");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreCacheFetchModelObjects group](self, "group");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "groupID");
      -[HMDBackingStoreCacheFetchModelObjects parent](self, "parent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreCacheFetchModelObjects type](self, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_fetchRecordsWithGroupID:parent:type:callback:", v15, v11, v16, v5);

    }
  }

LABEL_8:
  if (v25[5])
  {

    v4 = 0;
  }
  -[HMDBackingStoreCacheFetchModelObjects fetchResult](self, "fetchResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HMDBackingStoreCacheFetchModelObjects fetchResult](self, "fetchResult");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, uint64_t))v18)[2](v18, v4, v25[5]);

  }
  v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
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

- (NSArray)uuids
{
  return self->_uuids;
}

- (void)setUuids:(id)a3
{
  objc_storeStrong((id *)&self->_uuids, a3);
}

- (NSArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
  objc_storeStrong((id *)&self->_names, a3);
}

- (NSUUID)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
  objc_storeStrong((id *)&self->_parent, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_uuids, 0);
  objc_storeStrong(&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

BOOL __59__HMDBackingStoreCacheFetchModelObjects_mainReturningError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  _BOOL8 v15;
  HMDBackingStoreCacheFetchModelObjectResult *v16;
  uint64_t v17;
  HMDBackingStoreCacheFetchModelObjectResult *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v26;
  id obj;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v14)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a6);
    v15 = 0;
  }
  else
  {
    v15 = 0;
    if (v11 && a3 && v12 && v13)
    {
      v16 = [HMDBackingStoreCacheFetchModelObjectResult alloc];
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v17 + 40);
      v18 = -[HMDBackingStoreCacheFetchModelObjectResult initWithRecord:data:encoding:error:](v16, "initWithRecord:data:encoding:error:", v11, v12, a3, &obj);
      objc_storeStrong((id *)(v17 + 40), obj);
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v15 = v19 == 0;
      if (v19)
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v26 = v20;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          v29 = v23;
          v30 = 2112;
          v31 = v24;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@unable to decode result (%@)", buf, 0x16u);

          v20 = v26;
        }

        objc_autoreleasePoolPop(v20);
      }
      else if (v18)
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v18);
      }

    }
  }

  return v15;
}

@end
