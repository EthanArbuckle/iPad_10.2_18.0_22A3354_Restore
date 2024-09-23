@implementation _AMSKeyValueObservable

- (_AMSKeyValueObservable)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  _AMSKeyValueObservable *v10;
  NSObject *v11;
  NSObject *context;
  uint64_t v13;
  NSString *keyPath;
  id v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_AMSKeyValueObservable;
  v10 = -[AMSObservable initWithObserver:](&v17, sel_initWithObserver_, 0);
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DE7910]);
    context = v10->_context;
    v10->_context = v11;

    v13 = objc_msgSend(v9, "copy");
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v13;

    v15 = objc_storeWeak((id *)&v10->_object, v8);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v10, v10->_keyPath, a5, v10->_context);

  }
  return v10;
}

- (BOOL)cancel
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_AMSKeyValueObservable;
  v3 = -[AMSObservable cancel](&v8, sel_cancel);
  if (v3)
  {
    -[_AMSKeyValueObservable object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AMSKeyValueObservable keyPath](self, "keyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AMSKeyValueObservable context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, v5, v6);

  }
  return v3;
}

- (BOOL)sendCompletion
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_AMSKeyValueObservable;
  v3 = -[AMSObservable sendCompletion](&v8, sel_sendCompletion);
  if (v3)
  {
    -[_AMSKeyValueObservable object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AMSKeyValueObservable keyPath](self, "keyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AMSKeyValueObservable context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, v5, v6);

  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[_AMSKeyValueObservable context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == a6)
  {
    -[AMSObservable sendResult:](self, "sendResult:", v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_AMSKeyValueObservable;
    -[_AMSKeyValueObservable observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (NSObject)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSObject)object
{
  return objc_loadWeakRetained((id *)&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak((id *)&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_object);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
