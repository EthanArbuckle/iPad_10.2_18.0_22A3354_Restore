@implementation AVAudioPlayer

- (AVAudioPlayer)initWithContentsOfURL:(NSURL *)url fileTypeHint:(NSString *)utiString error:(NSError *)outError
{
  AVAudioPlayer *v8;
  AVAudioPlayer *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  AudioPlayerImpl *impl;
  NSURL *v14;
  AVAudioPlayerCpp *v15;
  AudioFileTypeID v16;
  void *localPlayer;
  OSStatus v18;
  AVAudioPlayer *v19;
  _QWORD *v21;

  v8 = -[AVAudioPlayer initBase](self, "initBase");
  v9 = v8;
  if (v8)
  {
    if (outError)
    {
      *outError = 0;
      if (!url)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v11 = *MEMORY[0x1E0CB2F90];
        v12 = -10875;
LABEL_10:
        *outError = (NSError *)objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, 0);
        goto LABEL_11;
      }
    }
    else if (!url)
    {
LABEL_11:
      v19 = v9;
      return 0;
    }
    impl = (AudioPlayerImpl *)v8->_impl;
    impl->_url = url;
    v14 = url;
    v15 = (AVAudioPlayerCpp *)operator new();
    AVAudioPlayerCpp::AVAudioPlayerCpp(v15);
    impl->_localPlayer = v15;
    tryToSetPlayerSessionListener(v9);
    v16 = UTItoFileType(utiString);
    localPlayer = impl->_localPlayer;
    *((_OWORD *)localPlayer + 13) = xmmword_19B85A200;
    *((_OWORD *)localPlayer + 14) = xmmword_19B85A200;
    *((_DWORD *)localPlayer + 60) = 0;
    v18 = AudioFileOpenURL((CFURLRef)url, kAudioFileReadPermission, v16, (AudioFileID *)localPlayer + 20);
    if (!v18)
    {
      *((_QWORD *)localPlayer + 1) = url;
      CFRetain(url);
      v18 = AVAudioPlayerCpp::setupAudioFile((AVAudioPlayerCpp *)localPlayer);
      if (!v18)
      {
        v21 = impl->_localPlayer;
        v21[61] = v9;
        v21[62] = LocalPlayerHandleCallback;
        populatePlayerSettings(impl);
        return v9;
      }
    }
    if (!outError)
      goto LABEL_11;
    v11 = *MEMORY[0x1E0CB2F90];
    v12 = v18;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_10;
  }
  return v9;
}

- (id)impl
{
  return self->_impl;
}

- (id)initBase
{
  AVAudioPlayer *v2;
  AudioPlayerImpl *v3;
  AVAudioPlayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAudioPlayer;
  v2 = -[AVAudioPlayer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AudioPlayerImpl);
    v2->_impl = v3;
    if (!v3)
    {
      v4 = v2;
      return 0;
    }
  }
  return v2;
}

- (AVAudioPlayer)initWithContentsOfURL:(NSURL *)url error:(NSError *)outError
{
  return -[AVAudioPlayer initWithContentsOfURL:fileTypeHint:error:](self, "initWithContentsOfURL:fileTypeHint:error:", url, 0, outError);
}

- (AVAudioPlayer)init
{

  return 0;
}

- (void)finalize
{
  objc_super v3;

  self->_impl = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVAudioPlayer;
  -[AVAudioPlayer finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[AVAudioPlayer privRemoveSessionListener](self, "privRemoveSessionListener");

  self->_impl = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVAudioPlayer;
  -[AVAudioPlayer dealloc](&v3, sel_dealloc);
}

- (AVAudioPlayer)initWithData:(NSData *)data error:(NSError *)outError
{
  return -[AVAudioPlayer initWithData:fileTypeHint:error:](self, "initWithData:fileTypeHint:error:", data, 0, outError);
}

- (AVAudioPlayer)initWithData:(NSData *)data fileTypeHint:(NSString *)utiString error:(NSError *)outError
{
  AVAudioPlayer *v8;
  AudioPlayerImpl *impl;
  NSData *v10;
  AVAudioPlayerCpp *v11;
  AudioFileID *localPlayer;
  OSStatus v13;
  OSStatus v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  AVAudioPlayer *v18;
  _QWORD *v20;

  v8 = -[AVAudioPlayer initBase](self, "initBase");
  if (v8)
  {
    if (outError)
      *outError = 0;
    if (data && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      impl = (AudioPlayerImpl *)v8->_impl;
      impl->_data = data;
      v10 = data;
      v11 = (AVAudioPlayerCpp *)operator new();
      AVAudioPlayerCpp::AVAudioPlayerCpp(v11);
      impl->_localPlayer = v11;
      tryToSetPlayerSessionListener(v8);
      LODWORD(v11) = UTItoFileType(utiString);
      localPlayer = (AudioFileID *)impl->_localPlayer;
      *((_OWORD *)localPlayer + 13) = xmmword_19B85A200;
      *((_OWORD *)localPlayer + 14) = xmmword_19B85A200;
      *((_DWORD *)localPlayer + 60) = 0;
      *localPlayer = (AudioFileID)data;
      CFRetain(data);
      v13 = AudioFileOpenWithCallbacks(localPlayer, (AudioFile_ReadProc)AudioPlayerAFReadProc, 0, (AudioFile_GetSizeProc)AudioPlayerAFGetSizeProc, 0, (AudioFileTypeID)v11, localPlayer + 20);
      if (v13)
      {
        v14 = v13;
        CFRelease(*localPlayer);
        *localPlayer = 0;
      }
      else
      {
        v14 = AVAudioPlayerCpp::setupAudioFile((AVAudioPlayerCpp *)localPlayer);
        if (!v14)
        {
          v20 = impl->_localPlayer;
          v20[61] = v8;
          v20[62] = LocalPlayerHandleCallback;
          populatePlayerSettings(impl);
          return v8;
        }
      }
      if (!outError)
        goto LABEL_14;
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2F90];
      v17 = v14;
    }
    else
    {
      if (!outError)
      {
LABEL_14:
        v18 = v8;
        return 0;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2F90];
      v17 = -10875;
    }
    *outError = (NSError *)objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, 0);
    goto LABEL_14;
  }
  return v8;
}

- (BOOL)prepareToPlay
{
  return AVAudioPlayerCpp::DoAction(*((AudioQueueRef **)self->_impl + 11), 1886545264, 0, 0) == 0;
}

- (BOOL)play
{
  return AVAudioPlayerCpp::DoAction(*((AudioQueueRef **)self->_impl + 11), 1886151033, 0, 0) == 0;
}

- (BOOL)playAtTime:(NSTimeInterval)time
{
  NSTimeInterval v4;

  v4 = time;
  return AVAudioPlayerCpp::DoAction(*((AudioQueueRef **)self->_impl + 11), 1886151028, 8, &v4) == 0;
}

- (void)pause
{
  AVAudioPlayerCpp::DoAction(*((AudioQueueRef **)self->_impl + 11), 1885435251, 0, 0);
}

- (void)stop
{
  AVAudioPlayerCpp::DoAction(*((AudioQueueRef **)self->_impl + 11), 1937010544, 0, 0);
}

- (BOOL)isPlaying
{
  AVAudioPlayerCpp **impl;
  int v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 0;
  AudioPlayerImpl_GetProperty<unsigned int>(impl[11], 1886157119, &v4);
  return v4 != 0;
}

- (NSURL)url
{
  return (NSURL *)*((_QWORD *)self->_impl + 3);
}

- (NSData)data
{
  return (NSData *)*((_QWORD *)self->_impl + 2);
}

- (id)delegate
{
  return objc_loadWeak((id *)self->_impl + 1);
}

- (void)setDelegate:(id)delegate
{
  id *v4;

  v4 = (id *)((char *)self->_impl + 8);
  if (objc_loadWeak(v4) != delegate)
    objc_storeWeak(v4, delegate);
}

- (NSDictionary)settings
{
  return (NSDictionary *)*((_QWORD *)self->_impl + 4);
}

- (AVAudioFormat)format
{
  return (AVAudioFormat *)*((_QWORD *)self->_impl + 5);
}

- (NSTimeInterval)duration
{
  AVAudioPlayerCpp **impl;
  double v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1685418593, &v4);
  return v4;
}

- (void)setVolume:(float)volume
{
  _QWORD *impl;
  double v5;
  uint64_t v6;

  impl = self->_impl;
  v6 = 0;
  AVAudioPlayerCpp::SetProperty(impl[11], 1987015284, 8, (double *)&v6);
  v5 = volume;
  AVAudioPlayerCpp::SetProperty(impl[11], 1987013749, 8, &v5);
}

- (float)volume
{
  AVAudioPlayerCpp **impl;
  double v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1987013749, &v4);
  return v4;
}

- (void)setVolume:(float)volume fadeDuration:(NSTimeInterval)duration
{
  _QWORD *impl;
  double v6;
  NSTimeInterval v7;

  impl = self->_impl;
  v7 = duration;
  AVAudioPlayerCpp::SetProperty(impl[11], 1987015284, 8, &v7);
  v6 = volume;
  AVAudioPlayerCpp::SetProperty(impl[11], 1987013749, 8, &v6);
}

- (void)setEnableRate:(BOOL)enableRate
{
  _QWORD *impl;
  double var4;

  impl = self->_impl;
  LODWORD(var4) = enableRate;
  AVAudioPlayerCpp::SetProperty(impl[11], 1701737076, 4, &var4);
}

- (BOOL)enableRate
{
  AVAudioPlayerCpp **impl;
  int v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 0;
  AudioPlayerImpl_GetProperty<unsigned int>(impl[11], 1701737076, &v4);
  return v4 != 0;
}

- (void)setRate:(float)rate
{
  _QWORD *impl;
  double v4;

  impl = self->_impl;
  v4 = rate;
  AVAudioPlayerCpp::SetProperty(impl[11], 1918989413, 8, &v4);
}

- (float)rate
{
  AVAudioPlayerCpp **impl;
  double v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 1.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1918989413, &v4);
  return v4;
}

- (void)setPan:(float)pan
{
  _QWORD *impl;
  double v4;

  impl = self->_impl;
  v4 = pan;
  AVAudioPlayerCpp::SetProperty(impl[11], 1885433376, 8, &v4);
}

- (float)pan
{
  AVAudioPlayerCpp **impl;
  double v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1885433376, &v4);
  return v4;
}

- (NSUInteger)numberOfChannels
{
  AVAudioPlayerCpp **impl;
  unsigned int v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 0;
  AudioPlayerImpl_GetProperty<unsigned int>(impl[11], 1667788403, &v4);
  return v4;
}

- (NSTimeInterval)currentTime
{
  AVAudioPlayerCpp **impl;
  double v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1668573549, &v4);
  return v4;
}

- (NSTimeInterval)deviceCurrentTime
{
  AVAudioPlayerCpp **impl;
  double v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1685350765, &v4);
  return v4;
}

- (void)setCurrentTime:(NSTimeInterval)currentTime
{
  _QWORD *impl;
  NSTimeInterval v4;

  impl = self->_impl;
  v4 = currentTime;
  AVAudioPlayerCpp::SetProperty(impl[11], 1668573549, 8, &v4);
}

- (void)setNumberOfLoops:(NSInteger)numberOfLoops
{
  *(_DWORD *)(*((_QWORD *)self->_impl + 11) + 296) = numberOfLoops;
}

- (NSInteger)numberOfLoops
{
  return *(int *)(*((_QWORD *)self->_impl + 11) + 296);
}

- (BOOL)isMeteringEnabled
{
  AVAudioPlayerCpp **impl;
  int v4;

  impl = (AVAudioPlayerCpp **)self->_impl;
  v4 = 0;
  AudioPlayerImpl_GetProperty<unsigned int>(impl[11], 1701735796, &v4);
  return v4 != 0;
}

- (void)setMeteringEnabled:(BOOL)meteringEnabled
{
  _QWORD *impl;
  double var4;

  impl = self->_impl;
  LODWORD(var4) = meteringEnabled;
  AVAudioPlayerCpp::SetProperty(impl[11], 1701735796, 4, &var4);
}

- (void)updateMeters
{
  AVAudioPlayerCpp::DoAction(*((AudioQueueRef **)self->_impl + 11), 1970302324, 0, 0);
}

- (float)peakPowerForChannel:(NSUInteger)channelNumber
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)self->_impl + 11);
  if (*(_DWORD *)(v3 + 60) > channelNumber && *(_BYTE *)(v3 + 307) && (v4 = *(_QWORD *)(v3 + 384)) != 0)
    return *(float *)(v4 + 8 * channelNumber + 4);
  else
    return -160.0;
}

- (float)averagePowerForChannel:(NSUInteger)channelNumber
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)self->_impl + 11);
  if (*(_DWORD *)(v3 + 60) > channelNumber && *(_BYTE *)(v3 + 307) && (v4 = *(_QWORD *)(v3 + 384)) != 0)
    return *(float *)(v4 + 8 * channelNumber);
  else
    return -160.0;
}

- (NSArray)channelAssignments
{
  return (NSArray *)*((_QWORD *)self->_impl + 7);
}

- (void)setChannelAssignments:(NSArray *)channelAssignments
{
  _QWORD *impl;
  NSUInteger v6;
  void *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  int v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t i;
  uint64_t v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v6 = -[NSArray count](channelAssignments, "count");
  if (v6 == -[AVAudioPlayer numberOfChannels](self, "numberOfChannels"))
  {
    v7 = (void *)impl[7];
    impl[7] = -[NSArray copy](channelAssignments, "copy");
    if (v7)

    if (!(v6 >> 60))
    {
      v8 = (char *)malloc_type_malloc(16 * v6, 0xF80A5484uLL);
      if (v8)
      {
        v9 = v8;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](channelAssignments, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = 0;
          v13 = *(_QWORD *)v26;
          do
          {
            v14 = 0;
            v15 = &v9[16 * v12];
            do
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(channelAssignments);
              v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
              if (v16)
              {
                *(_QWORD *)v15 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "owningPortUID");
                v17 = objc_msgSend(v16, "channelNumber");
              }
              else
              {
                v17 = 0;
                *(_QWORD *)v15 = 0;
              }
              *((_DWORD *)v15 + 2) = v17;
              ++v14;
              v15 += 16;
            }
            while (v11 != v14);
            v12 += v14;
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](channelAssignments, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v11);
        }
        v18 = impl[11];
        AVAudioPlayerCpp::freeChannelAssignments((AVAudioPlayerCpp *)v18);
        *(_DWORD *)(v18 + 520) = v6;
        v19 = (char *)malloc_type_malloc((16 * v6) & 0xFFFFFFFF0, 0x1060040ADAFC7CAuLL);
        *(_QWORD *)(v18 + 528) = v19;
        if (v19)
        {
          v20 = *(unsigned int *)(v18 + 520);
          if ((_DWORD)v20)
          {
            v21 = 0;
            for (i = 0; i < v20; ++i)
            {
              v23 = *(_QWORD *)&v9[v21];
              if (v23)
              {
                CFRetain(*(CFTypeRef *)&v9[v21]);
                v23 = *(_QWORD *)&v9[v21];
                v19 = *(char **)(v18 + 528);
                v20 = *(unsigned int *)(v18 + 520);
              }
              v24 = &v19[v21];
              *(_QWORD *)v24 = v23;
              *((_DWORD *)v24 + 2) = *(_DWORD *)&v9[v21 + 8];
              v21 += 16;
            }
          }
          AVAudioPlayerCpp::makeChannelAssignments((AVAudioPlayerCpp *)v18);
        }
        free(v9);
      }
    }
  }
}

- (id)audioSession
{
  return *((id *)self->_impl + 8);
}

- (void)setAudioSession:(id)a3
{
  id v5;
  id impl;
  uint64_t v7;

  v5 = a3;
  objc_sync_enter(self);
  impl = self->_impl;
  -[AVAudioPlayer stop](self, "stop");
  -[AVAudioPlayer privRemoveSessionListener](self, "privRemoveSessionListener");
  v7 = *((_QWORD *)impl + 11);
  *(_DWORD *)(v7 + 456) = objc_msgSend(a3, "opaqueSessionID");

  *((_QWORD *)impl + 8) = a3;
  tryToSetPlayerSessionListener(self);
  objc_sync_exit(self);
}

- (BOOL)mixToUplink
{
  return *(_BYTE *)(*((_QWORD *)self->_impl + 11) + 25) & 1;
}

- (void)setMixToUplink:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_DWORD *)(*((_QWORD *)self->_impl + 11) + 24) = *(_DWORD *)(*((_QWORD *)self->_impl + 11) + 24) & 0xFFFFFEFF | v3;
}

- (void)setSTSLabel:(id)a3
{
  id v3;
  AVAudioPlayerCpp *v4;
  CFTypeID v5;
  const void *v6;
  char v7;

  v3 = a3;
  v4 = (AVAudioPlayerCpp *)*((_QWORD *)self->_impl + 11);
  if (a3)
  {
    CFRetain(a3);
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      v6 = (const void *)*((_QWORD *)v4 + 67);
      *((_QWORD *)v4 + 67) = v3;
      CFRetain(v3);
      v7 = 0;
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      CFRelease(v3);
      v3 = 0;
      v6 = (const void *)*((_QWORD *)v4 + 67);
      *((_QWORD *)v4 + 67) = 0;
      v7 = 1;
      if (!v6)
        goto LABEL_9;
    }
LABEL_8:
    CFRelease(v6);
    goto LABEL_9;
  }
  v6 = (const void *)*((_QWORD *)v4 + 67);
  v7 = 1;
  *((_QWORD *)v4 + 67) = 0;
  if (v6)
    goto LABEL_8;
LABEL_9:
  AVAudioPlayerCpp::applySTSLabelToQueueIfPossible(v4);
  if ((v7 & 1) == 0)
    CFRelease(v3);
}

- (id)STSLabel
{
  uint64_t v2;
  const void *v3;

  v2 = *((_QWORD *)self->_impl + 11);
  v3 = *(const void **)(v2 + 536);
  if (v3)
  {
    CFRetain(*(CFTypeRef *)(v2 + 536));
    CFRelease(v3);
  }
  return (id)v3;
}

- (NSString)currentDevice
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentDevice:(NSString *)currentDevice
{
  objc_setProperty_atomic_copy(self, a2, currentDevice, 16);
}

- (void)finishedPlaying:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1A1AC6084](-[AVAudioPlayer stop](self, "stop"));
  v6 = -[AVAudioPlayer delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "audioPlayerDidFinishPlaying:successfully:", self, objc_msgSend(a3, "BOOLValue"));
  objc_autoreleasePoolPop(v5);
}

- (void)decodeError:(id)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1A1AC6084](self, a2);
  v6 = -[AVAudioPlayer delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v6, "audioPlayerDecodeErrorDidOccur:error:", self, (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], objc_msgSend(a3, "unsignedIntValue"), 0));
  }
  objc_autoreleasePoolPop(v5);
}

- (void)privRemoveSessionListener
{
  _QWORD *impl;
  void *v4;

  impl = self->_impl;
  if (impl)
  {
    if (*((_BYTE *)impl + 72))
    {
      v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CFF000], impl[8]);
      *((_BYTE *)impl + 72) = 0;
    }
  }
}

- (void)handleInterruption:(id)a3
{
  id impl;
  void *v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  AVAudioPlayerCpp *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;

  impl = self->_impl;
  v6 = (void *)objc_msgSend(a3, "userInfo");
  v7 = objc_msgSend((id)objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E0CFF030]), "intValue");
  if (v7)
  {
    if (v7 == 1)
    {
      v8 = *((_QWORD *)impl + 11);
      if (!*(_BYTE *)(v8 + 313))
      {
        pthread_mutex_lock(&avap_mutex);
        *(_BYTE *)(v8 + 460) = 1;
        v9 = *(unsigned __int8 *)(v8 + 307);
        if (*(_BYTE *)(v8 + 307) || *(_BYTE *)(v8 + 305))
        {
          *(_BYTE *)(v8 + 461) = v9;
          AVAudioPlayerCpp::getQueueTime((AVAudioPlayerCpp *)v8, 1);
          v10 = *(_QWORD *)(v8 + 336);
          *(_QWORD *)(v8 + 344) = *(_QWORD *)(v8 + 328);
          *(_QWORD *)(v8 + 320) = v10;
          *(_BYTE *)(v8 + 315) = 0;
          *(_WORD *)(v8 + 304) = 0;
          *(_DWORD *)(v8 + 308) = 0;
          *(_BYTE *)(v8 + 307) = 0;
        }
        pthread_mutex_unlock(&avap_mutex);
        if (v9)
          LocalPlayerHandleCallback(self, 1651076724, 0, 0);
      }
    }
  }
  else
  {
    v11 = (AVAudioPlayerCpp *)*((_QWORD *)impl + 11);
    if (!*((_BYTE *)v11 + 313))
    {
      pthread_mutex_lock(&avap_mutex);
      if (*((_BYTE *)v11 + 460))
      {
        AVAudioPlayerCpp::disposeQueue(v11, 1);
        v12 = *((unsigned __int8 *)v11 + 460);
      }
      else
      {
        v12 = 0;
      }
      v13 = *((unsigned __int8 *)v11 + 461);
      pthread_mutex_unlock(&avap_mutex);
      if (v12)
      {
        *((_QWORD *)impl + 10) = 0;
        if (v13)
        {
          v14 = (void *)objc_msgSend(a3, "userInfo");
          if (objc_msgSend((id)objc_msgSend(v14, "valueForKey:", *MEMORY[0x1E0CFF010]), "intValue") == 1)
            *((_QWORD *)impl + 10) |= 1uLL;
          LocalPlayerHandleCallback(self, 1701408372, 8, (unsigned int *)impl + 20);
        }
        v15 = *((_QWORD *)impl + 11);
        pthread_mutex_lock(&avap_mutex);
        *(_WORD *)(v15 + 460) = 0;
        pthread_mutex_unlock(&avap_mutex);
      }
    }
  }
}

- (void)beginInterruption
{
  void *v3;

  v3 = (void *)MEMORY[0x1A1AC6084](self, a2);
  objc_msgSend(-[AVAudioPlayer delegate](self, "delegate"), "audioPlayerBeginInterruption:", self);
  objc_autoreleasePoolPop(v3);
}

- (void)endInterruptionWithFlags:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1A1AC6084](self, a2);
  v6 = -[AVAudioPlayer delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "audioPlayerEndInterruption:withOptions:", self, objc_msgSend(a3, "unsignedLongLongValue"));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "audioPlayerEndInterruption:withFlags:", self, objc_msgSend(a3, "unsignedLongLongValue"));
  }
  objc_autoreleasePoolPop(v5);
}

- (void)endInterruption
{
  void *v3;

  v3 = (void *)MEMORY[0x1A1AC6084](self, a2);
  objc_msgSend(-[AVAudioPlayer delegate](self, "delegate"), "audioPlayerEndInterruption:", self);
  objc_autoreleasePoolPop(v3);
}

@end
