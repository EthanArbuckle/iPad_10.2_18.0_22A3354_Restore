@implementation BWTemporalFilterNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)_supportedOutputPixelFormats
{
  void *v2;
  int v3;
  char IsFullRange;
  _QWORD v6[4];
  char v7;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E4A01AF0);
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "videoFormat"), "pixelFormat");
  if (v3)
  {
    IsFullRange = FigCapturePixelFormatIsFullRange(v3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__BWTemporalFilterNode__supportedOutputPixelFormats__block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSNumber_8__NSDictionary_16l;
    v7 = IsFullRange;
    objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v6));
  }
  return v2;
}

- (void)dealloc
{
  opaqueCMSimpleQueue *inputSampleBufferQueue;
  OpaqueVTPixelTransferSession *pixelTransferSession;
  OpaqueVTPixelTransferSession *v5;
  objc_super v6;

  if (self->_mctfSession)
    -[BWTemporalFilterNode _invalidateFilterSession]((uint64_t)self);
  inputSampleBufferQueue = self->_inputSampleBufferQueue;
  if (inputSampleBufferQueue)
    CFRelease(inputSampleBufferQueue);
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSession);
    v5 = self->_pixelTransferSession;
    if (v5)
    {
      CFRelease(v5);
      self->_pixelTransferSession = 0;
    }
  }

  -[BWTemporalFilterNode _dumpFrameStats]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)BWTemporalFilterNode;
  -[BWNode dealloc](&v6, sel_dealloc);
}

- (uint64_t)_invalidateFilterSession
{
  uint64_t v1;
  const void *v2;

  if (result)
  {
    v1 = result;
    VTTemporalFilterSessionCompleteFrames();
    VTTemporalFilterSessionInvalidate();
    v2 = *(const void **)(v1 + 112);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(v1 + 112) = 0;
    }
    *(_QWORD *)(v1 + 112) = 0;
    return CMSimpleQueueReset(*(CMSimpleQueueRef *)(v1 + 120));
  }
  return result;
}

- (uint64_t)_dumpFrameStats
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    if (dword_1EE6BEAD8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("NoiseReducer");
}

- (uint64_t)_dumpFrameMetaData:(uint64_t)result
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result && a2)
  {
    if (dword_1EE6BEAD8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->_videoOutput, "setFormat:", a3, a4);
  -[BWTemporalFilterNode _updateOutputRequirements]((uint64_t)self);
}

- (uint64_t)_updateOutputRequirements
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 104), "videoFormat"), "colorSpaceProperties");
    if ((_DWORD)v2)
    {
      v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
      v3 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    }
    else
    {
      v3 = 0;
    }
    v4 = -[BWTemporalFilterNode _supportedOutputPixelFormats](v1);
    v5 = (void *)objc_msgSend(*(id *)(v1 + 128), "formatRequirements");
    objc_msgSend(v5, "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(v1 + 104), "videoFormat"), "width"));
    objc_msgSend(v5, "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(v1 + 104), "videoFormat"), "height"));
    objc_msgSend(v5, "setSupportedColorSpaceProperties:", v3);
    return objc_msgSend(v5, "setSupportedPixelFormats:", v4);
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWTemporalFilterNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v13, sel_prepareForCurrentConfigurationToBecomeLive);
  if (!self->_mctfSession)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWVideoFormat pixelFormat](-[BWNodeInput videoFormat](self->_videoInput, "videoFormat"), "pixelFormat"));
    v5 = *MEMORY[0x1E0CA9040];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CA9040]);
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[BWVideoFormat width](-[BWNodeInput videoFormat](self->_videoInput, "videoFormat"), "width"));
    v12 = *MEMORY[0x1E0CA90E0];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6);
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[BWVideoFormat height](-[BWNodeInput videoFormat](self->_videoInput, "videoFormat"), "height"));
    v8 = *MEMORY[0x1E0CA8FD8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CA8FD8]);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid()), *MEMORY[0x1E0CEDB98]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("BWTemporalFilterNode"), *MEMORY[0x1E0CEDBA0]);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("com.apple.videotoolbox.temporalfilter.mctf"), *MEMORY[0x1E0CEDBA8]);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWVideoFormat pixelFormat](-[BWNodeOutput videoFormat](self->_videoOutput, "videoFormat"), "pixelFormat")), v5);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[BWVideoFormat width](-[BWNodeOutput videoFormat](self->_videoOutput, "videoFormat"), "width")), v12);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[BWVideoFormat height](-[BWNodeOutput videoFormat](self->_videoOutput, "videoFormat"), "height")), v8);
    -[BWVideoFormat width](-[BWNodeInput videoFormat](self->_videoInput, "videoFormat"), "width");
    -[BWVideoFormat height](-[BWNodeInput videoFormat](self->_videoInput, "videoFormat"), "height");
    VTTemporalFilterSessionCreate();
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  __CVPixelBufferPool *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (self->_videoInput == a5)
  {
    if (self->_mctfSession)
    {
      v6 = -[BWPixelBufferPool cvPixelBufferPool](-[BWNodeOutput preparedPixelBufferPool](self->_videoOutput, "preparedPixelBufferPool", a3, a4), "cvPixelBufferPool");
      if (v6)
      {
        VTSessionSetProperty(self->_mctfSession, (CFStringRef)*MEMORY[0x1E0CEDB88], v6);
        VTSessionSetProperty(self->_mctfSession, (CFStringRef)*MEMORY[0x1E0CEDB78], (CFTypeRef)*MEMORY[0x1E0CEDB60]);
        VTSessionSetProperty(self->_mctfSession, (CFStringRef)*MEMORY[0x1E0CEDB90], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
        VTSessionSetProperty(self->_mctfSession, CFSTR("TemporalFilterPriority"), &unk_1E49FBB50);
        -[BWNodeOutput makeConfiguredFormatLive](self->_videoOutput, "makeConfiguredFormatLive");
        if (dword_1EE6BEAD8)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  if (self->_mctfSession)
  {
    -[BWTemporalFilterNode _invalidateFilterSession]((uint64_t)self);
    v5.receiver = self;
    v5.super_class = (Class)BWTemporalFilterNode;
    -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
  }
}

- (__CVBuffer)_createMatchingOutputFormatIfNeededForInputBuffer:(uint64_t)a1
{
  OSType PixelFormatType;
  __CVBuffer *v5;

  if (!a1)
    return 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if (PixelFormatType == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 128), "videoFormat"), "pixelFormat")
    || !*(_QWORD *)(a1 + 144)
    && (VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelTransferSessionRef *)(a1 + 144))
     || !*(_QWORD *)(a1 + 144)))
  {
    return 0;
  }
  v5 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "livePixelBufferPool"), "newPixelBuffer");
  if (v5)
    VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 144), pixelBuffer, v5);
  return v5;
}

- (uint64_t)_shouldBypassTemporalFilteringForSampleBuffer:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;

  if (result)
  {
    v2 = result;
    result = (uint64_t)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (result)
    {
      v3 = (void *)result;
      result = objc_msgSend((id)objc_msgSend((id)result, "objectForKey:", *MEMORY[0x1E0D06C48]), "BOOLValue");
      if ((_DWORD)result)
      {
        v4 = *MEMORY[0x1E0D06C50];
        if (objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D06C50])
          && (objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v4), "BOOLValue") & 1) != 0)
        {
          return 0;
        }
        else
        {
          if (*(_QWORD *)(v2 + 160))
            v5 = 1;
          else
            v5 = dword_1EE6BEAD8 == 0;
          if (!v5)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (!*(_BYTE *)(v2 + 184))
          {
            if (!*(_BYTE *)(v2 + 143) && *(_QWORD *)(v2 + 152))
              VTTemporalFilterSessionCompleteFrames();
            if (dword_1EE6BEAD8)
            {
              v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            -[BWTemporalFilterNode _dumpFrameStats](v2);
          }
          ++*(_QWORD *)(v2 + 160);
          result = 1;
          *(_BYTE *)(v2 + 184) = 1;
        }
      }
    }
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  $B966B60A114CF620763079EA29D9FB9B *p_frameStats;
  unint64_t framesReceivedCount;
  BOOL v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFDictionary *Value;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  __CVBuffer *v24;
  uint64_t v25;
  __CVBuffer *v26;
  CFDictionaryRef v27;
  CFTypeRef v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  CMTime v37;
  os_log_type_t type;
  unsigned int v39;
  int v40;
  const char *v41;
  __int16 v42;
  BWTemporalFilterNode *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  unint64_t v47;
  CMTime v48[5];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  p_frameStats = &self->_frameStats;
  framesReceivedCount = self->_frameStats.framesReceivedCount;
  if (framesReceivedCount)
    v8 = 1;
  else
    v8 = dword_1EE6BEAD8 == 0;
  if (!v8)
  {
    v39 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    framesReceivedCount = p_frameStats->framesReceivedCount;
  }
  v10 = framesReceivedCount + 1;
  v11 = framesReceivedCount == -1;
  v12 = v11 << 63 >> 63;
  p_frameStats->framesReceivedCount = v10;
  if (v12 != v11 || v12 < 0)
  {
    if (dword_1EE6BEAD8)
    {
      v39 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(_OWORD *)&p_frameStats->framesReceivedCount = 0u;
    *(_OWORD *)&p_frameStats->framesWithMCTFAppliedCount = 0u;
  }
  if (self->_mctfSession)
  {
    v14 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (v14)
    {
      v15 = v14;
      if (self->_logMLVNRMetadata)
        -[BWTemporalFilterNode _dumpFrameMetaData:]((uint64_t)self, (uint64_t)v14);
      Value = (const __CFDictionary *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E0D05D00]);
      if (Value)
      {
        memset(&v37, 0, sizeof(v37));
        CMTimeMakeFromDictionary(&v37, Value);
        ImageBuffer = CMSampleBufferGetImageBuffer(a3);
        if (ImageBuffer)
        {
          v18 = ImageBuffer;
          os_unfair_lock_lock(&self->_inputSampleBufferQueueLock);
          if (CMSimpleQueueEnqueue(self->_inputSampleBufferQueue, a3))
          {
            os_unfair_lock_unlock(&self->_inputSampleBufferQueueLock);
          }
          else
          {
            if (a3)
              CFRetain(a3);
            os_unfair_lock_unlock(&self->_inputSampleBufferQueueLock);
            if (!self->_enforceTemporalFilter
              && (self->_bypassTemporalFilter
               || -[BWTemporalFilterNode _shouldBypassTemporalFilteringForSampleBuffer:]((uint64_t)self, a3)))
            {
              v24 = -[BWTemporalFilterNode _createMatchingOutputFormatIfNeededForInputBuffer:]((uint64_t)self, v18);
              if (v24)
              {
                v26 = v24;
                v48[0] = v37;
                btfn_temporalFilterSessionCallback((uint64_t)self, 0, v25, v48, v24);
                CFRelease(v26);
              }
              else
              {
                v48[0] = v37;
                btfn_temporalFilterSessionCallback((uint64_t)self, 0, v25, v48, v18);
              }
            }
            else
            {
              if (p_frameStats->lastFrameWasMLVNRAppliedFrame)
              {
                if (dword_1EE6BEAD8)
                {
                  v39 = 0;
                  type = OS_LOG_TYPE_DEFAULT;
                  v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  v20 = v39;
                  if (os_log_type_enabled(v19, type))
                    v21 = v20;
                  else
                    v21 = v20 & 0xFFFFFFFE;
                  if (v21)
                  {
                    v22 = -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C50]);
                    v23 = p_frameStats->framesReceivedCount;
                    v40 = 136315906;
                    v41 = "-[BWTemporalFilterNode renderSampleBuffer:forInput:]";
                    v42 = 2112;
                    v43 = self;
                    v44 = 2112;
                    v45 = v22;
                    v46 = 2048;
                    v47 = v23;
                    LODWORD(v36) = 42;
                    v35 = &v40;
                    _os_log_send_and_compose_impl();
                  }
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                -[BWTemporalFilterNode _dumpFrameStats]((uint64_t)self);
              }
              p_frameStats->lastFrameWasMLVNRAppliedFrame = 0;
              ++p_frameStats->framesWithMCTFAppliedCount;
              if (self->_mctfUsesMLVNRPixelBufferAttachments)
              {
                v27 = CVBufferCopyAttachments(v18, kCVAttachmentMode_ShouldPropagate);
                if (v27 && (v28 = CFAutorelease(v27)) != 0)
                  v29 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v28);
                else
                  v29 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v35, v36);
                v30 = (void *)v29;
                v31 = *MEMORY[0x1E0D06C48];
                v32 = -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C48], v35, v36);
                if (v32)
                  objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, v31);
                v33 = *MEMORY[0x1E0D06C50];
                v34 = -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C50]);
                if (v34)
                  objc_msgSend(v30, "setObject:forKeyedSubscript:", v34, v33);
                CVBufferSetAttachments(v18, (CFDictionaryRef)v30, kCVAttachmentMode_ShouldPropagate);
              }
              v48[0] = v37;
              VTTemporalFilterSessionProcessFrame();
            }
          }
        }
      }
    }
  }
}

BOOL __52__BWTemporalFilterNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange(objc_msgSend(a2, "intValue"));
}

- (void)_dropInputSampleBuffer:(uint64_t)a1
{
  const __CFDictionary *v3;
  const __CFDictionary *Value;
  id v5;
  CMTime v6;
  CMTime v7;

  if (a1)
  {
    if (target)
    {
      v3 = (const __CFDictionary *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (v3)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0D05D00]);
        if (Value)
        {
          memset(&v7, 0, sizeof(v7));
          CMTimeMakeFromDictionary(&v7, Value);
          v6 = v7;
          v5 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F1B8, &v6);
          objc_msgSend(*(id *)(a1 + 128), "emitDroppedSample:", v5);

        }
      }
    }
  }
}

@end
