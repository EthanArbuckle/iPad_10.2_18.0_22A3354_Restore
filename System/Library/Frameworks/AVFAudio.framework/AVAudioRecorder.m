@implementation AVAudioRecorder

- (AVAudioRecorder)init
{

  return 0;
}

- (AudioRecorderImpl)impl
{
  return (AudioRecorderImpl *)self->_impl;
}

- (void)finishedRecording:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1A1AC6084](self, a2);
  v5 = -[AVAudioRecorder delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "audioRecorderDidFinishRecording:successfully:", self, objc_msgSend(a3, "BOOLValue"));
  objc_autoreleasePoolPop(v4);

}

- (void)privSetDelegate:(id)a3
{
  AudioRecorderImpl *impl;

  impl = (AudioRecorderImpl *)self->_impl;
  if (!a3 || objc_loadWeak((id *)self->_impl) != a3)
  {
    objc_storeWeak(&impl->var0, a3);
    tryToSetRecorderSessionListener((uint64_t)self, impl);
  }
}

- (void)privCommonCleanup
{
  AVAudioRecorder *impl;

  impl = (AVAudioRecorder *)self->_impl;
  -[AVAudioRecorder privSetDelegate:](self, "privSetDelegate:", 0);
  __dmb(0xBu);
  -[AVAudioRecorder privRemoveSessionPropertyListeners](self, "privRemoveSessionPropertyListeners");
  stopAndDisposeRecordQueue(impl, (AudioRecorderImpl *)1);
  free(impl[12].super.isa);
  free(impl[11].super.isa);

  impl[15]._impl = 0;
  objc_storeWeak(&impl->_impl, 0);
}

- (void)privRemoveSessionPropertyListeners
{
  _QWORD *impl;
  void *v4;

  impl = self->_impl;
  if (*((_BYTE *)impl + 240))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CFF000], impl[31]);
  }
  *((_BYTE *)impl + 240) = 0;
}

- (void)finalize
{
  os_unfair_lock_s *v3;
  void *impl;
  objc_super v5;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  if (self->_impl)
    -[AVAudioRecorder privCommonCleanup](self, "privCommonCleanup");
  os_unfair_lock_unlock(v3);
  impl = self->_impl;
  if (impl)
  {
    free(impl);
    self->_impl = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioRecorder;
  -[AVAudioRecorder finalize](&v5, sel_finalize);
}

- (void)dealloc
{
  void *impl;
  void *v4;
  objc_super v5;

  impl = self->_impl;
  if (impl)
  {
    os_unfair_lock_lock((os_unfair_lock_t)impl + 64);
    -[AVAudioRecorder privCommonCleanup](self, "privCommonCleanup");

    os_unfair_lock_unlock((os_unfair_lock_t)impl + 64);
    v4 = self->_impl;
    if (v4)
    {
      free(v4);
      self->_impl = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioRecorder;
  -[AVAudioRecorder dealloc](&v5, sel_dealloc);
}

- (id)baseInit
{
  AudioRecorderImpl *v3;
  void *v4;
  id v5;

  v3 = (AudioRecorderImpl *)malloc_type_calloc(1uLL, 0x108uLL, 0x10B00404ABBA035uLL);
  self->_impl = v3;
  objc_storeWeak(&v3->var1, self);
  v3->var3 = 0;
  v3->var4 = 0;
  v3->var2 = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v3->var33 = v4;
  v5 = v4;
  tryToSetRecorderSessionListener((uint64_t)self, v3);
  return self;
}

- (AVAudioRecorder)initWithURL:(NSURL *)url format:(AVAudioFormat *)format error:(NSError *)outError
{
  if (!outError)
  {
    if (!format)
      goto LABEL_6;
    return -[AVAudioRecorder initWithURL:settings:error:](self, "initWithURL:settings:error:", url, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", -[AVAudioFormat settings](format, "settings")), outError);
  }
  *outError = 0;
  if (format)
    return -[AVAudioRecorder initWithURL:settings:error:](self, "initWithURL:settings:error:", url, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", -[AVAudioFormat settings](format, "settings")), outError);
  *outError = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
LABEL_6:

  return 0;
}

- (AVAudioRecorder)initWithURL:(NSURL *)url settings:(NSDictionary *)settings error:(NSError *)outError
{
  AVAudioRecorder *v8;
  char *impl;
  NSURL *v10;
  NSDictionary *v11;
  id v12;
  int v13;
  int v14;

  v8 = self;
  if (outError)
    *outError = 0;
  -[AVAudioRecorder baseInit](self, "baseInit");
  impl = (char *)v8->_impl;
  *((_QWORD *)impl + 5) = url;
  v10 = url;
  *((_QWORD *)impl + 2) = settings;
  v11 = settings;
  v12 = -[NSDictionary objectForKey:](settings, "objectForKey:", CFSTR("AVAudioFileTypeKey"));
  if (v12)
    v13 = objc_msgSend(v12, "unsignedIntValue");
  else
    v13 = fileTypeFromExtension(-[NSString pathExtension](-[NSURL path](url, "path"), "pathExtension"));
  *((_DWORD *)impl + 14) = v13;
  v14 = asbdFromSettingsAndFileType2(settings, 0, v13, (AudioStreamBasicDescription *)(impl + 64));
  if (v14)
  {
    if (outError)
      *outError = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);

    return 0;
  }
  return v8;
}

- (BOOL)isRecording
{
  AVAudioRecorder *v2;
  os_unfair_lock_s *v3;

  v2 = self;
  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = *((_BYTE *)v2->_impl + 186);
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (NSURL)url
{
  os_unfair_lock_s *v3;
  NSURL *v4;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (NSURL *)*((_QWORD *)self->_impl + 5);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (NSDictionary)settings
{
  os_unfair_lock_s *v3;
  NSDictionary *v4;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (NSDictionary *)*((_QWORD *)self->_impl + 3);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (AVAudioFormat)format
{
  os_unfair_lock_s *v3;
  AVAudioFormat *v4;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (AVAudioFormat *)*((_QWORD *)self->_impl + 4);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (BOOL)prepareToRecord
{
  AVAudioRecorder *v2;
  os_unfair_lock_s *v3;

  v2 = self;
  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = prepareToRecordQueue(v2, (AudioFileID *)v2->_impl) == 0;
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (BOOL)record
{
  AVAudioRecorder *v2;
  os_unfair_lock_s *v3;

  v2 = self;
  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = recordQueue(v2, (AudioFileID *)v2->_impl, -1.0, 0) == 0;
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (BOOL)recordAtTime:(NSTimeInterval)time
{
  AVAudioRecorder *v3;
  os_unfair_lock_s *v4;
  AudioTimeStamp v6;

  v3 = self;
  v6.mSampleTime = 0.0;
  memset(&v6.mRateScalar, 0, 48);
  v6.mFlags = 2;
  v6.mHostTime = (unint64_t)(time * 24000000.0);
  v4 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v4);
  LOBYTE(v3) = recordQueue(v3, (AudioFileID *)v3->_impl, -1.0, &v6) == 0;
  os_unfair_lock_unlock(v4);
  return (char)v3;
}

- (BOOL)recordForDuration:(NSTimeInterval)duration
{
  AVAudioRecorder *v4;
  os_unfair_lock_s *v5;

  v4 = self;
  v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  LOBYTE(v4) = recordQueue(v4, (AudioFileID *)v4->_impl, duration, 0) == 0;
  os_unfair_lock_unlock(v5);
  return (char)v4;
}

- (BOOL)recordAtTime:(NSTimeInterval)time forDuration:(NSTimeInterval)duration
{
  AVAudioRecorder *v5;
  os_unfair_lock_s *v6;
  AudioTimeStamp v8;

  v5 = self;
  v8.mSampleTime = 0.0;
  memset(&v8.mRateScalar, 0, 48);
  v8.mFlags = 2;
  v8.mHostTime = (unint64_t)(time * 24000000.0);
  v6 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v6);
  LOBYTE(v5) = recordQueue(v5, (AudioFileID *)v5->_impl, duration, &v8) == 0;
  os_unfair_lock_unlock(v6);
  return (char)v5;
}

- (void)pause
{
  os_unfair_lock_s *v3;
  AudioQueueRef *impl;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = (AudioQueueRef *)self->_impl;
  if (*((_BYTE *)impl + 186))
  {
    AudioQueuePause(impl[14]);
    *((_BYTE *)impl + 186) = 0;
  }
  os_unfair_lock_unlock(v3);
}

- (void)stop
{
  os_unfair_lock_s *v3;
  AVAudioRecorder *impl;
  uint64_t v5;
  AVAudioRecorder *v6;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = (AVAudioRecorder *)self->_impl;
  if (stopAndDisposeRecordQueue(impl, (AudioRecorderImpl *)1))
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", BYTE4(impl[11]._impl));
    v6 = self;
    -[AVAudioRecorder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_finishedRecording_, v5, 0);
  }
  os_unfair_lock_unlock(v3);
}

- (BOOL)deleteRecording
{
  os_unfair_lock_s *v3;
  void *impl;
  uint64_t v5;
  id v7;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = self->_impl;
  if (*((_BYTE *)impl + 184))
    goto LABEL_2;
  v5 = objc_msgSend(*((id *)impl + 5), "path");
  if (!v5)
    goto LABEL_3;
  if (!*((_BYTE *)impl + 189))
  {
LABEL_2:
    LOBYTE(v5) = 0;
  }
  else
  {
    v7 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v5, &v7);
    LOBYTE(v5) = v7 == 0;
    if (v7)

    else
      *((_BYTE *)impl + 189) = 0;
  }
LABEL_3:
  os_unfair_lock_unlock(v3);
  return v5;
}

- (NSTimeInterval)currentTime
{
  os_unfair_lock_s *v3;
  void *impl;
  double v5;
  OpaqueAudioQueue *v6;
  NSTimeInterval v7;
  AudioTimeStamp v9;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = self->_impl;
  v5 = *((double *)impl + 8);
  v6 = (OpaqueAudioQueue *)*((_QWORD *)impl + 14);
  if (v6 && !AudioQueueGetCurrentTime(v6, 0, &v9, 0))
    *((_QWORD *)impl + 18) = *(_QWORD *)&v9.mSampleTime;
  v7 = *((double *)impl + 18) / v5;
  os_unfair_lock_unlock(v3);
  return v7;
}

- (NSTimeInterval)deviceCurrentTime
{
  return (double)mach_absolute_time() * 0.0000000416666667;
}

- (id)delegate
{
  os_unfair_lock_s *v3;
  id Weak;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  Weak = objc_loadWeak((id *)self->_impl);
  os_unfair_lock_unlock(v3);
  return Weak;
}

- (void)setDelegate:(id)delegate
{
  os_unfair_lock_s *v5;

  v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  -[AVAudioRecorder privSetDelegate:](self, "privSetDelegate:", delegate);
  os_unfair_lock_unlock(v5);
}

- (BOOL)isMeteringEnabled
{
  AVAudioRecorder *v2;
  os_unfair_lock_s *v3;

  v2 = self;
  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = *((_BYTE *)v2->_impl + 190);
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (void)setMeteringEnabled:(BOOL)meteringEnabled
{
  _BOOL4 v3;
  os_unfair_lock_s *v5;
  void *impl;
  OpaqueAudioQueue *v7;
  _BOOL4 inData;

  v3 = meteringEnabled;
  v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = self->_impl;
  *((_BYTE *)impl + 190) = v3;
  v7 = (OpaqueAudioQueue *)*((_QWORD *)impl + 14);
  if (v7)
  {
    inData = v3;
    if (!AudioQueueSetProperty(v7, 0x61716D65u, &inData, 4u))
      *((_BYTE *)impl + 190) = v3;
  }
  os_unfair_lock_unlock(v5);
}

- (void)updateMeters
{
  os_unfair_lock_s *v3;
  unsigned int *impl;
  uint64_t v5;
  void *v6;
  OpaqueAudioQueue *v7;
  BOOL v8;
  void *v9;
  size_t v10;
  UInt32 ioDataSize;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = (unsigned int *)self->_impl;
  v5 = impl[23];
  v6 = (void *)*((_QWORD *)impl + 24);
  if (!v6)
  {
    v6 = malloc_type_calloc(impl[23], 8uLL, 0x100004000313F17uLL);
    *((_QWORD *)impl + 24) = v6;
  }
  v7 = (OpaqueAudioQueue *)*((_QWORD *)impl + 14);
  if (v7 && *((_BYTE *)impl + 190))
  {
    ioDataSize = 8 * v5;
    if (AudioQueueGetProperty(v7, 0x61716D64u, v6, &ioDataSize))
      v8 = (_DWORD)v5 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = (void *)*((_QWORD *)impl + 24);
      v10 = 8 * v5;
LABEL_12:
      memset_pattern16(v9, &unk_19B85A350, v10);
    }
  }
  else if ((_DWORD)v5)
  {
    v10 = 8 * v5;
    v9 = v6;
    goto LABEL_12;
  }
  os_unfair_lock_unlock(v3);
}

- (float)peakPowerForChannel:(NSUInteger)channelNumber
{
  os_unfair_lock_s *v5;
  _QWORD *impl;
  uint64_t v7;
  float v8;

  v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = self->_impl;
  v7 = impl[24];
  if (v7 && *((unsigned int *)impl + 23) > channelNumber)
    v8 = *(float *)(v7 + 8 * channelNumber + 4);
  else
    v8 = -160.0;
  os_unfair_lock_unlock(v5);
  return v8;
}

- (float)averagePowerForChannel:(NSUInteger)channelNumber
{
  os_unfair_lock_s *v5;
  _QWORD *impl;
  uint64_t v7;
  float v8;

  v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = self->_impl;
  v7 = impl[24];
  if (v7 && *((unsigned int *)impl + 23) > channelNumber)
    v8 = *(float *)(v7 + 8 * channelNumber);
  else
    v8 = -160.0;
  os_unfair_lock_unlock(v5);
  return v8;
}

- (void)beginInterruption
{
  void *v3;

  v3 = (void *)MEMORY[0x1A1AC6084](self, a2);
  objc_msgSend(-[AVAudioRecorder delegate](self, "delegate"), "audioRecorderBeginInterruption:", self);
  objc_autoreleasePoolPop(v3);
}

- (void)endInterruptionWithFlags:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1A1AC6084](self, a2);
  v5 = -[AVAudioRecorder delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "audioRecorderEndInterruption:withOptions:", self, objc_msgSend(a3, "unsignedIntegerValue"));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "audioRecorderEndInterruption:withFlags:", self, objc_msgSend(a3, "unsignedIntegerValue"));
  }
  objc_autoreleasePoolPop(v4);

}

- (void)endInterruption
{
  void *v3;

  v3 = (void *)MEMORY[0x1A1AC6084](self, a2);
  objc_msgSend(-[AVAudioRecorder delegate](self, "delegate"), "audioRecorderEndInterruption:", self);
  objc_autoreleasePoolPop(v3);
}

- (NSArray)channelAssignments
{
  os_unfair_lock_s *v3;
  NSArray *v4;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (NSArray *)*((_QWORD *)self->_impl + 6);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)setChannelAssignments:(NSArray *)channelAssignments
{
  os_unfair_lock_s *v5;
  AudioRecorderImpl *impl;
  NSArray *var6;
  uint64_t v8;
  _DWORD *v9;
  void *v10;
  uint64_t v11;
  _DWORD *v12;
  id v13;

  v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = (AudioRecorderImpl *)self->_impl;
  var6 = (NSArray *)impl->var6;
  if (var6 != channelAssignments)
  {
    impl->var6 = (id)-[NSArray copy](channelAssignments, "copy");
    if (var6)

    makeChannelAssignments(impl);
    if (impl->var10)
    {
      v8 = objc_msgSend(impl->var6, "count");
      v9 = malloc_type_malloc(16 * v8, 0x902FE7C0uLL);
      v10 = v9;
      if (v8)
      {
        v11 = 0;
        v12 = v9 + 2;
        do
        {
          v13 = -[NSArray objectAtIndex:](channelAssignments, "objectAtIndex:", v11);
          *((_QWORD *)v12 - 1) = objc_msgSend(v13, "owningPortUID");
          *v12 = objc_msgSend(v13, "channelNumber");
          v12 += 4;
          ++v11;
        }
        while (v8 != v11);
      }
      AudioQueueSetProperty(impl->var10, 0x61716361u, v10, 16 * v8);
      free(v10);
    }
  }
  os_unfair_lock_unlock(v5);
}

- (void)setProcessToTap:(int)a3
{
  os_unfair_lock_s *v5;

  v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  *((_DWORD *)self->_impl + 61) = a3;
  os_unfair_lock_unlock(v5);
}

- (int)processToTap
{
  AVAudioRecorder *v2;
  os_unfair_lock_s *v3;

  v2 = self;
  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LODWORD(v2) = *((_DWORD *)v2->_impl + 61);
  os_unfair_lock_unlock(v3);
  return (int)v2;
}

- (AVAudioSession)audioSession
{
  os_unfair_lock_s *v3;
  AVAudioSession *v4;

  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (AVAudioSession *)*((id *)self->_impl + 31);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)setAudioSession:(id)a3
{
  id v5;
  os_unfair_lock_s *v6;
  AudioRecorderImpl *impl;

  v5 = a3;
  -[AVAudioRecorder stop](self, "stop");
  v6 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v6);
  -[AVAudioRecorder privRemoveSessionPropertyListeners](self, "privRemoveSessionPropertyListeners");
  impl = (AudioRecorderImpl *)self->_impl;

  impl->var33 = a3;
  tryToSetRecorderSessionListener((uint64_t)self, impl);
  os_unfair_lock_unlock(v6);
}

- (BOOL)instantaneousMetering
{
  AVAudioRecorder *v2;
  os_unfair_lock_s *v3;

  v2 = self;
  v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = *((_BYTE *)v2->_impl + 191);
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (void)setInstantaneousMetering:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *v5;
  void *impl;
  OpaqueAudioQueue *v7;
  _BOOL4 inData;

  v3 = a3;
  v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = self->_impl;
  *((_BYTE *)impl + 191) = v3;
  v7 = (OpaqueAudioQueue *)*((_QWORD *)impl + 14);
  if (v7)
  {
    inData = v3;
    AudioQueueSetProperty(v7, 0x71696E6Du, &inData, 4u);
  }
  os_unfair_lock_unlock(v5);
}

- (void)handleInterruption:(id)a3
{
  void *v4;
  void *v5;
  os_unfair_lock_s *v6;
  AVAudioRecorder *impl;
  void *v8;
  AudioRecorderImpl *v9;
  void *v10;
  _BOOL8 v11;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFF030]);
  v6 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v6);
  impl = (AVAudioRecorder *)self->_impl;
  v8 = (void *)MEMORY[0x1A1AC6084]();
  objc_loadWeak((id *)&impl->super.isa);
  if (v5 && objc_msgSend(v5, "unsignedLongValue") == 1)
  {
    if (BYTE2(impl[11]._impl))
    {
      closeFile((uint64_t)impl, v9);
      BYTE1(impl[15].super.isa) = 1;
      LOWORD(impl[11]._impl) = 0;
      BYTE2(impl[11]._impl) = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[AVAudioRecorder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_beginInterruption, 0, 0);
    }
  }
  else if (BYTE1(impl[15].super.isa))
  {
    objc_msgSend(impl[15]._impl, "setActive:error:", 1, 0);
    stopAndDisposeRecordQueue(impl, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFF010]);
      if (v10)
        v11 = objc_msgSend(v10, "unsignedLongValue") == 1;
      else
        v11 = 0;
      -[AVAudioRecorder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_endInterruptionWithFlags_, objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v11), 0);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AVAudioRecorder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_endInterruption, 0, 0);
    }
    BYTE1(impl[15].super.isa) = 0;
  }
  objc_autoreleasePoolPop(v8);
  os_unfair_lock_unlock(v6);
}

@end
