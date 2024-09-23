@implementation _FMMainThreadScheduler

- (void)performBlock:(id)a3
{
  __CFRunLoop *Main;
  void (**block)(void);

  block = (void (**)(void))a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    block[2]();
  }
  else
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B280], block);
  }

}

- (id)performCancelableBlock:(id)a3
{
  void (**v3)(id, _QWORD);
  FMCancelationToken *v4;
  FMCancelationToken *v5;
  FMCancelationToken *v6;
  void *v7;
  __CFRunLoop *Main;
  _QWORD v10[4];
  FMCancelationToken *v11;
  void (**v12)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v3[2](v3, 0);
    v4 = objc_alloc_init(FMCancelationToken);
  }
  else
  {
    v5 = objc_alloc_init(FMCancelationToken);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49___FMMainThreadScheduler_performCancelableBlock___block_invoke;
    v10[3] = &unk_1E5E0DF08;
    v6 = v5;
    v11 = v6;
    v12 = v3;
    v7 = (void *)MEMORY[0x1AF455734](v10);
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B280], v7);
    v4 = v6;

  }
  return v4;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  FMCancelationToken *v10;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E88];
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50___FMMainThreadScheduler_afterDelay_performBlock___block_invoke;
  v15[3] = &unk_1E5E0DF30;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(FMCancelationToken);
  objc_initWeak(&location, v9);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __50___FMMainThreadScheduler_afterDelay_performBlock___block_invoke_2;
  v12[3] = &unk_1E5E0DF58;
  objc_copyWeak(&v13, &location);
  -[FMCancelationToken addCancelationBlock:](v10, "addCancelationBlock:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

@end
