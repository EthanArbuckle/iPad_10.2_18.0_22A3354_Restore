@implementation BWNRFProcessorInput

- (BWNRFProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  BWNRFProcessorInput *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWNRFProcessorInput;
  v4 = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v6, sel_initWithSettings_portType_, a3, a4);
  if (v4)
  {
    v4->_frames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_keepFrames = 1;
    v4->_fusionMode = 0;
    v4->_oisRecenteringLoggingData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_ispMotionHighPassFilterConvergenceFlags = 0;
  }
  return v4;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *referenceFrame;
  opaqueCMSampleBuffer *errorRecoveryFrame;
  objc_super v5;

  CVPixelBufferRelease(self->_gainMapPixelBuffer);
  self->_gainMapPixelBuffer = 0;
  referenceFrame = self->_referenceFrame;
  if (referenceFrame)
    CFRelease(referenceFrame);
  errorRecoveryFrame = self->_errorRecoveryFrame;
  if (errorRecoveryFrame)
    CFRelease(errorRecoveryFrame);

  v5.receiver = self;
  v5.super_class = (Class)BWNRFProcessorInput;
  -[BWStillImageProcessorControllerInput dealloc](&v5, sel_dealloc);
}

- (BOOL)keepFrames
{
  return self->_keepFrames;
}

- (void)setKeepFrames:(BOOL)a3
{
  if (self->_keepFrames != a3)
  {
    self->_keepFrames = a3;
    if (!a3)
      -[NSMutableArray removeAllObjects](self->_frames, "removeAllObjects");
  }
}

- (NSMutableDictionary)oisRecenteringLoggingData
{
  return self->_oisRecenteringLoggingData;
}

- (int)ispMotionHighPassFilterConvergenceFlags
{
  return self->_ispMotionHighPassFilterConvergenceFlags;
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3
{
  unint64_t v5;
  char AdaptiveBracketingFrame;
  BOOL *p_receivedAllFrames;
  int adaptiveBracketingStopFrameCount;
  BOOL v9;
  int receivedFrames;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  double v30;
  void *v31;
  float v32;
  double v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  double v38;
  void *v39;

  if (!a3)
  {
    FigDebugAssert3();
    return;
  }
  v5 = (unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a3);
  ++self->_receivedFrames;
  if (self->_keepFrames)
    -[NSMutableArray addObject:](self->_frames, "addObject:", a3);
  if (objc_msgSend(-[BWStillImageCaptureStreamSettings adaptiveUnifiedBracketedCaptureParams](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "adaptiveUnifiedBracketedCaptureParams"), "count"))
  {
    AdaptiveBracketingFrame = BWIsLastAdaptiveBracketingFrame(a3);
    p_receivedAllFrames = &self->_receivedAllFrames;
    self->_receivedAllFrames = AdaptiveBracketingFrame;
    adaptiveBracketingStopFrameCount = self->_adaptiveBracketingStopFrameCount;
    if (adaptiveBracketingStopFrameCount < 1)
      goto LABEL_11;
    v9 = (AdaptiveBracketingFrame & 1) != 0 || self->_receivedFrames >= adaptiveBracketingStopFrameCount;
  }
  else
  {
    receivedFrames = self->_receivedFrames;
    v9 = receivedFrames == -[BWNRFProcessorInput expectedFrameCount](self, "expectedFrameCount");
    p_receivedAllFrames = &self->_receivedAllFrames;
  }
  *p_receivedAllFrames = v9;
LABEL_11:
  if (-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType") == 11)
  {
    v11 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v12 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E58]);
    if (v12)
    {
      if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D07A48]) & 1) == 0)
      {
        v13 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E60]);
        if (v13)
        {
          v14 = v13;
          objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D07A88]), "floatValue");
          v16 = v15;
          objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D07A90]), "floatValue");
          v18 = v17;
          objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D07A98]), "floatValue");
          v20 = v19;
          v21 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", CFSTR("numberOfFrames")), "intValue");
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959B58), "floatValue");
          if (*(float *)&v22 < v16)
          {
            *(float *)&v22 = v16;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22), 0x1E4959B58);
            *(float *)&v23 = v18;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), 0x1E4959B78);
            LODWORD(v24) = v20;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24), 0x1E4959BD8);
          }
          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959B98), "floatValue");
          v26 = (float)v21;
          v28 = v16 + (float)(v27 * (float)v21);
          v29 = (v21 + 1);
          *(float *)&v30 = v28 / (float)(int)v29;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", objc_msgSend(v25, "numberWithFloat:", v30), 0x1E4959B98);
          v31 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959BB8), "floatValue");
          *(float *)&v33 = (float)(v18 + (float)(v32 * v26)) / (float)(int)v29;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", objc_msgSend(v31, "numberWithFloat:", v33), 0x1E4959BB8);
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B70]), "floatValue");
          v35 = v34;
          v36 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959BF8), "floatValue");
          *(float *)&v38 = (float)(v35 + (float)(v37 * v26)) / (float)(int)v29;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", objc_msgSend(v36, "numberWithFloat:", v38), 0x1E4959BF8);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29), CFSTR("numberOfFrames"));
        }
        v39 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B80]);
        if (v39)
          self->_ispMotionHighPassFilterConvergenceFlags = objc_msgSend(v39, "intValue");
      }
    }
  }
  -[BWNRFProcessorInputDelegate input:addFrame:isReferenceFrame:](self->_delegate, "input:addFrame:isReferenceFrame:", self, a3, (v5 >> 4) & 1);
}

- (int)receivedFrames
{
  return self->_receivedFrames;
}

- (BOOL)receivedAllFrames
{
  return self->_receivedAllFrames;
}

- (int)expectedFrameCount
{
  uint64_t v3;
  BWStillImageCaptureStreamSettings *v4;

  if (-[BWStillImageCaptureSettings captureType](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureType") == 12&& (-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags") & 4) != 0)
  {
    if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags") & 0x100000) != 0)return 2;
    else
      return 1;
  }
  else if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags") & 8) != 0)
  {
    return 1;
  }
  else
  {
    v3 = objc_msgSend(-[BWStillImageCaptureStreamSettings adaptiveUnifiedBracketedCaptureParams](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "adaptiveUnifiedBracketedCaptureParams"), "count");
    v4 = -[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings");
    if (v3)
      return -[BWStillImageCaptureStreamSettings currentExpectedAdaptiveBracketedFrameCaptureCount](v4, "currentExpectedAdaptiveBracketedFrameCaptureCount");
    else
      return -[BWStillImageCaptureStreamSettings expectedFrameCount](v4, "expectedFrameCount");
  }
}

- (opaqueCMSampleBuffer)referenceFrame
{
  int v3;
  opaqueCMSampleBuffer *referenceFrame;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v3 = -[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType");
  referenceFrame = self->_referenceFrame;
  if (referenceFrame)
    return referenceFrame;
  if (v3 != 1 && v3 != 7)
  {
    if (v3 == 2)
    {
      if (-[NSMutableArray count](self->_frames, "count"))
      {
        v6 = 0;
        v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v8 = *MEMORY[0x1E0D06D60];
        v9 = *MEMORY[0x1E0D06878];
        while (1)
        {
          referenceFrame = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v6);
          v10 = (void *)CMGetAttachment(referenceFrame, v7, 0);
          if ((objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v8), "BOOLValue") & 1) == 0
            && !objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v9), "BOOLValue"))
          {
            break;
          }
          if (-[NSMutableArray count](self->_frames, "count") <= (unint64_t)++v6)
            return 0;
        }
        return referenceFrame;
      }
    }
    else if (-[NSMutableArray count](self->_frames, "count"))
    {
      v11 = 0;
      while (1)
      {
        referenceFrame = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v11);
        if ((BWStillImageCaptureFrameFlagsForSampleBuffer(referenceFrame) & 0x10) != 0)
          break;
        if (-[NSMutableArray count](self->_frames, "count") <= (unint64_t)++v11)
          return 0;
      }
      return referenceFrame;
    }
    return 0;
  }
  return (opaqueCMSampleBuffer *)-[NSMutableArray firstObject](self->_frames, "firstObject");
}

- (_QWORD)_setReferenceFrame:(_QWORD *)result
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)result[11];
    if (result != cf)
    {
      if (result)
        CFRelease(result);
      if (cf)
        result = CFRetain(cf);
      else
        result = 0;
      v3[11] = result;
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)evMinusReferenceFrame
{
  uint64_t v3;
  const void *v4;

  if ((-[BWStillImageCaptureStreamSettings captureFlags](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureFlags") & 0x100000) == 0|| !-[NSMutableArray count](self->_frames, "count"))
  {
    return 0;
  }
  v3 = 0;
  while (1)
  {
    v4 = (const void *)-[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v3);
    if ((BWStillImageCaptureFrameFlagsForSampleBuffer(v4) & 4) != 0)
      break;
    if (-[NSMutableArray count](self->_frames, "count") <= (unint64_t)++v3)
      return 0;
  }
  return (opaqueCMSampleBuffer *)v4;
}

- (void)setProcessedRawErrorRecoveryFrame:(opaqueCMSampleBuffer *)a3
{
  -[BWNRFProcessorInput _setErrorRecoveryFrame:](self, a3);
  -[BWNRFProcessorInputDelegate inputReceivedProcessedRawErrorRecoveryFrame:](self->_delegate, "inputReceivedProcessedRawErrorRecoveryFrame:", self);
}

- (_QWORD)_setErrorRecoveryFrame:(_QWORD *)result
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)result[12];
    if (result != cf)
    {
      if (result)
        CFRelease(result);
      if (cf)
        result = CFRetain(cf);
      else
        result = 0;
      v3[12] = result;
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)errorRecoveryFrame
{
  opaqueCMSampleBuffer *errorRecoveryFrame;
  int v5;
  NSMutableArray *frames;
  uint64_t v7;

  errorRecoveryFrame = self->_errorRecoveryFrame;
  if (errorRecoveryFrame)
    return errorRecoveryFrame;
  v5 = -[BWStillImageCaptureSettings captureType](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureType");
  frames = self->_frames;
  if (v5 != 1)
  {
    if (!-[NSMutableArray count](frames, "count"))
      return 0;
    v7 = 0;
    while (1)
    {
      errorRecoveryFrame = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v7);
      if ((BWStillImageCaptureFrameFlagsForSampleBuffer(errorRecoveryFrame) & 0x20) != 0)
        break;
      if (-[NSMutableArray count](self->_frames, "count") <= (unint64_t)++v7)
        return 0;
    }
    return errorRecoveryFrame;
  }
  return (opaqueCMSampleBuffer *)-[NSMutableArray firstObject](frames, "firstObject");
}

- (opaqueCMSampleBuffer)originalImage
{
  if (-[BWStillImageCaptureSettings deliverOriginalImage](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "deliverOriginalImage"))
  {
    return -[BWNRFProcessorInput errorRecoveryFrame](self, "errorRecoveryFrame");
  }
  else
  {
    return 0;
  }
}

- (os_unfair_lock_s)stopAdaptiveBracketingNow
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v1 = result;
    result = (os_unfair_lock_s *)-[BWNRFProcessorInput adaptiveBracketingParameters](result);
    if (result)
    {
      v2 = result;
      if (dword_1EE6BE778)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      os_unfair_lock_lock(v2 + 2);
      LOBYTE(v2[6]._os_unfair_lock_opaque) = 1;
      os_unfair_lock_unlock(v2 + 2);
      LOBYTE(v1[20]._os_unfair_lock_opaque) = 1;
      return (os_unfair_lock_s *)objc_msgSend(*(id *)&v1[12]._os_unfair_lock_opaque, "inputReceivedAllFrames:", v1);
    }
  }
  return result;
}

- (void)adaptiveBracketingParameters
{
  uint64_t v1;

  if (result)
  {
    v1 = objc_msgSend((id)objc_msgSend(result, "captureStreamSettings"), "adaptiveBracketingParameters");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (void *)v1;
    else
      return 0;
  }
  return result;
}

- (void)stopAdaptiveBracketingWithGroup:(int)a3
{
  uint64_t v3;
  int v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int receivedFrames;

  v3 = *(_QWORD *)&a3;
  if (-[BWStillImageCaptureStreamSettings adaptiveBracketingParameters](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "adaptiveBracketingParameters"))
  {
    v5 = -[BWStillImageCaptureStreamSettings expectedAdaptiveBracketedFrameCaptureCountUsingGroup:](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "expectedAdaptiveBracketedFrameCaptureCountUsingGroup:", v3);
    if (dword_1EE6BE778)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_adaptiveBracketingStopFrameCount = v5;
    if (!self->_receivedAllFrames && v5 >= 1)
    {
      receivedFrames = self->_receivedFrames;
      self->_receivedAllFrames = receivedFrames >= v5;
      if (receivedFrames >= v5)
        -[BWNRFProcessorInputDelegate inputReceivedAllFrames:](self->_delegate, "inputReceivedAllFrames:", self);
    }
  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID");
  v6 = BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureSettings captureType](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureType"));
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType:%@ portType:%@ receivedFrames:%d fusionMode:%@ keepFrames:%d emitErrRecovery:%d processingCount:%u"), v4, self, v5, v6, -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_receivedFrames, BWPhotoEncoderStringFromEncodingScheme(self->_fusionMode), self->_keepFrames, self->_emitErrorRecoveryFrame, self->_remainingProcessingCount);
}

- (BWNRFProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int)fusionMode
{
  return self->_fusionMode;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
}

- (BOOL)emitErrorRecoveryFrame
{
  return self->_emitErrorRecoveryFrame;
}

- (void)setEmitErrorRecoveryFrame:(BOOL)a3
{
  self->_emitErrorRecoveryFrame = a3;
}

- (unsigned)remainingProcessingCount
{
  return self->_remainingProcessingCount;
}

- (void)setRemainingProcessingCount:(unsigned int)a3
{
  self->_remainingProcessingCount = a3;
}

@end
