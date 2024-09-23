@implementation ULBGSystemTaskManager

- (ULBGSystemTaskManager)init
{
  ULBGSystemTaskManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ULBGSystemTaskManager;
  v2 = -[ULBGSystemTaskManager init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULBGSystemTaskManager setScheduler:](v2, "setScheduler:", v3);

  }
  return v2;
}

- (void)registerAndSubmitTaskWithRequest:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ULBGSystemTaskManager scheduler](self, "scheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __83__ULBGSystemTaskManager_registerAndSubmitTaskWithRequest_usingQueue_launchHandler___block_invoke;
  v30[3] = &unk_2511D9010;
  v13 = v9;
  v31 = v13;
  v14 = v10;
  v32 = v14;
  LOBYTE(v10) = objc_msgSend(v11, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v12, v13, v30);

  if ((v10 & 1) != 0)
  {
    -[ULBGSystemTaskManager scheduler](self, "scheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "taskRequestForIdentifier:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_70);
      v18 = (void *)logObject_MicroLocation_Default;
      if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v19 = v18;
      objc_msgSend(v8, "identifier");
      v20 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v20;
      _os_log_impl(&dword_2419D9000, v19, OS_LOG_TYPE_DEFAULT, "[ULBGSystemTaskManager]: Trying to submit already existing task: %@", buf, 0xCu);
    }
    else
    {
      -[ULBGSystemTaskManager scheduler](self, "scheduler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createRequestFromSelf");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v24 = objc_msgSend(v22, "submitTaskRequest:error:", v23, &v29);
      v19 = v29;

      if (v24)
      {
        if (onceToken_MicroLocation_Default != -1)
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_70);
        v25 = (void *)logObject_MicroLocation_Default;
        if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
        v20 = v25;
        objc_msgSend(v8, "identifier");
        v26 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v26;
        _os_log_impl(&dword_2419D9000, v20, OS_LOG_TYPE_DEFAULT, "[ULBGSystemTaskManager]: Registered and submitted task: %@", buf, 0xCu);
      }
      else
      {
        if (onceToken_MicroLocation_Default != -1)
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_70);
        v27 = (void *)logObject_MicroLocation_Default;
        if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        v20 = v27;
        objc_msgSend(v8, "identifier");
        v26 = objc_claimAutoreleasedReturnValue();
        -[NSObject localizedDescription](v19, "localizedDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v26;
        v35 = 2112;
        v36 = v28;
        _os_log_impl(&dword_2419D9000, v20, OS_LOG_TYPE_ERROR, "[ULBGSystemTaskManager]: Could not submit task: %@ with error: %@", buf, 0x16u);

      }
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_70);
  v21 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    v17 = v21;
    objc_msgSend(v8, "identifier");
    v19 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v19;
    _os_log_impl(&dword_2419D9000, v17, OS_LOG_TYPE_ERROR, "[ULBGSystemTaskManager]: Could not register task: %@", buf, 0xCu);
    goto LABEL_22;
  }
LABEL_24:

}

void __83__ULBGSystemTaskManager_registerAndSubmitTaskWithRequest_usingQueue_launchHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  ULBGSystemTask *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_70);
  v5 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "[ULBGSystemTaskManager]: task: %@ started at: %@", (uint8_t *)&v16, 0x16u);

  }
  v8 = -[ULBGSystemTask initWithUnderlyingTask:]([ULBGSystemTask alloc], "initWithUnderlyingTask:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v3, "setTaskCompleted");
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_70);
  v9 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ULBGSystemTask shouldCancel](v8, "shouldCancel"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v4);
    objc_msgSend(v13, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "[ULBGSystemTaskManager]: task: %@ ended, interrupted: %@, duration: %@(sec)", (uint8_t *)&v16, 0x20u);

  }
}

- (void)deregisterAndCancelTaskWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULBGSystemTaskManager scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v6 = objc_msgSend(v5, "cancelTaskRequestWithIdentifier:error:", v4, &v18);
  v7 = v18;

  if ((v6 & 1) != 0)
  {
    -[ULBGSystemTaskManager scheduler](self, "scheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "deregisterTaskWithIdentifier:", v4);

    if (v9)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_70);
      v10 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        v11 = "[ULBGSystemTaskManager]: Deregistered and cancelled task: %@";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
        _os_log_impl(&dword_2419D9000, v12, v13, v11, buf, 0xCu);
      }
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_70);
      v17 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        v11 = "[ULBGSystemTaskManager]: Couldnt deregister task: %@";
        v12 = v17;
        v13 = OS_LOG_TYPE_ERROR;
        goto LABEL_15;
      }
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_70);
    v14 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      objc_msgSend(v7, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_2419D9000, v15, OS_LOG_TYPE_ERROR, "[ULBGSystemTaskManager]: Couldnt cancel task: %@ with error: %@", buf, 0x16u);

    }
  }

}

- (BGSystemTaskScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
