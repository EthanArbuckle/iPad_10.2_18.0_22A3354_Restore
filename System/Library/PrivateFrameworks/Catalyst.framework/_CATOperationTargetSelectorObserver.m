@implementation _CATOperationTargetSelectorObserver

- (_CATOperationTargetSelectorObserver)init
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 673, CFSTR("%@: %@ is unavailable"), v6, v7);

  return 0;
}

- (_CATOperationTargetSelectorObserver)initWithTarget:(id)a3 selector:(SEL)a4 events:(unint64_t)a5 userInfo:(id)a6 delegateQueue:(id)a7
{
  id v14;
  id v15;
  NSObject *v16;
  _CATOperationTargetSelectorObserver *v17;
  _CATOperationTargetSelectorObserver *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *delegateQueue;
  NSObject *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  objc_super v30;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  if (v14)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 680, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 681, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sel"));

LABEL_3:
  v30.receiver = self;
  v30.super_class = (Class)_CATOperationTargetSelectorObserver;
  v17 = -[_CATOperationTargetSelectorObserver init](&v30, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong(&v17->_target, a3);
    v18->_selector = a4;
    v18->_events = a5;
    objc_storeStrong(&v18->_userInfo, a6);
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = objc_opt_class();
    NSStringFromSelector(a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.%p.%p.%@"), v20, v18, v14, v21);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = dispatch_queue_create((const char *)objc_msgSend(v22, "UTF8String"), 0);
    delegateQueue = v18->_delegateQueue;
    v18->_delegateQueue = (OS_dispatch_queue *)v23;

    v25 = v18->_delegateQueue;
    if (v16)
    {
      dispatch_set_target_queue((dispatch_object_t)v18->_delegateQueue, v16);
    }
    else
    {
      dispatch_get_global_queue(21, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      dispatch_set_target_queue(v25, v26);

    }
  }

  return v18;
}

- (void)operationDidStart:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[_CATOperationTargetSelectorObserver events](self, "events") & 1) != 0)
    -[_CATOperationTargetSelectorObserver invokeActionWithOperation:](self, "invokeActionWithOperation:", v4);

}

- (void)operationDidProgress:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[_CATOperationTargetSelectorObserver events](self, "events") & 8) != 0)
    -[_CATOperationTargetSelectorObserver invokeActionWithOperation:](self, "invokeActionWithOperation:", v4);

}

- (void)operationDidFinish:(id)a3
{
  _BOOL4 v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[_CATOperationTargetSelectorObserver events](self, "events") & 4) != 0)
  {
    objc_msgSend(v8, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  else
  {
    v4 = 0;
  }
  if ((-[_CATOperationTargetSelectorObserver events](self, "events") & 2) != 0)
  {
    objc_msgSend(v8, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == 0;

  }
  else
  {
    v6 = 0;
  }
  if (v4 || v6)
    -[_CATOperationTargetSelectorObserver invokeActionWithOperation:](self, "invokeActionWithOperation:", v8);

}

- (void)invokeActionWithOperation:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  -[_CATOperationTargetSelectorObserver delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65___CATOperationTargetSelectorObserver_invokeActionWithOperation___block_invoke;
  v9[3] = &unk_24C1C5C00;
  v9[4] = self;
  v10 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_24C1C5998;
  v12 = v7;
  v8 = v4;
  dispatch_async(v5, block);

}

- (id)target
{
  return self->_target;
}

- (SEL)selector
{
  return self->_selector;
}

- (unint64_t)events
{
  return self->_events;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
