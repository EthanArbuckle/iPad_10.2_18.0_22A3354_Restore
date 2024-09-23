@implementation AVAudioUnitReverb

- (AVAudioUnitReverb)init
{
  AVAudioUnitReverb *v2;
  AVAudioUnitReverb *v3;
  objc_super v5;
  __int128 v6;
  int v7;

  v6 = xmmword_19B85A1E0;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)AVAudioUnitReverb;
  v2 = -[AVAudioUnitEffect initWithAudioComponentDescription:](&v5, sel_initWithAudioComponentDescription_, &v6);
  v3 = v2;
  if (v2)
    -[AVAudioUnitReverb loadFactoryPreset:](v2, "loadFactoryPreset:", 3);
  return v3;
}

- (void)loadFactoryPreset:(AVAudioUnitReverbPreset)preset
{
  int v3;
  int v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  v3 = preset;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  v5 = v3;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, int *, uint64_t))(*(_QWORD *)self->super.super.super._impl
                                                                          + 144))(self->super.super.super._impl, 10, 0, 0, &v5, 4);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (void)setWetDryMix:(float)wetDryMix
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  *(float *)&v5 = wetDryMix;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 0, v5);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (float)wetDryMix
{
  float v3;
  float v4;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  -[AVAudioUnit valueForParam:](self, "valueForParam:", 0);
  v4 = v3;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v4;
}

@end
