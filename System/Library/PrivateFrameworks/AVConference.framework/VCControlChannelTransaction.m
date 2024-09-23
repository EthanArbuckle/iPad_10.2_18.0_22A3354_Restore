@implementation VCControlChannelTransaction

- (VCControlChannelTransaction)initWithTransportSessionID:(unsigned int)a3 participantID:(id)a4 transactionID:(unint64_t)a5 transactionDelegate:(id)a6
{
  VCControlChannelTransaction *v10;
  VCControlChannelTransaction *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  unsigned int v16;
  NSNumber *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  unsigned int sessionID;
  NSNumber *participantID;
  unsigned int v26;
  NSNumber *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  unsigned int v32;
  NSNumber *v33;
  objc_super v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  _BYTE v42[18];
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  NSNumber *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)VCControlChannelTransaction;
  v10 = -[VCObject init](&v34, sel_init);
  v11 = v10;
  if (!v10)
    return v11;
  v10->_sessionID = a3;
  v10->_participantID = (NSNumber *)objc_msgSend(a4, "copy");
  v11->_transactionID = a5;
  v11->_weakTransactionDelegate = (VCControlChannelTransactionDelegate *)objc_storeWeak((id *)&v11->_weakTransactionDelegate, a6);
  pthread_mutex_init(&v11->_transactionLock, 0);
  pthread_cond_init(&v11->_transactionDone, 0);
  v11->_isConfirmed = 0;
  if ((VCControlChannelTransaction *)objc_opt_class() != v11)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCControlChannelTransaction performSelector:](v11, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return v11;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    v23 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        sessionID = v11->_sessionID;
        participantID = v11->_participantID;
        *(_DWORD *)buf = 136316674;
        v36 = v21;
        v37 = 2080;
        v38 = "-[VCControlChannelTransaction initWithTransportSessionID:participantID:transactionID:transactionDelegate:]";
        v39 = 1024;
        v40 = 55;
        v41 = 2112;
        *(_QWORD *)v42 = v12;
        *(_WORD *)&v42[8] = 2048;
        *(_QWORD *)&v42[10] = v11;
        v43 = 1024;
        v44 = sessionID;
        v45 = 2112;
        v46 = participantID;
        v18 = " [%s] %s:%d %@(%p) Created VCControlChannelTransaction object for sessionID='%d', participantID='%@'";
        v19 = v22;
        v20 = 64;
        goto LABEL_14;
      }
      return v11;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      return v11;
    v26 = v11->_sessionID;
    v27 = v11->_participantID;
    *(_DWORD *)buf = 136316674;
    v36 = v21;
    v37 = 2080;
    v38 = "-[VCControlChannelTransaction initWithTransportSessionID:participantID:transactionID:transactionDelegate:]";
    v39 = 1024;
    v40 = 55;
    v41 = 2112;
    *(_QWORD *)v42 = v12;
    *(_WORD *)&v42[8] = 2048;
    *(_QWORD *)&v42[10] = v11;
    v43 = 1024;
    v44 = v26;
    v45 = 2112;
    v46 = v27;
    v28 = " [%s] %s:%d %@(%p) Created VCControlChannelTransaction object for sessionID='%d', participantID='%@'";
    v29 = v22;
    v30 = 64;
LABEL_20:
    _os_log_debug_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEBUG, v28, buf, v30);
    return v11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    return v11;
  v13 = VRTraceErrorLogLevelToCSTR();
  v14 = *MEMORY[0x1E0CF2758];
  v15 = *MEMORY[0x1E0CF2758];
  if (!*MEMORY[0x1E0CF2748])
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      return v11;
    v32 = v11->_sessionID;
    v33 = v11->_participantID;
    *(_DWORD *)buf = 136316162;
    v36 = v13;
    v37 = 2080;
    v38 = "-[VCControlChannelTransaction initWithTransportSessionID:participantID:transactionID:transactionDelegate:]";
    v39 = 1024;
    v40 = 55;
    v41 = 1024;
    *(_DWORD *)v42 = v32;
    *(_WORD *)&v42[4] = 2112;
    *(_QWORD *)&v42[6] = v33;
    v28 = " [%s] %s:%d Created VCControlChannelTransaction object for sessionID='%d', participantID='%@'";
    v29 = v14;
    v30 = 44;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v11->_sessionID;
    v17 = v11->_participantID;
    *(_DWORD *)buf = 136316162;
    v36 = v13;
    v37 = 2080;
    v38 = "-[VCControlChannelTransaction initWithTransportSessionID:participantID:transactionID:transactionDelegate:]";
    v39 = 1024;
    v40 = 55;
    v41 = 1024;
    *(_DWORD *)v42 = v16;
    *(_WORD *)&v42[4] = 2112;
    *(_QWORD *)&v42[6] = v17;
    v18 = " [%s] %s:%d Created VCControlChannelTransaction object for sessionID='%d', participantID='%@'";
    v19 = v14;
    v20 = 44;
LABEL_14:
    _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
  }
  return v11;
}

- (void)dealloc
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a2 + 168);
  v4 = *(_QWORD *)(a2 + 176);
  v5 = 136316162;
  v6 = a1;
  v7 = 2080;
  v8 = "-[VCControlChannelTransaction dealloc]";
  v9 = 1024;
  v10 = 62;
  v11 = 1024;
  v12 = v3;
  v13 = 2112;
  v14 = v4;
  _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Dealloc VCControlChannelTransaction object for sessionID='%d', participantID='%@'", (uint8_t *)&v5, 0x2Cu);
}

- (void)flushTransaction
{
  _opaque_pthread_mutex_t *p_transactionLock;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int sessionID;
  NSNumber *participantID;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  NSNumber *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BYTE v23[18];
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  NSNumber *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_transactionLock = &self->_transactionLock;
  pthread_mutex_lock(&self->_transactionLock);
  self->_isFlushed = 1;
  pthread_cond_signal(&self->_transactionDone);
  pthread_mutex_unlock(p_transactionLock);
  if ((VCControlChannelTransaction *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        sessionID = self->_sessionID;
        participantID = self->_participantID;
        v16 = 136316162;
        v17 = v5;
        v18 = 2080;
        v19 = "-[VCControlChannelTransaction flushTransaction]";
        v20 = 1024;
        v21 = 75;
        v22 = 1024;
        *(_DWORD *)v23 = sessionID;
        *(_WORD *)&v23[4] = 2112;
        *(_QWORD *)&v23[6] = participantID;
        v9 = " [%s] %s:%d flushTransaction: transaction has been flushed for sessionID='%d', participantID='%@'";
        v10 = v6;
        v11 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_sessionID;
        v15 = self->_participantID;
        v16 = 136316674;
        v17 = v12;
        v18 = 2080;
        v19 = "-[VCControlChannelTransaction flushTransaction]";
        v20 = 1024;
        v21 = 75;
        v22 = 2112;
        *(_QWORD *)v23 = v4;
        *(_WORD *)&v23[8] = 2048;
        *(_QWORD *)&v23[10] = self;
        v24 = 1024;
        v25 = v14;
        v26 = 2112;
        v27 = v15;
        v9 = " [%s] %s:%d %@(%p) flushTransaction: transaction has been flushed for sessionID='%d', participantID='%@'";
        v10 = v13;
        v11 = 64;
        goto LABEL_11;
      }
    }
  }
}

- (void)confirmedTransactionByParticipantID:(id)a3 sessionID:(unsigned int)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int sessionID;
  NSNumber *participantID;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  NSNumber *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[20];
  _BYTE v32[20];
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (self->_sessionID == a4 && !objc_msgSend(a3, "compare:", self->_participantID))
  {
    pthread_mutex_lock(&self->_transactionLock);
    self->_isConfirmed = 1;
    pthread_cond_signal(&self->_transactionDone);
    pthread_mutex_unlock(&self->_transactionLock);
    if ((VCControlChannelTransaction *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136316162;
          v25 = v20;
          v26 = 2080;
          v27 = "-[VCControlChannelTransaction confirmedTransactionByParticipantID:sessionID:]";
          v28 = 1024;
          v29 = 84;
          v30 = 1024;
          *(_DWORD *)v31 = a4;
          *(_WORD *)&v31[4] = 2112;
          *(_QWORD *)&v31[6] = a3;
          v12 = " [%s] %s:%d transactionConfirmedByParticipantID: message has been ACKed for sessionID='%d', participantID='%@'";
          v13 = v21;
          v14 = 44;
          goto LABEL_13;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136316674;
          v25 = v22;
          v26 = 2080;
          v27 = "-[VCControlChannelTransaction confirmedTransactionByParticipantID:sessionID:]";
          v28 = 1024;
          v29 = 84;
          v30 = 2112;
          *(_QWORD *)v31 = v19;
          *(_WORD *)&v31[8] = 2048;
          *(_QWORD *)&v31[10] = self;
          *(_WORD *)&v31[18] = 1024;
          *(_DWORD *)v32 = a4;
          *(_WORD *)&v32[4] = 2112;
          *(_QWORD *)&v32[6] = a3;
          v12 = " [%s] %s:%d %@(%p) transactionConfirmedByParticipantID: message has been ACKed for sessionID='%d', participantID='%@'";
          v13 = v23;
          v14 = 64;
          goto LABEL_13;
        }
      }
    }
  }
  else if ((VCControlChannelTransaction *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        sessionID = self->_sessionID;
        participantID = self->_participantID;
        v24 = 136316674;
        v25 = v8;
        v26 = 2080;
        v27 = "-[VCControlChannelTransaction confirmedTransactionByParticipantID:sessionID:]";
        v28 = 1024;
        v29 = 86;
        v30 = 1024;
        *(_DWORD *)v31 = sessionID;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = a4;
        *(_WORD *)&v31[10] = 2112;
        *(_QWORD *)&v31[12] = participantID;
        *(_WORD *)v32 = 2112;
        *(_QWORD *)&v32[2] = a3;
        v12 = " [%s] %s:%d transactionConfirmedByParticipantID: confirmation mismatch: sessionID '%d'!='%d', participantID '%@'!='%@'";
        v13 = v9;
        v14 = 60;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v24, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_sessionID;
        v18 = self->_participantID;
        v24 = 136317186;
        v25 = v15;
        v26 = 2080;
        v27 = "-[VCControlChannelTransaction confirmedTransactionByParticipantID:sessionID:]";
        v28 = 1024;
        v29 = 86;
        v30 = 2112;
        *(_QWORD *)v31 = v7;
        *(_WORD *)&v31[8] = 2048;
        *(_QWORD *)&v31[10] = self;
        *(_WORD *)&v31[18] = 1024;
        *(_DWORD *)v32 = v17;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = a4;
        *(_WORD *)&v32[10] = 2112;
        *(_QWORD *)&v32[12] = v18;
        v33 = 2112;
        v34 = a3;
        v12 = " [%s] %s:%d %@(%p) transactionConfirmedByParticipantID: confirmation mismatch: sessionID '%d'!='%d', parti"
              "cipantID '%@'!='%@'";
        v13 = v16;
        v14 = 80;
        goto LABEL_13;
      }
    }
  }
}

- (unsigned)retryCountUsingFastRetries:(BOOL)a3
{
  if (a3)
    return 120;
  else
    return 10;
}

- (float)retryTimeoutForRetryAttempt:(unsigned int)a3 usingFastRetries:(BOOL)a4
{
  double v4;
  unsigned int v6;

  LODWORD(v4) = 0.25;
  if (!a4)
  {
    v6 = -[VCControlChannelTransaction retryCountUsingFastRetries:](self, "retryCountUsingFastRetries:", 0, v4) - 1;
    if (v6 >= a3)
      v6 = a3;
    LODWORD(v4) = retryTimeout[v6];
  }
  return *(float *)&v4;
}

- (BOOL)sendReliableMessage:(id)a3 sessionID:(unsigned int)a4 participantID:(id)a5 timeout:(id)a6 useFastRetries:(BOOL)a7 withOptions:(id)a8
{
  _BOOL8 v8;
  void *v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 isConfirmed;
  VCControlChannelTransaction *v35;
  const __CFString *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  uint32_t v41;
  uint64_t v42;
  NSObject *v43;
  _BOOL4 v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  NSObject *v52;
  uint32_t v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  NSObject *v62;
  uint32_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  NSObject *v71;
  const char *v72;
  NSObject *v73;
  uint32_t v74;
  uint64_t v75;
  NSObject *v76;
  const __CFString *v77;
  uint64_t v78;
  NSObject *v79;
  const char *v80;
  const char *v81;
  NSObject *v82;
  uint32_t v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v88;
  unsigned int v89;
  _BYTE buf[22];
  __int16 v94;
  int v95;
  __int16 v96;
  _BYTE v97[44];
  __int16 v98;
  int v99;
  __int16 v100;
  double v101;
  uint64_t v102;

  v8 = a7;
  v102 = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1DF086F1C](&self->_weakTransactionDelegate, a2);
  v89 = -[VCControlChannelTransaction retryCountUsingFastRetries:](self, "retryCountUsingFastRetries:", v8);
  v13 = 0;
  if (!v89)
  {
    v44 = 0;
    v14 = 0.0;
    goto LABEL_84;
  }
  v14 = 0.0;
  v88 = 136316418;
  while (1)
  {
    if ((objc_msgSend(v12, "isParticipantActive:", objc_msgSend(a5, "unsignedLongLongValue", v88)) & 1) == 0)
    {
      if ((VCControlChannelTransaction *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_68;
        v49 = VRTraceErrorLogLevelToCSTR();
        v50 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        v94 = 1024;
        v95 = 121;
        v96 = 2112;
        *(_QWORD *)v97 = a5;
        *(_WORD *)&v97[8] = 1024;
        *(_DWORD *)&v97[10] = a4;
        v51 = " [%s] %s:%d Stop sending message to remote participant '%@' which is not part of session '%d'";
        v52 = v50;
        v53 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v45 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v45 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_68;
        v64 = VRTraceErrorLogLevelToCSTR();
        v65 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = v64;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        v94 = 1024;
        v95 = 121;
        v96 = 2112;
        *(_QWORD *)v97 = v45;
        *(_WORD *)&v97[8] = 2048;
        *(_QWORD *)&v97[10] = self;
        *(_WORD *)&v97[18] = 2112;
        *(_QWORD *)&v97[20] = a5;
        *(_WORD *)&v97[28] = 1024;
        *(_DWORD *)&v97[30] = a4;
        v51 = " [%s] %s:%d %@(%p) Stop sending message to remote participant '%@' which is not part of session '%d'";
        v52 = v65;
        v53 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v52, OS_LOG_TYPE_DEFAULT, v51, buf, v53);
LABEL_68:
      v44 = 0;
      goto LABEL_84;
    }
    pthread_mutex_lock(&self->_transactionLock);
    if (self->_isFlushed)
    {
      if ((VCControlChannelTransaction *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_67;
        v54 = VRTraceErrorLogLevelToCSTR();
        v55 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_67;
        *(_DWORD *)buf = v88;
        *(_QWORD *)&buf[4] = v54;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        v94 = 1024;
        v95 = 127;
        v96 = 1024;
        *(_DWORD *)v97 = v13 + 1;
        *(_WORD *)&v97[4] = 1024;
        *(_DWORD *)&v97[6] = a4;
        *(_WORD *)&v97[10] = 2112;
        *(_QWORD *)&v97[12] = a5;
        v56 = " [%s] %s:%d Transaction flushed. Not sending message on attempt '%d', sessionID='%d', participantID='%@'";
        v57 = v55;
        v58 = 50;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v46 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v46 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_67;
        v66 = VRTraceErrorLogLevelToCSTR();
        v67 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_67;
        *(_DWORD *)buf = 136316930;
        *(_QWORD *)&buf[4] = v66;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        v94 = 1024;
        v95 = 127;
        v96 = 2112;
        *(_QWORD *)v97 = v46;
        *(_WORD *)&v97[8] = 2048;
        *(_QWORD *)&v97[10] = self;
        *(_WORD *)&v97[18] = 1024;
        *(_DWORD *)&v97[20] = v13 + 1;
        *(_WORD *)&v97[24] = 1024;
        *(_DWORD *)&v97[26] = a4;
        *(_WORD *)&v97[30] = 2112;
        *(_QWORD *)&v97[32] = a5;
        v56 = " [%s] %s:%d %@(%p) Transaction flushed. Not sending message on attempt '%d', sessionID='%d', participantID='%@'";
        v57 = v67;
        v58 = 70;
      }
      _os_log_impl(&dword_1D8A54000, v57, OS_LOG_TYPE_DEFAULT, v56, buf, v58);
LABEL_67:
      pthread_mutex_unlock(&self->_transactionLock);
      goto LABEL_68;
    }
    pthread_mutex_unlock(&self->_transactionLock);
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_transactionID);
    v16 = a5;
    v17 = a5;
    v18 = v12;
    if (!+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:](VCControlChannelTransaction, "sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:", a3, a4, v17, v15, v12, a8))
    {
      if ((VCControlChannelTransaction *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_16;
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)buf = v88;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        v94 = 1024;
        v95 = 138;
        v96 = 1024;
        *(_DWORD *)v97 = v13 + 1;
        *(_WORD *)&v97[4] = 1024;
        *(_DWORD *)&v97[6] = a4;
        *(_WORD *)&v97[10] = 2112;
        *(_QWORD *)&v97[12] = v16;
        v22 = v26;
        v23 = " [%s] %s:%d Network failed to send message on attempt '%d', sessionID='%d', participantID='%@'";
        v24 = 50;
        goto LABEL_15;
      }
      v19 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316930;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFas"
                                "tRetries:withOptions:]";
          v94 = 1024;
          v95 = 138;
          v96 = 2112;
          *(_QWORD *)v97 = v19;
          *(_WORD *)&v97[8] = 2048;
          *(_QWORD *)&v97[10] = self;
          *(_WORD *)&v97[18] = 1024;
          *(_DWORD *)&v97[20] = v13 + 1;
          *(_WORD *)&v97[24] = 1024;
          *(_DWORD *)&v97[26] = a4;
          *(_WORD *)&v97[30] = 2112;
          *(_QWORD *)&v97[32] = v16;
          v22 = v21;
          v23 = " [%s] %s:%d %@(%p) Network failed to send message on attempt '%d', sessionID='%d', participantID='%@'";
          v24 = 70;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
        }
      }
    }
LABEL_16:
    -[VCControlChannelTransaction retryTimeoutForRetryAttempt:usingFastRetries:](self, "retryTimeoutForRetryAttempt:usingFastRetries:", v13, v8);
    v28 = v27;
    v29 = v14 + v27;
    if (a6)
    {
      objc_msgSend(a6, "floatValue");
      if (v29 > v30)
      {
        objc_msgSend(a6, "floatValue");
        v28 = v31 - v14;
        v29 = v14 + (float)(v31 - v14);
      }
      if (v28 <= 0.0)
        break;
    }
    v14 = v29;
    v12 = v18;
    pthread_mutex_lock(&self->_transactionLock);
    a5 = v16;
    if (!self->_isConfirmed)
    {
      memset(buf, 170, 16);
      convertTimeoutToRelativeTimespec(v28);
      *(_QWORD *)buf = v32;
      *(_QWORD *)&buf[8] = v33;
      pthread_cond_timedwait_relative_np(&self->_transactionDone, &self->_transactionLock, (const timespec *)buf);
    }
    pthread_mutex_unlock(&self->_transactionLock);
    isConfirmed = self->_isConfirmed;
    v35 = (VCControlChannelTransaction *)objc_opt_class();
    if (isConfirmed)
    {
      if (v35 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_74;
        v59 = VRTraceErrorLogLevelToCSTR();
        v60 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_74;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v59;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        v94 = 1024;
        v95 = 167;
        v96 = 1024;
        *(_DWORD *)v97 = a4;
        *(_WORD *)&v97[4] = 2112;
        *(_QWORD *)&v97[6] = a5;
        v61 = " [%s] %s:%d Message has been confirmed for sessionID='%d' by remote participant participantID='%@'";
        v62 = v60;
        v63 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v47 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v47 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_74;
        v68 = VRTraceErrorLogLevelToCSTR();
        v69 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_74;
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        v94 = 1024;
        v95 = 167;
        v96 = 2112;
        *(_QWORD *)v97 = v47;
        *(_WORD *)&v97[8] = 2048;
        *(_QWORD *)&v97[10] = self;
        *(_WORD *)&v97[18] = 1024;
        *(_DWORD *)&v97[20] = a4;
        *(_WORD *)&v97[24] = 2112;
        *(_QWORD *)&v97[26] = a5;
        v61 = " [%s] %s:%d %@(%p) Message has been confirmed for sessionID='%d' by remote participant participantID='%@'";
        v62 = v69;
        v63 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v62, OS_LOG_TYPE_DEFAULT, v61, buf, v63);
LABEL_74:
      v44 = 1;
      goto LABEL_84;
    }
    if (v35 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_33;
      v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      *(_DWORD *)buf = v88;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastRet"
                            "ries:withOptions:]";
      v94 = 1024;
      v95 = 164;
      v96 = 1024;
      *(_DWORD *)v97 = v13 + 1;
      *(_WORD *)&v97[4] = 2048;
      *(double *)&v97[6] = v29;
      *(_WORD *)&v97[14] = 1024;
      *(_DWORD *)&v97[16] = v8;
      v39 = v43;
      v40 = " [%s] %s:%d Attempt '%d' timed out. Aggregated wait is '%f', useFastRetries=%d";
      v41 = 50;
    }
    else
    {
      v36 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v36 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_33;
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      *(_DWORD *)buf = 136316930;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastRet"
                            "ries:withOptions:]";
      v94 = 1024;
      v95 = 164;
      v96 = 2112;
      *(_QWORD *)v97 = v36;
      *(_WORD *)&v97[8] = 2048;
      *(_QWORD *)&v97[10] = self;
      *(_WORD *)&v97[18] = 1024;
      *(_DWORD *)&v97[20] = v13 + 1;
      *(_WORD *)&v97[24] = 2048;
      *(double *)&v97[26] = v29;
      *(_WORD *)&v97[34] = 1024;
      *(_DWORD *)&v97[36] = v8;
      v39 = v38;
      v40 = " [%s] %s:%d %@(%p) Attempt '%d' timed out. Aggregated wait is '%f', useFastRetries=%d";
      v41 = 70;
    }
    _os_log_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, v41);
LABEL_33:
    v13 = (v13 + 1);
    if (v89 == (_DWORD)v13)
    {
      v44 = 0;
      LODWORD(v13) = v89;
      goto LABEL_84;
    }
  }
  v12 = v18;
  if ((VCControlChannelTransaction *)objc_opt_class() == self)
  {
    a5 = v16;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v70 = VRTraceErrorLogLevelToCSTR();
      v71 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v70;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        v94 = 1024;
        v95 = 148;
        v96 = 2112;
        *(_QWORD *)v97 = a6;
        v72 = " [%s] %s:%d User-specified timeout '%@' has expired. Aborting confirmation wait";
        v73 = v71;
        v74 = 38;
        goto LABEL_82;
      }
    }
  }
  else
  {
    a5 = v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v48 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v48 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v75 = VRTraceErrorLogLevelToCSTR();
      v76 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v88;
        *(_QWORD *)&buf[4] = v75;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        v94 = 1024;
        v95 = 148;
        v96 = 2112;
        *(_QWORD *)v97 = v48;
        *(_WORD *)&v97[8] = 2048;
        *(_QWORD *)&v97[10] = self;
        *(_WORD *)&v97[18] = 2112;
        *(_QWORD *)&v97[20] = a6;
        v72 = " [%s] %s:%d %@(%p) User-specified timeout '%@' has expired. Aborting confirmation wait";
        v73 = v76;
        v74 = 58;
LABEL_82:
        _os_log_impl(&dword_1D8A54000, v73, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
      }
    }
  }
  v44 = 0;
  v14 = v29;
LABEL_84:
  if ((VCControlChannelTransaction *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v78 = VRTraceErrorLogLevelToCSTR();
      v79 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v80 = "FAILURE";
        *(_DWORD *)buf = 136316930;
        *(_QWORD *)&buf[4] = v78;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        if (v44)
          v80 = "SUCCESS";
        v94 = 1024;
        v95 = 171;
        v96 = 2112;
        *(_QWORD *)v97 = a5;
        *(_WORD *)&v97[8] = 1024;
        *(_DWORD *)&v97[10] = a4;
        *(_WORD *)&v97[14] = 2080;
        *(_QWORD *)&v97[16] = v80;
        *(_WORD *)&v97[24] = 1024;
        *(_DWORD *)&v97[26] = v13 + 1;
        *(_WORD *)&v97[30] = 2048;
        *(double *)&v97[32] = v14;
        v81 = " [%s] %s:%d Finished sending message to participantID='%@' for sessionID='%d', result='%s', attempt='%d', "
              "aggregated wait='%f'";
        v82 = v79;
        v83 = 70;
LABEL_98:
        _os_log_impl(&dword_1D8A54000, v82, OS_LOG_TYPE_DEFAULT, v81, buf, v83);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v77 = (const __CFString *)-[VCControlChannelTransaction performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v77 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v84 = VRTraceErrorLogLevelToCSTR();
      v85 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v86 = "FAILURE";
        *(_DWORD *)buf = 136317442;
        *(_QWORD *)&buf[4] = v84;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        if (v44)
          v86 = "SUCCESS";
        v94 = 1024;
        v95 = 171;
        v96 = 2112;
        *(_QWORD *)v97 = v77;
        *(_WORD *)&v97[8] = 2048;
        *(_QWORD *)&v97[10] = self;
        *(_WORD *)&v97[18] = 2112;
        *(_QWORD *)&v97[20] = a5;
        *(_WORD *)&v97[28] = 1024;
        *(_DWORD *)&v97[30] = a4;
        *(_WORD *)&v97[34] = 2080;
        *(_QWORD *)&v97[36] = v86;
        v98 = 1024;
        v99 = v13 + 1;
        v100 = 2048;
        v101 = v14;
        v81 = " [%s] %s:%d %@(%p) Finished sending message to participantID='%@' for sessionID='%d', result='%s', attempt"
              "='%d', aggregated wait='%f'";
        v82 = v85;
        v83 = 90;
        goto LABEL_98;
      }
    }
  }
  if (v12)
    CFRelease(v12);
  return v44;
}

+ (BOOL)sendUnreliableMessage:(id)a3 sessionID:(unsigned int)a4 participantID:(id)a5 transactionID:(id)a6 transactionDelegate:(id)a7 withOptions:(id)a8
{
  uint64_t v15;
  int v16;
  size_t v17;
  uint64_t v18;
  NSObject *v19;
  BOOL result;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  NSObject *v36;
  _BOOL4 v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _BYTE v45[10];
  size_t v46;
  _BYTE v47[12];
  _BYTE v48[6];
  __int16 v49;
  id v50;
  _OWORD v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    if ((objc_msgSend(a7, "isParticipantActive:", objc_msgSend(a5, "unsignedLongLongValue")) & 1) == 0)
    {
      if ((id)objc_opt_class() != a1)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v22 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v22 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          return 0;
        v35 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x1E0CF2758];
        v37 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (!v37)
          return result;
        v38 = 136316674;
        v39 = v35;
        v40 = 2080;
        v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDeleg"
              "ate:withOptions:]";
        v42 = 1024;
        v43 = 186;
        v44 = 2112;
        *(_QWORD *)v45 = v22;
        *(_WORD *)&v45[8] = 2048;
        v46 = (size_t)a1;
        *(_WORD *)v47 = 2112;
        *(_QWORD *)&v47[2] = a5;
        *(_WORD *)&v47[10] = 1024;
        *(_DWORD *)v48 = a4;
        v26 = " [%s] %s:%d %@(%p) sendUnreliableMessage: attempt to send message to remote participant '%@' which is not "
              "part of session '%d'";
        v27 = v36;
        v28 = 64;
        goto LABEL_33;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (!v34)
          return result;
        v38 = 136316162;
        v39 = v32;
        v40 = 2080;
        v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDeleg"
              "ate:withOptions:]";
        v42 = 1024;
        v43 = 186;
        v44 = 2112;
        *(_QWORD *)v45 = a5;
        *(_WORD *)&v45[8] = 1024;
        LODWORD(v46) = a4;
        v26 = " [%s] %s:%d sendUnreliableMessage: attempt to send message to remote participant '%@' which is not part of session '%d'";
        v27 = v33;
        v28 = 44;
        goto LABEL_33;
      }
      return 0;
    }
    v71 = 0u;
    v70 = 0u;
    v69 = 0u;
    v68 = 0u;
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v64 = 0u;
    v63 = 0u;
    v62 = 0u;
    v61 = 0u;
    v60 = 0u;
    v59 = 0u;
    v58 = 0u;
    v57 = 0u;
    v56 = 0u;
    v55 = 0u;
    v54 = 0u;
    v53 = 0u;
    v52 = 0u;
    DWORD2(v52) = a4;
    BYTE5(v71) = objc_msgSend(a8, "duplicateMessageOnServerLink");
    BYTE14(v64) = 1;
    *(_QWORD *)&v65 = objc_msgSend(a5, "unsignedLongLongValue");
    if (a6)
      goto LABEL_4;
  }
  else
  {
    v71 = 0u;
    v70 = 0u;
    v69 = 0u;
    v68 = 0u;
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v64 = 0u;
    v63 = 0u;
    v62 = 0u;
    v61 = 0u;
    v60 = 0u;
    v59 = 0u;
    v58 = 0u;
    v57 = 0u;
    v56 = 0u;
    v55 = 0u;
    v54 = 0u;
    v53 = 0u;
    v52 = 0u;
    DWORD2(v52) = a4;
    BYTE5(v71) = objc_msgSend(a8, "duplicateMessageOnServerLink");
    if (a6)
    {
LABEL_4:
      BYTE10(v66) = 1;
      *(_QWORD *)&v67 = objc_msgSend(a6, "unsignedLongLongValue");
    }
  }
  memset((char *)v51 + 1, 170, 0x7FFuLL);
  v15 = objc_msgSend(a3, "length");
  v16 = v15;
  LOBYTE(v51[0]) = 64;
  v17 = v15 + 1;
  if ((unint64_t)(v15 + 1) >= 0x801)
  {
    if ((id)objc_opt_class() != a1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      v31 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v31)
        return result;
      v38 = 136317186;
      v39 = v29;
      v40 = 2080;
      v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:]";
      v42 = 1024;
      v43 = 211;
      v44 = 2112;
      *(_QWORD *)v45 = v21;
      *(_WORD *)&v45[8] = 2048;
      v46 = (size_t)a1;
      *(_WORD *)v47 = 1024;
      *(_DWORD *)&v47[2] = 1;
      *(_WORD *)&v47[6] = 1024;
      *(_DWORD *)&v47[8] = v16;
      *(_WORD *)v48 = 1024;
      *(_DWORD *)&v48[2] = a4;
      v49 = 2112;
      v50 = a5;
      v26 = " [%s] %s:%d %@(%p) Message length is too large (header[%d] data[%d]) to be sent. session[%d] particiapnt[%@] ";
      v27 = v30;
      v28 = 76;
      goto LABEL_33;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v25)
        return result;
      v38 = 136316674;
      v39 = v23;
      v40 = 2080;
      v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:]";
      v42 = 1024;
      v43 = 211;
      v44 = 1024;
      *(_DWORD *)v45 = 1;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v16;
      LOWORD(v46) = 1024;
      *(_DWORD *)((char *)&v46 + 2) = a4;
      HIWORD(v46) = 2112;
      *(_QWORD *)v47 = a5;
      v26 = " [%s] %s:%d Message length is too large (header[%d] data[%d]) to be sent. session[%d] particiapnt[%@] ";
      v27 = v24;
      v28 = 56;
LABEL_33:
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v38, v28);
      return 0;
    }
    return 0;
  }
  objc_msgSend(a3, "bytes");
  __memcpy_chk();
  objc_msgSend(a7, "addToSentStats:", v17);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v38 = 136316674;
      v39 = v18;
      v40 = 2080;
      v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:]";
      v42 = 1024;
      v43 = 221;
      v44 = 2112;
      *(_QWORD *)v45 = a6;
      *(_WORD *)&v45[8] = 2048;
      v46 = v17;
      *(_WORD *)v47 = 2112;
      *(_QWORD *)&v47[2] = a5;
      *(_WORD *)&v47[10] = 1024;
      *(_DWORD *)v48 = a4;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendUnreliableMessage: send message with transactionID=%@, size=%lu to remote participant=%@ which is part of session=%d", (uint8_t *)&v38, 0x40u);
    }
  }
  return VTP_Send(-1, v51, v17, 0, (uint64_t)&v52) == v17;
}

@end
