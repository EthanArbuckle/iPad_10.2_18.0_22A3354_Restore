@implementation ATXScreenUnlockUpdateSource

- (ATXScreenUnlockUpdateSource)init
{
  void *v3;
  void *v4;
  ATXScreenUnlockUpdateSource *v5;

  v3 = (void *)objc_opt_new();
  +[ATXPredictionContextBuilder sharedInstance](ATXPredictionContextBuilder, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXScreenUnlockUpdateSource initWithContextHelper:predictionContextBuilder:](self, "initWithContextHelper:predictionContextBuilder:", v3, v4);

  return v5;
}

- (ATXScreenUnlockUpdateSource)initWithContextHelper:(id)a3 predictionContextBuilder:(id)a4
{
  id v7;
  id v8;
  ATXScreenUnlockUpdateSource *v9;
  ATXScreenUnlockUpdateSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXScreenUnlockUpdateSource;
  v9 = -[ATXScreenUnlockUpdateSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextHelper, a3);
    objc_storeStrong((id *)&v10->_predictionContextBuilder, a4);
  }
  -[ATXScreenUnlockUpdateSource _listenForScreenUnlock](v10, "_listenForScreenUnlock");

  return v10;
}

- (void)_listenForScreenUnlock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __53__ATXScreenUnlockUpdateSource__listenForScreenUnlock__block_invoke;
  v11 = &unk_1E82E08E0;
  objc_copyWeak(&v12, &location);
  v3 = _Block_copy(&v8);
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForDeviceLockStatus", v8, v9, v10, v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:equalToValue:", v4, &unk_1E83CDB58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C70], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.ATXScreenUnlockUpdateSource"), v5, CFSTR("com.apple.duetexpertd.cdidentifier"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCoreDuetContextHelper context](self->_contextHelper, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerCallback:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __53__ATXScreenUnlockUpdateSource__listenForScreenUnlock__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleScreenUnlockEvent");
    WeakRetained = v2;
  }

}

- (void)_handleScreenUnlockEvent
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2080;
    v11 = "-[ATXScreenUnlockUpdateSource _handleScreenUnlockEvent]";
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - %s: got screen unlock event", (uint8_t *)&v8, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tryUpdatePredictionsDefaultIntervalWithReason:", 7);

  v7 = (id)-[ATXPredictionContextBuilderProtocol updateContextStreamAndReturnPredictionContextForCurrentContext](self->_predictionContextBuilder, "updateContextStreamAndReturnPredictionContextForCurrentContext");
}

- (ATXUpdatePredictionsDelegate)delegate
{
  return (ATXUpdatePredictionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ATXCoreDuetContextHelper)contextHelper
{
  return self->_contextHelper;
}

- (void)setContextHelper:(id)a3
{
  objc_storeStrong((id *)&self->_contextHelper, a3);
}

- (ATXPredictionContextBuilderProtocol)predictionContextBuilder
{
  return self->_predictionContextBuilder;
}

- (void)setPredictionContextBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_predictionContextBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_contextHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
