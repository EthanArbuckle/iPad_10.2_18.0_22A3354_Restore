@implementation PDFTimer

- (PDFTimer)initWithSelector:(SEL)a3 forTarget:(id)a4
{
  id v6;
  PDFTimer *v7;
  PDFTimerPrivate *v8;
  PDFTimerPrivate *v9;
  void *v10;
  uint64_t v11;
  PDFTimerPrivate *v12;
  NSInvocation *methodInvocation;
  PDFTimerPrivate *v14;
  NSTimer *timer;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PDFTimer;
  v7 = -[PDFTimer init](&v17, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(PDFTimerPrivate);
    v9 = v7->_private;
    v7->_private = v8;

    objc_storeWeak((id *)&v7->_private->target, v6);
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v7->_private;
    methodInvocation = v12->methodInvocation;
    v12->methodInvocation = (NSInvocation *)v11;

    -[NSInvocation setSelector:](v7->_private->methodInvocation, "setSelector:", a3);
    -[NSInvocation setTarget:](v7->_private->methodInvocation, "setTarget:", v6);
    v7->_private->timeInterval = 0.0;
    v14 = v7->_private;
    timer = v14->timer;
    v14->timer = 0;

  }
  return v7;
}

- (PDFTimer)initWithThrottleDelay:(double)a3 forSelector:(SEL)a4 forTarget:(id)a5
{
  id v8;
  PDFTimer *v9;
  PDFTimerPrivate *v10;
  PDFTimerPrivate *v11;
  void *v12;
  uint64_t v13;
  PDFTimerPrivate *v14;
  NSInvocation *methodInvocation;
  PDFTimerPrivate *v16;
  NSTimer *timer;
  objc_super v19;

  v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PDFTimer;
  v9 = -[PDFTimer init](&v19, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(PDFTimerPrivate);
    v11 = v9->_private;
    v9->_private = v10;

    objc_storeWeak((id *)&v9->_private->target, v8);
    objc_msgSend(v8, "methodSignatureForSelector:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v9->_private;
    methodInvocation = v14->methodInvocation;
    v14->methodInvocation = (NSInvocation *)v13;

    -[NSInvocation setSelector:](v9->_private->methodInvocation, "setSelector:", a4);
    -[NSInvocation setTarget:](v9->_private->methodInvocation, "setTarget:", v8);
    v9->_private->timeInterval = a3;
    v16 = v9->_private;
    timer = v16->timer;
    v16->timer = 0;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_private->timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PDFTimer;
  -[PDFTimer dealloc](&v3, sel_dealloc);
}

- (void)update
{
  PDFTimer *v2;
  PDFTimerPrivate *v3;
  uint64_t v4;
  PDFTimerPrivate *v5;
  NSTimer *timer;
  void *v7;
  PDFTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  obj->_private->isRequested = 1;
  v3 = obj->_private;
  if (!v3->timer)
  {
    v3->isRequested = 0;
    objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", obj, sel__execute, 0, 0, obj->_private->timeInterval);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = obj->_private;
    timer = v5->timer;
    v5->timer = (NSTimer *)v4;

    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTimer:forMode:", obj->_private->timer, *MEMORY[0x24BDBCB80]);

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (BOOL)isUpdateQueued
{
  return self->_private->timer != 0;
}

- (void)cancel
{
  PDFTimerPrivate *v2;
  NSTimer *timer;
  PDFTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSTimer invalidate](obj->_private->timer, "invalidate");
  v2 = obj->_private;
  timer = v2->timer;
  v2->timer = 0;

  obj->_private->isRequested = 0;
  objc_sync_exit(obj);

}

- (void)_execute
{
  id WeakRetained;
  PDFTimerPrivate *v3;
  uint64_t v4;
  PDFTimerPrivate *v5;
  NSTimer *timer;
  void *v7;
  PDFTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  WeakRetained = objc_loadWeakRetained((id *)&obj->_private->target);
  if (WeakRetained)
  {
    -[NSInvocation invoke](obj->_private->methodInvocation, "invoke");
    v3 = obj->_private;
    if (v3->isRequested)
    {
      objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", obj, sel__execute, 0, 0, v3->timeInterval);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = obj->_private;
      timer = v5->timer;
      v5->timer = (NSTimer *)v4;

      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addTimer:forMode:", obj->_private->timer, *MEMORY[0x24BDBCB80]);
    }
    else
    {
      v7 = v3->timer;
      v3->timer = 0;
    }

    obj->_private->isRequested = 0;
  }

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
