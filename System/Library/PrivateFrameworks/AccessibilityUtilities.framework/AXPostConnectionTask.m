@implementation AXPostConnectionTask

- (AXPostConnectionTask)initWithConnectBlock:(id)a3 timeout:(double)a4 accessQueue:(id)a5
{
  id v8;
  id v9;
  AXPostConnectionTask *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  AXPostConnectionTask *v14;
  _QWORD v16[4];
  AXPostConnectionTask *v17;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AXPostConnectionTask;
  v10 = -[AXPostConnectionTask init](&v18, sel_init);
  if (v10)
  {
    v11 = v10;
    if (v8)
    {
      -[AXPostConnectionTask setPostConnectionBlock:](v10, "setPostConnectionBlock:", v8);
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF3948]), "initWithTargetAccessQueue:", v9);
      objc_msgSend(v11, "setTimeoutTimer:", v12);
      objc_msgSend(v11, "timeoutTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65__AXPostConnectionTask_initWithConnectBlock_timeout_accessQueue___block_invoke;
      v16[3] = &unk_1E24C4C38;
      v14 = v11;
      v17 = v14;
      objc_msgSend(v13, "afterDelay:processWritingBlock:", v16, a4);

      v11 = (void *)v12;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __65__AXPostConnectionTask_initWithConnectBlock_timeout_accessQueue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDidTimeout:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_performTask");
}

- (void)performTask
{
  void *v3;

  -[AXPostConnectionTask timeoutTimer](self, "timeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[AXPostConnectionTask _performTask](self, "_performTask");
}

- (void)_performTask
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AXPostConnectionTask__performTask__block_invoke;
  block[3] = &unk_1E24C4C38;
  block[4] = self;
  dispatch_async(v3, block);

}

void __36__AXPostConnectionTask__performTask__block_invoke(uint64_t a1)
{
  void (**v2)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "postConnectionBlock");
  v2 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v2[2](v2, objc_msgSend(*(id *)(a1 + 32), "didTimeout"));

}

- (id)postConnectionBlock
{
  return self->_postConnectionBlock;
}

- (void)setPostConnectionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AXAccessQueueTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (BOOL)didTimeout
{
  return self->_didTimeout;
}

- (void)setDidTimeout:(BOOL)a3
{
  self->_didTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_postConnectionBlock, 0);
}

@end
