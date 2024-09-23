@implementation NUAnimationQueue

- (NUAnimationQueue)init
{
  NUAnimationQueue *v2;
  NSMutableArray *v3;
  NSMutableArray *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUAnimationQueue;
  v2 = -[NUAnimationQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    queue = v2->_queue;
    v2->_queue = v3;

    v2->_running = 0;
  }
  return v2;
}

- (void)addAnimation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NUAnimationRunner *v7;

  v4 = (void *)MEMORY[0x24BDD17F0];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  v7 = -[NUAnimationRunner initWithRunBlock:]([NUAnimationRunner alloc], "initWithRunBlock:", v5);

  -[NUAnimationQueue queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  if (!-[NUAnimationQueue isRunning](self, "isRunning"))
    -[NUAnimationQueue runUntilEmpty](self, "runUntilEmpty");

}

- (void)runUntilEmpty
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NUAnimationQueue queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[NUAnimationQueue setRunning:](self, "setRunning:", 1);
    -[NUAnimationQueue queue](self, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fc_popFirstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __33__NUAnimationQueue_runUntilEmpty__block_invoke;
    v7[3] = &unk_24D5A2B30;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "runWithFinishBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
  else
  {
    -[NUAnimationQueue setRunning:](self, "setRunning:", 0);
  }
}

- (NSMutableArray)queue
{
  return self->_queue;
}

void __33__NUAnimationQueue_runUntilEmpty__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "runUntilEmpty");
    WeakRetained = v3;
  }

}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)cancel
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NUAnimationQueue queue](self, "queue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
