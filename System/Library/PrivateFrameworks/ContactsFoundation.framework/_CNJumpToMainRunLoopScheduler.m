@implementation _CNJumpToMainRunLoopScheduler

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  CNMainRunLoopSchedulerCancelationToken *v6;
  __CFRunLoop *Main;
  const void *v8;
  CNMainRunLoopSchedulerCancelationToken *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  dispatch_qos_class_t v13;
  void *v14;
  dispatch_block_t v15;
  void *v16;
  __CFRunLoop *v17;
  void *v18;
  CNMainRunLoopSchedulerCancelationToken *v19;
  _QWORD v21[4];
  CNMainRunLoopSchedulerCancelationToken *v22;
  id v23;

  v5 = a3;
  v6 = objc_alloc_init(CNMainRunLoopSchedulerCancelationToken);
  Main = CFRunLoopGetMain();
  v8 = (const void *)*MEMORY[0x1E0C9B270];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73___CNJumpToMainRunLoopScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v21[3] = &unk_1E29B9380;
  v9 = v6;
  v22 = v9;
  v10 = v5;
  v23 = v10;
  v11 = v21;
  v12 = v11;
  v13 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v14 = _Block_copy(v11);
      goto LABEL_9;
    case 2uLL:
      v13 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      v13 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      v13 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v11);
      goto LABEL_8;
    default:
      v13 = QOS_CLASS_DEFAULT;
LABEL_7:
      v15 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v13, 0, v11);
LABEL_8:
      v16 = v15;
      objc_opt_self();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      CFRunLoopPerformBlock(Main, v8, v14);

      v17 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v17);
      v18 = v23;
      v19 = v9;

      return v19;
  }
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  __CFRunLoop *Main;
  const void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  dispatch_qos_class_t v11;
  void *v12;
  dispatch_block_t v13;
  void *v14;
  __CFRunLoop *v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  Main = CFRunLoopGetMain();
  v7 = (const void *)*MEMORY[0x1E0C9B270];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63___CNJumpToMainRunLoopScheduler_performBlock_qualityOfService___block_invoke;
  v16[3] = &unk_1E29B9BF8;
  v8 = v5;
  v17 = v8;
  v9 = v16;
  v10 = v9;
  v11 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v12 = _Block_copy(v9);
      goto LABEL_9;
    case 2uLL:
      v11 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      v11 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      v11 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
      goto LABEL_8;
    default:
      v11 = QOS_CLASS_DEFAULT;
LABEL_7:
      v13 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v11, 0, v9);
LABEL_8:
      v14 = v13;
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      CFRunLoopPerformBlock(Main, v7, v12);

      v15 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v15);

      return;
  }
}

- (void)performBlock:(id)a3
{
  -[_CNJumpToMainRunLoopScheduler performBlock:qualityOfService:](self, "performBlock:qualityOfService:", a3, 0);
}

+ (BOOL)isAvailable
{
  return CFRunLoopGetMain() != 0;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v6;
  CFAbsoluteTime v7;
  uint64_t v8;
  id v9;
  CFRunLoopTimerRef v10;
  __CFRunLoopTimer *v11;
  __CFRunLoop *Main;
  __CFRunLoopTimer *v13;
  CNMainRunLoopSchedulerCancelationToken *v14;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD block[4];
  id v20;

  v6 = a4;
  v7 = CFAbsoluteTimeGetCurrent() + a3;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74___CNJumpToMainRunLoopScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  block[3] = &unk_1E29BC308;
  v9 = v6;
  v20 = v9;
  v10 = CFRunLoopTimerCreateWithHandler(0, v7, 0.0, 0, 0, block);
  if (v10)
    v11 = (__CFRunLoopTimer *)CFAutorelease(v10);
  else
    v11 = 0;
  Main = CFRunLoopGetMain();
  CFRunLoopAddTimer(Main, v11, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  v13 = v11;
  v14 = objc_alloc_init(CNMainRunLoopSchedulerCancelationToken);
  objc_initWeak(&location, v13);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __74___CNJumpToMainRunLoopScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2;
  v16[3] = &unk_1E29BA1A8;
  objc_copyWeak(&v17, &location);
  -[CNCancelationToken addCancelationBlock:](v14, "addCancelationBlock:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v14;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return -[_CNJumpToMainRunLoopScheduler afterDelay:performBlock:qualityOfService:](self, "afterDelay:performBlock:qualityOfService:", a4, 0, a3);
}

- (id)performCancelableBlock:(id)a3
{
  return -[_CNJumpToMainRunLoopScheduler performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (double)timestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

@end
