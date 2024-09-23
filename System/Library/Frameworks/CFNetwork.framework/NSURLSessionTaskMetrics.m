@implementation NSURLSessionTaskMetrics

- (NSDateInterval)taskInterval
{
  __CFN_TaskMetrics *metrics;
  void *v4;
  __CFN_TaskMetrics *v5;
  double createTime;
  double completeTime;
  id v8;
  double v9;
  uint64_t v10;
  id v11;
  void *v12;

  metrics = self->__metrics;
  if (metrics)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", metrics->_createTime);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->__metrics;
    createTime = 0.0;
    if (v5)
    {
      completeTime = v5->_completeTime;
      createTime = v5->_createTime;
    }
    else
    {
      completeTime = 0.0;
    }
    v8 = objc_alloc(MEMORY[0x1E0CB3588]);
    v9 = completeTime - createTime;
    if (completeTime - createTime < 0.0)
      v9 = 0.0;
    v10 = objc_msgSend(v8, "initWithStartDate:duration:", v4, v9);
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "initWithStartDate:duration:", v4, 0.0);
  }
  v12 = (void *)v10;

  return (NSDateInterval *)v12;
}

- (id)initWithMetrics:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NSURLSessionTaskMetrics;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (void)collectWithCompletionHandler:(void *)a3 queue:
{
  void (**v5)(_QWORD);
  const char *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  void (**v14)(_QWORD);

  v5 = a2;
  v7 = a3;
  if (!a1)
    goto LABEL_9;
  v8 = *(void **)(a1 + 8);
  if (!v8)
  {
    v10 = 0;
    goto LABEL_11;
  }
  v9 = objc_getProperty(v8, v6, 96, 1);
  v10 = v9;
  if (!v9)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_5;
  }
  v11 = (void *)*((_QWORD *)v9 + 30);
LABEL_5:
  v12 = v11;

  if (v12)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__NSURLSessionTaskMetrics_collectWithCompletionHandler_queue___block_invoke;
    v13[3] = &unk_1E14FE2D0;
    v13[4] = a1;
    v14 = v5;
    nw_data_transfer_report_collect(v12, v7, v13);

  }
  else
  {
    v5[2](v5);
  }

LABEL_9:
}

- (NSArray)transactionMetrics
{
  __CFN_TaskMetrics *metrics;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  metrics = self->__metrics;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__NSURLSessionTaskMetrics_transactionMetrics__block_invoke;
  v5[3] = &unk_1E14FE2A8;
  v5[4] = &v6;
  -[__CFN_TaskMetrics lockTransactionMetrics:]((uint64_t)metrics, v5);
  v3 = (void *)objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__NSURLSessionTaskMetrics_transactionMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  _BYTE *v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
        if (v11)
          v12 = *(void **)(v11 + 72);
        else
          v12 = 0;
        v13 = v12;
        v14 = v13 == 0;

        if (!v14)
        {
          v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          v16 = -[NSURLSessionTaskTransactionMetrics initWithMetrics:forCache:]([NSURLSessionTaskTransactionMetrics alloc], (void *)v11, 1);
          objc_msgSend(v15, "addObject:", v16, (_QWORD)v23);

        }
        if (v11)
        {
          if (*(_BYTE *)(v11 + 8))
            goto LABEL_12;
          v19 = *(void **)(v11 + 72);
        }
        else
        {
          v19 = 0;
        }
        v20 = v19;
        v21 = v20 == 0;

        if (v21)
        {
LABEL_12:
          v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          v18 = -[NSURLSessionTaskTransactionMetrics initWithMetrics:forCache:]([NSURLSessionTaskTransactionMetrics alloc], (void *)v11, 0);
          objc_msgSend(v17, "addObject:", v18);

        }
        ++v10;
      }
      while (v8 != v10);
      v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v8 = v22;
    }
    while (v22);
  }

}

void __40__NSURLSessionTaskMetrics_redirectCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (v7 && *(_QWORD *)(v7 + 208) == 2)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__metrics, 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->__metrics, CFSTR("metrics"));
}

- (NSURLSessionTaskMetrics)initWithCoder:(id)a3
{
  id v4;
  NSURLSessionTaskMetrics *v5;
  uint64_t v6;
  __CFN_TaskMetrics *metrics;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionTaskMetrics;
  v5 = -[NSURLSessionTaskMetrics init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metrics"));
    v6 = objc_claimAutoreleasedReturnValue();
    metrics = v5->__metrics;
    v5->__metrics = (__CFN_TaskMetrics *)v6;

  }
  return v5;
}

void __62__NSURLSessionTaskMetrics_collectWithCompletionHandler_queue___block_invoke(uint64_t a1, void *a2)
{
  const char *v4;
  void *v5;
  id *v6;
  id *v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v5)
  {
    v6 = (id *)objc_getProperty(v5, v4, 96, 1);
    v7 = v6;
    if (v6)
      objc_storeStrong(v6 + 30, a2);
  }
  else
  {
    v7 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSUInteger)redirectCount
{
  __CFN_TaskMetrics *metrics;
  NSUInteger v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  metrics = self->__metrics;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__NSURLSessionTaskMetrics_redirectCount__block_invoke;
  v5[3] = &unk_1E14FE2A8;
  v5[4] = &v6;
  -[__CFN_TaskMetrics lockTransactionMetrics:]((uint64_t)metrics, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURLSessionTaskMetrics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskMetrics;
  return -[NSURLSessionTaskMetrics init](&v3, sel_init);
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSURLSessionTaskMetrics transactionMetrics](self, "transactionMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[NSURLSessionTaskMetrics taskInterval](self, "taskInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("(Task Interval) %@\n(Redirect Count) %lu\n(Transaction Metrics) %@"), v9, -[NSURLSessionTaskMetrics redirectCount](self, "redirectCount"), v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
