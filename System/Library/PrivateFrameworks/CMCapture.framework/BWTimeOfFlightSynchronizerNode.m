@implementation BWTimeOfFlightSynchronizerNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWTimeOfFlightSynchronizerNode)init
{
  BWTimeOfFlightSynchronizerNode *v2;
  BWTimeOfFlightSynchronizerNode *v3;
  BWNodeInput *v4;
  BWNodeInput *v5;
  BWPointCloudFormatRequirements *v6;
  BWNodeOutput *v7;
  BWPointCloudFormatRequirements *v8;
  BWNodeOutputMediaConfiguration *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWTimeOfFlightSynchronizerNode;
  v2 = -[BWNode init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lastEmittedPTS = 0.0;
    v2->_maxVideoBufferQueueDepth = 1;
    v2->_maxPointCloudBufferQueueDepth = 10;
    -[BWNode setSupportsConcurrentLiveInputCallbacks:](v2, "setSupportsConcurrentLiveInputCallbacks:", 1);
    v4 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v3, 0);
    v3->_videoInput = v4;
    -[BWNodeInput setRetainedBufferCount:](v4, "setRetainedBufferCount:", v3->_maxVideoBufferQueueDepth);
    -[BWNodeInput setFormatRequirements:](v3->_videoInput, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v3->_videoInput, "setPassthroughMode:", 1);
    -[BWNode addInput:](v3, "addInput:", v3->_videoInput);
    v5 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1885564004, v3, 1);
    v3->_pointCloudInput = v5;
    -[BWNodeInput setRetainedBufferCount:](v5, "setRetainedBufferCount:", v3->_maxPointCloudBufferQueueDepth);
    -[BWNodeInput setPassthroughMode:](v3->_pointCloudInput, "setPassthroughMode:", 0);
    v6 = objc_alloc_init(BWPointCloudFormatRequirements);
    -[BWPointCloudFormatRequirements setSupportedDataFormats:](v6, "setSupportedDataFormats:", &unk_1E4A00608);
    -[BWNodeInput setFormatRequirements:](v3->_pointCloudInput, "setFormatRequirements:", v6);
    -[BWNode addInput:](v3, "addInput:", v3->_pointCloudInput);
    v7 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v3);
    -[BWNodeOutput setPassthroughMode:](v7, "setPassthroughMode:", 1);
    -[BWNodeOutput setFormatRequirements:](v7, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    v8 = objc_alloc_init(BWPointCloudFormatRequirements);
    -[BWPointCloudFormatRequirements setSupportedDataFormats:](v8, "setSupportedDataFormats:", &unk_1E4A00620);
    v9 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v9, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v9, "setFormatRequirements:", v8);
    -[BWNodeOutputMediaConfiguration setProvidesDataBufferPool:](v9, "setProvidesDataBufferPool:", 1);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v7, "setMediaConfiguration:forAttachedMediaKey:", v9, 0x1E495AE18);
    -[BWNode addOutput:](v3, "addOutput:", v7);
    v3->_pointCloudBufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_videoBufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_bufferServicingLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  opaqueCMFormatDescription *pointCloudFormatDescription;
  objc_super v4;

  pointCloudFormatDescription = self->_pointCloudFormatDescription;
  if (pointCloudFormatDescription)
    CFRelease(pointCloudFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWTimeOfFlightSynchronizerNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Muxer");
}

- (id)nodeSubType
{
  return CFSTR("TimeOfFlightSynchronizer");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWPointCloudFormatRequirements *v9;
  BWNodeOutputMediaConfiguration *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_videoInput == a4)
  {
    if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
      -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
  }
  else
  {
    v9 = objc_alloc_init(BWPointCloudFormatRequirements);
    -[BWPointCloudFormatRequirements setSupportedDataFormats:](v9, "setSupportedDataFormats:", &unk_1E4A00638);
    -[BWPointCloudFormatRequirements setDataBufferSize:](v9, "setDataBufferSize:", 4 * objc_msgSend(a3, "dataBufferSize"));
    -[BWPointCloudFormatRequirements setMaxPoints:](v9, "setMaxPoints:", 4 * objc_msgSend(a3, "maxPoints"));
    v10 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v10, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v10, "setFormatRequirements:", v9);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v10, 0x1E495AE18);
    v12[0] = v9;
    self->_dataBufferPool = -[BWDataBufferPool initWithFormat:capacity:name:clientProvidesPool:]([BWDataBufferPool alloc], "initWithFormat:capacity:name:clientProvidesPool:", +[BWPointCloudFormat formatByResolvingRequirements:](BWPointCloudFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1)), 10, CFSTR("Time of flight pool"), 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)BWTimeOfFlightSynchronizerNode;
  -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v11, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (!-[BWNodeOutput liveFormat](self->super._output, "liveFormat"))
    -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive");
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  int *p_numEODMessagesReceived;
  unsigned int v5;

  p_numEODMessagesReceived = &self->_numEODMessagesReceived;
  do
    v5 = __ldxr((unsigned int *)p_numEODMessagesReceived);
  while (__stxr(v5 + 1, (unsigned int *)p_numEODMessagesReceived));
  if (-[NSArray count](-[BWNode inputs](self, "inputs", a3), "count") == v5 + 1)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    *p_numEODMessagesReceived = 0;
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;
  int *v8;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_videoInput == a4)
    v8 = &OBJC_IVAR___BWTimeOfFlightSynchronizerNode__videoBufferQueue;
  else
    v8 = &OBJC_IVAR___BWTimeOfFlightSynchronizerNode__pointCloudBufferQueue;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v8), "addObject:", a3);
  -[BWTimeOfFlightSynchronizerNode _tryToEmitBuffers]((unint64_t)self);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (unint64_t)_tryToEmitBuffers
{
  unint64_t v1;
  const __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  BOOL v6;
  char v7;
  void *v8;
  double Seconds;
  double v10;
  char v11;
  CMTime time;

  if (result)
  {
    v1 = result;
    if (objc_msgSend(*(id *)(result + 136), "count"))
    {
      v2 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v3 = *MEMORY[0x1E0D05D00];
      v4 = *MEMORY[0x1E0D06A20];
      do
      {
        v5 = (const void *)objc_msgSend(*(id *)(v1 + 136), "objectAtIndexedSubscript:", 0);
        v6 = objc_msgSend(*(id *)(v1 + 136), "count") > (unint64_t)*(int *)(v1 + 156)
          || objc_msgSend(*(id *)(v1 + 128), "count") > (unint64_t)*(int *)(v1 + 160);
        v11 = 0;
        v7 = -[BWTimeOfFlightSynchronizerNode _attachPointCloudsToSampleBufferOrReportMissing:pointCloudsAreMissing:](v1, v5, &v11);
        if (!v6 && (v7 & 1) == 0 && !v11)
          break;
        v8 = (void *)CMGetAttachment(v5, v2, 0);
        CMTimeMakeFromDictionary(&time, (CFDictionaryRef)objc_msgSend(v8, "objectForKeyedSubscript:", v3));
        Seconds = CMTimeGetSeconds(&time);
        objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v4), "doubleValue");
        *(double *)(v1 + 104) = Seconds + v10 * 0.5;
        objc_msgSend(*(id *)(v1 + 16), "emitSampleBuffer:", v5);
        objc_msgSend(*(id *)(v1 + 136), "removeObject:", v5);
      }
      while (objc_msgSend(*(id *)(v1 + 136), "count"));
    }
    return -[BWTimeOfFlightSynchronizerNode _cleanupPointCloudBufferQueue](v1);
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;

  if (self->_videoInput == a4)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", a3);
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
}

- (uint64_t)_attachPointCloudsToSampleBufferOrReportMissing:(_BYTE *)a3 pointCloudsAreMissing:
{
  const void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  double Seconds;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  const void *v21;
  const __CFDictionary *v22;
  double v23;
  uint64_t v25;
  __CVBuffer *v26;
  __CVBuffer *v27;
  _BYTE *v29;
  unsigned int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CFTypeRef cf;
  CMTime time;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  cf = 0;
  v6 = (const void *)objc_msgSend(*(id *)(a1 + 128), "lastObject");
  if (!v6)
    return 0;
  v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v8 = (void *)CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v9 = *MEMORY[0x1E0D05D00];
  CMTimeMakeFromDictionary(&time, (CFDictionaryRef)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
  Seconds = CMTimeGetSeconds(&time);
  v11 = (void *)CMGetAttachment(a2, v7, 0);
  CMTimeMakeFromDictionary(&time, (CFDictionaryRef)objc_msgSend(v11, "objectForKeyedSubscript:", v9));
  v12 = CMTimeGetSeconds(&time);
  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]), "doubleValue");
  v14 = v12 + v13 * 0.5;
  if (Seconds + 0.0083 <= v14 + 0.0166)
    return 0;
  v29 = a3;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", Seconds + 0.0083);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = *(void **)(a1 + 128);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        v21 = *(const void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v22 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v21, v7, 0), "objectForKeyedSubscript:", v9);
        CMTimeMakeFromDictionary(&time, v22);
        v23 = CMTimeGetSeconds(&time);
        if (v23 > v14 + -0.0166 && v23 <= v14 + 0.0166)
          objc_msgSend(v15, "addObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v18);
  }
  if (!objc_msgSend(v15, "count") && Seconds > v14)
  {
    v25 = 0;
    *v29 = 1;
    return v25;
  }
  if (!objc_msgSend(v15, "count"))
    return 0;
  v26 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 168), "newDataBuffer");
  if (!v26)
    return 0;
  v27 = v26;
  v30 = 0;
  if (-[BWTimeOfFlightSynchronizerNode _mergePointClouds:intoDataBuffer:numberOfPoints:](a1, v15, v26, &v30))
  {
    time = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    BWSampleBufferCreateFromDataBufferWithNumberOfPoints(v27, (uint64_t)&time, 0x6A737070u, (CFTypeRef *)(a1 + 144), &cf, v30);
    if (cf)
    {
      BWSampleBufferSetAttachedMedia(a2, 0x1E495AE18, (uint64_t)cf);
      v25 = 1;
      goto LABEL_24;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  v25 = 0;
LABEL_24:
  CFRelease(v27);
  if (cf)
    CFRelease(cf);
  return v25;
}

- (unint64_t)_cleanupPointCloudBufferQueue
{
  unint64_t v1;
  const __CFString *v2;
  uint64_t v3;
  const void *v4;
  const __CFDictionary *v5;
  double Seconds;
  double v7;
  CMTime time;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 128), "count");
    if (result)
    {
      v2 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v3 = *MEMORY[0x1E0D05D00];
      do
      {
        v4 = (const void *)objc_msgSend(*(id *)(v1 + 128), "objectAtIndexedSubscript:", 0);
        v5 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v4, v2, 0), "objectForKeyedSubscript:", v3);
        CMTimeMakeFromDictionary(&time, v5);
        Seconds = CMTimeGetSeconds(&time);
        v7 = *(double *)(v1 + 104);
        if (v7 == 0.0 || Seconds > v7 + 0.0166)
        {
          result = objc_msgSend(*(id *)(v1 + 128), "count", Seconds);
          if (result <= *(int *)(v1 + 160))
            break;
        }
        objc_msgSend(*(id *)(v1 + 128), "removeObject:", v4, Seconds);
        result = objc_msgSend(*(id *)(v1 + 128), "count");
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_mergePointClouds:(__CVBuffer *)a3 intoDataBuffer:(_DWORD *)a4 numberOfPoints:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CVBuffer *CVDataBuffer;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  CFTypeRef v23;
  CFTypeRef v24;
  __CVBuffer *buffer;
  _DWORD *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v7)
    {
      v8 = v7;
      LODWORD(v9) = 0;
      v10 = *(_QWORD *)v33;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(a2);
        CVDataBuffer = (__CVBuffer *)BWSampleBufferGetCVDataBuffer(*(opaqueCMSampleBuffer **)(*((_QWORD *)&v32 + 1)
                                                                                            + 8 * v11));
        v13 = (id)objc_msgSend(objc_alloc((Class)getADJasperPointCloudClass()), "initWithDataBuffer:", CVDataBuffer);
        if (!v13)
          goto LABEL_24;
        v14 = v13;
        v9 = objc_msgSend(v13, "length") + v9;
        objc_msgSend(obj, "addObject:", v14);
        if (v8 == ++v11)
        {
          v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
    }
    v9 = 0;
    CVDataBuffer = 0;
LABEL_12:
    result = objc_msgSend((id)getADJasperPointCloudClass(), "prepareDataBuffer:forLength:", a3, v9);
    if ((_DWORD)result)
    {
      v15 = (id)objc_msgSend(objc_alloc((Class)getADMutableJasperPointCloudClass()), "initWithDataBuffer:", a3);
      if (!v15)
      {
LABEL_24:
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
      v16 = v15;
      buffer = a3;
      v26 = a4;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v17)
      {
        v18 = v17;
        v19 = 0;
        v20 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v29 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v16, "replacePointsInRange:withPointsFrom:range:", v19, (int)objc_msgSend(v22, "length"), v22, 0, (int)objc_msgSend(v22, "length"));
            v19 += objc_msgSend(v22, "length");
          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v18);
      }
      if (CVDataBuffer)
      {
        v23 = CVBufferCopyAttachment(CVDataBuffer, CFSTR("CameraCalibration"), 0);
        if (v23)
          v24 = CFAutorelease(v23);
        else
          v24 = 0;
        CVBufferSetAttachment(buffer, CFSTR("CameraCalibration"), v24, kCVAttachmentMode_ShouldPropagate);
      }
      *v26 = v9;
      return 1;
    }
  }
  return result;
}

- (BWNodeInput)videoInput
{
  return self->_videoInput;
}

- (BWNodeInput)pointCloudInput
{
  return self->_pointCloudInput;
}

@end
