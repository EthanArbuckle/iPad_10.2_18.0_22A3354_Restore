@implementation AVAudioUnitSampler

- (AVAudioUnitSampler)init
{
  char v3[13];
  char v4;
  __int16 v5;
  int v6;

  strcpy(v3, "umuapmaslppa");
  v4 = 0;
  v5 = 0;
  v6 = 0;
  return -[AVAudioUnitSampler initWithAudioComponentDescription:](self, "initWithAudioComponentDescription:", v3);
}

- (AVAudioUnitSampler)initWithAudioComponentDescription:(AudioComponentDescription *)a3
{
  uint64_t v5;

  v5 = operator new();
  AVAudioNodeImpl::AVAudioNodeImpl(v5, 0, a3, 0);
  *(_QWORD *)v5 = &off_1E3BE8B00;
  *(_BYTE *)(v5 + 184) = 0;
  *(_QWORD *)(v5 + 192) = 0;
  return -[AVAudioNode initWithImpl:](self, "initWithImpl:", v5);
}

- (BOOL)loadInstrumentAtURL:(NSURL *)instrumentURL error:(NSError *)outError
{
  uint64_t v7;
  int v8;
  char v9;
  AVAudioUnitSamplerImpl *impl;
  const void *v11;
  std::recursive_mutex *v13;
  char v14;
  std::recursive_mutex *v15;
  char v16;
  NSURL *v17;
  char v18;
  __int16 v19;
  char v20;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->super.super.super._impl);
  if (-[NSString caseInsensitiveCompare:](-[NSURL pathExtension](instrumentURL, "pathExtension"), "caseInsensitiveCompare:", CFSTR("aupreset")))
  {
    if (-[NSString caseInsensitiveCompare:](-[NSURL pathExtension](instrumentURL, "pathExtension"), "caseInsensitiveCompare:", CFSTR("exs")))
    {
      if (-[NSString caseInsensitiveCompare:](-[NSURL pathExtension](instrumentURL, "pathExtension"), "caseInsensitiveCompare:", CFSTR("dls"))&& -[NSString caseInsensitiveCompare:](-[NSURL pathExtension](instrumentURL, "pathExtension"), "caseInsensitiveCompare:", CFSTR("sf2")))
      {
        LODWORD(v7) = -50;
        goto LABEL_16;
      }
      v8 = 1;
      v9 = 1;
    }
    else
    {
      v8 = 0;
      v9 = 4;
    }
  }
  else
  {
    v8 = 0;
    v9 = 2;
  }
  impl = (AVAudioUnitSamplerImpl *)self->super.super.super._impl;
  (*(void (**)(AVAudioUnitSamplerImpl *))(*(_QWORD *)impl + 32))(impl);
  v18 = v9;
  v17 = instrumentURL;
  v19 = 121;
  v20 = 0;
  v7 = (*(uint64_t (**)(AVAudioUnitSamplerImpl *, uint64_t, _QWORD, _QWORD, NSURL **, uint64_t))(*(_QWORD *)impl + 160))(impl, 4102, 0, 0, &v17, 16);
  if (!(_DWORD)v7)
  {
    if (v8)
    {
      AVAudioUnitSamplerImpl::SetSoundBankURL(impl, instrumentURL);
    }
    else
    {
      v11 = (const void *)*((_QWORD *)impl + 24);
      if (v11)
      {
        CFRelease(v11);
        *((_QWORD *)impl + 24) = 0;
      }
      *((_BYTE *)impl + 184) = 0;
    }
  }
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioUnitSampler.mm", 144, "-[AVAudioUnitSampler loadInstrumentAtURL:error:]", "error", v7, outError);
LABEL_16:
  if (v16)
    std::recursive_mutex::unlock(v15);
  if (v14)
    std::recursive_mutex::unlock(v13);
  return (_DWORD)v7 == 0;
}

- (BOOL)loadSoundBankInstrumentAtURL:(NSURL *)bankURL program:(uint8_t)program bankMSB:(uint8_t)bankMSB bankLSB:(uint8_t)bankLSB error:(NSError *)outError
{
  AVAudioUnitSamplerImpl *impl;
  uint64_t v14;
  std::recursive_mutex *v16;
  char v17;
  std::recursive_mutex *v18;
  char v19;
  NSURL *v20;
  char v21;
  uint8_t v22;
  uint8_t v23;
  uint8_t v24;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v16, (uint64_t)self->super.super.super._impl);
  impl = (AVAudioUnitSamplerImpl *)self->super.super.super._impl;
  v21 = 1;
  v23 = bankLSB;
  v22 = bankMSB;
  v20 = bankURL;
  v24 = program;
  v14 = (*(uint64_t (**)(AVAudioUnitSamplerImpl *, uint64_t, _QWORD, _QWORD, NSURL **, uint64_t))(*(_QWORD *)impl + 160))(impl, 4102, 0, 0, &v20, 16);
  if (!(_DWORD)v14)
    AVAudioUnitSamplerImpl::SetSoundBankURL(impl, bankURL);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioUnitSampler.mm", 157, "-[AVAudioUnitSampler loadSoundBankInstrumentAtURL:program:bankMSB:bankLSB:error:]", "error", v14, outError);
  if (v19)
    std::recursive_mutex::unlock(v18);
  if (v17)
    std::recursive_mutex::unlock(v16);
  return (_DWORD)v14 == 0;
}

- (BOOL)loadAudioFilesAtURLs:(NSArray *)audioFiles error:(NSError *)outError
{
  void *impl;
  uint64_t v8;
  int v9;
  std::recursive_mutex *v11;
  char v12;
  std::recursive_mutex *v13;
  char v14;
  NSArray *v15;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v11, (uint64_t)self->super.super.super._impl);
  impl = self->super.super.super._impl;
  v15 = audioFiles;
  v8 = (*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, NSArray **, uint64_t))(*(_QWORD *)impl + 160))(impl, 4101, 0, 0, &v15, 8);
  v9 = v8;
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioUnitSampler.mm", 167, "-[AVAudioUnitSampler loadAudioFilesAtURLs:error:]", "error", v8, outError);
  if (v14)
    std::recursive_mutex::unlock(v13);
  if (v12)
    std::recursive_mutex::unlock(v11);
  return v9 == 0;
}

- (float)stereoPan
{
  float v3;

  v3 = 0.0;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, float *))(*(_QWORD *)self->super.super.super._impl + 136))(self->super.super.super._impl, 903, 0, 0, &v3);
  return v3;
}

- (float)overallGain
{
  float v3;

  v3 = 0.0;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, float *))(*(_QWORD *)self->super.super.super._impl + 136))(self->super.super.super._impl, 900, 0, 0, &v3);
  return v3;
}

- (float)globalTuning
{
  uint64_t v4;

  v4 = 0;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, char *))(*(_QWORD *)self->super.super.super._impl + 136))(self->super.super.super._impl, 902, 0, 0, (char *)&v4 + 4);
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)self->super.super.super._impl + 136))(self->super.super.super._impl, 901, 0, 0, &v4);
  return *((float *)&v4 + 1) + (float)(*(float *)&v4 * 100.0);
}

- (void)setStereoPan:(float)stereoPan
{
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, float))(*(_QWORD *)self->super.super.super._impl + 128))(self->super.super.super._impl, 903, 0, 0, stereoPan);
}

- (void)setOverallGain:(float)overallGain
{
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, float))(*(_QWORD *)self->super.super.super._impl + 128))(self->super.super.super._impl, 900, 0, 0, overallGain);
}

- (void)setGlobalTuning:(float)globalTuning
{
  float v4;
  int v5;

  v4 = globalTuning / 100.0;
  v5 = (int)fmod(globalTuning, 100.0);
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, float))(*(_QWORD *)self->super.super.super._impl + 128))(self->super.super.super._impl, 901, 0, 0, (float)(int)v4);
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, float))(*(_QWORD *)self->super.super.super._impl + 128))(self->super.super.super._impl, 902, 0, 0, (float)v5);
}

@end
