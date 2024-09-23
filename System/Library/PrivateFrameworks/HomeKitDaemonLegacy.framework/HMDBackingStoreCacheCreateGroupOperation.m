@implementation HMDBackingStoreCacheCreateGroupOperation

- (HMDBackingStoreCacheCreateGroupOperation)initWithZone:(id)a3 owner:(id)a4 rootRecord:(id)a5 subscriptionName:(id)a6 subscription:(id)a7 creationBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDBackingStoreCacheCreateGroupOperation *v20;
  HMDBackingStoreCacheGroup *v21;
  HMDBackingStoreCacheGroup *record;
  void *v23;
  id creationBlock;
  HMDBackingStoreCacheCreateGroupOperation *v25;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HMDBackingStoreCacheCreateGroupOperation;
  v20 = -[HMDBackingStoreOperation init](&v27, sel_init);
  if (v20)
  {
    v21 = -[HMDBackingStoreCacheGroup initWithGroupID:zone:rootRecord:serverChangeToken:subscriptionName:owner:subscription:]([HMDBackingStoreCacheGroup alloc], "initWithGroupID:zone:rootRecord:serverChangeToken:subscriptionName:owner:subscription:", 0, v14, v16, 0, v17, v15, v18);
    record = v20->_record;
    v20->_record = v21;

    v23 = _Block_copy(v19);
    creationBlock = v20->_creationBlock;
    v20->_creationBlock = v23;

    v25 = v20;
  }

  return v20;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  uint64_t v24;
  void *v25;
  id v26;

  -[HMDBackingStoreCacheCreateGroupOperation record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBackingStoreOperation store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  v7 = objc_msgSend(v4, "zoneID");
  -[HMDBackingStoreCacheCreateGroupOperation record](self, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootRecordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheCreateGroupOperation record](self, "record");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "owner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheCreateGroupOperation record](self, "record");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subscriptionName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v24 = objc_msgSend(v6, "_insertGroupWithZoneID:root:owner:subscription:error:", v7, v9, v11, v13, &v26);
  v14 = v26;

  if (v14)
  {
    v15 = v14;
    v16 = v25;
  }
  else
  {
    -[HMDBackingStoreCacheCreateGroupOperation record](self, "record");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setGroupID:", v24);

    v16 = v25;
    objc_msgSend(v25, "actualGroups");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreCacheCreateGroupOperation record](self, "record");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

    -[HMDBackingStoreCacheCreateGroupOperation creationBlock](self, "creationBlock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[HMDBackingStoreCacheCreateGroupOperation creationBlock](self, "creationBlock");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreCacheCreateGroupOperation record](self, "record");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v22, 0);

    }
  }

  return v14;
}

- (HMDBackingStoreCacheGroup)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (id)creationBlock
{
  return self->_creationBlock;
}

- (void)setCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
