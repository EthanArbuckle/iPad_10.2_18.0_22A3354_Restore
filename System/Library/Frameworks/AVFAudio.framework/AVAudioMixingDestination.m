@implementation AVAudioMixingDestination

- (AVAudioMixingDestination)initWithImpl:(AVAudioMixingImpl *)a3
{
  AVAudioMixingDestination *v4;
  AVAudioMixingDestination *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAudioMixingDestination;
  v4 = -[AVAudioMixingDestination init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
  }
  else if (a3)
  {
    (*((void (**)(AVAudioMixingImpl *))a3->var0 + 1))(a3);
  }
  return v5;
}

- (AVAudioMixingDestination)init
{

  return 0;
}

- (void)dealloc
{
  void *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl)
    (*(void (**)(void *, SEL))(*(_QWORD *)impl + 8))(impl, a2);
  v4.receiver = self;
  v4.super_class = (Class)AVAudioMixingDestination;
  -[AVAudioMixingDestination dealloc](&v4, sel_dealloc);
}

- (AVAudioMixingImpl)implementation
{
  return (AVAudioMixingImpl *)self->_impl;
}

- (id)destinationForMixer:(id)a3 bus:(unint64_t)a4
{
  NSObject *v7;
  void *impl;
  uint64_t v9;
  uint64_t v10;
  int v11;
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, *((_QWORD *)self->_impl + 1));
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
      v24 = 492;
      v25 = 2080;
      v26 = "-[AVAudioMixingDestination destinationForMixer:bus:]";
      v27 = 2080;
      v28 = "mixer";
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "mixer");
  }
  impl = self->_impl;
  v9 = objc_msgSend(a3, "impl");
  v10 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v9 + 240))(v9, a4);
  v11 = (*(uint64_t (**)(void *, id, uint64_t))(*(_QWORD *)impl + 16))(impl, a3, v10);
  if (v16)
    std::recursive_mutex::unlock(v15);
  if (v14)
    std::recursive_mutex::unlock(v13);
  if (v11)
    return self;
  else
    return 0;
}

- (AVAudioConnectionPoint)connectionPoint
{
  AVAudioConnectionPoint *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = (AVAudioConnectionPoint *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_impl + 24))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setVolume:(float)a3
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float))(*(_QWORD *)self->_impl + 32))(self->_impl, a3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)volume
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = *((float *)self->_impl + 4);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setPan:(float)a3
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float))(*(_QWORD *)self->_impl + 40))(self->_impl, a3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)pan
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = *((float *)self->_impl + 5);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setRenderingAlgorithm:(int64_t)a3
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, int64_t))(*(_QWORD *)self->_impl + 48))(self->_impl, a3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (int64_t)renderingAlgorithm
{
  int64_t v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = *((unsigned int *)self->_impl + 6);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setSourceMode:(int64_t)a3
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, int64_t))(*(_QWORD *)self->_impl + 56))(self->_impl, a3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (int64_t)sourceMode
{
  int64_t v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = *((unsigned int *)self->_impl + 7);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setPointSourceInHeadMode:(int64_t)a3
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, int64_t))(*(_QWORD *)self->_impl + 64))(self->_impl, a3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (int64_t)pointSourceInHeadMode
{
  int64_t v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = *((unsigned int *)self->_impl + 8);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setRate:(float)a3
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float))(*(_QWORD *)self->_impl + 72))(self->_impl, a3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)rate
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = *((float *)self->_impl + 9);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setReverbBlend:(float)a3
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float))(*(_QWORD *)self->_impl + 80))(self->_impl, a3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)reverbBlend
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = *((float *)self->_impl + 10);
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
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float, float, float))(*(_QWORD *)self->_impl + 88))(self->_impl, x, y, z);
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
}

- (AVAudio3DPoint)position
{
  float *impl;
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

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, *((_QWORD *)self->_impl + 1));
  impl = (float *)self->_impl;
  v4 = impl[11];
  v5 = impl[12];
  v6 = impl[13];
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
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float))(*(_QWORD *)self->_impl + 96))(self->_impl, a3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)obstruction
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = *((float *)self->_impl + 14);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setOcclusion:(float)a3
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float))(*(_QWORD *)self->_impl + 104))(self->_impl, a3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)occlusion
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = *((float *)self->_impl + 15);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

@end
