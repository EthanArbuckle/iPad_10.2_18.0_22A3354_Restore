@implementation HMDBackingStoreCacheDeleteRecordOperation

- (HMDBackingStoreCacheDeleteRecordOperation)initWithGroup:(id)a3 recordNames:(id)a4 resultBlock:(id)a5
{
  id v9;
  id v10;
  HMDBackingStoreCacheDeleteRecordOperation *v11;
  HMDBackingStoreCacheDeleteRecordOperation *v12;
  HMDBackingStoreCacheDeleteRecordOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreCacheDeleteRecordOperation;
  v11 = -[HMDBackingStoreOperation initWithResultBlock:](&v15, sel_initWithResultBlock_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_group, a3);
    objc_storeStrong((id *)&v12->_recordNames, a4);
    v13 = v12;
  }

  return v12;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDBackingStoreOperation store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_begin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_13;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDBackingStoreCacheDeleteRecordOperation recordNames](self, "recordNames", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        -[HMDBackingStoreOperation store](self, "store");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "local");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreCacheDeleteRecordOperation group](self, "group");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_deleteRecordWithGroupID:recordName:", objc_msgSend(v14, "groupID"), v11);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {

          goto LABEL_13;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[HMDBackingStoreOperation store](self, "store");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "local");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_commit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_13:
    -[HMDBackingStoreOperation store](self, "store");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "local");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_rollback");

  }
  v19 = v5;

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

- (NSArray)recordNames
{
  return self->_recordNames;
}

- (void)setRecordNames:(id)a3
{
  objc_storeStrong((id *)&self->_recordNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordNames, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
