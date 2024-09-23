@implementation HMBLocalSQLContextInputBlock

- (HMBLocalSQLContextInputBlock)initWithOwner:(id)a3 identifier:(id)a4 zoneRow:(unint64_t)a5 blockRow:(unint64_t)a6 type:(unint64_t)a7
{
  id v12;
  id v13;
  HMBLocalSQLContextInputBlock *v14;
  HMBLocalSQLContextInputBlock *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HMFActivity *activity;
  void *v22;
  HMBLocalSQLContextInputBlock *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HMBLocalSQLContextInputBlock;
  v14 = -[HMBLocalSQLContextInputBlock init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a4);
    objc_storeWeak((id *)&v15->_owner, v12);
    v15->_blockRow = a6;
    v15->_zoneRow = a5;
    v15->_type = a7;
    v16 = objc_alloc(MEMORY[0x1E0D28540]);
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[HMBLocalSQLContextInputBlock logIdentifier](v15, "logIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("HMBLocalSQLContextInputBlock.%@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "initWithName:", v19);
    activity = v15->_activity;
    v15->_activity = (HMFActivity *)v20;

    v22 = (void *)MEMORY[0x1D17B6230]();
    v23 = v15;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = v12;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextInputBlock activity](v23, "activity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextInputBlock identifier](v23, "identifier");
      v29 = v13;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v25;
      v36 = 2114;
      v37 = v28;
      v38 = 2112;
      v39 = v30;
      _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating Input Block for %@", buf, 0x20u);

      v13 = v29;
      v12 = v32;
    }

    objc_autoreleasePoolPop(v22);
  }

  return v15;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBLocalSQLContextInputBlock blockRow](self, "blockRow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Block Row"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBLocalSQLContextInputBlock zoneRow](self, "zoneRow", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Zone Row"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBLocalSQLContextInputBlock type](self, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Type"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)insertExternalID:(id)a3 externalData:(id)a4 modelEncoding:(unint64_t)a5 modelData:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMBLocalSQLContextInputBlock *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  HMBLocalSQLContextInputBlock *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[HMBLocalSQLContextInputBlock blockRow](self, "blockRow"))
  {
    -[HMBLocalSQLContextInputBlock owner](self, "owner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __86__HMBLocalSQLContextInputBlock_insertExternalID_externalData_modelEncoding_modelData___block_invoke;
    v33[3] = &unk_1E8931448;
    v33[4] = self;
    v34 = v10;
    v35 = v11;
    v37 = a5;
    v36 = v12;
    objc_msgSend(v13, "sqlBlockWithActivity:block:", 0, v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1D17B6230]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextInputBlock activity](v16, "activity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortDescription");
        v32 = v15;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v18;
        v40 = 2114;
        v41 = v21;
        v42 = 2112;
        v43 = v14;
        _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add additional entries on input block: %@", buf, 0x20u);

        v15 = v32;
      }

      objc_autoreleasePoolPop(v15);
      v22 = -[HMBLocalSQLContextInputBlock abort](v16, "abort");
      v23 = v14;
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x1D17B6230]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextInputBlock activity](v25, "activity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shortDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v27;
      v40 = 2114;
      v41 = v30;
      _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to add additional entries on invalid input block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)updateExternalID:(id)a3 externalData:(id)a4 modelEncoding:(unint64_t)a5 modelData:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMBLocalSQLContextInputBlock *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  HMBLocalSQLContextInputBlock *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[HMBLocalSQLContextInputBlock blockRow](self, "blockRow"))
  {
    -[HMBLocalSQLContextInputBlock owner](self, "owner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __86__HMBLocalSQLContextInputBlock_updateExternalID_externalData_modelEncoding_modelData___block_invoke;
    v33[3] = &unk_1E8931448;
    v33[4] = self;
    v34 = v10;
    v35 = v11;
    v37 = a5;
    v36 = v12;
    objc_msgSend(v13, "sqlBlockWithActivity:block:", 0, v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1D17B6230]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextInputBlock activity](v16, "activity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortDescription");
        v32 = v15;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v18;
        v40 = 2114;
        v41 = v21;
        v42 = 2112;
        v43 = v14;
        _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to update additional entries on input block: %@", buf, 0x20u);

        v15 = v32;
      }

      objc_autoreleasePoolPop(v15);
      v22 = -[HMBLocalSQLContextInputBlock abort](v16, "abort");
      v23 = v14;
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x1D17B6230]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextInputBlock activity](v25, "activity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shortDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v27;
      v40 = 2114;
      v41 = v30;
      _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to update additional entries on invalid input block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)commit:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  HMBLocalSQLContextInputBlock *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  HMBLocalSQLContextInputBlock *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v37[5];
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMBLocalSQLContextInputBlock blockRow](self, "blockRow");
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
      -[HMBLocalSQLContextInputBlock activity](v7, "activity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v10;
      v42 = 2114;
      v43 = v13;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Committing input block.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMBLocalSQLContextInputBlock owner](v7, "owner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __39__HMBLocalSQLContextInputBlock_commit___block_invoke;
    v37[3] = &unk_1E8932F30;
    v37[4] = v7;
    v38 = v4;
    v15 = objc_msgSend(v14, "sqlBlockWithActivity:error:block:", 0, &v39, v37);
    v16 = v39;

    v17 = (void *)MEMORY[0x1D17B6230]();
    v18 = v7;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if ((v15 & 1) != 0)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextInputBlock activity](v18, "activity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v21;
        v42 = 2114;
        v43 = v24;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully committed input block", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMBLocalSQLContextInputBlock setBlockRow:](v18, "setBlockRow:", 0);
      -[HMBLocalSQLContextInputBlock activity](v18, "activity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "invalidate");

      v26 = 0;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextInputBlock activity](v18, "activity");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v31;
        v42 = 2114;
        v43 = v34;
        v44 = 2112;
        v45 = v16;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to commit input block: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      v35 = -[HMBLocalSQLContextInputBlock abort](v18, "abort");
      v26 = v16;
    }

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextInputBlock activity](v7, "activity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shortDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v27;
      v42 = 2114;
      v43 = v30;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to commit invalid input block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (id)abort
{
  unint64_t v3;
  void *v4;
  HMBLocalSQLContextInputBlock *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  HMBLocalSQLContextInputBlock *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = -[HMBLocalSQLContextInputBlock blockRow](self, "blockRow");
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
      -[HMBLocalSQLContextInputBlock activity](v5, "activity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v8;
      v38 = 2114;
      v39 = v11;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Aborting input block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMBLocalSQLContextInputBlock owner](v5, "owner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v5;
    v35 = 0;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __37__HMBLocalSQLContextInputBlock_abort__block_invoke;
    v34[3] = &unk_1E8933B28;
    v13 = objc_msgSend(v12, "sqlBlockWithActivity:error:block:", 0, &v35, v34);
    v14 = v35;

    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = v5;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextInputBlock activity](v16, "activity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "shortDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v19;
        v38 = 2114;
        v39 = v22;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully aborted input block", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMBLocalSQLContextInputBlock setBlockRow:](v16, "setBlockRow:", 0);
      -[HMBLocalSQLContextInputBlock activity](v16, "activity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "invalidate");

      v24 = 0;
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLContextInputBlock activity](v16, "activity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v30;
        v38 = 2114;
        v39 = v33;
        v40 = 2112;
        v41 = v14;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to abort input block: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMBLocalSQLContextInputBlock setBlockRow:](v16, "setBlockRow:", 0);
      v24 = v14;
    }

    return v24;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextInputBlock activity](v5, "activity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v25;
      v38 = 2114;
      v39 = v28;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to abort invalid input block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)logIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu/%lu"), -[HMBLocalSQLContextInputBlock blockRow](self, "blockRow"), -[HMBLocalSQLContextInputBlock type](self, "type"));
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

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

id __37__HMBLocalSQLContextInputBlock_abort__block_invoke(uint64_t a1, void *a2)
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

id __39__HMBLocalSQLContextInputBlock_commit___block_invoke(uint64_t a1, void *a2)
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

id __86__HMBLocalSQLContextInputBlock_updateExternalID_externalData_modelEncoding_modelData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = objc_msgSend(*(id *)(a1 + 32), "blockRow");
  v7 = objc_msgSend(*(id *)(a1 + 32), "type");
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v13 = 0;
  objc_msgSend(v4, "_updateItemWithZoneRow:blockRow:type:externalID:externalData:modelEncoding:modelData:error:", v5, v6, v7, v8, v9, v10, v11, &v13);

  return v13;
}

id __86__HMBLocalSQLContextInputBlock_insertExternalID_externalData_modelEncoding_modelData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = objc_msgSend(*(id *)(a1 + 32), "blockRow");
  v7 = objc_msgSend(*(id *)(a1 + 32), "type");
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v13 = 0;
  objc_msgSend(v4, "_insertItemWithZoneRow:blockRow:type:externalID:externalData:modelEncoding:modelData:error:", v5, v6, v7, v8, v9, v10, v11, &v13);

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13 != -1)
    dispatch_once(&logCategory__hmf_once_t13, &__block_literal_global_668);
  return (id)logCategory__hmf_once_v14;
}

void __43__HMBLocalSQLContextInputBlock_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14;
  logCategory__hmf_once_v14 = v0;

}

@end
