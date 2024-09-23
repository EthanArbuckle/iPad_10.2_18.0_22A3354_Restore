@implementation CXChannelProvider

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[CXChannelProvider allocWithZone:](CXXPCChannelProvider, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CXChannelProvider;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (CXChannelProvider)initWithConfiguration:(id)a3
{
  id v4;
  CXChannelProvider *v5;
  CXAbstractProvider *v6;
  CXAbstractProvider *abstractProvider;
  uint64_t v8;
  CXChannelProviderConfiguration *configuration;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CXChannelProvider;
  v5 = -[CXChannelProvider init](&v12, sel_init);
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelProvider initWithConfiguration:]", CFSTR("configuration"));
    v6 = objc_alloc_init(CXAbstractProvider);
    abstractProvider = v5->_abstractProvider;
    v5->_abstractProvider = v6;

    -[CXAbstractProvider setInternalActionDelegate:](v5->_abstractProvider, "setInternalActionDelegate:", v5);
    -[CXAbstractProvider setConnectionInterruptionHandler:](v5->_abstractProvider, "setConnectionInterruptionHandler:", &__block_literal_global_12);
    v8 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (CXChannelProviderConfiguration *)v8;

    if (-[CXChannelProvider requiresProxyingAVAudioSessionState](v5, "requiresProxyingAVAudioSessionState"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel_handleMediaServicesWereResetNotification_, *MEMORY[0x1E0C89738], 0);

    }
  }

  return v5;
}

void __43__CXChannelProvider_initWithConfiguration___block_invoke()
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

- (CXChannelProviderConfiguration)configuration
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CXChannelProvider_configuration__block_invoke;
  v7[3] = &unk_1E4B88C60;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (CXChannelProviderConfiguration *)v5;
}

void __34__CXChannelProvider_configuration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__CXChannelProvider_setConfiguration___block_invoke;
  v8[3] = &unk_1E4B88A20;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __38__CXChannelProvider_setConfiguration___block_invoke(uint64_t a1)
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

- (id)channelProviderHostDelegate
{
  void *v2;
  void *v3;
  id v4;

  -[CXChannelProvider hostProtocolDelegate](self, "hostProtocolDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE710010))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (CXChannelProviderDelegate)delegate
{
  void *v2;
  void *v3;
  void *v4;
  CXChannelProviderDelegate *v5;

  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE715FE8))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)reportChannelWithUUID:(id)a3 connectedAtDate:(id)a4
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
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelProvider reportChannelWithUUID:connectedAtDate:]", CFSTR("UUID"));
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CXChannelProvider_reportChannelWithUUID_connectedAtDate___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __59__CXChannelProvider_reportChannelWithUUID_connectedAtDate___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that channel with UUID %@ connected at date %@", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "channelProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportChannelWithUUID:connectedAtDate:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &__block_literal_global_117);

}

void __59__CXChannelProvider_reportChannelWithUUID_connectedAtDate___block_invoke_115(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    CXDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1A402D000, v3, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)reportChannelWithUUID:(id)a3 disconnectedAtDate:(id)a4 disconnectedReason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelProvider reportChannelWithUUID:disconnectedAtDate:disconnectedReason:]", CFSTR("UUID"));
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__CXChannelProvider_reportChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke;
  block[3] = &unk_1E4B89438;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a5;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, block);

}

void __81__CXChannelProvider_reportChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
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
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v11 = 138413058;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    v17 = 2048;
    v18 = v6;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that channel with UUID %@ disconnected at date %@ disconnectedReason: %ld", (uint8_t *)&v11, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "channelProviderHostDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportChannelWithUUID:disconnectedAtDate:disconnectedReason:completionHandler:", v8, v9, v10, &__block_literal_global_120);

}

void __81__CXChannelProvider_reportChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke_119(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    CXDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1A402D000, v3, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)reportChannelWithUUID:(id)a3 updated:(id)a4
{
  -[CXChannelProvider reportChannelWithUUID:updated:completionHandler:](self, "reportChannelWithUUID:updated:completionHandler:", a3, a4, 0);
}

- (void)reportChannelWithUUID:(id)a3 updated:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelProvider reportChannelWithUUID:updated:completionHandler:]", CFSTR("UUID"));
    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelProvider reportChannelWithUUID:updated:completionHandler:]", CFSTR("update"));
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke;
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

void __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that channel with UUID %@ updated with: %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "channelProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke_123;
  v10[3] = &unk_1E4B897F8;
  v9 = *(id *)(a1 + 56);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v9;
  objc_msgSend(v6, "reportChannelWithUUID:updated:completionHandler:", v7, v8, v10);

}

void __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "abstractProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke_124;
    v6[3] = &unk_1E4B89360;
    v8 = *(id *)(a1 + 40);
    v7 = v3;
    objc_msgSend(v5, "performDelegateCallback:", v6);

  }
}

uint64_t __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)reportIncomingTransmissionEndedForChannelWithUUID:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelProvider reportIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:]", CFSTR("UUID"));
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke;
  block[3] = &unk_1E4B89820;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, block);

}

void __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2048;
    v17 = v5;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ reports channel with UUID %@ ended an incoming transmission with reason %ld", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "channelProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_125;
  v10[3] = &unk_1E4B897F8;
  v9 = *(id *)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v9;
  objc_msgSend(v6, "reportIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:", v7, v8, v10);

}

void __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "abstractProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_126;
    v6[3] = &unk_1E4B89360;
    v8 = *(id *)(a1 + 40);
    v7 = v3;
    objc_msgSend(v5, "performDelegateCallback:", v6);

  }
}

uint64_t __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)reportIncomingTransmissionStartedForChannelWithUUID:(id)a3 update:(id)a4 shouldReplaceOutgoingTransmission:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelProvider reportIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:]", CFSTR("update"));
    if (v12)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelProvider reportIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:]", CFSTR("completionHandler"));
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelProvider reportIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:]", CFSTR("UUID"));
  if (!v11)
    goto LABEL_6;
LABEL_3:
  if (!v12)
    goto LABEL_7;
LABEL_4:
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke;
  block[3] = &unk_1E4B89848;
  block[4] = self;
  v19 = v10;
  v22 = a5;
  v20 = v11;
  v21 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(v14, block);

}

void __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
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
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ reports channel with UUID %@ started an incoming transmission with update %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "channelProviderHostDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_129;
  v11[3] = &unk_1E4B897F8;
  v10 = *(id *)(a1 + 56);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v10;
  objc_msgSend(v6, "reportIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:", v7, v8, v9, v11);

}

void __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "abstractProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_130;
    v6[3] = &unk_1E4B89360;
    v8 = *(id *)(a1 + 40);
    v7 = v3;
    objc_msgSend(v5, "performDelegateCallback:", v6);

  }
}

uint64_t __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_130(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
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

  -[CXChannelProvider registerCurrentConfiguration](self, "registerCurrentConfiguration");
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
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[CXChannelProvider delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performChannelJoinAction:", self, v8);
      goto LABEL_25;
    }
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performChannelJoinAction_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v10;
LABEL_23:
      _os_log_impl(&dword_1A402D000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Delegate does not respond to %@. Action will not be performed", (uint8_t *)&v17, 0xCu);

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performChannelLeaveAction:", self, v8);
      goto LABEL_25;
    }
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performChannelLeaveAction_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v10;
      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performChannelTransmitStartAction:", self, v8);
      goto LABEL_25;
    }
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performChannelTransmitStartAction_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v10;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performChannelTransmitStopAction:", self, v8);
      goto LABEL_25;
    }
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performChannelTransmitStopAction_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v10;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CXProvider performAction:].cold.1((uint64_t)v4, v8, v11, v12, v13, v14, v15, v16);
LABEL_25:

}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v6 = a4;
  v7 = a3;
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_syncSetDelegate:queue:", v7, v6);

  if (v7)
  {
    -[CXChannelProvider _ensureApplicationControllerConnection](self, "_ensureApplicationControllerConnection");
    -[CXChannelProvider voipApplicationControllerConnection](self, "voipApplicationControllerConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__CXChannelProvider_setDelegate_queue___block_invoke;
    v13[3] = &unk_1E4B89638;
    v13[4] = self;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __39__CXChannelProvider_setDelegate_queue___block_invoke_3;
    v12[3] = &unk_1E4B89898;
    v12[4] = self;
    objc_msgSend(v11, "pttCheckInWithReply:", v12);

  }
}

void __39__CXChannelProvider_setDelegate_queue___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__CXChannelProvider_setDelegate_queue___block_invoke_2;
  v3[3] = &unk_1E4B88AE8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "performDelegateCallback:", v3);

}

void __39__CXChannelProvider_setDelegate_queue___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider:didReceiveCheckInResult:channelUUID:", *(_QWORD *)(a1 + 32), 4, 0);

  }
}

void __39__CXChannelProvider_setDelegate_queue___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "abstractProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__CXChannelProvider_setDelegate_queue___block_invoke_4;
  v9[3] = &unk_1E4B89870;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = a2;
  v9[4] = v7;
  v8 = v5;
  objc_msgSend(v6, "performDelegateCallback:", v9);

}

void __39__CXChannelProvider_setDelegate_queue___block_invoke_4(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider:didReceiveCheckInResult:channelUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

- (NSArray)pendingTransactions
{
  void *v2;
  void *v3;

  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pendingTransactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)invalidate
{
  id v2;

  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)commitTransaction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:commitTransaction:", self, v4);

}

- (void)handleActionTimeout:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:handleTimeoutForAction:", self, v4);

}

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 0;
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CXChannelProvider *v9;

  v4 = a3;
  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CXChannelProvider_handleAudioSessionActivationStateChangedTo___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performDelegateCallback:", v7);

}

void __64__CXChannelProvider_handleAudioSessionActivationStateChangedTo___block_invoke(uint64_t a1)
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

- (void)registerCurrentConfiguration
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CXChannelProvider_registerCurrentConfiguration__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __49__CXChannelProvider_registerCurrentConfiguration__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  if (objc_msgSend(*(id *)(a1 + 32), "requiresProxyingAVAudioSessionState"))
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAudioSessionID:", objc_msgSend(v3, "opaqueSessionID"));

  }
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v2;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Registering configuration %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "channelProviderHostDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v5, "registerWithConfiguration:completionHandler:", v6, &__block_literal_global_144);

}

void __49__CXChannelProvider_registerCurrentConfiguration__block_invoke_143(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    CXDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412546;
      v6 = v2;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1A402D000, v3, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@, %@", (uint8_t *)&v5, 0x16u);

    }
  }

}

- (void)_ensureApplicationControllerConnection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[CXChannelProvider voipApplicationControllerConnection](self, "voipApplicationControllerConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.ptt"), 4096);
    objc_initWeak(&location, self);
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__CXChannelProvider__ensureApplicationControllerConnection__block_invoke;
    v10[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "setInterruptionHandler:", v10);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __59__CXChannelProvider__ensureApplicationControllerConnection__block_invoke_2;
    v8[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE716048);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v6);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70DA68);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v7);

    objc_msgSend(v4, "setExportedObject:", self);
    -[CXChannelProvider setVoipApplicationControllerConnection:](self, "setVoipApplicationControllerConnection:", v4);
    objc_msgSend(v4, "resume");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __59__CXChannelProvider__ensureApplicationControllerConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setVoipApplicationControllerConnection:", 0);
    WeakRetained = v2;
  }

}

void __59__CXChannelProvider__ensureApplicationControllerConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setVoipApplicationControllerConnection:", 0);
    WeakRetained = v2;
  }

}

- (void)requestChannelPushToken
{
  void *v3;
  id v4;

  -[CXChannelProvider delegate](self, "delegate");

  -[CXChannelProvider _ensureApplicationControllerConnection](self, "_ensureApplicationControllerConnection");
  -[CXChannelProvider voipApplicationControllerConnection](self, "voipApplicationControllerConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pttRegister");

}

- (void)unregisterChannelPushToken
{
  void *v3;
  id v4;

  -[CXChannelProvider _ensureApplicationControllerConnection](self, "_ensureApplicationControllerConnection");
  -[CXChannelProvider voipApplicationControllerConnection](self, "voipApplicationControllerConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pttUnregister");

}

- (void)_didReceivePushToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXChannelProvider delegate](self, "delegate");

  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CXChannelProvider__didReceivePushToken___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performDelegateCallback:", v7);

}

void __42__CXChannelProvider__didReceivePushToken___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider:didReceiveChannelPushToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_didReceivePushPayload:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXChannelProvider delegate](self, "delegate");

  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CXChannelProvider__didReceivePushPayload___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performDelegateCallback:", v7);

}

void __44__CXChannelProvider__didReceivePushPayload___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider:didReceivePushPayload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_didReceivePushPayload:(id)a3 channelUUID:(id)a4 reply:(id)a5 isServiceUpdateMessage:(BOOL)a6 isHighPriority:(BOOL)a7 remainingHighPriorityBudget:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  BOOL v26;
  BOOL v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  -[CXChannelProvider delegate](self, "delegate");

  -[CXChannelProvider abstractProvider](self, "abstractProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __128__CXChannelProvider__didReceivePushPayload_channelUUID_reply_isServiceUpdateMessage_isHighPriority_remainingHighPriorityBudget___block_invoke;
  v21[3] = &unk_1E4B898E0;
  v21[4] = self;
  v22 = v14;
  v23 = v15;
  v24 = v16;
  v26 = a6;
  v27 = a7;
  v25 = a8;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  objc_msgSend(v17, "performDelegateCallback:", v21);

}

void __128__CXChannelProvider__didReceivePushPayload_channelUUID_reply_isServiceUpdateMessage_isHighPriority_remainingHighPriorityBudget___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider:didReceivePushPayload:channelUUID:reply:isServiceUpdateMessage:isHighPriority:remainingHighPriorityBudget:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 64));

  }
}

- (CXAbstractProvider)abstractProvider
{
  return self->_abstractProvider;
}

- (NSXPCConnection)voipApplicationControllerConnection
{
  return self->_voipApplicationControllerConnection;
}

- (void)setVoipApplicationControllerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_voipApplicationControllerConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voipApplicationControllerConnection, 0);
  objc_storeStrong((id *)&self->_abstractProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
