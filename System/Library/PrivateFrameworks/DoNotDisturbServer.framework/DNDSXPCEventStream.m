@implementation DNDSXPCEventStream

- (DNDSXPCEventStream)init
{
  DNDSXPCEventStream *v2;
  uint64_t v3;
  NSMutableDictionary *timerHandlersByToken;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DNDSXPCEventStream;
  v2 = -[DNDSXPCEventStream init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    timerHandlersByToken = v2->_timerHandlersByToken;
    v2->_timerHandlersByToken = (NSMutableDictionary *)v3;

    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.donotdisturb.%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)start
{
  void *v3;
  OS_dispatch_queue *queue;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  +[DNDSXPCEventInterface sharedInstance](DNDSXPCEventInterface, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __27__DNDSXPCEventStream_start__block_invoke;
  v9 = &unk_1E86A8000;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "registerForStream:queue:handler:", CFSTR("com.apple.alarm"), queue, &v6);

  +[DNDSXPCEventInterface sharedInstance](DNDSXPCEventInterface, "sharedInstance", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForStream:queue:handler:", CFSTR("com.apple.notifyd.matching"), self->_queue, &__block_literal_global_32);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __27__DNDSXPCEventStream_start__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  xpc_object_t xdict;

  xdict = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSXPCEventInterface sharedInstance](DNDSXPCEventInterface, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEvent:forKey:onStream:", 0, v4, CFSTR("com.apple.alarm"));

  objc_msgSend(WeakRetained[1], "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, void *, xpc_object_t))(v6 + 16))(v6, v4, xdict);

}

- (void)registerTimerHandlerWithServiceIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x1D17A0D58](a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timerHandlersByToken, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setTimer:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v9, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = ceil(v5);

    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_date(v3, "Date", (uint64_t)(v6 * 1000000000.0));
    xpc_dictionary_set_BOOL(v3, "UserVisible", 1);
  }
  +[DNDSXPCEventInterface sharedInstance](DNDSXPCEventInterface, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEvent:forKey:onStream:", v3, v8, CFSTR("com.apple.alarm"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerHandlersByToken, 0);
}

@end
