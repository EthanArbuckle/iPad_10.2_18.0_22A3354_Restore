@implementation WFWaitToReturnAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  const char *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  self->_token = -1;
  objc_initWeak(&location, self);
  v5 = (const char *)*MEMORY[0x24BE196A8];
  v6 = MEMORY[0x24BDAC9B8];
  v7 = MEMORY[0x24BDAC9B8];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__WFWaitToReturnAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_24F8BB660;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch(v5, &self->_token, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_token))
    notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)WFWaitToReturnAction;
  -[WFWaitToReturnAction dealloc](&v3, sel_dealloc);
}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFWaitToReturnAction;
  -[WFWaitToReturnAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

void __51__WFWaitToReturnAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  notify_cancel(a2);
  objc_msgSend(WeakRetained, "finishRunningWithError:", 0);

}

@end
