@implementation _CNInlineScheduler

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v4 = (void *)MEMORY[0x194004260]();
  v5[2]();
  objc_autoreleasePoolPop(v4);

}

- (void)performBlock:(id)a3
{
  -[_CNInlineScheduler performBlock:qualityOfService:](self, "performBlock:qualityOfService:", a3, 0);
}

- (id)performCancelableBlock:(id)a3
{
  return -[_CNInlineScheduler performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  void (**v4)(id, CNInlineSchedulerCancelationToken *);
  CNInlineSchedulerCancelationToken *v5;
  void *v6;

  v4 = (void (**)(id, CNInlineSchedulerCancelationToken *))a3;
  v5 = objc_alloc_init(CNInlineSchedulerCancelationToken);
  v6 = (void *)MEMORY[0x194004260]();
  v4[2](v4, v5);
  objc_autoreleasePoolPop(v6);

  return v5;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return -[_CNInlineScheduler afterDelay:performBlock:qualityOfService:](self, "afterDelay:performBlock:qualityOfService:", a4, 0, a3);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  CFAbsoluteTime Current;
  __CFRunLoopTimer *v11;
  __CFRunLoop *v12;
  __CFRunLoopTimer *v13;
  CNInlineSchedulerCancelationToken *v14;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD aBlock[4];
  id v20;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___CNInlineScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  aBlock[3] = &unk_1E29BC308;
  v8 = v6;
  v20 = v8;
  v9 = _Block_copy(aBlock);
  Current = CFAbsoluteTimeGetCurrent();
  v11 = CFRunLoopTimerCreateWithHandler(0, Current + a3, 0.0, 0, 0, v9);
  v12 = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(v12, v11, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  v13 = v11;
  v14 = objc_alloc_init(CNInlineSchedulerCancelationToken);
  objc_initWeak(&location, v13);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __63___CNInlineScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2;
  v16[3] = &unk_1E29BA1A8;
  objc_copyWeak(&v17, &location);
  -[CNCancelationToken addCancelationBlock:](v14, "addCancelationBlock:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v14;
}

- (double)timestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

@end
