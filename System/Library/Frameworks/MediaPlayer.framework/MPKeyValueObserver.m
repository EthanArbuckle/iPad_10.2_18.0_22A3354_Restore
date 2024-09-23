@implementation MPKeyValueObserver

- (MPKeyValueObserver)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPKeyValueObserver *v13;
  MPKeyValueObserver *v14;
  uint64_t v15;
  NSString *keyPath;
  uint64_t v17;
  id handler;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MPKeyValueObserver;
  v13 = -[MPKeyValueObserver init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak(&v13->_object, v10);
    v15 = objc_msgSend(v11, "copy");
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v15;

    v17 = MEMORY[0x19403A810](v12);
    handler = v14->_handler;
    v14->_handler = (id)v17;

    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v14, v11, a5, MPKeyValueObserverContext);
  }

  return v14;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained(&self->_object);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, self->_keyPath, MPKeyValueObserverContext);

  v4.receiver = self;
  v4.super_class = (Class)MPKeyValueObserver;
  -[MPKeyValueObserver dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  int v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)MPKeyValueObserverContext == a6)
  {
    WeakRetained = objc_loadWeakRetained(&self->_object);
    if (WeakRetained == v11)
    {
      v14 = objc_msgSend(v10, "isEqualToString:", self->_keyPath);

      if (v14)
        (*((void (**)(void))self->_handler + 2))();
    }
    else
    {

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MPKeyValueObserver;
    -[MPKeyValueObserver observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak(&self->_object);
}

@end
