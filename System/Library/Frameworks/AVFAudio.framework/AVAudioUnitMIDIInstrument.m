@implementation AVAudioUnitMIDIInstrument

- (AVAudioUnitMIDIInstrument)initWithAudioComponentDescription:(AudioComponentDescription *)description
{
  OSType componentType;
  NSObject *v8;
  _QWORD *v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  componentType = description->componentType;
  if (description->componentType != 1635085673 && componentType != 1635085685 && componentType != 1635086953)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "AVAEInternal.h";
      v13 = 1024;
      v14 = 71;
      v15 = 2080;
      v16 = "AVAudioUnitMIDIInstrument.mm";
      v17 = 1024;
      v18 = 94;
      v19 = 2080;
      v20 = "-[AVAudioUnitMIDIInstrument initWithAudioComponentDescription:]";
      v21 = 2080;
      v22 = "(description.componentType == kAudioUnitType_MusicDevice) || (description.componentType == kAudioUnitType_MI"
            "DIProcessor) || (description.componentType == kAudioUnitType_RemoteInstrument)";
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "(description.componentType == kAudioUnitType_MusicDevice) || (description.componentType == kAudioUnitType_MIDIProcessor) || (description.componentType == kAudioUnitType_RemoteInstrument)");
  }
  v9 = (_QWORD *)operator new();
  AVAudioNodeImpl::AVAudioNodeImpl((uint64_t)v9, 0, description, 0);
  *v9 = &off_1E3BE9320;
  return -[AVAudioNode initWithImpl:](self, "initWithImpl:", v9);
}

- (void)startNote:(uint8_t)note withVelocity:(uint8_t)velocity onChannel:(uint8_t)channel
{
  int v5;
  NSObject *v6;
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
  uint64_t v20;

  v5 = note;
  v20 = *MEMORY[0x1E0C80C00];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 144, note, velocity, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v9 = "AVAudioUnitMIDIInstrument.mm";
      v10 = 1024;
      v11 = 27;
      v12 = 1024;
      LODWORD(v13) = v5;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Unable to start playing the note %d\n", buf, 0x18u);
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    }
    v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v9 = "AVAEInternal.h";
      v10 = 1024;
      v11 = 71;
      v12 = 2080;
      v13 = "AVAudioUnitMIDIInstrument.mm";
      v14 = 1024;
      v15 = 102;
      v16 = 2080;
      v17 = "-[AVAudioUnitMIDIInstrument startNote:withVelocity:onChannel:]";
      v18 = 2080;
      v19 = "_IMPL->StartNote(note, velocity, channel)";
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->StartNote(note, velocity, channel)");
  }
}

- (void)stopNote:(uint8_t)note onChannel:(uint8_t)channel
{
  int v4;
  NSObject *v5;
  NSObject *v6;
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
  uint64_t v19;

  v4 = note;
  v19 = *MEMORY[0x1E0C80C00];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 128, note, 0, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v8 = "AVAudioUnitMIDIInstrument.mm";
      v9 = 1024;
      v10 = 36;
      v11 = 1024;
      LODWORD(v12) = v4;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Unable to stop playing the note %d\n", buf, 0x18u);
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    }
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v8 = "AVAEInternal.h";
      v9 = 1024;
      v10 = 71;
      v11 = 2080;
      v12 = "AVAudioUnitMIDIInstrument.mm";
      v13 = 1024;
      v14 = 107;
      v15 = 2080;
      v16 = "-[AVAudioUnitMIDIInstrument stopNote:onChannel:]";
      v17 = 2080;
      v18 = "_IMPL->StopNote(note, channel)";
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->StopNote(note, channel)");
  }
}

- (void)sendController:(uint8_t)controller withValue:(uint8_t)value onChannel:(uint8_t)channel
{
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
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 176, controller, value, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v7 = "AVAEInternal.h";
      v8 = 1024;
      v9 = 71;
      v10 = 2080;
      v11 = "AVAudioUnitMIDIInstrument.mm";
      v12 = 1024;
      v13 = 113;
      v14 = 2080;
      v15 = "-[AVAudioUnitMIDIInstrument sendController:withValue:onChannel:]";
      v16 = 2080;
      v17 = "_IMPL->SendMIDIEvent(kMIDIMessage_ControlChange, controller, controllerValue, 0, channel)";
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendMIDIEvent(kMIDIMessage_ControlChange, controller, controllerValue, 0, channel)");
  }
}

- (void)sendPitchBend:(uint16_t)pitchbend onChannel:(uint8_t)channel
{
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
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 224, pitchbend & 0x7F, (pitchbend >> 7), channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v6 = "AVAEInternal.h";
      v7 = 1024;
      v8 = 71;
      v9 = 2080;
      v10 = "AVAudioUnitMIDIInstrument.mm";
      v11 = 1024;
      v12 = 121;
      v13 = 2080;
      v14 = "-[AVAudioUnitMIDIInstrument sendPitchBend:onChannel:]";
      v15 = 2080;
      v16 = "_IMPL->SendMIDIEvent(kMIDIMessage_PitchBend, value&0x7F, value>>7, 0, channel)";
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendMIDIEvent(kMIDIMessage_PitchBend, value&0x7F, value>>7, 0, channel)");
  }
}

- (void)sendPressure:(uint8_t)pressure onChannel:(uint8_t)channel
{
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
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 208, pressure, 0, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v6 = "AVAEInternal.h";
      v7 = 1024;
      v8 = 71;
      v9 = 2080;
      v10 = "AVAudioUnitMIDIInstrument.mm";
      v11 = 1024;
      v12 = 128;
      v13 = 2080;
      v14 = "-[AVAudioUnitMIDIInstrument sendPressure:onChannel:]";
      v15 = 2080;
      v16 = "_IMPL->SendMIDIEvent(kMIDIMessage_ChannelPressure, pressureValue, 0, 0, channel)";
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendMIDIEvent(kMIDIMessage_ChannelPressure, pressureValue, 0, 0, channel)");
  }
}

- (void)sendPressureForKey:(uint8_t)key withValue:(uint8_t)value onChannel:(uint8_t)channel
{
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
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 160, key, (float)((float)((float)value * 127.0) + 0.5), channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v7 = "AVAEInternal.h";
      v8 = 1024;
      v9 = 71;
      v10 = 2080;
      v11 = "AVAudioUnitMIDIInstrument.mm";
      v12 = 1024;
      v13 = 134;
      v14 = 2080;
      v15 = "-[AVAudioUnitMIDIInstrument sendPressureForKey:withValue:onChannel:]";
      v16 = 2080;
      v17 = "_IMPL->SendMIDIEvent(kMIDIMessage_KeyPressure, key, pressureValue, 0, channel)";
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendMIDIEvent(kMIDIMessage_KeyPressure, key, pressureValue, 0, channel)");
  }
}

- (void)sendProgramChange:(uint8_t)program onChannel:(uint8_t)channel
{
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
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 192, program, 0, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v6 = "AVAEInternal.h";
      v7 = 1024;
      v8 = 71;
      v9 = 2080;
      v10 = "AVAudioUnitMIDIInstrument.mm";
      v11 = 1024;
      v12 = 140;
      v13 = 2080;
      v14 = "-[AVAudioUnitMIDIInstrument sendProgramChange:onChannel:]";
      v15 = 2080;
      v16 = "_IMPL->SendMIDIEvent(kMIDIMessage_PatchChange, program, 0, 0, channel)";
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendMIDIEvent(kMIDIMessage_PatchChange, program, 0, 0, channel)");
  }
}

- (void)sendProgramChange:(uint8_t)program bankMSB:(uint8_t)bankMSB bankLSB:(uint8_t)bankLSB onChannel:(uint8_t)channel
{
  NSObject *v6;
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
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)self->super.super._impl + 464))(self->super.super._impl, program, bankMSB, bankLSB, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v8 = "AVAEInternal.h";
      v9 = 1024;
      v10 = 71;
      v11 = 2080;
      v12 = "AVAudioUnitMIDIInstrument.mm";
      v13 = 1024;
      v14 = 146;
      v15 = 2080;
      v16 = "-[AVAudioUnitMIDIInstrument sendProgramChange:bankMSB:bankLSB:onChannel:]";
      v17 = 2080;
      v18 = "_IMPL->SendProgramChange(program, bankMSB, bankLSB, channel)";
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendProgramChange(program, bankMSB, bankLSB, channel)");
  }
}

- (void)sendMIDIEvent:(uint8_t)midiStatus data1:(uint8_t)data1 data2:(uint8_t)data2
{
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
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, midiStatus, data1, data2, 0) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v7 = "AVAEInternal.h";
      v8 = 1024;
      v9 = 71;
      v10 = 2080;
      v11 = "AVAudioUnitMIDIInstrument.mm";
      v12 = 1024;
      v13 = 151;
      v14 = 2080;
      v15 = "-[AVAudioUnitMIDIInstrument sendMIDIEvent:data1:data2:]";
      v16 = 2080;
      v17 = "_IMPL->SendMIDIEvent(midiStatus, data1, data2, 0, 0)";
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendMIDIEvent(midiStatus, data1, data2, 0, 0)");
  }
}

- (void)sendMIDIEvent:(uint8_t)midiStatus data1:(uint8_t)data1
{
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
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, midiStatus, data1, 0, 0) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v6 = "AVAEInternal.h";
      v7 = 1024;
      v8 = 71;
      v9 = 2080;
      v10 = "AVAudioUnitMIDIInstrument.mm";
      v11 = 1024;
      v12 = 156;
      v13 = 2080;
      v14 = "-[AVAudioUnitMIDIInstrument sendMIDIEvent:data1:]";
      v15 = 2080;
      v16 = "_IMPL->SendMIDIEvent(midiStatus, data1, 0, 0, 0)";
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendMIDIEvent(midiStatus, data1, 0, 0, 0)");
  }
}

- (void)sendMIDISysExEvent:(NSData *)midiData
{
  void *impl;
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  impl = self->super.super._impl;
  Length = CFDataGetLength((CFDataRef)midiData);
  BytePtr = CFDataGetBytePtr((CFDataRef)midiData);
  v7 = (*(uint64_t (**)(void *))(*(_QWORD *)impl + 40))(impl);
  if (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, CFIndex, const UInt8 *))(*(_QWORD *)v7 + 136))(v7, 1, 0, 0, Length, BytePtr) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "AVAEInternal.h";
      v11 = 1024;
      v12 = 71;
      v13 = 2080;
      v14 = "AVAudioUnitMIDIInstrument.mm";
      v15 = 1024;
      v16 = 161;
      v17 = 2080;
      v18 = "-[AVAudioUnitMIDIInstrument sendMIDISysExEvent:]";
      v19 = 2080;
      v20 = "_IMPL->SendMIDISysexEvent((CFDataRef)midiData)";
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendMIDISysexEvent((CFDataRef)midiData)");
  }
}

- (void)sendMIDIEventList:(const MIDIEventList *)eventList
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const MIDIEventList *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->super.super._impl + 40))(self->super.super._impl, a2);
  if (((*(uint64_t (**)(uint64_t, _QWORD, _QWORD, const MIDIEventList *))(*(_QWORD *)v4 + 144))(v4, 0, 0, eventList) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "AVAudioUnitMIDIInstrument.mm";
      v9 = 1024;
      v10 = 78;
      v11 = 2048;
      v12 = eventList;
      v13 = 1024;
      v14 = 0;
      v15 = 1024;
      LODWORD(v16) = 0;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Unable to send midi event list %p, offset = %d, cable = %d\n", buf, 0x28u);
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    }
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v8 = "AVAEInternal.h";
      v9 = 1024;
      v10 = 71;
      v11 = 2080;
      v12 = (const MIDIEventList *)"AVAudioUnitMIDIInstrument.mm";
      v13 = 1024;
      v14 = 166;
      v15 = 2080;
      v16 = "-[AVAudioUnitMIDIInstrument sendMIDIEventList:]";
      v17 = 2080;
      v18 = "_IMPL->SendMIDIEventList(eventList, 0, 0)";
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_IMPL->SendMIDIEventList(eventList, 0, 0)");
  }
}

@end
