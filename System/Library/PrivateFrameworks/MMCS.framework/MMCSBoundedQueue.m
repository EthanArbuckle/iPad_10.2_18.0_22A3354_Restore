@implementation MMCSBoundedQueue

- (MMCSBoundedQueue)initWithUpperBound:(unint64_t)a3
{
  MMCSBoundedQueue *v4;
  uint64_t v5;
  NSMutableArray *entries;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MMCSBoundedQueue;
  v4 = -[MMCSBoundedQueue init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    entries = v4->_entries;
    v4->_entries = (NSMutableArray *)v5;

    v4->_boundsExceeded = (dispatch_semaphore_s *)dispatch_semaphore_create(0);
    v4->_bytesUpperBound = a3;
    v4->_isValid = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[MMCSBoundedQueue invalidate](self, "invalidate");
  dispatch_release((dispatch_object_t)self->_boundsExceeded);
  v3.receiver = self;
  v3.super_class = (Class)MMCSBoundedQueue;
  -[MMCSBoundedQueue dealloc](&v3, sel_dealloc);
}

- (unint64_t)_sync_aggregateByteCount
{
  NSMutableArray *entries;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  entries = self->_entries;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MMCSBoundedQueue__sync_aggregateByteCount__block_invoke;
  v5[3] = &unk_1E95843A8;
  v5[4] = &v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__MMCSBoundedQueue__sync_aggregateByteCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "length");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (BOOL)_sync_isFull
{
  return -[MMCSBoundedQueue _sync_aggregateByteCount](self, "_sync_aggregateByteCount") > self->_bytesUpperBound;
}

- (void)addData:(id)a3
{
  id v4;
  NSMutableArray *v5;
  unint64_t v6;
  unint64_t bytesUpperBound;
  uint64_t v8;
  unint64_t bytesErrorLevel;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  NSMutableArray *v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isValid)
  {
    while (1)
    {
      v5 = self->_entries;
      objc_sync_enter(v5);
      v6 = -[MMCSBoundedQueue _sync_aggregateByteCount](self, "_sync_aggregateByteCount");
      objc_sync_exit(v5);

      bytesUpperBound = self->_bytesUpperBound;
      v8 = objc_msgSend(v4, "length");
      bytesErrorLevel = self->_bytesErrorLevel;
      if (bytesErrorLevel)
      {
        v10 = v8 + v6;
        if (v8 + v6 > bytesErrorLevel)
        {
          v11 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = self->_bytesErrorLevel;
            *(_DWORD *)buf = 134218240;
            v15 = v10;
            v16 = 2048;
            v17 = v12;
            _os_log_impl(&dword_1D3C3F000, v11, OS_LOG_TYPE_DEFAULT, "data size %llu exceeded error level %llu", buf, 0x16u);
          }
        }
      }
      if (v6 <= bytesUpperBound)
        break;
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_boundsExceeded, 0xFFFFFFFFFFFFFFFFLL);
      if (!self->_isValid)
        goto LABEL_11;
    }
    if (self->_isValid)
    {
      v13 = self->_entries;
      objc_sync_enter(v13);
      -[NSMutableArray addObject:](self->_entries, "addObject:", v4);
      objc_sync_exit(v13);

    }
  }
LABEL_11:

}

- (void)removeNextDataWithBlock:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  NSMutableArray *v6;
  _BOOL4 v7;
  BOOL v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  if (!v9)
    -[MMCSBoundedQueue removeNextDataWithBlock:].cold.1();
  v4 = self->_entries;
  objc_sync_enter(v4);
  -[NSMutableArray firstObject](self->_entries, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  if (v5)
  {
    v9[2](v9, v5);
    v6 = self->_entries;
    objc_sync_enter(v6);
    -[NSMutableArray firstObject](self->_entries, "firstObject");
    if ((void *)objc_claimAutoreleasedReturnValue() != v5)
      __assert_rtn("-[MMCSBoundedQueue removeNextDataWithBlock:]", "MMCSBoundedQueue.m", 91, "[_entries firstObject] == firstData");

    v7 = -[MMCSBoundedQueue _sync_isFull](self, "_sync_isFull");
    -[NSMutableArray removeObjectAtIndex:](self->_entries, "removeObjectAtIndex:", 0);
    if (v7)
    {
      v8 = -[MMCSBoundedQueue _sync_isFull](self, "_sync_isFull");
      objc_sync_exit(v6);

      if (!v8)
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_boundsExceeded);
    }
    else
    {
      objc_sync_exit(v6);

    }
  }

}

- (void)invalidate
{
  MMCSBoundedQueue *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_isValid)
  {
    obj->_isValid = 0;
    objc_sync_exit(obj);

    dispatch_semaphore_signal((dispatch_semaphore_t)obj->_boundsExceeded);
  }
  else
  {
    objc_sync_exit(obj);

  }
}

- (unint64_t)bytesUpperBound
{
  return self->_bytesUpperBound;
}

- (unint64_t)bytesErrorLevel
{
  return self->_bytesErrorLevel;
}

- (void)setBytesErrorLevel:(unint64_t)a3
{
  self->_bytesErrorLevel = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (dispatch_semaphore_s)boundsExceeded
{
  return self->_boundsExceeded;
}

- (void)setBoundsExceeded:(dispatch_semaphore_s *)a3
{
  self->_boundsExceeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

- (void)removeNextDataWithBlock:.cold.1()
{
  __assert_rtn("-[MMCSBoundedQueue removeNextDataWithBlock:]", "MMCSBoundedQueue.m", 82, "block");
}

@end
