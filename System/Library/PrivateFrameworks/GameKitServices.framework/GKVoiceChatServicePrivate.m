@implementation GKVoiceChatServicePrivate

- (GKVoiceChatServicePrivate)init
{
  GKVoiceChatServicePrivate *v2;
  uint64_t v3;
  NSObject *v4;
  VideoConference *v5;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)GKVoiceChatServicePrivate;
  v2 = -[GKVoiceChatServicePrivate init](&v7, sel_init);
  VRTraceReset();
  VRTracePrintLoggingInfo();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v9 = v3;
      v10 = 2080;
      v11 = "-[GKVoiceChatServicePrivate init]";
      v12 = 1024;
      v13 = 46;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServicePrivate : !!!!!!!!!!!", buf, 0x1Cu);
    }
  }
  v2->stateLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
  v2->clientLock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  v5 = (VideoConference *)objc_msgSend(objc_alloc((Class)off_24D465990), "initWithClientPid:", 0);
  v2->conf = v5;
  -[VideoConference setDelegate:](v5, "setDelegate:", v2);
  -[VideoConference setPreferredCodec:](v2->conf, "setPreferredCodec:", 9);
  -[VideoConference setIsGKVoiceChat:](v2->conf, "setIsGKVoiceChat:", 1);
  -[VideoConference setIsUsingSuppression:](v2->conf, "setIsUsingSuppression:", 1);
  -[VideoConference setShouldTimeoutPackets:](v2->conf, "setShouldTimeoutPackets:", 1);
  v2->chatMode = 2;
  -[VideoConference setChatMode:](v2->conf, "setChatMode:", 2);
  -[VideoConference setUseCompressedConnectionData:](v2->conf, "setUseCompressedConnectionData:", 1);
  -[VideoConference setShouldPrioritizeParticipantIDForSIPInvite:](v2->conf, "setShouldPrioritizeParticipantIDForSIPInvite:", 1);
  return v2;
}

+ (id)defaultVoiceChatService
{
  id result;
  void *v3;

  result = (id)defaultVoiceChatService__GKVoiceChatServicePrivate;
  if (!defaultVoiceChatService__GKVoiceChatServicePrivate)
  {
    v3 = (void *)objc_opt_class();
    objc_sync_enter(v3);
    if (!defaultVoiceChatService__GKVoiceChatServicePrivate)
      defaultVoiceChatService__GKVoiceChatServicePrivate = objc_alloc_init(GKVoiceChatServicePrivate);
    objc_sync_exit(v3);
    return (id)defaultVoiceChatService__GKVoiceChatServicePrivate;
  }
  return result;
}

- (void)cleanup
{
  -[NSRecursiveLock lock](self->stateLock, "lock");
  -[VideoConference setDelegate:](self->conf, "setDelegate:", 0);
  -[NSRecursiveLock unlock](self->stateLock, "unlock");
}

- (void)dealloc
{
  objc_super v3;

  -[VideoConference cleanupManager](self->conf, "cleanupManager");

  self->conf = 0;
  self->stateLock = 0;

  self->clientLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatServicePrivate;
  -[GKVoiceChatServicePrivate dealloc](&v3, sel_dealloc);
}

- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  int v10;
  GKVoiceChatClient *client;
  const __CFString *v12;
  const __CFString *v13;
  GKVoiceChatServicePrivate *v14;
  id *v15;
  uint64_t v16;
  BOOL v17;
  GKVoiceChatDictionary *v19;
  uint64_t v20;
  GKVoiceChatDictionary *outgoingCallDict;
  uint64_t v22;
  GKVoiceChatDictionary *v23;
  uint64_t v24;
  NSObject *v25;
  GKVoiceChatDictionary *v26;
  const char *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v9 = "<nil>";
      v28 = 136315906;
      v29 = v7;
      v30 = 2080;
      v31 = "-[GKVoiceChatServicePrivate startVoiceChatWithParticipantID:error:]";
      v32 = 1024;
      v33 = 118;
      v34 = 2080;
      v35 = v9;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d startVoiceChatWithParticipantID with %s", (uint8_t *)&v28, 0x26u);
    }
  }
  -[NSRecursiveLock lock](self->stateLock, "lock");
  if (!a3)
  {
    v12 = CFSTR("participantID is nil");
    v13 = CFSTR("nil participantID");
    v14 = self;
    v15 = a4;
    v16 = 32016;
    goto LABEL_15;
  }
  if (!self->client)
    goto LABEL_13;
  v10 = -[GKVoiceChatServicePrivate state](self, "state");
  client = self->client;
  if (v10)
  {
    if (client)
    {
      v12 = CFSTR("Cannot do startVoiceChatWithParticipantID:error:");
      v13 = CFSTR("GKVoiceChatService is not idle.");
      v14 = self;
      v15 = a4;
      v16 = 32012;
LABEL_15:
      -[GKVoiceChatServicePrivate getNSError:code:description:reason:](v14, "getNSError:code:description:reason:", v15, v16, v12, v13);
      v17 = 0;
      goto LABEL_16;
    }
LABEL_13:
    v12 = CFSTR("Client is not set.");
    v13 = CFSTR("Client is nil.");
LABEL_14:
    v14 = self;
    v15 = a4;
    v16 = 32006;
    goto LABEL_15;
  }
  if (!-[GKVoiceChatClient participantID](client, "participantID"))
  {
    v12 = CFSTR("Client participantID is not set.");
    v13 = CFSTR("participantID is nil.");
    goto LABEL_14;
  }
  v19 = -[GKVoiceChatServicePrivate createInvite:toParticipant:callID:](self, "createInvite:toParticipant:callID:", a4, a3, &self->curCallID);
  self->outgoingCallDict = v19;
  v20 = -[GKVoiceChatDictionary createBlob](v19, "createBlob");
  v17 = 0;
  outgoingCallDict = self->outgoingCallDict;
  if (outgoingCallDict)
  {
    v22 = v20;
    if (v20)
    {
      v23 = outgoingCallDict;
      -[GKVoiceChatServicePrivate setState:](self, "setState:", 3);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v26 = self->outgoingCallDict;
          if (v26)
            v27 = (const char *)objc_msgSend(-[GKVoiceChatDictionary description](v26, "description"), "UTF8String");
          else
            v27 = "<nil>";
          v28 = 136315906;
          v29 = v24;
          v30 = 2080;
          v31 = "-[GKVoiceChatServicePrivate startVoiceChatWithParticipantID:error:]";
          v32 = 1024;
          v33 = 162;
          v34 = 2080;
          v35 = v27;
          _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OutgoingcallDict = %s", (uint8_t *)&v28, 0x26u);
        }
      }
      -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, v22, a3);
      v17 = 1;
    }
  }
LABEL_16:
  -[NSRecursiveLock unlock](self->stateLock, "unlock");
  return v17;
}

- (void)stopVoiceChatProc:(id)a3
{
  int ErrorLogLevelForModule;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  unsigned int curCallID;
  int state;
  id v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  const __CFString *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v9 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v22 = v7;
      v23 = 2080;
      v24 = "-[GKVoiceChatServicePrivate stopVoiceChatProc:]";
      v25 = 1024;
      v26 = 173;
      v27 = 2080;
      v28 = v9;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopVoiceChatProc1>:P%s", buf, 0x26u);
    }
  }
  -[NSRecursiveLock lock](self->stateLock, "lock");
  if (-[GKVoiceChatServicePrivate state](self, "state"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v12 = "<nil>";
        curCallID = self->curCallID;
        state = self->state;
        *(_DWORD *)buf = 136316418;
        v22 = v10;
        v23 = 2080;
        v24 = "-[GKVoiceChatServicePrivate stopVoiceChatProc:]";
        v25 = 1024;
        v26 = 180;
        v27 = 2080;
        v28 = v12;
        v29 = 1024;
        v30 = curCallID;
        v31 = 1024;
        v32 = state;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopVoiceChatProc2>:P%s, curCallID = %d, state %d", buf, 0x32u);
      }
    }
    v15 = objc_alloc_init(MEMORY[0x24BDD1460]);
    -[VideoConference stopCallID:](self->conf, "stopCallID:", self->curCallID);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v22 = v16;
        v23 = 2080;
        v24 = "-[GKVoiceChatServicePrivate stopVoiceChatProc:]";
        v25 = 1024;
        v26 = 184;
        v27 = 1024;
        LODWORD(v28) = 184;
        _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
      }
    }
    v18 = -[GKVoiceChatServicePrivate state](self, "state");
    if (v18 <= 6 && ((1 << v18) & 0x68) != 0)
      -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, objc_msgSend(-[GKVoiceChatDictionary cancelDictionary](self->outgoingCallDict, "cancelDictionary"), "createBlob"), a3);
    -[GKVoiceChatServicePrivate resetState](self, "resetState");
    v19 = CFSTR("participantID");
    v20 = a3;
    -[GKVoiceChatServicePrivate performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1), 0);
    -[NSRecursiveLock unlock](self->stateLock, "unlock");

  }
  else
  {
    -[NSRecursiveLock unlock](self->stateLock, "unlock");
  }
}

- (void)stopVoiceChatWithParticipantID:(id)a3
{
  if (self->client)
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_stopVoiceChatProc_, self, a3);
}

- (BOOL)acceptCallID:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  GKVoiceChatDictionary *incomingCallDict;
  const char *v10;
  GKVoiceChatDictionary *v11;
  uint64_t v12;
  GKVoiceChatDictionary *outgoingCallDict;
  uint64_t v14;
  GKVoiceChatDictionary *v15;
  id v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v5 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->stateLock, "lock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      incomingCallDict = self->incomingCallDict;
      if (incomingCallDict)
        v10 = (const char *)objc_msgSend(-[GKVoiceChatDictionary description](incomingCallDict, "description"), "UTF8String");
      else
        v10 = "<nil>";
      v18 = 136315906;
      v19 = v7;
      v20 = 2080;
      v21 = "-[GKVoiceChatServicePrivate acceptCallID:error:]";
      v22 = 1024;
      v23 = 241;
      v24 = 2080;
      v25 = v10;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d acceptCallID with dict = %s", (uint8_t *)&v18, 0x26u);
    }
  }
  if (self->client)
  {
    if (self->incomingCallDict && -[GKVoiceChatServicePrivate state](self, "state") == 2)
    {
      if (self->curCallID == (_DWORD)v5)
      {
        v11 = -[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](self, "createReplyUsingDictionary:replyCode:error:", self->incomingCallDict, 1, a4);
        self->outgoingCallDict = v11;
        v12 = -[GKVoiceChatDictionary createBlob](v11, "createBlob");
        outgoingCallDict = self->outgoingCallDict;
        if (outgoingCallDict)
        {
          v14 = v12;
          if (v12)
          {
            v15 = outgoingCallDict;
            -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, v14, -[GKVoiceChatDictionary participantID](self->outgoingCallDict, "participantID"));
            -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:](self, "startICEConnectionCheck:isCaller:", self->incomingCallDict, 0);
            -[GKVoiceChatServicePrivate setState:](self, "setState:", 6);
            -[NSRecursiveLock unlock](self->stateLock, "unlock");
            return 1;
          }
        }
        v17 = -[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](self, "createReplyUsingDictionary:replyCode:error:", self->incomingCallDict, 2, a4);
        -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, objc_msgSend(v17, "createBlob"), objc_msgSend(v17, "participantID"));
        -[GKVoiceChatServicePrivate resetState](self, "resetState");
      }
      else
      {
        -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", a4, 32004, CFSTR("Invalid callID."), CFSTR("CallID does not match current."));
      }
      -[NSRecursiveLock unlock](self->stateLock, "unlock");
    }
    else
    {
      -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", a4, 32012, CFSTR("Cannot do acceptCallID:error:"), CFSTR("No active call to accept."));
      -[NSRecursiveLock unlock](self->stateLock, "unlock");
      -[GKVoiceChatServicePrivate resetState](self, "resetState");
    }
    -[VideoConference stopCallID:](self->conf, "stopCallID:", v5);
  }
  else
  {
    -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", a4, 32006, CFSTR("Client is not set."), CFSTR("Client is nil."));
    -[NSRecursiveLock unlock](self->stateLock, "unlock");
  }
  return 0;
}

- (void)denyCallID:(unsigned int)a3
{
  uint64_t v5;
  NSObject *v6;
  GKVoiceChatDictionary *incomingCallDict;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->stateLock, "lock");
  if (self->client && -[GKVoiceChatServicePrivate state](self, "state") == 2 && self->curCallID == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        incomingCallDict = self->incomingCallDict;
        if (incomingCallDict)
          v8 = (const char *)objc_msgSend(-[GKVoiceChatDictionary description](incomingCallDict, "description"), "UTF8String");
        else
          v8 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v16 = v5;
        v17 = 2080;
        v18 = "-[GKVoiceChatServicePrivate denyCallID:]";
        v19 = 1024;
        v20 = 299;
        v21 = 2080;
        v22 = v8;
        _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d denyCallID with dict = %s", buf, 0x26u);
      }
    }
    v12 = 0;
    -[VideoConference stopCallID:](self->conf, "stopCallID:", self->curCallID);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v9;
        v17 = 2080;
        v18 = "-[GKVoiceChatServicePrivate denyCallID:]";
        v19 = 1024;
        v20 = 302;
        v21 = 1024;
        LODWORD(v22) = 302;
        _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
      }
    }
    v11 = -[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](self, "createReplyUsingDictionary:replyCode:error:", self->incomingCallDict, 2, &v12);
    -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, objc_msgSend(v11, "createBlob"), objc_msgSend(v11, "participantID"));
    v13 = CFSTR("participantID");
    v14 = -[GKVoiceChatDictionary fromParticipantID](self->incomingCallDict, "fromParticipantID");
    -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    -[GKVoiceChatServicePrivate resetState](self, "resetState");
    -[NSRecursiveLock unlock](self->stateLock, "unlock");
  }
  else
  {
    -[NSRecursiveLock unlock](self->stateLock, "unlock");
  }
}

- (void)setClient:(id)a3
{
  -[NSRecursiveLock lock](self->stateLock, "lock");
  -[VideoConference setRequiresWifi:](self->conf, "setRequiresWifi:", 1);
  -[NSLock lock](self->clientLock, "lock");
  self->client = (GKVoiceChatClient *)a3;
  -[NSLock unlock](self->clientLock, "unlock");
  -[NSRecursiveLock unlock](self->stateLock, "unlock");
}

- (void)informClientOfInviteFromParticipant:(id)incomingCallDict
{
  GKVoiceChatClient *v5;
  GKVoiceChatClient *client;

  -[NSLock lock](self->clientLock, "lock");
  v5 = self->client;
  client = self->client;
  -[NSLock unlock](self->clientLock, "unlock");
  if (!incomingCallDict)
    incomingCallDict = self->incomingCallDict;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKVoiceChatClient voiceChatService:didReceiveInvitationFromParticipantID:callID:](client, "voiceChatService:didReceiveInvitationFromParticipantID:callID:", self->wrapperService, objc_msgSend(incomingCallDict, "fromParticipantID"), objc_msgSend(incomingCallDict, "callID"));

  }
  else
  {

    -[GKVoiceChatServicePrivate acceptCallID:error:](self, "acceptCallID:error:", -[GKVoiceChatDictionary callID](self->incomingCallDict, "callID"), 0);
  }
}

- (void)informClientVoiceChatDidStart:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GKVoiceChatServicePrivate performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStartMainSelector_, a3, 0);
}

- (void)informClientVoiceChatDidStartMainSelector:(id)a3
{
  GKVoiceChatClient *v5;
  GKVoiceChatClient *client;

  -[NSLock lock](self->clientLock, "lock");
  v5 = self->client;
  client = self->client;
  -[NSLock unlock](self->clientLock, "unlock");
  -[GKVoiceChatClient voiceChatService:didStartWithParticipantID:](client, "voiceChatService:didStartWithParticipantID:", self->wrapperService, a3);

}

- (void)informClientVoiceChatDidNotStart:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GKVoiceChatServicePrivate performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidNotStartMainSelector_, a3, 0);
}

- (void)informClientVoiceChatDidNotStartMainSelector:(id)a3
{
  GKVoiceChatClient *v5;
  GKVoiceChatClient *client;

  -[NSLock lock](self->clientLock, "lock");
  v5 = self->client;
  client = self->client;
  -[NSLock unlock](self->clientLock, "unlock");
  -[GKVoiceChatClient voiceChatService:didNotStartWithParticipantID:error:](client, "voiceChatService:didNotStartWithParticipantID:error:", self->wrapperService, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("participantID")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("error")));

}

- (void)informClientVoiceChatDidStop:(id)a3
{
  GKVoiceChatClient *v5;
  GKVoiceChatClient *client;

  -[NSLock lock](self->clientLock, "lock");
  v5 = self->client;
  client = self->client;
  -[NSLock unlock](self->clientLock, "unlock");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GKVoiceChatClient voiceChatService:didStopWithParticipantID:error:](client, "voiceChatService:didStopWithParticipantID:error:", self->wrapperService, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("participantID")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("error")));

}

- (void)resetState
{
  -[NSRecursiveLock lock](self->stateLock, "lock");
  -[GKVoiceChatServicePrivate setState:](self, "setState:", 0);

  self->incomingCallDict = 0;
  self->outgoingCallDict = 0;
  self->curCallID = -1;
  *(_OWORD *)&self->currentConnResult.dwCallID = 0u;
  *(_OWORD *)&self->currentConnResult.proto = 0u;
  *(_OWORD *)self->currentConnResult.mbLocal.szIfName = 0u;
  self->currentConnResult.mbLocal.IP = 0u;
  *(_OWORD *)&self->currentConnResult.mbLocal.wPort = 0u;
  *(_OWORD *)&self->currentConnResult.mbRemote.szIfName[8] = 0u;
  *($F769FFECAE4F2CBB6DC47B20A73030F6 *)((char *)&self->currentConnResult.mbRemote.IP + 8) = 0u;
  *(_OWORD *)self->currentConnResult.mbSrc.szIfName = 0u;
  self->currentConnResult.mbSrc.IP = 0u;
  *(_OWORD *)&self->currentConnResult.mbSrc.wPort = 0u;
  *(_OWORD *)&self->currentConnResult.mbDst.szIfName[8] = 0u;
  *($F769FFECAE4F2CBB6DC47B20A73030F6 *)((char *)&self->currentConnResult.mbDst.IP + 8) = 0u;
  *(_OWORD *)self->currentConnResult.mbRemoteSrc.szIfName = 0u;
  self->currentConnResult.mbRemoteSrc.IP = 0u;
  *(_OWORD *)&self->currentConnResult.mbRemoteSrc.wPort = 0u;
  *(_OWORD *)&self->currentConnResult.mbRelayExt.szIfName[8] = 0u;
  *($F769FFECAE4F2CBB6DC47B20A73030F6 *)((char *)&self->currentConnResult.mbRelayExt.IP + 8) = 0u;
  *(_OWORD *)&self->currentConnResult.bIfLocalCellularQoS = 0u;
  *(_OWORD *)&self->currentConnResult.wCellularMTU = 0u;
  *(_OWORD *)&self->currentConnResult.next = 0u;
  -[NSRecursiveLock unlock](self->stateLock, "unlock");
}

- (void)receivedData:(id)a3 fromParticipantID:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int state;
  unsigned int curCallID;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  unsigned int v20;
  void **v21;
  GKVoiceChatServicePrivate *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  unsigned int v44;
  uint64_t v45;
  NSObject *v46;
  unsigned int v47;
  _BOOL4 v48;
  int ErrorLogLevelForModule;
  uint64_t v50;
  NSObject *v51;
  _BOOL4 v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  GKVoiceChatServicePrivate *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  int64_t v77;
  int64_t v78;
  GKVoiceChatDictionary *incomingCallDict;
  GKVoiceChatServicePrivate *v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  void *v85;
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _BYTE buf[12];
  __int16 v97;
  const char *v98;
  __int16 v99;
  int v100;
  __int16 v101;
  _BYTE v102[10];
  _BYTE v103[10];
  int v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  if (self->client)
  {
    -[NSRecursiveLock lock](self->stateLock, "lock");
    v7 = +[GKVoiceChatDictionary dictionaryFromData:](GKVoiceChatDictionary, "dictionaryFromData:", a3);
    if (!v7)
    {
      -[NSRecursiveLock unlock](self->stateLock, "unlock");
      return;
    }
    v8 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        curCallID = self->curCallID;
        state = self->state;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v9;
        v97 = 2080;
        v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
        v99 = 1024;
        v100 = 427;
        v101 = 1024;
        *(_DWORD *)v102 = state;
        *(_WORD *)&v102[4] = 1024;
        *(_DWORD *)&v102[6] = curCallID;
        *(_WORD *)v103 = 2080;
        *(_QWORD *)&v103[2] = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d State = %d, curCallID = %d, recevied dict = {%s}", buf, 0x32u);
      }
    }
    switch(self->state)
    {
      case 0:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            if (a4)
              v26 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
            else
              v26 = "<nil>";
            v65 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
            v66 = objc_msgSend(v8, "isInviteDictionary");
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = v24;
            v97 = 2080;
            v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
            v99 = 1024;
            v100 = 431;
            v101 = 2080;
            *(_QWORD *)v102 = v26;
            *(_WORD *)&v102[8] = 2080;
            *(_QWORD *)v103 = v65;
            *(_WORD *)&v103[8] = 1024;
            v104 = v66;
            _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d switch - GKVoiceChatServiceStateIdle from = %s: inviteIsValid = %s, %d", buf, 0x36u);
          }
        }
        if (-[GKVoiceChatServicePrivate inviteIsValid:](self, "inviteIsValid:", v8))
        {
          self->incomingCallDict = (GKVoiceChatDictionary *)v8;
          -[GKVoiceChatServicePrivate setState:](self, "setState:", 2);
          self->curCallID = objc_msgSend(v8, "callID");
          -[GKVoiceChatServicePrivate performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientOfInviteFromParticipant_, 0, 0);
        }
        else
        {
          -[GKVoiceChatServicePrivate resetState](self, "resetState");
        }
        goto LABEL_92;
      case 1:
      case 5:
      case 6:
        if (-[GKVoiceChatServicePrivate inviteIsValid:](self, "inviteIsValid:", v8)
          && (!objc_msgSend(a4, "isEqualToString:", -[GKVoiceChatDictionary fromParticipantID](self->incomingCallDict, "fromParticipantID"))|| (objc_msgSend(v8, "matchesNonce:", -[GKVoiceChatDictionary nonce](self->incomingCallDict, "nonce")) & 1) == 0))
        {
          v85 = 0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v20 = self->curCallID;
              v19 = self->state;
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v17;
              v97 = 2080;
              v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              v99 = 1024;
              v100 = 601;
              v101 = 1024;
              *(_DWORD *)v102 = v19;
              *(_WORD *)&v102[4] = 1024;
              *(_DWORD *)&v102[6] = v20;
              _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d State = %d: GOT INVITE AND WE ARE BUSY BUSY with callID %d", buf, 0x28u);
            }
          }
          v21 = &v85;
          goto LABEL_22;
        }
        if (objc_msgSend(a4, "isEqualToString:", -[GKVoiceChatDictionary fromParticipantID](self->incomingCallDict, "fromParticipantID"))&& objc_msgSend(v8, "isCancelDictionary")&& objc_msgSend(v8, "matchesNonce:", -[GKVoiceChatDictionary nonce](self->outgoingCallDict, "nonce")))
        {
          v85 = 0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v15 = self->curCallID;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = v13;
              v97 = 2080;
              v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              v99 = 1024;
              v100 = 613;
              v101 = 1024;
              *(_DWORD *)v102 = v15;
              _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cancelling call from the remote user... for callID %d", buf, 0x22u);
            }
          }
          -[VideoConference remoteCancelledCallID:](self->conf, "remoteCancelledCallID:", self->curCallID);
          -[GKVoiceChatServicePrivate resetState](self, "resetState");
          v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("%@ has cancelled this request."), &stru_24D466D90, CFSTR("GKSessionEvent")), a4);
          -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", &v85, 32009, v16, objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("This request was cancelled."), &stru_24D466D90, CFSTR("GKSessionEvent")));
          v86[0] = CFSTR("participantID");
          v86[1] = CFSTR("error");
          v87[0] = a4;
          v87[1] = v85;
          -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 2));
          goto LABEL_90;
        }
        goto LABEL_92;
      case 2:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v27 = VRTraceErrorLogLevelToCSTR();
          v28 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v29 = self->curCallID;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v27;
            v97 = 2080;
            v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
            v99 = 1024;
            v100 = 449;
            v101 = 1024;
            *(_DWORD *)v102 = v29;
            _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d switch - GKVoiceChatServiceStateWaitingForClientResponse callID = %d", buf, 0x22u);
          }
        }
        if ((objc_msgSend(a4, "isEqualToString:", -[GKVoiceChatDictionary fromParticipantID](self->incomingCallDict, "fromParticipantID")) & 1) != 0)
        {
          if (objc_msgSend(v8, "isCancelDictionary"))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v30 = VRTraceErrorLogLevelToCSTR();
              v31 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v32 = self->curCallID;
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = v30;
                v97 = 2080;
                v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                v99 = 1024;
                v100 = 467;
                v101 = 1024;
                *(_DWORD *)v102 = v32;
                _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServiceStateWaitingForClientResponse: Cancelling call is working... for callID %d", buf, 0x22u);
              }
            }
            *(_QWORD *)buf = 0;
            -[VideoConference remoteCancelledCallID:](self->conf, "remoteCancelledCallID:", self->curCallID);
            v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("%@ has cancelled this request."), &stru_24D466D90, CFSTR("GKSessionEvent")), a4);
            -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", buf, 32009, v33, objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("This request was cancelled."), &stru_24D466D90, CFSTR("GKSessionEvent")));
            v94[0] = CFSTR("participantID");
            v94[1] = CFSTR("error");
            v95[0] = a4;
            v95[1] = *(_QWORD *)buf;
            v34 = (void *)MEMORY[0x24BDBCE70];
            v35 = v95;
            v36 = v94;
            goto LABEL_36;
          }
        }
        else if (-[GKVoiceChatServicePrivate inviteIsValid:](self, "inviteIsValid:", v8))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v42 = VRTraceErrorLogLevelToCSTR();
            v43 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v44 = self->curCallID;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = v42;
              v97 = 2080;
              v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              v99 = 1024;
              v100 = 455;
              v101 = 1024;
              *(_DWORD *)v102 = v44;
              _os_log_impl(&dword_215C5C000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServiceStateWaitingForClientResponse: GOT INVITE AND WE ARE BUSY BUSY callID %d", buf, 0x22u);
            }
          }
          *(_QWORD *)buf = 0;
          v21 = (void **)buf;
LABEL_22:
          v22 = self;
          v23 = v8;
          goto LABEL_55;
        }
        goto LABEL_92;
      case 3:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v38 = VRTraceErrorLogLevelToCSTR();
          v39 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v40 = self->curCallID;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v38;
            v97 = 2080;
            v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
            v99 = 1024;
            v100 = 480;
            v101 = 1024;
            *(_DWORD *)v102 = v40;
            _os_log_impl(&dword_215C5C000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d switch - GKVoiceChatServiceStateWaitingForInviteResponse callID %d", buf, 0x22u);
          }
        }
        if (!objc_msgSend(a4, "isEqualToString:", -[GKVoiceChatDictionary participantID](self->outgoingCallDict, "participantID")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v45 = VRTraceErrorLogLevelToCSTR();
            v46 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v47 = self->curCallID;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = v45;
              v97 = 2080;
              v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              v99 = 1024;
              v100 = 584;
              v101 = 1024;
              *(_DWORD *)v102 = v47;
              _os_log_impl(&dword_215C5C000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServiceStateWaitingForInviteResponse: GOT INVITE AND WE ARE BUSY BUSY with callID %d", buf, 0x22u);
            }
          }
          v22 = self;
          v23 = v8;
          v21 = 0;
LABEL_55:
          -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, objc_msgSend(-[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](v22, "createReplyUsingDictionary:replyCode:error:", v23, 3, v21), "createBlob"), a4);
          goto LABEL_92;
        }
        if (-[GKVoiceChatDictionary matchesResponse:](self->outgoingCallDict, "matchesResponse:", v8))
        {
          self->incomingCallDict = (GKVoiceChatDictionary *)v8;
          v85 = 0;
          v41 = objc_msgSend(v8, "response");
          if (v41 == 3)
          {
            -[VideoConference stopCallID:](self->conf, "stopCallID:", self->curCallID);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v67 = VRTraceErrorLogLevelToCSTR();
              v68 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = v67;
                v97 = 2080;
                v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                v99 = 1024;
                v100 = 502;
                v101 = 1024;
                *(_DWORD *)v102 = 502;
                _os_log_impl(&dword_215C5C000, v68, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
              }
            }
            v69 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("%@ is currently busy in another call."), &stru_24D466D90, CFSTR("GKSessionEvent")), a4);
            v70 = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Request declined."), &stru_24D466D90, CFSTR("GKSessionEvent"));
            v71 = self;
            v72 = 32008;
          }
          else
          {
            if (v41 != 2)
            {
              if (v41 == 1)
              {
                -[GKVoiceChatServicePrivate setState:](self, "setState:", 5);
                -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:](self, "startICEConnectionCheck:isCaller:", v8, 1);
              }
              goto LABEL_87;
            }
            -[VideoConference stopCallID:](self->conf, "stopCallID:", self->curCallID);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v73 = VRTraceErrorLogLevelToCSTR();
              v74 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = v73;
                v97 = 2080;
                v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                v99 = 1024;
                v100 = 497;
                v101 = 1024;
                *(_DWORD *)v102 = 497;
                _os_log_impl(&dword_215C5C000, v74, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
              }
            }
            v69 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("%@ has declined your request."), &stru_24D466D90, CFSTR("GKSessionEvent")), a4);
            v70 = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Request declined."), &stru_24D466D90, CFSTR("GKSessionEvent"));
            v71 = self;
            v72 = 32011;
          }
          -[GKVoiceChatServicePrivate getNSError:code:description:reason:](v71, "getNSError:code:description:reason:", &v85, v72, v69, v70);
LABEL_87:
          if (!v85)
          {
LABEL_92:
            -[NSRecursiveLock unlock](self->stateLock, "unlock");
            return;
          }
          v92[0] = CFSTR("participantID");
          v92[1] = CFSTR("error");
          v93[0] = a4;
          v93[1] = v85;
          v62 = (void *)MEMORY[0x24BDBCE70];
          v63 = v93;
          v64 = v92;
          goto LABEL_89;
        }
        v48 = -[GKVoiceChatServicePrivate inviteIsValid:](self, "inviteIsValid:", v8);
        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (!v48)
        {
          if (ErrorLogLevelForModule >= 7)
          {
            v56 = VRTraceErrorLogLevelToCSTR();
            v57 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v58 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = v56;
              v97 = 2080;
              v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              v99 = 1024;
              v100 = 565;
              v101 = 2080;
              *(_QWORD *)v102 = v58;
              _os_log_impl(&dword_215C5C000, v57, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [self inviteIsValid:calleeResponse] is NO {%s}", buf, 0x26u);
            }
          }
          if ((objc_msgSend(v8, "isReplyDictionary") & 1) != 0)
            goto LABEL_92;
          v85 = 0;
          -[VideoConference stopCallID:](self->conf, "stopCallID:", self->curCallID);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v59 = VRTraceErrorLogLevelToCSTR();
            v60 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = v59;
              v97 = 2080;
              v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              v99 = 1024;
              v100 = 573;
              v101 = 1024;
              *(_DWORD *)v102 = 573;
              _os_log_impl(&dword_215C5C000, v60, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
            }
          }
          v61 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("%@ has declined your request."), &stru_24D466D90, CFSTR("GKSessionEvent")), a4);
          -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", &v85, 32011, v61, objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Request declined."), &stru_24D466D90, CFSTR("GKSessionEvent")));
          v88[0] = CFSTR("participantID");
          v88[1] = CFSTR("error");
          v89[0] = a4;
          v89[1] = v85;
          v62 = (void *)MEMORY[0x24BDBCE70];
          v63 = v89;
          v64 = v88;
LABEL_89:
          -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", objc_msgSend(v62, "dictionaryWithObjects:forKeys:count:", v63, v64, 2));
          -[GKVoiceChatServicePrivate resetState](self, "resetState");
LABEL_90:
          v37 = v85;
LABEL_91:

          goto LABEL_92;
        }
        if (ErrorLogLevelForModule >= 7)
        {
          v50 = VRTraceErrorLogLevelToCSTR();
          v51 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v52 = objc_msgSend((id)-[GKVoiceChatClient participantID](self->client, "participantID"), "localizedCompare:", a4) == -1;
            v53 = objc_msgSend((id)-[GKVoiceChatClient participantID](self->client, "participantID"), "localizedCompare:", a4);
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v50;
            v97 = 2080;
            v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
            v99 = 1024;
            v100 = 516;
            v101 = 1024;
            *(_DWORD *)v102 = v52;
            *(_WORD *)&v102[4] = 1024;
            *(_DWORD *)&v102[6] = v53 == 1;
            _os_log_impl(&dword_215C5C000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [self inviteIsValid:calleeResponse] is YES:isCaller=%d, %d", buf, 0x28u);
          }
        }
        self->incomingCallDict = (GKVoiceChatDictionary *)v8;
        if (objc_msgSend((id)-[GKVoiceChatClient participantID](self->client, "participantID"), "localizedCompare:", a4) == -1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v75 = VRTraceErrorLogLevelToCSTR();
            v76 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = v75;
              v97 = 2080;
              v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              v99 = 1024;
              v100 = 524;
              _os_log_impl(&dword_215C5C000, v76, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am the caller starting ice check", buf, 0x1Cu);
            }
          }
        }
        else
        {
          if (objc_msgSend((id)-[GKVoiceChatClient participantID](self->client, "participantID"), "localizedCompare:", a4) == 1)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v54 = VRTraceErrorLogLevelToCSTR();
              v55 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = v54;
                v97 = 2080;
                v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                v99 = 1024;
                v100 = 531;
                _os_log_impl(&dword_215C5C000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am the callee starting ice check", buf, 0x1Cu);
              }
            }
LABEL_100:
            -[GKVoiceChatServicePrivate setState:](self, "setState:", 6);
            incomingCallDict = self->incomingCallDict;
            v80 = self;
            v81 = 0;
            goto LABEL_101;
          }
          v77 = -[GKVoiceChatDictionary nonce](self->incomingCallDict, "nonce");
          v78 = -[GKVoiceChatDictionary nonce](self->outgoingCallDict, "nonce");
          if (v78 >= v77)
          {
            if (v78 <= v77)
            {
              -[VideoConference stopCallID:](self->conf, "stopCallID:", self->curCallID);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v82 = VRTraceErrorLogLevelToCSTR();
                v83 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = v82;
                  v97 = 2080;
                  v98 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                  v99 = 1024;
                  v100 = 552;
                  v101 = 1024;
                  *(_DWORD *)v102 = 552;
                  _os_log_impl(&dword_215C5C000, v83, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
                }
              }
              *(_QWORD *)buf = 0;
              v84 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("%@ has declined your request."), &stru_24D466D90, CFSTR("GKSessionEvent")), a4);
              -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", buf, 32011, v84, objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Request declined."), &stru_24D466D90, CFSTR("GKSessionEvent")));
              v90[0] = CFSTR("participantID");
              v90[1] = CFSTR("error");
              v91[0] = a4;
              v91[1] = *(_QWORD *)buf;
              v34 = (void *)MEMORY[0x24BDBCE70];
              v35 = v91;
              v36 = v90;
LABEL_36:
              -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 2));
              -[GKVoiceChatServicePrivate resetState](self, "resetState");
              v37 = *(void **)buf;
              goto LABEL_91;
            }
            goto LABEL_100;
          }
        }
        -[GKVoiceChatServicePrivate setState:](self, "setState:", 5);
        incomingCallDict = self->incomingCallDict;
        v80 = self;
        v81 = 1;
LABEL_101:
        -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:](v80, "startICEConnectionCheck:isCaller:", incomingCallDict, v81);
        goto LABEL_92;
      default:
        goto LABEL_92;
    }
  }
}

- (BOOL)inviteIsValid:(id)a3
{
  return objc_msgSend(a3, "isInviteDictionary");
}

- (id)createReplyUsingDictionary:(id)a3 replyCode:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  if (a4 == 1)
  {
    v8 = -[VideoConference connectionBlobForParticipantID:callID:error:](self->conf, "connectionBlobForParticipantID:callID:error:", -[GKVoiceChatClient participantID](self->client, "participantID"), &v11, a5);
    if (!v8)
      return 0;
    v9 = v11;
    self->curCallID = v11;
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", "empty", 5, a5);
    v9 = 0;
  }
  return (id)objc_msgSend(a3, "replyDictionary:connectionData:callID:focus:", a4, v8, v9, -[GKVoiceChatServicePrivate isFocus](self, "isFocus"));
}

- (id)createInvite:(id *)a3 toParticipant:(id)a4 callID:(unsigned int *)a5
{
  id result;
  unsigned int v9;

  v9 = *a5;
  result = (id)-[VideoConference connectionBlobForParticipantID:callID:error:](self->conf, "connectionBlobForParticipantID:callID:error:", -[GKVoiceChatClient participantID](self->client, "participantID"), &v9, a3);
  *a5 = v9;
  if (result)
    return +[GKVoiceChatDictionary inviteDictionaryToParticipantID:fromParticipantID:connectionData:callID:focus:](GKVoiceChatDictionary, "inviteDictionaryToParticipantID:fromParticipantID:connectionData:callID:focus:", a4, -[GKVoiceChatClient participantID](self->client, "participantID"), result, *a5, -[GKVoiceChatServicePrivate isFocus](self, "isFocus"));
  return result;
}

- (int)startICEConnectionCheck:(id)a3 isCaller:(BOOL)a4
{
  return -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, a4, self->curCallID);
}

- (int)startICEConnectionCheck:(id)a3 isCaller:(BOOL)a4 withCallID:(unsigned int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  VideoConference *conf;
  const char *v14;
  void *v15;
  int v16;
  uint64_t v18;
  _BYTE buf[12];
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    goto LABEL_12;
  v9 = VRTraceErrorLogLevelToCSTR();
  v10 = *MEMORY[0x24BDFDC28];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    goto LABEL_12;
  if (!self)
  {
    v11 = "<nil>";
    if (a3)
      goto LABEL_5;
LABEL_7:
    v12 = "<nil>";
    goto LABEL_8;
  }
  v11 = (const char *)objc_msgSend((id)-[GKVoiceChatServicePrivate description](self, "description"), "UTF8String");
  if (!a3)
    goto LABEL_7;
LABEL_5:
  v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
LABEL_8:
  conf = self->conf;
  if (conf)
    v14 = (const char *)objc_msgSend((id)-[VideoConference description](conf, "description"), "UTF8String");
  else
    v14 = "<nil>";
  *(_DWORD *)buf = 136316930;
  *(_QWORD *)&buf[4] = v9;
  v20 = 2080;
  v21 = "-[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:]";
  v22 = 1024;
  v23 = 711;
  v24 = 2080;
  v25 = v11;
  v26 = 2080;
  v27 = v12;
  v28 = 1024;
  v29 = v6;
  v30 = 1024;
  v31 = v5;
  v32 = 2080;
  v33 = v14;
  _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s startICEConnectionCheck: %s, isCaller = %d, callID = %d, conf = %s", buf, 0x46u);
LABEL_12:
  *(_QWORD *)buf = 0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", objc_msgSend(a3, "connectionData"), *(_QWORD *)off_24D465478, 0);
  LODWORD(v18) = -1;
  v16 = -[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:](self->conf, "startConnectionWithParticipantID:callID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:", objc_msgSend(a3, "fromParticipantID"), v5, v15, v6, 0, 0, objc_msgSend(off_24D465988, "AudioOnlyVCCapabilities"), v18, 0, buf);

  return v16;
}

- (BOOL)getNSError:(id *)a3 code:(int64_t)a4 description:(id)a5 hResult:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  switch((__int16)a6)
  {
    case 14:
      v8 = CFSTR("Data size too large");
      break;
    case 15:
      v8 = CFSTR("Invalid payload");
      break;
    case 16:
      v8 = CFSTR("Unsupported");
      break;
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 31:
    case 32:
      goto LABEL_6;
    case 22:
      v8 = CFSTR("Not found");
      break;
    case 23:
      v8 = CFSTR("Timed out");
      break;
    case 30:
      v8 = CFSTR("Cancelled");
      break;
    case 33:
      v8 = CFSTR("Connection closed");
      break;
    case 34:
      v8 = CFSTR("Bad message");
      break;
    case 35:
      v8 = CFSTR("No transaction");
      break;
    default:
      if ((unsigned __int16)a6 == 3)
      {
        v8 = CFSTR("Out of memory");
      }
      else if ((unsigned __int16)a6 == 47)
      {
        v8 = CFSTR("Declined");
      }
      else
      {
LABEL_6:
        v8 = CFSTR("Internal error");
      }
      break;
  }
  -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", a3, a4, a5, v8, v6, v7);
  return 1;
}

- (BOOL)getNSError:(id *)a3 code:(int64_t)a4 description:(id)a5 reason:(id)a6
{
  void *v9;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v9 = 0;
    if (a5 && a6)
    {
      v11 = objc_alloc(MEMORY[0x24BDBCE70]);
      v9 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", a5, *MEMORY[0x24BDD0FC8], a6, *MEMORY[0x24BDD0FD8], 0);
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", *(_QWORD *)off_24D465740, a4, v9);
    *a3 = v12;
    v13 = v12;
    v14 = *a3;

    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (*a3)
          v17 = (const char *)objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        else
          v17 = "<nil>";
        *(_DWORD *)buf = 136316162;
        v20 = v15;
        v21 = 2080;
        v22 = "-[GKVoiceChatServicePrivate getNSError:code:description:reason:]";
        v23 = 1024;
        v24 = 804;
        v25 = 1024;
        v26 = a4;
        v27 = 2080;
        v28 = v17;
        _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error: %d -- %s.", buf, 0x2Cu);
      }
    }
  }
  return a3 != 0;
}

- (BOOL)isOutputMeteringEnabled
{
  return self->outputMeteringEnabled;
}

- (void)setOutputMeteringEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->outputMeteringEnabled = a3;
  -[NSRecursiveLock lock](self->stateLock, "lock");
  -[VideoConference setOutputMeteringEnabled:](self->conf, "setOutputMeteringEnabled:", v3);
  -[NSRecursiveLock unlock](self->stateLock, "unlock");
}

- (BOOL)isInputMeteringEnabled
{
  return self->inputMeteringEnabled;
}

- (void)setInputMeteringEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->inputMeteringEnabled = a3;
  -[NSRecursiveLock lock](self->stateLock, "lock");
  -[VideoConference setInputMeteringEnabled:](self->conf, "setInputMeteringEnabled:", v3);
  -[NSRecursiveLock unlock](self->stateLock, "unlock");
}

- (float)outputMeterLevel
{
  float result;

  -[VideoConference outputMeterLevel](self->conf, "outputMeterLevel");
  return result;
}

- (float)inputMeterLevel
{
  float result;

  -[VideoConference inputMeterLevel](self->conf, "inputMeterLevel");
  return result;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  -[NSRecursiveLock lock](self->stateLock, "lock");
  self->microphoneMuted = a3;
  -[NSRecursiveLock unlock](self->stateLock, "unlock");
  -[VideoConference setMicrophoneMuted:](self->conf, "setMicrophoneMuted:", self->microphoneMuted);
}

- (BOOL)isMicrophoneMuted
{
  return self->microphoneMuted;
}

- (float)remoteParticipantVolume
{
  float result;

  -[VideoConference conferenceVolume](self->conf, "conferenceVolume");
  return result;
}

- (void)setRemoteParticipantVolume:(float)a3
{
  -[VideoConference setConferenceVolume:](self->conf, "setConferenceVolume:");
}

- (void)setChatMode:(int)a3
{
  self->chatMode = a3;
}

- (int)chatMode
{
  return self->chatMode;
}

- (void)setFocus:(BOOL)a3
{
  self->focus = a3;
}

- (BOOL)isFocus
{
  return self->focus;
}

- (void)forceNoICE:(BOOL)a3
{
  self->forceNoICE = a3;
  -[VideoConference forceNoICE:](self->conf, "forceNoICE:");
}

- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6
{
  _BOOL4 v8;
  uint64_t v10;
  NSObject *v11;
  unsigned int curCallID;
  uint64_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v8 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      curCallID = self->curCallID;
      *(_DWORD *)buf = 136316418;
      v19 = v10;
      v20 = 2080;
      v21 = "-[GKVoiceChatServicePrivate videoConference:didStartSession:withCallID:error:]";
      v22 = 1024;
      v23 = 885;
      v24 = 1024;
      v25 = a5;
      v26 = 1024;
      v27 = curCallID;
      v28 = 1024;
      v29 = curCallID == a5;
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoConference: didStopWithCallID:%d == %d ? %d", buf, 0x2Eu);
    }
  }
  -[NSRecursiveLock lock](self->stateLock, "lock");
  if (self->curCallID == a5 && self->state)
  {
    if (v8)
    {
      self->state = 1;
      -[GKVoiceChatServicePrivate informClientVoiceChatDidStart:](self, "informClientVoiceChatDidStart:", -[GKVoiceChatDictionary participantID](self->outgoingCallDict, "participantID"));
    }
    else
    {
      v15 = -[GKVoiceChatDictionary participantID](self->outgoingCallDict, "participantID", CFSTR("participantID"));
      v16[1] = CFSTR("error");
      v17[0] = v15;
      v17[1] = a6;
      -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
      -[GKVoiceChatServicePrivate resetState](self, "resetState");
    }
  }
  else
  {
    -[VideoConference stopCallID:](self->conf, "stopCallID:");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v19 = v13;
        v20 = 2080;
        v21 = "-[GKVoiceChatServicePrivate videoConference:didStartSession:withCallID:error:]";
        v22 = 1024;
        v23 = 902;
        v24 = 1024;
        v25 = 902;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
      }
    }
  }
  -[NSRecursiveLock unlock](self->stateLock, "unlock");
}

- (void)videoConference:(id)a3 didStopWithCallID:(unsigned int)a4 error:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  unsigned int curCallID;
  id v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      curCallID = self->curCallID;
      *(_DWORD *)buf = 136316418;
      v15 = v8;
      v16 = 2080;
      v17 = "-[GKVoiceChatServicePrivate videoConference:didStopWithCallID:error:]";
      v18 = 1024;
      v19 = 911;
      v20 = 1024;
      v21 = a4;
      v22 = 1024;
      v23 = curCallID;
      v24 = 1024;
      v25 = curCallID == a4;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoConference: didStopWithCallID:%d == %d ? %d", buf, 0x2Eu);
    }
  }
  -[NSRecursiveLock lock](self->stateLock, "lock");
  if (self->curCallID == a4 && self->state)
  {
    v11 = -[GKVoiceChatDictionary participantID](self->outgoingCallDict, "participantID", CFSTR("participantID"));
    v12[1] = CFSTR("error");
    v13[0] = v11;
    v13[1] = a5;
    -[GKVoiceChatServicePrivate performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2), 0);
    -[GKVoiceChatServicePrivate resetState](self, "resetState");
  }
  -[NSRecursiveLock unlock](self->stateLock, "unlock");
}

- (void)setLocalVideoLayer:(void *)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316162;
      v6 = v3;
      v7 = 2080;
      v8 = "-[GKVoiceChatServicePrivate setLocalVideoLayer:]";
      v9 = 1024;
      v10 = 928;
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      v13 = 1024;
      v14 = 928;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
}

- (void)localVideoLayer
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316162;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKVoiceChatServicePrivate localVideoLayer]";
      v9 = 1024;
      v10 = 933;
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      v13 = 1024;
      v14 = 933;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0;
}

- (void)setRemoteVideoLayer:(void *)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316162;
      v6 = v3;
      v7 = 2080;
      v8 = "-[GKVoiceChatServicePrivate setRemoteVideoLayer:]";
      v9 = 1024;
      v10 = 938;
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      v13 = 1024;
      v14 = 938;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
}

- (void)remoteVideoLayer
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316162;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKVoiceChatServicePrivate remoteVideoLayer]";
      v9 = 1024;
      v10 = 943;
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      v13 = 1024;
      v14 = 943;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0;
}

- (double)localFramerate
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316162;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKVoiceChatServicePrivate localFramerate]";
      v9 = 1024;
      v10 = 948;
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      v13 = 1024;
      v14 = 948;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0.0;
}

- (double)localBitrate
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316162;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKVoiceChatServicePrivate localBitrate]";
      v9 = 1024;
      v10 = 953;
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      v13 = 1024;
      v14 = 953;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0.0;
}

- (double)remoteFramerate
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316162;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKVoiceChatServicePrivate remoteFramerate]";
      v9 = 1024;
      v10 = 958;
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      v13 = 1024;
      v14 = 958;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0.0;
}

- (double)remoteBitrate
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316162;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKVoiceChatServicePrivate remoteBitrate]";
      v9 = 1024;
      v10 = 963;
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      v13 = 1024;
      v14 = 963;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0.0;
}

- (id)localDisplayNameForCallID:(unsigned int)a3
{
  return (id)-[GKVoiceChatClient participantID](self->client, "participantID", *(_QWORD *)&a3);
}

- (id)remoteDisplayNameForCallID:(unsigned int)a3
{
  return -[GKVoiceChatDictionary participantID](self->outgoingCallDict, "participantID", *(_QWORD *)&a3);
}

- (int64_t)outputAudioPowerSpectrumToken
{
  return -[VideoConference outputAudioPowerSpectrumToken](self->conf, "outputAudioPowerSpectrumToken");
}

- (id)client
{
  return self->client;
}

- (int)state
{
  return self->state;
}

- (void)setState:(int)a3
{
  self->state = a3;
}

- (GKVoiceChatService)wrapperService
{
  return self->wrapperService;
}

- (void)setWrapperService:(id)a3
{
  self->wrapperService = (GKVoiceChatService *)a3;
}

- (void)createReplyUsingDictionary:(uint64_t)a3 replyCode:(os_log_t)log error:.cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = "-[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:]";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 675;
  *((_WORD *)buf + 14) = 2080;
  *(_QWORD *)(buf + 30) = a1;
  _os_log_error_impl(&dword_215C5C000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Caught exception: %s", buf, 0x26u);
}

@end
