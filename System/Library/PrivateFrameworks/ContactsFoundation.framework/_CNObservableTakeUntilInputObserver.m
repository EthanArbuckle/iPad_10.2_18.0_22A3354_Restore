@implementation _CNObservableTakeUntilInputObserver

- (void)observerDidComplete
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CNObservableEvent completionEvent](CNObservableEvent, "completionEvent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilInputObserver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldMirrorEvent:", v6);

  if (v4)
  {
    -[_CNObservableTakeUntilInputObserver observer](self, "observer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "observerDidComplete");

  }
}

- (void)observerDidReceiveResult:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  +[CNObservableEvent eventWithResult:](CNObservableEvent, "eventWithResult:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilInputObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldMirrorEvent:", v4);

  if (v6)
  {
    -[_CNObservableTakeUntilInputObserver observer](self, "observer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "observerDidReceiveResult:", v8);

  }
}

- (_CNObservableTakeUntilInputObserverDelegate)delegate
{
  return (_CNObservableTakeUntilInputObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_CNObservableTakeUntilInputObserver)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  _CNObservableTakeUntilInputObserver *v9;
  _CNObservableTakeUntilInputObserver *v10;
  _CNObservableTakeUntilInputObserver *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableTakeUntilInputObserver;
  v9 = -[_CNObservableTakeUntilInputObserver init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observer, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilInputObserver observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("observer"), v4);

  -[_CNObservableTakeUntilInputObserver delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("delegate"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)observerDidFailWithError:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  +[CNObservableEvent failureEventWithError:](CNObservableEvent, "failureEventWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilInputObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldMirrorEvent:", v4);

  if (v6)
  {
    -[_CNObservableTakeUntilInputObserver observer](self, "observer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "observerDidFailWithError:", v8);

  }
}

- (CNObserver)observer
{
  return (CNObserver *)objc_getProperty(self, a2, 8, 1);
}

@end
