@implementation HMFScheduler

+ (id)mainScheduler
{
  if (qword_1ED0132B8 != -1)
    dispatch_once(&qword_1ED0132B8, &__block_literal_global_1);
  return (id)qword_1ED0132C0;
}

+ (id)defaultScheduler
{
  if (_MergedGlobals_79 != -1)
    dispatch_once(&_MergedGlobals_79, &__block_literal_global_51);
  return (id)qword_1ED0132B0;
}

- (id)performOperation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (self && v4)
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v4);
  return v5;
}

- (id)performBlock:(id)a3
{
  HMFScheduler *v4;
  void *v5;

  v4 = self;
  v5 = 0;
  if (v4)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[NSOperationQueue addOperation:](v4->_operationQueue, "addOperation:", v5);
    }
  }

  return v5;
}

- (id)performWithQualityOfService:(int64_t)a3 block:(id)a4
{
  HMFScheduler *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;

  v6 = self;
  v7 = 0;
  if (v6 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v10 = v8;
    v7 = v10;
    if (v10)
    {
      if (a3 != -1)
      {
        objc_msgSend(v10, "setQualityOfService:", a3);
        if (!objc_msgSend(v7, "queuePriority"))
        {
          v11 = __ROR8__(a3 - 9, 3);
          if (v11 > 3)
            v12 = 0;
          else
            v12 = qword_19B5C6AA0[v11];
          objc_msgSend(v7, "setQueuePriority:", v12);
        }
      }
      objc_msgSend(v9[1], "addOperation:", v7);
    }

  }
  return v7;
}

void __29__HMFScheduler_mainScheduler__block_invoke()
{
  HMFScheduler *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [HMFScheduler alloc];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[HMFScheduler initWithQueue:](v0, "initWithQueue:", v3);
  v2 = (void *)qword_1ED0132C0;
  qword_1ED0132C0 = v1;

}

void __32__HMFScheduler_defaultScheduler__block_invoke()
{
  HMFScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(HMFScheduler);
  v1 = (void *)qword_1ED0132B0;
  qword_1ED0132B0 = (uint64_t)v0;

}

- (HMFScheduler)initWithQueue:(id)a3
{
  id v5;
  HMFScheduler *v6;
  HMFScheduler *v7;
  NSOperationQueue *v8;
  NSOperationQueue *operationQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMFScheduler;
  v6 = -[HMFScheduler init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_operationQueue, a3);
    }
    else
    {
      v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      operationQueue = v7->_operationQueue;
      v7->_operationQueue = v8;

      -[NSOperationQueue setName:](v7->_operationQueue, "setName:", CFSTR("com.apple.HMFoundation.Scheduler"));
    }
  }

  return v7;
}

- (HMFScheduler)init
{
  return -[HMFScheduler initWithQueue:](self, "initWithQueue:", 0);
}

- (id)performSelector:(SEL)a3 target:(id)a4 argument:(id)a5
{
  HMFScheduler *v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;

  v8 = self;
  v9 = 0;
  if (v8)
  {
    if (a3)
    {
      if (a4)
      {
        v10 = (objc_class *)MEMORY[0x1E0CB36C0];
        v11 = a5;
        v12 = a4;
        v9 = (void *)objc_msgSend([v10 alloc], "initWithTarget:selector:object:", v12, a3, v11);

        if (v9)
          -[NSOperationQueue addOperation:](v8->_operationQueue, "addOperation:", v9);
      }
    }
  }

  return v9;
}

- (id)performSelector:(SEL)a3 target:(id)a4 argument:(id)a5 qualityOfService:(int64_t)a6
{
  HMFScheduler *v10;
  void *v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  id *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;

  v10 = self;
  v11 = 0;
  if (v10 && a3 && a4)
  {
    v12 = (objc_class *)MEMORY[0x1E0CB36C0];
    v13 = a5;
    v14 = a4;
    v15 = (void *)objc_msgSend([v12 alloc], "initWithTarget:selector:object:", v14, a3, v13);

    v16 = v10;
    v17 = v15;
    v11 = v17;
    if (v17)
    {
      if (a6 != -1)
      {
        objc_msgSend(v17, "setQualityOfService:", a6);
        if (!objc_msgSend(v11, "queuePriority"))
        {
          v18 = __ROR8__(a6 - 9, 3);
          if (v18 > 3)
            v19 = 0;
          else
            v19 = qword_19B5C6AA0[v18];
          objc_msgSend(v11, "setQueuePriority:", v19);
        }
      }
      objc_msgSend(v16[1], "addOperation:", v11);
    }

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
