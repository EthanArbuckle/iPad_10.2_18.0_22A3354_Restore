@implementation VCMomentsCollector

- (VCMomentsCollector)initWithStreamToken:(int64_t)a3
{
  VCMomentsCollector *v4;
  VCMomentsCollector *v5;
  VCMediaRecorder *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCMomentsCollector;
  v4 = -[VCMomentsCollector init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_streamToken = a3;
    v6 = -[VCMediaRecorder initWithStreamToken:delegate:reportingAgent:]([VCMediaRecorder alloc], "initWithStreamToken:delegate:reportingAgent:", a3, 0, 0);
    v5->_mediaRecorder = v6;
    -[VCMediaRecorder setCapabilities:](v6, "setCapabilities:", 0);
    -[VCMediaRecorderManager registerMediaRecorder:withStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "registerMediaRecorder:withStreamToken:", v5->_mediaRecorder, a3);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  int64_t streamToken;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCMomentsCollector dealloc]";
      v11 = 1024;
      v12 = 28;
      v13 = 1024;
      v14 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMomentsCollector: dealloc for streamToken=%u", buf, 0x22u);
    }
  }
  -[VCMediaRecorderManager unregisterMediaRecorderWithStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "unregisterMediaRecorderWithStreamToken:", self->_streamToken);

  v6.receiver = self;
  v6.super_class = (Class)VCMomentsCollector;
  -[VCMomentsCollector dealloc](&v6, sel_dealloc);
}

- (void)stream:(id)a3 addVideoSampleBuffer:(opaqueCMSampleBuffer *)a4 cameraStatusBits:(unsigned __int8)a5 timestamp:(unsigned int)a6
{
  VCMediaRecorder_AddLocalVideoSampleBuffer((uint64_t)self->_mediaRecorder, a4, a5, a6);
}

- (void)stream:(id)a3 addAudioSampleBuffer:(opaqueVCAudioBufferList *)a4 timestamp:(unsigned int)a5
{
  VCMediaRecorder_AddLocalAudioSampleBuffer((uint64_t)self->_mediaRecorder, (uint64_t)a4, a5);
}

- (void)cleanUpActiveRequests
{
  -[VCMediaRecorder cleanUpActiveRequests](self->_mediaRecorder, "cleanUpActiveRequests");
}

@end
