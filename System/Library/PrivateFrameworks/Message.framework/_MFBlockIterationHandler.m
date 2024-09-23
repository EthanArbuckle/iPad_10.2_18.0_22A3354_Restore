@implementation _MFBlockIterationHandler

- (_MFBlockIterationHandler)initWithBlock:(id)a3
{
  id v4;
  _MFBlockIterationHandler *v5;
  uint64_t v6;
  id block;
  uint64_t v8;
  MFActivityMonitor *monitor;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MFBlockIterationHandler;
  v5 = -[_MFBlockIterationHandler init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v5->_cancelled = 0;
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v8 = objc_claimAutoreleasedReturnValue();
    monitor = v5->_monitor;
    v5->_monitor = (MFActivityMonitor *)v8;

  }
  return v5;
}

- (BOOL)handleMessage:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (!-[_MFBlockIterationHandler shouldCancel](self, "shouldCancel"))
  {
    v5 = (void *)MEMORY[0x1A85B0E24]();
    (*((void (**)(void))self->_block + 2))();
    objc_autoreleasePoolPop(v5);
  }
  v6 = !self->_cancelled;

  return v6;
}

- (BOOL)shouldCancel
{
  return self->_cancelled || -[MFActivityMonitor shouldCancel](self->_monitor, "shouldCancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
