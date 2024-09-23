@implementation _MKKVOProxy

- (void)addObserverForObject:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, a4, a5, a6);
}

- (void)removeObserverForObject:(id)a3 forKeyPath:(id)a4
{
  objc_msgSend(a3, "removeObserver:forKeyPath:", self, a4);
}

- (_MKKVOProxy)initWithDelegate:(id)a3
{
  id v4;
  _MKKVOProxy *v5;
  _MKKVOProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MKKVOProxy;
  v5 = -[_MKKVOProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)removeObserverForObject:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, a4, a5);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[_MKKVOProxy delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_mkObserveValueForKeyPath:ofObject:change:context:", v12, v11, v10, a6);

}

- (_MKKVOProxyDelegate)delegate
{
  return (_MKKVOProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
