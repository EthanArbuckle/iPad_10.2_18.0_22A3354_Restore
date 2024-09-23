@implementation VSBundleRecord

- (VSBundleRecord)initWithBundleID:(id)a3
{
  id v4;
  VSBundleRecord *v5;
  NSOperationQueue *v6;
  NSOperationQueue *lsQueue;
  NSOperationQueue *v8;
  objc_class *v9;
  void *v10;
  VSWaitGroup *v11;
  NSOperationQueue *v12;
  id v13;
  VSWaitGroup *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  LSBundleRecord *record;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  VSWaitGroup *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  objc_super v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)VSBundleRecord;
  v5 = -[VSBundleRecord init](&v44, sel_init);
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    lsQueue = v5->_lsQueue;
    v5->_lsQueue = v6;

    v8 = v5->_lsQueue;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v8, "setName:", v10);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_lsQueue, "setMaxConcurrentOperationCount:", 1);
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__4;
    v42 = __Block_byref_object_dispose__4;
    v43 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__4;
    v36 = __Block_byref_object_dispose__4;
    v37 = 0;
    v11 = objc_alloc_init(VSWaitGroup);
    -[VSWaitGroup enter](v11, "enter");
    v12 = v5->_lsQueue;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __35__VSBundleRecord_initWithBundleID___block_invoke;
    v27 = &unk_1E939FE48;
    v30 = &v32;
    v13 = v4;
    v28 = v13;
    v31 = &v38;
    v14 = v11;
    v29 = v14;
    -[NSOperationQueue addOperationWithBlock:](v12, "addOperationWithBlock:", &v24);
    if (!-[VSWaitGroup waitWithMilliseconds:](v14, "waitWithMilliseconds:", 5000, v24, v25, v26, v27))
    {
      VSDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v13;
        _os_log_impl(&dword_1D2419000, v15, OS_LOG_TYPE_DEFAULT, "LaunchServices timed out while obtaining LSBundleRecord for bundleID %@", buf, 0xCu);
      }

    }
    if (v33[5])
      goto LABEL_14;
    if (v39[5])
    {
      VSDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v39[5];
        *(_DWORD *)buf = 138412546;
        v46 = v13;
        v47 = 2112;
        v48 = v17;
        v18 = "Received error while obtaining LSBundleRecord for bundleID %@: %@";
        v19 = v16;
        v20 = 22;
LABEL_12:
        _os_log_impl(&dword_1D2419000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      VSDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v13;
        v18 = "No LSBundleRecord found for bundleID %@";
        v19 = v16;
        v20 = 12;
        goto LABEL_12;
      }
    }

LABEL_14:
    v21 = objc_msgSend((id)v33[5], "copy");
    record = v5->_record;
    v5->_record = (LSBundleRecord *)v21;

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);

  }
  return v5;
}

uint64_t __35__VSBundleRecord_initWithBundleID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v2, 0, &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(a1 + 40), "leave");
}

- (id)bundleVersion
{
  void *v3;
  void *v4;
  void *v5;

  -[VSBundleRecord record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VSBundleRecord record](self, "record");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (LSBundleRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (NSOperationQueue)lsQueue
{
  return self->_lsQueue;
}

- (void)setLsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsQueue, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
