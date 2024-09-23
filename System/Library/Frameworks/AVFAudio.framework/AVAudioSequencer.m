@implementation AVAudioSequencer

- (AVAudioSequencer)init
{
  uint64_t v3;
  CallbackMessenger *v4;
  _QWORD *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _BYTE v15[12];
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = operator new();
  *(_QWORD *)(v3 + 32) = 0;
  *(_OWORD *)v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  v4 = (CallbackMessenger *)operator new();
  CallbackMessenger::CallbackMessenger(v4);
  *(_QWORD *)v15 = v4;
  *(_QWORD *)(v3 + 40) = v4;
  v5 = (_QWORD *)operator new();
  *v5 = &off_1E3BE9E38;
  v5[1] = 0;
  v5[2] = 0;
  v5[3] = v4;
  *(_QWORD *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 64) = 0;
  *(_QWORD *)(v3 + 48) = v5;
  if (initLogging(void)::once != -1)
    dispatch_once(&initLogging(void)::once, &__block_literal_global_1366);
  if (kAVASScope)
  {
    v6 = *(id *)kAVASScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v15 = 136315650;
    *(_QWORD *)&v15[4] = "AVAudioSequencerImpl.mm";
    v16 = 1024;
    v17 = 65;
    v18 = 2048;
    v19 = v3;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> this = %p", v15, 0x1Cu);
  }

LABEL_10:
  v8 = NewMusicPlayer((MusicPlayer *)v3);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 66, (uint64_t)"AVAudioSequencerImpl", (uint64_t)"NewMusicPlayer(&mPlayer)", v8, 0);
  v9 = NewMusicSequence((MusicSequence *)(v3 + 8));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 67, (uint64_t)"AVAudioSequencerImpl", (uint64_t)"NewMusicSequence(&mSequence)", v9, 0);
  v10 = MusicPlayerSetSequence(*(MusicPlayer *)v3, *(MusicSequence *)(v3 + 8));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 68, (uint64_t)"AVAudioSequencerImpl", (uint64_t)"MusicPlayerSetSequence(mPlayer, mSequence)", v10, 0);
  v11 = MusicSequenceSetAUGraph(*(MusicSequence *)(v3 + 8), 0);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 69, (uint64_t)"AVAudioSequencerImpl", (uint64_t)"MusicSequenceSetAUGraph(mSequence, nullptr)", v11, 0);
  if (kAVASScope)
  {
    v12 = *(id *)kAVASScope;
    if (!v12)
      return -[AVAudioSequencer initWithImpl:](self, "initWithImpl:", v3, *(_QWORD *)v15);
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)&v15[4] = "AVAudioSequencerImpl.mm";
    v16 = 1024;
    v17 = 71;
    _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d <---", v15, 0x12u);
  }

  return -[AVAudioSequencer initWithImpl:](self, "initWithImpl:", v3, *(_QWORD *)v15);
}

- (AVAudioSequencer)initWithAudioEngine:(AVAudioEngine *)engine
{
  AVAudioEngine *v4;
  uint64_t v5;
  AVAudioEngine *v6;
  CallbackMessenger *v7;
  _QWORD *v8;
  AVAudioEngine *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  AVAudioSequencer *v17;
  _BYTE v19[12];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = engine;
  v5 = operator new();
  v6 = v4;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  *(_QWORD *)(v5 + 32) = 0;
  v7 = (CallbackMessenger *)operator new();
  CallbackMessenger::CallbackMessenger(v7);
  *(_QWORD *)v19 = v7;
  *(_QWORD *)(v5 + 40) = v7;
  v8 = (_QWORD *)operator new();
  *v8 = &off_1E3BE9E38;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  *(_QWORD *)(v5 + 48) = v8;
  *(_QWORD *)(v5 + 56) = 0;
  v9 = v6;
  *(_QWORD *)(v5 + 64) = v9;
  if (initLogging(void)::once != -1)
    dispatch_once(&initLogging(void)::once, &__block_literal_global_1366);
  if (kAVASScope)
  {
    v10 = *(id *)kAVASScope;
    if (!v10)
      goto LABEL_10;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19 = 136315650;
    *(_QWORD *)&v19[4] = "AVAudioSequencerImpl.mm";
    v20 = 1024;
    v21 = 81;
    v22 = 2048;
    v23 = v5;
    _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> this = %p", v19, 0x1Cu);
  }

LABEL_10:
  v12 = NewMusicPlayer((MusicPlayer *)v5);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 82, (uint64_t)"AVAudioSequencerImpl", (uint64_t)"NewMusicPlayer(&mPlayer)", v12, 0);
  v13 = NewMusicSequence((MusicSequence *)(v5 + 8));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 83, (uint64_t)"AVAudioSequencerImpl", (uint64_t)"NewMusicSequence(&mSequence)", v13, 0);
  v14 = MusicPlayerSetSequence(*(MusicPlayer *)v5, *(MusicSequence *)(v5 + 8));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 84, (uint64_t)"AVAudioSequencerImpl", (uint64_t)"MusicPlayerSetSequence(mPlayer, mSequence)", v14, 0);
  objc_msgSend(*(id *)(v5 + 64), "setMusicSequence:", *(_QWORD *)(v5 + 8));
  if (kAVASScope)
  {
    v15 = *(id *)kAVASScope;
    if (!v15)
      goto LABEL_17;
  }
  else
  {
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)&v19[4] = "AVAudioSequencerImpl.mm";
    v20 = 1024;
    v21 = 87;
    _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d <---", v19, 0x12u);
  }

LABEL_17:
  v17 = -[AVAudioSequencer initWithImpl:](self, "initWithImpl:", v5);

  return v17;
}

- (AVAudioSequencer)initWithImpl:(void *)a3
{
  AVAudioSequencer *v4;
  AVAudioSequencer *v5;
  AVMusicTrack *v6;
  MusicTrackImpl *v7;
  OpaqueMusicTrack *TempoTrack;
  AVMusicTrack *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVAudioSequencer;
  v4 = -[AVAudioSequencer init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
    v6 = [AVMusicTrack alloc];
    v7 = (MusicTrackImpl *)operator new();
    TempoTrack = AVAudioSequencerImpl::GetTempoTrack(*((AVAudioSequencerImpl **)v5->_impl + 1));
    MusicTrackImpl::MusicTrackImpl(v7, TempoTrack);
    v9 = -[AVMusicTrack initWithImpl:](v6, "initWithImpl:", v7);
    -[AVAudioSequencer setTempoTrack:](v5, "setTempoTrack:", v9);

  }
  else if (a3)
  {
    AVAudioSequencerImpl::~AVAudioSequencerImpl((AVAudioSequencerImpl *)a3);
    MEMORY[0x1A1AC5BD4]();
  }
  return v5;
}

- (void)dealloc
{
  AVAudioSequencerImpl *impl;
  objc_super v4;

  -[AVAudioSequencer cleanTracks](self, "cleanTracks");
  impl = (AVAudioSequencerImpl *)self->_impl;
  if (impl)
  {
    AVAudioSequencerImpl::~AVAudioSequencerImpl(impl);
    MEMORY[0x1A1AC5BD4]();
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSequencer;
  -[AVAudioSequencer dealloc](&v4, sel_dealloc);
}

- (unint64_t)numberOfTracks
{
  MusicSequence *impl;
  uint64_t TrackCount;
  UInt32 outNumberOfTracks;

  impl = (MusicSequence *)self->_impl;
  outNumberOfTracks = 0;
  TrackCount = MusicSequenceGetTrackCount(impl[1], &outNumberOfTracks);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 173, (uint64_t)"NumberOfTracks", (uint64_t)"MusicSequenceGetTrackCount(mSequence, &trackCount)", TrackCount, 0);
  return outNumberOfTracks;
}

- (void)cleanTracks
{
  -[AVAudioSequencer setTempoTrack:](self, "setTempoTrack:", 0);
  -[AVAudioSequencer setTrackArray:](self, "setTrackArray:", 0);
}

- (void)setupTrackArray
{
  void *v3;
  id v4;

  -[AVAudioSequencer trackArray](self, "trackArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[AVAudioSequencer setTrackArray:](self, "setTrackArray:");

  }
}

- (void)setupTracks
{
  unint64_t v3;
  AVMusicTrack *v4;
  MusicTrackImpl *v5;
  MusicSequence *impl;
  uint64_t IndTrack;
  AVMusicTrack *v8;
  void *v9;
  AVMusicTrack *v10;
  MusicTrackImpl *v11;
  OpaqueMusicTrack *TempoTrack;
  AVMusicTrack *v13;
  MusicTrack outTrack;

  -[AVAudioSequencer setupTrackArray](self, "setupTrackArray");
  if (-[AVAudioSequencer numberOfTracks](self, "numberOfTracks"))
  {
    v3 = 0;
    do
    {
      v4 = [AVMusicTrack alloc];
      v5 = (MusicTrackImpl *)operator new();
      impl = (MusicSequence *)self->_impl;
      outTrack = 0;
      IndTrack = MusicSequenceGetIndTrack(impl[1], v3, &outTrack);
      _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 242, (uint64_t)"GetTrackWithIndex", (uint64_t)"MusicSequenceGetIndTrack(mSequence, inIndex, &theTrack)", IndTrack, 0);
      MusicTrackImpl::MusicTrackImpl(v5, outTrack);
      v8 = -[AVMusicTrack initWithImpl:](v4, "initWithImpl:", v5);
      -[AVAudioSequencer trackArray](self, "trackArray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v8);

      ++v3;
    }
    while (v3 < -[AVAudioSequencer numberOfTracks](self, "numberOfTracks"));
  }
  v10 = [AVMusicTrack alloc];
  v11 = (MusicTrackImpl *)operator new();
  TempoTrack = AVAudioSequencerImpl::GetTempoTrack(*((AVAudioSequencerImpl **)self->_impl + 1));
  MusicTrackImpl::MusicTrackImpl(v11, TempoTrack);
  v13 = -[AVMusicTrack initWithImpl:](v10, "initWithImpl:", v11);
  -[AVAudioSequencer setTempoTrack:](self, "setTempoTrack:");

}

- (NSDictionary)userInfo
{
  return (NSDictionary *)MusicSequenceGetInfoDictionary(*((MusicSequence *)self->_impl + 1));
}

- (BOOL)loadFromURL:(NSURL *)fileURL options:(AVMusicSequenceLoadOptions)options error:(NSError *)outError
{
  MusicSequenceLoadFlags v6;
  NSURL *v8;
  uint64_t v9;
  _BOOL4 v10;

  v6 = options;
  v8 = fileURL;
  -[AVAudioSequencer cleanTracks](self, "cleanTracks");
  v9 = MusicSequenceFileLoad(*((MusicSequence *)self->_impl + 1), (CFURLRef)v8, kMusicSequenceFile_AnyType, v6);
  v10 = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 206, (uint64_t)"-[AVAudioSequencer loadFromURL:options:error:]", (uint64_t)"impl->LoadFromFile((__bridge CFURLRef)fileURL, (UInt32)options)", v9, outError);
  if (v10)
    -[AVAudioSequencer setupTracks](self, "setupTracks");

  return v10;
}

- (BOOL)loadFromData:(NSData *)data options:(AVMusicSequenceLoadOptions)options error:(NSError *)outError
{
  MusicSequenceLoadFlags v6;
  NSData *v8;
  uint64_t v9;
  _BOOL4 v10;

  v6 = options;
  v8 = data;
  -[AVAudioSequencer cleanTracks](self, "cleanTracks");
  v9 = MusicSequenceFileLoadData(*((MusicSequence *)self->_impl + 1), (CFDataRef)v8, kMusicSequenceFile_AnyType, v6);
  v10 = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 216, (uint64_t)"-[AVAudioSequencer loadFromData:options:error:]", (uint64_t)"impl->LoadFromData((__bridge CFDataRef)data, (UInt32)options)", v9, outError);
  if (v10)
    -[AVAudioSequencer setupTracks](self, "setupTracks");

  return v10;
}

- (BOOL)writeToURL:(NSURL *)fileURL SMPTEResolution:(NSInteger)resolution replaceExisting:(BOOL)replace error:(NSError *)outError
{
  MusicSequenceFileFlags v7;
  SInt16 v8;
  NSURL *v10;
  uint64_t v11;

  v7 = replace;
  v8 = resolution;
  v10 = fileURL;
  v11 = MusicSequenceFileCreate(*((MusicSequence *)self->_impl + 1), (CFURLRef)v10, kMusicSequenceFile_AnyType, v7, v8);
  LOBYTE(outError) = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 225, (uint64_t)"-[AVAudioSequencer writeToURL:SMPTEResolution:replaceExisting:error:]", (uint64_t)"impl->WriteToFile((__bridge CFURLRef)fileURL, (SInt32)resolution, replace)", v11, outError);

  return (char)outError;
}

- (NSData)dataWithSMPTEResolution:(NSInteger)SMPTEResolution error:(NSError *)outError
{
  uint64_t v5;
  CFDataRef outData;

  outData = 0;
  v5 = MusicSequenceFileCreateData(*((MusicSequence *)self->_impl + 1), kMusicSequenceFile_AnyType, 0, SMPTEResolution, &outData);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 231, (uint64_t)"-[AVAudioSequencer dataWithSMPTEResolution:error:]", (uint64_t)"impl->WriteToData(&outData, (SInt32)SMPTEResolution)", v5, outError);
  return (NSData *)outData;
}

- (AVMusicTrack)createAndAppendTrack
{
  AVMusicTrack *v3;
  MusicTrackImpl *v4;
  MusicSequence *impl;
  uint64_t v6;
  AVMusicTrack *v7;
  void *v8;
  MusicTrack outTrack;

  -[AVAudioSequencer setupTrackArray](self, "setupTrackArray");
  v3 = [AVMusicTrack alloc];
  v4 = (MusicTrackImpl *)operator new();
  impl = (MusicSequence *)self->_impl;
  outTrack = 0;
  v6 = MusicSequenceNewTrack(impl[1], &outTrack);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 235, (uint64_t)"CreateTrack", (uint64_t)"MusicSequenceNewTrack(mSequence, &theTrack)", v6, 0);
  MusicTrackImpl::MusicTrackImpl(v4, outTrack);
  v7 = -[AVMusicTrack initWithImpl:](v3, "initWithImpl:", v4);
  -[AVAudioSequencer trackArray](self, "trackArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

  return v7;
}

- (BOOL)removeTrack:(AVMusicTrack *)track
{
  AVMusicTrack *v4;
  uint64_t v5;
  void *v6;

  v4 = track;
  v5 = -[AVMusicTrack index](v4, "index");
  -[AVAudioSequencer trackArray](self, "trackArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectAtIndex:", v5);

  return 1;
}

- (NSTimeInterval)secondsForBeats:(AVMusicTimeStamp)beats
{
  float v3;

  v3 = beats;
  return AVAudioSequencerImpl::GetSecondsForBeats(*((AVAudioSequencerImpl **)self->_impl + 1), v3);
}

- (AVMusicTimeStamp)beatsForSeconds:(NSTimeInterval)seconds
{
  return AVAudioSequencerImpl::GetBeatsForSeconds(*((AVAudioSequencerImpl **)self->_impl + 1), seconds);
}

- (void)reverseEvents
{
  uint64_t v2;

  v2 = MusicSequenceReverse(*((MusicSequence *)self->_impl + 1));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 274, (uint64_t)"Reverse", (uint64_t)"MusicSequenceReverse(mSequence)", v2, 0);
}

- (void)setUserCallback:(AVAudioSequencerUserCallback)userCallback
{
  void *impl;
  void *v6;
  void *v7;
  void (__cdecl *v8)(void *, MusicSequence, MusicTrack, MusicTimeStamp, const MusicEventUserData *, MusicTimeStamp, MusicTimeStamp);
  uint64_t v9;
  AVAudioSequencer *v10;

  impl = self->_impl;
  v10 = self;
  v6 = _Block_copy(userCallback);
  v7 = (void *)*((_QWORD *)impl + 4);
  *((_QWORD *)impl + 4) = v6;

  objc_storeStrong((id *)impl + 7, self);
  if (*((_QWORD *)impl + 4))
    v8 = (void (__cdecl *)(void *, MusicSequence, MusicTrack, MusicTimeStamp, const MusicEventUserData *, MusicTimeStamp, MusicTimeStamp))AVAudioSequencerImpl::UserCallback;
  else
    v8 = 0;
  v9 = MusicSequenceSetUserCallback(*((MusicSequence *)impl + 1), v8, impl);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 310, (uint64_t)"InstallUserCallback", (uint64_t)"MusicSequenceSetUserCallback(mSequence, (mUserCallbackBlock) ? UserCallback : nullptr, this)", v9, 0);

}

- (void)setTrackArray:(id)a3
{
  objc_storeStrong((id *)self->_impl + 2, a3);
}

- (id)trackArray
{
  return *((id *)self->_impl + 2);
}

- (void)setTempoTrack:(id)a3
{
  objc_storeStrong((id *)self->_impl + 3, a3);
}

- (AVMusicTrack)tempoTrack
{
  return (AVMusicTrack *)*((id *)self->_impl + 3);
}

- (NSTimeInterval)currentPositionInSeconds
{
  float v3;

  v3 = AVAudioSequencerImpl::CurrentPosition(*(AVAudioSequencerImpl **)self->_impl);
  return AVAudioSequencerImpl::GetSecondsForBeats(*((AVAudioSequencerImpl **)self->_impl + 1), v3);
}

- (void)setCurrentPositionInSeconds:(NSTimeInterval)currentPositionInSeconds
{
  float BeatsForSeconds;
  uint64_t v5;

  BeatsForSeconds = AVAudioSequencerImpl::GetBeatsForSeconds(*((AVAudioSequencerImpl **)self->_impl + 1), currentPositionInSeconds);
  v5 = MusicPlayerSetTime(*(MusicPlayer *)self->_impl, BeatsForSeconds);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 115, (uint64_t)"SetCurrentPosition", (uint64_t)"MusicPlayerSetTime(mPlayer, currentPosition)", v5, 0);
}

- (NSTimeInterval)currentPositionInBeats
{
  return AVAudioSequencerImpl::CurrentPosition(*(AVAudioSequencerImpl **)self->_impl);
}

- (void)setCurrentPositionInBeats:(NSTimeInterval)currentPositionInBeats
{
  uint64_t v3;

  v3 = MusicPlayerSetTime(*(MusicPlayer *)self->_impl, currentPositionInBeats);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 115, (uint64_t)"SetCurrentPosition", (uint64_t)"MusicPlayerSetTime(mPlayer, currentPosition)", v3, 0);
}

- (BOOL)isPlaying
{
  MusicPlayer *impl;
  uint64_t IsPlaying;
  Boolean outIsPlaying;

  impl = (MusicPlayer *)self->_impl;
  outIsPlaying = 0;
  IsPlaying = MusicPlayerIsPlaying(*impl, &outIsPlaying);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 121, (uint64_t)"IsPlaying", (uint64_t)"MusicPlayerIsPlaying(mPlayer, &isPlaying)", IsPlaying, 0);
  return outIsPlaying != 0;
}

- (float)rate
{
  MusicPlayer *impl;
  uint64_t PlayRateScalar;
  Float64 outScaleRate;

  impl = (MusicPlayer *)self->_impl;
  outScaleRate = 0.0;
  PlayRateScalar = MusicPlayerGetPlayRateScalar(*impl, &outScaleRate);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 128, (uint64_t)"GetRate", (uint64_t)"MusicPlayerGetPlayRateScalar(mPlayer, &theRate)", PlayRateScalar, 0);
  return outScaleRate;
}

- (void)setRate:(float)rate
{
  uint64_t v3;

  v3 = MusicPlayerSetPlayRateScalar(*(MusicPlayer *)self->_impl, rate);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 134, (uint64_t)"SetRate", (uint64_t)"MusicPlayerSetPlayRateScalar(mPlayer, inRate)", v3, 0);
}

- (UInt64)hostTimeForBeats:(AVMusicTimeStamp)inBeats error:(NSError *)outError
{
  uint64_t HostTimeForBeats;
  UInt64 outHostTime;

  outHostTime = 0;
  HostTimeForBeats = MusicPlayerGetHostTimeForBeats(*(MusicPlayer *)self->_impl, inBeats, &outHostTime);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 139, (uint64_t)"HostTimeForBeats", (uint64_t)"MusicPlayerGetHostTimeForBeats(mPlayer, inBeats, pOutHostTime)", HostTimeForBeats, 0);
  return outHostTime;
}

- (AVMusicTimeStamp)beatsForHostTime:(UInt64)inHostTime error:(NSError *)outError
{
  uint64_t BeatsForHostTime;
  MusicTimeStamp outBeats;

  outBeats = 0.0;
  BeatsForHostTime = MusicPlayerGetBeatsForHostTime(*(MusicPlayer *)self->_impl, inHostTime, &outBeats);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 144, (uint64_t)"BeatsForHostTime", (uint64_t)"MusicPlayerGetBeatsForHostTime(mPlayer, inHostTime, pOutBeats)", BeatsForHostTime, 0);
  return outBeats;
}

- (void)prepareToPlay
{
  uint64_t v2;

  v2 = MusicPlayerPreroll(*(MusicPlayer *)self->_impl);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 116, (uint64_t)"-[AVAudioSequencer(AVAudioSequencer_Player) prepareToPlay]", (uint64_t)"impl->PrepareToPlay()", v2, 0);
}

- (BOOL)startAndReturnError:(NSError *)outError
{
  uint64_t v4;

  v4 = MusicPlayerStart(*(MusicPlayer *)self->_impl);
  return _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 121, (uint64_t)"-[AVAudioSequencer(AVAudioSequencer_Player) startAndReturnError:]", (uint64_t)"impl->Start()", v4, outError);
}

- (void)stop
{
  MusicPlayer *impl;
  void *v3;
  MusicPlayer v4;
  MusicPlayer v5;
  unint64_t *v6;
  unint64_t v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  impl = (MusicPlayer *)self->_impl;
  dispatch_get_global_queue(0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = impl[5];
  v5 = impl[6];
  if (v5)
  {
    v6 = (unint64_t *)((char *)v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = v3;
  v9 = (_QWORD *)operator new();
  *v9 = v4;
  v9[1] = v5;
  v11 = 0;
  dispatch_async_f(v8, v9, (dispatch_function_t)applesauce::dispatch::v1::async<AVAudioSequencerImpl::Stop(void)::$_0>(NSObject  {objcproto17OS_dispatch_queue}*,AVAudioSequencerImpl::Stop(void)::$_0 &&)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<AVAudioSequencerImpl::~AVAudioSequencerImpl()::$_0,std::default_delete<AVAudioSequencerImpl::~AVAudioSequencerImpl()::$_0>>::~unique_ptr[abi:ne180100](&v11);

  v10 = MusicPlayerStop(*impl);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 126, (uint64_t)"-[AVAudioSequencer(AVAudioSequencer_Player) stop]", (uint64_t)"impl->Stop()", v10, 0);
}

@end
