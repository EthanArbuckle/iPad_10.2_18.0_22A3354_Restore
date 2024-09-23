@implementation _CNObservableTakeUntilOperator

- (id)subscribe:(id)a3
{
  id v4;
  _CNObservableTakeUntilSignalObserver *v5;
  void *v6;
  void *v7;
  _CNObservableTakeUntilInputObserver *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  v5 = -[_CNObservableTakeUntilSignalObserver initWithObserver:delegate:]([_CNObservableTakeUntilSignalObserver alloc], "initWithObserver:delegate:", v4, self);
  -[_CNObservableTakeUntilOperator signal](self, "signal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilOperator setSignalToken:](self, "setSignalToken:", v7);

  v8 = -[_CNObservableTakeUntilInputObserver initWithObserver:delegate:]([_CNObservableTakeUntilInputObserver alloc], "initWithObserver:delegate:", v4, self);
  -[_CNObservableTakeUntilOperator input](self, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribe:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilOperator setInputToken:](self, "setInputToken:", v10);

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44___CNObservableTakeUntilOperator_subscribe___block_invoke;
  v13[3] = &unk_1E29BA1A8;
  objc_copyWeak(&v14, &location);
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

- (CNObservable)signal
{
  return (CNObservable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSignalToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setInputToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CNObservable)input
{
  return (CNObservable *)objc_getProperty(self, a2, 24, 1);
}

- (_CNObservableTakeUntilOperator)initWithInput:(id)a3 signal:(id)a4
{
  id v7;
  id v8;
  _CNObservableTakeUntilOperator *v9;
  _CNObservableTakeUntilOperator *v10;
  _CNObservableTakeUntilOperator *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableTakeUntilOperator;
  v9 = -[_CNObservableTakeUntilOperator init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    objc_storeStrong((id *)&v10->_signal, a4);
    v10->_active = 1;
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalToken, 0);
  objc_storeStrong((id *)&self->_inputToken, 0);
  objc_storeStrong((id *)&self->_signal, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableTakeUntilOperator input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("input"), v4);

  -[_CNObservableTakeUntilOperator signal](self, "signal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("signal"), v6);

  v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("active"), -[_CNObservableTakeUntilOperator isActive](self, "isActive"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)cancel
{
  void *v3;
  id v4;

  -[_CNObservableTakeUntilOperator inputToken](self, "inputToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[_CNObservableTakeUntilOperator signalToken](self, "signalToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (BOOL)shouldMirrorEvent:(id)a3
{
  id v4;
  _BOOL4 v5;
  _CNObservableTakeUntilOperator *v6;
  _BOOL4 v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "eventType") == 1 || objc_msgSend(v4, "eventType") == 2;
  v6 = self;
  objc_sync_enter(v6);
  v7 = -[_CNObservableTakeUntilOperator isActive](v6, "isActive");
  if (v5)
    -[_CNObservableTakeUntilOperator setActive:](v6, "setActive:", 0);
  objc_sync_exit(v6);

  if (v7 && v5)
  {
    -[_CNObservableTakeUntilOperator signalToken](v6, "signalToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

  }
  return v7;
}

- (void)signalDidGenerateEventWithObserver:(id)a3
{
  _CNObservableTakeUntilOperator *v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  -[_CNObservableTakeUntilOperator cancel](self, "cancel");
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[_CNObservableTakeUntilOperator isActive](v4, "isActive");
  -[_CNObservableTakeUntilOperator setActive:](v4, "setActive:", 0);
  objc_sync_exit(v4);

  if (v5)
    objc_msgSend(v6, "observerDidComplete");

}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (CNCancelable)inputToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 40, 1);
}

- (CNCancelable)signalToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 48, 1);
}

@end
