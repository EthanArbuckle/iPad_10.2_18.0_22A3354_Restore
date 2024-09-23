@implementation _CNSynchronousQueueScheduler

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  dispatch_qos_class_t v10;
  void *v11;
  dispatch_block_t v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x194004260]();
  queue = self->_queue;
  v9 = v6;
  v14 = v9;
  v10 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v11 = _Block_copy(v9);
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
      v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
      goto LABEL_8;
    default:
      v10 = QOS_CLASS_DEFAULT;
LABEL_7:
      v12 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v10, 0, v9);
LABEL_8:
      v13 = v12;
      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      dispatch_sync(queue, v11);

      objc_autoreleasePoolPop(v7);
      return;
  }
}

- (void)performBlock:(id)a3
{
  -[_CNSynchronousQueueScheduler performBlock:qualityOfService:](self, "performBlock:qualityOfService:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (_CNSynchronousQueueScheduler)initWithQueue:(id)a3
{
  id v5;
  _CNSynchronousQueueScheduler *v6;
  _CNSynchronousQueueScheduler *v7;
  _CNSynchronousQueueScheduler *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNSynchronousQueueScheduler;
  v6 = -[_CNSynchronousQueueScheduler init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (id)performCancelableBlock:(id)a3
{
  return -[_CNSynchronousQueueScheduler performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  SynchronousQueueSchedulerCancelationToken *v7;
  NSObject *queue;
  id v9;
  SynchronousQueueSchedulerCancelationToken *v10;
  _QWORD *v11;
  void *v12;
  dispatch_qos_class_t v13;
  void *v14;
  dispatch_block_t v15;
  void *v16;
  SynchronousQueueSchedulerCancelationToken *v17;
  SynchronousQueueSchedulerCancelationToken *v18;
  _QWORD v20[4];
  SynchronousQueueSchedulerCancelationToken *v21;
  id v22;

  v6 = a3;
  v7 = objc_alloc_init(SynchronousQueueSchedulerCancelationToken);
  queue = self->_queue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72___CNSynchronousQueueScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v20[3] = &unk_1E29B8D88;
  v9 = v6;
  v22 = v9;
  v10 = v7;
  v21 = v10;
  v11 = v20;
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
      dispatch_sync(queue, v14);

      v17 = v21;
      v18 = v10;

      return v18;
  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return -[_CNSynchronousQueueScheduler afterDelay:performBlock:qualityOfService:](self, "afterDelay:performBlock:qualityOfService:", a4, 0, a3);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD *v11;
  void *v12;
  dispatch_qos_class_t v13;
  void *v14;
  dispatch_block_t v15;
  void *v16;
  SynchronousQueueSchedulerCancelationToken *v17;
  _QWORD v19[4];
  id v20;
  double v21;

  v8 = a4;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73___CNSynchronousQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v19[3] = &unk_1E29B8DB0;
  v21 = a3;
  v10 = v8;
  v20 = v10;
  v11 = v19;
  v12 = v11;
  v13 = QOS_CLASS_USER_INTERACTIVE;
  switch(a5)
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
      dispatch_sync(queue, v14);

      v17 = objc_alloc_init(SynchronousQueueSchedulerCancelationToken);
      return v17;
  }
}

- (double)timestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

@end
