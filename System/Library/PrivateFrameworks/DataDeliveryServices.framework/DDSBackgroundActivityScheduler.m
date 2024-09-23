@implementation DDSBackgroundActivityScheduler

- (DDSBackgroundActivityScheduler)init
{
  DDSBackgroundActivityScheduler *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DDSBackgroundActivityScheduler;
  v2 = -[DDSBackgroundActivityScheduler init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[DDSBackgroundActivityScheduler setSchedulerByIdentifier:](v2, "setSchedulerByIdentifier:", v3);

  }
  return v2;
}

- (void)scheduleActivityWithIdentifier:(id)a3 interval:(double)a4 tolerance:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  xpc_object_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  UpdateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DDSBackgroundActivityScheduler scheduleActivityWithIdentifier:interval:tolerance:].cold.1(v10, v11, a4);

  UpdateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    DDS_STRING_FROM_DATE(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v8;
    v23 = 2114;
    v24 = v13;
    v25 = 2048;
    v26 = (unint64_t)a5;
    _os_log_impl(&dword_1DA990000, v12, OS_LOG_TYPE_DEFAULT, "Scheduling activity: %{public}@ for approximately %{public}@ (tolerance of %ld seconds)", buf, 0x20u);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", v8);
  objc_msgSend(v14, "setQualityOfService:", 17);
  objc_msgSend(v14, "setRepeats:", 0);
  objc_msgSend(v14, "setDelay:", a4);
  objc_msgSend(v14, "setTolerance:", a5);
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v15, (const char *)*MEMORY[0x1E0C80760], (uint64_t)a4);
  objc_msgSend(v14, "_setAdditionalXPCActivityProperties:", v15);
  -[DDSBackgroundActivityScheduler schedulerByIdentifier](self, "schedulerByIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v14, v8);

  objc_initWeak((id *)buf, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__DDSBackgroundActivityScheduler_scheduleActivityWithIdentifier_interval_tolerance___block_invoke;
  v18[3] = &unk_1EA141640;
  objc_copyWeak(&v20, (id *)buf);
  v17 = v8;
  v19 = v17;
  objc_msgSend(v14, "scheduleWithBlock:", v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __84__DDSBackgroundActivityScheduler_scheduleActivityWithIdentifier_interval_tolerance___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    UpdateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Scheduled activity %{public}@ fired!", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performScheduledActivityWithIdentifier:", *(_QWORD *)(a1 + 32));

    objc_msgSend(WeakRetained, "schedulerByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  }
  v3[2](v3, 1);

}

- (void)cancelActivityWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DDSBackgroundActivityScheduler schedulerByIdentifier](self, "schedulerByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(v7, "invalidate");
    v6 = v7;
  }

}

- (DDSBackgroundActivitySchedulerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)schedulerByIdentifier
{
  return self->_schedulerByIdentifier;
}

- (void)setSchedulerByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_schedulerByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerByIdentifier, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)scheduleActivityWithIdentifier:(void *)a1 interval:(NSObject *)a2 tolerance:(double)a3 .cold.1(void *a1, NSObject *a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DDS_STRING_FROM_DATE(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DDS_STRING_FROM_DATE(a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218498;
  v10 = (unint64_t)a3;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_debug_impl(&dword_1DA990000, a2, OS_LOG_TYPE_DEBUG, "Delay: %ld Now: %{public}@ Future: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
