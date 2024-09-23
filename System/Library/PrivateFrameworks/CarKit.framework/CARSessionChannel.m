@implementation CARSessionChannel

- (CARSessionChannel)initWithSession:(id)a3 channelType:(id)a4
{
  return -[CARSessionChannel initWithSession:channelType:channelID:withoutReply:qualityOfService:streamPriority:](self, "initWithSession:channelType:channelID:withoutReply:qualityOfService:streamPriority:", a3, a4, 0, 0, 0, 0);
}

- (CARSessionChannel)initWithSession:(id)a3 channelType:(id)a4 channelID:(id)a5 withoutReply:(BOOL)a6 qualityOfService:(id)a7 streamPriority:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CARSessionChannel *v20;
  CARSessionChannel *v21;
  uint64_t v22;
  NSString *channelType;
  uint64_t v24;
  NSString *channelID;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *channelQueue;
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CARSessionChannel;
  v20 = -[CARSessionChannel init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_session, a3);
    v22 = objc_msgSend(v16, "copy");
    channelType = v21->_channelType;
    v21->_channelType = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    channelID = v21->_channelID;
    v21->_channelID = (NSString *)v24;

    v21->_withoutReply = a6;
    objc_storeStrong((id *)&v21->_qualityOfService, a7);
    objc_storeStrong((id *)&v21->_streamPriority, a8);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("com.apple.carkit.SessionChannel", v26);
    channelQueue = v21->_channelQueue;
    v21->_channelQueue = (OS_dispatch_queue *)v27;

    v21->_payloadCount = 0;
  }

  return v21;
}

- (BOOL)openChannel
{
  return -[CARSessionChannel openChannelWithError:](self, "openChannelWithError:", 0);
}

- (BOOL)openChannelWithError:(id *)a3
{
  NSObject *v5;
  int v6;
  BOOL v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  -[CARSessionChannel channelQueue](self, "channelQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CARSessionChannel_openChannelWithError___block_invoke;
  block[3] = &unk_1E5429450;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  v6 = *((unsigned __int8 *)v17 + 24);
  if (a3 && !*((_BYTE *)v17 + 24))
  {
    *a3 = objc_retainAutorelease((id)v11[5]);
    v6 = *((unsigned __int8 *)v17 + 24);
  }
  v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __42__CARSessionChannel_openChannelWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t (*v16)(uint64_t, void (*)(uint64_t, const void *, uint64_t, void *), id);
  int v17;
  uint64_t (*v18)(uint64_t);
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[5];
  id obj;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortChannelType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v3;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to start remote control session for channel %{public}@", buf, 0xCu);

  }
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "channelType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "channelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "withoutReply");
  objc_msgSend(*(id *)(a1 + 32), "qualityOfService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streamPriority");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v5, "createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:", v6, v7, v8, v9, v10, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);

  if (v12)
  {
    v13 = *v4;
    v14 = *v4;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __42__CARSessionChannel_openChannelWithError___block_invoke_14;
    v36[3] = &unk_1E5427E58;
    v36[4] = v13;
    objc_msgSend(v14, "setInvalidationHandler:", v36);
    v15 = *v4;
    v16 = *(uint64_t (**)(uint64_t, void (*)(uint64_t, const void *, uint64_t, void *), id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v16)
    {
      v17 = v16(v12, _CRHandleRemoteControlEvent, v15);
      if (!v17)
      {
        v18 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v18)
        {
          v19 = v18(v12);
          if (!v19)
          {
            *((_QWORD *)*v4 + 1) = v12;
            CarGeneralLogging();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*v4, "shortChannelType");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v4, "channelID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = v21;
              v40 = 2114;
              v41 = v22;
              _os_log_impl(&dword_1A83A2000, v20, OS_LOG_TYPE_DEFAULT, "Successfully opened remote control session for channel %{public}@ with clientUUID %{public}@", buf, 0x16u);

            }
            v23 = 1;
            goto LABEL_19;
          }
        }
        else
        {
          v19 = -12782;
        }
        CarGeneralLogging();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          __42__CARSessionChannel_openChannelWithError___block_invoke_cold_3(a1 + 32);

        v35 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB3388];
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v19, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v35;
        v30 = 6;
LABEL_18:
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit.session"), v30, v28);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v33 = *(void **)(v32 + 40);
        *(_QWORD *)(v32 + 40) = v31;

        objc_msgSend(*v4, "_channelQueue_closeChannel");
        v23 = 0;
LABEL_19:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23;

        return;
      }
    }
    else
    {
      v17 = -12782;
    }
    CarGeneralLogging();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __42__CARSessionChannel_openChannelWithError___block_invoke_cold_2(a1 + 32);

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB3388];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v17, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v26;
    v30 = 5;
    goto LABEL_18;
  }
  CarGeneralLogging();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    __42__CARSessionChannel_openChannelWithError___block_invoke_cold_1(a1 + 32, a1 + 40, v24);

  objc_msgSend(*(id *)(a1 + 32), "_channelQueue_closeChannel");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

uint64_t __42__CARSessionChannel_openChannelWithError___block_invoke_14(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "channelQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return objc_msgSend(*(id *)(a1 + 32), "_channelQueue_invalidate");
}

- (BOOL)isOpened
{
  return self->_remoteControlSession != 0;
}

- (BOOL)sendChannelMessage:(id)a3
{
  return -[CARSessionChannel sendChannelMessage:withDescription:](self, "sendChannelMessage:withDescription:", a3, 0);
}

- (BOOL)sendChannelMessage:(id)a3 withDescription:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[CARSessionChannel channelQueue](self, "channelQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke;
  v12[3] = &unk_1E5429478;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = &v16;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, v12);

  LOBYTE(self) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)self;
}

void __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, void *), uint64_t);
  char v9;
  NSObject *v10;

  v3 = (id *)(a1 + 4);
  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 8))
  {
    CarGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_1(v10);
    goto LABEL_11;
  }
  ++*(_QWORD *)(v2 + 80);
  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_3(v3);

  v5 = a1[4];
  v6 = *(_QWORD *)(v5 + 8);
  v7 = a1[6];
  v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, void *), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v8 || v8(v6, v7, _CRRemoteControlSendMessageCompletion, v5))
  {
    CarGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_2((uint64_t)v3);
LABEL_11:

    v9 = 0;
    goto LABEL_12;
  }
  v9 = 1;
LABEL_12:
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v9;
}

- (void)closeChannel
{
  NSObject *v3;
  _QWORD block[5];

  -[CARSessionChannel channelQueue](self, "channelQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CARSessionChannel_closeChannel__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __33__CARSessionChannel_closeChannel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_channelQueue_closeChannel");
}

- (void)_channelQueue_closeChannel
{
  NSObject *v3;
  NSObject *v4;
  OpaqueFigEndpointRemoteControlSession *remoteControlSession;
  void (*v6)(OpaqueFigEndpointRemoteControlSession *);
  uint8_t v7[16];

  -[CARSessionChannel channelQueue](self, "channelQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_remoteControlSession)
  {
    CarGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "tearing down remote control session", v7, 2u);
    }

    remoteControlSession = self->_remoteControlSession;
    v6 = *(void (**)(OpaqueFigEndpointRemoteControlSession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 24);
    if (v6)
      v6(remoteControlSession);
  }
}

- (void)_channelQueue_invalidate
{
  NSObject *v3;
  NSObject *v4;
  uint64_t CMBaseObject;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint8_t v8[16];

  -[CARSessionChannel channelQueue](self, "channelQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_remoteControlSession)
  {
    CarGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "invalidating remote control session", v8, 2u);
    }

    CMBaseObject = FigEndpointRemoteControlSessionGetCMBaseObject();
    if (CMBaseObject)
    {
      v6 = CMBaseObject;
      v7 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v7)
        v7(v6);
    }
    CFRelease(self->_remoteControlSession);
    self->_remoteControlSession = 0;
  }
}

- (id)shortChannelType
{
  void *v2;
  void *v3;

  -[CARSessionChannel channelType](self, "channelType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringToIndex:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_endpointValueForKey:(__CFString *)a3
{
  uint64_t CMBaseObject;
  uint64_t (*v5)(uint64_t, __CFString *, _QWORD, id *);
  int v6;
  int v8;
  NSObject *v9;
  NSObject *v11;
  id v12;

  if (self->_remoteControlSession)
  {
    v12 = 0;
    CMBaseObject = FigEndpointRemoteControlSessionGetCMBaseObject();
    v5 = *(uint64_t (**)(uint64_t, __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
    {
      v6 = v5(CMBaseObject, a3, *MEMORY[0x1E0C9AE00], &v12);
      if (v6 == -12787 || v6 == 0)
        return v12;
      v8 = v6;
    }
    else
    {
      v8 = -12782;
    }
    CarGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CARSessionChannel _endpointValueForKey:].cold.2((uint64_t)a3, v8, v11);

    return v12;
  }
  CarGeneralLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CARSessionChannel _endpointValueForKey:].cold.1((uint64_t)a3, v9);

  return 0;
}

- (void)_dataReceived:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CARSessionChannel channelQueue](self, "channelQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CARSessionChannel__dataReceived___block_invoke;
  v7[3] = &unk_1E5427D20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __35__CARSessionChannel__dataReceived___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  CarGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __35__CARSessionChannel__dataReceived___block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "channelDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "channelDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "channelDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "channel:didReceiveMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)_sendComplete
{
  NSObject *v3;
  _QWORD block[5];

  -[CARSessionChannel channelQueue](self, "channelQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CARSessionChannel__sendComplete__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(v3, block);

}

void __34__CARSessionChannel__sendComplete__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  CarGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __34__CARSessionChannel__sendComplete__block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "channelDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "channelDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "channelDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didSendMessageForChannel:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)_channelInvalidated
{
  NSObject *v3;
  _QWORD block[5];

  -[CARSessionChannel channelQueue](self, "channelQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CARSessionChannel__channelInvalidated__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(v3, block);

}

void __40__CARSessionChannel__channelInvalidated__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortChannelType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_DEFAULT, "Channel %{public}@ invalidated", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidationHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "channelDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "channelDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "channelDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didCloseChannel:", *(_QWORD *)(a1 + 32));

    }
  }

}

- (CARSessionChannelDelegate)channelDelegate
{
  return (CARSessionChannelDelegate *)objc_loadWeakRetained((id *)&self->channelDelegate);
}

- (void)setChannelDelegate:(id)a3
{
  objc_storeWeak((id *)&self->channelDelegate, a3);
}

- (CARSession)session
{
  return self->_session;
}

- (NSString)channelType
{
  return self->_channelType;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSNumber)qualityOfService
{
  return self->_qualityOfService;
}

- (NSNumber)streamPriority
{
  return self->_streamPriority;
}

- (BOOL)withoutReply
{
  return self->_withoutReply;
}

- (OS_dispatch_queue)channelQueue
{
  return self->_channelQueue;
}

- (unint64_t)payloadCount
{
  return self->_payloadCount;
}

- (void)setPayloadCount:(unint64_t)a3
{
  self->_payloadCount = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_channelQueue, 0);
  objc_storeStrong((id *)&self->_streamPriority, 0);
  objc_storeStrong((id *)&self->_qualityOfService, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_channelType, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->channelDelegate);
}

void __42__CARSessionChannel_openChannelWithError___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "shortChannelType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1A83A2000, a3, OS_LOG_TYPE_ERROR, "Failed to create remote control session for channel %{public}@: %@", v5, 0x16u);

  OUTLINED_FUNCTION_3_0();
}

void __42__CARSessionChannel_openChannelWithError___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "shortChannelType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_1A83A2000, v2, v3, "Failed to setup remote control session event handler for channel %{public}@: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __42__CARSessionChannel_openChannelWithError___block_invoke_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "shortChannelType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_1A83A2000, v2, v3, "Failed to start remote control session for channel %{public}@: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A83A2000, log, OS_LOG_TYPE_ERROR, "Attempted to send data without active remote control session", v1, 2u);
}

void __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1), "shortChannelType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_1A83A2000, v2, v3, "Failed to send data on channel %{public}@: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_3(id *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(*a1, "shortChannelType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x20u);

}

- (void)_endpointValueForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "no endpoint available, failed to get endpoint value for key %@", (uint8_t *)&v2, 0xCu);
}

- (void)_endpointValueForKey:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1A83A2000, log, OS_LOG_TYPE_ERROR, "failed to get endpoint value for key %@, error: %i", (uint8_t *)&v3, 0x12u);
}

void __35__CARSessionChannel__dataReceived___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(*(id *)(a1 + 32), "shortChannelType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);

  OUTLINED_FUNCTION_3_0();
}

void __34__CARSessionChannel__sendComplete__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "shortChannelType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0xCu);

}

@end
