@implementation HMDBackingStoreCacheUpdateGroupTokenOperation

- (HMDBackingStoreCacheUpdateGroupTokenOperation)initWithGroup:(id)a3 serverChangeToken:(id)a4 resultBlock:(id)a5
{
  id v9;
  id v10;
  HMDBackingStoreCacheUpdateGroupTokenOperation *v11;
  HMDBackingStoreCacheUpdateGroupTokenOperation *v12;
  HMDBackingStoreCacheUpdateGroupTokenOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreCacheUpdateGroupTokenOperation;
  v11 = -[HMDBackingStoreOperation initWithResultBlock:](&v15, sel_initWithResultBlock_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_record, a3);
    objc_storeStrong((id *)&v12->_serverChangeToken, a4);
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
  void *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[HMDBackingStoreOperation store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_begin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_2;
  -[HMDBackingStoreCacheUpdateGroupTokenOperation serverChangeToken](self, "serverChangeToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_7:
    -[HMDBackingStoreOperation store](self, "store");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "local");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_commit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_3;
    goto LABEL_2;
  }
  -[HMDBackingStoreOperation store](self, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "local");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheUpdateGroupTokenOperation record](self, "record");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "groupID");
  -[HMDBackingStoreCacheUpdateGroupTokenOperation serverChangeToken](self, "serverChangeToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateGroupWithID:serverChangeToken:", v14, v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HMDBackingStoreCacheUpdateGroupTokenOperation serverChangeToken](self, "serverChangeToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreCacheUpdateGroupTokenOperation record](self, "record");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setServerChangeToken:", v16);

    goto LABEL_7;
  }
LABEL_2:
  -[HMDBackingStoreOperation store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "local");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_rollback");

LABEL_3:
  v8 = v5;

  return v8;
}

- (HMDBackingStoreCacheGroup)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_serverChangeToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
