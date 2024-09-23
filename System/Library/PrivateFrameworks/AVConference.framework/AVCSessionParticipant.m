@implementation AVCSessionParticipant

- (AVCSessionParticipant)initWithParticipantID:(unint64_t)a3 data:(id)a4 delegate:(id)a5 queue:(id)a6
{
  AVCSessionParticipant *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  VCPositionalInfo *v19;
  NSMutableDictionary *v20;
  uint64_t v21;
  NSData *v22;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  AVCSessionParticipant *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)AVCSessionParticipant;
  v10 = -[AVCSessionParticipant init](&v38, sel_init);
  if (v10)
  {
    if ((AVCSessionParticipant *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v40 = v12;
          v41 = 2080;
          v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
          v43 = 1024;
          v44 = 81;
          v14 = " [%s] %s:%d ";
          v15 = v13;
          v16 = 28;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[AVCSessionParticipant performSelector:](v10, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v40 = v17;
          v41 = 2080;
          v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
          v43 = 1024;
          v44 = 81;
          v45 = 2112;
          v46 = v11;
          v47 = 2048;
          v48 = v10;
          v14 = " [%s] %s:%d %@(%p) ";
          v15 = v18;
          v16 = 48;
          goto LABEL_12;
        }
      }
    }
    v10->_videoQuality = 5;
    v10->_idsParticipantID = a3;
    if (a4)
    {
      v19 = objc_alloc_init(VCPositionalInfo);
      v10->_videoPositionalInfo = v19;
      if (v19)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v10->_mediaStates = v20;
        if (v20)
        {
          if (VCDefaults_GetBoolValueForKey(CFSTR("forceLoopback"), 0))
            a4 = +[AVCSessionParticipant loopbackNegotiationDataWithData:](AVCSessionParticipant, "loopbackNegotiationDataWithData:", a4);
          v21 = objc_msgSend((id)objc_msgSend(+[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", a4), "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyUUID")), "copy");
          v10->_participantID = (NSString *)v21;
          if (v21)
          {
            v22 = (NSData *)+[VCSessionParticipant participantDataWithParticipantData:isReinit:](VCSessionParticipant, "participantDataWithParticipantData:isReinit:", a4, a3 == 0);
            v10->_participantData = v22;
            if (v22)
            {
              if (-[AVCSessionParticipant setupMediaStates](v10, "setupMediaStates"))
              {
                pthread_mutex_init(&v10->_mediaStateMutex, 0);
                objc_storeWeak(&v10->_delegate, a5);
                -[AVCSessionParticipant setupNotificationQueue:](v10, "setupNotificationQueue:", a6);
                -[AVCSessionParticipant setupConfig](v10, "setupConfig");
                return v10;
              }
              if ((AVCSessionParticipant *)objc_opt_class() == v10)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:].cold.6();
                }
                goto LABEL_84;
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v29 = (const __CFString *)-[AVCSessionParticipant performSelector:](v10, "performSelector:", sel_logPrefix);
              else
                v29 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                v37 = VRTraceErrorLogLevelToCSTR();
                v31 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  v40 = v37;
                  v41 = 2080;
                  v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
                  v43 = 1024;
                  v44 = 99;
                  v45 = 2112;
                  v46 = v29;
                  v47 = 2048;
                  v48 = v10;
                  v32 = " [%s] %s:%d %@(%p) Failed to initialize the media states";
                  goto LABEL_83;
                }
              }
LABEL_84:

              return 0;
            }
            if ((AVCSessionParticipant *)objc_opt_class() == v10)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:].cold.5();
              }
              goto LABEL_84;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v28 = (const __CFString *)-[AVCSessionParticipant performSelector:](v10, "performSelector:", sel_logPrefix);
            else
              v28 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_84;
            v36 = VRTraceErrorLogLevelToCSTR();
            v31 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              goto LABEL_84;
            *(_DWORD *)buf = 136316162;
            v40 = v36;
            v41 = 2080;
            v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
            v43 = 1024;
            v44 = 97;
            v45 = 2112;
            v46 = v28;
            v47 = 2048;
            v48 = v10;
            v32 = " [%s] %s:%d %@(%p) The participant data is nil";
          }
          else
          {
            if ((AVCSessionParticipant *)objc_opt_class() == v10)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:].cold.4();
              }
              goto LABEL_84;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v27 = (const __CFString *)-[AVCSessionParticipant performSelector:](v10, "performSelector:", sel_logPrefix);
            else
              v27 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_84;
            v35 = VRTraceErrorLogLevelToCSTR();
            v31 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              goto LABEL_84;
            *(_DWORD *)buf = 136316162;
            v40 = v35;
            v41 = 2080;
            v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
            v43 = 1024;
            v44 = 95;
            v45 = 2112;
            v46 = v27;
            v47 = 2048;
            v48 = v10;
            v32 = " [%s] %s:%d %@(%p) The participant ID is nil";
          }
        }
        else
        {
          if ((AVCSessionParticipant *)objc_opt_class() == v10)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:].cold.3();
            }
            goto LABEL_84;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v26 = (const __CFString *)-[AVCSessionParticipant performSelector:](v10, "performSelector:", sel_logPrefix);
          else
            v26 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_84;
          v34 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_84;
          *(_DWORD *)buf = 136316162;
          v40 = v34;
          v41 = 2080;
          v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
          v43 = 1024;
          v44 = 88;
          v45 = 2112;
          v46 = v26;
          v47 = 2048;
          v48 = v10;
          v32 = " [%s] %s:%d %@(%p) Failed to allocate the media states dictionary";
        }
      }
      else
      {
        if ((AVCSessionParticipant *)objc_opt_class() == v10)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:].cold.2();
          }
          goto LABEL_84;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v25 = (const __CFString *)-[AVCSessionParticipant performSelector:](v10, "performSelector:", sel_logPrefix);
        else
          v25 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_84;
        v33 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_84;
        *(_DWORD *)buf = 136316162;
        v40 = v33;
        v41 = 2080;
        v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
        v43 = 1024;
        v44 = 86;
        v45 = 2112;
        v46 = v25;
        v47 = 2048;
        v48 = v10;
        v32 = " [%s] %s:%d %@(%p) Failed to allocate the positional info";
      }
    }
    else
    {
      if ((AVCSessionParticipant *)objc_opt_class() == v10)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:].cold.1();
        }
        goto LABEL_84;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[AVCSessionParticipant performSelector:](v10, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_84;
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_84;
      *(_DWORD *)buf = 136316162;
      v40 = v30;
      v41 = 2080;
      v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
      v43 = 1024;
      v44 = 84;
      v45 = 2112;
      v46 = v24;
      v47 = 2048;
      v48 = v10;
      v32 = " [%s] %s:%d %@(%p) Participant Data is nil";
    }
LABEL_83:
    _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x30u);
    goto LABEL_84;
  }
  return v10;
}

- (void)dealloc
{
  NSObject *delegateNotificationQueue;
  NSObject *stateQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_delegate, 0);
  delegateNotificationQueue = self->_delegateNotificationQueue;
  if (delegateNotificationQueue)
    dispatch_release(delegateNotificationQueue);
  objc_storeWeak((id *)&self->_connection, 0);

  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);
  pthread_mutex_destroy(&self->_mediaStateMutex);
  v5.receiver = self;
  v5.super_class = (Class)AVCSessionParticipant;
  -[AVCSessionParticipant dealloc](&v5, sel_dealloc);
}

+ (BOOL)isMediaStateAPISupportedForMediaType:(unsigned int)a3
{
  return a3 - 4 < 5;
}

- (NSString)description
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;
  objc_class *v6;

  v3 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5528), "unsignedIntValue") != 0;
  v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5540), "unsignedIntValue") != 0;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@[%p] idsParticipantID[%llu] _participantID[%@] _hasPendingChanges[%d] audioEnabled[%d] videoEnabled[%d] videoQuality[%d] visibilityIndex[%d] promienceIndex[%d] participantData[%@]"), NSStringFromClass(v6), self, self->_idsParticipantID, self->_participantID, self->_hasPendingChanges, v3, v4, self->_videoQuality, self->_visibilityIndex, self->_prominenceIndex, self->_participantData);
}

- (void)setMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *stateQueue;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  NSString *participantID;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  NSString *v21;
  _QWORD v22[5];
  int v23;
  int v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  AVCSessionParticipant *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  uint64_t v41;

  v4 = *(_QWORD *)&a3;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = VCSessionMediaType_FromAVCSessionMediaType(*(uint64_t *)&a4);
  v7 = VCSessionMediaState_FromAVCSessionMediaState(v4);
  if (!-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    pthread_mutex_lock(&self->_mediaStateMutex);
    v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6)), "unsignedIntValue");
    v10 = VCSessionMediaState_Name(v7);
    v11 = VCSessionMediaType_Name(v6);
    if ((AVCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_15;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      participantID = self->_participantID;
      *(_DWORD *)buf = 136316418;
      v26 = v13;
      v27 = 2080;
      v28 = "-[AVCSessionParticipant setMediaState:forMediaType:]";
      v29 = 1024;
      v30 = 184;
      v31 = 2112;
      v32 = (const __CFString *)participantID;
      v33 = 2112;
      v34 = (AVCSessionParticipant *)v11;
      v35 = 2112;
      v36 = v10;
      v16 = " [%s] %s:%d ParticipantID=%@ mediaType=%@ mediaState=%@";
      v17 = v14;
      v18 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_15;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v21 = self->_participantID;
      *(_DWORD *)buf = 136316930;
      v26 = v19;
      v27 = 2080;
      v28 = "-[AVCSessionParticipant setMediaState:forMediaType:]";
      v29 = 1024;
      v30 = 184;
      v31 = 2112;
      v32 = v12;
      v33 = 2048;
      v34 = self;
      v35 = 2112;
      v36 = (__CFString *)v21;
      v37 = 2112;
      v38 = v11;
      v39 = 2112;
      v40 = v10;
      v16 = " [%s] %s:%d %@(%p) ParticipantID=%@ mediaType=%@ mediaState=%@";
      v17 = v20;
      v18 = 78;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_15:
    -[AVCSessionParticipant storeMediaState:forMediaType:](self, "storeMediaState:forMediaType:", v7, v6);
    pthread_mutex_unlock(&self->_mediaStateMutex);
    -[AVCSessionParticipant stateTransitionForMediaType:mediaState:previousState:didSucceed:error:](self, "stateTransitionForMediaType:mediaState:previousState:didSucceed:error:", v6, v7, v9, 1, 0);
    return;
  }
  stateQueue = self->_stateQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__AVCSessionParticipant_setMediaState_forMediaType___block_invoke;
  v22[3] = &unk_1E9E52960;
  v22[4] = self;
  v23 = v6;
  v24 = v7;
  if (stateQueue)
    dispatch_async(stateQueue, v22);
}

uint64_t __52__AVCSessionParticipant_setMediaState_forMediaType___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  __CFString *v16;
  char *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  __CFString *v31;
  char *data;
  _BYTE v33[24];
  __int128 v34;
  __CFString *v35;
  _BYTE v36[32];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 152));
  v2 = VCSessionMediaType_Name(*(unsigned int *)(a1 + 40));
  v3 = VCSessionMediaState_Name(*(unsigned int *)(a1 + 44));
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40))), "unsignedIntValue");
  v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40)));
  if (v5 && objc_msgSend(v5, "unsignedIntValue") == *(_DWORD *)(a1 + 44))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_28;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)v33 = 136316418;
      *(_QWORD *)&v33[4] = v23;
      *(_WORD *)&v33[12] = 2080;
      *(_QWORD *)&v33[14] = "-[AVCSessionParticipant setMediaState:forMediaType:]_block_invoke";
      *(_WORD *)&v33[22] = 1024;
      LODWORD(v34) = 199;
      WORD2(v34) = 2112;
      *(_QWORD *)((char *)&v34 + 6) = v25;
      HIWORD(v34) = 2112;
      v35 = v2;
      *(_WORD *)v36 = 2112;
      *(_QWORD *)&v36[2] = v3;
      v26 = " [%s] %s:%d ParticipantID=%@ mediaType=%@ is already in mediaState=%@";
      v27 = v24;
      v28 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_28;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v31 = *(__CFString **)(a1 + 32);
      data = v31->data;
      *(_DWORD *)v33 = 136316930;
      *(_QWORD *)&v33[4] = v29;
      *(_WORD *)&v33[12] = 2080;
      *(_QWORD *)&v33[14] = "-[AVCSessionParticipant setMediaState:forMediaType:]_block_invoke";
      *(_WORD *)&v33[22] = 1024;
      LODWORD(v34) = 199;
      WORD2(v34) = 2112;
      *(_QWORD *)((char *)&v34 + 6) = v6;
      HIWORD(v34) = 2048;
      v35 = v31;
      *(_WORD *)v36 = 2112;
      *(_QWORD *)&v36[2] = data;
      *(_WORD *)&v36[10] = 2112;
      *(_QWORD *)&v36[12] = v2;
      *(_WORD *)&v36[20] = 2112;
      *(_QWORD *)&v36[22] = v3;
      v26 = " [%s] %s:%d %@(%p) ParticipantID=%@ mediaType=%@ is already in mediaState=%@";
      v27 = v30;
      v28 = 78;
    }
    _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, v33, v28);
LABEL_28:
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 152));
    return objc_msgSend(*(id *)(a1 + 32), "stateTransitionForMediaType:mediaState:previousState:didSucceed:error:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), v4, 1, 0);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 152));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_17;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)v33 = 136316418;
    *(_QWORD *)&v33[4] = v8;
    *(_WORD *)&v33[12] = 2080;
    *(_QWORD *)&v33[14] = "-[AVCSessionParticipant setMediaState:forMediaType:]_block_invoke";
    *(_WORD *)&v33[22] = 1024;
    LODWORD(v34) = 205;
    WORD2(v34) = 2112;
    *(_QWORD *)((char *)&v34 + 6) = v10;
    HIWORD(v34) = 2112;
    v35 = v2;
    *(_WORD *)v36 = 2112;
    *(_QWORD *)&v36[2] = v3;
    v11 = " [%s] %s:%d ParticipantID=%@ mediaType=%@ mediaState=%@";
    v12 = v9;
    v13 = 58;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_17;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v16 = *(__CFString **)(a1 + 32);
    v17 = v16->data;
    *(_DWORD *)v33 = 136316930;
    *(_QWORD *)&v33[4] = v14;
    *(_WORD *)&v33[12] = 2080;
    *(_QWORD *)&v33[14] = "-[AVCSessionParticipant setMediaState:forMediaType:]_block_invoke";
    *(_WORD *)&v33[22] = 1024;
    LODWORD(v34) = 205;
    WORD2(v34) = 2112;
    *(_QWORD *)((char *)&v34 + 6) = v7;
    HIWORD(v34) = 2048;
    v35 = v16;
    *(_WORD *)v36 = 2112;
    *(_QWORD *)&v36[2] = v17;
    *(_WORD *)&v36[10] = 2112;
    *(_QWORD *)&v36[12] = v2;
    *(_WORD *)&v36[20] = 2112;
    *(_QWORD *)&v36[22] = v3;
    v11 = " [%s] %s:%d %@(%p) ParticipantID=%@ mediaType=%@ mediaState=%@";
    v12 = v15;
    v13 = 78;
  }
  _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v33, v13);
LABEL_17:
  v18 = +[AVCSessionParticipant isMediaStateAPISupportedForMediaType:](AVCSessionParticipant, "isMediaStateAPISupportedForMediaType:", *(unsigned int *)(a1 + 40), *(_OWORD *)v33, *(_QWORD *)&v33[16], v34, v35, *(_OWORD *)v36, *(_OWORD *)&v36[16]);
  v19 = *(void **)(a1 + 32);
  v21 = *(unsigned int *)(a1 + 40);
  v20 = *(unsigned int *)(a1 + 44);
  if (v18)
    return objc_msgSend(v19, "dispatchedSetMediaState:forMediaType:", v20, v21);
  else
    return objc_msgSend(v19, "dispatchedLegacySetMediaState:forMediaType:", v20, v21);
}

- (unsigned)mediaStateForMediaType:(unsigned int)a3
{
  uint64_t v3;
  _opaque_pthread_mutex_t *p_mediaStateMutex;
  uint64_t v6;

  v3 = *(_QWORD *)&a3;
  p_mediaStateMutex = &self->_mediaStateMutex;
  pthread_mutex_lock(&self->_mediaStateMutex);
  v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "unsignedIntValue");
  pthread_mutex_unlock(p_mediaStateMutex);
  return VCSessionMediaState_FromAVCSessionMediaState(v6);
}

- (void)setAudioMuted:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__AVCSessionParticipant_setAudioMuted___block_invoke;
    block[3] = &unk_1E9E521E8;
    block[4] = self;
    v7 = v3;
    if (stateQueue)
      dispatch_async(stateQueue, block);
  }
  else
  {
    self->_audioMuted = v3;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("vcSessionParameterMute"));
  }
}

void __39__AVCSessionParticipant_setAudioMuted___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  _QWORD v29[2];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v16 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v31 = v14;
      v32 = 2080;
      v33 = "-[AVCSessionParticipant setAudioMuted:]_block_invoke";
      v34 = 1024;
      v35 = 234;
      v36 = 1024;
      LODWORD(v37) = v16;
      v17 = " [%s] %s:%d audioMuted[%d]";
      v18 = v15;
      v19 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v31 = v24;
      v32 = 2080;
      v33 = "-[AVCSessionParticipant setAudioMuted:]_block_invoke";
      v34 = 1024;
      v35 = 234;
      v36 = 2112;
      v37 = v7;
      v38 = 2048;
      v39 = v26;
      v40 = 1024;
      v41 = v27;
      v17 = " [%s] %s:%d %@(%p) audioMuted[%d]";
      v18 = v25;
      v19 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_24:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = *(_BYTE *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)), CFSTR("vcSessionParameterMute"));
    v29[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40), CFSTR("vcSessionParticipantID"), CFSTR("vcSessionParameterMute"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetMute", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 2));
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v31 = v8;
        v32 = 2080;
        v33 = "-[AVCSessionParticipant setAudioMuted:]_block_invoke";
        v34 = 1024;
        v35 = 231;
        v36 = 1024;
        LODWORD(v37) = v10;
        v11 = " [%s] %s:%d Participant audio is already muted [%d]";
        v12 = v9;
        v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v31 = v20;
        v32 = 2080;
        v33 = "-[AVCSessionParticipant setAudioMuted:]_block_invoke";
        v34 = 1024;
        v35 = 231;
        v36 = 2112;
        v37 = v6;
        v38 = 2048;
        v39 = v22;
        v40 = 1024;
        v41 = v23;
        v11 = " [%s] %s:%d %@(%p) Participant audio is already muted [%d]";
        v12 = v21;
        v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (BOOL)isAudioEnabled
{
  return -[AVCSessionParticipant isEnabledMediaType:](self, "isEnabledMediaType:", 0);
}

- (void)setAudioEnabled:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  OS_dispatch_queue *v6;
  _QWORD v7[6];

  v3 = a3;
  v7[5] = *MEMORY[0x1E0C80C00];
  v5 = -[AVCSessionParticipant mediaStateForMediaType:](self, "mediaStateForMediaType:", 0);
  if (v3 && v5 == 2)
  {
    v6 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__AVCSessionParticipant_setAudioEnabled___block_invoke;
    v7[3] = &unk_1E9E521C0;
    v7[4] = self;
    dispatch_async((dispatch_queue_t)v6, v7);
  }
  else
  {
    -[AVCSessionParticipant setMediaState:forMediaType:](self, "setMediaState:forMediaType:", v3, 0);
  }
}

uint64_t __41__AVCSessionParticipant_setAudioEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLegacyTransitionsForMediaType:mediaState:previousState:didSucceed:error:", 0, 1, 1, 1, 0);
}

- (BOOL)isVideoEnabled
{
  return -[AVCSessionParticipant isEnabledMediaType:](self, "isEnabledMediaType:", 1);
}

- (void)setVideoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  OS_dispatch_queue *v6;
  _QWORD v7[6];

  v3 = a3;
  v7[5] = *MEMORY[0x1E0C80C00];
  v5 = -[AVCSessionParticipant mediaStateForMediaType:](self, "mediaStateForMediaType:", 1);
  if (v3 && v5 == 2)
  {
    v6 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__AVCSessionParticipant_setVideoEnabled___block_invoke;
    v7[3] = &unk_1E9E521C0;
    v7[4] = self;
    dispatch_async((dispatch_queue_t)v6, v7);
  }
  else
  {
    -[AVCSessionParticipant setMediaState:forMediaType:](self, "setMediaState:forMediaType:", v3, 1);
  }
}

uint64_t __41__AVCSessionParticipant_setVideoEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLegacyTransitionsForMediaType:mediaState:previousState:didSucceed:error:", 1, 1, 1, 1, 0);
}

- (BOOL)isScreenEnabled
{
  return -[AVCSessionParticipant isEnabledMediaType:](self, "isEnabledMediaType:", 2);
}

- (void)setScreenEnabled:(BOOL)a3
{
  -[AVCSessionParticipant setMediaState:forMediaType:](self, "setMediaState:forMediaType:", a3, 2);
}

- (BOOL)isAudioPaused
{
  return -[AVCSessionParticipant isPausedMediaType:](self, "isPausedMediaType:", 0);
}

- (void)setAudioPaused:(BOOL)a3
{
  uint64_t v5;
  unsigned int v6;
  OS_dispatch_queue *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = 2;
  else
    v5 = 1;
  v6 = -[AVCSessionParticipant mediaStateForMediaType:](self, "mediaStateForMediaType:", 0);
  if (!v6)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32026, 0, CFSTR("Invalid transition"));
    v7 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__AVCSessionParticipant_setAudioPaused___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = v9;
    v8 = block;
    goto LABEL_9;
  }
  if (v6 == 1 && !a3)
  {
    v7 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__AVCSessionParticipant_setAudioPaused___block_invoke_2;
    v10[3] = &unk_1E9E521C0;
    v10[4] = self;
    v8 = v10;
LABEL_9:
    dispatch_async((dispatch_queue_t)v7, v8);
    return;
  }
  -[AVCSessionParticipant setMediaState:forMediaType:](self, "setMediaState:forMediaType:", v5, 0);
}

uint64_t __40__AVCSessionParticipant_setAudioPaused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLegacyTransitionsForMediaType:mediaState:previousState:didSucceed:error:", 0, 1, 2, 0, *(_QWORD *)(a1 + 40));
}

uint64_t __40__AVCSessionParticipant_setAudioPaused___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLegacyTransitionsForMediaType:mediaState:previousState:didSucceed:error:", 0, 1, 2, 1, 0);
}

- (BOOL)isVideoPaused
{
  return -[AVCSessionParticipant isPausedMediaType:](self, "isPausedMediaType:", 1);
}

- (void)setVideoPaused:(BOOL)a3
{
  uint64_t v5;
  unsigned int v6;
  OS_dispatch_queue *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = 2;
  else
    v5 = 1;
  v6 = -[AVCSessionParticipant mediaStateForMediaType:](self, "mediaStateForMediaType:", 1);
  if (!v6)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32026, 0, CFSTR("Invalid transition"));
    v7 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__AVCSessionParticipant_setVideoPaused___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = v9;
    v8 = block;
    goto LABEL_9;
  }
  if (v6 == 1 && !a3)
  {
    v7 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__AVCSessionParticipant_setVideoPaused___block_invoke_2;
    v10[3] = &unk_1E9E521C0;
    v10[4] = self;
    v8 = v10;
LABEL_9:
    dispatch_async((dispatch_queue_t)v7, v8);
    return;
  }
  -[AVCSessionParticipant setMediaState:forMediaType:](self, "setMediaState:forMediaType:", v5, 1);
}

uint64_t __40__AVCSessionParticipant_setVideoPaused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLegacyTransitionsForMediaType:mediaState:previousState:didSucceed:error:", 1, 1, 2, 0, *(_QWORD *)(a1 + 40));
}

uint64_t __40__AVCSessionParticipant_setVideoPaused___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLegacyTransitionsForMediaType:mediaState:previousState:didSucceed:error:", 1, 1, 2, 1, 0);
}

- (void)setVolume:(float)a3
{
  double v5;
  NSObject *stateQueue;
  _QWORD block[5];
  float v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__AVCSessionParticipant_setVolume___block_invoke;
    block[3] = &unk_1E9E52300;
    block[4] = self;
    v8 = a3;
    if (stateQueue)
      dispatch_async(stateQueue, block);
  }
  else
  {
    self->_volume = a3;
    *(float *)&v5 = a3;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("vcSessionParameterVolume"));
  }
}

void __35__AVCSessionParticipant_setVolume___block_invoke(uint64_t a1)
{
  float v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  double v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  double v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = *(float *)(*(_QWORD *)(a1 + 32) + 108);
  v3 = *(float *)(a1 + 40);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v21 = *(float *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v34 = v19;
      v35 = 2080;
      v36 = "-[AVCSessionParticipant setVolume:]_block_invoke";
      v37 = 1024;
      v38 = 341;
      v39 = 2048;
      v40 = v21;
      v22 = " [%s] %s:%d volume[%f]";
      v23 = v20;
      v24 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(float *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v34 = v25;
      v35 = 2080;
      v36 = "-[AVCSessionParticipant setVolume:]_block_invoke";
      v37 = 1024;
      v38 = 341;
      v39 = 2112;
      v40 = *(double *)&v7;
      v41 = 2048;
      v42 = v27;
      v43 = 2048;
      v44 = v28;
      v22 = " [%s] %s:%d %@(%p) volume[%f]";
      v23 = v26;
      v24 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_24:
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 108) = *(_DWORD *)(a1 + 40);
    LODWORD(v18) = *(_DWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18), CFSTR("vcSessionParameterVolume"));
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v31[1] = CFSTR("vcSessionParameterVolume");
    v32[0] = v29;
    v31[0] = CFSTR("vcSessionParticipantID");
    LODWORD(v30) = *(_DWORD *)(a1 + 40);
    v32[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30, CFSTR("vcSessionParticipantID"), CFSTR("vcSessionParameterVolume"), v29);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetVolume", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(float *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v34 = v8;
        v35 = 2080;
        v36 = "-[AVCSessionParticipant setVolume:]_block_invoke";
        v37 = 1024;
        v38 = 338;
        v39 = 2048;
        v40 = v10;
        v11 = " [%s] %s:%d Participant volume is already [%f]";
        v12 = v9;
        v13 = 38;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(float *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v34 = v14;
        v35 = 2080;
        v36 = "-[AVCSessionParticipant setVolume:]_block_invoke";
        v37 = 1024;
        v38 = 338;
        v39 = 2112;
        v40 = *(double *)&v6;
        v41 = 2048;
        v42 = v16;
        v43 = 2048;
        v44 = v17;
        v11 = " [%s] %s:%d %@(%p) Participant volume is already [%f]";
        v12 = v15;
        v13 = 58;
        goto LABEL_15;
      }
    }
  }
}

- (void)setVideoQuality:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *stateQueue;
  _QWORD block[5];
  char v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__AVCSessionParticipant_setVideoQuality___block_invoke;
    block[3] = &unk_1E9E521E8;
    block[4] = self;
    v7 = v3;
    if (stateQueue)
      dispatch_async(stateQueue, block);
  }
  else
  {
    self->_videoQuality = v3;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3), CFSTR("vcSessionParameterVideoQuality"));
  }
}

void __41__AVCSessionParticipant_setVideoQuality___block_invoke(uint64_t a1)
{
  id *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  int v37;
  id v38;
  int v39;
  uint64_t v40;
  _QWORD v41[2];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v43 = v4;
        v44 = 2080;
        v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
        v46 = 1024;
        v47 = 358;
        v48 = 1024;
        LODWORD(v49) = v6;
        v7 = " [%s] %s:%d videoQuality[%d]";
        v8 = v5;
        v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(void **)(a1 + 32);
        v13 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v43 = v10;
        v44 = 2080;
        v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
        v46 = 1024;
        v47 = 358;
        v48 = 2112;
        v49 = v3;
        v50 = 2048;
        v51 = v12;
        v52 = 1024;
        v53 = v13;
        v7 = " [%s] %s:%d %@(%p) videoQuality[%d]";
        v8 = v11;
        v9 = 54;
        goto LABEL_11;
      }
    }
  }
  v14 = *(unsigned __int8 *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  if (v14 == *(unsigned __int8 *)(v15 + 80))
  {
    if ((id)objc_opt_class() != *v2)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        v27 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            return;
          v28 = *v2;
          v29 = *((unsigned __int8 *)*v2 + 80);
          *(_DWORD *)buf = 136316418;
          v43 = v25;
          v44 = 2080;
          v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
          v46 = 1024;
          v47 = 360;
          v48 = 2112;
          v49 = v16;
          v50 = 2048;
          v51 = v28;
          v52 = 1024;
          v53 = v29;
          v23 = " [%s] %s:%d %@(%p) videoQuality is already at %d";
          v24 = v26;
          goto LABEL_38;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v38 = *v2;
          v39 = *((unsigned __int8 *)*v2 + 80);
          *(_DWORD *)buf = 136316418;
          v43 = v25;
          v44 = 2080;
          v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
          v46 = 1024;
          v47 = 360;
          v48 = 2112;
          v49 = v16;
          v50 = 2048;
          v51 = v38;
          v52 = 1024;
          v53 = v39;
          _os_log_debug_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) videoQuality is already at %d", buf, 0x36u);
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    v21 = *MEMORY[0x1E0CF2758];
    if (!*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __41__AVCSessionParticipant_setVideoQuality___block_invoke_cold_1();
      return;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      return;
    v22 = *((unsigned __int8 *)*v2 + 80);
    *(_DWORD *)buf = 136315906;
    v43 = v19;
    v44 = 2080;
    v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
    v46 = 1024;
    v47 = 360;
    v48 = 1024;
    LODWORD(v49) = v22;
    v23 = " [%s] %s:%d videoQuality is already at %d";
    v24 = v20;
LABEL_33:
    v33 = 34;
LABEL_39:
    _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v33);
    return;
  }
  *(_BYTE *)(v15 + 80) = v14;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 40)), CFSTR("vcSessionParameterVideoQuality"));
  v17 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v17 + 112))
  {
    v41[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v17 + 80), CFSTR("vcSessionParticipantID"), CFSTR("vcSessionParameterVideoQuality"), *(_QWORD *)(v17 + 16));
    objc_msgSend((id)objc_msgSend(*v2, "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetVideoQuality", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 2));
    return;
  }
  *(_BYTE *)(v17 + 113) = 1;
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v32 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v43 = v30;
    v44 = 2080;
    v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
    v46 = 1024;
    v47 = 370;
    v48 = 1024;
    LODWORD(v49) = v32;
    v23 = " [%s] %s:%d videoQuality[%d] is cached until endParticipantConfiguration is called.";
    v24 = v31;
    goto LABEL_33;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
  else
    v18 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(void **)(a1 + 32);
      v37 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v43 = v34;
      v44 = 2080;
      v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
      v46 = 1024;
      v47 = 370;
      v48 = 2112;
      v49 = v18;
      v50 = 2048;
      v51 = v36;
      v52 = 1024;
      v53 = v37;
      v23 = " [%s] %s:%d %@(%p) videoQuality[%d] is cached until endParticipantConfiguration is called.";
      v24 = v35;
LABEL_38:
      v33 = 54;
      goto LABEL_39;
    }
  }
}

- (void)setVisibilityIndex:(unsigned int)a3
{
  uint64_t v3;
  NSObject *stateQueue;
  _QWORD block[5];
  int v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__AVCSessionParticipant_setVisibilityIndex___block_invoke;
    block[3] = &unk_1E9E52300;
    block[4] = self;
    v7 = v3;
    if (stateQueue)
      dispatch_async(stateQueue, block);
  }
  else
  {
    self->_visibilityIndex = v3;
    -[VCPositionalInfo setIsVisible:](self->_videoPositionalInfo, "setIsVisible:", (_DWORD)v3 == 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3), CFSTR("vcSessionParameterVisibilityIndex"));
  }
}

void __44__AVCSessionParticipant_setVisibilityIndex___block_invoke(uint64_t a1)
{
  id *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  int v37;
  id v38;
  int v39;
  uint64_t v40;
  _QWORD v41[2];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v43 = v4;
        v44 = 2080;
        v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
        v46 = 1024;
        v47 = 385;
        v48 = 1024;
        LODWORD(v49) = v6;
        v7 = " [%s] %s:%d visibilityIndex[%d]";
        v8 = v5;
        v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(void **)(a1 + 32);
        v13 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v43 = v10;
        v44 = 2080;
        v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
        v46 = 1024;
        v47 = 385;
        v48 = 2112;
        v49 = v3;
        v50 = 2048;
        v51 = v12;
        v52 = 1024;
        v53 = v13;
        v7 = " [%s] %s:%d %@(%p) visibilityIndex[%d]";
        v8 = v11;
        v9 = 54;
        goto LABEL_11;
      }
    }
  }
  v14 = *(_DWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  if (v14 == *(_DWORD *)(v15 + 84))
  {
    if ((id)objc_opt_class() != *v2)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        v27 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            return;
          v28 = *v2;
          v29 = *((_DWORD *)*v2 + 21);
          *(_DWORD *)buf = 136316418;
          v43 = v25;
          v44 = 2080;
          v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
          v46 = 1024;
          v47 = 387;
          v48 = 2112;
          v49 = v16;
          v50 = 2048;
          v51 = v28;
          v52 = 1024;
          v53 = v29;
          v23 = " [%s] %s:%d %@(%p) visibilityIndex is already at %d";
          v24 = v26;
          goto LABEL_38;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v38 = *v2;
          v39 = *((_DWORD *)*v2 + 21);
          *(_DWORD *)buf = 136316418;
          v43 = v25;
          v44 = 2080;
          v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
          v46 = 1024;
          v47 = 387;
          v48 = 2112;
          v49 = v16;
          v50 = 2048;
          v51 = v38;
          v52 = 1024;
          v53 = v39;
          _os_log_debug_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) visibilityIndex is already at %d", buf, 0x36u);
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    v21 = *MEMORY[0x1E0CF2758];
    if (!*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __44__AVCSessionParticipant_setVisibilityIndex___block_invoke_cold_1();
      return;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      return;
    v22 = *((_DWORD *)*v2 + 21);
    *(_DWORD *)buf = 136315906;
    v43 = v19;
    v44 = 2080;
    v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
    v46 = 1024;
    v47 = 387;
    v48 = 1024;
    LODWORD(v49) = v22;
    v23 = " [%s] %s:%d visibilityIndex is already at %d";
    v24 = v20;
LABEL_33:
    v33 = 34;
LABEL_39:
    _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v33);
    return;
  }
  *(_DWORD *)(v15 + 84) = v14;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setIsVisible:", *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84) == 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40)), CFSTR("vcSessionParameterVisibilityIndex"));
  v17 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v17 + 112))
  {
    v41[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40), CFSTR("vcSessionParticipantID"), CFSTR("vcSessionParameterVisibilityIndex"), *(_QWORD *)(v17 + 16));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetVisibilityIndex", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 2));
    return;
  }
  *(_BYTE *)(v17 + 113) = 1;
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v32 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v43 = v30;
    v44 = 2080;
    v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
    v46 = 1024;
    v47 = 398;
    v48 = 1024;
    LODWORD(v49) = v32;
    v23 = " [%s] %s:%d visibilityIndex[%d] is cached until endParticipantConfiguration is called.";
    v24 = v31;
    goto LABEL_33;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
  else
    v18 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(void **)(a1 + 32);
      v37 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v43 = v34;
      v44 = 2080;
      v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
      v46 = 1024;
      v47 = 398;
      v48 = 2112;
      v49 = v18;
      v50 = 2048;
      v51 = v36;
      v52 = 1024;
      v53 = v37;
      v23 = " [%s] %s:%d %@(%p) visibilityIndex[%d] is cached until endParticipantConfiguration is called.";
      v24 = v35;
LABEL_38:
      v33 = 54;
      goto LABEL_39;
    }
  }
}

- (void)setScreenControlEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__AVCSessionParticipant_setScreenControlEnabled___block_invoke;
    block[3] = &unk_1E9E521E8;
    block[4] = self;
    v7 = v3;
    if (stateQueue)
      dispatch_async(stateQueue, block);
  }
  else
  {
    self->_screenControlEnabled = v3;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("vcSessionParameterParticipantScreenControlEnabled"));
  }
}

void __49__AVCSessionParticipant_setScreenControlEnabled___block_invoke(uint64_t a1)
{
  id *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  int v28;
  id v29;
  int v30;
  uint64_t v31;
  _QWORD v32[2];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v34 = v4;
        v35 = 2080;
        v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
        v37 = 1024;
        v38 = 411;
        v39 = 1024;
        LODWORD(v40) = v6;
        v7 = " [%s] %s:%d remoteScreenControlEnabled[%d]";
        v8 = v5;
        v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(void **)(a1 + 32);
        v13 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v34 = v10;
        v35 = 2080;
        v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
        v37 = 1024;
        v38 = 411;
        v39 = 2112;
        v40 = v3;
        v41 = 2048;
        v42 = v12;
        v43 = 1024;
        v44 = v13;
        v7 = " [%s] %s:%d %@(%p) remoteScreenControlEnabled[%d]";
        v8 = v11;
        v9 = 54;
        goto LABEL_11;
      }
    }
  }
  v14 = *(unsigned __int8 *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  if (v14 != *(unsigned __int8 *)(v15 + 137))
  {
    *(_BYTE *)(v15 + 137) = v14;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)), CFSTR("vcSessionParameterParticipantScreenControlEnabled"));
    v32[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40), CFSTR("vcSessionParticipantID"), CFSTR("vcSessionParameterParticipantScreenControlEnabled"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetScreenControlEnabled", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 2));
    return;
  }
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    v19 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        return;
      v20 = *((unsigned __int8 *)*v2 + 137);
      *(_DWORD *)buf = 136315906;
      v34 = v17;
      v35 = 2080;
      v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
      v37 = 1024;
      v38 = 413;
      v39 = 1024;
      LODWORD(v40) = v20;
      v21 = " [%s] %s:%d remoteScreenControlEnabled is already set to %d";
      v22 = v18;
      v23 = 34;
LABEL_26:
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      return;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      __49__AVCSessionParticipant_setScreenControlEnabled___block_invoke_cold_1();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      v26 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          return;
        v27 = *v2;
        v28 = *((unsigned __int8 *)*v2 + 137);
        *(_DWORD *)buf = 136316418;
        v34 = v24;
        v35 = 2080;
        v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
        v37 = 1024;
        v38 = 413;
        v39 = 2112;
        v40 = v16;
        v41 = 2048;
        v42 = v27;
        v43 = 1024;
        v44 = v28;
        v21 = " [%s] %s:%d %@(%p) remoteScreenControlEnabled is already set to %d";
        v22 = v25;
        v23 = 54;
        goto LABEL_26;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v29 = *v2;
        v30 = *((unsigned __int8 *)*v2 + 137);
        *(_DWORD *)buf = 136316418;
        v34 = v24;
        v35 = 2080;
        v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
        v37 = 1024;
        v38 = 413;
        v39 = 2112;
        v40 = v16;
        v41 = 2048;
        v42 = v29;
        v43 = 1024;
        v44 = v30;
        _os_log_debug_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) remoteScreenControlEnabled is already set to %d", buf, 0x36u);
      }
    }
  }
}

- (void)setProminenceIndex:(unsigned int)a3
{
  uint64_t v3;
  NSObject *stateQueue;
  _QWORD block[5];
  int v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__AVCSessionParticipant_setProminenceIndex___block_invoke;
    block[3] = &unk_1E9E52300;
    block[4] = self;
    v7 = v3;
    if (stateQueue)
      dispatch_async(stateQueue, block);
  }
  else
  {
    self->_prominenceIndex = v3;
    -[VCPositionalInfo setProminenceIndex:](self->_videoPositionalInfo, "setProminenceIndex:", v3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3), CFSTR("vcSessionParameterProminenceIndex"));
  }
}

void __44__AVCSessionParticipant_setProminenceIndex___block_invoke(uint64_t a1)
{
  id *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  int v37;
  id v38;
  int v39;
  uint64_t v40;
  _QWORD v41[2];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v43 = v4;
        v44 = 2080;
        v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
        v46 = 1024;
        v47 = 432;
        v48 = 1024;
        LODWORD(v49) = v6;
        v7 = " [%s] %s:%d prominenceIndex[%d]";
        v8 = v5;
        v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(void **)(a1 + 32);
        v13 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v43 = v10;
        v44 = 2080;
        v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
        v46 = 1024;
        v47 = 432;
        v48 = 2112;
        v49 = v3;
        v50 = 2048;
        v51 = v12;
        v52 = 1024;
        v53 = v13;
        v7 = " [%s] %s:%d %@(%p) prominenceIndex[%d]";
        v8 = v11;
        v9 = 54;
        goto LABEL_11;
      }
    }
  }
  v14 = *(_DWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  if (v14 == *(_DWORD *)(v15 + 88))
  {
    if ((id)objc_opt_class() != *v2)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        v27 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            return;
          v28 = *v2;
          v29 = *((_DWORD *)*v2 + 22);
          *(_DWORD *)buf = 136316418;
          v43 = v25;
          v44 = 2080;
          v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
          v46 = 1024;
          v47 = 434;
          v48 = 2112;
          v49 = v16;
          v50 = 2048;
          v51 = v28;
          v52 = 1024;
          v53 = v29;
          v23 = " [%s] %s:%d %@(%p) prominenceIndex is already at %d";
          v24 = v26;
          goto LABEL_38;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v38 = *v2;
          v39 = *((_DWORD *)*v2 + 22);
          *(_DWORD *)buf = 136316418;
          v43 = v25;
          v44 = 2080;
          v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
          v46 = 1024;
          v47 = 434;
          v48 = 2112;
          v49 = v16;
          v50 = 2048;
          v51 = v38;
          v52 = 1024;
          v53 = v39;
          _os_log_debug_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) prominenceIndex is already at %d", buf, 0x36u);
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    v21 = *MEMORY[0x1E0CF2758];
    if (!*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __44__AVCSessionParticipant_setProminenceIndex___block_invoke_cold_1();
      return;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      return;
    v22 = *((_DWORD *)*v2 + 22);
    *(_DWORD *)buf = 136315906;
    v43 = v19;
    v44 = 2080;
    v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
    v46 = 1024;
    v47 = 434;
    v48 = 1024;
    LODWORD(v49) = v22;
    v23 = " [%s] %s:%d prominenceIndex is already at %d";
    v24 = v20;
LABEL_33:
    v33 = 34;
LABEL_39:
    _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v33);
    return;
  }
  *(_DWORD *)(v15 + 88) = v14;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setProminenceIndex:", *(unsigned int *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40)), CFSTR("vcSessionParameterProminenceIndex"));
  v17 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v17 + 112))
  {
    v41[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40), CFSTR("vcSessionParticipantID"), CFSTR("vcSessionParameterProminenceIndex"), *(_QWORD *)(v17 + 16));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetProminenceIndex", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 2));
    return;
  }
  *(_BYTE *)(v17 + 113) = 1;
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v32 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v43 = v30;
    v44 = 2080;
    v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
    v46 = 1024;
    v47 = 445;
    v48 = 1024;
    LODWORD(v49) = v32;
    v23 = " [%s] %s:%d prominenceIndex[%d] is cached until endParticipantConfiguration is called.";
    v24 = v31;
    goto LABEL_33;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
  else
    v18 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(void **)(a1 + 32);
      v37 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v43 = v34;
      v44 = 2080;
      v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
      v46 = 1024;
      v47 = 445;
      v48 = 2112;
      v49 = v18;
      v50 = 2048;
      v51 = v36;
      v52 = 1024;
      v53 = v37;
      v23 = " [%s] %s:%d %@(%p) prominenceIndex[%d] is cached until endParticipantConfiguration is called.";
      v24 = v35;
LABEL_38:
      v33 = 54;
      goto LABEL_39;
    }
  }
}

- (tagAVCPositionalInfo)videoPositionalInfo
{
  uint64_t *v5;
  NSObject *stateQueue;
  __int128 v7;
  __int128 v8;
  tagAVCPositionalInfo *result;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    v5 = &v11;
    v11 = 0;
    v12 = &v11;
    v13 = 0x5010000000;
    v14 = "";
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__AVCSessionParticipant_videoPositionalInfo__block_invoke;
    block[3] = &unk_1E9E52938;
    block[4] = self;
    block[5] = &v11;
    if (stateQueue)
    {
      dispatch_sync(stateQueue, block);
      v5 = v12;
    }
    v7 = *((_OWORD *)v5 + 2);
    v8 = *((_OWORD *)v5 + 4);
    *(_OWORD *)&retstr->var1.height = *((_OWORD *)v5 + 3);
    *(_OWORD *)&retstr->var3 = v8;
    *(_OWORD *)&retstr->var0 = v7;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    result = (tagAVCPositionalInfo *)self->_videoPositionalInfo;
    if (result)
    {
      return (tagAVCPositionalInfo *)-[tagAVCPositionalInfo avcPositionalInfo](result, "avcPositionalInfo");
    }
    else
    {
      *(_OWORD *)&retstr->var1.height = 0u;
      *(_OWORD *)&retstr->var3 = 0u;
      *(_OWORD *)&retstr->var0 = 0u;
    }
  }
  return result;
}

__n128 __44__AVCSessionParticipant_videoPositionalInfo__block_invoke(uint64_t a1)
{
  void *v2;
  _OWORD *v3;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __n128 v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    objc_msgSend(v2, "avcPositionalInfo");
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
  }
  v3 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  result = v7;
  v3[2] = v5;
  v3[3] = v6;
  v3[4] = v7;
  return result;
}

- (void)setVideoPositionalInfo:(tagAVCPositionalInfo *)a3
{
  __int128 v5;
  NSObject *stateQueue;
  __int128 v7;
  const __CFString *v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int var0;
  _QWORD block[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  AVCSessionParticipant *v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3->var0 >= 2)
  {
    if ((AVCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCSessionParticipant setVideoPositionalInfo:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          var0 = a3->var0;
          *(_DWORD *)buf = 136316418;
          v20 = v11;
          v21 = 2080;
          v22 = "-[AVCSessionParticipant setVideoPositionalInfo:]";
          v23 = 1024;
          v24 = 464;
          v25 = 2112;
          v26 = v8;
          v27 = 2048;
          v28 = self;
          v29 = 1024;
          v30 = var0;
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) [AVC SPATIAL AUDIO] Invalid flags=%08x", buf, 0x36u);
        }
      }
    }
  }
  else if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    block[1] = 3221225472;
    v5 = *(_OWORD *)&a3->var1.height;
    v15 = *(_OWORD *)&a3->var0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __48__AVCSessionParticipant_setVideoPositionalInfo___block_invoke;
    block[3] = &unk_1E9E56780;
    block[4] = self;
    v7 = *(_OWORD *)&a3->var3;
    v16 = v5;
    v17 = v7;
    if (stateQueue)
      dispatch_async(stateQueue, block);
  }
  else
  {
    v9 = *(_OWORD *)&a3->var1.height;
    v18[0] = *(_OWORD *)&a3->var0;
    v18[1] = v9;
    v18[2] = *(_OWORD *)&a3->var3;
    -[VCPositionalInfo setAvcPositionalInfo:](self->_videoPositionalInfo, "setAvcPositionalInfo:", v18);
    v10 = -[VCPositionalInfo serialize](self->_videoPositionalInfo, "serialize");
    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", v10, CFSTR("vcSessionPositionalInfo"));
    self->_hasPendingChanges = 1;
  }
}

void __48__AVCSessionParticipant_setVideoPositionalInfo___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _OWORD v13[3];
  __int128 __s1;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  __s1 = xmmword_1D910DB18;
  v15 = unk_1D910DB28;
  v16 = xmmword_1D910DB38;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    objc_msgSend(v2, "avcPositionalInfo");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    __s1 = 0u;
  }
  if (!memcmp(&__s1, (const void *)(a1 + 40), 0x30uLL))
    return;
  v3 = *(_OWORD *)(a1 + 56);
  v13[0] = *(_OWORD *)(a1 + 40);
  v13[1] = v3;
  v13[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setAvcPositionalInfo:", v13);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 112))
    return;
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v18 = v5;
    v19 = 2080;
    v20 = "-[AVCSessionParticipant setVideoPositionalInfo:]_block_invoke";
    v21 = 1024;
    v22 = 485;
    v7 = " [%s] %s:%d [AVC SPATIAL AUDIO] Video position info will not be applied until endParticipantConfiguration is called.";
    v8 = v6;
    v9 = 28;
LABEL_17:
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
  else
    v4 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      v18 = v10;
      v19 = 2080;
      v20 = "-[AVCSessionParticipant setVideoPositionalInfo:]_block_invoke";
      v21 = 1024;
      v22 = 485;
      v23 = 2112;
      v24 = v4;
      v25 = 2048;
      v26 = v12;
      v7 = " [%s] %s:%d %@(%p) [AVC SPATIAL AUDIO] Video position info will not be applied until endParticipantConfiguration is called.";
      v8 = v11;
      v9 = 48;
      goto LABEL_17;
    }
  }
}

- (void)dispatchedSetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v4 = *(_QWORD *)&a3;
  v7[3] = *MEMORY[0x1E0C80C00];
  v7[0] = self->_participantID;
  v6[0] = CFSTR("vcSessionParticipantID");
  v6[1] = CFSTR("vcSessionParameterMediaType");
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  v6[2] = CFSTR("vcSessionParameterMediaState");
  v7[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  -[AVConferenceXPCClient sendMessageAsync:arguments:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetMediaState", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
}

- (void)dispatchedLegacySetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  _opaque_pthread_mutex_t *p_mediaStateMutex;
  uint64_t v8;
  _BOOL4 v9;
  BOOL v10;
  uint64_t v11;
  const char *v12;
  const __CFString *v13;
  const char *v14;
  uint64_t v15;
  AVCSessionParticipant *v16;
  uint64_t v17;
  _QWORD v18[5];
  int v19;
  int v20;
  int v21;
  _QWORD v22[5];
  int v23;
  int v24;
  int v25;
  uint64_t v26;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  p_mediaStateMutex = &self->_mediaStateMutex;
  pthread_mutex_lock(&self->_mediaStateMutex);
  v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4)), "unsignedIntValue");
  pthread_mutex_unlock(p_mediaStateMutex);
  v9 = v5 == 0;
  v10 = (_DWORD)v5 != 1 || (_DWORD)v8 == 2;
  v11 = !v10;
  if (!v10)
    v9 = 1;
  switch((_DWORD)v4)
  {
    case 2:
      if (v9)
      {
        v14 = "screen";
        v12 = "vcSessionSetScreenEnabled";
        v13 = CFSTR("vcSessionParameterScreenEnabled");
LABEL_30:
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __68__AVCSessionParticipant_dispatchedLegacySetMediaState_forMediaType___block_invoke;
        v22[3] = &unk_1E9E567A8;
        v22[4] = self;
        v23 = v4;
        v24 = v5;
        v25 = v8;
        -[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:](self, "setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:", v4, v11, v14, v12, v13, v22);
        return;
      }
      v15 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32026, 0, CFSTR("Screen doesn't support pause/resume"));
      v16 = self;
      v17 = 2;
      break;
    case 1:
      if (v9)
        v12 = "vcSessionSetVideoEnabled";
      else
        v12 = "vcSessionSetVideoPaused";
      if (v9)
        v13 = CFSTR("vcSessionParameterVideoEnabled");
      else
        v13 = CFSTR("vcSessionParameterVideoPaused");
      v14 = "video";
      if (v9)
        goto LABEL_30;
      goto LABEL_27;
    case 0:
      if (v9)
        v12 = "vcSessionSetAudioEnabled";
      else
        v12 = "vcSessionSetAudioPaused";
      if (v9)
        v13 = CFSTR("vcSessionParameterAudioEnabled");
      else
        v13 = CFSTR("vcSessionParameterAudioPaused");
      v14 = "audio";
      if (v9)
        goto LABEL_30;
LABEL_27:
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68__AVCSessionParticipant_dispatchedLegacySetMediaState_forMediaType___block_invoke_2;
      v18[3] = &unk_1E9E567A8;
      v18[4] = self;
      v19 = v4;
      v20 = v5;
      v21 = v8;
      -[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:](self, "setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:", v4, (_DWORD)v5 == 2, v14, v12, v13, v18);
      return;
    default:
      v15 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, CFSTR("Unsupported media type pause/resume"));
      v16 = self;
      v17 = v4;
      break;
  }
  -[AVCSessionParticipant stateTransitionForMediaType:mediaState:previousState:didSucceed:error:](v16, "stateTransitionForMediaType:mediaState:previousState:didSucceed:error:", v17, v5, v8, 0, v15);
}

uint64_t __68__AVCSessionParticipant_dispatchedLegacySetMediaState_forMediaType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateTransitionForMediaType:mediaState:previousState:didSucceed:error:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48), a3, a4);
}

uint64_t __68__AVCSessionParticipant_dispatchedLegacySetMediaState_forMediaType___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateTransitionForMediaType:mediaState:previousState:didSucceed:error:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48), a3, a4);
}

- (void)completeSetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  NSObject *stateQueue;
  _QWORD block[6];
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__AVCSessionParticipant_completeSetMediaState_forMediaType_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E55690;
  v9 = a4;
  v10 = a3;
  v11 = a5;
  block[4] = self;
  block[5] = a6;
  if (stateQueue)
    dispatch_async(stateQueue, block);
}

uint64_t __77__AVCSessionParticipant_completeSetMediaState_forMediaType_didSucceed_error___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *data;
  int v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = VCSessionMediaType_Name(*(unsigned int *)(a1 + 48));
  v3 = VCSessionMediaState_Name(*(unsigned int *)(a1 + 52));
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 152));
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "unsignedIntValue");
  if (objc_opt_class() != *(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v15 = *(__CFString **)(a1 + 32);
    data = (__CFString *)v15->data;
    v17 = *(unsigned __int8 *)(a1 + 56);
    v19 = 136317186;
    v20 = v13;
    v21 = 2080;
    v22 = "-[AVCSessionParticipant completeSetMediaState:forMediaType:didSucceed:error:]_block_invoke";
    v23 = 1024;
    v24 = 550;
    v25 = 2112;
    v26 = v5;
    v27 = 2048;
    v28 = v15;
    v29 = 2112;
    v30 = data;
    v31 = 2112;
    v32 = v2;
    v33 = 2112;
    v34 = v3;
    v35 = 1024;
    v36 = v17;
    v10 = " [%s] %s:%d %@(%p) ParticipantID=%@ mediaType=%@ mediaState=%@ did succeed[%d]";
    v11 = v14;
    v12 = 84;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 16);
      v9 = *(unsigned __int8 *)(a1 + 56);
      v19 = 136316674;
      v20 = v6;
      v21 = 2080;
      v22 = "-[AVCSessionParticipant completeSetMediaState:forMediaType:didSucceed:error:]_block_invoke";
      v23 = 1024;
      v24 = 550;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v2;
      v29 = 2112;
      v30 = v3;
      v31 = 1024;
      LODWORD(v32) = v9;
      v10 = " [%s] %s:%d ParticipantID=%@ mediaType=%@ mediaState=%@ did succeed[%d]";
      v11 = v7;
      v12 = 64;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, v12);
    }
  }
LABEL_12:
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "storeMediaState:forMediaType:", *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 48));
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 152));
  return objc_msgSend(*(id *)(a1 + 32), "stateTransitionForMediaType:mediaState:previousState:didSucceed:error:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), v4, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (BOOL)generateMediaStateEntryForMediaType:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;

  v3 = *(_QWORD *)&a3;
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", v5))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", &unk_1E9EF5528, v5);
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)) != 0;
}

- (void)printMediaStates
{
  uint64_t v3;
  NSMutableDictionary *mediaStates;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  AVCSessionParticipant *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  mediaStates = self->_mediaStates;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__AVCSessionParticipant_printMediaStates__block_invoke;
  v13[3] = &unk_1E9E567D0;
  v13[4] = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mediaStates, "enumerateKeysAndObjectsUsingBlock:", v13);
  if ((AVCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v15 = v6;
        v16 = 2080;
        v17 = "-[AVCSessionParticipant printMediaStates]";
        v18 = 1024;
        v19 = 576;
        v20 = 2112;
        v21 = v3;
        v8 = " [%s] %s:%d Media state update: %@";
        v9 = v7;
        v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v15 = v11;
        v16 = 2080;
        v17 = "-[AVCSessionParticipant printMediaStates]";
        v18 = 1024;
        v19 = 576;
        v20 = 2112;
        v21 = (uint64_t)v5;
        v22 = 2048;
        v23 = self;
        v24 = 2112;
        v25 = v3;
        v8 = " [%s] %s:%d %@(%p) Media state update: %@";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

uint64_t __41__AVCSessionParticipant_printMediaStates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  __CFString *v5;

  v4 = *(void **)(a1 + 32);
  v5 = VCSessionMediaType_Name(objc_msgSend(a2, "unsignedIntValue"));
  return objc_msgSend(v4, "appendFormat:", CFSTR("%@[%@] "), v5, VCSessionMediaState_Name(objc_msgSend(a3, "unsignedIntValue")));
}

- (void)storeMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  _BYTE v21[24];
  __int128 v22;
  AVCSessionParticipant *v23;
  __int128 v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  -[AVCSessionParticipant generateMediaStateEntryForMediaType:](self, "generateMediaStateEntryForMediaType:", v4);
  v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", v7);
  if (v8)
  {
    if (objc_msgSend(v8, "unsignedIntValue") != (_DWORD)v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5), v7);
      v9 = +[AVCSessionParticipant archiveMediaStates:](AVCSessionParticipant, "archiveMediaStates:", self->_mediaStates);
      if (v9)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", v9, CFSTR("vcSessionParameterMediaStates"));
        -[AVCSessionParticipant updateLegacyStates](self, "updateLegacyStates");
        goto LABEL_5;
      }
      if ((AVCSessionParticipant *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCSessionParticipant storeMediaState:forMediaType:].cold.2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v11 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v21 = 136316162;
            *(_QWORD *)&v21[4] = v19;
            *(_WORD *)&v21[12] = 2080;
            *(_QWORD *)&v21[14] = "-[AVCSessionParticipant storeMediaState:forMediaType:]";
            *(_WORD *)&v21[22] = 1024;
            LODWORD(v22) = 590;
            WORD2(v22) = 2112;
            *(_QWORD *)((char *)&v22 + 6) = v11;
            HIWORD(v22) = 2048;
            v23 = self;
            v16 = " [%s] %s:%d %@(%p) Error encoding media type settings dictionary";
            v17 = v20;
            v18 = 48;
            goto LABEL_26;
          }
        }
      }
    }
  }
  else if ((AVCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCSessionParticipant storeMediaState:forMediaType:].cold.1(v12, v4, v13);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v21 = 136316418;
        *(_QWORD *)&v21[4] = v14;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "-[AVCSessionParticipant storeMediaState:forMediaType:]";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 586;
        WORD2(v22) = 2112;
        *(_QWORD *)((char *)&v22 + 6) = v10;
        HIWORD(v22) = 2048;
        v23 = self;
        LOWORD(v24) = 2112;
        *(_QWORD *)((char *)&v24 + 2) = VCSessionMediaType_Name(v4);
        v16 = " [%s] %s:%d %@(%p) Failed to retrieve media state for mediaType=%@";
        v17 = v15;
        v18 = 58;
LABEL_26:
        _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v16, v21, v18);
      }
    }
  }
LABEL_5:
  -[AVCSessionParticipant printMediaStates](self, "printMediaStates", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23, v24);
}

- (void)handleLegacyTransitionsForMediaType:(unsigned int)a3 mediaState:(unsigned int)a4 previousState:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v12;
  uint64_t v13;
  AVCSessionParticipantDelegate *v14;
  BOOL v15;
  BOOL v16;
  char v17;
  char v18;
  char v19;

  v8 = a6;
  v12 = a5 == 2 && a4 == 1;
  v13 = (a4 == 1) ^ v12;
  v14 = -[AVCSessionParticipant delegate](self, "delegate");
  if (a3)
  {
    if (a3 == 2)
    {
      v17 = v13 ^ 1;
      if (!a4)
        v17 = 0;
      if ((v17 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
        -[AVCSessionParticipantDelegate participant:screenEnabled:didSucceed:error:](v14, "participant:screenEnabled:didSucceed:error:", self, v13, v8, a7);
    }
    else if (a3 == 1)
    {
      v15 = !v12;
      if (a4 == 2)
        v15 = 0;
      if (v15 || (objc_opt_respondsToSelector() & 1) == 0)
      {
        v18 = v13 ^ 1;
        if (!a4)
          v18 = 0;
        if ((v18 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
          -[AVCSessionParticipantDelegate participant:videoEnabled:didSucceed:error:](v14, "participant:videoEnabled:didSucceed:error:", self, v13, v8, a7);
      }
      else
      {
        -[AVCSessionParticipantDelegate participant:videoPaused:didSucceed:error:](v14, "participant:videoPaused:didSucceed:error:", self, a4 == 2, v8, a7);
      }
    }
  }
  else
  {
    v16 = !v12;
    if (a4 == 2)
      v16 = 0;
    if (v16 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v19 = v13 ^ 1;
      if (!a4)
        v19 = 0;
      if ((v19 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
        -[AVCSessionParticipantDelegate participant:audioEnabled:didSucceed:error:](v14, "participant:audioEnabled:didSucceed:error:", self, v13, v8, a7);
    }
    else
    {
      -[AVCSessionParticipantDelegate participant:audioPaused:didSucceed:error:](v14, "participant:audioPaused:didSucceed:error:", self, a4 == 2, v8, a7);
    }
  }
}

- (void)stateTransitionForMediaType:(unsigned int)a3 mediaState:(unsigned int)a4 previousState:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  OS_dispatch_queue *v13;
  _QWORD block[6];
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__AVCSessionParticipant_stateTransitionForMediaType_mediaState_previousState_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E567F8;
  v15 = a3;
  v16 = a4;
  v18 = a6;
  block[4] = self;
  block[5] = a7;
  v17 = a5;
  dispatch_async((dispatch_queue_t)v13, block);
}

uint64_t __95__AVCSessionParticipant_stateTransitionForMediaType_mediaState_previousState_didSucceed_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 48));
    objc_msgSend(v2, "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), v3, *(unsigned __int8 *)(a1 + 60), *(_QWORD *)(a1 + 40));
  }
  return objc_msgSend(*(id *)(a1 + 32), "handleLegacyTransitionsForMediaType:mediaState:previousState:didSucceed:error:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60), *(_QWORD *)(a1 + 40));
}

- (void)setMediaType:(unsigned int)a3 enabled:(BOOL)a4 mediaString:(const char *)a5 xpcMessageKey:(char *)a6 xpcOperationKey:(id)a7 completionBlock:(id)a8
{
  _BOOL8 v12;
  NSObject *stateQueue;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[9];
  unsigned int v25;
  BOOL v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  AVCSessionParticipant *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v12 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  if (!-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    if ((AVCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_15;
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316162;
      v28 = v17;
      v29 = 2080;
      v30 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]";
      v31 = 1024;
      v32 = 657;
      v33 = 2080;
      v34 = a5;
      v35 = 1024;
      LODWORD(v36) = v12;
      v19 = " [%s] %s:%d %sEnabled[%d]";
      v20 = v18;
      v21 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_15;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316674;
      v28 = v22;
      v29 = 2080;
      v30 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]";
      v31 = 1024;
      v32 = 657;
      v33 = 2112;
      v34 = (const char *)v16;
      v35 = 2048;
      v36 = self;
      v37 = 2080;
      v38 = a5;
      v39 = 1024;
      v40 = v12;
      v19 = " [%s] %s:%d %@(%p) %sEnabled[%d]";
      v20 = v23;
      v21 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_15:
    (*((void (**)(id, _BOOL8, uint64_t, _QWORD))a8 + 2))(a8, v12, 1, 0);
    return;
  }
  stateQueue = self->_stateQueue;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __104__AVCSessionParticipant_setMediaType_enabled_mediaString_xpcMessageKey_xpcOperationKey_completionBlock___block_invoke;
  v24[3] = &unk_1E9E56820;
  v26 = v12;
  v25 = a3;
  v24[6] = a8;
  v24[7] = a5;
  v24[4] = self;
  v24[5] = a7;
  v24[8] = a6;
  if (stateQueue)
    dispatch_async(stateQueue, v24);
}

uint64_t __104__AVCSessionParticipant_setMediaType_enabled_mediaString_xpcMessageKey_xpcOperationKey_completionBlock___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  int v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  _QWORD v34[2];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 76);
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 152));
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72))), "unsignedIntValue");
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 152));
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 32);
  if (v3 == v2)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v10 = *(const __CFString **)(a1 + 56);
      v11 = *(unsigned __int8 *)(a1 + 76);
      *(_DWORD *)buf = 136316162;
      v36 = v8;
      v37 = 2080;
      v38 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
      v39 = 1024;
      v40 = 668;
      v41 = 2080;
      v42 = v10;
      v43 = 1024;
      LODWORD(v44) = v11;
      v12 = " [%s] %s:%d Participant %s is already enabled[%d]";
      v13 = v9;
      v14 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 56);
      v26 = *(unsigned __int8 *)(a1 + 76);
      *(_DWORD *)buf = 136316674;
      v36 = v22;
      v37 = 2080;
      v38 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
      v39 = 1024;
      v40 = 668;
      v41 = 2112;
      v42 = v6;
      v43 = 2048;
      v44 = v24;
      v45 = 2080;
      v46 = v25;
      v47 = 1024;
      v48 = v26;
      v12 = " [%s] %s:%d %@(%p) Participant %s is already enabled[%d]";
      v13 = v23;
      v14 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_25;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v17 = *(const __CFString **)(a1 + 56);
    v18 = *(unsigned __int8 *)(a1 + 76);
    *(_DWORD *)buf = 136316162;
    v36 = v15;
    v37 = 2080;
    v38 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
    v39 = 1024;
    v40 = 672;
    v41 = 2080;
    v42 = v17;
    v43 = 1024;
    LODWORD(v44) = v18;
    v19 = " [%s] %s:%d %sEnabled[%d]";
    v20 = v16;
    v21 = 44;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_25;
    v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(_QWORD *)(a1 + 56);
    v32 = *(unsigned __int8 *)(a1 + 76);
    *(_DWORD *)buf = 136316674;
    v36 = v28;
    v37 = 2080;
    v38 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
    v39 = 1024;
    v40 = 672;
    v41 = 2112;
    v42 = v7;
    v43 = 2048;
    v44 = v30;
    v45 = 2080;
    v46 = v31;
    v47 = 1024;
    v48 = v32;
    v19 = " [%s] %s:%d %@(%p) %sEnabled[%d]";
    v20 = v29;
    v21 = 64;
  }
  _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_25:
  v34[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76), CFSTR("vcSessionParticipantID"), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", *(_QWORD *)(a1 + 64), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 2));
}

- (void)setMediaType:(unsigned int)a3 paused:(BOOL)a4 mediaString:(const char *)a5 xpcMessageKey:(char *)a6 xpcOperationKey:(id)a7 completionBlock:(id)a8
{
  _BOOL8 v12;
  uint64_t v13;
  NSObject *stateQueue;
  int v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  _QWORD block[9];
  int v27;
  int v28;
  BOOL v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  AVCSessionParticipant *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v12 = a4;
  v13 = *(_QWORD *)&a3;
  v44 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    stateQueue = self->_stateQueue;
    if (v12)
      v16 = 2;
    else
      v16 = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__AVCSessionParticipant_setMediaType_paused_mediaString_xpcMessageKey_xpcOperationKey_completionBlock___block_invoke;
    block[3] = &unk_1E9E56848;
    v29 = v12;
    v27 = v13;
    v28 = v16;
    block[6] = a8;
    block[7] = a5;
    block[4] = self;
    block[5] = a7;
    block[8] = a6;
    if (stateQueue)
      dispatch_async(stateQueue, block);
    return;
  }
  if ((AVCSessionParticipant *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_18;
    v23 = VRTraceErrorLogLevelToCSTR();
    v24 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_DWORD *)buf = 136316674;
    v31 = v23;
    v32 = 2080;
    v33 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]";
    v34 = 1024;
    v35 = 687;
    v36 = 2112;
    v37 = (const char *)v17;
    v38 = 2048;
    v39 = self;
    v40 = 2080;
    v41 = a5;
    v42 = 1024;
    v43 = v12;
    v20 = " [%s] %s:%d %@(%p) %sPaused[%d]";
    v21 = v24;
    v22 = 64;
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v31 = v18;
      v32 = 2080;
      v33 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]";
      v34 = 1024;
      v35 = 687;
      v36 = 2080;
      v37 = a5;
      v38 = 1024;
      LODWORD(v39) = v12;
      v20 = " [%s] %s:%d %sPaused[%d]";
      v21 = v19;
      v22 = 44;
LABEL_17:
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    }
  }
LABEL_18:
  pthread_mutex_lock(&self->_mediaStateMutex);
  if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13)), "unsignedIntValue"))v25 = 0;
  else
    v25 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCSessionParticipant.m", 691));
  pthread_mutex_unlock(&self->_mediaStateMutex);
  (*((void (**)(id, _BOOL8, BOOL, id))a8 + 2))(a8, v12, v25 == 0, v25);
}

uint64_t __103__AVCSessionParticipant_setMediaType_paused_mediaString_xpcMessageKey_xpcOperationKey_completionBlock___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  int v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 152));
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72))), "unsignedIntValue");
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 152));
  if (!v2)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), 0, +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCSessionParticipant.m", 703)));
  v3 = *(_DWORD *)(a1 + 76);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 32);
  if (v3 == v2)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v11 = *(const __CFString **)(a1 + 56);
      v12 = *(unsigned __int8 *)(a1 + 80);
      *(_DWORD *)buf = 136316162;
      v37 = v9;
      v38 = 2080;
      v39 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
      v40 = 1024;
      v41 = 706;
      v42 = 2080;
      v43 = v11;
      v44 = 1024;
      LODWORD(v45) = v12;
      v13 = " [%s] %s:%d Participant %s is already paused[%d]";
      v14 = v10;
      v15 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 56);
      v27 = *(unsigned __int8 *)(a1 + 80);
      *(_DWORD *)buf = 136316674;
      v37 = v23;
      v38 = 2080;
      v39 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
      v40 = 1024;
      v41 = 706;
      v42 = 2112;
      v43 = v6;
      v44 = 2048;
      v45 = v25;
      v46 = 2080;
      v47 = v26;
      v48 = 1024;
      v49 = v27;
      v13 = " [%s] %s:%d %@(%p) Participant %s is already paused[%d]";
      v14 = v24;
      v15 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_27;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v18 = *(const __CFString **)(a1 + 56);
    v19 = *(unsigned __int8 *)(a1 + 80);
    *(_DWORD *)buf = 136316162;
    v37 = v16;
    v38 = 2080;
    v39 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
    v40 = 1024;
    v41 = 709;
    v42 = 2080;
    v43 = v18;
    v44 = 1024;
    LODWORD(v45) = v19;
    v20 = " [%s] %s:%d %sPaused[%d]";
    v21 = v17;
    v22 = 44;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_27;
    v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(_QWORD *)(a1 + 56);
    v32 = *(unsigned __int8 *)(a1 + 80);
    *(_DWORD *)buf = 136316674;
    v37 = v28;
    v38 = 2080;
    v39 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
    v40 = 1024;
    v41 = 709;
    v42 = 2112;
    v43 = v8;
    v44 = 2048;
    v45 = v30;
    v46 = 2080;
    v47 = v31;
    v48 = 1024;
    v49 = v32;
    v20 = " [%s] %s:%d %@(%p) %sPaused[%d]";
    v21 = v29;
    v22 = 64;
  }
  _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_27:
  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v34[1] = *(_QWORD *)(a1 + 40);
  v35[0] = v33;
  v34[0] = CFSTR("vcSessionParticipantID");
  v35[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", *(_QWORD *)(a1 + 64), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
}

- (BOOL)isEnabledMediaType:(unsigned int)a3
{
  uint64_t v3;
  NSObject *stateQueue;
  BOOL v6;
  BOOL v7;
  _QWORD v9[6];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    stateQueue = self->_stateQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__AVCSessionParticipant_isEnabledMediaType___block_invoke;
    v9[3] = &unk_1E9E54D70;
    v10 = v3;
    v9[4] = self;
    v9[5] = &v11;
    if (stateQueue)
      dispatch_sync(stateQueue, v9);
    v6 = *((_BYTE *)v12 + 24) == 0;
  }
  else
  {
    v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "unsignedIntValue") == 0;
  }
  v7 = !v6;
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __44__AVCSessionParticipant_isEnabledMediaType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "unsignedIntValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

- (BOOL)isPausedMediaType:(unsigned int)a3
{
  uint64_t v3;
  NSObject *stateQueue;
  BOOL v6;
  _QWORD v8[6];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
  {
    stateQueue = self->_stateQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__AVCSessionParticipant_isPausedMediaType___block_invoke;
    v8[3] = &unk_1E9E54D70;
    v9 = v3;
    v8[4] = self;
    v8[5] = &v10;
    if (stateQueue)
      dispatch_sync(stateQueue, v8);
    v6 = *((_BYTE *)v11 + 24) != 0;
  }
  else
  {
    v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "unsignedIntValue") == 2;
  }
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __43__AVCSessionParticipant_isPausedMediaType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "unsignedIntValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result == 2;
  return result;
}

- (void)dispatchedCompleteAudioEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  _BOOL8 v7;
  int v9;
  OS_dispatch_queue *v10;
  _QWORD block[6];
  int v12;
  _BOOL4 v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;

  v6 = a4;
  v7 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5528), "unsignedIntValue");
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7), &unk_1E9EF5528);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), CFSTR("vcSessionParameterAudioEnabled"));
  }
  v10 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AVCSessionParticipant_dispatchedCompleteAudioEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E56870;
  v12 = v9;
  v13 = v7;
  v14 = v6;
  block[4] = self;
  block[5] = a5;
  v15 = v7;
  dispatch_async((dispatch_queue_t)v10, block);
}

uint64_t __73__AVCSessionParticipant_dispatchedCompleteAudioEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 0, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
    if (*(_BYTE *)(a1 + 56))
      v4 = 0;
    else
      v4 = *(_QWORD *)(a1 + 40);
    result = objc_msgSend(v3, "participant:audioEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 57) != 0, *(unsigned __int8 *)(a1 + 56) != 0, v4);
  }
  if (*(_BYTE *)(a1 + 57) && *(_DWORD *)(a1 + 48) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:audioPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), 0, 1, 0);
  }
  return result;
}

- (void)completeAudioEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  NSObject *stateQueue;
  _QWORD v7[6];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AVCSessionParticipant_completeAudioEnabled_didSucceed_error___block_invoke;
  v7[3] = &unk_1E9E54C98;
  v8 = a3;
  v9 = a4;
  v7[4] = self;
  v7[5] = a5;
  if (stateQueue)
    dispatch_async(stateQueue, v7);
}

uint64_t __63__AVCSessionParticipant_completeAudioEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedCompleteAudioEnabled:didSucceed:error:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
}

- (void)dispatchedCompleteAudioPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  _BOOL8 v7;
  int v9;
  uint64_t v10;
  OS_dispatch_queue *v11;
  _QWORD block[6];
  int v13;
  int v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;

  v6 = a4;
  v7 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5528), "unsignedIntValue");
  if (v7)
    v10 = 2;
  else
    v10 = 1;
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10), &unk_1E9EF5528);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), CFSTR("vcSessionParameterAudioPaused"));
  }
  v11 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AVCSessionParticipant_dispatchedCompleteAudioPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E56870;
  v13 = v9;
  v14 = v10;
  v15 = v6;
  block[4] = self;
  block[5] = a5;
  v16 = v7;
  dispatch_async((dispatch_queue_t)v11, block);
}

uint64_t __72__AVCSessionParticipant_dispatchedCompleteAudioPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 0, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:audioPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)completeAudioPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  NSObject *stateQueue;
  _QWORD v7[6];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__AVCSessionParticipant_completeAudioPaused_didSucceed_error___block_invoke;
  v7[3] = &unk_1E9E54C98;
  v8 = a3;
  v9 = a4;
  v7[4] = self;
  v7[5] = a5;
  if (stateQueue)
    dispatch_async(stateQueue, v7);
}

uint64_t __62__AVCSessionParticipant_completeAudioPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedCompleteAudioPaused:didSucceed:error:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
}

- (void)dispatchedCompleteVideoEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  _BOOL8 v7;
  int v9;
  OS_dispatch_queue *v10;
  _QWORD block[6];
  int v12;
  _BOOL4 v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;

  v6 = a4;
  v7 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5540), "unsignedIntValue");
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7), &unk_1E9EF5540);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), CFSTR("vcSessionParameterVideoEnabled"));
  }
  v10 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AVCSessionParticipant_dispatchedCompleteVideoEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E56870;
  v12 = v9;
  v13 = v7;
  v14 = v6;
  block[4] = self;
  block[5] = a5;
  v15 = v7;
  dispatch_async((dispatch_queue_t)v10, block);
}

uint64_t __73__AVCSessionParticipant_dispatchedCompleteVideoEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 1, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
    if (*(_BYTE *)(a1 + 56))
      v4 = 0;
    else
      v4 = *(_QWORD *)(a1 + 40);
    result = objc_msgSend(v3, "participant:videoEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 57) != 0, *(unsigned __int8 *)(a1 + 56) != 0, v4);
  }
  if (*(_BYTE *)(a1 + 57) && *(_DWORD *)(a1 + 48) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:videoPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), 0, 1, 0);
  }
  return result;
}

- (void)completeVideoEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  NSObject *stateQueue;
  _QWORD v7[6];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AVCSessionParticipant_completeVideoEnabled_didSucceed_error___block_invoke;
  v7[3] = &unk_1E9E54C98;
  v8 = a3;
  v9 = a4;
  v7[4] = self;
  v7[5] = a5;
  if (stateQueue)
    dispatch_async(stateQueue, v7);
}

uint64_t __63__AVCSessionParticipant_completeVideoEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedCompleteVideoEnabled:didSucceed:error:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
}

- (void)dispatchedCompleteVideoPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  _BOOL8 v7;
  int v9;
  uint64_t v10;
  OS_dispatch_queue *v11;
  _QWORD block[6];
  int v13;
  int v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;

  v6 = a4;
  v7 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5540), "unsignedIntValue");
  if (v7)
    v10 = 2;
  else
    v10 = 1;
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10), &unk_1E9EF5540);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), CFSTR("vcSessionParameterVideoPaused"));
  }
  v11 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AVCSessionParticipant_dispatchedCompleteVideoPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E56870;
  v13 = v9;
  v14 = v10;
  v15 = v6;
  block[4] = self;
  block[5] = a5;
  v16 = v7;
  dispatch_async((dispatch_queue_t)v11, block);
}

uint64_t __72__AVCSessionParticipant_dispatchedCompleteVideoPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 1, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:videoPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)completeVideoPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  NSObject *stateQueue;
  _QWORD v7[6];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__AVCSessionParticipant_completeVideoPaused_didSucceed_error___block_invoke;
  v7[3] = &unk_1E9E54C98;
  v8 = a3;
  v9 = a4;
  v7[4] = self;
  v7[5] = a5;
  if (stateQueue)
    dispatch_async(stateQueue, v7);
}

uint64_t __62__AVCSessionParticipant_completeVideoPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedCompleteVideoPaused:didSucceed:error:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
}

- (void)dispatchedCompleteScreenEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  _BOOL8 v7;
  int v9;
  OS_dispatch_queue *v10;
  _QWORD block[6];
  int v12;
  _BOOL4 v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;

  v6 = a4;
  v7 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (-[AVCSessionParticipant isConnectedToSession](self, "isConnectedToSession"))
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5558), "unsignedIntValue");
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7), &unk_1E9EF5558);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7), &unk_1E9EF5570);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), CFSTR("vcSessionParameterScreenEnabled"));
  }
  v10 = -[AVCSessionParticipant delegateNotificationQueue](self, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__AVCSessionParticipant_dispatchedCompleteScreenEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E56870;
  v12 = v9;
  v13 = v7;
  v14 = v6;
  block[4] = self;
  block[5] = a5;
  v15 = v7;
  dispatch_async((dispatch_queue_t)v10, block);
}

uint64_t __74__AVCSessionParticipant_dispatchedCompleteScreenEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
    if (*(_BYTE *)(a1 + 56))
      v4 = 0;
    else
      v4 = *(_QWORD *)(a1 + 40);
    return objc_msgSend(v3, "participant:screenEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 57) != 0, *(unsigned __int8 *)(a1 + 56) != 0, v4);
  }
  return result;
}

- (void)completeScreenEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  NSObject *stateQueue;
  _QWORD v7[6];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AVCSessionParticipant_completeScreenEnabled_didSucceed_error___block_invoke;
  v7[3] = &unk_1E9E54C98;
  v8 = a3;
  v9 = a4;
  v7[4] = self;
  v7[5] = a5;
  if (stateQueue)
    dispatch_async(stateQueue, v7);
}

uint64_t __64__AVCSessionParticipant_completeScreenEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedCompleteScreenEnabled:didSucceed:error:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
}

- (BOOL)isConnectedToSession
{
  return -[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection") != 0;
}

- (unsigned)dispatchedMediaStateForMediaType:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "unsignedIntValue");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (AVCSessionParticipantDelegate)delegate
{
  return (AVCSessionParticipantDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setSharedXPCConnection:(id)a3
{
  if (a3)
  {
    objc_storeWeak((id *)&self->_connection, a3);
    -[AVCSessionParticipant registerBlocksForNotifications](self, "registerBlocksForNotifications");
  }
  else
  {
    -[AVCSessionParticipant deregisterFromNotifications](self, "deregisterFromNotifications");
    objc_storeWeak((id *)&self->_connection, 0);
  }
}

- (VCXPCClientShared)sharedXPCConnection
{
  return (VCXPCClientShared *)objc_loadWeak((id *)&self->_connection);
}

- (void)setVideoToken:(int64_t)a3
{
  self->_videoToken = a3;
}

- (void)setScreenToken:(int64_t)a3
{
  self->_screenToken = a3;
}

- (void)setStreamTokens:(id)a3
{
  NSDictionary *streamGroupIDToStreamTokenMap;

  streamGroupIDToStreamTokenMap = self->_streamGroupIDToStreamTokenMap;
  if (streamGroupIDToStreamTokenMap != a3)
  {

    self->_streamGroupIDToStreamTokenMap = (NSDictionary *)a3;
  }
}

- (void)setMediaTypeToSpatialSourceIDMap:(id)a3
{
  NSDictionary *mediaTypeToSpatialSourceIDMap;

  mediaTypeToSpatialSourceIDMap = self->_mediaTypeToSpatialSourceIDMap;
  if (mediaTypeToSpatialSourceIDMap != a3)
  {

    self->_mediaTypeToSpatialSourceIDMap = (NSDictionary *)a3;
  }
}

- (unint64_t)spatialAudioSourceID
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_mediaTypeToSpatialSourceIDMap, "objectForKeyedSubscript:", &unk_1E9EF5528), "unsignedIntValue");
}

- (int64_t)streamTokenForStreamGroupID:(unsigned int)a3
{
  NSDictionary *streamGroupIDToStreamTokenMap;
  void *v4;

  streamGroupIDToStreamTokenMap = self->_streamGroupIDToStreamTokenMap;
  if (a3 == 1835623282)
    v4 = &unk_1E9EF5588;
  else
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](streamGroupIDToStreamTokenMap, "objectForKeyedSubscript:", v4), "unsignedIntValue");
}

- (NSDictionary)config
{
  return &self->_participantConfig->super;
}

- (unint64_t)spatialAudioSourceIDForMediaType:(unsigned int)a3
{
  uint64_t v5;
  id v6;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  AVCSessionParticipant *v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = VCSessionMediaType_FromAVCSessionMediaType(*(uint64_t *)&a3);
  if ((_DWORD)v5 == -1)
  {
    if ((AVCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCSessionParticipant spatialAudioSourceIDForMediaType:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v19 = 136316418;
          v20 = v15;
          v21 = 2080;
          v22 = "-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]";
          v23 = 1024;
          v24 = 965;
          v25 = 2112;
          v26 = v8;
          v27 = 2048;
          v28 = self;
          v29 = 1024;
          v30 = a3;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid mediaType=%d", (uint8_t *)&v19, 0x36u);
        }
      }
    }
    return 0;
  }
  v6 = -[NSDictionary objectForKeyedSubscript:](self->_mediaTypeToSpatialSourceIDMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5));
  if (v6)
    return objc_msgSend(v6, "unsignedLongLongValue");
  if ((AVCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v19 = 136315906;
    v20 = v10;
    v21 = 2080;
    v22 = "-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]";
    v23 = 1024;
    v24 = 968;
    v25 = 1024;
    LODWORD(v26) = a3;
    v12 = " [%s] %s:%d Source ID not found for mediaType=%d";
    v13 = v11;
    v14 = 34;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v19 = 136316418;
    v20 = v17;
    v21 = 2080;
    v22 = "-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]";
    v23 = 1024;
    v24 = 968;
    v25 = 2112;
    v26 = v9;
    v27 = 2048;
    v28 = self;
    v29 = 1024;
    v30 = a3;
    v12 = " [%s] %s:%d %@(%p) Source ID not found for mediaType=%d";
    v13 = v18;
    v14 = 54;
  }
  _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, v14);
  return 0;
}

+ (id)loopbackNegotiationDataWithData:(id)a3
{
  id v3;
  void *v4;

  v3 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", a3);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), CFSTR("vcSessionParticipantKeyUUID"));
  return +[VCSessionParticipant participantDataWithParticipantInfo:](VCSessionParticipant, "participantDataWithParticipantInfo:", v4);
}

- (id)newNSErrorWithErrorDictionary:(id)a3
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
  else
    return 0;
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke;
  v20[3] = &unk_1E9E52730;
  v20[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionVideoEnabledDidSucceed", v20);
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_119;
  v19[3] = &unk_1E9E52730;
  v19[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionScreenEnabledDidSucceed", v19);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_121;
  v18[3] = &unk_1E9E52730;
  v18[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionAudioEnabledDidSucceed", v18);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_123;
  v17[3] = &unk_1E9E52730;
  v17[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionRemoteAudioEnabledDidChange", v17);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2;
  v16[3] = &unk_1E9E52730;
  v16[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionRemoteVideoEnabledDidChange", v16);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_132;
  v15[3] = &unk_1E9E52730;
  v15[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionRemoteScreenEnabledDidChange", v15);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_137;
  v14[3] = &unk_1E9E52730;
  v14[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionRemoteMediaStateDidChange", v14);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_142;
  v13[3] = &unk_1E9E52730;
  v13[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionRemoteMixingMediaDidChange", v13);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_151;
  v12[3] = &unk_1E9E52730;
  v12[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionAudioPausedDidSucceed", v12);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_153;
  v11[3] = &unk_1E9E52730;
  v11[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionVideoPausedDidSucceed", v11);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_155;
  v10[3] = &unk_1E9E52730;
  v10[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionRemoteAudioPausedDidChange", v10);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_160;
  v9[3] = &unk_1E9E52730;
  v9[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionRemoteVideoPausedDidChange", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_165;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionMediaStateDidChange", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_3;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionMediaPrioritiesDidChange", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_175;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionReactionDidStart", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_182;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[VCXPCClientShared registerBlockWithUUID:service:block:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "registerBlockWithUUID:service:block:", self->_participantID, "vcSessionReactionDidStopReacting", v5);
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _BYTE v18[24];
  __int128 v19;
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVideoEnabled")), "BOOLValue");
      v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316418;
        *(_QWORD *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1003;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = objc_msgSend(v6, "uuid");
        HIWORD(v19) = 1024;
        *(_DWORD *)v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        v12 = " [%s] %s:%d Participant[%@] received callback for video enabled[%d] did succeed[%d]";
        v13 = v11;
        v14 = 50;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316930;
        *(_QWORD *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1003;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(_QWORD *)v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(_QWORD *)&v20[10] = objc_msgSend(v6, "uuid");
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for video enabled[%d] did succeed[%d]";
        v13 = v16;
        v14 = 70;
      }
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      v17 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError"), *(_OWORD *)v18, *(_QWORD *)&v18[16], v19, *(_QWORD *)v20, *(_OWORD *)&v20[8], v21, v22));
      objc_msgSend(v6, "completeVideoEnabled:didSucceed:error:", v7, v8, v17);

    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_119(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _BYTE v18[24];
  __int128 v19;
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterScreenEnabled")), "BOOLValue");
      v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316418;
        *(_QWORD *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1021;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = objc_msgSend(v6, "uuid");
        HIWORD(v19) = 1024;
        *(_DWORD *)v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        v12 = " [%s] %s:%d Participant[%@] received callback for screen enabled[%d] did succeed[%d]";
        v13 = v11;
        v14 = 50;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316930;
        *(_QWORD *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1021;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(_QWORD *)v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(_QWORD *)&v20[10] = objc_msgSend(v6, "uuid");
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for screen enabled[%d] did succeed[%d]";
        v13 = v16;
        v14 = 70;
      }
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      v17 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError"), *(_OWORD *)v18, *(_QWORD *)&v18[16], v19, *(_QWORD *)v20, *(_OWORD *)&v20[8], v21, v22));
      objc_msgSend(v6, "completeScreenEnabled:didSucceed:error:", v7, v8, v17);

    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_121(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _BYTE v18[24];
  __int128 v19;
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioEnabled")), "BOOLValue");
      v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316418;
        *(_QWORD *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1039;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = objc_msgSend(v6, "uuid");
        HIWORD(v19) = 1024;
        *(_DWORD *)v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        v12 = " [%s] %s:%d Participant[%@] received callback for audio enabled[%d] did succeed[%d]";
        v13 = v11;
        v14 = 50;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316930;
        *(_QWORD *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1039;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(_QWORD *)v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(_QWORD *)&v20[10] = objc_msgSend(v6, "uuid");
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for audio enabled[%d] did succeed[%d]";
        v13 = v16;
        v14 = 70;
      }
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      v17 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError"), *(_OWORD *)v18, *(_QWORD *)&v18[16], v19, *(_QWORD *)v20, *(_OWORD *)&v20[8], v21, v22));
      objc_msgSend(v6, "completeAudioEnabled:didSucceed:error:", v7, v8, v17);

    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_123(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioEnabled")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316162;
        v20 = v9;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 1056;
        v25 = 2112;
        v26 = objc_msgSend(v6, "uuid");
        v27 = 1024;
        LODWORD(v28) = v7;
        v11 = " [%s] %s:%d Participant[%@] received callback for remote audio enabled[%d] did change";
        v12 = v10;
        v13 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316674;
        v20 = v14;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 1056;
        v25 = 2112;
        v26 = (uint64_t)v8;
        v27 = 2048;
        v28 = v6;
        v29 = 2112;
        v30 = objc_msgSend(v6, "uuid");
        v31 = 1024;
        v32 = v7;
        v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote audio enabled[%d] did change";
        v12 = v15;
        v13 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      v16 = objc_msgSend(v6, "delegateNotificationQueue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_124;
      v17[3] = &unk_1E9E521E8;
      v17[4] = v6;
      v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_124(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:remoteAudioEnabledDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVideoEnabled")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316162;
        v20 = v9;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        v23 = 1024;
        v24 = 1075;
        v25 = 2112;
        v26 = objc_msgSend(v6, "uuid");
        v27 = 1024;
        LODWORD(v28) = v7;
        v11 = " [%s] %s:%d Participant[%@] received callback for remote video enabled[%d] did change";
        v12 = v10;
        v13 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316674;
        v20 = v14;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 1075;
        v25 = 2112;
        v26 = (uint64_t)v8;
        v27 = 2048;
        v28 = v6;
        v29 = 2112;
        v30 = objc_msgSend(v6, "uuid");
        v31 = 1024;
        v32 = v7;
        v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote video enabled[%d] did change";
        v12 = v15;
        v13 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      v16 = objc_msgSend(v6, "delegateNotificationQueue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_128;
      v17[3] = &unk_1E9E521E8;
      v17[4] = v6;
      v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_128(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:remoteVideoEnabledDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_132(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterScreenEnabled")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316162;
        v20 = v9;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        v23 = 1024;
        v24 = 1094;
        v25 = 2112;
        v26 = objc_msgSend(v6, "uuid");
        v27 = 1024;
        LODWORD(v28) = v7;
        v11 = " [%s] %s:%d Participant[%@] received callback for remote screen video enabled[%d] did change";
        v12 = v10;
        v13 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316674;
        v20 = v14;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 1094;
        v25 = 2112;
        v26 = (uint64_t)v8;
        v27 = 2048;
        v28 = v6;
        v29 = 2112;
        v30 = objc_msgSend(v6, "uuid");
        v31 = 1024;
        v32 = v7;
        v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote screen video enabled[%d] did change";
        v12 = v15;
        v13 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      objc_msgSend(v6, "setRemoteScreenEnabled:", v7);
      v16 = objc_msgSend(v6, "delegateNotificationQueue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_133;
      v17[3] = &unk_1E9E521E8;
      v17[4] = v6;
      v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_133(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:remoteScreenEnabledDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_137(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  int v19;
  int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (__CFString *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMediaType")), "unsignedIntValue");
      v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMediaState")), "unsignedIntValue");
      if ((__CFString *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316418;
        v22 = v10;
        v23 = 2080;
        v24 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        v25 = 1024;
        v26 = 1114;
        v27 = 2112;
        v28 = -[__CFString uuid](v6, "uuid");
        v29 = 2112;
        v30 = VCSessionMediaType_Name(v7);
        v31 = 2112;
        v32 = VCSessionMediaState_Name(v8);
        v12 = " [%s] %s:%d Participant=%@ received callback for remote mediaType=%@ change to mediaState=%@";
        v13 = v11;
        v14 = 58;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)-[__CFString performSelector:](v6, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316930;
        v22 = v15;
        v23 = 2080;
        v24 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v25 = 1024;
        v26 = 1114;
        v27 = 2112;
        v28 = (uint64_t)v9;
        v29 = 2048;
        v30 = v6;
        v31 = 2112;
        v32 = (__CFString *)-[__CFString uuid](v6, "uuid");
        v33 = 2112;
        v34 = VCSessionMediaType_Name(v7);
        v35 = 2112;
        v36 = VCSessionMediaState_Name(v8);
        v12 = " [%s] %s:%d %@(%p) Participant=%@ received callback for remote mediaType=%@ change to mediaState=%@";
        v13 = v16;
        v14 = 78;
      }
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_15:
      v17 = -[__CFString delegateNotificationQueue](v6, "delegateNotificationQueue");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_138;
      v18[3] = &unk_1E9E52960;
      v18[4] = v6;
      v19 = v8;
      v20 = v7;
      dispatch_async(v17, v18);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_138(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 40));
    return objc_msgSend(v3, "participant:remoteMediaStateDidChange:forMediaType:", v4, v5, VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 44)));
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_142(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  int v19;
  int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (__CFString *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMediaType")), "unsignedIntValue");
      v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMixingMediaType")), "unsignedIntValue");
      if ((__CFString *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316418;
        v22 = v10;
        v23 = 2080;
        v24 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        v25 = 1024;
        v26 = 1136;
        v27 = 2112;
        v28 = -[__CFString uuid](v6, "uuid");
        v29 = 2112;
        v30 = VCSessionMediaType_Name(v7);
        v31 = 2112;
        v32 = VCSessionMediaType_Name(v8);
        v12 = " [%s] %s:%d Participant=%@ received callback for mediaType=%@ change to mixingMediaType=%@";
        v13 = v11;
        v14 = 58;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)-[__CFString performSelector:](v6, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316930;
        v22 = v15;
        v23 = 2080;
        v24 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v25 = 1024;
        v26 = 1136;
        v27 = 2112;
        v28 = (uint64_t)v9;
        v29 = 2048;
        v30 = v6;
        v31 = 2112;
        v32 = (__CFString *)-[__CFString uuid](v6, "uuid");
        v33 = 2112;
        v34 = VCSessionMediaType_Name(v7);
        v35 = 2112;
        v36 = VCSessionMediaType_Name(v8);
        v12 = " [%s] %s:%d %@(%p) Participant=%@ received callback for mediaType=%@ change to mixingMediaType=%@";
        v13 = v16;
        v14 = 78;
      }
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_15:
      v17 = -[__CFString delegateNotificationQueue](v6, "delegateNotificationQueue");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_145;
      v18[3] = &unk_1E9E52960;
      v19 = v7;
      v20 = v8;
      v18[4] = v6;
      dispatch_async(v17, v18);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_145(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = *(_DWORD *)(a1 + 44);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if (v2 == v3)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mixingDidStopForMediaType:", *(_QWORD *)(a1 + 32), VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 40)));
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = *(_QWORD *)(a1 + 32);
      v7 = VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 40));
      return objc_msgSend(v5, "participant:mixingDidStartForMediaType:mixingMediaType:", v6, v7, VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 44)));
    }
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_151(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _BYTE v18[24];
  __int128 v19;
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioPaused")), "BOOLValue");
      v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316418;
        *(_QWORD *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1162;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = objc_msgSend(v6, "uuid");
        HIWORD(v19) = 1024;
        *(_DWORD *)v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        v12 = " [%s] %s:%d Participant[%@] received callback for audio paused[%d] did succeed[%d]";
        v13 = v11;
        v14 = 50;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316930;
        *(_QWORD *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1162;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(_QWORD *)v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(_QWORD *)&v20[10] = objc_msgSend(v6, "uuid");
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for audio paused[%d] did succeed[%d]";
        v13 = v16;
        v14 = 70;
      }
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      v17 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError"), *(_OWORD *)v18, *(_QWORD *)&v18[16], v19, *(_QWORD *)v20, *(_OWORD *)&v20[8], v21, v22));
      objc_msgSend(v6, "completeAudioPaused:didSucceed:error:", v7, v8, 0);

    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_153(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _BYTE v18[24];
  __int128 v19;
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVideoPaused")), "BOOLValue");
      v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316418;
        *(_QWORD *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1179;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = objc_msgSend(v6, "uuid");
        HIWORD(v19) = 1024;
        *(_DWORD *)v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        v12 = " [%s] %s:%d Participant[%@] received callback for video paused[%d] did succeed[%d]";
        v13 = v11;
        v14 = 50;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)v18 = 136316930;
        *(_QWORD *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(_QWORD *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1179;
        WORD2(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(_QWORD *)v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(_QWORD *)&v20[10] = objc_msgSend(v6, "uuid");
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for video paused[%d] did succeed[%d]";
        v13 = v16;
        v14 = 70;
      }
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      v17 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError"), *(_OWORD *)v18, *(_QWORD *)&v18[16], v19, *(_QWORD *)v20, *(_OWORD *)&v20[8], v21, v22));
      objc_msgSend(v6, "completeVideoPaused:didSucceed:error:", v7, v8, 0);

    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_155(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterAudioPaused")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316162;
        v20 = v9;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 1196;
        v25 = 2112;
        v26 = objc_msgSend(v6, "uuid");
        v27 = 1024;
        LODWORD(v28) = v7;
        v11 = " [%s] %s:%d Participant[%@] received callback for remote audio paused[%d] did change";
        v12 = v10;
        v13 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316674;
        v20 = v14;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 1196;
        v25 = 2112;
        v26 = (uint64_t)v8;
        v27 = 2048;
        v28 = v6;
        v29 = 2112;
        v30 = objc_msgSend(v6, "uuid");
        v31 = 1024;
        v32 = v7;
        v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote audio paused[%d] did change";
        v12 = v15;
        v13 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      v16 = objc_msgSend(v6, "delegateNotificationQueue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_156;
      v17[3] = &unk_1E9E521E8;
      v17[4] = v6;
      v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_156(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:remoteAudioPausedDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_160(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterVideoPaused")), "BOOLValue");
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316162;
        v20 = v9;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        v23 = 1024;
        v24 = 1215;
        v25 = 2112;
        v26 = objc_msgSend(v6, "uuid");
        v27 = 1024;
        LODWORD(v28) = v7;
        v11 = " [%s] %s:%d Participant[%@] received callback for remote video paused[%d] did change";
        v12 = v10;
        v13 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_15;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316674;
        v20 = v14;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 1215;
        v25 = 2112;
        v26 = (uint64_t)v8;
        v27 = 2048;
        v28 = v6;
        v29 = 2112;
        v30 = objc_msgSend(v6, "uuid");
        v31 = 1024;
        v32 = v7;
        v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote video paused[%d] did change";
        v12 = v15;
        v13 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      v16 = objc_msgSend(v6, "delegateNotificationQueue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_161;
      v17[3] = &unk_1E9E521E8;
      v17[4] = v6;
      v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_161(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:remoteVideoPausedDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_165(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMediaType")), "unsignedIntValue");
      v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterMediaState")), "unsignedIntValue");
      v9 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded")), "BOOLValue");
      v10 = (id)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError")));
      objc_msgSend(v6, "completeSetMediaState:forMediaType:didSucceed:error:", v8, v7, v9, 0);

    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterParticipantMediaPriority"));
      v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterParticipantMediaPriorityString"));
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          goto LABEL_20;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        v12 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v25 = v10;
            v26 = 2080;
            v27 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_3";
            v28 = 1024;
            v29 = 1254;
            v30 = 2112;
            v31 = objc_msgSend(v6, "uuid");
            v32 = 2112;
            v33 = v7;
            v34 = 2112;
            v35 = v8;
            v13 = " [%s] %s:%d Participant[%@] received callback for media priority change:[%@] (%@)";
            v14 = v11;
            v15 = 58;
LABEL_16:
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
          }
LABEL_20:
          v22 = objc_msgSend(v6, "delegateNotificationQueue");
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_171;
          block[3] = &unk_1E9E527D0;
          block[4] = v6;
          block[5] = v7;
          block[6] = v8;
          dispatch_async(v22, block);
          return;
        }
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          goto LABEL_20;
        *(_DWORD *)buf = 136316418;
        v25 = v10;
        v26 = 2080;
        v27 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v28 = 1024;
        v29 = 1254;
        v30 = 2112;
        v31 = objc_msgSend(v6, "uuid");
        v32 = 2112;
        v33 = v7;
        v34 = 2112;
        v35 = v8;
        v19 = " [%s] %s:%d Participant[%@] received callback for media priority change:[%@] (%@)";
        v20 = v11;
        v21 = 58;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          goto LABEL_20;
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        v18 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316930;
            v25 = v16;
            v26 = 2080;
            v27 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
            v28 = 1024;
            v29 = 1254;
            v30 = 2112;
            v31 = (uint64_t)v9;
            v32 = 2048;
            v33 = (uint64_t)v6;
            v34 = 2112;
            v35 = objc_msgSend(v6, "uuid");
            v36 = 2112;
            v37 = v7;
            v38 = 2112;
            v39 = v8;
            v13 = " [%s] %s:%d %@(%p) Participant[%@] received callback for media priority change:[%@] (%@)";
            v14 = v17;
            v15 = 78;
            goto LABEL_16;
          }
          goto LABEL_20;
        }
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          goto LABEL_20;
        *(_DWORD *)buf = 136316930;
        v25 = v16;
        v26 = 2080;
        v27 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v28 = 1024;
        v29 = 1254;
        v30 = 2112;
        v31 = (uint64_t)v9;
        v32 = 2048;
        v33 = (uint64_t)v6;
        v34 = 2112;
        v35 = objc_msgSend(v6, "uuid");
        v36 = 2112;
        v37 = v7;
        v38 = 2112;
        v39 = v8;
        v19 = " [%s] %s:%d %@(%p) Participant[%@] received callback for media priority change:[%@] (%@)";
        v20 = v17;
        v21 = 78;
      }
      _os_log_debug_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
      goto LABEL_20;
    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_171(uint64_t a1)
{
  unsigned int v2;
  id v3;
  unsigned int v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  _BYTE v22[24];
  __int128 v23;
  id v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue");
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (*(_QWORD *)(a1 + 48))
    {
      if (v2 >= 0xFF)
        v4 = 255;
      else
        v4 = v2;
      if (v4 <= 1)
        LOWORD(v4) = 1;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unsigned __int16)(254 * v4 - 254) / 0xFEu + 1), *(_QWORD *)(a1 + 48));
    }
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_25;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)v22 = 136316162;
          *(_QWORD *)&v22[4] = v6;
          *(_WORD *)&v22[12] = 2080;
          *(_QWORD *)&v22[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v22[22] = 1024;
          LODWORD(v23) = 1263;
          WORD2(v23) = 2112;
          *(_QWORD *)((char *)&v23 + 6) = v9;
          HIWORD(v23) = 2112;
          v24 = v3;
          v10 = " [%s] %s:%d [Media Priority] Participant[%@] calling mediaPrioritiesDidChange:%@";
          v11 = v7;
          v12 = 48;
LABEL_21:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v22, v12);
        }
LABEL_25:
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v22, *(_QWORD *)&v22[16], v23, v24, *(_OWORD *)v25, *(_QWORD *)&v25[16]), "participant:mediaPrioritiesDidChange:", *(_QWORD *)(a1 + 32), v3);

        return;
      }
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        goto LABEL_25;
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v22 = 136316162;
      *(_QWORD *)&v22[4] = v6;
      *(_WORD *)&v22[12] = 2080;
      *(_QWORD *)&v22[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v22[22] = 1024;
      LODWORD(v23) = 1263;
      WORD2(v23) = 2112;
      *(_QWORD *)((char *)&v23 + 6) = v21;
      HIWORD(v23) = 2112;
      v24 = v3;
      v18 = " [%s] %s:%d [Media Priority] Participant[%@] calling mediaPrioritiesDidChange:%@";
      v19 = v7;
      v20 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_25;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      v15 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(void **)(a1 + 32);
          *(_DWORD *)v22 = 136316674;
          *(_QWORD *)&v22[4] = v13;
          *(_WORD *)&v22[12] = 2080;
          *(_QWORD *)&v22[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v22[22] = 1024;
          LODWORD(v23) = 1263;
          WORD2(v23) = 2112;
          *(_QWORD *)((char *)&v23 + 6) = v5;
          HIWORD(v23) = 2048;
          v24 = v16;
          *(_WORD *)v25 = 2112;
          *(_QWORD *)&v25[2] = v16;
          *(_WORD *)&v25[10] = 2112;
          *(_QWORD *)&v25[12] = v3;
          v10 = " [%s] %s:%d %@(%p) [Media Priority] Participant[%@] calling mediaPrioritiesDidChange:%@";
          v11 = v14;
          v12 = 68;
          goto LABEL_21;
        }
        goto LABEL_25;
      }
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        goto LABEL_25;
      v17 = *(void **)(a1 + 32);
      *(_DWORD *)v22 = 136316674;
      *(_QWORD *)&v22[4] = v13;
      *(_WORD *)&v22[12] = 2080;
      *(_QWORD *)&v22[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v22[22] = 1024;
      LODWORD(v23) = 1263;
      WORD2(v23) = 2112;
      *(_QWORD *)((char *)&v23 + 6) = v5;
      HIWORD(v23) = 2048;
      v24 = v17;
      *(_WORD *)v25 = 2112;
      *(_QWORD *)&v25[2] = v17;
      *(_WORD *)&v25[10] = 2112;
      *(_QWORD *)&v25[12] = v3;
      v18 = " [%s] %s:%d %@(%p) [Media Priority] Participant[%@] calling mediaPrioritiesDidChange:%@";
      v19 = v14;
      v20 = 68;
    }
    _os_log_debug_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEBUG, v18, v22, v20);
    goto LABEL_25;
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_175(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      if (objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_16;
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)buf = 136316162;
        v20 = v8;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 1279;
        v25 = 2112;
        v26 = objc_msgSend(v6, "uuid");
        v27 = 2112;
        v28 = a2;
        v10 = " [%s] %s:%d Participant[%@] received callback for reaction did start status=%@";
        v11 = v9;
        v12 = 48;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_16;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)buf = 136316674;
        v20 = v13;
        v21 = 2080;
        v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 1279;
        v25 = 2112;
        v26 = (uint64_t)v7;
        v27 = 2048;
        v28 = v6;
        v29 = 2112;
        v30 = objc_msgSend(v6, "uuid");
        v31 = 2112;
        v32 = a2;
        v10 = " [%s] %s:%d %@(%p) Participant[%@] received callback for reaction did start status=%@";
        v11 = v14;
        v12 = 68;
      }
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_16:
      v15 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterReactionType"));
      if (v15)
      {
        v16 = v15;
        v17 = objc_msgSend(v6, "delegateNotificationQueue");
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_178;
        v18[3] = &unk_1E9E52238;
        v18[4] = v6;
        v18[5] = v16;
        dispatch_async(v17, v18);
      }
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_178(uint64_t a1)
{
  uint64_t result;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[24];
  __int128 v25;
  uint64_t v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16]), "participant:didReact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(_QWORD *)(a1 + 32);
          v8 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)v24 = 136316162;
          *(_QWORD *)&v24[4] = v4;
          *(_WORD *)&v24[12] = 2080;
          *(_QWORD *)&v24[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v24[22] = 1024;
          LODWORD(v25) = 1286;
          WORD2(v25) = 2112;
          *(_QWORD *)((char *)&v25 + 6) = v7;
          HIWORD(v25) = 2112;
          v26 = v8;
          v9 = " [%s] %s:%d Participant[%@] calling didReact:%@";
          v10 = v5;
          v11 = 48;
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v24, v11);
        }
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16]), "participant:didReact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16]), "participant:didReact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v24 = 136316162;
      *(_QWORD *)&v24[4] = v4;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 1286;
      WORD2(v25) = 2112;
      *(_QWORD *)((char *)&v25 + 6) = v22;
      HIWORD(v25) = 2112;
      v26 = v23;
      v19 = " [%s] %s:%d Participant[%@] calling didReact:%@";
      v20 = v5;
      v21 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16]), "participant:didReact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 32);
          v16 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)v24 = 136316674;
          *(_QWORD *)&v24[4] = v12;
          *(_WORD *)&v24[12] = 2080;
          *(_QWORD *)&v24[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v24[22] = 1024;
          LODWORD(v25) = 1286;
          WORD2(v25) = 2112;
          *(_QWORD *)((char *)&v25 + 6) = v3;
          HIWORD(v25) = 2048;
          v26 = v15;
          *(_WORD *)v27 = 2112;
          *(_QWORD *)&v27[2] = v15;
          *(_WORD *)&v27[10] = 2112;
          *(_QWORD *)&v27[12] = v16;
          v9 = " [%s] %s:%d %@(%p) Participant[%@] calling didReact:%@";
          v10 = v13;
          v11 = 68;
          goto LABEL_14;
        }
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16]), "participant:didReact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16]), "participant:didReact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v24 = 136316674;
      *(_QWORD *)&v24[4] = v12;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 1286;
      WORD2(v25) = 2112;
      *(_QWORD *)((char *)&v25 + 6) = v3;
      HIWORD(v25) = 2048;
      v26 = v17;
      *(_WORD *)v27 = 2112;
      *(_QWORD *)&v27[2] = v17;
      *(_WORD *)&v27[10] = 2112;
      *(_QWORD *)&v27[12] = v18;
      v19 = " [%s] %s:%d %@(%p) Participant[%@] calling didReact:%@";
      v20 = v13;
      v21 = 68;
    }
    _os_log_debug_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEBUG, v19, v24, v21);
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16]), "participant:didReact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_182(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = (void *)v4;
      if (objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136315906;
        v17 = v7;
        v18 = 2080;
        v19 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v20 = 1024;
        v21 = 1301;
        v22 = 2112;
        v23 = objc_msgSend(v5, "uuid");
        v9 = " [%s] %s:%d Participant[%@] did stop reacting";
        v10 = v8;
        v11 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316418;
        v17 = v12;
        v18 = 2080;
        v19 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        v20 = 1024;
        v21 = 1301;
        v22 = 2112;
        v23 = (uint64_t)v6;
        v24 = 2048;
        v25 = v5;
        v26 = 2112;
        v27 = objc_msgSend(v5, "uuid");
        v9 = " [%s] %s:%d %@(%p) Participant[%@] did stop reacting";
        v10 = v13;
        v11 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_15:
      v14 = objc_msgSend(v5, "delegateNotificationQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_183;
      block[3] = &unk_1E9E521C0;
      block[4] = v5;
      dispatch_async(v14, block);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_183(uint64_t a1)
{
  id *v1;
  uint64_t result;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  _BYTE v16[24];
  __int128 v17;
  id v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if ((id)objc_opt_class() == *v1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        v6 = *MEMORY[0x1E0CF2758];
        if (!*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
            __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_183_cold_1();
          return objc_msgSend((id)objc_msgSend(*v1, "delegate", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17, v18, v19), "participantDidStopReacting:", *v1);
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *v1;
          *(_DWORD *)v16 = 136315906;
          *(_QWORD *)&v16[4] = v4;
          *(_WORD *)&v16[12] = 2080;
          *(_QWORD *)&v16[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 1304;
          WORD2(v17) = 2112;
          *(_QWORD *)((char *)&v17 + 6) = v7;
          v8 = " [%s] %s:%d Participant[%@] calling didStopReacting";
          v9 = v5;
          v10 = 38;
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v16, v10);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*v1, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        return objc_msgSend((id)objc_msgSend(*v1, "delegate", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17, v18, v19), "participantDidStopReacting:", *v1);
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v15 = *v1;
          *(_DWORD *)v16 = 136316418;
          *(_QWORD *)&v16[4] = v11;
          *(_WORD *)&v16[12] = 2080;
          *(_QWORD *)&v16[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 1304;
          WORD2(v17) = 2112;
          *(_QWORD *)((char *)&v17 + 6) = v3;
          HIWORD(v17) = 2048;
          v18 = v15;
          LOWORD(v19) = 2112;
          *(_QWORD *)((char *)&v19 + 2) = v15;
          _os_log_debug_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) Participant[%@] calling didStopReacting", v16, 0x3Au);
        }
        return objc_msgSend((id)objc_msgSend(*v1, "delegate", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17, v18, v19), "participantDidStopReacting:", *v1);
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *v1;
        *(_DWORD *)v16 = 136316418;
        *(_QWORD *)&v16[4] = v11;
        *(_WORD *)&v16[12] = 2080;
        *(_QWORD *)&v16[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v16[22] = 1024;
        LODWORD(v17) = 1304;
        WORD2(v17) = 2112;
        *(_QWORD *)((char *)&v17 + 6) = v3;
        HIWORD(v17) = 2048;
        v18 = v14;
        LOWORD(v19) = 2112;
        *(_QWORD *)((char *)&v19 + 2) = v14;
        v8 = " [%s] %s:%d %@(%p) Participant[%@] calling didStopReacting";
        v9 = v12;
        v10 = 58;
        goto LABEL_14;
      }
    }
    return objc_msgSend((id)objc_msgSend(*v1, "delegate", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17, v18, v19), "participantDidStopReacting:", *v1);
  }
  return result;
}

- (void)deregisterFromNotifications
{
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionAudioEnabledDidSucceed");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionVideoEnabledDidSucceed");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionScreenEnabledDidSucceed");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionRemoteAudioEnabledDidChange");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionRemoteVideoEnabledDidChange");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionRemoteScreenEnabledDidChange");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionAudioPausedDidSucceed");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionVideoPausedDidSucceed");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionRemoteAudioPausedDidChange");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionRemoteVideoPausedDidChange");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionMediaPrioritiesDidChange");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionMediaStateDidChange");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionRemoteMediaStateDidChange");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionReactionDidStart");
  -[VCXPCClientShared deregisterWithUUID:service:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "deregisterWithUUID:service:", self->_participantID, "vcSessionReactionDidStopReacting");
}

- (void)setupNotificationQueue:(id)a3
{
  NSObject *CustomRootQueue;

  if (a3)
  {
    self->_delegateNotificationQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
  }
  else
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    self->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCSessionParticipant.notificationQueue", 0, CustomRootQueue);
  }
}

- (BOOL)setupMediaStates
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  _BOOL4 v34;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  char *v38;
  __CFString *v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  uint64_t v43;
  NSObject *v44;
  char *v45;
  __CFString *v46;
  const __CFString *v47;
  uint64_t v48;
  NSObject *v49;
  __int128 v51;
  char *v52;
  id obj;
  _BYTE v54[128];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  AVCSessionParticipant *v68;
  __int16 v69;
  char *v70;
  __int16 v71;
  __CFString *v72;
  _BYTE v73[128];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v3 = +[VCSessionParticipant streamGroupIDsFromParticipantData:](VCSessionParticipant, "streamGroupIDsFromParticipantData:", self->_participantData);
  if (objc_msgSend(v3, "count"))
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v79, v78, 16);
    if (!v4)
    {
LABEL_29:
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v27 = (void *)-[NSMutableDictionary allKeys](self->_mediaStates, "allKeys");
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v56 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            v33 = +[AVCSessionParticipant defaultStateForMediaType:isLocal:](AVCSessionParticipant, "defaultStateForMediaType:isLocal:", objc_msgSend(v32, "unsignedIntValue"), self->_idsParticipantID == 0);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v33), v32);
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
        }
        while (v29);
      }
      LOBYTE(v34) = 1;
      return v34;
    }
    v6 = v4;
    v7 = *(_QWORD *)v80;
    v8 = &selRef_load;
    *(_QWORD *)&v5 = 136315906;
    v51 = v5;
    obj = v3;
LABEL_4:
    v9 = 0;
    v52 = v8[73];
    while (1)
    {
      if (*(_QWORD *)v80 != v7)
        objc_enumerationMutation(obj);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v9), "unsignedIntValue", v51);
      v11 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", v10);
      if (objc_msgSend(v11, "count"))
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v75;
LABEL_10:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v75 != v14)
              objc_enumerationMutation(v11);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v15), "unsignedIntValue");
            if (!-[AVCSessionParticipant generateMediaStateEntryForMediaType:](self, "generateMediaStateEntryForMediaType:", v16))break;
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
              if (v13)
                goto LABEL_10;
              goto LABEL_27;
            }
          }
          if ((AVCSessionParticipant *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_49;
            v36 = VRTraceErrorLogLevelToCSTR();
            v37 = *MEMORY[0x1E0CF2758];
            v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (v34)
            {
              v38 = FourccToCStr(v10);
              v39 = VCSessionMediaType_Name(v16);
              *(_DWORD *)buf = 136316162;
              v60 = v36;
              v61 = 2080;
              v62 = "-[AVCSessionParticipant setupMediaStates]";
              v63 = 1024;
              v64 = 1355;
              v65 = 2080;
              v66 = v38;
              v67 = 2112;
              v68 = (AVCSessionParticipant *)v39;
              v40 = " [%s] %s:%d Failed to add streamGroupID=%s for mediaType=%@";
              v41 = v37;
              goto LABEL_43;
            }
            return v34;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v35 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", v52);
          else
            v35 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_49;
          v43 = VRTraceErrorLogLevelToCSTR();
          v44 = *MEMORY[0x1E0CF2758];
          v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v34)
            return v34;
          v45 = FourccToCStr(v10);
          v46 = VCSessionMediaType_Name(v16);
          *(_DWORD *)buf = 136316674;
          v60 = v43;
          v61 = 2080;
          v62 = "-[AVCSessionParticipant setupMediaStates]";
          v63 = 1024;
          v64 = 1355;
          v65 = 2112;
          v66 = (void *)v35;
          v67 = 2048;
          v68 = self;
          v69 = 2080;
          v70 = v45;
          v71 = 2112;
          v72 = v46;
          v40 = " [%s] %s:%d %@(%p) Failed to add streamGroupID=%s for mediaType=%@";
          v41 = v44;
          v42 = 68;
LABEL_48:
          _os_log_error_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);
LABEL_49:
          LOBYTE(v34) = 0;
          return v34;
        }
      }
      else
      {
        if ((AVCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_27;
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          v26 = FourccToCStr(v10);
          *(_DWORD *)buf = v51;
          v60 = v24;
          v61 = 2080;
          v62 = "-[AVCSessionParticipant setupMediaStates]";
          v63 = 1024;
          v64 = 1348;
          v65 = 2080;
          v66 = v26;
          v21 = v25;
          v22 = " [%s] %s:%d Unknown streamGroupID=%s";
          v23 = 38;
        }
        else
        {
          v17 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v17 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", v52);
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_27;
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          v20 = FourccToCStr(v10);
          *(_DWORD *)buf = 136316418;
          v60 = v18;
          v61 = 2080;
          v62 = "-[AVCSessionParticipant setupMediaStates]";
          v63 = 1024;
          v64 = 1348;
          v65 = 2112;
          v66 = (void *)v17;
          v67 = 2048;
          v68 = self;
          v69 = 2080;
          v70 = v20;
          v21 = v19;
          v22 = " [%s] %s:%d %@(%p) Unknown streamGroupID=%s";
          v23 = 58;
        }
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
      }
LABEL_27:
      if (++v9 == v6)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v78, 16);
        v8 = &selRef_load;
        if (v6)
          goto LABEL_4;
        goto LABEL_29;
      }
    }
  }
  if ((AVCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_49;
    VRTraceErrorLogLevelToCSTR();
    v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v34)
    {
      -[AVCSessionParticipant setupMediaStates].cold.1();
      goto LABEL_49;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v47 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v47 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_49;
    v48 = VRTraceErrorLogLevelToCSTR();
    v49 = *MEMORY[0x1E0CF2758];
    v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v34)
    {
      *(_DWORD *)buf = 136316162;
      v60 = v48;
      v61 = 2080;
      v62 = "-[AVCSessionParticipant setupMediaStates]";
      v63 = 1024;
      v64 = 1342;
      v65 = 2112;
      v66 = (void *)v47;
      v67 = 2048;
      v68 = self;
      v40 = " [%s] %s:%d %@(%p) No stream groups found";
      v41 = v49;
LABEL_43:
      v42 = 48;
      goto LABEL_48;
    }
  }
  return v34;
}

+ (unsigned)defaultStateForMediaType:(unsigned int)a3 isLocal:(BOOL)a4
{
  if (a3 >= 3)
    return !a4;
  else
    return dword_1D910DB48[a3];
}

- (void)setupConfig
{
  NSMutableDictionary *v3;
  double v4;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_participantConfig = v3;
  self->_volume = 1.0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", self->_participantID, CFSTR("vcSessionParticipantID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_idsParticipantID), CFSTR("vcSessionIDSParticipantID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", self->_participantData, CFSTR("vcSessionParticipantData"));
  *(float *)&v4 = self->_volume;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("vcSessionParameterVolume"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_audioMuted), CFSTR("vcSessionParameterMute"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_videoQuality), CFSTR("vcSessionParameterVideoQuality"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_visibilityIndex), CFSTR("vcSessionParameterVisibilityIndex"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prominenceIndex), CFSTR("vcSessionParameterProminenceIndex"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", +[AVCSessionParticipant archiveMediaStates:](AVCSessionParticipant, "archiveMediaStates:", self->_mediaStates), CFSTR("vcSessionParameterMediaStates"));
  -[AVCSessionParticipant updateLegacyStates](self, "updateLegacyStates");
}

- (void)updateLegacyStates
{
  int v3;
  int v4;
  int v5;

  v3 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5528), "unsignedIntValue");
  v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5540), "unsignedIntValue");
  v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1E9EF5558), "unsignedIntValue");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 != 0), CFSTR("vcSessionParameterAudioEnabled"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4 != 0), CFSTR("vcSessionParameterVideoEnabled"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5 != 0), CFSTR("vcSessionParameterScreenEnabled"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 == 2), CFSTR("vcSessionParameterAudioPaused"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4 == 2), CFSTR("vcSessionParameterVideoPaused"));
}

- (void)appendConfigurationToXPCConfiguration:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 hasPendingChanges;
  NSString *participantID;
  int videoQuality;
  unsigned int visibilityIndex;
  unsigned int prominenceIndex;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  NSString *v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  _QWORD v27[4];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BYTE v35[20];
  _BYTE v36[6];
  NSString *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!self->_hasPendingChanges)
    return;
  if ((AVCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_13;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    hasPendingChanges = self->_hasPendingChanges;
    participantID = self->_participantID;
    videoQuality = self->_videoQuality;
    visibilityIndex = self->_visibilityIndex;
    prominenceIndex = self->_prominenceIndex;
    *(_DWORD *)buf = 136316930;
    v29 = v6;
    v30 = 2080;
    v31 = "-[AVCSessionParticipant appendConfigurationToXPCConfiguration:]";
    v32 = 1024;
    v33 = 1414;
    v34 = 1024;
    *(_DWORD *)v35 = hasPendingChanges;
    *(_WORD *)&v35[4] = 2112;
    *(_QWORD *)&v35[6] = participantID;
    *(_WORD *)&v35[14] = 1024;
    *(_DWORD *)&v35[16] = videoQuality;
    *(_WORD *)v36 = 1024;
    *(_DWORD *)&v36[2] = visibilityIndex;
    LOWORD(v37) = 1024;
    *(_DWORD *)((char *)&v37 + 2) = prominenceIndex;
    v13 = " [%s] %s:%d (%d) uuid=%@ videoQuality=%d visibilityIndex=%d prominenceIndex=%d";
    v14 = v7;
    v15 = 62;
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (const __CFString *)-[AVCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v5 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_hasPendingChanges;
      v19 = self->_participantID;
      v20 = self->_videoQuality;
      v21 = self->_visibilityIndex;
      v22 = self->_prominenceIndex;
      *(_DWORD *)buf = 136317442;
      v29 = v16;
      v30 = 2080;
      v31 = "-[AVCSessionParticipant appendConfigurationToXPCConfiguration:]";
      v32 = 1024;
      v33 = 1414;
      v34 = 2112;
      *(_QWORD *)v35 = v5;
      *(_WORD *)&v35[8] = 2048;
      *(_QWORD *)&v35[10] = self;
      *(_WORD *)&v35[18] = 1024;
      *(_DWORD *)v36 = v18;
      *(_WORD *)&v36[4] = 2112;
      v37 = v19;
      v38 = 1024;
      v39 = v20;
      v40 = 1024;
      v41 = v21;
      v42 = 1024;
      v43 = v22;
      v13 = " [%s] %s:%d %@(%p) (%d) uuid=%@ videoQuality=%d visibilityIndex=%d prominenceIndex=%d";
      v14 = v17;
      v15 = 82;
LABEL_12:
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
  }
LABEL_13:
  v23 = objc_alloc(MEMORY[0x1E0C99E08]);
  v27[0] = self->_participantID;
  v27[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_videoQuality, CFSTR("vcSessionParticipantID"), CFSTR("vcSessionParameterVideoQuality"));
  v26[2] = CFSTR("vcSessionParameterVisibilityIndex");
  v27[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_visibilityIndex);
  v26[3] = CFSTR("vcSessionParameterProminenceIndex");
  v27[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prominenceIndex);
  v24 = (void *)objc_msgSend(v23, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  if (-[VCPositionalInfo hasPendingChanges](self->_videoPositionalInfo, "hasPendingChanges"))
  {
    v25 = -[VCPositionalInfo serialize](self->_videoPositionalInfo, "serialize");
    if (v25)
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("vcSessionPositionalInfo"));
  }
  objc_msgSend(a3, "addObject:", v24);

  *(_WORD *)&self->_configurationInProgress = 0;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
  NSObject *stateQueue;

  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);
  self->_stateQueue = (OS_dispatch_queue *)a3;
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
}

+ (id)archiveMediaStates:(id)a3
{
  id result;
  BOOL v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  result = (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v15);
  if (result)
    v6 = v15 == 0;
  else
    v6 = 0;
  if (!v6)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136316162;
      v17 = v8;
      v18 = 2080;
      v19 = "+[AVCSessionParticipant archiveMediaStates:]";
      v20 = 1024;
      v21 = 1455;
      v22 = 2112;
      v23 = a3;
      v24 = 2112;
      v25 = v15;
      v10 = " [%s] %s:%d Failed to archive mediaStates=%@. error=%@";
      v11 = v9;
      v12 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136316674;
      v17 = v13;
      v18 = 2080;
      v19 = "+[AVCSessionParticipant archiveMediaStates:]";
      v20 = 1024;
      v21 = 1455;
      v22 = 2112;
      v23 = (id)v7;
      v24 = 2048;
      v25 = a1;
      v26 = 2112;
      v27 = a3;
      v28 = 2112;
      v29 = v15;
      v10 = " [%s] %s:%d %@(%p) Failed to archive mediaStates=%@. error=%@";
      v11 = v14;
      v12 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    return 0;
  }
  return result;
}

+ (id)unarchiveMediaStatesWithData:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), a3, &v17);
  if (v7)
    return v7;
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return v7;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return v7;
    *(_DWORD *)buf = 136315906;
    v19 = v10;
    v20 = 2080;
    v21 = "+[AVCSessionParticipant unarchiveMediaStatesWithData:]";
    v22 = 1024;
    v23 = 1465;
    v24 = 2112;
    v25 = v17;
    v12 = " [%s] %s:%d Failed to decode the media state dictionary. error=%@";
    v13 = v11;
    v14 = 38;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    return v7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
  else
    v9 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v19 = v15;
      v20 = 2080;
      v21 = "+[AVCSessionParticipant unarchiveMediaStatesWithData:]";
      v22 = 1024;
      v23 = 1465;
      v24 = 2112;
      v25 = v9;
      v26 = 2048;
      v27 = a1;
      v28 = 2112;
      v29 = v17;
      v12 = " [%s] %s:%d %@(%p) Failed to decode the media state dictionary. error=%@";
      v13 = v16;
      v14 = 58;
      goto LABEL_13;
    }
  }
  return v7;
}

- (NSString)uuid
{
  return self->_participantID;
}

- (unint64_t)participantID
{
  return self->_idsParticipantID;
}

- (NSData)negotiationData
{
  return self->_participantData;
}

- (int64_t)videoToken
{
  return self->_videoToken;
}

- (OS_dispatch_queue)delegateNotificationQueue
{
  return self->_delegateNotificationQueue;
}

- (unsigned)videoQuality
{
  return self->_videoQuality;
}

- (unsigned)visibilityIndex
{
  return self->_visibilityIndex;
}

- (unsigned)prominenceIndex
{
  return self->_prominenceIndex;
}

- (NSData)frequencyLevels
{
  return self->_frequencyLevels;
}

- (BOOL)isAudioMuted
{
  return self->_audioMuted;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)configurationInProgress
{
  return self->_configurationInProgress;
}

- (void)setConfigurationInProgress:(BOOL)a3
{
  self->_configurationInProgress = a3;
}

- (BOOL)hasPendingChanges
{
  return self->_hasPendingChanges;
}

- (void)setHasPendingChanges:(BOOL)a3
{
  self->_hasPendingChanges = a3;
}

- (int64_t)screenToken
{
  return self->_screenToken;
}

- (BOOL)isOneToOneEnabled
{
  return self->_oneToOneEnabled;
}

- (void)setOneToOneEnabled:(BOOL)a3
{
  self->_oneToOneEnabled = a3;
}

- (BOOL)remoteScreenEnabled
{
  return self->_remoteScreenEnabled;
}

- (void)setRemoteScreenEnabled:(BOOL)a3
{
  self->_remoteScreenEnabled = a3;
}

- (BOOL)isScreenControlEnabled
{
  return self->_screenControlEnabled;
}

- (void)initWithParticipantID:data:delegate:queue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Participant Data is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithParticipantID:data:delegate:queue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the positional info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithParticipantID:data:delegate:queue:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the media states dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithParticipantID:data:delegate:queue:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The participant ID is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithParticipantID:data:delegate:queue:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The participant data is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithParticipantID:data:delegate:queue:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize the media states", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41__AVCSessionParticipant_setVideoQuality___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d videoQuality is already at %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __44__AVCSessionParticipant_setVisibilityIndex___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d visibilityIndex is already at %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __49__AVCSessionParticipant_setScreenControlEnabled___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d remoteScreenControlEnabled is already set to %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __44__AVCSessionParticipant_setProminenceIndex___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d prominenceIndex is already at %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoPositionalInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d [AVC SPATIAL AUDIO] Invalid flags=%08x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)storeMediaState:(NSObject *)a3 forMediaType:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[AVCSessionParticipant storeMediaState:forMediaType:]";
  v8 = 1024;
  v9 = 586;
  v10 = 2112;
  v11 = VCSessionMediaType_Name(a2);
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retrieve media state for mediaType=%@", (uint8_t *)&v4, 0x26u);
}

- (void)storeMediaState:forMediaType:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error encoding media type settings dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)spatialAudioSourceIDForMediaType:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  _BYTE v4[14];

  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(_QWORD *)&v4[6] = "-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Invalid mediaType=%d", v3, *(const char **)v4, (unint64_t)"-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]" >> 16, 965);
  OUTLINED_FUNCTION_3();
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_183_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  v3 = 1304;
  v4 = 2112;
  v5 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Participant[%@] calling didStopReacting", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)setupMediaStates
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No stream groups found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
