@implementation NGMRollingBitmaskBuffer

- (NGMRollingBitmaskBuffer)init
{
  NGMRollingBitmaskBuffer *v2;
  NGMRollingBitmaskBuffer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NGMRollingBitmaskBuffer;
  v2 = -[NGMRollingBitmaskBuffer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_upper_buffer_index = 0x100000001;
    v2->_valid_values_buffer = (char *)malloc_type_malloc(1uLL, 0xB769003uLL);
    __memset_chk();
  }
  return v3;
}

- (NGMRollingBitmaskBuffer)initWithData:(id)a3 upperBufferIndex:(unsigned int)a4
{
  id v6;
  NGMRollingBitmaskBuffer *v7;
  NGMRollingBitmaskBuffer *v8;
  unsigned int v9;
  char *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NGMRollingBitmaskBuffer;
  v7 = -[NGMRollingBitmaskBuffer init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_upper_buffer_index = a4;
    v9 = objc_msgSend(v6, "length");
    v8->_valid_values_buffer_size = v9;
    v10 = (char *)malloc_type_malloc(v9, 0x280A3EDEuLL);
    v8->_valid_values_buffer = v10;
    memcpy(v10, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v8->_valid_values_buffer_size);
  }

  return v8;
}

- (BOOL)processIncomingCounter:(unsigned int)a3
{
  unsigned int valid_values_buffer_size;
  unsigned int upper_buffer_index;
  BOOL result;
  char v6;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  size_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  char *v17;
  unsigned int v18;
  char v19;

  upper_buffer_index = self->_upper_buffer_index;
  valid_values_buffer_size = self->_valid_values_buffer_size;
  if (a3 < 8 * (upper_buffer_index - valid_values_buffer_size))
    return 0;
  v6 = a3;
  v8 = a3 >> 3;
  if (8 * upper_buffer_index - 1 >= a3)
  {
    v17 = &self->_valid_values_buffer[v8 - (upper_buffer_index - valid_values_buffer_size)];
    v18 = *v17;
    v19 = a3 & 7;
    if (((v18 >> (a3 & 7)) & 1) == 0)
      return 0;
  }
  else
  {
    v9 = v8 + 1;
    v10 = v8 + 1 - upper_buffer_index;
    if (valid_values_buffer_size + v10 >= 0x30D4)
      v11 = 12500;
    else
      v11 = valid_values_buffer_size + v10;
    v12 = 12500 - v10;
    if (valid_values_buffer_size < 12500 - v10)
      v12 = self->_valid_values_buffer_size;
    v13 = v10 >> 2;
    if (v13 >= 0xC35)
      v14 = 0;
    else
      v14 = valid_values_buffer_size - v12;
    if (v13 >= 0xC35)
      v15 = valid_values_buffer_size;
    else
      v15 = v12;
    v16 = (char *)malloc_type_malloc(v11, 0xB3BCC01EuLL);
    memset(v16, 255, v11);
    memcpy(v16, &self->_valid_values_buffer[v14], v15);
    free(self->_valid_values_buffer);
    self->_valid_values_buffer = v16;
    self->_upper_buffer_index = v9;
    self->_valid_values_buffer_size = v11;
    v17 = &v16[(v11 - 1)];
    LOBYTE(v18) = *v17;
    v19 = v6 & 7;
  }
  result = 1;
  *v17 = v18 & ~(1 << v19);
  return result;
}

- (id)bufferData
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", -[NGMRollingBitmaskBuffer valid_values_buffer](self, "valid_values_buffer"), -[NGMRollingBitmaskBuffer valid_values_buffer_size](self, "valid_values_buffer_size"));
}

- (void)dealloc
{
  objc_super v3;

  free(-[NGMRollingBitmaskBuffer valid_values_buffer](self, "valid_values_buffer"));
  v3.receiver = self;
  v3.super_class = (Class)NGMRollingBitmaskBuffer;
  -[NGMRollingBitmaskBuffer dealloc](&v3, sel_dealloc);
}

- (unsigned)upper_buffer_index
{
  return self->_upper_buffer_index;
}

- (void)setUpper_buffer_index:(unsigned int)a3
{
  self->_upper_buffer_index = a3;
}

- (char)valid_values_buffer
{
  return self->_valid_values_buffer;
}

- (void)setValid_values_buffer:(char *)a3
{
  self->_valid_values_buffer = a3;
}

- (unsigned)valid_values_buffer_size
{
  return self->_valid_values_buffer_size;
}

- (void)setValid_values_buffer_size:(unsigned int)a3
{
  self->_valid_values_buffer_size = a3;
}

@end
