@implementation ATXLazyIntent

- (BOOL)isDeserialized
{
  return self->_intent != 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ATXLazyIntent)initWithIntentData:(id)a3
{
  return -[ATXLazyIntent initWithIntent:intentData:](self, "initWithIntent:intentData:", 0, a3);
}

- (ATXLazyIntent)initWithIntent:(id)a3 intentData:(id)a4
{
  unint64_t v8;
  unint64_t v9;
  ATXLazyIntent *v10;
  ATXLazyIntent *v11;
  void *v13;
  objc_super v14;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLazyIntent.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intent || intentData"));

  }
  v14.receiver = self;
  v14.super_class = (Class)ATXLazyIntent;
  v10 = -[ATXLazyIntent init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_intent, a3);
    objc_storeStrong((id *)&v11->_intentData, a4);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_intentData, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (ATXLazyIntent)initWithIntent:(id)a3
{
  return -[ATXLazyIntent initWithIntent:intentData:](self, "initWithIntent:intentData:", a3, 0);
}

- (INIntent)intent
{
  ATXLazyIntent *v2;
  INIntent *intent;
  uint64_t v4;
  INIntent *v5;
  id WeakRetained;
  INIntent *v7;

  v2 = self;
  objc_sync_enter(v2);
  intent = v2->_intent;
  if (!intent)
  {
    -[ATXLazyIntent _deserializeIntent](v2, "_deserializeIntent");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_intent;
    v2->_intent = (INIntent *)v4;

    WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
    objc_msgSend(WeakRetained, "didDeserializeIntent:", v2->_intent);

    intent = v2->_intent;
  }
  v7 = intent;
  objc_sync_exit(v2);

  return v7;
}

- (NSData)intentData
{
  ATXLazyIntent *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_intentData;
  objc_sync_exit(v2);

  return v3;
}

- (id)_deserializeIntent
{
  ATXLazyIntent *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSData *intentData;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v2 = self;
  objc_sync_enter(v2);
  if (-[NSData length](v2->_intentData, "length"))
  {
    v3 = (void *)MEMORY[0x1A85A4F90]();
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    intentData = v2->_intentData;
    v11 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, intentData, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v8)
    {
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[ATXLazyIntent _deserializeIntent].cold.1((uint64_t)v8, v9);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v2);

  return v7;
}

- (void)handleMemoryPressure
{
  ATXLazyIntent *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSData *intentData;
  uint8_t v7[16];

  v2 = self;
  objc_sync_enter(v2);
  -[ATXLazyIntent intentData](v2, "intentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ATXLazyIntent intent](v2, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXLazyIntent purging intent data due to memory pressure", v7, 2u);
      }

      intentData = v2->_intentData;
      v2->_intentData = 0;

    }
  }
  objc_sync_exit(v2);

}

- (ATXLazyIntentDelegateProtocol)delegate
{
  return (ATXLazyIntentDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_deserializeIntent
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "ATXLazyIntent could not de-serialize intent: %@", (uint8_t *)&v2, 0xCu);
}

@end
