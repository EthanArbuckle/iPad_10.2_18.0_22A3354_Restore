@implementation _CNObservableTakeUntilSignalObserver

- (void)observerDidReceiveResult:(id)a3
{
  void *v4;
  id v5;

  -[_CNObservableTakeUntilSignalObserver delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilSignalObserver observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signalDidGenerateEventWithObserver:", v4);

}

- (void)observerDidComplete
{
  void *v3;
  id v4;

  -[_CNObservableTakeUntilSignalObserver delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilSignalObserver observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signalDidGenerateEventWithObserver:", v3);

}

- (CNObserver)observer
{
  return (CNObserver *)objc_getProperty(self, a2, 8, 1);
}

- (_CNObservableTakeUntilSignalObserverDelegate)delegate
{
  return (_CNObservableTakeUntilSignalObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_CNObservableTakeUntilSignalObserver)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  _CNObservableTakeUntilSignalObserver *v9;
  _CNObservableTakeUntilSignalObserver *v10;
  _CNObservableTakeUntilSignalObserver *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableTakeUntilSignalObserver;
  v9 = -[_CNObservableTakeUntilSignalObserver init](&v13, sel_init);
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
  -[_CNObservableTakeUntilSignalObserver observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("observer"), v4);

  -[_CNObservableTakeUntilSignalObserver delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("delegate"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)observerDidFailWithError:(id)a3
{
  void *v4;
  id v5;

  -[_CNObservableTakeUntilSignalObserver delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilSignalObserver observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signalDidGenerateEventWithObserver:", v4);

}

@end
