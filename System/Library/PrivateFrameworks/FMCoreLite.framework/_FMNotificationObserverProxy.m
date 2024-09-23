@implementation _FMNotificationObserverProxy

- (_FMNotificationObserverProxy)initWithWeakObserver:(id)a3 notificationName:(id)a4 observerQueue:(id)a5 observerBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _FMNotificationObserverProxy *v14;
  _FMNotificationObserverProxy *v15;
  uint64_t v16;
  id observerBlock;
  _FMNotificationObserverProxy *v18;
  void *v19;
  uint64_t v20;
  id notificationObserver;
  _QWORD v23[5];
  _QWORD v24[5];
  _FMNotificationObserverProxy *v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_FMNotificationObserverProxy;
  v14 = -[_FMObserverProxy initWithWeakObserver:](&v26, sel_initWithWeakObserver_, v10);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_notificationName, a4);
    objc_storeStrong((id *)&v15->_observerQueue, a5);
    v16 = MEMORY[0x1AF455734](v13);
    observerBlock = v15->_observerBlock;
    v15->_observerBlock = (id)v16;

    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__4;
    v24[4] = __Block_byref_object_dispose__4;
    v18 = v15;
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __98___FMNotificationObserverProxy_initWithWeakObserver_notificationName_observerQueue_observerBlock___block_invoke;
    v23[3] = &unk_1E5E0E5A0;
    v23[4] = v24;
    objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", v11, 0, v12, v23);
    v20 = objc_claimAutoreleasedReturnValue();
    notificationObserver = v18->_notificationObserver;
    v18->_notificationObserver = (id)v20;

    _Block_object_dispose(v24, 8);
  }

  return v15;
}

- (void)performObserverBlock
{
  id v3;

  if (-[_FMObserverProxy isValid](self, "isValid"))
  {
    -[_FMObserverProxy weakObserver](self, "weakObserver");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_observerBlock + 2))();

  }
}

- (void)invalidate
{
  void *v3;
  id notificationObserver;
  objc_super v5;

  if (self->_notificationObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_notificationObserver);

    notificationObserver = self->_notificationObserver;
    self->_notificationObserver = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)_FMNotificationObserverProxy;
  -[_FMObserverProxy invalidate](&v5, sel_invalidate);
}

- (NSOperationQueue)observerQueue
{
  return self->_observerQueue;
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong(&self->_observerBlock, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong(&self->_notificationObserver, 0);
}

@end
