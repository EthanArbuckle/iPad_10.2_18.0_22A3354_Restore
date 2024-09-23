@implementation _MXIntentResponseObserverProxy

- (_MXIntentResponseObserverProxy)initWithObserver:(id)a3
{
  id v4;
  _MXIntentResponseObserverProxy *v5;
  _MXIntentResponseObserverProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MXIntentResponseObserverProxy;
  v5 = -[_MXIntentResponseObserverProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_observer, v4);

  return v6;
}

- (void)intentResponseDidUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_MXIntentResponseObserverProxy observer](self, "observer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intentResponseDidUpdate:withSerializedCacheItems:error:", v4, 0, 0);

}

- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_MXIntentResponseObserverProxy observer](self, "observer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intentResponseDidUpdate:withSerializedCacheItems:error:", v7, v6, 0);

}

- (void)didReceiveError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_MXIntentResponseObserverProxy observer](self, "observer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intentResponseDidUpdate:withSerializedCacheItems:error:", 0, 0, v4);

}

- (void)stopObserving
{
  -[_MXIntentResponseObserverProxy setObserver:](self, "setObserver:", 0);
}

- (_MXIntentResponseObserver)observer
{
  return (_MXIntentResponseObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
