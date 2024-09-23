@implementation ASDRingBufferStreamPair

- (ASDRingBufferStreamPair)initWithRingBufferFrameCapacity:(int64_t)a3 withPlugin:(id)a4
{
  unsigned int v4;
  id v6;
  ASDRingBufferStreamPair *v7;
  ASDManagedRingBuffer *v8;
  ASDManagedRingBuffer *ringBuffer;
  ASDRingBufferInputStream *v10;
  ASDStream *inputStream;
  ASDRingBufferOutputStream *v12;
  ASDStream *outputStream;
  objc_super v15;

  v4 = a3;
  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASDRingBufferStreamPair;
  v7 = -[ASDRingBufferStreamPair init](&v15, sel_init);
  if (v7)
  {
    v8 = -[ASDRingBuffer initWithFrameCapacity:]([ASDManagedRingBuffer alloc], "initWithFrameCapacity:", v4);
    ringBuffer = v7->_ringBuffer;
    v7->_ringBuffer = v8;

    v10 = -[ASDRingBufferInputStream initWithRingBuffer:withPlugin:]([ASDRingBufferInputStream alloc], "initWithRingBuffer:withPlugin:", v7->_ringBuffer, v6);
    inputStream = v7->_inputStream;
    v7->_inputStream = &v10->super;

    v12 = -[ASDRingBufferOutputStream initWithRingBuffer:withPlugin:]([ASDRingBufferOutputStream alloc], "initWithRingBuffer:withPlugin:", v7->_ringBuffer, v6);
    outputStream = v7->_outputStream;
    v7->_outputStream = &v12->super;

  }
  return v7;
}

- (void)setRingBufferFrameCapacity:(int64_t)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[ASDRingBufferStreamPair ringBuffer](self, "ringBuffer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrameCapacity:", v3);

}

- (ASDStream)inputStream
{
  return self->_inputStream;
}

- (ASDStream)outputStream
{
  return self->_outputStream;
}

- (int64_t)ringBufferFrameCapacity
{
  return self->_ringBufferFrameCapacity;
}

- (ASDManagedRingBuffer)ringBuffer
{
  return self->_ringBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringBuffer, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
}

@end
