@implementation AVAudioUnitEQFilterParameters

- (AVAudioUnitEQFilterParameters)init
{

  return 0;
}

- (AVAudioUnitEQFilterParameters)initWithImpl:(AVAudioUnitEQFilterParametersImpl *)a3
{
  AVAudioUnitEQFilterParameters *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioUnitEQFilterParameters;
  result = -[AVAudioUnitEQFilterParameters init](&v5, sel_init);
  if (result)
    result->_impl = a3;
  return result;
}

- (void)dealloc
{
  void *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl)
    (*(void (**)(void *, SEL))(*(_QWORD *)impl + 8))(impl, a2);
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioUnitEQFilterParameters;
  -[AVAudioUnitEQFilterParameters dealloc](&v4, sel_dealloc);
}

- (void)setFilterType:(AVAudioUnitEQFilterType)filterType
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, AVAudioUnitEQFilterType))(*(_QWORD *)self->_impl + 16))(self->_impl, filterType);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (AVAudioUnitEQFilterType)filterType
{
  AVAudioUnitEQFilterType v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)self->_impl + 56))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setFrequency:(float)frequency
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float))(*(_QWORD *)self->_impl + 24))(self->_impl, frequency);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)frequency
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = (*(float (**)(void *))(*(_QWORD *)self->_impl + 64))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setBandwidth:(float)bandwidth
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float))(*(_QWORD *)self->_impl + 32))(self->_impl, bandwidth);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)bandwidth
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = (*(float (**)(void *))(*(_QWORD *)self->_impl + 72))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setGain:(float)gain
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, float))(*(_QWORD *)self->_impl + 40))(self->_impl, gain);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)gain
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = (*(float (**)(void *))(*(_QWORD *)self->_impl + 80))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setBypass:(BOOL)bypass
{
  _BOOL8 v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  v3 = bypass;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  (*(void (**)(void *, _BOOL8))(*(_QWORD *)self->_impl + 48))(self->_impl, v3);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (BOOL)bypass
{
  char v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((_QWORD *)self->_impl + 1));
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)self->_impl + 88))(self->_impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

@end
