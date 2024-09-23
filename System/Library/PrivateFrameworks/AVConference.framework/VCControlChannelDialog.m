@implementation VCControlChannelDialog

- (VCControlChannelDialog)initWithSessionID:(unsigned int)a3 participantID:(id)a4 participantUUID:(id)a5 participantConfig:(id *)a6 transactionDelegate:(id)a7
{
  VCControlChannelDialog *v12;
  VCControlChannelDialog *v13;
  uint64_t v14;
  NSNumber **p_participantID;
  NSObject *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const __CFString *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSNumber *v28;
  NSNumber *v29;
  objc_super v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  VCControlChannelDialog *v41;
  __int16 v42;
  NSNumber *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)VCControlChannelDialog;
  v12 = -[VCObject init](&v31, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_sessionID = a3;
    v14 = objc_msgSend(a4, "copy");
    p_participantID = &v13->_participantID;
    v13->_participantID = (NSNumber *)v14;
    v13->_participantUUID = (NSString *)objc_msgSend(a5, "copy");
    v13->_weakTransactionDelegate = (VCControlChannelTransactionDelegate *)objc_storeWeak((id *)&v13->_weakTransactionDelegate, a7);
    v13->_transactions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13->_cachedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v13->_handshakeOperationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCControlChannelDialog.handshakeOperationQueue", v16);
    v13->_handshakeEnabled = a6->var5;
    v13->_handshakeStartTime = NAN;
    -[VCControlChannelDialog resetHandshake](v13, "resetHandshake");
    if ((VCControlChannelDialog *)objc_opt_class() == v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        v20 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (const __CFString *)*p_participantID;
            *(_DWORD *)buf = 136315906;
            v33 = v18;
            v34 = 2080;
            v35 = "-[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
            v36 = 1024;
            v37 = 65;
            v38 = 2112;
            v39 = v21;
            v22 = " [%s] %s:%d Created VCControlChannelDialog object with remoteParticipantID='%@'";
            v23 = v19;
            v24 = 38;
LABEL_14:
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:].cold.1();
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCControlChannelDialog performSelector:](v13, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        v27 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = *p_participantID;
            *(_DWORD *)buf = 136316418;
            v33 = v25;
            v34 = 2080;
            v35 = "-[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
            v36 = 1024;
            v37 = 65;
            v38 = 2112;
            v39 = v17;
            v40 = 2048;
            v41 = v13;
            v42 = 2112;
            v43 = v28;
            v22 = " [%s] %s:%d %@(%p) Created VCControlChannelDialog object with remoteParticipantID='%@'";
            v23 = v26;
            v24 = 58;
            goto LABEL_14;
          }
        }
        else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v29 = *p_participantID;
          *(_DWORD *)buf = 136316418;
          v33 = v25;
          v34 = 2080;
          v35 = "-[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
          v36 = 1024;
          v37 = 65;
          v38 = 2112;
          v39 = v17;
          v40 = 2048;
          v41 = v13;
          v42 = 2112;
          v43 = v29;
          _os_log_debug_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) Created VCControlChannelDialog object with remoteParticipantID='%@'", buf, 0x3Au);
        }
      }
    }
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d Dealloc VCControlChannelDialog object with remoteParticipantID='%@'");
  OUTLINED_FUNCTION_3();
}

- (id)handshakeOperationQueue
{
  return self->_handshakeOperationQueue;
}

- (void)resetHandshake
{
  BOOL handshakeEnabled;

  objc_sync_enter(self);
  handshakeEnabled = self->_handshakeEnabled;
  self->_isHandshakeMode = handshakeEnabled;
  self->_isHandshakeCommenced = !handshakeEnabled;
  self->_shouldFinishHandshake = !handshakeEnabled;
  -[NSMutableArray removeAllObjects](self->_cachedMessages, "removeAllObjects");
  objc_sync_exit(self);
}

- (void)flushActiveTransactions
{
  NSMutableDictionary *transactions;
  void *v4;
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
  objc_sync_enter(self);
  self->_shouldFinishHandshake = 1;
  transactions = self->_transactions;
  self->_transactions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_sync_exit(self);
  if (transactions)
  {
    v4 = (void *)-[NSMutableDictionary allKeys](transactions, "allKeys");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](transactions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++)), "flushTransaction");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      }
      while (v5);
    }

  }
}

- (void)removeTransactionForTransactionID:(int)a3
{
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCControlChannelDialog *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  -[NSMutableDictionary removeObjectForKey:](self->_transactions, "removeObjectForKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3), "stringValue"));
  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315906;
          v16 = v6;
          v17 = 2080;
          v18 = "-[VCControlChannelDialog removeTransactionForTransactionID:]";
          v19 = 1024;
          v20 = 125;
          v21 = 1024;
          LODWORD(v22) = v3;
          v9 = " [%s] %s:%d removeTransactionForTransactionID: transactionID='%d' removed from list of transactions";
          v10 = v7;
          v11 = 34;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCControlChannelDialog removeTransactionForTransactionID:].cold.1();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136316418;
          v16 = v12;
          v17 = 2080;
          v18 = "-[VCControlChannelDialog removeTransactionForTransactionID:]";
          v19 = 1024;
          v20 = 125;
          v21 = 2112;
          v22 = v5;
          v23 = 2048;
          v24 = self;
          v25 = 1024;
          v26 = v3;
          v9 = " [%s] %s:%d %@(%p) removeTransactionForTransactionID: transactionID='%d' removed from list of transactions";
          v10 = v13;
          v11 = 54;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136316418;
        v16 = v12;
        v17 = 2080;
        v18 = "-[VCControlChannelDialog removeTransactionForTransactionID:]";
        v19 = 1024;
        v20 = 125;
        v21 = 2112;
        v22 = v5;
        v23 = 2048;
        v24 = self;
        v25 = 1024;
        v26 = v3;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) removeTransactionForTransactionID: transactionID='%d' removed from list of transactions", (uint8_t *)&v15, 0x36u);
      }
    }
  }
  objc_sync_exit(self);
}

- (id)processMessageData:(id)a3 participantID:(id)a4 topic:(id *)a5 transactionID:(id *)a6 messageStatus:(unsigned int *)a7 isInternalMessage:(BOOL *)a8
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, a6, a7, a8, "-[VCControlChannelDialog processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]"), 0));
}

- (void)doHandshakeWithMessage:(id)a3 topic:(id)a4 afterDelay:(double)a5 withOptions:(id)a6
{
  dispatch_time_t v10;
  NSObject *handshakeOperationQueue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  handshakeOperationQueue = self->_handshakeOperationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__VCControlChannelDialog_doHandshakeWithMessage_topic_afterDelay_withOptions___block_invoke;
  block[3] = &unk_1E9E54D20;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a6;
  dispatch_after(v10, handshakeOperationQueue, block);
}

void __78__VCControlChannelDialog_doHandshakeWithMessage_topic_afterDelay_withOptions___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  _BYTE *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1DF086F1C](*(_QWORD *)(a1 + 32) + 176);
  v3 = objc_msgSend(v2, "isParticipantActive:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "unsignedLongLongValue"));
  v4 = *(_BYTE **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    if (!v4[192])
    {
      if (!objc_msgSend(v4, "sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &unk_1E9EF4D78, 1, *(_QWORD *)(a1 + 56)))
      {
        objc_msgSend(*(id *)(a1 + 32), "checkForSignificantHandshakeDelayWithDelegate:", v2);
        objc_msgSend(*(id *)(a1 + 32), "doHandshakeWithMessage:topic:afterDelay:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0.25);
        goto LABEL_17;
      }
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_16;
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v8 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 208);
        v34 = 136315906;
        v35 = v6;
        v36 = 2080;
        v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
        v38 = 1024;
        v39 = 149;
        v40 = 2112;
        v41 = v8;
        v9 = " [%s] %s:%d Handshake acknowledged from '%@'";
        v10 = v7;
        v11 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v5 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_16;
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(v14 + 208);
        v34 = 136316418;
        v35 = v12;
        v36 = 2080;
        v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
        v38 = 1024;
        v39 = 149;
        v40 = 2112;
        v41 = v5;
        v42 = 2048;
        v43 = v14;
        v44 = 2112;
        v45 = v15;
        v9 = " [%s] %s:%d %@(%p) Handshake acknowledged from '%@'";
        v10 = v13;
        v11 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v34, v11);
LABEL_16:
      v16 = *(void **)(a1 + 32);
      objc_sync_enter(v16);
      objc_msgSend(*(id *)(a1 + 32), "sendAllCachedMessagesAndDisableHandshakeWhenDone");
      objc_sync_exit(v16);
      goto LABEL_17;
    }
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __78__VCControlChannelDialog_doHandshakeWithMessage_topic_afterDelay_withOptions___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v33 = *(_QWORD *)(a1 + 32);
          v34 = 136316162;
          v35 = v31;
          v36 = 2080;
          v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
          v38 = 1024;
          v39 = 142;
          v40 = 2112;
          v41 = v18;
          v42 = 2048;
          v43 = v33;
          v23 = " [%s] %s:%d %@(%p) Dialog was flushed. Cancelling handshake...";
          v24 = v32;
          v25 = 48;
          goto LABEL_40;
        }
      }
    }
  }
  else
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_17;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(const __CFString **)(v21 + 208);
      LODWORD(v21) = *(_DWORD *)(v21 + 172);
      v34 = 136316162;
      v35 = v19;
      v36 = 2080;
      v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
      v38 = 1024;
      v39 = 140;
      v40 = 2112;
      v41 = v22;
      v42 = 1024;
      LODWORD(v43) = v21;
      v23 = " [%s] %s:%d Participant '%@' removed from the session '%d'. Cancelling handshake...";
      v24 = v20;
      v25 = 44;
      goto LABEL_40;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(_QWORD *)(v28 + 208);
        v30 = *(_DWORD *)(v28 + 172);
        v34 = 136316674;
        v35 = v26;
        v36 = 2080;
        v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
        v38 = 1024;
        v39 = 140;
        v40 = 2112;
        v41 = v17;
        v42 = 2048;
        v43 = v28;
        v44 = 2112;
        v45 = v29;
        v46 = 1024;
        v47 = v30;
        v23 = " [%s] %s:%d %@(%p) Participant '%@' removed from the session '%d'. Cancelling handshake...";
        v24 = v27;
        v25 = 64;
LABEL_40:
        _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v34, v25);
      }
    }
  }
LABEL_17:
  if (v2)
    CFRelease(v2);
}

- (void)checkForSignificantHandshakeDelayWithDelegate:(id)a3
{
  if (self->_isHandshakeCommenced && micro() - self->_handshakeStartTime > 30.0)
  {
    objc_msgSend(a3, "reportSignificantHandshakeDelaySymptomForParticipantID:", self->_participantID);
    self->_handshakeStartTime = NAN;
  }
}

- (void)sendAllCachedMessagesAndDisableHandshakeWhenDone
{
  __int128 v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *handshakeOperationQueue;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  NSNumber *v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  NSNumber *v22;
  NSObject *v23;
  NSString *participantUUID;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int sessionID;
  NSNumber *participantID;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  unsigned int v35;
  NSNumber *v36;
  __int128 v37;
  _QWORD v38[5];
  _QWORD block[9];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  _BYTE v47[24];
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  const __CFString *v54;
  _QWORD v55[4];

  v55[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_cachedMessages, "count"))
  {
    self->_isHandshakeMode = 0;
    -[VCObject reportingAgent](self, "reportingAgent");
    participantUUID = self->_participantUUID;
    v54 = CFSTR("VCSPUUID");
    v55[0] = participantUUID;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    reportingGenericEvent();
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return;
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      sessionID = self->_sessionID;
      participantID = self->_participantID;
      *(_DWORD *)buf = 136316162;
      v41 = v26;
      v42 = 2080;
      v43 = "-[VCControlChannelDialog sendAllCachedMessagesAndDisableHandshakeWhenDone]";
      v44 = 1024;
      v45 = 183;
      v46 = 1024;
      *(_DWORD *)v47 = sessionID;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = participantID;
      v30 = " [%s] %s:%d sendAllCachedMessagesAndDisableHandshakeWhenDone: Handshake turned off for _sessionID='%d', _participantID='%@'";
      v31 = v27;
      v32 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v25 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return;
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v35 = self->_sessionID;
      v36 = self->_participantID;
      *(_DWORD *)buf = 136316674;
      v41 = v33;
      v42 = 2080;
      v43 = "-[VCControlChannelDialog sendAllCachedMessagesAndDisableHandshakeWhenDone]";
      v44 = 1024;
      v45 = 183;
      v46 = 2112;
      *(_QWORD *)v47 = v25;
      *(_WORD *)&v47[8] = 2048;
      *(_QWORD *)&v47[10] = self;
      *(_WORD *)&v47[18] = 1024;
      *(_DWORD *)&v47[20] = v35;
      v48 = 2112;
      v49 = (uint64_t)v36;
      v30 = " [%s] %s:%d %@(%p) sendAllCachedMessagesAndDisableHandshakeWhenDone: Handshake turned off for _sessionID='%d"
            "', _participantID='%@'";
      v31 = v34;
      v32 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    return;
  }
  if (-[NSMutableArray count](self->_cachedMessages, "count"))
  {
    v4 = 0;
    *(_QWORD *)&v3 = 136316674;
    v37 = v3;
    do
    {
      v5 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_cachedMessages, "objectAtIndexedSubscript:", v4, v37);
      v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CachedTopic"));
      v7 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CachedMessage"));
      v8 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CachedOptions"));
      v9 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Temeout"));
      handshakeOperationQueue = self->_handshakeOperationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__VCControlChannelDialog_sendAllCachedMessagesAndDisableHandshakeWhenDone__block_invoke;
      block[3] = &unk_1E9E54D48;
      block[4] = self;
      block[5] = v7;
      block[6] = v6;
      block[7] = v9;
      block[8] = v8;
      dispatch_async(handshakeOperationQueue, block);
      if ((VCControlChannelDialog *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_14;
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        v21 = self->_sessionID;
        v22 = self->_participantID;
        *(_DWORD *)buf = v37;
        v41 = v19;
        v42 = 2080;
        v43 = "-[VCControlChannelDialog sendAllCachedMessagesAndDisableHandshakeWhenDone]";
        v44 = 1024;
        v45 = 195;
        v46 = 1024;
        *(_DWORD *)v47 = v21;
        *(_WORD *)&v47[4] = 2112;
        *(_QWORD *)&v47[6] = v22;
        *(_WORD *)&v47[14] = 2112;
        *(_QWORD *)&v47[16] = v6;
        v48 = 2112;
        v49 = v7;
        v16 = v20;
        v17 = " [%s] %s:%d sendAllCachedMessagesAndDisableHandshakeWhenDone: Sent cached message for _sessionID='%d', _pa"
              "rticipantID='%@', topic='%@', reliable message='%@' ";
        v18 = 64;
      }
      else
      {
        v11 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_14;
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        v14 = self->_sessionID;
        v15 = self->_participantID;
        *(_DWORD *)buf = 136317186;
        v41 = v12;
        v42 = 2080;
        v43 = "-[VCControlChannelDialog sendAllCachedMessagesAndDisableHandshakeWhenDone]";
        v44 = 1024;
        v45 = 195;
        v46 = 2112;
        *(_QWORD *)v47 = v11;
        *(_WORD *)&v47[8] = 2048;
        *(_QWORD *)&v47[10] = self;
        *(_WORD *)&v47[18] = 1024;
        *(_DWORD *)&v47[20] = v14;
        v48 = 2112;
        v49 = (uint64_t)v15;
        v50 = 2112;
        v51 = v6;
        v52 = 2112;
        v53 = v7;
        v16 = v13;
        v17 = " [%s] %s:%d %@(%p) sendAllCachedMessagesAndDisableHandshakeWhenDone: Sent cached message for _sessionID='%"
              "d', _participantID='%@', topic='%@', reliable message='%@' ";
        v18 = 84;
      }
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
LABEL_14:
      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_cachedMessages, "count"));
  }
  -[NSMutableArray removeAllObjects](self->_cachedMessages, "removeAllObjects");
  v23 = self->_handshakeOperationQueue;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __74__VCControlChannelDialog_sendAllCachedMessagesAndDisableHandshakeWhenDone__block_invoke_26;
  v38[3] = &unk_1E9E521C0;
  v38[4] = self;
  dispatch_async(v23, v38);
}

uint64_t __74__VCControlChannelDialog_sendAllCachedMessagesAndDisableHandshakeWhenDone__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));
}

uint64_t __74__VCControlChannelDialog_sendAllCachedMessagesAndDisableHandshakeWhenDone__block_invoke_26(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "sendAllCachedMessagesAndDisableHandshakeWhenDone");
  return objc_sync_exit(v2);
}

- (void)startHandshakeWithMessage:(id)a3 topic:(id)a4 withOptions:(id)a5
{
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int sessionID;
  NSNumber *participantID;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  NSNumber *v20;
  _BYTE v21[24];
  _BYTE v22[32];
  id v23;
  _BYTE v24[24];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  self->_isHandshakeCommenced = 1;
  self->_handshakeStartTime = micro();
  -[VCObject reportingAgent](self, "reportingAgent");
  v25 = CFSTR("VCSPUUID");
  v26[0] = self->_participantUUID;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  reportingGenericEvent();
  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        sessionID = self->_sessionID;
        participantID = self->_participantID;
        *(_DWORD *)v21 = 136316674;
        *(_QWORD *)&v21[4] = v10;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "-[VCControlChannelDialog startHandshakeWithMessage:topic:withOptions:]";
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 217;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = sessionID;
        *(_WORD *)&v22[10] = 2112;
        *(_QWORD *)&v22[12] = participantID;
        *(_WORD *)&v22[20] = 2112;
        *(_QWORD *)&v22[22] = a4;
        *(_WORD *)&v22[30] = 2112;
        v23 = a3;
        v14 = " [%s] %s:%d Started handshake for session '%d' with participant '%@' using topic '%@', message '%@'";
        v15 = v11;
        v16 = 64;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, v21, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_sessionID;
        v20 = self->_participantID;
        *(_DWORD *)v21 = 136317186;
        *(_QWORD *)&v21[4] = v17;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "-[VCControlChannelDialog startHandshakeWithMessage:topic:withOptions:]";
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 217;
        *(_WORD *)&v22[4] = 2112;
        *(_QWORD *)&v22[6] = v9;
        *(_WORD *)&v22[14] = 2048;
        *(_QWORD *)&v22[16] = self;
        *(_WORD *)&v22[24] = 1024;
        *(_DWORD *)&v22[26] = v19;
        *(_WORD *)&v22[30] = 2112;
        v23 = v20;
        *(_WORD *)v24 = 2112;
        *(_QWORD *)&v24[2] = a4;
        *(_WORD *)&v24[10] = 2112;
        *(_QWORD *)&v24[12] = a3;
        v14 = " [%s] %s:%d %@(%p) Started handshake for session '%d' with participant '%@' using topic '%@', message '%@'";
        v15 = v18;
        v16 = 84;
        goto LABEL_11;
      }
    }
  }
  -[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:](self, "doHandshakeWithMessage:topic:afterDelay:withOptions:", a3, a4, a5, 0.0, *(_OWORD *)v21, *(_QWORD *)&v21[16], *(_OWORD *)v22, *(_OWORD *)&v22[16], v23, *(_OWORD *)v24, *(_QWORD *)&v24[16]);
}

- (void)cacheOutgoingMessage:(id)a3 topic:(id)a4 timeout:(id)a5 withOptions:(id)a6
{
  id v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int sessionID;
  NSNumber *participantID;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  NSNumber *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[24];
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", a4, CFSTR("CachedTopic"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", a3, CFSTR("CachedMessage"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", a6, CFSTR("CachedOptions"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", a5, CFSTR("Temeout"));
  -[NSMutableArray addObject:](self->_cachedMessages, "addObject:", v11);

  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        sessionID = self->_sessionID;
        participantID = self->_participantID;
        v24 = 136316674;
        v25 = v13;
        v26 = 2080;
        v27 = "-[VCControlChannelDialog cacheOutgoingMessage:topic:timeout:withOptions:]";
        v28 = 1024;
        v29 = 237;
        v30 = 1024;
        *(_DWORD *)v31 = sessionID;
        *(_WORD *)&v31[4] = 2112;
        *(_QWORD *)&v31[6] = participantID;
        *(_WORD *)&v31[14] = 2112;
        *(_QWORD *)&v31[16] = a4;
        v32 = 2112;
        v33 = a3;
        v17 = " [%s] %s:%d cacheOutgoingMessage: Cached a new message for sessionID='%d', _participantID='%@', topic='%@'"
              ", reliable message='%@' ";
        v18 = v14;
        v19 = 64;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v24, v19);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_sessionID;
        v23 = self->_participantID;
        v24 = 136317186;
        v25 = v20;
        v26 = 2080;
        v27 = "-[VCControlChannelDialog cacheOutgoingMessage:topic:timeout:withOptions:]";
        v28 = 1024;
        v29 = 237;
        v30 = 2112;
        *(_QWORD *)v31 = v12;
        *(_WORD *)&v31[8] = 2048;
        *(_QWORD *)&v31[10] = self;
        *(_WORD *)&v31[18] = 1024;
        *(_DWORD *)&v31[20] = v22;
        v32 = 2112;
        v33 = v23;
        v34 = 2112;
        v35 = a4;
        v36 = 2112;
        v37 = a3;
        v17 = " [%s] %s:%d %@(%p) cacheOutgoingMessage: Cached a new message for sessionID='%d', _participantID='%@', top"
              "ic='%@', reliable message='%@' ";
        v18 = v21;
        v19 = 84;
        goto LABEL_11;
      }
    }
  }
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 timeout:(id)a5 withOptions:(id)a6
{
  char isKindOfClass;
  BOOL result;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  _BOOL4 v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  _BOOL4 v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  VCControlChannelDialog *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if ((VCControlChannelDialog *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v21)
        return result;
      v28 = 136316162;
      v29 = v19;
      v30 = 2080;
      v31 = "-[VCControlChannelDialog sendReliableMessage:withTopic:timeout:withOptions:]";
      v32 = 1024;
      v33 = 245;
      v34 = 2112;
      v35 = v13;
      v36 = 2048;
      v37 = self;
      v18 = " [%s] %s:%d %@(%p) topic must not be nil";
LABEL_32:
      v24 = v20;
      v25 = 48;
      goto LABEL_33;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v17)
        return result;
      v28 = 136315650;
      v29 = v15;
      v30 = 2080;
      v31 = "-[VCControlChannelDialog sendReliableMessage:withTopic:timeout:withOptions:]";
      v32 = 1024;
      v33 = 245;
      v18 = " [%s] %s:%d topic must not be nil";
LABEL_27:
      v24 = v16;
      v25 = 28;
LABEL_33:
      _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v28, v25);
    }
    return 0;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 && (isKindOfClass & 1) != 0)
  {
    if ((VCControlChannelDialog *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v26 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v27)
        return result;
      v28 = 136316162;
      v29 = v26;
      v30 = 2080;
      v31 = "-[VCControlChannelDialog sendReliableMessage:withTopic:timeout:withOptions:]";
      v32 = 1024;
      v33 = 247;
      v34 = 2112;
      v35 = v14;
      v36 = 2048;
      v37 = self;
      v18 = " [%s] %s:%d %@(%p) message must not be nil";
      goto LABEL_32;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v23 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v23)
        return result;
      v28 = 136315650;
      v29 = v22;
      v30 = 2080;
      v31 = "-[VCControlChannelDialog sendReliableMessage:withTopic:timeout:withOptions:]";
      v32 = 1024;
      v33 = 247;
      v18 = " [%s] %s:%d message must not be nil";
      goto LABEL_27;
    }
    return 0;
  }
  objc_sync_enter(self);
  if (self->_isHandshakeMode)
  {
    if (self->_isHandshakeCommenced)
      -[VCControlChannelDialog cacheOutgoingMessage:topic:timeout:withOptions:](self, "cacheOutgoingMessage:topic:timeout:withOptions:", a3, a4, a5, a6);
    else
      -[VCControlChannelDialog startHandshakeWithMessage:topic:withOptions:](self, "startHandshakeWithMessage:topic:withOptions:", a3, a4, a6);
    objc_sync_exit(self);
    return 1;
  }
  else
  {
    objc_sync_exit(self);
    return -[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:](self, "sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:", a3, a4, a5, 0, a6);
  }
}

- (BOOL)sendReliableMessageInternal:(id)a3 withTopic:(id)a4 timeout:(id)a5 useFastRetries:(BOOL)a6 withOptions:(id)a7
{
  _BOOL8 v8;
  void *v13;
  uint64_t v14;
  NSNumber *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  NSNumber *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  unsigned int v26;
  NSNumber *v27;
  VCControlChannelTransaction *v28;
  BOOL v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  unsigned int v33;
  NSNumber *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  NSObject *v39;
  unsigned int v40;
  NSNumber *v41;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  uint64_t v46;
  NSObject *v47;
  unsigned int sessionID;
  NSNumber *participantID;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  unsigned int v59;
  NSNumber *v60;
  id v61;
  void *cf;
  _QWORD v63[6];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  _BYTE v71[24];
  __int16 v72;
  NSNumber *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  NSNumber *v77;
  uint64_t v78;

  v8 = a6;
  v78 = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1DF086F1C](&self->_weakTransactionDelegate, a2);
  objc_sync_enter(self);
  cf = v13;
  v14 = objc_msgSend(v13, "nextTransactionID");
  v15 = -[VCControlChannelDialog newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:](self, "newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:", a3, a4, v14, 1, v13);
  if (!v15)
  {
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:].cold.1();
      }
      goto LABEL_55;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v43 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v43 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v53 = VRTraceErrorLogLevelToCSTR(),
          v54 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_55:
      objc_sync_exit(self);
      v29 = 0;
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136316162;
    v65 = v53;
    v66 = 2080;
    v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
    v68 = 1024;
    v69 = 288;
    v70 = 2112;
    *(_QWORD *)v71 = v43;
    *(_WORD *)&v71[8] = 2048;
    *(_QWORD *)&v71[10] = self;
    v50 = " [%s] %s:%d %@(%p) messageData should not be nil";
    v51 = v54;
    v52 = 48;
LABEL_62:
    _os_log_error_impl(&dword_1D8A54000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
    goto LABEL_55;
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_transactions, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14), "stringValue")))
  {
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_55;
      v46 = VRTraceErrorLogLevelToCSTR();
      v47 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_55;
      sessionID = self->_sessionID;
      participantID = self->_participantID;
      *(_DWORD *)buf = 136316418;
      v65 = v46;
      v66 = 2080;
      v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
      v68 = 1024;
      v69 = 290;
      v70 = 1024;
      *(_DWORD *)v71 = sessionID;
      *(_WORD *)&v71[4] = 2112;
      *(_QWORD *)&v71[6] = participantID;
      *(_WORD *)&v71[14] = 2048;
      *(_QWORD *)&v71[16] = v14;
      v50 = " [%s] %s:%d sendReliableMessageInternal: attempt to send duplicate transaction detected for _sessionID='%d',"
            " _participantID='%@', transactionID='%llu'. Aborted send...";
      v51 = v47;
      v52 = 54;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v44 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v44 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_55;
      v55 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_55;
      v59 = self->_sessionID;
      v60 = self->_participantID;
      *(_DWORD *)buf = 136316930;
      v65 = v55;
      v66 = 2080;
      v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
      v68 = 1024;
      v69 = 290;
      v70 = 2112;
      *(_QWORD *)v71 = v44;
      *(_WORD *)&v71[8] = 2048;
      *(_QWORD *)&v71[10] = self;
      *(_WORD *)&v71[18] = 1024;
      *(_DWORD *)&v71[20] = v59;
      v72 = 2112;
      v73 = v60;
      v74 = 2048;
      v75 = v14;
      v50 = " [%s] %s:%d %@(%p) sendReliableMessageInternal: attempt to send duplicate transaction detected for _sessionI"
            "D='%d', _participantID='%@', transactionID='%llu'. Aborted send...";
      v51 = v56;
      v52 = 74;
    }
    goto LABEL_62;
  }
  objc_sync_exit(self);
  v61 = a5;
  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_14;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v19 = self->_sessionID;
    v20 = self->_participantID;
    *(_DWORD *)buf = 136316674;
    v65 = v17;
    v66 = 2080;
    v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
    v68 = 1024;
    v69 = 293;
    v70 = 1024;
    *(_DWORD *)v71 = v19;
    *(_WORD *)&v71[4] = 2112;
    *(_QWORD *)&v71[6] = v20;
    *(_WORD *)&v71[14] = 2048;
    *(_QWORD *)&v71[16] = v14;
    v72 = 2112;
    v73 = v15;
    v21 = " [%s] %s:%d sendReliableMessageInternal: creating a new transaction for _sessionID='%d', _participantID='%@', "
          "transactionID='%llu', data='%@'";
    v22 = v18;
    v23 = 64;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_14;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v26 = self->_sessionID;
    v27 = self->_participantID;
    *(_DWORD *)buf = 136317186;
    v65 = v24;
    v66 = 2080;
    v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
    v68 = 1024;
    v69 = 293;
    v70 = 2112;
    *(_QWORD *)v71 = v16;
    *(_WORD *)&v71[8] = 2048;
    *(_QWORD *)&v71[10] = self;
    *(_WORD *)&v71[18] = 1024;
    *(_DWORD *)&v71[20] = v26;
    v72 = 2112;
    v73 = v27;
    v74 = 2048;
    v75 = v14;
    v76 = 2112;
    v77 = v15;
    v21 = " [%s] %s:%d %@(%p) sendReliableMessageInternal: creating a new transaction for _sessionID='%d', _participantID"
          "='%@', transactionID='%llu', data='%@'";
    v22 = v25;
    v23 = 84;
  }
  _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
LABEL_14:
  v28 = -[VCControlChannelTransaction initWithTransportSessionID:participantID:transactionID:transactionDelegate:]([VCControlChannelTransaction alloc], "initWithTransportSessionID:participantID:transactionID:transactionDelegate:", self->_sessionID, self->_participantID, v14, cf);
  if (v28)
  {
    objc_sync_enter(self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transactions, "setObject:forKeyedSubscript:", v28, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14), "stringValue"));
    objc_sync_exit(self);
    v29 = -[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastRetries:withOptions:](v28, "sendReliableMessage:sessionID:participantID:timeout:useFastRetries:withOptions:", v15, self->_sessionID, self->_participantID, v61, v8, a7);

    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_26;
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      v33 = self->_sessionID;
      v34 = self->_participantID;
      *(_DWORD *)buf = 136316674;
      v65 = v31;
      v66 = 2080;
      v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
      v68 = 1024;
      v69 = 305;
      v70 = 1024;
      *(_DWORD *)v71 = v33;
      *(_WORD *)&v71[4] = 2112;
      *(_QWORD *)&v71[6] = v34;
      *(_WORD *)&v71[14] = 2048;
      *(_QWORD *)&v71[16] = v14;
      v72 = 2112;
      v73 = v15;
      v35 = " [%s] %s:%d sendReliableMessageInternal: Remove transaction for _sessionID='%d', _participantID='%@', transa"
            "ctionID='%llu', data='%@'";
      v36 = v32;
      v37 = 64;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_26;
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      v40 = self->_sessionID;
      v41 = self->_participantID;
      *(_DWORD *)buf = 136317186;
      v65 = v38;
      v66 = 2080;
      v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
      v68 = 1024;
      v69 = 305;
      v70 = 2112;
      *(_QWORD *)v71 = v30;
      *(_WORD *)&v71[8] = 2048;
      *(_QWORD *)&v71[10] = self;
      *(_WORD *)&v71[18] = 1024;
      *(_DWORD *)&v71[20] = v40;
      v72 = 2112;
      v73 = v41;
      v74 = 2048;
      v75 = v14;
      v76 = 2112;
      v77 = v15;
      v35 = " [%s] %s:%d %@(%p) sendReliableMessageInternal: Remove transaction for _sessionID='%d', _participantID='%@',"
            " transactionID='%llu', data='%@'";
      v36 = v39;
      v37 = 84;
    }
    _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
LABEL_26:
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __99__VCControlChannelDialog_sendReliableMessageInternal_withTopic_timeout_useFastRetries_withOptions___block_invoke;
    v63[3] = &unk_1E9E52960;
    v63[4] = self;
    v63[5] = v14;
    objc_msgSend(cf, "scheduleAfter:block:", 4, v63);
    goto LABEL_27;
  }
  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:].cold.2();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v45 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v45 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v57 = VRTraceErrorLogLevelToCSTR();
      v58 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v65 = v57;
        v66 = 2080;
        v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
        v68 = 1024;
        v69 = 296;
        v70 = 2112;
        *(_QWORD *)v71 = v45;
        *(_WORD *)&v71[8] = 2048;
        *(_QWORD *)&v71[10] = self;
        _os_log_error_impl(&dword_1D8A54000, v58, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) failed to create transaction", buf, 0x30u);
      }
    }
  }
  v29 = 0;
LABEL_27:

  if (cf)
    CFRelease(cf);
  return v29;
}

uint64_t __99__VCControlChannelDialog_sendReliableMessageInternal_withTopic_timeout_useFastRetries_withOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeTransactionForTransactionID:", *(unsigned int *)(a1 + 40));
}

- (BOOL)sendUnreliableMessage:(id)a3 withTopic:(id)a4 sessionID:(unsigned int)a5 participantID:(id)a6 transactionDelegate:(id)a7
{
  uint64_t v9;
  uint64_t v13;
  id v14;
  BOOL v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BYTE v35[24];
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v9 = *(_QWORD *)&a5;
  v42 = *MEMORY[0x1E0C80C00];
  v13 = objc_msgSend(a7, "nextTransactionID");
  v14 = -[VCControlChannelDialog newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:](self, "newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:", a3, a4, v13, 0, a7);
  if (v14)
  {
    v15 = +[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:](VCControlChannelTransaction, "sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:", v14, v9, a6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13), a7, 0);
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v28 = 136316674;
          v29 = v17;
          v30 = 2080;
          v31 = "-[VCControlChannelDialog sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:]";
          v32 = 1024;
          v33 = 333;
          v34 = 1024;
          *(_DWORD *)v35 = v9;
          *(_WORD *)&v35[4] = 2112;
          *(_QWORD *)&v35[6] = a6;
          *(_WORD *)&v35[14] = 2048;
          *(_QWORD *)&v35[16] = v13;
          v36 = 2112;
          v37 = a3;
          v19 = " [%s] %s:%d Dialog send unreliable message for sessionID='%d', participantID='%@', transactionID='%llu', message='%@'";
          v20 = v18;
          v21 = 64;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, v21);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v28 = 136317186;
          v29 = v22;
          v30 = 2080;
          v31 = "-[VCControlChannelDialog sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:]";
          v32 = 1024;
          v33 = 333;
          v34 = 2112;
          *(_QWORD *)v35 = v16;
          *(_WORD *)&v35[8] = 2048;
          *(_QWORD *)&v35[10] = self;
          *(_WORD *)&v35[18] = 1024;
          *(_DWORD *)&v35[20] = v9;
          v36 = 2112;
          v37 = a6;
          v38 = 2048;
          v39 = v13;
          v40 = 2112;
          v41 = a3;
          v19 = " [%s] %s:%d %@(%p) Dialog send unreliable message for sessionID='%d', participantID='%@', transactionID="
                "'%llu', message='%@'";
          v20 = v23;
          v21 = 84;
          goto LABEL_12;
        }
      }
    }
  }
  else
  {
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelDialog sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v25 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v28 = 136316162;
          v29 = v26;
          v30 = 2080;
          v31 = "-[VCControlChannelDialog sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:]";
          v32 = 1024;
          v33 = 326;
          v34 = 2112;
          *(_QWORD *)v35 = v25;
          *(_WORD *)&v35[8] = 2048;
          *(_QWORD *)&v35[10] = self;
          _os_log_error_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) messageData should not be nil", (uint8_t *)&v28, 0x30u);
        }
      }
    }
    v15 = 0;
  }

  return v15;
}

- (id)newDataFromMessage:(id)a3 topic:(id)a4 transactionID:(unint64_t)a5 isReliable:(BOOL)a6 transactionDelegate:(id)a7
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, a6, a7, "-[VCControlChannelDialog newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]"), 0));
}

- (void)confirmTransaction:(id)a3
{
  id v5;
  VCControlChannelDialog *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int sessionID;
  NSNumber *participantID;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  NSNumber *v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  NSNumber *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  NSNumber *v30;
  _BYTE v31[24];
  _BYTE v32[32];
  NSNumber *v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_transactions, "objectForKeyedSubscript:", objc_msgSend(a3, "stringValue"));
  objc_sync_exit(self);
  v6 = (VCControlChannelDialog *)objc_opt_class();
  if (v5)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_16;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      sessionID = self->_sessionID;
      participantID = self->_participantID;
      *(_DWORD *)v31 = 136316418;
      *(_QWORD *)&v31[4] = v9;
      *(_WORD *)&v31[12] = 2080;
      *(_QWORD *)&v31[14] = "-[VCControlChannelDialog confirmTransaction:]";
      *(_WORD *)&v31[22] = 1024;
      *(_DWORD *)v32 = 350;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = sessionID;
      *(_WORD *)&v32[10] = 2112;
      *(_QWORD *)&v32[12] = participantID;
      *(_WORD *)&v32[20] = 2112;
      *(_QWORD *)&v32[22] = a3;
      v13 = " [%s] %s:%d confirmTransaction: Found matching transaction for _sessionID='%d', participantID='%@', transactionID='%@'";
      v14 = v10;
      v15 = 54;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_16;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v18 = self->_sessionID;
      v19 = self->_participantID;
      *(_DWORD *)v31 = 136316930;
      *(_QWORD *)&v31[4] = v16;
      *(_WORD *)&v31[12] = 2080;
      *(_QWORD *)&v31[14] = "-[VCControlChannelDialog confirmTransaction:]";
      *(_WORD *)&v31[22] = 1024;
      *(_DWORD *)v32 = 350;
      *(_WORD *)&v32[4] = 2112;
      *(_QWORD *)&v32[6] = v7;
      *(_WORD *)&v32[14] = 2048;
      *(_QWORD *)&v32[16] = self;
      *(_WORD *)&v32[24] = 1024;
      *(_DWORD *)&v32[26] = v18;
      *(_WORD *)&v32[30] = 2112;
      v33 = v19;
      LOWORD(v34) = 2112;
      *(_QWORD *)((char *)&v34 + 2) = a3;
      v13 = " [%s] %s:%d %@(%p) confirmTransaction: Found matching transaction for _sessionID='%d', participantID='%@', t"
            "ransactionID='%@'";
      v14 = v17;
      v15 = 74;
    }
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, v31, v15);
LABEL_16:
    objc_msgSend(v5, "confirmedTransactionByParticipantID:sessionID:", self->_participantID, self->_sessionID, *(_OWORD *)v31, *(_QWORD *)&v31[16], *(_OWORD *)v32, *(_OWORD *)&v32[16], v33, v34);

    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_sessionID;
        v23 = self->_participantID;
        *(_DWORD *)v31 = 136316418;
        *(_QWORD *)&v31[4] = v20;
        *(_WORD *)&v31[12] = 2080;
        *(_QWORD *)&v31[14] = "-[VCControlChannelDialog confirmTransaction:]";
        *(_WORD *)&v31[22] = 1024;
        *(_DWORD *)v32 = 354;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = v22;
        *(_WORD *)&v32[10] = 2112;
        *(_QWORD *)&v32[12] = v23;
        *(_WORD *)&v32[20] = 2112;
        *(_QWORD *)&v32[22] = a3;
        v24 = " [%s] %s:%d confirmTransaction: Could not find matching transaction for _sessionID='%d', participantID='%@"
              "', transactionID='%@'";
        v25 = v21;
        v26 = 54;
LABEL_25:
        _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, v31, v26);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCControlChannelDialog performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v29 = self->_sessionID;
        v30 = self->_participantID;
        *(_DWORD *)v31 = 136316930;
        *(_QWORD *)&v31[4] = v27;
        *(_WORD *)&v31[12] = 2080;
        *(_QWORD *)&v31[14] = "-[VCControlChannelDialog confirmTransaction:]";
        *(_WORD *)&v31[22] = 1024;
        *(_DWORD *)v32 = 354;
        *(_WORD *)&v32[4] = 2112;
        *(_QWORD *)&v32[6] = v8;
        *(_WORD *)&v32[14] = 2048;
        *(_QWORD *)&v32[16] = self;
        *(_WORD *)&v32[24] = 1024;
        *(_DWORD *)&v32[26] = v29;
        *(_WORD *)&v32[30] = 2112;
        v33 = v30;
        LOWORD(v34) = 2112;
        *(_QWORD *)((char *)&v34 + 2) = a3;
        v24 = " [%s] %s:%d %@(%p) confirmTransaction: Could not find matching transaction for _sessionID='%d', participan"
              "tID='%@', transactionID='%@'";
        v25 = v28;
        v26 = 74;
        goto LABEL_25;
      }
    }
  }
}

- (NSDictionary)transactions
{
  return &self->_transactions->super;
}

- (void)initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d Created VCControlChannelDialog object with remoteParticipantID='%@'");
  OUTLINED_FUNCTION_3();
}

- (void)removeTransactionForTransactionID:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCControlChannelDialog removeTransactionForTransactionID:]";
  v6 = 1024;
  v7 = 125;
  v8 = 1024;
  v9 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d removeTransactionForTransactionID: transactionID='%d' removed from list of transactions", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

void __78__VCControlChannelDialog_doHandshakeWithMessage_topic_afterDelay_withOptions___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Dialog was flushed. Cancelling handshake...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d messageData should not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d failed to create transaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d messageData should not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
