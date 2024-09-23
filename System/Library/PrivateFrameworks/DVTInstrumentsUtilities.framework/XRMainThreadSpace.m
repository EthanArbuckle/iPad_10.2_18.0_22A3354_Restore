@implementation XRMainThreadSpace

- (XRMainThreadSpace)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  XRMainThreadSpace *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableSet *mainThreadOps;
  objc_super v15;

  objc_msgSend_mainQueue(MEMORY[0x24BDD1710], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)XRMainThreadSpace;
  v7 = -[XRSpace initWithQueue:](&v15, sel_initWithQueue_, v6);

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v12 = objc_msgSend_initWithCapacity_(v8, v9, 100, v10, v11);
    mainThreadOps = v7->_mainThreadOps;
    v7->_mainThreadOps = (NSMutableSet *)v12;

  }
  return v7;
}

- (XRMainThreadSpace)initWithQueue:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v3, v4);

  return 0;
}

- (id)spaceName
{
  return CFSTR("Main Thread Space");
}

- (BOOL)isSerial
{
  return 1;
}

- (void)_executeOp:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  if ((objc_msgSend_isFinished(v23, v3, v4, v5, v6) & 1) != 0
    || !objc_msgSend_isReady(v23, v7, v8, v9, v10))
  {
    NSLog(CFSTR("XRUISpace op has already run or is not really ready %@ #Developer"), v23);
  }
  else
  {
    objc_msgSend_start(v23, v11, v12, v13, v14);
    if (objc_msgSend_isConcurrent(v23, v15, v16, v17, v18))
      objc_msgSend_waitUntilFinished(v23, v19, v20, v21, v22);
  }

}

- (id)_activeRunLoopModes
{
  if (qword_25583C670 != -1)
    dispatch_once(&qword_25583C670, &unk_24EDC2A30);
  return (id)qword_25583C668;
}

- (void)_queueOperationToRunOnMainThread:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFRunLoop *CFRunLoop;
  id v26;

  v4 = (void *)MEMORY[0x24BDBCF18];
  v5 = a3;
  objc_msgSend_mainRunLoop(v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__activeRunLoopModes(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performSelector_target_argument_order_modes_(v10, v16, (uint64_t)sel__executeOp_, (uint64_t)self, (uint64_t)v5, 0, v15);

  objc_msgSend_mainRunLoop(MEMORY[0x24BDBCF18], v17, v18, v19, v20);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  CFRunLoop = (__CFRunLoop *)objc_msgSend_getCFRunLoop(v26, v21, v22, v23, v24);
  CFRunLoopWakeUp(CFRunLoop);

}

- (id)_scheduleOperationFromCurrentQueue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableSet *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableSet *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  if (objc_msgSend_supportsOpNames(self, v5, v6, v7, v8))
  {
    objc_msgSend_name(v4, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend_setName_(v4, v9, (uint64_t)CFSTR("UI space op"), v11, v12);
  }
  if ((objc_msgSend_isCancelled(v4, v9, v10, v11, v12) & 1) == 0)
  {
    if (objc_msgSend_isReady(v4, v14, v15, v16, v17))
    {
LABEL_10:
      objc_msgSend__queueOperationToRunOnMainThread_(self, v18, (uint64_t)v4, v19, v20);
      return v4;
    }
    v21 = self->_mainThreadOps;
    objc_sync_enter(v21);
    objc_msgSend_addObserver_forKeyPath_options_context_(v4, v22, (uint64_t)self, (uint64_t)CFSTR("isReady"), 1, qword_25583BF88);
    objc_msgSend_addObject_(self->_mainThreadOps, v23, (uint64_t)v4, v24, v25);
    objc_sync_exit(v21);

    if (objc_msgSend_isReady(v4, v26, v27, v28, v29))
    {
      v30 = self->_mainThreadOps;
      objc_sync_enter(v30);
      if (objc_msgSend_containsObject_(self->_mainThreadOps, v31, (uint64_t)v4, v32, v33))
      {
        objc_msgSend_addObserver_forKeyPath_options_context_(v4, v34, (uint64_t)self, (uint64_t)CFSTR("isReady"), 1, qword_25583BF88);
        objc_msgSend_removeObject_(self->_mainThreadOps, v35, (uint64_t)v4, v36, v37);
      }
      objc_sync_exit(v30);

      goto LABEL_10;
    }
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSMutableSet *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v15 = a5;
  if ((void *)qword_25583BF88 == a6)
  {
    if (objc_msgSend_isEqualToString_(v10, v12, (uint64_t)CFSTR("isReady"), v13, v14))
    {
      v16 = self->_mainThreadOps;
      objc_sync_enter(v16);
      if (objc_msgSend_containsObject_(self->_mainThreadOps, v17, (uint64_t)v11, v18, v19))
      {
        objc_msgSend__queueOperationToRunOnMainThread_(self, v20, (uint64_t)v11, v21, v22);
        objc_msgSend_removeObject_(self->_mainThreadOps, v23, (uint64_t)v11, v24, v25);
        objc_msgSend_removeObserver_forKeyPath_context_(v11, v26, (uint64_t)self, (uint64_t)CFSTR("isReady"), qword_25583BF88);
      }
      objc_sync_exit(v16);

    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)XRMainThreadSpace;
    -[XRSpace observeValueForKeyPath:ofObject:change:context:](&v27, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v15, a6);
  }

}

+ (XRMainThreadSpace)sharedInstance
{
  if (qword_25583C678 != -1)
    dispatch_once(&qword_25583C678, &unk_24EDC2E80);
  return (XRMainThreadSpace *)(id)qword_25583C680;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainThreadOps, 0);
}

@end
