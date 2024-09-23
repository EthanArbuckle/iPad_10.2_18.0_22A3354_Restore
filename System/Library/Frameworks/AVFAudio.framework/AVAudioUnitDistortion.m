@implementation AVAudioUnitDistortion

- (AVAudioUnitDistortion)init
{
  AVAudioUnitDistortion *v2;
  AVAudioUnitDistortion *v3;
  objc_super v5;
  __int128 v6;
  int v7;

  v6 = xmmword_19B85A230;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)AVAudioUnitDistortion;
  v2 = -[AVAudioUnitEffect initWithAudioComponentDescription:](&v5, sel_initWithAudioComponentDescription_, &v6);
  v3 = v2;
  if (v2)
    -[AVAudioUnitDistortion loadFactoryPreset:](v2, "loadFactoryPreset:", 0);
  return v3;
}

- (AUPreset)FillOutAUPreset:(int64_t)a3
{
  int64_t v3;
  const __CFString *v4;
  AUPreset result;

  if ((unint64_t)a3 > 0x15)
  {
    v4 = 0;
    v3 = 0xFFFFFFFFLL;
  }
  else
  {
    v3 = a3;
    v4 = off_1E3BEB988[a3];
  }
  result.presetName = v4;
  result.presetNumber = v3;
  return result;
}

- (void)loadFactoryPreset:(AVAudioUnitDistortionPreset)preset
{
  uint64_t v5;
  _QWORD v6[2];
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super.super._impl);
  v6[0] = -[AVAudioUnitDistortion FillOutAUPreset:](self, "FillOutAUPreset:", preset);
  v6[1] = v5;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, _QWORD *, uint64_t))(*(_QWORD *)self->super.super.super._impl
                                                                             + 144))(self->super.super.super._impl, 36, 0, 0, v6, 16);
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
}

- (void)setPreGain:(float)preGain
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  *(float *)&v5 = preGain;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 14, v5);
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
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 15, v5);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (float)preGain
{
  float v3;
  float v4;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  -[AVAudioUnit valueForParam:](self, "valueForParam:", 14);
  v4 = v3;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v4;
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
  -[AVAudioUnit valueForParam:](self, "valueForParam:", 15);
  v4 = v3;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v4;
}

@end
