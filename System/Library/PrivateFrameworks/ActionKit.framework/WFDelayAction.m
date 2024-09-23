@implementation WFDelayAction

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  uint64_t v12;
  NSObject *v13;
  OS_dispatch_source *timer;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  NSObject *v18;
  WFDelayAction *v19;
  _QWORD handler[5];

  -[WFDelayAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDelayTime"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v7 = objc_alloc(MEMORY[0x24BEC3AF8]);
  -[WFDelayAction progress](self, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithParent:pendingUnitCount:duration:", v8, 1, v6);
  -[WFDelayAction setDelayProgress:](self, "setDelayProgress:", v9);

  v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  v11 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
  v12 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __44__WFDelayAction_runAsynchronouslyWithInput___block_invoke;
  handler[3] = &unk_24F8BB638;
  handler[4] = self;
  dispatch_source_set_cancel_handler(v10, handler);
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __44__WFDelayAction_runAsynchronouslyWithInput___block_invoke_2;
  v17[3] = &unk_24F8BA480;
  v13 = v10;
  v18 = v13;
  v19 = self;
  dispatch_source_set_event_handler(v13, v17);
  timer = self->_timer;
  self->_timer = (OS_dispatch_source *)v13;
  v15 = v13;

  dispatch_resume(v15);
  -[WFDelayAction delayProgress](self, "delayProgress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "start");

}

- (void)finishRunningWithError:(id)a3
{
  NSObject *timer;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFDelayAction;
  -[WFDelayAction finishRunningWithError:](&v6, sel_finishRunningWithError_, a3);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
  }
  else
  {
    -[WFDelayAction delayProgress](self, "delayProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finish");

  }
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (WFAutoIncrementingProgress)delayProgress
{
  return self->_delayProgress;
}

- (void)setDelayProgress:(id)a3
{
  objc_storeStrong((id *)&self->_delayProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayProgress, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

void __44__WFDelayAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "delayProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 336);
  *(_QWORD *)(v3 + 336) = 0;

}

uint64_t __44__WFDelayAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", 0);
}

@end
