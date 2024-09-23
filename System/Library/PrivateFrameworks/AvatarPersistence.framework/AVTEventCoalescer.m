@implementation AVTEventCoalescer

- (AVTEventCoalescer)initWithDelay:(double)a3 queue:(id)a4 logger:(id)a5
{
  id v9;
  id v10;
  AVTEventCoalescer *v11;
  AVTEventCoalescer *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVTEventCoalescer;
  v11 = -[AVTEventCoalescer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_delay = a3;
    objc_storeStrong((id *)&v11->_workQueue, a4);
    objc_storeStrong((id *)&v12->_logger, a5);
  }

  return v12;
}

- (void)registerEventForCoalescingWithLabel:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[AVTEventCoalescer eventHandler](self, "eventHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Coalescer already received an eventHandler"));
  -[AVTEventCoalescer setEventLabel:](self, "setEventLabel:", v8);
  -[AVTEventCoalescer setEventHandler:](self, "setEventHandler:", v6);

}

- (void)eventDidOccur:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[AVTEventCoalescer eventHandler](self, "eventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Coalescer did not receive an eventHandler"));
  -[AVTEventCoalescer logger](self, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTEventCoalescer eventLabel](self, "eventLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logCoalesceableEventOccured:", v7);

  -[AVTEventCoalescer workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__AVTEventCoalescer_eventDidOccur___block_invoke;
  v10[3] = &unk_24DD31740;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

void __35__AVTEventCoalescer_eventDidOccur___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  dispatch_time_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "eventDeliveryScheduled"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setEventDeliveryScheduled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "delay");
    v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__AVTEventCoalescer_eventDidOccur___block_invoke_2;
    v7[3] = &unk_24DD31740;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    dispatch_after(v4, v5, v7);

  }
}

uint64_t __35__AVTEventCoalescer_eventDidOccur___block_invoke_2(uint64_t a1)
{
  void (**v2)(void);
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setEventDeliveryScheduled:", 0);
  objc_msgSend(*(id *)(a1 + 32), "eventHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)eventLabel
{
  return self->_eventLabel;
}

- (void)setEventLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (double)delay
{
  return self->_delay;
}

- (BOOL)eventDeliveryScheduled
{
  return self->_eventDeliveryScheduled;
}

- (void)setEventDeliveryScheduled:(BOOL)a3
{
  self->_eventDeliveryScheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_eventLabel, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end
