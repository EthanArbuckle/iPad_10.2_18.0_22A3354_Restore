@implementation AVVCAudioBuffer

- (int)channels
{
  return *((_DWORD *)self->_impl + 2);
}

- (int)bytesCapacity
{
  return **(_DWORD **)self->_impl;
}

- (int)bytesDataSize
{
  return *(_DWORD *)(*(_QWORD *)self->_impl + 16);
}

- (void)setBytesDataSize:(int)a3
{
  int *v3;
  int v4;

  v3 = *(int **)self->_impl;
  v4 = *v3;
  if (*v3 >= a3)
    v4 = a3;
  v3[4] = v4;
}

- (void)data
{
  return *(void **)(*(_QWORD *)self->_impl + 8);
}

- (int)packetDescriptionCapacity
{
  return *(_DWORD *)(*(_QWORD *)self->_impl + 32);
}

- (int)packetDescriptionCount
{
  return *(_DWORD *)(*(_QWORD *)self->_impl + 48);
}

- (AudioStreamPacketDescription)packetDescriptions
{
  return *(AudioStreamPacketDescription **)(*(_QWORD *)self->_impl + 40);
}

- (void)setPacketDescriptions:(const AudioStreamPacketDescription *)a3 count:(int)a4
{
  uint64_t v4;
  int v5;

  if (a3)
  {
    v4 = *(_QWORD *)self->_impl;
    v5 = *(_DWORD *)(v4 + 32);
    if (v5 >= a4)
      v5 = a4;
    memcpy(*(void **)(v4 + 40), a3, 16 * v5);
  }
}

- (unint64_t)timeStamp
{
  return *((_QWORD *)self->_impl + 2);
}

- (void)setTimeStamp:(unint64_t)a3
{
  *((_QWORD *)self->_impl + 2) = a3;
}

- (AudioStreamBasicDescription)streamDescription
{
  return (AudioStreamBasicDescription *)(*(_QWORD *)self->_impl + 56);
}

- (unsigned)remoteVoiceActivityRMS
{
  return *(_BYTE *)(*(_QWORD *)self->_impl + 97);
}

- (unsigned)remoteVoiceActivityVAD
{
  return *(_BYTE *)(*(_QWORD *)self->_impl + 98);
}

- (BOOL)remoteVoiceActivityAvailable
{
  return *(_BYTE *)(*(_QWORD *)self->_impl + 96);
}

- (BOOL)upsamplingSourceAudio
{
  return *(_BYTE *)(*(_QWORD *)self->_impl + 99);
}

- (void)finalize
{
  MyAudioQueueBuffer **impl;
  objc_super v4;

  impl = (MyAudioQueueBuffer **)self->_impl;
  if (*impl)
  {
    MyAudioQueueBuffer::~MyAudioQueueBuffer(*impl);
    MEMORY[0x1A1AC5BD4]();
  }
  MEMORY[0x1A1AC5BD4](impl, 0x1020C40A122CEF7);
  v4.receiver = self;
  v4.super_class = (Class)AVVCAudioBuffer;
  -[AVVCAudioBuffer finalize](&v4, sel_finalize);
}

- (void)dealloc
{
  MyAudioQueueBuffer **impl;
  objc_super v4;

  impl = (MyAudioQueueBuffer **)self->_impl;
  if (*impl)
  {
    MyAudioQueueBuffer::~MyAudioQueueBuffer(*impl);
    MEMORY[0x1A1AC5BD4]();
  }
  MEMORY[0x1A1AC5BD4](impl, 0x1020C40A122CEF7);
  v4.receiver = self;
  v4.super_class = (Class)AVVCAudioBuffer;
  -[AVVCAudioBuffer dealloc](&v4, sel_dealloc);
}

- (AVVCAudioBuffer)initWithAudioQueueBuffer:(MyAudioQueueBuffer *)a3 channels:(int)a4 timeStamp:(unint64_t)a5
{
  _DWORD *v9;

  v9 = (_DWORD *)operator new();
  *(_QWORD *)v9 = a3;
  v9[2] = a4;
  *((_QWORD *)v9 + 2) = a5;
  self->_impl = v9;
  return self;
}

@end
