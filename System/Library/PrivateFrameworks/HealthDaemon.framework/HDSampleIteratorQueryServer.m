@implementation HDSampleIteratorQueryServer

- (HDSampleIteratorQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSampleIteratorQueryServer *v11;
  void *v12;
  uint64_t v13;
  HKSampleIteratorQueryCursor *queryCursor;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSampleIteratorQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v16, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "queryCursor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    queryCursor = v11->_queryCursor;
    v11->_queryCursor = (HKSampleIteratorQueryCursor *)v13;

    v11->_limit = objc_msgSend(v10, "limit");
  }

  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a3, "queryCursor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 3, CFSTR("Missing sample type for query"));
  return v8 != 0;
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 1;
}

- (id)objectTypes
{
  void *v2;
  void *v3;

  -[HKSampleIteratorQueryCursor queryDescriptors](self->_queryCursor, "queryDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_mapToSet:", &__block_literal_global_162);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __42__HDSampleIteratorQueryServer_objectTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sampleType");
}

- (void)_queue_start
{
  HKSampleIteratorQueryCursor *queryCursor;
  unint64_t limit;
  int64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  objc_super v15;
  uint8_t buf[4];
  HDSampleIteratorQueryServer *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)HDSampleIteratorQueryServer;
  -[HDQueryServer _queue_start](&v15, sel__queue_start);
  queryCursor = self->_queryCursor;
  limit = self->_limit;
  v13[4] = self;
  v14 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__HDSampleIteratorQueryServer__queue_start__block_invoke;
  v13[3] = &unk_1E6CFF480;
  v5 = -[HDBatchedQueryServer batchObjectsWithMultitypeQueryCursor:includeDeletedObjects:limit:error:batchHandler:](self, "batchObjectsWithMultitypeQueryCursor:includeDeletedObjects:limit:error:batchHandler:", queryCursor, 0, limit, &v14, v13);
  v6 = v14;
  switch(v5)
  {
    case 1:
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v17 = self;
        v18 = 2114;
        v19 = v6;
        _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error enumerating update results: %{public}@", buf, 0x16u);
      }
      -[HDQueryServer clientProxy](self, "clientProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryServer queryUUID](self, "queryUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "client_deliverError:forQuery:", v6, v9);

      goto LABEL_13;
    case 2:
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: Client no longer authorized", buf, 0xCu);
      }

      -[HDSampleIteratorQueryServer _queue_deliverSamples:queryCursor:deliverResults:](self, MEMORY[0x1E0C9AA60], self->_queryCursor, 1);
      goto LABEL_14;
    case 3:
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5348];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
        goto LABEL_13;
      *(_DWORD *)buf = 138543362;
      v17 = self;
      v12 = "%{public}@: Suspended during enumeration";
      break;
    case 4:
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5348];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
        goto LABEL_13;
      *(_DWORD *)buf = 138543362;
      v17 = self;
      v12 = "%{public}@: Canceled during enumeration";
      break;
    default:
      goto LABEL_13;
  }
  _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
LABEL_13:

LABEL_14:
  -[HDQueryServer setDataCount:](self, "setDataCount:", self->_deliveredResultCount);

}

void __43__HDSampleIteratorQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  void *v9;
  id v10;
  id v11;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  objc_msgSend(v9, "filteredSamplesForClientWithSamples:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) += objc_msgSend(v11, "count");
  -[HDSampleIteratorQueryServer _queue_deliverSamples:queryCursor:deliverResults:](*(void **)(a1 + 32), v11, v10, a6);

}

- (void)_queue_deliverSamples:(void *)a3 queryCursor:(uint64_t)a4 deliverResults:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;

  if (a1)
  {
    v7 = a3;
    v8 = a2;
    objc_msgSend(a1, "queryQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    objc_msgSend(a1, "clientProxy");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "client_deliverSampleObjects:queryCursor:deliverResults:query:", v8, v7, a4, v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryCursor, 0);
}

@end
