@implementation VCTransportStreamGFT

- (VCTransportStreamGFT)initWithTransportSessionID:(unsigned int)a3 options:(id)a4
{
  VCTransportStreamGFT *v5;
  int v6;
  OpaqueCMBlockBuffer *emptyBlockBuffer;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  unsigned int transportSessionID;
  int vtpReceiveSocket;
  int vtpCancelSocket;
  uint64_t v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  VCTransportStreamGFT *v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VCTransportStreamGFT;
  v5 = -[VCTransportStreamGFT init](&v17, sel_init, *(_QWORD *)&a3, a4);
  if (!v5)
    return v5;
  +[VCVTPWrapper startVTP](VCVTPWrapper, "startVTP");
  v6 = VTP_SocketForIDS();
  if (v6 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportStreamGFT initWithTransportSessionID:options:].cold.1(v14, (uint64_t)v5, v15);
    }
    goto LABEL_13;
  }
  v5->_transportSessionID = a3;
  v5->_vtpReceiveSocket = v6;
  v5->_vtpCancelSocket = VTP_Socket(2, 1, 6);
  v5->_vtpCallbackId = -1;
  VTP_SetSocketMode(v5->_vtpReceiveSocket, 2);
  VTP_SetPktType(v5->_vtpReceiveSocket, 0x20000);
  VTP_SetTransportSessionID(v5->_vtpReceiveSocket, v5->_transportSessionID);
  CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0xAuLL, 0, 0, 0, 0xAuLL, 1u, &v5->_emptyBlockBuffer);
  emptyBlockBuffer = v5->_emptyBlockBuffer;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!emptyBlockBuffer)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportStreamGFT initWithTransportSessionID:options:].cold.2();
    }
LABEL_13:

    return 0;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      transportSessionID = v5->_transportSessionID;
      vtpReceiveSocket = v5->_vtpReceiveSocket;
      vtpCancelSocket = v5->_vtpCancelSocket;
      *(_DWORD *)buf = 136316674;
      v19 = v9;
      v20 = 2080;
      v21 = "-[VCTransportStreamGFT initWithTransportSessionID:options:]";
      v22 = 1024;
      v23 = 70;
      v24 = 2048;
      v25 = v5;
      v26 = 1024;
      v27 = transportSessionID;
      v28 = 1024;
      v29 = vtpReceiveSocket;
      v30 = 1024;
      v31 = vtpCancelSocket;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created VCTransportStream object [%p] for sessionID %d, with vfd:%d, vfdCancel:%d", buf, 0x38u);
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  OpaqueCMBlockBuffer *emptyBlockBuffer;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCTransportStreamGFT *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCTransportStreamGFT dealloc]";
      v11 = 1024;
      v12 = 77;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d dealloc [%p]", buf, 0x26u);
    }
  }
  VTP_Close(self->_vtpCancelSocket);
  VTP_Close(self->_vtpReceiveSocket);
  +[VCVTPWrapper stopVTP](VCVTPWrapper, "stopVTP");
  emptyBlockBuffer = self->_emptyBlockBuffer;
  if (emptyBlockBuffer)
  {
    CFRelease(emptyBlockBuffer);
    self->_emptyBlockBuffer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VCTransportStreamGFT;
  -[VCTransportStreamGFT dealloc](&v6, sel_dealloc);
}

- (int)VCTransportStreamSendPacket:(id *)a3
{
  tagVCMediaQueue *mediaQueue;
  int v6;
  double v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  int IDSHeaderSizeWithChannelDataFormatArray;
  uint64_t v13;
  int v14;
  int v15;
  __int128 v16;
  __int128 v17;
  int vtpReceiveSocket;
  _OWORD v20[11];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    mediaQueue = self->_mediaQueue;
    if (mediaQueue)
    {
      *(_QWORD *)&v20[0] = 0;
      v6 = VCMediaQueue_AllocMediaPacket((uint64_t)mediaQueue, a3->var5.streamIDs[0], 1, (uint64_t)v20);
      if (v6 < 0)
      {
        v15 = v6;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTransportStreamGFT VCTransportStreamSendPacket:].cold.2();
        }
      }
      else
      {
        v7 = micro();
        v8 = *(_QWORD *)&v20[0];
        *(double *)(*(_QWORD *)&v20[0] + 272) = v7;
        *(_OWORD *)(v8 + 16) = *(_OWORD *)a3->var5.streamIDs;
        v9 = *(_OWORD *)&a3->var5.streamIDs[8];
        v10 = *(_OWORD *)&a3->var5.participantID;
        v11 = *(_OWORD *)&a3->var5.encryptionSequenceNumber;
        *(_OWORD *)(v8 + 64) = *(_OWORD *)&a3->var5.statsPayload.serverPacketInterval;
        *(_OWORD *)(v8 + 80) = v11;
        *(_OWORD *)(v8 + 32) = v9;
        *(_OWORD *)(v8 + 48) = v10;
        *(_DWORD *)(v8 + 228) = a3->var5.streamIDs[0];
        *(_DWORD *)(v8 + 264) = self->_vtpReceiveSocket;
        *(_DWORD *)(v8 + 232) = self->_transportSessionID;
        *(_DWORD *)(v8 + 176) = 0;
        IDSHeaderSizeWithChannelDataFormatArray = VCIDSChannelData_GetIDSHeaderSizeWithChannelDataFormatArray((uint64_t)&a3->var5, 1u);
        v13 = *(_QWORD *)&v20[0];
        **(_DWORD **)&v20[0] = IDSHeaderSizeWithChannelDataFormatArray;
        *(_QWORD *)(v13 + 8) = self->_emptyBlockBuffer;
        *(_BYTE *)(v13 + 294) = 1;
        VCMediaQueue_AddPacket((uint64_t)self->_mediaQueue, v13);
        v15 = v14;
        if (v14 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTransportStreamGFT VCTransportStreamSendPacket:].cold.3();
        }
      }
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v16 = *(_OWORD *)a3->var5.streamIDs;
      v22 = *(_OWORD *)&a3->var5.streamIDs[8];
      v23 = 0u;
      v17 = *(_OWORD *)&a3->var5.statsPayload.serverPacketInterval;
      v23 = *(_OWORD *)&a3->var5.participantID;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      memset(v20, 0, sizeof(v20));
      v24 = v17;
      v25 = 0u;
      v25 = *(_OWORD *)&a3->var5.encryptionSequenceNumber;
      vtpReceiveSocket = self->_vtpReceiveSocket;
      DWORD2(v20[0]) = self->_transportSessionID;
      v21 = v16;
      BYTE13(v22) = 1;
      VTP_Send(vtpReceiveSocket, a3->var2, a3->var3, a3->var4, (uint64_t)v20);
      return 0;
    }
  }
  else
  {
    v15 = -2144206847;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportStreamGFT VCTransportStreamSendPacket:].cold.1();
    }
  }
  return v15;
}

- (int)receivePacket:(id *)a3
{
  int *p_vtpReceiveSocket;
  unint64_t vtpCancelSocket;
  int vtpReceiveSocket;
  int v8;
  int *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  char *v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v20;
  NSObject *v21;
  char *v22;
  __int128 v23[8];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_vtpReceiveSocket = &self->_vtpReceiveSocket;
  if (self->_vtpReceiveSocket == -1 || (vtpCancelSocket = self->_vtpCancelSocket, (_DWORD)vtpCancelSocket == -1))
  {
    v12 = -2144206806;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportStreamGFT receivePacket:].cold.1();
    }
  }
  else
  {
    memset(v23, 0, sizeof(v23));
    if (__darwin_check_fd_set_overflow(vtpCancelSocket, v23, 0))
      *(_DWORD *)((char *)v23 + ((vtpCancelSocket >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << vtpCancelSocket;
    v9 = &self->_vtpReceiveSocket;
    vtpReceiveSocket = self->_vtpReceiveSocket;
    v8 = v9[1];
    if (__darwin_check_fd_set_overflow(vtpReceiveSocket, v23, 0))
      *(_DWORD *)((char *)v23 + (((unint64_t)vtpReceiveSocket >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << vtpReceiveSocket;
    v10 = *p_vtpReceiveSocket;
    if (*p_vtpReceiveSocket <= v8)
      v10 = v8;
    v11 = VTP_Select((v10 + 1), v23, 0, 0, 0);
    v12 = v11;
    if (v11)
    {
      if (v11 == -1)
      {
        if (*__error() != 9)
          return *__error() | 0xC00F0000;
        return 0;
      }
      v13 = *p_vtpReceiveSocket;
      if (!__darwin_check_fd_set_overflow(*p_vtpReceiveSocket, v23, 0)
        || ((*(_DWORD *)((char *)v23 + (((unint64_t)v13 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v13) & 1) == 0)
      {
        return 0;
      }
      v22 = 0;
      v12 = VTP_Recvfrom(*p_vtpReceiveSocket, &v22);
      if (v12 < 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTransportStreamGFT receivePacket:].cold.2(v20, p_vtpReceiveSocket, v21);
        }
      }
      else
      {
        v14 = v22;
        v15 = v22 + 184;
        *(_OWORD *)a3->var5.streamIDs = *(_OWORD *)(v22 + 360);
        v16 = v15[12];
        v17 = v15[13];
        v18 = v15[15];
        *(_OWORD *)&a3->var5.statsPayload.serverPacketInterval = v15[14];
        *(_OWORD *)&a3->var5.encryptionSequenceNumber = v18;
        *(_OWORD *)&a3->var5.streamIDs[8] = v16;
        *(_OWORD *)&a3->var5.participantID = v17;
        a3->var0 = *((_DWORD *)v14 + 51);
        a3->var1 = *(double *)v14;
        VTP_ReleasePacket((void **)&v22);
      }
    }
  }
  return v12;
}

- (void)VCTransportStreamUnblock
{
  int vtpCancelSocket;

  vtpCancelSocket = self->_vtpCancelSocket;
  if (vtpCancelSocket != -1)
  {
    VTP_Close(vtpCancelSocket);
    self->_vtpCancelSocket = -1;
  }
}

- (int)registerPacketCallbackContext:(void *)a3 callback:(id)a4
{
  unint64_t vtpReceiveSocket;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int vtpCallbackId;
  fd_set *p_readFDsForCallback;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  VCTransportStreamGFT *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    vtpReceiveSocket = self->_vtpReceiveSocket;
    if (vtpReceiveSocket < 0x400)
    {
      if (self->_vtpCallbackId == -1)
      {
        *(_OWORD *)self->_readFDsForCallback.fds_bits = 0u;
        p_readFDsForCallback = &self->_readFDsForCallback;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[24] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[28] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[16] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[20] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[8] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[12] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[4] = 0u;
        if (__darwin_check_fd_set_overflow(vtpReceiveSocket, &self->_readFDsForCallback, 0))
          *(__int32_t *)((char *)p_readFDsForCallback->fds_bits + ((vtpReceiveSocket >> 3) & 0x1FFFFFFC)) |= 1 << vtpReceiveSocket;
        self->_callback = _Block_copy(a4);
        self->_callbackContext = a3;
        v8 = 0;
        self->_vtpCallbackId = VTP_RegisterPacketCallback(self->_readFDsForCallback.fds_bits, (uint64_t)self, &__block_literal_global_102);
      }
      else
      {
        v8 = -2144206844;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            vtpCallbackId = self->_vtpCallbackId;
            v19 = 136316162;
            v20 = v14;
            v21 = 2080;
            v22 = "-[VCTransportStreamGFT registerPacketCallbackContext:callback:]";
            v23 = 1024;
            v24 = 191;
            v25 = 2048;
            v26 = self;
            v27 = 1024;
            LODWORD(v28) = vtpCallbackId;
            _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d transportStream[%p] already registered a vtpCallbackId [%d]", (uint8_t *)&v19, 0x2Cu);
            return -2144206844;
          }
        }
      }
    }
    else
    {
      v8 = -2144206806;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v11 = self->_vtpReceiveSocket;
          v19 = 136316162;
          v20 = v9;
          v21 = 2080;
          v22 = "-[VCTransportStreamGFT registerPacketCallbackContext:callback:]";
          v23 = 1024;
          v24 = 186;
          v25 = 2048;
          v26 = self;
          v27 = 1024;
          LODWORD(v28) = v11;
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d transportStream[%p] socket[%d] is invalid", (uint8_t *)&v19, 0x2Cu);
          return -2144206806;
        }
      }
    }
  }
  else
  {
    v8 = -2144206847;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v19 = 136316418;
        v20 = v12;
        v21 = 2080;
        v22 = "-[VCTransportStreamGFT registerPacketCallbackContext:callback:]";
        v23 = 1024;
        v24 = 181;
        v25 = 2048;
        v26 = self;
        v27 = 2048;
        v28 = a4;
        v29 = 2048;
        v30 = a3;
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d transportStream[%p] callback %p or callback context %p is invalid", (uint8_t *)&v19, 0x3Au);
      }
    }
  }
  return v8;
}

uint64_t __63__VCTransportStreamGFT_registerPacketCallbackContext_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  __int128 v6;
  __int128 v7;
  uint64_t result;
  _BYTE v9[8];
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  bzero(v9, 0x5D8uLL);
  v6 = *(_OWORD *)(a4 + 51);
  v13 = *(_OWORD *)(a4 + 49);
  v14 = v6;
  v15 = *(_OWORD *)(a4 + 53);
  v7 = *(_OWORD *)(a4 + 47);
  v11 = *(_OWORD *)(a4 + 45);
  v12 = v7;
  v9[0] = *((_DWORD *)a4 + 51);
  v10 = *a4;
  result = *(_QWORD *)(a3 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _BYTE *))(result + 16))(result, *(_QWORD *)(a3 + 40), v9);
  return result;
}

- (int)unregisterPacketCallback
{
  int vtpCallbackId;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  VCTransportStreamGFT *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  vtpCallbackId = self->_vtpCallbackId;
  if (vtpCallbackId == -1)
  {
    v4 = -2144206844;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v8 = self->_vtpCallbackId;
        v9 = 136316162;
        v10 = v5;
        v11 = 2080;
        v12 = "-[VCTransportStreamGFT unregisterPacketCallback]";
        v13 = 1024;
        v14 = 210;
        v15 = 2048;
        v16 = self;
        v17 = 1024;
        v18 = v8;
        _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d transportStream[%p] cannot unregister an invalid vtpCallbackId [%d]", (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  else
  {
    VTP_UnregisterPacketCallback(vtpCallbackId);
    _Block_release(self->_callback);
    v4 = 0;
    self->_callback = 0;
    self->_callbackContext = 0;
    self->_vtpCallbackId = -1;
  }
  return v4;
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (void)setMediaQueue:(tagVCMediaQueue *)a3
{
  self->_mediaQueue = a3;
}

- (void)initWithTransportSessionID:(NSObject *)a3 options:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCTransportStreamGFT initWithTransportSessionID:options:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d Could not create VTP socket for VCTransportStream for sessionID=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCTransportStreamGFT initWithTransportSessionID:options:]" >> 16, 49);
  OUTLINED_FUNCTION_3();
}

- (void)initWithTransportSessionID:options:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Out of memory when creating CMBlockBuffer!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)VCTransportStreamSendPacket:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d invalid packet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)VCTransportStreamSendPacket:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportStreamGFT VCTransportStreamSendPacket:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media packet. (%X)", v2, *(const char **)v3, (unint64_t)"-[VCTransportStreamGFT VCTransportStreamSendPacket:]" >> 16, 95);
  OUTLINED_FUNCTION_3();
}

- (void)VCTransportStreamSendPacket:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportStreamGFT VCTransportStreamSendPacket:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add media packet. (%X)", v2, *(const char **)v3, (unint64_t)"-[VCTransportStreamGFT VCTransportStreamSendPacket:]" >> 16, 108);
  OUTLINED_FUNCTION_3();
}

- (void)receivePacket:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid socket, return", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivePacket:(NSObject *)a3 .cold.2(uint64_t a1, int *a2, NSObject *a3)
{
  int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = *a2;
  v6 = *__error() | 0xC00F0000;
  v7 = 136316418;
  v8 = a1;
  v9 = 2080;
  v10 = "-[VCTransportStreamGFT receivePacket:]";
  v11 = 1024;
  v12 = 157;
  v13 = 1024;
  v14 = v5;
  v15 = 1024;
  v16 = v6;
  v17 = 1024;
  v18 = -1;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d VTP_Recvfrom(%d) failed(%08X) for sessionID=%d", (uint8_t *)&v7, 0x2Eu);
}

@end
