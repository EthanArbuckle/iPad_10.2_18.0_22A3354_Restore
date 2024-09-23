@implementation ITIdleTimerState

- (id)newAssertionToDisableIdleTimerForReason:(id)a3
{
  return -[ITIdleTimerState newAssertionToDisableIdleTimerForReason:error:](self, "newAssertionToDisableIdleTimerForReason:error:", a3, 0);
}

- (id)newAssertionToDisableIdleTimerForReason:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v11;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerState.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  +[ITIdleTimerConfiguration configurationToDisableIdleTimer](ITIdleTimerConfiguration, "configurationToDisableIdleTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ITIdleTimerState newIdleTimerAssertionWithConfiguration:forReason:error:](self, "newIdleTimerAssertionWithConfiguration:forReason:error:", v8, v7, a4);

  return v9;
}

- (id)newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  ITIdleTimerStateModel *model;
  void *v12;
  id v13;
  NSObject *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerState.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  if ((objc_msgSend((id)objc_opt_class(), "isIdleTimerServiceAvailable") & 1) != 0)
  {
    model = self->_model;
    v12 = (void *)objc_msgSend(v9, "_copyWithNewIdentifier");
    v13 = -[ITIdleTimerStateModel newIdleTimerAssertionWithConfiguration:forReason:error:](model, "newIdleTimerAssertionWithConfiguration:forReason:error:", v12, v10, a5);

  }
  else
  {
    ITLogIdleTimer();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ITIdleTimerState newIdleTimerAssertionWithConfiguration:forReason:error:].cold.1(v14);

    v13 = 0;
    if (a5)
      *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ITIdleTimerConfigurationErrorDomain"), 1, 0);
  }

  return v13;
}

+ (BOOL)isIdleTimerServiceAvailable
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__ITIdleTimerState_isIdleTimerServiceAvailable__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isIdleTimerServiceAvailable_onceToken != -1)
    dispatch_once(&isIdleTimerServiceAvailable_onceToken, block);
  return isIdleTimerServiceAvailable_isIdleTimerServiceAvailable;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __34__ITIdleTimerState_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ITIdleTimerState _init]([ITIdleTimerState alloc], "_init");
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  ITIdleTimerStateModel *v3;
  id v4;

  v3 = objc_alloc_init(ITIdleTimerStateModel);
  v4 = -[ITIdleTimerState _initWithModel:](self, "_initWithModel:", v3);

  return v4;
}

- (id)_initWithModel:(id)a3
{
  id v5;
  ITIdleTimerState *v6;
  ITIdleTimerState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ITIdleTimerState;
  v6 = -[ITIdleTimerState init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

void __47__ITIdleTimerState_isIdleTimerServiceAvailable__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isIdleTimerServiceAvailable_isIdleTimerServiceAvailable = objc_msgSend(v1, "isIdleTimerServiceAvailable");

}

- (BOOL)isIdleTimerServiceAvailable
{
  return -[ITIdleTimerStateModel isIdleTimerServiceAvailable](self->_model, "isIdleTimerServiceAvailable");
}

- (id)newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4
{
  return -[ITIdleTimerState newIdleTimerAssertionWithConfiguration:forReason:error:](self, "newIdleTimerAssertionWithConfiguration:forReason:error:", a3, a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)newIdleTimerAssertionWithConfiguration:(os_log_t)log forReason:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2063D2000, log, OS_LOG_TYPE_ERROR, "The client is requesting an idle timer assertion, but the system is not providing idle timer services.", v1, 2u);
}

@end
