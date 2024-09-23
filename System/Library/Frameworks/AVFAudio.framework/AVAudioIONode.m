@implementation AVAudioIONode

- (AVAudioIONode)initWithIOUnit:(void *)a3 isInput:(BOOL)a4
{
  uint64_t v7;
  AVAudioEngineManualRenderingMode v8;

  if (a3)
  {
    v7 = operator new();
    AVAudioNodeImplBase::AVAudioNodeImplBase((AVAudioNodeImplBase *)v7);
    *(_QWORD *)v7 = &off_1E3BE74B8;
    *(_QWORD *)(v7 + 168) = a3;
    *(_BYTE *)(v7 + 176) = a4;
  }
  else
  {
    v7 = operator new();
    AVAudioGenericIONodeImpl::AVAudioGenericIONodeImpl((AVAudioGenericIONodeImpl *)v7, 1, v8);
  }
  return -[AVAudioNode initWithImpl:](self, "initWithImpl:", v7);
}

- (NSTimeInterval)presentationLatency
{
  double v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = (*(double (**)(void *))(*(_QWORD *)self->super._impl + 216))(self->super._impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (AudioUnit)audioUnit
{
  OpaqueAudioComponentInstance *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(void *))(*(_QWORD *)self->super._impl + 224))(self->super._impl);
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

  v5 = objc_msgSend(a3, "implementation");
  v6 = (std::recursive_mutex *)((char *)self->super._impl + 104);
  v7 = (std::recursive_mutex *)(v5 + 112);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v6, (std::recursive_mutex *)(v5 + 112));
  (*(void (**)(void *, id))(*(_QWORD *)self->super._impl + 16))(self->super._impl, a3);
  std::recursive_mutex::unlock(v6);
  std::recursive_mutex::unlock(v7);
}

- (void)didDetachFromEngine:(id)a3 error:(id *)a4
{
  uint64_t v6;
  std::recursive_mutex *v7;
  std::recursive_mutex *v8;

  v6 = objc_msgSend(a3, "implementation");
  v7 = (std::recursive_mutex *)((char *)self->super._impl + 104);
  v8 = (std::recursive_mutex *)(v6 + 112);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v7, (std::recursive_mutex *)(v6 + 112));
  (*(void (**)(void *, id))(*(_QWORD *)self->super._impl + 24))(self->super._impl, a3);
  std::recursive_mutex::unlock(v7);
  std::recursive_mutex::unlock(v8);
}

- (BOOL)isInManualRenderingMode
{
  int v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = *((unsigned __int8 *)self->super._impl + 72);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3 != 0;
}

- (int64_t)manualRenderingMode
{
  int64_t v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = *((_QWORD *)self->super._impl + 10);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (BOOL)setVoiceProcessingEnabled:(BOOL)enabled error:(NSError *)outError
{
  int v5;
  void *v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  AVAudioNode *v11;
  AVAudioConnectionPoint *InputConnectionPointForNode;
  id v13;
  AVAudioNode *v14;
  NSArray *OutputConnectionPointsForNode;
  id v16;
  uint64_t v17;
  AVAudioSession *AudioSession;
  AVAudioSession *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  AVAudioFormat *v41;
  AVAudioFormat *v42;
  NSObject *v43;
  NSError *v44;
  std::recursive_mutex *v46;
  char v47;
  std::recursive_mutex *v48;
  char v49;
  _BYTE buf[44];
  __int16 v51;
  const char *v52;
  uint64_t v53;

  v5 = enabled;
  v53 = *MEMORY[0x1E0C80C00];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v46, (uint64_t)self->super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled") == v5)
  {
    v10 = 1;
    goto LABEL_74;
  }
  v7 = -[AVAudioEngine implementation](-[AVAudioNode engine](self, "engine"), "implementation");
  if (objc_msgSend((id)AVAudioEngineImpl::GetOutputNode((AVAudioEngineImpl *)v7), "isVoiceProcessingEnabled") != v5)
  {
    v8 = *((_QWORD *)v7 + 1);
    if (v5)
      v9 = -10863;
    else
      v9 = 0;
    if (*(_BYTE *)(v8 + 187))
    {
      if (!outError)
        goto LABEL_73;
LABEL_69:
      if (!v9)
      {
        v44 = 0;
        goto LABEL_72;
      }
LABEL_70:
      v44 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), v9, 0);
LABEL_72:
      *outError = v44;
      goto LABEL_73;
    }
    if (*(_BYTE *)(v8 + 185))
    {
      v9 = -10849;
      if (!outError)
        goto LABEL_73;
      goto LABEL_70;
    }
    v11 = (AVAudioNode *)*((_QWORD *)v7 + 5);
    if (v11)
    {
      InputConnectionPointForNode = AVAudioEngineImpl::GetInputConnectionPointForNode((AVAudioEngineImpl *)v7, v11, 0);
      v13 = *((id *)v7 + 5);
      AVAudioEngineGraph::RemoveIONode(*((AVAudioEngineGraph **)v7 + 1), *((AVAudioNode **)v7 + 5), 0, 0);
      AVAudioEngineImpl::DetachNode((id *)v7, *((AVAudioNode **)v7 + 5), 1, 0);
    }
    else
    {
      InputConnectionPointForNode = 0;
    }
    v14 = (AVAudioNode *)*((_QWORD *)v7 + 4);
    if (v14)
    {
      OutputConnectionPointsForNode = (NSArray *)AVAudioEngineImpl::GetOutputConnectionPointsForNode((AVAudioEngineImpl *)v7, v14, 0);
      v16 = *((id *)v7 + 4);
      AVAudioEngineGraph::RemoveIONode(*((AVAudioEngineGraph **)v7 + 1), *((AVAudioNode **)v7 + 4), 1, 0);
      AVAudioEngineImpl::DetachNode((id *)v7, *((AVAudioNode **)v7 + 4), 1, 0);
    }
    else
    {
      OutputConnectionPointsForNode = 0;
    }
    v17 = *((_QWORD *)v7 + 7);
    *((_QWORD *)v7 + 7) = 0;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    AudioSession = (AVAudioSession *)AVAudioEngineImpl::GetAudioSession((AVAudioEngineImpl *)v7);
    AVAudioIOUnit::Create((AVAudioIOUnit *)buf, (AVAudioEngineImpl *)v7, v5, AudioSession, v19);
    v20 = *(_QWORD *)buf;
    v21 = *((_QWORD *)v7 + 7);
    *((_QWORD *)v7 + 7) = *(_QWORD *)buf;
    if (v21)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
      v20 = *((_QWORD *)v7 + 7);
    }
    v22 = (void *)*((_QWORD *)v7 + 5);
    if (v22)
    {
      if ((objc_msgSend(v22, "enableRealtimeRenderingModeWithIOUnit:isInput:forceIOUnitReset:", v20, 0, 1) & 1) == 0)
      {
        if (AVAudioEngineLogCategory(void)::once != -1)
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
        v23 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = "AVAEInternal.h";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 71;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "AVAudioEngine.mm";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 901;
          *(_WORD *)&buf[34] = 2080;
          *(_QWORD *)&buf[36] = "UpdateIONodesForVP";
          v51 = 2080;
          v52 = "[_outputNode enableRealtimeRenderingModeWithIOUnit:ioUnit isInput:false forceIOUnitReset:true]";
          _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "[_outputNode enableRealtimeRenderingModeWithIOUnit:ioUnit isInput:false forceIOUnitReset:true]");
      }
    }
    else
    {
      *((_QWORD *)v7 + 5) = -[AVAudioIONode initWithIOUnit:isInput:]([AVAudioOutputNode alloc], "initWithIOUnit:isInput:", v20, 0);
    }
    v24 = *(NSObject **)(v20 + 8);
    v25 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___ZN13AVAudioIOUnit9EnableBusEj_block_invoke;
    *(_QWORD *)&buf[24] = &__block_descriptor_44_e5_v8__0l;
    *(_QWORD *)&buf[32] = v20;
    *(_DWORD *)&buf[40] = 0;
    dispatch_sync(v24, buf);
    AVAudioEngineImpl::AttachNode((AVAudioEngineImpl *)v7, *((AVAudioNode **)v7 + 5), 1);

    AVAudioEngineGraph::AddIONode(*((uint64_t ***)v7 + 1), *((AVAudioNode **)v7 + 5), 0);
    if (!AVAudioEngineImpl::AreRenderingModesIdentical((AVAudioEngineImpl *)v7, *((AVAudioIONode **)v7 + 5)))
    {
      v26 = v25;
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v27 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "AVAEInternal.h";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 71;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "AVAudioEngine.mm";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 913;
        *(_WORD *)&buf[34] = 2080;
        *(_QWORD *)&buf[36] = "UpdateIONodesForVP";
        v51 = 2080;
        v52 = "AreRenderingModesIdentical(_outputNode)";
        _os_log_impl(&dword_19B733000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "AreRenderingModesIdentical(_outputNode)");
      v25 = v26;
    }
    v28 = (void *)*((_QWORD *)v7 + 4);
    if (v28)
    {
      if ((objc_msgSend(v28, "enableRealtimeRenderingModeWithIOUnit:isInput:forceIOUnitReset:", v20, 1, 1) & 1) == 0)
      {
        v29 = v25;
        if (AVAudioEngineLogCategory(void)::once != -1)
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
        v30 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = "AVAEInternal.h";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 71;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "AVAudioEngine.mm";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 919;
          *(_WORD *)&buf[34] = 2080;
          *(_QWORD *)&buf[36] = "UpdateIONodesForVP";
          v51 = 2080;
          v52 = "[_inputNode enableRealtimeRenderingModeWithIOUnit:ioUnit isInput:true forceIOUnitReset:true]";
          _os_log_impl(&dword_19B733000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "[_inputNode enableRealtimeRenderingModeWithIOUnit:ioUnit isInput:true forceIOUnitReset:true]");
        v25 = v29;
      }
    }
    else
    {
      *((_QWORD *)v7 + 4) = -[AVAudioIONode initWithIOUnit:isInput:]([AVAudioInputNode alloc], "initWithIOUnit:isInput:", v20, 1);
    }
    v31 = *(NSObject **)(v20 + 8);
    *(_QWORD *)buf = v25;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___ZN13AVAudioIOUnit9EnableBusEj_block_invoke;
    *(_QWORD *)&buf[24] = &__block_descriptor_44_e5_v8__0l;
    *(_QWORD *)&buf[32] = v20;
    *(_DWORD *)&buf[40] = 1;
    dispatch_sync(v31, buf);
    AVAudioEngineImpl::AttachNode((AVAudioEngineImpl *)v7, *((AVAudioNode **)v7 + 4), 1);

    AVAudioEngineGraph::AddIONode(*((uint64_t ***)v7 + 1), *((AVAudioNode **)v7 + 4), 1);
    v32 = (void *)objc_msgSend(*((id *)v7 + 5), "outputFormatForBus:", 0);
    v33 = objc_msgSend(*((id *)v7 + 4), "inputFormatForBus:", 0);
    if (v32)
    {
      v34 = (void *)v33;
      objc_msgSend(v32, "sampleRate");
      if (v35 > 0.0)
      {
        if (objc_msgSend(v32, "channelCount"))
        {
          if (v34)
          {
            objc_msgSend(v34, "sampleRate");
            if (v36 > 0.0)
            {
              if (objc_msgSend(v34, "channelCount"))
              {
                v37 = objc_msgSend(*((id *)v7 + 5), "impl");
                v38 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 40))(v37);
                (*(void (**)(uint64_t, uint64_t, _QWORD, void *))(*(_QWORD *)v38 + 48))(v38, 1, 0, v32);
                v39 = objc_msgSend(*((id *)v7 + 4), "impl");
                v40 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v39 + 40))(v39);
                (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(*(_QWORD *)v40 + 48))(v40, 0, 1, v34);
              }
            }
          }
        }
      }
    }
    if (InputConnectionPointForNode)
    {
      if (v5)
        v41 = (AVAudioFormat *)objc_msgSend(*((id *)v7 + 5), "inputFormatForBus:", 0);
      else
        v41 = 0;
      AVAudioEngineImpl::Connect((id *)v7, -[AVAudioConnectionPoint node](InputConnectionPointForNode, "node"), *((AVAudioNode **)v7 + 5), -[AVAudioConnectionPoint bus](InputConnectionPointForNode, "bus"), 0, v41);
    }
    if (-[NSArray count](OutputConnectionPointsForNode, "count"))
    {
      if (v5)
        v42 = (AVAudioFormat *)objc_msgSend(*((id *)v7 + 4), "outputFormatForBus:", 0);
      else
        v42 = 0;
      AVAudioEngineImpl::ConnectMultipleOutputs((id *)v7, *((AVAudioNode **)v7 + 4), OutputConnectionPointsForNode, 0, v42);
    }
    if (!AVAudioEngineImpl::AreRenderingModesIdentical((AVAudioEngineImpl *)v7, *((AVAudioIONode **)v7 + 4)))
    {
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v43 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "AVAEInternal.h";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 71;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "AVAudioEngine.mm";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 954;
        *(_WORD *)&buf[34] = 2080;
        *(_QWORD *)&buf[36] = "UpdateIONodesForVP";
        v51 = 2080;
        v52 = "AreRenderingModesIdentical(_inputNode)";
        _os_log_impl(&dword_19B733000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "AreRenderingModesIdentical(_inputNode)");
    }
  }
  v9 = 0;
  if (outError)
    goto LABEL_69;
LABEL_73:
  v10 = v9 == 0;
LABEL_74:
  if (v49)
    std::recursive_mutex::unlock(v48);
  if (v47)
    std::recursive_mutex::unlock(v46);
  return v10;
}

- (BOOL)isVoiceProcessingEnabled
{
  _DWORD *v3;
  BOOL v5;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super._impl);
  v3 = (_DWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)self->super._impl + 256))(self->super._impl);
  v5 = *v3 == 1635086197 && v3[1] == 1987078511 && v3[2] == 1634758764;
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
  return v5;
}

- (BOOL)enableManualRenderingMode:(int64_t)a3 isInput:(BOOL)a4
{
  BOOL v6;
  void *impl;
  AVAudioGenericIONodeImpl *v8;
  AVAudioEngineManualRenderingMode v9;
  std::recursive_mutex *v11;
  char v12;
  std::recursive_mutex *v13;
  char v14;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v11, (uint64_t)self->super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v6 = 0;
  }
  else if (-[AVAudioIONode isInManualRenderingMode](self, "isInManualRenderingMode")
         && -[AVAudioIONode manualRenderingMode](self, "manualRenderingMode") == a3)
  {
    v6 = 1;
  }
  else if (-[AVAudioIONode isInManualRenderingMode](self, "isInManualRenderingMode"))
  {
    impl = self->super._impl;
    v6 = 1;
    (*(void (**)(void *, uint64_t, int64_t))(*(_QWORD *)impl + 288))(impl, 1, a3);
  }
  else
  {
    v8 = (AVAudioGenericIONodeImpl *)operator new();
    AVAudioGenericIONodeImpl::AVAudioGenericIONodeImpl(v8, a3, v9);
    v6 = -[AVAudioNode resetImpl:](self, "resetImpl:", v8);
  }
  if (v14)
    std::recursive_mutex::unlock(v13);
  if (v12)
    std::recursive_mutex::unlock(v11);
  return v6;
}

- (BOOL)enableRealtimeRenderingModeWithIOUnit:(void *)a3 isInput:(BOOL)a4 forceIOUnitReset:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v9;
  uint64_t v10;
  BOOL v11;
  std::recursive_mutex *v13;
  char v14;
  std::recursive_mutex *v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->super._impl);
  if (!a3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v18 = "AVAEInternal.h";
      v19 = 1024;
      v20 = 71;
      v21 = 2080;
      v22 = "AVAudioIONode.mm";
      v23 = 1024;
      v24 = 108;
      v25 = 2080;
      v26 = "-[AVAudioIONode enableRealtimeRenderingModeWithIOUnit:isInput:forceIOUnitReset:]";
      v27 = 2080;
      v28 = "ioUnit != nil";
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "ioUnit != nil");
  }
  if (-[AVAudioIONode isInManualRenderingMode](self, "isInManualRenderingMode") || v5)
  {
    v10 = operator new();
    AVAudioNodeImplBase::AVAudioNodeImplBase((AVAudioNodeImplBase *)v10);
    *(_QWORD *)v10 = &off_1E3BE74B8;
    *(_QWORD *)(v10 + 168) = a3;
    *(_BYTE *)(v10 + 176) = a4;
    v11 = -[AVAudioNode resetImpl:](self, "resetImpl:", v10);
  }
  else
  {
    v11 = 1;
  }
  if (v16)
    std::recursive_mutex::unlock(v15);
  if (v14)
    std::recursive_mutex::unlock(v13);
  return v11;
}

@end
