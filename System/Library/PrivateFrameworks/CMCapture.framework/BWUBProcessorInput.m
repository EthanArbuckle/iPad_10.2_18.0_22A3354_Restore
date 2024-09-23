@implementation BWUBProcessorInput

- (BWUBProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  BWUBProcessorInput *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWUBProcessorInput;
  v4 = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v6, sel_initWithSettings_portType_, a3, a4);
  if (v4)
  {
    v4->_frames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_keepFrames = 1;
    v4->_fusionMode = 0;
    v4->_oisRecenteringLoggingData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *referenceFrame;
  opaqueCMSampleBuffer *errorRecoveryFrame;
  objc_super v5;

  referenceFrame = self->_referenceFrame;
  if (referenceFrame)
    CFRelease(referenceFrame);
  errorRecoveryFrame = self->_errorRecoveryFrame;
  if (errorRecoveryFrame)
    CFRelease(errorRecoveryFrame);

  v5.receiver = self;
  v5.super_class = (Class)BWUBProcessorInput;
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

- (void)addFrame:(opaqueCMSampleBuffer *)a3
{
  int receivedFrames;
  int v6;
  char AdaptiveBracketingFrame;
  BOOL *p_receivedAllFrames;
  int adaptiveBracketingStopFrameCount;
  BOOL v10;
  int v11;
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

  if (!a3)
  {
    FigDebugAssert3();
    return;
  }
  receivedFrames = self->_receivedFrames;
  v6 = -[BWStillImageCaptureStreamSettings referenceFrameIndex](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "referenceFrameIndex");
  ++self->_receivedFrames;
  if (!-[BWStillImageCaptureStreamSettings adaptiveBracketingParameters](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "adaptiveBracketingParameters"))
  {
    v11 = self->_receivedFrames;
    v10 = v11 == -[BWStillImageCaptureStreamSettings expectedFrameCount](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "expectedFrameCount");
    p_receivedAllFrames = &self->_receivedAllFrames;
LABEL_8:
    *p_receivedAllFrames = v10;
    goto LABEL_9;
  }
  AdaptiveBracketingFrame = BWIsLastAdaptiveBracketingFrame(a3);
  p_receivedAllFrames = &self->_receivedAllFrames;
  self->_receivedAllFrames = AdaptiveBracketingFrame;
  adaptiveBracketingStopFrameCount = self->_adaptiveBracketingStopFrameCount;
  if (adaptiveBracketingStopFrameCount >= 1)
  {
    v10 = (AdaptiveBracketingFrame & 1) != 0 || self->_receivedFrames >= adaptiveBracketingStopFrameCount;
    goto LABEL_8;
  }
LABEL_9:
  if (self->_keepFrames)
    -[NSMutableArray addObject:](self->_frames, "addObject:", a3);
  if (-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType") == 11)
  {
    v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v13 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E60]);
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
      objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B70]), "floatValue");
      v35 = v34;
      v36 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959BF8), "floatValue");
      *(float *)&v38 = (float)(v35 + (float)(v37 * v26)) / (float)(int)v29;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", objc_msgSend(v36, "numberWithFloat:", v38), 0x1E4959BF8);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29), CFSTR("numberOfFrames"));
    }
  }
  -[BWUBProcessorInputDelegate input:addFrame:isReferenceFrame:](self->_delegate, "input:addFrame:isReferenceFrame:", self, a3, receivedFrames == v6);
}

- (int)receivedFrames
{
  return self->_receivedFrames;
}

- (BOOL)receivedAllFrames
{
  return self->_receivedAllFrames;
}

- (opaqueCMSampleBuffer)referenceFrame
{
  opaqueCMSampleBuffer *referenceFrame;
  int v4;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;

  referenceFrame = self->_referenceFrame;
  if (!referenceFrame)
  {
    if ((-[BWStillImageCaptureStreamSettings referenceFrameIndex](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "referenceFrameIndex") & 0x80000000) == 0)
    {
      v4 = -[BWStillImageCaptureStreamSettings referenceFrameIndex](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "referenceFrameIndex");
      if (-[NSMutableArray count](self->_frames, "count") > (unint64_t)v4)
        return (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", -[BWStillImageCaptureStreamSettings referenceFrameIndex](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "referenceFrameIndex"));
    }
    if (-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType") == 2&& -[NSMutableArray count](self->_frames, "count"))
    {
      v6 = 0;
      v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v8 = *MEMORY[0x1E0D06D60];
      while (1)
      {
        referenceFrame = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v6);
        if ((objc_msgSend((id)objc_msgSend((id)CMGetAttachment(referenceFrame, v7, 0), "objectForKeyedSubscript:", v8), "BOOLValue") & 1) == 0)break;
        if (-[NSMutableArray count](self->_frames, "count") <= (unint64_t)++v6)
          return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return referenceFrame;
}

- (_QWORD)_setReferenceFrame:(_QWORD *)result
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)result[10];
    if (result != cf)
    {
      if (result)
        CFRelease(result);
      if (cf)
        result = CFRetain(cf);
      else
        result = 0;
      v3[10] = result;
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)evMinusReferenceFrame
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  float v9;

  if ((-[BWStillImageCaptureStreamSettings captureFlags](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureFlags") & 0x100000) == 0|| !-[NSMutableArray count](self->_frames, "count"))
  {
    return 0;
  }
  v3 = 0;
  v4 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v5 = *MEMORY[0x1E0D06D80];
  v6 = *MEMORY[0x1E0D06038];
  while (1)
  {
    v7 = (const void *)-[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v3);
    v8 = (void *)CMGetAttachment(v7, v4, 0);
    if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v5), "BOOLValue") & 1) != 0)
      break;
    objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v6), "floatValue");
    if (v9 < 0.0)
      break;
    if (-[NSMutableArray count](self->_frames, "count") <= (unint64_t)++v3)
      return 0;
  }
  return (opaqueCMSampleBuffer *)v7;
}

- (opaqueCMSampleBuffer)errorRecoveryFrame
{
  opaqueCMSampleBuffer *errorRecoveryFrame;
  opaqueCMSampleBuffer *v4;
  uint64_t v5;

  errorRecoveryFrame = self->_errorRecoveryFrame;
  if (!errorRecoveryFrame)
  {
    v4 = -[BWUBProcessorInput referenceFrame](self, "referenceFrame");
    if (-[NSMutableArray count](self->_frames, "count"))
    {
      v5 = 0;
      while (1)
      {
        errorRecoveryFrame = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v5);
        if (-[BWStillImageCaptureStreamSettings isUnifiedBracketingErrorRecoveryFrame:isReferenceFrame:](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "isUnifiedBracketingErrorRecoveryFrame:isReferenceFrame:", errorRecoveryFrame, errorRecoveryFrame == v4))
        {
          break;
        }
        if (-[NSMutableArray count](self->_frames, "count") <= (unint64_t)++v5)
          return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return errorRecoveryFrame;
}

- (_QWORD)_setErrorRecoveryFrame:(_QWORD *)result
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

- (opaqueCMSampleBuffer)originalImage
{
  if (-[BWStillImageCaptureSettings deliverOriginalImage](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "deliverOriginalImage"))
  {
    return -[BWUBProcessorInput errorRecoveryFrame](self, "errorRecoveryFrame");
  }
  else
  {
    return 0;
  }
}

- (void)stopAdaptiveBracketingNow
{
  void *v1;
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v1 = result;
    result = -[BWUBProcessorInput adaptiveBracketingParameters](result);
    if (result)
    {
      v2 = (uint64_t)result;
      if (dword_1EE6BE598)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[BWUBAdaptiveBracketingParameters stopAdaptiveBracketing](v2);
      *((_BYTE *)v1 + 72) = 1;
      return (void *)objc_msgSend(*((id *)v1 + 6), "inputReceivedAllFrames:", v1);
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
    if (dword_1EE6BE598)
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
        -[BWUBProcessorInputDelegate inputReceivedAllFrames:](self->_delegate, "inputReceivedAllFrames:", self);
    }
  }
}

- (void)updateAdaptiveBracketingFrameParametersIfNeededUsingFrame:(int)a3 err:
{
  void *v4;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    if (a3)
    {
      v4 = -[BWUBProcessorInput adaptiveBracketingParameters](a1);
      -[BWUBAdaptiveBracketingParameters stopAdaptiveBracketing]((uint64_t)v4);
    }
    else if ((objc_msgSend((id)objc_msgSend(a1, "captureStreamSettings"), "reachedEndOfAdaptiveBracketing") & 1) == 0)
    {
      v6 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05DF8]), "intValue")+ 1;
      v7 = -[BWUBProcessorInput adaptiveBracketingParameters](a1);
      -[BWUBAdaptiveBracketingParameters updateAdaptiveBracketingFrameParametersUsingGroup:]((uint64_t)v7, v6);
    }
  }
}

- (BWUBProcessorInputDelegate)delegate
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
