@implementation HDHeartRateSummaryQueryServer

- (void)_queue_start
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDHeartRateSummaryQueryServer;
  -[HDQueryServer _queue_start](&v4, sel__queue_start);
  WeakRetained = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
  objc_msgSend(WeakRetained, "addActivityCacheObserver:", self);

}

- (void)_queue_stop
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDHeartRateSummaryQueryServer;
  -[HDQueryServer _queue_stop](&v4, sel__queue_stop);
  WeakRetained = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
  objc_msgSend(WeakRetained, "removeActivityCacheObserver:", self);

}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HDHeartRateSummaryQueryServer *v17;
  HDHeartRateSummaryQueryServer *v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activityCacheInterface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HDQueryServer initWithUUID:configuration:client:delegate:]([HDHeartRateSummaryQueryServer alloc], "initWithUUID:configuration:client:delegate:", v11, v12, v13, v14);
    v18 = v17;
    if (v17)
      objc_storeWeak((id *)&v17->_activityCacheInterface, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a7, 100, CFSTR("Activity cache manager is unavailable"));
    v18 = 0;
  }

  return v18;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)activityCacheManager:(id)a3 changedHeartRateSummary:(id)a4 isToday:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  id v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  _BYTE v22[24];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v9 = (os_log_t *)MEMORY[0x1E0CB52E8];
    v10 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      *(_DWORD *)v22 = 138412546;
      *(_QWORD *)&v22[4] = objc_opt_class();
      *(_WORD *)&v22[12] = 2112;
      *(_QWORD *)&v22[14] = v8;
      v12 = *(id *)&v22[4];
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%@ received updated summary: %@", v22, 0x16u);

    }
    if ((-[HKHeartRateSummary isEqual:](self->_latestSummary, "isEqual:", v8, *(_OWORD *)v22, *(_QWORD *)&v22[16], v23) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_latestSummary, a4);
      -[HDQueryServer clientProxy](self, "clientProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "remoteObjectProxy");
      v14 = objc_claimAutoreleasedReturnValue();

      _HKInitializeLogging();
      v18 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
      {
        v19 = v18;
        v20 = (void *)objc_opt_class();
        *(_DWORD *)v22 = 138412546;
        *(_QWORD *)&v22[4] = v20;
        *(_WORD *)&v22[12] = 2112;
        *(_QWORD *)&v22[14] = v14;
        v21 = v20;
        _os_log_debug_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEBUG, "%@ notifying client: %@", v22, 0x16u);

      }
      -[HDQueryServer queryUUID](self, "queryUUID");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[NSObject client_deliverSummary:queryUUID:](v14, "client_deliverSummary:queryUUID:", v8, v16);
      goto LABEL_10;
    }
    _HKInitializeLogging();
    v13 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = v13;
      v15 = (void *)objc_opt_class();
      *(_DWORD *)v22 = 138412290;
      *(_QWORD *)&v22[4] = v15;
      v16 = v15;
      _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "%@ ignoring summary because nothing changed", v22, 0xCu);
LABEL_10:

    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityCacheInterface);
  objc_storeStrong((id *)&self->_latestSummary, 0);
}

@end
