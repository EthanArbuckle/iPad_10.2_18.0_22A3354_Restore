@implementation AVAudioCompressedBuffer

- (AVAudioCompressedBuffer)initWithFormat:(AVAudioFormat *)format packetCapacity:(AVAudioPacketCount)packetCapacity maximumPacketSize:(NSInteger)maximumPacketSize
{
  const AudioStreamBasicDescription *v9;
  AudioFormatID mFormatID;
  NSInteger mBytesPerPacket;
  NSObject *v14;
  NSInteger v15;
  NSObject *v16;
  AVAudioCompressedBuffer *v17;
  AVAudioCompressedBuffer *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = -[AVAudioFormat streamDescription](format, "streamDescription");
  mFormatID = v9->mFormatID;
  mBytesPerPacket = v9->mBytesPerPacket;
  if (mFormatID == 1634492791 || mFormatID == 1970037111 || mFormatID == 1819304813)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v23 = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioBuffer.mm";
      v28 = 1024;
      v29 = 570;
      v30 = 2080;
      v31 = "-[AVAudioCompressedBuffer initWithFormat:packetCapacity:maximumPacketSize:]";
      v32 = 2080;
      v33 = "!(fmt.IsLinearPCM() || fmt.mFormatID == kAudioFormatALaw || fmt.mFormatID == kAudioFormatULaw)";
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "!(fmt.IsLinearPCM() || fmt.mFormatID == kAudioFormatALaw || fmt.mFormatID == kAudioFormatULaw)");
  }
  if ((_DWORD)mBytesPerPacket)
    v15 = mBytesPerPacket;
  else
    v15 = maximumPacketSize;
  if (!v15)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v23 = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioBuffer.mm";
      v28 = 1024;
      v29 = 574;
      v30 = 2080;
      v31 = "-[AVAudioCompressedBuffer initWithFormat:packetCapacity:maximumPacketSize:]";
      v32 = 2080;
      v33 = "maximumPacketSize != 0";
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "maximumPacketSize != 0");
  }
  v21.receiver = self;
  v21.super_class = (Class)AVAudioCompressedBuffer;
  v17 = -[AVAudioBuffer initWithFormat:byteCapacity:](&v21, sel_initWithFormat_byteCapacity_, format, v15 * packetCapacity);
  v18 = v17;
  if (v17)
  {
    *((_DWORD *)v17->super._impl + 6) = v15;
    *((_DWORD *)v17->super._impl + 5) = packetCapacity;
    *((_DWORD *)v17->super._impl + 4) = 0;
    if ((_DWORD)mBytesPerPacket)
      v19 = 0;
    else
      v19 = malloc_type_calloc(packetCapacity, 0x10uLL, 0x1000040451B5BE8uLL);
    *((_QWORD *)v18->super._impl + 1) = v19;
  }
  return v18;
}

- (AVAudioCompressedBuffer)initWithFormat:(AVAudioFormat *)format packetCapacity:(AVAudioPacketCount)packetCapacity
{
  return -[AVAudioCompressedBuffer initWithFormat:packetCapacity:maximumPacketSize:](self, "initWithFormat:packetCapacity:maximumPacketSize:", format, *(_QWORD *)&packetCapacity, 0);
}

- (AVAudioPacketCount)packetCapacity
{
  return *((_DWORD *)self->super._impl + 5);
}

- (AVAudioPacketCount)packetCount
{
  return *((_DWORD *)self->super._impl + 4);
}

- (NSInteger)maximumPacketSize
{
  return *((unsigned int *)self->super._impl + 6);
}

- (AudioStreamPacketDescription)packetDescriptions
{
  return (AudioStreamPacketDescription *)*((_QWORD *)self->super._impl + 1);
}

- (void)data
{
  _QWORD *impl;
  uint64_t v3;

  impl = self->super._impl;
  if (*((_BYTE *)impl + 56))
    v3 = impl[6] + 48;
  else
    v3 = impl[12];
  return *(void **)(v3 + 16);
}

- (void)setPacketCount:(AVAudioPacketCount)packetCount
{
  _DWORD *impl;
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
  impl = self->super._impl;
  if (impl[5] < packetCount)
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
      v12 = "AVAudioBuffer.mm";
      v13 = 1024;
      v14 = 608;
      v15 = 2080;
      v16 = "-[AVAudioCompressedBuffer setPacketCount:]";
      v17 = 2080;
      v18 = "length <= _imp->_packetCapacity";
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "length <= _imp->_packetCapacity");
    impl = self->super._impl;
  }
  impl[4] = packetCount;
}

@end
