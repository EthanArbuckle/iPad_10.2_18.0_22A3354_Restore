@implementation AVAudioUnitEQ

- (AVAudioUnitEQ)init
{
  return -[AVAudioUnitEQ initWithNumberOfBands:](self, "initWithNumberOfBands:", 16);
}

- (AVAudioUnitEQ)initWithNumberOfBands:(NSUInteger)numberOfBands
{
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t i;
  AVAudioUnitEQFilterParameters *v8;
  uint64_t v9;
  AVAudioUnitEQ *v10;
  AVAudioUnitEQ *v11;
  objc_super v13;
  int v14;
  AudioComponentDescription v15;

  if (numberOfBands >= 0x3E8)
    v4 = 999;
  else
    v4 = numberOfBands;
  v14 = v4;
  v5 = (_QWORD *)operator new();
  *(_OWORD *)&v15.componentType = xmmword_19B85A260;
  v15.componentFlagsMask = 0;
  AVAudioNodeImpl::AVAudioNodeImpl((uint64_t)v5, 0, &v15, 0);
  *v5 = &off_1E3BE7718;
  v5[23] = 0;
  v6 = (void *)operator new[]();
  bzero(v6, 8 * v4);
  if ((_DWORD)v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v8 = [AVAudioUnitEQFilterParameters alloc];
      v9 = operator new();
      *(_QWORD *)v9 = &off_1E3BE9698;
      *(_QWORD *)(v9 + 8) = v5;
      *(_QWORD *)(v9 + 16) = (*(uint64_t (**)(_QWORD *))(*v5 + 40))(v5);
      *(_DWORD *)(v9 + 24) = i;
      *((_QWORD *)v6 + i) = -[AVAudioUnitEQFilterParameters initWithImpl:](v8, "initWithImpl:", v9);
    }
  }
  v5[23] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v6, v4);
  MEMORY[0x1A1AC5BBC](v6, 0x80C80B8603338);
  v13.receiver = self;
  v13.super_class = (Class)AVAudioUnitEQ;
  v10 = -[AVAudioNode initWithImpl:](&v13, sel_initWithImpl_, v5);
  v11 = v10;
  if (v10)
  {
    (*(void (**)(void *, uint64_t, _QWORD, _QWORD, int *, uint64_t))(*(_QWORD *)v10->super.super.super._impl
                                                                            + 144))(v10->super.super.super._impl, 2201, 0, 0, &v14, 4);
    (*(void (**)(void *, uint64_t, _QWORD, _QWORD, int *, uint64_t))(*(_QWORD *)v11->super.super.super._impl
                                                                            + 144))(v11->super.super.super._impl, 2200, 0, 0, &v14, 4);
  }
  return v11;
}

- (NSArray)bands
{
  NSArray *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super.super.super._impl);
  v3 = (NSArray *)*((_QWORD *)self->super.super.super._impl + 23);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (float)globalGain
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

- (void)setGlobalGain:(float)globalGain
{
  double v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  *(float *)&v5 = globalGain;
  -[AVAudioUnit setValue:forParam:](self, "setValue:forParam:", 0, v5);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

@end
