@implementation AVAudioMixerNode

- (AVAudioMixerNode)init
{
  _QWORD *v3;
  objc_super v5;
  AudioComponentDescription v6;

  v3 = (_QWORD *)operator new();
  *(_OWORD *)&v6.componentType = xmmword_19B85A240;
  v6.componentFlagsMask = 0;
  AVAudioNodeImpl::AVAudioNodeImpl((uint64_t)v3, 0, &v6, 0);
  *v3 = &off_1E3BE83A8;
  v5.receiver = self;
  v5.super_class = (Class)AVAudioMixerNode;
  return -[AVAudioNode initWithImpl:](&v5, sel_initWithImpl_, v3);
}

- (void)setOutputVolume:(float)outputVolume
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  (*(void (**)(void *, _QWORD, uint64_t, _QWORD, float))(*(_QWORD *)self->super._impl + 128))(self->super._impl, 0, 2, 0, outputVolume);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (float)outputVolume
{
  float v3;
  float v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super._impl);
  v5 = 0.0;
  (*(void (**)(void *, _QWORD, uint64_t, _QWORD, float *))(*(_QWORD *)self->super._impl + 136))(self->super._impl, 0, 2, 0, &v5);
  v3 = v5;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v3;
}

- (void)setInputVolume:(float)a3 bus:(unint64_t)a4
{
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super._impl);
  (*(void (**)(void *, _QWORD, uint64_t, unint64_t, float))(*(_QWORD *)self->super._impl + 128))(self->super._impl, 0, 1, a4, a3);
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
}

- (void)setInputPan:(float)a3 bus:(unint64_t)a4
{
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super._impl);
  (*(void (**)(void *, uint64_t, uint64_t, unint64_t, float))(*(_QWORD *)self->super._impl + 128))(self->super._impl, 2, 1, a4, a3);
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
}

- (void)inputConnected:(unint64_t)a3
{
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  (*(void (**)(void *, _QWORD, uint64_t, unint64_t, float))(*(_QWORD *)self->super._impl + 128))(self->super._impl, 0, 1, a3, 1.0);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
}

- (AVAudioNodeBus)nextAvailableInputBus
{
  _QWORD *impl;
  AVAudioNodeBus v4;
  AVAudioNodeBus v5;
  uint64_t v6;
  std::recursive_mutex *v8;
  char v9;
  std::recursive_mutex *v10;
  char v11;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  impl = self->super._impl;
  v4 = impl[4];
  if (v4)
  {
    v5 = 0;
    v6 = impl[3];
    while (((*(_QWORD *)(v6 + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    {
      if (v4 == ++v5)
      {
        v5 = v4;
        break;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  if (v11)
    std::recursive_mutex::unlock(v10);
  if (v9)
    std::recursive_mutex::unlock(v8);
  return v5;
}

- (void)didAttachToEngine:(id)a3
{
  uint64_t v5;
  std::recursive_mutex *v6;
  std::recursive_mutex *v7;
  objc_super v8;

  v5 = objc_msgSend(a3, "implementation");
  v6 = (std::recursive_mutex *)((char *)self->super._impl + 104);
  v7 = (std::recursive_mutex *)(v5 + 112);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v6, (std::recursive_mutex *)(v5 + 112));
  v8.receiver = self;
  v8.super_class = (Class)AVAudioMixerNode;
  -[AVAudioNode didAttachToEngine:](&v8, sel_didAttachToEngine_, a3);
  (*(void (**)(void *, _QWORD, uint64_t, _QWORD, float))(*(_QWORD *)self->super._impl + 128))(self->super._impl, 0, 2, 0, 1.0);
  std::recursive_mutex::unlock(v6);
  std::recursive_mutex::unlock(v7);
}

@end
