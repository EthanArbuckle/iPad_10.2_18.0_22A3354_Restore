@implementation CPLEngineBlocker

- (CPLEngineBlocker)initWithWriteTransactionBlocker:(id)a3 schedulerBlocker:(id)a4
{
  id v7;
  id v8;
  CPLEngineBlocker *v9;
  CPLEngineBlocker *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLEngineBlocker;
  v9 = -[CPLEngineBlocker init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_writeTransactionBlocker, a3);
    objc_storeStrong((id *)&v10->_schedulerBlocker, a4);
    v10->_blocking = 1;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_blocking)
  {
    -[CPLEngineWriteTransactionBlocker unblock](self->_writeTransactionBlocker, "unblock");
    -[CPLEngineSchedulerBlocker unblock](self->_schedulerBlocker, "unblock");
  }
  v3.receiver = self;
  v3.super_class = (Class)CPLEngineBlocker;
  -[CPLEngineBlocker dealloc](&v3, sel_dealloc);
}

- (void)unblock
{
  -[CPLEngineWriteTransactionBlocker unblock](self->_writeTransactionBlocker, "unblock");
  -[CPLEngineSchedulerBlocker unblock](self->_schedulerBlocker, "unblock");
  self->_blocking = 0;
}

- (CPLEngineWriteTransactionBlocker)writeTransactionBlocker
{
  return self->_writeTransactionBlocker;
}

- (CPLEngineSchedulerBlocker)schedulerBlocker
{
  return self->_schedulerBlocker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerBlocker, 0);
  objc_storeStrong((id *)&self->_writeTransactionBlocker, 0);
}

@end
