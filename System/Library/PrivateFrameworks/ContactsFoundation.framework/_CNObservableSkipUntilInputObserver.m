@implementation _CNObservableSkipUntilInputObserver

- (_CNObservableSkipUntilInputObserver)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  _CNObservableSkipUntilInputObserver *v9;
  _CNObservableSkipUntilInputObserver *v10;
  _CNObservableSkipUntilInputObserver *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableSkipUntilInputObserver;
  v9 = -[_CNObservableSkipUntilInputObserver init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = v10;
  }

  return v10;
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
  -[_CNObservableSkipUntilInputObserver observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("observer"), v4);

  -[_CNObservableSkipUntilInputObserver delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("delegate"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)observerDidReceiveResult:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_CNObservableSkipUntilInputObserver delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldMirrorEvents");

  if (v5)
  {
    -[_CNObservableSkipUntilInputObserver observer](self, "observer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "observerDidReceiveResult:", v7);

  }
}

- (void)observerDidComplete
{
  void *v3;
  int v4;
  id v5;

  -[_CNObservableSkipUntilInputObserver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldMirrorEvents");

  if (v4)
  {
    -[_CNObservableSkipUntilInputObserver observer](self, "observer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "observerDidComplete");
  }
  else
  {
    -[_CNObservableSkipUntilInputObserver delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputDidTerminate");
  }

}

- (void)observerDidFailWithError:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_CNObservableSkipUntilInputObserver delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldMirrorEvents");

  if (v5)
  {
    -[_CNObservableSkipUntilInputObserver observer](self, "observer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "observerDidFailWithError:", v7);
  }
  else
  {
    -[_CNObservableSkipUntilInputObserver delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputDidTerminate");
  }

}

- (CNObserver)observer
{
  return (CNObserver *)objc_getProperty(self, a2, 8, 1);
}

- (_CNObservableSkipUntilInputObserverDelegate)delegate
{
  return (_CNObservableSkipUntilInputObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
