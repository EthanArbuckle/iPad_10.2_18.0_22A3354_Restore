@implementation _EFKeyValueObserverHandler

- (void)startObservingWithOptions:(unint64_t)a3
{
  objc_msgSend(self->_object, "addObserver:forKeyPath:options:context:", self, self->_keyPath, a3, sHandlerContext);
  self->_observing = 1;
}

- (_EFKeyValueObserverHandler)initWithObject:(id)a3 keyPath:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EFKeyValueObserverHandler *v11;
  _EFKeyValueObserverHandler *v12;
  uint64_t v13;
  NSString *keyPath;
  uint64_t v15;
  id block;
  _EFKeyValueObserverHandler *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_EFKeyValueObserverHandler;
  v11 = -[_EFKeyValueObserverHandler init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_object = v8;
    v13 = objc_msgSend(v9, "copy");
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    block = v12->_block;
    v12->_block = (id)v15;

    v17 = v12;
  }

  return v12;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)sHandlerContext == a6)
  {
    (*((void (**)(void))self->_block + 2))();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_EFKeyValueObserverHandler;
    -[_EFKeyValueObserverHandler observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_EFKeyValueObserverHandler cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_EFKeyValueObserverHandler;
  -[_EFKeyValueObserverHandler dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  if (self->_observing)
  {
    objc_msgSend(self->_object, "removeObserver:forKeyPath:context:", self, self->_keyPath, sHandlerContext);
    self->_observing = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
