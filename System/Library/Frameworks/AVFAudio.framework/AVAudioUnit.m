@implementation AVAudioUnit

- (AVAudioUnit)initWithAudioComponentDescription:(AudioComponentDescription *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)operator new();
  AVAudioNodeImpl::AVAudioNodeImpl((uint64_t)v5, 0, a3, 0);
  *v5 = &off_1E3BE6C98;
  return -[AVAudioNode initWithImpl:](self, "initWithImpl:", v5);
}

- (BOOL)loadAudioUnitPresetAtURL:(NSURL *)url error:(NSError *)outError
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSError *v10;
  BOOL result;
  AudioUnitParameter v12;
  uint64_t v13;

  if (outError)
    *outError = 0;
  v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", url);
  if (!v13)
  {
    if (outError)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2F90];
      v8 = -50;
      goto LABEL_9;
    }
    return 0;
  }
  v6 = (*(uint64_t (**)(void *, _QWORD, _QWORD, _QWORD, uint64_t *, uint64_t))(*(_QWORD *)self->super._impl
                                                                                     + 160))(self->super._impl, 0, 0, 0, &v13, 8);
  if (v6)
  {
    if (outError)
    {
      v7 = *MEMORY[0x1E0CB2F90];
      v8 = v6;
      v9 = (void *)MEMORY[0x1E0CB35C8];
LABEL_9:
      v10 = (NSError *)objc_msgSend(v9, "errorWithDomain:code:userInfo:", v7, v8, 0);
      result = 0;
      *outError = v10;
      return result;
    }
    return 0;
  }
  v12.mAudioUnit = -[AVAudioUnit audioUnit](self, "audioUnit");
  v12.mParameterID = -1;
  AUParameterListenerNotify(0, 0, &v12);
  return 1;
}

- (AudioUnit)audioUnit
{
  OpaqueAudioComponentInstance *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(void *))(*(_QWORD *)self->super._impl + 224))(self->super._impl);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (AudioComponentDescription)audioComponentDescription
{
  AudioComponentDescription *result;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super._impl);
  result = (AudioComponentDescription *)(*(uint64_t (**)(void *))(*(_QWORD *)self->super._impl + 256))(self->super._impl);
  *retstr = *result;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return result;
}

- (NSString)name
{
  uint64_t v3;
  __int128 v4;
  OpaqueAudioComponent *Next;
  void *v6;
  CFStringRef outName;
  AudioComponentDescription inDesc;
  std::recursive_mutex *v10;
  char v11;
  std::recursive_mutex *v12;
  char v13;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)self->super._impl + 256))(self->super._impl);
  v4 = *(_OWORD *)v3;
  inDesc.componentFlagsMask = *(_DWORD *)(v3 + 16);
  *(_OWORD *)&inDesc.componentType = v4;
  Next = AudioComponentFindNext(0, &inDesc);
  if (Next && (outName = 0, AudioComponentCopyName(Next, &outName), outName))
  {
    v6 = (void *)-[__CFString componentsSeparatedByString:]((id)outName, "componentsSeparatedByString:", CFSTR(": "));
    CFRelease(outName);
    if (v6)
      v6 = (void *)objc_msgSend(v6, "objectAtIndex:", 1);
  }
  else
  {
    v6 = 0;
  }
  if (v13)
    std::recursive_mutex::unlock(v12);
  if (v11)
    std::recursive_mutex::unlock(v10);
  return (NSString *)v6;
}

- (NSString)manufacturerName
{
  uint64_t v3;
  __int128 v4;
  OpaqueAudioComponent *Next;
  void *v6;
  CFStringRef outName;
  AudioComponentDescription inDesc;
  std::recursive_mutex *v10;
  char v11;
  std::recursive_mutex *v12;
  char v13;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)self->super._impl + 256))(self->super._impl);
  v4 = *(_OWORD *)v3;
  inDesc.componentFlagsMask = *(_DWORD *)(v3 + 16);
  *(_OWORD *)&inDesc.componentType = v4;
  Next = AudioComponentFindNext(0, &inDesc);
  if (Next && (outName = 0, AudioComponentCopyName(Next, &outName), outName))
  {
    v6 = (void *)-[__CFString componentsSeparatedByString:]((id)outName, "componentsSeparatedByString:", CFSTR(": "));
    CFRelease(outName);
    if (v6)
      v6 = (void *)objc_msgSend(v6, "objectAtIndex:", 0);
  }
  else
  {
    v6 = 0;
  }
  if (v13)
    std::recursive_mutex::unlock(v12);
  if (v11)
    std::recursive_mutex::unlock(v10);
  return (NSString *)v6;
}

- (NSUInteger)version
{
  uint64_t v3;
  __int128 v4;
  OpaqueAudioComponent *Next;
  NSUInteger v6;
  AudioComponentDescription v8;
  UInt32 outVersion;
  std::recursive_mutex *v10;
  char v11;
  std::recursive_mutex *v12;
  char v13;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  outVersion = 0;
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)self->super._impl + 256))(self->super._impl);
  v4 = *(_OWORD *)v3;
  v8.componentFlagsMask = *(_DWORD *)(v3 + 16);
  *(_OWORD *)&v8.componentType = v4;
  Next = AudioComponentFindNext(0, &v8);
  if (Next)
  {
    AudioComponentGetVersion(Next, &outVersion);
    v6 = outVersion;
  }
  else
  {
    v6 = 0;
  }
  if (v13)
    std::recursive_mutex::unlock(v12);
  if (v11)
    std::recursive_mutex::unlock(v10);
  return v6;
}

- (BOOL)setValue:(float)a3 forParam:(unsigned int)a4
{
  uint64_t v4;
  char v7;
  std::recursive_mutex *v9;
  char v10;
  std::recursive_mutex *v11;
  char v12;

  v4 = *(_QWORD *)&a4;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super._impl);
  v7 = (*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, float))(*(_QWORD *)self->super._impl + 128))(self->super._impl, v4, 0, 0, a3);
  if (v12)
    std::recursive_mutex::unlock(v11);
  if (v10)
    std::recursive_mutex::unlock(v9);
  return v7;
}

- (float)valueForParam:(unsigned int)a3
{
  uint64_t v3;
  float v5;
  float v7;
  std::recursive_mutex *v8;
  char v9;
  std::recursive_mutex *v10;
  char v11;

  v3 = *(_QWORD *)&a3;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  v7 = 0.0;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, float *))(*(_QWORD *)self->super._impl + 136))(self->super._impl, v3, 0, 0, &v7);
  v5 = v7;
  if (v11)
    std::recursive_mutex::unlock(v10);
  if (v9)
    std::recursive_mutex::unlock(v8);
  return v5;
}

+ (void)instantiateWithComponentDescription:(AudioComponentDescription *)audioComponentDescription options:(AudioComponentInstantiationOptions)options completionHandler:(void *)completionHandler
{
  uint64_t v8;
  OpaqueAudioComponent *Next;
  _QWORD inCompletionHandler[6];
  __int128 v11;
  UInt32 componentFlagsMask;

  v8 = objc_opt_class();
  Next = AudioComponentFindNext(0, audioComponentDescription);
  if (Next)
  {
    inCompletionHandler[0] = MEMORY[0x1E0C809B0];
    inCompletionHandler[1] = 3221225472;
    inCompletionHandler[2] = __77__AVAudioUnit_instantiateWithComponentDescription_options_completionHandler___block_invoke;
    inCompletionHandler[3] = &unk_1E3BECF30;
    v11 = *(_OWORD *)&audioComponentDescription->componentType;
    componentFlagsMask = audioComponentDescription->componentFlagsMask;
    inCompletionHandler[4] = v8;
    inCompletionHandler[5] = completionHandler;
    AudioComponentInstantiate(Next, options, inCompletionHandler);
  }
  else
  {
    (*((void (**)(void *, _QWORD, uint64_t))completionHandler + 2))(completionHandler, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -3000, 0));
  }
}

void __77__AVAudioUnit_instantiateWithComponentDescription_options_completionHandler___block_invoke(uint64_t a1, OpaqueAudioComponentInstance *a2, int a3)
{
  _QWORD *v5;
  id v6;

  if (a2)
  {
    v5 = (_QWORD *)operator new();
    AVAudioNodeImpl::AVAudioNodeImpl((uint64_t)v5, a2, (const AudioComponentDescription *)(a1 + 48), 0);
    *v5 = &off_1E3BE6C98;
    v6 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithImpl:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, 0));
  }
}

@end
