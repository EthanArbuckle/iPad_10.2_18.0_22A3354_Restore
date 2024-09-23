@implementation GTTransportSource_replayer

- (GTTransportSource_replayer)init
{
  -[GTTransportSource_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)_initWithQueue:(id)a3 transport:(id)a4
{
  GTTransportSource_replayer *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *queue;
  NSObject *v13;
  const char *v14;
  FILE *v15;
  const __CFString *v16;
  _QWORD block[5];
  objc_super v18;
  uint8_t buf[16];

  if (!a3)
  {
    if (s_logUsingOsLog)
    {
      v13 = gt_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "fail: queue cannot be NULL";
        goto LABEL_12;
      }
LABEL_16:
      abort();
    }
    v15 = __stderrp;
    v16 = CFSTR("fail: queue cannot be NULL");
LABEL_15:
    fprintf(v15, "%s\n", -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, a4), "UTF8String"));
    goto LABEL_16;
  }
  if (!a4)
  {
    if (s_logUsingOsLog)
    {
      v13 = gt_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "fail: transport cannot be nil";
LABEL_12:
        _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, v14, buf, 2u);
        abort();
      }
      goto LABEL_16;
    }
    v15 = __stderrp;
    v16 = CFSTR("fail: transport cannot be nil");
    goto LABEL_15;
  }
  v18.receiver = self;
  v18.super_class = (Class)GTTransportSource_replayer;
  v6 = -[GTTransportSource_replayer init](&v18, "init");
  if (v6)
  {
    v6->_transport = (GTTransport_replayer *)a4;
    v7 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(v6)), v6, CFSTR("manager")), "UTF8String");
    v8 = dispatch_queue_create_with_target_V2(v7, 0, (dispatch_queue_t)a3);
    v6->_queue = (OS_dispatch_queue *)v8;
    dispatch_suspend(v8);
    v9 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(v6)), v6, CFSTR("message")), "UTF8String");
    v10 = dispatch_queue_create_with_target_V2(v9, 0, (dispatch_queue_t)a3);
    v6->_mqueue = (OS_dispatch_queue *)v10;
    dispatch_suspend(v10);
    queue = v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __46__GTTransportSource__initWithQueue_transport___block_invoke;
    block[3] = &unk_726128;
    block[4] = v6;
    dispatch_async(queue, block);
  }
  return v6;
}

- (void)dealloc
{
  NSObject *mqueue;
  NSObject *queue;
  objc_super v5;

  mqueue = self->_mqueue;
  if (mqueue)
  {
    dispatch_release(mqueue);
    self->_mqueue = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GTTransportSource_replayer;
  -[GTTransportSource_replayer dealloc](&v5, "dealloc");
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_queue);
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_queue);
}

- (void)cancel
{
  atomic<int> *p_state;
  unsigned int v4;
  NSObject *queue;
  _QWORD block[5];

  p_state = &self->_state;
  do
    v4 = __ldaxr((unsigned int *)p_state);
  while (__stlxr(v4 | 1, (unsigned int *)p_state));
  if ((v4 & 1) == 0)
  {
    dispatch_suspend((dispatch_object_t)self->_mqueue);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __27__GTTransportSource_cancel__block_invoke;
    block[3] = &unk_726128;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (BOOL)cancelled
{
  char v2;

  v2 = atomic_load((unsigned int *)&self->_state);
  return v2 & 1;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "copy");
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __39__GTTransportSource_setMessageHandler___block_invoke;
  v6[3] = &unk_725A70;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "copy");
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __44__GTTransportSource_setCancellationHandler___block_invoke;
  v6[3] = &unk_725A70;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

- (id)registrationHandler
{
  return self->_registrationHandler;
}

- (void)setRegistrationHandler:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "copy");
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __44__GTTransportSource_setRegistrationHandler___block_invoke;
  v6[3] = &unk_725A70;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

- (void)_callRegistrationHandler
{
  char v2;
  void (**registrationHandler)(id, SEL);

  v2 = atomic_load((unsigned int *)&self->_state);
  if ((v2 & 1) == 0)
  {
    registrationHandler = (void (**)(id, SEL))self->_registrationHandler;
    if (registrationHandler)
    {
      registrationHandler[2](registrationHandler, a2);

      self->_registrationHandler = 0;
    }
  }
}

- (void)_register
{
  atomic<int> *p_state;
  char v3;
  unsigned int v5;
  NSObject *mqueue;
  _QWORD block[5];

  p_state = &self->_state;
  v3 = atomic_load((unsigned int *)&self->_state);
  if ((v3 & 1) == 0)
  {
    if (-[GTTransport_replayer _activateSource:](self->_transport, "_activateSource:", self))
    {
      do
        v5 = __ldaxr((unsigned int *)p_state);
      while (__stlxr(v5 | 2, (unsigned int *)p_state));
      mqueue = self->_mqueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __30__GTTransportSource__register__block_invoke;
      block[3] = &unk_726128;
      block[4] = self;
      dispatch_async(mqueue, block);
    }
    else
    {
      -[GTTransportSource_replayer cancel](self, "cancel");
    }
  }
}

- (void)_callCancellationHandler
{
  void (**cancellationHandler)(id, SEL);

  cancellationHandler = (void (**)(id, SEL))self->_cancellationHandler;
  if (cancellationHandler)
  {
    cancellationHandler[2](cancellationHandler, a2);

    self->_cancellationHandler = 0;
  }

  self->_transport = 0;
}

- (void)_cancel
{
  NSObject *mqueue;
  _QWORD block[5];

  -[GTTransport_replayer _cancelSource:](self->_transport, "_cancelSource:", self);

  self->_messageHandler = 0;
  self->_registrationHandler = 0;
  mqueue = self->_mqueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __28__GTTransportSource__cancel__block_invoke;
  block[3] = &unk_726128;
  block[4] = self;
  dispatch_async(mqueue, block);
}

- (void)_dispatch:(id)a3
{
  NSObject *mqueue;
  _QWORD v4[6];

  mqueue = self->_mqueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __31__GTTransportSource__dispatch___block_invoke;
  v4[3] = &unk_725190;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mqueue, v4);
}

@end
