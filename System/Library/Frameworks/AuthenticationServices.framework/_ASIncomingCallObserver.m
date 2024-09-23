@implementation _ASIncomingCallObserver

+ (_ASIncomingCallObserver)callObserverWithBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBlock:", v4);

  return (_ASIncomingCallObserver *)v5;
}

- (id)_initWithBlock:(id)a3
{
  id v4;
  _ASIncomingCallObserver *v5;
  CXCallObserver *v6;
  CXCallObserver *callObserver;
  uint64_t v8;
  id incomingCallHandler;
  _ASIncomingCallObserver *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ASIncomingCallObserver;
  v5 = -[_ASIncomingCallObserver init](&v12, sel_init);
  if (v5)
  {
    v6 = (CXCallObserver *)objc_alloc_init(MEMORY[0x24BDB7898]);
    callObserver = v5->_callObserver;
    v5->_callObserver = v6;

    -[CXCallObserver setDelegate:queue:](v5->_callObserver, "setDelegate:queue:", v5, 0);
    v8 = MEMORY[0x212BBEFEC](v4);
    incomingCallHandler = v5->_incomingCallHandler;
    v5->_incomingCallHandler = (id)v8;

    v10 = v5;
  }

  return v5;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  if (objc_msgSend(a4, "hasConnected", a3))
    (*((void (**)(void))self->_incomingCallHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_incomingCallHandler, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end
