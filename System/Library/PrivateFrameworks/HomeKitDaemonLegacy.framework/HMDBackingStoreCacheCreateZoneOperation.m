@implementation HMDBackingStoreCacheCreateZoneOperation

- (HMDBackingStoreCacheCreateZoneOperation)initWithZoneName:(id)a3 creationBlock:(id)a4
{
  id v7;
  id v8;
  HMDBackingStoreCacheCreateZoneOperation *v9;
  void *v10;
  id creationBlock;
  HMDBackingStoreCacheCreateZoneOperation *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreCacheCreateZoneOperation;
  v9 = -[HMDBackingStoreOperation init](&v14, sel_init);
  if (v9)
  {
    v10 = _Block_copy(v8);
    creationBlock = v9->_creationBlock;
    v9->_creationBlock = v10;

    objc_storeStrong((id *)&v9->_zoneName, a3);
    v12 = v9;
  }

  return v9;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  HMDBackingStoreCacheZone *v11;
  void *v12;
  HMDBackingStoreCacheZone *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  id v20;

  -[HMDBackingStoreOperation store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheCreateZoneOperation zoneName](self, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v6 = objc_msgSend(v4, "_insertZoneWithName:error:", v5, &v20);
  v7 = v20;

  if (v7)
  {
    -[HMDBackingStoreCacheCreateZoneOperation creationBlock](self, "creationBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDBackingStoreCacheCreateZoneOperation creationBlock](self, "creationBlock");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v7);

    }
    v10 = v7;
  }
  else
  {
    v11 = [HMDBackingStoreCacheZone alloc];
    -[HMDBackingStoreCacheCreateZoneOperation zoneName](self, "zoneName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDBackingStoreCacheZone initWithZoneID:name:](v11, "initWithZoneID:name:", v6, v12);

    -[HMDBackingStoreOperation store](self, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "local");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "zoneCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v13);

    -[HMDBackingStoreCacheCreateZoneOperation creationBlock](self, "creationBlock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[HMDBackingStoreCacheCreateZoneOperation creationBlock](self, "creationBlock");
      v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, HMDBackingStoreCacheZone *, _QWORD))v18)[2](v18, v13, 0);

    }
  }

  return v7;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_zoneName, a3);
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
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
