@implementation AVAudioNode

- (AVAudioNode)initWithImpl:(void *)a3
{
  AVAudioNode *result;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVAudioNode;
    result = -[AVAudioNode init](&v5, sel_init);
    if (result)
    {
      result->_impl = a3;
      return result;
    }
    (*(void (**)(void *))(*(_QWORD *)a3 + 8))(a3);
  }
  else
  {

  }
  return 0;
}

- (AVAudioNode)init
{
  return -[AVAudioNode initWithImpl:](self, "initWithImpl:", 0);
}

- (BOOL)resetImpl:(void *)a3
{
  void *impl;

  if (a3)
  {
    impl = self->_impl;
    if (impl != a3)
    {
      if (impl)
        (*(void (**)(void *, SEL))(*(_QWORD *)impl + 8))(impl, a2);
      self->_impl = a3;
    }
  }
  return a3 != 0;
}

- (void)dealloc
{
  void *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl)
    (*(void (**)(void *, SEL))(*(_QWORD *)impl + 8))(impl, a2);
  v4.receiver = self;
  v4.super_class = (Class)AVAudioNode;
  -[AVAudioNode dealloc](&v4, sel_dealloc);
}

- (AVAudioFormat)outputFormatForBus:(AVAudioNodeBus)bus
{
  AVAudioFormat *v5;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->_impl);
  v5 = (AVAudioFormat *)(*(uint64_t (**)(void *, AVAudioNodeBus))(*(_QWORD *)self->_impl + 48))(self->_impl, bus);
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
  return v5;
}

- (BOOL)setOutputFormat:(id)a3 forBus:(unint64_t)a4
{
  char v7;
  std::recursive_mutex *v9;
  char v10;
  std::recursive_mutex *v11;
  char v12;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->_impl);
  v7 = (*(uint64_t (**)(void *, unint64_t, id))(*(_QWORD *)self->_impl + 64))(self->_impl, a4, a3);
  if (v12)
    std::recursive_mutex::unlock(v11);
  if (v10)
    std::recursive_mutex::unlock(v9);
  return v7;
}

- (AVAudioFormat)inputFormatForBus:(AVAudioNodeBus)bus
{
  AVAudioFormat *v5;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->_impl);
  v5 = (AVAudioFormat *)(*(uint64_t (**)(void *, AVAudioNodeBus))(*(_QWORD *)self->_impl + 72))(self->_impl, bus);
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
  return v5;
}

- (BOOL)setInputFormat:(id)a3 forBus:(unint64_t)a4
{
  char v7;
  std::recursive_mutex *v9;
  char v10;
  std::recursive_mutex *v11;
  char v12;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->_impl);
  v7 = (*(uint64_t (**)(void *, unint64_t, id))(*(_QWORD *)self->_impl + 80))(self->_impl, a4, a3);
  if (v12)
    std::recursive_mutex::unlock(v11);
  if (v10)
    std::recursive_mutex::unlock(v9);
  return v7;
}

- (void)didAttachToEngine:(id)a3
{
  uint64_t v5;
  std::recursive_mutex *v6;

  v5 = objc_msgSend(a3, "implementation");
  v6 = (std::recursive_mutex *)((char *)self->_impl + 104);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v6, (std::recursive_mutex *)(v5 + 112));
  AVAudioEngineGraph::AddNode(*(uint64_t ***)(v5 + 8), self);
  (*(void (**)(void *, id))(*(_QWORD *)self->_impl + 16))(self->_impl, a3);
  std::recursive_mutex::unlock(v6);
  std::recursive_mutex::unlock((std::recursive_mutex *)(v5 + 112));
}

- (void)didDetachFromEngine:(id)a3 error:(id *)a4
{
  uint64_t v7;
  std::recursive_mutex *v8;
  uint64_t v9;

  v7 = objc_msgSend(a3, "implementation");
  v8 = (std::recursive_mutex *)((char *)self->_impl + 104);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v8, (std::recursive_mutex *)(v7 + 112));
  v9 = AVAudioEngineGraph::RemoveNode(*(uint64_t ****)(v7 + 8), self, (NSError **)a4);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 1516, "DestroyGraphNode", "_graph->RemoveNode(inNode, outErr)", v9, (NSError **)a4);
  (*(void (**)(void *, id))(*(_QWORD *)self->_impl + 24))(self->_impl, a3);
  std::recursive_mutex::unlock(v8);
  std::recursive_mutex::unlock((std::recursive_mutex *)(v7 + 112));
}

- (NSString)nameForInputBus:(AVAudioNodeBus)bus
{
  return 0;
}

- (NSString)nameForOutputBus:(AVAudioNodeBus)bus
{
  return 0;
}

- (void)reset
{
  std::recursive_mutex *v3;
  char v4;
  std::recursive_mutex *v5;
  char v6;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v3, (uint64_t)self->_impl);
  (*(void (**)(void *))(*(_QWORD *)self->_impl + 88))(self->_impl);
  if (v6)
    std::recursive_mutex::unlock(v5);
  if (v4)
    std::recursive_mutex::unlock(v3);
}

- (id)clock
{
  void *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_impl + 352))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (AVAudioTime)lastRenderTime
{
  AVAudioTime *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = (AVAudioTime *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_impl + 360))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (NSTimeInterval)latency
{
  double v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = (*(double (**)(void *))(*(_QWORD *)self->_impl + 384))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (NSTimeInterval)outputPresentationLatency
{
  double v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = (*(double (**)(void *))(*(_QWORD *)self->_impl + 400))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (AVAudioEngine)engine
{
  AVAudioEngine **v2;

  v2 = (AVAudioEngine **)*((_QWORD *)self->_impl + 1);
  if (v2)
    return *v2;
  else
    return 0;
}

- (NSUInteger)numberOfInputs
{
  unsigned int v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)self->_impl + 96))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (NSUInteger)numberOfOutputs
{
  unsigned int v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)self->_impl + 104))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setNumberOfInputs:(unsigned int)a3
{
  uint64_t v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  v3 = *(_QWORD *)&a3;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  (*(void (**)(void *, uint64_t))(*(_QWORD *)self->_impl + 112))(self->_impl, v3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (void)setNumberOfOutputs:(unsigned int)a3
{
  uint64_t v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  v3 = *(_QWORD *)&a3;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  (*(void (**)(void *, uint64_t))(*(_QWORD *)self->_impl + 120))(self->_impl, v3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (void)installTapOnBus:(AVAudioNodeBus)bus bufferSize:(AVAudioFrameCount)bufferSize format:(AVAudioFormat *)format block:(AVAudioNodeTapBlock)tapBlock
{
  uint64_t v8;
  NSObject *v11;
  AVAudioEngine *v12;
  NSObject *v13;
  std::recursive_mutex *v14;
  char v15;
  std::recursive_mutex *v16;
  char v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v8 = *(_QWORD *)&bufferSize;
  v30 = *MEMORY[0x1E0C80C00];
  if (!tapBlock)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v19 = "AVAEInternal.h";
      v20 = 1024;
      v21 = 71;
      v22 = 2080;
      v23 = "AVAudioNode.mm";
      v24 = 1024;
      v25 = 180;
      v26 = 2080;
      v27 = "-[AVAudioNode installTapOnBus:bufferSize:format:block:]";
      v28 = 2080;
      v29 = "tapBlock";
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "tapBlock");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  v12 = -[AVAudioNode engine](self, "engine");
  if (!v12)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v19 = "AVAEInternal.h";
      v20 = 1024;
      v21 = 71;
      v22 = 2080;
      v23 = "AVAudioNode.mm";
      v24 = 1024;
      v25 = 185;
      v26 = 2080;
      v27 = "-[AVAudioNode installTapOnBus:bufferSize:format:block:]";
      v28 = 2080;
      v29 = "NULL != engine";
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "NULL != engine");
  }
  AVAudioEngineImpl::InstallTapOnNode((char **)-[AVAudioEngine implementation](v12, "implementation"), self, bus, v8, format, (uint64_t)tapBlock);
  if (v17)
    std::recursive_mutex::unlock(v16);
  if (v15)
    std::recursive_mutex::unlock(v14);
}

- (void)removeTapOnBus:(AVAudioNodeBus)bus
{
  AVAudioEngine *v5;
  NSObject *v6;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->_impl);
  v5 = -[AVAudioNode engine](self, "engine");
  if (!v5)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "AVAEInternal.h";
      v13 = 1024;
      v14 = 71;
      v15 = 2080;
      v16 = "AVAudioNode.mm";
      v17 = 1024;
      v18 = 194;
      v19 = 2080;
      v20 = "-[AVAudioNode removeTapOnBus:]";
      v21 = 2080;
      v22 = "NULL != engine";
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "NULL != engine");
  }
  AVAudioEngineImpl::RemoveTapOnNode((AVAudioEngineImpl *)-[AVAudioEngine implementation](v5, "implementation"), self, bus);
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
}

- (void)impl
{
  return self->_impl;
}

- (OpaqueAudioComponentInstance)audioUnit
{
  OpaqueAudioComponentInstance *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_impl + 224))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (AUAudioUnit)AUAudioUnit
{
  AUAudioUnit *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = (AUAudioUnit *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_impl + 232))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (id)destinationForMixer:(id)a3 bus:(unint64_t)a4
{
  NSObject *v7;
  AVAudioNodeImplBase *impl;
  uint64_t v9;
  unsigned int v10;
  void *MixingDestination;
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

  v29 = *MEMORY[0x1E0C80C00];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->_impl);
  if (!a3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v18 = "AVAEInternal.h";
      v19 = 1024;
      v20 = 71;
      v21 = 2080;
      v22 = "AVAudioNode.mm";
      v23 = 1024;
      v24 = 230;
      v25 = 2080;
      v26 = "-[AVAudioNode destinationForMixer:bus:]";
      v27 = 2080;
      v28 = "mixer";
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "mixer");
  }
  impl = (AVAudioNodeImplBase *)self->_impl;
  v9 = objc_msgSend(a3, "impl");
  v10 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v9 + 240))(v9, a4);
  MixingDestination = (void *)AVAudioNodeImplBase::GetMixingDestination(impl, (AVAudioNode *)a3, v10);
  if (v16)
    std::recursive_mutex::unlock(v15);
  if (v14)
    std::recursive_mutex::unlock(v13);
  return MixingDestination;
}

- (void)setVolume:(float)a3
{
  uint64_t MixingImpl;
  double v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  std::recursive_mutex *v14;
  char v15;
  std::recursive_mutex *v16;
  char v17;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(_QWORD *)MixingImpl + 32))(MixingImpl, a3);
  v7 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v7)
  {
    v10 = (_QWORD *)*v7;
    v8 = v7 + 1;
    v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&v6 = a3;
        objc_msgSend((id)v9[6], "setVolume:", v6);
        v11 = (_QWORD *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (_QWORD *)v9[2];
            v13 = *v12 == (_QWORD)v9;
            v9 = v12;
          }
          while (!v13);
        }
        v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v17)
    std::recursive_mutex::unlock(v16);
  if (v15)
    std::recursive_mutex::unlock(v14);
}

- (float)volume
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 16);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setPan:(float)a3
{
  uint64_t MixingImpl;
  double v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  std::recursive_mutex *v14;
  char v15;
  std::recursive_mutex *v16;
  char v17;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(_QWORD *)MixingImpl + 40))(MixingImpl, a3);
  v7 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v7)
  {
    v10 = (_QWORD *)*v7;
    v8 = v7 + 1;
    v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&v6 = a3;
        objc_msgSend((id)v9[6], "setPan:", v6);
        v11 = (_QWORD *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (_QWORD *)v9[2];
            v13 = *v12 == (_QWORD)v9;
            v9 = v12;
          }
          while (!v13);
        }
        v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v17)
    std::recursive_mutex::unlock(v16);
  if (v15)
    std::recursive_mutex::unlock(v14);
}

- (float)pan
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 20);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setRenderingAlgorithm:(int64_t)a3
{
  uint64_t MixingImpl;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  std::recursive_mutex *v13;
  char v14;
  std::recursive_mutex *v15;
  char v16;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, int64_t))(*(_QWORD *)MixingImpl + 48))(MixingImpl, a3);
  v6 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v6)
  {
    v9 = (_QWORD *)*v6;
    v7 = v6 + 1;
    v8 = v9;
    if (v9 != v7)
    {
      do
      {
        objc_msgSend((id)v8[6], "setRenderingAlgorithm:", a3);
        v10 = (_QWORD *)v8[1];
        if (v10)
        {
          do
          {
            v11 = v10;
            v10 = (_QWORD *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v11 = (_QWORD *)v8[2];
            v12 = *v11 == (_QWORD)v8;
            v8 = v11;
          }
          while (!v12);
        }
        v8 = v11;
      }
      while (v11 != v7);
    }
  }
  if (v16)
    std::recursive_mutex::unlock(v15);
  if (v14)
    std::recursive_mutex::unlock(v13);
}

- (int64_t)renderingAlgorithm
{
  int64_t v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *(unsigned int *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 24);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setSourceMode:(int64_t)a3
{
  uint64_t MixingImpl;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  std::recursive_mutex *v13;
  char v14;
  std::recursive_mutex *v15;
  char v16;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, int64_t))(*(_QWORD *)MixingImpl + 56))(MixingImpl, a3);
  v6 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v6)
  {
    v9 = (_QWORD *)*v6;
    v7 = v6 + 1;
    v8 = v9;
    if (v9 != v7)
    {
      do
      {
        objc_msgSend((id)v8[6], "setSourceMode:", a3);
        v10 = (_QWORD *)v8[1];
        if (v10)
        {
          do
          {
            v11 = v10;
            v10 = (_QWORD *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v11 = (_QWORD *)v8[2];
            v12 = *v11 == (_QWORD)v8;
            v8 = v11;
          }
          while (!v12);
        }
        v8 = v11;
      }
      while (v11 != v7);
    }
  }
  if (v16)
    std::recursive_mutex::unlock(v15);
  if (v14)
    std::recursive_mutex::unlock(v13);
}

- (int64_t)sourceMode
{
  int64_t v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *(unsigned int *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 28);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setPointSourceInHeadMode:(int64_t)a3
{
  uint64_t MixingImpl;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  std::recursive_mutex *v13;
  char v14;
  std::recursive_mutex *v15;
  char v16;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, int64_t))(*(_QWORD *)MixingImpl + 64))(MixingImpl, a3);
  v6 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v6)
  {
    v9 = (_QWORD *)*v6;
    v7 = v6 + 1;
    v8 = v9;
    if (v9 != v7)
    {
      do
      {
        objc_msgSend((id)v8[6], "setPointSourceInHeadMode:", a3);
        v10 = (_QWORD *)v8[1];
        if (v10)
        {
          do
          {
            v11 = v10;
            v10 = (_QWORD *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v11 = (_QWORD *)v8[2];
            v12 = *v11 == (_QWORD)v8;
            v8 = v11;
          }
          while (!v12);
        }
        v8 = v11;
      }
      while (v11 != v7);
    }
  }
  if (v16)
    std::recursive_mutex::unlock(v15);
  if (v14)
    std::recursive_mutex::unlock(v13);
}

- (int64_t)pointSourceInHeadMode
{
  int64_t v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *(unsigned int *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 32);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setRate:(float)a3
{
  uint64_t MixingImpl;
  double v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  std::recursive_mutex *v14;
  char v15;
  std::recursive_mutex *v16;
  char v17;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(_QWORD *)MixingImpl + 72))(MixingImpl, a3);
  v7 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v7)
  {
    v10 = (_QWORD *)*v7;
    v8 = v7 + 1;
    v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&v6 = a3;
        objc_msgSend((id)v9[6], "setRate:", v6);
        v11 = (_QWORD *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (_QWORD *)v9[2];
            v13 = *v12 == (_QWORD)v9;
            v9 = v12;
          }
          while (!v13);
        }
        v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v17)
    std::recursive_mutex::unlock(v16);
  if (v15)
    std::recursive_mutex::unlock(v14);
}

- (float)rate
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 36);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setReverbBlend:(float)a3
{
  uint64_t MixingImpl;
  double v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  std::recursive_mutex *v14;
  char v15;
  std::recursive_mutex *v16;
  char v17;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(_QWORD *)MixingImpl + 80))(MixingImpl, a3);
  v7 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v7)
  {
    v10 = (_QWORD *)*v7;
    v8 = v7 + 1;
    v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&v6 = a3;
        objc_msgSend((id)v9[6], "setReverbBlend:", v6);
        v11 = (_QWORD *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (_QWORD *)v9[2];
            v13 = *v12 == (_QWORD)v9;
            v9 = v12;
          }
          while (!v13);
        }
        v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v17)
    std::recursive_mutex::unlock(v16);
  if (v15)
    std::recursive_mutex::unlock(v14);
}

- (float)reverbBlend
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 40);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setPosition:(AVAudio3DPoint)a3
{
  float z;
  float y;
  float x;
  uint64_t MixingImpl;
  double v8;
  double v9;
  double v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  std::recursive_mutex *v18;
  char v19;
  std::recursive_mutex *v20;
  char v21;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v18, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float, float, float))(*(_QWORD *)MixingImpl + 88))(MixingImpl, x, y, z);
  v11 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v11)
  {
    v14 = (_QWORD *)*v11;
    v12 = v11 + 1;
    v13 = v14;
    if (v14 != v12)
    {
      do
      {
        *(float *)&v8 = x;
        *(float *)&v9 = y;
        *(float *)&v10 = z;
        objc_msgSend((id)v13[6], "setPosition:", v8, v9, v10);
        v15 = (_QWORD *)v13[1];
        if (v15)
        {
          do
          {
            v16 = v15;
            v15 = (_QWORD *)*v15;
          }
          while (v15);
        }
        else
        {
          do
          {
            v16 = (_QWORD *)v13[2];
            v17 = *v16 == (_QWORD)v13;
            v13 = v16;
          }
          while (!v17);
        }
        v13 = v16;
      }
      while (v16 != v12);
    }
  }
  if (v21)
    std::recursive_mutex::unlock(v20);
  if (v19)
    std::recursive_mutex::unlock(v18);
}

- (AVAudio3DPoint)position
{
  float *MixingImpl;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  std::recursive_mutex *v10;
  char v11;
  std::recursive_mutex *v12;
  char v13;
  AVAudio3DPoint result;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->_impl);
  MixingImpl = (float *)AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  v4 = MixingImpl[11];
  v5 = MixingImpl[12];
  v6 = MixingImpl[13];
  if (v13)
    std::recursive_mutex::unlock(v12);
  if (v11)
    std::recursive_mutex::unlock(v10);
  v7 = v4;
  v8 = v5;
  v9 = v6;
  result.z = v9;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setObstruction:(float)a3
{
  uint64_t MixingImpl;
  double v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  std::recursive_mutex *v14;
  char v15;
  std::recursive_mutex *v16;
  char v17;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(_QWORD *)MixingImpl + 96))(MixingImpl, a3);
  v7 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v7)
  {
    v10 = (_QWORD *)*v7;
    v8 = v7 + 1;
    v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&v6 = a3;
        objc_msgSend((id)v9[6], "setObstruction:", v6);
        v11 = (_QWORD *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (_QWORD *)v9[2];
            v13 = *v12 == (_QWORD)v9;
            v9 = v12;
          }
          while (!v13);
        }
        v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v17)
    std::recursive_mutex::unlock(v16);
  if (v15)
    std::recursive_mutex::unlock(v14);
}

- (float)obstruction
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 56);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setOcclusion:(float)a3
{
  uint64_t MixingImpl;
  double v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  std::recursive_mutex *v14;
  char v15;
  std::recursive_mutex *v16;
  char v17;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(_QWORD *)MixingImpl + 104))(MixingImpl, a3);
  v7 = (_QWORD *)*((_QWORD *)self->_impl + 8);
  if (v7)
  {
    v10 = (_QWORD *)*v7;
    v8 = v7 + 1;
    v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&v6 = a3;
        objc_msgSend((id)v9[6], "setOcclusion:", v6);
        v11 = (_QWORD *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (_QWORD *)v9[2];
            v13 = *v12 == (_QWORD)v9;
            v9 = v12;
          }
          while (!v13);
        }
        v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v17)
    std::recursive_mutex::unlock(v16);
  if (v15)
    std::recursive_mutex::unlock(v14);
}

- (float)occlusion
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 60);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

@end
