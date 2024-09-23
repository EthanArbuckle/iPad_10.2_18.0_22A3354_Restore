@implementation AMSDeviceMessenger

- (AMSDeviceMessenger)init
{
  AMSDeviceMessenger *v2;
  AMSDaemonConnection *v3;
  AMSDaemonConnection *connection;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSMutableArray *v7;
  NSMutableArray *updateHandlers;
  AMSDaemonConnection *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSDeviceMessenger;
  v2 = -[AMSDeviceMessenger init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AMSDaemonConnection);
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = dispatch_queue_create("com.apple.AMSDeviceMessenger", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updateHandlers = v2->_updateHandlers;
    v2->_updateHandlers = v7;

    objc_initWeak(&location, v2);
    v9 = v2->_connection;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __26__AMSDeviceMessenger_init__block_invoke;
    v11[3] = &unk_1E253E9A0;
    objc_copyWeak(&v12, &location);
    -[AMSDaemonConnection addInterruptionHandler:](v9, "addInterruptionHandler:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__AMSDeviceMessenger_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)addUpdateHandlerForType:(int64_t)a3 filter:(id)a4 handler:(id)a5
{
  AMSDeviceMessengerFilter *v8;
  id v9;
  NSObject *v10;
  id v11;
  AMSDeviceMessengerFilter *v12;
  _QWORD block[4];
  AMSDeviceMessengerFilter *v14;
  AMSDeviceMessenger *v15;
  id v16;

  v8 = (AMSDeviceMessengerFilter *)a4;
  v9 = a5;
  if (!v8)
    v8 = objc_alloc_init(AMSDeviceMessengerFilter);
  -[AMSDeviceMessengerFilter setMessageType:](v8, "setMessageType:", a3);
  -[AMSDeviceMessenger queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AMSDeviceMessenger_addUpdateHandlerForType_filter_handler___block_invoke;
  block[3] = &unk_1E253E900;
  v15 = self;
  v16 = v9;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

}

void __61__AMSDeviceMessenger_addUpdateHandlerForType_filter_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  AMSDeviceUpdateHandlerInfo *v4;

  v4 = objc_alloc_init(AMSDeviceUpdateHandlerInfo);
  -[AMSDeviceUpdateHandlerInfo setFilter:](v4, "setFilter:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  -[AMSDeviceUpdateHandlerInfo setBlock:](v4, "setBlock:", v2);

  objc_msgSend(*(id *)(a1 + 40), "updateHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (id)dialogsWithFilter:(id)a3
{
  AMSDeviceMessengerFilter *v4;
  AMSMutablePromise *v5;
  void *v6;
  AMSMutablePromise *v7;
  AMSDeviceMessengerFilter *v8;
  AMSDeviceMessengerFilter *v9;
  AMSMutablePromise *v10;
  _QWORD v12[4];
  AMSMutablePromise *v13;
  AMSDeviceMessenger *v14;
  AMSDeviceMessengerFilter *v15;

  v4 = (AMSDeviceMessengerFilter *)a3;
  if (!v4)
    v4 = objc_alloc_init(AMSDeviceMessengerFilter);
  -[AMSDeviceMessengerFilter setMessageType:](v4, "setMessageType:", 1);
  v5 = objc_alloc_init(AMSMutablePromise);
  -[AMSDeviceMessenger _getProxyObject](self, "_getProxyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__AMSDeviceMessenger_dialogsWithFilter___block_invoke;
  v12[3] = &unk_1E2540F38;
  v7 = v5;
  v13 = v7;
  v14 = self;
  v15 = v4;
  v8 = v4;
  objc_msgSend(v6, "addFinishBlock:", v12);

  v9 = v15;
  v10 = v7;

  return v10;
}

void __40__AMSDeviceMessenger_dialogsWithFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__AMSDeviceMessenger_dialogsWithFilter___block_invoke_2;
    v7[3] = &unk_1E2540F10;
    v6 = *(int8x16_t *)(a1 + 32);
    v5 = (id)v6.i64[0];
    v8 = vextq_s8(v6, v6, 8uLL);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(a2, "getMessagesWithPurpose:completion:", 50, v7);

  }
}

void __40__AMSDeviceMessenger_dialogsWithFilter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v10;
      v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to receive dialogs", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v13;
      v34 = 2114;
      v35 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Received dialogs", buf, 0x16u);

    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v5;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v21, "object");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v21, "object");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*(id *)(a1 + 48), "matchesMessage:", v21))
              objc_msgSend(v15, "addObject:", v24);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v15);
    v6 = v25;
    v5 = v26;
  }

}

- (id)clearDialog:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  AMSMutableBinaryPromise *v12;
  void *v13;
  AMSMutableBinaryPromise *v14;
  AMSMutableBinaryPromise *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  AMSMutableBinaryPromise *v23;
  id v24;
  id v25;
  AMSDeviceMessenger *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = AMSSetLogKey(v5);

  -[AMSDeviceMessenger _identifierFromDialogRequest:](self, "_identifierFromDialogRequest:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v10;
    v29 = 2114;
    v30 = v11;
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clearing dialog with identifier: %{public}@", buf, 0x20u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_alloc_init(AMSMutableBinaryPromise);
    -[AMSDeviceMessenger _getProxyObject](self, "_getProxyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __34__AMSDeviceMessenger_clearDialog___block_invoke;
    v22[3] = &unk_1E2540F60;
    v14 = v12;
    v23 = v14;
    v24 = v7;
    v25 = v4;
    v26 = self;
    objc_msgSend(v13, "addFinishBlock:", v22);

    v15 = v14;
    v16 = v15;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      objc_msgSend(v4, "logKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid dialog for clear", buf, 0x16u);

    }
    AMSError(2, CFSTR("AMSDeviceMessenger Error"), CFSTR("Invalid bridge dialog for clear"), 0);
    v15 = (AMSMutableBinaryPromise *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __34__AMSDeviceMessenger_clearDialog___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  AMSXDMessage *v6;
  uint64_t v7;
  void *v8;
  AMSXDMessage *v9;
  void *v10;
  AMSXDMessage *v11;
  _QWORD v12[5];
  AMSXDMessage *v13;
  id v14;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a3);
  }
  else
  {
    v6 = [AMSXDMessage alloc];
    v7 = *(_QWORD *)(a1 + 40);
    +[AMSXDDevice allPairedDevices](AMSXDDevice, "allPairedDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AMSXDMessage initWithIdentifier:destination:purpose:object:](v6, "initWithIdentifier:destination:purpose:object:", v7, v8, 1, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 48), "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSXDMessage setLogKey:](v9, "setLogKey:", v10);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__AMSDeviceMessenger_clearDialog___block_invoke_2;
    v12[3] = &unk_1E253DB30;
    v12[4] = *(_QWORD *)(a1 + 56);
    v13 = v9;
    v14 = *(id *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v5, "sendMessage:completion:", v11, v12);

  }
}

void __34__AMSDeviceMessenger_clearDialog___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  _BYTE v16[24];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v16 = 138543618;
      *(_QWORD *)&v16[4] = v9;
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v10;
      v11 = "%{public}@: [%{public}@] Clear bridge dialog message sent!";
      v12 = v8;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 22;
LABEL_10:
      _os_log_impl(&dword_18C849000, v12, v13, v11, v16, v14);

    }
  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v16 = 138543874;
      *(_QWORD *)&v16[4] = v15;
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v10;
      *(_WORD *)&v16[22] = 2114;
      v17 = v5;
      v11 = "%{public}@: [%{public}@] Clear bridge dialog message NOT sent! Error: %{public}@";
      v12 = v8;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
      goto LABEL_10;
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "finishWithSuccess:error:", v5 == 0, v5, *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
}

- (id)sendDialog:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  AMSMutableBinaryPromise *v15;
  void *v16;
  AMSMutableBinaryPromise *v17;
  AMSMutableBinaryPromise *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  AMSMutableBinaryPromise *v26;
  id v27;
  id v28;
  id v29;
  AMSDeviceMessenger *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "logKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = AMSSetLogKey(v8);

  -[AMSDeviceMessenger _identifierFromDialogRequest:](self, "_identifierFromDialogRequest:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v13;
    v33 = 2114;
    v34 = v14;
    v35 = 2114;
    v36 = v10;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending dialog with identifier: %{public}@", buf, 0x20u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_alloc_init(AMSMutableBinaryPromise);
    -[AMSDeviceMessenger _getProxyObject](self, "_getProxyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __41__AMSDeviceMessenger_sendDialog_account___block_invoke;
    v25[3] = &unk_1E2540F88;
    v17 = v15;
    v26 = v17;
    v27 = v7;
    v28 = v6;
    v29 = v10;
    v30 = self;
    objc_msgSend(v16, "addFinishBlock:", v25);

    v18 = v17;
    v19 = v18;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      objc_msgSend(v6, "logKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2114;
      v34 = v23;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid dialog for send", buf, 0x16u);

    }
    AMSError(2, CFSTR("AMSDeviceMessenger Error"), CFSTR("Invalid bridge dialog for send"), 0);
    v18 = (AMSMutableBinaryPromise *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

void __41__AMSDeviceMessenger_sendDialog_account___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  AMSXDMessage *v12;
  uint64_t v13;
  void *v14;
  AMSXDMessage *v15;
  void *v16;
  AMSXDMessage *v17;
  _QWORD v18[5];
  AMSXDMessage *v19;
  id v20;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "ams_DSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");
      v9 = v8;
      if (v8)
        v10 = v8;
      else
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = v10;

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("DSID"));
      objc_msgSend(*(id *)(a1 + 48), "setUserInfo:", v11);

    }
    v12 = [AMSXDMessage alloc];
    v13 = *(_QWORD *)(a1 + 56);
    +[AMSXDDevice allPairedDevices](AMSXDDevice, "allPairedDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AMSXDMessage initWithIdentifier:destination:purpose:object:](v12, "initWithIdentifier:destination:purpose:object:", v13, v14, 50, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 48), "logKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSXDMessage setLogKey:](v15, "setLogKey:", v16);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __41__AMSDeviceMessenger_sendDialog_account___block_invoke_2;
    v18[3] = &unk_1E253DB30;
    v18[4] = *(_QWORD *)(a1 + 64);
    v19 = v15;
    v20 = *(id *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v5, "sendMessage:completion:", v17, v18);

  }
}

void __41__AMSDeviceMessenger_sendDialog_account___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  _BYTE v16[24];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v16 = 138543618;
      *(_QWORD *)&v16[4] = v9;
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v10;
      v11 = "%{public}@: [%{public}@] Bridge dialog message sent!";
      v12 = v8;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 22;
LABEL_10:
      _os_log_impl(&dword_18C849000, v12, v13, v11, v16, v14);

    }
  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v16 = 138543874;
      *(_QWORD *)&v16[4] = v15;
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v10;
      *(_WORD *)&v16[22] = 2114;
      v17 = v5;
      v11 = "%{public}@: [%{public}@] Bridge dialog message NOT sent! Error: %{public}@";
      v12 = v8;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
      goto LABEL_10;
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "finishWithSuccess:error:", v5 == 0, v5, *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
}

- (void)deviceMessengerDidClearMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    objc_msgSend(v4, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Daemon received clear for: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  -[AMSDeviceMessenger _sendDelegateUpdateForMessage:](self, "_sendDelegateUpdateForMessage:", v4);

}

- (void)deviceMessengerDidReceiveMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    objc_msgSend(v4, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Daemon received message: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  -[AMSDeviceMessenger _sendDelegateUpdateForMessage:](self, "_sendDelegateUpdateForMessage:", v4);

}

- (void)deviceMessengerDidReceiveReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    objc_msgSend(v4, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Daemon received reply: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  -[AMSDeviceMessenger _sendDelegateUpdateForMessage:](self, "_sendDelegateUpdateForMessage:", v4);

}

- (void)deviceMessengerDidUpdateDevices
{
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = objc_opt_class();
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Daemon did update devices", (uint8_t *)&v5, 0xCu);
  }

  -[AMSDeviceMessenger _sendDelegateUpdateForMessage:](self, "_sendDelegateUpdateForMessage:", 0);
}

- (id)_getProxyObject
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_proxyObject)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSDaemonConnection deviceMessengerProxyWithDelegate:](self->_connection, "deviceMessengerProxyWithDelegate:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__AMSDeviceMessenger__getProxyObject__block_invoke;
    v5[3] = &unk_1E253F3E0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "addSuccessBlock:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
    return v4;
  }
}

void __37__AMSDeviceMessenger__getProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *WeakRetained;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)WeakRetained[1];
  WeakRetained[1] = v3;

}

- (id)_identifierFromDialogRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "title");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (__CFString *)v7;
    else
      v9 = &stru_1E2548760;
    v10 = v9;

    objc_msgSend(v3, "message");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (__CFString *)v11;
    else
      v13 = &stru_1E2548760;
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v10, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_sendDelegateUpdateForMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v12 = objc_opt_class();
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Sending update to delegate", buf, 0xCu);
  }

  -[AMSDeviceMessenger queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__AMSDeviceMessenger__sendDelegateUpdateForMessage___block_invoke;
  v9[3] = &unk_1E253E2B0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, v9);

}

void __52__AMSDeviceMessenger__sendDelegateUpdateForMessage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void (**v10)(void);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "updateHandlers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        if (!*(_QWORD *)(a1 + 40)
          || (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "filter"),
              v8 = (void *)objc_claimAutoreleasedReturnValue(),
              v9 = objc_msgSend(v8, "matchesMessage:", *(_QWORD *)(a1 + 40)),
              v8,
              v9))
        {
          objc_msgSend(v7, "block");
          v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v10[2]();

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (AMSDaemonConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)updateHandlers
{
  return self->_updateHandlers;
}

- (void)setUpdateHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_updateHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_proxyObject, 0);
}

@end
