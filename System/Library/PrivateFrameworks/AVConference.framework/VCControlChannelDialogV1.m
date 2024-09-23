@implementation VCControlChannelDialogV1

- (VCControlChannelDialogV1)initWithSessionID:(unsigned int)a3 participantID:(id)a4 participantUUID:(id)a5 optionalTopics:(id)a6 participantConfig:(id *)a7 transactionDelegate:(id)a8
{
  VCControlChannelDialogV1 *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCControlChannelDialogV1;
  v9 = -[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:](&v11, sel_initWithSessionID_participantID_participantUUID_participantConfig_transactionDelegate_, *(_QWORD *)&a3, a4, a5, a7, a8);
  if (v9)
    v9->_optionalTopics = (NSArray *)a6;
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCControlChannelDialogV1;
  -[VCControlChannelDialog dealloc](&v3, sel_dealloc);
}

- (BOOL)processMessageFromParticipant:(id)a3 transactionID:(id)a4 messageType:(unsigned int)a5 transactionDelegate:(id)a6
{
  VCControlChannelDialogV1 *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int sessionID;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  uint64_t v23;
  NSObject *v24;
  unsigned int v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  unsigned int v31;
  const __CFString *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v41;
  NSObject *v42;
  unsigned int v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  uint64_t v47;
  NSObject *v48;
  unsigned int v49;
  _BYTE v50[24];
  _BYTE v51[32];
  id v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (a5 == 2)
  {
    +[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:](VCControlChannelDialogV1, "sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:", a3, a4, self->super._sessionID, a6);
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_30;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      sessionID = self->super._sessionID;
      *(_DWORD *)v50 = 136316418;
      *(_QWORD *)&v50[4] = v14;
      *(_WORD *)&v50[12] = 2080;
      *(_QWORD *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)v51 = 72;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = sessionID;
      *(_WORD *)&v51[10] = 2112;
      *(_QWORD *)&v51[12] = a3;
      *(_WORD *)&v51[20] = 2112;
      *(_QWORD *)&v51[22] = a4;
      v17 = " [%s] %s:%d processMessage: Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
      v18 = v15;
      v19 = 54;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_30;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      v22 = self->super._sessionID;
      *(_DWORD *)v50 = 136316930;
      *(_QWORD *)&v50[4] = v20;
      *(_WORD *)&v50[12] = 2080;
      *(_QWORD *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)v51 = 72;
      *(_WORD *)&v51[4] = 2112;
      *(_QWORD *)&v51[6] = v12;
      *(_WORD *)&v51[14] = 2048;
      *(_QWORD *)&v51[16] = self;
      *(_WORD *)&v51[24] = 1024;
      *(_DWORD *)&v51[26] = v22;
      *(_WORD *)&v51[30] = 2112;
      v52 = a3;
      LOWORD(v53) = 2112;
      *(_QWORD *)((char *)&v53 + 2) = a4;
      v17 = " [%s] %s:%d %@(%p) processMessage: Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
      v18 = v21;
      v19 = 74;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v50, v19);
    goto LABEL_30;
  }
  if (a5 != 1)
    goto LABEL_30;
  v10 = (VCControlChannelDialogV1 *)objc_opt_class();
  if (a4)
  {
    if (v10 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_29;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v25 = self->super._sessionID;
      *(_DWORD *)v50 = 136316674;
      *(_QWORD *)&v50[4] = v23;
      *(_WORD *)&v50[12] = 2080;
      *(_QWORD *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)v51 = 67;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = v25;
      *(_WORD *)&v51[10] = 2112;
      *(_QWORD *)&v51[12] = a3;
      *(_WORD *)&v51[20] = 2112;
      *(_QWORD *)&v51[22] = a4;
      *(_WORD *)&v51[30] = 1024;
      LODWORD(v52) = 1;
      v26 = " [%s] %s:%d Reliable message has been ACKed for _sessionID='%d', participantID='%@', transactionID='%@', messageType='%d'";
      v27 = v24;
      v28 = 60;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_29;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v31 = self->super._sessionID;
      *(_DWORD *)v50 = 136317186;
      *(_QWORD *)&v50[4] = v29;
      *(_WORD *)&v50[12] = 2080;
      *(_QWORD *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)v51 = 67;
      *(_WORD *)&v51[4] = 2112;
      *(_QWORD *)&v51[6] = v11;
      *(_WORD *)&v51[14] = 2048;
      *(_QWORD *)&v51[16] = self;
      *(_WORD *)&v51[24] = 1024;
      *(_DWORD *)&v51[26] = v31;
      *(_WORD *)&v51[30] = 2112;
      v52 = a3;
      LOWORD(v53) = 2112;
      *(_QWORD *)((char *)&v53 + 2) = a4;
      WORD5(v53) = 1024;
      HIDWORD(v53) = 1;
      v26 = " [%s] %s:%d %@(%p) Reliable message has been ACKed for _sessionID='%d', participantID='%@', transactionID='%"
            "@', messageType='%d'";
      v27 = v30;
      v28 = 80;
    }
    _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, v50, v28);
LABEL_29:
    -[VCControlChannelDialog confirmTransaction:](self, "confirmTransaction:", a4, *(_OWORD *)v50, *(_QWORD *)&v50[16], *(_OWORD *)v51, *(_OWORD *)&v51[16], v52, v53);
    goto LABEL_30;
  }
  if (v10 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v43 = self->super._sessionID;
        *(_DWORD *)v50 = 136316162;
        *(_QWORD *)&v50[4] = v41;
        *(_WORD *)&v50[12] = 2080;
        *(_QWORD *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
        *(_WORD *)&v50[22] = 1024;
        *(_DWORD *)v51 = 64;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v43;
        *(_WORD *)&v51[10] = 2112;
        *(_QWORD *)&v51[12] = a3;
        v44 = " [%s] %s:%d processMessage: sequenceNumber may not be nil!!! Aborting processing message for _sessionID='%"
              "d', participantID='%@'";
        v45 = v42;
        v46 = 44;
LABEL_49:
        _os_log_error_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_ERROR, v44, v50, v46);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v47 = VRTraceErrorLogLevelToCSTR();
      v48 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v49 = self->super._sessionID;
        *(_DWORD *)v50 = 136316674;
        *(_QWORD *)&v50[4] = v47;
        *(_WORD *)&v50[12] = 2080;
        *(_QWORD *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
        *(_WORD *)&v50[22] = 1024;
        *(_DWORD *)v51 = 64;
        *(_WORD *)&v51[4] = 2112;
        *(_QWORD *)&v51[6] = v13;
        *(_WORD *)&v51[14] = 2048;
        *(_QWORD *)&v51[16] = self;
        *(_WORD *)&v51[24] = 1024;
        *(_DWORD *)&v51[26] = v49;
        *(_WORD *)&v51[30] = 2112;
        v52 = a3;
        v44 = " [%s] %s:%d %@(%p) processMessage: sequenceNumber may not be nil!!! Aborting processing message for _sessi"
              "onID='%d', participantID='%@'";
        v45 = v48;
        v46 = 64;
        goto LABEL_49;
      }
    }
  }
LABEL_30:
  if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v50 = 136315906;
        *(_QWORD *)&v50[4] = v33;
        *(_WORD *)&v50[12] = 2080;
        *(_QWORD *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
        *(_WORD *)&v50[22] = 1024;
        *(_DWORD *)v51 = 77;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = a5 < 2;
        v35 = " [%s] %s:%d processMessageFromParticipant: isInternalMessage='%d'";
        v36 = v34;
        v37 = 34;
LABEL_40:
        _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, v35, v50, v37);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v32 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v32 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v50 = 136316418;
        *(_QWORD *)&v50[4] = v38;
        *(_WORD *)&v50[12] = 2080;
        *(_QWORD *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
        *(_WORD *)&v50[22] = 1024;
        *(_DWORD *)v51 = 77;
        *(_WORD *)&v51[4] = 2112;
        *(_QWORD *)&v51[6] = v32;
        *(_WORD *)&v51[14] = 2048;
        *(_QWORD *)&v51[16] = self;
        *(_WORD *)&v51[24] = 1024;
        *(_DWORD *)&v51[26] = a5 < 2;
        v35 = " [%s] %s:%d %@(%p) processMessageFromParticipant: isInternalMessage='%d'";
        v36 = v39;
        v37 = 54;
        goto LABEL_40;
      }
    }
  }
  return a5 < 2;
}

+ (BOOL)encryptMessage:(id)a3 buffer:(char *)a4 size:(unsigned int)a5 sequenceNumber:(unsigned __int16)a6 transactionDelegate:(id)a7
{
  uint64_t v8;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  _BYTE v31[10];
  id v32;
  __int16 v33;
  int v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v8 = a6;
  v37 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "VCCCGetBytes:size:", a4, *(_QWORD *)&a5))
    return objc_msgSend(a7, "encryptData:size:sequenceNumber:", a4, objc_msgSend(a3, "VCCCLength"), v8);
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    v22 = 136316418;
    v23 = v15;
    v24 = 2080;
    v25 = "+[VCControlChannelDialogV1 encryptMessage:buffer:size:sequenceNumber:transactionDelegate:]";
    v26 = 1024;
    v27 = 86;
    v28 = 2112;
    v29 = a3;
    v30 = 1024;
    *(_DWORD *)v31 = objc_msgSend(a3, "VCCCLength");
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = a5;
    v17 = " [%s] %s:%d encryptMessage: message '%@' is too long (%d > %d)";
    v18 = v16;
    v19 = 50;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    v22 = 136316930;
    v23 = v20;
    v24 = 2080;
    v25 = "+[VCControlChannelDialogV1 encryptMessage:buffer:size:sequenceNumber:transactionDelegate:]";
    v26 = 1024;
    v27 = 86;
    v28 = 2112;
    v29 = (id)v14;
    v30 = 2048;
    *(_QWORD *)v31 = a1;
    *(_WORD *)&v31[8] = 2112;
    v32 = a3;
    v33 = 1024;
    v34 = objc_msgSend(a3, "VCCCLength");
    v35 = 1024;
    v36 = a5;
    v17 = " [%s] %s:%d %@(%p) encryptMessage: message '%@' is too long (%d > %d)";
    v18 = v21;
    v19 = 70;
  }
  _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, v19);
  return 0;
}

- (id)newDataFromMessage:(id)a3 topic:(id)a4 transactionID:(unint64_t)a5 isReliable:(BOOL)a6 transactionDelegate:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  VCControlChannelDialogV1 *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136316162;
      v33 = v27;
      v34 = 2080;
      v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
      v36 = 1024;
      v37 = 93;
      v38 = 2112;
      v39 = v18;
      v40 = 2048;
      v41 = self;
      v23 = " [%s] %s:%d %@(%p) message must not be nil";
LABEL_38:
      v25 = v28;
      v26 = 48;
      goto LABEL_39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315650;
    v33 = v21;
    v34 = 2080;
    v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
    v36 = 1024;
    v37 = 93;
    v23 = " [%s] %s:%d message must not be nil";
LABEL_26:
    v25 = v22;
    v26 = 28;
LABEL_39:
    _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v23, buf, v26);
    return 0;
  }
  if (!a4)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v29 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136316162;
      v33 = v29;
      v34 = 2080;
      v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
      v36 = 1024;
      v37 = 94;
      v38 = 2112;
      v39 = v19;
      v40 = 2048;
      v41 = self;
      v23 = " [%s] %s:%d %@(%p) topic must not be nil";
      goto LABEL_38;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v24 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315650;
    v33 = v24;
    v34 = 2080;
    v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
    v36 = 1024;
    v37 = 94;
    v23 = " [%s] %s:%d topic must not be nil";
    goto LABEL_26;
  }
  v10 = a6;
  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !-[NSArray containsObject:](self->_optionalTopics, "containsObject:", a4))
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), a4, CFSTR(":"), v12);
  v13 = +[VCControlChannelDialogV1 newEncryptedMessageFromMessage:sequenceNumber:transactionDelegate:](VCControlChannelDialogV1, "newEncryptedMessageFromMessage:sequenceNumber:transactionDelegate:", v12, (unsigned __int16)a5, a7);
  if (!v13)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v20 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v33 = v30;
          v34 = 2080;
          v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
          v36 = 1024;
          v37 = 103;
          v38 = 2112;
          v39 = v20;
          v40 = 2048;
          v41 = self;
          _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) newDataFromMessage: encryption failed. Dropping the message...", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  v14 = v13;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5), CFSTR("TransactionID"));
  if (v10)
    v15 = 2;
  else
    v15 = 3;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15), CFSTR("Status"));
  v16 = (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);

  return v16;
}

+ (id)newEncryptedMessageFromMessage:(id)a3 sequenceNumber:(unsigned __int16)a4 transactionDelegate:(id)a5
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  _BYTE __b[2048];
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a5, "isEncryptionEnabled"))
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", a3, CFSTR("Message"), 0);
  memset(__b, 170, sizeof(__b));
  v9 = objc_msgSend(a5, "lastUsedMKIBytes");
  if (v9
    && (v10 = v9,
        +[VCControlChannelDialogV1 encryptMessage:buffer:size:sequenceNumber:transactionDelegate:](VCControlChannelDialogV1, "encryptMessage:buffer:size:sequenceNumber:transactionDelegate:", a3, __b, 2048, v6, a5)))
  {
    v11 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __b, objc_msgSend(a3, "VCCCLength"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, objc_msgSend(a3, "VCCCPayloadKey"), 0);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("MKI"));
  }
  else
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCControlChannelDialogV1 newEncryptedMessageFromMessage:sequenceNumber:transactionDelegate:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v18 = v15;
          v19 = 2080;
          v20 = "+[VCControlChannelDialogV1 newEncryptedMessageFromMessage:sequenceNumber:transactionDelegate:]";
          v21 = 1024;
          v22 = 125;
          v23 = 2112;
          v24 = v14;
          v25 = 2048;
          v26 = a1;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) newEncryptedMessageFromMessage: encryption failed. Dropping the message...", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  return v12;
}

+ (void)sendConfirmationToParticipantID:(id)a3 transactionID:(id)a4 sessionID:(unsigned int)a5 transactionDelegate:(id)a6
{
  uint64_t v7;
  void *v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BYTE v33[24];
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v7 = *(_QWORD *)&a5;
  v38 = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1DF088A10](a1, a2);
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a4, CFSTR("TransactionID"), 0);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9EF6FE0, CFSTR("Status"));
  v13 = (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  objc_autoreleasePoolPop(v11);
  v14 = (id)objc_opt_class();
  if (v13)
  {
    if (v14 == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136316418;
      v27 = v16;
      v28 = 2080;
      v29 = "+[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
      v30 = 1024;
      v31 = 143;
      v32 = 1024;
      *(_DWORD *)v33 = v7;
      *(_WORD *)&v33[4] = 2112;
      *(_QWORD *)&v33[6] = a3;
      *(_WORD *)&v33[14] = 2112;
      *(_QWORD *)&v33[16] = a4;
      v18 = " [%s] %s:%d Dialog send confirmation for sessionID='%d', participantID='%@', transactionID='%@'";
      v19 = v17;
      v20 = 54;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136316930;
      v27 = v21;
      v28 = 2080;
      v29 = "+[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
      v30 = 1024;
      v31 = 143;
      v32 = 2112;
      *(_QWORD *)v33 = v15;
      *(_WORD *)&v33[8] = 2048;
      *(_QWORD *)&v33[10] = a1;
      *(_WORD *)&v33[18] = 1024;
      *(_DWORD *)&v33[20] = v7;
      v34 = 2112;
      v35 = a3;
      v36 = 2112;
      v37 = a4;
      v18 = " [%s] %s:%d %@(%p) Dialog send confirmation for sessionID='%d', participantID='%@', transactionID='%@'";
      v19 = v22;
      v20 = 74;
    }
    _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
LABEL_13:
    +[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:](VCControlChannelTransaction, "sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:", v13, v7, a3, 0, a6, 0);
    goto LABEL_14;
  }
  if (v14 == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v27 = v24;
        v28 = 2080;
        v29 = "+[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
        v30 = 1024;
        v31 = 142;
        v32 = 2112;
        *(_QWORD *)v33 = v23;
        *(_WORD *)&v33[8] = 2048;
        *(_QWORD *)&v33[10] = a1;
        _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Can not send confirmation: messageData is nil", buf, 0x30u);
      }
    }
  }
LABEL_14:

}

+ (BOOL)processMessageFromParticipant:(id)a3 transactionID:(id)a4 messageType:(unsigned int)a5 sessionID:(unsigned int)a6 transactionDelegate:(id)a7
{
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[24];
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a3 && a5 == 2)
  {
    +[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:](VCControlChannelDialogV1, "sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:");
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v29 = 136316418;
          v30 = v13;
          v31 = 2080;
          v32 = "+[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:]";
          v33 = 1024;
          v34 = 160;
          v35 = 1024;
          *(_DWORD *)v36 = a6;
          *(_WORD *)&v36[4] = 2112;
          *(_QWORD *)&v36[6] = a3;
          *(_WORD *)&v36[14] = 2112;
          *(_QWORD *)&v36[16] = a4;
          v15 = " [%s] %s:%d +processMessage: Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
          v16 = v14;
          v17 = 54;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v29, v17);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v29 = 136316930;
          v30 = v18;
          v31 = 2080;
          v32 = "+[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:]";
          v33 = 1024;
          v34 = 160;
          v35 = 2112;
          *(_QWORD *)v36 = v12;
          *(_WORD *)&v36[8] = 2048;
          *(_QWORD *)&v36[10] = a1;
          *(_WORD *)&v36[18] = 1024;
          *(_DWORD *)&v36[20] = a6;
          v37 = 2112;
          v38 = a3;
          v39 = 2112;
          v40 = a4;
          v15 = " [%s] %s:%d %@(%p) +processMessage: Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
          v16 = v19;
          v17 = 74;
          goto LABEL_13;
        }
      }
    }
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v29 = 136315906;
        v30 = v21;
        v31 = 2080;
        v32 = "+[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:]";
        v33 = 1024;
        v34 = 162;
        v35 = 1024;
        *(_DWORD *)v36 = a5 > 1;
        v23 = " [%s] %s:%d +processMessageFromParticipant: shouldNotifyClient='%d'";
        v24 = v22;
        v25 = 34;
LABEL_24:
        _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v29, v25);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v29 = 136316418;
        v30 = v26;
        v31 = 2080;
        v32 = "+[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:]";
        v33 = 1024;
        v34 = 162;
        v35 = 2112;
        *(_QWORD *)v36 = v20;
        *(_WORD *)&v36[8] = 2048;
        *(_QWORD *)&v36[10] = a1;
        *(_WORD *)&v36[18] = 1024;
        *(_DWORD *)&v36[20] = a5 > 1;
        v23 = " [%s] %s:%d %@(%p) +processMessageFromParticipant: shouldNotifyClient='%d'";
        v24 = v27;
        v25 = 54;
        goto LABEL_24;
      }
    }
  }
  return a5 > 1;
}

- (BOOL)decryptMessageWithMKI:(void *)a3 message:(id)a4 buffer:(char *)a5 size:(unsigned int)a6 sequenceNumber:(unsigned __int16)a7
{
  uint64_t v7;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  const __CFString *v26;
  void *v27;
  char v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  NSObject *v36;
  int v38;
  _BYTE v39[24];
  __int128 v40;
  _BYTE v41[40];
  uint64_t v42;

  v7 = a7;
  v42 = *MEMORY[0x1E0C80C00];
  if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_17;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    v16 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      *(_DWORD *)v39 = 136316418;
      *(_QWORD *)&v39[4] = v14;
      *(_WORD *)&v39[12] = 2080;
      *(_QWORD *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 167;
      WORD2(v40) = 2112;
      *(_QWORD *)((char *)&v40 + 6) = a3;
      HIWORD(v40) = 2112;
      *(_QWORD *)v41 = a4;
      *(_WORD *)&v41[8] = 1024;
      *(_DWORD *)&v41[10] = v7;
      v17 = " [%s] %s:%d decryptMessageWithMKI='%@' message='%@', sequenceNumber='%d'";
      v18 = v15;
      v19 = 54;
LABEL_13:
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v39, v19);
      goto LABEL_17;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v39 = 136316418;
      *(_QWORD *)&v39[4] = v14;
      *(_WORD *)&v39[12] = 2080;
      *(_QWORD *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 167;
      WORD2(v40) = 2112;
      *(_QWORD *)((char *)&v40 + 6) = a3;
      HIWORD(v40) = 2112;
      *(_QWORD *)v41 = a4;
      *(_WORD *)&v41[8] = 1024;
      *(_DWORD *)&v41[10] = v7;
      v23 = " [%s] %s:%d decryptMessageWithMKI='%@' message='%@', sequenceNumber='%d'";
      v24 = v15;
      v25 = 54;
      goto LABEL_34;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      v22 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        *(_DWORD *)v39 = 136316930;
        *(_QWORD *)&v39[4] = v20;
        *(_WORD *)&v39[12] = 2080;
        *(_QWORD *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
        *(_WORD *)&v39[22] = 1024;
        LODWORD(v40) = 167;
        WORD2(v40) = 2112;
        *(_QWORD *)((char *)&v40 + 6) = v13;
        HIWORD(v40) = 2048;
        *(_QWORD *)v41 = self;
        *(_WORD *)&v41[8] = 2112;
        *(_QWORD *)&v41[10] = a3;
        *(_WORD *)&v41[18] = 2112;
        *(_QWORD *)&v41[20] = a4;
        *(_WORD *)&v41[28] = 1024;
        *(_DWORD *)&v41[30] = v7;
        v17 = " [%s] %s:%d %@(%p) decryptMessageWithMKI='%@' message='%@', sequenceNumber='%d'";
        v18 = v21;
        v19 = 74;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v39 = 136316930;
        *(_QWORD *)&v39[4] = v20;
        *(_WORD *)&v39[12] = 2080;
        *(_QWORD *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
        *(_WORD *)&v39[22] = 1024;
        LODWORD(v40) = 167;
        WORD2(v40) = 2112;
        *(_QWORD *)((char *)&v40 + 6) = v13;
        HIWORD(v40) = 2048;
        *(_QWORD *)v41 = self;
        *(_WORD *)&v41[8] = 2112;
        *(_QWORD *)&v41[10] = a3;
        *(_WORD *)&v41[18] = 2112;
        *(_QWORD *)&v41[20] = a4;
        *(_WORD *)&v41[28] = 1024;
        *(_DWORD *)&v41[30] = v7;
        v23 = " [%s] %s:%d %@(%p) decryptMessageWithMKI='%@' message='%@', sequenceNumber='%d'";
        v24 = v21;
        v25 = 74;
LABEL_34:
        _os_log_debug_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEBUG, v23, v39, v25);
      }
    }
  }
LABEL_17:
  if (objc_msgSend(a4, "length", *(_OWORD *)v39, *(_QWORD *)&v39[16], v40, *(_QWORD *)v41, *(_OWORD *)&v41[8], *(_OWORD *)&v41[24]) > (unint64_t)a6)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      v31 = objc_msgSend(a4, "length");
      *(_DWORD *)v39 = 136316418;
      *(_QWORD *)&v39[4] = v29;
      *(_WORD *)&v39[12] = 2080;
      *(_QWORD *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 170;
      WORD2(v40) = 2112;
      *(_QWORD *)((char *)&v40 + 6) = a4;
      HIWORD(v40) = 1024;
      *(_DWORD *)v41 = v31;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = a6;
      v32 = " [%s] %s:%d decryptMessageWithMKI: message='%@' is too long (%d > %d)";
      v33 = v30;
      v34 = 50;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v26 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      v38 = objc_msgSend(a4, "length");
      *(_DWORD *)v39 = 136316930;
      *(_QWORD *)&v39[4] = v35;
      *(_WORD *)&v39[12] = 2080;
      *(_QWORD *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 170;
      WORD2(v40) = 2112;
      *(_QWORD *)((char *)&v40 + 6) = v26;
      HIWORD(v40) = 2048;
      *(_QWORD *)v41 = self;
      *(_WORD *)&v41[8] = 2112;
      *(_QWORD *)&v41[10] = a4;
      *(_WORD *)&v41[18] = 1024;
      *(_DWORD *)&v41[20] = v38;
      *(_WORD *)&v41[24] = 1024;
      *(_DWORD *)&v41[26] = a6;
      v32 = " [%s] %s:%d %@(%p) decryptMessageWithMKI: message='%@' is too long (%d > %d)";
      v33 = v36;
      v34 = 70;
    }
    _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, v32, v39, v34);
    return 0;
  }
  objc_msgSend(a4, "getBytes:length:", a5, a6);
  v27 = (void *)MEMORY[0x1DF086F1C](&self->super._weakTransactionDelegate);
  v28 = objc_msgSend(v27, "decryptWithMKI:data:size:sequenceNumber:", a3, a5, objc_msgSend(a4, "length"), v7);
  if (v27)
    CFRelease(v27);
  return v28;
}

- (id)processEncryptedPayload:(id)a3 isData:(BOOL)a4 topic:(id *)a5 sequenceNumber:(id)a6 MKIData:(id)a7 participantID:(id)a8
{
  _BOOL4 v13;
  VCMediaKeyIndex *v15;
  uint64_t v16;
  void *v17;
  id v18;
  __CFString *v19;
  uint64_t v20;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  _BYTE __b[2048];
  _BYTE buf[12];
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  VCControlChannelDialogV1 *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  if (!a7)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:].cold.1();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = v24;
    v31 = 2080;
    v32 = "-[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:]";
    v33 = 1024;
    v34 = 184;
    v35 = 2112;
    v36 = v22;
    v37 = 2048;
    v38 = self;
    v39 = 2112;
    v40 = a8;
    v26 = " [%s] %s:%d %@(%p) processEncryptedMessage: message received but MKI is not included in the packet from partic"
          "ipantID='%@'. Dropping message...";
    goto LABEL_36;
  }
  v13 = a4;
  memset(__b, 170, sizeof(__b));
  objc_msgSend(a7, "getBytes:length:", __b, 2048);
  v15 = -[VCMediaKeyIndex initWithBytes:bufferSize:]([VCMediaKeyIndex alloc], "initWithBytes:bufferSize:", __b, 16);
  LOBYTE(a6) = -[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:](self, "decryptMessageWithMKI:message:buffer:size:sequenceNumber:", v15, a3, __b, 2048, objc_msgSend(a6, "unsignedShortValue"));

  if ((a6 & 1) == 0)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:].cold.2();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v27 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = v27;
    v31 = 2080;
    v32 = "-[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:]";
    v33 = 1024;
    v34 = 192;
    v35 = 2112;
    v36 = v23;
    v37 = 2048;
    v38 = self;
    v39 = 2112;
    v40 = a8;
    v26 = " [%s] %s:%d %@(%p) processEncryptedMessage: message received from participantID='%@' but could not decrypt it."
          " Dropping message...";
LABEL_36:
    _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x3Au);
    return 0;
  }
  v16 = objc_msgSend(a3, "length");
  if (v13)
  {
    if (v16)
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __b, objc_msgSend(a3, "length"));
    else
      v17 = 0;
    v19 = CFSTR("VCExternalClientDataTopic");
  }
  else
  {
    if (v16)
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __b, objc_msgSend(a3, "length"), 4);
    else
      v18 = 0;
    *(_QWORD *)buf = 0;
    v28 = 0;
    -[VCControlChannelDialogV1 getTopic:message:fromPayload:](self, "getTopic:message:fromPayload:", buf, &v28, v18);
    v17 = (void *)objc_msgSend(v28, "dataUsingEncoding:", 4);
    v20 = objc_msgSend(*(id *)buf, "length");
    v19 = *(__CFString **)buf;
    if (!v20)
      v19 = 0;
  }
  *a5 = v19;
  return v17;
}

- (id)processMessageData:(id)a3 participantID:(id)a4 topic:(id *)a5 transactionID:(id *)a6 messageStatus:(unsigned int *)a7 isInternalMessage:(BOOL *)a8
{
  VCControlChannelDialogV1 *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  VCControlChannelDialogV1 *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  const __CFString *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  uint64_t v45;
  NSObject *v46;
  _BOOL4 v47;
  const __CFString *v48;
  uint64_t v49;
  NSObject *v50;
  const __CFString *v51;
  unsigned int sessionID;
  const char *v53;
  NSObject *v54;
  uint32_t v55;
  uint64_t v56;
  NSObject *v57;
  const __CFString *v58;
  unsigned int v59;
  uint64_t v61;
  NSObject *v62;
  const __CFString *v63;
  uint64_t v64;
  NSObject *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint32_t v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  NSObject *v87;
  uint32_t v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  NSObject *v94;
  const __CFString *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  NSObject *v101;
  uint32_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v113;
  unint64_t v114;
  _BYTE buf[12];
  __int16 v116;
  const char *v117;
  __int16 v118;
  int v119;
  __int16 v120;
  id v121;
  __int16 v122;
  VCControlChannelDialogV1 *v123;
  __int16 v124;
  id v125;
  __int16 v126;
  unsigned int v127;
  uint64_t v128;

  v8 = self;
  v128 = *MEMORY[0x1E0C80C00];
  v114 = 0;
  if (!a5)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v71 = VRTraceErrorLogLevelToCSTR();
      v72 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v71;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 213;
      v73 = " [%s] %s:%d topic must not be nil";
      goto LABEL_109;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v66 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
    else
      v66 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v79 = VRTraceErrorLogLevelToCSTR();
    v80 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v79;
    v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v118 = 1024;
    v119 = 213;
    v120 = 2112;
    v121 = (id)v66;
    v122 = 2048;
    v123 = v8;
    v73 = " [%s] %s:%d %@(%p) topic must not be nil";
LABEL_126:
    v77 = v80;
    v78 = 48;
    goto LABEL_127;
  }
  if (!a6)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v74 = VRTraceErrorLogLevelToCSTR();
      v72 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v74;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 214;
      v73 = " [%s] %s:%d transactionID must not be nil";
      goto LABEL_109;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v67 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
    else
      v67 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v81 = VRTraceErrorLogLevelToCSTR();
    v80 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v81;
    v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v118 = 1024;
    v119 = 214;
    v120 = 2112;
    v121 = (id)v67;
    v122 = 2048;
    v123 = v8;
    v73 = " [%s] %s:%d %@(%p) transactionID must not be nil";
    goto LABEL_126;
  }
  if (!a7)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v75 = VRTraceErrorLogLevelToCSTR();
      v72 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v75;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 215;
      v73 = " [%s] %s:%d messageStatus must not be nil";
      goto LABEL_109;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v68 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
    else
      v68 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v82 = VRTraceErrorLogLevelToCSTR();
    v80 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v82;
    v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v118 = 1024;
    v119 = 215;
    v120 = 2112;
    v121 = (id)v68;
    v122 = 2048;
    v123 = v8;
    v73 = " [%s] %s:%d %@(%p) messageStatus must not be nil";
    goto LABEL_126;
  }
  if (!a8)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v69 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v69 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v83 = VRTraceErrorLogLevelToCSTR();
      v80 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v83;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 216;
      v120 = 2112;
      v121 = (id)v69;
      v122 = 2048;
      v123 = v8;
      v73 = " [%s] %s:%d %@(%p) isInternalMessage must not be nil";
      goto LABEL_126;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v76 = VRTraceErrorLogLevelToCSTR();
    v72 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v76;
    v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v118 = 1024;
    v119 = 216;
    v73 = " [%s] %s:%d isInternalMessage must not be nil";
LABEL_109:
    v77 = v72;
    v78 = 28;
LABEL_127:
    _os_log_impl(&dword_1D8A54000, v77, OS_LOG_TYPE_DEFAULT, v73, buf, v78);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v113 = 0;
    v108 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = v8;
    v16 = a4;
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v107 = v17;
    a4 = v16;
    v8 = v15;
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", objc_msgSend(v108, "setWithObjects:", v11, v12, v13, v14, v107, v18, objc_opt_class(), 0), a3, &v113);
    if (!v19)
    {
      if ((VCControlChannelDialogV1 *)objc_opt_class() == v15)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v61 = VRTraceErrorLogLevelToCSTR();
          v62 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:].cold.1(v61, &v113, v62);
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v20 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v15, "performSelector:", sel_logPrefix);
        else
          v20 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v64 = VRTraceErrorLogLevelToCSTR();
          v65 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = v64;
            v116 = 2080;
            v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
            v118 = 1024;
            v119 = 224;
            v120 = 2112;
            v121 = (id)v20;
            v122 = 2048;
            v123 = v8;
            v124 = 2112;
            v125 = v113;
            _os_log_error_impl(&dword_1D8A54000, v65, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unarchive message. error='%@'", buf, 0x3Au);
          }
        }
      }
    }
  }
  else
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), a3, 0);
  }
  v21 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Status")), "intValue");
  v22 = (void *)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TransactionID"));
  v23 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("EncryptedMessage"));
  v24 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("EncryptedData"));
  v25 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Message"));
  v26 = (void *)MEMORY[0x1DF086F1C](&v8->super._weakTransactionDelegate);
  if (!objc_msgSend(v26, "isEncryptionEnabled"))
  {
    if (v25 || !v23)
    {
      *(_QWORD *)buf = 0;
      -[VCControlChannelDialogV1 getTopic:message:fromPayload:](v8, "getTopic:message:fromPayload:", &v114, buf, objc_msgSend((id)v25, "VCCCString"));
      v25 = objc_msgSend(*(id *)buf, "VCCCData");
      goto LABEL_20;
    }
    if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v70 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v70 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_158;
      v89 = VRTraceErrorLogLevelToCSTR();
      v90 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_158;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v89;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 250;
      v120 = 2112;
      v121 = (id)v70;
      v122 = 2048;
      v123 = v8;
      v124 = 2112;
      v125 = a4;
      v86 = " [%s] %s:%d %@(%p) messageReceived: message encryption is disabled locally via user defaults but remote part"
            "icipant '%@' sends encrypted messages. Dropping encrypted message. FIX ENCRYPTION INCONSYSTENCY!!!)";
LABEL_137:
      v87 = v90;
      v88 = 58;
      goto LABEL_157;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_158;
    v84 = VRTraceErrorLogLevelToCSTR();
    v85 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_158;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = v84;
    v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v118 = 1024;
    v119 = 250;
    v120 = 2112;
    v121 = a4;
    v86 = " [%s] %s:%d messageReceived: message encryption is disabled locally via user defaults but remote participant '"
          "%@' sends encrypted messages. Dropping encrypted message. FIX ENCRYPTION INCONSYSTENCY!!!)";
LABEL_132:
    v87 = v85;
    v88 = 38;
LABEL_157:
    _os_log_impl(&dword_1D8A54000, v87, OS_LOG_TYPE_DEFAULT, v86, buf, v88);
LABEL_158:
    v25 = 0;
    goto LABEL_66;
  }
  if (v23)
  {
    v25 = -[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:](v8, "processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:", v23, 0, &v114, v22, objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("MKI")), a4);
    if (!(v25 | v114))
    {
      if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v27 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
        else
          v27 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_158;
        v93 = VRTraceErrorLogLevelToCSTR();
        v94 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_158;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v93;
        v116 = 2080;
        v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        v118 = 1024;
        v119 = 240;
        v120 = 2112;
        v121 = (id)v27;
        v122 = 2048;
        v123 = v8;
        v86 = " [%s] %s:%d %@(%p) Payload and topic may not be both nil";
        goto LABEL_156;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_158;
      v91 = VRTraceErrorLogLevelToCSTR();
      v92 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_158;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v91;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 240;
      v86 = " [%s] %s:%d Payload and topic may not be both nil";
LABEL_151:
      v87 = v92;
      v88 = 28;
      goto LABEL_157;
    }
    goto LABEL_20;
  }
  if (v24)
  {
    v25 = -[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:](v8, "processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:", v24, 1, &v114, v22, objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("MKI")), a4);
    if (!(v25 | v114))
    {
      if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v39 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
        else
          v39 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_158;
        v97 = VRTraceErrorLogLevelToCSTR();
        v94 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_158;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v97;
        v116 = 2080;
        v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        v118 = 1024;
        v119 = 243;
        v120 = 2112;
        v121 = (id)v39;
        v122 = 2048;
        v123 = v8;
        v86 = " [%s] %s:%d %@(%p) Payload and topic may not be both nil";
LABEL_156:
        v87 = v94;
        v88 = 48;
        goto LABEL_157;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_158;
      v96 = VRTraceErrorLogLevelToCSTR();
      v92 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_158;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v96;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 243;
      v86 = " [%s] %s:%d Payload and topic may not be both nil";
      goto LABEL_151;
    }
LABEL_20:
    v28 = objc_opt_class();
    if (a4)
    {
      if ((VCControlChannelDialogV1 *)v28 == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_35;
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v31;
        v116 = 2080;
        v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        v118 = 1024;
        v119 = 260;
        v120 = 2112;
        v121 = a4;
        v33 = " [%s] %s:%d messageReceived: found existing dialog for participantID='%@'";
        v34 = v32;
        v35 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v29 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
        else
          v29 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_35;
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v36;
        v116 = 2080;
        v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        v118 = 1024;
        v119 = 260;
        v120 = 2112;
        v121 = (id)v29;
        v122 = 2048;
        v123 = v8;
        v124 = 2112;
        v125 = a4;
        v33 = " [%s] %s:%d %@(%p) messageReceived: found existing dialog for participantID='%@'";
        v34 = v37;
        v35 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
LABEL_35:
      v38 = -[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:](v8, "processMessageFromParticipant:transactionID:messageType:transactionDelegate:", a4, v22, v21, v26);
      goto LABEL_50;
    }
    if ((VCControlChannelDialogV1 *)v28 == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_49;
      v40 = VRTraceErrorLogLevelToCSTR();
      v41 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v40;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 263;
      v42 = " [%s] %s:%d messageReceived: no participantID provided. Processing without dialog";
      v43 = v41;
      v44 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_49;
      v45 = VRTraceErrorLogLevelToCSTR();
      v46 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v45;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 263;
      v120 = 2112;
      v121 = (id)v30;
      v122 = 2048;
      v123 = v8;
      v42 = " [%s] %s:%d %@(%p) messageReceived: no participantID provided. Processing without dialog";
      v43 = v46;
      v44 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
LABEL_49:
    v38 = +[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:](VCControlChannelDialogV1, "processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:", 0, v22, v21, v8->super._sessionID, v26);
LABEL_50:
    v47 = v38;
    if ((VCControlChannelDialogV1 *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_65;
      v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_65;
      v51 = CFSTR("Will");
      sessionID = v8->super._sessionID;
      if (v47)
        v51 = CFSTR("Will not");
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v49;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 267;
      v120 = 2112;
      v121 = (id)v51;
      v122 = 1024;
      LODWORD(v123) = sessionID;
      v53 = " [%s] %s:%d messageReceived: %@ notify client for sessionID '%d'";
      v54 = v50;
      v55 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v48 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v48 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_65;
      v56 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_65;
      v58 = CFSTR("Will");
      v59 = v8->super._sessionID;
      if (v47)
        v58 = CFSTR("Will not");
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v56;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 267;
      v120 = 2112;
      v121 = (id)v48;
      v122 = 2048;
      v123 = v8;
      v124 = 2112;
      v125 = (id)v58;
      v126 = 1024;
      v127 = v59;
      v53 = " [%s] %s:%d %@(%p) messageReceived: %@ notify client for sessionID '%d'";
      v54 = v57;
      v55 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v54, OS_LOG_TYPE_DEFAULT, v53, buf, v55);
LABEL_65:
    *a7 = v21;
    *a6 = v22;
    *a8 = v47;
    *a5 = (id)v114;
    goto LABEL_66;
  }
  if (!v25 && (_DWORD)v21 != 1)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v95 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v95 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_158;
      v106 = VRTraceErrorLogLevelToCSTR();
      v90 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_158;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v106;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 246;
      v120 = 2112;
      v121 = (id)v95;
      v122 = 2048;
      v123 = v8;
      v124 = 2112;
      v125 = a4;
      v86 = " [%s] %s:%d %@(%p) processEncryptedMessage: message encryption is enabled but remote participant '%@' sends "
            "un-encrypted messages. Dropping un-encrypted message. FIX ENCRYPTION INCONSYSTENCY!!!)";
      goto LABEL_137;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_158;
    v103 = VRTraceErrorLogLevelToCSTR();
    v85 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_158;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = v103;
    v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v118 = 1024;
    v119 = 246;
    v120 = 2112;
    v121 = a4;
    v86 = " [%s] %s:%d processEncryptedMessage: message encryption is enabled but remote participant '%@' sends un-encryp"
          "ted messages. Dropping un-encrypted message. FIX ENCRYPTION INCONSYSTENCY!!!)";
    goto LABEL_132;
  }
  if ((_DWORD)v21 == 1)
    goto LABEL_20;
  if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v63 = (const __CFString *)-[VCControlChannelDialogV1 performSelector:](v8, "performSelector:", sel_logPrefix);
    else
      v63 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_66;
    v104 = VRTraceErrorLogLevelToCSTR();
    v105 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_66;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = v104;
    v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v118 = 1024;
    v119 = 247;
    v120 = 2112;
    v121 = (id)v63;
    v122 = 2048;
    v123 = v8;
    v124 = 2112;
    v125 = a4;
    v100 = " [%s] %s:%d %@(%p) processEncryptedMessage: message encryption is enabled but message payload is empty for participant '%@'";
    v101 = v105;
    v102 = 58;
    goto LABEL_169;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v98 = VRTraceErrorLogLevelToCSTR();
    v99 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v98;
      v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v118 = 1024;
      v119 = 247;
      v120 = 2112;
      v121 = a4;
      v100 = " [%s] %s:%d processEncryptedMessage: message encryption is enabled but message payload is empty for participant '%@'";
      v101 = v99;
      v102 = 38;
LABEL_169:
      _os_log_impl(&dword_1D8A54000, v101, OS_LOG_TYPE_DEFAULT, v100, buf, v102);
    }
  }
LABEL_66:
  if (v26)
    CFRelease(v26);
  return (id)v25;
}

- (void)getTopic:(id *)a3 message:(id *)a4 fromPayload:(id)a5
{
  id v5;
  uint64_t v8;
  uint64_t v9;

  v5 = a5;
  v8 = objc_msgSend(a5, "rangeOfString:", CFSTR(":"));
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    *a3 = (id)objc_msgSend(v5, "substringToIndex:", v8);
    v5 = (id)objc_msgSend(v5, "substringFromIndex:", v9 + 1);
    if (!objc_msgSend(v5, "length"))
      v5 = 0;
  }
  *a4 = v5;
}

- (void)newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d newDataFromMessage: encryption failed. Dropping the message...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)newEncryptedMessageFromMessage:sequenceNumber:transactionDelegate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d newEncryptedMessageFromMessage: encryption failed. Dropping the message...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can not send confirmation: messageData is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d processEncryptedMessage: message received but MKI is not included in the packet from participantID='%@'. Dropping message...");
  OUTLINED_FUNCTION_3();
}

- (void)processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d processEncryptedMessage: message received from participantID='%@' but could not decrypt it. Dropping message...");
  OUTLINED_FUNCTION_3();
}

- (void)processMessageData:(NSObject *)a3 participantID:topic:transactionID:messageStatus:isInternalMessage:.cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];
  __int128 v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isI"
                       "nternalMessage:]";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 224;
  WORD2(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, (uint64_t)a2, a3, " [%s] %s:%d Failed to unarchive message. error='%@'", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], v4);
  OUTLINED_FUNCTION_3();
}

@end
