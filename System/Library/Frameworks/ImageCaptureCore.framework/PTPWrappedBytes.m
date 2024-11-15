@implementation PTPWrappedBytes

+ (id)wrappedBytesWithCapacity:(unint64_t)a3
{
  return -[PTPWrappedBytes initWithCapacity:]([PTPWrappedBytes alloc], "initWithCapacity:", a3);
}

+ (id)wrappedBytesWithBytes:(void *)a3 capacity:(unint64_t)a4
{
  return -[PTPWrappedBytes initWithBytes:capacity:]([PTPWrappedBytes alloc], "initWithBytes:capacity:", a3, a4);
}

- (PTPWrappedBytes)initWithCapacity:(unint64_t)a3
{
  PTPWrappedBytes *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTPWrappedBytes;
  v4 = -[PTPWrappedBytes init](&v6, sel_init);
  if (v4)
  {
    if (a3)
      v4->_bytes = (char *)malloc_type_malloc(a3, 0xAFFABC1DuLL);
    v4->_capacity = a3;
    v4->_offset = 0;
    *(_WORD *)&v4->_allocatedBytes = 257;
  }
  return v4;
}

- (PTPWrappedBytes)init
{
  return -[PTPWrappedBytes initWithCapacity:](self, "initWithCapacity:", 0);
}

- (PTPWrappedBytes)initWithBytes:(void *)a3 capacity:(unint64_t)a4
{
  PTPWrappedBytes *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTPWrappedBytes;
  result = -[PTPWrappedBytes init](&v7, sel_init);
  if (result)
  {
    result->_bytes = (char *)a3;
    result->_capacity = a4;
    result->_offset = 0;
    *(_WORD *)&result->_allocatedBytes = 256;
  }
  return result;
}

- (PTPWrappedBytes)initWithFileDescriptor:(int)a3 capacity:(unint64_t)a4
{
  PTPWrappedBytes *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTPWrappedBytes;
  result = -[PTPWrappedBytes init](&v7, sel_init);
  if (result)
  {
    result->_fd = a3;
    result->_capacity = a4;
    result->_offset = 0;
    *(_WORD *)&result->_allocatedBytes = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_allocatedBytes)
    free(self->_bytes);
  v3.receiver = self;
  v3.super_class = (Class)PTPWrappedBytes;
  -[PTPWrappedBytes dealloc](&v3, sel_dealloc);
}

- (unint64_t)updateCapacity:(unint64_t)a3
{
  unint64_t result;
  char *v6;

  result = self->_capacity;
  if (result < a3)
  {
    v6 = (char *)malloc_type_realloc(self->_bytes, a3, 0x6F79EAEuLL);
    if (v6)
    {
      self->_bytes = v6;
      self->_capacity = a3;
      return a3;
    }
    else
    {
      return self->_capacity;
    }
  }
  return result;
}

- (unint64_t)length
{
  return self->_offset;
}

- (void)setLength:(unint64_t)a3
{
  unint64_t capacity;

  capacity = self->_capacity;
  if (capacity >= a3)
    capacity = a3;
  self->_offset = capacity;
}

- (const)headerOffsetBytes
{
  return &self->_bytes[self->_headerOffset];
}

- (const)bytes
{
  return self->_bytes;
}

- (void)mutableBytes
{
  return self->_bytes;
}

- (id)mutableData
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", self->_bytes, self->_offset);
}

- (id)data
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_bytes, self->_offset);
}

- (BOOL)wasInitWithFD
{
  return !self->_useByteBuffer;
}

- (unint64_t)appendData:(id)a3
{
  id v4;
  unint64_t v5;
  ssize_t v6;
  unint64_t offset;
  unint64_t capacity;
  char *v9;
  char *bytes;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = v5;
  if (!self->_useByteBuffer || !self->_allocatedBytes)
  {
    offset = self->_offset;
    if (v5 >= self->_capacity - offset)
      v6 = self->_capacity - offset;
LABEL_8:
    if (!v6)
      goto LABEL_13;
    goto LABEL_9;
  }
  offset = self->_offset;
  if (self->_capacity - offset >= v5)
    goto LABEL_8;
  capacity = offset + v5;
  v9 = (char *)malloc_type_realloc(self->_bytes, offset + v5, 0x5B2E4939uLL);
  if (v9)
  {
    self->_bytes = v9;
    self->_capacity = capacity;
  }
  else
  {
    syslog(3, "Unable to realloc() buffer in PTPWrappedBytes\n");
    capacity = self->_capacity;
  }
  offset = self->_offset;
  if (capacity <= offset || (v6 = capacity - offset, capacity != offset))
  {
LABEL_9:
    bytes = self->_bytes;
    if (bytes)
      memcpy(&bytes[offset], (const void *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), v6);
    else
      v6 = write(self->_fd, (const void *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), v6);
    self->_offset += v6;
  }
LABEL_13:
  self->_excessDataLength += objc_msgSend(v4, "length") - v6;

  return v6;
}

- (unint64_t)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  unint64_t offset;
  size_t v8;
  unint64_t capacity;
  char *v10;
  char *bytes;
  BOOL v13;

  if (!self->_useByteBuffer || !self->_allocatedBytes)
  {
    offset = self->_offset;
    if (self->_capacity - offset >= a4)
      v8 = a4;
    else
      v8 = self->_capacity - offset;
    goto LABEL_9;
  }
  offset = self->_offset;
  v8 = a4;
  if (self->_capacity - offset >= a4)
    goto LABEL_9;
  capacity = offset + a4;
  v10 = (char *)malloc_type_realloc(self->_bytes, offset + a4, 0x8CE93ABDuLL);
  if (v10)
  {
    self->_bytes = v10;
    self->_capacity = capacity;
  }
  else
  {
    syslog(3, "Unable to realloc() buffer in PTPWrappedBytes\n");
    capacity = self->_capacity;
  }
  offset = self->_offset;
  v13 = capacity > offset;
  v8 = capacity - offset;
  if (v13)
  {
LABEL_9:
    if (!v8)
      goto LABEL_14;
    goto LABEL_10;
  }
  v8 = a4;
LABEL_10:
  bytes = self->_bytes;
  if (bytes)
    memcpy(&bytes[offset], a3, v8);
  else
    v8 = write(self->_fd, a3, v8);
  self->_offset += v8;
LABEL_14:
  self->_excessDataLength += a4 - v8;
  return v8;
}

- (unint64_t)rewindBytesToPosition64:(unint64_t)a3
{
  self->_offset = a3;
  if (!self->_bytes)
  {
    lseek(self->_fd, a3, 0);
    return self->_offset;
  }
  return a3;
}

- (unint64_t)excessDataLength
{
  return self->_excessDataLength;
}

- (double)percentFull
{
  unint64_t capacity;

  capacity = self->_capacity;
  if (capacity)
    return (double)self->_offset * 100.0 / (double)capacity;
  else
    return 0.0;
}

- (id)description
{
  const char *v2;

  v2 = "YES";
  if (!self->_allocatedBytes)
    v2 = "NO";
  return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<PTPWrappedBytes %p>{\n  _offset:           %llu\n  _capacity:         %llu\n  _allocatedBytes:   %s\n  _bytes:            <%p>\n  _fd:               %d\n  _excessDataLength: %llu}"), self, self->_offset, self->_capacity, v2, self->_bytes, self->_fd, self->_excessDataLength);
}

- (void)replaceBytesInRange:(_NSRange)a3 withBytes:(const void *)a4
{
  NSUInteger length;
  unint64_t offset;

  if (!self->_bytes)
  {
    length = a3.length;
    offset = self->_offset;
    lseek(self->_fd, a3.location, 0);
    -[PTPWrappedBytes appendBytes:length:](self, "appendBytes:length:", a4, length);
    if (self->_offset <= offset)
      lseek(self->_fd, offset, 0);
  }
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)headerOffset
{
  return self->_headerOffset;
}

- (void)setHeaderOffset:(unint64_t)a3
{
  self->_headerOffset = a3;
}

- (void)setExcessDataLength:(unint64_t)a3
{
  self->_excessDataLength = a3;
}

- (BOOL)allocatedBytes
{
  return self->_allocatedBytes;
}

- (void)setAllocatedBytes:(BOOL)a3
{
  self->_allocatedBytes = a3;
}

- (BOOL)useByteBuffer
{
  return self->_useByteBuffer;
}

- (void)setUseByteBuffer:(BOOL)a3
{
  self->_useByteBuffer = a3;
}

- (void)setBytes:(char *)a3
{
  self->_bytes = a3;
}

@end
