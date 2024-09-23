@implementation VCTextReceiver

- (VCTextReceiver)initWithConfiguration:(_VCTextReceiverConfiguration *)a3
{
  char *v4;
  VCTextReceiver *v5;
  unsigned int var1;
  VCTextJitterBuffer *v7;
  uint64_t v8;
  _DWORD v10[2];
  char *v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCTextReceiver;
  v4 = -[VCTextReceiver init](&v12, sel_init);
  v5 = (VCTextReceiver *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 1) = a3->var0;
    *((_DWORD *)v4 + 4) = a3->var1;
    *(int64x2_t *)(v4 + 56) = vdupq_n_s64(0x7FF8000000000000uLL);
    var1 = a3->var1;
    v10[1] = -1431655766;
    v11 = v4;
    v10[0] = var1;
    v7 = -[VCTextJitterBuffer initWithConfiguration:]([VCTextJitterBuffer alloc], "initWithConfiguration:", v10);
    v5->_jitterBuffer = v7;
    if (v7)
    {
      v8 = VCRealTimeThread_Initialize(20, (uint64_t)_VCTextReceiver_ReceiveProc, (uint64_t)v5, "com.apple.avconference.textreceiver.rtprecvproc", 0);
      v5->_receiverThread = (tagVCRealTimeThread *)v8;
      if (v8)
      {
        if (!a3->var2
          || (VCTransportStreamRunLoopVTPCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], &v5->_runLoop) & 0x80000000) == 0)
        {
          return v5;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTextReceiver initWithConfiguration:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTextReceiver initWithConfiguration:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTextReceiver initWithConfiguration:].cold.1();
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  OpaqueVCTransportStreamRunLoop *runLoop;
  void (*v4)(OpaqueVCTransportStreamRunLoop *);
  OpaqueVCTransportStreamRunLoop *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  runLoop = self->_runLoop;
  if (runLoop)
  {
    v4 = *(void (**)(OpaqueVCTransportStreamRunLoop *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v4)
      v4(runLoop);
  }
  VCRealTimeThread_Stop((uint64_t)self->_receiverThread);
  VCRealTimeThread_Finalize((uint64_t)self->_receiverThread);

  self->_jitterBuffer = 0;
  v5 = self->_runLoop;
  if (v5)
    CFRelease(v5);
  objc_storeWeak((id *)&self->_delegate, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = v6;
      v11 = 2080;
      v12 = "-[VCTextReceiver dealloc]";
      v13 = 1024;
      v14 = 75;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d VCTextReceiver cleanup DONE!", buf, 0x1Cu);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)VCTextReceiver;
  -[VCTextReceiver dealloc](&v8, sel_dealloc);
}

- (VCTextReceiverDelegate)delegate
{
  return (VCTextReceiverDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)start
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL result;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  _BYTE v15[24];
  __int128 v16;
  VCTextReceiver *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((VCTextReceiver *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136315650;
        *(_QWORD *)&v15[4] = v4;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCTextReceiver start]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 95;
        v6 = "VCTextReceiver [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCTextReceiver performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136316162;
        *(_QWORD *)&v15[4] = v9;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCTextReceiver start]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 95;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = v3;
        HIWORD(v16) = 2048;
        v17 = self;
        v6 = "VCTextReceiver [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  *(int64x2_t *)&self->_lastReceivedRTPPacketTime = vdupq_n_s64(0x7FF8000000000000uLL);
  if (-[VCTextJitterBuffer start](self->_jitterBuffer, "start", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17))
  {
    if ((VCRealTimeThread_Start((uint64_t)self->_receiverThread) & 1) != 0)
      return 1;
    -[VCTextJitterBuffer stop](self->_jitterBuffer, "stop");
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 5)
    return 0;
  v12 = VRTraceErrorLogLevelToCSTR();
  v13 = *MEMORY[0x1E0CF2758];
  v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v14)
  {
    *(_DWORD *)v15 = 136315650;
    *(_QWORD *)&v15[4] = v12;
    *(_WORD *)&v15[12] = 2080;
    *(_QWORD *)&v15[14] = "-[VCTextReceiver start]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 99;
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d Failed to start jitter buffer", v15, 0x1Cu);
    return 0;
  }
  return result;
}

- (BOOL)stop
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  OpaqueVCTransportStreamRunLoop *runLoop;
  void (*v12)(OpaqueVCTransportStreamRunLoop *);
  int v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCTextReceiver *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCTextReceiver *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315650;
        v16 = v4;
        v17 = 2080;
        v18 = "-[VCTextReceiver stop]";
        v19 = 1024;
        v20 = 114;
        v6 = "VCTextReceiver [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v15, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCTextReceiver performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316162;
        v16 = v9;
        v17 = 2080;
        v18 = "-[VCTextReceiver stop]";
        v19 = 1024;
        v20 = 114;
        v21 = 2112;
        v22 = v3;
        v23 = 2048;
        v24 = self;
        v6 = "VCTextReceiver [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    v12 = *(void (**)(OpaqueVCTransportStreamRunLoop *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v12)
      v12(runLoop);
  }
  v13 = VCRealTimeThread_Stop((uint64_t)self->_receiverThread);
  if (v13)
    -[VCTextJitterBuffer stop](self->_jitterBuffer, "stop");
  return v13;
}

- (void)initializeTextPacket:(tagAudioPacket *)a3 withMediaPacket:(_RTPMediaPacket *)a4
{
  int var0;
  _BOOL4 var9;
  char *var2;
  unint64_t var1;

  var0 = a4->var0;
  a3->var7 = a4->var1;
  a3->var4 = a4->var3;
  a3->var5 = a4->var4;
  a3->var2 = a4->var17;
  a3->var14 = a4->var20.var1;
  var9 = a4->var9;
  a3->var0 = var0;
  a3->var1 = var9;
  var1 = a4->var19.var1;
  var2 = a4->var19.var2;
  a3->var12 = var1;
  memcpy(a3->var11, var2, var1);
}

- (int)retrieveRTPPacket:(tagAudioPacket *)a3
{
  int v5;
  __int128 v6;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v18;
  _DWORD *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v5 = RTPRecvRTP((uint64_t)self->_rtpHandle, &v19);
  if (v5 < 0)
  {
    v7 = (os_log_t *)MEMORY[0x1E0CF2758];
    *(_QWORD *)&v6 = 136315906;
    v18 = v6;
    while (1)
    {
      RTPReleaseRTPPacket((uint64_t)self->_rtpHandle, &v19);
      if ((v5 & 0x40000000) == 0)
        break;
      usleep(0x3A98u);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v21 = v8;
          v22 = 2080;
          v23 = "-[VCTextReceiver retrieveRTPPacket:]";
          v24 = 1024;
          v25 = 152;
          v26 = 1024;
          LODWORD(v27) = v5;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d RTPReceiveRTP returned[%x] sleeping 15000usecs??", buf, 0x22u);
        }
      }
      v19 = 0;
      v5 = RTPRecvRTP((uint64_t)self->_rtpHandle, &v19);
      if ((v5 & 0x80000000) == 0)
        goto LABEL_8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *v7;
      v16 = *v7;
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v21 = v14;
          v22 = 2080;
          v23 = "-[VCTextReceiver retrieveRTPPacket:]";
          v24 = 1024;
          v25 = 154;
          v26 = 1024;
          LODWORD(v27) = v5;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d Received an error %x", buf, 0x22u);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[VCTextReceiver retrieveRTPPacket:].cold.2();
      }
    }
  }
  else
  {
LABEL_8:
    -[VCTextReceiver initializeTextPacket:withMediaPacket:](self, "initializeTextPacket:withMediaPacket:", a3, v19 + 2, v18);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v12 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *((_QWORD *)v19 + 5);
          *(_DWORD *)buf = 136315906;
          v21 = v10;
          v22 = 2080;
          v23 = "-[VCTextReceiver retrieveRTPPacket:]";
          v24 = 1024;
          v25 = 145;
          v26 = 2048;
          v27 = v13;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d received packet time[%f]", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        -[VCTextReceiver retrieveRTPPacket:].cold.1();
      }
    }
    RTPReleaseRTPPacket((uint64_t)self->_rtpHandle, &v19);
  }
  return v5;
}

- (void)receiverThreadCallback:(tagVCRealTimeThreadParameters *)a3
{
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
  OpaqueVCTransportStreamRunLoop *runLoop;
  tagHANDLE **p_rtpHandle;
  char v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  unsigned int v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  VCTextReceiver *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((VCTextReceiver *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_18;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)buf = 136315650;
      v30 = v6;
      v31 = 2080;
      v32 = "-[VCTextReceiver receiverThreadCallback:]";
      v33 = 1024;
      v34 = 162;
      v9 = "VCTextReceiver [%s] %s:%d ";
      v10 = v7;
      v11 = 28;
LABEL_13:
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[VCTextReceiver receiverThreadCallback:].cold.2();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCTextReceiver performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        *(_DWORD *)buf = 136316162;
        v30 = v12;
        v31 = 2080;
        v32 = "-[VCTextReceiver receiverThreadCallback:]";
        v33 = 1024;
        v34 = 162;
        v35 = 2112;
        v36 = v5;
        v37 = 2048;
        v38 = self;
        v9 = "VCTextReceiver [%s] %s:%d %@(%p) ";
        v10 = v13;
        v11 = 48;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        v30 = v12;
        v31 = 2080;
        v32 = "-[VCTextReceiver receiverThreadCallback:]";
        v33 = 1024;
        v34 = 162;
        v35 = 2112;
        v36 = v5;
        v37 = 2048;
        v38 = self;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d %@(%p) ", buf, 0x30u);
      }
    }
  }
LABEL_18:
  v28 = 48;
  runLoop = self->_runLoop;
  p_rtpHandle = &self->_rtpHandle;
  if (runLoop)
  {
    if ((RTPGetReceiveStatusWithRunLoop((uint64_t)p_rtpHandle, &v28, 1, (uint64_t)runLoop) & 0x80000000) == 0)
      goto LABEL_20;
LABEL_25:
    usleep(0x2710u);
    return;
  }
  if ((RTPGetReceiveStatus((uint64_t)p_rtpHandle, &v28, 1, a3->var0) & 0x80000000) != 0)
    goto LABEL_25;
LABEL_20:
  v17 = v28;
  if ((v28 & 0x10) == 0)
    goto LABEL_41;
  if ((VCTextReceiver *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      v21 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[VCTextReceiver receiverThreadCallback:].cold.1();
        goto LABEL_40;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v30 = v19;
        v31 = 2080;
        v32 = "-[VCTextReceiver receiverThreadCallback:]";
        v33 = 1024;
        v34 = 178;
        v22 = "VCTextReceiver [%s] %s:%d Receiving RTP packet";
        v23 = v20;
        v24 = 28;
LABEL_35:
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCTextReceiver performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_40;
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    v27 = *MEMORY[0x1E0CF2758];
    if (!*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        v30 = v25;
        v31 = 2080;
        v32 = "-[VCTextReceiver receiverThreadCallback:]";
        v33 = 1024;
        v34 = 178;
        v35 = 2112;
        v36 = v18;
        v37 = 2048;
        v38 = self;
        _os_log_debug_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d %@(%p) Receiving RTP packet", buf, 0x30u);
      }
      goto LABEL_40;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v30 = v25;
      v31 = 2080;
      v32 = "-[VCTextReceiver receiverThreadCallback:]";
      v33 = 1024;
      v34 = 178;
      v35 = 2112;
      v36 = v18;
      v37 = 2048;
      v38 = self;
      v22 = "VCTextReceiver [%s] %s:%d %@(%p) Receiving RTP packet";
      v23 = v26;
      v24 = 48;
      goto LABEL_35;
    }
  }
LABEL_40:
  -[VCTextReceiver processRTPPacket](self, "processRTPPacket");
  v17 = v28;
LABEL_41:
  if ((v17 & 0x20) != 0)
    -[VCTextReceiver processRTCPPacket](self, "processRTCPPacket");
}

- (void)processRTPPacket
{
  tagAudioPacket *v3;
  _QWORD v4[102];

  v4[101] = *MEMORY[0x1E0C80C00];
  v3 = -[VCTextJitterBuffer allocTextPacket](self->_jitterBuffer, "allocTextPacket");
  if (-[VCTextReceiver retrieveRTPPacket:](self, "retrieveRTPPacket:", v3) < 0)
  {
    -[VCTextJitterBuffer releaseTextPacket:](self->_jitterBuffer, "releaseTextPacket:", v3);
  }
  else
  {
    self->_lastReceivedRTPPacketTime = micro();
    bzero(v4, 0x328uLL);
    -[VCTextReceiver splitPacket:packetArray:](self, "splitPacket:packetArray:", v3, v4);
    -[VCTextReceiver validateAndEnqueuePackets:](self, "validateAndEnqueuePackets:", v4);
  }
}

- (void)processRTCPPacket
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTextReceiver processRTCPPacket]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCTextReceiver [%s] %s:%d Failed to retrieve RTCP packet. Error:%x", v2, *(const char **)v3, (unint64_t)"-[VCTextReceiver processRTCPPacket]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (BOOL)isSupportedPayload:(int)a3
{
  NSArray *supportedPayloads;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BOOL4 v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  supportedPayloads = self->_supportedPayloads;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](supportedPayloads, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(supportedPayloads);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "unsignedIntValue") == a3)
        {
          LOBYTE(v9) = 1;
          return v9;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](supportedPayloads, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      if (v6)
        continue;
      break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_12;
  VRTraceErrorLogLevelToCSTR();
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v9)
  {
    -[VCTextReceiver isSupportedPayload:].cold.1();
LABEL_12:
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (void)validateAndEnqueuePackets:(tagAudioPacketArray *)a3
{
  unint64_t v5;
  __int128 v6;
  unint64_t v7;
  os_log_t *v8;
  uint64_t v9;
  os_log_t v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  uint64_t v14;
  os_log_t v15;
  int v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = AudioPacketArray_Next((unint64_t)a3);
  if (v5)
  {
    v7 = v5;
    v8 = (os_log_t *)MEMORY[0x1E0CF2758];
    *(_QWORD *)&v6 = 136315650;
    v17 = v6;
    while (-[VCTextReceiver isSupportedPayload:](self, "isSupportedPayload:", *(unsigned int *)(v7 + 24), v17))
    {
      if (!-[VCTextReceiver enqueuePacket:](self, "enqueuePacket:", v7))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v19 = v9;
            v20 = 2080;
            v21 = "-[VCTextReceiver validateAndEnqueuePackets:]";
            v22 = 1024;
            v23 = 235;
            v11 = v10;
            v12 = "VCTextReceiver [%s] %s:%d Failed to enqueue packet";
            v13 = 28;
            goto LABEL_14;
          }
        }
        goto LABEL_10;
      }
LABEL_11:
      v7 = AudioPacketArray_Next((unint64_t)a3);
      if (!v7)
        return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_DWORD *)(v7 + 24);
        *(_DWORD *)buf = 136315906;
        v19 = v14;
        v20 = 2080;
        v21 = "-[VCTextReceiver validateAndEnqueuePackets:]";
        v22 = 1024;
        v23 = 230;
        v24 = 1024;
        v25 = v16;
        v11 = v15;
        v12 = "VCTextReceiver [%s] %s:%d Payload not supported:%d";
        v13 = 34;
LABEL_14:
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v12, buf, v13);
      }
    }
LABEL_10:
    -[VCTextJitterBuffer releaseTextPacket:](self->_jitterBuffer, "releaseTextPacket:", v7);
    goto LABEL_11;
  }
}

- (void)splitPacket:(tagAudioPacket *)a3 packetArray:(tagAudioPacketArray *)a4
{
  int v7;
  uint64_t v8;
  int *v9;
  tagAudioPacket *v10;
  _OWORD v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3->var7 == 20)
  {
    memset(v11, 0, sizeof(v11));
    v7 = VCAudioRedBuilder_SplitRedAudioPacket((uint64_t)self->_rtpHandle, a3, (uint64_t)v11, 4, self->_sampleRate, 0);
    if (v7 >= 1)
    {
      v8 = v7;
      v9 = (int *)v11;
      do
      {
        v10 = -[VCTextJitterBuffer allocTextPacket](self->_jitterBuffer, "allocTextPacket");
        AudioPacket_initNewPacket((uint64_t)a3, (uint64_t)v10);
        if (VCAudioRedBuilder_UpdateAudioPacketWithRedPayload((uint64_t)v10, v9))
          AudioPacketArray_Append((uint64_t)a4, (uint64_t)v10);
        else
          -[VCTextJitterBuffer releaseTextPacket:](self->_jitterBuffer, "releaseTextPacket:", v10);
        v9 += 8;
        --v8;
      }
      while (v8);
    }
    -[VCTextJitterBuffer releaseTextPacket:](self->_jitterBuffer, "releaseTextPacket:", a3);
  }
  else
  {
    AudioPacketArray_Append((uint64_t)a4, (uint64_t)a3);
  }
}

- (tagAudioFrame)allocFrameWithPacket:(tagAudioPacket *)a3 data:(char *)a4 dataLength:(int)a5 timestamp:(unsigned int)a6
{
  tagAudioFrame *v10;
  tagAudioFrame *v11;
  int var0;

  v10 = -[VCTextJitterBuffer allocTextFrame](self->_jitterBuffer, "allocTextFrame");
  v11 = v10;
  if (v10)
  {
    var0 = a3->var0;
    v10->var0 = 0;
    v10->var1 = var0;
    v10->var11 = 0;
    v10->var3 = a3->var4;
    v10->var2 = a3->var3;
    v10->var4 = a6;
    v10->var6 = a5;
    v10->var12 = a3->var17;
    v10->var14 = a3->var7;
    memcpy(v10->var5, a4, a5);
  }
  return v11;
}

- (BOOL)parsePacket:(tagAudioPacket *)a3
{
  unsigned int var12;
  uint64_t v5;
  NSObject *v6;
  tagAudioFrame *v7;
  int v8;
  const char *v9;
  uint64_t var16;
  uint64_t v11;
  int var14;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3->var7 == 109)
  {
    var12 = a3->var12;
    if (var12 <= 0x465 && a3->var14 < 0x11u)
    {
      v7 = -[VCTextReceiver allocFrameWithPacket:data:dataLength:timestamp:](self, "allocFrameWithPacket:data:dataLength:timestamp:", a3, a3->var11, a3->var12, a3->var5);
      if (v7)
      {
        var16 = a3->var16;
        a3->var16 = var16 + 1;
        a3->var15[var16] = v7;
        LOBYTE(v7) = 1;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_16;
        v11 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if ((_DWORD)v7)
        {
          var14 = a3->var14;
          v14 = 136316162;
          v15 = v11;
          v16 = 2080;
          v17 = "-[VCTextReceiver parsePacket:]";
          v18 = 1024;
          v19 = 307;
          v20 = 1024;
          v21 = var12;
          v22 = 1024;
          v23 = var14;
          v9 = "VCTextReceiver [%s] %s:%d Failed to create frame. Data size: %d, padding len: %u";
          goto LABEL_7;
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      {
LABEL_16:
        LOBYTE(v7) = 0;
        return (char)v7;
      }
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if ((_DWORD)v7)
      {
        v8 = a3->var14;
        v14 = 136316162;
        v15 = v5;
        v16 = 2080;
        v17 = "-[VCTextReceiver parsePacket:]";
        v18 = 1024;
        v19 = 301;
        v20 = 1024;
        v21 = var12;
        v22 = 1024;
        v23 = v8;
        v9 = "VCTextReceiver [%s] %s:%d Unable to fit audio data into the audioFrame buffer. Data size: %d, padding len: %u";
LABEL_7:
        _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v14, 0x28u);
        goto LABEL_16;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_16;
    VRTraceErrorLogLevelToCSTR();
    LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if ((_DWORD)v7)
    {
      -[VCTextReceiver parsePacket:].cold.1();
      goto LABEL_16;
    }
  }
  return (char)v7;
}

- (BOOL)enqueuePacket:(tagAudioPacket *)a3
{
  _BOOL4 v5;

  v5 = -[VCTextReceiver parsePacket:](self, "parsePacket:");
  if (v5)
    -[VCTextJitterBuffer enqueuePacket:](self->_jitterBuffer, "enqueuePacket:", a3);
  return v5;
}

- (void)didDetectMissingFrame
{
  -[VCTextReceiverDelegate didReceiveText:](-[VCTextReceiver delegate](self, "delegate"), "didReceiveText:", CFSTR("\uFFFD"));
}

- (void)didReceiveFrame:(tagAudioFrame *)a3
{
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[24];
  __int128 v29;
  VCTextReceiver *v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3->var14 == 109)
  {
    if (a3->var6 > 0)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3->var5, a3->var6, 4);
      if ((VCTextReceiver *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v28 = 136315650;
            *(_QWORD *)&v28[4] = v8;
            *(_WORD *)&v28[12] = 2080;
            *(_QWORD *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
            *(_WORD *)&v28[22] = 1024;
            LODWORD(v29) = 343;
            v10 = "VCTextReceiver [%s] %s:%d ";
            v11 = v9;
            v12 = 28;
LABEL_19:
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v28, v12);
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 = (const __CFString *)-[VCTextReceiver performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v5 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v28 = 136316162;
            *(_QWORD *)&v28[4] = v13;
            *(_WORD *)&v28[12] = 2080;
            *(_QWORD *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
            *(_WORD *)&v28[22] = 1024;
            LODWORD(v29) = 343;
            WORD2(v29) = 2112;
            *(_QWORD *)((char *)&v29 + 6) = v5;
            HIWORD(v29) = 2048;
            v30 = self;
            v10 = "VCTextReceiver [%s] %s:%d %@(%p) ";
            v11 = v14;
            v12 = 48;
            goto LABEL_19;
          }
        }
      }
      if ((VCTextReceiver *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x1E0CF2758];
          v18 = *MEMORY[0x1E0CF2758];
          if (!*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              -[VCTextReceiver didReceiveFrame:].cold.1(v16, v4, v17);
            goto LABEL_37;
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_msgSend(v4, "length");
            *(_DWORD *)v28 = 136316162;
            *(_QWORD *)&v28[4] = v16;
            *(_WORD *)&v28[12] = 2080;
            *(_QWORD *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
            *(_WORD *)&v28[22] = 1024;
            LODWORD(v29) = 344;
            WORD2(v29) = 2112;
            *(_QWORD *)((char *)&v29 + 6) = v4;
            HIWORD(v29) = 2048;
            v30 = (VCTextReceiver *)v19;
            v20 = "VCTextReceiver [%s] %s:%d Received text:%@ length:%lu";
            v21 = v17;
            v22 = 48;
LABEL_32:
            _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, v28, v22);
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v15 = (const __CFString *)-[VCTextReceiver performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v15 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          goto LABEL_37;
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        v25 = *MEMORY[0x1E0CF2758];
        if (!*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v27 = objc_msgSend(v4, "length");
            *(_DWORD *)v28 = 136316674;
            *(_QWORD *)&v28[4] = v23;
            *(_WORD *)&v28[12] = 2080;
            *(_QWORD *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
            *(_WORD *)&v28[22] = 1024;
            LODWORD(v29) = 344;
            WORD2(v29) = 2112;
            *(_QWORD *)((char *)&v29 + 6) = v15;
            HIWORD(v29) = 2048;
            v30 = self;
            *(_WORD *)v31 = 2112;
            *(_QWORD *)&v31[2] = v4;
            *(_WORD *)&v31[10] = 2048;
            *(_QWORD *)&v31[12] = v27;
            _os_log_debug_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d %@(%p) Received text:%@ length:%lu", v28, 0x44u);
          }
          goto LABEL_37;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_msgSend(v4, "length");
          *(_DWORD *)v28 = 136316674;
          *(_QWORD *)&v28[4] = v23;
          *(_WORD *)&v28[12] = 2080;
          *(_QWORD *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
          *(_WORD *)&v28[22] = 1024;
          LODWORD(v29) = 344;
          WORD2(v29) = 2112;
          *(_QWORD *)((char *)&v29 + 6) = v15;
          HIWORD(v29) = 2048;
          v30 = self;
          *(_WORD *)v31 = 2112;
          *(_QWORD *)&v31[2] = v4;
          *(_WORD *)&v31[10] = 2048;
          *(_QWORD *)&v31[12] = v26;
          v20 = "VCTextReceiver [%s] %s:%d %@(%p) Received text:%@ length:%lu";
          v21 = v24;
          v22 = 68;
          goto LABEL_32;
        }
      }
LABEL_37:
      -[VCTextReceiverDelegate didReceiveText:](-[VCTextReceiver delegate](self, "delegate", *(_OWORD *)v28, *(_QWORD *)&v28[16], v29, v30, *(_OWORD *)v31, *(_QWORD *)&v31[16], v32), "didReceiveText:", v4);

      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v28 = 136315650;
        *(_QWORD *)&v28[4] = v6;
        *(_WORD *)&v28[12] = 2080;
        *(_QWORD *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
        *(_WORD *)&v28[22] = 1024;
        LODWORD(v29) = 338;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d Discarding empty text frame", v28, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTextReceiver didReceiveFrame:].cold.2();
  }
}

- (NSArray)supportedPayloads
{
  return self->_supportedPayloads;
}

- (void)setSupportedPayloads:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (double)lastReceivedRTPPacketTime
{
  return self->_lastReceivedRTPPacketTime;
}

- (void)setLastReceivedRTPPacketTime:(double)a3
{
  self->_lastReceivedRTPPacketTime = a3;
}

- (double)lastReceivedRTCPPacketTime
{
  return self->_lastReceivedRTCPPacketTime;
}

- (void)setLastReceivedRTCPPacketTime:(double)a3
{
  self->_lastReceivedRTCPPacketTime = a3;
}

- (void)initWithConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCTextReceiver [%s] %s:%d Failed to create the jitter buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCTextReceiver [%s] %s:%d Failed to initalize the text receiver thread", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTextReceiver initWithConfiguration:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCTextReceiver [%s] %s:%d VCTransportStreamRunLoopVTPCreate failed %d", v2, *(const char **)v3, (unint64_t)"-[VCTextReceiver initWithConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)retrieveRTPPacket:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  v3 = 145;
  v4 = 2048;
  v5 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d received packet time[%f]", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)retrieveRTPPacket:.cold.2()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCTextReceiver retrieveRTPPacket:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d Received an error %x", v1, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)receiverThreadCallback:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCTextReceiver [%s] %s:%d Receiving RTP packet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receiverThreadCallback:.cold.2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCTextReceiver [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isSupportedPayload:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTextReceiver isSupportedPayload:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCTextReceiver [%s] %s:%d Received a packet with unknown payload: %d", v2, *(const char **)v3, (unint64_t)"-[VCTextReceiver isSupportedPayload:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)parsePacket:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCTextReceiver [%s] %s:%d Unrecognized payload type: %d", v2, v3, v4, 296);
  OUTLINED_FUNCTION_3();
}

- (void)didReceiveFrame:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "length");
  v7 = 136316162;
  v8 = a1;
  OUTLINED_FUNCTION_1();
  v9 = 344;
  v10 = 2112;
  v11 = a2;
  v12 = 2048;
  v13 = v6;
  _os_log_debug_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d Received text:%@ length:%lu", (uint8_t *)&v7, 0x30u);
}

- (void)didReceiveFrame:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCTextReceiver [%s] %s:%d Unexpected payload type: %u", v2, v3, v4, 334);
  OUTLINED_FUNCTION_3();
}

@end
