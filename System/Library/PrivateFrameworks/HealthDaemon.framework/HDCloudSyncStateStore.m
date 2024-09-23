@implementation HDCloudSyncStateStore

- (HDCloudSyncStateStore)initWithData:(id)a3
{
  id v4;
  HDCloudSyncStateStore *v5;
  uint64_t v6;
  NSDictionary *stateData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncStateStore;
  v5 = -[HDCloudSyncStateStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stateData = v5->_stateData;
    v5->_stateData = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)data:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  HDCloudSyncStateStore *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_stateData, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v14 = 0;
    objc_msgSend(v7, "decompressedDataUsingAlgorithm:error:", 0, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v9)
    {
      v11 = v9;
      if (!a3)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = v10;
        _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to decompress data: %{public}@", buf, 0x16u);
      }
      v11 = v8;
      if (!a3)
        goto LABEL_5;
    }
    *a3 = objc_retainAutorelease(v11);
    goto LABEL_5;
  }
LABEL_6:

  return 1;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *mergedData;
  id v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  HDCloudSyncStateStore *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  id v28;
  HDCloudSyncStateStore *v29;
  HDCloudSyncStateStore *v30;
  id v31;
  id v33;
  uint8_t buf[4];
  HDCloudSyncStateStore *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HDCloudSyncStateStore mergedData](self, "mergedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v8;
    if (!self)
    {
LABEL_20:

      v29 = self;
      v30 = v29;
      if (v29)
      {
        if (a5)
        {
          v30 = objc_retainAutorelease(v29);
          v19 = 0;
          *a5 = v30;
        }
        else
        {
          _HKLogDroppedError();
          v19 = 0;
        }
        v18 = v30;
      }
      else
      {
        v18 = 0;
        v19 = 0;
      }
      goto LABEL_34;
    }
  }
  else
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mergedData = self->_mergedData;
    self->_mergedData = v12;

    v14 = v8;
  }
  v15 = objc_msgSend(v8, "length");
  if (v15 >> 11 >= 0x19)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v35 = self;
      v36 = 2050;
      v37 = v15;
      v38 = 2050;
      v39 = 51200;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Record size: %{public}lu exceeds soft size limit: %{public}lu", buf, 0x20u);
    }
    if (v15 >> 11 >= 0x7D)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = CFSTR("Individual data size limit exceeded.");
      goto LABEL_16;
    }
  }
  if (-[HDCloudSyncStateStore aggregateMergedDataLength](self, "aggregateMergedDataLength") + v15 >= 0x300000)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = CFSTR("Aggregate data size limit exceeded.");
LABEL_16:
    objc_msgSend(v26, "hk_error:description:", 736, v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v28)
      self = (HDCloudSyncStateStore *)objc_retainAutorelease(v28);
    else
      self = 0;

    goto LABEL_20;
  }

  v33 = 0;
  objc_msgSend(v8, "compressedDataUsingAlgorithm:error:", 0, &v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (HDCloudSyncStateStore *)v33;
  v19 = v17 != 0;
  _HKInitializeLogging();
  v20 = *MEMORY[0x1E0CB5370];
  v21 = *MEMORY[0x1E0CB5370];
  if (v17)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v20;
      v23 = objc_msgSend(v8, "length");
      v24 = objc_msgSend(v8, "length");
      *(_DWORD *)buf = 138544130;
      v35 = self;
      v36 = 2114;
      v37 = (unint64_t)v9;
      v38 = 2048;
      v39 = v23;
      v40 = 2048;
      v41 = v24;
      _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Compressed data for key: %{public}@ from %lu to %lu", buf, 0x2Au);

    }
    -[HDCloudSyncStateStore mergedData](self, "mergedData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v17, v9);

    -[HDCloudSyncStateStore setAggregateMergedDataLength:](self, "setAggregateMergedDataLength:", -[HDCloudSyncStateStore aggregateMergedDataLength](self, "aggregateMergedDataLength")+ objc_msgSend(v17, "length"));
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2114;
      v37 = (unint64_t)v18;
      _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to compress data: %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 740, CFSTR("Failed to compress data."));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v31);
      else
        _HKLogDroppedError();
    }

  }
  v30 = 0;
LABEL_34:

  return v19;
}

- (void)unitTest_setMergedData:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *mergedData;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  mergedData = self->_mergedData;
  self->_mergedData = v4;

}

- (unint64_t)aggregateMergedDataLength
{
  return self->_aggregateMergedDataLength;
}

- (void)setAggregateMergedDataLength:(unint64_t)a3
{
  self->_aggregateMergedDataLength = a3;
}

- (NSMutableDictionary)mergedData
{
  return self->_mergedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedData, 0);
  objc_storeStrong((id *)&self->_stateData, 0);
}

@end
