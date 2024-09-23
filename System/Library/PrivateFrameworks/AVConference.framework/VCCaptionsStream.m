@implementation VCCaptionsStream

- (VCCaptionsStream)init
{
  VCCaptionsStream *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCCaptionsStream;
  v2 = -[VCVideoStream init](&v4, sel_init);
  if (v2)
    *(_QWORD *)&v2->super._haveReportedPerfTimers = -[VCCaptionsReceiver initWithDelegate:]([VCCaptionsReceiver alloc], "initWithDelegate:", v2);
  return v2;
}

- (VCCaptionsStream)initWithTransportSessionID:(unsigned int)a3 idsParticipantID:(unint64_t)a4 ssrc:(unsigned int)a5 streamToken:(int64_t)a6
{
  VCCaptionsStream *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCCaptionsStream;
  v6 = -[VCVideoStream initWithTransportSessionID:idsParticipantID:ssrc:streamToken:](&v8, sel_initWithTransportSessionID_idsParticipantID_ssrc_streamToken_, *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
  if (v6)
    *(_QWORD *)&v6->super._haveReportedPerfTimers = -[VCCaptionsReceiver initWithDelegate:]([VCCaptionsReceiver alloc], "initWithDelegate:", v6);
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)&self->_captionsReceiver, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsStream;
  -[VCVideoStream dealloc](&v3, sel_dealloc);
}

- (void)onStartWithCompletionHandler:(id)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCCaptionsStream;
  -[VCVideoStream onStartWithCompletionHandler:](&v4, sel_onStartWithCompletionHandler_, a3);
  objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "registerCaptionsSource:streamToken:", self, -[VCMediaStream streamToken](self, "streamToken"));
}

- (tagVCVideoReceiverDelegateRealtimeInstanceVTable)videoReceiverDelegateFunctions
{
  void (*v2)(uint64_t, opaqueCMSampleBuffer *, int);
  void *v3;
  tagVCVideoReceiverDelegateRealtimeInstanceVTable result;

  v2 = _VCCaptionsStream_DidReceiveSampleBuffer;
  v3 = 0;
  result.didReceiveRemoteFrame = v3;
  result.didReceiveSampleBuffer = v2;
  return result;
}

- (void)onStopWithCompletionHandler:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "unregisterCaptionsSourceWithStreamToken:", -[VCMediaStream streamToken](self, "streamToken"));
  v5.receiver = self;
  v5.super_class = (Class)VCCaptionsStream;
  -[VCVideoStream onStopWithCompletionHandler:](&v5, sel_onStopWithCompletionHandler_, a3);
}

- (void)didReceiveCaptions:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *global_queue;
  _QWORD v14[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCCaptionsStream *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCCaptionsStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v6;
        v17 = 2080;
        v18 = "-[VCCaptionsStream didReceiveCaptions:]";
        v19 = 1024;
        v20 = 81;
        v8 = " [%s] %s:%d Received remote captions transcription!";
        v9 = v7;
        v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCCaptionsStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v11;
        v17 = 2080;
        v18 = "-[VCCaptionsStream didReceiveCaptions:]";
        v19 = 1024;
        v20 = 81;
        v21 = 2112;
        v22 = v5;
        v23 = 2048;
        v24 = self;
        v8 = " [%s] %s:%d %@(%p) Received remote captions transcription!";
        v9 = v12;
        v10 = 48;
        goto LABEL_11;
      }
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__VCCaptionsStream_didReceiveCaptions___block_invoke;
  v14[3] = &unk_1E9E52238;
  v14[4] = self;
  v14[5] = a3;
  dispatch_async(global_queue, v14);
}

uint64_t __39__VCCaptionsStream_didReceiveCaptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "streamToken:didUpdateCaptions:", objc_msgSend(*(id *)(a1 + 32), "streamToken"), *(_QWORD *)(a1 + 40));
}

- (void)registerCaptionsEventDelegate:(id)a3
{
  if (objc_msgSend(a3, "conformsToProtocol:", &unk_1F01D1B48))
    objc_storeWeak((id *)&self->_captionsReceiver, a3);
}

- (id)captionsDelegate
{
  return objc_loadWeak((id *)&self->_captionsReceiver);
}

- (BOOL)captionsEnabled
{
  return (BOOL)self->_captionsDelegate;
}

- (BOOL)captionsSupported
{
  return 1;
}

- (void)enableCaptions:(BOOL)a3
{
  LOBYTE(self->_captionsDelegate) = a3;
}

@end
