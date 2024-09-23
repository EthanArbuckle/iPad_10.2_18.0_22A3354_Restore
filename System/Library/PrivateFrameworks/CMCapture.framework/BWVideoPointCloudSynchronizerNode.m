@implementation BWVideoPointCloudSynchronizerNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWVideoPointCloudSynchronizerNode)initWithCaptureDevice:(id)a3 timeOfFlightCameraType:(int)a4
{
  BWVideoPointCloudSynchronizerNode *v6;
  BWFigVideoCaptureDevice *v7;
  float v8;
  int v9;
  BWNodeInput *v10;
  BWNodeInput *v11;
  BWNodeInputMediaConfiguration *v12;
  BWNodeOutput *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BWVideoPointCloudSynchronizerNode;
  v6 = -[BWNode init](&v15, sel_init);
  if (v6)
  {
    v7 = (BWFigVideoCaptureDevice *)a3;
    v6->_captureDevice = v7;
    -[BWFigVideoCaptureDevice depthMaxFrameRate](v7, "depthMaxFrameRate");
    v6->_depthMaxFrameRate = v8;
    v6->_depthMaxFrameRateAdjustmentPending = 1;
    v6->_multiplePointCloudAttachmentsEnabled = a4 == 2;
    if (a4 == 2)
      v9 = 2;
    else
      v9 = 1;
    v6->_latestPointCloudBuffersCapacity = v9;
    v6->_latestPointCloudBuffers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6->_latestPointCloudBuffersCapacity);
    v10 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v6, 0);
    -[BWNodeInput setFormatRequirements:](v10, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v10, "setPassthroughMode:", 1);
    -[BWNode addInput:](v6, "addInput:", v10);
    v11 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1885564004, v6, 1);
    -[BWNodeInput setFormatRequirements:](v11, "setFormatRequirements:", objc_alloc_init(BWPointCloudFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v11, "setPassthroughMode:", 1);
    -[BWNodeInput setRetainedBufferCount:](v11, "setRetainedBufferCount:", v6->_latestPointCloudBuffersCapacity);
    v12 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v12, "setPassthroughMode:", 0);
    -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v11, "setUnspecifiedAttachedMediaConfiguration:", v12);
    -[BWNode addInput:](v6, "addInput:", v11);
    v6->_imageInput = v10;
    v6->_pointCloudInput = v11;
    v13 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v13, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v13, "setPassthroughMode:", 1);
    -[BWVideoPointCloudSynchronizerNode _setUpPointCloudMediaConfigurationForOutput:inputAttachedMediaKey:outputAttachedMediaKey:](v6, "_setUpPointCloudMediaConfigurationForOutput:inputAttachedMediaKey:outputAttachedMediaKey:", v13, CFSTR("PrimaryFormat"), 0x1E494FB58);
    if (v6->_multiplePointCloudAttachmentsEnabled)
      -[BWVideoPointCloudSynchronizerNode _setUpPointCloudMediaConfigurationForOutput:inputAttachedMediaKey:outputAttachedMediaKey:](v6, "_setUpPointCloudMediaConfigurationForOutput:inputAttachedMediaKey:outputAttachedMediaKey:", v13, CFSTR("PrimaryFormat"), 0x1E495B138);
    -[BWNode addOutput:](v6, "addOutput:", v13);
    v6->_bufferServicingLock._os_unfair_lock_opaque = 0;
    -[BWFigVideoCaptureDevice setMaxDepthFrameRateChangedDelegate:](v6->_captureDevice, "setMaxDepthFrameRateChangedDelegate:", v6);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoPointCloudSynchronizerNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;
  unint64_t v8;
  int v9;
  double v10;
  double v11;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_imageInput == a4)
  {
    if (self->_depthMaxFrameRateAdjustmentPending)
    {
      objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06978]), "floatValue");
      LODWORD(v10) = v9;
      *(float *)&v11 = self->_depthMaxFrameRate;
      -[BWVideoPointCloudSynchronizerNode _updateNumberOfReceivedRGBFramesBeforeEmittingDepthFrameWithDepthMaxFrameRate:rgbMaxFrameRate:](self, "_updateNumberOfReceivedRGBFramesBeforeEmittingDepthFrameWithDepthMaxFrameRate:rgbMaxFrameRate:", v11, v10);
      self->_depthMaxFrameRateAdjustmentPending = 0;
    }
    if (self->_shouldLetThroughFrames)
      ++self->_numberOfReceivedRGBFramesSinceLastDepthFrameEmission;
    if (-[BWVideoPointCloudSynchronizerNode _shouldEmitBuffer](self, "_shouldEmitBuffer"))
      -[BWVideoPointCloudSynchronizerNode _tryToEmitBuffersWithRGBBuffer:](self, "_tryToEmitBuffersWithRGBBuffer:", a3);
  }
  else if (self->_pointCloudInput == a4)
  {
    v8 = self->_numberOfReceivedPointCloudFramesBeforeEmitted % self->_latestPointCloudBuffersCapacity;
    self->_indexForLatestReceivedPointCloudFrame = v8;
    -[NSMutableArray setObject:atIndexedSubscript:](self->_latestPointCloudBuffers, "setObject:atIndexedSubscript:", a3, (int)v8);
    ++self->_numberOfReceivedPointCloudFramesBeforeEmitted;
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BWNodeOutputMediaProperties *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *obj;
  uint64_t v25;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  void *v39;
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = -[BWNode outputs](self, "outputs");
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v28)
  {
    v25 = *(_QWORD *)v35;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(obj);
        v29 = v6;
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v8)
        {
          v9 = (void *)v8;
          if (objc_msgSend(v7, "passthroughMode"))
          {
            if (self->_multiplePointCloudAttachmentsEnabled
              && objc_msgSend(v9, "isEqualToString:", 0x1E494FB58))
            {
              v40[0] = 0x1E494FB58;
              v40[1] = 0x1E495B138;
              v10 = (void *)MEMORY[0x1E0C99D20];
              v11 = (void **)v40;
              v12 = 2;
            }
            else
            {
              v39 = v9;
              v10 = (void *)MEMORY[0x1E0C99D20];
              v11 = &v39;
              v12 = 1;
            }
            v13 = (void *)objc_msgSend(v10, "arrayWithObjects:count:", v11, v12);
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v31;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v31 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                  v19 = (BWNodeOutputMediaProperties *)objc_msgSend(v7, "mediaPropertiesForAttachedMediaKey:", v18);
                  v20 = objc_msgSend(v18, "isEqualToString:", CFSTR("PrimaryFormat"));
                  if (v19)
                  {
                    if ((v20 & 1) == 0)
                    {
                      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, v7, v18, a5);
                      goto LABEL_28;
                    }
                  }
                  else
                  {
                    if (v20)
                    {
                      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ has no media properties for the primary format (provided media key is %@)"), self, v7, a5, v22);
LABEL_28:
                      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0));
                    }
                    v19 = objc_alloc_init(BWNodeOutputMediaProperties);
                    objc_msgSend(v7, "_setMediaProperties:forAttachedMediaKey:", v19, v18);
                  }
                  -[BWNodeOutputMediaProperties setResolvedFormat:](v19, "setResolvedFormat:", a3);
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v15);
            }
          }
        }
        v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v28);
  }
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
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", a3, a4);
}

- (void)_tryToEmitBuffersWithRGBBuffer:(opaqueCMSampleBuffer *)a3
{
  os_unfair_lock_assert_owner(&self->_bufferServicingLock);
  if (-[BWVideoPointCloudSynchronizerNode _attachPointCloudDataToSampleBuffer:](self, "_attachPointCloudDataToSampleBuffer:", a3))
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    self->_numberOfReceivedRGBFramesSinceLastDepthFrameEmission = 0;
  }
}

- (BOOL)_attachPointCloudDataToSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  opaqueCMSampleBuffer *v5;
  opaqueCMSampleBuffer *v6;
  float Seconds;
  float v8;
  BOOL v9;
  unint64_t v10;
  CMTime v12;
  CMTime lhs;
  CMTime time;
  CMTime v15;
  CMTime v16;

  os_unfair_lock_assert_owner(&self->_bufferServicingLock);
  if (self->_numberOfReceivedPointCloudFramesBeforeEmitted < self->_latestPointCloudBuffersCapacity)
    return 0;
  if (self->_multiplePointCloudAttachmentsEnabled)
  {
    v5 = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_latestPointCloudBuffers, "objectAtIndexedSubscript:", self->_indexForLatestReceivedPointCloudFrame == 0);
    v6 = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_latestPointCloudBuffers, "objectAtIndexedSubscript:", self->_indexForLatestReceivedPointCloudFrame);
    memset(&v16, 0, sizeof(v16));
    CMSampleBufferGetPresentationTimeStamp(&v16, v5);
    memset(&v15, 0, sizeof(v15));
    CMSampleBufferGetPresentationTimeStamp(&v15, v6);
    lhs = v15;
    v12 = v16;
    CMTimeSubtract(&time, &lhs, &v12);
    Seconds = CMTimeGetSeconds(&time);
    v8 = Seconds * 1000.0;
    v9 = v8 < 40.0;
    if (v8 < 40.0)
    {
      BWSampleBufferSetAttachedMedia(a3, 0x1E494FB58, (uint64_t)v5);
      BWSampleBufferSetAttachedMedia(a3, 0x1E495B138, (uint64_t)v6);
      -[NSMutableArray removeAllObjects](self->_latestPointCloudBuffers, "removeAllObjects");
      v10 = 0;
    }
    else
    {
      -[NSMutableArray removeObject:](self->_latestPointCloudBuffers, "removeObject:", v5);
      v10 = 1;
    }
    self->_numberOfReceivedPointCloudFramesBeforeEmitted = v10;
  }
  else
  {
    BWSampleBufferSetAttachedMedia(a3, 0x1E494FB58, -[NSMutableArray objectAtIndexedSubscript:](self->_latestPointCloudBuffers, "objectAtIndexedSubscript:", 0));
    self->_numberOfReceivedPointCloudFramesBeforeEmitted = 0;
    return 1;
  }
  return v9;
}

- (void)_setUpPointCloudMediaConfigurationForOutput:(id)a3 inputAttachedMediaKey:(id)a4 outputAttachedMediaKey:(id)a5
{
  BWNodeOutputMediaConfiguration *v8;

  v8 = objc_alloc_init(BWNodeOutputMediaConfiguration);
  -[BWNodeOutputMediaConfiguration setFormatRequirements:](v8, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
  -[BWNodeOutputMediaConfiguration setPassthroughMode:](v8, "setPassthroughMode:", 1);
  -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](v8, "setIndexOfInputWhichDrivesThisOutput:", 1);
  -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v8, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", a4);
  objc_msgSend(a3, "setMediaConfiguration:forAttachedMediaKey:", v8, a5);
}

- (BOOL)_shouldEmitBuffer
{
  return self->_numberOfReceivedRGBFramesSinceLastDepthFrameEmission >= self->_numberOfReceivedRGBFramesBeforeEmittingDepthFrame
      && self->_shouldLetThroughFrames;
}

- (void)_updateNumberOfReceivedRGBFramesBeforeEmittingDepthFrameWithDepthMaxFrameRate:(float)a3 rgbMaxFrameRate:(float)a4
{
  signed __int16 v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  os_unfair_lock_assert_owner(&self->_bufferServicingLock);
  if (a3 == 0.0)
  {
    v7 = 0;
  }
  else if (vabds_f32(a4, a3) >= 0.1)
  {
    v7 = vcvtps_s32_f32(a4 / a3);
  }
  else
  {
    v7 = 1;
  }
  self->_shouldLetThroughFrames = a3 != 0.0;
  self->_numberOfReceivedRGBFramesBeforeEmittingDepthFrame = v7;
  if (dword_1EE6BE958)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)didChangeDepthMaxFrameRate:(float)a3
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_depthMaxFrameRate != a3)
  {
    self->_depthMaxFrameRate = a3;
    self->_depthMaxFrameRateAdjustmentPending = 1;
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (BWNodeInput)imageInput
{
  return self->_imageInput;
}

- (BWNodeInput)pointCloudInput
{
  return self->_pointCloudInput;
}

@end
