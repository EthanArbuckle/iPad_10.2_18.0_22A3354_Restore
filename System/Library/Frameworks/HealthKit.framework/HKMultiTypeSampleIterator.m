@implementation HKMultiTypeSampleIterator

- (HKMultiTypeSampleIterator)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (BOOL)_queryForNextPageIfNecessaryWithError:(id *)a3
{
  BOOL v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  void *v8;
  unint64_t limit;
  unint64_t bufferSize;
  unint64_t v11;
  HKSampleIteratorQuery *v12;
  HKSampleIteratorQuery *v13;
  id v14;
  void *v15;
  _QWORD aBlock[4];
  NSObject *v18;
  HKMultiTypeSampleIterator *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  if (-[NSMutableArray count](self->_buffer, "count"))
    return 1;
  if (self->_state == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 900, CFSTR("Multi-type sample iterator is exhausted"));
    return 0;
  }
  else
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__33;
    v26 = __Block_byref_object_dispose__33;
    v27 = 0;
    v6 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__HKMultiTypeSampleIterator__queryForNextPageIfNecessaryWithError___block_invoke;
    aBlock[3] = &unk_1E37F12B0;
    v20 = &v22;
    v7 = v6;
    v18 = v7;
    v19 = self;
    v21 = &v28;
    v8 = _Block_copy(aBlock);
    bufferSize = self->_bufferSize;
    limit = self->_limit;
    if (limit)
    {
      v11 = limit - self->_numberOfSamplesDelivered;
      if (bufferSize >= v11)
        bufferSize = v11;
    }
    if (self->_state == 1)
      v12 = -[HKSampleIteratorQuery initWithQueryCursor:limit:resultsHandler:]([HKSampleIteratorQuery alloc], "initWithQueryCursor:limit:resultsHandler:", self->_queryCursor, bufferSize, v8);
    else
      v12 = -[HKSampleIteratorQuery initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:limit:resultsHandler:]([HKSampleIteratorQuery alloc], "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:limit:resultsHandler:", self->_queryDescriptors, self->_sortDescriptors, self->_followingAnchor, self->_upToAndIncludingAnchor, self->_distinctByKeyPaths, bufferSize, v8);
    v13 = v12;
    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    v14 = (id)v23[5];
    v15 = v14;
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError(v14);
    }

    v5 = *((_BYTE *)v29 + 24) != 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  return v5;
}

void __67__HKMultiTypeSampleIterator__queryForNextPageIfNecessaryWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  if (v20)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 80), a4);
    if (v8)
    {
      v10 = objc_msgSend(v20, "count");
      v11 = *(_QWORD *)(a1 + 40);
      v12 = v10 >= *(_QWORD *)(v11 + 48);
      v13 = v20;
      v14 = 1;
      if (!v12)
        v14 = 2;
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 40);
      v14 = 2;
      v13 = v20;
    }
    *(_QWORD *)(v11 + 72) = v14;
    objc_msgSend(v13, "reverseObjectEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(v18 + 88);
    *(_QWORD *)(v18 + 88) = v17;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (HKMultiTypeSampleIterator)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7 bufferSize:(unint64_t)a8 limit:(unint64_t)a9 healthStore:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HKMultiTypeSampleIterator *v23;
  uint64_t v24;
  NSArray *queryDescriptors;
  uint64_t v26;
  NSArray *sortDescriptors;
  uint64_t v28;
  HKQueryAnchor *followingAnchor;
  uint64_t v30;
  HKQueryAnchor *upToAndIncludingAnchor;
  uint64_t v32;
  NSArray *distinctByKeyPaths;
  HKSampleIteratorQueryCursor *queryCursor;
  HKSample *current;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMultiTypeSampleIterator.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryDescriptors"));

  }
  if (objc_msgSend(v17, "count"))
  {
    if (v22)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMultiTypeSampleIterator.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryDescriptors.count > 0"));

    if (v22)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMultiTypeSampleIterator.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("healthStore"));

LABEL_5:
  v40.receiver = self;
  v40.super_class = (Class)HKMultiTypeSampleIterator;
  v23 = -[HKMultiTypeSampleIterator init](&v40, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    queryDescriptors = v23->_queryDescriptors;
    v23->_queryDescriptors = (NSArray *)v24;

    v26 = objc_msgSend(v18, "copy");
    sortDescriptors = v23->_sortDescriptors;
    v23->_sortDescriptors = (NSArray *)v26;

    v28 = objc_msgSend(v19, "copy");
    followingAnchor = v23->_followingAnchor;
    v23->_followingAnchor = (HKQueryAnchor *)v28;

    v30 = objc_msgSend(v20, "copy");
    upToAndIncludingAnchor = v23->_upToAndIncludingAnchor;
    v23->_upToAndIncludingAnchor = (HKQueryAnchor *)v30;

    v32 = objc_msgSend(v21, "copy");
    distinctByKeyPaths = v23->_distinctByKeyPaths;
    v23->_distinctByKeyPaths = (NSArray *)v32;

    v23->_bufferSize = a8;
    v23->_limit = a9;
    objc_storeStrong((id *)&v23->_healthStore, a10);
    queryCursor = v23->_queryCursor;
    v23->_state = 0;
    v23->_queryCursor = 0;

    current = v23->_current;
    v23->_current = 0;

    v23->_numberOfSamplesDelivered = 0;
  }

  return v23;
}

- (HKMultiTypeSampleIterator)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 bufferSize:(int64_t)a5 healthStore:(id)a6
{
  return -[HKMultiTypeSampleIterator initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:bufferSize:limit:healthStore:](self, "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:bufferSize:limit:healthStore:", a3, a4, 0, 0, 0, a5, 0, a6);
}

- (BOOL)advanceWithError:(id *)a3
{
  _BOOL4 v6;
  HKSample *v7;
  HKSample *current;
  void *v9;

  v6 = -[HKMultiTypeSampleIterator _queryForNextPageIfNecessaryWithError:](self, "_queryForNextPageIfNecessaryWithError:");
  if (v6)
  {
    if (-[NSMutableArray count](self->_buffer, "count"))
    {
      -[NSMutableArray lastObject](self->_buffer, "lastObject");
      v7 = (HKSample *)objc_claimAutoreleasedReturnValue();
      current = self->_current;
      self->_current = v7;

      -[NSMutableArray removeLastObject](self->_buffer, "removeLastObject");
      ++self->_numberOfSamplesDelivered;
      LOBYTE(v6) = 1;
    }
    else
    {
      if (self->_state != 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMultiTypeSampleIterator.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_state == HKMultiTypeSampleIteratorStateComplete"));

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 900, CFSTR("Multi-type sample iterator is exhausted"));
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)object
{
  return self->_current;
}

- (HKSample)sample
{
  return self->_current;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKMultiTypeSampleIterator *v4;
  uint64_t v5;
  HKSampleIteratorQueryCursor *queryCursor;
  uint64_t v7;
  NSMutableArray *buffer;
  uint64_t v9;
  HKSample *current;

  v4 = -[HKMultiTypeSampleIterator initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:bufferSize:limit:healthStore:]([HKMultiTypeSampleIterator alloc], "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:bufferSize:limit:healthStore:", self->_queryDescriptors, self->_sortDescriptors, self->_followingAnchor, self->_upToAndIncludingAnchor, self->_distinctByKeyPaths, self->_bufferSize, self->_limit, self->_healthStore);
  v5 = -[HKSampleIteratorQueryCursor copy](self->_queryCursor, "copy");
  queryCursor = v4->_queryCursor;
  v4->_queryCursor = (HKSampleIteratorQueryCursor *)v5;

  v7 = -[NSMutableArray mutableCopy](self->_buffer, "mutableCopy");
  buffer = v4->_buffer;
  v4->_buffer = (NSMutableArray *)v7;

  v9 = -[HKSample copy](self->_current, "copy");
  current = v4->_current;
  v4->_current = (HKSample *)v9;

  v4->_state = self->_state;
  v4->_numberOfSamplesDelivered = self->_numberOfSamplesDelivered;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_queryCursor, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_distinctByKeyPaths, 0);
  objc_storeStrong((id *)&self->_upToAndIncludingAnchor, 0);
  objc_storeStrong((id *)&self->_followingAnchor, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
}

@end
