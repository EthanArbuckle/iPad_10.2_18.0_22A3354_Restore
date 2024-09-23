@implementation AVAudioEnvironmentReverbParameters

- (AVAudioEnvironmentReverbParameters)init
{

  return 0;
}

- (AVAudioEnvironmentReverbParameters)initWithEnvironment:(void *)a3
{
  AVAudioEnvironmentReverbParameters *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioEnvironmentReverbParameters;
  result = -[AVAudioEnvironmentReverbParameters init](&v5, sel_init);
  if (result)
    result->_impl = a3;
  return result;
}

- (void)setEnable:(BOOL)enable
{
  int v3;
  unsigned __int8 *impl;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;
  int v10;

  v3 = enable;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->_impl);
  impl = (unsigned __int8 *)self->_impl;
  if (impl[376] != v3)
  {
    impl[376] = v3;
    v10 = v3;
    (*(void (**)(unsigned __int8 *, uint64_t, _QWORD, _QWORD, int *, uint64_t))(*(_QWORD *)impl + 144))(impl, 1005, 0, 0, &v10, 4);
    AVAudioEnvironmentNodeImpl::ResetRenderingFlags((AVAudioEnvironmentNodeImpl *)impl);
  }
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (BOOL)enable
{
  int v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *((unsigned __int8 *)self->_impl + 376);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3 != 0;
}

- (void)setLevel:(float)level
{
  float *impl;
  float v6;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->_impl);
  impl = (float *)self->_impl;
  if (impl[95] != level)
  {
    v6 = 40.0;
    if (level < 40.0)
      v6 = level;
    if (level <= -40.0)
      v6 = -40.0;
    impl[95] = v6;
    (*(void (**)(float *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)impl + 128))(impl, 9, 0, 0);
  }
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
}

- (float)level
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = *((float *)self->_impl + 95);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (AVAudioUnitEQFilterParameters)filterParameters
{
  AVAudioUnitEQFilterParameters *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  v3 = (AVAudioUnitEQFilterParameters *)*((_QWORD *)self->_impl + 46);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)loadFactoryReverbPreset:(AVAudioUnitReverbPreset)preset
{
  unsigned int v3;
  void *impl;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;
  unsigned int v10;

  v3 = preset;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->_impl);
  impl = self->_impl;
  v10 = v3;
  if (v3 <= 0xC)
    (*(void (**)(void *, uint64_t, _QWORD, _QWORD, unsigned int *, uint64_t))(*(_QWORD *)impl + 144))(impl, 10, 0, 0, &v10, 4);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (void)dealloc
{
  objc_super v2;

  self->_impl = 0;
  v2.receiver = self;
  v2.super_class = (Class)AVAudioEnvironmentReverbParameters;
  -[AVAudioEnvironmentReverbParameters dealloc](&v2, sel_dealloc);
}

@end
