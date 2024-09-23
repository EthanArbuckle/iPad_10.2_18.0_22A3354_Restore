@implementation GKRingBuffer

- (GKRingBuffer)initWithCapacity:(unsigned int)a3 bytesPerFrame:(unsigned int)a4
{
  GKRingBuffer *v6;
  CARingBuffer *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)GKRingBuffer;
  v6 = -[GKRingBuffer init](&v9, sel_init);
  v6->endTime = 0;
  v6->capacity = a3;
  v6->bytesPerFrame = a4;
  v7 = (CARingBuffer *)operator new();
  CARingBuffer::CARingBuffer(v7);
  v6->ringBufRef = v7;
  CARingBuffer::Allocate(v7, 1, v6->bytesPerFrame, a3);
  return v6;
}

- (GKRingBuffer)init
{
  return -[GKRingBuffer initWithCapacity:bytesPerFrame:](self, "initWithCapacity:bytesPerFrame:", 2048, 2);
}

- (void)dealloc
{
  void *ringBufRef;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  CARingBuffer::Deallocate((CARingBuffer *)self->ringBufRef);
  ringBufRef = self->ringBufRef;
  if (ringBufRef)
  {
    CARingBuffer::~CARingBuffer((CARingBuffer *)self->ringBufRef);
    MEMORY[0x1DF087DC8](ringBufRef, 0x1080C400355024FLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKRingBuffer;
  -[GKRingBuffer dealloc](&v4, sel_dealloc);
}

- (void)increaseCapacity:(unsigned int)a3
{
  unsigned int capacity;
  UInt32 bytesPerFrame;
  size_t v7;
  uint64_t v8;
  char *v9;
  unsigned int endTime;
  BOOL v11;
  unsigned int v12;
  uint64_t v13;
  AudioBufferList v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  capacity = self->capacity;
  bytesPerFrame = self->bytesPerFrame;
  v7 = bytesPerFrame * capacity;
  v8 = (v7 + 15) & 0x1FFFFFFF0;
  v9 = (char *)&v14 - v8;
  if ((_DWORD)v7)
    memset((char *)&v14 - v8, 170, v7);
  *(_QWORD *)&v14.mNumberBuffers = 0xAAAAAAAA00000001;
  v14.mBuffers[0].mNumberChannels = 1;
  v14.mBuffers[0].mDataByteSize = bytesPerFrame;
  v14.mBuffers[0].mData = v9;
  endTime = self->endTime;
  v11 = endTime >= capacity;
  v12 = endTime - capacity;
  if (v11)
    v13 = v12;
  else
    v13 = 0;
  CARingBuffer::Fetch((CARingBuffer *)self->ringBufRef, &v14, capacity, v13);
  CARingBuffer::Deallocate((CARingBuffer *)self->ringBufRef);
  CARingBuffer::Allocate((CARingBuffer *)self->ringBufRef, 1, self->bytesPerFrame, a3);
  CARingBuffer::Store((CARingBuffer *)self->ringBufRef, &v14, self->capacity, v13);
  self->capacity = a3;
}

- (BOOL)store:(char *)a3 numSamples:(unsigned int)a4 timestamp:(unsigned int)a5
{
  UInt32 bytesPerFrame;
  int v10;
  AudioBufferList v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (2 * a4 > self->capacity)
    -[GKRingBuffer increaseCapacity:](self, "increaseCapacity:");
  *(_QWORD *)&v12.mNumberBuffers = 0xAAAAAAAA00000001;
  bytesPerFrame = self->bytesPerFrame;
  v12.mBuffers[0].mNumberChannels = 1;
  v12.mBuffers[0].mDataByteSize = bytesPerFrame;
  v12.mBuffers[0].mData = a3;
  v10 = CARingBuffer::Store((CARingBuffer *)self->ringBufRef, &v12, a4, a5);
  if (!v10)
    self->endTime = a5 + a4;
  return v10 == 0;
}

- (int)needsNewNumSamples:(unsigned int)a3 timestamp:(unsigned int)a4
{
  unsigned int endTime;

  endTime = self->endTime;
  if (a4 + a3 >= endTime)
    return a4 + a3 - endTime;
  else
    return 0;
}

- (int)fetch:(char *)a3 numSamples:(unsigned int)a4 timestamp:(unsigned int)a5
{
  unsigned int endTime;
  int result;
  UInt32 bytesPerFrame;
  AudioBufferList v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (2 * a4 > self->capacity)
    -[GKRingBuffer increaseCapacity:](self, "increaseCapacity:");
  endTime = self->endTime;
  result = a5 + a4 - endTime;
  if (a5 + a4 <= endTime)
  {
    *(_QWORD *)&v12.mNumberBuffers = 0xAAAAAAAA00000001;
    bytesPerFrame = self->bytesPerFrame;
    v12.mBuffers[0].mNumberChannels = 1;
    v12.mBuffers[0].mDataByteSize = bytesPerFrame;
    v12.mBuffers[0].mData = a3;
    if (CARingBuffer::Fetch((CARingBuffer *)self->ringBufRef, &v12, a4, a5))
      return -1;
    else
      return 0;
  }
  return result;
}

@end
