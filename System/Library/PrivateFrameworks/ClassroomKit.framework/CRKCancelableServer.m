@implementation CRKCancelableServer

- (CRKCancelableServer)initWithCancelableGenerator:(id)a3
{
  id v4;
  CRKCancelableServer *v5;
  uint64_t v6;
  id generator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKCancelableServer;
  v5 = -[CRKCancelableServer init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A226E8](v4);
    generator = v5->_generator;
    v5->_generator = (id)v6;

  }
  return v5;
}

- (id)makeCountedCancelable
{
  void *v4;
  void (**v5)(void);
  void *v6;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKCancelableServer.m"), 35, CFSTR("%@ must be called from the main thread"), v9);

  }
  -[CRKCancelableServer cachedCancelable](self, "cachedCancelable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CRKCancelableServer generator](self, "generator");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCancelableServer setCachedCancelable:](self, "setCachedCancelable:", v6);

  }
  -[CRKCancelableServer setClientCount:](self, "setClientCount:", -[CRKCancelableServer clientCount](self, "clientCount") + 1);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__CRKCancelableServer_makeCountedCancelable__block_invoke;
  v10[3] = &unk_24D9C7020;
  v10[4] = self;
  +[CRKBlockCancelable cancelableWithBlock:](CRKBlockCancelable, "cancelableWithBlock:", v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __44__CRKCancelableServer_makeCountedCancelable__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__CRKCancelableServer_makeCountedCancelable__block_invoke_2;
  v3[3] = &unk_24D9C7020;
  v3[4] = v1;
  return objc_msgSend(v1, "performBlockOnMainThreadIfNeeded:", v3);
}

uint64_t __44__CRKCancelableServer_makeCountedCancelable__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decrementClientCount");
}

- (void)performBlockOnMainThreadIfNeeded:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x24BDD17F0];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)decrementClientCount
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKCancelableServer.m"), 64, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (-[CRKCancelableServer clientCount](self, "clientCount") <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKCancelableServer.m"), 66, CFSTR("Invalid client count: %ld"), -[CRKCancelableServer clientCount](self, "clientCount"));

  }
  -[CRKCancelableServer setClientCount:](self, "setClientCount:", -[CRKCancelableServer clientCount](self, "clientCount") - 1);
  if (!-[CRKCancelableServer clientCount](self, "clientCount"))
  {
    -[CRKCancelableServer cachedCancelable](self, "cachedCancelable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[CRKCancelableServer setCachedCancelable:](self, "setCachedCancelable:", 0);
  }
}

- (id)generator
{
  return self->_generator;
}

- (CRKCancelable)cachedCancelable
{
  return self->_cachedCancelable;
}

- (void)setCachedCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCancelable, a3);
}

- (int64_t)clientCount
{
  return self->_clientCount;
}

- (void)setClientCount:(int64_t)a3
{
  self->_clientCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCancelable, 0);
  objc_storeStrong(&self->_generator, 0);
}

@end
