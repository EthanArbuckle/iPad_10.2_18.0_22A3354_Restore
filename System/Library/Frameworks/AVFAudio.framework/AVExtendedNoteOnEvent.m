@implementation AVExtendedNoteOnEvent

- (AVExtendedNoteOnEvent)initWithMIDINote:(float)midiNote velocity:(float)velocity instrumentID:(UInt32)instrumentID groupID:(UInt32)groupID duration:(AVMusicTimeStamp)duration
{
  AVExtendedNoteOnEvent *v12;
  ExtendedNoteOnEvent *v13;
  Float32 v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVExtendedNoteOnEvent;
  v12 = -[AVExtendedNoteOnEvent init](&v16, sel_init);
  if (v12)
  {
    v13 = (ExtendedNoteOnEvent *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v12->_event = v13;
    v13->instrumentID = instrumentID;
    v13->groupID = groupID;
    v14 = duration;
    v13->duration = v14;
    v13->extendedParams.argCount = 2;
    v13->extendedParams.mPitch = midiNote;
    v13->extendedParams.mVelocity = velocity;
    v13->extendedParams.mControls[0] = 0;
  }
  return v12;
}

- (AVExtendedNoteOnEvent)initWithMIDINote:(float)midiNote velocity:(float)velocity groupID:(UInt32)groupID duration:(AVMusicTimeStamp)duration
{
  AVExtendedNoteOnEvent *v10;
  ExtendedNoteOnEvent *v11;
  Float32 v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVExtendedNoteOnEvent;
  v10 = -[AVExtendedNoteOnEvent init](&v14, sel_init);
  if (v10)
  {
    v11 = (ExtendedNoteOnEvent *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v10->_event = v11;
    v11->instrumentID = -1;
    v11->groupID = groupID;
    v12 = duration;
    v11->duration = v12;
    v11->extendedParams.argCount = 2;
    v11->extendedParams.mPitch = midiNote;
    v11->extendedParams.mVelocity = velocity;
    v11->extendedParams.mControls[0] = 0;
  }
  return v10;
}

- (float)midiNote
{
  return self->_event->extendedParams.mPitch;
}

- (void)setMidiNote:(float)midiNote
{
  self->_event->extendedParams.mPitch = midiNote;
}

- (float)velocity
{
  return self->_event->extendedParams.mVelocity;
}

- (void)setVelocity:(float)velocity
{
  self->_event->extendedParams.mVelocity = velocity;
}

- (UInt32)instrumentID
{
  return self->_event->instrumentID;
}

- (void)setInstrumentID:(UInt32)instrumentID
{
  self->_event->instrumentID = instrumentID;
}

- (UInt32)groupID
{
  return self->_event->groupID;
}

- (void)setGroupID:(UInt32)groupID
{
  self->_event->groupID = groupID;
}

- (AVMusicTimeStamp)duration
{
  return self->_event->duration;
}

- (void)setDuration:(AVMusicTimeStamp)duration
{
  Float32 v3;

  v3 = duration;
  self->_event->duration = v3;
}

- (AVExtendedNoteOnEvent)initWithNoteOnEvent:(ExtendedNoteOnEvent *)a3
{
  AVExtendedNoteOnEvent *v4;
  ExtendedNoteOnEvent *v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVExtendedNoteOnEvent;
  v4 = -[AVExtendedNoteOnEvent init](&v8, sel_init);
  if (v4)
  {
    v5 = (ExtendedNoteOnEvent *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v4->_event = v5;
    v6 = *(_OWORD *)&a3->extendedParams.mPitch;
    *(_OWORD *)&v5->instrumentID = *(_OWORD *)&a3->instrumentID;
    *(_OWORD *)&v5->extendedParams.mPitch = v6;
    v4->_event->extendedParams.argCount = 2;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_event);
  v3.receiver = self;
  v3.super_class = (Class)AVExtendedNoteOnEvent;
  -[AVExtendedNoteOnEvent dealloc](&v3, sel_dealloc);
}

- (ExtendedNoteOnEvent)event
{
  return self->_event;
}

@end
