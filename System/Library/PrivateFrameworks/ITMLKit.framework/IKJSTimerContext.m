@implementation IKJSTimerContext

- (IKJSTimerContext)initWithCallback:(id)a3 callbackArgs:(id)a4 repeating:(BOOL)a5 ownerObject:(id)a6 timer:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  IKJSTimerContext *v16;
  IKJSTimerContext *v17;
  uint64_t v18;
  JSManagedValue *managedCallback;
  void *v20;
  void *v21;
  IKJSManagedArray *v22;
  IKJSManagedArray *managedArgs;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)IKJSTimerContext;
  v16 = -[IKJSTimerContext init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->_ownerObject, a6);
    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v12);
    v18 = objc_claimAutoreleasedReturnValue();
    managedCallback = v17->_managedCallback;
    v17->_managedCallback = (JSManagedValue *)v18;

    objc_msgSend(v12, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "virtualMachine");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addManagedReference:withOwner:", v17->_managedCallback, v14);

    if (objc_msgSend(v13, "count"))
    {
      v22 = -[IKJSManagedArray initWithArray:ownerObject:]([IKJSManagedArray alloc], "initWithArray:ownerObject:", v13, v14);
      managedArgs = v17->_managedArgs;
      v17->_managedArgs = v22;
    }
    else
    {
      managedArgs = v17->_managedArgs;
      v17->_managedArgs = 0;
    }

    v17->_isRepeating = a5;
    objc_storeStrong((id *)&v17->_timer, a7);
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IKJSTimerContext timer](self, "timer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Timer:%p Context:%p Repeating:%d"), v4, self, -[IKJSTimerContext isRepeating](self, "isRepeating"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeManagedReferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  JSManagedValue *managedCallback;
  IKJSManagedArray *managedArgs;
  NSTimer *timer;
  id v11;

  -[IKJSTimerContext managedCallback](self, "managedCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "virtualMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSTimerContext managedCallback](self, "managedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSTimerContext ownerObject](self, "ownerObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeManagedReference:withOwner:", v6, v7);

  managedCallback = self->_managedCallback;
  self->_managedCallback = 0;

  managedArgs = self->_managedArgs;
  self->_managedArgs = 0;

  timer = self->_timer;
  self->_timer = 0;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IKJSTimerContext;
  -[IKJSTimerContext dealloc](&v2, sel_dealloc);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (id)ownerObject
{
  return self->_ownerObject;
}

- (JSManagedValue)managedCallback
{
  return self->_managedCallback;
}

- (IKJSManagedArray)managedArgs
{
  return self->_managedArgs;
}

- (BOOL)isRepeating
{
  return self->_isRepeating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedArgs, 0);
  objc_storeStrong((id *)&self->_managedCallback, 0);
  objc_storeStrong(&self->_ownerObject, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
