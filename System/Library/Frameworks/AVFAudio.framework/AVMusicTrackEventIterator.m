@implementation AVMusicTrackEventIterator

- (AVMusicTrackEventIterator)initWithImpl:(MusicTrackEventIteratorImpl *)a3
{
  AVMusicTrackEventIterator *v4;
  AVMusicTrackEventIterator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMusicTrackEventIterator;
  v4 = -[AVMusicTrackEventIterator init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
  }
  else if (a3)
  {
    DisposeMusicEventIterator(a3->var0);
    MEMORY[0x1A1AC5BD4](a3, 0x20C4093837F09);
  }
  return v5;
}

- (void)seek:(double)a3
{
  uint64_t v3;

  v3 = MusicEventIteratorSeek(self->_impl->var0, a3);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 698, (uint64_t)"Seek", (uint64_t)"MusicEventIteratorSeek(mIter, inTimeStamp)", v3, 0);
}

- (int)nextEvent
{
  OSStatus Event;
  _BOOL4 v3;
  char v4;

  Event = MusicEventIteratorNextEvent(self->_impl->var0);
  v3 = Event == 0;
  v4 = Event == -10857 || Event == 0;
  _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 704, "NextEvent", "result == noErr || result == kAudioToolboxErr_EndOfTrack", v4);
  return v3;
}

- (int)previousEvent
{
  OSStatus v2;
  _BOOL4 v3;
  char v4;

  v2 = MusicEventIteratorPreviousEvent(self->_impl->var0);
  v3 = v2 == 0;
  v4 = v2 == -10856 || v2 == 0;
  _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 711, "PreviousEvent", "result == noErr || result == kAudioToolboxErr_StartOfTrack", v4);
  return v3;
}

- (void)getEventInfo:(double *)a3 outEventType:(unsigned int *)a4 eventData:(void *)a5 dataSize:(unsigned int *)a6
{
  MusicEventIteratorGetEventInfo(self->_impl->var0, a3, a4, (const void **)a5, a6);
}

- (BOOL)setEventInfo:(unsigned int)a3 data:(const void *)a4
{
  MusicTrackEventIteratorImpl **impl;
  _BOOL4 HasCurrentEvent;
  uint64_t v8;

  impl = (MusicTrackEventIteratorImpl **)self->_impl;
  HasCurrentEvent = MusicTrackEventIteratorImpl::HasCurrentEvent(*impl);
  if (HasCurrentEvent)
  {
    v8 = MusicEventIteratorSetEventInfo((MusicEventIterator)*impl, a3, a4);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 727, (uint64_t)"SetEventInfo", (uint64_t)"MusicEventIteratorSetEventInfo(mIter, inEventType, inEventData)", v8, 0);
  }
  return !HasCurrentEvent;
}

- (BOOL)setEventTime:(double)a3
{
  MusicTrackEventIteratorImpl **impl;
  _BOOL4 HasCurrentEvent;
  uint64_t v6;

  impl = (MusicTrackEventIteratorImpl **)self->_impl;
  HasCurrentEvent = MusicTrackEventIteratorImpl::HasCurrentEvent(*impl);
  if (HasCurrentEvent)
  {
    v6 = MusicEventIteratorSetEventTime((MusicEventIterator)*impl, a3);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 736, (uint64_t)"SetEventTime", (uint64_t)"MusicEventIteratorSetEventTime(mIter, inTimeStamp)", v6, 0);
  }
  return !HasCurrentEvent;
}

- (void)deleteEvent
{
  MusicTrackEventIteratorImpl *impl;
  uint64_t v3;

  impl = self->_impl;
  if (MusicTrackEventIteratorImpl::HasCurrentEvent((MusicTrackEventIteratorImpl *)impl->var0))
  {
    v3 = MusicEventIteratorDeleteEvent(impl->var0);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 745, (uint64_t)"DeleteEvent", (uint64_t)"MusicEventIteratorDeleteEvent(mIter)", v3, 0);
  }
}

- (BOOL)hasPreviousEvent
{
  MusicTrackEventIteratorImpl *impl;
  uint64_t HasPreviousEvent;
  Boolean outHasPrevEvent;

  impl = self->_impl;
  outHasPrevEvent = 0;
  HasPreviousEvent = MusicEventIteratorHasPreviousEvent(impl->var0, &outHasPrevEvent);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 754, (uint64_t)"HasPreviousEvent", (uint64_t)"MusicEventIteratorHasPreviousEvent(mIter, &has)", HasPreviousEvent, 0);
  return outHasPrevEvent != 0;
}

- (BOOL)hasNextEvent
{
  MusicTrackEventIteratorImpl *impl;
  uint64_t HasNextEvent;
  Boolean outHasNextEvent;

  impl = self->_impl;
  outHasNextEvent = 0;
  HasNextEvent = MusicEventIteratorHasNextEvent(impl->var0, &outHasNextEvent);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 761, (uint64_t)"HasNextEvent", (uint64_t)"MusicEventIteratorHasNextEvent(mIter, &has)", HasNextEvent, 0);
  return outHasNextEvent != 0;
}

- (BOOL)hasCurrentEvent
{
  return MusicTrackEventIteratorImpl::HasCurrentEvent((MusicTrackEventIteratorImpl *)self->_impl->var0);
}

@end
