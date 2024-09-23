@implementation _EFConnectableObservable

- (_EFConnectableObservable)initWithObservable:(id)a3 subject:(id)a4
{
  id v7;
  id v8;
  _EFConnectableObservable *v9;
  NSLock *v10;
  NSLock *lock;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_EFConnectableObservable;
  v9 = -[_EFConnectableObservable init](&v13, sel_init);
  if (v9)
  {
    v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v9->_lock;
    v9->_lock = v10;

    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v9->_subject, a4);
  }

  return v9;
}

- (id)subscribe:(id)a3
{
  -[EFObservable subscribe:](self->_subject, "subscribe:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)connect
{
  EFCancelationToken *cancelable;
  EFCancelationToken *v4;
  EFCancelationToken *v5;
  EFCancelationToken *v6;
  EFCancelationToken *v7;
  EFCancelationToken *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  -[NSLock lock](self->_lock, "lock");
  cancelable = self->_cancelable;
  v4 = cancelable;
  if (!cancelable)
  {
    v5 = objc_alloc_init(EFCancelationToken);
    v6 = self->_cancelable;
    self->_cancelable = v5;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7 = self->_cancelable;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __35___EFConnectableObservable_connect__block_invoke;
    v11[3] = &unk_1E62A5838;
    objc_copyWeak(&v12, &location);
    -[EFCancelationToken addCancelationBlock:](v7, "addCancelationBlock:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    v4 = self->_cancelable;
  }
  v8 = v4;
  -[NSLock unlock](self->_lock, "unlock");
  if (!cancelable)
  {
    -[EFObservable subscribe:](self->_observable, "subscribe:", self->_subject);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFCancelationToken addCancelable:](v8, "addCancelable:", v9);

  }
  return v8;
}

- (void)_disconnect
{
  EFCancelationToken *cancelable;
  EFCancelationToken *v4;

  -[NSLock lock](self->_lock, "lock");
  cancelable = self->_cancelable;
  self->_cancelable = 0;
  v4 = cancelable;

  -[NSLock unlock](self->_lock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
