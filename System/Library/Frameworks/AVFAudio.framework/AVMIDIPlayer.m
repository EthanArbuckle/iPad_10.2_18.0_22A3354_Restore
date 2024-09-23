@implementation AVMIDIPlayer

- (void)finalize
{
  objc_super v3;

  -[AVMIDIPlayer destroyBase](self, "destroyBase");
  v3.receiver = self;
  v3.super_class = (Class)AVMIDIPlayer;
  -[AVMIDIPlayer finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  AVMIDIPlayer *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (kAVMPScope)
  {
    v3 = *(NSObject **)kAVMPScope;
    if (!*(_QWORD *)kAVMPScope)
      goto LABEL_7;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v6 = "AVMIDIPlayer.mm";
    v7 = 1024;
    v8 = 73;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> self = %p", buf, 0x1Cu);
  }
LABEL_7:
  -[AVMIDIPlayer destroyBase](self, "destroyBase");
  v4.receiver = self;
  v4.super_class = (Class)AVMIDIPlayer;
  -[AVMIDIPlayer dealloc](&v4, sel_dealloc);
}

- (AVMIDIPlayer)initWithContentsOfURL:(NSURL *)inURL soundBankURL:(NSURL *)bankURL error:(NSError *)outError
{
  AVMIDIPlayer *v8;
  AVMIDIPlayer *v9;
  uint64_t v10;
  OSStatus v11;
  AVMIDIPlayer *v12;

  v8 = -[AVMIDIPlayer initBase](self, "initBase");
  v9 = v8;
  if (v8)
  {
    if (!inURL)
    {
LABEL_9:
      v12 = v9;
      return 0;
    }
    if (outError)
      *outError = 0;
    v10 = -[AVMIDIPlayer impl](v8, "impl");
    *(_QWORD *)(v10 + 24) = 0;
    v11 = MusicSequenceFileLoad(*(MusicSequence *)(v10 + 16), (CFURLRef)inURL, kMusicSequenceFile_AnyType, 1u);
    if (v11 || (v11 = MIDIPlayerImpl::finishLoad((MIDIPlayerImpl *)v10, bankURL)) != 0)
    {
      if (outError)
        *outError = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), v11, 0);
      goto LABEL_9;
    }
  }
  return v9;
}

- (AVMIDIPlayer)initWithData:(NSData *)data soundBankURL:(NSURL *)bankURL error:(NSError *)outError
{
  AVMIDIPlayer *v8;
  AVMIDIPlayer *v9;
  MIDIPlayerImpl *v10;
  OSStatus v11;
  AVMIDIPlayer *v12;

  v8 = -[AVMIDIPlayer initBase](self, "initBase");
  v9 = v8;
  if (v8)
  {
    if (!data)
    {
LABEL_9:
      v12 = v9;
      return 0;
    }
    if (outError)
      *outError = 0;
    v10 = -[AVMIDIPlayer impl](v8, "impl");
    v11 = MusicSequenceFileLoadData(v10->var2, (CFDataRef)data, kMusicSequenceFile_AnyType, 1u);
    if (v11 || (v11 = MIDIPlayerImpl::finishLoad(v10, bankURL)) != 0)
    {
      if (outError)
        *outError = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), v11, 0);
      goto LABEL_9;
    }
  }
  return v9;
}

- (unint64_t)hostTimeForBeats:(double)a3
{
  UInt64 outHostTime;

  outHostTime = 0;
  if (MusicPlayerGetHostTimeForBeats((MusicPlayer)-[AVMIDIPlayer impl](self, "impl")[8], a3, &outHostTime))
    return 0;
  else
    return outHostTime;
}

- (double)beatsForHostTime:(unint64_t)a3
{
  OSStatus BeatsForHostTime;
  double result;
  MusicTimeStamp outBeats;

  outBeats = 0.0;
  BeatsForHostTime = MusicPlayerGetBeatsForHostTime((MusicPlayer)-[AVMIDIPlayer impl](self, "impl")[8], a3, &outBeats);
  result = outBeats;
  if (BeatsForHostTime)
    return 0.0;
  return result;
}

- (void)prepareToPlay
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = MusicPlayerPreroll((MusicPlayer)-[AVMIDIPlayer impl](self, "impl")[8]);
  if ((_DWORD)v2)
  {
    v3 = v2;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v6 = "AVAEInternal.h";
      v7 = 1024;
      v8 = 104;
      v9 = 2080;
      v10 = "AVMIDIPlayer.mm";
      v11 = 1024;
      v12 = 137;
      v13 = 2080;
      v14 = "-[AVMIDIPlayer prepareToPlay]";
      v15 = 2080;
      v16 = "MusicPlayerPreroll(impl->mPlayer)";
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v3);
  }
}

- (void)play:(AVMIDIPlayerCompletionHandler)completionHandler
{
  MIDIPlayerImpl *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = -[AVMIDIPlayer impl](self, "impl");
  v4->var4 = _Block_copy(completionHandler);
  v5 = MusicPlayerStart(v4->var1);
  if ((_DWORD)v5)
  {
    v6 = v5;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v9 = "AVAEInternal.h";
      v10 = 1024;
      v11 = 104;
      v12 = 2080;
      v13 = "AVMIDIPlayer.mm";
      v14 = 1024;
      v15 = 298;
      v16 = 2080;
      v17 = "start";
      v18 = 2080;
      v19 = "MusicPlayerStart(mPlayer)";
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v6);
  }
}

- (void)stop
{
  MIDIPlayerImpl *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id var4;
  NSObject *var5;
  _BYTE buf[44];
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[AVMIDIPlayer impl](self, "impl");
  v3 = MusicPlayerStop(v2->var1);
  if ((_DWORD)v3)
  {
    v4 = v3;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 104;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "AVMIDIPlayer.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 303;
      *(_WORD *)&buf[34] = 2080;
      *(_QWORD *)&buf[36] = "stop";
      v9 = 2080;
      v10 = "MusicPlayerStop(mPlayer)";
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v4);
  }
  var4 = v2->var4;
  if (var4)
  {
    v2->var4 = 0;
    var5 = v2->var5;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___ZN14MIDIPlayerImpl4stopEv_block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E3BECB00;
    *(_QWORD *)&buf[32] = var4;
    dispatch_async(var5, buf);
  }
}

- (BOOL)isPlaying
{
  uint64_t IsPlaying;
  uint64_t v3;
  NSObject *v4;
  Boolean outIsPlaying;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  outIsPlaying = 0;
  IsPlaying = MusicPlayerIsPlaying((MusicPlayer)-[AVMIDIPlayer impl](self, "impl")[8], &outIsPlaying);
  if ((_DWORD)IsPlaying)
  {
    v3 = IsPlaying;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v8 = "AVAEInternal.h";
      v9 = 1024;
      v10 = 104;
      v11 = 2080;
      v12 = "AVMIDIPlayer.mm";
      v13 = 1024;
      v14 = 160;
      v15 = 2080;
      v16 = "-[AVMIDIPlayer isPlaying]";
      v17 = 2080;
      v18 = "MusicPlayerIsPlaying(impl->mPlayer, &playing)";
      v19 = 1024;
      v20 = v3;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v3);
  }
  return outIsPlaying != 0;
}

- (float)rate
{
  uint64_t PlayRateScalar;
  uint64_t v3;
  NSObject *v4;
  Float64 outScaleRate;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  outScaleRate = 0.0;
  PlayRateScalar = MusicPlayerGetPlayRateScalar((MusicPlayer)-[AVMIDIPlayer impl](self, "impl")[8], &outScaleRate);
  if ((_DWORD)PlayRateScalar)
  {
    v3 = PlayRateScalar;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v8 = "AVAEInternal.h";
      v9 = 1024;
      v10 = 104;
      v11 = 2080;
      v12 = "AVMIDIPlayer.mm";
      v13 = 1024;
      v14 = 168;
      v15 = 2080;
      v16 = "-[AVMIDIPlayer rate]";
      v17 = 2080;
      v18 = "MusicPlayerGetPlayRateScalar(impl->mPlayer, &scalar)";
      v19 = 1024;
      v20 = v3;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v3);
  }
  return outScaleRate;
}

- (void)setRate:(float)rate
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = MusicPlayerSetPlayRateScalar((MusicPlayer)-[AVMIDIPlayer impl](self, "impl")[8], rate);
  if ((_DWORD)v3)
  {
    v4 = v3;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v7 = "AVAEInternal.h";
      v8 = 1024;
      v9 = 104;
      v10 = 2080;
      v11 = "AVMIDIPlayer.mm";
      v12 = 1024;
      v13 = 175;
      v14 = 2080;
      v15 = "-[AVMIDIPlayer setRate:]";
      v16 = 2080;
      v17 = "MusicPlayerSetPlayRateScalar(impl->mPlayer, rate)";
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v4);
  }
}

- (NSTimeInterval)duration
{
  MIDIPlayerImpl *v2;
  uint64_t SecondsForBeats;
  uint64_t v4;
  NSObject *v5;
  Float64 outSeconds;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = -[AVMIDIPlayer impl](self, "impl");
  outSeconds = 0.0;
  SecondsForBeats = MusicSequenceGetSecondsForBeats(v2->var2, v2->var3, &outSeconds);
  if ((_DWORD)SecondsForBeats)
  {
    v4 = SecondsForBeats;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v9 = "AVAEInternal.h";
      v10 = 1024;
      v11 = 104;
      v12 = 2080;
      v13 = "AVMIDIPlayer.mm";
      v14 = 1024;
      v15 = 182;
      v16 = 2080;
      v17 = "-[AVMIDIPlayer duration]";
      v18 = 2080;
      v19 = "MusicSequenceGetSecondsForBeats(impl->mSequence, impl->mLength, &durInSeconds)";
      v20 = 1024;
      v21 = v4;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v4);
  }
  return outSeconds;
}

- (NSTimeInterval)currentPosition
{
  MIDIPlayerImpl *v2;
  uint64_t Time;
  uint64_t v4;
  NSObject *v5;
  uint64_t SecondsForBeats;
  uint64_t v7;
  NSObject *v8;
  Float64 outSeconds;
  MusicTimeStamp outTime;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = -[AVMIDIPlayer impl](self, "impl");
  outSeconds = 0.0;
  outTime = 0.0;
  Time = MusicPlayerGetTime(v2->var1, &outTime);
  if ((_DWORD)Time)
  {
    v4 = Time;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v13 = "AVAEInternal.h";
      v14 = 1024;
      v15 = 104;
      v16 = 2080;
      v17 = "AVMIDIPlayer.mm";
      v18 = 1024;
      v19 = 191;
      v20 = 2080;
      v21 = "-[AVMIDIPlayer currentPosition]";
      v22 = 2080;
      v23 = "MusicPlayerGetTime(impl->mPlayer, &positionInBeats)";
      v24 = 1024;
      v25 = v4;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v4);
  }
  SecondsForBeats = MusicSequenceGetSecondsForBeats(v2->var2, outTime, &outSeconds);
  if ((_DWORD)SecondsForBeats)
  {
    v7 = SecondsForBeats;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v13 = "AVAEInternal.h";
      v14 = 1024;
      v15 = 104;
      v16 = 2080;
      v17 = "AVMIDIPlayer.mm";
      v18 = 1024;
      v19 = 192;
      v20 = 2080;
      v21 = "-[AVMIDIPlayer currentPosition]";
      v22 = 2080;
      v23 = "MusicSequenceGetSecondsForBeats(impl->mSequence, positionInBeats, &positionInTime)";
      v24 = 1024;
      v25 = v7;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v7);
  }
  return outSeconds;
}

- (void)setCurrentPosition:(NSTimeInterval)currentPosition
{
  MIDIPlayerImpl *v4;
  uint64_t BeatsForSeconds;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  MusicTimeStamp outBeats;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = -[AVMIDIPlayer impl](self, "impl");
  outBeats = 0.0;
  BeatsForSeconds = MusicSequenceGetBeatsForSeconds(v4->var2, currentPosition, &outBeats);
  if ((_DWORD)BeatsForSeconds)
  {
    v6 = BeatsForSeconds;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v13 = "AVAEInternal.h";
      v14 = 1024;
      v15 = 104;
      v16 = 2080;
      v17 = "AVMIDIPlayer.mm";
      v18 = 1024;
      v19 = 200;
      v20 = 2080;
      v21 = "-[AVMIDIPlayer setCurrentPosition:]";
      v22 = 2080;
      v23 = "MusicSequenceGetBeatsForSeconds(impl->mSequence, (Float64) currentPosition, &positionInBeats)";
      v24 = 1024;
      v25 = v6;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v6);
  }
  v8 = MusicPlayerSetTime(v4->var1, outBeats);
  if ((_DWORD)v8)
  {
    v9 = v8;
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v10 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v13 = "AVAEInternal.h";
      v14 = 1024;
      v15 = 104;
      v16 = 2080;
      v17 = "AVMIDIPlayer.mm";
      v18 = 1024;
      v19 = 201;
      v20 = 2080;
      v21 = "-[AVMIDIPlayer setCurrentPosition:]";
      v22 = 2080;
      v23 = "MusicPlayerSetTime(impl->mPlayer, positionInBeats)";
      v24 = 1024;
      v25 = v9;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v9);
  }
}

- (MIDIPlayerImpl)impl
{
  return (MIDIPlayerImpl *)self->_impl;
}

- (id)initBase
{
  AVMIDIPlayer *v2;
  uint64_t v3;
  MusicPlayer *v4;
  MusicSequence *v5;
  NSObject *v6;
  OSStatus v7;
  OSStatus v8;
  OpaqueAUGraph *v9;
  OSStatus v11;
  OSStatus v12;
  _DWORD *exception;
  objc_super v14;
  AudioUnit outAudioUnit;
  AudioComponentDescription inDescription;
  AudioComponentDescription v17;
  AUNode v18;
  AUNode outNode[2];
  AUGraph outGraph;
  AudioComponentDescription buf;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)AVMIDIPlayer;
  v2 = -[AVMIDIPlayer init](&v14, sel_init);
  if (v2)
  {
    if (-[AVMIDIPlayer(AVMIDIPlayerPriv) initBase]::once != -1)
      dispatch_once(&-[AVMIDIPlayer(AVMIDIPlayerPriv) initBase]::once, &__block_literal_global_2737);
    v3 = operator new();
    v4 = (MusicPlayer *)(v3 + 8);
    *(_OWORD *)(v3 + 16) = 0u;
    v5 = (MusicSequence *)(v3 + 16);
    *(_QWORD *)(v3 + 32) = 0;
    *(_OWORD *)v3 = 0u;
    if (kAVMPScope)
    {
      v6 = *(NSObject **)kAVMPScope;
      if (!*(_QWORD *)kAVMPScope)
        goto LABEL_10;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      buf.componentType = 136315650;
      *(_QWORD *)&buf.componentSubType = "AVMIDIPlayer.mm";
      LOWORD(buf.componentFlags) = 1024;
      *(UInt32 *)((char *)&buf.componentFlags + 2) = 245;
      HIWORD(buf.componentFlagsMask) = 2048;
      v22 = v3;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> this = %p", (uint8_t *)&buf, 0x1Cu);
    }
LABEL_10:
    v7 = NewMusicPlayer(v4);
    if (!v7)
    {
      v7 = NewMusicSequence(v5);
      if (!v7)
      {
        *(_QWORD *)outNode = 0;
        outGraph = 0;
        v18 = 0;
        qmemcpy(&buf, "umuanysmlppa", 12);
        qmemcpy(&v17, "xfuapmcdlppa", 12);
        qmemcpy(&inDescription, "uouacoirlppa", 12);
        v8 = NewAUGraph(&outGraph);
        if (v8
          || (v8 = AUGraphAddNode(outGraph, &buf, &outNode[1])) != 0
          || (v8 = AUGraphAddNode(outGraph, &inDescription, &v18)) != 0
          || (v8 = AUGraphAddNode(outGraph, &v17, outNode)) != 0
          || (v8 = AUGraphConnectNodeInput(outGraph, outNode[1], 0, outNode[0], 0)) != 0
          || (v8 = AUGraphConnectNodeInput(outGraph, outNode[0], 0, v18, 0)) != 0)
        {
          v11 = v8;
          DisposeAUGraph(outGraph);
          v7 = v11;
          *(_QWORD *)v3 = 0;
        }
        else
        {
          v9 = outGraph;
          *(_QWORD *)v3 = outGraph;
          if (outNode[0] > 0)
          {
            outAudioUnit = 0;
            v7 = AUGraphNodeInfo(v9, outNode[0], 0, &outAudioUnit);
            if (v7)
              goto LABEL_26;
            AudioUnitSetParameter(outAudioUnit, 0, 0, 0, -30.0, 0);
            AudioUnitSetParameter(outAudioUnit, 1u, 0, 0, 30.0, 0);
            AudioUnitSetParameter(outAudioUnit, 4u, 0, 0, 0.02, 0);
            AudioUnitSetParameter(outAudioUnit, 5u, 0, 0, 0.07, 0);
            AudioUnitSetParameter(outAudioUnit, 6u, 0, 0, 0.0, 0);
            v9 = *(OpaqueAUGraph **)v3;
          }
          v7 = MusicSequenceSetAUGraph(*v5, v9);
          if (!v7)
          {
            v7 = MusicPlayerSetSequence(*v4, *v5);
            if (!v7)
            {
              *(_QWORD *)(v3 + 40) = dispatch_queue_create("CallbackQueue", 0);
              v2->_impl = (void *)v3;
              return v2;
            }
          }
        }
      }
    }
LABEL_26:
    v12 = v7;
    exception = __cxa_allocate_exception(4uLL);
    *exception = v12;
    __cxa_throw(exception, MEMORY[0x1E0DE4EF0], 0);
  }
  return v2;
}

- (void)destroyBase
{
  MIDIPlayerImpl *v2;
  MIDIPlayerImpl *v3;
  NSObject *v4;
  NSObject *var5;
  OpaqueMusicPlayer *var1;
  OpaqueMusicSequence *var2;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  MIDIPlayerImpl *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = -[AVMIDIPlayer impl](self, "impl");
  if (v2)
  {
    v3 = v2;
    if (kAVMPScope)
    {
      v4 = *(NSObject **)kAVMPScope;
      if (!*(_QWORD *)kAVMPScope)
        goto LABEL_9;
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315650;
      v9 = "AVMIDIPlayer.mm";
      v10 = 1024;
      v11 = 268;
      v12 = 2048;
      v13 = v3;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> this = %p", (uint8_t *)&v8, 0x1Cu);
    }
LABEL_9:
    var5 = v3->var5;
    if (var5)
      dispatch_release(var5);
    var1 = v3->var1;
    if (var1)
      DisposeMusicPlayer(var1);
    var2 = v3->var2;
    if (var2)
      DisposeMusicSequence(var2);
    if (v3->var0)
      DisposeAUGraph(v3->var0);
    JUMPOUT(0x1A1AC5BD4);
  }
}

os_log_t __42__AVMIDIPlayer_AVMIDIPlayerPriv__initBase__block_invoke()
{
  _QWORD *v0;
  os_log_t result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  result = os_log_create("com.apple.avfaudio", "avmp");
  *v0 = result;
  kAVMPScope = (uint64_t)v0;
  return result;
}

@end
