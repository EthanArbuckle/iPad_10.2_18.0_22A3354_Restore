@implementation EFDebouncer

- (void)debounceResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EFDebouncer log](EFDebouncer, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EFDebouncer observable](self, "observable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1B106E000, v5, OS_LOG_TYPE_DEFAULT, "Observer: %@ received result: %@", (uint8_t *)&v9, 0x16u);

  }
  -[EFDebouncer observable](self, "observable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "observerDidReceiveResult:", v8);
  if (!v4)

}

- (EFObserver)observable
{
  return self->_observable;
}

- (EFDebouncer)initWithTimeInterval:(double)a3 scheduler:(id)a4 startAfter:(unint64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  EFDebouncer *v12;
  uint64_t v13;
  EFObserver *observable;
  EFObserver *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  EFObserver *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  EFCancelable *cancelable;
  _QWORD v30[4];
  id v31;
  objc_super v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)EFDebouncer;
  v12 = -[EFDebouncer init](&v32, sel_init);
  if (v12)
  {
    +[EFObservable observableObserver](EFObservable, "observableObserver");
    v13 = objc_claimAutoreleasedReturnValue();
    observable = v12->_observable;
    v12->_observable = (EFObserver *)v13;

    v15 = v12->_observable;
    if (a5)
    {
      -[EFObserver take:](v15, "take:", a5);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v10)
      {
        -[NSObject observeOn:](v16, "observeOn:", v10);
        v18 = objc_claimAutoreleasedReturnValue();

        v17 = v18;
      }
      -[EFObserver skip:](v12->_observable, "skip:", a5);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v10;
      if (v10)
        objc_msgSend(v19, "debounceWithTimeInterval:scheduler:", v20, a3);
      else
        objc_msgSend(v19, "debounceWithTimeInterval:", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v39[0] = v17;
      v39[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[EFObservable merge:](EFObservable, "merge:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      +[EFDebouncer log](EFDebouncer, "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v34 = v17;
        v35 = 2112;
        v36 = v23;
        v37 = 2112;
        v38 = v25;
        _os_log_debug_impl(&dword_1B106E000, v26, OS_LOG_TYPE_DEBUG, "Merge [first %@, rest %@] to debouncedObservable: %@", buf, 0x20u);
      }

    }
    else
    {
      v21 = v15;
      v22 = v10;
      if (v22)
        -[EFObserver debounceWithTimeInterval:scheduler:](v21, "debounceWithTimeInterval:scheduler:", v22, a3);
      else
        -[EFObserver debounceWithTimeInterval:](v21, "debounceWithTimeInterval:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      +[EFDebouncer log](EFDebouncer, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[EFDebouncer initWithTimeInterval:scheduler:startAfter:block:].cold.1((uint64_t *)&v12->_observable, (uint64_t)v25, v17);
    }

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __63__EFDebouncer_initWithTimeInterval_scheduler_startAfter_block___block_invoke;
    v30[3] = &unk_1E62A5900;
    v31 = v11;
    objc_msgSend(v25, "subscribeWithResultBlock:", v30);
    v27 = objc_claimAutoreleasedReturnValue();
    cancelable = v12->_cancelable;
    v12->_cancelable = (EFCancelable *)v27;

  }
  return v12;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__EFDebouncer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (id)log_log_0;
}

void __63__EFDebouncer_initWithTimeInterval_scheduler_startAfter_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
    v5 = 0;
  else
    v5 = v6;
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

void __18__EFDebouncer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v3;

  -[EFDebouncer cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EFDebouncer;
  -[EFDebouncer dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  id v2;

  -[EFDebouncer cancelable](self, "cancelable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (EFCancelable)cancelable
{
  return self->_cancelable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

- (void)initWithTimeInterval:(os_log_t)log scheduler:startAfter:block:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1B106E000, log, OS_LOG_TYPE_DEBUG, "Subscribing to %@ with %@", (uint8_t *)&v4, 0x16u);
}

@end
