@implementation HMMTROperationWithPriority

- (HMMTROperationWithPriority)initWithQueuePriority:(int64_t)a3 block:(id)a4
{
  id v6;
  HMMTROperationWithPriority *v7;
  uint64_t v8;
  id operationBlock;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMTROperationWithPriority;
  v7 = -[HMMTROperationWithPriority init](&v11, sel_init);
  if (v7)
  {
    v8 = MEMORY[0x242656B10](v6);
    operationBlock = v7->_operationBlock;
    v7->_operationBlock = (id)v8;

    -[HMMTROperationWithPriority setQueuePriority:](v7, "setQueuePriority:", a3);
  }

  return v7;
}

- (void)main
{
  void (**v2)(void);

  -[HMMTROperationWithPriority operationBlock](self, "operationBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationBlock, 0);
}

@end
