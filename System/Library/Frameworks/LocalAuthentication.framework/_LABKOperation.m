@implementation _LABKOperation

+ (id)_wrapperForBKOperation:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  __objc2_class **v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  char isKindOfClass;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a3;
  v7 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v8 = (void *)getBKMatchPearlOperationClass_softClass;
  v30 = getBKMatchPearlOperationClass_softClass;
  if (!getBKMatchPearlOperationClass_softClass)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __getBKMatchPearlOperationClass_block_invoke;
    v25 = &unk_1E70792C0;
    v26 = &v27;
    __getBKMatchPearlOperationClass_block_invoke((uint64_t)&v22);
    v8 = (void *)v28[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v27, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = off_1E7078950;
  }
  else
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v11 = (void *)getBKMatchOperationClass_softClass;
    v30 = getBKMatchOperationClass_softClass;
    if (!getBKMatchOperationClass_softClass)
    {
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __getBKMatchOperationClass_block_invoke;
      v25 = &unk_1E70792C0;
      v26 = &v27;
      __getBKMatchOperationClass_block_invoke((uint64_t)&v22);
      v11 = (void *)v28[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v27, 8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = off_1E7078948;
    }
    else
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x2050000000;
      v13 = (void *)getBKFaceDetectOperationClass_softClass;
      v30 = getBKFaceDetectOperationClass_softClass;
      if (!getBKFaceDetectOperationClass_softClass)
      {
        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __getBKFaceDetectOperationClass_block_invoke;
        v25 = &unk_1E70792C0;
        v26 = &v27;
        __getBKFaceDetectOperationClass_block_invoke((uint64_t)&v22);
        v13 = (void *)v28[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v27, 8);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = off_1E7078938;
      }
      else
      {
        v27 = 0;
        v28 = &v27;
        v29 = 0x2050000000;
        v15 = (void *)getBKFingerDetectOperationClass_softClass;
        v30 = getBKFingerDetectOperationClass_softClass;
        if (!getBKFingerDetectOperationClass_softClass)
        {
          v22 = MEMORY[0x1E0C809B0];
          v23 = 3221225472;
          v24 = __getBKFingerDetectOperationClass_block_invoke;
          v25 = &unk_1E70792C0;
          v26 = &v27;
          __getBKFingerDetectOperationClass_block_invoke((uint64_t)&v22);
          v15 = (void *)v28[3];
        }
        v16 = objc_retainAutorelease(v15);
        _Block_object_dispose(&v27, 8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = off_1E7078940;
        }
        else
        {
          v27 = 0;
          v28 = &v27;
          v29 = 0x2050000000;
          v17 = (void *)getBKPresenceDetectOperationClass_softClass;
          v30 = getBKPresenceDetectOperationClass_softClass;
          if (!getBKPresenceDetectOperationClass_softClass)
          {
            v22 = MEMORY[0x1E0C809B0];
            v23 = 3221225472;
            v24 = __getBKPresenceDetectOperationClass_block_invoke;
            v25 = &unk_1E70792C0;
            v26 = &v27;
            __getBKPresenceDetectOperationClass_block_invoke((uint64_t)&v22);
            v17 = (void *)v28[3];
          }
          v18 = objc_retainAutorelease(v17);
          _Block_object_dispose(&v27, 8);
          isKindOfClass = objc_opt_isKindOfClass();
          v10 = off_1E7078958;
          if ((isKindOfClass & 1) != 0)
            v10 = &off_1E7078960;
        }
      }
    }
  }
  v20 = (void *)objc_msgSend(objc_alloc(*v10), "_initWithBKOperation:device:", v6, v7);
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("wrapping %@ with %@"), v6, v20);

  return v20;
}

- (id)_initWithBKOperation:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  _LABKOperation *v9;
  _LABKOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_LABKOperation;
  v9 = -[_LABKOperation init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__BKOperation, a3);
    -[BKOperation setDelegate:](v10->__BKOperation, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_device, a4);
    v10->_state = 1;
    -[_LABKOperation shim](v10, "shim");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "biometricMethodState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LABKOperation setIsUserPresent:](v10, "setIsUserPresent:", objc_msgSend(v12, "isUserPresent"));

    -[_LABKOperation shim](v10, "shim");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_biometricMethodState);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v10, v14, 1, 0);

    -[_LABKOperation shim](v10, "shim");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_biometricMethodResult);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v10, v16, 1, 0);

  }
  return v10;
}

- (id)shim
{
  void *v2;
  void *v3;

  -[_LABKOperation device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shim");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setQueue:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_queue, a3);
  v5 = a3;
  -[_LABKOperation _BKOperation](self, "_BKOperation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueue:", v5);

}

- (void)dispatchDelegateSelector:(SEL)a3 block:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  void (**v11)(_QWORD);

  v5 = (void (**)(_QWORD))a4;
  -[_LABKOperation delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_LABKOperation queue](self, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_LABKOperation queue](self, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49___LABKOperation_dispatchDelegateSelector_block___block_invoke;
      block[3] = &unk_1E707AAA0;
      v11 = v5;
      dispatch_async(v9, block);

    }
    else
    {
      v5[2](v5);
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  char *v16;
  uint64_t *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  _LABKOperation *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  _LABKOperation *v29;

  v7 = a3;
  NSStringFromSelector(sel_biometricMethodState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[_LABKOperation shim](self, "shim");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "biometricMethodState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isUserPresent");
    v13 = -[_LABKOperation isUserPresent](self, "isUserPresent");

    if (v12 != v13)
    {
      -[_LABKOperation shim](self, "shim");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "biometricMethodState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LABKOperation setIsUserPresent:](self, "setIsUserPresent:", objc_msgSend(v15, "isUserPresent"));

      v16 = sel_operation_presenceStateChanged_;
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __65___LABKOperation_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v28 = &unk_1E707AAC8;
      v29 = self;
      v17 = &v25;
LABEL_6:
      -[_LABKOperation dispatchDelegateSelector:block:](self, "dispatchDelegateSelector:block:", v16, v17, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    NSStringFromSelector(sel_biometricMethodResult);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v7, "isEqualToString:", v18);

    if (v19)
    {
      -[_LABKOperation setState:](self, "setState:", 4);
      v16 = sel_operation_stateChanged_;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __65___LABKOperation_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v23 = &unk_1E707AAC8;
      v24 = self;
      v17 = &v20;
      goto LABEL_6;
    }
  }

}

- (BOOL)startWithError:(id *)a3
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  const __CFString *v11;

  v6 = objc_opt_class();
  -[_LABKOperation _BKOperation](self, "_BKOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", v6, a2, CFSTR("sync-starting operation %@"), v7);

  -[_LABKOperation _BKOperation](self, "_BKOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "startWithError:", a3);

  v10 = objc_opt_class();
  if ((v9 & 1) != 0)
  {
    v11 = CFSTR("YES");
  }
  else if (a3)
  {
    v11 = (const __CFString *)*a3;
  }
  else
  {
    v11 = CFSTR("error");
  }
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", v10, a2, CFSTR("started: %@"), v11);
  return v9;
}

- (void)startWithReply:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v5 = a3;
  v6 = objc_opt_class();
  -[_LABKOperation _BKOperation](self, "_BKOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", v6, a2, CFSTR("async-starting operation %@"), v7);

  -[_LABKOperation _BKOperation](self, "_BKOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33___LABKOperation_startWithReply___block_invoke;
  v10[3] = &unk_1E707AAF0;
  v11 = v5;
  v12 = a2;
  v10[4] = self;
  v9 = v5;
  objc_msgSend(v8, "startWithReply:", v10);

}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%d"), v7, a4);

  -[_LABKOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[_LABKOperation delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "operation:finishedWithReason:", self, a4);

  }
}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%d"), v7, a4);

  -[_LABKOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[_LABKOperation delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "operation:stateChanged:", self, a4);

  }
}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  char v11;
  id v12;

  v4 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  v9 = "NO";
  if (v4)
    v9 = "YES";
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", v8, a2, CFSTR("%@,%s"), v7, v9);

  -[_LABKOperation delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[_LABKOperation delegate](self, "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "operation:presenceStateChanged:", self, v4);

  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a3, CFSTR("forwarding to BK"));
  return -[_LABKOperation _BKOperation](self, "_BKOperation");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[_LABKOperation shim](self, "shim");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_biometricMethodState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, v4);

  -[_LABKOperation shim](self, "shim");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_biometricMethodResult);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, v6);

  v7.receiver = self;
  v7.super_class = (Class)_LABKOperation;
  -[_LABKOperation dealloc](&v7, sel_dealloc);
}

- (BKOperation)_BKOperation
{
  return self->__BKOperation;
}

- (_LABKDevice)device
{
  return self->_device;
}

- (BKOperationDelegate)delegate
{
  return (BKOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isUserPresent
{
  return self->_isUserPresent;
}

- (void)setIsUserPresent:(BOOL)a3
{
  self->_isUserPresent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->__BKOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
