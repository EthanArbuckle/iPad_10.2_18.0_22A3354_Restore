@implementation VCMediaStreamSendGroup

- (VCMediaStreamSendGroup)initWithConfig:(id)a3
{
  VCMediaStreamSendGroup *v4;
  VCMediaStreamSendGroup *v5;
  NSMutableArray *v6;
  uint64_t v7;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
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
  VCMediaStreamSendGroup *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCMediaStreamSendGroup;
  v4 = -[VCMediaStreamGroup initWithConfig:](&v12, sel_initWithConfig_);
  v5 = v4;
  if (v4)
  {
    v4->_isSuspended = 1;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_peerSubscribedStreams = v6;
    if (v6)
    {
      v5->_shouldSynchronizeWithSourceRTPTimestamps = objc_msgSend(a3, "shouldSynchronizeWithSourceRTPTimestamps");
      pthread_rwlock_init(&v5->_sourceTimestampRWLock, 0);
      v5->_lastSentSourceHostTime = NAN;
      if (-[VCMediaStreamGroup streamGroupID](v5, "streamGroupID") == 1937339233)
        v5->super._areStreamsSuspended = 1;
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      v5->_sendGroupConfigForMode = (NSMutableDictionary *)v7;
      if (v7)
      {
        v5->_streamGroupMode = objc_msgSend(a3, "streamGroupMode");
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_sendGroupConfigForMode, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupMode")));
        objc_msgSend(a3, "setDelegate:", 0);
        return v5;
      }
      if ((VCMediaStreamSendGroup *)objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaStreamSendGroup initWithConfig:].cold.2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)-[VCMediaStreamSendGroup performSelector:](v5, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v14 = v10;
            v15 = 2080;
            v16 = "-[VCMediaStreamSendGroup initWithConfig:]";
            v17 = 1024;
            v18 = 76;
            v19 = 2112;
            v20 = v9;
            v21 = 2048;
            v22 = v5;
            _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) The dictionary for stream send group config for stream mode is nil", buf, 0x30u);
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamSendGroup initWithConfig:].cold.1();
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  pthread_rwlock_destroy(&self->_sourceTimestampRWLock);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSendGroup;
  -[VCMediaStreamGroup dealloc](&v3, sel_dealloc);
}

- (id)streamGroupConfigForMode:(unsigned int)a3
{
  NSObject *stateQueue;
  void *v4;
  _QWORD v6[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  stateQueue = self->super._stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__VCMediaStreamSendGroup_streamGroupConfigForMode___block_invoke;
  v6[3] = &unk_1E9E54AC8;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  dispatch_sync(stateQueue, v6);
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __51__VCMediaStreamSendGroup_streamGroupConfigForMode___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)setStreamGroupMode:(unsigned int)a3
{
  NSObject *stateQueue;
  char v4;
  _QWORD v6[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->super._stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__VCMediaStreamSendGroup_setStreamGroupMode___block_invoke;
  v6[3] = &unk_1E9E54D70;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(stateQueue, v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __45__VCMediaStreamSendGroup_setStreamGroupMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  int v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  char *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  int v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  NSObject *v36;
  const __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  int v50;
  _BYTE v51[24];
  _BYTE v52[24];
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 316)
    || !objc_msgSend(*(id *)(v2 + 464), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_DWORD *)(v7 + 316);
      v9 = objc_msgSend(*(id *)(v7 + 464), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
      *(_DWORD *)v51 = 136316162;
      *(_QWORD *)&v51[4] = v5;
      *(_WORD *)&v51[12] = 2080;
      *(_QWORD *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
      *(_WORD *)&v51[22] = 1024;
      *(_DWORD *)v52 = 115;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v8;
      *(_WORD *)&v52[10] = 2112;
      *(_QWORD *)&v52[12] = v9;
      v10 = " [%s] %s:%d Stream group mode cannot be changed. Current state=%u, configForMode=%@";
      v11 = v6;
      v12 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v41 = *(_QWORD *)(a1 + 32);
      v42 = *(_DWORD *)(v41 + 316);
      v43 = objc_msgSend(*(id *)(v41 + 464), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
      *(_DWORD *)v51 = 136316674;
      *(_QWORD *)&v51[4] = v13;
      *(_WORD *)&v51[12] = 2080;
      *(_QWORD *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
      *(_WORD *)&v51[22] = 1024;
      *(_DWORD *)v52 = 115;
      *(_WORD *)&v52[4] = 2112;
      *(_QWORD *)&v52[6] = v3;
      *(_WORD *)&v52[14] = 2048;
      *(_QWORD *)&v52[16] = v41;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = v42;
      WORD3(v53) = 2112;
      *((_QWORD *)&v53 + 1) = v43;
      v10 = " [%s] %s:%d %@(%p) Stream group mode cannot be changed. Current state=%u, configForMode=%@";
      v11 = v14;
      v12 = 64;
    }
LABEL_42:
    _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v10, v51, v12);
    return;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setupStreamGroupWithConfig:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_34;
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      v30 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 472);
      v31 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)v51 = 136316162;
      *(_QWORD *)&v51[4] = v28;
      *(_WORD *)&v51[12] = 2080;
      *(_QWORD *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
      *(_WORD *)&v51[22] = 1024;
      *(_DWORD *)v52 = 125;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v30;
      *(_WORD *)&v52[10] = 1024;
      *(_DWORD *)&v52[12] = v31;
      v32 = " [%s] %s:%d Failed to set stream group mode. Current mode=%u new mode=%u";
      v33 = v29;
      v34 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v35 = VRTraceErrorLogLevelToCSTR(),
            v36 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_34:
        if ((objc_msgSend(*(id *)(a1 + 32), "setupStreamGroupWithConfig:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 472), *(_OWORD *)v51, *(_QWORD *)&v51[16], *(_OWORD *)v52, *(_QWORD *)&v52[16], v53))) & 1) != 0)return;
        if (objc_opt_class() == *(_QWORD *)(a1 + 32))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            return;
          v38 = VRTraceErrorLogLevelToCSTR();
          v39 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            return;
          v40 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 472);
          *(_DWORD *)v51 = 136315906;
          *(_QWORD *)&v51[4] = v38;
          *(_WORD *)&v51[12] = 2080;
          *(_QWORD *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
          *(_WORD *)&v51[22] = 1024;
          *(_DWORD *)v52 = 129;
          *(_WORD *)&v52[4] = 1024;
          *(_DWORD *)&v52[6] = v40;
          v10 = " [%s] %s:%d Failed to reset stream group back to original mode. Current mode=%u";
          v11 = v39;
          v12 = 34;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v37 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
          else
            v37 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            return;
          v44 = VRTraceErrorLogLevelToCSTR();
          v45 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            return;
          v46 = *(_QWORD *)(a1 + 32);
          v47 = *(_DWORD *)(v46 + 472);
          *(_DWORD *)v51 = 136316418;
          *(_QWORD *)&v51[4] = v44;
          *(_WORD *)&v51[12] = 2080;
          *(_QWORD *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
          *(_WORD *)&v51[22] = 1024;
          *(_DWORD *)v52 = 129;
          *(_WORD *)&v52[4] = 2112;
          *(_QWORD *)&v52[6] = v37;
          *(_WORD *)&v52[14] = 2048;
          *(_QWORD *)&v52[16] = v46;
          LOWORD(v53) = 1024;
          *(_DWORD *)((char *)&v53 + 2) = v47;
          v10 = " [%s] %s:%d %@(%p) Failed to reset stream group back to original mode. Current mode=%u";
          v11 = v45;
          v12 = 54;
        }
        goto LABEL_42;
      }
      v48 = *(_QWORD *)(a1 + 32);
      v49 = *(_DWORD *)(v48 + 472);
      v50 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)v51 = 136316674;
      *(_QWORD *)&v51[4] = v35;
      *(_WORD *)&v51[12] = 2080;
      *(_QWORD *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
      *(_WORD *)&v51[22] = 1024;
      *(_DWORD *)v52 = 125;
      *(_WORD *)&v52[4] = 2112;
      *(_QWORD *)&v52[6] = v15;
      *(_WORD *)&v52[14] = 2048;
      *(_QWORD *)&v52[16] = v48;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = v49;
      WORD3(v53) = 1024;
      DWORD2(v53) = v50;
      v32 = " [%s] %s:%d %@(%p) Failed to set stream group mode. Current mode=%u new mode=%u";
      v33 = v36;
      v34 = 60;
    }
    _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, v32, v51, v34);
    goto LABEL_34;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 472) = *(_DWORD *)(a1 + 48);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
        v19 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 472);
        *(_DWORD *)v51 = 136316162;
        *(_QWORD *)&v51[4] = v16;
        *(_WORD *)&v51[12] = 2080;
        *(_QWORD *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
        *(_WORD *)&v51[22] = 1024;
        *(_DWORD *)v52 = 123;
        *(_WORD *)&v52[4] = 2080;
        *(_QWORD *)&v52[6] = v18;
        *(_WORD *)&v52[14] = 1024;
        *(_DWORD *)&v52[16] = v19;
        v20 = " [%s] %s:%d Successfully set Stream Send GroupID=%s to mode=%u";
        v21 = v17;
        v22 = 44;
LABEL_27:
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, v51, v22);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(void **)(a1 + 32);
        v26 = FourccToCStr(objc_msgSend(v25, "streamGroupID"));
        v27 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 472);
        *(_DWORD *)v51 = 136316674;
        *(_QWORD *)&v51[4] = v23;
        *(_WORD *)&v51[12] = 2080;
        *(_QWORD *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
        *(_WORD *)&v51[22] = 1024;
        *(_DWORD *)v52 = 123;
        *(_WORD *)&v52[4] = 2112;
        *(_QWORD *)&v52[6] = v4;
        *(_WORD *)&v52[14] = 2048;
        *(_QWORD *)&v52[16] = v25;
        LOWORD(v53) = 2080;
        *(_QWORD *)((char *)&v53 + 2) = v26;
        WORD5(v53) = 1024;
        HIDWORD(v53) = v27;
        v20 = " [%s] %s:%d %@(%p) Successfully set Stream Send GroupID=%s to mode=%u";
        v21 = v24;
        v22 = 64;
        goto LABEL_27;
      }
    }
  }
}

- (void)setCurrentUplinkTargetBitrate:(unsigned int)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VCMediaStreamSendGroup_setCurrentUplinkTargetBitrate___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __56__VCMediaStreamSendGroup_setCurrentUplinkTargetBitrate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 440) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)streamGroupMode
{
  NSObject *stateQueue;
  unsigned int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCMediaStreamSendGroup_streamGroupMode__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__VCMediaStreamSendGroup_streamGroupMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 472);
  return result;
}

- (void)updateEncryptionInformationWithConfig:(id)a3
{
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  VCSecurityKeyHolder_CopyKeyMaterialForKeyIndex((uint64_t)-[VCMediaStreamGroup securityKeyHolder](self, "securityKeyHolder"), 0, (uint64_t *)&v12);
  v4 = (void *)objc_msgSend(v12, "firstObject");
  v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SecurityLocallyGenerated")), "BOOLValue");
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (void *)objc_msgSend(a3, "mediaStreamInfoArray");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "stream"), "handleEncryptionInfoChange:", v4);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v9);
    }
  }

}

- (BOOL)setupStreamGroupWithConfig:(id)a3
{
  _BOOL4 v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCMediaStreamSendGroup *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[VCMediaStreamGroup unregisterMediaStreamNotificationDelegate](self, "unregisterMediaStreamNotificationDelegate");
  v13.receiver = self;
  v13.super_class = (Class)VCMediaStreamSendGroup;
  if (-[VCMediaStreamGroup setupStreamsWithConfig:](&v13, sel_setupStreamsWithConfig_, a3))
  {
    -[VCMediaStreamSendGroup setRedundancyController:](self, "setRedundancyController:", objc_msgSend(a3, "redundancyController"));
    -[VCMediaStreamGroup registerMediaStreamNotificationDelegate](self, "registerMediaStreamNotificationDelegate");
    if (-[VCMediaStreamGroup configureStreams](self, "configureStreams"))
    {
      -[VCMediaStreamSendGroup updateEncryptionInformationWithConfig:](self, "updateEncryptionInformationWithConfig:", a3);
      LOBYTE(v5) = 1;
      return v5;
    }
    if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCMediaStreamSendGroup setupStreamGroupWithConfig:].cold.1();
      }
      goto LABEL_26;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCMediaStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v5)
        return v5;
      *(_DWORD *)buf = 136316162;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VCMediaStreamSendGroup setupStreamGroupWithConfig:]";
      v18 = 1024;
      v19 = 177;
      v20 = 2112;
      v21 = v7;
      v22 = 2048;
      v23 = self;
      v10 = " [%s] %s:%d %@(%p) Failed to configure streams";
LABEL_25:
      _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x30u);
    }
  }
  else
  {
    if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCMediaStreamSendGroup setupStreamGroupWithConfig:].cold.2();
      }
      goto LABEL_26;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCMediaStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v5)
        return v5;
      *(_DWORD *)buf = 136316162;
      v15 = v8;
      v16 = 2080;
      v17 = "-[VCMediaStreamSendGroup setupStreamGroupWithConfig:]";
      v18 = 1024;
      v19 = 171;
      v20 = 2112;
      v21 = v6;
      v22 = 2048;
      v23 = self;
      v10 = " [%s] %s:%d %@(%p) Failed to setup streams with configuration";
      goto LABEL_25;
    }
  }
LABEL_26:
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)updateConfig:(id)a3 forMode:(unsigned int)a4
{
  NSObject *stateQueue;
  char v5;
  _QWORD block[7];
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCMediaStreamSendGroup_updateConfig_forMode___block_invoke;
  block[3] = &unk_1E9E56DD0;
  v8 = a4;
  block[5] = a3;
  block[6] = &v9;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __47__VCMediaStreamSendGroup_updateConfig_forMode___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  _DWORD *v27;
  _BYTE v28[24];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 316);
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    if (v3 == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v17 = VRTraceErrorLogLevelToCSTR(),
            v18 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_24:
        v27 = *(_DWORD **)(a1 + 32);
        if (v27[118] == *(_DWORD *)(a1 + 56))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v27, "setupStreamGroupWithConfig:", *(_QWORD *)(a1 + 40));
        else
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "streamGroupMode", *(_OWORD *)v28, *(_QWORD *)&v28[16], v29, v30, v31, v32)));
        objc_msgSend(*(id *)(a1 + 40), "setDelegate:", 0);
        return;
      }
      v19 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)v28 = 136315906;
      *(_QWORD *)&v28[4] = v17;
      *(_WORD *)&v28[12] = 2080;
      *(_QWORD *)&v28[14] = "-[VCMediaStreamSendGroup updateConfig:forMode:]_block_invoke";
      *(_WORD *)&v28[22] = 1024;
      LODWORD(v29) = 193;
      WORD2(v29) = 1024;
      *(_DWORD *)((char *)&v29 + 6) = v19;
      v20 = " [%s] %s:%d Updating streamGroupConfig for mode=%d";
      v21 = v18;
      v22 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)v28 = 136316418;
      *(_QWORD *)&v28[4] = v23;
      *(_WORD *)&v28[12] = 2080;
      *(_QWORD *)&v28[14] = "-[VCMediaStreamSendGroup updateConfig:forMode:]_block_invoke";
      *(_WORD *)&v28[22] = 1024;
      LODWORD(v29) = 193;
      WORD2(v29) = 2112;
      *(_QWORD *)((char *)&v29 + 6) = v6;
      HIWORD(v29) = 2048;
      v30 = v25;
      LOWORD(v31) = 1024;
      *(_DWORD *)((char *)&v31 + 2) = v26;
      v20 = " [%s] %s:%d %@(%p) Updating streamGroupConfig for mode=%d";
      v21 = v24;
      v22 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, v28, v22);
    goto LABEL_24;
  }
  if (v3 == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v9 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 316);
        *(_DWORD *)v28 = 136315906;
        *(_QWORD *)&v28[4] = v7;
        *(_WORD *)&v28[12] = 2080;
        *(_QWORD *)&v28[14] = "-[VCMediaStreamSendGroup updateConfig:forMode:]_block_invoke";
        *(_WORD *)&v28[22] = 1024;
        LODWORD(v29) = 189;
        WORD2(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 6) = v9;
        v10 = " [%s] %s:%d Stream group config cannot be changed. Current state=%u";
        v11 = v8;
        v12 = 34;
LABEL_15:
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v10, v28, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(_DWORD *)(v15 + 316);
        *(_DWORD *)v28 = 136316418;
        *(_QWORD *)&v28[4] = v13;
        *(_WORD *)&v28[12] = 2080;
        *(_QWORD *)&v28[14] = "-[VCMediaStreamSendGroup updateConfig:forMode:]_block_invoke";
        *(_WORD *)&v28[22] = 1024;
        LODWORD(v29) = 189;
        WORD2(v29) = 2112;
        *(_QWORD *)((char *)&v29 + 6) = v5;
        HIWORD(v29) = 2048;
        v30 = v15;
        LOWORD(v31) = 1024;
        *(_DWORD *)((char *)&v31 + 2) = v16;
        v10 = " [%s] %s:%d %@(%p) Stream group config cannot be changed. Current state=%u";
        v11 = v14;
        v12 = 54;
        goto LABEL_15;
      }
    }
  }
}

- (BOOL)shouldCompoundListIgnoreStream:(id)a3 streamConfig:(id)a4 activeStreamIds:(id)a5
{
  return 0;
}

- (void)updateStreamIDCompoundingWithBlock:(id)a3 activeStreamIds:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  void *v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->super._mediaStreamInfoArray, "count"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->super._mediaStreamInfoArray, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->super._mediaStreamInfoArray;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v20)
  {
    v24 = 0;
    v25 = v7;
    v19 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(obj);
        v21 = v8;
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v23 = v9;
        v10 = (void *)objc_msgSend(v9, "streamConfigs");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              v16 = (void *)objc_msgSend(v15, "multiwayConfig");
              v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v16, "idsStreamID"));
              if (!-[VCMediaStreamSendGroup shouldCompoundListIgnoreStream:streamConfig:activeStreamIds:](self, "shouldCompoundListIgnoreStream:streamConfig:activeStreamIds:", v17, v15, a4))
              {
                if (objc_msgSend(a4, "containsObject:", v17))
                {
                  if (v24)
                    (*((void (**)(id, uint64_t, void *, void *, _QWORD))a3 + 2))(a3, v24, v6, v25, 0);
                  objc_msgSend(v6, "removeAllObjects");
                  objc_msgSend(v25, "removeAllObjects");
                  v24 = objc_msgSend(v23, "stream");
                }
                objc_msgSend(v6, "addObject:", v17);
                if (objc_msgSend(v16, "hasRepairedStreamID"))
                  objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v16, "repairedStreamID")));
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
          }
          while (v12);
        }
        v8 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v20);
    v7 = v25;
    if (v24)
      (*((void (**)(id, uint64_t, void *, void *, uint64_t))a3 + 2))(a3, v24, v6, v25, 1);
  }

}

- (id)streamDescriptionForMediaStreamConfig:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "multiwayConfig");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("streamId=%hu quality=%u"), objc_msgSend(v3, "idsStreamID"), objc_msgSend(v3, "qualityIndex"));
}

- (BOOL)shouldSubscribeToStreamID:(id)a3 peerSubscribedStreams:(id)a4
{
  return objc_msgSend(a4, "containsObject:", a3);
}

- (BOOL)updateUplinkStreamsForPeerSubscribedStreams:(id)a3
{
  return 0;
}

- (void)updateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  NSObject *stateQueue;
  _QWORD block[7];
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__VCMediaStreamSendGroup_updateActiveMediaStreamIDs_withTargetBitrate_mediaBitrates_rateChangeCounter___block_invoke;
  block[3] = &unk_1E9E54B40;
  block[4] = self;
  block[5] = a3;
  block[6] = a5;
  v8 = a4;
  v9 = a6;
  dispatch_async(stateQueue, block);
}

uint64_t __103__VCMediaStreamSendGroup_updateActiveMediaStreamIDs_withTargetBitrate_mediaBitrates_rateChangeCounter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 60));
}

- (BOOL)v2PayloadsAllowed
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  BOOL v15;
  VCMediaStreamSendGroup *v17;
  NSArray *obj;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self;
  obj = self->super._mediaStreamInfoArray;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v9 = (void *)objc_msgSend(v8, "streamConfigs");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "multiwayConfig");
              objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v14, "idsStreamID")));
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
          }
          while (v11);
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v5);
  }
  objc_msgSend(v3, "intersectSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17->_peerSubscribedStreams));
  v15 = objc_msgSend(v3, "count") == 0;

  return v15;
}

- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  -[VCMediaStreamSendGroup updateActiveStreamsCount:](self, "updateActiveStreamsCount:", objc_msgSend(a3, "count"));
  self->_isSuspended = objc_msgSend(a3, "count") == 0;
}

- (BOOL)dispatchedEnableRedundancy:(BOOL)a3
{
  int v3;
  int v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  v5 = *((unsigned __int8 *)&self->super._ignoreMKINotifications + 4);
  if (v5 != v3)
    *(&self->super._ignoreMKINotifications + 4) = v3;
  return v5 != v3;
}

- (BOOL)enableRedundancy:(BOOL)a3
{
  NSObject *stateQueue;
  char v4;
  _QWORD v6[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->super._stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__VCMediaStreamSendGroup_enableRedundancy___block_invoke;
  v6[3] = &unk_1E9E56258;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  dispatch_sync(stateQueue, v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __43__VCMediaStreamSendGroup_enableRedundancy___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedEnableRedundancy:", *(unsigned __int8 *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setRetransmissionEnabled:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCMediaStreamSendGroup_setRetransmissionEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __51__VCMediaStreamSendGroup_setRetransmissionEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 728) = *(_BYTE *)(a1 + 40);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "setUplinkRetransmissionEnabled:", *(unsigned __int8 *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)updateUplinkBitrateCapCell:(unsigned int)a3 activeStreamIDs:(id)a4
{
  self->_uplinkBitrateCapWifi = a3;
}

- (void)updateUplinkBitrateCapWifi:(unsigned int)a3 activeStreamIDs:(id)a4
{
  *(_DWORD *)&self->_isRedundancyEnabled = a3;
}

- (id)peerSubscribedStreams
{
  return self->_peerSubscribedStreams;
}

- (BOOL)updatePeerSubscribedStreams:(id)a3 containsRepairStreams:(BOOL)a4
{
  NSObject *stateQueue;
  char v5;
  _QWORD block[7];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__VCMediaStreamSendGroup_updatePeerSubscribedStreams_containsRepairStreams___block_invoke;
  block[3] = &unk_1E9E551E0;
  block[4] = self;
  block[5] = a3;
  block[6] = &v9;
  v8 = a4;
  dispatch_sync(stateQueue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __76__VCMediaStreamSendGroup_updatePeerSubscribedStreams_containsRepairStreams___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  BOOL v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "checkStreamsForAdditionalOptIn:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "updateUplinkStreamsForPeerSubscribedStreams:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "addObjectsFromArray:", v2);
  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedEnableRedundancy:", *(unsigned __int8 *)(a1 + 56));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = (result & 1) != 0 || *(_BYTE *)(v4 + 24) != 0;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

- (id)checkStreamsForAdditionalOptIn:(id)a3
{
  return a3;
}

- (id)dispatchedMediaStreamInfosForEndToEndConnection:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "mediaStreamInfoArray");
}

- (void)dispatchedUpdateStreamsWithActiveConnection:(id)a3
{
  uint64_t IsEndToEndLink;
  id v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int streamGroupMode;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BYTE v33[10];
  VCMediaStreamSendGroup *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  unsigned int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)a3);
  v6 = -[VCMediaStreamSendGroup dispatchedMediaStreamInfosForEndToEndConnection:](self, "dispatchedMediaStreamInfosForEndToEndConnection:", IsEndToEndLink);
  if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        streamGroupMode = self->_streamGroupMode;
        *(_DWORD *)buf = 136316162;
        v27 = v8;
        v28 = 2080;
        v29 = "-[VCMediaStreamSendGroup dispatchedUpdateStreamsWithActiveConnection:]";
        v30 = 1024;
        v31 = 374;
        v32 = 1024;
        *(_DWORD *)v33 = IsEndToEndLink;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = streamGroupMode;
        v11 = " [%s] %s:%d Updating active connection connectionIsEndToEnd=%d streamGroupMode=%u";
        v12 = v9;
        v13 = 40;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCMediaStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_streamGroupMode;
        *(_DWORD *)buf = 136316674;
        v27 = v14;
        v28 = 2080;
        v29 = "-[VCMediaStreamSendGroup dispatchedUpdateStreamsWithActiveConnection:]";
        v30 = 1024;
        v31 = 374;
        v32 = 2112;
        *(_QWORD *)v33 = v7;
        *(_WORD *)&v33[8] = 2048;
        v34 = self;
        v35 = 1024;
        v36 = IsEndToEndLink;
        v37 = 1024;
        v38 = v16;
        v11 = " [%s] %s:%d %@(%p) Updating active connection connectionIsEndToEnd=%d streamGroupMode=%u";
        v12 = v15;
        v13 = 60;
        goto LABEL_11;
      }
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v6);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "stream"), "handleActiveConnectionChange:", a3);
      }
      v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v18);
  }
}

- (void)setActiveConnection:(id)a3 uplinkBitrateCap:(unsigned int)a4 activeMediaStreamIDs:(id)a5 mediaBitrates:(id)a6 rateChangeCounter:(unsigned int)a7
{
  NSObject *stateQueue;
  _QWORD v8[8];
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __116__VCMediaStreamSendGroup_setActiveConnection_uplinkBitrateCap_activeMediaStreamIDs_mediaBitrates_rateChangeCounter___block_invoke;
  v8[3] = &unk_1E9E56DF8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a5;
  v8[7] = a6;
  v9 = a4;
  v10 = a7;
  dispatch_async(stateQueue, v8);
}

uint64_t __116__VCMediaStreamSendGroup_setActiveConnection_uplinkBitrateCap_activeMediaStreamIDs_mediaBitrates_rateChangeCounter___block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  _BYTE v14[24];
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateStreamsWithActiveConnection:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 64) < *(_DWORD *)(result + 440))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, v17);
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, v17);
      v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 440);
      *(_DWORD *)v14 = 136315906;
      *(_QWORD *)&v14[4] = v4;
      *(_WORD *)&v14[12] = 2080;
      *(_QWORD *)&v14[14] = "-[VCMediaStreamSendGroup setActiveConnection:uplinkBitrateCap:activeMediaStreamIDs:mediaBitr"
                            "ates:rateChangeCounter:]_block_invoke";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 390;
      WORD2(v15) = 1024;
      *(_DWORD *)((char *)&v15 + 6) = v6;
      v7 = " [%s] %s:%d Updating active streams for active connection change %d.";
      v8 = v5;
      v9 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, v17);
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, v17);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_DWORD *)(v12 + 440);
      *(_DWORD *)v14 = 136316418;
      *(_QWORD *)&v14[4] = v10;
      *(_WORD *)&v14[12] = 2080;
      *(_QWORD *)&v14[14] = "-[VCMediaStreamSendGroup setActiveConnection:uplinkBitrateCap:activeMediaStreamIDs:mediaBitr"
                            "ates:rateChangeCounter:]_block_invoke";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 390;
      WORD2(v15) = 2112;
      *(_QWORD *)((char *)&v15 + 6) = v3;
      HIWORD(v15) = 2048;
      v16 = v12;
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = v13;
      v7 = " [%s] %s:%d %@(%p) Updating active streams for active connection change %d.";
      v8 = v11;
      v9 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v14, v9);
    return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, v17);
  }
  return result;
}

- (id)activeStreamKeys
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStreamSendGroup activeStreamKeys]"), 0));
}

- (unsigned)calculateUplinkTotalBitrateForMediaStreams:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (*(&self->super._ignoreMKINotifications + 4)
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "defaultStreamConfig"), "multiwayConfig"), "repairedMaxNetworkBitrate"))
        {
          v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "defaultStreamConfig"), "multiwayConfig"), "repairedMaxNetworkBitrate");
        }
        else
        {
          v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "defaultStreamConfig"), "multiwayConfig"), "maxNetworkBitrate");
        }
        v7 += v11;
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  self->_currentUplinkTotalBitrate = v7;
  return v7;
}

- (void)updateActiveStreamsCount:(unsigned int)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 areStreamsSuspended;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  BOOL v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BYTE v41[10];
  VCMediaStreamSendGroup *v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  _BOOL4 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        areStreamsSuspended = self->super._areStreamsSuspended;
        *(_DWORD *)buf = 136316162;
        v35 = v6;
        v36 = 2080;
        v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
        v38 = 1024;
        v39 = 413;
        v40 = 1024;
        *(_DWORD *)v41 = a3;
        *(_WORD *)&v41[4] = 1024;
        *(_DWORD *)&v41[6] = areStreamsSuspended;
        v9 = " [%s] %s:%d Active stream count %d, streams currently suspended: %d";
        v10 = v7;
        v11 = 40;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMediaStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->super._areStreamsSuspended;
        *(_DWORD *)buf = 136316674;
        v35 = v12;
        v36 = 2080;
        v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
        v38 = 1024;
        v39 = 413;
        v40 = 2112;
        *(_QWORD *)v41 = v5;
        *(_WORD *)&v41[8] = 2048;
        v42 = self;
        v43 = 1024;
        v44 = a3;
        v45 = 1024;
        v46 = v14;
        v9 = " [%s] %s:%d %@(%p) Active stream count %d, streams currently suspended: %d";
        v10 = v13;
        v11 = 60;
        goto LABEL_11;
      }
    }
  }
  if (!a3)
  {
    if (self->super._areStreamsSuspended)
      return;
    if (-[VCMediaStreamGroup state](self, "state") != 1)
      goto LABEL_42;
    if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_41;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      *(_DWORD *)buf = 136315650;
      v35 = v25;
      v36 = 2080;
      v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
      v38 = 1024;
      v39 = 416;
      v27 = " [%s] %s:%d Active stream count has dropped to zero. Will signal delegate that streams have suspended.";
      v28 = v26;
      v29 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCMediaStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_41;
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      *(_DWORD *)buf = 136316162;
      v35 = v30;
      v36 = 2080;
      v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
      v38 = 1024;
      v39 = 416;
      v40 = 2112;
      *(_QWORD *)v41 = v16;
      *(_WORD *)&v41[8] = 2048;
      v42 = self;
      v27 = " [%s] %s:%d %@(%p) Active stream count has dropped to zero. Will signal delegate that streams have suspended.";
      v28 = v31;
      v29 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
LABEL_41:
    -[VCMediaStreamGroup stopCapture](self, "stopCapture");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __51__VCMediaStreamSendGroup_updateActiveStreamsCount___block_invoke;
    v33[3] = &unk_1E9E52A28;
    v33[4] = self;
    -[VCMediaStreamGroup callDelegateWithBlock:](self, "callDelegateWithBlock:", v33);
LABEL_42:
    v24 = 1;
    goto LABEL_43;
  }
  if (!self->super._areStreamsSuspended)
    return;
  if (-[VCMediaStreamGroup state](self, "state") != 1)
    goto LABEL_32;
  if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_31;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 136315650;
    v35 = v17;
    v36 = 2080;
    v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
    v38 = 1024;
    v39 = 426;
    v19 = " [%s] %s:%d Active stream count is no longer zero. Will signal delegate that streams will be resumed.";
    v20 = v18;
    v21 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCMediaStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_31;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 136316162;
    v35 = v22;
    v36 = 2080;
    v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
    v38 = 1024;
    v39 = 426;
    v40 = 2112;
    *(_QWORD *)v41 = v15;
    *(_WORD *)&v41[8] = 2048;
    v42 = self;
    v19 = " [%s] %s:%d %@(%p) Active stream count is no longer zero. Will signal delegate that streams will be resumed.";
    v20 = v23;
    v21 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_31:
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __51__VCMediaStreamSendGroup_updateActiveStreamsCount___block_invoke_65;
  v32[3] = &unk_1E9E52A28;
  v32[4] = self;
  -[VCMediaStreamGroup callDelegateWithBlock:](self, "callDelegateWithBlock:", v32);
  -[VCMediaStreamGroup startCapture](self, "startCapture");
LABEL_32:
  v24 = 0;
LABEL_43:
  self->super._areStreamsSuspended = v24;
}

uint64_t __51__VCMediaStreamSendGroup_updateActiveStreamsCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "streamGroup:didSuspendStreams:", *(_QWORD *)(a1 + 32), 1);
}

uint64_t __51__VCMediaStreamSendGroup_updateActiveStreamsCount___block_invoke_65(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "streamGroup:didSuspendStreams:", *(_QWORD *)(a1 + 32), 0);
}

- (void)didStart
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaStreamSendGroup updateEnabledState](self, "updateEnabledState");
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSendGroup;
  -[VCMediaStreamGroup didStart](&v3, sel_didStart);
}

- (void)didStop
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaStreamSendGroup updateEnabledState](self, "updateEnabledState");
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSendGroup;
  -[VCMediaStreamGroup didStop](&v3, sel_didStop);
}

- (void)didPause:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  -[VCMediaStreamSendGroup updateEnabledState](self, "updateEnabledState");
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamSendGroup;
  -[VCMediaStreamGroup didPause:](&v5, sel_didPause_, v3);
}

- (void)setStatisticsCollector:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCMediaStreamSendGroup_setStatisticsCollector___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

_QWORD *__49__VCMediaStreamSendGroup_setStatisticsCollector___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[4] + 232);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    if (objc_msgSend(*(id *)(v2[4] + 464), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v2[4] + 472))))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v2[4] + 464), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v2[4] + 472))), "setStatisticsCollector:", v2[5]);
    }
    result = (id)v2[5];
    *(_QWORD *)(v2[4] + 232) = result;
  }
  return result;
}

- (void)didReceiveRTCPPackets:(_RTCPPacketList *)a3
{
  NSObject *stateQueue;
  _QWORD block[7];
  _QWORD v7[4];
  CFTypeRef v8[206];

  v8[205] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x68810000000;
  v7[3] = "";
  memset(v8, 170, 0x668uLL);
  RTCPShallowCopyPacketList(a3, v8);
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCMediaStreamSendGroup_didReceiveRTCPPackets___block_invoke;
  block[3] = &unk_1E9E55810;
  block[4] = self;
  block[5] = v7;
  block[6] = a3;
  dispatch_async(stateQueue, block);
  _Block_object_dispose(v7, 8);
}

void __48__VCMediaStreamSendGroup_didReceiveRTCPPackets___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 472) == 1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(unsigned __int8 *)(v2 + 40);
    if (*(_BYTE *)(v2 + 40))
    {
      v4 = 0;
      v5 = v2 + 48;
      while (1)
      {
        v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 8 * v4) + 1);
        if ((v6 - 245) < 2)
        {
          objc_msgSend(*(id *)(a1 + 32), "didReceiveCustomReportPacket:arrivalNTPTime:");
          goto LABEL_10;
        }
        if ((v6 - 200) <= 1)
          break;
        if (++v4 >= v3)
          goto LABEL_10;
      }
      objc_msgSend(*(id *)(a1 + 32), "didReceiveReportPacket:arrivalNTPTime:");
    }
  }
LABEL_10:
  RTCPCleanupPacketList(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
}

- (unsigned)currentUplinkTotalBitrate
{
  return self->_currentUplinkTotalBitrate;
}

- (void)setCurrentUplinkTotalBitrate:(unsigned int)a3
{
  self->_currentUplinkTotalBitrate = a3;
}

- (unsigned)currentUplinkTargetBitrate
{
  return self->_uplinkBitrateCapCell;
}

- (unsigned)uplinkBitrateCapCell
{
  return self->_uplinkBitrateCapWifi;
}

- (void)setUplinkBitrateCapCell:(unsigned int)a3
{
  self->_uplinkBitrateCapWifi = a3;
}

- (unsigned)uplinkBitrateCapWifi
{
  return *(_DWORD *)&self->_isRedundancyEnabled;
}

- (void)setUplinkBitrateCapWifi:(unsigned int)a3
{
  *(_DWORD *)&self->_isRedundancyEnabled = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void)setIsSuspended:(BOOL)a3
{
  self->_isSuspended = a3;
}

- (VCRedundancyControllerProtocol)redundancyController
{
  return self->_redundancyController;
}

- (void)setRedundancyController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (BOOL)isRetransmissionEnabled
{
  return self->_isRetransmissionEnabled;
}

- (void)initWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate peer subscribed streams", v2, v3, v4, v5, v6);
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
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The dictionary for stream send group config for stream mode is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to configure streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupWithConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup streams with configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
