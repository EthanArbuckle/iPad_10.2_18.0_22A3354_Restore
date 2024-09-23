@implementation _CNJumpToMainQueueScheduler

- (void)performBlock:(id)a3
{
  -[_CNJumpToMainQueueScheduler performBlock:qualityOfService:](self, "performBlock:qualityOfService:", a3, 0);
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  dispatch_qos_class_t v10;
  void *v11;
  dispatch_block_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = MEMORY[0x1E0C80D38];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61___CNJumpToMainQueueScheduler_performBlock_qualityOfService___block_invoke;
  v15[3] = &unk_1E29B9BF8;
  v7 = v5;
  v16 = v7;
  v8 = v15;
  v9 = v8;
  v10 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v11 = _Block_copy(v8);
      goto LABEL_9;
    case 2uLL:
      v10 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      v10 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      v10 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
      goto LABEL_8;
    default:
      v10 = QOS_CLASS_DEFAULT;
LABEL_7:
      v12 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v10, 0, v8);
LABEL_8:
      v13 = v12;
      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      v14 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v11);

      return;
  }
}

- (id)performCancelableBlock:(id)a3
{
  return -[_CNJumpToMainQueueScheduler performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  CNMainQueueSchedulerCancelationToken *v6;
  id v7;
  CNMainQueueSchedulerCancelationToken *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  dispatch_qos_class_t v12;
  void *v13;
  dispatch_block_t v14;
  void *v15;
  void *v16;
  void *v17;
  CNMainQueueSchedulerCancelationToken *v18;
  _QWORD v20[4];
  CNMainQueueSchedulerCancelationToken *v21;
  id v22;

  v5 = a3;
  v6 = objc_alloc_init(CNMainQueueSchedulerCancelationToken);
  v7 = MEMORY[0x1E0C80D38];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71___CNJumpToMainQueueScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v20[3] = &unk_1E29B9380;
  v8 = v6;
  v21 = v8;
  v9 = v5;
  v22 = v9;
  v10 = v20;
  v11 = v10;
  v12 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v13 = _Block_copy(v10);
      goto LABEL_9;
    case 2uLL:
      v12 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      v12 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      v12 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v10);
      goto LABEL_8;
    default:
      v12 = QOS_CLASS_DEFAULT;
LABEL_7:
      v14 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v12, 0, v10);
LABEL_8:
      v15 = v14;
      objc_opt_self();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      v16 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v13);

      v17 = v22;
      v18 = v8;

      return v18;
  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return -[_CNJumpToMainQueueScheduler afterDelay:performBlock:qualityOfService:](self, "afterDelay:performBlock:qualityOfService:", a4, 0, a3);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v7;
  CNMainQueueSchedulerCancelationToken *v8;
  id v9;
  CNMainQueueSchedulerCancelationToken *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  dispatch_qos_class_t v14;
  void *v15;
  dispatch_block_t v16;
  void *v17;
  void *v18;
  void *v19;
  CNMainQueueSchedulerCancelationToken *v20;
  _QWORD v22[4];
  CNMainQueueSchedulerCancelationToken *v23;
  id v24;

  v7 = a4;
  v8 = objc_alloc_init(CNMainQueueSchedulerCancelationToken);
  v9 = MEMORY[0x1E0C80D38];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72___CNJumpToMainQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v22[3] = &unk_1E29B9380;
  v10 = v8;
  v23 = v10;
  v11 = v7;
  v24 = v11;
  v12 = v22;
  v13 = v12;
  v14 = QOS_CLASS_USER_INTERACTIVE;
  switch(a5)
  {
    case 0uLL:
      v15 = _Block_copy(v12);
      goto LABEL_9;
    case 2uLL:
      v14 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      v14 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      v14 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v12);
      goto LABEL_8;
    default:
      v14 = QOS_CLASS_DEFAULT;
LABEL_7:
      v16 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v14, 0, v12);
LABEL_8:
      v17 = v16;
      objc_opt_self();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      v18 = (void *)MEMORY[0x1E0C80D38];
      dispatch_after((unint64_t)a3, MEMORY[0x1E0C80D38], v15);

      v19 = v24;
      v20 = v10;

      return v20;
  }
}

- (double)timestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

@end
