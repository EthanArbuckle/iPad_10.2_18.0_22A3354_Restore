@implementation _CNQueueScheduler

- (void)performBlock:(id)a3
{
  -[_CNQueueScheduler performBlock:qualityOfService:](self, "performBlock:qualityOfService:", a3, 0);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  CNQueueSchedulerCancelationToken *v7;
  NSObject *v8;
  CNQueueSchedulerCancelationToken *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  dispatch_qos_class_t v13;
  void *v14;
  dispatch_block_t v15;
  void *v16;
  void *v17;
  CNQueueSchedulerCancelationToken *v18;
  _QWORD v20[4];
  CNQueueSchedulerCancelationToken *v21;
  id v22;

  v6 = a3;
  v7 = objc_alloc_init(CNQueueSchedulerCancelationToken);
  -[_CNQueueScheduler _queueForQualityOfService:](self, "_queueForQualityOfService:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61___CNQueueScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v20[3] = &unk_1E29B9380;
  v9 = v7;
  v21 = v9;
  v10 = v6;
  v22 = v10;
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
      dispatch_async(v8, v14);

      v17 = v22;
      v18 = v9;

      return v18;
  }
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  dispatch_qos_class_t v9;
  void *v10;
  dispatch_block_t v11;
  void *v12;
  id v13;

  v6 = a3;
  -[_CNQueueScheduler _queueForQualityOfService:](self, "_queueForQualityOfService:", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v13 = v8;
  v9 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v10 = _Block_copy(v8);
      goto LABEL_9;
    case 2uLL:
      v9 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      v9 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      v9 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
      goto LABEL_8;
    default:
      v9 = QOS_CLASS_DEFAULT;
LABEL_7:
      v11 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v9, 0, v8);
LABEL_8:
      v12 = v11;
      objc_opt_self();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      dispatch_async(v7, v10);

      return;
  }
}

- (id)_queueForQualityOfService:(unint64_t)a3
{
  void *v5;
  void *v6;
  intptr_t v7;

  -[_CNQueueScheduler queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_CNQueueScheduler queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 - 1 > 4)
      v7 = 0;
    else
      v7 = qword_18F890FC0[a3 - 1];
    dispatch_get_global_queue(v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  CNDispatchSource *v11;
  dispatch_time_t v12;
  uint64_t v13;
  id v14;
  CNDispatchSource *v15;
  _QWORD *v16;
  void *v17;
  dispatch_qos_class_t v18;
  void *v19;
  dispatch_block_t v20;
  void *v21;
  CNQueueSchedulerCancelationToken *v22;
  CNDispatchSource *v23;
  _QWORD v25[4];
  CNDispatchSource *v26;
  _QWORD v27[4];
  CNDispatchSource *v28;
  id v29;

  v8 = a4;
  -[_CNQueueScheduler _queueForQualityOfService:](self, "_queueForQualityOfService:", a5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);

  v11 = -[CNDispatchSource initWithSource:]([CNDispatchSource alloc], "initWithSource:", v10);
  if (a3 <= 1.84467441e10)
    v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  else
    v12 = -1;
  dispatch_source_set_timer(v10, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __62___CNQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v27[3] = &unk_1E29B8D88;
  v14 = v8;
  v29 = v14;
  v15 = v11;
  v28 = v15;
  v16 = v27;
  v17 = v16;
  v18 = QOS_CLASS_USER_INTERACTIVE;
  switch(a5)
  {
    case 0uLL:
      v19 = _Block_copy(v16);
      goto LABEL_12;
    case 2uLL:
      v18 = QOS_CLASS_BACKGROUND;
      goto LABEL_10;
    case 3uLL:
      v18 = QOS_CLASS_UTILITY;
      goto LABEL_10;
    case 4uLL:
      v18 = QOS_CLASS_USER_INITIATED;
      goto LABEL_10;
    case 5uLL:
      goto LABEL_10;
    case 6uLL:
      v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v16);
      goto LABEL_11;
    default:
      v18 = QOS_CLASS_DEFAULT;
LABEL_10:
      v20 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v18, 0, v16);
LABEL_11:
      v21 = v20;
      objc_opt_self();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      dispatch_source_set_event_handler(v10, v19);

      v22 = objc_alloc_init(CNQueueSchedulerCancelationToken);
      v25[0] = v13;
      v25[1] = 3221225472;
      v25[2] = __62___CNQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2;
      v25[3] = &unk_1E29B9358;
      v26 = v15;
      v23 = v15;
      -[CNCancelationToken addCancelationBlock:](v22, "addCancelationBlock:", v25);
      dispatch_resume(v10);

      return v22;
  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return -[_CNQueueScheduler afterDelay:performBlock:qualityOfService:](self, "afterDelay:performBlock:qualityOfService:", a4, 0, a3);
}

- (_CNQueueScheduler)initWithQueue:(id)a3
{
  id v5;
  _CNQueueScheduler *v6;
  _CNQueueScheduler *v7;
  _CNQueueScheduler *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNQueueScheduler;
  v6 = -[_CNQueueScheduler init](&v10, sel_init);
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
  return -[_CNQueueScheduler performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (double)timestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

@end
