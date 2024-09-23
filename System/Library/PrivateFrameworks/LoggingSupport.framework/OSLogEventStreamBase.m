@implementation OSLogEventStreamBase

- (unsigned)invalidated
{
  return self->_invalidated;
}

- (id)streamHandler
{
  return self->_streamHandler;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OSLogEventStreamBase)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSLogEventStreamBase;
  v2 = -[OSLogEventStreamBase init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.loggingsupport.stream", 0);
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 2), *((dispatch_queue_t *)v2 + 3));
  }
  return (OSLogEventStreamBase *)v2;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  _OSLogPredicateMapper *v4;
  void *v5;
  NSPredicate *v6;
  NSPredicate *filterPredicate;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    v4 = -[_OSLogPredicateMapper initWithPredicate:]([_OSLogPredicateMapper alloc], "initWithPredicate:", v12);
    -[_OSLogPredicateMapper mappedPredicate](v4, "mappedPredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      -[_OSLogPredicateMapper validationErrors](v4, "validationErrors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "exceptionWithName:reason:userInfo:", CFSTR("OSLogInvalidPredicateException"), v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(objc_retainAutorelease(v11));
    }
    -[_OSLogPredicateMapper mappedPredicate](v4, "mappedPredicate");
    v6 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v6;

    -[NSPredicate allowEvaluation](self->_filterPredicate, "allowEvaluation");
    if ((-[_OSLogPredicateMapper flags](v4, "flags") & 2) != 0)
      self->_flags |= 1uLL;
    if ((-[_OSLogPredicateMapper flags](v4, "flags") & 1) != 0)
      self->_flags |= 2uLL;
  }
  else
  {
    v4 = (_OSLogPredicateMapper *)self->_filterPredicate;
    self->_filterPredicate = 0;
  }

}

- (unint64_t)flags
{
  return self->_flags;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__OSLogEventStreamBase_setInvalidationHandler___block_invoke;
  v7[3] = &unk_1E4157310;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setInvalidated:(unsigned int)a3
{
  self->_invalidated = a3;
}

uint64_t __40__OSLogEventStreamBase_setEventHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStreamHandler:", *(_QWORD *)(a1 + 40));
}

- (void)setStreamHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)invalidate
{
  unsigned int *p_invalidated;

  p_invalidated = &self->_invalidated;
  do
    __ldxr(p_invalidated);
  while (__stxr(1u, p_invalidated));
}

void __47__OSLogEventStreamBase_setInvalidationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_streamHandler, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setEventHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__OSLogEventStreamBase_setEventHandler___block_invoke;
  v7[3] = &unk_1E4157310;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

@end
