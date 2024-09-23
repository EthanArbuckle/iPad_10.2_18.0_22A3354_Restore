@implementation VCXPCClientShared

- (VCXPCClientShared)init
{
  VCXPCClientShared *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *CustomRootQueue;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCXPCClientShared;
  v2 = -[AVConferenceXPCClient init](&v7, sel_init);
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v9 = v3;
        v10 = 2080;
        v11 = "-[VCXPCClientShared init]";
        v12 = 1024;
        v13 = 42;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
      }
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->_registeredBlocksQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCXPCClientShared.registeredBlocksQueue", 0, CustomRootQueue);
    v2->_registeredUUIDServiceBlocks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCXPCClientShared deregisterFromNotifications](self, "deregisterFromNotifications");

  v3.receiver = self;
  v3.super_class = (Class)VCXPCClientShared;
  -[AVConferenceXPCClient dealloc](&v3, sel_dealloc);
}

- (void)deregisterFromNotifications
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSMutableDictionary allKeys](self->_registeredUUIDServiceBlocks, "allKeys");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[AVConferenceXPCClient deregisterFromService:](self, "deregisterFromService:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "UTF8String"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
}

- (void)registerBlockWithUUID:(id)a3 service:(char *)a4 block:(id)a5
{
  NSObject *registeredBlocksQueue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  registeredBlocksQueue = self->_registeredBlocksQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke;
  block[3] = &unk_1E9E570E0;
  block[4] = a3;
  block[5] = self;
  block[6] = a5;
  block[7] = a4;
  dispatch_async(registeredBlocksQueue, block);
}

void __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", *(_QWORD *)(a1 + 56), 4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    v5 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 56);
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        v14 = v3;
        v15 = 2080;
        v16 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
        v17 = 1024;
        v18 = 68;
        v19 = 2080;
        v20 = v6;
        v21 = 2112;
        v22 = v2;
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registered service %s with key %@, particiantID: %@", buf, 0x3Au);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136316418;
      v14 = v3;
      v15 = 2080;
      v16 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
      v17 = 1024;
      v18 = 68;
      v19 = 2080;
      v20 = v10;
      v21 = 2112;
      v22 = v2;
      v23 = 2112;
      v24 = v11;
      _os_log_debug_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Registered service %s with key %@, particiantID: %@", buf, 0x3Au);
    }
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v2))
  {
    v8 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", *(_QWORD *)(a1 + 40));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_6;
    v12[3] = &unk_1E9E52730;
    v12[4] = v8;
    objc_msgSend(*(id *)(a1 + 40), "registerBlockForService:block:", *(_QWORD *)(a1 + 56), v12);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKeyedSubscript:", v9, v2);

  }
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v2), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "registeredBlocksQueue");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_2;
    v8[3] = &unk_1E9E527D0;
    v8[4] = a2;
    v8[5] = v6;
    v8[6] = a3;
    dispatch_sync(v7, v8);
  }
}

void __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  id v22;
  NSObject *CustomRootQueue;
  _QWORD v24[5];
  int8x16_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"));
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("vcServiceType"));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "registeredUUIDServiceBlocks"), "objectForKeyedSubscript:", v3))
  {
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "registeredUUIDServiceBlocks"), "objectForKeyedSubscript:", v3), "objectForKeyedSubscript:", v2);
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_21;
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v10 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v28 = v8;
          v29 = 2080;
          v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke_2";
          v31 = 1024;
          v32 = 85;
          v33 = 2112;
          v34 = v3;
          v35 = 2112;
          v36 = v2;
          v11 = " [%s] %s:%d Received callback for service %@ with particiantID: %@";
          v12 = v9;
          v13 = 48;
LABEL_17:
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
LABEL_21:
        v22 = *(id *)(a1 + 40);
        CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_14;
        v24[3] = &unk_1E9E53470;
        v26 = v4;
        v24[4] = *(_QWORD *)(a1 + 32);
        v25 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
        dispatch_async(CustomRootQueue, v24);
        return;
      }
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      *(_DWORD *)buf = 136316162;
      v28 = v8;
      v29 = 2080;
      v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
      v31 = 1024;
      v32 = 85;
      v33 = 2112;
      v34 = v3;
      v35 = 2112;
      v36 = v2;
      v19 = " [%s] %s:%d Received callback for service %@ with particiantID: %@";
      v20 = v9;
      v21 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_21;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      v16 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136316674;
          v28 = v14;
          v29 = 2080;
          v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
          v31 = 1024;
          v32 = 85;
          v33 = 2112;
          v34 = (uint64_t)v5;
          v35 = 2048;
          v36 = v17;
          v37 = 2112;
          v38 = v3;
          v39 = 2112;
          v40 = v2;
          v11 = " [%s] %s:%d %@(%p) Received callback for service %@ with particiantID: %@";
          v12 = v15;
          v13 = 68;
          goto LABEL_17;
        }
        goto LABEL_21;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316674;
      v28 = v14;
      v29 = 2080;
      v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
      v31 = 1024;
      v32 = 85;
      v33 = 2112;
      v34 = (uint64_t)v5;
      v35 = 2048;
      v36 = v18;
      v37 = 2112;
      v38 = v3;
      v39 = 2112;
      v40 = v2;
      v19 = " [%s] %s:%d %@(%p) Received callback for service %@ with particiantID: %@";
      v20 = v15;
      v21 = 68;
    }
    _os_log_debug_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_21;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v28 = v6;
      v29 = 2080;
      v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke_2";
      v31 = 1024;
      v32 = 97;
      v33 = 2112;
      v34 = v3;
      v35 = 2112;
      v36 = v2;
      _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot find block for serviceType %@, particiantID: %@", buf, 0x30u);
    }
  }
}

void __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_14(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)deregisterWithUUID:(id)a3 service:(char *)a4
{
  NSObject *registeredBlocksQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  registeredBlocksQueue = self->_registeredBlocksQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__VCXPCClientShared_deregisterWithUUID_service___block_invoke;
  v5[3] = &unk_1E9E53820;
  v5[5] = a3;
  v5[6] = a4;
  v5[4] = self;
  dispatch_async(registeredBlocksQueue, v5);
}

void __48__VCXPCClientShared_deregisterWithUUID_service___block_invoke(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a1[6], 4);
  objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", v2), "removeObjectForKey:", a1[5]);

}

- (NSMutableDictionary)registeredUUIDServiceBlocks
{
  return self->_registeredUUIDServiceBlocks;
}

- (OS_dispatch_queue)registeredBlocksQueue
{
  return self->_registeredBlocksQueue;
}

@end
