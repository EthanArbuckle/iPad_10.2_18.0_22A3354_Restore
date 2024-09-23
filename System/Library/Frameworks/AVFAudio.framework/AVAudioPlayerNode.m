@implementation AVAudioPlayerNode

- (AVAudioPlayerNode)init
{
  uint64_t v3;
  NSObject *v4;
  NSObject *HighPriorityWorkloop;
  NSObject *v6;
  NSObject *global_queue;
  objc_super v9;
  AudioComponentDescription v10;

  v3 = operator new();
  *(_OWORD *)&v10.componentType = xmmword_19B85A310;
  v10.componentFlagsMask = 0;
  AVAudioNodeImpl::AVAudioNodeImpl(v3, 0, &v10, 0);
  *(_QWORD *)v3 = &off_1E3BE8588;
  *(_QWORD *)(v3 + 216) = 0;
  *(_OWORD *)(v3 + 184) = 0u;
  *(_OWORD *)(v3 + 200) = 0u;
  *(_QWORD *)(v3 + 232) = v3 + 232;
  *(_QWORD *)(v3 + 240) = v3 + 232;
  *(_QWORD *)(v3 + 248) = 0;
  *(_QWORD *)(v3 + 256) = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = dispatch_queue_create("CommandQueue", 0);
  *(_QWORD *)(v3 + 224) = v4;
  HighPriorityWorkloop = AVAE_GetHighPriorityWorkloop();
  dispatch_set_target_queue(v4, HighPriorityWorkloop);
  *(_OWORD *)(v3 + 272) = 0u;
  *(_OWORD *)(v3 + 288) = 0u;
  v6 = dispatch_queue_create("AVAudioPlayerNodeImpl.CompletionHandlerQueue", 0);
  *(_QWORD *)(v3 + 272) = v6;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_set_target_queue(v6, global_queue);
  *(_QWORD *)(v3 + 264) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
  v9.receiver = self;
  v9.super_class = (Class)AVAudioPlayerNode;
  return -[AVAudioNode initWithImpl:](&v9, sel_initWithImpl_, v3);
}

- (void)callLegacyCompletionHandlerForType:(int64_t)a3 legacyHandler:(id)a4
{
  if (!a3)
  {
    if (a4)
      (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer completionHandler:(AVAudioNodeCompletionHandler)completionHandler
{
  -[AVAudioPlayerNode scheduleBuffer:atTime:options:completionHandler:](self, "scheduleBuffer:atTime:options:completionHandler:", buffer, 0, 0, completionHandler);
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler
{
  -[AVAudioPlayerNode scheduleBuffer:atTime:options:completionCallbackType:completionHandler:](self, "scheduleBuffer:atTime:options:completionCallbackType:completionHandler:", buffer, 0, 0, callbackType, completionHandler);
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(AVAudioPlayerNodeBufferOptions)options completionHandler:(AVAudioNodeCompletionHandler)completionHandler
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__AVAudioPlayerNode_scheduleBuffer_atTime_options_completionHandler___block_invoke;
  v6[3] = &unk_1E3BECA78;
  v6[4] = self;
  v6[5] = completionHandler;
  -[AVAudioPlayerNode scheduleBuffer:atTime:options:completionCallbackType:completionHandler:](self, "scheduleBuffer:atTime:options:completionCallbackType:completionHandler:", buffer, when, options, 0, v6);
}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(AVAudioPlayerNodeBufferOptions)options completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler
{
  NSObject *v13;
  void *impl;
  int v15;
  NSObject *v16;
  uint64_t v17;
  std::recursive_mutex *v18;
  char v19;
  std::recursive_mutex *v20;
  char v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (when
    && !-[AVAudioTime isSampleTimeValid](when, "isSampleTimeValid")
    && !-[AVAudioTime isHostTimeValid](when, "isHostTimeValid"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v23 = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioPlayerNode.mm";
      v28 = 1024;
      v29 = 1095;
      v30 = 2080;
      v31 = "-[AVAudioPlayerNode scheduleBuffer:atTime:options:completionCallbackType:completionHandler:]";
      v32 = 2080;
      v33 = "when == nil || when.sampleTimeValid || when.hostTimeValid";
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "when == nil || when.sampleTimeValid || when.hostTimeValid");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v18, (uint64_t)self->super._impl);
  impl = self->super._impl;
  v15 = objc_msgSend(*((id *)impl + 23), "channelCount");
  if (v15 != -[AVAudioFormat channelCount](-[AVAudioBuffer format](buffer, "format"), "channelCount"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v23 = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioPlayerNode.mm";
      v28 = 1024;
      v29 = 740;
      v30 = 2080;
      v31 = "ScheduleBuffer";
      v32 = 2080;
      v33 = "_outputFormat.channelCount == buffer.format.channelCount";
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_outputFormat.channelCount == buffer.format.channelCount");
  }
  v17 = operator new();
  AVAudioPlayerNodeImpl::BufferCommand::BufferCommand(v17, (uint64_t)impl, 0, when, options, callbackType, completionHandler, buffer);
  AVAudioPlayerNodeImpl::CommandQueue::AddCommand((unint64_t *)impl + 27, v17);
  if (v21)
    std::recursive_mutex::unlock(v20);
  if (v19)
    std::recursive_mutex::unlock(v18);
}

- (void)scheduleFile:(AVAudioFile *)file atTime:(AVAudioTime *)when completionHandler:(AVAudioNodeCompletionHandler)completionHandler
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AVAudioPlayerNode_scheduleFile_atTime_completionHandler___block_invoke;
  v5[3] = &unk_1E3BECA78;
  v5[4] = self;
  v5[5] = completionHandler;
  -[AVAudioPlayerNode scheduleFile:atTime:completionCallbackType:completionHandler:](self, "scheduleFile:atTime:completionCallbackType:completionHandler:", file, when, 0, v5);
}

- (void)scheduleFile:(AVAudioFile *)file atTime:(AVAudioTime *)when completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler
{
  NSObject *v11;
  NSObject *v12;
  _BYTE buf[12];
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!file)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v14 = 1024;
      *(_DWORD *)v15 = 71;
      *(_WORD *)&v15[4] = 2080;
      *(_QWORD *)&v15[6] = "AVAudioPlayerNode.mm";
      v16 = 1024;
      v17 = 1110;
      v18 = 2080;
      v19 = "-[AVAudioPlayerNode scheduleFile:atTime:completionCallbackType:completionHandler:]";
      v20 = 2080;
      v21 = "file != nil";
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "file != nil");
  }
  if (when
    && !-[AVAudioTime isSampleTimeValid](when, "isSampleTimeValid")
    && !-[AVAudioTime isHostTimeValid](when, "isHostTimeValid"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v14 = 1024;
      *(_DWORD *)v15 = 71;
      *(_WORD *)&v15[4] = 2080;
      *(_QWORD *)&v15[6] = "AVAudioPlayerNode.mm";
      v16 = 1024;
      v17 = 1111;
      v18 = 2080;
      v19 = "-[AVAudioPlayerNode scheduleFile:atTime:completionCallbackType:completionHandler:]";
      v20 = 2080;
      v21 = "when == nil || when.sampleTimeValid || when.hostTimeValid";
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "when == nil || when.sampleTimeValid || when.hostTimeValid");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)buf, (uint64_t)self->super._impl);
  AVAudioPlayerNodeImpl::ScheduleSegment((uint64_t)self->super._impl, file, 0, -1, when, callbackType, completionHandler);
  if (v15[10])
    std::recursive_mutex::unlock(*(std::recursive_mutex **)&v15[2]);
  if (buf[8])
    std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
}

- (void)scheduleSegment:(AVAudioFile *)file startingFrame:(AVAudioFramePosition)startFrame frameCount:(AVAudioFrameCount)numberFrames atTime:(AVAudioTime *)when completionHandler:(AVAudioNodeCompletionHandler)completionHandler
{
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__AVAudioPlayerNode_scheduleSegment_startingFrame_frameCount_atTime_completionHandler___block_invoke;
  v7[3] = &unk_1E3BECA78;
  v7[4] = self;
  v7[5] = completionHandler;
  -[AVAudioPlayerNode scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:](self, "scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:", file, startFrame, *(_QWORD *)&numberFrames, when, 0, v7);
}

- (void)scheduleSegment:(AVAudioFile *)file startingFrame:(AVAudioFramePosition)startFrame frameCount:(AVAudioFrameCount)numberFrames atTime:(AVAudioTime *)when completionCallbackType:(AVAudioPlayerNodeCompletionCallbackType)callbackType completionHandler:(AVAudioPlayerNodeCompletionHandler)completionHandler
{
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _BYTE buf[12];
  __int16 v20;
  _BYTE v21[14];
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!file)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v15 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v20 = 1024;
      *(_DWORD *)v21 = 71;
      *(_WORD *)&v21[4] = 2080;
      *(_QWORD *)&v21[6] = "AVAudioPlayerNode.mm";
      v22 = 1024;
      v23 = 1127;
      v24 = 2080;
      v25 = "-[AVAudioPlayerNode scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:]";
      v26 = 2080;
      v27 = "stream != nil";
      _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "stream != nil");
  }
  if (when
    && !-[AVAudioTime isSampleTimeValid](when, "isSampleTimeValid")
    && !-[AVAudioTime isHostTimeValid](when, "isHostTimeValid"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v20 = 1024;
      *(_DWORD *)v21 = 71;
      *(_WORD *)&v21[4] = 2080;
      *(_QWORD *)&v21[6] = "AVAudioPlayerNode.mm";
      v22 = 1024;
      v23 = 1128;
      v24 = 2080;
      v25 = "-[AVAudioPlayerNode scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:]";
      v26 = 2080;
      v27 = "when == nil || when.sampleTimeValid || when.hostTimeValid";
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "when == nil || when.sampleTimeValid || when.hostTimeValid");
  }
  if (startFrame < 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v20 = 1024;
      *(_DWORD *)v21 = 71;
      *(_WORD *)&v21[4] = 2080;
      *(_QWORD *)&v21[6] = "AVAudioPlayerNode.mm";
      v22 = 1024;
      v23 = 1129;
      v24 = 2080;
      v25 = "-[AVAudioPlayerNode scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:]";
      v26 = 2080;
      v27 = "startFrame >= 0";
      _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "startFrame >= 0");
  }
  if (!numberFrames)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v18 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v20 = 1024;
      *(_DWORD *)v21 = 71;
      *(_WORD *)&v21[4] = 2080;
      *(_QWORD *)&v21[6] = "AVAudioPlayerNode.mm";
      v22 = 1024;
      v23 = 1130;
      v24 = 2080;
      v25 = "-[AVAudioPlayerNode scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:]";
      v26 = 2080;
      v27 = "numberFrames > 0";
      _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "numberFrames > 0");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)buf, (uint64_t)self->super._impl);
  AVAudioPlayerNodeImpl::ScheduleSegment((uint64_t)self->super._impl, file, startFrame, numberFrames, when, callbackType, completionHandler);
  if (v21[10])
    std::recursive_mutex::unlock(*(std::recursive_mutex **)&v21[2]);
  if (buf[8])
    std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
}

- (void)play
{
  AVAudioNodeImplBase *impl;
  uint64_t v4;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  impl = (AVAudioNodeImplBase *)self->super._impl;
  (*(void (**)(AVAudioNodeImplBase *, _QWORD))(*(_QWORD *)impl + 440))(impl, 0);
  v4 = *((_QWORD *)impl + 1);
  if (v4)
    AVAudioEngineImpl::NodeRenderingStateChanged(*(AVAudioEngineImpl **)(v4 + 8), impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (void)playAtTime:(AVAudioTime *)when
{
  AVAudioNodeImplBase *impl;
  uint64_t v6;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super._impl);
  impl = (AVAudioNodeImplBase *)self->super._impl;
  (*(void (**)(AVAudioNodeImplBase *, AVAudioTime *))(*(_QWORD *)impl + 440))(impl, when);
  v6 = *((_QWORD *)impl + 1);
  if (v6)
    AVAudioEngineImpl::NodeRenderingStateChanged(*(AVAudioEngineImpl **)(v6 + 8), impl);
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
}

- (void)pause
{
  AVAudioNodeImplBase *impl;
  uint64_t v4;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  impl = (AVAudioNodeImplBase *)self->super._impl;
  (*(void (**)(AVAudioNodeImplBase *))(*(_QWORD *)impl + 448))(impl);
  v4 = *((_QWORD *)impl + 1);
  if (v4)
    AVAudioEngineImpl::NodeRenderingStateChanged(*(AVAudioEngineImpl **)(v4 + 8), impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (void)stop
{
  AVAudioNodeImplBase *impl;
  uint64_t v4;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  impl = (AVAudioNodeImplBase *)self->super._impl;
  (*(void (**)(AVAudioNodeImplBase *))(*(_QWORD *)impl + 456))(impl);
  v4 = *((_QWORD *)impl + 1);
  if (v4)
    AVAudioEngineImpl::NodeRenderingStateChanged(*(AVAudioEngineImpl **)(v4 + 8), impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (AVAudioTime)nodeTimeForPlayerTime:(AVAudioTime *)playerTime
{
  AVAudioTime *v3;
  NSObject *v5;
  void *impl;
  uint8_t v7;
  double v8;
  double v9;
  AVAudioTime *v10;
  int v11;
  double v12;
  void *v13;
  double v14;
  std::recursive_mutex *v16;
  char v17;
  std::recursive_mutex *v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  double v24;
  AVAudioTime *v25;
  double v26;
  int v27;
  uint8_t buf[72];
  uint64_t v29;

  v3 = playerTime;
  v29 = *MEMORY[0x1E0C80C00];
  if (playerTime
    && !-[AVAudioTime isSampleTimeValid](playerTime, "isSampleTimeValid")
    && !-[AVAudioTime isHostTimeValid](v3, "isHostTimeValid"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "AVAudioPlayerNode.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 1173;
      *(_WORD *)&buf[34] = 2080;
      *(_QWORD *)&buf[36] = "-[AVAudioPlayerNode nodeTimeForPlayerTime:]";
      *(_WORD *)&buf[44] = 2080;
      *(_QWORD *)&buf[46] = "playerTime == nil || playerTime.sampleTimeValid || playerTime.hostTimeValid";
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "playerTime == nil || playerTime.sampleTimeValid || playerTime.hostTimeValid");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v16, (uint64_t)self->super._impl);
  impl = self->super._impl;
  if (*((_DWORD *)impl + 48) == 1)
  {
    memset(buf, 0, 64);
    if (v3)
    {
      -[AVAudioTime audioTimeStamp](v3, "audioTimeStamp");
      v7 = buf[56];
      v8 = *(double *)&buf[16];
      v3 = *(AVAudioTime **)&buf[8];
      v9 = *(double *)buf;
    }
    else
    {
      v7 = 0;
      v9 = 0.0;
      v8 = 0.0;
    }
    v11 = v7 & 7;
    v27 = v11;
    v26 = v8;
    v25 = v3;
    v12 = v9 + *((double *)impl + 25);
    v24 = v12;
    if ((v7 & 3) != 3)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v13 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)impl + 352))(impl);
      if (v13)
      {
        objc_msgSend(v13, "currentAudioTimeStamp");
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
      }
      objc_msgSend(*((id *)impl + 23), "sampleRate");
      if (v11 != 7 && (v7 & 3) != 0 && (BYTE8(v23) & 3) == 3)
      {
        if ((v7 & 4) == 0)
        {
          v8 = 1.0;
          if ((BYTE8(v23) & 4) != 0)
          {
            v11 = v7 & 3 | 4;
            v8 = *(double *)&v21;
            v26 = *(double *)&v21;
          }
        }
        if ((v11 & 2) == 0)
        {
          v3 = (AVAudioTime *)((double)*((uint64_t *)&v20 + 1) + (v12 - *(double *)&v20) * (v8 * 24000000.0 / v14));
          v25 = v3;
        }
        if ((v11 & 1) == 0)
          v24 = *(double *)&v20 + round(v14 / (v8 * 24000000.0) * (double)((uint64_t)v3 - *((_QWORD *)&v20 + 1)));
        v27 = v11 | 3;
      }
    }
    objc_msgSend(*((id *)impl + 23), "sampleRate");
    v10 = +[AVAudioTime timeWithAudioTimeStamp:sampleRate:](AVAudioTime, "timeWithAudioTimeStamp:sampleRate:", &v24);
  }
  else
  {
    v10 = 0;
  }
  if (v19)
    std::recursive_mutex::unlock(v18);
  if (v17)
    std::recursive_mutex::unlock(v16);
  return v10;
}

- (AVAudioTime)playerTimeForNodeTime:(AVAudioTime *)nodeTime
{
  NSObject *v5;
  AVAudioTime *v6;
  _BYTE buf[12];
  __int16 v9;
  _BYTE v10[14];
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (nodeTime
    && !-[AVAudioTime isSampleTimeValid](nodeTime, "isSampleTimeValid")
    && !-[AVAudioTime isHostTimeValid](nodeTime, "isHostTimeValid"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v9 = 1024;
      *(_DWORD *)v10 = 71;
      *(_WORD *)&v10[4] = 2080;
      *(_QWORD *)&v10[6] = "AVAudioPlayerNode.mm";
      v11 = 1024;
      v12 = 1181;
      v13 = 2080;
      v14 = "-[AVAudioPlayerNode playerTimeForNodeTime:]";
      v15 = 2080;
      v16 = "nodeTime == nil || nodeTime.sampleTimeValid || nodeTime.hostTimeValid";
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "nodeTime == nil || nodeTime.sampleTimeValid || nodeTime.hostTimeValid");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)buf, (uint64_t)self->super._impl);
  v6 = AVAudioPlayerNodeImpl::PlayerTimeForNodeTime((AVAudioPlayerNodeImpl *)self->super._impl, nodeTime);
  if (v10[10])
    std::recursive_mutex::unlock(*(std::recursive_mutex **)&v10[2]);
  if (buf[8])
    std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
  return v6;
}

- (BOOL)isPlaying
{
  char v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)self->super._impl + 432))(self->super._impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)didAttachToEngine:(id)a3
{
  uint64_t v5;
  std::recursive_mutex *v6;
  std::recursive_mutex *v7;
  id *impl;
  void *v9;
  id v10;
  objc_super v11;

  v5 = objc_msgSend(a3, "implementation");
  v6 = (std::recursive_mutex *)((char *)self->super._impl + 104);
  v7 = (std::recursive_mutex *)(v5 + 112);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v6, (std::recursive_mutex *)(v5 + 112));
  v11.receiver = self;
  v11.super_class = (Class)AVAudioPlayerNode;
  -[AVAudioNode didAttachToEngine:](&v11, sel_didAttachToEngine_, a3);
  impl = (id *)self->super._impl;

  impl[23] = 0;
  v9 = (void *)(*((uint64_t (**)(id *, _QWORD))*impl + 6))(impl, 0);
  impl[23] = v9;
  v10 = v9;
  std::recursive_mutex::unlock(v6);
  std::recursive_mutex::unlock(v7);
}

uint64_t __87__AVAudioPlayerNode_scheduleSegment_startingFrame_frameCount_atTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callLegacyCompletionHandlerForType:legacyHandler:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __59__AVAudioPlayerNode_scheduleFile_atTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callLegacyCompletionHandlerForType:legacyHandler:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __69__AVAudioPlayerNode_scheduleBuffer_atTime_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callLegacyCompletionHandlerForType:legacyHandler:", a2, *(_QWORD *)(a1 + 40));
}

@end
