@implementation AVAudioUnitDelay

- (AVAudioUnitDelay)init
{
  objc_super v3;
  __int128 v4;
  int v5;

  v4 = xmmword_19B85A1A0;
  v5 = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVAudioUnitDelay;
  return -[AVAudioUnitEffect initWithAudioComponentDescription:](&v3, sel_initWithAudioComponentDescription_, &v4);
}

- (void)setWetDryMix:(float)wetDryMix
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  *(float *)&v5 = wetDryMix;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 0, v5);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (void)setDelayTime:(NSTimeInterval)delayTime
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  *(float *)&v5 = delayTime;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 1, v5);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (void)setFeedback:(float)feedback
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  *(float *)&v5 = feedback;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 2, v5);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (void)setLowPassCutoff:(float)lowPassCutoff
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  *(float *)&v5 = lowPassCutoff;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 3, v5);
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

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  -[AVAudioUnit valueForParam:](self, "valueForParam:", 0);
  v4 = v3;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v4;
}

- (NSTimeInterval)delayTime
{
  float v3;
  float v4;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  -[AVAudioUnit valueForParam:](self, "valueForParam:", 1);
  v4 = v3;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v4;
}

- (float)feedback
{
  float v3;
  float v4;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  -[AVAudioUnit valueForParam:](self, "valueForParam:", 2);
  v4 = v3;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v4;
}

- (float)lowPassCutoff
{
  float v3;
  float v4;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  -[AVAudioUnit valueForParam:](self, "valueForParam:", 3);
  v4 = v3;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v4;
}

@end
