@implementation ASDRingBuffer

- (ASDRingBuffer)initWithFrameCapacity:(int64_t)a3
{
  return -[ASDRingBuffer initWithFrameCapacity:writeFormat:readFormat:](self, "initWithFrameCapacity:writeFormat:readFormat:", a3, 0, 0);
}

- (ASDRingBuffer)initWithFrameCapacity:(int64_t)a3 writeFormat:(id)a4 readFormat:(id)a5
{
  id v9;
  id v10;
  ASDRingBuffer *v11;
  AudioRingBuffer *v12;
  AudioRingBuffer *value;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASDRingBuffer;
  v11 = -[ASDRingBuffer init](&v15, sel_init);
  if (v11)
  {
    v12 = (AudioRingBuffer *)operator new();
    AudioRingBuffer::AudioRingBuffer(v12);
    value = v11->_ringBuffer.__ptr_.__value_;
    v11->_ringBuffer.__ptr_.__value_ = v12;
    if (value)
      (*(void (**)(AudioRingBuffer *))(*(_QWORD *)value + 8))(value);
    objc_storeStrong((id *)&v11->_readFormat, a5);
    objc_storeStrong((id *)&v11->_writeFormat, a4);
    v11->_frameCapacity = a3;
  }

  return v11;
}

- (void)allocate
{
  AudioRingBuffer *value;
  void *v4;
  void *v5;
  AudioRingBuffer *v6;
  void *v7;
  void *v8;
  AudioStreamBasicDescription v9;
  AudioStreamBasicDescription inSourceFormat;

  value = self->_ringBuffer.__ptr_.__value_;
  -[ASDRingBuffer readFormat](self, "readFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "audioStreamBasicDescription");
  else
    memset(&v9, 0, sizeof(v9));
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)&inSourceFormat, &v9);
  AudioRingBuffer::Allocate(value, (const CAStreamBasicDescription *)&inSourceFormat, -[ASDRingBuffer frameCapacity](self, "frameCapacity"));

  v6 = self->_ringBuffer.__ptr_.__value_;
  -[ASDRingBuffer writeFormat](self, "writeFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "audioStreamBasicDescription");
  else
    memset(&v9, 0, sizeof(v9));
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)&inSourceFormat, &v9);
  AudioRingBuffer::SetInputFormat(v6, &inSourceFormat);

  -[ASDRingBuffer setAllocated:](self, "setAllocated:", 1);
}

- (void)deallocate
{
  AudioRingBuffer::Deallocate(self->_ringBuffer.__ptr_.__value_);
  -[ASDRingBuffer setAllocated:](self, "setAllocated:", 0);
}

- (void)clear
{
  AudioRingBuffer::Clear(self->_ringBuffer.__ptr_.__value_);
}

- (id)writeBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __27__ASDRingBuffer_writeBlock__block_invoke;
  v3[3] = &__block_descriptor_40_e55_i28__0r__AudioBufferList_I_1_AudioBuffer_II_v___8I16q20l;
  v3[4] = &self->_ringBuffer;
  return (id)MEMORY[0x220733498](v3, a2);
}

uint64_t __27__ASDRingBuffer_writeBlock__block_invoke(uint64_t a1, const AudioBufferList *a2, unsigned int a3, uint64_t a4)
{
  AudioRingBuffer **v4;

  v4 = *(AudioRingBuffer ***)(a1 + 32);
  if (!v4)
    __27__ASDRingBuffer_writeBlock__block_invoke_cold_1();
  if (!*v4)
    __27__ASDRingBuffer_writeBlock__block_invoke_cold_2();
  return AudioRingBuffer::Store(*v4, a2, a3, a4);
}

- (id)readBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __26__ASDRingBuffer_readBlock__block_invoke;
  v3[3] = &__block_descriptor_40_e54_i28__0__AudioBufferList_I_1_AudioBuffer_II_v___8I16q20l;
  v3[4] = &self->_ringBuffer;
  return (id)MEMORY[0x220733498](v3, a2);
}

uint64_t __26__ASDRingBuffer_readBlock__block_invoke(uint64_t a1, AudioBufferList *a2, unsigned int a3, uint64_t a4)
{
  AudioRingBuffer **v4;

  v4 = *(AudioRingBuffer ***)(a1 + 32);
  if (!v4)
    __26__ASDRingBuffer_readBlock__block_invoke_cold_1();
  if (!*v4)
    __26__ASDRingBuffer_readBlock__block_invoke_cold_2();
  return AudioRingBuffer::Fetch(*v4, a2, a3, a4);
}

- (id)readWithZerosBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__ASDRingBuffer_readWithZerosBlock__block_invoke;
  v3[3] = &__block_descriptor_40_e66_i52__0__AudioBufferList_I_1_AudioBuffer_II_v___8I16q20_I28_I36_I44l;
  v3[4] = &self->_ringBuffer;
  return (id)MEMORY[0x220733498](v3, a2);
}

uint64_t __35__ASDRingBuffer_readWithZerosBlock__block_invoke(uint64_t a1, AudioBufferList *a2, signed int a3, uint64_t a4, unsigned int *a5, unsigned int *a6, unsigned int *a7)
{
  AudioRingBuffer **v7;

  v7 = *(AudioRingBuffer ***)(a1 + 32);
  if (!v7)
    __35__ASDRingBuffer_readWithZerosBlock__block_invoke_cold_1();
  if (!*v7)
    __35__ASDRingBuffer_readWithZerosBlock__block_invoke_cold_2();
  return AudioRingBuffer::FetchAllWithZeroes(*v7, a2, a3, a4, a5, a6, a7);
}

- (void)setWriteFormat:(id)a3
{
  objc_storeStrong((id *)&self->_writeFormat, a3);
  if (-[ASDRingBuffer isAllocated](self, "isAllocated"))
    -[ASDRingBuffer allocate](self, "allocate");
}

- (void)setReadFormat:(id)a3
{
  objc_storeStrong((id *)&self->_readFormat, a3);
  if (-[ASDRingBuffer isAllocated](self, "isAllocated"))
    -[ASDRingBuffer allocate](self, "allocate");
}

- (int64_t)frameCapacity
{
  return self->_frameCapacity;
}

- (void)setFrameCapacity:(int64_t)a3
{
  self->_frameCapacity = a3;
}

- (ASDStreamFormat)writeFormat
{
  return self->_writeFormat;
}

- (ASDStreamFormat)readFormat
{
  return self->_readFormat;
}

- (BOOL)isAllocated
{
  return self->_allocated;
}

- (void)setAllocated:(BOOL)a3
{
  self->_allocated = a3;
}

- (void).cxx_destruct
{
  AudioRingBuffer *value;

  objc_storeStrong((id *)&self->_readFormat, 0);
  objc_storeStrong((id *)&self->_writeFormat, 0);
  value = self->_ringBuffer.__ptr_.__value_;
  self->_ringBuffer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(AudioRingBuffer *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

void __27__ASDRingBuffer_writeBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDRingBuffer writeBlock]_block_invoke", "ASDRingBuffer.mm", 72, "ringBuffer");
}

void __27__ASDRingBuffer_writeBlock__block_invoke_cold_2()
{
  __assert_rtn("-[ASDRingBuffer writeBlock]_block_invoke", "ASDRingBuffer.mm", 73, "*ringBuffer");
}

void __26__ASDRingBuffer_readBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDRingBuffer readBlock]_block_invoke", "ASDRingBuffer.mm", 85, "ringBuffer");
}

void __26__ASDRingBuffer_readBlock__block_invoke_cold_2()
{
  __assert_rtn("-[ASDRingBuffer readBlock]_block_invoke", "ASDRingBuffer.mm", 86, "*ringBuffer");
}

void __35__ASDRingBuffer_readWithZerosBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDRingBuffer readWithZerosBlock]_block_invoke", "ASDRingBuffer.mm", 98, "ringBuffer");
}

void __35__ASDRingBuffer_readWithZerosBlock__block_invoke_cold_2()
{
  __assert_rtn("-[ASDRingBuffer readWithZerosBlock]_block_invoke", "ASDRingBuffer.mm", 99, "*ringBuffer");
}

@end
