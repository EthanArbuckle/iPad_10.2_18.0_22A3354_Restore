@implementation PTChannelManager

- (id)_initWithEventDelegate:(id)a3 restorationDelegate:(id)a4 instantiationCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PTChannelManager;
  v11 = -[PTChannelManager init](&v25, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v11 + 9);
    *((_QWORD *)v11 + 9) = v12;

    v14 = MEMORY[0x22E2E7358](v10);
    v15 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v11 + 8) = v14;

    v16 = objc_alloc_init(MEMORY[0x24BDB7888]);
    v17 = (void *)*((_QWORD *)v11 + 4);
    *((_QWORD *)v11 + 4) = v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.PTChannelManager.callbackqueue", v18);
    v20 = (void *)*((_QWORD *)v11 + 7);
    *((_QWORD *)v11 + 7) = v19;

    v21 = objc_alloc_init(MEMORY[0x24BDB78C0]);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDB78B8]), "initWithConfiguration:", v21);
    v23 = (void *)*((_QWORD *)v11 + 3);
    *((_QWORD *)v11 + 3) = v22;

    objc_storeWeak((id *)v11 + 6, v8);
    objc_storeWeak((id *)v11 + 5, v9);
    objc_msgSend(*((id *)v11 + 3), "setDelegate:queue:", v11, *((_QWORD *)v11 + 7));
    *(_WORD *)(v11 + 9) = 0;

  }
  return v11;
}

+ (void)channelManagerWithDelegate:(id)delegate restorationDelegate:(id)restorationDelegate completionHandler:(void *)completionHandler
{
  id v7;
  id v8;
  void (**v9)(void *, _QWORD, void *);
  void *v10;
  NSObject *v11;
  void (**v12)(void *, _QWORD, void *);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  id v19;
  id v20;
  id v21;
  uint8_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  char v26;

  v7 = delegate;
  v8 = restorationDelegate;
  v9 = completionHandler;
  _pttCheckIfErrorPreventingInstantiationExists();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v9[2](v9, 0, v10);
  }
  else
  {
    PTDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AD0F000, v11, OS_LOG_TYPE_DEFAULT, "PTT requested channel manager instance", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x2020000000;
    v26 = 0;
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __85__PTChannelManager_channelManagerWithDelegate_restorationDelegate_completionHandler___block_invoke;
    v18 = &unk_24F4F99B0;
    v19 = v7;
    v20 = v8;
    v12 = v9;
    v21 = v12;
    v22 = buf;
    if (channelManagerWithDelegate_restorationDelegate_completionHandler__onceToken != -1)
      dispatch_once(&channelManagerWithDelegate_restorationDelegate_completionHandler__onceToken, &v15);
    objc_msgSend((id)channelManagerWithDelegate_restorationDelegate_completionHandler__sharedInstance, "instantiationCompletionBlock", v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (!v24[24])
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.pushtotalk.instantiation"), 5, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, 0, v14);

      }
    }
    else
    {
      v12[2](v12, channelManagerWithDelegate_restorationDelegate_completionHandler__sharedInstance, 0);
    }

    _Block_object_dispose(buf, 8);
  }

}

void __85__PTChannelManager_channelManagerWithDelegate_restorationDelegate_completionHandler___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;

  v2 = -[PTChannelManager _initWithEventDelegate:restorationDelegate:instantiationCompletion:]([PTChannelManager alloc], "_initWithEventDelegate:restorationDelegate:instantiationCompletion:", a1[4], a1[5], a1[6]);
  v3 = (void *)channelManagerWithDelegate_restorationDelegate_completionHandler__sharedInstance;
  channelManagerWithDelegate_restorationDelegate_completionHandler__sharedInstance = (uint64_t)v2;

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
}

- (void)requestBeginTransmittingWithChannelUUID:(NSUUID *)channelUUID
{
  NSUUID *v4;
  void *v5;
  CXCallController *callController;
  NSUUID *v7;
  _QWORD v8[5];
  NSUUID *v9;

  v4 = channelUUID;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB78C8]), "initWithChannelUUID:", v4);
  objc_msgSend(v5, "setOriginator:", 2);
  callController = self->_callController;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke;
  v8[3] = &unk_24F4F9A00;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[CXCallController requestTransactionWithAction:completion:](callController, "requestTransactionWithAction:completion:", v5, v8);

}

void __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  _pttAttemptTranslateErrorFromCXError(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke_2;
  block[3] = &unk_24F4F99D8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint8_t v14[16];

  v2 = a1 + 32;
  v3 = *(_QWORD *)(a1 + 32);
  PTDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_22AD0F000, v5, OS_LOG_TYPE_DEFAULT, "PTT transmission start request completed successfully, will be fulfilled soon", v14, 2u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke_2_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(*(id *)(a1 + 40), "channelEventDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "channelEventDelegate");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject channelManager:failedToBeginTransmittingInChannelWithUUID:error:](v5, "channelManager:failedToBeginTransmittingInChannelWithUUID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
LABEL_8:

  }
}

- (void)stopTransmittingWithChannelUUID:(NSUUID *)channelUUID
{
  NSUUID *v4;
  NSUUID *waitingForPushResultChannelUUID;
  NSObject *v6;
  void *v7;
  CXCallController *callController;
  _QWORD v9[5];
  NSUUID *v10;
  uint8_t buf[16];

  v4 = channelUUID;
  if (self->_isWaitingForPushResult
    && (waitingForPushResultChannelUUID = self->_waitingForPushResultChannelUUID) != 0
    && -[NSUUID isEqual:](waitingForPushResultChannelUUID, "isEqual:", v4))
  {
    PTDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AD0F000, v6, OS_LOG_TYPE_DEFAULT, "Stop Transmit requested while waiting for a PTPushResult. The Stop Transmit action will be fulfilled after the PTPushResult is processed.", buf, 2u);
    }

    self->_stopTransmitRequestedWhileWaitingForPushResult = 1;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB78D0]), "initWithChannelUUID:", v4);
    objc_msgSend(v7, "setOriginator:", 2);
    callController = self->_callController;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke;
    v9[3] = &unk_24F4F9A00;
    v9[4] = self;
    v10 = v4;
    -[CXCallController requestTransactionWithAction:completion:](callController, "requestTransactionWithAction:completion:", v7, v9);

  }
}

void __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  _pttAttemptTranslateErrorFromCXError(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke_2;
  block[3] = &unk_24F4F99D8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint8_t v14[16];

  v2 = a1 + 32;
  v3 = *(_QWORD *)(a1 + 32);
  PTDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_22AD0F000, v5, OS_LOG_TYPE_DEFAULT, "PTT transmission stop request completed successfully, will be fulfilled soon", v14, 2u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke_2_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(*(id *)(a1 + 40), "channelEventDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "channelEventDelegate");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject channelManager:failedToStopTransmittingInChannelWithUUID:error:](v5, "channelManager:failedToStopTransmittingInChannelWithUUID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
LABEL_8:

  }
}

- (void)requestJoinChannelWithUUID:(NSUUID *)channelUUID descriptor:(PTChannelDescriptor *)descriptor
{
  NSUUID *v6;
  NSUUID *v7;
  _QWORD v8[5];
  NSUUID *v9;

  v6 = channelUUID;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__PTChannelManager_requestJoinChannelWithUUID_descriptor___block_invoke;
  v8[3] = &unk_24F4F9A00;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PTChannelManager _requestJoinChannelWithUUID:channelDescriptor:originator:completion:](self, "_requestJoinChannelWithUUID:channelDescriptor:originator:completion:", v7, descriptor, 2, v8);

}

void __58__PTChannelManager_requestJoinChannelWithUUID_descriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "channelEventDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    v3 = v7;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "channelEventDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "channelManager:failedToJoinChannelWithUUID:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v7);

      v3 = v7;
    }
  }

}

- (void)_requestJoinChannelWithUUID:(id)a3 channelDescriptor:(id)a4 originator:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CXCallController *callController;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PTChannelManager underlyingProvider](self, "underlyingProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestChannelPushToken");

  v14 = objc_alloc(MEMORY[0x24BDB78A8]);
  objc_msgSend(v11, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithChannelUUID:name:", v10, v15);

  objc_msgSend(v11, "imageFileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImageURL:", v17);

  objc_msgSend(v16, "setOriginator:", a5);
  objc_initWeak(&location, self);
  callController = self->_callController;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke;
  v20[3] = &unk_24F4F9A50;
  objc_copyWeak(&v22, &location);
  v20[4] = self;
  v19 = v12;
  v21 = v19;
  -[CXCallController requestTransactionWithAction:completion:](callController, "requestTransactionWithAction:completion:", v16, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke(id *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];

  _pttAttemptTranslateErrorFromCXError(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PTDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "setSuppressRejoinForRecentlyDisconnectedChannelUUID:", 0);

    PTDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AD0F000, v4, OS_LOG_TYPE_DEFAULT, "PTT join request completed successfully, should be fulfilled soon", buf, 2u);
    }
  }

  objc_msgSend(a1[4], "callbackQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke_61;
  v15[3] = &unk_24F4F9A28;
  v13 = a1[5];
  v16 = v3;
  v17 = v13;
  v14 = v3;
  dispatch_async(v12, v15);

}

uint64_t __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)leaveChannelWithUUID:(NSUUID *)channelUUID
{
  NSUUID *v4;
  void *v5;
  CXCallController *callController;
  NSUUID *v7;
  _QWORD v8[5];
  NSUUID *v9;

  v4 = channelUUID;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB78B0]), "initWithChannelUUID:", v4);
  objc_msgSend(v5, "setOriginator:", 2);
  callController = self->_callController;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__PTChannelManager_leaveChannelWithUUID___block_invoke;
  v8[3] = &unk_24F4F9A00;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[CXCallController requestTransactionWithAction:completion:](callController, "requestTransactionWithAction:completion:", v5, v8);

}

void __41__PTChannelManager_leaveChannelWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[16];

  _pttAttemptTranslateErrorFromCXError(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PTDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __41__PTChannelManager_leaveChannelWithUUID___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__PTChannelManager_leaveChannelWithUUID___block_invoke_63;
    block[3] = &unk_24F4F99D8;
    v13 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v13;
    v16 = v3;
    dispatch_async(v12, block);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AD0F000, v5, OS_LOG_TYPE_DEFAULT, "PTT leave request completed successfully, should be fulfilled soon", buf, 2u);
    }

  }
}

void __41__PTChannelManager_leaveChannelWithUUID___block_invoke_63(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "channelEventDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "channelEventDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "channelManager:failedToLeaveChannelWithUUID:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)setActiveRemoteParticipant:(PTParticipant *)participant forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
  -[PTChannelManager _setActiveRemoteParticipant:forChannelUUID:shouldReplaceOutgoingTransmission:completionHandler:](self, "_setActiveRemoteParticipant:forChannelUUID:shouldReplaceOutgoingTransmission:completionHandler:", participant, channelUUID, 0, completionHandler);
}

- (void)_setActiveRemoteParticipant:(id)a3 forChannelUUID:(id)a4 shouldReplaceOutgoingTransmission:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v6 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BDB78D8];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  objc_msgSend(v13, "underlyingParticipant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setActiveRemoteParticipant:", v15);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __115__PTChannelManager__setActiveRemoteParticipant_forChannelUUID_shouldReplaceOutgoingTransmission_completionHandler___block_invoke;
  v20[3] = &unk_24F4F9A78;
  v21 = v10;
  v16 = v10;
  v17 = (void *)MEMORY[0x22E2E7358](v20);
  -[PTChannelManager underlyingProvider](self, "underlyingProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v13)
    objc_msgSend(v18, "reportIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:", v12, v14, v6, v17);
  else
    objc_msgSend(v18, "reportIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:", v12, 0, v17);

}

void __115__PTChannelManager__setActiveRemoteParticipant_forChannelUUID_shouldReplaceOutgoingTransmission_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  _pttAttemptTranslateErrorFromCXError(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setChannelDescriptor:(PTChannelDescriptor *)channelDescriptor forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
  void *v8;
  objc_class *v9;
  NSUUID *v10;
  PTChannelDescriptor *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = completionHandler;
  v9 = (objc_class *)MEMORY[0x24BDB78D8];
  v10 = channelUUID;
  v11 = channelDescriptor;
  v12 = objc_alloc_init(v9);
  -[PTChannelDescriptor name](v11, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v13);

  -[PTChannelDescriptor imageFileURL](v11, "imageFileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setImageURL:", v14);
  -[PTChannelManager underlyingProvider](self, "underlyingProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __74__PTChannelManager_setChannelDescriptor_forChannelUUID_completionHandler___block_invoke;
  v17[3] = &unk_24F4F9A78;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "reportChannelWithUUID:updated:completionHandler:", v10, v12, v17);

}

void __74__PTChannelManager_setChannelDescriptor_forChannelUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  _pttAttemptTranslateErrorFromCXError(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setServiceStatus:(PTServiceStatus)status forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
  void *v8;
  objc_class *v9;
  NSUUID *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = completionHandler;
  v9 = (objc_class *)MEMORY[0x24BDB78D8];
  v10 = channelUUID;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setServiceStatus:", status);
  -[PTChannelManager underlyingProvider](self, "underlyingProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__PTChannelManager_setServiceStatus_forChannelUUID_completionHandler___block_invoke;
  v14[3] = &unk_24F4F9A78;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "reportChannelWithUUID:updated:completionHandler:", v10, v11, v14);

}

void __70__PTChannelManager_setServiceStatus_forChannelUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  _pttAttemptTranslateErrorFromCXError(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setTransmissionMode:(PTTransmissionMode)transmissionMode forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
  void *v8;
  objc_class *v9;
  NSUUID *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = completionHandler;
  v9 = (objc_class *)MEMORY[0x24BDB78D8];
  v10 = channelUUID;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setTransmissionMode:", transmissionMode);
  -[PTChannelManager underlyingProvider](self, "underlyingProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__PTChannelManager_setTransmissionMode_forChannelUUID_completionHandler___block_invoke;
  v14[3] = &unk_24F4F9A78;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "reportChannelWithUUID:updated:completionHandler:", v10, v11, v14);

}

void __73__PTChannelManager_setTransmissionMode_forChannelUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  _pttAttemptTranslateErrorFromCXError(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setAccessoryButtonEventsEnabled:(BOOL)enabled forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
  _BOOL8 v6;
  void *v8;
  objc_class *v9;
  NSUUID *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = enabled;
  v8 = completionHandler;
  v9 = (objc_class *)MEMORY[0x24BDB78D8];
  v10 = channelUUID;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setAccessoryButtonEventsEnabled:", v6);
  -[PTChannelManager underlyingProvider](self, "underlyingProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__PTChannelManager_setAccessoryButtonEventsEnabled_forChannelUUID_completionHandler___block_invoke;
  v14[3] = &unk_24F4F9A78;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "reportChannelWithUUID:updated:completionHandler:", v10, v11, v14);

}

void __85__PTChannelManager_setAccessoryButtonEventsEnabled_forChannelUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  _pttAttemptTranslateErrorFromCXError(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)unregisterChannelPushToken
{
  OUTLINED_FUNCTION_2(&dword_22AD0F000, a1, a3, "PTT app requested push token invalidation", a5, a6, a7, a8, 0);
}

- (void)providerDidBegin:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  PTDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22AD0F000, v3, OS_LOG_TYPE_DEFAULT, "PTT channel manager's provider did begin", v4, 2u);
  }

}

- (void)providerDidReset:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUUID *activeChannelUUID;
  id v15;
  CXChannelProvider *v16;
  CXChannelProvider *underlyingProvider;
  CXCallController *v18;
  CXCallController *callController;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  -[PTChannelManager underlyingProvider](self, "underlyingProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:queue:", 0, 0);

  -[PTChannelManager underlyingProvider](self, "underlyingProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  PTDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[PTChannelManager providerDidReset:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  activeChannelUUID = self->_activeChannelUUID;
  self->_activeChannelUUID = 0;

  v15 = objc_alloc_init(MEMORY[0x24BDB78C0]);
  v16 = (CXChannelProvider *)objc_msgSend(objc_alloc(MEMORY[0x24BDB78B8]), "initWithConfiguration:", v15);
  underlyingProvider = self->_underlyingProvider;
  self->_underlyingProvider = v16;

  v18 = (CXCallController *)objc_alloc_init(MEMORY[0x24BDB7888]);
  callController = self->_callController;
  self->_callController = v18;

  -[CXChannelProvider setDelegate:queue:](self->_underlyingProvider, "setDelegate:queue:", self, self->_callbackQueue);
}

- (void)_appendPendingPushForUUID:(id)a3 payload:(id)a4 reply:(id)a5 isServiceUpdateMessage:(BOOL)a6 isHighPriority:(BOOL)a7 remainingHighPriorityBudget:(int64_t)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  PTPendingPush *v18;

  v9 = a7;
  v10 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v18 = objc_alloc_init(PTPendingPush);
  -[PTPendingPush setUuid:](v18, "setUuid:", v16);

  -[PTPendingPush setPayload:](v18, "setPayload:", v15);
  -[PTPendingPush setReply:](v18, "setReply:", v14);

  -[PTPendingPush setIsServiceUpdateMessage:](v18, "setIsServiceUpdateMessage:", v10);
  -[PTPendingPush setIsHighPriority:](v18, "setIsHighPriority:", v9);
  -[PTPendingPush setRemainingHighPriorityBudget:](v18, "setRemainingHighPriorityBudget:", a8);
  -[PTChannelManager pendingPushes](self, "pendingPushes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

}

- (void)provider:(id)a3 didReceivePushPayload:(id)a4 channelUUID:(id)a5 reply:(id)a6 isServiceUpdateMessage:(BOOL)a7 isHighPriority:(BOOL)a8 remainingHighPriorityBudget:(int64_t)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  NSObject *callbackQueue;
  id v16;
  id v17;

  v9 = a8;
  v10 = a7;
  v17 = a4;
  v14 = a5;
  callbackQueue = self->_callbackQueue;
  v16 = a6;
  dispatch_assert_queue_V2(callbackQueue);
  -[PTChannelManager _appendPendingPushForUUID:payload:reply:isServiceUpdateMessage:isHighPriority:remainingHighPriorityBudget:](self, "_appendPendingPushForUUID:payload:reply:isServiceUpdateMessage:isHighPriority:remainingHighPriorityBudget:", v14, v17, v16, v10, v9, a9);

  if (self->_activeChannelUUID)
    -[PTChannelManager _deliverPendingPushes](self, "_deliverPendingPushes");
  else
    -[PTChannelManager _performChannelRestorationAndUpdateChannelDescriptor:pushPayload:](self, "_performChannelRestorationAndUpdateChannelDescriptor:pushPayload:", v14, v17);

}

- (void)_performChannelRestorationAndUpdateChannelDescriptor:(id)a3 pushPayload:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (!self->_attemptingChannelRestoration)
  {
    if (-[NSUUID isEqual:](self->_suppressRejoinForRecentlyDisconnectedChannelUUID, "isEqual:", v6))
    {
      PTDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v6;
        _os_log_impl(&dword_22AD0F000, v8, OS_LOG_TYPE_DEFAULT, "PTChannelManager skipping channel restoration for channel that was just torn down %@", buf, 0xCu);
      }
    }
    else
    {
      self->_attemptingChannelRestoration = 1;
      -[PTChannelManager underlyingProvider](self, "underlyingProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestChannelPushToken");

      PTDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v6;
        _os_log_impl(&dword_22AD0F000, v10, OS_LOG_TYPE_DEFAULT, "PTChannelManager asking channel restoration delegate for descriptor for %{public}@", buf, 0xCu);
      }

      -[PTChannelManager channelRestorationDelegate](self, "channelRestorationDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "channelDescriptorForRestoredChannelUUID:", v6);
      v8 = objc_claimAutoreleasedReturnValue();

      if (!v8)
        -[PTChannelManager _performChannelRestorationAndUpdateChannelDescriptor:pushPayload:].cold.1();
      objc_initWeak((id *)buf, self);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __85__PTChannelManager__performChannelRestorationAndUpdateChannelDescriptor_pushPayload___block_invoke;
      v12[3] = &unk_24F4F9AA0;
      objc_copyWeak(&v14, (id *)buf);
      v13 = v6;
      -[PTChannelManager setChannelDescriptor:forChannelUUID:completionHandler:](self, "setChannelDescriptor:forChannelUUID:completionHandler:", v8, v13, v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __85__PTChannelManager__performChannelRestorationAndUpdateChannelDescriptor_pushPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    PTDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __85__PTChannelManager__performChannelRestorationAndUpdateChannelDescriptor_pushPayload___block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(v5, "_deliverChannelManagerInstanceToClientIfNeeded");
  }
  else
  {
    objc_msgSend(WeakRetained, "_ensureDelegateIsReadyToReceiveActions:joinReason:", *(_QWORD *)(a1 + 32), 1);
    PTDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_22AD0F000, v13, OS_LOG_TYPE_DEFAULT, "PTChannelManager rejoin channel descriptor flush succeeded", v14, 2u);
    }

  }
  objc_msgSend(v5, "setAttemptingChannelRestoration:", 0);

}

- (void)_handleLeaveCheckinResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  PTDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl(&dword_22AD0F000, v5, OS_LOG_TYPE_DEFAULT, "PTChannelManager leaving channel with UUID %{public}@", buf, 0xCu);
  }

  -[PTChannelManager underlyingProvider](self, "underlyingProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportChannelWithUUID:disconnectedAtDate:disconnectedReason:", v4, v7, 0);

  -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "channelManager:didLeaveChannelWithUUID:reason:", self, v4, 1);

  -[PTChannelManager _deliverChannelManagerInstanceToClientIfNeeded](self, "_deliverChannelManagerInstanceToClientIfNeeded");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PTChannelManager pendingPushes](self, "pendingPushes", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "reply");
        v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v14[2](v14, 1, 0);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[PTChannelManager pendingPushes](self, "pendingPushes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

}

- (void)provider:(id)a3 didReceiveCheckInResult:(int64_t)a4 channelUUID:(id)a5
{
  id v7;
  NSObject *v8;
  int v9;
  int64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  PTDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = a4;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_22AD0F000, v8, OS_LOG_TYPE_DEFAULT, "PTChannelManager checked in with result %ld uuid:%{public}@", (uint8_t *)&v9, 0x16u);
  }

  switch(a4)
  {
    case 0:
    case 4:
      -[PTChannelManager _deliverChannelManagerInstanceToClientIfNeeded](self, "_deliverChannelManagerInstanceToClientIfNeeded");
      break;
    case 2:
      -[PTChannelManager _handleLeaveCheckinResult:](self, "_handleLeaveCheckinResult:", v7);
      break;
    case 3:
      -[PTChannelManager _performChannelRestorationAndUpdateChannelDescriptor:pushPayload:](self, "_performChannelRestorationAndUpdateChannelDescriptor:pushPayload:", v7, 0);
      break;
    default:
      break;
  }

}

- (void)_deliverChannelManagerInstanceToClientIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *callbackQueue;
  id instantiationCompletionBlock;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  PTDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AD0F000, v3, OS_LOG_TYPE_DEFAULT, "PTChannelManager instantiation completed", buf, 2u);
  }

  -[PTChannelManager instantiationCompletionBlock](self, "instantiationCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__PTChannelManager__deliverChannelManagerInstanceToClientIfNeeded__block_invoke;
    v8[3] = &unk_24F4F9A28;
    v8[4] = self;
    v9 = v4;
    dispatch_async(callbackQueue, v8);

  }
  instantiationCompletionBlock = self->_instantiationCompletionBlock;
  self->_instantiationCompletionBlock = 0;

}

uint64_t __66__PTChannelManager__deliverChannelManagerInstanceToClientIfNeeded__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)_deliverPendingPushes
{
  NSUUID *activeChannelUUID;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSUUID *waitingForPushResultChannelUUID;
  SEL v29;
  uint64_t v30;
  NSUUID *v31;
  uint8_t buf[16];
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v29 = a2;
  v39 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  activeChannelUUID = self->_activeChannelUUID;
  v31 = activeChannelUUID;
  objc_storeStrong((id *)&self->_waitingForPushResultChannelUUID, activeChannelUUID);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PTChannelManager pendingPushes](self, "pendingPushes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v35;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      v10 = 0;
      v30 = v6;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
        if (v7)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v10), "reply");
          v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v7 = 1;
          v12[2](v12, 1, 0);

        }
        else if (objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v10), "isServiceUpdateMessage"))
        {
          v33[0] = v9;
          v33[1] = 3221225472;
          v33[2] = __41__PTChannelManager__deliverPendingPushes__block_invoke;
          v33[3] = &unk_24F4F9AC8;
          v33[4] = self;
          v33[5] = v11;
          v13 = (void *)MEMORY[0x22E2E7358](v33);
          -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_respondsToSelector();

          if ((v15 & 1) != 0)
          {
            -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "payload");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v8;
            v19 = v4;
            v20 = v9;
            v21 = objc_msgSend(v11, "isHighPriority");
            v22 = objc_msgSend(v11, "remainingHighPriorityBudget");
            v23 = v21;
            v9 = v20;
            v4 = v19;
            v8 = v18;
            v6 = v30;
            -[NSObject incomingServiceUpdatePushForChannelManager:channelUUID:pushPayload:isHighPriority:remainingHighPriorityBudget:withCompletionHandler:](v16, "incomingServiceUpdatePushForChannelManager:channelUUID:pushPayload:isHighPriority:remainingHighPriorityBudget:withCompletionHandler:", self, v31, v17, v23, v22, v13);

          }
          else
          {
            PTDefaultLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22AD0F000, v16, OS_LOG_TYPE_DEFAULT, "PTChannelManager received a Service Update push message but the PTChannelManagerDelegate has not implemented the delegate protocol required to receive Service Update messages.", buf, 2u);
            }
          }

          v7 = 0;
        }
        else
        {
          self->_isWaitingForPushResult = 1;
          -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "payload");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "incomingPushResultForChannelManager:channelUUID:pushPayload:", self, v31, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          self->_isWaitingForPushResult = 0;
          if ((objc_msgSend(v26, "isMemberOfClass:", objc_opt_class()) & 1) == 0
            && (objc_msgSend(v26, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v29, self, CFSTR("PTChannelManager.m"), 501, CFSTR("You must return a valid object of type PTPushDecision"));

          }
          v7 = objc_msgSend(v26, "type", v29) != 2;
          -[PTChannelManager _handlePushResult:pendingPush:](self, "_handlePushResult:pendingPush:", v26, v11);

        }
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v6);
  }

  waitingForPushResultChannelUUID = self->_waitingForPushResultChannelUUID;
  self->_waitingForPushResultChannelUUID = 0;

  -[NSMutableArray removeAllObjects](self->_pendingPushes, "removeAllObjects");
}

void __41__PTChannelManager__deliverPendingPushes__block_invoke(uint64_t a1)
{
  id v2;

  +[PTPushResult serviceUpdatePushResult](PTPushResult, "serviceUpdatePushResult");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_handlePushResult:pendingPush:", v2, *(_QWORD *)(a1 + 40));

}

- (void)_handlePushResult:(id)a3 pendingPush:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void (**v12)(void);
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  switch(objc_msgSend(v14, "type"))
  {
    case 0:
    case 1:
    case 3:
    case 4:
      objc_msgSend(v6, "reply");
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v12[2]();

      break;
    case 2:
      objc_msgSend(v14, "participant");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTChannelManager _setActiveRemoteParticipant:forChannelUUID:shouldReplaceOutgoingTransmission:completionHandler:](self, "_setActiveRemoteParticipant:forChannelUUID:shouldReplaceOutgoingTransmission:completionHandler:", v7, v8, self->_stopTransmitRequestedWhileWaitingForPushResult, &__block_literal_global_0);

      objc_msgSend(v6, "reply");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "participant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "underlyingParticipant");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v9)[2](v9, 2, v11);

      self->_stopTransmitRequestedWhileWaitingForPushResult = 0;
      break;
    default:
      break;
  }
  if (self->_stopTransmitRequestedWhileWaitingForPushResult)
  {
    objc_msgSend(v6, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTChannelManager stopTransmittingWithChannelUUID:](self, "stopTransmittingWithChannelUUID:", v13);

    self->_stopTransmitRequestedWhileWaitingForPushResult = 0;
  }

}

void __50__PTChannelManager__handlePushResult_pendingPush___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PTDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22AD0F000, v0, OS_LOG_TYPE_DEFAULT, "PTChannelManager setting a remote participant in response to a push ", v1, 2u);
  }

}

- (void)provider:(id)a3 didReceiveChannelPushToken:(id)a4
{
  NSObject *callbackQueue;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  callbackQueue = self->_callbackQueue;
  v6 = a4;
  dispatch_assert_queue_V2(callbackQueue);
  PTDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22AD0F000, v7, OS_LOG_TYPE_DEFAULT, "PTChannelManager did receive channel push token", v9, 2u);
  }

  -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "channelManager:receivedEphemeralPushToken:", self, v6);

}

- (void)provider:(id)a3 performChannelJoinAction:(id)a4
{
  NSObject *callbackQueue;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  void *v9;
  uint8_t v10[16];

  callbackQueue = self->_callbackQueue;
  v6 = a4;
  dispatch_assert_queue_V2(callbackQueue);
  PTDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22AD0F000, v7, OS_LOG_TYPE_DEFAULT, "PTChannelManager did join", v10, 2u);
  }

  objc_msgSend(v6, "fulfill");
  v8 = PTChannelJoinReasonForCXActionOriginator(objc_msgSend(v6, "originator"));
  objc_msgSend(v6, "channelUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PTChannelManager _ensureDelegateIsReadyToReceiveActions:joinReason:](self, "_ensureDelegateIsReadyToReceiveActions:joinReason:", v9, v8);
}

- (void)provider:(id)a3 performChannelLeaveAction:(id)a4
{
  id v5;
  NSUUID *v6;
  NSUUID *suppressRejoinForRecentlyDisconnectedChannelUUID;
  NSUUID *activeChannelUUID;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  objc_msgSend(v5, "fulfill");
  objc_msgSend(v5, "channelUUID");
  v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  suppressRejoinForRecentlyDisconnectedChannelUUID = self->_suppressRejoinForRecentlyDisconnectedChannelUUID;
  self->_suppressRejoinForRecentlyDisconnectedChannelUUID = v6;

  activeChannelUUID = self->_activeChannelUUID;
  self->_activeChannelUUID = 0;

  PTDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_22AD0F000, v9, OS_LOG_TYPE_DEFAULT, "PTChannelManager did leave", v13, 2u);
  }

  v10 = PTChannelLeaveReasonForCXActionOriginator(objc_msgSend(v5, "originator"));
  -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "channelUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "channelManager:didLeaveChannelWithUUID:reason:", self, v12, v10);

  -[PTChannelManager _deliverChannelManagerInstanceToClientIfNeeded](self, "_deliverChannelManagerInstanceToClientIfNeeded");
  -[NSMutableArray removeAllObjects](self->_pendingPushes, "removeAllObjects");

}

- (void)provider:(id)a3 performChannelTransmitStartAction:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  objc_msgSend(v5, "channelUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTChannelManager _ensureDelegateIsReadyToReceiveActions:joinReason:](self, "_ensureDelegateIsReadyToReceiveActions:joinReason:", v6, 1);

  objc_msgSend(v5, "fulfill");
  PTDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22AD0F000, v7, OS_LOG_TYPE_DEFAULT, "PTChannelManager did start transmitting", v11, 2u);
  }

  v8 = PTChannelTransmitRequestSourceForCXActionOriginator(objc_msgSend(v5, "originator"));
  -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "channelUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "channelManager:channelUUID:didBeginTransmittingFromSource:", self, v10, v8);

}

- (void)provider:(id)a3 performChannelTransmitStopAction:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  objc_msgSend(v5, "channelUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTChannelManager _ensureDelegateIsReadyToReceiveActions:joinReason:](self, "_ensureDelegateIsReadyToReceiveActions:joinReason:", v6, 1);

  objc_msgSend(v5, "fulfill");
  PTDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22AD0F000, v7, OS_LOG_TYPE_DEFAULT, "PTChannelManager did stop transmitting", v11, 2u);
  }

  v8 = PTChannelTransmitRequestSourceForCXActionOriginator(objc_msgSend(v5, "originator"));
  -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "channelUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "channelManager:channelUUID:didEndTransmittingFromSource:", self, v10, v8);

}

- (void)_ensureDelegateIsReadyToReceiveActions:(id)a3 joinReason:(int64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (-[NSUUID isEqual:](self->_suppressRejoinForRecentlyDisconnectedChannelUUID, "isEqual:", v7))
  {
    PTDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_22AD0F000, v8, OS_LOG_TYPE_DEFAULT, "Not delivering the didJoin event because this channel recently saw a leave action %@", (uint8_t *)&v11, 0xCu);
    }

  }
  else if (!self->_activeChannelUUID)
  {
    objc_storeStrong((id *)&self->_activeChannelUUID, a3);
    -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTChannelManager activeChannelUUID](self, "activeChannelUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "channelManager:didJoinChannelWithUUID:reason:", self, v10, a4);

    -[PTChannelManager _deliverChannelManagerInstanceToClientIfNeeded](self, "_deliverChannelManagerInstanceToClientIfNeeded");
    -[PTChannelManager _deliverPendingPushes](self, "_deliverPendingPushes");
  }

}

- (void)provider:(id)a3 didActivateAudioSession:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  PTDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_22AD0F000, v6, OS_LOG_TYPE_DEFAULT, "PTChannelManager did activate audio session %p", (uint8_t *)&v8, 0xCu);
  }

  -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "channelManager:didActivateAudioSession:", self, v5);

}

- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  PTDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_22AD0F000, v6, OS_LOG_TYPE_DEFAULT, "PTChannelManager did deactivate audio session %p", (uint8_t *)&v8, 0xCu);
  }

  -[PTChannelManager channelEventDelegate](self, "channelEventDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "channelManager:didDeactivateAudioSession:", self, v5);

}

- (NSUUID)activeChannelUUID
{
  return self->_activeChannelUUID;
}

- (CXChannelProvider)underlyingProvider
{
  return self->_underlyingProvider;
}

- (CXCallController)callController
{
  return self->_callController;
}

- (PTChannelRestorationDelegate)channelRestorationDelegate
{
  return (PTChannelRestorationDelegate *)objc_loadWeakRetained((id *)&self->_channelRestorationDelegate);
}

- (void)setChannelRestorationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_channelRestorationDelegate, a3);
}

- (PTChannelManagerDelegate)channelEventDelegate
{
  return (PTChannelManagerDelegate *)objc_loadWeakRetained((id *)&self->_channelEventDelegate);
}

- (void)setChannelEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_channelEventDelegate, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (id)instantiationCompletionBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setInstantiationCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSMutableArray)pendingPushes
{
  return self->_pendingPushes;
}

- (void)setPendingPushes:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPushes, a3);
}

- (BOOL)attemptingChannelRestoration
{
  return self->_attemptingChannelRestoration;
}

- (void)setAttemptingChannelRestoration:(BOOL)a3
{
  self->_attemptingChannelRestoration = a3;
}

- (NSUUID)suppressRejoinForRecentlyDisconnectedChannelUUID
{
  return self->_suppressRejoinForRecentlyDisconnectedChannelUUID;
}

- (void)setSuppressRejoinForRecentlyDisconnectedChannelUUID:(id)a3
{
  objc_storeStrong((id *)&self->_suppressRejoinForRecentlyDisconnectedChannelUUID, a3);
}

- (BOOL)isWaitingForPushResult
{
  return self->_isWaitingForPushResult;
}

- (void)setIsWaitingForPushResult:(BOOL)a3
{
  self->_isWaitingForPushResult = a3;
}

- (NSUUID)waitingForPushResultChannelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWaitingForPushResultChannelUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)stopTransmitRequestedWhileWaitingForPushResult
{
  return self->_stopTransmitRequestedWhileWaitingForPushResult;
}

- (void)setStopTransmitRequestedWhileWaitingForPushResult:(BOOL)a3
{
  self->_stopTransmitRequestedWhileWaitingForPushResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForPushResultChannelUUID, 0);
  objc_storeStrong((id *)&self->_suppressRejoinForRecentlyDisconnectedChannelUUID, 0);
  objc_storeStrong((id *)&self->_pendingPushes, 0);
  objc_storeStrong(&self->_instantiationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_destroyWeak((id *)&self->_channelEventDelegate);
  objc_destroyWeak((id *)&self->_channelRestorationDelegate);
  objc_storeStrong((id *)&self->_callController, 0);
  objc_storeStrong((id *)&self->_underlyingProvider, 0);
  objc_storeStrong((id *)&self->_activeChannelUUID, 0);
}

void __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22AD0F000, a2, a3, "PTT transmission start request failed with error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22AD0F000, a2, a3, "PTT transmission stop request failed with error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22AD0F000, a2, a3, "PTT join request failed because %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __41__PTChannelManager_leaveChannelWithUUID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22AD0F000, a2, a3, "PTT leave request failed because %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)providerDidReset:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_22AD0F000, a1, a3, "PTChannelManager's underlying provider did reset", a5, a6, a7, a8, 0);
}

- (void)_performChannelRestorationAndUpdateChannelDescriptor:pushPayload:.cold.1()
{
  __assert_rtn("-[PTChannelManager _performChannelRestorationAndUpdateChannelDescriptor:pushPayload:]", "PTChannelManager.m", 387, "descriptor");
}

void __85__PTChannelManager__performChannelRestorationAndUpdateChannelDescriptor_pushPayload___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22AD0F000, a2, a3, "PTChannelManager rejoin channel descriptor flush failed with error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
