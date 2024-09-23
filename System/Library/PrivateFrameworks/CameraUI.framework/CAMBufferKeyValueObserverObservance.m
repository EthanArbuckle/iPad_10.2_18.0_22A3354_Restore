@implementation CAMBufferKeyValueObserverObservance

- (CAMBufferKeyValueObserverObservance)initWithKeyPath:(id)a3 ofObject:(id)a4 withPredicate:(id)a5 removedOnceEnabled:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  CAMBufferKeyValueObserverObservance *v12;
  uint64_t v13;
  NSString *keyPath;
  CAMBufferKeyValueObserverObservance *v15;
  objc_super v17;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CAMBufferKeyValueObserverObservance;
  v12 = -[CAMBufferObservance initWithPredicate:removedOnceEnabled:](&v17, sel_initWithPredicate_removedOnceEnabled_, a5, v6);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    objc_storeWeak((id *)&v12->_object, v11);
    v15 = v12;
  }

  return v12;
}

- (BOOL)shouldBeFulfilledByChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CAMBufferKeyValueObserverObservance keyPath](self, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMBufferKeyValueObserverObservance object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v6))
    {
      objc_msgSend(v5, "object");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v7);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setupObservanceForBuffer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAMBufferKeyValueObserverObservance object](self, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMBufferKeyValueObserverObservance keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v4, v5, 1, self);

}

- (void)teardownObservanceForBuffer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAMBufferKeyValueObserverObservance object](self, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMBufferKeyValueObserverObservance keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", v4, v5, self);

}

- (NSObject)object
{
  return objc_loadWeakRetained((id *)&self->_object);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak((id *)&self->_object);
}

@end
