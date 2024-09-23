@implementation MTExpiringFuture

- (MTExpiringFuture)initWithTimeout:(double)a3
{
  MTExpiringFuture *v4;
  MTExpiringFuture *v5;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD block[4];
  MTExpiringFuture *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTExpiringFuture;
  v4 = -[MTExpiringFuture init](&v12, sel_init);
  v5 = v4;
  if (a3 > 0.0 && v4 != 0)
  {
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__MTExpiringFuture_initWithTimeout___block_invoke;
    block[3] = &unk_1E39CB858;
    v11 = v5;
    dispatch_after(v7, v8, block);

  }
  return v5;
}

void __36__MTExpiringFuture_initWithTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_timeoutError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v3);

  }
}

@end
