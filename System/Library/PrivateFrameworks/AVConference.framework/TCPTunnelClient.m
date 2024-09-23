@implementation TCPTunnelClient

- (void)resetConnection
{
  close(self->_connectedFD);
  self->_connectedFD = -1;
  -[TCPTunnelClient setReceiveHandler:](self, "setReceiveHandler:", 0);
  -[TCPTunnelClient setAllocationResponseHandler:](self, "setAllocationResponseHandler:", 0);
  -[TCPTunnelClient setBindingResponseHandler:](self, "setBindingResponseHandler:", 0);
  -[TCPTunnelClient setDestroyHandler:](self, "setDestroyHandler:", 0);
  -[TCPTunnelClient setTerminationHandler:](self, "setTerminationHandler:", 0);
}

- (void)reportErrorAndTerminate:(int64_t)a3 detail:(int64_t)a4 returnCode:(int64_t)a5 description:(id)a6 reason:(id)a7
{
  void (**v8)(id, _QWORD);
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", v9, a3, a4, a5, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 138), a6, a7);
  v8 = -[TCPTunnelClient terminationHandler](self, "terminationHandler");
  if (v8)
    v8[2](v8, v9[0]);
  self->_isChannelBound = 0;
}

- (void)destroyDispatchTimer
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: timer is deleted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createDispatchTimer:(float)a3 withDetailedError:(int64_t)a4
{
  OS_dispatch_source *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *timer;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD handler[6];
  float v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[TCPTunnelClient destroyDispatchTimer](self, "destroyDispatchTimer");
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  self->_timer = v7;
  if (v7)
  {
    v8 = v7;
    v9 = dispatch_time(0, (unint64_t)(float)(a3 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, (unint64_t)(float)(a3 * 1000000000.0), 0x5F5E100uLL);
    timer = self->_timer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke;
    handler[3] = &unk_1E9E52350;
    v15 = a3;
    handler[4] = self;
    handler[5] = a4;
    dispatch_source_set_event_handler(timer, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    v13 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = v11;
        v18 = 2080;
        v19 = "-[TCPTunnelClient createDispatchTimer:withDetailedError:]";
        v20 = 1024;
        v21 = 179;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: timer is set.", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[TCPTunnelClient createDispatchTimer:withDetailedError:].cold.1();
    }
  }
}

uint64_t __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;

  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke_cold_1(v2, a1);
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke_cold_2(v2, a1);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "destroyDispatchTimer");
  v3 = *(_DWORD **)(a1 + 32);
  if (v3[4])
    v4 = 32022;
  else
    v4 = 32002;
  return objc_msgSend(v3, "reportErrorAndTerminate:detail:returnCode:description:reason:", v4, *(_QWORD *)(a1 + 40), 0, CFSTR("cannot establish TCP TURN channel"), CFSTR("TURN request is timed out"));
}

- (void)processSocketRead
{
  int currentlyReadingDataGoalLength;
  NSUInteger v4;
  size_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  __int128 v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  NSUInteger v14;
  NSMutableData *currentlyReadingMessage;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned __int16 v20;
  int v21;
  int64_t v22;
  uint64_t v23;
  NSObject *v24;
  int64_t v25;
  int v26;
  NSMutableData *v27;
  char *v28;
  int64_t currentPadding;
  NSMutableData *v30;
  unsigned __int16 v31;
  id v32;
  NSObject *queue;
  int currentMsgType;
  __int128 v35;
  _QWORD block[7];
  unsigned __int16 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  currentlyReadingDataGoalLength = self->_currentlyReadingDataGoalLength;
  v4 = -[NSMutableData length](self->_currentlyReadingMessage, "length");
  if (self->_currentlyReadingDataGoalLength)
    v5 = (currentlyReadingDataGoalLength - v4);
  else
    v5 = 4;
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&block[-2] - v6;
  if ((_DWORD)v5)
    memset((char *)&block[-2] - v6, 170, v5);
  v8 = recv(self->_connectedFD, v7, (int)v5, 0);
  v10 = v8;
  if ((v8 + 1) >= 2)
  {
    if (v8 < 1)
      return;
    v12 = 0;
    *(_QWORD *)&v9 = 136316162;
    v35 = v9;
    while (1)
    {
      v13 = v10 - v12;
      if (!self->_currentlyReadingDataGoalLength)
      {
        v14 = -[NSMutableData length](self->_currentlyReadingMessage, "length") + v13;
        currentlyReadingMessage = self->_currentlyReadingMessage;
        if (v14 <= 3)
        {
          -[NSMutableData appendBytes:length:](currentlyReadingMessage, "appendBytes:length:", &v7[v12], v13);
          return;
        }
        if (-[NSMutableData length](currentlyReadingMessage, "length"))
        {
          -[NSMutableData bytes](self->_currentlyReadingMessage, "bytes");
          v16 = -[NSMutableData length](self->_currentlyReadingMessage, "length");
          v17 = 4 - v16;
          *(_DWORD *)buf = -1431655766;
          __memcpy_chk();
          memcpy(&buf[v16], &v7[v12], 4 - v16);
          v18 = *(unsigned __int16 *)buf;
          v19 = bswap32(*(unsigned __int16 *)&buf[2]) >> 16;
        }
        else
        {
          v18 = *(unsigned __int16 *)&v7[v12];
          v19 = bswap32(*(unsigned __int16 *)&v7[v12 + 2]) >> 16;
          v17 = 4;
        }
        self->_currentlyReadingDataGoalLength = v19;
        v12 += v17;
        v20 = __rev16(v18);
        self->_currentMsgType = v20;
        v21 = v20 & 0xC000;
        if (v21 == 0x4000)
        {
          v22 = 4 - (v19 & 3);
          if ((v19 & 3) == 0)
            v22 = 0;
          self->_currentPadding = v22;
          self->_currentlyReadingDataGoalLength = v22 + v19;
        }
        else
        {
          if (v21)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v23 = VRTraceErrorLogLevelToCSTR();
              v24 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                currentMsgType = self->_currentMsgType;
                *(_DWORD *)buf = v35;
                v39 = v23;
                v40 = 2080;
                v41 = "-[TCPTunnelClient processSocketRead]";
                v42 = 1024;
                v43 = 249;
                v44 = 1024;
                v45 = 249;
                v46 = 1024;
                v47 = currentMsgType;
                _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: Unknown types: %d", buf, 0x28u);
              }
            }
          }
          else
          {
            self->_currentlyReadingDataGoalLength = v19 + 20;
            v12 -= 4;
          }
          self->_currentPadding = 0;
        }
        -[NSMutableData setLength:](self->_currentlyReadingMessage, "setLength:", 0, v35);
        v13 = v10 - v12;
      }
      if (v13)
      {
        v25 = self->_currentlyReadingDataGoalLength;
        v26 = v25 - -[NSMutableData length](self->_currentlyReadingMessage, "length");
        v27 = self->_currentlyReadingMessage;
        v28 = &v7[v12];
        if (v13 >= v26)
        {
          -[NSMutableData appendBytes:length:](v27, "appendBytes:length:", v28, v26);
          currentPadding = self->_currentPadding;
          if (currentPadding)
            -[NSMutableData setLength:](self->_currentlyReadingMessage, "setLength:", self->_currentlyReadingDataGoalLength - currentPadding);
          v30 = self->_currentlyReadingMessage;
          v31 = self->_currentMsgType;
          v32 = -[TCPTunnelClient receiveHandler](self, "receiveHandler", (_QWORD)v35);
          queue = self->_queue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __36__TCPTunnelClient_processSocketRead__block_invoke;
          block[3] = &unk_1E9E55A68;
          v37 = v31;
          block[4] = self;
          block[5] = v30;
          block[6] = v32;
          dispatch_async(queue, block);

          self->_currentlyReadingDataGoalLength = 0;
          self->_currentlyReadingMessage = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
        }
        else
        {
          -[NSMutableData appendBytes:length:](v27, "appendBytes:length:", v28, v13);
          v26 = v13;
        }
        v12 += v26;
        if (v12 < v10)
          continue;
      }
      return;
    }
  }
  if (self->_connectState != 1)
  {
    if (self->_isChannelBound)
      v11 = 32022;
    else
      v11 = 32002;
    -[TCPTunnelClient reportErrorAndTerminate:detail:returnCode:description:reason:](self, "reportErrorAndTerminate:detail:returnCode:description:reason:", v11, 316, 0, CFSTR("TCP TURN channel closed"), CFSTR("Socket closed while accepting packets"));
    self->_connectState = 1;
  }
}

uint64_t __36__TCPTunnelClient_processSocketRead__block_invoke(uint64_t result)
{
  if ((*(_WORD *)(result + 56) & 0xC000) == 0x4000)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(result + 48) + 16))(*(_QWORD *)(result + 48), *(_QWORD *)(result + 40), *(_QWORD *)(*(_QWORD *)(result + 32) + 112));
  if ((*(_WORD *)(result + 56) & 0xC000) == 0)
    return objc_msgSend(*(id *)(result + 32), "receivedControlData:", *(_QWORD *)(result + 40));
  return result;
}

- (void)sendTCPData:(const void *)a3 bufSize:(int)a4
{
  int head;
  int v8;
  int v9;
  int v10;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  head = self->_head;
  if (head + a4 - self->_tail > 2048)
    return;
  if (head)
  {
    v8 = 0;
LABEL_4:
    v9 = a4 - v8;
    v10 = self->_head + v9;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v10 > 2048)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        v17 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = self->_head - self->_tail;
            v27 = 136316162;
            v28 = v15;
            v29 = 2080;
            v30 = "-[TCPTunnelClient sendTCPData:bufSize:]";
            v31 = 1024;
            v32 = 339;
            v33 = 1024;
            v34 = v18;
            v35 = 1024;
            v36 = v9;
            _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: shift %d, put %d on write buffer.", (uint8_t *)&v27, 0x28u);
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v26 = self->_head - self->_tail;
          v27 = 136316162;
          v28 = v15;
          v29 = 2080;
          v30 = "-[TCPTunnelClient sendTCPData:bufSize:]";
          v31 = 1024;
          v32 = 339;
          v33 = 1024;
          v34 = v26;
          v35 = 1024;
          v36 = v9;
          _os_log_debug_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d TCPTUNNEL: shift %d, put %d on write buffer.", (uint8_t *)&v27, 0x28u);
        }
      }
      memmove(self->_writeBuf, &self->_writeBuf[self->_tail], self->_head - (uint64_t)self->_tail);
      v24 = self->_head - (uint64_t)self->_tail;
      *(_QWORD *)&self->_head = v24;
      v23 = &self->_writeBuf[v24];
    }
    else
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        v14 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v27 = 136315906;
            v28 = v12;
            v29 = 2080;
            v30 = "-[TCPTunnelClient sendTCPData:bufSize:]";
            v31 = 1024;
            v32 = 333;
            v33 = 1024;
            v34 = v9;
            _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: put %d on write buffer.", (uint8_t *)&v27, 0x22u);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient sendTCPData:bufSize:].cold.1();
        }
      }
      v23 = &self->_writeBuf[self->_head];
    }
    memcpy(v23, (char *)a3 + v8, v9);
    self->_head += v9;
    return;
  }
  v19 = send(self->_connectedFD, a3, a4, 0);
  v8 = v19;
  if (v19 == a4)
    return;
  if (v19 != -1)
  {
LABEL_17:
    if (self->_writeSourceSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_writeSource);
      self->_writeSourceSuspended = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        v22 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v27 = 136315650;
            v28 = v20;
            v29 = 2080;
            v30 = "-[TCPTunnelClient sendTCPData:bufSize:]";
            v31 = 1024;
            v32 = 327;
            _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: wcb resume", (uint8_t *)&v27, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient sendTCPData:bufSize:].cold.2();
        }
      }
    }
    goto LABEL_4;
  }
  if (*__error() == 35)
  {
    v8 = 0;
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[TCPTunnelClient sendTCPData:bufSize:].cold.3();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      -[TCPTunnelClient sendTCPData:bufSize:].cold.4();
    }
  }
  if (self->_isChannelBound)
    v25 = 32022;
  else
    v25 = 32002;
  -[TCPTunnelClient reportErrorAndTerminate:detail:returnCode:description:reason:](self, "reportErrorAndTerminate:detail:returnCode:description:reason:", v25, 318, *__error(), CFSTR("TCP TURN channel closed"), CFSTR("Socket closed while writing"));
}

- (void)processSocketWrite:(unsigned __int8)a3
{
  int v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int head;
  int connectState;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int connectedFD;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int ErrorLogLevelForModule;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSData *allocateReq;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v3 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        head = self->_head;
        v33 = 136315906;
        v34 = v5;
        v35 = 2080;
        v36 = "-[TCPTunnelClient processSocketWrite:]";
        v37 = 1024;
        v38 = 351;
        v39 = 1024;
        v40 = head;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: wcb: %d", (uint8_t *)&v33, 0x22u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[TCPTunnelClient processSocketWrite:].cold.8();
    }
  }
  connectState = self->_connectState;
  if (connectState == 1)
    goto LABEL_46;
  if (!connectState)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v12 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          connectedFD = self->_connectedFD;
          v33 = 136315906;
          v34 = v10;
          v35 = 2080;
          v36 = "-[TCPTunnelClient processSocketWrite:]";
          v37 = 1024;
          v38 = 353;
          v39 = 1024;
          v40 = connectedFD;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: socket is successfully connected %d.", (uint8_t *)&v33, 0x22u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        -[TCPTunnelClient processSocketWrite:].cold.7();
      }
    }
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3 == 1)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        v24 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v33 = 136315650;
            v34 = v22;
            v35 = 2080;
            v36 = "-[TCPTunnelClient processSocketWrite:]";
            v37 = 1024;
            v38 = 355;
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: We got a TCP connection!", (uint8_t *)&v33, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient processSocketWrite:].cold.5();
        }
      }
      self->_connectState = 9;
      allocateReq = self->_allocateReq;
      if (allocateReq)
        -[TCPTunnelClient sendTCPData:bufSize:](self, "sendTCPData:bufSize:", -[NSData bytes](allocateReq, "bytes"), -[NSData length](self->_allocateReq, "length"));
    }
    else
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        v27 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v33 = 136315650;
            v34 = v25;
            v35 = 2080;
            v36 = "-[TCPTunnelClient processSocketWrite:]";
            v37 = 1024;
            v38 = 361;
            _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Start SSL handshake", (uint8_t *)&v33, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient processSocketWrite:].cold.6();
        }
      }
      -[TCPTunnelClient sendTCPData:bufSize:](self, "sendTCPData:bufSize:", &cSSLClientHello_0, 51);
      self->_connectState = 2;
    }
    goto LABEL_46;
  }
  v14 = self->_head;
  if (!(_DWORD)v14)
  {
LABEL_46:
    if (!self->_head && !self->_writeSourceSuspended)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        v31 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v33 = 136315650;
            v34 = v29;
            v35 = 2080;
            v36 = "-[TCPTunnelClient processSocketWrite:]";
            v37 = 1024;
            v38 = 391;
            _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: wcb suspend", (uint8_t *)&v33, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient processSocketWrite:].cold.1();
        }
      }
      dispatch_suspend((dispatch_object_t)self->_writeSource);
      self->_writeSourceSuspended = 1;
    }
    return;
  }
  v15 = send(self->_connectedFD, &self->_writeBuf[self->_tail], v14 - self->_tail, 0);
  if (v15 != -1 || *__error() == 35)
  {
    v16 = self->_head;
    v17 = self->_tail + v15;
    self->_tail = v17;
    if (v17 == v16)
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
            v33 = 136315650;
            v34 = v18;
            v35 = 2080;
            v36 = "-[TCPTunnelClient processSocketWrite:]";
            v37 = 1024;
            v38 = 384;
            _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: reset write buffer", (uint8_t *)&v33, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient processSocketWrite:].cold.2();
        }
      }
      *(_QWORD *)&self->_head = 0;
    }
    goto LABEL_46;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[TCPTunnelClient processSocketWrite:].cold.3();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      -[TCPTunnelClient processSocketWrite:].cold.4();
    }
  }
  if (self->_isChannelBound)
    v32 = 32022;
  else
    v32 = 32002;
  -[TCPTunnelClient reportErrorAndTerminate:detail:returnCode:description:reason:](self, "reportErrorAndTerminate:detail:returnCode:description:reason:", v32, 318, *__error(), CFSTR("TCP TURN channel closed"), CFSTR("Socket closed while writing"));
}

- (void)vcArg:(id)a3 sendControlData:(id)a4 isTypeSSL:(BOOL)a5 withTimeout:(float)a6 withDetail:(int64_t)a7
{
  int connectState;
  NSObject *queue;
  _QWORD *v9;
  _QWORD v10[7];
  float v11;
  _QWORD block[7];
  float v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    connectState = self->_connectState;
    if (connectState == 8)
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke_2;
      v10[3] = &unk_1E9E55A90;
      v10[4] = self;
      v10[5] = a4;
      v11 = a6;
      v10[6] = a7;
      v9 = v10;
      goto LABEL_5;
    }
    if (connectState != 9)
      return;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke;
  block[3] = &unk_1E9E55A90;
  block[4] = self;
  block[5] = a4;
  v13 = a6;
  block[6] = a7;
  v9 = block;
LABEL_5:
  dispatch_async(queue, v9);
}

uint64_t __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke(uint64_t result)
{
  _DWORD *v1;
  uint64_t v2;

  v1 = *(_DWORD **)(result + 32);
  if (v1[2] != 1)
  {
    v2 = result;
    result = objc_msgSend(v1, "sendTCPData:bufSize:", objc_msgSend(*(id *)(result + 40), "bytes"), objc_msgSend(*(id *)(result + 40), "length"));
    if (*(float *)(v2 + 56) > 0.0)
      return objc_msgSend(*(id *)(v2 + 32), "createDispatchTimer:withDetailedError:", *(_QWORD *)(v2 + 48));
  }
  return result;
}

void __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) == 8)
  {
    v2 = (id *)(a1 + 40);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "length") < 0xFFFD)
    {
      *(_WORD *)((char *)&v5 + 3) = bswap32(objc_msgSend(*(id *)(a1 + 40), "length", 66327, v6) + 3) >> 16;
      objc_msgSend(*(id *)(a1 + 32), "sendTCPData:bufSize:", &v5, 8);
      objc_msgSend(*(id *)(a1 + 32), "sendTCPData:bufSize:", objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"));
      if (*(float *)(a1 + 56) > 0.0)
        objc_msgSend(*(id *)(a1 + 32), "createDispatchTimer:withDetailedError:", *(_QWORD *)(a1 + 48));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke_2_cold_1(v3, v2, v4);
    }
  }
}

- (void)receivedControlData:(id)a3
{
  uint64_t v5;
  int ErrorLogLevelForModule;
  uint64_t v7;
  NSObject *v8;
  int isChannelBound;
  __int128 v10;
  void (**v11)(id, NSMutableDictionary *);
  double v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void (**v17)(id, uint64_t);
  double v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD *v23;
  uint64_t STUNAttr;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *queue;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  TCPTunnelClient *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void (**v41)(void);
  _QWORD block[5];
  _QWORD v43[5];
  _QWORD v44[5];
  int v45;
  uint8_t v46[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int128 v52;
  __int128 v53;
  unint64_t v54;
  _BYTE buf[40];
  __int16 v56;
  int v57;
  _WORD __b[576];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  objc_msgSend(a3, "bytes");
  objc_msgSend(a3, "length");
  v5 = ParseSTUNMessage();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((v5 & 0x80000000) == 0)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        isChannelBound = self->_isChannelBound;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[TCPTunnelClient receivedControlData:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 453;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = isChannelBound;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = __b[1];
        v56 = 1024;
        v57 = __b[0];
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: %d, Received TURN message: %x, %x", buf, 0x2Eu);
      }
    }
    switch(__b[1])
    {
      case 9:
        -[TCPTunnelClient destroyDispatchTimer](self, "destroyDispatchTimer");
        if (__b[0] == 256)
        {
          if (self->_connectState == 9)
            v16 = 3;
          else
            v16 = 4;
          if (!self->_isChannelBound)
            self->_isChannelBound = 1;
          v17 = -[TCPTunnelClient bindingResponseHandler](self, "bindingResponseHandler");
          if (v17)
            v17[2](v17, v16);
          v18 = self->_allocationTimestamp - micro() + 30.0;
          v19 = VRTraceGetErrorLogLevelForModule();
          if (v18 >= 0.1)
          {
            if (v19 >= 7)
            {
              v26 = VRTraceErrorLogLevelToCSTR();
              v27 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = v26;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[TCPTunnelClient receivedControlData:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 521;
                *(_WORD *)&buf[28] = 2048;
                *(double *)&buf[30] = v18;
                _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: refreshing after %5.2f seconds", buf, 0x26u);
              }
            }
            v28 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
            queue = self->_queue;
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __39__TCPTunnelClient_receivedControlData___block_invoke_20;
            v43[3] = &unk_1E9E521C0;
            v43[4] = self;
            dispatch_after(v28, queue, v43);
            goto LABEL_84;
          }
          if (v19 >= 7)
          {
            v20 = VRTraceErrorLogLevelToCSTR();
            v21 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = v20;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[TCPTunnelClient receivedControlData:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 510;
              _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: refreshing now.", buf, 0x1Cu);
            }
          }
          v22 = self->_queue;
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __39__TCPTunnelClient_receivedControlData___block_invoke;
          v44[3] = &unk_1E9E521C0;
          v44[4] = self;
          v23 = v44;
LABEL_38:
          dispatch_async(v22, v23);
LABEL_84:
          FreeSTUNMessage();
          return;
        }
        *(_WORD *)buf = -21846;
        ProcessChannelBindErrorResponse();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[TCPTunnelClient receivedControlData:].cold.8();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[TCPTunnelClient receivedControlData:].cold.9();
          }
        }
        if (self->_isChannelBound)
          v30 = 32022;
        else
          v30 = 32002;
        v31 = *(unsigned __int16 *)buf;
        v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ChannelBind Failed: %u"), *(unsigned __int16 *)buf);
        v33 = self;
        v34 = v30;
        v35 = 314;
        break;
      case 4:
        -[TCPTunnelClient destroyDispatchTimer](self, "destroyDispatchTimer");
        if (__b[0] == 256)
        {
          self->_allocationTimestamp = micro();
          STUNAttr = GetSTUNAttr();
          if (STUNAttr && !*(_DWORD *)(STUNAttr + 8))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v39 = VRTraceErrorLogLevelToCSTR();
              v40 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = v39;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[TCPTunnelClient receivedControlData:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 550;
                _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Got TURN terminating response.", buf, 0x1Cu);
              }
            }
            self->_isChannelBound = 0;
            v41 = -[TCPTunnelClient destroyHandler](self, "destroyHandler");
            if (v41)
              v41[2]();
            goto LABEL_84;
          }
          v22 = self->_queue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __39__TCPTunnelClient_receivedControlData___block_invoke_23;
          block[3] = &unk_1E9E521C0;
          block[4] = self;
          v23 = block;
          goto LABEL_38;
        }
        *(_WORD *)buf = -21846;
        ProcessAllocateErrorResponse();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[TCPTunnelClient receivedControlData:].cold.10();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[TCPTunnelClient receivedControlData:].cold.11();
          }
        }
        if (self->_isChannelBound)
          v36 = 32022;
        else
          v36 = 32002;
        v31 = *(unsigned __int16 *)buf;
        v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Refresh Failed: %u"), *(unsigned __int16 *)buf);
        v33 = self;
        v34 = v36;
        v35 = 315;
        break;
      case 3:
        -[TCPTunnelClient destroyDispatchTimer](self, "destroyDispatchTimer");
        if (__b[0] == 256)
        {
          *(_QWORD *)&buf[32] = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)buf = v10;
          *(_OWORD *)&buf[16] = v10;
          v54 = 0xAAAAAAAAAAAAAAAALL;
          v52 = v10;
          v53 = v10;
          v45 = -1431655766;
          if ((ProcessAllocateResponse() & 0x80000000) != 0)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[TCPTunnelClient receivedControlData:].cold.4();
            }
          }
          else
          {
            self->_allocationTimestamp = micro();
            v11 = -[TCPTunnelClient allocationResponseHandler](self, "allocationResponseHandler");
            if (v11)
              v11[2](v11, self->_reqRespDict);
            if (self->_channelBReq)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                v13 = VRTraceErrorLogLevelToCSTR();
                v14 = *MEMORY[0x1E0CF2758];
                v15 = *MEMORY[0x1E0CF2758];
                if (*MEMORY[0x1E0CF2748])
                {
                  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v46 = 136315650;
                    v47 = v13;
                    v48 = 2080;
                    v49 = "-[TCPTunnelClient receivedControlData:]";
                    v50 = 1024;
                    v51 = 475;
                    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: send saved ChannelBinding request now.", v46, 0x1Cu);
                  }
                }
                else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  -[TCPTunnelClient receivedControlData:].cold.5();
                }
              }
              *(float *)&v12 = self->_fTimeout;
              -[TCPTunnelClient vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:](self, "vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:", 0, self->_channelBReq, 0, 309, v12);
            }
          }
          goto LABEL_84;
        }
        *(_WORD *)buf = -21846;
        ProcessAllocateErrorResponse();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[TCPTunnelClient receivedControlData:].cold.6();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[TCPTunnelClient receivedControlData:].cold.7();
          }
        }
        v38 = *(unsigned __int16 *)buf;
        v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allocation Failed: %u"), *(unsigned __int16 *)buf);
        v33 = self;
        v34 = 32002;
        v35 = 313;
        v37 = v38;
        goto LABEL_83;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[TCPTunnelClient receivedControlData:].cold.3();
        }
        goto LABEL_84;
    }
    v37 = v31;
LABEL_83:
    -[TCPTunnelClient reportErrorAndTerminate:detail:returnCode:description:reason:](v33, "reportErrorAndTerminate:detail:returnCode:description:reason:", v34, v35, v37, CFSTR("cannot establish TCP TURN channel"), v32);
    goto LABEL_84;
  }
  if (ErrorLogLevelForModule >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[TCPTunnelClient receivedControlData:].cold.1();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      -[TCPTunnelClient receivedControlData:].cold.2();
    }
  }
  if (self->_isChannelBound)
    v25 = 32022;
  else
    v25 = 32002;
  -[TCPTunnelClient reportErrorAndTerminate:detail:returnCode:description:reason:](self, "reportErrorAndTerminate:detail:returnCode:description:reason:", v25, 312, (int)v5, CFSTR("cannot establish TCP TURN channel"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error parsing TURN message (%08X)"), v5));
}

uint64_t __39__TCPTunnelClient_receivedControlData___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "sendRefreshMsg:error:", 60, v3);
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "terminationHandler");
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v3[0]);
  }
  return result;
}

uint64_t __39__TCPTunnelClient_receivedControlData___block_invoke_20(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "sendRefreshMsg:error:", 60, v3);
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "terminationHandler");
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v3[0]);
  }
  return result;
}

uint64_t __39__TCPTunnelClient_receivedControlData___block_invoke_23(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "monitorBufferPool");
  v3[0] = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "sendChannelBindingMsgWithDict:error:", 0, v3);
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "terminationHandler");
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v3[0]);
  }
  return result;
}

- (void)processSocketReadSSL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_10_9(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: TCP/SSL socket is closed while accepting packets", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

unint64_t __39__TCPTunnelClient_processSocketReadSSL__block_invoke(unint64_t result)
{
  unint64_t v1;
  int v2;
  unsigned __int16 v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v1 = result;
  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int16 *)(result + 56);
  if ((v2 - 20) <= 2)
    return objc_msgSend(*(id *)(result + 32), "receivedSSLConnectionData:recordType:", *(_QWORD *)(result + 40));
  if (v2 == 23)
  {
    result = objc_msgSend(*(id *)(result + 40), "length");
    if (result >= 8)
    {
      v6 = 0;
      result = objc_msgSend(*(id *)(v1 + 40), "getBytes:range:", (char *)&v6 + 2, 3, 2);
      HIWORD(v6) = bswap32(HIWORD(v6)) >> 16;
      if ((HIWORD(v6) & 0xC000) == 0x4000)
      {
        objc_msgSend(*(id *)(v1 + 40), "getBytes:range:", &v6, 5, 2);
        LOWORD(v6) = bswap32((unsigned __int16)v6) >> 16;
        v4 = (void *)MEMORY[0x1E0C99D50];
        v5 = objc_msgSend(*(id *)(v1 + 40), "bytes");
        objc_msgSend(v4, "dataWithBytesNoCopy:length:freeWhenDone:", v5 + 7, (unsigned __int16)v6, 0);
        return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
      }
      else if ((v6 & 0xC0000000) == 0)
      {
        v3 = objc_msgSend(*(id *)(v1 + 40), "length") - 3;
        return objc_msgSend(*(id *)(v1 + 32), "receivedControlData:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(*(id *)(v1 + 40), "bytes") + 3, v3, 0));
      }
    }
  }
  return result;
}

- (void)receivedSSLConnectionData:(id)a3 recordType:(unsigned __int16)a4
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *queue;
  int v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int connectState;
  _QWORD v22[5];
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v23 = -86;
  if (a4 != 22)
  {
    if (a4 == 21)
    {
      v9 = 2;
    }
    else if (a4 == 20)
    {
      if (self->_connectState == 6)
      {
        v5 = 7;
LABEL_24:
        self->_connectState = v5;
        return;
      }
      v9 = 1;
    }
    else
    {
      v9 = 7;
    }
    goto LABEL_19;
  }
  if (self->_connectState == 7)
  {
    self->_connectState = 8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v25 = v6;
          v26 = 2080;
          v27 = "-[TCPTunnelClient receivedSSLConnectionData:recordType:]";
          v28 = 1024;
          v29 = 727;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: SSL enabled channel has set up.", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[TCPTunnelClient receivedSSLConnectionData:recordType:].cold.2();
      }
    }
    if (self->_allocateReq)
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
            *(_DWORD *)buf = 136315650;
            v25 = v18;
            v26 = 2080;
            v27 = "-[TCPTunnelClient receivedSSLConnectionData:recordType:]";
            v28 = 1024;
            v29 = 729;
            _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: send Allocate request in queue now.", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient receivedSSLConnectionData:recordType:].cold.1();
        }
      }
      *(float *)&v17 = self->_fTimeout;
      -[TCPTunnelClient vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:](self, "vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:", 0, self->_allocateReq, 0, 308, v17);
    }
  }
  else
  {
    objc_msgSend(a3, "getBytes:length:", &v23, 1);
    if (v23 != 14)
    {
      if (v23 == 12)
      {
        v9 = 4;
        if (self->_connectState != 3)
          goto LABEL_19;
      }
      else
      {
        if (v23 != 2)
        {
          v9 = 6;
          goto LABEL_19;
        }
        v9 = 3;
        if (self->_connectState != 2)
        {
LABEL_19:
          if (self->_connectState == 1)
            return;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              connectState = self->_connectState;
              *(_DWORD *)buf = 136316418;
              v25 = v10;
              v26 = 2080;
              v27 = "-[TCPTunnelClient receivedSSLConnectionData:recordType:]";
              v28 = 1024;
              v29 = 786;
              v30 = 1024;
              v31 = 786;
              v32 = 1024;
              v33 = v9;
              v34 = 1024;
              v35 = connectState;
              _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: handshake error: %d, %d", buf, 0x2Eu);
            }
          }
          v12 = dispatch_time(0, 500000000);
          queue = self->_queue;
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __56__TCPTunnelClient_receivedSSLConnectionData_recordType___block_invoke;
          v22[3] = &unk_1E9E521C0;
          v22[4] = self;
          dispatch_after(v12, queue, v22);
          v5 = 1;
          goto LABEL_24;
        }
      }
      self->_connectState = v9;
      return;
    }
    v14 = self->_connectState;
    v9 = 5;
    if (v14 == 4)
    {
      self->_connectState = 5;
      v9 = 0;
    }
    v15 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &cSSLClientDone, 109);
    LODWORD(v16) = 0;
    -[TCPTunnelClient vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:](self, "vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:", 0, v15, 1, 321, v16);
    self->_connectState = 6;
    if (v14 != 4)
      goto LABEL_19;
  }
}

uint64_t __56__TCPTunnelClient_receivedSSLConnectionData_recordType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "destroyHandler");
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (TCPTunnelClient)initWithRelayRequestDictionary:(id)a3 withCallID:(unsigned int)a4 relayType:(unsigned __int8)a5 errorCode:(int *)a6
{
  __int16 v8;
  char *v10;
  __int128 v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  int LocalInterfaceListWithOptions;
  int v16;
  uint64_t v17;
  const char *v18;
  uint64_t v20;
  NSObject *v21;
  int v22;
  socklen_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  TCPBufferPool *v32;
  NSObject *v33;
  socklen_t v34;
  int v35;
  int v36;
  uint64_t v37;
  objc_super v38;
  _QWORD block[5];
  __int128 v40;
  int v41;
  char v42;
  unsigned __int8 v43;
  sockaddr v44;
  uint64_t v45;
  int v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  __int128 *v56;
  __int128 v57;
  _OWORD v58[2];
  __int128 v59;
  uint64_t v60;

  v8 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)TCPTunnelClient;
  v10 = -[TCPTunnelClient init](&v38, sel_init);
  if (v10)
  {
    v59 = 0uLL;
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)((char *)v58 + 14) = v11;
    v57 = v11;
    v58[0] = v11;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v14 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v14 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v48 = v12;
        v49 = 2080;
        v50 = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]";
        v51 = 1024;
        v52 = 812;
        v53 = 2080;
        v54 = v14;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: STARTING! %s", buf, 0x26u);
      }
    }
    *((_OWORD *)v10 + 9) = 0u;
    *((_QWORD *)v10 + 22) = 0;
    *((_OWORD *)v10 + 10) = 0u;
    GetIPPortFromDict();
    *((_DWORD *)v10 + 41) = bswap32(*((_DWORD *)v10 + 41));
    *((_QWORD *)v10 + 1) = 0xFFFFFFFF00000000;
    *((_DWORD *)v10 + 4) = 0;
    *((_QWORD *)v10 + 9) = 0;
    *((_QWORD *)v10 + 12) = 0;
    *(_OWORD *)(v10 + 24) = 0u;
    *(_OWORD *)(v10 + 40) = 0u;
    *((_DWORD *)v10 + 26) = 1109262336;
    *((_QWORD *)v10 + 7) = 0;
    *((_QWORD *)v10 + 14) = CFSTR("Dummy");
    *((_WORD *)v10 + 60) = v8 & 0x3FFF | 0x4000;
    *((_QWORD *)v10 + 17) = 0;
    *((_QWORD *)v10 + 27) = 0;
    *((_WORD *)v10 + 112) = 0;
    *((_QWORD *)v10 + 29) = 0;
    *((_QWORD *)v10 + 23) = 0;
    *((_QWORD *)v10 + 24) = 0;
    v37 = 0;
    LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
    if (!LocalInterfaceListWithOptions)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:].cold.1();
      }
      goto LABEL_22;
    }
    v16 = LocalInterfaceListWithOptions;
    if (LocalInterfaceListWithOptions < 1)
    {
      LODWORD(v17) = 0;
    }
    else
    {
      v17 = 0;
      v18 = (const char *)(v37 + 4);
      while (!strncmp(v18, "lo", 2uLL))
      {
        ++v17;
        v18 += 40;
        if (v16 == v17)
          goto LABEL_19;
      }
    }
    if ((_DWORD)v17 == v16)
    {
LABEL_19:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:].cold.2();
      }
LABEL_22:
      *a6 = 324;
      FreeLocalInterfaceList();
      return 0;
    }
    if ((VCNAT64ResolverGetPrefix(v37 + 40 * v17 + 4, &v59) & 0x80000000) != 0
      || !VCNAT64ResolverIsNonzeroPrefix(&v59))
    {
      v22 = 0;
    }
    else
    {
      v36 = 0;
      *(_QWORD *)&v44.sa_len = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v44.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
      nw_nat64_synthesize_v6();
      inet_ntop(30, &v44, (char *)&v57, 0x2Eu);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v48 = v20;
          v49 = 2080;
          v50 = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]";
          v51 = 1024;
          v52 = 870;
          v53 = 2080;
          v54 = (const char *)(v37 + 40 * v17 + 4);
          v55 = 2080;
          v56 = &v57;
          _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: interface %s is behind NAT64 with prefix %s", buf, 0x30u);
        }
      }
      v22 = 1;
    }
    FreeLocalInterfaceList();
    *(_QWORD *)&v44.sa_len = 0;
    *(_QWORD *)&v44.sa_data[6] = 0;
    v46 = 0;
    v45 = 0;
    if (v22)
      v23 = 28;
    else
      v23 = 16;
    if (v22)
      v24 = 30;
    else
      v24 = 2;
    v44.sa_family = v24;
    v25 = socket(v24, 1, 0);
    if ((v25 & 0x80000000) == 0)
    {
      v26 = v25;
      v36 = 1;
      setsockopt(v25, 0xFFFF, 4130, &v36, 4u);
      v35 = 1;
      setsockopt(v26, 6, 1, &v35, 4u);
      v27 = 54004;
      do
      {
        *(_WORD *)v44.sa_data = bswap32(++v27) >> 16;
        v28 = bind(v26, &v44, v23);
      }
      while (v28 && (_WORD)v27 != 0xFFFF);
      if (v28)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:].cold.4();
        }
        v29 = 323;
      }
      else
      {
        v34 = 28;
        getsockname(v26, &v44, &v34);
        inet_ntop(30, &v44.sa_data[6], (char *)&v57, 0x2Eu);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v48 = v30;
            v49 = 2080;
            v50 = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]";
            v51 = 1024;
            v52 = 915;
            v53 = 2080;
            v54 = (const char *)&v57;
            v55 = 1024;
            LODWORD(v56) = bswap32(*(unsigned __int16 *)v44.sa_data) >> 16;
            _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: local IP %s, local port: %d", buf, 0x2Cu);
          }
        }
        v32 = objc_alloc_init(TCPBufferPool);
        *((_QWORD *)v10 + 32) = v32;
        if (v32)
        {
          *((_QWORD *)v10 + 26) = objc_alloc_init(MEMORY[0x1E0C99DF0]);
          *((_QWORD *)v10 + 30) = malloc_type_malloc(0x800uLL, 0xFD4E73ECuLL);
          *((_QWORD *)v10 + 31) = 0;
          *((_QWORD *)v10 + 16) = objc_msgSend(a3, "mutableCopy");
          v33 = dispatch_queue_create("com.apple.viceroy.TCPTunnel", 0);
          *((_QWORD *)v10 + 8) = v33;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke;
          block[3] = &unk_1E9E55AB8;
          v42 = v22;
          block[4] = v10;
          v40 = v59;
          v41 = v26;
          v43 = a5;
          dispatch_async(v33, block);
          return (TCPTunnelClient *)v10;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:].cold.5();
        }
        v29 = 325;
      }
      *a6 = v29;
      close(v26);
      return 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:].cold.3();
    }
    v10 = 0;
    *a6 = 322;
  }
  return (TCPTunnelClient *)v10;
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  id *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char IsOSFaultDisabled;
  NSObject *v18;
  id v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  int v24;
  int ErrorLogLevelForModule;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t (*v35)(uint64_t);
  uint64_t *v36;
  id v37;
  NSObject *v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t v41;
  _QWORD handler[5];
  char v43;
  unsigned int v44;
  socklen_t v45;
  _BYTE buf[40];
  sockaddr v47;
  uint64_t v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v47.sa_len = 0;
  *(_QWORD *)&v47.sa_data[6] = 0;
  v49 = 0;
  v48 = 0;
  v45 = 28;
  if (*(_BYTE *)(a1 + 60))
  {
    v47.sa_family = 30;
    v44 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 164));
    nw_nat64_synthesize_v6();
    v47.sa_len = 28;
    *(_WORD *)v47.sa_data = bswap32(*(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 180)) >> 16;
    *(_QWORD *)&buf[32] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v2;
    *(_OWORD *)&buf[16] = v2;
    SAToIPPORT();
    IPPORTToStringWithSize();
  }
  else
  {
    v47.sa_family = 2;
    IPPORTToStringWithSize();
    IPPORTToSA();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 954;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = &_block_invoke_ipPortStr;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: attempt a TCP connection to %s", buf, 0x26u);
    }
  }
  v5 = fcntl(*(_DWORD *)(a1 + 56), 3, 0);
  fcntl(*(_DWORD *)(a1 + 56), 4, v5 | 4u);
  v6 = (id *)(a1 + 32);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = *(_DWORD *)(a1 + 56);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = dispatch_source_create(MEMORY[0x1E0C80DF0], *(int *)(a1 + 56), 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 80);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_2();
      }
    }
    v19 = *v6;
    v20 = CFSTR("can't create write source.");
    v21 = 318;
    goto LABEL_59;
  }
  v9 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_37;
  handler[3] = &unk_1E9E521E8;
  handler[4] = v7;
  v43 = *(_BYTE *)(a1 + 61);
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  v10 = connect(*(_DWORD *)(a1 + 56), &v47, v45);
  if ((v10 & 0x80000000) != 0)
  {
    v15 = v10;
    if (*__error() != 36)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        v18 = *MEMORY[0x1E0CF2758];
        if ((IsOSFaultDisabled & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_8(v16, v15, v18);
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_9(v16, v15, v18);
        }
      }
      v22 = *v6;
      v23 = *__error();
      v20 = CFSTR("can't connect socket.");
      v19 = v22;
      v21 = 319;
      goto LABEL_60;
    }
  }
  else if (!*((_DWORD *)*v6 + 2))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *((_DWORD *)*v6 + 3);
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]_block_invoke_2";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 980;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v14;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: connect is done immediately %d.", buf, 0x22u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_7();
      }
    }
    v24 = *(unsigned __int8 *)(a1 + 61);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v24 == 1)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        v28 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]_block_invoke";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 982;
            _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: We got a TCP connection!", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_5();
        }
      }
      *((_DWORD *)*v6 + 2) = 9;
      v32 = (void *)*((_QWORD *)*v6 + 23);
      if (v32)
        objc_msgSend(*v6, "sendTCPData:bufSize:", objc_msgSend(v32, "bytes"), objc_msgSend(*((id *)*v6 + 23), "length"));
    }
    else
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        v31 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v29;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]_block_invoke";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 988;
            _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Start SSL handshake", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_6();
        }
      }
      objc_msgSend(*v6, "sendTCPData:bufSize:", &cSSLClientHello_0, 51);
      *((_DWORD *)*v6 + 2) = 2;
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = dispatch_source_create(MEMORY[0x1E0C80DB8], *(int *)(a1 + 56), 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64));
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(NSObject **)(v33 + 72);
  if (!v34)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_3();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_4();
      }
    }
    v19 = *v6;
    v20 = CFSTR("can't create read source.");
    v21 = 316;
LABEL_59:
    v23 = 0;
LABEL_60:
    objc_msgSend(v19, "reportErrorAndTerminate:detail:returnCode:description:reason:", 32002, v21, v23, CFSTR("TCP TURN channel closed"), v20);
    return;
  }
  if (*(_BYTE *)(a1 + 61) == 1)
  {
    v41 = v9;
    v35 = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_43;
    v36 = &v41;
  }
  else
  {
    v40 = v9;
    v35 = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_2;
    v36 = &v40;
  }
  v36[1] = 3221225472;
  v36[2] = (uint64_t)v35;
  v36[3] = (uint64_t)&unk_1E9E521C0;
  v36[4] = v33;
  dispatch_source_set_event_handler(v34, v36);
  v37 = *v6;
  v38 = *((_QWORD *)*v6 + 9);
  v39[0] = v9;
  v39[1] = 3221225472;
  v39[2] = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_3;
  v39[3] = &unk_1E9E521C0;
  v39[4] = v37;
  dispatch_source_set_cancel_handler(v38, v39);
  dispatch_resume(*((dispatch_object_t *)*v6 + 9));
}

uint64_t __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_37(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processSocketWrite:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processSocketRead");
}

uint64_t __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processSocketReadSSL");
}

uint64_t __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetConnection");
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *writeSource;
  NSObject *readSource;
  NSObject *queue;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = v3;
      v11 = 2080;
      v12 = "-[TCPTunnelClient dealloc]";
      v13 = 1024;
      v14 = 1035;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: TCP tunnel released.", buf, 0x1Cu);
    }
  }

  -[TCPTunnelClient destroyDispatchTimer](self, "destroyDispatchTimer");
  writeSource = self->_writeSource;
  if (writeSource)
  {
    dispatch_release(writeSource);
    self->_writeSource = 0;
  }
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_release(readSource);
    self->_readSource = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  free(self->_writeBuf);
  self->_writeBuf = 0;

  v8.receiver = self;
  v8.super_class = (Class)TCPTunnelClient;
  -[TCPTunnelClient dealloc](&v8, sel_dealloc);
}

- (unsigned)connectionType
{
  int connectState;

  connectState = self->_connectState;
  if (connectState == 9)
    return 3;
  else
    return 4 * (connectState == 8);
}

- (BOOL)sendAllocateMsg:(id *)a3
{
  uint64_t Request;
  uint64_t v6;
  uint64_t v7;
  NSObject *queue;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[6];
  int v14;
  unint64_t v15;
  unint64_t v16;
  _BYTE v17[2624];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(v17, 170, sizeof(v17));
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 1472;
  Request = MakeAllocateRequest();
  if ((Request & 0x80000000) != 0)
  {
    v10 = Request;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[TCPTunnelClient sendAllocateMsg:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendAllocateMsg:].cold.2();
      }
    }
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1086);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32002, 302, (int)v10, v11, CFSTR("Sending TCPTunnel Allocate Request failed."), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Make request error: %x."), v10));
    FreeSTUNMessage();
  }
  else
  {
    v6 = STUNEncodeMessage();
    FreeSTUNMessage();
    if ((v6 & 0x80000000) == 0)
    {
      v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, v14);
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__TCPTunnelClient_sendAllocateMsg___block_invoke;
      block[3] = &unk_1E9E52238;
      block[4] = self;
      block[5] = v7;
      dispatch_async(queue, block);
      return 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[TCPTunnelClient sendAllocateMsg:].cold.3();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendAllocateMsg:].cold.4();
      }
    }
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1101);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32002, 303, (int)v6, v12, CFSTR("Sending TCPTunnel Allocate Request failed."), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encode request error: %x."), v6));
  }
  return 0;
}

uint64_t __35__TCPTunnelClient_sendAllocateMsg___block_invoke(uint64_t a1, double a2)
{
  int *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(int **)(a1 + 32);
  if (v3[2] > 7)
  {
    LODWORD(a2) = v3[26];
    return objc_msgSend(v3, "vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:", 0, *(_QWORD *)(a1 + 40), 0, 308, a2);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315650;
          v9 = v4;
          v10 = 2080;
          v11 = "-[TCPTunnelClient sendAllocateMsg:]_block_invoke";
          v12 = 1024;
          v13 = 1110;
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendAllocateMsg: save the message for set-up in progress.", (uint8_t *)&v8, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        __35__TCPTunnelClient_sendAllocateMsg___block_invoke_cold_1();
      }
    }

    result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", *(_QWORD *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = result;
  }
  return result;
}

- (BOOL)sendChannelBindingMsgWithDict:(id)a3 error:(id *)a4
{
  uint64_t ChannelBindRequest;
  uint64_t v8;
  uint64_t v9;
  NSObject *queue;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[6];
  int v18;
  _BYTE v19[2624];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = 1472;
  if (a3)
  {

    self->_relayUpdateDict = (NSDictionary *)objc_msgSend(a3, "copy");
  }
  memset(v19, 170, sizeof(v19));
  ChannelBindRequest = MakeChannelBindRequest();
  if ((ChannelBindRequest & 0x80000000) != 0)
  {
    v12 = ChannelBindRequest;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[TCPTunnelClient sendChannelBindingMsgWithDict:error:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendChannelBindingMsgWithDict:error:].cold.2();
      }
    }
    if (self->_isChannelBound)
      v13 = 32022;
    else
      v13 = 32002;
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1143);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, v13, 304, (int)v12, v14, CFSTR("Sending TCPTunnel ChannelBinding Request failed."), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Make request error: %x."), v12));
    FreeSTUNMessage();
  }
  else
  {
    v8 = STUNEncodeMessage();
    FreeSTUNMessage();
    if ((v8 & 0x80000000) == 0)
    {
      v9 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v19, v18);
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__TCPTunnelClient_sendChannelBindingMsgWithDict_error___block_invoke;
      block[3] = &unk_1E9E52238;
      block[4] = self;
      block[5] = v9;
      dispatch_async(queue, block);
      return 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[TCPTunnelClient sendChannelBindingMsgWithDict:error:].cold.3();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendChannelBindingMsgWithDict:error:].cold.4();
      }
    }
    if (self->_isChannelBound)
      v15 = 32022;
    else
      v15 = 32002;
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1159);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, v15, 305, (int)v8, v16, CFSTR("Sending TCPTunnel ChannelBinding Request failed."), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encode request error: %x."), v8));
  }
  return 0;
}

uint64_t __55__TCPTunnelClient_sendChannelBindingMsgWithDict_error___block_invoke(uint64_t a1, double a2)
{
  int *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(int **)(a1 + 32);
  if (v3[2] > 7)
  {
    LODWORD(a2) = v3[26];
    return objc_msgSend(v3, "vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:", 0, *(_QWORD *)(a1 + 40), 0, 309, a2);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315650;
          v9 = v4;
          v10 = 2080;
          v11 = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]_block_invoke";
          v12 = 1024;
          v13 = 1168;
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendChannelBindingMsgWithDict: save message for set-up in progress.", (uint8_t *)&v8, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        __55__TCPTunnelClient_sendChannelBindingMsgWithDict_error___block_invoke_cold_1();
      }
    }

    result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", *(_QWORD *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = result;
  }
  return result;
}

- (BOOL)sendRefreshMsg:(unsigned int)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[2624];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  memset(v12, 170, sizeof(v12));
  MakeRefreshRequest();
  v6 = STUNEncodeMessage();
  if ((v6 & 0x80000000) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[TCPTunnelClient sendRefreshMsg:error:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendRefreshMsg:error:].cold.2();
      }
    }
    if (self->_isChannelBound)
      v9 = 32022;
    else
      v9 = 32002;
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1199);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, v9, 307, (int)v6, v10, CFSTR("Sending TCPTunnel Refresh Request failed."), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encode request error: %x."), v6));
    FreeSTUNMessage();
  }
  else
  {
    FreeSTUNMessage();
    v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, 1472);
    *(float *)&v8 = self->_fTimeout;
    -[TCPTunnelClient vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:](self, "vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:", 0, v7, 0, 310, v8);
  }
  return (int)v6 >= 0;
}

- (void)vcArg:(id)a3 sendRealTimeData:(id)a4 toParticipantID:(id)a5
{
  unsigned int channelNumber;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int connectState;
  unsigned int v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  char *v17;
  char *v18;
  NSObject *queue;
  _QWORD v20[6];
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  channelNumber = self->_channelNumber;
  v8 = objc_msgSend(a4, "length", a3);
  v9 = v8;
  v10 = 4 - (v8 & 3);
  if ((v8 & 3) == 0)
    v10 = 0;
  connectState = self->_connectState;
  if (connectState == 8)
  {
    v16 = v8 + v10 + 7;
    v12 = (unsigned __int16)(v8 + v10 + 7) + 5;
    v17 = -[TCPBufferPool getBufferFromPool:](self->_bufferPool, "getBufferFromPool:", v12);
    if (!v17)
      return;
    v14 = v17;
    *(_QWORD *)v17 = 66327;
    *(_WORD *)(v17 + 3) = bswap32(v16) >> 16;
    v15 = 8;
    goto LABEL_9;
  }
  if (connectState == 9)
  {
    v12 = (unsigned __int16)v8 + (unsigned __int16)v10 + 4;
    v13 = -[TCPBufferPool getBufferFromPool:](self->_bufferPool, "getBufferFromPool:", v12);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
LABEL_9:
      v18 = &v14[v15];
      *(_WORD *)v18 = bswap32(channelNumber) >> 16;
      *((_WORD *)v18 + 1) = bswap32(v9) >> 16;
      memcpy(v18 + 4, (const void *)objc_msgSend(a4, "bytes"), objc_msgSend(a4, "length"));
      queue = self->_queue;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __58__TCPTunnelClient_vcArg_sendRealTimeData_toParticipantID___block_invoke;
      v20[3] = &unk_1E9E52350;
      v20[4] = self;
      v20[5] = v14;
      v21 = v12;
      dispatch_async(queue, v20);
    }
  }
}

uint64_t __58__TCPTunnelClient_vcArg_sendRealTimeData_toParticipantID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendTCPData:bufSize:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "returnBufferToPool:", *(_QWORD *)(a1 + 40));
}

- (void)unbindChannel
{
  uint64_t v3;
  double v4;
  NSObject *queue;
  _QWORD block[5];
  int v7;
  _BYTE v8[2624];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_connectState != 1)
  {
    if (self->_isChannelBound)
    {
      memset(v8, 170, sizeof(v8));
      v7 = 1472;
      MakeRefreshRequest();
      STUNEncodeMessage();
      FreeSTUNMessage();
      v3 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, 1472);
      *(float *)&v4 = self->_fTimeout;
      -[TCPTunnelClient vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:](self, "vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:", 0, v3, 0, 311, v4);
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __32__TCPTunnelClient_unbindChannel__block_invoke;
      block[3] = &unk_1E9E521C0;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

void __32__TCPTunnelClient_unbindChannel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v1 = VRTraceErrorLogLevelToCSTR();
    v2 = *MEMORY[0x1E0CF2758];
    v3 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136315650;
        v5 = v1;
        v6 = 2080;
        v7 = "-[TCPTunnelClient unbindChannel]_block_invoke";
        v8 = 1024;
        v9 = 1287;
        _os_log_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: TCP channel is unbound.", (uint8_t *)&v4, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      __32__TCPTunnelClient_unbindChannel__block_invoke_cold_1();
    }
  }
}

- (void)closeTunnelSocket
{
  uint64_t v3;
  NSObject *v4;
  int connectedFD;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      connectedFD = self->_connectedFD;
      *(_DWORD *)buf = 136315906;
      v9 = v3;
      v10 = 2080;
      v11 = "-[TCPTunnelClient closeTunnelSocket]";
      v12 = 1024;
      v13 = 1292;
      v14 = 1024;
      v15 = connectedFD;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: closeTunnelSocket %d", buf, 0x22u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__TCPTunnelClient_closeTunnelSocket__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__TCPTunnelClient_closeTunnelSocket__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[10])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      v5 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315650;
          v12 = v3;
          v13 = 2080;
          v14 = "-[TCPTunnelClient closeTunnelSocket]_block_invoke";
          v15 = 1024;
          v16 = 1297;
          _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Canceling the writeSource.", (uint8_t *)&v11, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __36__TCPTunnelClient_closeTunnelSocket__block_invoke_cold_2();
      }
    }
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v6 + 88))
    {
      dispatch_resume(*(dispatch_object_t *)(v6 + 80));
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
      v6 = *(_QWORD *)(a1 + 32);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(v6 + 80));
    v2 = *(_QWORD **)(a1 + 32);
  }
  if (v2[9])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v9 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315650;
          v12 = v7;
          v13 = 2080;
          v14 = "-[TCPTunnelClient closeTunnelSocket]_block_invoke";
          v15 = 1024;
          v16 = 1306;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Canceling the readSource.", (uint8_t *)&v11, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        __36__TCPTunnelClient_closeTunnelSocket__block_invoke_cold_1();
      }
    }
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 72));
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "destroyDispatchTimer");
}

- (BOOL)isTunnelSocketClosed
{
  return self->_connectedFD == -1;
}

- (id)receiveHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setReceiveHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)allocationResponseHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setAllocationResponseHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)bindingResponseHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setBindingResponseHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (id)destroyHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setDestroyHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (id)terminationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setTerminationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)participantID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void)createDispatchTimer:withDetailedError:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: timer is set.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  os_log_t v3;
  const char *v4;
  const char *v5;
  int v6;
  int v7;
  double v8;

  OUTLINED_FUNCTION_20(*(float *)(a2 + 48));
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_5_0(&dword_1D8A54000, v2, v3, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Request timed out after %5.2f sec.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_19();
}

void __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  os_log_t v2;
  uint8_t v3[56];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_20(*(float *)(a2 + 48));
  OUTLINED_FUNCTION_16_2();
  _os_log_fault_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_FAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Request timed out after %5.2f sec.", v3, 0x2Cu);
  OUTLINED_FUNCTION_19();
}

- (void)sendTCPData:bufSize:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendTCPData:bufSize:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: put %d on write buffer.", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendTCPData:bufSize:]" >> 16, 333);
  OUTLINED_FUNCTION_3();
}

- (void)sendTCPData:bufSize:.cold.2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: wcb resume", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendTCPData:bufSize:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: socket error, tear down the connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendTCPData:bufSize:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_10_9(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: socket error, tear down the connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processSocketWrite:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: wcb suspend", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processSocketWrite:.cold.2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: reset write buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processSocketWrite:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Socket error, tear down the connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processSocketWrite:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_10_9(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Socket error, tear down the connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processSocketWrite:.cold.5()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: We got a TCP connection!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processSocketWrite:.cold.6()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: Start SSL handshake", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processSocketWrite:.cold.7()
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
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: socket is successfully connected %d.", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)processSocketWrite:.cold.8()
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
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: wcb: %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke_2_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "length");
  v6 = 136315906;
  v7 = a1;
  v8 = 2080;
  v9 = "-[TCPTunnelClient vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:]_block_invoke_2";
  OUTLINED_FUNCTION_4();
  v10 = 416;
  v11 = 2048;
  v12 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Data length is too large: %lu", (uint8_t *)&v6, 0x26u);
  OUTLINED_FUNCTION_19();
}

- (void)receivedControlData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient receivedControlData:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Error parsing TURN message (%08X)", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient receivedControlData:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient receivedControlData:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_11_8(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Error parsing TURN message (%08X)", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient receivedControlData:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.3()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  LOWORD(v6) = 0;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v1, v2, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: throw away TURN Message(%x).", v3, v4, v5, 581, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: ProcessAllocateResponse failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.5()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: send saved ChannelBinding request now.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for Allocate request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_10_9(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for Allocate request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for ChannelBinding request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_10_9(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for ChannelBinding request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for Refresh request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedControlData:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_10_9(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for Refresh request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedSSLConnectionData:recordType:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: send Allocate request in queue now.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedSSLConnectionData:recordType:.cold.2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: SSL enabled channel has set up.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Only Carrier interface available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Only Carrier interface available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create socket", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: no port to bind to.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't reserver buffer pool", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create write source.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_10_9(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create write source.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create read source.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_10_9(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create read source.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_5()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: We got a TCP connection!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_6()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: Start SSL handshake", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_7()
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
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: connect is done immediately %d.", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __error();
  v5 = 136316418;
  v6 = a1;
  OUTLINED_FUNCTION_14_7();
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: We can't connect: %d, %d", (uint8_t *)&v5, 0x2Eu);
  OUTLINED_FUNCTION_9_1();
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_9(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __error();
  v5 = 136316418;
  v6 = a1;
  OUTLINED_FUNCTION_14_7();
  _os_log_fault_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_FAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: We can't connect: %d, %d", (uint8_t *)&v5, 0x2Eu);
  OUTLINED_FUNCTION_9_1();
}

- (void)sendAllocateMsg:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendAllocateMsg:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendAllocateMsg: MakeAllocateRequest error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendAllocateMsg:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendAllocateMsg:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendAllocateMsg:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_11_8(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendAllocateMsg: MakeAllocateRequest error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendAllocateMsg:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendAllocateMsg:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendAllocateMsg:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendAllocateMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendAllocateMsg:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendAllocateMsg:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendAllocateMsg:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_11_8(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendAllocateMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendAllocateMsg:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __35__TCPTunnelClient_sendAllocateMsg___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d sendAllocateMsg: save the message for set-up in progress.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendChannelBindingMsgWithDict:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendChannelBindingMsg: MakeChannelBindRequest error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendChannelBindingMsgWithDict:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_11_8(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendChannelBindingMsg: MakeChannelBindRequest error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendChannelBindingMsgWithDict:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendChannelBindingMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendChannelBindingMsgWithDict:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_11_8(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendChannelBindingMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __55__TCPTunnelClient_sendChannelBindingMsgWithDict_error___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d sendChannelBindingMsgWithDict: save message for set-up in progress.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendRefreshMsg:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendRefreshMsg:error:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendRefreshMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendRefreshMsg:error:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendRefreshMsg:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPTunnelClient sendRefreshMsg:error:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_11_8(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendRefreshMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendRefreshMsg:error:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __32__TCPTunnelClient_unbindChannel__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: TCP channel is unbound.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __36__TCPTunnelClient_closeTunnelSocket__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: Canceling the readSource.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __36__TCPTunnelClient_closeTunnelSocket__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: Canceling the writeSource.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
