@implementation _CNKeyValueObserverHandler

- (_CNKeyValueObserverHandler)initWithObject:(id)a3 keyPath:(id)a4 observer:(id)a5
{
  id v9;
  id v10;
  id v11;
  _CNKeyValueObserverHandler *v12;
  _CNKeyValueObserverHandler *v13;
  uint64_t v14;
  NSString *keyPath;
  _CNKeyValueObserverHandler *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_CNKeyValueObserverHandler;
  v12 = -[_CNKeyValueObserverHandler init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_object, a3);
    v14 = objc_msgSend(v10, "copy");
    keyPath = v13->_keyPath;
    v13->_keyPath = (NSString *)v14;

    objc_storeStrong((id *)&v13->_observer, a5);
    v16 = v13;
  }

  return v13;
}

- (void)startObservingWithOptions:(unint64_t)a3
{
  objc_msgSend(self->_object, "addObserver:forKeyPath:options:context:", self, self->_keyPath, a3, sHandlerContext);
}

- (void)stopObserving
{
  objc_msgSend(self->_object, "removeObserver:forKeyPath:context:", self, self->_keyPath, sHandlerContext);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)sHandlerContext == a6)
  {
    -[CNObserver observerDidReceiveResult:](self->_observer, "observerDidReceiveResult:", a5, a4);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_CNKeyValueObserverHandler;
    -[_CNKeyValueObserverHandler observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
