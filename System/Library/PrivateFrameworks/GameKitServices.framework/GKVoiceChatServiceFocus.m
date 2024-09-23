@implementation GKVoiceChatServiceFocus

+ (id)defaultVoiceChatService
{
  id result;
  void *v3;

  result = (id)defaultVoiceChatService__GKVoiceChatServiceFocus;
  if (!defaultVoiceChatService__GKVoiceChatServiceFocus)
  {
    v3 = (void *)objc_opt_class();
    objc_sync_enter(v3);
    if (!defaultVoiceChatService__GKVoiceChatServiceFocus)
      defaultVoiceChatService__GKVoiceChatServiceFocus = objc_alloc_init(GKVoiceChatServiceFocus);
    objc_sync_exit(v3);
    return (id)defaultVoiceChatService__GKVoiceChatServiceFocus;
  }
  return result;
}

- (GKVoiceChatServiceFocus)init
{
  GKVoiceChatServiceFocus *v2;
  uint64_t v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)GKVoiceChatServiceFocus;
  v2 = -[GKVoiceChatServicePrivate init](&v6, sel_init);
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v8 = v3;
        v9 = 2080;
        v10 = "-[GKVoiceChatServiceFocus init]";
        v11 = 1024;
        v12 = 49;
        _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServiceFocus...", buf, 0x1Cu);
      }
    }
    v2->outgoingCallDictList = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v2->incomingCallDictList = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v2->incomingUID = (int)arc4random() % 10000;
    -[GKVoiceChatServiceFocus setPacketsPerBundle:](v2, "setPacketsPerBundle:", 4);
    v2->hasMic = 1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->outgoingCallDictList = 0;
  self->incomingCallDictList = 0;

  self->currentFocus = 0;
  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatServiceFocus;
  -[GKVoiceChatServicePrivate dealloc](&v3, sel_dealloc);
}

- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4
{
  int v7;
  GKVoiceChatClient *client;
  const __CFString *v9;
  const __CFString *v10;
  GKVoiceChatServiceFocus *v11;
  id *v12;
  uint64_t v13;
  BOOL v14;
  id v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  if (!self->super.client)
  {
LABEL_5:
    v10 = CFSTR("Client is not set.");
    v9 = CFSTR("Client is nil.");
LABEL_6:
    v11 = self;
    v12 = a4;
    v13 = 32006;
    goto LABEL_7;
  }
  v7 = -[VideoConference matchesOpenSessionForParticipantID:](self->super.conf, "matchesOpenSessionForParticipantID:", a3);
  client = self->super.client;
  if (v7)
  {
    if (client)
    {
      v9 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Already in conference with %@"), a3);
      v10 = CFSTR("Cannot do startVoiceChatWithParticipantID:error:");
      v11 = self;
      v12 = a4;
      v13 = 32012;
LABEL_7:
      -[GKVoiceChatServicePrivate getNSError:code:description:reason:](v11, "getNSError:code:description:reason:", v12, v13, v10, v9);
      -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
      return 0;
    }
    goto LABEL_5;
  }
  if (!-[GKVoiceChatClient participantID](client, "participantID"))
  {
    v10 = CFSTR("Client participantID is not set.");
    v9 = CFSTR("participantID is nil.");
    goto LABEL_6;
  }
  v23 = 0;
  v16 = -[GKVoiceChatServicePrivate createInvite:toParticipant:callID:](self, "createInvite:toParticipant:callID:", a4, a3, &v23);
  v17 = objc_msgSend(v16, "createBlob");
  if (v16)
    v18 = v17 == 0;
  else
    v18 = 1;
  v14 = !v18;
  if (!v18)
  {
    v19 = v17;
    -[GKVoiceChatServicePrivate setState:](self, "setState:", 3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_msgSend((id)objc_msgSend(v16, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        v25 = v20;
        v26 = 2080;
        v27 = "-[GKVoiceChatServiceFocus startVoiceChatWithParticipantID:error:]";
        v28 = 1024;
        v29 = 106;
        v30 = 2080;
        v31 = v22;
        _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OutgoingcallDict = %s", buf, 0x26u);
      }
    }
    -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, v19, a3);
    -[NSMutableArray addObject:](self->outgoingCallDictList, "addObject:", v16);
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  return v14;
}

- (id)dictionaryForNonce:(int64_t)a3 participantID:(id)a4 isIncomingDictonary:(BOOL)a5
{
  _BOOL4 v5;
  int *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v9 = &OBJC_IVAR___GKVoiceChatServiceFocus_outgoingCallDictList;
  if (v5)
    v9 = &OBJC_IVAR___GKVoiceChatServiceFocus_incomingCallDictList;
  v10 = *(Class *)((char *)&self->super.super.isa + *v9);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
LABEL_5:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
      if (objc_msgSend(v15, "matchesNonce:", a3))
      {
        v16 = (void *)(v5 ? objc_msgSend(v15, "fromParticipantID") : objc_msgSend(v15, "participantID"));
        if ((objc_msgSend(v16, "isEqualToString:", a4) & 1) != 0)
          break;
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          goto LABEL_5;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v15 = 0;
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  return v15;
}

- (id)dictionaryForParticipantID:(id)a3 isIncomingDictonary:(BOOL)a4
{
  _BOOL4 v4;
  int *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v7 = &OBJC_IVAR___GKVoiceChatServiceFocus_outgoingCallDictList;
  if (v4)
    v7 = &OBJC_IVAR___GKVoiceChatServiceFocus_incomingCallDictList;
  v8 = *(Class *)((char *)&self->super.super.isa + *v7);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
      v14 = (void *)(v4 ? objc_msgSend(v13, "fromParticipantID") : objc_msgSend(v13, "participantID"));
      if ((objc_msgSend(v14, "isEqualToString:", a3) & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_5;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v13 = 0;
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  return v13;
}

- (id)dictionaryForCallID:(unsigned int)a3 isIncomingDictonary:(BOOL)a4
{
  _BOOL4 v4;
  int *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v7 = &OBJC_IVAR___GKVoiceChatServiceFocus_outgoingCallDictList;
  if (v4)
    v7 = &OBJC_IVAR___GKVoiceChatServiceFocus_incomingCallDictList;
  v8 = *(Class *)((char *)&self->super.super.isa + *v7);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
      if (objc_msgSend(v13, "callID") == a3)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v13 = 0;
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  return v13;
}

- (void)remoteCancelled:(id)a3
{
  if (self->super.client)
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_remoteCancelledProc_, self, a3);
}

- (void)remoteCancelledProc:(id)a3
{
  -[GKVoiceChatServiceFocus stopVoiceChatProc:participantDidCancel:](self, "stopVoiceChatProc:participantDidCancel:", a3, 1);
}

- (void)stopVoiceChatProc:(id)a3
{
  -[GKVoiceChatServiceFocus stopVoiceChatProc:participantDidCancel:](self, "stopVoiceChatProc:participantDidCancel:", a3, 0);
}

- (void)stopVoiceChatProc:(id)a3 participantDidCancel:(BOOL)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int curCallID;
  int state;
  uint64_t v17;
  unsigned int v18;
  VideoConference *conf;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _WORD v29[9];

  *(_QWORD *)&v29[5] = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(MEMORY[0x24BDD1460]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v10 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v10 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v23 = v8;
      v24 = 2080;
      v25 = "-[GKVoiceChatServiceFocus stopVoiceChatProc:participantDidCancel:]";
      v26 = 1024;
      v27 = 218;
      v28 = 2080;
      *(_QWORD *)v29 = v10;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopVoiceChatProc1>:P%s", buf, 0x26u);
    }
  }
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v11 = -[GKVoiceChatServiceFocus openOutgoingDictionaryForParticipantID:](self, "openOutgoingDictionaryForParticipantID:", a3);
  if (v11)
  {
    v12 = v11;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        curCallID = self->super.curCallID;
        state = self->super.state;
        *(_DWORD *)buf = 136316162;
        v23 = v13;
        v24 = 2080;
        v25 = "-[GKVoiceChatServiceFocus stopVoiceChatProc:participantDidCancel:]";
        v26 = 1024;
        v27 = 230;
        v28 = 1024;
        *(_DWORD *)v29 = curCallID;
        v29[2] = 1024;
        *(_DWORD *)&v29[3] = state;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopVoiceChatProc2>: curCallID = %d, state %d", buf, 0x28u);
      }
    }
    v17 = objc_msgSend(v12, "callID");
    v18 = -[VideoConference stateForCallID:](self->super.conf, "stateForCallID:", v17);
    conf = self->super.conf;
    if (a4)
      -[VideoConference remoteCancelledCallID:](conf, "remoteCancelledCallID:", v17);
    else
      -[VideoConference stopCallID:](conf, "stopCallID:", v17);
    if (v18 <= 6 && ((1 << v18) & 0x68) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__GKVoiceChatServiceFocus_stopVoiceChatProc_participantDidCancel___block_invoke;
      block[3] = &unk_24D4661E0;
      block[4] = self;
      block[5] = v12;
      block[6] = a3;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    -[GKVoiceChatServicePrivate resetState](self, "resetState");
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");

}

uint64_t __66__GKVoiceChatServiceFocus_stopVoiceChatProc_participantDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "voiceChatService:sendData:toParticipantID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "cancelDictionary"), "createBlob"), *(_QWORD *)(a1 + 48));
}

- (BOOL)acceptCallID:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  id v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v7 = -[GKVoiceChatServiceFocus dictionaryForCallID:isIncomingDictonary:](self, "dictionaryForCallID:isIncomingDictonary:", v5, 1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
        v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      else
        v10 = "<nil>";
      v16 = 136315906;
      v17 = v8;
      v18 = 2080;
      v19 = "-[GKVoiceChatServiceFocus acceptCallID:error:]";
      v20 = 1024;
      v21 = 281;
      v22 = 2080;
      v23 = v10;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d acceptCallID with dict = %s", (uint8_t *)&v16, 0x26u);
    }
  }
  if (!self->super.client)
  {
    -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", a4, 32006, CFSTR("Client is not set."), CFSTR("Client is nil."));
LABEL_15:
    -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
    return 0;
  }
  if (v7)
  {
    v11 = -[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](self, "createReplyUsingDictionary:replyCode:error:", v7, 1, a4);
    v12 = objc_msgSend(v11, "createBlob");
    if (v11)
    {
      v13 = v12;
      if (v12)
      {
        -[NSMutableArray addObject:](self->outgoingCallDictList, "addObject:", v11);
        -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, v13, objc_msgSend(v11, "participantID"));
        -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", v7, 0, objc_msgSend(v11, "callID"));
        -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
        return 1;
      }
    }
    v15 = -[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](self, "createReplyUsingDictionary:replyCode:error:", v7, 2, a4);
    -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, objc_msgSend(v15, "createBlob"), objc_msgSend(v15, "participantID"));
    -[GKVoiceChatServicePrivate resetState](self, "resetState");
    goto LABEL_15;
  }
  -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", a4, 32012, CFSTR("Cannot do acceptCallID:error:"), CFSTR("No active call to accept."));
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  -[GKVoiceChatServicePrivate resetState](self, "resetState");
  -[VideoConference stopCallID:](self->super.conf, "stopCallID:", v5);
  return 0;
}

- (void)denyCallID:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  BOOL v6;
  void *v7;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  GKVoiceChatDictionary *incomingCallDict;
  const char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE buf[12];
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v5 = -[GKVoiceChatServiceFocus dictionaryForCallID:isIncomingDictonary:](self, "dictionaryForCallID:isIncomingDictonary:", v3, 1);
  if (self->super.client)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  }
  else
  {
    v7 = v5;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (ErrorLogLevelForModule >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        incomingCallDict = self->super.incomingCallDict;
        if (incomingCallDict)
          v12 = (const char *)objc_msgSend(-[GKVoiceChatDictionary description](incomingCallDict, "description"), "UTF8String");
        else
          v12 = "<nil>";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v9;
        v17 = 2080;
        v18 = "-[GKVoiceChatServiceFocus denyCallID:]";
        v19 = 1024;
        v20 = 331;
        v21 = 2080;
        v22 = v12;
        _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d denyCallID with dict = %s", buf, 0x26u);
      }
    }
    *(_QWORD *)buf = 0;
    v13 = -[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](self, "createReplyUsingDictionary:replyCode:error:", v7, 2, buf);
    -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, objc_msgSend(v13, "createBlob"), objc_msgSend(v13, "participantID"));
    v15 = objc_msgSend(v7, "fromParticipantID", CFSTR("participantID"));
    -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    -[GKVoiceChatServicePrivate resetState](self, "resetState");
    -[NSMutableArray removeObject:](self->incomingCallDictList, "removeObject:", v7);
    -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  }
}

- (void)receivedData:(id)a3 fromParticipantID:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->super.client)
  {
    -[NSRecursiveLock lock](self->super.stateLock, "lock");
    v7 = +[GKVoiceChatDictionary dictionaryFromData:](GKVoiceChatDictionary, "dictionaryFromData:", a3);
    if (v7)
    {
      v8 = v7;
      if (objc_msgSend(v7, "isInviteDictionary"))
      {
        -[GKVoiceChatServiceFocus processInviteDictionary:fromParticipantID:](self, "processInviteDictionary:fromParticipantID:", v8, a4);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v13 = 136315650;
            v14 = v9;
            v15 = 2080;
            v16 = "-[GKVoiceChatServiceFocus receivedData:fromParticipantID:]";
            v17 = 1024;
            v18 = 364;
            _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finished processing Invite Dictionary...", (uint8_t *)&v13, 0x1Cu);
          }
        }
      }
      else if (objc_msgSend(v8, "isReplyDictionary"))
      {
        -[GKVoiceChatServiceFocus processReplyDict:](self, "processReplyDict:", v8);
      }
      else if (objc_msgSend(v8, "isCancelDictionary"))
      {
        -[GKVoiceChatServiceFocus processCancelDict:](self, "processCancelDict:", v8);
      }
      else if (objc_msgSend(v8, "isFocusDictionary"))
      {
        -[GKVoiceChatServiceFocus processFocusDict:fromParticipantID:](self, "processFocusDict:fromParticipantID:", v8, a4);
      }
      -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315650;
          v14 = v11;
          v15 = 2080;
          v16 = "-[GKVoiceChatServiceFocus receivedData:fromParticipantID:]";
          v17 = 1024;
          v18 = 380;
          _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finished receivedData...", (uint8_t *)&v13, 0x1Cu);
        }
      }
    }
    else
    {
      -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
    }
  }
}

- (BOOL)processInviteDictionaryForTie:(id)a3 fromParticipantID:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v22[12];
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend((id)-[GKVoiceChatClient participantID](self->super.client, "participantID"), "localizedCompare:", a4) == -1;
      v10 = objc_msgSend((id)-[GKVoiceChatClient participantID](self->super.client, "participantID"), "localizedCompare:", a4);
      *(_DWORD *)v22 = 136316162;
      *(_QWORD *)&v22[4] = v7;
      v23 = 2080;
      v24 = "-[GKVoiceChatServiceFocus processInviteDictionaryForTie:fromParticipantID:]";
      v25 = 1024;
      v26 = 387;
      v27 = 1024;
      v28 = v9;
      v29 = 1024;
      v30 = v10 == 1;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [self inviteIsValid:calleeResponse] is YES:isCaller=%d, %d", v22, 0x28u);
    }
  }
  v11 = -[GKVoiceChatServiceFocus openOutgoingDictionaryForParticipantID:](self, "openOutgoingDictionaryForParticipantID:", a4, *(_QWORD *)v22);
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend((id)-[GKVoiceChatClient participantID](self->super.client, "participantID"), "localizedCompare:", a4) == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v22 = 136315650;
          *(_QWORD *)&v22[4] = v17;
          v23 = 2080;
          v24 = "-[GKVoiceChatServiceFocus processInviteDictionaryForTie:fromParticipantID:]";
          v25 = 1024;
          v26 = 398;
          _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am the caller starting ice check", v22, 0x1Cu);
        }
      }
      -[GKVoiceChatServicePrivate setState:](self, "setState:", 5);
      -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, 1, objc_msgSend(v12, "callID"));
      v15 = objc_msgSend(v12, "nonce");
      v16 = a3;
      goto LABEL_19;
    }
    if (objc_msgSend((id)-[GKVoiceChatClient participantID](self->super.client, "participantID"), "localizedCompare:", a4) == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v22 = 136315650;
          *(_QWORD *)&v22[4] = v13;
          v23 = 2080;
          v24 = "-[GKVoiceChatServiceFocus processInviteDictionaryForTie:fromParticipantID:]";
          v25 = 1024;
          v26 = 408;
          _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am the callee starting ice check", v22, 0x1Cu);
        }
      }
      -[GKVoiceChatServicePrivate setState:](self, "setState:", 6);
      -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, 0, objc_msgSend(v12, "callID"));
      v15 = objc_msgSend(a3, "nonce");
      v16 = v12;
      goto LABEL_19;
    }
    v19 = objc_msgSend(a3, "nonce");
    v20 = objc_msgSend(v12, "nonce");
    ++self->incomingUID;
    objc_msgSend(a3, "setCallID:");
    if (v20 < v19)
    {
      -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, 1, objc_msgSend(v12, "callID"));
      v16 = a3;
      v15 = v20;
LABEL_19:
      objc_msgSend(v16, "setNonce:", v15);
      -[NSMutableArray addObject:](self->incomingCallDictList, "addObject:", a3);
      LOBYTE(v11) = 1;
      return (char)v11;
    }
    if (v20 > v19)
    {
      -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, 0, objc_msgSend(v12, "callID"));
      v16 = v12;
      v15 = v19;
      goto LABEL_19;
    }
    LOBYTE(v11) = 0;
  }
  return (char)v11;
}

- (id)openOutgoingDictionaryForParticipantID:(id)a3
{
  NSMutableArray *outgoingCallDictList;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  outgoingCallDictList = self->outgoingCallDictList;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outgoingCallDictList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(outgoingCallDictList);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      if (objc_msgSend((id)objc_msgSend(v10, "participantID"), "isEqualToString:", a3))
      {
        if (-[VideoConference stateForCallID:](self->super.conf, "stateForCallID:", objc_msgSend(v10, "callID")) != 7&& -[VideoConference stateForCallID:](self->super.conf, "stateForCallID:", objc_msgSend(v10, "callID")) != 8)
        {
          break;
        }
      }
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outgoingCallDictList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v10 = 0;
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  return v10;
}

- (BOOL)processInviteDictionary:(id)a3 fromParticipantID:(id)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  int v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  _BYTE v17[12];
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = -[GKVoiceChatServiceFocus openOutgoingDictionaryForParticipantID:](self, "openOutgoingDictionaryForParticipantID:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
        v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      else
        v10 = "<nil>";
      v11 = -[VideoConference stateForCallID:](self->super.conf, "stateForCallID:", objc_msgSend(v7, "callID"));
      *(_DWORD *)v17 = 136316162;
      *(_QWORD *)&v17[4] = v8;
      v18 = 2080;
      v19 = "-[GKVoiceChatServiceFocus processInviteDictionary:fromParticipantID:]";
      v20 = 1024;
      v21 = 465;
      v22 = 2080;
      v23 = v10;
      v24 = 1024;
      v25 = v11;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processInviteDictionary:outDict = %s, state = %d", v17, 0x2Cu);
    }
  }
  if (v7)
  {
    if (-[VideoConference stateForCallID:](self->super.conf, "stateForCallID:", objc_msgSend(v7, "callID")) == 3&& -[GKVoiceChatServiceFocus processInviteDictionaryForTie:fromParticipantID:](self, "processInviteDictionaryForTie:fromParticipantID:", a3, a4))
    {
      return 1;
    }
LABEL_18:
    *(_QWORD *)v17 = 0;
    -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, objc_msgSend(-[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](self, "createReplyUsingDictionary:replyCode:error:", a3, 3, v17), "createBlob"), a4);
    return 0;
  }
  v12 = -[GKVoiceChatServiceFocus dictionaryForParticipantID:isIncomingDictonary:](self, "dictionaryForParticipantID:isIncomingDictonary:", a4, 1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v12)
        v15 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
      else
        v15 = "<nil>";
      *(_DWORD *)v17 = 136315906;
      *(_QWORD *)&v17[4] = v13;
      v18 = 2080;
      v19 = "-[GKVoiceChatServiceFocus processInviteDictionary:fromParticipantID:]";
      v20 = 1024;
      v21 = 485;
      v22 = 2080;
      v23 = v15;
      _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processInviteDictionary:otherDict = %s", v17, 0x26u);
    }
  }
  if (v12)
    goto LABEL_18;
  ++self->incomingUID;
  objc_msgSend(a3, "setCallID:");
  -[NSMutableArray addObject:](self->incomingCallDictList, "addObject:", a3);
  -[GKVoiceChatServiceFocus performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientOfInviteFromParticipant_, a3, 0);
  return 1;
}

- (BOOL)processReplyDict:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", objc_msgSend(a3, "nonce"), objc_msgSend(a3, "fromParticipantID"), 0);
  if (v5)
  {
    -[VideoConference matchesOpenSessionForParticipantID:](self->super.conf, "matchesOpenSessionForParticipantID:", objc_msgSend(a3, "fromParticipantID"));
    v12 = 0;
    v6 = objc_msgSend(a3, "fromParticipantID");
    v7 = objc_msgSend(a3, "response");
    if (v7 == 2)
    {
      v8 = CFSTR("%@ has declined your request.");
      v9 = 32011;
    }
    else
    {
      if (v7 != 3)
        goto LABEL_8;
      v8 = CFSTR("%@ is currently busy in another call.");
      v9 = 32008;
    }
    -[VideoConference stopCallID:](self->super.conf, "stopCallID:", objc_msgSend(v5, "callID"));
    -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", &v12, v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v6), CFSTR("Request declined."));
    if (v12)
    {
      v13[0] = CFSTR("participantID");
      v13[1] = CFSTR("error");
      v14[0] = v6;
      v14[1] = v12;
      -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
      -[GKVoiceChatServicePrivate resetState](self, "resetState");
      -[NSMutableArray removeObject:](self->outgoingCallDictList, "removeObject:", v5);
      LOBYTE(v5) = 0;
      return (char)v5;
    }
LABEL_8:
    v10 = objc_msgSend(v5, "callID");
    LOBYTE(v5) = 1;
    -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, 1, v10);
    -[NSMutableArray addObject:](self->incomingCallDictList, "addObject:", a3);
  }
  return (char)v5;
}

- (id)incomingDictionaryMatchingOriginalCallID:(unsigned int)a3 participantID:(id)a4
{
  NSMutableArray *incomingCallDictList;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  incomingCallDictList = self->incomingCallDictList;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](incomingCallDictList, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(incomingCallDictList);
      v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
      if (objc_msgSend((id)objc_msgSend(v12, "fromParticipantID"), "isEqualToString:", a4))
      {
        if (objc_msgSend(v12, "originalCallID") == a3)
          break;
      }
      if (v9 == ++v11)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](incomingCallDictList, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v12 = 0;
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  return v12;
}

- (BOOL)processCancelDict:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "fromParticipantID");
  v6 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", objc_msgSend(a3, "nonce"), v5, 0);
  if (!v6)
    v6 = -[GKVoiceChatServiceFocus openOutgoingDictionaryForParticipantID:](self, "openOutgoingDictionaryForParticipantID:", v5);
  v7 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", objc_msgSend(a3, "nonce"), v5, 1);
  if (v7
    || (v8 = -[GKVoiceChatServiceFocus incomingDictionaryMatchingOriginalCallID:participantID:](self, "incomingDictionaryMatchingOriginalCallID:participantID:", objc_msgSend(a3, "callID"), v5), (v7 = v8) != 0))
  {
    if (v6)
    {
      -[NSMutableArray removeObject:](self->outgoingCallDictList, "removeObject:", v6);
      -[VideoConference remoteCancelledCallID:](self->super.conf, "remoteCancelledCallID:", objc_msgSend(v6, "callID"));
    }
    v10 = 0;
    -[NSMutableArray removeObject:](self->incomingCallDictList, "removeObject:", v7);
    -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", &v10, 32009, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ has cancelled this request."), v5), CFSTR("This request was cancelled."));
    v11[0] = CFSTR("participantID");
    v11[1] = CFSTR("error");
    v12[0] = v5;
    v12[1] = v10;
    -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
    -[GKVoiceChatServicePrivate resetState](self, "resetState");
    LOBYTE(v8) = 1;
  }
  return (char)v8;
}

- (BOOL)processFocusDict:(id)a3 fromParticipantID:(id)a4
{
  unint64_t v7;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", objc_msgSend(a3, "nonce"), a4, 0);
  if (!v7)
    v7 = -[GKVoiceChatServiceFocus openOutgoingDictionaryForParticipantID:](self, "openOutgoingDictionaryForParticipantID:", a4);
  if (-[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", objc_msgSend(a3, "nonce"), a4, 1)|| (unint64_t)-[GKVoiceChatServiceFocus incomingDictionaryMatchingOriginalCallID:participantID:](self, "incomingDictionaryMatchingOriginalCallID:participantID:", objc_msgSend(a3, "callID"), a4) | v7)
  {
    return -[GKVoiceChatServiceFocus processFocusChange:fromParticipantID:](self, "processFocusChange:fromParticipantID:", a3, a4);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v11 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v11 = "<nil>";
      v12 = 136315906;
      v13 = v9;
      v14 = 2080;
      v15 = "-[GKVoiceChatServiceFocus processFocusDict:fromParticipantID:]";
      v16 = 1024;
      v17 = 612;
      v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got focus dict from %s but not in call with them!", (uint8_t *)&v12, 0x26u);
    }
  }
  return 0;
}

- (BOOL)processFocusChange:(id)a3 fromParticipantID:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  NSString *currentFocus;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  NSString *v21;
  NSString *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "isFocus")
    && !-[NSString isEqualToString:](self->currentFocus, "isEqualToString:", a4))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_23;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    currentFocus = self->currentFocus;
    if (currentFocus)
    {
      v13 = -[NSString UTF8String](-[NSString description](currentFocus, "description"), "UTF8String");
      if (a4)
      {
LABEL_13:
        v14 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_22:
        v24 = 136316162;
        v25 = v10;
        v26 = 2080;
        v27 = "-[GKVoiceChatServiceFocus processFocusChange:fromParticipantID:]";
        v28 = 1024;
        v29 = 621;
        v30 = 2080;
        v31 = v13;
        v32 = 2080;
        v33 = v14;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting currentFocus from %s to %s", (uint8_t *)&v24, 0x30u);
LABEL_23:
        v21 = self->currentFocus;
        v22 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", a4);
        self->currentFocus = v22;
        -[VideoConference setCurrentFocus:](self->super.conf, "setCurrentFocus:", v22);
        if (-[GKVoiceChatServicePrivate isFocus](self, "isFocus"))
          -[GKVoiceChatServiceFocus setFocus:](self, "setFocus:", 0);

        return 1;
      }
    }
    else
    {
      v13 = "<nil>";
      if (a4)
        goto LABEL_13;
    }
    v14 = "<nil>";
    goto LABEL_22;
  }
  if (-[NSString isEqualToString:](self->currentFocus, "isEqualToString:", a4)
    && (objc_msgSend(a3, "isFocus") & 1) == 0)
  {
    -[VideoConference setCurrentFocus:](self->super.conf, "setCurrentFocus:", 0);

    self->currentFocus = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (a4)
          v17 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        else
          v17 = "<nil>";
        v24 = 136315906;
        v25 = v15;
        v26 = 2080;
        v27 = "-[GKVoiceChatServiceFocus processFocusChange:fromParticipantID:]";
        v28 = 1024;
        v29 = 636;
        v30 = 2080;
        v31 = v17;
        v18 = " [%s] %s:%d Setting currentFocus from %s to none";
        v19 = v16;
        v20 = 38;
        goto LABEL_28;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v9 = "<nil>";
      v24 = 136316162;
      v25 = v7;
      v26 = 2080;
      v27 = "-[GKVoiceChatServiceFocus processFocusChange:fromParticipantID:]";
      v28 = 1024;
      v29 = 638;
      v30 = 2080;
      v31 = v9;
      v32 = 1024;
      LODWORD(v33) = objc_msgSend(a3, "isFocus");
      v18 = " [%s] %s:%d Focus dict from %s is %d";
      v19 = v8;
      v20 = 44;
LABEL_28:
      _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v24, v20);
    }
  }
  return 1;
}

- (void)sendFocusChange:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *outgoingCallDictList;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  const char *v30;
  _BYTE v31[128];
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  outgoingCallDictList = self->outgoingCallDictList;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outgoingCallDictList, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v7 = 136316162;
    v16 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(outgoingCallDictList);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend((id)objc_msgSend(v11, "focusDictionary:", v3, v16), "createBlob");
        if (v12)
        {
          -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, v12, objc_msgSend(v11, "participantID"));
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              if (objc_msgSend(v11, "participantID"))
                v15 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "participantID"), "description"), "UTF8String");
              else
                v15 = "<nil>";
              *(_DWORD *)buf = v16;
              v22 = v13;
              v23 = 2080;
              v24 = "-[GKVoiceChatServiceFocus sendFocusChange:]";
              v25 = 1024;
              v26 = 649;
              v27 = 1024;
              v28 = v3;
              v29 = 2080;
              v30 = v15;
              _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending focus changed to %d to %s", buf, 0x2Cu);
            }
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outgoingCallDictList, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
    }
    while (v8);
  }
}

- (void)setChatMode:(int)a3
{
  if (self->super.chatMode != a3)
  {
    self->super.chatMode = a3;
    -[VideoConference setChatMode:](self->super.conf, "setChatMode:");
  }
}

- (void)setCurrentFocus:(id)a3
{
  NSString *v5;

  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  if ((objc_msgSend(a3, "isEqualToString:", -[VideoConference currentFocus](self->super.conf, "currentFocus")) & 1) == 0)
  {

    v5 = (NSString *)objc_msgSend(a3, "copy");
    self->currentFocus = v5;
    -[VideoConference setCurrentFocus:](self->super.conf, "setCurrentFocus:", v5);
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
}

- (void)setFocus:(BOOL)a3
{
  _BOOL8 v3;

  if (self->super.focus != a3)
  {
    v3 = a3;
    self->super.focus = a3;
    if (a3)
    {
      -[VideoConference setCurrentFocus:](self->super.conf, "setCurrentFocus:", 0);

      self->currentFocus = 0;
    }
    -[VideoConference setIsFocus:](self->super.conf, "setIsFocus:", v3);
  }
}

- (void)setPacketsPerBundle:(int)a3
{
  self->packetsPerBundle = a3;
  -[VideoConference setPacketsPerBundle:](self->super.conf, "setPacketsPerBundle:");
}

- (int)packetsPerBundle
{
  return self->packetsPerBundle;
}

- (void)setHasMic:(BOOL)a3
{
  self->hasMic = a3;
  -[VideoConference setHasMic:](self->super.conf, "setHasMic:");
}

- (BOOL)hasMic
{
  BOOL result;

  result = -[VideoConference hasMic](self->super.conf, "hasMic");
  self->hasMic = result;
  return result;
}

- (void)updatedMutedPeers:(id)a3 forParticipantID:(id)a4
{
  -[VideoConference updatedMutedPeers:forParticipantID:](self->super.conf, "updatedMutedPeers:forParticipantID:", a3, a4);
}

- (void)updatedConnectedPeers:(id)a3
{
  -[VideoConference updatedConnectedPeers:](self->super.conf, "updatedConnectedPeers:", a3);
}

- (void)setSpeakingDelegate:(id)a3
{
  -[VideoConference setSpeakingDelegate:](self->super.conf, "setSpeakingDelegate:", a3);
}

- (void)setQualityDelegate:(id)a3
{
  -[VideoConference setQualityDelegate:](self->super.conf, "setQualityDelegate:", a3);
}

- (void)setTalkingPeersLimit:(unsigned int)a3
{
  -[VideoConference setTalkingPeersLimit:](self->super.conf, "setTalkingPeersLimit:", *(_QWORD *)&a3);
}

- (void)setIsUsingSuppression:(BOOL)a3
{
  -[VideoConference setIsUsingSuppression:](self->super.conf, "setIsUsingSuppression:", a3);
}

- (void)setShouldTimeoutPackets:(BOOL)a3
{
  -[VideoConference setShouldTimeoutPackets:](self->super.conf, "setShouldTimeoutPackets:", a3);
}

- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6
{
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v10;
  NSObject *v11;
  unsigned int curCallID;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      curCallID = self->super.curCallID;
      *(_DWORD *)buf = 136316418;
      v25 = v10;
      v26 = 2080;
      v27 = "-[GKVoiceChatServiceFocus videoConference:didStartSession:withCallID:error:]";
      v28 = 1024;
      v29 = 739;
      v30 = 1024;
      v31 = v7;
      v32 = 1024;
      v33 = curCallID;
      v34 = 1024;
      v35 = curCallID == v7;
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoConference: didStartWithCallID:%d == %d ? %d", buf, 0x2Eu);
    }
  }
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v13 = -[GKVoiceChatServiceFocus dictionaryForCallID:isIncomingDictonary:](self, "dictionaryForCallID:isIncomingDictonary:", v7, 0);
  if (v13)
  {
    v14 = v13;
    v15 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", objc_msgSend(v13, "nonce"), objc_msgSend(v13, "participantID"), 1);
    if (v8)
    {
      -[GKVoiceChatServicePrivate informClientVoiceChatDidStart:](self, "informClientVoiceChatDidStart:", objc_msgSend(v14, "participantID"));
    }
    else
    {
      if (v15)
        -[NSMutableArray removeObject:](self->incomingCallDictList, "removeObject:", v15);
      -[NSMutableArray removeObject:](self->outgoingCallDictList, "removeObject:", v14);
      if (a6)
      {
        v22[0] = CFSTR("participantID");
        v22[1] = CFSTR("error");
        v23[0] = objc_msgSend(v14, "participantID");
        v23[1] = a6;
        v16 = (void *)MEMORY[0x24BDBCE70];
        v17 = v23;
        v18 = v22;
        v19 = 2;
      }
      else
      {
        v21 = objc_msgSend(v14, "participantID", CFSTR("participantID"));
        v16 = (void *)MEMORY[0x24BDBCE70];
        v17 = &v21;
        v18 = &v20;
        v19 = 1;
      }
      -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19));
      -[GKVoiceChatServicePrivate resetState](self, "resetState");
    }
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
}

- (void)videoConference:(id)a3 didStopWithCallID:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  int ErrorLogLevelForModule;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int curCallID;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BYTE v37[10];
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v6 = *(_QWORD *)&a4;
  v40 = *MEMORY[0x24BDAC8D0];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v9 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      curCallID = self->super.curCallID;
      *(_DWORD *)buf = 136316418;
      v31 = v10;
      v32 = 2080;
      v33 = "-[GKVoiceChatServiceFocus videoConference:didStopWithCallID:error:]";
      v34 = 1024;
      v35 = 770;
      v36 = 1024;
      *(_DWORD *)v37 = v6;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = curCallID;
      v38 = 1024;
      v39 = curCallID == v6;
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoConference: didStopWithCallID:%d == %d ? %d", buf, 0x2Eu);
    }
  }
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v13 = -[GKVoiceChatServiceFocus dictionaryForCallID:isIncomingDictonary:](self, "dictionaryForCallID:isIncomingDictonary:", v6, 0);
  if (v13)
  {
    v14 = v13;
    v15 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", objc_msgSend(v13, "nonce"), objc_msgSend(v13, "participantID"), 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        if (v15)
          v18 = (const char *)objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        else
          v18 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v31 = v16;
        v32 = 2080;
        v33 = "-[GKVoiceChatServiceFocus videoConference:didStopWithCallID:error:]";
        v34 = 1024;
        v35 = 782;
        v36 = 2080;
        *(_QWORD *)v37 = v18;
        _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didStopWithCallID:inDict = %s", buf, 0x26u);
      }
    }
    if (v15)
      -[NSMutableArray removeObject:](self->incomingCallDictList, "removeObject:", v15);
    -[NSMutableArray removeObject:](self->outgoingCallDictList, "removeObject:", v14);
    if (-[NSString isEqualToString:](self->currentFocus, "isEqualToString:", objc_msgSend(v14, "participantID")))
    {
      -[VideoConference setCurrentFocus:](self->super.conf, "setCurrentFocus:", 0);

      self->currentFocus = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(v14, "participantID"))
          v21 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "participantID"), "description"), "UTF8String");
        else
          v21 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v31 = v19;
        v32 = 2080;
        v33 = "-[GKVoiceChatServiceFocus videoConference:didStopWithCallID:error:]";
        v34 = 1024;
        v35 = 795;
        v36 = 2080;
        *(_QWORD *)v37 = v21;
        _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didStopWithCallID: outDict participantID %s", buf, 0x26u);
      }
    }
    if (a5)
    {
      v28[0] = CFSTR("participantID");
      v28[1] = CFSTR("error");
      v29[0] = objc_msgSend(v14, "participantID");
      v29[1] = a5;
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = v29;
      v24 = v28;
      v25 = 2;
    }
    else
    {
      v27 = objc_msgSend(v14, "participantID", CFSTR("participantID"));
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = &v27;
      v24 = &v26;
      v25 = 1;
    }
    -[GKVoiceChatServiceFocus performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25), 0);
    -[GKVoiceChatServicePrivate resetState](self, "resetState");
  }
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
}

- (void)localVideoLayer
{
  return 0;
}

- (void)remoteVideoLayer
{
  return 0;
}

- (double)localFramerate
{
  return 0.0;
}

- (double)localBitrate
{
  return 0.0;
}

- (double)remoteFramerate
{
  return 0.0;
}

- (double)remoteBitrate
{
  return 0.0;
}

- (id)localDisplayNameForCallID:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v5 = -[GKVoiceChatServiceFocus dictionaryForCallID:isIncomingDictonary:](self, "dictionaryForCallID:isIncomingDictonary:", v3, 0);
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      else
        v8 = "<nil>";
      v10 = 136315906;
      v11 = v6;
      v12 = 2080;
      v13 = "-[GKVoiceChatServiceFocus localDisplayNameForCallID:]";
      v14 = 1024;
      v15 = 854;
      v16 = 2080;
      v17 = v8;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d localDisplayNameForCallID: outDict = %s", (uint8_t *)&v10, 0x26u);
    }
  }
  if (objc_msgSend(v5, "localVCPartyID"))
    return (id)objc_msgSend(v5, "localVCPartyID");
  else
    return (id)objc_msgSend(v5, "fromParticipantID");
}

- (id)remoteDisplayNameForCallID:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v5 = -[GKVoiceChatServiceFocus dictionaryForCallID:isIncomingDictonary:](self, "dictionaryForCallID:isIncomingDictonary:", v3, 0);
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      else
        v8 = "<nil>";
      v10 = 136315906;
      v11 = v6;
      v12 = 2080;
      v13 = "-[GKVoiceChatServiceFocus remoteDisplayNameForCallID:]";
      v14 = 1024;
      v15 = 866;
      v16 = 2080;
      v17 = v8;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteDisplayNameForCallID: outDict = %s", (uint8_t *)&v10, 0x26u);
    }
  }
  if (objc_msgSend(v5, "remoteVCPartyID"))
    return (id)objc_msgSend(v5, "remoteVCPartyID");
  else
    return (id)objc_msgSend(v5, "participantID");
}

- (BOOL)isAudioPausedToParticipantID:(id)a3
{
  uint64_t v5;
  VideoConference *v6;

  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v5 = objc_msgSend(-[GKVoiceChatServiceFocus openOutgoingDictionaryForParticipantID:](self, "openOutgoingDictionaryForParticipantID:", a3), "callID");
  v6 = self->super.conf;
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");
  LOBYTE(v5) = -[VideoConference shouldSendAudioForCallID:](self->super.conf, "shouldSendAudioForCallID:", v5);

  return v5 ^ 1;
}

- (void)pauseAudio:(BOOL)a3 toParticipantID:(id)a4
{
  _BOOL4 v5;
  id v7;
  VideoConference *v8;
  uint64_t v9;

  v5 = a3;
  -[NSRecursiveLock lock](self->super.stateLock, "lock");
  v7 = -[GKVoiceChatServiceFocus openOutgoingDictionaryForParticipantID:](self, "openOutgoingDictionaryForParticipantID:", a4);
  v8 = self->super.conf;
  v9 = objc_msgSend(v7, "callID");
  -[NSRecursiveLock unlock](self->super.stateLock, "unlock");

  -[VideoConference setSendAudio:forCallID:](self->super.conf, "setSendAudio:forCallID:", !v5, v9);
}

- (NSString)currentFocus
{
  return self->currentFocus;
}

@end
