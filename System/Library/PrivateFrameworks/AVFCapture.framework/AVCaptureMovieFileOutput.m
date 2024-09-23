@implementation AVCaptureMovieFileOutput

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (int64_t)uniqueID
{
  unint64_t v2;
  int64_t result;

  do
  {
    v2 = __ldxr(&uniqueID_sCurrentUniqueID_0);
    result = v2 + 1;
  }
  while (__stxr(v2 + 1, &uniqueID_sCurrentUniqueID_0));
  return result;
}

- (AVCaptureMovieFileOutput)init
{
  AVCaptureMovieFileOutput *v2;
  AVCaptureMovieFileOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureMovieFileOutput;
  v2 = -[AVCaptureFileOutput initSubclass](&v5, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureMovieFileOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
      v2->_internal->greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *recordingDelegatesArray;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  recordingDelegatesArray = self->_internal->recordingDelegatesArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordingDelegatesArray, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = *MEMORY[0x1E0D041F8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(recordingDelegatesArray);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "pendingDidStopRecordingUnregistrationCaptureSession"))
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mfoNotificationHandler, v7, objc_msgSend(v9, "pendingDidStopRecordingUnregistrationCaptureSession"));
          objc_msgSend(v9, "setPendingDidStopRecordingUnregistrationCaptureSession:", 0);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordingDelegatesArray, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)AVCaptureMovieFileOutput;
  -[AVCaptureFileOutput dealloc](&v10, sel_dealloc);
}

- (id)connectionMediaTypes
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", *MEMORY[0x1E0CF2B90], *MEMORY[0x1E0CF2B68], 0);
  if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
    objc_msgSend(v2, "addObject:", *MEMORY[0x1E0CF2B78]);
  objc_msgSend(v2, "addObject:", *MEMORY[0x1E0CF2B70]);
  return (id)objc_msgSend(v2, "copy");
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL result;
  void *v24;
  id *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "mediaType");
  if ((objc_msgSend(-[AVCaptureMovieFileOutput connectionMediaTypes](self, "connectionMediaTypes"), "containsObject:", v7) & 1) == 0)goto LABEL_35;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B90]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B68]))
  {
    if (-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", v7))
    {
LABEL_5:
      v8 = 2;
      goto LABEL_36;
    }
    return 1;
  }
  v9 = *MEMORY[0x1E0CF2B78];
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B78]))
  {
    if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B70]))
      return 1;
    if (-[AVCaptureMovieFileOutput isDepthCaptureEnabled](self, "isDepthCaptureEnabled"))
    {
      if (-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", v7))
        goto LABEL_5;
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat"), "isStreamingDepthSupported") & 1) != 0)return 1;
      v8 = 5;
LABEL_36:
      v24 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
LABEL_37:
      result = 0;
      *a4 = v24;
      return result;
    }
LABEL_35:
    v8 = 1;
    goto LABEL_36;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_msgSend(a3, "inputPorts");
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v27)
    return 1;
  v25 = a4;
  v10 = 0;
  v28 = *(_QWORD *)v36;
  while (2)
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v36 != v28)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
      v13 = objc_msgSend(v12, "input", v25);
      if (v10)
      {
        if (v13 != v10)
          goto LABEL_38;
      }
      else
      {
        v10 = v13;
      }
      v29 = v11;
      v30 = v10;
      objc_msgSend(v12, "input");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v14 = -[AVCaptureOutput connections](self, "connections");
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v32;
LABEL_19:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v18);
            if (objc_msgSend((id)objc_msgSend(v19, "mediaType"), "isEqualToString:", v9))
            {
              v20 = (void *)objc_msgSend((id)objc_msgSend(v19, "inputPorts"), "firstObject");
              objc_msgSend(v20, "input");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = objc_msgSend(v20, "input");
                if (v21 != objc_msgSend(v12, "input"))
                  break;
              }
            }
            if (v16 == ++v18)
            {
              v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v16)
                goto LABEL_19;
              goto LABEL_27;
            }
          }
LABEL_38:
          v24 = (void *)AVCaptureOutputConnectionFailureReasonString(4, (uint64_t)self, a3);
          a4 = v25;
          goto LABEL_37;
        }
      }
LABEL_27:
      v10 = v30;
      v11 = v29 + 1;
    }
    while (v29 + 1 != v27);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    result = 1;
    v27 = v22;
    if (v22)
      continue;
    return result;
  }
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCaptureMovieFileOutput;
  v5 = -[AVCaptureOutput addConnection:error:](&v8, sel_addConnection_error_, a3, a4);
  v6 = (void *)objc_msgSend(v5, "mediaType");
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CF2B90]))
    -[AVCaptureMovieFileOutput _updateSupportedPropertiesForSourceDevice:](self, "_updateSupportedPropertiesForSourceDevice:", objc_msgSend(v5, "sourceDevice"));
  return v5;
}

- (void)removeConnection:(id)a3
{
  void *v5;
  objc_super v6;

  if (-[NSMutableArray containsObject:](self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack, "containsObject:"))-[NSMutableArray removeObject:](self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack, "removeObject:", a3);
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureMovieFileOutput;
  -[AVCaptureOutput removeConnection:](&v6, sel_removeConnection_, a3);
  v5 = (void *)objc_msgSend(a3, "mediaType");
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CF2B90]))
    -[AVCaptureMovieFileOutput _updateSupportedPropertiesForSourceDevice:](self, "_updateSupportedPropertiesForSourceDevice:", 0);
}

- (BOOL)_recordingInProgress
{
  AVCaptureMovieFileOutput *v2;
  AVCaptureMovieFileOutputInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = -[NSMutableArray count](v2->_internal->recordingDelegatesArray, "count") != 0;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isRecording
{
  AVCaptureMovieFileOutput *v2;
  AVCaptureMovieFileOutputInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->recording;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isRecordingPaused
{
  AVCaptureMovieFileOutput *v2;
  AVCaptureMovieFileOutputInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->paused;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)pauseRecording
{
  _QWORD v3[5];

  if ((objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning") & 1) != 0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __42__AVCaptureMovieFileOutput_pauseRecording__block_invoke;
    v3[3] = &unk_1E4216D70;
    v3[4] = self;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v3);
  }
  else
  {
    NSLog(CFSTR("Can't pause recording because the capture session is not running."));
  }
}

uint64_t __42__AVCaptureMovieFileOutput_pauseRecording__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
    if (v4)
    {
      return v4(a2, v3);
    }
    else
    {
      v5 = *MEMORY[0x1E0D04368];
      v6[0] = &unk_1E424D080;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)resumeRecording
{
  _QWORD v3[5];

  if ((objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning") & 1) == 0)
    NSLog(CFSTR("Can't resume recording because the capture session is not running."));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__AVCaptureMovieFileOutput_resumeRecording__block_invoke;
  v3[3] = &unk_1E4216D70;
  v3[4] = self;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v3);
}

uint64_t __43__AVCaptureMovieFileOutput_resumeRecording__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
    if (v4)
    {
      return v4(a2, v3);
    }
    else
    {
      v5 = *MEMORY[0x1E0D04368];
      v6[0] = &unk_1E424D080;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (id)outputFileURL
{
  AVCaptureMovieFileOutputInternal *internal;
  id v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = (id)objc_msgSend((id)-[NSMutableArray lastObject](self->_internal->recordingDelegatesArray, "lastObject"), "outputFileURL");
  objc_sync_exit(internal);
  return v4;
}

- (void)startRecordingToOutputFileURL:(id)a3 recordingDelegate:(id)a4
{
  id v7;
  AVCaptureConnection *v8;
  AVCaptureConnection *v9;
  double v10;
  double v11;
  AVCaptureFileOutputDelegateWrapper *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
LABEL_17:
    v17 = AVMethodExceptionReasonWithObjectAndSelector();
    v18 = v13;
    v19 = v14;
    goto LABEL_18;
  }
  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v22 = a3;
    v17 = AVMethodExceptionReasonWithObjectAndSelector();
    v18 = v15;
    v19 = v16;
LABEL_18:
    v20 = (void *)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v17, 0, v22);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v20);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v20);
    return;
  }
  if (!a4)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    goto LABEL_17;
  }
  v7 = -[AVCaptureOutput liveConnections](self, "liveConnections");
  if (!objc_msgSend(v7, "count"))
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    goto LABEL_17;
  }
  v23 = 0;
  v8 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  if (v8)
  {
    v9 = v8;
    -[AVCaptureMovieFileOutput outputSizeForSourceFormat:](self, "outputSizeForSourceFormat:", objc_msgSend(-[AVCaptureConnection sourceDevice](v8, "sourceDevice"), "activeFormat"));
    if ((AVCaptureMovieFileURLIsValidForConnection(v9, v10, v11, (uint64_t)a3, &v23) & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99778];
      goto LABEL_17;
    }
  }
  if ((objc_msgSend(a3, "isEqual:", -[AVCaptureMovieFileOutput outputFileURL](self, "outputFileURL")) & 1) == 0)
  {
    v12 = +[AVCaptureFileOutputDelegateWrapper wrapperWithURL:delegate:settingsID:connections:](AVCaptureFileOutputDelegateWrapper, "wrapperWithURL:delegate:settingsID:connections:", a3, a4, +[AVCaptureMovieFileOutput uniqueID](AVCaptureMovieFileOutput, "uniqueID"), v7);
    if (-[AVCaptureMovieFileOutput _totalNANDBandwidthAllowed:videoCodecType:](self, "_totalNANDBandwidthAllowed:videoCodecType:", a3, self->_internal->videoCodec))
    {
      if (!AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureCheckIfFileAlreadyExistForMFO"))
        || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")) & 1) == 0)
      {
        -[AVCaptureFileOutputDelegateWrapper setMetadata:](v12, "setMetadata:", -[AVCaptureMovieFileOutput metadata](self, "metadata"));
        -[AVCaptureFileOutputDelegateWrapper setTrueVideoCaptureEnabled:](v12, "setTrueVideoCaptureEnabled:", -[AVCaptureMovieFileOutput isTrueVideoCaptureEnabled](self, "isTrueVideoCaptureEnabled"));
        -[AVCaptureMovieFileOutput _startRecording:](self, "_startRecording:", v12);
        return;
      }
      v21 = 4294950886;
    }
    else
    {
      v21 = 4294951858;
    }
    v24 = *MEMORY[0x1E0D04368];
    v25[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
    -[AVCaptureMovieFileOutput handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:](self, "handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:", v12, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1), 0, 0);
  }
}

- (void)stopRecording
{
  -[AVCaptureMovieFileOutput _stopRecording](self, "_stopRecording");
  objc_msgSend(-[AVCaptureOutput session](self, "session"), "movieFileOutputStoppedRecording:", self);
}

- (CMTime)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self[1].timescale
                                                                                      + 32);
  return self;
}

- (void)setMovieFragmentInterval:(CMTime *)movieFragmentInterval
{
  CMTimeFlags flags;
  AVCaptureMovieFileOutputInternal *internal;
  CMTimeEpoch epoch;
  void *v8;
  CMTime time2;
  CMTime time1;

  flags = movieFragmentInterval->flags;
  if ((flags & 0x1D) == 1)
  {
    time1 = *movieFragmentInterval;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (CMTimeCompare(&time1, &time2) > 0)
    {
LABEL_5:
      internal = self->_internal;
      epoch = movieFragmentInterval->epoch;
      *(_OWORD *)&internal->movieFragmentInterval.value = *(_OWORD *)&movieFragmentInterval->value;
      internal->movieFragmentInterval.epoch = epoch;
      return;
    }
    flags = movieFragmentInterval->flags;
  }
  if ((flags & 1) == 0)
    goto LABEL_5;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

- (void)setSendsLastVideoPreviewFrame:(BOOL)a3
{
  self->_internal->sendLastVideoPreviewFrame = a3;
}

- (BOOL)sendsLastVideoPreviewFrame
{
  return self->_internal->sendLastVideoPreviewFrame;
}

- (NSArray)availableVideoCodecTypes
{
  return self->_internal->availableVideoCodecs;
}

- (NSArray)supportedOutputSettingsKeysForConnection:(AVCaptureConnection *)connection
{
  void *v3;

  if (!-[AVCaptureConnection isEqual:](connection, "isEqual:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90])))return (NSArray *)MEMORY[0x1E0C9AA60];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", *MEMORY[0x1E0CF2C58], 0);
  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMFOVideoSettingsSupportCompressionProperties")))
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0CF2C98]);
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
}

- (id)bravoCameraSelectionBehaviorForRecording
{
  int64_t primaryConstituentDeviceSwitchingBehavior;
  __CFString **v3;
  id *v4;

  primaryConstituentDeviceSwitchingBehavior = self->_internal->primaryConstituentDeviceSwitchingBehavior;
  v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange;
  if (primaryConstituentDeviceSwitchingBehavior != 2)
    v3 = AVCaptureBravoCameraSelectionBehaviorEvaluatesNever;
  if (primaryConstituentDeviceSwitchingBehavior == 1)
    v4 = (id *)AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously;
  else
    v4 = (id *)v3;
  return *v4;
}

- (void)setBravoCameraSelectionBehaviorForRecording:(id)a3
{
  AVCaptureMovieFileOutput *v5;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously")))
  {
    v5 = self;
    v6 = 1;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange")))
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("AVCaptureBravoCameraSelectionBehaviorEvaluatesNever")))return;
    v5 = self;
    v6 = 3;
    goto LABEL_7;
  }
  v5 = self;
  v6 = 2;
  v7 = 7;
LABEL_8:
  -[AVCaptureMovieFileOutput setPrimaryConstituentDeviceSwitchingBehaviorForRecording:restrictedSwitchingBehaviorConditions:](v5, "setPrimaryConstituentDeviceSwitchingBehaviorForRecording:restrictedSwitchingBehaviorConditions:", v6, v7);
}

- (BOOL)isPrimaryConstituentDeviceSwitchingBehaviorForRecordingEnabled
{
  return self->_internal->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
}

- (void)setPrimaryConstituentDeviceSwitchingBehaviorForRecordingEnabled:(BOOL)primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled
{
  AVCaptureMovieFileOutputInternal *internal;
  void *v5;

  internal = self->_internal;
  if (internal->deviceSupportsConstituentDeviceSwitching
    || !primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled)
  {
    if (internal->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled != primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled)
    {
      internal->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled = primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
      -[AVCaptureMovieFileOutput _propagateBravoSwitchingBehaviorWhenRecording](self, "_propagateBravoSwitchingBehaviorWhenRecording");
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (void)setPrimaryConstituentDeviceSwitchingBehaviorForRecording:(AVCapturePrimaryConstituentDeviceSwitchingBehavior)switchingBehavior restrictedSwitchingBehaviorConditions:(AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)restrictedSwitchingBehaviorConditions
{
  AVCaptureMovieFileOutputInternal *internal;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t primaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
  int64_t primaryConstituentDeviceSwitchingBehavior;

  internal = self->_internal;
  if (switchingBehavior == AVCapturePrimaryConstituentDeviceSwitchingBehaviorUnsupported)
  {
    if (!internal->deviceSupportsConstituentDeviceSwitching)
      goto LABEL_13;
LABEL_7:
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    goto LABEL_10;
  }
  if (!internal->deviceSupportsConstituentDeviceSwitching)
    goto LABEL_7;
  if (switchingBehavior == AVCapturePrimaryConstituentDeviceSwitchingBehaviorRestricted)
  {
    if (restrictedSwitchingBehaviorConditions >= 8)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
LABEL_10:
      v10 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v10);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
      return;
    }
  }
  else if (restrictedSwitchingBehaviorConditions)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    goto LABEL_10;
  }
LABEL_13:
  primaryConstituentDeviceSwitchingBehavior = internal->primaryConstituentDeviceSwitchingBehavior;
  primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = internal->primaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
  if (primaryConstituentDeviceSwitchingBehavior != switchingBehavior
    || primaryConstituentDeviceRestrictedSwitchingBehaviorConditions != restrictedSwitchingBehaviorConditions)
  {
    if (primaryConstituentDeviceSwitchingBehavior != switchingBehavior)
      -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("primaryConstituentDeviceSwitchingBehavior"));
    if (primaryConstituentDeviceRestrictedSwitchingBehaviorConditions == restrictedSwitchingBehaviorConditions)
    {
      self->_internal->primaryConstituentDeviceSwitchingBehavior = switchingBehavior;
      self->_internal->primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = restrictedSwitchingBehaviorConditions;
      -[AVCaptureMovieFileOutput _propagateBravoSwitchingBehaviorWhenRecording](self, "_propagateBravoSwitchingBehaviorWhenRecording");
    }
    else
    {
      -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"));
      self->_internal->primaryConstituentDeviceSwitchingBehavior = switchingBehavior;
      self->_internal->primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = restrictedSwitchingBehaviorConditions;
      -[AVCaptureMovieFileOutput _propagateBravoSwitchingBehaviorWhenRecording](self, "_propagateBravoSwitchingBehaviorWhenRecording");
      -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"));
    }
    if (primaryConstituentDeviceSwitchingBehavior != switchingBehavior)
      -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("primaryConstituentDeviceSwitchingBehavior"));
  }
}

- (void)_propagateBravoSwitchingBehaviorWhenRecording
{
  AVCaptureMovieFileOutputInternal *internal;
  AVCaptureMovieFileOutputInternal *v4;
  uint64_t v5;
  _QWORD v6[6];
  int v7;
  __int128 v8;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = self->_internal;
  if (v4->recording)
  {
    v7 = 0;
    LOBYTE(v7) = v4->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
    v8 = *(_OWORD *)&v4->primaryConstituentDeviceSwitchingBehavior;
    v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 20);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__AVCaptureMovieFileOutput__propagateBravoSwitchingBehaviorWhenRecording__block_invoke;
    v6[3] = &unk_1E4216870;
    v6[4] = self;
    v6[5] = v5;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v6);
  }
  objc_sync_exit(internal);
}

uint64_t __73__AVCaptureMovieFileOutput__propagateBravoSwitchingBehaviorWhenRecording__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = *(_QWORD *)(v3 + 40);
    result = CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v6)
      return v6(a2, v4, *MEMORY[0x1E0D042F8], v5);
  }
  return result;
}

- (AVCapturePrimaryConstituentDeviceSwitchingBehavior)primaryConstituentDeviceSwitchingBehaviorForRecording
{
  return self->_internal->primaryConstituentDeviceSwitchingBehavior;
}

- (AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)primaryConstituentDeviceRestrictedSwitchingBehaviorConditionsForRecording
{
  return self->_internal->primaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
}

- (void)setOutputSettings:(NSDictionary *)outputSettings forConnection:(AVCaptureConnection *)connection
{
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v7 = *MEMORY[0x1E0CF2B90];
  if (!-[AVCaptureConnection isEqual:](connection, "isEqual:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90])))return;
  if (outputSettings && !-[NSDictionary count](outputSettings, "count"))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[AVCaptureMovieFileOutput supportedOutputSettingsKeysForConnection:](self, "supportedOutputSettingsKeysForConnection:", connection));
    if (outputSettings)
      v9 = -[NSDictionary allKeys](outputSettings, "allKeys");
    else
      v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
    objc_msgSend(v10, "minusSet:", v8);
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
    }
    else
    {
      v13 = -[NSDictionary objectForKeyedSubscript:](outputSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]);
      if (!v13
        || -[NSArray containsObject:](-[AVCaptureMovieFileOutput availableVideoCodecTypes](self, "availableVideoCodecTypes"), "containsObject:", v13))
      {
        if (outputSettings)
        {
          v17 = 0;
          v14 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0CF2D48], "_videoOutputSettingsWithVideoSettingsDictionary:exceptionReason:", outputSettings, &v17);
          if (!v14)
          {
            v11 = (void *)MEMORY[0x1E0C99DA0];
            v12 = *MEMORY[0x1E0C99778];
            goto LABEL_19;
          }
          outputSettings = v14;
          if ((objc_msgSend((id)-[NSDictionary compatibleMediaTypes](v14, "compatibleMediaTypes"), "containsObject:", v7) & 1) == 0)
          {
            v11 = (void *)MEMORY[0x1E0C99DA0];
            v12 = *MEMORY[0x1E0C99778];
            goto LABEL_19;
          }
        }

        self->_internal->videoCodec = (NSString *)v13;
        v15 = (void *)-[NSDictionary outputSettingsDictionary](outputSettings, "outputSettingsDictionary");
        self->_internal->videoCompressionProperties = (NSDictionary *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C98]), "copy");
        return;
      }
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
    }
  }
LABEL_19:
  v16 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v16);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
}

- (NSDictionary)outputSettingsForConnection:(AVCaptureConnection *)connection
{
  id v5;
  NSString *videoCodec;
  void *v7;
  void *v8;
  uint64_t MediaSubType;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *videoCompressionProperties;
  uint64_t v18;
  void *DeepCopy;
  uint64_t v20;
  NSDictionary *v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  if (!-[NSArray containsObject:](-[AVCaptureOutput connections](self, "connections"), "containsObject:", connection))
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v14);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
  }
  v5 = -[AVCaptureConnection mediaType](connection, "mediaType");
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF2B90]) & 1) != 0)
  {
    videoCodec = self->_internal->videoCodec;
    if (!videoCodec)
      videoCodec = -[NSArray firstObject](-[AVCaptureMovieFileOutput availableVideoCodecTypes](self, "availableVideoCodecTypes"), "firstObject");
    if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqualToString:", CFSTR("AVCaptureSessionPresetPhoto"))&& (v7 = (void *)objc_msgSend(-[AVCaptureConnection sourceDevice](connection, "sourceDevice"), "activeFormat")) != 0)
    {
      v8 = v7;
      MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v7, "formatDescription"));
      v10 = objc_msgSend(v8, "previewDimensions");
      v11 = *MEMORY[0x1E0CF2CF0];
      v22[0] = *MEMORY[0x1E0CA9040];
      v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", MediaSubType);
      v22[1] = *MEMORY[0x1E0CA90E0];
      v23[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
      v22[2] = *MEMORY[0x1E0CA8FD8];
      v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v10));
      v22[3] = *MEMORY[0x1E0CF2CE8];
      v23[2] = v12;
      v23[3] = v11;
      v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    }
    else
    {
      v13 = 0;
    }
    v15 = -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", connection, v13, videoCodec, *MEMORY[0x1E0CF2B08], 0, 0);
    if (videoCodec)
    {
      videoCompressionProperties = self->_internal->videoCompressionProperties;
      if (videoCompressionProperties)
      {
        v20 = *MEMORY[0x1E0CF2C98];
        v21 = videoCompressionProperties;
        v18 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
        DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v15, 1uLL);
        objc_msgSend(DeepCopy, "mfo_addEntriesFromDictionaryWithRecursion:", v18);
        return (NSDictionary *)DeepCopy;
      }
    }
    return v15;
  }
  return (NSDictionary *)-[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", connection, 0, 0, *MEMORY[0x1E0CF2B08], 0, 0);
}

- (NSArray)metadata
{
  AVCaptureMovieFileOutputInternal *internal;
  NSArray *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = self->_internal->metadata;
  objc_sync_exit(internal);
  return v4;
}

- (void)setMetadata:(NSArray *)metadata
{
  AVCaptureMovieFileOutputInternal *internal;
  AVCaptureMovieFileOutputInternal *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  objc_sync_enter(internal);

  self->_internal->metadata = (NSArray *)-[NSArray copy](metadata, "copy");
  v6 = self->_internal;
  if (v6->recording)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", v6->metadata);
    if (!v7)
    {
      v9 = *MEMORY[0x1E0CF2BA0];
      v10 = *MEMORY[0x1E0CC47F8];
      v22[0] = *MEMORY[0x1E0CC47F0];
      v8 = v22[0];
      v22[1] = v10;
      v11 = MEMORY[0x1E0C9AA60];
      v23[0] = v9;
      v23[1] = MEMORY[0x1E0C9AA60];
      v24[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v12 = *MEMORY[0x1E0CF2BA8];
      v20[0] = v8;
      v20[1] = v10;
      v21[0] = v12;
      v21[1] = v11;
      v24[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v13 = *MEMORY[0x1E0CF2B98];
      v18[0] = v8;
      v18[1] = v10;
      v19[0] = v13;
      v19[1] = v11;
      v24[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v14 = *MEMORY[0x1E0CF2BB0];
      v16[0] = v8;
      v16[1] = v10;
      v17[0] = v14;
      v17[1] = v11;
      v24[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__AVCaptureMovieFileOutput_setMetadata___block_invoke;
    v15[3] = &unk_1E4216870;
    v15[4] = self;
    v15[5] = v7;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v15);
  }
  objc_sync_exit(internal);
}

uint64_t __40__AVCaptureMovieFileOutput_setMetadata___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = *(_QWORD *)(v3 + 40);
    result = CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v6)
      return v6(a2, v4, *MEMORY[0x1E0D04300], v5);
  }
  return result;
}

+ (BOOL)updateMovieMetadataInFile:(id)a3 withMetadata:(id)a4 error:(id *)a5
{
  const void *v6;
  int v7;

  if (a5)
    *a5 = 0;
  objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", a4);
  v6 = (const void *)FigMetadataRewriterDictionaryCreateFromFigMetadataPropertyArray();
  v7 = FigRewriteMetadata();
  if (v6)
    CFRelease(v6);
  if (a5 && v7)
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
  return v7 == 0;
}

+ (BOOL)consolidateMovieFragmentsInFile:(id)a3 error:(id *)a4
{
  int v5;
  void *v6;
  BOOL result;

  if (!a4)
    return FigConsolidateMovieFragments() == 0;
  *a4 = 0;
  v5 = FigConsolidateMovieFragments();
  if (!v5)
    return 1;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v5, 0);
  result = 0;
  *a4 = v6;
  return result;
}

- (BOOL)recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection:(AVCaptureConnection *)connection
{
  if (connection)
    return -[NSMutableArray containsObject:](self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack, "containsObject:");
  else
    return 0;
}

- (void)setRecordsVideoOrientationAndMirroringChanges:(BOOL)doRecordChanges asMetadataTrackForConnection:(AVCaptureConnection *)connection
{
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  AVCaptureConnection *v16;

  if (connection)
  {
    v6 = doRecordChanges;
    if (-[NSArray containsObject:](-[AVCaptureOutput connections](self, "connections"), "containsObject:", connection))
    {
      v7 = -[AVCaptureConnection mediaType](connection, "mediaType");
      if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B90]) & 1) != 0)
      {
        if (-[AVCaptureConnection isVideoOrientationSupported](connection, "isVideoOrientationSupported"))
        {
          if (-[AVCaptureConnection isVideoMirroringSupported](connection, "isVideoMirroringSupported"))
          {
            if (-[NSMutableArray containsObject:](self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack, "containsObject:", connection))
            {
              if (!v6)
                -[NSMutableArray removeObject:](self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack, "removeObject:", connection);
            }
            else if (v6)
            {
              -[NSMutableArray addObject:](self->_internal->connectionsThatRecordVideoOrientationAndMirroringChangesAsMetadataTrack, "addObject:", connection);
            }
            return;
          }
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = *MEMORY[0x1E0C99778];
          v16 = connection;
        }
        else
        {
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = *MEMORY[0x1E0C99778];
          v16 = connection;
        }
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        v14 = *MEMORY[0x1E0C99778];
        v16 = connection;
      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99778];
      v16 = connection;
    }
    v10 = AVMethodExceptionReasonWithObjectAndSelector();
    v11 = v13;
    v12 = v14;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = AVMethodExceptionReasonWithObjectAndSelector();
    v11 = v8;
    v12 = v9;
  }
  v15 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, 0, v16);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v15);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v15);
}

- (void)startRecordingMovieWithSettings:(id)a3 delegate:(id)a4
{
  AVCaptureConnection *v7;
  double v8;
  double v9;
  void *v10;
  AVMomentCaptureMovieFileOutputDelegateWrapper *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  if (!a3
    || !self
    || !-[NSArray containsObject:](-[AVCaptureMovieFileOutput availableVideoCodecTypes](self, "availableVideoCodecTypes"), "containsObject:", objc_msgSend(a3, "videoCodecType"))|| !objc_msgSend(a3, "movieFileURL")|| !objc_msgSend((id)objc_msgSend(a3, "movieFileURL"), "isFileURL")|| !a4|| (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_18:
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v10);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
    return;
  }
  v7 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  if (objc_msgSend(a3, "isAutoSpatialOverCaptureEnabled"))
  {
    if (!v7
      || !objc_msgSend(-[AVCaptureConnection sourceDevice](v7, "sourceDevice"), "isSpatialOverCaptureEnabled")|| !objc_msgSend(a3, "spatialOverCaptureMovieFileURL")|| (objc_msgSend((id)objc_msgSend(a3, "spatialOverCaptureMovieFileURL"), "isFileURL") & 1) == 0)
    {
      goto LABEL_18;
    }
LABEL_15:
    -[AVCaptureMovieFileOutput outputSizeForSourceFormat:](self, "outputSizeForSourceFormat:", objc_msgSend(-[AVCaptureConnection sourceDevice](v7, "sourceDevice"), "activeFormat"));
    if (!AVCaptureMovieFileURLIsValidForConnection(v7, v8, v9, objc_msgSend(a3, "movieFileURL"), &v13))
      goto LABEL_17;
    goto LABEL_16;
  }
  if (v7)
    goto LABEL_15;
LABEL_16:
  if (!objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "count"))
    goto LABEL_18;
LABEL_17:
  if (v13)
    goto LABEL_18;
  v11 = +[AVMomentCaptureMovieFileOutputDelegateWrapper wrapperWithSettings:delegate:connections:](AVMomentCaptureMovieFileOutputDelegateWrapper, "wrapperWithSettings:delegate:connections:", a3, a4, -[AVCaptureOutput liveConnections](self, "liveConnections"));
  if (-[AVCaptureMovieFileOutput _totalNANDBandwidthAllowed:videoCodecType:](self, "_totalNANDBandwidthAllowed:videoCodecType:", objc_msgSend(a3, "movieFileURL"), objc_msgSend(a3, "videoCodecType")))
  {
    if (!AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureCheckIfFileAlreadyExistForMFO"))
      || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend((id)objc_msgSend(a3, "movieFileURL"), "path")) & 1) == 0)
    {
      -[AVCaptureMovieFileOutput _startRecording:](self, "_startRecording:", v11);
      return;
    }
    v12 = 4294950886;
  }
  else
  {
    v12 = 4294951858;
  }
  v14 = *MEMORY[0x1E0D04368];
  v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  -[AVCaptureMovieFileOutput handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:](self, "handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:", v11, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1), 0, 0);
}

- (id)_avErrorUserInfoDictionaryForError:(int)a3 wrapper:(id)a4 payload:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  int v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];

  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D043F0]);
  if (v10)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CF2A90]);
  v11 = 1;
  switch(a3)
  {
    case -16413:
      v12 = (void *)MEMORY[0x1E0CB3B18];
      if (self)
        -[AVCaptureFileOutput maxRecordedDuration](self, "maxRecordedDuration", 1);
      else
        memset(v21, 0, sizeof(v21));
      v13 = objc_msgSend(v12, "valueWithCMTime:", v21);
      v14 = (_QWORD *)MEMORY[0x1E0CF2A98];
      goto LABEL_20;
    case -16412:
      v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[AVCaptureFileOutput maxRecordedFileSize](self, "maxRecordedFileSize", 1));
      v14 = (_QWORD *)MEMORY[0x1E0CF2A70];
      goto LABEL_20;
    case -16411:
      v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D041C8]), "BOOLValue");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = a4;
      else
        v16 = 0;
      if (v15)
        v17 = v16 == 0;
      else
        v17 = 1;
      if (v17)
        v18 = objc_msgSend(a4, "outputFileURL");
      else
        v18 = objc_msgSend(v16, "spatialOverCaptureMovieFileURL");
      v13 = v18;
      v14 = (_QWORD *)MEMORY[0x1E0CB3308];
LABEL_20:
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *v14);
      v11 = 1;
      break;
    case -16405:
      v11 = 2;
      break;
    default:
      break;
  }
  v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CF2A88]);
  return v9;
}

- (CGSize)outputSizeForSourceFormat:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqualToString:", CFSTR("AVCaptureSessionPresetPhoto")))
  {
    v5 = objc_msgSend(a3, "previewDimensions");
    v6 = (double)(int)v5;
    v7 = (double)SHIDWORD(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVCaptureMovieFileOutput;
    -[AVCaptureOutput outputSizeForSourceFormat:](&v8, sel_outputSizeForSourceFormat_, a3);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_internal->weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041F0], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041F8], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041E0], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041E8], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041D8], a3, 0);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureMovieFileOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v7, sel_attachSafelyToFigCaptureSession_, a3);
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  AVCaptureMovieFileOutputInternal *internal;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  objc_sync_enter(internal);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSMutableArray reverseObjectEnumerator](self->_internal->recordingDelegatesArray, "reverseObjectEnumerator");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isTrueVideoCaptureEnabled"))
        {
          objc_msgSend(v10, "setPendingDidStopRecordingUnregistrationCaptureSession:", a3);
          v11 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:
  objc_sync_exit(internal);
  v12 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v12, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041F0], a3);
  if ((v11 & 1) == 0)
    objc_msgSend(v12, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041F8], a3);
  objc_msgSend(v12, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041E0], a3);
  objc_msgSend(v12, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041E8], a3);
  objc_msgSend(v12, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041D8], a3);
  v13.receiver = self;
  v13.super_class = (Class)AVCaptureMovieFileOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v13, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  AVCaptureMovieFileOutputInternal *internal;
  id v5;
  NSObject *v6;
  _QWORD v7[6];

  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = (id)-[NSMutableArray copy](self->_internal->recordingDelegatesArray, "copy");
  objc_sync_exit(internal);
  v6 = dispatch_queue_create("com.apple.avfoundation.capture.moviefileoutput.cleanupQueue", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__AVCaptureMovieFileOutput_safelyHandleServerConnectionDeathForFigCaptureSession___block_invoke;
  v7[3] = &unk_1E4216408;
  v7[4] = v5;
  v7[5] = self;
  dispatch_async(v6, v7);

}

uint64_t __82__AVCaptureMovieFileOutput_safelyHandleServerConnectionDeathForFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0D04368];
  v14[0] = &unk_1E424D068;
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(void **)(a1 + 32);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), v2, 1, 1);
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)_removeRecordingDelegateWrapper:(id)a3
{
  void *v5;
  int v6;
  int v7;
  AVCaptureMovieFileOutputInternal *internal;

  -[NSMutableArray removeObject:](self->_internal->recordingDelegatesArray, "removeObject:");
  if (objc_msgSend(a3, "pendingDidStopRecordingUnregistrationCaptureSession"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, mfoNotificationHandler, *MEMORY[0x1E0D041F8], objc_msgSend(a3, "pendingDidStopRecordingUnregistrationCaptureSession"));
    objc_msgSend(a3, "setPendingDidStopRecordingUnregistrationCaptureSession:", 0);
  }
  v5 = (void *)-[NSMutableArray firstObject](self->_internal->recordingDelegatesArray, "firstObject");
  v6 = objc_msgSend(v5, "isRecording");
  v7 = objc_msgSend(v5, "isPaused");
  internal = self->_internal;
  if (internal->recording != v6)
  {
    -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("recording"));
    internal = self->_internal;
  }
  if (internal->paused != v7)
  {
    -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("paused"));
    self->_internal->paused = v7;
    -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("paused"));
    internal = self->_internal;
  }
  if (internal->recording != v6)
  {
    internal->recording = v6;
    -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("recording"));
  }
}

- (void)handleDidStartRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4
{
  char isKindOfClass;
  void *v8;
  _QWORD *v9;
  _QWORD v10[6];
  _QWORD v11[7];

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 || (isKindOfClass & 1) == 0)
  {
    objc_msgSend(a3, "isRecording");
    if ((objc_msgSend(a3, "isRecording") & 1) != 0)
      return;
    v8 = (void *)objc_msgSend(a3, "delegateStorage");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__AVCaptureMovieFileOutput_handleDidStartRecordingNotificationForWrapper_withPayload___block_invoke_2;
    v10[3] = &unk_1E42175B8;
    v10[4] = a3;
    v10[5] = self;
    v9 = v10;
    goto LABEL_9;
  }
  if (objc_msgSend(a3, "isRecording"))
    objc_msgSend(a3, "spatialOverCaptureMovieFileURL");
  if ((objc_msgSend(a3, "isRecording") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(a3, "delegateStorage");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__AVCaptureMovieFileOutput_handleDidStartRecordingNotificationForWrapper_withPayload___block_invoke;
    v11[3] = &unk_1E4217590;
    v11[4] = a3;
    v11[5] = a4;
    v11[6] = self;
    v9 = v11;
LABEL_9:
    objc_msgSend(v8, "invokeDelegateCallbackWithBlock:", v9);
  }
}

uint64_t __86__AVCaptureMovieFileOutput_handleDidStartRecordingNotificationForWrapper_withPayload___block_invoke(id *a1, void *a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVMomentCaptureMovieRecordingResolvedSettings *v8;
  void *v9;
  int v10;
  _QWORD *v11;

  objc_msgSend(a1[4], "setRecording:", 1);
  v4 = objc_msgSend((id)objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D041B8]), "intValue");
  v5 = objc_msgSend((id)objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D041B0]), "intValue");
  v6 = objc_msgSend((id)objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D041C0]), "BOOLValue");
  if (objc_msgSend((id)objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D046B0]), "BOOLValue"))v7 = objc_msgSend(a1[4], "spatialOverCaptureMovieFileURL");
  else
    v7 = 0;
  v8 = +[AVMomentCaptureMovieRecordingResolvedSettings movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:](AVMomentCaptureMovieRecordingResolvedSettings, "movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:", objc_msgSend(a1[4], "settingsID"), v6, objc_msgSend(a1[4], "outputFileURL"), v7, v4 | (unint64_t)(v5 << 32));
  objc_msgSend(a1[4], "setResolvedSettings:", v8);
  v9 = (void *)*((_QWORD *)a1[6] + 4);
  objc_sync_enter(v9);
  v10 = objc_msgSend(a1[4], "isRecording");
  v11 = a1[6];
  if (*(unsigned __int8 *)(v11[4] + 89) != v10)
  {
    objc_msgSend(v11, "willChangeValueForKey:", CFSTR("recording"));
    *(_BYTE *)(*((_QWORD *)a1[6] + 4) + 89) = objc_msgSend(a1[4], "isRecording");
    objc_msgSend(a1[6], "didChangeValueForKey:", CFSTR("recording"));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a2, "captureOutput:didBeginMovieCaptureForResolvedSettings:", a1[6], v8);
  return objc_sync_exit(v9);
}

uint64_t __86__AVCaptureMovieFileOutput_handleDidStartRecordingNotificationForWrapper_withPayload___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  _QWORD *v6;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setRecording:", 1);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  objc_sync_enter(v4);
  v5 = objc_msgSend(*(id *)(a1 + 32), "isRecording");
  v6 = *(_QWORD **)(a1 + 40);
  if (*(unsigned __int8 *)(v6[4] + 89) != v5)
  {
    objc_msgSend(v6, "willChangeValueForKey:", CFSTR("recording"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + 89) = objc_msgSend(*(id *)(a1 + 32), "isRecording");
    objc_msgSend(*(id *)(a1 + 40), "didChangeValueForKey:", CFSTR("recording"));
  }
  objc_sync_exit(v4);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "captureOutput:didStartRecordingToOutputFileAtURL:fromConnections:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "outputFileURL"), objc_msgSend(*(id *)(a1 + 32), "connections"));
  return result;
}

- (void)handleDidStopRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4 demoof:(BOOL)a5 addMetadata:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  char isKindOfClass;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *v20;
  void *v21;
  _QWORD v22[8];
  uint64_t v23;
  _QWORD v24[7];

  v6 = a6;
  v7 = a5;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a3 && (isKindOfClass & 1) != 0)
  {
    -[AVCaptureMovieFileOutput handleDidStopRecordingNotificationForMomentCaptureWrapper:withPayload:demoof:addMetadata:](self, "handleDidStopRecordingNotificationForMomentCaptureWrapper:withPayload:demoof:addMetadata:", a3, a4, v7, v6);
  }
  else
  {
    v12 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
    v13 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043E0]);
    v14 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D043D8]);
    if (v14)
      v15 = v13 == 0;
    else
      v15 = 1;
    v16 = MEMORY[0x1E0C809B0];
    if (!v15)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v14, CFSTR("AVCaptureOutputNotificationInfoVideoPreviewFrameSurface"), v13, CFSTR("AVCaptureOutputNotificationInfoVideoPreviewFrameSurfaceSize"), 0);
      v24[0] = v16;
      v24[1] = 3221225472;
      v24[2] = __104__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForWrapper_withPayload_demoof_addMetadata___block_invoke;
      v24[3] = &unk_1E4216408;
      v24[4] = self;
      v24[5] = v17;
      -[AVCaptureOutput performBlockOnSessionNotifyingThread:](self, "performBlockOnSessionNotifyingThread:", v24);

    }
    v23 = 0;
    if (v7)
    {
      +[AVCaptureMovieFileOutput consolidateMovieFragmentsInFile:error:](AVCaptureMovieFileOutput, "consolidateMovieFragmentsInFile:error:", objc_msgSend(a3, "outputFileURL"), &v23);
      a4 = (id)objc_msgSend(a4, "mutableCopy");
      v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23 == 0);
      objc_msgSend(a4, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D043F0]);
    }
    v19 = -[AVCaptureMovieFileOutput metadata](self, "metadata");
    if (v6 && !v23)
    {
      v20 = v19;
      if ((objc_msgSend((id)objc_msgSend(a3, "metadata"), "isEqual:", v19) & 1) == 0)
        +[AVCaptureMovieFileOutput updateMovieMetadataInFile:withMetadata:error:](AVCaptureMovieFileOutput, "updateMovieMetadataInFile:withMetadata:error:", objc_msgSend(a3, "outputFileURL"), v20, &v23);
    }
    if ((_DWORD)v12)
    {
      -[AVCaptureMovieFileOutput _avErrorUserInfoDictionaryForError:wrapper:payload:](self, "_avErrorUserInfoDictionaryForError:wrapper:payload:", v12, a3, a4);
      v23 = AVLocalizedErrorWithUnderlyingOSStatus();
    }
    v21 = (void *)objc_msgSend(a3, "delegateStorage");
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __104__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForWrapper_withPayload_demoof_addMetadata___block_invoke_2;
    v22[3] = &unk_1E42175E0;
    v22[4] = self;
    v22[5] = a3;
    v22[6] = a4;
    v22[7] = v23;
    objc_msgSend(v21, "invokeDelegateCallbackWithBlock:", v22);
  }
}

uint64_t __104__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForWrapper_withPayload_demoof_addMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVCaptureMovieFileOutputRecordingCompletedNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __104__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForWrapper_withPayload_demoof_addMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(a1 + 32), "_removeRecordingDelegateWrapper:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D04328]);
    if (v5)
      v6 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    else
      v6 = 0;
    return objc_msgSend(a2, "captureOutput:didFinishRecordingToOutputFileAtURL:debugMetadataSidecarFileURL:fromConnections:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "outputFileURL"), v6, objc_msgSend(*(id *)(a1 + 40), "connections"), *(_QWORD *)(a1 + 56));
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "outputFileURL"), objc_msgSend(*(id *)(a1 + 40), "connections"), *(_QWORD *)(a1 + 56));
  }
  return result;
}

- (void)handleDidStopRecordingNotificationForMomentCaptureWrapper:(id)a3 withPayload:(id)a4 demoof:(BOOL)a5 addMetadata:(BOOL)a6
{
  _BOOL4 v6;
  id v7;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[9];
  char v18;
  uint64_t v19;

  v6 = a5;
  v7 = a4;
  v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  v11 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D041C8]), "BOOLValue");
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(a3, "spatialOverCaptureMovieFileURL");
  else
    v13 = objc_msgSend(a3, "outputFileURL");
  v14 = v13;
  v19 = 0;
  if (v6)
  {
    +[AVCaptureMovieFileOutput consolidateMovieFragmentsInFile:error:](AVCaptureMovieFileOutput, "consolidateMovieFragmentsInFile:error:", v13, &v19);
    v7 = (id)objc_msgSend(v7, "mutableCopy");
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19 == 0);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D043F0]);
  }
  if ((_DWORD)v10)
  {
    -[AVCaptureMovieFileOutput _avErrorUserInfoDictionaryForError:wrapper:payload:](self, "_avErrorUserInfoDictionaryForError:wrapper:payload:", v10, a3, v7);
    v19 = AVLocalizedErrorWithUnderlyingOSStatus();
  }
  v16 = (void *)objc_msgSend(a3, "delegateStorage");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __117__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForMomentCaptureWrapper_withPayload_demoof_addMetadata___block_invoke;
  v17[3] = &unk_1E4217608;
  v18 = v12;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = v7;
  v17[7] = v14;
  v17[8] = v19;
  objc_msgSend(v16, "invokeDelegateCallbackWithBlock:", v17);
}

uint64_t __117__AVCaptureMovieFileOutput_handleDidStopRecordingNotificationForMomentCaptureWrapper_withPayload_demoof_addMetadata___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t result;
  __IOSurface *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  AVMomentCaptureMovie *v13;
  AVMomentCaptureMovie *v14;
  const __CFDictionary *v15;
  CMTime v16;
  CMTime pixelBufferOut;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_sync_enter(v4);
  v5 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(v5, "setDidFinishWritingSpatialOverCaptureMovieCallbackFired:", 1);
  else
    objc_msgSend(v5, "setDidFinishWritingMovieCallbackFired:", 1);
  if (objc_msgSend(*(id *)(a1 + 40), "didFinishWritingMovieCallbackFired")
    && objc_msgSend(*(id *)(a1 + 40), "didFinishWritingSpatialOverCaptureMovieCallbackFired"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeRecordingDelegateWrapper:", *(_QWORD *)(a1 + 40));
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v4);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v8 = (__IOSurface *)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D043D8]);
    v9 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D04328]);
    if (v9)
      v10 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    else
      v10 = 0;
    v11 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 72))
      v12 = objc_msgSend(v11, "spatialOverCaptureMovieMetadata");
    else
      v12 = objc_msgSend(v11, "metadata");
    v13 = +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(a1 + 40), "resolvedSettings"), *(_QWORD *)(a1 + 56), v12);
    v14 = v13;
    if (v10)
      -[AVMomentCaptureMovie _setDebugMetadataSidecarFileURL:](v13, "_setDebugMetadataSidecarFileURL:", v10);
    if (v8)
    {
      pixelBufferOut.value = 0;
      if (!CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8, 0, (CVPixelBufferRef *)&pixelBufferOut))
      {
        -[AVMomentCaptureMovie _setPreviewPixelBuffer:](v14, "_setPreviewPixelBuffer:", pixelBufferOut.value);
        if (pixelBufferOut.value)
          CFRelease((CFTypeRef)pixelBufferOut.value);
      }
    }
    v15 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D041D0]);
    if (v15)
    {
      memset(&pixelBufferOut, 0, sizeof(pixelBufferOut));
      CMTimeMakeFromDictionary(&pixelBufferOut, v15);
      v16 = pixelBufferOut;
      -[AVMomentCaptureMovie _setDuration:](v14, "_setDuration:", &v16);
    }
    result = objc_msgSend(a2, "captureOutput:didFinishWritingMovie:error:", *(_QWORD *)(a1 + 32), v14, *(_QWORD *)(a1 + 64));
  }
  if (v6)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "captureOutput:didFinishMovieCaptureForResolvedSettings:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "resolvedSettings"), *(_QWORD *)(a1 + 64));
  }
  return result;
}

- (void)handleDidPauseRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4
{
  void *v6;
  _QWORD v7[6];

  objc_msgSend(a3, "isRecording");
  v6 = (void *)objc_msgSend(a3, "delegateStorage");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__AVCaptureMovieFileOutput_handleDidPauseRecordingNotificationForWrapper_withPayload___block_invoke;
  v7[3] = &unk_1E42175B8;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v6, "invokeDelegateCallbackWithBlock:", v7);
}

uint64_t __86__AVCaptureMovieFileOutput_handleDidPauseRecordingNotificationForWrapper_withPayload___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a2, "captureOutput:didPauseRecordingToOutputFileAtURL:fromConnections:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "outputFileURL"), objc_msgSend(*(id *)(a1 + 40), "connections"));
  objc_msgSend(*(id *)(a1 + 40), "setPaused:", 1);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_sync_enter(v4);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 90);
  if (v5 != objc_msgSend(*(id *)(a1 + 40), "isPaused"))
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("paused"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 90) = objc_msgSend(*(id *)(a1 + 40), "isPaused");
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("paused"));
  }
  return objc_sync_exit(v4);
}

- (void)handleDidResumeRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4
{
  void *v6;
  _QWORD v7[6];

  objc_msgSend(a3, "isRecording");
  objc_msgSend(a3, "isPaused");
  v6 = (void *)objc_msgSend(a3, "delegateStorage");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__AVCaptureMovieFileOutput_handleDidResumeRecordingNotificationForWrapper_withPayload___block_invoke;
  v7[3] = &unk_1E42175B8;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v6, "invokeDelegateCallbackWithBlock:", v7);
}

uint64_t __87__AVCaptureMovieFileOutput_handleDidResumeRecordingNotificationForWrapper_withPayload___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a2, "captureOutput:didResumeRecordingToOutputFileAtURL:fromConnections:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "outputFileURL"), objc_msgSend(*(id *)(a1 + 40), "connections"));
  objc_msgSend(*(id *)(a1 + 40), "setPaused:", 0);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_sync_enter(v4);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 90);
  if (v5 != objc_msgSend(*(id *)(a1 + 40), "isPaused"))
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("paused"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 90) = objc_msgSend(*(id *)(a1 + 40), "isPaused");
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("paused"));
  }
  return objc_sync_exit(v4);
}

- (void)handleDidDropFrameWhileRecordingNotificationForWrapper:(id)a3 withPayload:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];

  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  if ((_DWORD)v7)
  {
    -[AVCaptureMovieFileOutput _avErrorUserInfoDictionaryForError:wrapper:payload:](self, "_avErrorUserInfoDictionaryForError:wrapper:payload:", v7, a3, a4);
    v8 = AVLocalizedErrorWithUnderlyingOSStatus();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_msgSend(a3, "delegateStorage");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__AVCaptureMovieFileOutput_handleDidDropFrameWhileRecordingNotificationForWrapper_withPayload___block_invoke;
  v10[3] = &unk_1E4217590;
  v10[4] = self;
  v10[5] = v8;
  v10[6] = a3;
  objc_msgSend(v9, "invokeDelegateCallbackWithBlock:", v10);
}

uint64_t __95__AVCaptureMovieFileOutput_handleDidDropFrameWhileRecordingNotificationForWrapper_withPayload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (dword_1ECFED640)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "captureOutput:didDropFrameWhileRecordingToOutputFileAtURL:fromConnections:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 48), "outputFileURL", v6, v7), objc_msgSend(*(id *)(a1 + 48), "connections"), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)handleNotification:(id)a3 payload:(id)a4
{
  AVCaptureMovieFileOutputInternal *internal;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  objc_sync_enter(internal);
  v8 = (id)-[NSMutableArray copy](self->_internal->recordingDelegatesArray, "copy");
  objc_sync_exit(internal);
  if ((objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")) & 1) != 0)
  {
    v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04408]), "longLongValue");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v13, "settingsID") == v9)
          {
            if (v13)
            {
              if (dword_1ECFED640)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D041F0], v15, v16))
              {
                -[AVCaptureMovieFileOutput handleDidStartRecordingNotificationForWrapper:withPayload:](self, "handleDidStartRecordingNotificationForWrapper:withPayload:", v13, a4);
              }
              else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D041F8]))
              {
                -[AVCaptureMovieFileOutput handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:](self, "handleDidStopRecordingNotificationForWrapper:withPayload:demoof:addMetadata:", v13, a4, 0, 0);
              }
              else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D041E0]))
              {
                -[AVCaptureMovieFileOutput handleDidPauseRecordingNotificationForWrapper:withPayload:](self, "handleDidPauseRecordingNotificationForWrapper:withPayload:", v13, a4);
              }
              else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D041E8]))
              {
                -[AVCaptureMovieFileOutput handleDidResumeRecordingNotificationForWrapper:withPayload:](self, "handleDidResumeRecordingNotificationForWrapper:withPayload:", v13, a4);
              }
              else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D041D8]))
              {
                -[AVCaptureMovieFileOutput handleDidDropFrameWhileRecordingNotificationForWrapper:withPayload:](self, "handleDidDropFrameWhileRecordingNotificationForWrapper:withPayload:", v13, a4);
              }
            }
            return;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
  }
}

- (BOOL)_totalNANDBandwidthAllowed:(id)a3 videoCodecType:(id)a4
{
  return objc_msgSend(-[AVCaptureOutput session](self, "session"), "requestNANDBandwidthToStartMovieFileRecording:outputFileURL:videoCodecType:", self, a3, a4);
}

- (void)_startRecording:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  AVCaptureMovieFileOutputInternal *v11;
  BOOL primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v30;
  uint64_t v31;
  AVCaptureMovieFileOutputInternal *internal;
  id v33;
  id obj;
  _QWORD v35[6];
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  BOOL v45;
  __int16 v46;
  char v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = a3;
  else
    v5 = 0;
  v33 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outputFileURL"));
  -[NSMutableArray addObject:](self->_internal->recordingDelegatesArray, "addObject:", a3);
  -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outputFileURL"));
  if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqualToString:", CFSTR("AVCaptureSessionPresetVoicemailGreeting")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "connections"), "firstObject");
    v7 = (void *)objc_msgSend(v6, "mediaType");
    if (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CF2B68]))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D03B90]);
      objc_msgSend(v8, "setSettingsID:", objc_msgSend(v33, "settingsID"));
      objc_msgSend(v8, "setOutputURL:", objc_msgSend(v33, "outputFileURL"));
      v9 = *MEMORY[0x1E0CF2AB8];
      objc_msgSend(v8, "setOutputFileType:", *MEMORY[0x1E0CF2AB8]);
      -[AVCaptureFileOutput maxRecordedDuration](self, "maxRecordedDuration");
      v57 = v59;
      v58 = v60;
      objc_msgSend(v8, "setMaxDuration:", &v57);
      objc_msgSend(v8, "setMaxFileSize:", -[AVCaptureFileOutput maxRecordedFileSize](self, "maxRecordedFileSize"));
      objc_msgSend(v8, "setMinFreeDiskSpaceLimit:", -[AVCaptureFileOutput minFreeDiskSpaceLimit](self, "minFreeDiskSpaceLimit"));
      objc_msgSend(v8, "setAudioSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v6, 0, 0, v9, 0, 0));
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D03BE0]);
    objc_msgSend(v8, "setSettingsID:", objc_msgSend(a3, "settingsID"));
    objc_msgSend(v8, "setOutputURL:", objc_msgSend(a3, "outputFileURL"));
    v10 = *MEMORY[0x1E0CF2B08];
    objc_msgSend(v8, "setOutputFileType:", *MEMORY[0x1E0CF2B08]);
    -[AVCaptureFileOutput maxRecordedDuration](self, "maxRecordedDuration");
    v53 = v55;
    v54 = v56;
    objc_msgSend(v8, "setMaxDuration:", &v53);
    objc_msgSend(v8, "setMaxFileSize:", -[AVCaptureFileOutput maxRecordedFileSize](self, "maxRecordedFileSize"));
    objc_msgSend(v8, "setMinFreeDiskSpaceLimit:", -[AVCaptureFileOutput minFreeDiskSpaceLimit](self, "minFreeDiskSpaceLimit"));
    -[AVCaptureMovieFileOutput movieFragmentInterval](self, "movieFragmentInterval");
    v49 = v51;
    v50 = v52;
    objc_msgSend(v8, "setMovieFragmentInterval:", &v49);
    objc_msgSend(v8, "setMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(a3, "metadata")));
    objc_msgSend(v8, "setSendPreviewIOSurface:", self->_internal->sendLastVideoPreviewFrame);
    objc_msgSend(v8, "setUsesVirtualCaptureCard:", self->_internal->usesVirtualCaptureCard);
    v11 = self->_internal;
    primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled = v11->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
    if (primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled)
    {
      v47 = 0;
      v46 = 0;
      v45 = primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled;
      v48 = *(_OWORD *)&v11->primaryConstituentDeviceSwitchingBehavior;
      objc_msgSend(v8, "setBravoCameraSelectionConfigurationForRecording:", &v45);
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = (void *)objc_msgSend(a3, "connections");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
    v31 = v10;
    if (v14)
    {
      obj = v13;
      v15 = 0;
      v16 = *(_QWORD *)v42;
      v17 = *MEMORY[0x1E0CF2B90];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v19, "mediaType"), "isEqualToString:", v17))
          {
            objc_msgSend(v8, "setVideoMirrored:", objc_msgSend(v19, "isVideoMirrored"));
            objc_msgSend(v8, "setVideoOrientation:", objc_msgSend(v19, "_videoOrientation"));
            objc_msgSend(v8, "setRecordVideoOrientationAndMirroringChanges:", -[AVCaptureMovieFileOutput recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection:](self, "recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection:", v19));
            if (v5)
            {
              objc_msgSend(v8, "setSpatialOverCaptureMovieURL:", objc_msgSend(v5, "spatialOverCaptureMovieFileURL"));
              objc_msgSend(v8, "setSpatialOverCaptureMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E0CF2D28], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v5, "spatialOverCaptureMovieMetadata")));
              if (objc_msgSend(v5, "videoCodecType"))
              {
                if ((objc_msgSend((id)objc_msgSend(v5, "videoCodecType"), "isEqual:", self->_internal->videoCodec) & 1) == 0)
                {

                  self->_internal->videoCodec = (NSString *)objc_msgSend((id)objc_msgSend(v5, "videoCodecType"), "copy");
                  self->_internal->videoCompressionProperties = 0;
                }
              }
            }
            v20 = objc_msgSend(v19, "isDebugMetadataSidecarFileEnabled");
            if (v20)
            {
              objc_msgSend((id)objc_msgSend(v33, "delegateStorage"), "delegate");
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                LOBYTE(v20) = 1;
              }
              else
              {
                objc_msgSend((id)objc_msgSend(v33, "delegateStorage"), "delegate");
                LOBYTE(v20) = objc_opt_respondsToSelector();
              }
            }
            objc_msgSend(v8, "setDebugMetadataSidecarFileEnabled:", v20 & 1);
            objc_msgSend(v8, "setVideoSettings:", -[AVCaptureMovieFileOutput outputSettingsForConnection:](self, "outputSettingsForConnection:", v19));
            v21 = (void *)objc_msgSend((id)objc_msgSend(v19, "sourceDevice"), "activeFormat");
            if (v21)
            {
              CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v21, "formatDescription"));
              v15 = FigCapturePixelFormatIs422();
            }
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v22 = (void *)objc_msgSend(v33, "connections");
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v61, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v38;
      v25 = *MEMORY[0x1E0CF2B68];
      v26 = v15 & 1;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v22);
          v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          if (objc_msgSend((id)objc_msgSend(v28, "mediaType"), "isEqualToString:", v25))
          {
            objc_msgSend(v8, "setAudioSettings:", -[AVCaptureMovieFileOutput outputSettingsForConnection:](self, "outputSettingsForConnection:", v28));
            if (objc_msgSend((id)objc_msgSend(v28, "sourceDeviceInput"), "audioCaptureMode") == 2)
              objc_msgSend(v8, "setCinematicAudioSettings:", -[AVCaptureOutput recommendedCinematicAudioOutputSettingsForConnection:fileType:isProResCapture:](self, "recommendedCinematicAudioOutputSettingsForConnection:fileType:isProResCapture:", v28, v31, v26));
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v61, 16);
      }
      while (v23);
    }
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    v30 = CTGreenTeaOsLogHandle;
    if (CTGreenTeaOsLogHandle && os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EDF1000, v30, OS_LOG_TYPE_INFO, "Record a video", buf, 2u);
    }
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __44__AVCaptureMovieFileOutput__startRecording___block_invoke;
  v35[3] = &unk_1E4216870;
  v35[4] = self;
  v35[5] = v8;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v35);

  objc_sync_exit(internal);
}

uint64_t __44__AVCaptureMovieFileOutput__startRecording___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = *(_QWORD *)(v3 + 40);
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
    if (v6)
    {
      return v6(a2, v4, v5);
    }
    else
    {
      v7 = *MEMORY[0x1E0D04368];
      v8[0] = &unk_1E424D080;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (int)_stopRecording
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__AVCaptureMovieFileOutput__stopRecording__block_invoke;
  v3[3] = &unk_1E4216D70;
  v3[4] = self;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v3);
  return 0;
}

uint64_t __42__AVCaptureMovieFileOutput__stopRecording__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
    if (v4)
    {
      return v4(a2, v3);
    }
    else
    {
      v5 = *MEMORY[0x1E0D04368];
      v6[0] = &unk_1E424D080;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  objc_super v7;

  -[AVCaptureMovieFileOutput _updateSupportedPropertiesForSourceDevice:](self, "_updateSupportedPropertiesForSourceDevice:", a4);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureMovieFileOutput;
  -[AVCaptureOutput handleChangedActiveFormat:forDevice:](&v7, sel_handleChangedActiveFormat_forDevice_, a3, a4);
}

- (void)handleVideoStabilizationModeChangedForConnection:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[NSArray containsObject:](-[AVCaptureOutput connections](self, "connections"), "containsObject:", a3))
  {
    v5 = (void *)objc_msgSend(a3, "mediaType");
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF2B90]))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = (void *)objc_msgSend(a3, "inputPorts");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_msgSend(v11, "input");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v12 = objc_msgSend((id)objc_msgSend(v11, "input"), "device");
              if (v12)
                -[AVCaptureMovieFileOutput _updateSpatialVideoCaptureSupportedForSourceDevice:](self, "_updateSpatialVideoCaptureSupportedForSourceDevice:", v12);
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }
    }
  }
LABEL_14:
  v13.receiver = self;
  v13.super_class = (Class)AVCaptureMovieFileOutput;
  -[AVCaptureOutput handleVideoStabilizationModeChangedForConnection:](&v13, sel_handleVideoStabilizationModeChangedForConnection_, a3);
}

- (void)_updateSupportedPropertiesForSourceDevice:(id)a3
{
  -[AVCaptureMovieFileOutput _updateAvailableVideoCodecTypesForSourceDevice:](self, "_updateAvailableVideoCodecTypesForSourceDevice:");
  -[AVCaptureMovieFileOutput _updateBravoCameraSelectionBehaviorForSourceDevice:](self, "_updateBravoCameraSelectionBehaviorForSourceDevice:", a3);
  -[AVCaptureMovieFileOutput _updateDepthDataDeliverySupportedForSourceDevice:](self, "_updateDepthDataDeliverySupportedForSourceDevice:", a3);
  -[AVCaptureMovieFileOutput _updateSpatialVideoCaptureSupportedForSourceDevice:](self, "_updateSpatialVideoCaptureSupportedForSourceDevice:", a3);
}

- (void)_updateAvailableVideoCodecTypesForSourceDevice:(id)a3
{
  void *v4;
  void *v5;
  AVCaptureMovieFileOutputInternal *internal;
  char v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", a3, 0, 0, *MEMORY[0x1E0CF2B08], 0);
  v5 = v4;
  internal = self->_internal;
  if (internal->videoCodec)
  {
    v7 = objc_msgSend(v4, "containsObject:");
    internal = self->_internal;
    if ((v7 & 1) == 0)
    {

      self->_internal->videoCodec = 0;
      internal = self->_internal;
    }
  }
  if ((objc_msgSend(v5, "isEqual:", internal->availableVideoCodecs) & 1) == 0)
  {
    -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableVideoCodecTypes"));

    self->_internal->availableVideoCodecs = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
    -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("availableVideoCodecTypes"));
  }
}

- (void)_updateBravoCameraSelectionBehaviorForSourceDevice:(id)a3
{
  _BOOL4 v5;
  AVCaptureMovieFileOutputInternal *internal;
  int64_t v7;
  unint64_t v8;

  if (objc_msgSend(a3, "isVirtualDevice"))
    v5 = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "constituentDevices"), "count") > 1;
  else
    v5 = 0;
  internal = self->_internal;
  if (internal->deviceSupportsConstituentDeviceSwitching != v5)
  {
    internal->deviceSupportsConstituentDeviceSwitching = v5;
    if (v5)
      v7 = 2;
    else
      v7 = 0;
    if (v5)
      v8 = 7;
    else
      v8 = 0;
    -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bravoCameraSelectionBehaviorForRecording"));
    -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled"));
    -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("primaryConstituentDeviceSwitchingBehaviorForRecording"));
    -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"));
    self->_internal->primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled = v5;
    self->_internal->primaryConstituentDeviceSwitchingBehavior = v7;
    self->_internal->primaryConstituentDeviceRestrictedSwitchingBehaviorConditions = v8;
    -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("primaryConstituentDeviceRestrictedSwitchingBehaviorConditions"));
    -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("primaryConstituentDeviceSwitchingBehaviorForRecording"));
    -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled"));
    -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bravoCameraSelectionBehaviorForRecording"));
  }
}

- (void)setConnectionsActive:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[AVCaptureOutput connections](self, "connections", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = *MEMORY[0x1E0CF2B70];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "mediaType");
        v13 = v3;
        if (v12 == v9)
          v13 = self->_internal->streamingDepthSupported && v3;
        objc_msgSend(v11, "_setActive:", v13);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
}

- (void)_updateDepthDataDeliverySupportedForSourceDevice:(id)a3
{
  uint64_t v4;
  AVCaptureMovieFileOutputInternal *internal;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStreamingDepthSupported");
  internal = self->_internal;
  if (internal->streamingDepthSupported != (_DWORD)v4)
  {
    v6 = v4;
    internal->streamingDepthSupported = v4;
    v7 = *MEMORY[0x1E0CF2B70];
    if (-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B70]))
      -[AVCaptureConnection _setActive:](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", v7), "_setActive:", v6);
  }
}

- (BOOL)isDepthCaptureEnabled
{
  AVCaptureMovieFileOutput *v2;
  AVCaptureMovieFileOutputInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->depthCaptureEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setDepthCaptureEnabled:(BOOL)a3
{
  AVCaptureMovieFileOutputInternal *internal;

  internal = self->_internal;
  objc_sync_enter(internal);
  self->_internal->depthCaptureEnabled = a3;
  objc_sync_exit(internal);
}

- (void)_updateSpatialVideoCaptureSupportedForSourceDevice:(id)a3
{
  int v4;
  AVCaptureConnection *v5;
  unint64_t v6;
  AVCaptureMovieFileOutputInternal *internal;
  _BOOL4 v9;
  AVCaptureMovieFileOutputInternal *v10;
  const __CFString *v11;
  const __CFString *v12;

  v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSpatialVideoCaptureSupported");
  v5 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]);
  if (v5)
  {
    v6 = -[AVCaptureConnection activeVideoStabilizationMode](v5, "activeVideoStabilizationMode");
    if (v6 > 5 || ((1 << v6) & 0x2C) == 0)
      v4 = 0;
  }
  internal = self->_internal;
  if (internal->spatialVideoCaptureSupported != v4)
  {
    objc_sync_enter(self->_internal);
    v9 = (v4 & 1) == 0 && self->_internal->spatialVideoCaptureEnabled;
    objc_sync_exit(internal);
    -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("spatialVideoCaptureSupported"));
    -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stereoVideoCaptureSupported"));
    if (v9)
    {
      -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("spatialVideoCaptureEnabled"));
      -[AVCaptureMovieFileOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stereoVideoCaptureEnabled"));
    }
    v10 = self->_internal;
    objc_sync_enter(v10);
    self->_internal->spatialVideoCaptureSupported = v4;
    if (v9)
    {
      self->_internal->spatialVideoCaptureEnabled = 0;
      objc_sync_exit(v10);
      -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("spatialVideoCaptureSupported"));
      -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stereoVideoCaptureSupported"));
      v11 = CFSTR("stereoVideoCaptureEnabled");
      v12 = CFSTR("spatialVideoCaptureEnabled");
    }
    else
    {
      objc_sync_exit(v10);
      v11 = CFSTR("stereoVideoCaptureSupported");
      v12 = CFSTR("spatialVideoCaptureSupported");
    }
    -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", v12);
    -[AVCaptureMovieFileOutput didChangeValueForKey:](self, "didChangeValueForKey:", v11);
  }
}

- (BOOL)isSpatialVideoCaptureSupported
{
  AVCaptureMovieFileOutput *v2;
  AVCaptureMovieFileOutputInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->spatialVideoCaptureSupported;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isSpatialVideoCaptureEnabled
{
  AVCaptureMovieFileOutput *v2;
  AVCaptureMovieFileOutputInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->spatialVideoCaptureEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setSpatialVideoCaptureEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  AVCaptureMovieFileOutputInternal *internal;
  AVCaptureMovieFileOutputInternal *v7;

  v3 = a3;
  if (-[AVCaptureMovieFileOutput isSpatialVideoCaptureSupported](self, "isSpatialVideoCaptureSupported") || !v3)
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    v7 = self->_internal;
    if (v7->spatialVideoCaptureEnabled != v3)
    {
      v7->spatialVideoCaptureEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
    objc_sync_exit(internal);
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (BOOL)isVirtualCaptureCardSupported
{
  AVCaptureMovieFileOutputInternal *internal;
  BOOL v3;

  internal = self->_internal;
  objc_sync_enter(internal);
  v3 = +[AVVirtualCaptureCard isVirtualCaptureCardSupported](AVVirtualCaptureCard, "isVirtualCaptureCardSupported");
  objc_sync_exit(internal);
  return v3;
}

- (BOOL)usesVirtualCaptureCard
{
  AVCaptureMovieFileOutput *v2;
  AVCaptureMovieFileOutputInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->usesVirtualCaptureCard;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setUsesVirtualCaptureCard:(BOOL)a3
{
  AVCaptureMovieFileOutputInternal *internal;
  void *v6;

  internal = self->_internal;
  objc_sync_enter(internal);
  if (-[AVCaptureMovieFileOutput isVirtualCaptureCardSupported](self, "isVirtualCaptureCardSupported"))
  {
    self->_internal->usesVirtualCaptureCard = a3;
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  objc_sync_exit(internal);
}

- (BOOL)isTrueVideoCaptureSupported
{
  return 1;
}

- (BOOL)isTrueVideoCaptureEnabled
{
  AVCaptureMovieFileOutput *v2;
  AVCaptureMovieFileOutputInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->trueVideoCaptureEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setTrueVideoCaptureEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  AVCaptureMovieFileOutputInternal *internal;
  AVCaptureMovieFileOutputInternal *v7;

  v3 = a3;
  if (-[AVCaptureMovieFileOutput isTrueVideoCaptureSupported](self, "isTrueVideoCaptureSupported") || !v3)
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    v7 = self->_internal;
    if (v7->trueVideoCaptureEnabled != v3)
    {
      v7->trueVideoCaptureEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
    objc_sync_exit(internal);
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

@end
