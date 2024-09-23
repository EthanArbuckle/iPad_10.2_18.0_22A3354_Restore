@implementation _CNImmediateScheduler

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  dispatch_qos_class_t v8;
  void (**v9)(_QWORD);
  dispatch_block_t v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = (void *)MEMORY[0x194004260]();
  v7 = v5;
  v12 = v7;
  v8 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v9 = (void (**)(_QWORD))_Block_copy(v7);
      goto LABEL_9;
    case 2uLL:
      v8 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      v8 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      v8 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
      goto LABEL_8;
    default:
      v8 = QOS_CLASS_DEFAULT;
LABEL_7:
      v10 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v8, 0, v7);
LABEL_8:
      v11 = v10;
      objc_opt_self();
      v9 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

LABEL_9:
      v9[2](v9);

      objc_autoreleasePoolPop(v6);
      return;
  }
}

- (void)performBlock:(id)a3
{
  -[_CNImmediateScheduler performBlock:qualityOfService:](self, "performBlock:qualityOfService:", a3, 0);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  CNImmediateSchedulerCancelationToken *v6;
  id v7;
  CNImmediateSchedulerCancelationToken *v8;
  _QWORD *v9;
  void *v10;
  dispatch_qos_class_t v11;
  void (**v12)(_QWORD);
  dispatch_block_t v13;
  void *v14;
  CNImmediateSchedulerCancelationToken *v15;
  CNImmediateSchedulerCancelationToken *v16;
  _QWORD v18[4];
  CNImmediateSchedulerCancelationToken *v19;
  id v20;

  v5 = a3;
  v6 = objc_alloc_init(CNImmediateSchedulerCancelationToken);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65___CNImmediateScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v18[3] = &unk_1E29B8D88;
  v7 = v5;
  v20 = v7;
  v8 = v6;
  v19 = v8;
  v9 = v18;
  v10 = v9;
  v11 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v12 = (void (**)(_QWORD))_Block_copy(v9);
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
      v12 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

LABEL_9:
      v12[2](v12);

      v15 = v19;
      v16 = v8;

      return v16;
  }
}

- (id)performCancelableBlock:(id)a3
{
  return -[_CNImmediateScheduler performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (double)timestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return -[_CNImmediateScheduler afterDelay:performBlock:qualityOfService:](self, "afterDelay:performBlock:qualityOfService:", a4, 0, a3);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  void *v8;
  id v9;

  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = a4;
  objc_msgSend(v8, "sleepForTimeInterval:", a3);
  -[_CNImmediateScheduler performBlock:qualityOfService:](self, "performBlock:qualityOfService:", v9, a5);

  return objc_alloc_init(CNImmediateSchedulerCancelationToken);
}

@end
