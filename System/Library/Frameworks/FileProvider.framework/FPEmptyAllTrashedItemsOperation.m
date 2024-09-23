@implementation FPEmptyAllTrashedItemsOperation

- (FPEmptyAllTrashedItemsOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPEmptyAllTrashedItemsOperation;
  return -[FPActionOperation initWithProvider:action:](&v3, sel_initWithProvider_action_, 0, 0);
}

- (void)actionMain
{
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newTrashCollection");

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("trash enumeration", v5);
  objc_msgSend(v4, "setWorkingQueue:", v6);

  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "workingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FPEmptyAllTrashedItemsOperation_actionMain__block_invoke;
  block[3] = &unk_1E444A308;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, block);

}

uint64_t __45__FPEmptyAllTrashedItemsOperation_actionMain__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startObserving");
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  FPDeleteOperation *v8;
  void *v9;
  _QWORD v10[5];

  v5 = a3;
  if (self->_gatheredItems)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPEmptyAllTrashedItems.m"), 68, CFSTR("received this callback twice"));

  }
  self->_gatheredItems = 1;
  objc_msgSend(v5, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopObserving");
  if (objc_msgSend(v7, "count"))
  {
    v8 = -[FPDeleteOperation initWithItems:]([FPDeleteOperation alloc], "initWithItems:", v7);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__FPEmptyAllTrashedItemsOperation_dataForCollectionShouldBeReloaded___block_invoke;
    v10[3] = &unk_1E444A598;
    v10[4] = self;
    -[FPActionOperation setActionCompletionBlock:](v8, "setActionCompletionBlock:", v10);
    +[FPItemManager defaultManager](FPItemManager, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scheduleAction:", v8);

  }
  else
  {
    -[FPOperation completedWithResult:error:](self, "completedWithResult:error:", 0, 0);
  }

}

uint64_t __69__FPEmptyAllTrashedItemsOperation_dataForCollectionShouldBeReloaded___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

@end
