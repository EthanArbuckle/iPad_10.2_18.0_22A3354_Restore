@implementation EFImmediateScheduler

- (void)performBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)performSyncBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)performSyncBarrierBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)performVoucherPreservingBlock:(id)a3
{
  dispatch_block_perform(DISPATCH_BLOCK_ASSIGN_CURRENT, a3);
}

- (id)performCancelableBlock:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  return 0;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  void (**v5)(_QWORD);

  v5 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", a3);
  v5[2](v5);

  return 0;
}

- (id)performWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "onScheduler:performWithObject:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
