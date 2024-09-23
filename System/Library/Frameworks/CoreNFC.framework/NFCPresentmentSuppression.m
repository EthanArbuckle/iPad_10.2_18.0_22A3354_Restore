@implementation NFCPresentmentSuppression

- (NFCPresentmentSuppression)initWithAssertion:(id)a3 delegate:(id)a4
{
  id v7;
  NFCPresentmentSuppressionDelegate *v8;
  NFCPresentmentSuppression *v9;
  NFCPresentmentSuppression *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *timerQueue;
  uint64_t v14;
  NSNumber *externalHandle;
  NFCPresentmentSuppression *v16;
  objc_super v18;

  v7 = a3;
  v8 = (NFCPresentmentSuppressionDelegate *)a4;
  v18.receiver = self;
  v18.super_class = (Class)NFCPresentmentSuppression;
  v9 = -[NFCPresentmentSuppression init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assertion, a3);
    v10->_delegate = v8;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.corenfc.presentment.suppression.timer", v11);
    timerQueue = v10->_timerQueue;
    v10->_timerQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", arc4random());
    v14 = objc_claimAutoreleasedReturnValue();
    externalHandle = v10->_externalHandle;
    v10->_externalHandle = (NSNumber *)v14;

    v16 = v10;
  }

  return v10;
}

+ (id)assertionWithAssertion:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  NFCPresentmentSuppression *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NFCPresentmentSuppression initWithAssertion:delegate:]([NFCPresentmentSuppression alloc], "initWithAssertion:delegate:", v6, v5);

  return v7;
}

- (void)startAssertion:(double)a3
{
  double v5;
  id v6;
  NFTimer *v7;
  NFTimer *assertionTimer;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  NFCPresentmentSuppression *v13;
  id v14[2];
  id location;

  if (a3 >= 15.0)
    v5 = a3;
  else
    v5 = 15.0;
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x24BEDCD88]);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __44__NFCPresentmentSuppression_startAssertion___block_invoke;
  v12 = &unk_24D44F960;
  v13 = self;
  v14[1] = (id)a2;
  objc_copyWeak(v14, &location);
  v7 = (NFTimer *)objc_msgSend(v6, "initWithCallback:queue:", &v9, self->_timerQueue);
  assertionTimer = self->_assertionTimer;
  self->_assertionTimer = v7;

  -[NFTimer startTimer:](self->_assertionTimer, "startTimer:", v5, v9, v10, v11, v12, v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __44__NFCPresentmentSuppression_startAssertion___block_invoke(uint64_t a1)
{
  uint64_t Logger;
  void (*v3)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  int v10;
  const char *v11;
  const char *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v3 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v7 = 45;
    if (isMetaClass)
      v7 = 43;
    v3(6, "%c[%{public}s %{public}s]:%i expired", v7, ClassName, Name, 57);
  }
  NFSharedLogGetLogger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v9))
      v10 = 43;
    else
      v10 = 45;
    v11 = object_getClassName(*(id *)(a1 + 32));
    v12 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v10;
    v19 = 2082;
    v20 = v11;
    v21 = 2082;
    v22 = v12;
    v23 = 1024;
    v24 = 57;
    _os_log_impl(&dword_215BBD000, v8, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i expired", buf, 0x22u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didExpire");

  }
}

- (void)startCooldown:(double)a3
{
  double v5;
  id v6;
  NFTimer *v7;
  NFTimer *cooldownTimer;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  NFCPresentmentSuppression *v13;
  id v14[2];
  id location;

  if (a3 >= 15.0)
    v5 = a3;
  else
    v5 = 15.0;
  -[NFTimer stopTimer](self->_assertionTimer, "stopTimer");
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x24BEDCD88]);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __43__NFCPresentmentSuppression_startCooldown___block_invoke;
  v12 = &unk_24D44F960;
  v13 = self;
  v14[1] = (id)a2;
  objc_copyWeak(v14, &location);
  v7 = (NFTimer *)objc_msgSend(v6, "initWithCallback:queue:", &v9, self->_timerQueue);
  cooldownTimer = self->_cooldownTimer;
  self->_cooldownTimer = v7;

  -[NFTimer startTimer:](self->_cooldownTimer, "startTimer:", v5, v9, v10, v11, v12, v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __43__NFCPresentmentSuppression_startCooldown___block_invoke(uint64_t a1)
{
  uint64_t Logger;
  void (*v3)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  int v10;
  const char *v11;
  const char *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v3 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v7 = 45;
    if (isMetaClass)
      v7 = 43;
    v3(6, "%c[%{public}s %{public}s]:%i expired", v7, ClassName, Name, 80);
  }
  NFSharedLogGetLogger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v9))
      v10 = 43;
    else
      v10 = 45;
    v11 = object_getClassName(*(id *)(a1 + 32));
    v12 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v10;
    v19 = 2082;
    v20 = v11;
    v21 = 2082;
    v22 = v12;
    v23 = 1024;
    v24 = 80;
    _os_log_impl(&dword_215BBD000, v8, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i expired", buf, 0x22u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didFinishCooldown");

  }
}

- (void)invalidate
{
  NFTimer *assertionTimer;
  NFTimer *cooldownTimer;

  -[NFTimer stopTimer](self->_assertionTimer, "stopTimer");
  assertionTimer = self->_assertionTimer;
  self->_assertionTimer = 0;

  -[NFTimer stopTimer](self->_cooldownTimer, "stopTimer");
  cooldownTimer = self->_cooldownTimer;
  self->_cooldownTimer = 0;

}

- (NFAssertionInternal)assertion
{
  return self->_assertion;
}

- (NFCPresentmentSuppressionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NFCPresentmentSuppressionDelegate *)a3;
}

- (NSNumber)externalHandle
{
  return self->_externalHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalHandle, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_cooldownTimer, 0);
  objc_storeStrong((id *)&self->_assertionTimer, 0);
}

@end
