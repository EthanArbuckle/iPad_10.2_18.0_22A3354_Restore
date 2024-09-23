@implementation HMBLocalSQLContextOutputBlock

- (HMBLocalSQLContextOutputBlock)initWithOwner:(id)a3 identifier:(id)a4 zoneRow:(unint64_t)a5 blockRow:(unint64_t)a6
{
  id v10;
  id v11;
  HMBLocalSQLContextOutputBlock *v12;
  HMBLocalSQLContextOutputBlock *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HMFActivity *activity;
  void *v20;
  HMBLocalSQLContextOutputBlock *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HMBLocalSQLContextOutputBlock;
  v12 = -[HMBLocalSQLContextOutputBlock init](&v31, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a4);
    objc_storeWeak((id *)&v13->_owner, v10);
    v13->_blockRow = a6;
    v13->_zoneRow = a5;
    v14 = objc_alloc(MEMORY[0x1E0D28540]);
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[HMBLocalSQLContextOutputBlock logIdentifier](v13, "logIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("HMBLocalSQLContextOutputBlock.%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "initWithName:", v17);
    activity = v13->_activity;
    v13->_activity = (HMFActivity *)v18;

    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = v13;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = v10;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextOutputBlock activity](v21, "activity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextOutputBlock identifier](v21, "identifier");
      v27 = v11;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v23;
      v34 = 2114;
      v35 = v26;
      v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating Output Block for %@", buf, 0x20u);

      v11 = v27;
      v10 = v30;
    }

    objc_autoreleasePoolPop(v20);
  }

  return v13;
}

- (id)updateModelID:(id)a3 modelEncoding:(unint64_t)a4 modelData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HMBLocalSQLContextOutputBlock *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  HMBLocalSQLContextOutputBlock *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  id (*v36)(uint64_t, void *);
  void *v37;
  HMBLocalSQLContextOutputBlock *v38;
  id v39;
  id v40;
  unint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (-[HMBLocalSQLContextOutputBlock blockRow](self, "blockRow"))
  {
    -[HMBLocalSQLContextOutputBlock owner](self, "owner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __71__HMBLocalSQLContextOutputBlock_updateModelID_modelEncoding_modelData___block_invoke;
    v37 = &unk_1E8932F08;
    v38 = self;
    v39 = v8;
    v41 = a4;
    v40 = v9;
    objc_msgSend(v10, "sqlBlockWithActivity:block:", 0, &v34);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v18 = (void *)MEMORY[0x1D17B6230](v12, v13, v14, v15, v16, v17);
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextOutputBlock activity](v19, "activity", v34, v35, v36, v37, v38, v39);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v21;
        v44 = 2114;
        v45 = v24;
        v46 = 2112;
        v47 = v11;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add additional entries on output block: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v25 = -[HMBLocalSQLContextOutputBlock abort](v19, "abort");
    }

  }
  else
  {
    v26 = (void *)MEMORY[0x1D17B6230]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextOutputBlock activity](v27, "activity");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shortDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v29;
      v44 = 2114;
      v45 = v32;
      _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to add additional entries on invalid output block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    v11 = 0;
  }

  return v11;
}

- (id)commit:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  HMBLocalSQLContextOutputBlock *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  HMBLocalSQLContextOutputBlock *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  id (*v44)(uint64_t, void *);
  void *v45;
  HMBLocalSQLContextOutputBlock *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMBLocalSQLContextOutputBlock blockRow](self, "blockRow");
  v6 = (void *)MEMORY[0x1D17B6230]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextOutputBlock activity](v7, "activity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v10;
      v50 = 2114;
      v51 = v13;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Committing output block.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMBLocalSQLContextOutputBlock activity](v7, "activity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markWithReason:", CFSTR("committing block."));

    -[HMBLocalSQLContextOutputBlock owner](v7, "owner");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = __40__HMBLocalSQLContextOutputBlock_commit___block_invoke;
    v45 = &unk_1E8932F30;
    v46 = v7;
    v47 = v4;
    objc_msgSend(v15, "sqlBlockWithActivity:block:", 0, &v42);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1D17B6230](v17, v18, v19, v20, v21);
    v23 = v7;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v16)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextOutputBlock activity](v23, "activity", v42, v43, v44, v45, v46);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shortDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v26;
        v50 = 2114;
        v51 = v29;
        v52 = 2112;
        v53 = v16;
        _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to commit output block: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      v30 = -[HMBLocalSQLContextOutputBlock abort](v23, "abort");
      -[HMBLocalSQLContextOutputBlock setBlockRow:](v23, "setBlockRow:", 0);
      v31 = v16;
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextOutputBlock activity](v23, "activity", v42, v43, v44, v45, v46);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "shortDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v36;
        v50 = 2114;
        v51 = v39;
        _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully committed input block", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      -[HMBLocalSQLContextOutputBlock setBlockRow:](v23, "setBlockRow:", 0);
      -[HMBLocalSQLContextOutputBlock activity](v23, "activity");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "invalidate");

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextOutputBlock activity](v7, "activity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "shortDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v32;
      v50 = 2114;
      v51 = v35;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to commit invalid output block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v16 = 0;
  }

  return v16;
}

- (id)abort
{
  unint64_t v3;
  void *v4;
  HMBLocalSQLContextOutputBlock *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMBLocalSQLContextOutputBlock *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = -[HMBLocalSQLContextOutputBlock blockRow](self, "blockRow");
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextOutputBlock activity](v5, "activity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v8;
      v36 = 2114;
      v37 = v11;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Aborting output block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMBLocalSQLContextOutputBlock owner](v5, "owner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __38__HMBLocalSQLContextOutputBlock_abort__block_invoke;
    v33[3] = &unk_1E8933B28;
    v33[4] = v5;
    objc_msgSend(v12, "sqlBlockWithActivity:block:", 0, v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1D17B6230]();
    v15 = v5;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextOutputBlock activity](v15, "activity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v18;
        v36 = 2114;
        v37 = v21;
        v38 = 2112;
        v39 = v13;
        _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to abort input block: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      -[HMBLocalSQLContextOutputBlock setBlockRow:](v15, "setBlockRow:", 0);
      v22 = v13;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextOutputBlock activity](v15, "activity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "shortDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v28;
        v36 = 2114;
        v37 = v31;
        _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully aborted output block", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      -[HMBLocalSQLContextOutputBlock setBlockRow:](v15, "setBlockRow:", 0);
      -[HMBLocalSQLContextOutputBlock activity](v15, "activity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "invalidate");

    }
    return v13;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextOutputBlock activity](v5, "activity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      v36 = 2114;
      v37 = v26;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to abort invalid output block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    return 0;
  }
}

- (id)logIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[HMBLocalSQLContextOutputBlock blockRow](self, "blockRow"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)blockRow
{
  return self->_blockRow;
}

- (void)setBlockRow:(unint64_t)a3
{
  self->_blockRow = a3;
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (HMBLocalSQLContext)owner
{
  return (HMBLocalSQLContext *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

id __38__HMBLocalSQLContextOutputBlock_abort__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v10 = 0;
  objc_msgSend(v4, "_deleteItemsWithBlockRow:error:", objc_msgSend(v3, "blockRow"), &v10);
  v5 = v10;
  v6 = objc_msgSend(*(id *)(a1 + 32), "blockRow");
  v9 = v5;
  objc_msgSend(v4, "_deleteBlockWithRow:error:", v6, &v9);

  v7 = v9;
  return v7;
}

id __40__HMBLocalSQLContextOutputBlock_commit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "blockRow");
  v6 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  objc_msgSend(v4, "_updateBlockWithRow:options:error:", v5, v6, &v8);

  return v8;
}

id __71__HMBLocalSQLContextOutputBlock_updateModelID_modelEncoding_modelData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v7 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "blockRow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "_updateRecordWithZoneRow:modelID:pushEncoding:pushData:pushBlockRow:error:", v5, v8, v6, v7, v9, &v12);

  v10 = v12;
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11 != -1)
    dispatch_once(&logCategory__hmf_once_t11, &__block_literal_global_5347);
  return (id)logCategory__hmf_once_v12;
}

void __44__HMBLocalSQLContextOutputBlock_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12;
  logCategory__hmf_once_v12 = v0;

}

@end
