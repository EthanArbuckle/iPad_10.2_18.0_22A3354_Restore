@implementation AVAudioClock

- (AVAudioClock)init
{
  AVAudioClock *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioClock;
  v2 = -[AVAudioClock init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_QWORD *)(v3 + 96) = 0;
    *(_BYTE *)(v3 + 104) = 0;
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(_OWORD *)(v3 + 64) = 0u;
    *(_OWORD *)(v3 + 76) = 0u;
    v2->_impl = (void *)v3;
  }
  return v2;
}

- (AVAudioClock)initWithNode:(void *)a3
{
  AVAudioClock *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v11.receiver = self;
  v11.super_class = (Class)AVAudioClock;
  v4 = -[AVAudioClock init](&v11, sel_init);
  if (v4)
  {
    v5 = operator new();
    v6 = (_QWORD *)v5;
    *(_QWORD *)v5 = a3;
    *(_OWORD *)(v5 + 8) = 0u;
    v7 = (_QWORD *)(v5 + 8);
    *(_QWORD *)(v5 + 96) = 0;
    *(_BYTE *)(v5 + 104) = 0;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_DWORD *)(v5 + 88) = 0;
    if (a3)
    {
      v13[0] = AVAudioClockImpl::RenderCallback;
      v13[1] = v5;
      (*(void (**)(void *, _QWORD *))(*(_QWORD *)a3 + 168))(a3, v13);
      v8 = *v6;
      v12[0] = AVAudioClockImpl::StreamFormatListener;
      v12[1] = v6;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v8 + 200))(v8, v12);
      objc_msgSend((id)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)*v6 + 56))(*v6, 0, 0), "sampleRate");
      *v7 = v9;
    }
    v4->_impl = v6;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t *impl;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  _QWORD v8[2];
  _QWORD v9[2];

  impl = (uint64_t *)self->_impl;
  if (impl)
  {
    v4 = *impl;
    if (*impl)
    {
      v9[0] = AVAudioClockImpl::RenderCallback;
      v9[1] = impl;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 176))(v4, v9);
      v5 = *impl;
      v8[0] = AVAudioClockImpl::StreamFormatListener;
      v8[1] = impl;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 208))(v5, v8);
    }
    v6 = impl[12];
    if (v6)
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
    MEMORY[0x1A1AC5BD4](impl, 0x1020C40C17CD2A5);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVAudioClock;
  -[AVAudioClock dealloc](&v7, sel_dealloc);
}

- (AVAudioTime)currentTime
{
  return AVAudioClockImpl::CurrentTime((AVAudioClockImpl *)self->_impl);
}

- (AudioTimeStamp)currentAudioTimeStamp
{
  int v4;
  UInt64 mHostTime;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  unint64_t v9;

  v4 = 0;
  mHostTime = self->mHostTime;
  while (1)
  {
    v6 = atomic_load((unint64_t *)(mHostTime + 16));
    if ((v6 & 1) == 0)
    {
      v7 = *(_OWORD *)(mHostTime + 40);
      *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)(mHostTime + 24);
      *(_OWORD *)&retstr->mRateScalar = v7;
      v8 = *(_OWORD *)(mHostTime + 72);
      *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)(mHostTime + 56);
      *(_OWORD *)&retstr->mSMPTETime.mHours = v8;
      v9 = atomic_load((unint64_t *)(mHostTime + 16));
      if (v6 == v9)
        break;
    }
    if (++v4 == 5)
    {
      self = (AudioTimeStamp *)sched_yield();
      v4 = 0;
    }
  }
  return self;
}

- (int64_t)currentIONumberFrames
{
  return atomic_load((unsigned int *)self->_impl + 22);
}

- (id)awaitIOCycle:(unsigned int *)a3
{
  uint64_t *impl;
  uint64_t v5;
  char v6;
  unsigned int v7;
  id *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  _DWORD *exception;
  uint8_t v15[16];

  impl = (uint64_t *)self->_impl;
  v5 = *impl;
  if (*impl
    && !*(_BYTE *)(v5 + 72)
    && (v9 = *(id **)(v5 + 8)) != 0
    && *v9
    && (objc_msgSend(*v9, "isInManualRenderingMode") & 1) == 0)
  {
    v10 = impl[12];
    if (!v10)
    {
      v10 = operator new();
      CADeprecated::CAMutex::CAMutex((CADeprecated::CAMutex *)v10, "");
      *(_QWORD *)v10 = &off_1E3BE9A10;
      v11 = pthread_cond_init((pthread_cond_t *)(v10 + 88), 0);
      if (v11)
      {
        v13 = v11;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_error_impl(&dword_19B733000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, " CAGuard::CAGuard: Could not init the cond var", v15, 2u);
        }
        exception = __cxa_allocate_exception(0x10uLL);
        *(_QWORD *)exception = &off_1E3BE6270;
        exception[2] = v13;
      }
      impl[12] = v10;
    }
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10);
    *((_BYTE *)impl + 104) = 1;
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v10 + 64))(v10, 5000000000);
    *((_BYTE *)impl + 104) = 0;
    if (v12)
      (*(void (**)(uint64_t))(*(_QWORD *)v10 + 24))(v10);
  }
  else
  {
    v6 = 0;
  }
  if (a3)
  {
    v7 = atomic_load((unsigned int *)impl + 22);
    *a3 = v7;
  }
  if ((v6 & 1) != 0)
    return 0;
  else
    return AVAudioClockImpl::CurrentTime((AVAudioClockImpl *)impl);
}

@end
