@implementation CXProvider

+ (CXProvider)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (CXProvider *)+[CXProvider allocWithZone:](CXXPCProvider, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CXProvider;
  return (CXProvider *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (CXProvider)initWithConfiguration:(CXProviderConfiguration *)configuration
{
  CXProviderConfiguration *v4;
  CXProvider *v5;
  CXAbstractProvider *v6;
  CXAbstractProvider *abstractProvider;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *completionQueue;
  uint64_t v11;
  CXProviderConfiguration *v12;
  void *v13;
  objc_super v15;

  v4 = configuration;
  v15.receiver = self;
  v15.super_class = (Class)CXProvider;
  v5 = -[CXProvider init](&v15, sel_init);
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider initWithConfiguration:]", CFSTR("configuration"));
    v6 = objc_alloc_init(CXAbstractProvider);
    abstractProvider = v5->_abstractProvider;
    v5->_abstractProvider = v6;

    -[CXAbstractProvider setInternalActionDelegate:](v5->_abstractProvider, "setInternalActionDelegate:", v5);
    -[CXAbstractProvider setConnectionInterruptionHandler:](v5->_abstractProvider, "setConnectionInterruptionHandler:", &__block_literal_global_9);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.callkit.callprovider.completion", v8);
    completionQueue = v5->_completionQueue;
    v5->_completionQueue = (OS_dispatch_queue *)v9;

    v11 = -[CXProviderConfiguration copy](v4, "copy");
    v12 = v5->_configuration;
    v5->_configuration = (CXProviderConfiguration *)v11;

    if (-[CXProvider requiresProxyingAVAudioSessionState](v5, "requiresProxyingAVAudioSessionState"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", v5, sel_handleMediaServicesWereResetNotification_, *MEMORY[0x1E0C89738], 0);

    }
  }

  return v5;
}

void __36__CXProvider_initWithConfiguration___block_invoke()
{
  void *v0;
  int v1;
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[8];
  id v12;

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v1 = objc_msgSend(v0, "setInterruptionPriority:error:", 0, &v12);
  v2 = v12;

  CXDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v1)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Successfully reset audio session interruption priority to Normal", v11, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __36__CXProvider_initWithConfiguration___block_invoke_cold_1((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }

}

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 0;
}

- (id)callProviderHostDelegate
{
  void *v2;
  void *v3;
  id v4;

  -[CXProvider hostProtocolDelegate](self, "hostProtocolDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE704168))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (CXAbstractProviderDelegate)delegate
{
  void *v2;
  void *v3;
  void *v4;
  CXAbstractProviderDelegate *v5;

  -[CXProvider abstractProvider](self, "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE713880))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (CXProviderDelegatePrivate)privateDelegate
{
  void *v2;
  void *v3;
  void *v4;
  CXProviderDelegatePrivate *v5;

  -[CXProvider abstractProvider](self, "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE715EC8))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (CXProviderConfiguration)configuration
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[CXProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__CXProvider_configuration__block_invoke;
  v6[3] = &unk_1E4B88C60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CXProviderConfiguration *)v4;
}

void __27__CXProvider_configuration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setConfiguration:(CXProviderConfiguration *)configuration
{
  CXProviderConfiguration *v4;
  int v5;
  NSObject *v6;
  CXProviderConfiguration *v7;
  _QWORD block[5];
  CXProviderConfiguration *v9;

  v4 = configuration;
  v5 = dyld_program_sdk_at_least();
  if (!v4 && v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider setConfiguration:]", CFSTR("configuration"));
  -[CXProvider queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CXProvider_setConfiguration___block_invoke;
  block[3] = &unk_1E4B88A20;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

}

uint64_t __31__CXProvider_setConfiguration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v9 = 138412546;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that configuration was set to %@", (uint8_t *)&v9, 0x16u);
  }

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

  return objc_msgSend(*(id *)(a1 + 32), "registerCurrentConfiguration");
}

- (NSArray)pendingCallActionsOfClass:(Class)callActionClass withCallUUID:(NSUUID *)callUUID
{
  NSUUID *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = callUUID;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class isSubclassOfClass:](callActionClass, "isSubclassOfClass:", objc_opt_class()))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[CXProvider pendingTransactions](self, "pendingTransactions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v22)
    {
      v21 = *(_QWORD *)v29;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(obj);
          v23 = v8;
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v9, "actions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v15, "callUUID");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = objc_msgSend(v16, "isEqual:", v6);

                  if (v17)
                    objc_msgSend(v7, "addObject:", v15);
                }
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v12);
          }

          v8 = v23 + 1;
        }
        while (v23 + 1 != v22);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v22);
    }

  }
  v18 = (void *)objc_msgSend(v7, "copy");

  return (NSArray *)v18;
}

- (void)reportNewIncomingCallWithUUID:(NSUUID *)UUID update:(CXCallUpdate *)update completion:(void *)completion
{
  NSUUID *v8;
  CXCallUpdate *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  CXCallUpdate *v14;
  NSUUID *v15;
  _QWORD block[5];
  NSUUID *v17;
  CXCallUpdate *v18;
  id v19;

  v8 = UUID;
  v9 = update;
  v10 = completion;
  if (dyld_program_sdk_at_least())
  {
    if (v8)
    {
      if (v9)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportNewIncomingCallWithUUID:update:completion:]", CFSTR("UUID"));
      if (v9)
      {
LABEL_4:
        if (v10)
          goto LABEL_5;
LABEL_8:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportNewIncomingCallWithUUID:update:completion:]", CFSTR("completion"));
        goto LABEL_5;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportNewIncomingCallWithUUID:update:completion:]", CFSTR("update"));
    if (v10)
      goto LABEL_5;
    goto LABEL_8;
  }
LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", *MEMORY[0x1E0CD2300], 0);

  -[CXProvider queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke;
  block[3] = &unk_1E4B88C18;
  block[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, block);

}

void __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was asked to report a new incoming call with UUID: %@ update: %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke_154;
  v9[3] = &unk_1E4B89388;
  v7 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v6, "reportNewIncomingCallWithUUID:update:reply:", v7, v8, v9);

}

void __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke_154(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke_2;
  v7[3] = &unk_1E4B89360;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performCompletionBlock:", v7);

}

uint64_t __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)reportCallWithUUID:(NSUUID *)UUID updated:(CXCallUpdate *)update
{
  NSUUID *v6;
  CXCallUpdate *v7;
  NSObject *v8;
  CXCallUpdate *v9;
  NSUUID *v10;
  _QWORD block[5];
  NSUUID *v12;
  CXCallUpdate *v13;

  v6 = UUID;
  v7 = update;
  if (dyld_program_sdk_at_least())
  {
    if (v6)
    {
      if (v7)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:updated:]", CFSTR("UUID"));
      if (v7)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:updated:]", CFSTR("update"));
  }
LABEL_4:
  -[CXProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CXProvider_reportCallWithUUID_updated___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __41__CXProvider_reportCallWithUUID_updated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was asked to report that call with UUID %@ updated with update %@", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportCallWithUUID:updated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)reportCallWithUUID:(NSUUID *)UUID endedAtDate:(NSDate *)dateEnded reason:(CXCallEndedReason)endedReason
{
  NSUUID *v8;
  NSDate *v9;
  int v10;
  NSObject *v11;
  void *v12;
  CXCallEndedReason v13;
  uint8_t buf[4];
  CXProvider *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSDate *v19;
  __int16 v20;
  CXCallEndedReason v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = UUID;
  v9 = dateEnded;
  v10 = dyld_program_sdk_at_least();
  if (!v8 && v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:endedAtDate:reason:]", CFSTR("UUID"));
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[NSUUID UUIDString](v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v15 = self;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v9;
    v20 = 2048;
    v21 = endedReason;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Provider %@ was asked to report that call with UUID %@ ended at date %@ with reason %ld", buf, 0x2Au);

  }
  if ((unint64_t)(endedReason - 1) >= 5)
    v13 = -1;
  else
    v13 = endedReason;
  -[CXProvider reportCallWithUUID:endedAtDate:privateReason:](self, "reportCallWithUUID:endedAtDate:privateReason:", v8, v9, v13);

}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  CXProvider *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = dyld_program_sdk_at_least();
  if (!v8 && v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:endedAtDate:privateReason:]", CFSTR("UUID"));
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v14 = self;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v9;
    v19 = 2048;
    v20 = a5;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ ended at date %@ with private reason %ld", buf, 0x2Au);

  }
  -[CXProvider reportCallWithUUID:endedAtDate:privateReason:failureContext:](self, "reportCallWithUUID:endedAtDate:privateReason:failureContext:", v8, v9, a5, 0);

}

- (void)reportCallWithUUID:(id)a3 failedAtDate:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  CXProvider *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (dyld_program_sdk_at_least())
  {
    if (v8)
    {
      if (v10)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:failedAtDate:withContext:]", CFSTR("UUID"));
      if (v10)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:failedAtDate:withContext:]", CFSTR("failureContext"));
  }
LABEL_4:
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v14 = self;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ failed at date %@ with context %@", buf, 0x2Au);

  }
  -[CXProvider reportCallWithUUID:endedAtDate:privateReason:failureContext:](self, "reportCallWithUUID:endedAtDate:privateReason:failureContext:", v8, v9, 1, v10);

}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = dyld_program_sdk_at_least();
  if (!v10 && v13)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:endedAtDate:privateReason:failureContext:]", CFSTR("UUID"));
  -[CXProvider queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CXProvider_reportCallWithUUID_endedAtDate_privateReason_failureContext___block_invoke;
  block[3] = &unk_1E4B88E40;
  block[4] = self;
  v19 = v10;
  v21 = v12;
  v22 = a5;
  v20 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(v14, block);

}

void __74__CXProvider_reportCallWithUUID_endedAtDate_privateReason_failureContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138413314;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v7;
    v15 = 2048;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ ended at date %@ with private reason %ld and failure context %@", (uint8_t *)&v9, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportCallWithUUID:endedAtDate:privateReason:failureContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)reportAudioFinishedForCallWithUUID:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  v5 = dyld_program_sdk_at_least();
  if (!v4 && v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportAudioFinishedForCallWithUUID:]", CFSTR("UUID"));
  -[CXProvider queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CXProvider_reportAudioFinishedForCallWithUUID___block_invoke;
  block[3] = &unk_1E4B88A20;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

}

void __49__CXProvider_reportAudioFinishedForCallWithUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ finished audio", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportAudioFinishedForCallWithUUID:", *(_QWORD *)(a1 + 40));

}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = dyld_program_sdk_at_least();
  if (!v6 && v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportOutgoingCallWithUUID:sentInvitationAtDate:]", CFSTR("UUID"));
  -[CXProvider queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CXProvider_reportOutgoingCallWithUUID_sentInvitationAtDate___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __62__CXProvider_reportOutgoingCallWithUUID_sentInvitationAtDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that outgoing call with UUID %@ sent invitation at date %@", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportOutgoingCallWithUUID:sentInvitationAtDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = dyld_program_sdk_at_least();
  if (!v8 && v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:changedFrequencyData:forDirection:]", CFSTR("UUID"));
  -[CXProvider queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CXProvider_reportCallWithUUID_changedFrequencyData_forDirection___block_invoke;
  block[3] = &unk_1E4B89438;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a5;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, block);

}

void __67__CXProvider_reportCallWithUUID_changedFrequencyData_forDirection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportCallWithUUID:changedFrequencyData:forDirection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5
{
  id v8;
  int v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  int64_t v14;
  float v15;

  v8 = a3;
  v9 = dyld_program_sdk_at_least();
  if (!v8 && v9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:changedMeterLevel:forDirection:]", CFSTR("UUID"));
  -[CXProvider queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CXProvider_reportCallWithUUID_changedMeterLevel_forDirection___block_invoke;
  block[3] = &unk_1E4B89460;
  block[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = a5;
  v11 = v8;
  dispatch_async(v10, block);

}

void __64__CXProvider_reportCallWithUUID_changedMeterLevel_forDirection___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v3, "reportCallWithUUID:changedMeterLevel:forDirection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2);

}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  if (dyld_program_sdk_at_least())
  {
    if (v8)
    {
      if (v9)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:]", CFSTR("UUID"));
      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:]", CFSTR("crossDeviceIdentifier"));
  }
LABEL_4:
  -[CXProvider queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CXProvider_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed___block_invoke;
  block[3] = &unk_1E4B89438;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

}

void __78__CXProvider_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ and cross device identifier %@ changed bytes of data used %ld", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)reportOutgoingCallWithUUID:(NSUUID *)UUID startedConnectingAtDate:(NSDate *)dateStartedConnecting
{
  NSUUID *v6;
  NSDate *v7;
  int v8;
  NSObject *v9;
  NSDate *v10;
  NSUUID *v11;
  _QWORD block[5];
  NSUUID *v13;
  NSDate *v14;

  v6 = UUID;
  v7 = dateStartedConnecting;
  v8 = dyld_program_sdk_at_least();
  if (!v6 && v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportOutgoingCallWithUUID:startedConnectingAtDate:]", CFSTR("UUID"));
  -[CXProvider queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CXProvider_reportOutgoingCallWithUUID_startedConnectingAtDate___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __65__CXProvider_reportOutgoingCallWithUUID_startedConnectingAtDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that outgoing call with UUID %@ started connecting at date %@", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportOutgoingCallWithUUID:startedConnectingAtDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)reportOutgoingCallWithUUID:(NSUUID *)UUID connectedAtDate:(NSDate *)dateConnected
{
  NSUUID *v6;
  NSDate *v7;
  int v8;
  NSObject *v9;
  NSDate *v10;
  NSUUID *v11;
  _QWORD block[5];
  NSUUID *v13;
  NSDate *v14;

  v6 = UUID;
  v7 = dateConnected;
  v8 = dyld_program_sdk_at_least();
  if (!v6 && v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportOutgoingCallWithUUID:connectedAtDate:]", CFSTR("UUID"));
  -[CXProvider queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CXProvider_reportOutgoingCallWithUUID_connectedAtDate___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __57__CXProvider_reportOutgoingCallWithUUID_connectedAtDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that outgoing call with UUID %@ connected at date %@", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportOutgoingCallWithUUID:connectedAtDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CXProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CXProvider_reportNewOutgoingCallWithUUID_update___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __51__CXProvider_reportNewOutgoingCallWithUUID_update___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that outgoing call with UUID %@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportNewOutgoingCallWithUUID:update:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)requestTransaction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (dyld_program_sdk_at_least())
  {
    if (v6)
    {
      if (v7)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider requestTransaction:completion:]", CFSTR("transaction"));
      if (v7)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider requestTransaction:completion:]", CFSTR("completion"));
  }
LABEL_4:
  -[CXProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CXProvider_requestTransaction_completion___block_invoke;
  block[3] = &unk_1E4B88B58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __44__CXProvider_requestTransaction_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ requested transaction %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestTransaction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:receivedDTMFUpdate:]", CFSTR("UUID"));
    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProvider reportCallWithUUID:receivedDTMFUpdate:]", CFSTR("dtmfUpdate"));
    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[CXProvider queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CXProvider_reportCallWithUUID_receivedDTMFUpdate___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_async(v9, block);

}

void __52__CXProvider_reportCallWithUUID_receivedDTMFUpdate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified receivedDTMFUpdate %@ from call with UUID %@", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportCallWithUUID:receivedDTMFUpdate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (CXFeatures)featureFlags
{
  CXFeatures *featureFlags;
  CXFeatures *v4;
  CXFeatures *v5;

  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    v4 = objc_alloc_init(CXFeatures);
    v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }
  return featureFlags;
}

- (OS_dispatch_queue)queue
{
  void *v2;
  void *v3;

  -[CXProvider abstractProvider](self, "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (void)registerCurrentConfiguration
{
  NSObject *v3;
  _QWORD block[5];

  -[CXProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CXProvider_registerCurrentConfiguration__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __42__CXProvider_registerCurrentConfiguration__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  if (objc_msgSend(*(id *)(a1 + 32), "requiresProxyingAVAudioSessionState"))
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAudioSessionID:", objc_msgSend(v3, "opaqueSessionID"));

    objc_msgSend(*(id *)(a1 + 32), "featureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "callManagementMuteControl");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *MEMORY[0x1E0C89628];
      objc_msgSend(MEMORY[0x1E0C89A50], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v7, sel_handleMuteStatusChangedNotification_, v8, v9);

    }
  }
  CXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v2;
    _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "Registering configuration %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "callProviderHostDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v11, "registerWithConfiguration:", v12);

}

- (void)handleMuteStatusChangedNotification:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Handling notification %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)performCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CXProvider_performCompletionBlock___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __37__CXProvider_performCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *queue;

  objc_msgSend(*(id *)(a1 + 32), "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completionQueue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  queue = v5;

  dispatch_async(queue, *(dispatch_block_t *)(a1 + 40));
}

- (id)hostProtocolDelegate
{
  return 0;
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[CXProvider delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXProvider privateDelegate](self, "privateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performStartCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performStartCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
LABEL_103:
      _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Delegate does not respond to %@. Action will not be performed", (uint8_t *)&v18, 0xCu);

      goto LABEL_104;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performAnswerCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performAnswerCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
LABEL_104:

    goto LABEL_105;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performEndCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performEndCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performSetHeldCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetHeldCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performSetMutedCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetMutedCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performSetGroupCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetGroupCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performPlayDTMFCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performPlayDTMFCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSendMMIOrUSSDCodeAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSendMMIOrUSSDCodeAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performJoinCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performJoinCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSetTTYTypeCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetTTYTypeCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSetSendingVideoCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetSendingVideoCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSetRelayingCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetRelayingCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSetScreeningCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetScreeningCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSetAllowUplinkAudioInjectionAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetAllowUplinkAudioInjectionAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performPullCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performPullCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSetVideoPresentationSizeCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetVideoPresentationSizeCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSetVideoPresentationStateCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetVideoPresentationStateCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSetSharingScreenCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetSharingScreenCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performSetScreenShareAttributesCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetScreenShareAttributesCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "provider:performEnableVideoCallAction:", self, v9);
      goto LABEL_105;
    }
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performEnableVideoCallAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  CXDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CXProvider performAction:].cold.1((uint64_t)v4, v9, v12, v13, v14, v15, v16, v17);
LABEL_105:

}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  NSObject *v6;
  id v7;
  id v8;

  v6 = queue;
  v7 = delegate;
  -[CXProvider abstractProvider](self, "abstractProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:queue:", v7, v6);

}

- (NSArray)pendingTransactions
{
  void *v2;
  void *v3;

  -[CXProvider abstractProvider](self, "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pendingTransactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)invalidate
{
  id v2;

  -[CXProvider abstractProvider](self, "abstractProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)commitTransaction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXProvider abstractProvider](self, "abstractProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:commitTransaction:", self, v4);

}

- (void)handleActionTimeout:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXProvider abstractProvider](self, "abstractProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:handleTimeoutForAction:", self, v4);

}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CXProvider *v9;

  v4 = a3;
  -[CXProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CXProvider_handleAudioSessionActivationStateChangedTo___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performDelegateCallback:", v7);

}

void __57__CXProvider_handleAudioSessionActivationStateChangedTo___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  CXDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 67109120;
    v12 = v2;
    _os_log_impl(&dword_1A402D000, v3, OS_LOG_TYPE_DEFAULT, "Notified that audio session activation state changed to: %d", (uint8_t *)&v11, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      CXDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 67109120;
        v12 = 1;
        _os_log_impl(&dword_1A402D000, v7, OS_LOG_TYPE_DEFAULT, "Notifying delegate that audio session activation state changed to: %d", (uint8_t *)&v11, 8u);
      }

      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "provider:didActivateAudioSession:", *(_QWORD *)(a1 + 40), v4);
LABEL_12:

    }
  }
  else
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      CXDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 67109120;
        v12 = 0;
        _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "Notifying delegate that audio session activation state changed to: %d", (uint8_t *)&v11, 8u);
      }

      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "provider:didDeactivateAudioSession:", *(_QWORD *)(a1 + 40), v4);
      goto LABEL_12;
    }
  }

}

- (void)handleMediaServicesWereResetNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  -[CXProvider registerCurrentConfiguration](self, "registerCurrentConfiguration");
}

+ (void)reportNewIncomingVoIPPushPayload:(NSDictionary *)dictionaryPayload completion:(void *)completion
{
  void *v5;
  NSDictionary *v6;
  CXNotificationServiceExtensionVoIPXPCClient *v7;

  v5 = completion;
  v6 = dictionaryPayload;
  v7 = objc_alloc_init(CXNotificationServiceExtensionVoIPXPCClient);
  -[CXNotificationServiceExtensionVoIPXPCClient requestApplicationLaunchForIncomingCall:completion:](v7, "requestApplicationLaunchForIncomingCall:completion:", v6, v5);

}

- (CXAbstractProvider)abstractProvider
{
  return self->_abstractProvider;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_abstractProvider, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __36__CXProvider_initWithConfiguration___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Error resetting audio session interruption priority to Normal: %@", a5, a6, a7, a8, 2u);
}

- (void)performAction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Unknown action class in transaction: %@", a5, a6, a7, a8, 2u);
}

@end
