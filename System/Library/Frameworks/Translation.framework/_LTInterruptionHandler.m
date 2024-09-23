@implementation _LTInterruptionHandler

- (_LTInterruptionHandler)init
{
  _LTInterruptionHandler *v2;
  _LTInterruptionHandler *v3;
  uint64_t v4;
  NSHashTable *observers;
  _LTInterruptionHandler *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LTInterruptionHandler;
  v2 = -[_LTInterruptionHandler init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_queue, MEMORY[0x24BDAC9B8]);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38___LTInterruptionHandler_addObserver___block_invoke;
  block[3] = &unk_250693708;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41___LTInterruptionHandler_removeObserver___block_invoke;
  block[3] = &unk_250693708;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)addObservationBlock:(id)a3
{
  id v4;
  _LTBlockBasedInterruptionHandler *v5;

  v4 = a3;
  v5 = objc_alloc_init(_LTBlockBasedInterruptionHandler);
  -[_LTBlockBasedInterruptionHandler setHandler:](v5, "setHandler:", v4);

  -[_LTInterruptionHandler addObserver:](self, "addObserver:", v5);
  return v5;
}

- (void)_didReceiveInterruption
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49___LTInterruptionHandler__didReceiveInterruption__block_invoke;
  v4[3] = &unk_250693730;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
