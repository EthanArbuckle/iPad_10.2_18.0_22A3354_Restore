@implementation VCSessionMessageTopic

- (VCSessionMessageTopic)initWithTopicKey:(id)a3 strings:(id)a4 allowConcurrent:(BOOL)a5 controlChannel:(id)a6 sendCompletionHandler:(id)a7 receiveHandler:(id)a8
{
  return -[VCSessionMessageTopic initWithTopicKey:strings:allowConcurrent:requireReliable:controlChannel:sendCompletionHandler:receiveHandler:sendMessageDataCompletionHandler:receiveMessageDictionaryHandler:](self, "initWithTopicKey:strings:allowConcurrent:requireReliable:controlChannel:sendCompletionHandler:receiveHandler:sendMessageDataCompletionHandler:receiveMessageDictionaryHandler:", a3, a4, a5, 1, a6, a7, a8, 0, 0);
}

- (VCSessionMessageTopic)initWithTopicKey:(id)a3 strings:(id)a4 allowConcurrent:(BOOL)a5 requireReliable:(BOOL)a6 controlChannel:(id)a7 sendMessageDataCompletionHandler:(id)a8 receiveMessageDictionaryHandler:(id)a9
{
  return -[VCSessionMessageTopic initWithTopicKey:strings:allowConcurrent:requireReliable:controlChannel:sendCompletionHandler:receiveHandler:sendMessageDataCompletionHandler:receiveMessageDictionaryHandler:](self, "initWithTopicKey:strings:allowConcurrent:requireReliable:controlChannel:sendCompletionHandler:receiveHandler:sendMessageDataCompletionHandler:receiveMessageDictionaryHandler:", a3, a4, a5, a6, a7, 0, 0, a8, a9);
}

- (VCSessionMessageTopic)initWithTopicKey:(id)a3 strings:(id)a4 allowConcurrent:(BOOL)a5 requireReliable:(BOOL)a6 controlChannel:(id)a7 sendCompletionHandler:(id)a8 receiveHandler:(id)aBlock sendMessageDataCompletionHandler:(id)a10 receiveMessageDictionaryHandler:(id)a11
{
  VCSessionMessageTopic *v17;
  NSObject *CustomRootQueue;
  NSObject *v19;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)VCSessionMessageTopic;
  v17 = -[VCSessionMessageTopic init](&v21, sel_init);
  v17->topicKey = (NSString *)objc_msgSend(a3, "copy");
  v17->controlChannel = (VCControlChannel *)a7;
  if (a4)
  {
    v17->associatedStrings = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", a4);
    v17->shouldEncodeTopicKeyInMessage = 0;
    -[VCControlChannel addOptionalTopic:](v17->controlChannel, "addOptionalTopic:", v17->topicKey);
  }
  else
  {
    v17->associatedStrings = 0;
    v17->shouldEncodeTopicKeyInMessage = 1;
  }
  v17->allowConcurrent = a5;
  v17->requireReliable = a6;
  if (a8)
    v17->sendMessageCompletionBlock = _Block_copy(a8);
  if (aBlock)
    v17->receiveMessageBlock = _Block_copy(aBlock);
  if (a10)
    v17->sendMessageDataCompletionBlock = _Block_copy(a10);
  if (a11)
    v17->receiveMessageDictionaryBlock = _Block_copy(a11);
  v17->transactionCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17->_sendMessageBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17->latestOutgoingMessageIndex = 0;
  v17->isSendingEnabled = 1;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  if (v17->allowConcurrent)
    v19 = MEMORY[0x1E0C80D50];
  else
    v19 = 0;
  v17->_outMessageQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionMessageTopic.outMessageQueue", v19, CustomRootQueue);
  return v17;
}

- (int)expectedMessageType
{
  return self->receiveMessageDictionaryBlock != 0;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id sendMessageCompletionBlock;
  id sendMessageDataCompletionBlock;
  id receiveMessageBlock;
  id receiveMessageDictionaryBlock;
  NSObject *outMessageQueue;
  NSObject *inMessageQueue;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSString UTF8String](self->topicKey, "UTF8String");
      *(_DWORD *)buf = 136315906;
      v14 = v3;
      v15 = 2080;
      v16 = "-[VCSessionMessageTopic dealloc]";
      v17 = 1024;
      v18 = 126;
      v19 = 2080;
      v20 = v5;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessageTopic with topic %s dealloc", buf, 0x26u);
    }
  }

  sendMessageCompletionBlock = self->sendMessageCompletionBlock;
  if (sendMessageCompletionBlock)
    _Block_release(sendMessageCompletionBlock);
  sendMessageDataCompletionBlock = self->sendMessageDataCompletionBlock;
  if (sendMessageDataCompletionBlock)
    _Block_release(sendMessageDataCompletionBlock);
  receiveMessageBlock = self->receiveMessageBlock;
  if (receiveMessageBlock)
    _Block_release(receiveMessageBlock);
  receiveMessageDictionaryBlock = self->receiveMessageDictionaryBlock;
  if (receiveMessageDictionaryBlock)
    _Block_release(receiveMessageDictionaryBlock);
  outMessageQueue = self->_outMessageQueue;
  if (outMessageQueue)
    dispatch_release(outMessageQueue);
  inMessageQueue = self->inMessageQueue;
  if (inMessageQueue)
    dispatch_release(inMessageQueue);

  v12.receiver = self;
  v12.super_class = (Class)VCSessionMessageTopic;
  -[VCSessionMessageTopic dealloc](&v12, sel_dealloc);
}

- (BOOL)isPayloadAssociated:(id)a3
{
  _BOOL4 shouldEncodeTopicKeyInMessage;
  BOOL v6;
  char v7;

  objc_sync_enter(self);
  shouldEncodeTopicKeyInMessage = self->shouldEncodeTopicKeyInMessage;
  if (self->shouldEncodeTopicKeyInMessage)
  {
    LOBYTE(a3) = objc_msgSend(a3, "hasPrefix:", self->topicKey);
    v6 = 0;
  }
  else
  {
    v6 = -[NSArray containsObject:](self->associatedStrings, "containsObject:", a3);
  }
  objc_sync_exit(self);
  if (shouldEncodeTopicKeyInMessage)
    v7 = (char)a3;
  else
    v7 = v6;
  return v7 & 1;
}

- (void)setIsSendingEnabled:(BOOL)a3
{
  objc_sync_enter(self);
  self->isSendingEnabled = a3;
  objc_sync_exit(self);
}

- (void)sendMessage:(id)a3
{
  -[VCSessionMessageTopic sendMessage:participantID:](self, "sendMessage:participantID:", a3, 0);
}

- (id)messageForCommand:(id)a3
{
  if (self->shouldEncodeTopicKeyInMessage)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->topicKey, a3);
  else
    return a3;
}

- (void)sendMessage:(id)a3 participantID:(unint64_t)a4
{
  int64_t latestOutgoingMessageIndex;

  objc_sync_enter(self);
  latestOutgoingMessageIndex = self->latestOutgoingMessageIndex;
  self->latestOutgoingMessageIndex = latestOutgoingMessageIndex + 1;
  objc_sync_exit(self);
  -[VCSessionMessageTopic sendMessage:participantID:withSequence:numRetries:](self, "sendMessage:participantID:withSequence:numRetries:", a3, a4, (int)latestOutgoingMessageIndex, 0);
}

- (void)handleSendMessageDidSucceed:(BOOL)a3 message:(id)a4 participantID:(id)a5
{
  void (**sendMessageCompletionBlock)(id, id, BOOL, id);

  sendMessageCompletionBlock = (void (**)(id, id, BOOL, id))self->sendMessageCompletionBlock;
  if (sendMessageCompletionBlock
    || (sendMessageCompletionBlock = (void (**)(id, id, BOOL, id))self->sendMessageDataCompletionBlock) != 0)
  {
    sendMessageCompletionBlock[2](sendMessageCompletionBlock, a4, a3, a5);
  }
}

- (BOOL)sendReliableMessage:(id)a3 participantID:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6
{
  uint64_t v11;
  NSObject *v12;
  VCControlChannel *controlChannel;
  NSString *v14;
  uint64_t v15;
  _QWORD v17[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = v11;
      v20 = 2080;
      v21 = "-[VCSessionMessageTopic sendReliableMessage:participantID:withOptions:completion:]";
      v22 = 1024;
      v23 = 207;
      v24 = 2112;
      v25 = -[VCSessionMessageTopic topicKey](self, "topicKey");
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendReliableMessage topic=%@", buf, 0x26u);
    }
  }
  controlChannel = self->controlChannel;
  v14 = -[VCSessionMessageTopic topicKey](self, "topicKey");
  v15 = -[VCControlChannel reliableMessageResendInterval](self->controlChannel, "reliableMessageResendInterval");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__VCSessionMessageTopic_sendReliableMessage_participantID_withOptions_completion___block_invoke;
  v17[3] = &unk_1E9E58348;
  v17[4] = a6;
  return -[VCControlChannel sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:](controlChannel, "sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:", a3, v14, a4, v15, a5, v17);
}

uint64_t __82__VCSessionMessageTopic_sendReliableMessage_participantID_withOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendMessage:(id)a3 participantID:(unint64_t)a4 withSequence:(int64_t)a5 numRetries:(int64_t)a6
{
  uint64_t v11;
  NSObject *v12;
  NSString *topicKey;
  _BOOL4 requireReliable;
  _BOOL4 allowConcurrent;
  int64_t latestOutgoingMessageIndex;
  NSObject *outMessageQueue;
  _QWORD block[9];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->isSendingEnabled)
  {
    if (a6 < 8)
    {
      objc_sync_enter(self);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          topicKey = self->topicKey;
          requireReliable = self->requireReliable;
          allowConcurrent = self->allowConcurrent;
          latestOutgoingMessageIndex = self->latestOutgoingMessageIndex;
          *(_DWORD *)buf = 136317186;
          v20 = v11;
          v21 = 2080;
          v22 = "-[VCSessionMessageTopic sendMessage:participantID:withSequence:numRetries:]";
          v23 = 1024;
          v24 = 227;
          v25 = 2112;
          v26 = topicKey;
          v27 = 1024;
          v28 = requireReliable;
          v29 = 1024;
          v30 = allowConcurrent;
          v31 = 1024;
          v32 = a5;
          v33 = 1024;
          v34 = latestOutgoingMessageIndex;
          v35 = 1024;
          v36 = a6;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendMessage topic=%@ reliable=%d, concurent=%d, outgoingIndex=%d, lastOutgoingIndex=%d, retries=%d", buf, 0x44u);
        }
      }
      if (self->requireReliable)
      {
        if (!a6 || self->latestOutgoingMessageIndex - 1 <= a5)
        {
          outMessageQueue = self->_outMessageQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __75__VCSessionMessageTopic_sendMessage_participantID_withSequence_numRetries___block_invoke;
          block[3] = &unk_1E9E58410;
          block[4] = self;
          block[5] = a3;
          block[6] = a4;
          block[7] = a5;
          block[8] = a6;
          dispatch_async(outMessageQueue, block);
        }
      }
      else
      {
        -[VCControlChannel sendUnreliableMessage:withTopic:participantID:](self->controlChannel, "sendUnreliableMessage:withTopic:participantID:", a3, self->topicKey, a4);
      }
      objc_sync_exit(self);
    }
    else
    {
      -[VCSessionMessageTopic handleSendMessageDidSucceed:message:participantID:](self, "handleSendMessageDidSucceed:message:participantID:", 0, a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4, a4, a5));
    }
  }
}

uint64_t __75__VCSessionMessageTopic_sendMessage_participantID_withSequence_numRetries___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSendMessage:participantID:withSequence:numRetries:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)dispatchedSendMessage:(id)a3 participantID:(unint64_t)a4 withSequence:(int64_t)a5 numRetries:(int64_t)a6
{
  _BOOL4 v11;
  const __CFString *v12;
  const __CFString *v13;
  _BOOL4 v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  char v31;
  uint64_t v32;
  NSObject *v33;
  NSString *v34;
  const char *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  NSString *topicKey;
  dispatch_time_t v43;
  NSObject *outMessageQueue;
  _QWORD block[9];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  unint64_t v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  int64_t v63;
  __int16 v64;
  int64_t v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!self->isSendingEnabled)
    return;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = -[VCControlChannel sendReliableMessageAndWait:withTopic:](self->controlChannel, "sendReliableMessageAndWait:withTopic:", -[VCSessionMessageTopic messageForCommand:](self, "messageForCommand:", a3), self->topicKey);
    if ((VCSessionMessageTopic *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_37;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      v18 = "FAILURE";
      v47 = v16;
      *(_DWORD *)buf = 136315906;
      v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
      v48 = 2080;
      if (v11)
        v18 = "SUCCESS";
      v50 = 1024;
      v51 = 268;
      v52 = 2080;
      v53 = (void *)v18;
      v19 = " [%s] %s:%d sendReliableMessageAndWait result=%s";
      v20 = v17;
      v21 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCSessionMessageTopic performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_37;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      v24 = "FAILURE";
      v47 = v22;
      *(_DWORD *)buf = 136316418;
      v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
      v48 = 2080;
      if (v11)
        v24 = "SUCCESS";
      v50 = 1024;
      v51 = 268;
      v52 = 2112;
      v53 = (void *)v13;
      v54 = 2048;
      v55 = (unint64_t)self;
      v56 = 2080;
      v57 = (unint64_t)v24;
      v19 = " [%s] %s:%d %@(%p) sendReliableMessageAndWait result=%s";
      v20 = v23;
      v21 = 58;
    }
    goto LABEL_35;
  }
  if (self->allowConcurrent)
  {
    v11 = -[VCControlChannel sendReliableMessageAndWait:withTopic:participantID:](self->controlChannel, "sendReliableMessageAndWait:withTopic:participantID:", a3, self->topicKey, a4);
    if ((VCSessionMessageTopic *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCSessionMessageTopic performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v30 = "FAILURE";
          *(_DWORD *)buf = 136317442;
          v47 = v28;
          v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
          v48 = 2080;
          if (v11)
            v30 = "SUCCESS";
          v50 = 1024;
          v51 = 257;
          v52 = 2112;
          v53 = (void *)v12;
          v54 = 2048;
          v55 = (unint64_t)self;
          v56 = 2080;
          v57 = (unint64_t)v30;
          v58 = 2048;
          v59 = a4;
          v60 = 2048;
          v61 = a5;
          v62 = 2048;
          v63 = a6;
          v64 = 2112;
          v65 = (int64_t)a3;
          v19 = " [%s] %s:%d %@(%p) sendReliableMessageAndWait result=%s, participantID=%llu, index=%ld, retry=%ld, payload=%@";
          v20 = v29;
          v21 = 98;
          goto LABEL_35;
        }
      }
LABEL_37:
      v31 = 0;
      if (v11)
        goto LABEL_38;
      goto LABEL_54;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_37;
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v27 = "FAILURE";
    *(_DWORD *)buf = 136316930;
    v47 = v25;
    v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
    v48 = 2080;
    if (v11)
      v27 = "SUCCESS";
    v50 = 1024;
    v51 = 257;
    v52 = 2080;
    v53 = (void *)v27;
    v54 = 2048;
    v55 = a4;
    v56 = 2048;
    v57 = a5;
    v58 = 2048;
    v59 = a6;
    v60 = 2112;
    v61 = (unint64_t)a3;
    v19 = " [%s] %s:%d sendReliableMessageAndWait result=%s, participantID=%llu, index=%ld, retry=%ld, payload=%@";
    v20 = v26;
    v21 = 78;
LABEL_35:
    _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    if (!v11)
      goto LABEL_54;
LABEL_39:
    -[VCSessionMessageTopic handleSendMessageDidSucceed:message:participantID:](self, "handleSendMessageDidSucceed:message:participantID:", 1, a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4));
    return;
  }
  v14 = -[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:](self, "attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:", a3, a4, a5, a6);
  if ((VCSessionMessageTopic *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCSessionMessageTopic performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v41 = "FAILURE";
        topicKey = self->topicKey;
        *(_DWORD *)buf = 136317698;
        if (v14)
          v41 = "SUCCESS";
        v47 = v39;
        v48 = 2080;
        v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
        v50 = 1024;
        v51 = 263;
        v52 = 2112;
        v53 = (void *)v15;
        v54 = 2048;
        v55 = (unint64_t)self;
        v56 = 2080;
        v57 = (unint64_t)v41;
        v58 = 2112;
        v59 = (unint64_t)topicKey;
        v60 = 2048;
        v61 = a4;
        v62 = 2048;
        v63 = a5;
        v64 = 2048;
        v65 = a6;
        v66 = 2112;
        v67 = a3;
        v36 = " [%s] %s:%d %@(%p) attemptToSendOrBufferReliableMessage result=%s, topic=%@ participantID=%llu, index=%ld,"
              " retry=%ld, payload=%@";
        v37 = v40;
        v38 = 108;
        goto LABEL_51;
      }
    }
LABEL_53:
    v31 = 1;
    if (v14)
    {
LABEL_38:
      if ((v31 & 1) != 0)
        return;
      goto LABEL_39;
    }
LABEL_54:
    v43 = dispatch_time(0, 2000000000);
    outMessageQueue = self->_outMessageQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__VCSessionMessageTopic_dispatchedSendMessage_participantID_withSequence_numRetries___block_invoke;
    block[3] = &unk_1E9E58410;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    block[8] = a6;
    dispatch_after(v43, outMessageQueue, block);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    goto LABEL_53;
  v32 = VRTraceErrorLogLevelToCSTR();
  v33 = *MEMORY[0x1E0CF2758];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    goto LABEL_53;
  v34 = self->topicKey;
  v35 = "FAILURE";
  *(_DWORD *)buf = 136317186;
  if (v14)
    v35 = "SUCCESS";
  v47 = v32;
  v48 = 2080;
  v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
  v50 = 1024;
  v51 = 263;
  v52 = 2080;
  v53 = (void *)v35;
  v54 = 2112;
  v55 = (unint64_t)v34;
  v56 = 2048;
  v57 = a4;
  v58 = 2048;
  v59 = a5;
  v60 = 2048;
  v61 = a6;
  v62 = 2112;
  v63 = (int64_t)a3;
  v36 = " [%s] %s:%d attemptToSendOrBufferReliableMessage result=%s, topic=%@ participantID=%llu, index=%ld, retry=%ld, payload=%@";
  v37 = v33;
  v38 = 88;
LABEL_51:
  _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
  if (!v14)
    goto LABEL_54;
}

uint64_t __85__VCSessionMessageTopic_dispatchedSendMessage_participantID_withSequence_numRetries___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendMessage:participantID:withSequence:numRetries:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64) + 1);
}

- (BOOL)attemptToSendOrBufferReliableMessage:(id)a3 participantID:(unint64_t)a4 sequenceNumber:(int64_t)a5 retryNumber:(int64_t)a6
{
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  VCSessionMessageBufferElement *v15;
  _BOOL4 v16;
  const __CFString *v17;
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
  int v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  VCSessionMessageTopic *v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_outMessageQueue);
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_sendMessageBuffers, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4)))
  {
    v11 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sendMessageBuffers, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4));
  }
  v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sendMessageBuffers, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4));
  if (!v12)
  {
    if ((VCSessionMessageTopic *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCSessionMessageTopic performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_29;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v16)
        return v16;
      v29 = 136316418;
      v30 = v19;
      v31 = 2080;
      v32 = "-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]";
      v33 = 1024;
      v34 = 297;
      v35 = 2112;
      v36 = v17;
      v37 = 2048;
      v38 = self;
      v39 = 2048;
      v40 = a4;
      v21 = " [%s] %s:%d %@(%p) Cannot create sendMessageBuffer for participantID=%llu";
      v22 = v20;
      v23 = 58;
LABEL_28:
      _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v29, v23);
      goto LABEL_29;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v16)
        return v16;
      -[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:].cold.1();
    }
LABEL_29:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (!a3)
  {
    if ((VCSessionMessageTopic *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[VCSessionMessageTopic performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_29;
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v16)
        return v16;
      v29 = 136316162;
      v30 = v26;
      v31 = 2080;
      v32 = "-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]";
      v33 = 1024;
      v34 = 299;
      v35 = 2112;
      v36 = v18;
      v37 = 2048;
      v38 = self;
      v21 = " [%s] %s:%d %@(%p) Cannot send or buffer with a nil message";
      v22 = v27;
      v23 = 48;
      goto LABEL_28;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v16)
        return v16;
      -[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:].cold.2(v24, v25);
    }
    goto LABEL_29;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, "count");
  v15 = -[VCSessionMessageBufferElement initWithMessage:sequenceNumber:retryNumber:]([VCSessionMessageBufferElement alloc], "initWithMessage:sequenceNumber:retryNumber:", a3, a5, a6);
  objc_msgSend(v13, "addObject:", v15);

  if (!v14)
    -[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:](self, "sendBufferedReliableMessagesForParticipantID:", a4);
  LOBYTE(v16) = 1;
  return v16;
}

- (void)sendBufferedReliableMessagesForParticipantID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  VCControlChannel *controlChannel;
  NSString *topicKey;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[9];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCSessionMessageTopic *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_outMessageQueue);
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sendMessageBuffers, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3));
  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "firstObject");
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "message");
      v9 = objc_msgSend(v7, "sequenceNumber");
      v10 = objc_msgSend(v7, "retryNumber");
      controlChannel = self->controlChannel;
      topicKey = self->topicKey;
      v13 = -[VCControlChannel reliableMessageResendInterval](controlChannel, "reliableMessageResendInterval");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __70__VCSessionMessageTopic_sendBufferedReliableMessagesForParticipantID___block_invoke;
      v17[3] = &unk_1E9E58460;
      v17[4] = self;
      v17[5] = v8;
      v17[6] = a3;
      v17[7] = v9;
      v17[8] = v10;
      -[VCControlChannel sendReliableMessage:withTopic:participantID:timeout:completion:](controlChannel, "sendReliableMessage:withTopic:participantID:timeout:completion:", v8, topicKey, a3, v13, v17);
    }
  }
  else if ((VCSessionMessageTopic *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCSessionMessageTopic performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:]";
        v22 = 1024;
        v23 = 319;
        v24 = 2112;
        v25 = v14;
        v26 = 2048;
        v27 = self;
        v28 = 2048;
        v29 = a3;
        _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Cannot retrieve sendMessageBuffer for participantID=%llu", buf, 0x3Au);
      }
    }
  }
}

__n128 __70__VCSessionMessageTopic_sendBufferedReliableMessagesForParticipantID___block_invoke(uint64_t a1, char a2)
{
  __int128 v2;
  __int128 v3;
  NSObject *v4;
  __n128 result;
  _QWORD block[4];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VCSessionMessageTopic_sendBufferedReliableMessagesForParticipantID___block_invoke_2;
  block[3] = &unk_1E9E58438;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 48);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v10 = a2;
  v7 = v2;
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 64);
  dispatch_async(v4, block);
  return result;
}

uint64_t __70__VCSessionMessageTopic_sendBufferedReliableMessagesForParticipantID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedCompletionHandlerForSendMessage:withTopic:participantID:result:sequenceNumber:retryNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)dispatchedCompletionHandlerForSendMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 result:(BOOL)a6 sequenceNumber:(int64_t)a7 retryNumber:(int64_t)a8
{
  _BOOL4 v10;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  dispatch_time_t v25;
  NSObject *outMessageQueue;
  void *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD block[9];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  int64_t v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  int64_t v59;
  __int16 v60;
  int64_t v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v10 = a6;
  v64 = *MEMORY[0x1E0C80C00];
  if ((VCSessionMessageTopic *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_16;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v18 = "FAILURE";
    v43 = v16;
    *(_DWORD *)buf = 136317186;
    v45 = "-[VCSessionMessageTopic dispatchedCompletionHandlerForSendMessage:withTopic:participantID:result:sequenceNumber:retryNumber:]";
    v44 = 2080;
    if (v10)
      v18 = "SUCCESS";
    v46 = 1024;
    v47 = 345;
    v48 = 2080;
    v49 = (unint64_t)v18;
    v50 = 2112;
    v51 = (uint64_t)a4;
    v52 = 2048;
    v53 = a5;
    v54 = 2048;
    v55 = a7;
    v56 = 2048;
    v57 = a8;
    v58 = 2112;
    v59 = (int64_t)a3;
    v19 = " [%s] %s:%d sendReliableMessage result=%s topic=%@ participantID=%llu, index=%ld, retry=%ld, payload=%@";
    v20 = v17;
    v21 = 88;
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = (const __CFString *)-[VCSessionMessageTopic performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v15 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v24 = "FAILURE";
      *(_DWORD *)buf = 136317698;
      v43 = v22;
      v45 = "-[VCSessionMessageTopic dispatchedCompletionHandlerForSendMessage:withTopic:participantID:result:sequenceNum"
            "ber:retryNumber:]";
      v44 = 2080;
      if (v10)
        v24 = "SUCCESS";
      v46 = 1024;
      v47 = 345;
      v48 = 2112;
      v49 = (unint64_t)v15;
      v50 = 2048;
      v51 = (uint64_t)self;
      v52 = 2080;
      v53 = (unint64_t)v24;
      v54 = 2112;
      v55 = (int64_t)a4;
      v56 = 2048;
      v57 = a5;
      v58 = 2048;
      v59 = a7;
      v60 = 2048;
      v61 = a8;
      v62 = 2112;
      v63 = a3;
      v19 = " [%s] %s:%d %@(%p) sendReliableMessage result=%s topic=%@ participantID=%llu, index=%ld, retry=%ld, payload=%@";
      v20 = v23;
      v21 = 108;
LABEL_15:
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    }
  }
LABEL_16:
  if (v10)
  {
    -[VCSessionMessageTopic handleSendMessageDidSucceed:message:participantID:](self, "handleSendMessageDidSucceed:message:participantID:", 1, a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5));
  }
  else
  {
    v25 = dispatch_time(0, 2000000000);
    outMessageQueue = self->_outMessageQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __125__VCSessionMessageTopic_dispatchedCompletionHandlerForSendMessage_withTopic_participantID_result_sequenceNumber_retryNumber___block_invoke;
    block[3] = &unk_1E9E58410;
    block[4] = self;
    block[5] = a3;
    block[6] = a5;
    block[7] = a7;
    block[8] = a8;
    dispatch_after(v25, outMessageQueue, block);
  }
  v27 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sendMessageBuffers, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5));
  if (objc_msgSend(v27, "count"))
  {
    v28 = (void *)objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    if (objc_msgSend(v28, "sequenceNumber") == a7 && objc_msgSend(v28, "retryNumber") == a8)
    {
      objc_msgSend(v27, "removeObjectAtIndex:", 0);
      goto LABEL_32;
    }
    if ((VCSessionMessageTopic *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_32;
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      v32 = objc_msgSend(v28, "sequenceNumber");
      v33 = objc_msgSend(v28, "retryNumber");
      *(_DWORD *)buf = 136316930;
      v43 = v30;
      v44 = 2080;
      v45 = "-[VCSessionMessageTopic dispatchedCompletionHandlerForSendMessage:withTopic:participantID:result:sequenceNum"
            "ber:retryNumber:]";
      v46 = 1024;
      v47 = 360;
      v48 = 2048;
      v49 = a5;
      v50 = 2048;
      v51 = v32;
      v52 = 2048;
      v53 = a7;
      v54 = 2048;
      v55 = v33;
      v56 = 2048;
      v57 = a8;
      v34 = " [%s] %s:%d Cannot match element in participantMessageBuffer for participantID=%llu, element index=%ld, inde"
            "x=%ld, element retry=%ld, retry=%ld";
      v35 = v31;
      v36 = 78;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v29 = (const __CFString *)-[VCSessionMessageTopic performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v29 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_32;
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      v39 = objc_msgSend(v28, "sequenceNumber");
      v40 = objc_msgSend(v28, "retryNumber");
      *(_DWORD *)buf = 136317442;
      v43 = v37;
      v44 = 2080;
      v45 = "-[VCSessionMessageTopic dispatchedCompletionHandlerForSendMessage:withTopic:participantID:result:sequenceNum"
            "ber:retryNumber:]";
      v46 = 1024;
      v47 = 360;
      v48 = 2112;
      v49 = (unint64_t)v29;
      v50 = 2048;
      v51 = (uint64_t)self;
      v52 = 2048;
      v53 = a5;
      v54 = 2048;
      v55 = v39;
      v56 = 2048;
      v57 = a7;
      v58 = 2048;
      v59 = v40;
      v60 = 2048;
      v61 = a8;
      v34 = " [%s] %s:%d %@(%p) Cannot match element in participantMessageBuffer for participantID=%llu, element index=%l"
            "d, index=%ld, element retry=%ld, retry=%ld";
      v35 = v38;
      v36 = 98;
    }
    _os_log_error_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
  }
LABEL_32:
  -[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:](self, "sendBufferedReliableMessagesForParticipantID:", a5);
}

uint64_t __125__VCSessionMessageTopic_dispatchedCompletionHandlerForSendMessage_withTopic_participantID_result_sequenceNumber_retryNumber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendMessage:participantID:withSequence:numRetries:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64) + 1);
}

- (BOOL)isDuplicateMessageID:(id)a3 messageHistory:(id)a4 participantID:(id)a5
{
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("replayThreshold"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(a3, "unsignedLongLongValue");
    if (v10 <= objc_msgSend(v9, "unsignedLongLongValue"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v31 = v22;
          v32 = 2080;
          v33 = "-[VCSessionMessageTopic isDuplicateMessageID:messageHistory:participantID:]";
          v34 = 1024;
          v35 = 374;
          v36 = 2112;
          v37 = a5;
          v38 = 2112;
          v39 = a3;
          v40 = 2112;
          v41 = (uint64_t)v9;
          v20 = " [%s] %s:%d ParticipantID=%@: Message too old: transactionID=%@, replayProtectionThreshold=%@";
          v21 = v23;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, 0x3Au);
        }
      }
LABEL_16:
      LOBYTE(v12) = 1;
      return v12;
    }
  }
  v11 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("messageHistory"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
      if (objc_msgSend(a3, "isEqualToNumber:", objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("messageID"))))break;
      if (v13 == ++v15)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        v13 = v12;
        if (v12)
          goto LABEL_5;
        return v12;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("expireTime"));
        *(_DWORD *)buf = 136316418;
        v31 = v17;
        v32 = 2080;
        v33 = "-[VCSessionMessageTopic isDuplicateMessageID:messageHistory:participantID:]";
        v34 = 1024;
        v35 = 378;
        v36 = 2112;
        v37 = a5;
        v38 = 2112;
        v39 = a3;
        v40 = 2112;
        v41 = v19;
        v20 = " [%s] %s:%d ParticipantID=%@: Found duplicate message with transactionID=%@ and expiration time=%@";
        v21 = v18;
        goto LABEL_15;
      }
    }
    goto LABEL_16;
  }
  return v12;
}

- (void)purgeExpiredEntries:(double)a3 messageHistory:(id)a4 participantID:(id)a5
{
  void *v7;
  unint64_t v8;
  __int128 v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("messageHistory"));
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("replayThreshold")), "unsignedLongLongValue");
  if (objc_msgSend(v7, "count"))
  {
    *(_QWORD *)&v9 = 136316930;
    v17 = v9;
    do
    {
      v10 = (void *)objc_msgSend(v7, "firstObject", v17);
      objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("expireTime")), "doubleValue");
      v12 = v11;
      v13 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("messageID")), "unsignedLongLongValue");
      if (v12 > a3)
        break;
      v14 = v13;
      if (v8 <= v13)
        v8 = v13;
      objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8), CFSTR("replayThreshold"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          v20 = v15;
          v21 = 2080;
          v22 = "-[VCSessionMessageTopic purgeExpiredEntries:messageHistory:participantID:]";
          v23 = 1024;
          v24 = 399;
          v25 = 2112;
          v26 = a5;
          v27 = 2048;
          v28 = v14;
          v29 = 2048;
          v30 = v12;
          v31 = 2048;
          v32 = a3;
          v33 = 2048;
          v34 = v8;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ParticipantID=%@: Purging message with transactionID=%llu and expiration time=%f. Current time=%f, replayProtectionThreshold=%llu", buf, 0x4Eu);
        }
      }
      objc_msgSend(v7, "removeObjectAtIndex:", 0);
    }
    while (objc_msgSend(v7, "count"));
  }
}

- (void)passMessage:(id)a3 sequence:(int)a4 fromParticipant:(id)a5
{
  uint64_t v6;
  uint64_t v9;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSString *topicKey;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSString *v21;
  OS_dispatch_queue *inMessageQueue;
  NSObject *CustomRootQueue;
  _QWORD block[7];
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v6 = *(_QWORD *)&a4;
  v41 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!a5)
    a5 = &unk_1E9EF6C68;
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v10 = micro();
  v11 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->transactionCache, "objectForKeyedSubscript:", a5);
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->transactionCache, "setObject:forKeyedSubscript:", v11, a5);
  }
  v12 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("messageHistory"));
  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("messageHistory"));
  }
  -[VCSessionMessageTopic purgeExpiredEntries:messageHistory:participantID:](self, "purgeExpiredEntries:messageHistory:participantID:", v11, a5, v10);
  if (-[VCSessionMessageTopic isDuplicateMessageID:messageHistory:participantID:](self, "isDuplicateMessageID:messageHistory:participantID:", v9, v11, a5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        topicKey = self->topicKey;
        *(_DWORD *)buf = 136316674;
        v28 = v13;
        v29 = 2080;
        v30 = "-[VCSessionMessageTopic passMessage:sequence:fromParticipant:]";
        v31 = 1024;
        v32 = 452;
        v33 = 2112;
        v34 = a5;
        v35 = 2112;
        v36 = (uint64_t)a3;
        v37 = 2112;
        v38 = v9;
        v39 = 2112;
        v40 = (uint64_t)topicKey;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d passMessage: ParticipantID '%@': Ignoring duplicate message '%@' with transactionID '%@' for topic '%@'", buf, 0x44u);
      }
    }
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10+ (double)-[VCControlChannel reliableMessageResendInterval](self->controlChannel, "reliableMessageResendInterval"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v28 = v17;
        v29 = 2080;
        v30 = "-[VCSessionMessageTopic passMessage:sequence:fromParticipant:]";
        v31 = 1024;
        v32 = 432;
        v33 = 2112;
        v34 = a5;
        v35 = 2112;
        v36 = v9;
        v37 = 2112;
        v38 = (uint64_t)v12;
        v39 = 2112;
        v40 = v16;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d passMessage: Participant '%@': Added message ID '%@' to message history '%@', expireTime '%@'", buf, 0x44u);
      }
    }
    v25[0] = CFSTR("messageID");
    v25[1] = CFSTR("expireTime");
    v26[0] = v9;
    v26[1] = v16;
    objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->topicKey;
        *(_DWORD *)buf = 136316674;
        v28 = v19;
        v29 = 2080;
        v30 = "-[VCSessionMessageTopic passMessage:sequence:fromParticipant:]";
        v31 = 1024;
        v32 = 438;
        v33 = 2112;
        v34 = a5;
        v35 = 2112;
        v36 = (uint64_t)a3;
        v37 = 2112;
        v38 = v9;
        v39 = 2112;
        v40 = (uint64_t)v21;
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d passMessage: ParticipantID '%@': Passing message '%@' with transactionID '%@' for topic '%@'", buf, 0x44u);
      }
    }
    inMessageQueue = self->inMessageQueue;
    if (!inMessageQueue)
    {
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      inMessageQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionMessageTopic.inMessageQueue", 0, CustomRootQueue);
      self->inMessageQueue = inMessageQueue;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__VCSessionMessageTopic_passMessage_sequence_fromParticipant___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = a3;
    block[6] = a5;
    dispatch_async((dispatch_queue_t)inMessageQueue, block);
  }

  objc_sync_exit(self);
}

_QWORD *__62__VCSessionMessageTopic_passMessage_sequence_fromParticipant___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 72);
  if (v2)
    return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, result[5], 0, result[6]);
  v2 = *(_QWORD *)(v1 + 80);
  if (v2)
    return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, result[5], 0, result[6]);
  return result;
}

- (void)clearTransactionCacheForParticipant:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCSessionMessageTopic clearTransactionCacheForParticipant:]";
      v11 = 1024;
      v12 = 461;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d clearTransactionCacheForParticipant:%@", (uint8_t *)&v7, 0x26u);
    }
  }
  -[NSMutableDictionary removeObjectForKey:](self->transactionCache, "removeObjectForKey:", a3);
  objc_sync_exit(self);
}

- (NSString)topicKey
{
  return self->topicKey;
}

- (BOOL)isSendingEnabled
{
  return self->isSendingEnabled;
}

- (void)attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]";
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot create sendMessageBuffer for participantID=%llu", v2, *(const char **)v3, (unint64_t)"-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)attemptToSendOrBufferReliableMessage:(uint64_t)a1 participantID:(NSObject *)a2 sequenceNumber:retryNumber:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]";
  v6 = 1024;
  v7 = 299;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot send or buffer with a nil message", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)sendBufferedReliableMessagesForParticipantID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:]";
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot retrieve sendMessageBuffer for participantID=%llu", v2, *(const char **)v3, (unint64_t)"-[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
