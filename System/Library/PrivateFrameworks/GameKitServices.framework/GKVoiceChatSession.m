@implementation GKVoiceChatSession

- (GKVoiceChatSession)initWithGKSession:(id)a3 sessionName:(id)a4
{
  return -[GKVoiceChatSession initWithGameStateSession:sessionName:](self, "initWithGameStateSession:sessionName:", objc_msgSend(a3, "privateImpl"), a4);
}

- (GKVoiceChatSession)initWithGameStateSession:(id)a3 sessionName:(id)a4
{
  GKVoiceChatSession *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *opaqueSession;
  objc_class *v11;
  const char *Name;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  objc_class *v19;
  const char *v20;
  objc_super v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)GKVoiceChatSession;
  v6 = -[GKVoiceChatSession init](&v22, sel_init);
  if (v6)
  {
    v6->opaqueSession = -[GKVoiceChatSessionInternal initWithGameStateSession:publicWrapper:sessionName:]([GKVoiceChatSessionInternal alloc], "initWithGameStateSession:publicWrapper:sessionName:", a3, v6, a4);
    if ((GKVoiceChatSession *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          opaqueSession = (const __CFString *)v6->opaqueSession;
          v11 = (objc_class *)objc_opt_class();
          Name = class_getName(v11);
          *(_DWORD *)buf = 136316418;
          v24 = v8;
          v25 = 2080;
          v26 = "-[GKVoiceChatSession initWithGameStateSession:sessionName:]";
          v27 = 1024;
          v28 = 41;
          v29 = 2048;
          v30 = opaqueSession;
          v31 = 2080;
          v32 = (void *)Name;
          v33 = 2112;
          v34 = a4;
          v13 = " [%s] %s:%d [%p] GKVoiceChatSession init'd using session=%s with sessionName=%@";
          v14 = v9;
          v15 = 58;
LABEL_12:
          _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[GKVoiceChatSession performSelector:](v6, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_24D466D90;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v6->opaqueSession;
          v19 = (objc_class *)objc_opt_class();
          v20 = class_getName(v19);
          *(_DWORD *)buf = 136316930;
          v24 = v16;
          v25 = 2080;
          v26 = "-[GKVoiceChatSession initWithGameStateSession:sessionName:]";
          v27 = 1024;
          v28 = 41;
          v29 = 2112;
          v30 = v7;
          v31 = 2048;
          v32 = v6;
          v33 = 2048;
          v34 = v18;
          v35 = 2080;
          v36 = v20;
          v37 = 2112;
          v38 = a4;
          v13 = " [%s] %s:%d %@(%p) [%p] GKVoiceChatSession init'd using session=%s with sessionName=%@";
          v14 = v17;
          v15 = 78;
          goto LABEL_12;
        }
      }
    }
  }
  return v6;
}

- (BOOL)didReceiveVoiceChatData:(id)a3 fromPeerID:(id)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  int v16;
  int v17;
  _BYTE v19[24];
  __int128 v20;
  GKVoiceChatSession *v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((GKVoiceChatSession *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[GKVoiceChatSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_24D466D90;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)v19 = 136316418;
    *(_QWORD *)&v19[4] = v13;
    *(_WORD *)&v19[12] = 2080;
    *(_QWORD *)&v19[14] = "-[GKVoiceChatSession didReceiveVoiceChatData:fromPeerID:]";
    *(_WORD *)&v19[22] = 1024;
    LODWORD(v20) = 47;
    WORD2(v20) = 2112;
    *(_QWORD *)((char *)&v20 + 6) = v7;
    HIWORD(v20) = 2048;
    v21 = self;
    LOWORD(v22) = 2112;
    *(_QWORD *)((char *)&v22 + 2) = a4;
    v10 = " [%s] %s:%d %@(%p) GKVoiceChatSession receive data from peerID=%@";
    v11 = v14;
    v12 = 58;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 136315906;
      *(_QWORD *)&v19[4] = v8;
      *(_WORD *)&v19[12] = 2080;
      *(_QWORD *)&v19[14] = "-[GKVoiceChatSession didReceiveVoiceChatData:fromPeerID:]";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 47;
      WORD2(v20) = 2112;
      *(_QWORD *)((char *)&v20 + 6) = a4;
      v10 = " [%s] %s:%d GKVoiceChatSession receive data from peerID=%@";
      v11 = v9;
      v12 = 38;
LABEL_11:
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, v10, v19, v12);
    }
  }
LABEL_12:
  v15 = +[GKOOBMessageFactory newMessageFromData:](GKOOBMessageFactory, "newMessageFromData:", a3, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, v21, v22);
  v16 = objc_msgSend(self->opaqueSession, "conferenceID");
  v17 = objc_msgSend(v15, "conferenceID");
  if (v16 == v17)
    objc_msgSend(self->opaqueSession, "session:didReceiveOOBAudioPacket:fromPeerID:", 0, v15, a4);

  return v16 == v17;
}

- (void)peer:(id)a3 didChangeState:(unsigned int)a4
{
  uint64_t v4;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _BYTE v15[24];
  _BYTE v16[24];
  uint64_t v17;
  id v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x24BDAC8D0];
  if ((GKVoiceChatSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136316162;
        *(_QWORD *)&v15[4] = v8;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[GKVoiceChatSession peer:didChangeState:]";
        *(_WORD *)&v15[22] = 1024;
        *(_DWORD *)v16 = 59;
        *(_WORD *)&v16[4] = 1024;
        *(_DWORD *)&v16[6] = v4;
        *(_WORD *)&v16[10] = 2112;
        *(_QWORD *)&v16[12] = a3;
        v10 = " [%s] %s:%d GKVoiceChatSession connection state=%d change for peerID=%@";
        v11 = v9;
        v12 = 44;
LABEL_11:
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[GKVoiceChatSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_24D466D90;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136316674;
        *(_QWORD *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[GKVoiceChatSession peer:didChangeState:]";
        *(_WORD *)&v15[22] = 1024;
        *(_DWORD *)v16 = 59;
        *(_WORD *)&v16[4] = 2112;
        *(_QWORD *)&v16[6] = v7;
        *(_WORD *)&v16[14] = 2048;
        *(_QWORD *)&v16[16] = self;
        LOWORD(v17) = 1024;
        *(_DWORD *)((char *)&v17 + 2) = v4;
        HIWORD(v17) = 2112;
        v18 = a3;
        v10 = " [%s] %s:%d %@(%p) GKVoiceChatSession connection state=%d change for peerID=%@";
        v11 = v14;
        v12 = 64;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(self->opaqueSession, "session:peer:didChangeState:", 0, a3, v4, *(_OWORD *)v15, *(_QWORD *)&v15[16], *(_OWORD *)v16, *(_QWORD *)&v16[16], v17, v18);
}

- (void)dealloc
{
  id opaqueSession;
  objc_super v4;

  opaqueSession = self->opaqueSession;
  objc_msgSend(opaqueSession, "cleanup");

  self->opaqueSession = 0;
  v4.receiver = self;
  v4.super_class = (Class)GKVoiceChatSession;
  -[GKVoiceChatSession dealloc](&v4, sel_dealloc);
}

- (void)startSession
{
  objc_msgSend(self->opaqueSession, "startSession");
}

- (void)stopSession
{
  objc_msgSend(self->opaqueSession, "stopSession");
}

- (void)setMute:(BOOL)a3 forPeer:(id)a4
{
  objc_msgSend(self->opaqueSession, "setMute:forPeer:", a3, a4);
}

- (BOOL)getMuteStateForPeer:(id)a3
{
  return objc_msgSend(self->opaqueSession, "getMuteStateForPeer:", a3);
}

- (float)outputMeterForPeer:(id)a3
{
  return 0.0;
}

- (GKVoiceChatSessionDelegate)delegate
{
  return (GKVoiceChatSessionDelegate *)objc_msgSend(self->opaqueSession, "delegate");
}

- (void)setDelegate:(id)a3
{
  objc_msgSend(self->opaqueSession, "setDelegate:", a3);
}

- (NSString)sessionName
{
  return (NSString *)objc_msgSend(self->opaqueSession, "sessionName");
}

- (NSArray)peerList
{
  return (NSArray *)objc_msgSend(self->opaqueSession, "peerList");
}

- (BOOL)isActiveSession
{
  return objc_msgSend(self->opaqueSession, "isActiveSession");
}

- (void)setActiveSession:(BOOL)a3
{
  objc_msgSend(self->opaqueSession, "setActiveSession:", a3);
}

- (float)inputMeter
{
  return 0.0;
}

- (float)sessionVolume
{
  float result;

  objc_msgSend(self->opaqueSession, "sessionVolume");
  return result;
}

- (void)setSessionVolume:(float)a3
{
  objc_msgSend(self->opaqueSession, "setSessionVolume:");
}

@end
