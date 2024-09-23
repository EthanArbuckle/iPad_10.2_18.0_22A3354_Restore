@implementation HMDBackingStoreLocalFlushOperation

- (HMDBackingStoreLocalFlushOperation)initWithStore:(id)a3 clearCloud:(BOOL)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  HMDBackingStoreLocalFlushOperation *v11;
  HMDBackingStoreLocalFlushOperation *v12;
  void *v13;
  id resultHandler;
  HMDBackingStoreLocalFlushOperation *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDBackingStoreLocalFlushOperation;
  v11 = -[HMDBackingStoreLocalFlushOperation init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_store, a3);
    v13 = _Block_copy(v10);
    resultHandler = v12->_resultHandler;
    v12->_resultHandler = v13;

    v12->_clearCloud = a4;
    v15 = v12;
  }

  return v12;
}

- (void)main
{
  void *v3;
  HMDBackingStoreLocalFlushOperation *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  HMDBackingStoreLocalFlushOperation *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void (**v41)(_QWORD, _QWORD);
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v53 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@removing all records and transactions", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDBackingStoreLocalFlushOperation store](v4, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v8 = (id)objc_msgSend(v7, "_runSQLite3:bind:error:", "DELETE FROM record", 0, &v51);
  v9 = v51;

  -[HMDBackingStoreLocalFlushOperation store](v4, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v9;
  v11 = (id)objc_msgSend(v10, "_runSQLite3:bind:error:", "DELETE FROM xact_block", 0, &v50);
  v12 = v50;

  -[HMDBackingStoreLocalFlushOperation store](v4, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v12;
  v14 = (id)objc_msgSend(v13, "_runSQLite3:bind:error:", "DELETE FROM xact", 0, &v49);
  v15 = v49;

  -[HMDBackingStoreLocalFlushOperation store](v4, "store");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v15;
  v17 = (id)objc_msgSend(v16, "_runSQLite3:bind:error:", "DELETE FROM archive", 0, &v48);
  v18 = v48;

  if (-[HMDBackingStoreLocalFlushOperation clearCloud](v4, "clearCloud"))
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v4;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@removing all zone cache information", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDBackingStoreLocalFlushOperation store](v20, "store");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v18;
    v24 = (id)objc_msgSend(v23, "_runSQLite3:bind:error:", "DELETE FROM zone_share", 0, &v47);
    v25 = v47;

    -[HMDBackingStoreLocalFlushOperation store](v20, "store");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v25;
    v27 = (id)objc_msgSend(v26, "_runSQLite3:bind:error:", "DELETE FROM zone_group", 0, &v46);
    v28 = v46;

    -[HMDBackingStoreLocalFlushOperation store](v20, "store");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v28;
    v30 = (id)objc_msgSend(v29, "_runSQLite3:bind:error:", "DELETE FROM zone", 0, &v45);
    v31 = v45;

    -[HMDBackingStoreLocalFlushOperation store](v20, "store");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v31;
    v33 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(v32, "_runSQLite3:bind:error:", "INSERT INTO zone (id, name) VALUES (0, '<NULL>');",
                                                        0,
                                                        &v44));
    v34 = v44;

    -[HMDBackingStoreLocalFlushOperation store](v20, "store");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v34;
    v36 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(v35, "_runSQLite3:bind:error:", "INSERT INTO zone_group (id, zone_id, root, owner) VALUES (0, 0, '<NULL>', '<NULL>');",
                                                        0,
                                                        &v43));
    v37 = v43;

    -[HMDBackingStoreLocalFlushOperation store](v20, "store");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v37;
    v39 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(v38, "_runSQLite3:bind:error:", "INSERT INTO zone_share (id, group_id, root) VALUES (0, 0, '<NULL>');",
                                                        0,
                                                        &v42));
    v18 = v42;

  }
  if (!v18)
  {
    -[HMDBackingStoreLocalFlushOperation store](v4, "store");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_fillZoneCache");
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[HMDBackingStoreLocalFlushOperation resultHandler](v4, "resultHandler");
  v41 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v41)[2](v41, v18);

}

- (HMDBackingStoreLocal)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)clearCloud
{
  return self->_clearCloud;
}

- (void)setClearCloud:(BOOL)a3
{
  self->_clearCloud = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
