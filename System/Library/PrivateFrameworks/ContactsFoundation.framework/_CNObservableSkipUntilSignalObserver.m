@implementation _CNObservableSkipUntilSignalObserver

- (_CNObservableSkipUntilSignalObserver)initWithDelegate:(id)a3
{
  id v4;
  _CNObservableSkipUntilSignalObserver *v5;
  _CNObservableSkipUntilSignalObserver *v6;
  _CNObservableSkipUntilSignalObserver *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CNObservableSkipUntilSignalObserver;
  v5 = -[_CNObservableSkipUntilSignalObserver init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableSkipUntilSignalObserver delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("delegate"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v3;

  -[_CNObservableSkipUntilSignalObserver delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signalDidGenerateEvent");

}

- (void)observerDidComplete
{
  id v2;

  -[_CNObservableSkipUntilSignalObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signalDidGenerateEvent");

}

- (void)observerDidFailWithError:(id)a3
{
  id v3;

  -[_CNObservableSkipUntilSignalObserver delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signalDidGenerateEvent");

}

- (_CNObservableSkipUntilSignalObserverDelegate)delegate
{
  return (_CNObservableSkipUntilSignalObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
