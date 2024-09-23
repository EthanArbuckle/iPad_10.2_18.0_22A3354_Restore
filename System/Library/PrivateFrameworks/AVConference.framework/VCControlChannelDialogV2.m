@implementation VCControlChannelDialogV2

- (VCControlChannelDialogV2)initWithSessionID:(unsigned int)a3 participantID:(id)a4 participantUUID:(id)a5 participantConfig:(id *)a6 transactionDelegate:(id)a7
{
  id v8;
  uint64_t v9;
  CFDictionaryRef v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
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
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)VCControlChannelDialogV2;
  v8 = -[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:](&v31, sel_initWithSessionID_participantID_participantUUID_participantConfig_transactionDelegate_, *(_QWORD *)&a3, a4, a5, a6, a7);
  if (!v8)
    goto LABEL_43;
  if (!a6)
  {
    if ((id)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_43;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      *(_DWORD *)buf = 136315650;
      v33 = v14;
      v34 = 2080;
      v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
      v36 = 1024;
      v37 = 45;
      v16 = " [%s] %s:%d participantConfig may not be nil";
      v17 = v15;
      v18 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)objc_msgSend(v8, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_43;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      *(_DWORD *)buf = 136316162;
      v33 = v25;
      v34 = 2080;
      v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
      v36 = 1024;
      v37 = 45;
      v38 = 2112;
      v39 = v11;
      v40 = 2048;
      v41 = v8;
      v16 = " [%s] %s:%d %@(%p) participantConfig may not be nil";
      v17 = v26;
      v18 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_43:

    return 0;
  }
  v9 = *MEMORY[0x1E0C9AE00];
  v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&kVCCryptorCreationOption_DisableReplayProtection, MEMORY[0x1E0C9AE50], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (VCCryptor_Create(v9, 1, a6->var3, a6->var1, (uint64_t)v10, (uint64_t *)v8 + 30))
  {
    if ((id)objc_opt_class() != v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)objc_msgSend(v8, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v33 = v27;
          v34 = 2080;
          v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
          v36 = 1024;
          v37 = 49;
          v38 = 2112;
          v39 = v12;
          v40 = 2048;
          v41 = v8;
          v21 = " [%s] %s:%d %@(%p) Failed to create uplink cryptor for dialog";
LABEL_39:
          v23 = v28;
          v24 = 48;
          goto LABEL_40;
        }
      }
LABEL_41:
      if (v10)
        CFRelease(v10);
      goto LABEL_43;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_41;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315650;
    v33 = v19;
    v34 = 2080;
    v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
    v36 = 1024;
    v37 = 49;
    v21 = " [%s] %s:%d Failed to create uplink cryptor for dialog";
LABEL_25:
    v23 = v20;
    v24 = 28;
LABEL_40:
    _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v21, buf, v24);
    goto LABEL_41;
  }
  if (VCCryptor_Create(v9, 1, a6->var4, a6->var2, (uint64_t)v10, (uint64_t *)v8 + 31))
  {
    if ((id)objc_opt_class() != v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)objc_msgSend(v8, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v33 = v29;
          v34 = 2080;
          v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
          v36 = 1024;
          v37 = 52;
          v38 = 2112;
          v39 = v13;
          v40 = 2048;
          v41 = v8;
          v21 = " [%s] %s:%d %@(%p) Failed to create downlink cryptor for dialog";
          goto LABEL_39;
        }
      }
      goto LABEL_41;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_41;
    v22 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315650;
    v33 = v22;
    v34 = 2080;
    v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
    v36 = 1024;
    v37 = 52;
    v21 = " [%s] %s:%d Failed to create downlink cryptor for dialog";
    goto LABEL_25;
  }
  *((_DWORD *)v8 + 64) = 0;
  if (v10)
    CFRelease(v10);
  return (VCControlChannelDialogV2 *)v8;
}

- (void)dealloc
{
  tagVCCryptor *downlinkCryptor;
  tagVCCryptor *uplinkCryptor;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  downlinkCryptor = self->_downlinkCryptor;
  if (downlinkCryptor)
    CFRelease(downlinkCryptor);
  uplinkCryptor = self->_uplinkCryptor;
  if (uplinkCryptor)
    CFRelease(uplinkCryptor);
  v5.receiver = self;
  v5.super_class = (Class)VCControlChannelDialogV2;
  -[VCControlChannelDialog dealloc](&v5, sel_dealloc);
}

- (id)allocEncryptedPayloadFromPayloadData:(id)a3
{
  const __CFAllocator *v5;
  void *v6;
  size_t v7;
  os_unfair_lock_s *p_uplinkCryptorLock;
  int v9;
  size_t DataLength;
  id v11;
  void *v12;
  char *dataPointerOut;
  CMBlockBufferRef theBuffer;
  CMBlockBufferRef blockBufferOut[2];

  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  theBuffer = 0;
  blockBufferOut[0] = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = (void *)objc_msgSend(a3, "bytes");
  v7 = objc_msgSend(a3, "length");
  if (CMBlockBufferCreateWithMemoryBlock(v5, v6, v7, (CFAllocatorRef)*MEMORY[0x1E0C9AE20], 0, 0, objc_msgSend(a3, "length"), 0, blockBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:].cold.4();
    }
  }
  else
  {
    p_uplinkCryptorLock = &self->_uplinkCryptorLock;
    os_unfair_lock_lock(&self->_uplinkCryptorLock);
    v9 = VCCryptor_Encrypt((uint64_t)self->_uplinkCryptor, blockBufferOut[0], (CFTypeRef *)&theBuffer);
    os_unfair_lock_unlock(p_uplinkCryptorLock);
    if (v9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:].cold.3();
      }
    }
    else
    {
      DataLength = CMBlockBufferGetDataLength(theBuffer);
      if (CMBlockBufferIsRangeContiguous(theBuffer, 0, DataLength))
      {
        dataPointerOut = 0;
        if (!CMBlockBufferGetDataPointer(theBuffer, 0, 0, 0, &dataPointerOut))
        {
          v11 = objc_alloc(MEMORY[0x1E0C99D50]);
          v12 = (void *)objc_msgSend(v11, "initWithBytes:length:", dataPointerOut, DataLength);
          goto LABEL_6;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:].cold.2();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:].cold.1();
      }
    }
  }
  v12 = 0;
LABEL_6:
  if (blockBufferOut[0])
    CFRelease(blockBufferOut[0]);
  if (theBuffer)
    CFRelease(theBuffer);
  return v12;
}

- (id)copyDecryptedDataFromEncryptedPayload:(id)a3
{
  const __CFAllocator *v5;
  void *v6;
  size_t v7;
  size_t DataLength;
  id v9;
  void *v10;
  char *dataPointerOut;
  CMBlockBufferRef theBuffer;
  CMBlockBufferRef blockBufferOut[2];

  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  theBuffer = 0;
  blockBufferOut[0] = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = (void *)objc_msgSend(a3, "bytes");
  v7 = objc_msgSend(a3, "length");
  if (CMBlockBufferCreateWithMemoryBlock(v5, v6, v7, (CFAllocatorRef)*MEMORY[0x1E0C9AE20], 0, 0, objc_msgSend(a3, "length"), 0, blockBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:].cold.4();
    }
  }
  else if (VCCryptor_Decrypt((uint64_t)self->_downlinkCryptor, blockBufferOut[0], &theBuffer))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:].cold.3();
    }
  }
  else
  {
    DataLength = CMBlockBufferGetDataLength(theBuffer);
    if (CMBlockBufferIsRangeContiguous(theBuffer, 0, DataLength))
    {
      dataPointerOut = 0;
      if (!CMBlockBufferGetDataPointer(theBuffer, 0, 0, 0, &dataPointerOut))
      {
        v9 = objc_alloc(MEMORY[0x1E0C99D50]);
        v10 = (void *)objc_msgSend(v9, "initWithBytes:length:", dataPointerOut, DataLength);
        goto LABEL_6;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:].cold.1();
    }
  }
  v10 = 0;
LABEL_6:
  if (blockBufferOut[0])
    CFRelease(blockBufferOut[0]);
  if (theBuffer)
    CFRelease(theBuffer);
  return v10;
}

- (id)newDataFromMessage:(id)a3 topic:(id)a4 transactionID:(unint64_t)a5 isReliable:(BOOL)a6 transactionDelegate:(id)a7
{
  VCCCMessage *v11;
  VCCCMessage *v12;
  VCCCMessageWrapper *v13;
  VCCCMessageWrapper *v14;
  id v15;
  id v16;
  void *v17;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_29;
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v33 = 136315650;
      v34 = v26;
      v35 = 2080;
      v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
      v37 = 1024;
      v38 = 131;
      v28 = " [%s] %s:%d topic must not be nil";
      v29 = v27;
      v30 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_29;
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v33 = 136316162;
      v34 = v31;
      v35 = 2080;
      v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
      v37 = 1024;
      v38 = 131;
      v39 = 2112;
      v40 = (id)v19;
      v41 = 2048;
      v42 = self;
      v28 = " [%s] %s:%d %@(%p) topic must not be nil";
      v29 = v32;
      v30 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v33, v30);
LABEL_29:
    v14 = 0;
    v12 = 0;
LABEL_30:
    v17 = 0;
    v15 = 0;
    goto LABEL_6;
  }
  v11 = objc_alloc_init(VCCCMessage);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v33 = 136316162;
        v34 = v20;
        v35 = 2080;
        v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
        v37 = 1024;
        v38 = 134;
        v39 = 2112;
        v40 = a4;
        v41 = 2112;
        v42 = a3;
        _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate outgoing message for '%@:%@'", (uint8_t *)&v33, 0x30u);
      }
    }
    goto LABEL_29;
  }
  v12 = v11;
  -[VCCCMessage setTransactionID:](v11, "setTransactionID:", a5);
  -[VCCCMessage setTopic:](v12, "setTopic:", a4);
  -[VCCCMessage setPayload:](v12, "setPayload:", objc_msgSend(a3, "VCCCData"));
  v13 = objc_alloc_init(VCCCMessageWrapper);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v33 = 136316162;
        v34 = v22;
        v35 = 2080;
        v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
        v37 = 1024;
        v38 = 141;
        v39 = 2112;
        v40 = a4;
        v41 = 2112;
        v42 = a3;
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate message wrapper for '%@:%@'", (uint8_t *)&v33, 0x30u);
      }
    }
    v14 = 0;
    goto LABEL_30;
  }
  v14 = v13;
  -[VCCCMessageWrapper setMessage:](v13, "setMessage:", v12);
  v15 = (id)-[VCCCMessageWrapper data](v14, "data");
  v16 = -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:](self, "allocEncryptedPayloadFromPayloadData:", v15);
  if (v16)
  {
    v17 = v16;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v33 = 136316162;
        v34 = v24;
        v35 = 2080;
        v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
        v37 = 1024;
        v38 = 147;
        v39 = 2112;
        v40 = a4;
        v41 = 2112;
        v42 = a3;
        _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not encrypt outgoing message '%@:%@'", (uint8_t *)&v33, 0x30u);
      }
    }
    v17 = 0;
  }
LABEL_6:

  return v17;
}

- (id)processMessageData:(id)a3 participantID:(id)a4 topic:(id *)a5 transactionID:(id *)a6 messageStatus:(unsigned int *)a7 isInternalMessage:(BOOL *)a8
{
  id v14;
  void *v15;
  VCCCMessageWrapper *v16;
  _BOOL4 v17;
  VCCCMessage *v18;
  void *v19;
  NSString *v20;
  NSString *v21;
  NSData *v22;
  NSData *v23;
  const void *v24;
  VCCCMessageAcknowledgment *v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  unsigned int v34;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  unsigned int v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  uint64_t v42;
  NSObject *v43;
  unsigned int v44;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  uint64_t v51;
  NSObject *v52;
  unsigned int sessionID;
  const __CFString *v54;
  const __CFString *v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  uint32_t v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  const char *v75;
  NSObject *v76;
  uint32_t v77;
  uint64_t v78;
  NSObject *v79;
  const __CFString *v80;
  BOOL *v81;
  id *v82;
  id *v84;
  unsigned int *v85;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  int v91;
  __int16 v92;
  _BYTE v93[24];
  __int16 v94;
  id v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  int v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "length"))
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_122;
      v56 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_122;
      *(_DWORD *)buf = 136315650;
      v87 = v56;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 163;
      v58 = " [%s] %s:%d messageData length must not be 0";
      goto LABEL_95;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v46 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v46 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_122;
    v66 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_122;
    *(_DWORD *)buf = 136316162;
    v87 = v66;
    v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v90 = 1024;
    v91 = 163;
    v92 = 2112;
    *(_QWORD *)v93 = v46;
    *(_WORD *)&v93[8] = 2048;
    *(_QWORD *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) messageData length must not be 0";
LABEL_120:
    v64 = v67;
    v65 = 48;
    goto LABEL_121;
  }
  if (!a5)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_122;
      v59 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_122;
      *(_DWORD *)buf = 136315650;
      v87 = v59;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 164;
      v58 = " [%s] %s:%d topic must not be nil";
      goto LABEL_95;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v47 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v47 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_122;
    v68 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_122;
    *(_DWORD *)buf = 136316162;
    v87 = v68;
    v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v90 = 1024;
    v91 = 164;
    v92 = 2112;
    *(_QWORD *)v93 = v47;
    *(_WORD *)&v93[8] = 2048;
    *(_QWORD *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) topic must not be nil";
    goto LABEL_120;
  }
  if (!a6)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_122;
      v60 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_122;
      *(_DWORD *)buf = 136315650;
      v87 = v60;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 165;
      v58 = " [%s] %s:%d transactionID must not be nil";
      goto LABEL_95;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v48 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v48 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_122;
    v69 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_122;
    *(_DWORD *)buf = 136316162;
    v87 = v69;
    v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v90 = 1024;
    v91 = 165;
    v92 = 2112;
    *(_QWORD *)v93 = v48;
    *(_WORD *)&v93[8] = 2048;
    *(_QWORD *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) transactionID must not be nil";
    goto LABEL_120;
  }
  if (!a7)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_122;
      v61 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_122;
      *(_DWORD *)buf = 136315650;
      v87 = v61;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 166;
      v58 = " [%s] %s:%d messageStatus must not be nil";
      goto LABEL_95;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v49 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v49 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_122;
    v70 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_122;
    *(_DWORD *)buf = 136316162;
    v87 = v70;
    v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v90 = 1024;
    v91 = 166;
    v92 = 2112;
    *(_QWORD *)v93 = v49;
    *(_WORD *)&v93[8] = 2048;
    *(_QWORD *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) messageStatus must not be nil";
    goto LABEL_120;
  }
  if (!a8)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_122;
      v62 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_122;
      *(_DWORD *)buf = 136315650;
      v87 = v62;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 167;
      v58 = " [%s] %s:%d isInternalMessage must not be nil";
      goto LABEL_95;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v50 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v50 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_122;
    v71 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_122;
    *(_DWORD *)buf = 136316162;
    v87 = v71;
    v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v90 = 1024;
    v91 = 167;
    v92 = 2112;
    *(_QWORD *)v93 = v50;
    *(_WORD *)&v93[8] = 2048;
    *(_QWORD *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) isInternalMessage must not be nil";
    goto LABEL_120;
  }
  v14 = -[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:](self, "copyDecryptedDataFromEncryptedPayload:", a3);
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        sessionID = self->super._sessionID;
        *(_DWORD *)buf = 136316418;
        v87 = v51;
        v88 = 2080;
        v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        v90 = 1024;
        v91 = 170;
        v92 = 1024;
        *(_DWORD *)v93 = sessionID;
        *(_WORD *)&v93[4] = 2112;
        *(_QWORD *)&v93[6] = a4;
        *(_WORD *)&v93[14] = 2112;
        *(_QWORD *)&v93[16] = 0;
        _os_log_error_impl(&dword_1D8A54000, v52, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not decrypt incoming payload for _sessionID='%d', participantID='%@', transactionID='%@'", buf, 0x36u);
      }
    }
    goto LABEL_122;
  }
  v15 = v14;
  v16 = -[VCCCMessageWrapper initWithData:]([VCCCMessageWrapper alloc], "initWithData:", v14);

  if (!v16)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v54 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v54 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_122;
      v72 = VRTraceErrorLogLevelToCSTR();
      v67 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_122;
      *(_DWORD *)buf = 136316162;
      v87 = v72;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 174;
      v92 = 2112;
      *(_QWORD *)v93 = v54;
      *(_WORD *)&v93[8] = 2048;
      *(_QWORD *)&v93[10] = self;
      v58 = " [%s] %s:%d %@(%p) messageData does have neither message nor acknowledgment. Ignoring malformed messageData";
      goto LABEL_120;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_122;
    v63 = VRTraceErrorLogLevelToCSTR();
    v57 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_122;
    *(_DWORD *)buf = 136315650;
    v87 = v63;
    v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    v90 = 1024;
    v91 = 174;
    v58 = " [%s] %s:%d messageData does have neither message nor acknowledgment. Ignoring malformed messageData";
LABEL_95:
    v64 = v57;
    v65 = 28;
LABEL_121:
    _os_log_impl(&dword_1D8A54000, v64, OS_LOG_TYPE_DEFAULT, v58, buf, v65);
LABEL_122:
    v16 = 0;
    goto LABEL_123;
  }
  if (!-[VCCCMessageWrapper hasMessage](v16, "hasMessage")
    && !-[VCCCMessageWrapper hasAcknowledgement](v16, "hasAcknowledgement"))
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_123;
      v73 = VRTraceErrorLogLevelToCSTR();
      v74 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_123;
      *(_DWORD *)buf = 136315650;
      v87 = v73;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 175;
      v75 = " [%s] %s:%d messageData does have neither message nor acknowledgment. Ignoring malformed messageData";
      v76 = v74;
      v77 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v55 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v55 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_123;
      v78 = VRTraceErrorLogLevelToCSTR();
      v79 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_123;
      *(_DWORD *)buf = 136316162;
      v87 = v78;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 175;
      v92 = 2112;
      *(_QWORD *)v93 = v55;
      *(_WORD *)&v93[8] = 2048;
      *(_QWORD *)&v93[10] = self;
      v75 = " [%s] %s:%d %@(%p) messageData does have neither message nor acknowledgment. Ignoring malformed messageData";
      v76 = v79;
      v77 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v76, OS_LOG_TYPE_DEFAULT, v75, buf, v77);
LABEL_123:
    v23 = 0;
    goto LABEL_52;
  }
  v17 = -[VCCCMessageWrapper hasMessage](v16, "hasMessage");
  v84 = a5;
  v85 = a7;
  if (v17)
  {
    v81 = a8;
    v18 = -[VCCCMessageWrapper message](v16, "message");
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCCCMessage transactionID](v18, "transactionID"));
    v20 = -[VCCCMessage topic](v18, "topic");
    if (-[NSString length](v20, "length"))
      v21 = v20;
    else
      v21 = 0;
    v22 = 0;
    if (-[VCCCMessage hasPayload](v18, "hasPayload"))
      v22 = -[VCCCMessage payload](v18, "payload");
    if (-[NSData length](v22, "length"))
      v23 = v22;
    else
      v23 = 0;
    v24 = (const void *)MEMORY[0x1DF086F1C](&self->super._weakTransactionDelegate);
    -[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:](self, "sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:", a4, v19, self->super._sessionID, v24);
    v82 = a6;
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_34;
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      v28 = self->super._sessionID;
      *(_DWORD *)buf = 136316418;
      v87 = v26;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 189;
      v92 = 1024;
      *(_DWORD *)v93 = v28;
      *(_WORD *)&v93[4] = 2112;
      *(_QWORD *)&v93[6] = a4;
      *(_WORD *)&v93[14] = 2112;
      *(_QWORD *)&v93[16] = v19;
      v29 = " [%s] %s:%d Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
      v30 = v27;
      v31 = 54;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v80 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v80 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6
        || (v32 = VRTraceErrorLogLevelToCSTR(),
            v33 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_34:
        if (v24)
        {
          CFRelease(v24);
          LODWORD(v24) = 0;
        }
        a8 = v81;
        goto LABEL_50;
      }
      v34 = self->super._sessionID;
      *(_DWORD *)buf = 136316930;
      v87 = v32;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 189;
      v92 = 2112;
      *(_QWORD *)v93 = v80;
      *(_WORD *)&v93[8] = 2048;
      *(_QWORD *)&v93[10] = self;
      *(_WORD *)&v93[18] = 1024;
      *(_DWORD *)&v93[20] = v34;
      v94 = 2112;
      v95 = a4;
      v96 = 2112;
      v97 = v19;
      v29 = " [%s] %s:%d %@(%p) Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
      v30 = v33;
      v31 = 74;
    }
    _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    goto LABEL_34;
  }
  if (-[VCCCMessageWrapper hasAcknowledgement](v16, "hasAcknowledgement"))
  {
    v82 = a6;
    v25 = -[VCCCMessageWrapper acknowledgement](v16, "acknowledgement");
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCCCMessageAcknowledgment transactionID](v25, "transactionID"));
    if (-[VCCCMessageAcknowledgment hasStatus](v25, "hasStatus"))
      LODWORD(v24) = -[VCCCMessageAcknowledgment status](v25, "status");
    else
      LODWORD(v24) = 0;
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_49;
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      v38 = self->super._sessionID;
      *(_DWORD *)buf = 136316674;
      v87 = v36;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 196;
      v92 = 1024;
      *(_DWORD *)v93 = v38;
      *(_WORD *)&v93[4] = 2112;
      *(_QWORD *)&v93[6] = a4;
      *(_WORD *)&v93[14] = 2112;
      *(_QWORD *)&v93[16] = v19;
      v94 = 1024;
      LODWORD(v95) = (_DWORD)v24;
      v39 = " [%s] %s:%d Reliable message has been ACKed for _sessionID='%d', participantID='%@', transactionID='%@', messageStatus='%d'";
      v40 = v37;
      v41 = 60;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v35 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v35 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_49;
      v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      v44 = self->super._sessionID;
      *(_DWORD *)buf = 136317186;
      v87 = v42;
      v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      v90 = 1024;
      v91 = 196;
      v92 = 2112;
      *(_QWORD *)v93 = v35;
      *(_WORD *)&v93[8] = 2048;
      *(_QWORD *)&v93[10] = self;
      *(_WORD *)&v93[18] = 1024;
      *(_DWORD *)&v93[20] = v44;
      v94 = 2112;
      v95 = a4;
      v96 = 2112;
      v97 = v19;
      v98 = 1024;
      v99 = (int)v24;
      v39 = " [%s] %s:%d %@(%p) Reliable message has been ACKed for _sessionID='%d', participantID='%@', transactionID='%"
            "@', messageStatus='%d'";
      v40 = v43;
      v41 = 80;
    }
    _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
LABEL_49:
    -[VCControlChannelDialog confirmTransaction:](self, "confirmTransaction:", v19);
    v21 = 0;
    v23 = 0;
LABEL_50:
    a6 = v82;
    goto LABEL_51;
  }
  LODWORD(v24) = 0;
  v19 = 0;
  v21 = 0;
  v23 = 0;
LABEL_51:
  *v84 = v21;
  *v85 = v24;
  *a6 = v19;
  *a8 = !v17;
LABEL_52:

  return v23;
}

- (void)sendConfirmationToParticipantID:(id)a3 transactionID:(id)a4 sessionID:(unsigned int)a5 transactionDelegate:(id)a6
{
  uint64_t v7;
  VCCCMessageAcknowledgment *v11;
  VCCCMessageWrapper *v12;
  VCCCMessageWrapper *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _BYTE v43[24];
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v7 = *(_QWORD *)&a5;
  v48 = *MEMORY[0x1E0C80C00];
  v11 = objc_alloc_init(VCCCMessageAcknowledgment);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_22;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136316162;
    v37 = v26;
    v38 = 2080;
    v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
    v40 = 1024;
    v41 = 216;
    v42 = 1024;
    *(_DWORD *)v43 = v7;
    *(_WORD *)&v43[4] = 2112;
    *(_QWORD *)&v43[6] = a4;
    v28 = " [%s] %s:%d Failed to allocate outgoing acknowledgment message for sessionID='%d', transactionID='%@'";
    goto LABEL_39;
  }
  -[VCCCMessageAcknowledgment setTransactionID:](v11, "setTransactionID:", objc_msgSend(a4, "unsignedLongValue"));
  v12 = objc_alloc_init(VCCCMessageWrapper);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_22;
    v29 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136316162;
    v37 = v29;
    v38 = 2080;
    v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
    v40 = 1024;
    v41 = 220;
    v42 = 1024;
    *(_DWORD *)v43 = v7;
    *(_WORD *)&v43[4] = 2112;
    *(_QWORD *)&v43[6] = a4;
    v28 = " [%s] %s:%d Failed to allocate message wrapper for sessionID='%d', transactionID='%@'";
LABEL_39:
    _os_log_error_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x2Cu);
LABEL_22:
    v13 = 0;
LABEL_23:
    v17 = 0;
    v15 = 0;
    goto LABEL_16;
  }
  v13 = v12;
  -[VCCCMessageWrapper setAcknowledgement:](v12, "setAcknowledgement:", v11);
  v14 = (id)-[VCCCMessageWrapper data](v13, "data");
  if (!v14)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v33 = VRTraceErrorLogLevelToCSTR();
        v34 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v37 = v33;
          v38 = 2080;
          v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
          v40 = 1024;
          v41 = 225;
          v42 = 2112;
          *(_QWORD *)v43 = v30;
          *(_WORD *)&v43[8] = 2048;
          *(_QWORD *)&v43[10] = self;
          _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Can not send confirmation: messageData is nil", buf, 0x30u);
        }
      }
    }
    goto LABEL_23;
  }
  v15 = v14;
  v16 = -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:](self, "allocEncryptedPayloadFromPayloadData:", v14);
  if (v16)
  {
    v17 = v16;
    +[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:](VCControlChannelTransaction, "sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:", v16, v7, a3, 0, a6, 0);
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v37 = v19;
          v38 = 2080;
          v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
          v40 = 1024;
          v41 = 237;
          v42 = 1024;
          *(_DWORD *)v43 = v7;
          *(_WORD *)&v43[4] = 2112;
          *(_QWORD *)&v43[6] = a3;
          *(_WORD *)&v43[14] = 2112;
          *(_QWORD *)&v43[16] = a4;
          v21 = " [%s] %s:%d Dialog send confirmation for sessionID='%d', participantID='%@', transactionID='%@'";
          v22 = v20;
          v23 = 54;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[VCControlChannelDialogV2 performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v35 = a4;
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316930;
          v37 = v24;
          v38 = 2080;
          v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
          v40 = 1024;
          v41 = 237;
          v42 = 2112;
          *(_QWORD *)v43 = v18;
          *(_WORD *)&v43[8] = 2048;
          *(_QWORD *)&v43[10] = self;
          *(_WORD *)&v43[18] = 1024;
          *(_DWORD *)&v43[20] = v7;
          v44 = 2112;
          v45 = a3;
          v46 = 2112;
          v47 = v35;
          v21 = " [%s] %s:%d %@(%p) Dialog send confirmation for sessionID='%d', participantID='%@', transactionID='%@'";
          v22 = v25;
          v23 = 74;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v37 = v31;
        v38 = 2080;
        v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
        v40 = 1024;
        v41 = 228;
        v42 = 1024;
        *(_DWORD *)v43 = v7;
        *(_WORD *)&v43[4] = 2112;
        *(_QWORD *)&v43[6] = a3;
        *(_WORD *)&v43[14] = 2112;
        *(_QWORD *)&v43[16] = a4;
        _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not encrypt confirmation for sessionID='%d', participantID='%@', transactionID='%@'", buf, 0x36u);
      }
    }
    v17 = 0;
  }
LABEL_16:

}

- (void)allocEncryptedPayloadFromPayloadData:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCCryptor_Encrypt produced non-contiguous buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)allocEncryptedPayloadFromPayloadData:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMBlockBufferGetDataPointer failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)allocEncryptedPayloadFromPayloadData:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCCryptor_Encrypt failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)allocEncryptedPayloadFromPayloadData:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMBlockBufferCreateWithMemoryBlock failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)copyDecryptedDataFromEncryptedPayload:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCCryptor_Decrypt produced non-contiguous buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)copyDecryptedDataFromEncryptedPayload:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMBlockBufferGetDataPointer failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)copyDecryptedDataFromEncryptedPayload:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCCryptor_Decrypt failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)copyDecryptedDataFromEncryptedPayload:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMBlockBufferCreateWithMemoryBlock failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:.cold.1()
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

@end
