@implementation VCVideoTransmitterBase

- (VCVideoTransmitterBase)initWithConfig:(id)a3
{
  VCVideoTransmitterBase *v4;
  unsigned int v5;
  unsigned int encodingWidth;
  double v7;
  double v8;
  double v9;
  double v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int captureWidth;
  unsigned int captureHeight;
  unsigned int v16;
  unsigned int encodingHeight;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[10];
  VCVideoTransmitterBase *v37;
  _BYTE v38[6];
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  unsigned int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)VCVideoTransmitterBase;
  v4 = -[VCVideoTransmitterBase init](&v28, sel_init);
  if (v4)
  {
    if ((unint64_t)objc_msgSend(a3, "framerate") <= 0x3C && objc_msgSend(a3, "framerate"))
      v4->_targetFramerate = objc_msgSend(a3, "framerate");
    v4->_txMaxBitrate = objc_msgSend(a3, "txMaxBitrate");
    v4->_txMinBitrate = objc_msgSend(a3, "txMinBitrate");
    v4->_temporaryMaximumBitrate = objc_msgSend(a3, "txMinBitrate");
    if (objc_msgSend(a3, "videoResolution") == 27)
    {
      v4->_encodingWidth = objc_msgSend(a3, "customWidth");
      v5 = objc_msgSend(a3, "customHeight");
      encodingWidth = v4->_encodingWidth;
    }
    else
    {
      +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", objc_msgSend(a3, "videoResolution"));
      encodingWidth = v7;
      v4->_encodingWidth = v7;
      v5 = v8;
    }
    v4->_encodingHeight = v5;
    if (objc_msgSend(a3, "captureSource") == 3)
    {
      +[VideoUtil getBestCaptureSizeForEncodingSize:](VideoUtil, "getBestCaptureSizeForEncodingSize:", (double)encodingWidth, (double)v5);
      encodingWidth = v9;
      v5 = v10;
    }
    v4->_captureWidth = encodingWidth;
    v4->_captureHeight = v5;
    if ((VCVideoTransmitterBase *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          captureWidth = v4->_captureWidth;
          captureHeight = v4->_captureHeight;
          v16 = v4->_encodingWidth;
          encodingHeight = v4->_encodingHeight;
          *(_DWORD *)buf = 136316674;
          v30 = v12;
          v31 = 2080;
          v32 = "-[VCVideoTransmitterBase initWithConfig:]";
          v33 = 1024;
          v34 = 71;
          v35 = 1024;
          *(_DWORD *)v36 = captureWidth;
          *(_WORD *)&v36[4] = 1024;
          *(_DWORD *)&v36[6] = captureHeight;
          LOWORD(v37) = 1024;
          *(_DWORD *)((char *)&v37 + 2) = v16;
          HIWORD(v37) = 1024;
          *(_DWORD *)v38 = encodingHeight;
          v18 = " [%s] %s:%d capture = %dx%d, encode = %dx%d";
          v19 = v13;
          v20 = 52;
LABEL_20:
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCVideoTransmitterBase performSelector:](v4, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v23 = v4->_captureWidth;
          v24 = v4->_captureHeight;
          v25 = v4->_encodingWidth;
          v26 = v4->_encodingHeight;
          *(_DWORD *)buf = 136317186;
          v30 = v21;
          v31 = 2080;
          v32 = "-[VCVideoTransmitterBase initWithConfig:]";
          v33 = 1024;
          v34 = 71;
          v35 = 2112;
          *(_QWORD *)v36 = v11;
          *(_WORD *)&v36[8] = 2048;
          v37 = v4;
          *(_WORD *)v38 = 1024;
          *(_DWORD *)&v38[2] = v23;
          v39 = 1024;
          v40 = v24;
          v41 = 1024;
          v42 = v25;
          v43 = 1024;
          v44 = v26;
          v18 = " [%s] %s:%d %@(%p) capture = %dx%d, encode = %dx%d";
          v19 = v22;
          v20 = 72;
          goto LABEL_20;
        }
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCVideoTransmitterBase;
  -[VCVideoTransmitterBase dealloc](&v2, sel_dealloc);
}

- (void)startVideo
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase startVideo]"), 0));
}

- (void)stopVideo
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase stopVideo]"), 0));
}

- (void)generateKeyFrameWithFIRType:(int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase generateKeyFrameWithFIRType:]"), 0));
}

- (unsigned)setTemporaryMaximumBitrate:(unsigned int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase setTemporaryMaximumBitrate:]"), 0));
}

- (void)setKeyFrameOnlyStreamID:(unsigned __int16)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase setKeyFrameOnlyStreamID:]"), 0));
}

- (void)setStreamIDs:(unsigned __int16 *)a3 numOfStreamIDs:(unsigned __int8)a4 repairedStreamIDs:(unsigned __int16 *)a5 numOfRepairedStreamIDs:(unsigned __int8)a6
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, a6, "-[VCVideoTransmitterBase setStreamIDs:numOfStreamIDs:repairedStreamIDs:numOfRepairedStreamIDs:]"), 0));
}

- (void)collectChannelMetrics:(id *)a3 interval:(float)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase collectChannelMetrics:interval:]"), 0));
}

- (void)setFECRatio:(double)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a3, "-[VCVideoTransmitterBase setFECRatio:]"), 0));
}

- (void)setFECRedundancyVector:(id *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase setFECRedundancyVector:]"), 0));
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase setMediaSuggestion:]"), 0));
}

- (BOOL)setEncodingMode:(int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase setEncodingMode:]"), 0));
}

- (void)handleThermalLevelChange:(int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase handleThermalLevelChange:]"), 0));
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, "-[VCVideoTransmitterBase updateWindowState:isLocal:windowRect:]"), 0));
}

- (void)setTemporalBitrateArray:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase setTemporalBitrateArray:]"), 0));
}

- (void)setHighestActiveQualityIndex:(unsigned int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase setHighestActiveQualityIndex:]"), 0));
}

- (void)handleActiveConnectionChange:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoTransmitterBase handleActiveConnectionChange:]"), 0));
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFrameTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_latestSampleBufferTimestamp, 24, 1, 0);
  return result;
}

- (void)setLastFrameTime:(id *)a3
{
  objc_copyStruct(&self->_latestSampleBufferTimestamp, a3, 24, 1, 0);
}

- (unsigned)lastRTPTimestamp
{
  return self->_timestamp;
}

- (void)setLastRTPTimestamp:(unsigned int)a3
{
  self->_timestamp = a3;
}

- (double)lastKeyFrameSentTime
{
  return self->_lastKeyFrameSentTime;
}

- (void)setLastKeyFrameSentTime:(double)a3
{
  self->_lastKeyFrameSentTime = a3;
}

- (unsigned)lastSentAudioSampleTime
{
  return self->_lastSentAudioSampleTime;
}

- (void)setLastSentAudioSampleTime:(unsigned int)a3
{
  self->_lastSentAudioSampleTime = a3;
}

- (double)lastSentAudioHostTime
{
  return self->_lastSentAudioHostTime;
}

- (void)setLastSentAudioHostTime:(double)a3
{
  self->_lastSentAudioHostTime = a3;
}

- (BOOL)isServerBasedBandwidthProbingEnabled
{
  return self->_isServerBasedBandwidthProbingEnabled;
}

- (void)setIsServerBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->_isServerBasedBandwidthProbingEnabled = a3;
}

- (BOOL)isEndToEndBasedBandwidthProbingEnabled
{
  return self->_isEndToEndBasedBandwidthProbingEnabled;
}

- (void)setIsEndToEndBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->_isEndToEndBasedBandwidthProbingEnabled = a3;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (void)setTargetBitrate:(unsigned int)a3
{
  self->_targetBitrate = a3;
}

- (unsigned)targetBitrateChangeCounter
{
  return self->_targetBitrateChangeCounter;
}

- (void)setTargetBitrateChangeCounter:(unsigned int)a3
{
  self->_targetBitrateChangeCounter = a3;
}

- (unsigned)encodingWidth
{
  return self->_encodingWidth;
}

- (unsigned)encodingHeight
{
  return self->_encodingHeight;
}

- (unsigned)targetFramerate
{
  return self->_targetFramerate;
}

- (BOOL)isRtxEnabled
{
  return self->_rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->_rtxEnabled = a3;
}

@end
