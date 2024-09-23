@implementation WFBKSBackgroundAssertion

- (WFBKSBackgroundAssertion)initWithName:(id)a3 expirationHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  WFBKSBackgroundAssertion *v9;
  WFBKSBackgroundAssertion *v10;
  uint64_t v11;
  id expirationHandler;
  void *v13;
  objc_class *v14;
  uint64_t v15;
  BKSProcessAssertion *assertion;
  void *v17;
  uint64_t v18;
  id v19;
  WFBKSBackgroundAssertion *v20;
  uint64_t v21;
  id observer;
  WFBKSBackgroundAssertion *v23;
  NSObject *v24;
  _QWORD v26[4];
  WFBKSBackgroundAssertion *v27;
  objc_super v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE buf[24];
  void *v34;
  uint64_t *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v28.receiver = self;
  v28.super_class = (Class)WFBKSBackgroundAssertion;
  v9 = -[WFBKSBackgroundAssertion init](&v28, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_12:
    v23 = 0;
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v9->_taskName, a3);
  v11 = objc_msgSend(v8, "copy");
  expirationHandler = v10->_expirationHandler;
  v10->_expirationHandler = (id)v11;

  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v13 = (void *)getBKSProcessAssertionClass_softClass;
  v32 = getBKSProcessAssertionClass_softClass;
  if (!getBKSProcessAssertionClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getBKSProcessAssertionClass_block_invoke;
    v34 = &unk_24C4E3118;
    v35 = &v29;
    __getBKSProcessAssertionClass_block_invoke((uint64_t)buf);
    v13 = (void *)v30[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v29, 8);
  v15 = objc_msgSend([v14 alloc], "initWithPID:flags:reason:name:", getpid(), 1, 4, v7);
  assertion = v10->_assertion;
  v10->_assertion = (BKSProcessAssertion *)v15;

  if ((-[BKSProcessAssertion acquire](v10->_assertion, "acquire") & 1) == 0)
  {
    getWFBackgroundAssertionLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFBKSBackgroundAssertion initWithName:expirationHandler:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_20BBAD000, v24, OS_LOG_TYPE_INFO, "%s Failed to acquire background assertion for %{public}@", buf, 0x16u);
    }

    if (v8)
      v8[2](v8);
    goto LABEL_12;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v17 = (void *)getRBSProcessHandleClass_softClass;
  v32 = getRBSProcessHandleClass_softClass;
  v18 = MEMORY[0x24BDAC760];
  if (!getRBSProcessHandleClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getRBSProcessHandleClass_block_invoke;
    v34 = &unk_24C4E3118;
    v35 = &v29;
    __getRBSProcessHandleClass_block_invoke((uint64_t)buf);
    v17 = (void *)v30[3];
  }
  v19 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v29, 8);
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __59__WFBKSBackgroundAssertion_initWithName_expirationHandler___block_invoke;
  v26[3] = &unk_24C4E2198;
  v20 = v10;
  v27 = v20;
  objc_msgSend(v19, "observeForImminentAssertionsExpiration:", v26);
  v21 = objc_claimAutoreleasedReturnValue();
  observer = v20->_observer;
  v20->_observer = (id)v21;

  v23 = v20;
LABEL_13:

  return v23;
}

- (void)end
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  getWFBackgroundAssertionLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[WFBKSBackgroundAssertion taskName](self, "taskName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[WFBKSBackgroundAssertion end]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_20BBAD000, v3, OS_LOG_TYPE_INFO, "%s Finished background assertion for %{public}@", (uint8_t *)&v6, 0x16u);

  }
  -[WFBKSBackgroundAssertion assertion](self, "assertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[WFBKSBackgroundAssertion setAssertion:](self, "setAssertion:", 0);
  -[WFBKSBackgroundAssertion setObserver:](self, "setObserver:", 0);
}

- (NSString)taskName
{
  return self->_taskName;
}

- (id)expirationHandler
{
  return self->_expirationHandler;
}

- (void)setExpirationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BKSProcessAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (id)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong(&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
  objc_storeStrong((id *)&self->_taskName, 0);
}

uint64_t __59__WFBKSBackgroundAssertion_initWithName_expirationHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(v2[2]);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "end");
}

+ (id)backgroundAssertionWithName:(id)a3 expirationHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:expirationHandler:", v7, v6);

  return v8;
}

@end
