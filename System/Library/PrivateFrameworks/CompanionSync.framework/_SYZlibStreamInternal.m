@implementation _SYZlibStreamInternal

- (_SYZlibStreamInternal)init
{
  char *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SYZlibStreamInternal;
  v2 = -[_SYZlibStreamInternal init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_QWORD *)v2 + 24) = 1024;
    *((_QWORD *)v2 + 23) = 1024;
    v4 = v2 + 72;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *((_QWORD *)v2 + 25) = malloc_type_malloc(*((_QWORD *)v2 + 23), 0xD5505B01uLL);
    v3[26] = malloc_type_malloc(v3[24], 0x40E0CFA8uLL);
    *v4 = v3[25];
    *((_DWORD *)v3 + 20) = 0;
    v5 = v3[26];
    v3[11] = 0;
    v3[12] = v5;
    *((_DWORD *)v3 + 26) = v3[24];
    v3[14] = 0;
    v3[17] = 0;
    v3[18] = 0;
    *((_DWORD *)v3 + 58) = 0;
  }

  return 0;
}

- (void)dealloc
{
  char *input;
  char *output;
  objc_super v5;

  input = self->_input;
  if (input)
    free(input);
  output = self->_output;
  if (output)
    free(output);
  v5.receiver = self;
  v5.super_class = (Class)_SYZlibStreamInternal;
  -[_SYStreamGuts dealloc](&v5, sel_dealloc);
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (void)synchronized:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)setInputSize:(int64_t)a3
{
  Bytef *next_in;
  char *input;
  int64_t v6;
  char *v7;

  if (self->_inputSize != a3)
  {
    next_in = self->_zStream.next_in;
    input = self->_input;
    v6 = next_in - (Bytef *)input;
    self->_inputSize = a3;
    v7 = (char *)malloc_type_realloc(input, a3, 0x99815D9FuLL);
    self->_input = v7;
    self->_zStream.next_in = (Bytef *)&v7[v6];
  }
}

- (void)setOutputSize:(int64_t)a3
{
  unint64_t outputSize;
  z_stream_s *p_zStream;
  Bytef *next_out;
  char *output;
  int64_t v8;
  int v9;
  char *v10;

  outputSize = self->_outputSize;
  if (a3 != outputSize)
  {
    p_zStream = &self->_zStream;
    next_out = self->_zStream.next_out;
    output = self->_output;
    v8 = next_out - (Bytef *)output;
    v9 = a3 - outputSize;
    self->_outputSize = a3;
    v10 = (char *)malloc_type_realloc(output, a3, 0x28E455C7uLL);
    self->_output = v10;
    p_zStream->next_out = (Bytef *)&v10[v8];
    p_zStream->avail_out += v9;
  }
}

- (void)setZlibError:(int)a3 forStream:(id)a4
{
  z_stream_s *p_zStream;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  NSError *v11;
  NSError *error;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  p_zStream = &self->_zStream;
  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithUTF8String:", p_zStream->msg);
  v13 = *MEMORY[0x24BDD0FC8];
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SYZlibErrorDomain"), a3, v10);

  error = self->super._error;
  self->super._error = v11;

  self->super._status = 7;
  -[_SYStreamGuts postStreamEvent:forStream:](self, "postStreamEvent:forStream:", 8, v8);

}

- (void)setStatusForStream:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_zStream.total_out)
  {
    self->super._status = 2;
  }
  else
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "streamStatus");
    v5 = v7;
    if (v6 == 5)
    {
      self->super._status = 5;
      -[_SYStreamGuts postStreamEvent:forStream:](self, "postStreamEvent:forStream:", 16, v7);
      v5 = v7;
    }
  }

}

- (int64_t)inputRoom
{
  return self->_inputSize - self->_writeOffset;
}

- (void)inputPtr
{
  return &self->_input[self->_writeOffset];
}

- (int64_t)outputAvailable
{
  return self->_zStream.total_out - self->_readOffset;
}

- (const)outputPtr
{
  return &self->_output[self->_readOffset];
}

- (int64_t)writeInputFromBuffer:(const void *)a3 length:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  int64_t v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[_SYZlibStreamInternal inputRoom](self, "inputRoom");
  if (v8 < a4)
    a4 = v8;
  memcpy(-[_SYZlibStreamInternal inputPtr](self, "inputPtr"), a3, a4);
  self->_zStream.avail_in += a4;
  self->_writeOffset += a4;
  os_unfair_lock_unlock(p_lock);
  return a4;
}

- (int64_t)writeInputFromStream:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  int64_t v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = objc_msgSend(v5, "read:maxLength:", -[_SYZlibStreamInternal inputPtr](self, "inputPtr"), -[_SYZlibStreamInternal inputRoom](self, "inputRoom"));

  if ((v6 & 0x8000000000000000) == 0)
  {
    self->_zStream.avail_out += v6;
    self->_writeOffset += v6;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (int64_t)readOutputToBuffer:(void *)a3 length:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  int64_t v8;
  unint64_t v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[_SYZlibStreamInternal outputAvailable](self, "outputAvailable");
  if (v8 < a4)
    a4 = v8;
  memcpy(a3, -[_SYZlibStreamInternal outputPtr](self, "outputPtr"), a4);
  v9 = self->_readOffset + a4;
  self->_readOffset = v9;
  if (v9 == self->_zStream.total_out)
  {
    self->_zStream.next_out = (Bytef *)self->_output;
    self->_zStream.avail_out = self->_outputSize;
    self->_zStream.total_out = 0;
    self->_readOffset = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return a4;
}

- (int64_t)readOutputToStream:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  int64_t v6;
  unint64_t v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = objc_msgSend(v5, "write:maxLength:", -[_SYZlibStreamInternal outputPtr](self, "outputPtr"), -[_SYZlibStreamInternal outputAvailable](self, "outputAvailable"));

  if ((v6 & 0x8000000000000000) == 0)
  {
    v7 = self->_readOffset + v6;
    self->_readOffset = v7;
    if (v7 == self->_zStream.total_out)
    {
      self->_zStream.next_out = (Bytef *)self->_output;
      self->_zStream.avail_out = self->_outputSize;
      self->_zStream.total_out = 0;
      self->_readOffset = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

@end
