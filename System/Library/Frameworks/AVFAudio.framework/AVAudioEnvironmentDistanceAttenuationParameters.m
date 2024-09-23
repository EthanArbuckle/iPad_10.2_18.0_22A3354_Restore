@implementation AVAudioEnvironmentDistanceAttenuationParameters

- (AVAudioEnvironmentDistanceAttenuationParameters)init
{

  return 0;
}

- (AVAudioEnvironmentDistanceAttenuationParameters)initWithEnvironment:(void *)a3
{
  AVAudioEnvironmentDistanceAttenuationParameters *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioEnvironmentDistanceAttenuationParameters;
  result = -[AVAudioEnvironmentDistanceAttenuationParameters init](&v5, sel_init);
  if (result)
    result->_impl = a3;
  return result;
}

- (void)setDistanceAttenuationModel:(AVAudioEnvironmentDistanceAttenuationModel)distanceAttenuationModel
{
  _DWORD *impl;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  int v9;

  impl = self->_impl;
  v9 = distanceAttenuationModel;
  if (impl[86] != (_DWORD)distanceAttenuationModel && (distanceAttenuationModel - 1) <= 2)
  {
    impl[86] = distanceAttenuationModel;
    v5 = (_QWORD *)*((_QWORD *)impl + 39);
    if (v5 != (_QWORD *)(impl + 80))
    {
      do
      {
        (*(void (**)(_DWORD *, uint64_t, uint64_t, _QWORD, int *, uint64_t))(*(_QWORD *)impl + 144))(impl, 3013, 1, *((unsigned int *)v5 + 10), &v9, 4);
        v6 = (_QWORD *)v5[1];
        if (v6)
        {
          do
          {
            v7 = v6;
            v6 = (_QWORD *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            v7 = (_QWORD *)v5[2];
            v8 = *v7 == (_QWORD)v5;
            v5 = v7;
          }
          while (!v8);
        }
        v5 = v7;
      }
      while (v7 != (_QWORD *)(impl + 80));
    }
    AVAudioEnvironmentNodeImpl::SetMixerDistanceParameters((AVAudioEnvironmentNodeImpl *)impl);
  }
}

- (AVAudioEnvironmentDistanceAttenuationModel)distanceAttenuationModel
{
  return (unint64_t)*((unsigned int *)self->_impl + 86);
}

- (void)setMaximumDistance:(float)maximumDistance
{
  float *impl;

  impl = (float *)self->_impl;
  if (impl[87] != maximumDistance)
  {
    impl[87] = maximumDistance;
    AVAudioEnvironmentNodeImpl::SetMixerDistanceParameters((AVAudioEnvironmentNodeImpl *)impl);
  }
}

- (float)maximumDistance
{
  return *((float *)self->_impl + 87);
}

- (void)setReferenceDistance:(float)referenceDistance
{
  float *impl;

  impl = (float *)self->_impl;
  if (impl[88] != referenceDistance)
  {
    impl[88] = referenceDistance;
    AVAudioEnvironmentNodeImpl::SetMixerDistanceParameters((AVAudioEnvironmentNodeImpl *)impl);
  }
}

- (float)referenceDistance
{
  return *((float *)self->_impl + 88);
}

- (void)setRolloffFactor:(float)rolloffFactor
{
  float *impl;

  impl = (float *)self->_impl;
  if (impl[89] != rolloffFactor)
  {
    impl[89] = rolloffFactor;
    AVAudioEnvironmentNodeImpl::SetMixerDistanceParameters((AVAudioEnvironmentNodeImpl *)impl);
  }
}

- (float)rolloffFactor
{
  return *((float *)self->_impl + 89);
}

- (void)dealloc
{
  objc_super v2;

  self->_impl = 0;
  v2.receiver = self;
  v2.super_class = (Class)AVAudioEnvironmentDistanceAttenuationParameters;
  -[AVAudioEnvironmentDistanceAttenuationParameters dealloc](&v2, sel_dealloc);
}

@end
