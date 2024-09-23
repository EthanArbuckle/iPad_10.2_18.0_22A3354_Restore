@implementation _ASWebsiteNameFetchOperation

- (_ASWebsiteNameFetchOperation)initWithDomain:(id)a3 metadataEntry:(id)a4 provider:(id)a5
{
  id v8;
  id v9;
  id v10;
  _ASWebsiteNameFetchOperation *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  uint64_t v18;
  NSString *domain;
  _ASWebsiteNameFetchOperation *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_ASWebsiteNameFetchOperation;
  v11 = -[_ASWebsiteNameFetchOperation init](&v22, sel_init);
  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.SafariCore.%@.%p"), v14, v11);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

    v18 = objc_msgSend(v8, "copy");
    domain = v11->_domain;
    v11->_domain = (NSString *)v18;

    objc_storeStrong((id *)&v11->_metadataEntry, a4);
    objc_storeWeak((id *)&v11->_provider, v10);
    -[_ASWebsiteNameFetchOperation setName:](v11, "setName:", v8);
    v20 = v11;
  }

  return v11;
}

- (_ASWebsiteNameFetchOperation)init
{

  return 0;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASWebsiteNameFetchOperation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_ASWebsiteNameFetchOperation isFinished](self, "isFinished"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[_ASWebsiteNameFetchOperation isReady](self, "isReady"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[_ASWebsiteNameFetchOperation isCancelled](self, "isCancelled"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[_ASWebsiteNameFetchOperation isExecuting](self, "isExecuting"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = %@, isFinished = %@; isReady = %@; isCancelled = %@; isExecuting = %@ >"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isFinished
{
  _ASWebsiteNameFetchOperation *v2;
  BOOL isFinished;

  v2 = self;
  objc_sync_enter(v2);
  isFinished = v2->_state.isFinished;
  objc_sync_exit(v2);

  return isFinished;
}

- (BOOL)isExecuting
{
  _ASWebsiteNameFetchOperation *v2;
  BOOL isExecuting;

  v2 = self;
  objc_sync_enter(v2);
  isExecuting = v2->_state.isExecuting;
  objc_sync_exit(v2);

  return isExecuting;
}

- (BOOL)isCancelled
{
  _ASWebsiteNameFetchOperation *v2;
  BOOL isCancelled;

  v2 = self;
  objc_sync_enter(v2);
  isCancelled = v2->_state.isCancelled;
  objc_sync_exit(v2);

  return isCancelled;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  NSObject *queue;
  _ASWebsiteNameFetchOperation *obj;
  _QWORD block[5];

  obj = self;
  objc_sync_enter(obj);
  if (obj->_state.isCancelled)
  {
    -[_ASWebsiteNameFetchOperation _finish](obj, "_finish");
    objc_sync_exit(obj);

  }
  else
  {
    -[_ASWebsiteNameFetchOperation willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("isExecuting"));
    obj->_state.isExecuting = 1;
    -[_ASWebsiteNameFetchOperation didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("isExecuting"));
    objc_sync_exit(obj);

    queue = obj->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37___ASWebsiteNameFetchOperation_start__block_invoke;
    block[3] = &unk_24C94F558;
    block[4] = obj;
    dispatch_async(queue, block);
  }
}

- (void)cancel
{
  _ASWebsiteNameFetchOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_state.isCancelled)
  {
    -[_ASWebsiteNameFetchOperation willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("isCancelled"));
    obj->_state.isCancelled = 1;
    -[_ASWebsiteNameFetchOperation didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("isCancelled"));
    -[_ASWebsiteNameFetchOperation _finish](obj, "_finish");
  }
  objc_sync_exit(obj);

}

- (void)_run
{
  id WeakRetained;
  void *v4;
  NSString *domain;
  _ASWebsiteNameFetchOperation *v6;
  _QWORD v7[4];
  id v8;
  _ASWebsiteNameFetchOperation *v9;

  if (!-[_ASWebsiteNameFetchOperation isCancelled](self, "isCancelled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    if (WeakRetained)
    {
      v4 = (void *)objc_opt_class();
      domain = self->_domain;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __36___ASWebsiteNameFetchOperation__run__block_invoke;
      v7[3] = &unk_24C950EC0;
      v8 = WeakRetained;
      v9 = self;
      objc_msgSend(v4, "fetchWebsiteNameForDomain:completionHandler:", domain, v7);

    }
    else
    {
      v6 = self;
      objc_sync_enter(v6);
      -[_ASWebsiteNameFetchOperation _finish](v6, "_finish");
      objc_sync_exit(v6);

    }
  }
}

- (void)_finish
{
  $7DA13D014234B9CC3D340B8E17097BAF *p_state;
  _BOOL4 isFinished;
  _BOOL4 isExecuting;

  p_state = &self->_state;
  isFinished = self->_state.isFinished;
  isExecuting = self->_state.isExecuting;
  if (self->_state.isFinished)
  {
    if (self->_state.isExecuting)
      goto LABEL_3;
  }
  else
  {
    -[_ASWebsiteNameFetchOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    if (isExecuting)
    {
LABEL_3:
      -[_ASWebsiteNameFetchOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
      *(_WORD *)&p_state->isExecuting = 256;
      -[_ASWebsiteNameFetchOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
      if (isFinished)
        return;
LABEL_7:
      -[_ASWebsiteNameFetchOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
      return;
    }
  }
  *(_WORD *)&p_state->isExecuting = 256;
  if (!isFinished)
    goto LABEL_7;
}

- (NSString)domain
{
  return self->_domain;
}

- (WBSPasswordManagerWebsiteMetadataEntry)metadataEntry
{
  return self->_metadataEntry;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_metadataEntry, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
