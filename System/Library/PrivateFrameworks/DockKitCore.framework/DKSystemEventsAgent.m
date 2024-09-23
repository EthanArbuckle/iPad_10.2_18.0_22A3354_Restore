@implementation DKSystemEventsAgent

- (DKSystemEventsAgent)init
{
  DKSystemEventsAgent *v2;
  SystemEventsAgent *v3;
  SystemEventsAgent *agent;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DKSystemEventsAgent;
  v2 = -[DKSystemEventsAgent init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SystemEventsAgent);
    agent = v2->_agent;
    v2->_agent = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.systemEventsAgent", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)registerForSystemEvents:(id)a3 forConnectedEvents:(id)a4
{
  id v6;
  id v7;
  SystemEventsAgent *agent;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  agent = self->_agent;
  v12 = v7;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__DKSystemEventsAgent_registerForSystemEvents_forConnectedEvents___block_invoke;
  v13[3] = &unk_250B71F20;
  v13[4] = self;
  v14 = v6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__DKSystemEventsAgent_registerForSystemEvents_forConnectedEvents___block_invoke_2;
  v11[3] = &unk_250B71F48;
  v9 = v7;
  v10 = v6;
  -[SystemEventsAgent registerWithCallback:connectedCallback:completionHandler:](agent, "registerWithCallback:connectedCallback:completionHandler:", v13, v11, &__block_literal_global_0);

}

uint64_t __66__DKSystemEventsAgent_registerForSystemEvents_forConnectedEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSystemEvent:callback:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __66__DKSystemEventsAgent_registerForSystemEvents_forConnectedEvents___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerForSystemEvents:(id)a3
{
  id v4;
  SystemEventsAgent *agent;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  agent = self->_agent;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__DKSystemEventsAgent_registerForSystemEvents___block_invoke;
  v7[3] = &unk_250B71F20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SystemEventsAgent registerWithCallback:completionHandler:](agent, "registerWithCallback:completionHandler:", v7, &__block_literal_global_24);

}

uint64_t __47__DKSystemEventsAgent_registerForSystemEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSystemEvent:callback:", a2, *(_QWORD *)(a1 + 40));
}

- (void)handleSystemEvent:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  double v10;
  int v11;
  int v12;
  void *v13;
  DKSystemEvent *v14;
  NSObject *workQueue;
  DKSystemEvent *v16;
  id v17;
  _QWORD v18[4];
  DKSystemEvent *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "header");
  if (v8 == +[AccessorySystemEvent kHeaderCameraShutter](_TtC11DockKitCore20AccessorySystemEvent, "kHeaderCameraShutter"))
  {
    v9 = 0;
    v10 = (double)objc_msgSend(v6, "payload");
  }
  else
  {
    v11 = objc_msgSend(v6, "header");
    if (v11 == +[AccessorySystemEvent kHeaderCameraFlip](_TtC11DockKitCore20AccessorySystemEvent, "kHeaderCameraFlip"))
    {
      v10 = (double)objc_msgSend(v6, "payload");
      v9 = 1;
    }
    else
    {
      v12 = objc_msgSend(v6, "header");
      if (v12 == +[AccessorySystemEvent kHeaderCameraZoom](_TtC11DockKitCore20AccessorySystemEvent, "kHeaderCameraZoom"))
      {
        v10 = (double)(__int16)objc_msgSend(v6, "payload") / 100.0;
        v9 = 2;
      }
      else
      {
        v9 = 3;
        v10 = 0.0;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[DKSystemEvent initWithType:value:]([DKSystemEvent alloc], "initWithType:value:", v9, v13);
  workQueue = self->_workQueue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __50__DKSystemEventsAgent_handleSystemEvent_callback___block_invoke;
  v18[3] = &unk_250B71FB0;
  v19 = v14;
  v20 = v7;
  v16 = v14;
  v17 = v7;
  dispatch_async(workQueue, v18);

}

uint64_t __50__DKSystemEventsAgent_handleSystemEvent_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)startCaptureIfNeeded:(unsigned __int8)a3 orientation:(unsigned __int8)a4 finished:(id)a5
{
  uint64_t v5;
  int v6;
  id v8;
  void *v9;
  SystemEventsAgent *agent;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (!v6)
  {
    agent = self->_agent;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__DKSystemEventsAgent_startCaptureIfNeeded_orientation_finished___block_invoke;
    v11[3] = &unk_250B71F48;
    v12 = v8;
    -[SystemEventsAgent startPanoramaCaptureWithOrientation:finishedCallback:completionHandler:](agent, "startPanoramaCaptureWithOrientation:finishedCallback:completionHandler:", v5, v11, &__block_literal_global_28);

  }
}

uint64_t __65__DKSystemEventsAgent_startCaptureIfNeeded_orientation_finished___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopCaptureIfNeeded:(unsigned __int8)a3
{
  if (!a3)
    -[SystemEventsAgent stopPanoramaCaptureWithCompletionHandler:](self->_agent, "stopPanoramaCaptureWithCompletionHandler:", &__block_literal_global_29);
}

- (void)cameraShutterModeChanged:(unsigned __int8)a3
{
  SystemEventsAgent *agent;

  agent = self->_agent;
  if (a3)
    -[SystemEventsAgent deinitializePanoramaWithCompletionHandler:](agent, "deinitializePanoramaWithCompletionHandler:", &__block_literal_global_31);
  else
    -[SystemEventsAgent initializePanoramaWithCompletionHandler:](agent, "initializePanoramaWithCompletionHandler:", &__block_literal_global_30);
}

- (void)panoramaCaptureDirectionChanged:(unsigned __int8)a3
{
  -[SystemEventsAgent updatePanoramaCaptureDirection:](self->_agent, "updatePanoramaCaptureDirection:", a3);
}

- (void)deregisterForSystemEvents:(id)a3
{
  id v4;
  SystemEventsAgent *agent;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  agent = self->_agent;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__DKSystemEventsAgent_deregisterForSystemEvents___block_invoke;
  v7[3] = &unk_250B72080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SystemEventsAgent deregisterWithCompletionHandler:](agent, "deregisterWithCompletionHandler:", v7);

}

void __49__DKSystemEventsAgent_deregisterForSystemEvents___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__DKSystemEventsAgent_deregisterForSystemEvents___block_invoke_2;
  block[3] = &unk_250B72058;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __49__DKSystemEventsAgent_deregisterForSystemEvents___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deregisterForSystemEvents
{
  -[SystemEventsAgent deregisterSync](self->_agent, "deregisterSync");
}

- (void)dealloc
{
  SystemEventsAgent *agent;
  objc_super v4;

  NSLog(CFSTR("DKSystemEventsAgent: dealloc"), a2);
  agent = self->_agent;
  self->_agent = 0;

  v4.receiver = self;
  v4.super_class = (Class)DKSystemEventsAgent;
  -[DKSystemEventsAgent dealloc](&v4, sel_dealloc);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

@end
