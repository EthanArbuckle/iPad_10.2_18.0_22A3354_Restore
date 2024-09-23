@implementation MSASConnection

- (void)timerPingQueueForegroundPingTimerExpiredContext:(id)a3 personID:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "enabled"))
  {
    -[MSASConnection timerPingQueueSendSetUIForeground:personID:](self, "timerPingQueueSendSetUIForeground:personID:", 1, v7);
    v8 = dispatch_time(0, 5000000000);
    _timerPingQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MSASConnection_timerPingQueueForegroundPingTimerExpiredContext_personID___block_invoke;
    block[3] = &unk_1E994D8A8;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_after(v8, v9, block);

  }
  else
  {
    -[MSASConnection foregroundPingTimerContextByPersonID](self, "foregroundPingTimerContextByPersonID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v7);

  }
}

- (void)timerPingQueueSendSetUIForeground:(BOOL)a3 personID:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = *MEMORY[0x1E0D16F78];
  v8 = *MEMORY[0x1E0D16D78];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, v8, v9, *MEMORY[0x1E0D16DA8], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x1E0D16F30]);
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v10);

}

- (void)_sendMessageReliably:(id)a3 data:(id)a4 successHandler:(id)a5 failureHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  -[MSASConnection connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke;
  v18[3] = &unk_1E994D7E8;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v14, "sendMessageReliably:data:maxRetryCount:withHandler:", v16, v13, 5, v18);

}

- (XPCNSClientConnection)connection
{
  return self->_connection;
}

- (void)_sendMessageReliably:(id)a3
{
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", a3, 0, 0, 0);
}

- (NSMutableDictionary)foregroundPingTimerContextByPersonID
{
  NSMutableDictionary *foregroundPingTimerContextByPersonID;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  foregroundPingTimerContextByPersonID = self->_foregroundPingTimerContextByPersonID;
  if (!foregroundPingTimerContextByPersonID)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_foregroundPingTimerContextByPersonID;
    self->_foregroundPingTimerContextByPersonID = v4;

    foregroundPingTimerContextByPersonID = self->_foregroundPingTimerContextByPersonID;
  }
  return foregroundPingTimerContextByPersonID;
}

- (MSASConnection)init
{
  MSASConnection *v2;
  XPCNSClientConnection *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *memberQueue;
  const char *v6;
  NSObject *v7;
  MSASConnection *v8;
  _QWORD v10[4];
  MSASConnection *v11;
  int out_token;
  objc_super v13;
  uint8_t buf[4];
  MSASConnection *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MSASConnection;
  v2 = -[MSASConnection init](&v13, sel_init);
  if (v2)
  {
    if (_initializePlatform_onceToken != -1)
      dispatch_once(&_initializePlatform_onceToken, &__block_literal_global_213);
    v3 = -[XPCNSClientConnection initWithServiceName:delegate:]([XPCNSClientConnection alloc], "initWithServiceName:delegate:", CFSTR("com.apple.mediastream.sharing"), v2);
    -[MSASConnection setConnection:](v2, "setConnection:", v3);

    v4 = dispatch_queue_create("MSASConnection member queue", MEMORY[0x1E0C80D50]);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v4;

    out_token = 0;
    v6 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D16F68], "UTF8String");
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __22__MSASConnection_init__block_invoke;
    v10[3] = &unk_1E994D798;
    v8 = v2;
    v11 = v8;
    LODWORD(v6) = notify_register_dispatch(v6, &out_token, v7, v10);

    if ((_DWORD)v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not register for server-side configuration change notification.", buf, 0xCu);
    }

  }
  return v2;
}

- (NSMutableDictionary)focusAlbumTimerByPersonID
{
  NSMutableDictionary *focusAlbumTimerByPersonID;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  focusAlbumTimerByPersonID = self->_focusAlbumTimerByPersonID;
  if (!focusAlbumTimerByPersonID)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_focusAlbumTimerByPersonID;
    self->_focusAlbumTimerByPersonID = v4;

    focusAlbumTimerByPersonID = self->_focusAlbumTimerByPersonID;
  }
  return focusAlbumTimerByPersonID;
}

- (NSMutableDictionary)focusAlbumGUIDByPersonID
{
  NSMutableDictionary *focusAlbumGUIDByPersonID;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  focusAlbumGUIDByPersonID = self->_focusAlbumGUIDByPersonID;
  if (!focusAlbumGUIDByPersonID)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_focusAlbumGUIDByPersonID;
    self->_focusAlbumGUIDByPersonID = v4;

    focusAlbumGUIDByPersonID = self->_focusAlbumGUIDByPersonID;
  }
  return focusAlbumGUIDByPersonID;
}

- (NSMutableDictionary)serverSideConfigurationDictionaryByPersonID
{
  NSMutableDictionary *serverSideConfigurationDictionaryByPersonID;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  serverSideConfigurationDictionaryByPersonID = self->_serverSideConfigurationDictionaryByPersonID;
  if (!serverSideConfigurationDictionaryByPersonID)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_serverSideConfigurationDictionaryByPersonID;
    self->_serverSideConfigurationDictionaryByPersonID = v4;

    serverSideConfigurationDictionaryByPersonID = self->_serverSideConfigurationDictionaryByPersonID;
  }
  return serverSideConfigurationDictionaryByPersonID;
}

- (id)_communicationFailureError
{
  if (_communicationFailureError_onceToken != -1)
    dispatch_once(&_communicationFailureError_onceToken, &__block_literal_global_10);
  return (id)_communicationFailureError_error;
}

- (id)_cloneArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = MEMORY[0x1E0C809B0];
      v6 = __30__MSASConnection__cloneArray___block_invoke;
      v7 = &v13;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = MEMORY[0x1E0C809B0];
        v6 = __30__MSASConnection__cloneArray___block_invoke_2;
        v7 = &v12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = MEMORY[0x1E0C809B0];
          v6 = __30__MSASConnection__cloneArray___block_invoke_3;
          v7 = &v11;
        }
        else
        {
          v10 = MEMORY[0x1E0C809B0];
          v6 = __30__MSASConnection__cloneArray___block_invoke_4;
          v7 = &v10;
        }
      }
    }
    v7[1] = 3221225472;
    v7[2] = (uint64_t)v6;
    v7[3] = (uint64_t)&unk_1E994D810;
    v8 = v4;
    v7[4] = (uint64_t)v8;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

- (void)nextActivityDateHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0D16F28], *MEMORY[0x1E0D16D78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__MSASConnection_nextActivityDateHandler___block_invoke;
  v10[3] = &unk_1E994D838;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __42__MSASConnection_nextActivityDateHandler___block_invoke_2;
  v8[3] = &unk_1E994D7C0;
  v9 = v11;
  v7 = v11;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v5, 0, v10, v8);

}

- (void)isInRetryStateHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0D16DA0], *MEMORY[0x1E0D16D78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MSASConnection_isInRetryStateHandler___block_invoke;
  v10[3] = &unk_1E994D838;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __40__MSASConnection_isInRetryStateHandler___block_invoke_2;
  v8[3] = &unk_1E994D7C0;
  v9 = v11;
  v7 = v11;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v5, 0, v10, v8);

}

- (void)retryOutstandingActivities
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0D16F48], *MEMORY[0x1E0D16D78]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v3);

}

- (void)retryOutstandingActivitiesForPersonID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D16F50];
  v6 = *MEMORY[0x1E0D16F30];
  v11[0] = *MEMORY[0x1E0D16D78];
  v11[1] = v6;
  v12[0] = v5;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__MSASConnection_retryOutstandingActivitiesForPersonID___block_invoke;
  v9[3] = &unk_1E994D860;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v7, 0, v9, &__block_literal_global_22);

}

- (void)cancelActivitiesForPersonID:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16D40], *MEMORY[0x1E0D16D78], a3, *MEMORY[0x1E0D16F30], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v4);

}

- (void)handlePushNotificationForPersonID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  MSASConnection *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = *MEMORY[0x1E0D16F38];
    v7 = *MEMORY[0x1E0D16F30];
    v11[0] = *MEMORY[0x1E0D16D78];
    v11[1] = v7;
    v12[0] = v6;
    v12[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v8);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Missing person ID for push notification, ignoring.", (uint8_t *)&v9, 0xCu);
  }

}

- (void)activityIsThrottledByLackOfDiskSpacePersonID:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16DD8], *MEMORY[0x1E0D16D78], a3, *MEMORY[0x1E0D16F30], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__MSASConnection_activityIsThrottledByLackOfDiskSpacePersonID_completionBlock___block_invoke;
  v12[3] = &unk_1E994D838;
  v13 = v6;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __79__MSASConnection_activityIsThrottledByLackOfDiskSpacePersonID_completionBlock___block_invoke_2;
  v10[3] = &unk_1E994D7C0;
  v11 = v13;
  v9 = v13;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v7, 0, v12, v10);

}

- (void)pingForeground
{
  NSObject *v3;
  _QWORD block[5];

  _timerPingQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MSASConnection_pingForeground__block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setIsUIForeground:(BOOL)a3 forPersonID:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  _QWORD block[5];
  __CFString *v11;
  BOOL v12;

  v6 = (__CFString *)a4;
  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E994E3C0;
  _timerPingQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MSASConnection_setIsUIForeground_forPersonID___block_invoke;
  block[3] = &unk_1E994D8D0;
  v12 = a3;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)setFocusAlbum:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "GUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MSASConnection setFocusAlbumGUID:forPersonID:](self, "setFocusAlbumGUID:forPersonID:", v7, v6);

}

- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  MSASConnection *v15;
  id v16;
  uint8_t buf[4];
  MSASConnection *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _timerPingQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __48__MSASConnection_setFocusAlbumGUID_forPersonID___block_invoke;
  v14 = &unk_1E994DD00;
  v15 = self;
  v16 = v7;
  v9 = v7;
  dispatch_async(v8, &block);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting focus album GUID to %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16F70], *MEMORY[0x1E0D16D78], v9, *MEMORY[0x1E0D16F30], v6, *MEMORY[0x1E0D16C90], 0, block, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v10);

}

- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  MSASConnection *v15;
  id v16;
  uint8_t buf[4];
  MSASConnection *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _timerPingQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __58__MSASConnection_setFocusAssetCollectionGUID_forPersonID___block_invoke;
  v14 = &unk_1E994DD00;
  v15 = self;
  v16 = v7;
  v9 = v7;
  dispatch_async(v8, &block);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting focus asset collection GUID to %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16EE8], *MEMORY[0x1E0D16D78], v9, *MEMORY[0x1E0D16F30], v6, *MEMORY[0x1E0D16CD0], 0, block, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v10);

}

- (void)albumGUIDsForPersonID:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E00], *MEMORY[0x1E0D16D78], a3, *MEMORY[0x1E0D16F30], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__MSASConnection_albumGUIDsForPersonID_completionBlock___block_invoke;
  v12[3] = &unk_1E994D838;
  v13 = v6;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __56__MSASConnection_albumGUIDsForPersonID_completionBlock___block_invoke_2;
  v10[3] = &unk_1E994D7C0;
  v11 = v13;
  v9 = v13;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v7, 0, v12, v10);

}

- (void)albumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E08], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C90], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__MSASConnection_albumWithGUID_personID_completionBlock___block_invoke;
  v14[3] = &unk_1E994D838;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __57__MSASConnection_albumWithGUID_personID_completionBlock___block_invoke_2;
  v12[3] = &unk_1E994D7C0;
  v13 = v15;
  v11 = v15;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v9, 0, v14, v12);

}

- (void)accessControlGUIDsForAlbumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16DC8], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C90], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__MSASConnection_accessControlGUIDsForAlbumWithGUID_personID_completionBlock___block_invoke;
  v14[3] = &unk_1E994D838;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __78__MSASConnection_accessControlGUIDsForAlbumWithGUID_personID_completionBlock___block_invoke_2;
  v12[3] = &unk_1E994D7C0;
  v13 = v15;
  v11 = v15;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v9, 0, v14, v12);

}

- (void)accessControlWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16DD0], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C88], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__MSASConnection_accessControlWithGUID_personID_completionBlock___block_invoke;
  v14[3] = &unk_1E994D838;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __65__MSASConnection_accessControlWithGUID_personID_completionBlock___block_invoke_2;
  v12[3] = &unk_1E994D7C0;
  v13 = v15;
  v11 = v15;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v9, 0, v14, v12);

}

- (void)invitationGUIDsForPersonID:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E58], *MEMORY[0x1E0D16D78], a3, *MEMORY[0x1E0D16F30], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__MSASConnection_invitationGUIDsForPersonID_completionBlock___block_invoke;
  v12[3] = &unk_1E994D838;
  v13 = v6;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __61__MSASConnection_invitationGUIDsForPersonID_completionBlock___block_invoke_2;
  v10[3] = &unk_1E994D7C0;
  v11 = v13;
  v9 = v13;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v7, 0, v12, v10);

}

- (void)invitationWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E60], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16D90], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__MSASConnection_invitationWithGUID_personID_completionBlock___block_invoke;
  v14[3] = &unk_1E994D838;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __62__MSASConnection_invitationWithGUID_personID_completionBlock___block_invoke_2;
  v12[3] = &unk_1E994D7C0;
  v13 = v15;
  v11 = v15;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v9, 0, v14, v12);

}

- (void)assetCollectionGUIDsInAlbumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E10], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C90], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__MSASConnection_assetCollectionGUIDsInAlbumWithGUID_personID_completionBlock___block_invoke;
  v14[3] = &unk_1E994D838;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __79__MSASConnection_assetCollectionGUIDsInAlbumWithGUID_personID_completionBlock___block_invoke_2;
  v12[3] = &unk_1E994D7C0;
  v13 = v15;
  v11 = v15;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v9, 0, v14, v12);

}

- (void)assetCollectionWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E18], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16CD0], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__MSASConnection_assetCollectionWithGUID_personID_completionBlock___block_invoke;
  v14[3] = &unk_1E994D838;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __67__MSASConnection_assetCollectionWithGUID_personID_completionBlock___block_invoke_2;
  v12[3] = &unk_1E994D7C0;
  v13 = v15;
  v11 = v15;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v9, 0, v14, v12);

}

- (void)videoURLForAssetCollectionWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16F10], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16CD0], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__MSASConnection_videoURLForAssetCollectionWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E994D8F8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "sendMessageReliably:data:maxRetryCount:withHandler:", v9, 0, 5, v12);

}

- (void)videoURLsForAssetCollectionWithGUID:(id)a3 forMediaAssetType:(unint64_t)a4 personID:(id)a5 completionBlock:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  _QWORD v23[4];
  id v24;

  v22 = a6;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = *MEMORY[0x1E0D16F18];
  v11 = *MEMORY[0x1E0D16D78];
  v12 = *MEMORY[0x1E0D16F30];
  v13 = *MEMORY[0x1E0D16CD0];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a5;
  v16 = a3;
  objc_msgSend(v14, "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, v11, v15, v12, v16, v13, v17, *MEMORY[0x1E0D16F98], 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASConnection connection](self, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__MSASConnection_videoURLsForAssetCollectionWithGUID_forMediaAssetType_personID_completionBlock___block_invoke;
  v23[3] = &unk_1E994D8F8;
  v24 = v22;
  v20 = v22;
  objc_msgSend(v19, "sendMessageReliably:data:maxRetryCount:withHandler:", v18, 0, 5, v23);

}

- (void)isAssetCollectionWithGUID:(id)a3 markedAsUnviewedPersonID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E68], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16CD0], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__MSASConnection_isAssetCollectionWithGUID_markedAsUnviewedPersonID_completionBlock___block_invoke;
  v14[3] = &unk_1E994D838;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __85__MSASConnection_isAssetCollectionWithGUID_markedAsUnviewedPersonID_completionBlock___block_invoke_2;
  v12[3] = &unk_1E994D7C0;
  v13 = v15;
  v11 = v15;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v9, 0, v14, v12);

}

- (void)commentGUIDsForAssetCollectionWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E20], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16CD0], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__MSASConnection_commentGUIDsForAssetCollectionWithGUID_personID_completionBlock___block_invoke;
  v14[3] = &unk_1E994D838;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __82__MSASConnection_commentGUIDsForAssetCollectionWithGUID_personID_completionBlock___block_invoke_2;
  v12[3] = &unk_1E994D7C0;
  v13 = v15;
  v11 = v15;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v9, 0, v14, v12);

}

- (void)commentWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E28], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16D48], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__MSASConnection_commentWithGUID_personID_completionBlock___block_invoke;
  v14[3] = &unk_1E994D838;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __59__MSASConnection_commentWithGUID_personID_completionBlock___block_invoke_2;
  v12[3] = &unk_1E994D7C0;
  v13 = v15;
  v11 = v15;
  -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v9, 0, v14, v12);

}

- (void)serverSideConfigurationDictionaryForPersonID:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(id, void *);
  _QWORD v15[5];
  id v16;
  void (**v17)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[MSASConnection serverSideConfigurationDictionaryByPersonID](self, "serverSideConfigurationDictionaryByPersonID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v7[2](v7, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16EE0], *MEMORY[0x1E0D16D78], v6, *MEMORY[0x1E0D16F30], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__MSASConnection_serverSideConfigurationDictionaryForPersonID_completionBlock___block_invoke;
    v15[3] = &unk_1E994D920;
    v15[4] = self;
    v16 = v6;
    v17 = v7;
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __79__MSASConnection_serverSideConfigurationDictionaryForPersonID_completionBlock___block_invoke_27;
    v12[3] = &unk_1E994DC88;
    v12[4] = self;
    v13 = v16;
    v14 = v17;
    -[MSASConnection _sendMessageReliably:data:successHandler:failureHandler:](self, "_sendMessageReliably:data:successHandler:failureHandler:", v10, 0, v15, v12);

  }
}

- (void)refreshResetSync:(BOOL)a3 personID:(id)a4
{
  -[MSASConnection refreshResetSync:personID:info:](self, "refreshResetSync:personID:info:", a3, a4, 0);
}

- (void)refreshResetSync:(BOOL)a3 personID:(id)a4 info:(id)a5
{
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = *MEMORY[0x1E0D16EB8];
  v10 = *MEMORY[0x1E0D16D78];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "numberWithBool:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, v10, v15, *MEMORY[0x1E0D16F40], v13, *MEMORY[0x1E0D16F30], v12, *MEMORY[0x1E0D16D80], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v14);
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5
{
  -[MSASConnection refreshContentOfAlbumWithGUID:resetSync:personID:info:](self, "refreshContentOfAlbumWithGUID:resetSync:personID:info:", a3, a4, a5, 0);
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6
{
  _BOOL8 v7;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  v7 = a4;
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = *MEMORY[0x1E0D16EB0];
  v12 = *MEMORY[0x1E0D16D78];
  v13 = *MEMORY[0x1E0D16F30];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a6;
  v16 = a5;
  v17 = a3;
  objc_msgSend(v14, "numberWithBool:", v7);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, v12, v16, v13, v19, *MEMORY[0x1E0D16F40], v17, *MEMORY[0x1E0D16C90], v15, *MEMORY[0x1E0D16D80], 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v18);
}

- (void)refreshAccessControlListForAlbumWithGUID:(id)a3 personID:(id)a4
{
  -[MSASConnection refreshAccessControlListForAlbumWithGUID:personID:info:](self, "refreshAccessControlListForAlbumWithGUID:personID:info:", a3, a4, 0);
}

- (void)refreshAccessControlListForAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16EA0], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C90], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5
{
  -[MSASConnection refreshCommentsForAssetCollectionWithGUID:resetSync:personID:info:](self, "refreshCommentsForAssetCollectionWithGUID:resetSync:personID:info:", a3, a4, a5, 0);
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6
{
  _BOOL8 v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  v7 = a4;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = *MEMORY[0x1E0D16EA8];
  v11 = *MEMORY[0x1E0D16D78];
  v12 = *MEMORY[0x1E0D16F30];
  v13 = *MEMORY[0x1E0D16CD0];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a6;
  v16 = a5;
  v17 = a3;
  objc_msgSend(v14, "numberWithBool:", v7);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, v11, v16, v12, v17, v13, v19, *MEMORY[0x1E0D16F40], v15, *MEMORY[0x1E0D16D80], 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v18);
}

- (void)addAlbum:(id)a3 personID:(id)a4
{
  -[MSASConnection addAlbum:personID:info:](self, "addAlbum:personID:info:", a3, a4, 0);
}

- (void)addAlbum:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16DE8], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C98], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4
{
  -[MSASConnection modifyAlbumMetadata:personID:info:](self, "modifyAlbumMetadata:personID:info:", a3, a4, 0);
}

- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E98], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C98], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4
{
  -[MSASConnection deleteAlbumWithGUID:personID:info:](self, "deleteAlbumWithGUID:personID:info:", a3, a4, 0);
}

- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E30], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C90], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4
{
  -[MSASConnection markAlbumGUIDAsViewed:personID:info:](self, "markAlbumGUIDAsViewed:personID:info:", a3, a4, 0);
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 info:(id)a5
{
  -[MSASConnection markAlbumGUIDAsViewed:personID:moveLastViewedAssetCollectionMarker:info:](self, "markAlbumGUIDAsViewed:personID:moveLastViewedAssetCollectionMarker:info:", a3, a4, 1, a5);
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 moveLastViewedAssetCollectionMarker:(BOOL)a5 info:(id)a6
{
  _BOOL8 v6;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  v6 = a5;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = *MEMORY[0x1E0D16E70];
  v11 = *MEMORY[0x1E0D16D78];
  v12 = *MEMORY[0x1E0D16F30];
  v13 = *MEMORY[0x1E0D16C90];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a6;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v14, "numberWithBool:", v6);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, v11, v16, v12, v17, v13, v19, *MEMORY[0x1E0D16F20], v15, *MEMORY[0x1E0D16D80], 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v18);
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__MSASConnection_setPublicAccessEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E994D948;
  v13 = v10;
  v11 = v10;
  -[MSASConnection setPublicAccessEnabled:forAlbumWithGUID:personID:info:completionBlock:](self, "setPublicAccessEnabled:forAlbumWithGUID:personID:info:completionBlock:", v8, a4, a5, 0, v12);

}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  MSASConnection *v29;
  id v30;

  v10 = a3;
  v11 = a6;
  v26 = a7;
  v24 = (void *)MEMORY[0x1E0C99D80];
  v12 = *MEMORY[0x1E0D16EF8];
  v13 = *MEMORY[0x1E0D16D78];
  v14 = *MEMORY[0x1E0D16F30];
  v15 = *MEMORY[0x1E0D16C90];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = a5;
  v18 = a4;
  objc_msgSend(v16, "numberWithBool:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v12, v13, v17, v14, v18, v15, v19, *MEMORY[0x1E0D16D58], v11, *MEMORY[0x1E0D16D80], 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASConnection connection](self, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __88__MSASConnection_setPublicAccessEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke;
  v27[3] = &unk_1E994D970;
  v29 = self;
  v30 = v26;
  v28 = v11;
  v22 = v11;
  v23 = v26;
  objc_msgSend(v21, "sendMessageReliably:data:maxRetryCount:withHandler:", v20, 0, 5, v27);

}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__MSASConnection_setMultipleContributorsEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E994D948;
  v13 = v10;
  v11 = v10;
  -[MSASConnection setMultipleContributorsEnabled:forAlbumWithGUID:personID:info:completionBlock:](self, "setMultipleContributorsEnabled:forAlbumWithGUID:personID:info:completionBlock:", v8, a4, a5, 0, v12);

}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  MSASConnection *v29;
  id v30;

  v10 = a3;
  v11 = a6;
  v26 = a7;
  v24 = (void *)MEMORY[0x1E0C99D80];
  v12 = *MEMORY[0x1E0D16EF0];
  v13 = *MEMORY[0x1E0D16D78];
  v14 = *MEMORY[0x1E0D16F30];
  v15 = *MEMORY[0x1E0D16C90];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = a5;
  v18 = a4;
  objc_msgSend(v16, "numberWithBool:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v12, v13, v17, v14, v18, v15, v19, *MEMORY[0x1E0D16D58], v11, *MEMORY[0x1E0D16D80], 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASConnection connection](self, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __96__MSASConnection_setMultipleContributorsEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke;
  v27[3] = &unk_1E994D970;
  v29 = self;
  v30 = v26;
  v28 = v11;
  v22 = v11;
  v23 = v26;
  objc_msgSend(v21, "sendMessageReliably:data:maxRetryCount:withHandler:", v20, 0, 5, v27);

}

- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4
{
  -[MSASConnection subscribeToAlbumWithGUID:personID:info:](self, "subscribeToAlbumWithGUID:personID:info:", a3, a4, 0);
}

- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16F00], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C90], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4
{
  -[MSASConnection unsubscribeFromAlbumWithGUID:personID:info:](self, "unsubscribeFromAlbumWithGUID:personID:info:", a3, a4, 0);
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16F08], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16C90], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)markAsSpamInvitationWithToken:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = *MEMORY[0x1E0D16E88];
  v10 = *MEMORY[0x1E0D16F30];
  v19[0] = *MEMORY[0x1E0D16D78];
  v19[1] = v10;
  v20[0] = v9;
  v20[1] = a4;
  v19[2] = *MEMORY[0x1E0D16D98];
  v20[2] = a3;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__MSASConnection_markAsSpamInvitationWithToken_personID_completionBlock___block_invoke;
  v17[3] = &unk_1E994D998;
  v17[4] = self;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "sendMessageReliably:data:maxRetryCount:withHandler:", v14, 0, 5, v17);

}

- (void)markAsSpamInvitationWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = *MEMORY[0x1E0D16E80];
  v10 = *MEMORY[0x1E0D16F30];
  v19[0] = *MEMORY[0x1E0D16D78];
  v19[1] = v10;
  v20[0] = v9;
  v20[1] = a4;
  v19[2] = *MEMORY[0x1E0D16D90];
  v20[2] = a3;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__MSASConnection_markAsSpamInvitationWithGUID_personID_completionBlock___block_invoke;
  v17[3] = &unk_1E994D998;
  v17[4] = self;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "sendMessageReliably:data:maxRetryCount:withHandler:", v14, 0, 5, v17);

}

- (void)markAsSpamAlbumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = *MEMORY[0x1E0D16E78];
  v10 = *MEMORY[0x1E0D16F30];
  v19[0] = *MEMORY[0x1E0D16D78];
  v19[1] = v10;
  v20[0] = v9;
  v20[1] = a4;
  v19[2] = *MEMORY[0x1E0D16C90];
  v20[2] = a3;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__MSASConnection_markAsSpamAlbumWithGUID_personID_completionBlock___block_invoke;
  v17[3] = &unk_1E994D998;
  v17[4] = self;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "sendMessageReliably:data:maxRetryCount:withHandler:", v14, 0, 5, v17);

}

- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__MSASConnection_acceptInvitationWithToken_personID_completionBlock___block_invoke;
  v10[3] = &unk_1E994D948;
  v11 = v8;
  v9 = v8;
  -[MSASConnection acceptInvitationWithToken:personID:info:completionBlock:](self, "acceptInvitationWithToken:personID:info:completionBlock:", a3, a4, 0, v10);

}

- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  MSASConnection *v18;
  id v19;

  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16DC0], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16D98], v10, *MEMORY[0x1E0D16D80], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__MSASConnection_acceptInvitationWithToken_personID_info_completionBlock___block_invoke;
  v16[3] = &unk_1E994D970;
  v18 = self;
  v19 = v11;
  v17 = v10;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v13, "sendMessageReliably:data:maxRetryCount:withHandler:", v12, 0, 5, v16);

}

- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4
{
  -[MSASConnection acceptInvitationWithGUID:personID:info:](self, "acceptInvitationWithGUID:personID:info:", a3, a4, 0);
}

- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16DB8], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16D90], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4
{
  -[MSASConnection rejectInvitationWithGUID:personID:info:](self, "rejectInvitationWithGUID:personID:info:", a3, a4, 0);
}

- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16EC0], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16D90], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5
{
  -[MSASConnection addAccessControlEntries:toAlbumWithGUID:personID:info:](self, "addAccessControlEntries:toAlbumWithGUID:personID:info:", a3, a4, a5, 0);
}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16DE0], *MEMORY[0x1E0D16D78], a5, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16F88], a4, *MEMORY[0x1E0D16C90], a6, *MEMORY[0x1E0D16D80], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v7);

}

- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4
{
  -[MSASConnection removeAccessControlEntryWithGUID:personID:info:](self, "removeAccessControlEntryWithGUID:personID:info:", a3, a4, 0);
}

- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16EC8], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16F80], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5
{
  -[MSASConnection addAssetCollections:toAlbumWithGUID:personID:info:](self, "addAssetCollections:toAlbumWithGUID:personID:info:", a3, a4, a5, 0);
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16DF0], *MEMORY[0x1E0D16D78], a5, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16D28], a4, *MEMORY[0x1E0D16C90], a6, *MEMORY[0x1E0D16D80], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v7);

}

- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4
{
  -[MSASConnection deleteAssetCollectionWithGUID:personID:info:](self, "deleteAssetCollectionWithGUID:personID:info:", a3, a4, 0);
}

- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E38], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16CD0], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)deleteAssetCollectionsWithGUIDs:(id)a3 personID:(id)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E40], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16CD8], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v5);

}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5
{
  -[MSASConnection markCommentsForAssetCollectionWithGUID:asViewedWithLastViewedDate:personID:info:](self, "markCommentsForAssetCollectionWithGUID:asViewedWithLastViewedDate:personID:info:", a3, a4, a5, 0);
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5 info:(id)a6
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E90], *MEMORY[0x1E0D16D78], a5, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16CD0], a4, *MEMORY[0x1E0D16DB0], a6, *MEMORY[0x1E0D16D80], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v7);

}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5
{
  -[MSASConnection addComments:toAssetCollectionWithGUID:personID:info:](self, "addComments:toAssetCollectionWithGUID:personID:info:", a3, a4, a5, 0);
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16DF8], *MEMORY[0x1E0D16D78], a5, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16D50], a4, *MEMORY[0x1E0D16CD0], a6, *MEMORY[0x1E0D16D80], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v7);

}

- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4
{
  -[MSASConnection deleteCommentWithGUID:personID:info:](self, "deleteCommentWithGUID:personID:info:", a3, a4, 0);
}

- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E48], *MEMORY[0x1E0D16D78], a4, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16D48], a5, *MEMORY[0x1E0D16D80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)forgetEverythingAboutPersonID:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16E50], *MEMORY[0x1E0D16D78], a3, *MEMORY[0x1E0D16F30], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v4);

}

- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4 personID:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D16ED8], *MEMORY[0x1E0D16D78], a5, *MEMORY[0x1E0D16F30], a3, *MEMORY[0x1E0D16D38], a4, *MEMORY[0x1E0D16C90], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v6);

}

- (void)retrieveAssetsFromAssetCollectionsWithGUIDs:(id)a3 assetTypeFlags:(int)a4 personID:(id)a5
{
  uint64_t v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v5 = *(_QWORD *)&a4;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = *MEMORY[0x1E0D16ED0];
  v10 = *MEMORY[0x1E0D16D78];
  v11 = *MEMORY[0x1E0D16F30];
  v12 = *MEMORY[0x1E0D16CD8];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = a5;
  v15 = a3;
  objc_msgSend(v13, "numberWithInt:", v5);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, v10, v14, v11, v15, v12, v17, *MEMORY[0x1E0D16D30], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASConnection _sendMessageReliably:](self, "_sendMessageReliably:", v16);
}

- (void)XPCNSClientConnection:(id)a3 didReceiveRequest:(id)a4
{
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MSASConnection received an unexpected request. Ignoring.", v4, 2u);
  }
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setForegroundPingTimerContextByPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundPingTimerContextByPersonID, a3);
}

- (void)setFocusAlbumTimerByPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_focusAlbumTimerByPersonID, a3);
}

- (void)setFocusAlbumGUIDByPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_focusAlbumGUIDByPersonID, a3);
}

- (void)setServerSideConfigurationDictionaryByPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_serverSideConfigurationDictionaryByPersonID, a3);
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_serverSideConfigurationDictionaryByPersonID, 0);
  objc_storeStrong((id *)&self->_focusAlbumGUIDByPersonID, 0);
  objc_storeStrong((id *)&self->_focusAlbumTimerByPersonID, 0);
  objc_storeStrong((id *)&self->_foregroundPingTimerContextByPersonID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __74__MSASConnection_acceptInvitationWithToken_personID_info_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  if (a2)
  {
    if (v6)
    {
      v10 = v5;
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D16D80]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16D60]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

LABEL_6:
      v5 = v10;
    }
  }
  else if (v6)
  {
    v10 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_communicationFailureError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v9, v7);
    goto LABEL_6;
  }

}

uint64_t __69__MSASConnection_acceptInvitationWithToken_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__MSASConnection_markAsSpamAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    if (v6)
    {
      v8 = v5;
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
LABEL_6:
      v5 = v8;
    }
  }
  else if (v6)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_communicationFailureError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    goto LABEL_6;
  }

}

void __72__MSASConnection_markAsSpamInvitationWithGUID_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    if (v6)
    {
      v8 = v5;
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
LABEL_6:
      v5 = v8;
    }
  }
  else if (v6)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_communicationFailureError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    goto LABEL_6;
  }

}

void __73__MSASConnection_markAsSpamInvitationWithToken_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    if (v6)
    {
      v8 = v5;
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
LABEL_6:
      v5 = v8;
    }
  }
  else if (v6)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_communicationFailureError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    goto LABEL_6;
  }

}

void __96__MSASConnection_setMultipleContributorsEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  if (a2)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D16D80]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16D60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_communicationFailureError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v9, v7);
  }

}

uint64_t __91__MSASConnection_setMultipleContributorsEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__MSASConnection_setPublicAccessEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  if (a2)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D16D80]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16D60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_communicationFailureError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v9, v7);
  }

}

uint64_t __83__MSASConnection_setPublicAccessEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__MSASConnection_serverSideConfigurationDictionaryForPersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieved server side config for personID %@: %{public}@", (uint8_t *)&v7, 0x20u);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "serverSideConfigurationDictionaryByPersonID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

  }
LABEL_4:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __79__MSASConnection_serverSideConfigurationDictionaryForPersonID_completionBlock___block_invoke_27(_QWORD *a1)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = 138543618;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not retrieve server side config for person ID %@", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __59__MSASConnection_commentWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __59__MSASConnection_commentWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__MSASConnection_commentGUIDsForAssetCollectionWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __82__MSASConnection_commentGUIDsForAssetCollectionWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__MSASConnection_isAssetCollectionWithGUID_markedAsUnviewedPersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "BOOLValue"));

}

uint64_t __85__MSASConnection_isAssetCollectionWithGUID_markedAsUnviewedPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__MSASConnection_videoURLsForAssetCollectionWithGUID_forMediaAssetType_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  if (a2)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D16D60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16F58]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16F90]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v9);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0, 0);
  }

}

void __78__MSASConnection_videoURLForAssetCollectionWithGUID_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  if (a2)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D16D60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16F58]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16F90]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v9);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0, 0);
  }

}

void __67__MSASConnection_assetCollectionWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __67__MSASConnection_assetCollectionWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__MSASConnection_assetCollectionGUIDsInAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __79__MSASConnection_assetCollectionGUIDsInAlbumWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__MSASConnection_invitationWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __62__MSASConnection_invitationWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__MSASConnection_invitationGUIDsForPersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __61__MSASConnection_invitationGUIDsForPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__MSASConnection_accessControlWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __65__MSASConnection_accessControlWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__MSASConnection_accessControlGUIDsForAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __78__MSASConnection_accessControlGUIDsForAlbumWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__MSASConnection_albumWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __57__MSASConnection_albumWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__MSASConnection_albumGUIDsForPersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __56__MSASConnection_albumGUIDsForPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__MSASConnection_setFocusAssetCollectionGUID_forPersonID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerPingQueueSendSetUIForeground:personID:", 1, *(_QWORD *)(a1 + 40));
}

uint64_t __48__MSASConnection_setFocusAlbumGUID_forPersonID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerPingQueueSendSetUIForeground:personID:", 1, *(_QWORD *)(a1 + 40));
}

void __48__MSASConnection_setIsUIForeground_forPersonID___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "foregroundPingTimerContextByPersonID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {

    if (v5)
    {
      objc_msgSend(v5, "enable");
    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D16C80]);
      objc_msgSend(*(id *)(a1 + 32), "foregroundPingTimerContextByPersonID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));

      v8 = dispatch_time(0, 5000000000);
      _timerPingQueue();
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__MSASConnection_setIsUIForeground_forPersonID___block_invoke_2;
      block[3] = &unk_1E994D8A8;
      v10 = *(void **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      v14 = v6;
      v15 = v10;
      v11 = v6;
      dispatch_after(v8, v9, block);

      objc_msgSend(*(id *)(a1 + 32), "timerPingQueueSendSetUIForeground:personID:", 1, *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    objc_msgSend(v4, "disable");

    objc_msgSend(*(id *)(a1 + 32), "foregroundPingTimerContextByPersonID");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __48__MSASConnection_setIsUIForeground_forPersonID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerPingQueueForegroundPingTimerExpiredContext:personID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __75__MSASConnection_timerPingQueueForegroundPingTimerExpiredContext_personID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerPingQueueForegroundPingTimerExpiredContext:personID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __32__MSASConnection_pingForeground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerPingQueueSendSetUIForeground:personID:", 1, &stru_1E994E3C0);
}

void __79__MSASConnection_activityIsThrottledByLackOfDiskSpacePersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v2 + 16))(v2, objc_msgSend(v3, "intValue") != 0);

}

uint64_t __79__MSASConnection_activityIsThrottledByLackOfDiskSpacePersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__MSASConnection_retryOutstandingActivitiesForPersonID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16D60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138543874;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to send message to retry outstanding activities for personID %@. Error: %{public}@", (uint8_t *)&v6, 0x20u);
  }

}

void __56__MSASConnection_retryOutstandingActivitiesForPersonID___block_invoke_21()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v0 = 0;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to send message to retry outstanding activities.", v0, 2u);
  }
}

void __40__MSASConnection_isInRetryStateHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "BOOLValue"));

}

uint64_t __40__MSASConnection_isInRetryStateHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__MSASConnection_nextActivityDateHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D16F58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __42__MSASConnection_nextActivityDateHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __30__MSASConnection__cloneArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D16C58], "assetCollectionWithAssetCollection:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __30__MSASConnection__cloneArray___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(v2, "addObject:", v3);

}

void __30__MSASConnection__cloneArray___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D16C70], "assetWithAsset:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __30__MSASConnection__cloneArray___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D16C50], "albumWithAlbum:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __44__MSASConnection__communicationFailureError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  MSMSLocalizedString(CFSTR("ERROR_CONNECTION_FAILED"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASConnectionErrorDomain"), 0, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_communicationFailureError_error;
  _communicationFailureError_error = v1;

}

void __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke_2;
      block[3] = &unk_1E994DC10;
      v7 = &v14;
      v14 = v6;
      v13 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_8:
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D16D78]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to send XPC command: %{public}@", buf, 0xCu);

    }
    v8 = *(void **)(a1 + 48);
    if (v8)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke_8;
      v10[3] = &unk_1E994D7C0;
      v7 = &v11;
      v11 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], v10);
      goto LABEL_8;
    }
  }

}

uint64_t __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __22__MSASConnection_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  _QWORD block[4];
  _QWORD *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v9 = v2;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@: Server side configuration changed. Purging local cache.", buf, 0xCu);
  }
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[6];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__MSASConnection_init__block_invoke_4;
  block[3] = &unk_1E994DA10;
  v7 = v3;
  dispatch_barrier_sync(v4, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0D16F68], *(_QWORD *)(a1 + 32));

}

void __22__MSASConnection_init__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_457);
  return (id)sharedConnection_connection;
}

void __34__MSASConnection_sharedConnection__block_invoke()
{
  MSASConnection *v0;
  void *v1;

  v0 = objc_alloc_init(MSASConnection);
  v1 = (void *)sharedConnection_connection;
  sharedConnection_connection = (uint64_t)v0;

}

@end
