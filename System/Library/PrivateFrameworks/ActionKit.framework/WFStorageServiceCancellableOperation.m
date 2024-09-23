@implementation WFStorageServiceCancellableOperation

- (WFStorageServiceCancellableOperation)initWithCancelBlock:(id)a3
{
  id v5;
  WFStorageServiceCancellableOperation *v6;
  uint64_t v7;
  id cancelBlock;
  WFStorageServiceCancellableOperation *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStorageServiceCancellableOperation.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cancelBlock"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFStorageServiceCancellableOperation;
  v6 = -[WFStorageServiceCancellableOperation init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    cancelBlock = v6->_cancelBlock;
    v6->_cancelBlock = (id)v7;

    v9 = v6;
  }

  return v6;
}

- (BOOL)isCancelled
{
  void *v2;
  BOOL v3;

  -[WFStorageServiceCancellableOperation cancelBlock](self, "cancelBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)cancel
{
  void (**v3)(void);

  -[WFStorageServiceCancellableOperation cancelBlock](self, "cancelBlock");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
    v3[2]();
  -[WFStorageServiceCancellableOperation setCancelBlock:](self, "setCancelBlock:", 0);

}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end
