@implementation AISDCloudDataProtectionHelper

- (AISDCloudDataProtectionHelper)initWithStateController:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  AISDCloudDataProtectionHelper *v9;
  AISDCloudDataProtectionHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AISDCloudDataProtectionHelper;
  v9 = -[AISDCloudDataProtectionHelper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stateController, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)checkAvailabilityWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  qos_class_t v6;
  NSObject *v7;
  id v8;
  dispatch_block_t v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[AISDCloudDataProtectionHelper queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = qos_class_self();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__AISDCloudDataProtectionHelper_checkAvailabilityWithCompletionHandler___block_invoke;
  v10[3] = &unk_2507E6EB0;
  v10[4] = self;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v6, 0, v10);
  dispatch_async(v7, v9);

}

void __72__AISDCloudDataProtectionHelper_checkAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = objc_msgSend(v2, "_onqueue_checkAvailability:", &v6);
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v3, v4);

}

- (BOOL)_onqueue_checkAvailability:(id *)a3
{
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  id v11;

  -[AISDCloudDataProtectionHelper stateController](self, "stateController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = objc_msgSend(v4, "isManateeAvailable:", &v11);
  v6 = v11;

  v7 = objc_msgSend(v6, "code");
  if ((unint64_t)(v7 + 5110) <= 8 && ((1 << (v7 - 10)) & 0x103) != 0
    || (unint64_t)(v7 + 5404) < 2)
  {

    v6 = 0;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v5;
}

- (CDPStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
  objc_storeStrong((id *)&self->_stateController, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end
