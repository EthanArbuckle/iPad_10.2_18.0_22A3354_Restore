@implementation SUUILoadResourceOperation

- (id)_initSUUILoadResourceOperation
{
  SUUILoadResourceOperation *v2;
  NSLock *v3;
  NSLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUILoadResourceOperation;
  v2 = -[SUUILoadResourceOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v3;

  }
  return v2;
}

- (SUUILoadResourceOperation)initWithResourceRequest:(id)a3
{
  id v4;
  SUUILoadResourceOperation *v5;
  uint64_t v6;
  SUUIResourceRequest *request;

  v4 = a3;
  v5 = -[SUUILoadResourceOperation _initSUUILoadResourceOperation](self, "_initSUUILoadResourceOperation");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    request = v5->_request;
    v5->_request = (SUUIResourceRequest *)v6;

  }
  return v5;
}

- (SUUIClientContext)clientContext
{
  SUUIClientContext *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_clientContext;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  v4 = _Block_copy(v3);

  return v4;
}

- (SUUIResourceRequest)resourceRequest
{
  return self->_request;
}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;

  v5 = (SUUIClientContext *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_clientContext != v5)
    objc_storeStrong((id *)&self->_clientContext, a3);
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id outputBlock;
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_outputBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    outputBlock = self->_outputBlock;
    self->_outputBlock = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)main
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  id v3;

  -[SUUILoadResourceOperation outputBlock](self, "outputBlock");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, 0, 0);
    v2 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  }

}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUUILoadResourceOperation;
  -[SUUILoadResourceOperation cancel](&v2, sel_cancel);
}

- (int64_t)_loadReason
{
  return self->__loadReason;
}

- (void)_setLoadReason:(int64_t)a3
{
  self->__loadReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
