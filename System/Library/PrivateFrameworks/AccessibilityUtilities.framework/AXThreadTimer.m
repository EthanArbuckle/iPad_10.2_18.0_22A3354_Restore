@implementation AXThreadTimer

- (AXThreadTimer)initWithThread:(id)a3
{
  id v5;
  AXThreadTimer *v6;
  AXThreadTimer *v7;
  AXThreadTimer *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXThreadTimer;
  v6 = -[AXThreadTimer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_thread, a3);
    v8 = v7;
  }

  return v7;
}

- (void)_runAfterDelay:(id)a3
{
  id v4;
  float v5;
  float v6;
  id v7;

  v4 = a3;
  -[AXThreadTimer task](self, "task");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(v7, "performSelector:withObject:afterDelay:", &sel_run, 0, v6);
}

- (void)afterDelay:(double)a3 processBlock:(id)a4
{
  -[AXThreadTimer afterDelay:processBlock:cancelBlock:](self, "afterDelay:processBlock:cancelBlock:", a4, 0, a3);
}

- (void)afterDelay:(double)a3 processBlock:(id)a4 cancelBlock:(id)a5
{
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  id cancelBlock;
  AXThreadTimerTask *v13;
  NSThread *v14;
  NSThread *thread;
  NSThread *v16;
  void *v17;
  id v18;

  v18 = a5;
  v8 = a4;
  -[AXThreadTimer task](self, "task");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isFinished") & 1) != 0)
  {

  }
  else
  {
    v10 = -[AXThreadTimer automaticallyCancelPendingBlockUponSchedulingNewBlock](self, "automaticallyCancelPendingBlockUponSchedulingNewBlock");

    if (v10)
      -[AXThreadTimer cancel](self, "cancel");
  }
  v11 = (void *)objc_msgSend(v18, "copy");
  cancelBlock = self->_cancelBlock;
  self->_cancelBlock = v11;

  v13 = objc_alloc_init(AXThreadTimerTask);
  -[AXThreadTimerTask setBlock:](v13, "setBlock:", v8);

  -[AXThreadTimer setTask:](self, "setTask:", v13);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v14 = (NSThread *)objc_claimAutoreleasedReturnValue();
  thread = self->_thread;

  if (v14 == thread)
  {
    -[AXThreadTimer task](self, "task");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "performSelector:withObject:afterDelay:", &sel_run, 0, a3);
  }
  else
  {
    v16 = self->_thread;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXThreadTimer performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__runAfterDelay_, v16, v17, 0);
  }

}

- (void)cancel
{
  void *v3;
  char v4;
  void *v5;
  void (**cancelBlock)(void);
  id v7;

  -[AXThreadTimer task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFinished");

  if ((v4 & 1) == 0)
  {
    -[AXThreadTimer task](self, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCancel:", 1);

    cancelBlock = (void (**)(void))self->_cancelBlock;
    if (cancelBlock)
      cancelBlock[2]();
    -[AXThreadTimer setTask:](self, "setTask:", 0);
    v7 = self->_cancelBlock;
    self->_cancelBlock = 0;

  }
}

- (BOOL)isCancelled
{
  void *v2;
  char v3;

  -[AXThreadTimer task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  return v3;
}

- (BOOL)isPending
{
  void *v3;
  void *v4;
  int v5;

  -[AXThreadTimer task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AXThreadTimer task](self, "task");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFinished") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[AXThreadTimer task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (AXThreadTimerTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock
{
  return self->_automaticallyCancelPendingBlockUponSchedulingNewBlock;
}

- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3
{
  self->_automaticallyCancelPendingBlockUponSchedulingNewBlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_thread, 0);
}

@end
