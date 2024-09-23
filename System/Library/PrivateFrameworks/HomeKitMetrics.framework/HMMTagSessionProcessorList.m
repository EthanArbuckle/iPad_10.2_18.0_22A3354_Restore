@implementation HMMTagSessionProcessorList

- (HMMTagSessionProcessorList)initWithWorkQueue:(id)a3
{
  id v5;
  HMMTagSessionProcessorList *v6;
  HMMTagSessionProcessorList *v7;
  NSArray *processors;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTagSessionProcessorList;
  v6 = -[HMMTagSessionProcessorList init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    processors = v6->_processors;
    v6->_processors = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_storeStrong((id *)&v7->_workQueue, a3);
  }

  return v7;
}

- (void)addProcessor:(id)a3
{
  void *v4;
  NSArray *processors;
  id v6;
  NSArray *v7;
  NSArray *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  processors = self->_processors;
  v6 = a3;
  objc_msgSend(v4, "arrayWithArray:", processors);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v6);

  v7 = (NSArray *)objc_msgSend(v9, "copy");
  v8 = self->_processors;
  self->_processors = v7;

}

- (void)removeProcessor:(id)a3
{
  void *v4;
  NSArray *processors;
  id v6;
  NSArray *v7;
  NSArray *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  processors = self->_processors;
  v6 = a3;
  objc_msgSend(v4, "arrayWithArray:", processors);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectIdenticalTo:", v6);

  v7 = (NSArray *)objc_msgSend(v9, "copy");
  v8 = self->_processors;
  self->_processors = v7;

}

- (id)objectForChildActivity
{
  HMMTagSessionProcessorList *v3;
  NSObject *workQueue;
  HMMTagSessionProcessorList *v5;
  HMMTagSessionProcessorList *v6;
  _QWORD v8[4];
  HMMTagSessionProcessorList *v9;
  HMMTagSessionProcessorList *v10;

  v3 = -[HMMTagSessionProcessorList initWithWorkQueue:]([HMMTagSessionProcessorList alloc], "initWithWorkQueue:", self->_workQueue);
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__HMMTagSessionProcessorList_objectForChildActivity__block_invoke;
  v8[3] = &unk_1E898A788;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_async(workQueue, v8);
  v6 = v5;

  return v6;
}

- (NSArray)processors
{
  return self->_processors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processors, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __52__HMMTagSessionProcessorList_objectForChildActivity__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(*(_QWORD *)(a1 + 40) + 16));
}

@end
