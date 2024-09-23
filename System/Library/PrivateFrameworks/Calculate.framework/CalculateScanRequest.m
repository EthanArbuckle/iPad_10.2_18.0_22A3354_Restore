@implementation CalculateScanRequest

- (void)update
{
  NSObject *v3;
  _QWORD block[5];

  +[CalculateScanRequest concurrentQueue](CalculateScanRequest, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CalculateScanRequest_update__block_invoke;
  block[3] = &unk_1E6EA05D0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)cancel
{
  +[CalculateScanRequest _lock](CalculateScanRequest, "_lock");
  -[CalculateScanRequest setIsCanceled:](self, "setIsCanceled:", 1);
  +[CalculateScanRequest _unlock](CalculateScanRequest, "_unlock");
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

void __30__CalculateScanRequest_update__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[Calculate scan:options:stop:](Calculate, "scan:options:stop:", v2, v3, *(_QWORD *)(a1 + 32) + 8);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[CalculateScanRequest _lock](CalculateScanRequest, "_lock");
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {

    v7 = (id)MEMORY[0x1E0C9AA60];
  }
  +[CalculateScanRequest _unlock](CalculateScanRequest, "_unlock");
  objc_msgSend(*(id *)(a1 + 32), "resultHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "resultHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

    v5 = v7;
  }

}

+ (void)_lock
{
  if (_lock_onceToken_583 != -1)
    dispatch_once(&_lock_onceToken_583, &__block_literal_global_584);
  objc_msgSend((id)calculateScanRequestLock, "lock");
}

+ (void)_unlock
{
  objc_msgSend((id)calculateScanRequestLock, "unlock");
}

+ (id)concurrentQueue
{
  if (concurrentQueue_onceToken[0] != -1)
    dispatch_once(concurrentQueue_onceToken, &__block_literal_global_12_581);
  return (id)concurrentQueue_queue;
}

void __39__CalculateScanRequest_concurrentQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.framework.calculate.scan", MEMORY[0x1E0C80D50]);
  v1 = (void *)concurrentQueue_queue;
  concurrentQueue_queue = (uint64_t)v0;

}

void __29__CalculateScanRequest__lock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)calculateScanRequestLock;
  calculateScanRequestLock = (uint64_t)v0;

}

@end
