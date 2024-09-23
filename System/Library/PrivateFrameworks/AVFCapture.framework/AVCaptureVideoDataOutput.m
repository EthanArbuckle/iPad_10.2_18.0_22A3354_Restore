@implementation AVCaptureVideoDataOutput

- (NSDictionary)videoSettings
{
  return self->_internal->videoSettings;
}

- (id)requestedBufferAttachments
{
  return self->_internal->requestedBufferAttachments;
}

- (BOOL)isSceneStabilityMetadataEnabled
{
  return self->_internal->sceneStabilityMetadataEnabled;
}

- (BOOL)alwaysDiscardsLateVideoFrames
{
  return self->_internal->alwaysDiscardsLateVideoFrames;
}

- (BOOL)hasRequiredOutputFormatForConnection:(id)a3
{
  return -[NSArray containsObject:](-[AVCaptureOutput connections](self, "connections"), "containsObject:", a3)
      && -[NSDictionary objectForKeyedSubscript:](self->_internal->clientVideoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
}

- (unsigned)requiredOutputFormatForConnection:(id)a3
{
  objc_super v6;

  if (-[AVCaptureVideoDataOutput hasRequiredOutputFormatForConnection:](self, "hasRequiredOutputFormatForConnection:"))
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->clientVideoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]), "intValue");
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureVideoDataOutput;
  return -[AVCaptureOutput requiredOutputFormatForConnection:](&v6, sel_requiredOutputFormatForConnection_, a3);
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL result;

  v7 = (void *)objc_msgSend(a3, "mediaType");
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B90]))
  {
    v8 = 1;
    goto LABEL_5;
  }
  if (-[NSArray count](-[AVCaptureOutput connections](self, "connections"), "count"))
  {
    v8 = 2;
LABEL_5:
    v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5;
  id v6;

  v5 = -[AVCaptureDataOutputDelegateCallbackHelper activeDelegate](self->_internal->delegateCallbackHelper, "activeDelegate");
  if (!-[AVCaptureDataOutputDelegateCallbackHelper delegateOverride](self->_internal->delegateCallbackHelper, "delegateOverride"))
  {
    CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05460]);
    CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05468]);
    CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0D050B0]);
  }
  v6 = -[NSArray firstObject](-[AVCaptureOutput connections](self, "connections"), "firstObject");
  if (objc_msgSend(v6, "isLive")
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    if (CMSampleBufferGetImageBuffer(a3))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "captureOutput:didOutputSampleBuffer:fromConnection:", self, a3, v6);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "captureOutput:didDropSampleBuffer:fromConnection:", self, a3, v6);
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  AVCaptureConnection *v9;

  if ((void *)AVCaptureOutputVideoMirroredChangedContext_0 == a6)
    goto LABEL_6;
  if ((void *)AVCaptureOutputVideoOrientationChangedContext_0 == a6)
  {
    -[AVCaptureVideoDataOutput updateVideoSettingsForConnection:](self, "updateVideoSettingsForConnection:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90], a4, a5));
LABEL_6:
    -[AVCaptureOutput updateMetadataTransformForSourceFormat:](self, "updateMetadataTransformForSourceFormat:", objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "activeFormat"));
    return;
  }
  if ((void *)AVCaptureOutputSessionPresetChangedContext == a6)
  {
    v9 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
    -[AVCaptureVideoDataOutput _updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:](self, "_updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:", v9, objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]));
  }
}

- (CGSize)outputSizeForSourceFormat:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  if (-[AVCaptureVideoDataOutput deliversPreviewSizedOutputBuffers](self, "deliversPreviewSizedOutputBuffers"))
  {
    v5 = objc_msgSend(a3, "previewDimensions");
    v6 = (double)(int)v5;
    v7 = (double)SHIDWORD(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVCaptureVideoDataOutput;
    -[AVCaptureOutput outputSizeForSourceFormat:](&v8, sel_outputSizeForSourceFormat_, a3);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)deliversPreviewSizedOutputBuffers
{
  return self->_internal->deliversPreviewSizedOutputBuffers;
}

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 1;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 1;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_internal->weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, vdo_notificationHandler, *MEMORY[0x1E0D04548], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, vdo_notificationHandler, *MEMORY[0x1E0D04540], a3, 0);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureVideoDataOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v7, sel_attachSafelyToFigCaptureSession_, a3);
}

- (void)setAlwaysDiscardsLateVideoFrames:(BOOL)alwaysDiscardsLateVideoFrames
{
  AVCaptureVideoDataOutputInternal *internal;

  internal = self->_internal;
  if (internal->alwaysDiscardsLateVideoFrames != alwaysDiscardsLateVideoFrames)
  {
    internal->alwaysDiscardsLateVideoFrames = alwaysDiscardsLateVideoFrames;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

void __47__AVCaptureVideoDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v6;
  _QWORD *v7;
  void *v8;

  v6 = (void *)MEMORY[0x1A1AF16C4]();
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v7)
  {
    v8 = v7;
    if (a2 == -16665)
    {
      objc_msgSend(*(id *)(v7[2] + 88), "releaseRemoteQueueReceiver");
    }
    else if (!a2)
    {
      objc_msgSend(v7, "_handleRemoteQueueOperation:", a3);
    }

  }
  objc_autoreleasePoolPop(v6);
}

- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3
{
  if (a3->var0 == 3)
    -[AVCaptureVideoDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", a3->var4.var4.var0);
}

- (AVCaptureVideoDataOutput)init
{
  AVCaptureVideoDataOutput *v2;
  AVCaptureVideoDataOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoDataOutput;
  v2 = -[AVCaptureOutput initSubclass](&v5, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureVideoDataOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
      -[AVCaptureVideoDataOutput _updateAvailableVideoCVPixelFormatTypesForConnection:](v2, "_updateAvailableVideoCVPixelFormatTypesForConnection:", 0);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  AVCaptureVideoDataOutputInternal *internal;
  $95D729B680665BEAEFA1D6FCA8238556 *p_deprecatedMinFrameDuration;
  id v9;
  objc_super v11;
  __int128 v12;
  int64_t epoch;

  internal = self->_internal;
  if ((internal->deprecatedMinFrameDuration.flags & 1) != 0)
  {
    v12 = *(_OWORD *)&internal->deprecatedMinFrameDuration.value;
    epoch = internal->deprecatedMinFrameDuration.epoch;
    objc_msgSend(a3, "_setVideoMinFrameDuration:", &v12);
    p_deprecatedMinFrameDuration = &self->_internal->deprecatedMinFrameDuration;
    if (a3)
    {
      objc_msgSend(a3, "_videoMinFrameDuration");
    }
    else
    {
      v12 = 0uLL;
      epoch = 0;
    }
    *(_OWORD *)&p_deprecatedMinFrameDuration->value = v12;
    p_deprecatedMinFrameDuration->epoch = epoch;
  }
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("videoMirrored"), 3, AVCaptureOutputVideoMirroredChangedContext_0);
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("videoOrientation"), 3, AVCaptureOutputVideoOrientationChangedContext_0);
  v9 = -[AVCaptureOutput session](self, "session");
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("sessionPreset"), 3, AVCaptureOutputSessionPresetChangedContext);
  -[AVCaptureVideoDataOutput _updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:](self, "_updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:", a3, objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  -[AVCaptureVideoDataOutput _updateAvailableVideoCVPixelFormatTypesForConnection:](self, "_updateAvailableVideoCVPixelFormatTypesForConnection:", a3);
  -[AVCaptureVideoDataOutput _updateVideoSettingsForConnection:connectionBeingAdded:](self, "_updateVideoSettingsForConnection:connectionBeingAdded:", a3, 1);
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureVideoDataOutput;
  return -[AVCaptureOutput addConnection:error:](&v11, sel_addConnection_error_, a3, a4);
}

- (void)_updateAvailableVideoCVPixelFormatTypesForConnection:(id)a3
{
  void *v5;
  void *v6;
  FourCharCode MediaSubType;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  AVCaptureVideoDataOutput *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat");
  if (!v6)
    goto LABEL_4;
  MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v6, "formatDescription"));
  if (MediaSubType == 2016686642)
  {
    objc_msgSend(v5, "addObject:", &unk_1E424CC78);
LABEL_6:
    objc_msgSend(v5, "addObject:", &unk_1E424CC48);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "isEqual:", CFSTR("com.microsoft.seeingai")))objc_msgSend(v5, "addObject:", &unk_1E424CC60);
    goto LABEL_8;
  }
  if (MediaSubType == 2016686640)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v5, "addObjectsFromArray:", &unk_1E424D7E0);
LABEL_8:
  if (!FigCapturePlatformSupportsUniversalCompression())
    goto LABEL_31;
  v19 = self;
  v8 = FigCapturePlatformSupportsUniversalLossyCompression();
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v11)
    goto LABEL_30;
  v12 = v11;
  v13 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v10);
      v15 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "intValue");
      if (v15 <= 1111970368)
      {
        if (v15 == 875704422)
        {
          v16 = 641230384;
          v17 = 758670896;
          v18 = &unk_1E424D810;
        }
        else
        {
          if (v15 != 875704438)
            continue;
          v16 = 641234480;
          v17 = 758674992;
          v18 = &unk_1E424D7F8;
        }
      }
      else
      {
        switch(v15)
        {
          case 1111970369:
            v17 = 759318337;
            v16 = 641877825;
            v18 = &unk_1E424D828;
            break;
          case 2016686640:
            v16 = 645428784;
            v17 = 762869296;
            v18 = &unk_1E424D840;
            break;
          case 2016686642:
            v16 = 645428786;
            v17 = 762869298;
            v18 = &unk_1E424D858;
            break;
          default:
            continue;
        }
      }
      objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16));
      if (v8)
      {
        objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17));
        if (v19->_internal->allLossyVideoCVPixelFormatTypesEnabled)
          objc_msgSend(v9, "addObjectsFromArray:", v18);
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v12);
LABEL_30:
  v5 = v10;
  objc_msgSend(v10, "addObjectsFromArray:", v9);
  self = v19;
LABEL_31:
  if ((objc_msgSend(v5, "isEqual:", self->_internal->availableVideoCVPixelFormatTypes) & 1) == 0)
  {
    -[AVCaptureVideoDataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableVideoCVPixelFormatTypes"));

    self->_internal->availableVideoCVPixelFormatTypes = (NSArray *)objc_msgSend(v5, "copy");
    -[AVCaptureVideoDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableVideoCVPixelFormatTypes"));
  }
}

- (BOOL)updateVideoSettingsForConnection:(id)a3
{
  return -[AVCaptureVideoDataOutput _updateVideoSettingsForConnection:connectionBeingAdded:](self, "_updateVideoSettingsForConnection:connectionBeingAdded:", a3, 0);
}

- (void)setVideoSettings:(NSDictionary *)videoSettings
{
  AVCaptureConnection *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v23;
  AVCaptureVideoDataOutputInternal *internal;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  float v35;
  float v36;
  double v37;
  float v38;
  double v39;
  void *v40;
  uint64_t v41;
  NSDictionary *v42;
  NSDictionary *v43;
  NSDictionary *v44;
  void *v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  if (-[NSDictionary count](videoSettings, "count"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[NSDictionary allKeys](videoSettings, "allKeys"));
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", -[AVCaptureVideoDataOutput supportedVideoSettingsKeys](self, "supportedVideoSettingsKeys"));
    objc_msgSend(v7, "intersectSet:", v6);
    v8 = objc_msgSend(v7, "count");
    if (v8 < objc_msgSend(v6, "count"))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
      objc_msgSend(v9, "minusSet:", v7);
      NSLog(CFSTR("*** -[AVCaptureVideoDataOutput setVideoSettings:] - videoSettings dictionary contains one or more unsupported (ignored) keys: %@"), objc_msgSend(v9, "allObjects"));
      v10 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v11 = (void *)objc_msgSend(v7, "allObjects");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v48 != v14)
              objc_enumerationMutation(v11);
            -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](videoSettings, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v13);
      }
      videoSettings = v10;
    }
    v16 = -[NSDictionary objectForKeyedSubscript:](videoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
    if (v16
      && !-[NSArray containsObject:](-[AVCaptureVideoDataOutput availableVideoCVPixelFormatTypes](self, "availableVideoCVPixelFormatTypes"), "containsObject:", v16))
    {
      v40 = (void *)MEMORY[0x1E0C99DA0];
      v41 = *MEMORY[0x1E0C99778];
      goto LABEL_48;
    }
    v17 = -[NSDictionary objectForKeyedSubscript:](videoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]);
    if (v17
      && !-[NSArray containsObject:](-[AVCaptureVideoDataOutput availableVideoCodecTypes](self, "availableVideoCodecTypes"), "containsObject:", v17))
    {
      v40 = (void *)MEMORY[0x1E0C99DA0];
      v41 = *MEMORY[0x1E0C99778];
      goto LABEL_48;
    }
    v18 = *MEMORY[0x1E0CA90E0];
    v19 = -[NSDictionary objectForKeyedSubscript:](videoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
    v20 = *MEMORY[0x1E0CA8FD8];
    v21 = -[NSDictionary objectForKeyedSubscript:](videoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]);
    if (self->_internal->videoSettingsDimensionsOverrideEnabled && (v19 | v21) != 0)
    {
      v23 = (void *)v21;
      if (v19 && (objc_msgSend((id)v19, "intValue") & 1) != 0)
      {
        v40 = (void *)MEMORY[0x1E0C99DA0];
        v41 = *MEMORY[0x1E0C99778];
        goto LABEL_48;
      }
      if (!v23)
        goto LABEL_51;
      if ((objc_msgSend(v23, "intValue") & 1) != 0)
      {
        v40 = (void *)MEMORY[0x1E0C99DA0];
        v41 = *MEMORY[0x1E0C99778];
        goto LABEL_48;
      }
      if (!v19)
      {
LABEL_51:
        v40 = (void *)MEMORY[0x1E0C99DA0];
        v41 = *MEMORY[0x1E0C99778];
        goto LABEL_48;
      }
      internal = self->_internal;
      if (internal->deliversPreviewSizedOutputBuffers
        && (!objc_msgSend((id)v19, "isEqualToNumber:", -[NSDictionary objectForKeyedSubscript:](internal->videoSettings, "objectForKeyedSubscript:", v18))|| (objc_msgSend(v23, "isEqualToNumber:", -[NSDictionary objectForKeyedSubscript:](self->_internal->videoSettings, "objectForKeyedSubscript:", v20)) & 1) == 0))
      {
        v40 = (void *)MEMORY[0x1E0C99DA0];
        v41 = *MEMORY[0x1E0C99778];
        goto LABEL_48;
      }
      v25 = objc_msgSend(-[AVCaptureConnection sourceDevice](v5, "sourceDevice"), "activeFormat");
      if (v25)
      {
        v46.receiver = self;
        v46.super_class = (Class)AVCaptureVideoDataOutput;
        -[AVCaptureOutput outputSizeForSourceFormat:](&v46, sel_outputSizeForSourceFormat_, v25);
        v27 = v26;
        v29 = v28;
        v30 = -[AVCaptureConnection _videoOrientation](v5, "_videoOrientation");
        -[AVCaptureConnection sourcesFromExternalCamera](v5, "sourcesFromExternalCamera");
        v31 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
        v32 = -3;
        if (v31)
          v32 = -1;
        v33 = v32 + v30;
        if (v33 >= 2)
          v34 = (void *)v19;
        else
          v34 = v23;
        if (v33 >= 2)
          v19 = (unint64_t)v23;
        objc_msgSend(v34, "floatValue");
        v36 = v35;
        objc_msgSend((id)v19, "floatValue");
        v37 = v36;
        v39 = v38;
        if (!self->_internal->videoSettingsDimensionsOverrideEnabledByClient && (v27 < v37 || v29 < v39))
        {
          v40 = (void *)MEMORY[0x1E0C99DA0];
          v41 = *MEMORY[0x1E0C99778];
          goto LABEL_48;
        }
        if (vabdd_f64(v27 / v29, v37 / v39) > 0.01)
        {
          v40 = (void *)MEMORY[0x1E0C99DA0];
          v41 = *MEMORY[0x1E0C99778];
LABEL_48:
          v45 = (void *)objc_msgSend(v40, "exceptionWithName:reason:userInfo:", v41, AVMethodExceptionReasonWithObjectAndSelector(), 0);
          if (AVCaptureShouldThrowForAPIViolations())
            objc_exception_throw(v45);
          NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v45);
          return;
        }
      }
    }
  }

  self->_internal->clientVideoSettings = (NSDictionary *)-[NSDictionary copy](videoSettings, "copy");
  if (SettingsArePassthru(videoSettings))
    v42 = 0;
  else
    v42 = videoSettings;
  v43 = -[AVCaptureVideoDataOutput fullyPopulatedVideoSettingsForSettingsDictionary:connection:](self, "fullyPopulatedVideoSettingsForSettingsDictionary:connection:", v42, v5);
  if (v43 != self->_internal->videoSettings)
  {
    v44 = v43;
    if ((-[NSDictionary isEqual:](v43, "isEqual:") & 1) == 0)
    {

      self->_internal->videoSettings = (NSDictionary *)-[NSDictionary copy](v44, "copy");
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (id)fullyPopulatedVideoSettingsForSettingsDictionary:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v7 = -[AVCaptureVideoDataOutput vettedVideoSettingsForSettingsDictionary:connection:](self, "vettedVideoSettingsForSettingsDictionary:connection:", 0);
  v8 = -[AVCaptureVideoDataOutput vettedVideoSettingsForSettingsDictionary:connection:](self, "vettedVideoSettingsForSettingsDictionary:connection:", a3, a4);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
  objc_msgSend(v9, "addEntriesFromDictionary:", v8);
  v10 = *MEMORY[0x1E0CF2CE8];
  v11 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CE8]);
  v12 = *MEMORY[0x1E0CF2CF0];
  if (objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0CF2CF0])
    && (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v10), "isEqual:", v12) & 1) == 0)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);
  }
  return v9;
}

- (id)vettedVideoSettingsForSettingsDictionary:(id)a3 connection:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id result;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t MediaSubType;
  double v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int64_t v40;
  _BOOL4 v41;
  uint64_t v42;
  unint64_t v43;
  CMVideoDimensions Dimensions;
  double width;
  double height;
  float v47;
  float v48;
  double v49;
  float v50;
  double v51;
  int v52;
  double v53;
  double v54;
  double v57;
  double v58;
  id v60;
  objc_super v61;

  v7 = (void *)objc_msgSend(a4, "sourceDevice");
  v8 = v7;
  if (a3)
  {
    if (self->_internal->deliversPreviewSizedOutputBuffers
      && (v9 = *MEMORY[0x1E0CF2CE8], !objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CE8])))
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CF2CF0], v9);
    }
    else
    {
      v10 = 0;
    }
    v28 = *MEMORY[0x1E0CA9040];
    v29 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
    if (v29 && !-[NSArray containsObject:](self->_internal->availableVideoCVPixelFormatTypes, "containsObject:", v29))
    {
      if (!v10)
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
      v30 = (void *)objc_msgSend(v8, "activeFormat");
      if (v30)
        v31 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v30, "formatDescription")));
      else
        v31 = -[NSArray firstObject](self->_internal->availableVideoCVPixelFormatTypes, "firstObject");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, v28);
    }
    v32 = *MEMORY[0x1E0CA90E0];
    v33 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
    v34 = *MEMORY[0x1E0CA8FD8];
    v35 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]);
    if (v33)
      v36 = v35 == 0;
    else
      v36 = 1;
    if (!v36)
    {
      v37 = (void *)v35;
      v38 = objc_msgSend(v8, "activeFormat");
      if (v38)
      {
        v39 = (void *)v38;
        v40 = -[AVCaptureConnection _videoOrientation](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), "_videoOrientation");
        objc_msgSend(a4, "sourcesFromExternalCamera");
        v41 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
        v42 = -3;
        if (v41)
          v42 = -1;
        v43 = v42 + v40;
        Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v39, "formatDescription"));
        width = (double)Dimensions.width;
        height = (double)Dimensions.height;
        objc_msgSend(v33, "floatValue");
        v48 = v47;
        v49 = v47;
        objc_msgSend(v37, "floatValue");
        v51 = v50;
        v52 = (v48 > v50) ^ (width <= height);
        if (v52)
          v53 = v49;
        else
          v53 = v50;
        if (v52)
          v54 = v51;
        else
          v54 = v49;
        if (vabdd_f64(width / height, v53 / v54) > 0.01 || v53 > width || v54 > height)
        {
          v61.receiver = self;
          v61.super_class = (Class)AVCaptureVideoDataOutput;
          -[AVCaptureOutput outputSizeForSourceFormat:](&v61, sel_outputSizeForSourceFormat_, v39);
        }
        if (v43 >= 2)
          v57 = v53;
        else
          v57 = v54;
        if (v43 >= 2)
          v58 = v54;
        else
          v58 = v53;
        if (v57 != v49 || v58 != v51)
        {
          if (!v10)
            v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v57), v32);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v58), v34);
        }
      }
    }
    if (v10)
      v60 = v10;
    else
      v60 = a3;
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D48], "videoOutputSettingsWithVideoSettingsDictionary:", v60), "outputSettingsDictionary");
  }
  else
  {
    result = (id)objc_msgSend(v7, "activeFormat");
    if (result)
    {
      v12 = result;
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      -[AVCaptureVideoDataOutput outputSizeForSourceFormat:](self, "outputSizeForSourceFormat:", v12);
      v15 = v14;
      v17 = v16;
      v18 = objc_msgSend(a4, "_videoOrientation");
      objc_msgSend(a4, "sourcesFromExternalCamera");
      v19 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
      v20 = -3;
      if (v19)
        v20 = -1;
      v21 = v20 + v18;
      v22 = *MEMORY[0x1E0CA9040];
      MediaSubType = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->clientVideoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]), "intValue");
      if (!(_DWORD)MediaSubType)
        MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v12, "formatDescription", MediaSubType));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", MediaSubType), v22);
      if (v21 >= 2)
        v24 = v15;
      else
        v24 = v17;
      if (v21 >= 2)
        v15 = v17;
      v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CA90E0]);
      v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CA8FD8]);
      v27 = -[AVCaptureVideoDataOutput outputScalingModeForSourceFormat:](self, "outputScalingModeForSourceFormat:", v12);
      if (v27)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CF2CE8]);
      return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v13);
    }
  }
  return result;
}

- (id)supportedVideoSettingsKeys
{
  uint64_t v2;

  v2 = *MEMORY[0x1E0CA9040];
  if (self->_internal->videoSettingsDimensionsOverrideEnabled)
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v2, *MEMORY[0x1E0CA90E0], *MEMORY[0x1E0CA8FD8], 0);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
}

- (id)outputScalingModeForSourceFormat:(id)a3
{
  id result;
  id *v6;
  void *v7;

  result = -[NSDictionary objectForKeyedSubscript:](self->_internal->clientVideoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CE8]);
  if (!result)
  {
    if (-[AVCaptureVideoDataOutput deliversPreviewSizedOutputBuffers](self, "deliversPreviewSizedOutputBuffers"))
    {
      v6 = (id *)MEMORY[0x1E0CF2CF0];
      return *v6;
    }
    v7 = (void *)objc_msgSend(a3, "vtScalingMode");
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEDB48]))
    {
      v6 = (id *)MEMORY[0x1E0CF2D00];
      return *v6;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEDB38]))
      return (id)*MEMORY[0x1E0CF2CF8];
    else
      return 0;
  }
  return result;
}

- (NSArray)availableVideoCVPixelFormatTypes
{
  return self->_internal->availableVideoCVPixelFormatTypes;
}

- (void)_updateDeliversPreviewSizedOutputBuffersForConnection:(id)a3 sessionPreset:(id)a4
{
  AVCaptureVideoDataOutputInternal *internal;
  uint64_t v8;
  _BOOL4 deliversPreviewSizedOutputBuffers;
  int v10;

  internal = self->_internal;
  if (internal->videoSettingsDimensionsOverrideEnabled)
  {
    v8 = -[NSDictionary objectForKeyedSubscript:](internal->clientVideoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
    internal = self->_internal;
    if (v8)
    {
      if (-[NSDictionary objectForKeyedSubscript:](internal->clientVideoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]))
      {
        deliversPreviewSizedOutputBuffers = 0;
        goto LABEL_12;
      }
      internal = self->_internal;
    }
  }
  if (internal->automaticallyConfiguresOutputBufferDimensions)
  {
    -[AVCaptureOutput session](self, "session");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat"), "AVCaptureSessionPresets"), "containsObject:", CFSTR("AVCaptureSessionPresetPhoto"));
    else
      v10 = objc_msgSend(a4, "isEqualToString:", CFSTR("AVCaptureSessionPresetPhoto"));
    deliversPreviewSizedOutputBuffers = v10;
  }
  else
  {
    deliversPreviewSizedOutputBuffers = internal->deliversPreviewSizedOutputBuffers;
  }
LABEL_12:
  if (self->_internal->deliversPreviewSizedOutputBuffers == deliversPreviewSizedOutputBuffers)
  {
    -[AVCaptureVideoDataOutput updateVideoSettingsForConnection:](self, "updateVideoSettingsForConnection:", a3);
  }
  else
  {
    -[AVCaptureVideoDataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("deliversPreviewSizedOutputBuffers"));
    self->_internal->deliversPreviewSizedOutputBuffers = deliversPreviewSizedOutputBuffers;
    -[AVCaptureVideoDataOutput updateVideoSettingsForConnection:](self, "updateVideoSettingsForConnection:", a3);
    -[AVCaptureVideoDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("deliversPreviewSizedOutputBuffers"));
  }
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04548]))
    {
      -[AVCaptureVideoDataOutput _updateRemoteQueue:](self, "_updateRemoteQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04538]));
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04540]))
    {
      -[AVCaptureVideoDataOutput _updateLocalQueue:](self, "_updateLocalQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D042E8]));
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  AVWeakReference *v5;
  void *MessageReceiver;

  v5 = self->_internal->weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_internal->delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)objc_msgSend(MessageReceiver, "copy"));

}

- (void)setSampleBufferDelegate:(id)sampleBufferDelegate queue:(dispatch_queue_t)sampleBufferCallbackQueue
{
  dispatch_queue_t v4;
  void *v7;
  uint64_t v8;

  v4 = sampleBufferCallbackQueue;
  if (((sampleBufferCallbackQueue != 0) & AVCaptureIsRunningInMediaserverd()) != 0)
    v4 = 0;
  -[AVCaptureVideoDataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sampleBufferDelegate"));
  v8 = 0;
  if (-[AVCaptureDataOutputDelegateCallbackHelper setClientDelegate:clientCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setClientDelegate:clientCallbackQueue:exceptionReason:", sampleBufferDelegate, v4, &v8))
  {
    -[AVCaptureVideoDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sampleBufferDelegate"));
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureVideoDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sampleBufferDelegate"));
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVideoDataOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (id)sampleBufferDelegate
{
  return -[AVCaptureDataOutputDelegateCallbackHelper clientDelegate](self->_internal->delegateCallbackHelper, "clientDelegate");
}

- (dispatch_queue_t)sampleBufferCallbackQueue
{
  return (dispatch_queue_t)-[AVCaptureDataOutputDelegateCallbackHelper clientCallbackQueue](self->_internal->delegateCallbackHelper, "clientCallbackQueue");
}

- (NSArray)availableVideoCodecTypes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isVideoSettingsDimensionsOverrideEnabled
{
  return self->_internal->videoSettingsDimensionsOverrideEnabled;
}

- (void)setVideoSettingsDimensionsOverrideEnabled:(BOOL)a3
{
  AVCaptureVideoDataOutputInternal *internal;

  self->_internal->videoSettingsDimensionsOverrideEnabledByClient = a3;
  internal = self->_internal;
  if (internal->videoSettingsDimensionsOverrideEnabled != a3)
  {
    internal->videoSettingsDimensionsOverrideEnabled = a3;
    -[AVCaptureVideoDataOutput _updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:](self, "_updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  }
}

- (BOOL)isSceneStabilityMetadataSupported
{
  return 1;
}

- (void)setSceneStabilityMetadataEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureVideoDataOutputInternal *internal;
  void *v6;

  v3 = a3;
  if (a3 && !-[AVCaptureVideoDataOutput isSceneStabilityMetadataSupported](self, "isSceneStabilityMetadataSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->sceneStabilityMetadataEnabled != v3)
    {
      internal->sceneStabilityMetadataEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (void)setRequestedBufferAttachments:(id)a3
{
  NSArray *requestedBufferAttachments;

  requestedBufferAttachments = self->_internal->requestedBufferAttachments;
  if (requestedBufferAttachments != a3)
  {

    self->_internal->requestedBufferAttachments = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (BOOL)allLossyVideoCVPixelFormatTypesEnabled
{
  return self->_internal->allLossyVideoCVPixelFormatTypesEnabled;
}

- (void)setAllLossyVideoCVPixelFormatTypesEnabled:(BOOL)a3
{
  AVCaptureVideoDataOutputInternal *internal;

  internal = self->_internal;
  if (internal->allLossyVideoCVPixelFormatTypesEnabled != a3)
  {
    internal->allLossyVideoCVPixelFormatTypesEnabled = a3;
    -[AVCaptureVideoDataOutput _updateAvailableVideoCVPixelFormatTypesForConnection:](self, "_updateAvailableVideoCVPixelFormatTypesForConnection:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]));
  }
}

- (id)supportedAssetWriterOutputFileTypes
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CF2B00];
  v4[0] = *MEMORY[0x1E0CF2B08];
  v4[1] = v2;
  v4[2] = *MEMORY[0x1E0CF2AD0];
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
}

- (NSDictionary)recommendedVideoSettingsForAssetWriterWithOutputFileType:(AVFileType)outputFileType
{
  id v5;
  id v6;
  void *v8;

  v5 = -[AVCaptureVideoDataOutput supportedAssetWriterOutputFileTypes](self, "supportedAssetWriterOutputFileTypes");
  if ((objc_msgSend(v5, "containsObject:", outputFileType) & 1) != 0)
  {
    v6 = -[AVCaptureOutput firstEnabledConnectionForMediaType:](self, "firstEnabledConnectionForMediaType:", *MEMORY[0x1E0CF2B90]);
    if (objc_msgSend(v6, "isLive"))
      return (NSDictionary *)-[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v6, -[AVCaptureVideoDataOutput videoSettings](self, "videoSettings"), objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", objc_msgSend(v6, "sourceDevice"), 0, 0, outputFileType, 0), "firstObject"), outputFileType, 0, 0);
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, v5);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
  return 0;
}

- (NSArray)availableVideoCodecTypesForAssetWriterWithOutputFileType:(AVFileType)outputFileType
{
  id v5;
  id v6;
  void *v8;

  v5 = -[AVCaptureVideoDataOutput supportedAssetWriterOutputFileTypes](self, "supportedAssetWriterOutputFileTypes");
  if ((objc_msgSend(v5, "containsObject:", outputFileType) & 1) != 0)
  {
    v6 = -[AVCaptureOutput firstEnabledConnectionForMediaType:](self, "firstEnabledConnectionForMediaType:", *MEMORY[0x1E0CF2B90]);
    if (objc_msgSend(v6, "isLive"))
      return (NSArray *)objc_msgSend((id)objc_opt_class(), "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", objc_msgSend(v6, "sourceDevice"), 0, 0, outputFileType, 0);
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, v5);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSDictionary)recommendedVideoSettingsForVideoCodecType:(AVVideoCodecType)videoCodecType assetWriterOutputFileType:(AVFileType)outputFileType
{
  id v7;
  id v8;
  void *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = -[AVCaptureVideoDataOutput supportedAssetWriterOutputFileTypes](self, "supportedAssetWriterOutputFileTypes");
  if ((objc_msgSend(v7, "containsObject:", outputFileType) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v14 = v7;
LABEL_7:
    v13 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector(), 0, v14);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v13);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
    return 0;
  }
  v8 = -[AVCaptureOutput firstEnabledConnectionForMediaType:](self, "firstEnabledConnectionForMediaType:", *MEMORY[0x1E0CF2B90]);
  if (objc_msgSend(v8, "isLive"))
  {
    v9 = (void *)objc_msgSend((id)objc_opt_class(), "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", objc_msgSend(v8, "sourceDevice"), 0, 0, outputFileType, 0);
    if ((objc_msgSend(v9, "containsObject:", videoCodecType) & 1) != 0)
      return (NSDictionary *)-[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v8, -[AVCaptureVideoDataOutput videoSettings](self, "videoSettings"), videoCodecType, outputFileType, 0, 0);
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v14 = v9;
    goto LABEL_7;
  }
  return 0;
}

- (NSDictionary)recommendedVideoSettingsForVideoCodecType:(AVVideoCodecType)videoCodecType assetWriterOutputFileType:(AVFileType)outputFileType outputFileURL:(NSURL *)outputFileURL
{
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;

  if ((objc_msgSend(-[AVCaptureVideoDataOutput supportedAssetWriterOutputFileTypes](self, "supportedAssetWriterOutputFileTypes"), "containsObject:", outputFileType) & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
LABEL_10:
    v16 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v16);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
    return 0;
  }
  v9 = -[AVCaptureOutput firstEnabledConnectionForMediaType:](self, "firstEnabledConnectionForMediaType:", *MEMORY[0x1E0CF2B90]);
  v10 = v9;
  v17 = 0;
  if (v9)
  {
    -[AVCaptureVideoDataOutput outputSizeForSourceFormat:](self, "outputSizeForSourceFormat:", objc_msgSend((id)objc_msgSend(v9, "sourceDevice"), "activeFormat"));
    if ((AVCaptureMovieFileURLIsValidForConnection(v10, v11, v12, (uint64_t)outputFileURL, &v17) & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v10, "isLive"))
  {
    if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", objc_msgSend(v10, "sourceDevice"), 0, 0, outputFileType, 0), "containsObject:", videoCodecType) & 1) != 0)return (NSDictionary *)-[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v10, -[AVCaptureVideoDataOutput videoSettings](self, "videoSettings"), videoCodecType, outputFileType, 0, outputFileURL);
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    goto LABEL_10;
  }
  return 0;
}

- (CMTime)minFrameDuration
{
  void *v6;
  uint64_t v7;
  NSString *v8;
  AVCaptureVideoDataOutputInternal *internal;
  CMTime *result;
  __int128 v11;
  CMTimeEpoch v12;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVDOFrameRatePropertiesAreDeprecated")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v7 = objc_opt_class();
      v8 = NSStringFromSelector(a3);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v7, self, v8, CFSTR("AVCaptureDevice activeVideoMinFrameDuration"));
    }
  }
  internal = self->_internal;
  *(_OWORD *)&retstr->value = *(_OWORD *)&internal->deprecatedMinFrameDuration.value;
  retstr->epoch = internal->deprecatedMinFrameDuration.epoch;
  result = -[AVCaptureOutput firstEnabledConnectionForMediaType:](self, "firstEnabledConnectionForMediaType:", *MEMORY[0x1E0CF2B90]);
  if (result)
  {
    result = (CMTime *)-[CMTime _videoMinFrameDuration](result, "_videoMinFrameDuration");
    *(_OWORD *)&retstr->value = v11;
    retstr->epoch = v12;
  }
  return result;
}

- (void)_setMinFrameDuration:(id *)a3
{
  id v5;
  void *v6;
  AVCaptureVideoDataOutputInternal *internal;
  AVCaptureVideoDataOutputInternal *v8;
  int64_t v9;
  __int128 v10;
  int64_t var3;

  v5 = -[AVCaptureOutput firstEnabledConnectionForMediaType:](self, "firstEnabledConnectionForMediaType:", *MEMORY[0x1E0CF2B90]);
  if (v5)
  {
    v6 = v5;
    v10 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    objc_msgSend(v5, "_setVideoMinFrameDuration:", &v10);
    internal = self->_internal;
    objc_msgSend(v6, "_videoMinFrameDuration");
    *(_OWORD *)&internal->deprecatedMinFrameDuration.value = v10;
    internal->deprecatedMinFrameDuration.epoch = var3;
  }
  else
  {
    v8 = self->_internal;
    v9 = a3->var3;
    *(_OWORD *)&v8->deprecatedMinFrameDuration.value = *(_OWORD *)&a3->var0;
    v8->deprecatedMinFrameDuration.epoch = v9;
  }
}

- (void)setMinFrameDuration:(CMTime *)minFrameDuration
{
  void *v6;
  uint64_t v7;
  NSString *v8;
  __int128 v9;
  CMTimeEpoch epoch;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVDOFrameRatePropertiesAreDeprecated")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v7 = objc_opt_class();
      v8 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v7, self, v8, CFSTR("AVCaptureDevice setActiveVideoMinFrameDuration"));
    }
  }
  v9 = *(_OWORD *)&minFrameDuration->value;
  epoch = minFrameDuration->epoch;
  -[AVCaptureVideoDataOutput _setMinFrameDuration:](self, "_setMinFrameDuration:", &v9);
}

- (BOOL)automaticallyConfiguresOutputBufferDimensions
{
  return self->_internal->automaticallyConfiguresOutputBufferDimensions;
}

- (void)setAutomaticallyConfiguresOutputBufferDimensions:(BOOL)automaticallyConfiguresOutputBufferDimensions
{
  AVCaptureVideoDataOutputInternal *internal;

  internal = self->_internal;
  if (internal->automaticallyConfiguresOutputBufferDimensions != automaticallyConfiguresOutputBufferDimensions)
  {
    internal->automaticallyConfiguresOutputBufferDimensions = automaticallyConfiguresOutputBufferDimensions;
    -[AVCaptureVideoDataOutput _updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:](self, "_updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]), objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  }
}

- (void)setDeliversPreviewSizedOutputBuffers:(BOOL)deliversPreviewSizedOutputBuffers
{
  AVCaptureVideoDataOutputInternal *internal;
  void *v5;

  internal = self->_internal;
  if (internal->automaticallyConfiguresOutputBufferDimensions)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else if (internal->deliversPreviewSizedOutputBuffers != deliversPreviewSizedOutputBuffers)
  {
    internal->deliversPreviewSizedOutputBuffers = deliversPreviewSizedOutputBuffers;
    if (-[AVCaptureVideoDataOutput updateVideoSettingsForConnection:](self, "updateVideoSettingsForConnection:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90])))
    {
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CF2B90];
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (void)removeConnection:(id)a3
{
  objc_super v5;

  -[AVCaptureVideoDataOutput _updateAvailableVideoCVPixelFormatTypesForConnection:](self, "_updateAvailableVideoCVPixelFormatTypesForConnection:", 0);
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("videoMirrored"), AVCaptureOutputVideoMirroredChangedContext_0);
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("videoOrientation"), AVCaptureOutputVideoOrientationChangedContext_0);
  objc_msgSend(-[AVCaptureOutput session](self, "session"), "removeObserver:forKeyPath:", self, CFSTR("sessionPreset"));
  -[AVCaptureVideoDataOutput _updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:](self, "_updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:", 0, objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoDataOutput;
  -[AVCaptureOutput removeConnection:](&v5, sel_removeConnection_, a3);
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vdo_notificationHandler, *MEMORY[0x1E0D04548], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vdo_notificationHandler, *MEMORY[0x1E0D04540], a3);
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureVideoDataOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v6, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  AVCaptureConnection *v7;
  objc_super v8;

  v7 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  -[AVCaptureVideoDataOutput _updateAvailableVideoCVPixelFormatTypesForConnection:](self, "_updateAvailableVideoCVPixelFormatTypesForConnection:", v7);
  -[AVCaptureVideoDataOutput _updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:](self, "_updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:", v7, objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureVideoDataOutput;
  -[AVCaptureOutput handleChangedActiveFormat:forDevice:](&v8, sel_handleChangedActiveFormat_forDevice_, a3, a4);
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  AVWeakReference *v5;
  _QWORD v6[5];

  v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AVCaptureVideoDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E4216770;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)objc_msgSend(v6, "copy"));

}

void __46__AVCaptureVideoDataOutput__updateLocalQueue___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  id v5;
  void *v6;
  __int128 v7;
  int v8;

  v4 = (void *)MEMORY[0x1A1AF16C4]();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v5)
  {
    v6 = v5;
    v7 = *a2;
    v8 = *((_DWORD *)a2 + 4);
    objc_msgSend(v5, "_handleLocalQueueMessage:", &v7);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3
{
  if (a3->var0 == 3)
    -[AVCaptureVideoDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", *(_QWORD *)(&a3->var0 + 1));
}

- (BOOL)_updateVideoSettingsForConnection:(id)a3 connectionBeingAdded:(BOOL)a4
{
  _BOOL4 v6;
  NSDictionary *clientVideoSettings;
  NSDictionary *v8;
  NSDictionary *v9;
  NSDictionary *v10;

  if (a4)
    goto LABEL_4;
  if (!a3)
  {
LABEL_9:
    LOBYTE(v6) = 0;
    return v6;
  }
  v6 = -[NSArray containsObject:](-[AVCaptureOutput connections](self, "connections"), "containsObject:", a3);
  if (v6)
  {
LABEL_4:
    clientVideoSettings = self->_internal->clientVideoSettings;
    if (SettingsArePassthru(clientVideoSettings))
      v8 = 0;
    else
      v8 = clientVideoSettings;
    v9 = -[AVCaptureVideoDataOutput fullyPopulatedVideoSettingsForSettingsDictionary:connection:](self, "fullyPopulatedVideoSettingsForSettingsDictionary:connection:", v8, a3);
    if (v9 != self->_internal->videoSettings)
    {
      v10 = v9;
      if ((-[NSDictionary isEqual:](v9, "isEqual:") & 1) == 0)
      {
        -[AVCaptureVideoDataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoSettings"));

        self->_internal->videoSettings = (NSDictionary *)-[NSDictionary copy](v10, "copy");
        -[AVCaptureVideoDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoSettings"));
        LOBYTE(v6) = 1;
        return v6;
      }
    }
    goto LABEL_9;
  }
  return v6;
}

- (id)delegateOverride
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverride](self->_internal->delegateCallbackHelper, "delegateOverride");
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverrideCallbackQueue](self->_internal->delegateCallbackHelper, "delegateOverrideCallbackQueue");
}

- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;

  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0)
    v7 = 0;
  else
    v7 = a4;
  v9 = 0;
  if (!-[AVCaptureDataOutputDelegateCallbackHelper setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:", a3, v7, &v9))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

- (id)getTransformedDetectedObjectsInfoFromSampleBuffer:(opaqueCMSampleBuffer *)a3 connection:(id)a4
{
  void *v8;
  uint64_t v9;
  void *v10;

  if (a3)
  {
    if (a4)
    {
      if (-[NSArray containsObject:](-[AVCaptureOutput connections](self, "connections"), "containsObject:", a4))
        return (id)AVCaptureGetTransformedDetectedObjectsInfo(a3, (uint64_t)a4, self);
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
  }
  v10 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v10);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
  return 0;
}

@end
