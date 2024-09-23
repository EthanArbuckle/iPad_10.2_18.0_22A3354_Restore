@implementation BWAudioFileSinkNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWAudioFileSinkNode)initWithSinkID:(id)a3
{
  BWAudioFileSinkNode *v3;
  BWNodeInput *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWAudioFileSinkNode;
  v3 = -[BWSinkNode initWithSinkID:](&v6, sel_initWithSinkID_, a3);
  if (v3)
  {
    v4 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1936684398, v3, 0);
    -[BWNode addInput:](v3, "addInput:", v4);

    v3->_propertySyncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.celestial.capture.audiofilesink.PropertySyncQueue", 0);
    -[BWAudioFileSinkNode _setupStateMachine]((uint64_t)v3);
  }
  return v3;
}

- (uint64_t)_setupStateMachine
{
  uint64_t v1;
  FigStateMachine *v2;
  void *v3;
  _QWORD v4[5];

  if (result)
  {
    v1 = result;
    v2 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWAudioFileSinkNodeState"), 3, 1, result);
    *(_QWORD *)(v1 + 176) = v2;
    -[FigStateMachine setLabel:forState:](v2, "setLabel:forState:", CFSTR("Idle"), 1);
    objc_msgSend(*(id *)(v1 + 176), "setLabel:forState:", CFSTR("Recording"), 2);
    objc_msgSend(*(id *)(v1 + 176), "setLabel:forState:", CFSTR("Paused"), 4);
    objc_msgSend(*(id *)(v1 + 176), "whenTransitioningFromState:toState:callHandler:", 1, 2, &__block_literal_global_98);
    objc_msgSend(*(id *)(v1 + 176), "whenTransitioningFromState:toState:callHandler:", 2, 4, &__block_literal_global_25_0);
    objc_msgSend(*(id *)(v1 + 176), "whenTransitioningFromState:toState:callHandler:", 4, 2, &__block_literal_global_26_0);
    v3 = *(void **)(v1 + 176);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__BWAudioFileSinkNode__setupStateMachine__block_invoke_4;
    v4[3] = &unk_1E4925B18;
    v4[4] = v1;
    return objc_msgSend(v3, "whenTransitioningToState:callHandler:", 1, v4);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BWAudioFileSinkNode _stopRecordingWithError:]((uint64_t)self, 0);

  free(self->_parentPath);
  v3.receiver = self;
  v3.super_class = (Class)BWAudioFileSinkNode;
  -[BWSinkNode dealloc](&v3, sel_dealloc);
}

- (uint64_t)_stopRecordingWithError:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[BWAudioFileSinkNode _teardownFileWriter](result);
    result = objc_msgSend(*(id *)(v3 + 176), "currentState");
    if ((_DWORD)result != 1)
      return objc_msgSend(*(id *)(v3 + 176), "transitionToState:errorStatus:", 1, a2);
  }
  return result;
}

- (id)nodeSubType
{
  return CFSTR("AudioFile");
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWAudioFileSinkNode;
  -[BWSinkNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v5, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWAudioFileSinkNode _stopRecordingWithError:]((uint64_t)self, 0);
  v5.receiver = self;
  v5.super_class = (Class)BWAudioFileSinkNode;
  -[BWSinkNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  OpaqueFigFormatWriter *formatWriter;
  uint64_t (*v7)(OpaqueFigFormatWriter *, CMTime *);
  uint64_t v8;
  uint64_t v9;
  OpaqueFigFormatWriter *v10;
  uint64_t trackID;
  uint64_t (*v12)(OpaqueFigFormatWriter *, uint64_t, opaqueCMSampleBuffer *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CMTime v16;
  CMTime v17;

  if (a3)
  {
    if (!CMSampleBufferGetDataBuffer(a3))
    {
      v14 = -[BWAudioFileSinkNode _handleMarkerBuffer:]((unint64_t)self, a3);
      if (!(_DWORD)v14)
        return;
      v15 = v14;
      fig_log_get_emitter();
      goto LABEL_17;
    }
    formatWriter = self->_formatWriter;
    if (!formatWriter)
      return;
    if (!self->_didBeginFileWriterSession)
    {
      CMSampleBufferGetPresentationTimeStamp(&v16, a3);
      v7 = *(uint64_t (**)(OpaqueFigFormatWriter *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
      if (!v7)
      {
        v15 = 4294954514;
        goto LABEL_16;
      }
      v17 = v16;
      v8 = v7(formatWriter, &v17);
      if ((_DWORD)v8)
      {
        v15 = v8;
        goto LABEL_16;
      }
      self->_didBeginFileWriterSession = 1;
    }
    v9 = -[BWAudioFileSinkNode _applyRecordingLimits]((uint64_t)self);
    if ((_DWORD)v9)
    {
      v15 = v9;
      fig_log_get_emitter();
      goto LABEL_17;
    }
    v10 = self->_formatWriter;
    trackID = self->_trackID;
    v12 = *(uint64_t (**)(OpaqueFigFormatWriter *, uint64_t, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                             + 32);
    if (v12)
    {
      v13 = v12(v10, trackID, a3);
      if (!(_DWORD)v13)
      {
        -[BWAudioFileSinkNode _updateFilePropertiesForSbuf:]((uint64_t)self, (uint64_t)a3);
        return;
      }
      v15 = v13;
    }
    else
    {
      v15 = 4294954514;
    }
LABEL_16:
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
    -[BWAudioFileSinkNode _stopRecordingWithError:]((uint64_t)self, v15);
  }
}

- (uint64_t)_handleMarkerBuffer:(unint64_t)a1
{
  CFTypeRef v4;
  const void *v5;
  CFTypeRef v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  if (!a1)
    return 0;
  v4 = CMGetAttachment(target, CFSTR("FileWriterAction"), 0);
  v5 = v4;
  if (!v4)
    return (uint64_t)v5;
  if (!CFEqual(v4, CFSTR("Start")))
  {
    if (CFEqual(v5, CFSTR("Pause")))
    {
      v9 = *(void **)(a1 + 176);
      v10 = 4;
      v11 = 2;
    }
    else
    {
      if (!CFEqual(v5, CFSTR("Resume")))
      {
        if (CFEqual(v5, CFSTR("Stop")))
          -[BWAudioFileSinkNode _stopRecordingWithError:](a1, 0);
        return 0;
      }
      v9 = *(void **)(a1 + 176);
      v10 = 2;
      v11 = 4;
    }
    objc_msgSend(v9, "transitionToState:fromState:", v10, v11);
    return 0;
  }
  -[BWAudioFileSinkNode _stopRecordingWithError:](a1, 0);
  v6 = CMGetAttachment(target, CFSTR("RecordingSettings"), 0);
  if (v6 && (v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v7;

    *(_QWORD *)(a1 + 216) = v7;
    v5 = (const void *)-[BWAudioFileSinkNode _setupFileWriter](a1);
    if ((_DWORD)v5)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 176), "transitionToState:", 2);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  return (uint64_t)v5;
}

- (uint64_t)_applyRecordingLimits
{
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  CMTime v5;
  CMTime time2;
  CMTime time1;
  char v8;

  if (result)
  {
    v1 = result;
    if (BWGetFreeDiskSpaceAtPath(*(const char **)(result + 208)) < *(_QWORD *)(result + 256))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294950885;
    }
    else if (objc_msgSend(*(id *)(v1 + 216), "maxFileSize") >= 1
           && (v2 = *(_QWORD *)(v1 + 248), v2 > objc_msgSend(*(id *)(v1 + 216), "maxFileSize")))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294950884;
    }
    else
    {
      result = *(_QWORD *)(v1 + 216);
      if (result)
      {
        objc_msgSend((id)result, "maxDuration");
        if ((v8 & 1) == 0)
          return 0;
        v3 = *(void **)(v1 + 216);
        if (v3)
          objc_msgSend(v3, "maxDuration");
        else
          memset(&time1, 0, sizeof(time1));
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (CMTimeCompare(&time1, &time2))
          return 0;
        v4 = *(void **)(v1 + 216);
        if (v4)
          objc_msgSend(v4, "maxDuration");
        else
          memset(&v5, 0, sizeof(v5));
        time2 = *(CMTime *)(v1 + 224);
        if (CMTimeCompare(&time2, &v5) >= 1)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          return 4294950883;
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (void)_updateFilePropertiesForSbuf:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 264);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __52__BWAudioFileSinkNode__updateFilePropertiesForSbuf___block_invoke;
    v3[3] = &unk_1E491F158;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_sync(v2, v3);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFileDuration
{
  NSObject *propertySyncQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1A33536F2;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  propertySyncQueue = self->_propertySyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BWAudioFileSinkNode_lastFileDuration__block_invoke;
  block[3] = &unk_1E491E9A8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(propertySyncQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __39__BWAudioFileSinkNode_lastFileDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 224);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (unint64_t)lastFileSize
{
  NSObject *propertySyncQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertySyncQueue = self->_propertySyncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__BWAudioFileSinkNode_lastFileSize__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertySyncQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__BWAudioFileSinkNode_lastFileSize__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 248);
  return result;
}

void *__41__BWAudioFileSinkNode__setupStateMachine__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *result;

  result = (void *)objc_msgSend(a2, "recordingStatusDelegate");
  if (result)
    return (void *)objc_msgSend(result, "fileWriter:startedRecordingForSettings:writerPipelineIndex:", a2, a2[27], 0);
  return result;
}

void *__41__BWAudioFileSinkNode__setupStateMachine__block_invoke_2(uint64_t a1, id *a2)
{
  void *result;

  result = (void *)objc_msgSend(a2, "recordingStatusDelegate");
  if (result)
    return (void *)objc_msgSend(result, "fileWriter:pausedRecordingForSettingsID:", a2, objc_msgSend(a2[27], "settingsID"));
  return result;
}

void *__41__BWAudioFileSinkNode__setupStateMachine__block_invoke_3(uint64_t a1, id *a2)
{
  void *result;

  result = (void *)objc_msgSend(a2, "recordingStatusDelegate");
  if (result)
    return (void *)objc_msgSend(result, "fileWriter:resumedRecordingForSettingsID:", a2, objc_msgSend(a2[27], "settingsID"));
  return result;
}

void *__41__BWAudioFileSinkNode__setupStateMachine__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *result;
  uint64_t v9;

  result = (void *)objc_msgSend(a2, "recordingStatusDelegate");
  if (result)
  {
    LOBYTE(v9) = (_DWORD)a5 == 0;
    return (void *)objc_msgSend(result, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a2, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), a5, 0, 0, 0, v9);
  }
  return result;
}

- (uint64_t)_setupFileWriter
{
  void *v2;
  _BYTE *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _QWORD, unint64_t);
  uint64_t v11;
  _QWORD block[5];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 216), "outputURL");
  if (FigFileDoesFileExist())
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294950886;
  }
  v3 = *(_BYTE **)(a1 + 208);
  if (v3)
    *v3 = 0;
  else
    *(_QWORD *)(a1 + 208) = malloc_type_malloc(0x400uLL, 0x900FFADuLL);
  v4 = *(NSObject **)(a1 + 264);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BWAudioFileSinkNode__setupFileWriter__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = a1;
  dispatch_sync(v4, block);
  objc_msgSend((id)objc_msgSend(v2, "URLByDeletingLastPathComponent"), "getFileSystemRepresentation:maxLength:", *(_QWORD *)(a1 + 208), 1024);
  -[BWAudioFileSinkNode _setupMinFreeDiskSpace](a1);
  v5 = -[BWAudioFileSinkNode _applyRecordingLimits](a1);
  if ((_DWORD)v5)
    goto LABEL_29;
  v5 = CMByteStreamCreateForFileURL();
  if ((_DWORD)v5)
    goto LABEL_29;
  v6 = (void *)objc_msgSend(*(id *)(a1 + 216), "outputFileType");
  if ((objc_msgSend(v6, "isEqual:", CFSTR("com.apple.coreaudio-format")) & 1) != 0)
  {
    v7 = (uint64_t *)MEMORY[0x1E0CC43C8];
  }
  else if ((objc_msgSend(v6, "isEqual:", CFSTR("public.aiff-audio")) & 1) != 0
         || (objc_msgSend(v6, "isEqual:", CFSTR("public.aifc-audio")) & 1) != 0)
  {
    v7 = (uint64_t *)MEMORY[0x1E0CC43B0];
  }
  else if ((objc_msgSend(v6, "isEqual:", CFSTR("com.microsoft.waveform-audio")) & 1) != 0)
  {
    v7 = (uint64_t *)MEMORY[0x1E0CC43F0];
  }
  else
  {
    if (!objc_msgSend(v6, "isEqual:", CFSTR("org.3gpp.adaptive-multi-rate-audio")))
      goto LABEL_27;
    v7 = (uint64_t *)MEMORY[0x1E0CC43B8];
  }
  v8 = *v7;
  if (!v8)
  {
LABEL_27:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  v14 = *MEMORY[0x1E0CC4398];
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v5 = FigAudioFileFormatWriterCreateWithByteStream();
  if ((_DWORD)v5 || (CMNotificationCenterGetDefaultLocalCenter(), v5 = CMNotificationCenterAddListener(), (_DWORD)v5))
  {
LABEL_29:
    v11 = v5;
    fig_log_get_emitter();
    goto LABEL_21;
  }
  v9 = *(_QWORD *)(a1 + 184);
  v10 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, unint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 8);
  if (!v10)
  {
    v11 = 4294954514;
LABEL_20:
    fig_log_get_emitter();
LABEL_21:
    FigDebugAssert3();
    return v11;
  }
  v11 = v10(v9, 1936684398, 0, a1 + 200);
  if ((_DWORD)v11)
    goto LABEL_20;
  return v11;
}

size_t __52__BWAudioFileSinkNode__updateFilePropertiesForSbuf___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t result;
  CMTime v7;
  CMTime lhs;
  CMTime v9;
  CMTime v10;

  memset(&v10, 0, sizeof(v10));
  CMSampleBufferGetDuration(&v10, *(CMSampleBufferRef *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32) + 224;
  v3 = *(_OWORD *)v2;
  lhs.epoch = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  *(_OWORD *)&lhs.value = v3;
  v7 = v10;
  CMTimeAdd(&v9, &lhs, &v7);
  v4 = *(_OWORD *)&v9.value;
  *(_QWORD *)(v2 + 16) = v9.epoch;
  *(_OWORD *)v2 = v4;
  DataBuffer = CMSampleBufferGetDataBuffer(*(CMSampleBufferRef *)(a1 + 40));
  result = CMBlockBufferGetDataLength(DataBuffer);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) += result;
  return result;
}

- (unint64_t)_setupMinFreeDiskSpace
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (_setupMinFreeDiskSpace_onceToken != -1)
      dispatch_once(&_setupMinFreeDiskSpace_onceToken, &__block_literal_global_32);
    *(_QWORD *)(v1 + 256) = _setupMinFreeDiskSpace_sSystemMinFreeDiskSpace;
    result = objc_msgSend(*(id *)(v1 + 216), "minFreeDiskSpaceLimit");
    if (result > _setupMinFreeDiskSpace_sSystemMinFreeDiskSpace)
    {
      result = objc_msgSend(*(id *)(v1 + 216), "minFreeDiskSpaceLimit");
      *(_QWORD *)(v1 + 256) = result;
    }
  }
  return result;
}

void __45__BWAudioFileSinkNode__setupMinFreeDiskSpace__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    _setupMinFreeDiskSpace_sSystemMinFreeDiskSpace = objc_msgSend((id)objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x1E0DE2CA8]), "longLongValue");

  }
}

__n128 __39__BWAudioFileSinkNode__setupFileWriter__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  v1 = *(_QWORD *)(a1 + 32) + 224;
  v2 = MEMORY[0x1E0CA2E68];
  result = *(__n128 *)MEMORY[0x1E0CA2E68];
  *(_OWORD *)v1 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  return result;
}

- (uint64_t)_teardownFileWriter
{
  uint64_t v2;
  unsigned int (*v3)(uint64_t, __int128 *);
  uint64_t FigBaseObject;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  const void *v7;
  const void *v8;
  __int128 v10;
  uint64_t v11;

  if (!a1)
    return 0;
  v2 = *(_QWORD *)(a1 + 184);
  if (v2)
  {
    if (*(_BYTE *)(a1 + 204))
    {
      v3 = *(unsigned int (**)(uint64_t, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
      if (!v3 || (v10 = *MEMORY[0x1E0CA2E18], v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16), v3(v2, &v10)))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      *(_BYTE *)(a1 + 204) = 0;
    }
    CMNotificationCenterGetDefaultLocalCenter();
    if (CMNotificationCenterRemoveListener())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    FigBaseObject = FigFormatWriterGetFigBaseObject();
    if (FigBaseObject)
    {
      v5 = FigBaseObject;
      v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v6)
      {
        v2 = v6(v5);
        if (!(_DWORD)v2)
        {
LABEL_17:
          v7 = *(const void **)(a1 + 184);
          if (v7)
          {
            CFRelease(v7);
            *(_QWORD *)(a1 + 184) = 0;
          }
          v8 = *(const void **)(a1 + 192);
          if (v8)
          {
            CFRelease(v8);
            *(_QWORD *)(a1 + 192) = 0;
          }
          return v2;
        }
      }
      else
      {
        v2 = 4294954514;
      }
    }
    else
    {
      v2 = 4294954516;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_17;
  }
  return v2;
}

@end
