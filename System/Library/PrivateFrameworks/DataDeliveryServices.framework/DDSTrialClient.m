@implementation DDSTrialClient

+ (id)createWithWorkQueue:(id)a3 query:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  DDSTRIClient *v9;
  DDSTrialClient *v10;
  NSObject *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", objc_msgSend(v6, "projectId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    DefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[DDSTrialClient createWithWorkQueue:query:].cold.1(v6);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", objc_msgSend(v6, "namespaceId"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    DefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[DDSTrialClient createWithWorkQueue:query:].cold.2(v6);

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v9 = -[DDSTRIClient initWithClient:]([DDSTRIClient alloc], "initWithClient:", v7);
  v10 = -[DDSTrialClient initWithWorkQueue:triClient:triNamespaceName:]([DDSTrialClient alloc], "initWithWorkQueue:triClient:triNamespaceName:", v5, v9, v8);

LABEL_10:
  return v10;
}

- (DDSTrialClient)initWithWorkQueue:(id)a3 triClient:(id)a4 triNamespaceName:(id)a5
{
  id v9;
  id v10;
  id v11;
  DDSTrialClient *v12;
  DDSTrialClient *v13;
  uint64_t v14;
  NSString *triNamespaceName;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DDSTrialClient;
  v12 = -[DDSTrialClient init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_triClient, a4);
    v14 = objc_msgSend(v11, "copy");
    triNamespaceName = v13->_triNamespaceName;
    v13->_triNamespaceName = (NSString *)v14;

  }
  return v13;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  -[DDSTrialClient workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[DDSTrialClient notificationToken](self, "notificationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_initWeak(&location, self);
    -[DDSTrialClient triClient](self, "triClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSTrialClient triNamespaceName](self, "triNamespaceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSTrialClient workQueue](self, "workQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __23__DDSTrialClient_start__block_invoke;
    v12 = &unk_1EA141D18;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v5, "addUpdateHandlerForNamespaceName:queue:usingBlock:", v6, v7, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSTrialClient setNotificationToken:](self, "setNotificationToken:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __23__DDSTrialClient_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    v5 = objc_loadWeakRetained(&to);
    objc_msgSend(v5, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "triClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "refresh");

    v9 = objc_loadWeakRetained(&to);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __23__DDSTrialClient_start__block_invoke_2;
    v10[3] = &unk_1EA141CF0;
    objc_copyWeak(&v11, &to);
    objc_msgSend(v9, "fetchAssetWithCallback:", v10);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&to);

}

void __23__DDSTrialClient_start__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v3);
  if (v9)
    objc_msgSend(v7, "trialClient:didReceiveAsset:", v8, v9);
  else
    objc_msgSend(v7, "trialClientDidStop:", v8);

}

- (void)fetchAssetWithCallback:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  DDSTrialExperimentIdentifiers *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  DDSTrialExperimentIdentifiers *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[DDSTrialClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[DDSTrialClient triClient](self, "triClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSTrialClient triNamespaceName](self, "triNamespaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "experimentIdentifiersWithNamespaceName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DDSTrialClient triClient](self, "triClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSTrialClient triNamespaceName](self, "triNamespaceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "levelForFactor:withNamespaceName:", CFSTR("languageAsset"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "directoryValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "hasPath") & 1) != 0)
      {
        objc_msgSend(v11, "directoryValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasAsset");

        if ((v14 & 1) != 0)
        {
          objc_msgSend(v11, "directoryValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          objc_msgSend(v17, "contentsOfDirectoryAtPath:error:", v16, &v39);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v39;

          if (v18)
          {
            if (objc_msgSend(v18, "count") == 1)
            {
              objc_msgSend(v18, "firstObject");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringByAppendingPathComponent:", v20);
              v21 = objc_claimAutoreleasedReturnValue();

              v22 = [DDSTrialExperimentIdentifiers alloc];
              objc_msgSend(v8, "experimentId");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v8, "deploymentId");
              objc_msgSend(v8, "treatmentId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = -[TRIExperimentIdentifiers initWithExperimentId:deploymentId:treatmentId:](v22, "initWithExperimentId:deploymentId:treatmentId:", v23, v24, v25);

              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v21);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[DDSTrialAsset createWithExperimentIdentifiers:localURL:](DDSTrialAsset, "createWithExperimentIdentifiers:localURL:", v26, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28)
              {
                v4[2](v4, v28, 0);
              }
              else
              {
                DefaultLog();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  -[DDSTrialClient fetchAssetWithCallback:].cold.2();

                DDSTrialErrorWithCode(4);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(id, void *, void *))v4)[2](v4, 0, v38);

              }
              v16 = (void *)v21;
              goto LABEL_33;
            }
            DefaultLog();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              -[DDSTrialClient fetchAssetWithCallback:].cold.3(v18, v36);

            v35 = 3;
          }
          else
          {
            DefaultLog();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              -[DDSTrialClient fetchAssetWithCallback:].cold.1();

            v35 = 5;
          }
          DDSTrialErrorWithCode(v35);
          v26 = (DDSTrialExperimentIdentifiers *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, DDSTrialExperimentIdentifiers *))v4)[2](v4, 0, v26);
LABEL_33:

          goto LABEL_20;
        }
      }
      else
      {

      }
      DefaultLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[DDSTrialClient fetchAssetWithCallback:].cold.4((uint64_t)v11, v32, v33);

      v31 = 5;
    }
    else
    {
      DefaultLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = CFSTR("languageAsset");
        _os_log_impl(&dword_1DA990000, v30, OS_LOG_TYPE_INFO, "Missing value for trial parameter: %@", buf, 0xCu);
      }

      v31 = 2;
    }
    DDSTrialErrorWithCode(v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v16);
LABEL_20:

    goto LABEL_21;
  }
  DefaultLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA990000, v29, OS_LOG_TYPE_INFO, "No experiment identifiers found, device is not enrolled in trial experiment", buf, 2u);
  }

  DDSTrialErrorWithCode(1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v4)[2](v4, 0, v11);
LABEL_21:

}

- (void)dealloc
{
  objc_super v3;

  if (self->_notificationToken)
    -[DDSTRIClient removeUpdateHandlerForToken:](self->_triClient, "removeUpdateHandlerForToken:");
  v3.receiver = self;
  v3.super_class = (Class)DDSTrialClient;
  -[DDSTrialClient dealloc](&v3, sel_dealloc);
}

- (DDSTrialClientDelegate)delegate
{
  return (DDSTrialClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (DDSTRIClient)triClient
{
  return (DDSTRIClient *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)triNamespaceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (TRINotificationToken)notificationToken
{
  return (TRINotificationToken *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNotificationToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_triNamespaceName, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)createWithWorkQueue:(void *)a1 query:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "projectId");
  OUTLINED_FUNCTION_1_2(&dword_1DA990000, v1, v2, "Failed to create TRI client for project id: %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)createWithWorkQueue:(void *)a1 query:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "namespaceId");
  OUTLINED_FUNCTION_1_2(&dword_1DA990000, v1, v2, "Failed to create name space name for namespace id: %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_4();
}

- (void)fetchAssetWithCallback:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA990000, v0, v1, "Failed to get contents of directory at path %@:%@");
  OUTLINED_FUNCTION_4();
}

- (void)fetchAssetWithCallback:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA990000, v0, v1, "Failed to create trial asset with %@:%@");
  OUTLINED_FUNCTION_4();
}

- (void)fetchAssetWithCallback:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_0(&dword_1DA990000, a2, v3, "Directory contents count: %lu is not equal to 1", (uint8_t *)&v4);
}

- (void)fetchAssetWithCallback:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1DA990000, a2, a3, "Path for the asset parameter is empty: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

@end
