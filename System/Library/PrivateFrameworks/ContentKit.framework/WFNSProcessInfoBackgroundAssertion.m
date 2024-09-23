@implementation WFNSProcessInfoBackgroundAssertion

- (WFNSProcessInfoBackgroundAssertion)initWithName:(id)a3 expirationHandler:(id)a4
{
  id v6;
  id v7;
  WFNSProcessInfoBackgroundAssertion *v8;
  void *v9;
  WFNSProcessInfoBackgroundAssertion *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  dispatch_semaphore_t v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)WFNSProcessInfoBackgroundAssertion;
  v8 = -[WFNSProcessInfoBackgroundAssertion init](&v24, sel_init);
  if (v8)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__23749;
    v22 = __Block_byref_object_dispose__23750;
    v23 = dispatch_semaphore_create(0);
    objc_storeStrong((id *)&v8->_semaphore, (id)v19[5]);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__1;
    v16[4] = __Block_byref_object_dispose__2;
    v17 = _Block_copy(v7);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__WFNSProcessInfoBackgroundAssertion_initWithName_expirationHandler___block_invoke;
    v12[3] = &unk_24C4E3610;
    v14 = v16;
    v15 = &v18;
    v13 = v6;
    objc_msgSend(v9, "performExpiringActivityWithReason:usingBlock:", v13, v12);

    v10 = v8;
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(&v18, 8);
  }

  return v8;
}

- (void)end
{
  NSObject *v2;

  -[WFNSProcessInfoBackgroundAssertion semaphore](self, "semaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v2);

}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
}

void __69__WFNSProcessInfoBackgroundAssertion_initWithName_expirationHandler___block_invoke(_QWORD *a1, int a2)
{
  uint64_t v3;
  void (**v4)(void);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(_QWORD *)(a1[5] + 8);
    v4 = *(void (***)(void))(v3 + 40);
    if (v4)
    {
      v4[2]();
      v3 = *(_QWORD *)(a1[5] + 8);
      v4 = *(void (***)(void))(v3 + 40);
    }
    *(_QWORD *)(v3 + 40) = 0;

  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    getWFBackgroundAssertionLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = a1[4];
      v11 = 136315394;
      v12 = "-[WFNSProcessInfoBackgroundAssertion initWithName:expirationHandler:]_block_invoke";
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_INFO, "%s Finished background assertion for %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
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
