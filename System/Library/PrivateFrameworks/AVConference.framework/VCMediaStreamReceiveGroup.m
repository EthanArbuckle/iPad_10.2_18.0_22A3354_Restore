@implementation VCMediaStreamReceiveGroup

- (VCMediaStreamReceiveGroup)initWithConfig:(id)a3
{
  VCMediaStreamReceiveGroup *v3;
  NSMutableDictionary *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCMediaStreamReceiveGroup *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCMediaStreamReceiveGroup;
  v3 = -[VCMediaStreamGroup initWithConfig:](&v12, sel_initWithConfig_, a3);
  if (!v3)
    goto LABEL_24;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3->_streamToMaxNetworkBitrate = v4;
  if (!v4)
  {
    if ((VCMediaStreamReceiveGroup *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamReceiveGroup initWithConfig:].cold.1();
      }
      goto LABEL_24;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMediaStreamReceiveGroup performSelector:](v3, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_24;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 136316162;
    v14 = v7;
    v15 = 2080;
    v16 = "-[VCMediaStreamReceiveGroup initWithConfig:]";
    v17 = 1024;
    v18 = 27;
    v19 = 2112;
    v20 = v5;
    v21 = 2048;
    v22 = v3;
    v9 = " [%s] %s:%d %@(%p) Failed to allocate max bitrate map";
    goto LABEL_27;
  }
  v3->_streamToActualNetworkBitrate = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v3->_streamToMaxNetworkBitrate)
  {
    if ((VCMediaStreamReceiveGroup *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamReceiveGroup initWithConfig:].cold.2();
      }
      goto LABEL_24;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCMediaStreamReceiveGroup performSelector:](v3, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v10 = VRTraceErrorLogLevelToCSTR(),
          v8 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_24:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    v14 = v10;
    v15 = 2080;
    v16 = "-[VCMediaStreamReceiveGroup initWithConfig:]";
    v17 = 1024;
    v18 = 29;
    v19 = 2112;
    v20 = v6;
    v21 = 2048;
    v22 = v3;
    v9 = " [%s] %s:%d %@(%p) Failed to allocate actual bitrate map";
LABEL_27:
    _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x30u);
    goto LABEL_24;
  }
  -[VCMediaStreamReceiveGroup setupMaxBitrateMap](v3, "setupMaxBitrateMap");
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamReceiveGroup;
  -[VCMediaStreamGroup dealloc](&v3, sel_dealloc);
}

- (NSNumber)optedInStreamID
{
  NSObject *stateQueue;
  NSNumber *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCMediaStreamReceiveGroup_optedInStreamID__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __44__VCMediaStreamReceiveGroup_optedInStreamID__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 432);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)activeStreamID
{
  NSObject *stateQueue;
  NSNumber *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCMediaStreamReceiveGroup_activeStreamID__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__VCMediaStreamReceiveGroup_activeStreamID__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 440);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setActiveStreamIDs:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStreamReceiveGroup setActiveStreamIDs:]"), 0));
}

- (void)setActiveStreamID:(id)a3
{
  NSNumber *activeStreamID;

  if (!-[NSNumber isEqualToNumber:](self->_activeStreamID, "isEqualToNumber:"))
  {
    activeStreamID = self->_activeStreamID;
    if (activeStreamID)
    {
      -[VCMediaStreamReceiveGroup setActualBitrateForOptedInStreamWithActiveStreamID:](self, "setActualBitrateForOptedInStreamWithActiveStreamID:", a3);
      activeStreamID = self->_activeStreamID;
    }

    self->_activeStreamID = (NSNumber *)a3;
  }
}

- (void)setActualBitrateForOptedInStreamWithActiveStreamID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  NSNumber *activeStreamID;
  NSNumber *optedInStreamID;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSNumber *v19;
  NSNumber *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSNumber *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  NSNumber *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamToMaxNetworkBitrate, "objectForKeyedSubscript:", self->_optedInStreamID), "unsignedIntValue");
  v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamToActualNetworkBitrate, "objectForKeyedSubscript:", self->_optedInStreamID), "unsignedIntValue");
  v7 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamToMaxNetworkBitrate, "objectForKeyedSubscript:", a3), "unsignedIntValue");
  if (!-[NSNumber isEqual:](self->_optedInStreamID, "isEqual:", a3))
  {
    v8 = v7 >= v5;
    v5 = v7;
    if (v8)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((_DWORD)v6 != (_DWORD)v5)
  {
LABEL_5:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamToActualNetworkBitrate, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5), self->_optedInStreamID);
    -[VCMediaStreamReceiveGroup notifyChangeInActiveMediaBitrateTo:from:](self, "notifyChangeInActiveMediaBitrateTo:from:", v5, v6);
  }
LABEL_6:
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        activeStreamID = self->_activeStreamID;
        optedInStreamID = self->_optedInStreamID;
        v21 = 136316418;
        v22 = v10;
        v23 = 2080;
        v24 = "-[VCMediaStreamReceiveGroup setActualBitrateForOptedInStreamWithActiveStreamID:]";
        v25 = 1024;
        v26 = 101;
        v27 = 2112;
        v28 = activeStreamID;
        v29 = 2112;
        v30 = a3;
        v31 = 2112;
        v32 = optedInStreamID;
        v14 = " [%s] %s:%d Switching from stream %@ to new stream %@, with opted-in stream %@";
        v15 = v11;
        v16 = 58;
LABEL_16:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v21, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCMediaStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_activeStreamID;
        v20 = self->_optedInStreamID;
        v21 = 136316930;
        v22 = v17;
        v23 = 2080;
        v24 = "-[VCMediaStreamReceiveGroup setActualBitrateForOptedInStreamWithActiveStreamID:]";
        v25 = 1024;
        v26 = 101;
        v27 = 2112;
        v28 = (void *)v9;
        v29 = 2048;
        v30 = self;
        v31 = 2112;
        v32 = v19;
        v33 = 2112;
        v34 = a3;
        v35 = 2112;
        v36 = v20;
        v14 = " [%s] %s:%d %@(%p) Switching from stream %@ to new stream %@, with opted-in stream %@";
        v15 = v18;
        v16 = 78;
        goto LABEL_16;
      }
    }
  }
}

- (void)vcMediaStreamDidRTPTimeOut:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  VCMediaStreamReceiveGroup *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamReceiveGroup vcMediaStreamDidRTPTimeOut:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMediaStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v8 = 136316418;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCMediaStreamReceiveGroup vcMediaStreamDidRTPTimeOut:]";
        v12 = 1024;
        v13 = 107;
        v14 = 2112;
        v15 = v5;
        v16 = 2048;
        v17 = self;
        v18 = 2048;
        v19 = a3;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream=%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)vcMediaStreamDidRTCPTimeOut:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  VCMediaStreamReceiveGroup *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamReceiveGroup vcMediaStreamDidRTCPTimeOut:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMediaStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v8 = 136316418;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCMediaStreamReceiveGroup vcMediaStreamDidRTCPTimeOut:]";
        v12 = 1024;
        v13 = 111;
        v14 = 2112;
        v15 = v5;
        v16 = 2048;
        v17 = self;
        v18 = 2048;
        v19 = a3;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream=%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)vcMediaStreamDidDecryptionTimeOut:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  VCMediaStreamReceiveGroup *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamReceiveGroup vcMediaStreamDidDecryptionTimeOut:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMediaStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCMediaStreamReceiveGroup vcMediaStreamDidDecryptionTimeOut:]";
        v13 = 1024;
        v14 = 115;
        v15 = 2112;
        v16 = v5;
        v17 = 2048;
        v18 = self;
        v19 = 2048;
        v20 = a3;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream=%p", buf, 0x3Au);
      }
    }
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__VCMediaStreamReceiveGroup_vcMediaStreamDidDecryptionTimeOut___block_invoke;
  v8[3] = &unk_1E9E52A28;
  v8[4] = self;
  -[VCMediaStreamGroup callDelegateWithBlock:](self, "callDelegateWithBlock:", v8);
}

uint64_t __63__VCMediaStreamReceiveGroup_vcMediaStreamDidDecryptionTimeOut___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didMediaDecryptionTimeOutForStreamGroup:", *(_QWORD *)(a1 + 32));
}

- (void)vcMediaStreamDidDecryptionTimeOutForMKMRecovery:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  VCMediaStreamReceiveGroup *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamReceiveGroup vcMediaStreamDidDecryptionTimeOutForMKMRecovery:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMediaStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCMediaStreamReceiveGroup vcMediaStreamDidDecryptionTimeOutForMKMRecovery:]";
        v13 = 1024;
        v14 = 122;
        v15 = 2112;
        v16 = v5;
        v17 = 2048;
        v18 = self;
        v19 = 2048;
        v20 = a3;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream:%p", buf, 0x3Au);
      }
    }
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__VCMediaStreamReceiveGroup_vcMediaStreamDidDecryptionTimeOutForMKMRecovery___block_invoke;
  v8[3] = &unk_1E9E52A28;
  v8[4] = self;
  -[VCMediaStreamGroup callDelegateWithBlock:](self, "callDelegateWithBlock:", v8);
}

uint64_t __77__VCMediaStreamReceiveGroup_vcMediaStreamDidDecryptionTimeOutForMKMRecovery___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didDecryptionTimeOutForMKMRecoveryForStreamGroup:", *(_QWORD *)(a1 + 32));
}

- (void)setupMaxBitrateMap
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  NSArray *obj;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->super._mediaStreamInfoArray;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v14)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(obj);
        v15 = v3;
        v4 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v3);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v5 = (void *)objc_msgSend(v4, "streamConfigs");
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v18 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
              v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v10, "multiwayConfig"), "maxNetworkBitrate"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamToMaxNetworkBitrate, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend(v10, "multiwayConfig"), "idsStreamID")));
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
          }
          while (v7);
        }
        v3 = v15 + 1;
      }
      while (v15 + 1 != v14);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v14);
  }
}

- (void)notifyChangeInActiveMediaBitrateTo:(unsigned int)a3 from:(unsigned int)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  NSNumber *optedInStreamID;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSNumber *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _BYTE v27[10];
  NSNumber *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        optedInStreamID = self->_optedInStreamID;
        *(_DWORD *)buf = 136316418;
        v19 = v8;
        v20 = 2080;
        v21 = "-[VCMediaStreamReceiveGroup notifyChangeInActiveMediaBitrateTo:from:]";
        v22 = 1024;
        v23 = 139;
        v24 = 2112;
        v25 = optedInStreamID;
        v26 = 1024;
        *(_DWORD *)v27 = a4;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = a3;
        v11 = " [%s] %s:%d Actual Network Bitrate optedInStreamID=%@ has been updated from %d bps, to %d bps";
        v12 = v9;
        v13 = 50;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCMediaStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_optedInStreamID;
        *(_DWORD *)buf = 136316930;
        v19 = v14;
        v20 = 2080;
        v21 = "-[VCMediaStreamReceiveGroup notifyChangeInActiveMediaBitrateTo:from:]";
        v22 = 1024;
        v23 = 139;
        v24 = 2112;
        v25 = (void *)v7;
        v26 = 2048;
        *(_QWORD *)v27 = self;
        *(_WORD *)&v27[8] = 2112;
        v28 = v16;
        v29 = 1024;
        v30 = a4;
        v31 = 1024;
        v32 = a3;
        v11 = " [%s] %s:%d %@(%p) Actual Network Bitrate optedInStreamID=%@ has been updated from %d bps, to %d bps";
        v12 = v15;
        v13 = 70;
        goto LABEL_11;
      }
    }
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__VCMediaStreamReceiveGroup_notifyChangeInActiveMediaBitrateTo_from___block_invoke;
  v17[3] = &unk_1E9E52A28;
  v17[4] = self;
  -[VCMediaStreamGroup callDelegateWithBlock:](self, "callDelegateWithBlock:", v17);
}

uint64_t __69__VCMediaStreamReceiveGroup_notifyChangeInActiveMediaBitrateTo_from___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didChangeActualNetworkBitrateForStreamGroup:", *(_QWORD *)(a1 + 32));
}

- (void)initWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate max bitrate map", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate actual bitrate map", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)vcMediaStreamDidRTPTimeOut:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stream=%p", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)vcMediaStreamDidRTCPTimeOut:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stream=%p", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)vcMediaStreamDidDecryptionTimeOut:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stream=%p", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)vcMediaStreamDidDecryptionTimeOutForMKMRecovery:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stream:%p", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
