@implementation VCVideoQualityInfo

- (VCVideoQualityInfo)init
{
  VCVideoQualityInfo *v2;
  VCVideoQualityInfo *v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  double videoDegradedThreshold;
  double videoImprovedThreshold;
  double videoMinFrameRate;
  _BOOL4 shouldUseExitHysteresis;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoQualityInfo;
  v2 = -[VCObject init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lastGoodVideoQualityTime = 0.0;
    v2->_lastVideoQualityDegradedSwitchTime = 0.0;
    objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-video-degraded-threshold")), "doubleValue");
    if (v4 < 5.0)
      v4 = 5.0;
    v3->_videoDegradedThreshold = v4;
    v3->_videoDegradedThreshold = VCDefaults_GetDoubleValueForKey(CFSTR("videoDegradedThreshold"), v4);
    v3->_videoImprovedThreshold = VCDefaults_GetDoubleValueForKey(CFSTR("videoImprovedThreshold"), 1.5);
    v3->_videoMinFrameRate = VCDefaults_GetDoubleValueForKey(CFSTR("videoMinFrameRate"), 0.2);
    v3->_shouldUseExitHysteresis = VCDefaults_GetBoolValueForKey(CFSTR("shouldUseExitHysteresis"), 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        videoDegradedThreshold = v3->_videoDegradedThreshold;
        videoImprovedThreshold = v3->_videoImprovedThreshold;
        videoMinFrameRate = v3->_videoMinFrameRate;
        shouldUseExitHysteresis = v3->_shouldUseExitHysteresis;
        *(_DWORD *)buf = 136316674;
        v14 = v5;
        v15 = 2080;
        v16 = "-[VCVideoQualityInfo init]";
        v17 = 1024;
        v18 = 50;
        v19 = 2048;
        v20 = videoDegradedThreshold;
        v21 = 2048;
        v22 = videoImprovedThreshold;
        v23 = 2048;
        v24 = videoMinFrameRate;
        v25 = 1024;
        v26 = shouldUseExitHysteresis;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoDegradedThreshold = %f videoImprovedThreshold = %f videoMinFrameRate = %f shouldUseExitHysteresis = %d", buf, 0x40u);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCVideoQualityInfo;
  -[VCObject dealloc](&v2, sel_dealloc);
}

- (void)resetLastGoodVideoQualityTime:(double)a3
{
  self->_lastGoodVideoQualityTime = a3;
}

- (BOOL)updateWithCurrentFramerate:(double)a3 bitrate:(double)a4 time:(double)a5
{
  double firstDegradedMeasure;
  double lastGoodVideoQualityTime;
  double videoDegradedThreshold;
  double *p_lastVideoQualityDegradedSwitchTime;
  const __CFString *v10;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 isVideoQualityDegraded;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  VCVideoQualityInfo *v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_videoIsExpected)
  {
    firstDegradedMeasure = self->_firstDegradedMeasure;
    if (firstDegradedMeasure == 0.0)
    {
      self->_firstDegradedMeasure = a5;
      firstDegradedMeasure = a5;
    }
    if (a5 - firstDegradedMeasure >= 10.0)
    {
      if (self->_lastGoodVideoQualityTime <= 0.0)
      {
        self->_lastGoodVideoQualityTime = a5;
        self->_lastVideoQualityDegradedSwitchTime = a5;
        self->_lastBadVideoQualityTime = a5 - self->_videoImprovedThreshold;
      }
      if (self->_videoMinFrameRate >= a3)
      {
        self->_lastBadVideoQualityTime = a5;
        lastGoodVideoQualityTime = self->_lastGoodVideoQualityTime;
      }
      else
      {
        self->_lastGoodVideoQualityTime = a5;
        lastGoodVideoQualityTime = a5;
      }
      videoDegradedThreshold = self->_videoDegradedThreshold;
      if (a5 - lastGoodVideoQualityTime <= videoDegradedThreshold)
      {
        if (self->_isVideoQualityDegraded)
        {
          if ((p_lastVideoQualityDegradedSwitchTime = &self->_lastVideoQualityDegradedSwitchTime,
                a5 - self->_lastVideoQualityDegradedSwitchTime > videoDegradedThreshold)
            && self->_shouldUseExitHysteresis
            || a5 - self->_lastBadVideoQualityTime > self->_videoImprovedThreshold)
          {
            self->_isVideoQualityDegraded = 0;
LABEL_18:
            *p_lastVideoQualityDegradedSwitchTime = a5;
            if ((VCVideoQualityInfo *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                return 1;
              v12 = VRTraceErrorLogLevelToCSTR();
              v13 = *MEMORY[0x1E0CF2758];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                return 1;
              isVideoQualityDegraded = self->_isVideoQualityDegraded;
              v21 = 136315906;
              v22 = v12;
              v23 = 2080;
              v24 = "-[VCVideoQualityInfo updateWithCurrentFramerate:bitrate:time:]";
              v25 = 1024;
              v26 = 120;
              v27 = 1024;
              LODWORD(v28) = isVideoQualityDegraded;
              v15 = " [%s] %s:%d isVideoQualityDegraded:%d";
              v16 = v13;
              v17 = 34;
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v10 = (const __CFString *)-[VCVideoQualityInfo performSelector:](self, "performSelector:", sel_logPrefix);
              else
                v10 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                return 1;
              v18 = VRTraceErrorLogLevelToCSTR();
              v19 = *MEMORY[0x1E0CF2758];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                return 1;
              v20 = self->_isVideoQualityDegraded;
              v21 = 136316418;
              v22 = v18;
              v23 = 2080;
              v24 = "-[VCVideoQualityInfo updateWithCurrentFramerate:bitrate:time:]";
              v25 = 1024;
              v26 = 120;
              v27 = 2112;
              v28 = v10;
              v29 = 2048;
              v30 = self;
              v31 = 1024;
              v32 = v20;
              v15 = " [%s] %s:%d %@(%p) isVideoQualityDegraded:%d";
              v16 = v19;
              v17 = 54;
            }
            _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, v17);
            return 1;
          }
        }
      }
      else if (!self->_isVideoQualityDegraded)
      {
        self->_isVideoQualityDegraded = 1;
        p_lastVideoQualityDegradedSwitchTime = &self->_lastVideoQualityDegradedSwitchTime;
        goto LABEL_18;
      }
    }
  }
  return 0;
}

- (void)setVideoIsExpected:(BOOL)a3
{
  _BOOL4 videoIsExpected;
  _BOOL4 v4;
  _BOOL4 isVideoQualityDegraded;
  double v7;
  int *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCVideoQualityInfo *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  videoIsExpected = self->_videoIsExpected;
  if (videoIsExpected != a3)
  {
    v4 = a3;
    self->_firstDegradedMeasure = 0.0;
    if (videoIsExpected)
    {
      isVideoQualityDegraded = self->_isVideoQualityDegraded;
      v7 = micro();
      v8 = &OBJC_IVAR___VCVideoQualityInfo__lastVideoQualityDegradedSwitchTime;
      if (!isVideoQualityDegraded)
        v8 = &OBJC_IVAR___VCVideoQualityInfo__lastGoodVideoQualityTime;
      *(double *)((char *)&self->super.super.isa + *v8) = v7;
    }
    self->_videoIsExpected = v4;
    if ((VCVideoQualityInfo *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315906;
          v18 = v10;
          v19 = 2080;
          v20 = "-[VCVideoQualityInfo setVideoIsExpected:]";
          v21 = 1024;
          v22 = 140;
          v23 = 1024;
          LODWORD(v24) = v4;
          v12 = " [%s] %s:%d videoIsExpected=%d";
          v13 = v11;
          v14 = 34;
LABEL_16:
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCVideoQualityInfo performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136316418;
          v18 = v15;
          v19 = 2080;
          v20 = "-[VCVideoQualityInfo setVideoIsExpected:]";
          v21 = 1024;
          v22 = 140;
          v23 = 2112;
          v24 = v9;
          v25 = 2048;
          v26 = self;
          v27 = 1024;
          v28 = v4;
          v12 = " [%s] %s:%d %@(%p) videoIsExpected=%d";
          v13 = v16;
          v14 = 54;
          goto LABEL_16;
        }
      }
    }
  }
}

- (BOOL)isVideoQualityDegraded
{
  return self->_isVideoQualityDegraded;
}

- (BOOL)videoIsExpected
{
  return self->_videoIsExpected;
}

@end
