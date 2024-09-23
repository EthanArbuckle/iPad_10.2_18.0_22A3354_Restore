@implementation MRUCoordinatedUpdateController

- (MRUCoordinatedUpdateController)init
{
  MRUCoordinatedUpdateController *v2;
  uint64_t v3;
  NSMutableArray *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUCoordinatedUpdateController;
  v2 = -[MRUCoordinatedUpdateController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)setCadence:(double)a3
{
  if (self->_cadence != a3)
  {
    self->_cadence = a3;
    -[MRUCoordinatedUpdateController setupTimer](self, "setupTimer");
  }
}

- (void)addUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MRUCoordinatedUpdate *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *context;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[MRUCoordinatedUpdate initWithUpdate:completion:]([MRUCoordinatedUpdate alloc], "initWithUpdate:completion:", v7, v6);

  -[NSMutableArray addObject:](self->_queue, "addObject:", v8);
  MCLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    v11 = -[NSMutableArray count](self->_queue, "count");
    context = self->_context;
    v13 = 138543874;
    v14 = v10;
    v15 = 2048;
    v16 = v11;
    v17 = 2114;
    v18 = context;
    _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ adding update with items in queue: #%lu for context: %{public}@", (uint8_t *)&v13, 0x20u);
  }

  -[MRUCoordinatedUpdateController setupTimer](self, "setupTimer");
}

- (void)processQueue
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSString *context;
  id WeakRetained;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_queue, "copy");
  -[NSMutableArray removeAllObjects](self->_queue, "removeAllObjects");
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    v6 = objc_msgSend(v3, "count");
    context = self->_context;
    *(_DWORD *)buf = 138543874;
    v16 = v5;
    v17 = 2048;
    v18 = v6;
    v19 = 2114;
    v20 = context;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ number of items processed: #%lu for context: %{public}@", buf, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__MRUCoordinatedUpdateController_processQueue__block_invoke;
  v13[3] = &unk_1E5818C88;
  v14 = v3;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __46__MRUCoordinatedUpdateController_processQueue__block_invoke_2;
  v11[3] = &unk_1E5818C88;
  v12 = v14;
  v10 = v14;
  objc_msgSend(WeakRetained, "coordinatedUpdateController:processCoordinatedUpdates:completion:", self, v13, v11);

}

uint64_t __46__MRUCoordinatedUpdateController_processQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_process);
}

uint64_t __46__MRUCoordinatedUpdateController_processQueue__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_complete);
}

- (void)setupTimer
{
  id v3;
  double cadence;
  uint64_t v5;
  id v6;
  MPWeakTimer *v7;
  MPWeakTimer *timer;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_timer)
  {
    if (-[NSMutableArray count](self->_queue, "count"))
    {
      objc_initWeak(&location, self);
      v3 = objc_alloc(MEMORY[0x1E0CC2558]);
      cadence = self->_cadence;
      v5 = MEMORY[0x1E0C80D38];
      v6 = MEMORY[0x1E0C80D38];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44__MRUCoordinatedUpdateController_setupTimer__block_invoke;
      v9[3] = &unk_1E5818E18;
      objc_copyWeak(&v10, &location);
      v7 = (MPWeakTimer *)objc_msgSend(v3, "initWithInterval:queue:block:", v5, v9, cadence);
      timer = self->_timer;
      self->_timer = v7;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __44__MRUCoordinatedUpdateController_setupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetTimer");

}

- (void)resetTimer
{
  MPWeakTimer *timer;

  -[MRUCoordinatedUpdateController processQueue](self, "processQueue");
  -[MPWeakTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  -[MRUCoordinatedUpdateController setupTimer](self, "setupTimer");
}

- (MRUCoordinatedUpdateControllerDelegate)delegate
{
  return (MRUCoordinatedUpdateControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)cadence
{
  return self->_cadence;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (MPWeakTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
