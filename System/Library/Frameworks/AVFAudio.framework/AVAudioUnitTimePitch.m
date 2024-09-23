@implementation AVAudioUnitTimePitch

- (AVAudioUnitTimePitch)init
{
  objc_super v3;
  __int128 v4;
  int v5;

  v4 = xmmword_19B85A1F0;
  v5 = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVAudioUnitTimePitch;
  return -[AVAudioUnitTimeEffect initWithAudioComponentDescription:](&v3, sel_initWithAudioComponentDescription_, &v4);
}

- (void)setRate:(float)rate
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  *(float *)&v5 = rate;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 0, v5);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (void)setPitch:(float)pitch
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  *(float *)&v5 = pitch;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 1, v5);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (void)setOverlap:(float)overlap
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  *(float *)&v5 = overlap;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 4, v5);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (float)rate
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

- (float)pitch
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

- (float)overlap
{
  float v3;
  float v4;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  -[AVAudioUnit valueForParam:](self, "valueForParam:", 4);
  v4 = v3;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v4;
}

@end
