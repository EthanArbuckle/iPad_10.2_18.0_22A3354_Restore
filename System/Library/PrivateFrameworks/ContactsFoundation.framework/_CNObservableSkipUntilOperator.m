@implementation _CNObservableSkipUntilOperator

- (_CNObservableSkipUntilOperator)initWithInput:(id)a3 signal:(id)a4
{
  id v7;
  id v8;
  _CNObservableSkipUntilOperator *v9;
  _CNObservableSkipUntilOperator *v10;
  _CNObservableSkipUntilOperator *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableSkipUntilOperator;
  v9 = -[_CNObservableSkipUntilOperator init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    objc_storeStrong((id *)&v10->_signal, a4);
    v10->_active = 0;
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
  id v8;
  void *v9;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableSkipUntilOperator input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("input"), v4);

  -[_CNObservableSkipUntilOperator signal](self, "signal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("signal"), v6);

  v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("active"), -[_CNObservableSkipUntilOperator isActive](self, "isActive"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)subscribe:(id)a3
{
  id v4;
  _CNObservableSkipUntilSignalObserver *v5;
  void *v6;
  void *v7;
  _CNObservableSkipUntilInputObserver *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = a3;
  v5 = -[_CNObservableSkipUntilSignalObserver initWithDelegate:]([_CNObservableSkipUntilSignalObserver alloc], "initWithDelegate:", self);
  -[_CNObservableSkipUntilOperator signal](self, "signal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableSkipUntilOperator setSignalToken:](self, "setSignalToken:", v7);

  v8 = -[_CNObservableSkipUntilInputObserver initWithObserver:delegate:]([_CNObservableSkipUntilInputObserver alloc], "initWithObserver:delegate:", v4, self);
  -[_CNObservableSkipUntilOperator input](self, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribe:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableSkipUntilOperator setInputToken:](self, "setInputToken:", v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44___CNObservableSkipUntilOperator_subscribe___block_invoke;
  v13[3] = &unk_1E29B9358;
  v13[4] = self;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)cancel
{
  void *v3;
  id v4;

  -[_CNObservableSkipUntilOperator inputToken](self, "inputToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[_CNObservableSkipUntilOperator signalToken](self, "signalToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (BOOL)shouldMirrorEvents
{
  _CNObservableSkipUntilOperator *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[_CNObservableSkipUntilOperator isActive](v2, "isActive");
  objc_sync_exit(v2);

  return v3;
}

- (void)inputDidTerminate
{
  id v2;

  -[_CNObservableSkipUntilOperator signalToken](self, "signalToken");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)signalDidGenerateEvent
{
  _CNObservableSkipUntilOperator *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_CNObservableSkipUntilOperator setActive:](obj, "setActive:", 1);
  objc_sync_exit(obj);

}

- (CNObservable)input
{
  return (CNObservable *)objc_getProperty(self, a2, 24, 1);
}

- (CNObservable)signal
{
  return (CNObservable *)objc_getProperty(self, a2, 32, 1);
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

- (void)setInputToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CNCancelable)signalToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSignalToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalToken, 0);
  objc_storeStrong((id *)&self->_inputToken, 0);
  objc_storeStrong((id *)&self->_signal, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
