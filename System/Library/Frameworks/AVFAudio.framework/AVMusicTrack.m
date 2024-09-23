@implementation AVMusicTrack

- (AVMusicTrack)initWithImpl:(MusicTrackImpl *)a3
{
  AVMusicTrack *v4;
  AVMusicTrack *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMusicTrack;
  v4 = -[AVMusicTrack init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
  }
  else if (a3)
  {
    MusicTrackImpl::~MusicTrackImpl(a3);
    MEMORY[0x1A1AC5BD4]();
  }
  return v5;
}

- (void)dealloc
{
  MusicTrackImpl *impl;
  objc_super v4;

  impl = (MusicTrackImpl *)self->_impl;
  if (impl)
  {
    MusicTrackImpl::~MusicTrackImpl(impl);
    MEMORY[0x1A1AC5BD4]();
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMusicTrack;
  -[AVMusicTrack dealloc](&v4, sel_dealloc);
}

- (unint64_t)index
{
  MusicTrack *impl;
  uint64_t Sequence;
  uint64_t TrackIndex;
  UInt32 outTrackIndex;
  MusicSequence outSequence;

  impl = (MusicTrack *)self->_impl;
  outSequence = 0;
  outTrackIndex = 0;
  Sequence = MusicTrackGetSequence(*impl, &outSequence);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 587, (uint64_t)"GetIndex", (uint64_t)"MusicTrackGetSequence(mTrack, &sequence)", Sequence, 0);
  TrackIndex = MusicSequenceGetTrackIndex(outSequence, *impl, &outTrackIndex);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 588, (uint64_t)"GetIndex", (uint64_t)"MusicSequenceGetTrackIndex(sequence, mTrack, &index)", TrackIndex, 0);
  return outTrackIndex;
}

- (OpaqueMusicTrack)track
{
  return *(OpaqueMusicTrack **)self->_impl;
}

- (void)setDestinationAudioUnit:(AVAudioUnit *)destinationAudioUnit
{
  id *impl;
  AVAudioUnit *v5;
  AVAudioUnit *v6;
  uint64_t v7;

  impl = (id *)self->_impl;
  v5 = destinationAudioUnit;
  v6 = v5;
  if (impl[1] != v5)
  {
    if (v5)
      -[AVAudioUnit audioComponentDescription](v5, "audioComponentDescription");
    -[AVAudioUnit audioUnit](v6, "audioUnit");
    v7 = MusicTrackSetDestinationAU();
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 348, (uint64_t)"SetDestinationAudioUnit", (uint64_t)"MusicTrackSetDestinationAU(mTrack, inUnit.audioUnit, &desc)", v7, 0);
    objc_storeStrong(impl + 1, destinationAudioUnit);
  }

}

- (AVAudioUnit)destinationAudioUnit
{
  return (AVAudioUnit *)*((id *)self->_impl + 1);
}

- (void)setDestinationMIDIEndpoint:(MIDIEndpointRef)destinationMIDIEndpoint
{
  uint64_t v3;

  v3 = MusicTrackSetDestMIDIEndpoint(*(MusicTrack *)self->_impl, destinationMIDIEndpoint);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 361, (uint64_t)"SetDestinationMIDIEndpoint", (uint64_t)"MusicTrackSetDestMIDIEndpoint(mTrack, inEndPoint)", v3, 0);
}

- (MIDIEndpointRef)destinationMIDIEndpoint
{
  MusicTrack *impl;
  uint64_t DestMIDIEndpoint;
  MIDIEndpointRef outEndpoint;

  impl = (MusicTrack *)self->_impl;
  outEndpoint = 0;
  DestMIDIEndpoint = MusicTrackGetDestMIDIEndpoint(*impl, &outEndpoint);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 369, (uint64_t)"GetDestinationMIDIEndpoint", (uint64_t)"MusicTrackGetDestMIDIEndpoint(mTrack, &endPoint)", DestMIDIEndpoint, 0);
  return outEndpoint;
}

- (AVBeatRange)loopRange
{
  double LoopStart;
  MusicTrack *impl;
  uint64_t Property;
  double v6;
  double v7;
  double v8;
  UInt32 ioLength;
  _BYTE outData[8];
  double v11;
  AVBeatRange result;

  LoopStart = MusicTrackImpl::GetLoopStart(*(MusicTrackImpl **)self->_impl);
  impl = (MusicTrack *)self->_impl;
  ioLength = 24;
  Property = MusicTrackGetProperty(*impl, 7u, outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 501, (uint64_t)"GetLoopEnd", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
  v6 = v11;
  v7 = v6 - MusicTrackImpl::GetLoopStart(*(MusicTrackImpl **)self->_impl);
  v8 = LoopStart;
  result.length = v7;
  result.start = v8;
  return result;
}

- (void)setLoopRange:(AVBeatRange)loopRange
{
  double start;
  MusicTrack *impl;
  double v6;
  double v7;
  uint64_t Property;
  NSObject *v9;
  id v10;
  uint64_t v11;
  MusicTrack *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  UInt32 ioLength;
  double outData;
  double v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  start = loopRange.start;
  v28 = *MEMORY[0x1E0C80C00];
  impl = (MusicTrack *)self->_impl;
  v6 = -0.0;
  if (loopRange.length != 1.79769313e308)
    v6 = start;
  v7 = loopRange.length + v6;
  ioLength = 24;
  Property = MusicTrackGetProperty(*impl, 7u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 490, (uint64_t)"SetLoopEnd", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
  v19 = v7;
  if (kAVASScope)
  {
    v9 = *(id *)kAVASScope;
    if (!v9)
      goto LABEL_10;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "AVAudioSequencerImpl.mm";
    v22 = 1024;
    v23 = 493;
    v24 = 2048;
    v25 = v7;
    v26 = 2048;
    v27 = outData;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d end -> %.2f [start %.2f]", buf, 0x26u);
  }

LABEL_10:
  v11 = MusicTrackSetProperty(*impl, 7u, &outData, ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 494, (uint64_t)"SetLoopEnd", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, pLen)", v11, 0);
  v12 = (MusicTrack *)self->_impl;
  ioLength = 24;
  v13 = MusicTrackGetProperty(*v12, 7u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 471, (uint64_t)"SetLoopStart", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", v13, 0);
  outData = start;
  if (kAVASScope)
  {
    v14 = *(id *)kAVASScope;
    if (!v14)
      goto LABEL_17;
  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "AVAudioSequencerImpl.mm";
    v22 = 1024;
    v23 = 474;
    v24 = 2048;
    v25 = start;
    v26 = 2048;
    v27 = v19;
    _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d start -> %.2f [end %.2f]", buf, 0x26u);
  }

LABEL_17:
  v16 = MusicTrackSetProperty(*v12, 7u, &outData, ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 475, (uint64_t)"SetLoopStart", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, pLen)", v16, 0);
}

- (BOOL)isLoopingEnabled
{
  MusicTrack *impl;
  uint64_t Property;
  UInt32 ioLength;
  _BYTE outData[16];
  int v7;

  impl = (MusicTrack *)self->_impl;
  ioLength = 24;
  Property = MusicTrackGetProperty(*impl, 7u, outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 526, (uint64_t)"IsLoopingEnabled", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
  return v7 != -1;
}

- (void)setLoopingEnabled:(BOOL)loopingEnabled
{
  void *impl;
  _BOOL4 v4;
  uint64_t Property;
  int v6;
  double LengthInBeats;
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  UInt32 ioLength;
  double outData;
  double v14;
  int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (*((_BYTE *)impl + 16) != loopingEnabled)
  {
    v4 = loopingEnabled;
    ioLength = 24;
    Property = MusicTrackGetProperty(*(MusicTrack *)impl, 7u, &outData, &ioLength);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 510, (uint64_t)"EnableLooping", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
    if (v4)
      v6 = *((_DWORD *)impl + 5);
    else
      v6 = -1;
    v15 = v6;
    LengthInBeats = v14;
    if (v14 <= outData)
      LengthInBeats = MusicTrackImpl::DoGetLengthInBeats(*(MusicTrackImpl **)impl);
    v14 = LengthInBeats;
    if (kAVASScope)
    {
      v8 = *(id *)kAVASScope;
      if (!v8)
      {
LABEL_16:
        v11 = MusicTrackSetProperty(*(MusicTrack *)impl, 7u, &outData, ioLength);
        _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 517, (uint64_t)"EnableLooping", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, pLen)", v11, 0);
        *((_BYTE *)impl + 16) = v4;
        return;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = "dis";
      v17 = "AVAudioSequencerImpl.mm";
      v18 = 1024;
      *(_DWORD *)buf = 136316162;
      if (v4)
        v10 = "en";
      v19 = 516;
      v20 = 2080;
      v21 = v10;
      v22 = 2048;
      v23 = outData;
      v24 = 2048;
      v25 = LengthInBeats;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %sabling looping [%.2f - %.2f]", buf, 0x30u);
    }

    goto LABEL_16;
  }
}

- (NSInteger)numberOfLoops
{
  MusicTrack *impl;
  uint64_t Property;
  int v4;
  UInt32 ioLength;
  _BYTE outData[16];
  int v8;

  impl = (MusicTrack *)self->_impl;
  if (*((_BYTE *)impl + 16))
  {
    ioLength = 24;
    Property = MusicTrackGetProperty(*impl, 7u, outData, &ioLength);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 458, (uint64_t)"GetLoopCount", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
    v4 = v8;
  }
  else
  {
    v4 = *((_DWORD *)impl + 5);
  }
  if (!v4)
    return -1;
  return v4;
}

- (void)setNumberOfLoops:(NSInteger)numberOfLoops
{
  int v3;
  _DWORD *impl;
  int v6;
  uint64_t Property;
  uint64_t v8;
  UInt32 ioLength;
  _BYTE outData[16];
  int v11;

  v3 = numberOfLoops;
  _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 389, "-[AVMusicTrack setNumberOfLoops:]", "numberOfLoops != 0", numberOfLoops != 0);
  impl = self->_impl;
  if (v3 == -1)
    v6 = 0;
  else
    v6 = v3;
  impl[5] = v6;
  if (*((_BYTE *)impl + 16))
  {
    ioLength = 24;
    Property = MusicTrackGetProperty(*(MusicTrack *)impl, 7u, outData, &ioLength);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 446, (uint64_t)"SetLoopCount", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
    v11 = impl[5];
    v8 = MusicTrackSetProperty(*(MusicTrack *)impl, 7u, outData, ioLength);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 448, (uint64_t)"SetLoopCount", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, pLen)", v8, 0);
  }
}

- (AVMusicTimeStamp)offsetTime
{
  MusicTrack *impl;
  uint64_t Property;
  UInt32 ioLength;
  double outData;

  impl = (MusicTrack *)self->_impl;
  outData = 0.0;
  ioLength = 8;
  Property = MusicTrackGetProperty(*impl, 1u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 424, (uint64_t)"GetOffset", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_OffsetTime, &offset, &pLen)", Property, 0);
  return outData;
}

- (void)setOffsetTime:(AVMusicTimeStamp)offsetTime
{
  MusicTrack *impl;
  uint64_t v4;
  AVMusicTimeStamp inData;

  impl = (MusicTrack *)self->_impl;
  inData = offsetTime;
  v4 = MusicTrackSetProperty(*impl, 1u, &inData, 8u);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 417, (uint64_t)"SetOffset", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_OffsetTime, &inOffset, sizeof(inOffset))", v4, 0);
}

- (BOOL)isMuted
{
  MusicTrack *impl;
  uint64_t Property;
  UInt32 ioLength;
  char outData;

  impl = (MusicTrack *)self->_impl;
  outData = 0;
  ioLength = 1;
  Property = MusicTrackGetProperty(*impl, 2u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 541, (uint64_t)"IsMuted", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_MuteStatus, &muteStatus, &pLen)", Property, 0);
  return outData != 0;
}

- (void)setMuted:(BOOL)muted
{
  MusicTrack *impl;
  uint64_t v4;
  BOOL inData;

  impl = (MusicTrack *)self->_impl;
  inData = muted;
  v4 = MusicTrackSetProperty(*impl, 2u, &inData, 1u);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 534, (uint64_t)"Mute", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_MuteStatus, &muteStatus, pLen)", v4, 0);
}

- (BOOL)isSoloed
{
  MusicTrack *impl;
  uint64_t Property;
  UInt32 ioLength;
  char outData;

  impl = (MusicTrack *)self->_impl;
  outData = 0;
  ioLength = 1;
  Property = MusicTrackGetProperty(*impl, 3u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 556, (uint64_t)"IsSoloed", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_SoloStatus, &soloStatus, &pLen)", Property, 0);
  return outData != 0;
}

- (void)setSoloed:(BOOL)soloed
{
  MusicTrack *impl;
  uint64_t v4;
  BOOL inData;

  impl = (MusicTrack *)self->_impl;
  inData = soloed;
  v4 = MusicTrackSetProperty(*impl, 3u, &inData, 1u);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 549, (uint64_t)"Solo", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_SoloStatus, &soloStatus, pLen)", v4, 0);
}

- (BOOL)usesAutomatedParameters
{
  return MusicTrackImpl::UsesAutomatedParams(*(MusicTrackImpl **)self->_impl);
}

- (void)setUsesAutomatedParameters:(BOOL)usesAutomatedParameters
{
  MusicTrackImpl::UseAutomatedParams(*(MusicTrackImpl **)self->_impl, usesAutomatedParameters);
}

- (AVMusicTimeStamp)lengthInBeats
{
  return MusicTrackImpl::DoGetLengthInBeats(*(MusicTrackImpl **)self->_impl);
}

- (void)setLengthInBeats:(AVMusicTimeStamp)lengthInBeats
{
  MusicTrackImpl::DoSetLengthInBeats(*(MusicTrackImpl **)self->_impl, lengthInBeats);
}

- (NSTimeInterval)lengthInSeconds
{
  MusicTrack *impl;
  uint64_t Sequence;
  OpaqueMusicSequence *v4;
  double LengthInBeats;
  uint64_t SecondsForBeats;
  double v8;
  MusicSequence outSequence;

  impl = (MusicTrack *)self->_impl;
  v8 = 0.0;
  outSequence = 0;
  Sequence = MusicTrackGetSequence(*impl, &outSequence);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 410, (uint64_t)"GetLengthInSeconds", (uint64_t)"MusicTrackGetSequence(mTrack, &seq)", Sequence, 0);
  v4 = outSequence;
  LengthInBeats = MusicTrackImpl::DoGetLengthInBeats((MusicTrackImpl *)*impl);
  SecondsForBeats = MusicSequenceGetSecondsForBeats(v4, LengthInBeats, &v8);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 411, (uint64_t)"GetLengthInSeconds", (uint64_t)"MusicSequenceGetSecondsForBeats(seq, DoGetLengthInBeats(), &seconds)", SecondsForBeats, 0);
  return v8;
}

- (void)setLengthInSeconds:(NSTimeInterval)lengthInSeconds
{
  MusicTrack *impl;
  uint64_t Sequence;
  uint64_t BeatsForSeconds;
  MusicTimeStamp v7;
  MusicSequence outSequence;

  impl = (MusicTrack *)self->_impl;
  v7 = 0.0;
  outSequence = 0;
  Sequence = MusicTrackGetSequence(*impl, &outSequence);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 401, (uint64_t)"SetLengthInSeconds", (uint64_t)"MusicTrackGetSequence(mTrack, &seq)", Sequence, 0);
  BeatsForSeconds = MusicSequenceGetBeatsForSeconds(outSequence, lengthInSeconds, &v7);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 402, (uint64_t)"SetLengthInSeconds", (uint64_t)"MusicSequenceGetBeatsForSeconds(seq, inLength, &beatLength)", BeatsForSeconds, 0);
  MusicTrackImpl::DoSetLengthInBeats((MusicTrackImpl *)*impl, v7);
}

- (NSUInteger)timeResolution
{
  MusicTrack *impl;
  uint64_t Property;
  UInt32 ioLength;
  __int16 outData;

  impl = (MusicTrack *)self->_impl;
  outData = 0;
  ioLength = 2;
  Property = MusicTrackGetProperty(*impl, 6u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 579, (uint64_t)"GetTimeResolution", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_TimeResolution, &timeRes, &pLen)", Property, 0);
  return outData;
}

- (void)doAddMIDINoteEvent:(id)a3 atBeat:(double)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = MusicTrackNewMIDINoteEvent(*(MusicTrack *)self->_impl, a4, (const MIDINoteMessage *)objc_msgSend(v7, "message"));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 637, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewMIDINoteEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);

}

- (void)doAddMIDIChannelEvent:(id)a3 atBeat:(double)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = MusicTrackNewMIDIChannelEvent(*(MusicTrack *)self->_impl, a4, (const MIDIChannelMessage *)objc_msgSend(v7, "message"));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 642, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewMIDIChannelEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);

}

- (void)doAddMIDISysexEvent:(id)a3 atBeat:(double)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = MusicTrackNewMIDIRawDataEvent(*(MusicTrack *)self->_impl, a4, (const MIDIRawData *)objc_msgSend(v7, "rawData"));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 647, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewMIDIRawDataEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);

}

- (void)doAddExtendedNoteOnEvent:(id)a3 atBeat:(double)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = MusicTrackNewExtendedNoteEvent(*(MusicTrack *)self->_impl, a4, (const ExtendedNoteOnEvent *)objc_msgSend(v7, "event"));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 652, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewExtendedNoteEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);

}

- (void)doAddParameterEvent:(id)a3 atBeat:(double)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = MusicTrackNewParameterEvent(*(MusicTrack *)self->_impl, a4, (const ParameterEvent *)objc_msgSend(v7, "event"));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 657, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewParameterEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);

}

- (void)doAddExtendedTempoEvent:(id)a3 atBeat:(double)a4
{
  id v6;
  MusicTrack *impl;
  Float64 v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  impl = (MusicTrack *)self->_impl;
  v10 = v6;
  objc_msgSend(v6, "tempo");
  v9 = MusicTrackNewExtendedTempoEvent(*impl, a4, v8);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 677, (uint64_t)"AddExtendedTempoEvent", (uint64_t)"MusicTrackNewExtendedTempoEvent(mTrack, inTimeStamp, inTempo)", v9, 0);

}

- (void)doAddMIDIMetaEvent:(id)a3 atBeat:(double)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = MusicTrackNewMetaEvent(*(MusicTrack *)self->_impl, a4, (const MIDIMetaEvent *)objc_msgSend(v7, "metaEvent"));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 662, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewMetaEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);

}

- (void)doAddUserEvent:(id)a3 atBeat:(double)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = MusicTrackNewUserEvent(*(MusicTrack *)self->_impl, a4, (const MusicEventUserData *)objc_msgSend(v7, "userData"));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 667, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewUserEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);

}

- (void)doAddAUPresetEvent:(id)a3 atBeat:(double)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = MusicTrackNewAUPresetEvent(*(MusicTrack *)self->_impl, a4, (const AUPresetEvent *)objc_msgSend(v7, "event"));
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 672, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewAUPresetEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);

}

- (void)addEvent:(AVMusicEvent *)event atBeat:(AVMusicTimeStamp)beat
{
  AVMusicEvent *v6;

  v6 = event;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVMusicTrack doAddMIDINoteEvent:atBeat:](self, "doAddMIDINoteEvent:atBeat:", v6, beat);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVMusicTrack doAddMIDIChannelEvent:atBeat:](self, "doAddMIDIChannelEvent:atBeat:", v6, beat);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AVMusicTrack doAddMIDISysexEvent:atBeat:](self, "doAddMIDISysexEvent:atBeat:", v6, beat);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[AVMusicTrack doAddMIDIMetaEvent:atBeat:](self, "doAddMIDIMetaEvent:atBeat:", v6, beat);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[AVMusicTrack doAddUserEvent:atBeat:](self, "doAddUserEvent:atBeat:", v6, beat);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[AVMusicTrack doAddExtendedNoteOnEvent:atBeat:](self, "doAddExtendedNoteOnEvent:atBeat:", v6, beat);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[AVMusicTrack doAddParameterEvent:atBeat:](self, "doAddParameterEvent:atBeat:", v6, beat);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[AVMusicTrack doAddAUPresetEvent:atBeat:](self, "doAddAUPresetEvent:atBeat:", v6, beat);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    -[AVMusicTrack doAddExtendedTempoEvent:atBeat:](self, "doAddExtendedTempoEvent:atBeat:", v6, beat);
                  else
                    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("AVMusicEvent was not of any known class"));
                }
              }
            }
          }
        }
      }
    }
  }

}

- (void)moveEventsInRange:(AVBeatRange)range byAmount:(AVMusicTimeStamp)beatAmount
{
  double start;
  uint64_t v5;

  start = -0.0;
  if (range.length != 1.79769313e308)
    start = range.start;
  v5 = MusicTrackMoveEvents(*(MusicTrack *)self->_impl, range.start, range.length + start, beatAmount);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 596, (uint64_t)"MoveEvents", (uint64_t)"MusicTrackMoveEvents(mTrack, inStartBeat, inEndBeat, inToBeat)", v5, 0);
}

- (void)clearEventsInRange:(AVBeatRange)range
{
  double start;
  uint64_t v4;

  start = -0.0;
  if (range.length != 1.79769313e308)
    start = range.start;
  v4 = MusicTrackClear(*(MusicTrack *)self->_impl, range.start, range.length + start);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 601, (uint64_t)"ClearEvents", (uint64_t)"MusicTrackClear(mTrack, inStartBeat, inEndBeat)", v4, 0);
}

- (void)cutEventsInRange:(AVBeatRange)range
{
  double start;
  uint64_t v4;

  start = -0.0;
  if (range.length != 1.79769313e308)
    start = range.start;
  v4 = MusicTrackCut(*(MusicTrack *)self->_impl, range.start, range.length + start);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 606, (uint64_t)"CutEvents", (uint64_t)"MusicTrackCut(mTrack, inStartBeat, inEndBeat)", v4, 0);
}

- (void)copyEventsInRange:(AVBeatRange)range fromTrack:(AVMusicTrack *)sourceTrack insertAtBeat:(AVMusicTimeStamp)insertStartBeat
{
  double length;
  double start;
  AVMusicTrack *v9;
  MusicTrack *impl;
  OpaqueMusicTrack *v11;
  double v12;
  uint64_t v13;
  AVMusicTrack *v14;

  length = range.length;
  start = range.start;
  v9 = sourceTrack;
  impl = (MusicTrack *)self->_impl;
  v14 = v9;
  v11 = -[AVMusicTrack track](v9, "track");
  v12 = -0.0;
  if (length != 1.79769313e308)
    v12 = start;
  v13 = MusicTrackCopyInsert(v11, start, length + v12, *impl, insertStartBeat);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 618, (uint64_t)"CopyInsertEvents", (uint64_t)"MusicTrackCopyInsert(inSourceTrack, inSourceStartBeat, inSourceEndBeat, mTrack, inInsertBeat)", v13, 0);

}

- (void)copyAndMergeEventsInRange:(AVBeatRange)range fromTrack:(AVMusicTrack *)sourceTrack mergeAtBeat:(AVMusicTimeStamp)mergeStartBeat
{
  double length;
  double start;
  AVMusicTrack *v9;
  MusicTrack *impl;
  OpaqueMusicTrack *v11;
  double v12;
  uint64_t v13;
  AVMusicTrack *v14;

  length = range.length;
  start = range.start;
  v9 = sourceTrack;
  impl = (MusicTrack *)self->_impl;
  v14 = v9;
  v11 = -[AVMusicTrack track](v9, "track");
  v12 = -0.0;
  if (length != 1.79769313e308)
    v12 = start;
  v13 = MusicTrackMerge(v11, start, length + v12, *impl, mergeStartBeat);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 630, (uint64_t)"CopyMergeEvents", (uint64_t)"MusicTrackMerge(inSourceTrack, inSourceStartBeat, inSourceEndBeat, mTrack, inInsertBeat)", v13, 0);

}

- (void)enumerateEventsInRange:(AVBeatRange)range usingBlock:(AVMusicEventEnumerationBlock)block
{
  double length;
  double start;
  void (**v8)(AVMusicEventEnumerationBlock, void *, double *, _BYTE *);
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  AVExtendedNoteOnEvent *v15;
  uint64_t v16;
  AVExtendedTempoEvent *v17;
  AVMusicUserEvent *v18;
  AVMIDIMetaEvent *v19;
  AVMIDINoteEvent *v20;
  unsigned int v21;
  AVMIDISysexEvent *v22;
  AVParameterEvent *v23;
  AVAUPresetEvent *v24;
  double v25;
  uint64_t v26;
  const void *v27;
  size_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  double v34;
  _DWORD __n[4];
  unsigned int v36;
  double v37;

  length = range.length;
  start = range.start;
  v8 = block;
  -[AVMusicTrack createEventIterator](self, "createEventIterator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (length == 1.79769313e308)
    v11 = -0.0;
  else
    v11 = start;
  objc_msgSend(v9, "seek:", start);
  v12 = length + v11;
  while (objc_msgSend(v10, "hasCurrentEvent"))
  {
    v37 = 0.0;
    v36 = 0;
    *(_QWORD *)&__n[1] = 0;
    __n[0] = 0;
    objc_msgSend(v10, "getEventInfo:outEventType:eventData:dataSize:", &v37, &v36, &__n[1], __n);
    if (v37 > v12)
      break;
    v13 = 0;
    switch(v36)
    {
      case 0u:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v37);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAudioSequencer.mm"), 598, CFSTR("Should never get a NULL event type"));

        goto LABEL_16;
      case 1u:
        v15 = [AVExtendedNoteOnEvent alloc];
        v16 = -[AVExtendedNoteOnEvent initWithNoteOnEvent:](v15, "initWithNoteOnEvent:", *(_QWORD *)&__n[1]);
        goto LABEL_20;
      case 3u:
        v17 = [AVExtendedTempoEvent alloc];
        v16 = -[AVExtendedTempoEvent initWithTempo:](v17, "initWithTempo:", **(double **)&__n[1]);
        goto LABEL_20;
      case 4u:
        v18 = [AVMusicUserEvent alloc];
        v16 = -[AVMusicUserEvent initWithUserData:](v18, "initWithUserData:", *(_QWORD *)&__n[1]);
        goto LABEL_20;
      case 5u:
        v19 = [AVMIDIMetaEvent alloc];
        v16 = -[AVMIDIMetaEvent initWithMetaEvent:](v19, "initWithMetaEvent:", *(_QWORD *)&__n[1]);
        goto LABEL_20;
      case 6u:
        v20 = [AVMIDINoteEvent alloc];
        v16 = -[AVMIDINoteEvent initWithMessage:](v20, "initWithMessage:", *(_QWORD *)&__n[1]);
        goto LABEL_20;
      case 7u:
        v21 = (**(_BYTE **)&__n[1] & 0xF0) - 160;
        if (v21 >= 0x50)
        {
LABEL_16:
          v13 = 0;
        }
        else
        {
          v16 = objc_msgSend(objc_alloc(*off_1E3BECA48[v21 >> 4]), "initWithMessage:", *(_QWORD *)&__n[1]);
LABEL_20:
          v13 = (void *)v16;
        }
LABEL_21:
        v34 = v37;
        v33 = 0;
        v8[2](v8, v13, &v34, &v33);
        if (v33)
        {
          objc_msgSend(v10, "deleteEvent");
        }
        else
        {
          v25 = v34;
          if (v34 != v37)
            objc_msgSend(v10, "setEventTime:", v34);
          v32 = 0;
          switch(v36)
          {
            case 1u:
            case 9u:
              v31 = objc_msgSend(v13, "event", v25);
              goto LABEL_29;
            case 3u:
              objc_msgSend(v13, "tempo", v25);
              v32 = v26;
              v27 = *(const void **)&__n[1];
              v28 = __n[0];
              v29 = &v32;
              v30 = &v32;
              goto LABEL_30;
            case 6u:
            case 7u:
              v31 = objc_msgSend(v13, "message", v25);
LABEL_29:
              v29 = (uint64_t *)v31;
              v27 = *(const void **)&__n[1];
              v28 = __n[0];
              v30 = v29;
LABEL_30:
              if (memcmp(v27, v30, v28))
                objc_msgSend(v10, "setEventInfo:data:", v36, v29);
              break;
            case 0xAu:
              objc_msgSend(v13, "event", v25);
              break;
            default:
              break;
          }
          objc_msgSend(v10, "nextEvent", v25);
        }

        break;
      case 8u:
        v22 = [AVMIDISysexEvent alloc];
        v16 = -[AVMIDISysexEvent initWithMIDIRawData:](v22, "initWithMIDIRawData:", *(_QWORD *)&__n[1]);
        goto LABEL_20;
      case 9u:
        v23 = [AVParameterEvent alloc];
        v16 = -[AVParameterEvent initWithParameterEvent:](v23, "initWithParameterEvent:", *(_QWORD *)&__n[1]);
        goto LABEL_20;
      case 0xAu:
        v24 = [AVAUPresetEvent alloc];
        v16 = -[AVAUPresetEvent initWithAUPresetEvent:](v24, "initWithAUPresetEvent:", *(_QWORD *)&__n[1]);
        goto LABEL_20;
      default:
        goto LABEL_21;
    }
  }

}

- (id)createEventIterator
{
  AVMusicTrackEventIterator *v3;
  _QWORD *v4;
  MusicTrack *impl;
  uint64_t v6;
  MusicEventIterator outIterator;

  v3 = [AVMusicTrackEventIterator alloc];
  v4 = (_QWORD *)operator new();
  impl = (MusicTrack *)self->_impl;
  outIterator = 0;
  v6 = NewMusicEventIterator(*impl, &outIterator);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 685, (uint64_t)"NewEventIterator", (uint64_t)"NewMusicEventIterator(mTrack, &theIterator)", v6, 0);
  *v4 = outIterator;
  return -[AVMusicTrackEventIterator initWithImpl:](v3, "initWithImpl:", v4);
}

@end
