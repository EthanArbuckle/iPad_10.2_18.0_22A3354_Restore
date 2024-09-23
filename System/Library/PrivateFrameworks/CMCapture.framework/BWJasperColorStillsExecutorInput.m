@implementation BWJasperColorStillsExecutorInput

- (BWJasperColorStillsExecutorInput)initWithSettings:(id)a3 portType:(id)a4 timeOfFlightCameraType:(int)a5
{
  BWJasperColorStillsExecutorInput *v6;
  int v7;
  int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWJasperColorStillsExecutorInput;
  v6 = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v10, sel_initWithSettings_portType_, a3, a4);
  if (v6)
  {
    v6->_pointClouds = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a5)
    {
      if (a5 == 1)
        v7 = 4;
      else
        v7 = 0;
      if (a5 == 2)
        v8 = 2;
      else
        v8 = v7;
      v6->_numberOfPointCloudsRequired = v8;
    }
    else
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *colorBuffer;
  objc_super v4;

  colorBuffer = self->_colorBuffer;
  if (colorBuffer)
    CFRelease(colorBuffer);
  v4.receiver = self;
  v4.super_class = (Class)BWJasperColorStillsExecutorInput;
  -[BWStillImageProcessorControllerInput dealloc](&v4, sel_dealloc);
}

- (void)addPointCloud:(opaqueCMSampleBuffer *)a3
{
  uint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    FigDebugAssert3();
    return;
  }
  -[NSMutableArray addObject:](self->_pointClouds, "addObject:");
  v4 = -[NSMutableArray count](self->_pointClouds, "count");
  if (v4 != 1)
  {
    if (0xCCCCCCCCCCCCCCCDLL * v4 > 0x3333333333333333 || dword_1EE6BE558 == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (dword_1EE6BE558)
  {
LABEL_9:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_10:
  if (-[BWJasperColorStillsExecutorInput isReadyToExecute](self, "isReadyToExecute", v7, v8))
    -[BWJasperColorStillsExecutorInputDelegate inputReadyToExecute:](self->_delegate, "inputReadyToExecute:", self);
}

- (void)setColorBufferPTS:(id *)a3 exposureTime:(double)a4
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_colorBufferPTS.value = *(_OWORD *)&a3->var0;
  self->_colorBufferPTS.epoch = var3;
  self->_colorBufferExposureTime = a4;
}

- (void)setColorBuffer:(opaqueCMSampleBuffer *)a3 type:(unint64_t)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  opaqueCMSampleBuffer *colorBuffer;
  opaqueCMSampleBuffer *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (dword_1EE6BE558)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  colorBuffer = self->_colorBuffer;
  if (colorBuffer)
    CFRelease(colorBuffer);
  if (a3)
    v9 = (opaqueCMSampleBuffer *)CFRetain(a3);
  else
    v9 = 0;
  self->_colorBuffer = v9;
  self->_colorBufferType = a4;
  if (-[BWJasperColorStillsExecutorInput isReadyToExecute](self, "isReadyToExecute", v10, v11))
    -[BWJasperColorStillsExecutorInputDelegate inputReadyToExecute:](self->_delegate, "inputReadyToExecute:", self);
}

- (BOOL)needMorePointClouds
{
  opaqueCMSampleBuffer *colorBuffer;
  CFStringRef *v4;
  const __CFString *v5;
  void *v6;
  opaqueCMSampleBuffer *v7;
  const __CFDictionary *v8;
  double Seconds;
  double colorBufferExposureTime;
  BOOL result;
  double v12;
  const void *v13;
  const __CFDictionary *v14;
  double v15;
  double v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMTime time;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_pointClouds, "count") < (unint64_t)self->_numberOfPointCloudsRequired)
    return 1;
  colorBuffer = self->_colorBuffer;
  v4 = (CFStringRef *)MEMORY[0x1E0D05CB0];
  if (!colorBuffer)
  {
    if ((self->_colorBufferPTS.flags & 1) != 0 && self->_colorBufferExposureTime > 0.0)
    {
      time = (CMTime)self->_colorBufferPTS;
      Seconds = CMTimeGetSeconds(&time);
      colorBufferExposureTime = self->_colorBufferExposureTime;
      goto LABEL_11;
    }
    return 1;
  }
  v5 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v6 = (void *)CMGetAttachment(colorBuffer, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v7 = self->_colorBuffer;
  if (v7)
  {
    v8 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v7, v5, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]);
    CMTimeMakeFromDictionary(&time, v8);
    Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    Seconds = 0.0;
  }
  objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]), "doubleValue");
  colorBufferExposureTime = v12;
LABEL_11:
  result = 1;
  if (Seconds > 0.0 && colorBufferExposureTime > 0.0)
  {
    v13 = (const void *)-[NSMutableArray lastObject](self->_pointClouds, "lastObject");
    if (v13)
    {
      v14 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v13, *v4, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]);
      CMTimeMakeFromDictionary(&time, v14);
      v15 = CMTimeGetSeconds(&time);
    }
    else
    {
      v15 = 0.0;
    }
    v16 = colorBufferExposureTime + Seconds + 0.01;
    result = v16 > v15;
    if (v16 <= v15 && dword_1EE6BE558 != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 0;
    }
  }
  return result;
}

- (void)jasperPointCloudsForColorBuffer
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  CFStringRef *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFString *v7;
  double v8;
  double v9;
  const void *v10;
  const __CFDictionary *v11;
  double Seconds;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  const void *v18;
  const __CFDictionary *v19;
  const void *v20;
  const __CFDictionary *v21;
  double v22;
  NSObject *v23;
  CFTypeRef CVDataBuffer;
  void *v25;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD v32[8];
  CMTime time;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (*(_QWORD *)(a1 + 88) && (v3 = objc_msgSend(*(id *)(a1 + 48), "count"), v4 = *(int *)(a1 + 104), v3 >= v4))
  {
    v5 = (CFStringRef *)MEMORY[0x1E0D05CB0];
    if (dword_1EE6BE558)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v4 = *(int *)(a1 + 104);
    }
    v7 = *v5;
    objc_msgSend((id)objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 88), *v5, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]), "doubleValue");
    v9 = v8;
    v10 = *(const void **)(a1 + 88);
    if (v10)
    {
      v11 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v10, v7, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]);
      CMTimeMakeFromDictionary(&time, v11);
      Seconds = CMTimeGetSeconds(&time);
    }
    else
    {
      Seconds = 0.0;
    }
    memset(v32, 0, sizeof(v32));
    v13 = *(int *)(a1 + 104);
    if (objc_msgSend(*(id *)(a1 + 48), "count", v28, v30) <= v13)
    {
      v14 = 0;
    }
    else
    {
      v14 = 0;
      v15 = *MEMORY[0x1E0D05D00];
      do
      {
        v16 = v14 % *(int *)(a1 + 104);
        v17 = *((double *)v32 + v16);
        if (v17 == 0.0)
        {
          v18 = (const void *)objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v14);
          if (v18)
          {
            v19 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v18, v7, 0), "objectForKeyedSubscript:", v15);
            CMTimeMakeFromDictionary(&time, v19);
            v17 = CMTimeGetSeconds(&time);
          }
          else
          {
            v17 = 0.0;
          }
        }
        v20 = (const void *)objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v13 + v14);
        if (v20)
        {
          v21 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v20, v7, 0), "objectForKeyedSubscript:", v15);
          CMTimeMakeFromDictionary(&time, v21);
          v22 = CMTimeGetSeconds(&time);
        }
        else
        {
          v22 = 0.0;
        }
        if (vabdd_f64(v9 * 0.5 + Seconds, v17) <= vabdd_f64(v9 * 0.5 + Seconds, v22))
          break;
        ++v14;
        *((double *)v32 + v16) = v22;
      }
      while (v13 + v14 < objc_msgSend(*(id *)(a1 + 48), "count"));
    }
    if (dword_1EE6BE558)
    {
      v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v14 < v14 + v4)
    {
      do
      {
        CVDataBuffer = BWSampleBufferGetCVDataBuffer((opaqueCMSampleBuffer *)objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v14, v29, v31));
        v25 = (void *)objc_msgSend(objc_alloc((Class)getADJasperPointCloudClass()), "initWithDataBuffer:", CVDataBuffer);
        objc_msgSend(v2, "addObject:", v25);

        ++v14;
        --v4;
      }
      while (v4);
    }
  }
  else
  {
    v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

- (BOOL)isReadyToExecute
{
  return self->_colorBuffer && !-[BWJasperColorStillsExecutorInput needMorePointClouds](self, "needMorePointClouds")
      || self->_skipProcessing;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@ : pointClouds:%lu (req:%d) colorBuf:%p skip:%d"), v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), -[NSMutableArray count](self->_pointClouds, "count"), self->_numberOfPointCloudsRequired, self->_colorBuffer, self->_skipProcessing);
}

- (BWJasperColorStillsExecutorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSArray)pointClouds
{
  return &self->_pointClouds->super;
}

- (unint64_t)colorBufferType
{
  return self->_colorBufferType;
}

- (opaqueCMSampleBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (BOOL)skipProcessing
{
  return self->_skipProcessing;
}

- (void)setSkipProcessing:(BOOL)a3
{
  self->_skipProcessing = a3;
}

@end
