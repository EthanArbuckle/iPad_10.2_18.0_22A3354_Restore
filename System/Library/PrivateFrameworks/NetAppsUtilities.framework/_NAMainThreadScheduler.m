@implementation _NAMainThreadScheduler

- (void)performBlock:(id)a3
{
  __CFRunLoop *Main;
  __CFRunLoop *v4;
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
    v4 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v4);
  }

}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NACancelationToken *v11;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[4];
  id v17;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E88];
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50___NAMainThreadScheduler_afterDelay_performBlock___block_invoke;
  v16[3] = &unk_1E6227E98;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v6, "timerWithTimeInterval:repeats:block:", 0, v16, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTimer:forMode:", v9, *MEMORY[0x1E0C99748]);

  v11 = objc_alloc_init(NACancelationToken);
  objc_initWeak(&location, v9);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __50___NAMainThreadScheduler_afterDelay_performBlock___block_invoke_2;
  v13[3] = &unk_1E6227E00;
  objc_copyWeak(&v14, &location);
  -[NACancelationToken addCancelationBlock:](v11, "addCancelationBlock:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

- (id)performCancelableBlock:(id)a3
{
  void (**v3)(id, NACancelationToken *);
  NACancelationToken *v4;
  __CFRunLoop *Main;
  const void *v6;
  _QWORD v8[4];
  NACancelationToken *v9;
  void (**v10)(id, NACancelationToken *);

  v3 = (void (**)(id, NACancelationToken *))a3;
  v4 = objc_alloc_init(NACancelationToken);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v3[2](v3, v4);
  }
  else
  {
    Main = CFRunLoopGetMain();
    v6 = (const void *)*MEMORY[0x1E0C9B280];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49___NAMainThreadScheduler_performCancelableBlock___block_invoke;
    v8[3] = &unk_1E6227E70;
    v9 = v4;
    v10 = v3;
    CFRunLoopPerformBlock(Main, v6, v8);

  }
  return v4;
}

@end
