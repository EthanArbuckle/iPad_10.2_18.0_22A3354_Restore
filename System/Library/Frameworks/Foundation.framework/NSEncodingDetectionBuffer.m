@implementation NSEncodingDetectionBuffer

- (NSEncodingDetectionBuffer)initWithNSStringEncoding:(unint64_t)a3 CFStringEncoding:(unsigned int)a4 stackBuffer:(char *)a5 bufferLength:(unint64_t)a6 placeholder:(id)a7
{
  NSEncodingDetectionBuffer *v12;
  NSEncodingDetectionBuffer *v13;
  size_t v14;
  char *v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NSEncodingDetectionBuffer;
  v12 = -[NSEncodingDetectionBuffer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_nsEncoding = a3;
    v12->_cfEncoding = a4;
    if (a5)
    {
      v12->_bytes = a5;
      v12->_bytesAllocated = 0;
    }
    else
    {
      if (a6)
        v14 = a6;
      else
        v14 = 64;
      a6 = malloc_good_size(v14);
      v15 = (char *)malloc_type_malloc(a6, 0x100004077774924uLL);
      v13->_bytes = v15;
      v13->_bytesAllocated = 1;
      if (!v15)
      {

        return 0;
      }
    }
    v13->_bytesIndex = 0;
    v13->_bytesLength = a6;
    v13->_placeholder = (NSEncodingDetectionPlaceholder *)a7;
  }
  return v13;
}

- (void)dealloc
{
  char *bytes;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  self->_placeholder = 0;
  if (self->_bytesAllocated)
  {
    bytes = self->_bytes;
    if (bytes)
    {
      free(bytes);
      self->_bytes = 0;
      self->_bytesIndex = 0;
      self->_bytesLength = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSEncodingDetectionBuffer;
  -[NSEncodingDetectionBuffer dealloc](&v4, sel_dealloc);
}

- (BOOL)_growBufferIfNeededToAccomodateByteCount:(unint64_t)a3
{
  unint64_t bytesLength;
  char *v5;
  size_t v6;
  unint64_t v7;
  char *v8;
  _BOOL4 bytesAllocated;
  char *bytes;

  if (!a3)
  {
    LOBYTE(v5) = 1;
    return (char)v5;
  }
  bytesLength = self->_bytesLength;
  if (self->_bytesIndex + a3 < bytesLength)
    goto LABEL_3;
  v6 = malloc_good_size(2 * bytesLength);
  if (v6 <= bytesLength)
  {
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  v7 = v6;
  v5 = (char *)malloc_type_malloc(v6, 0x100004077774924uLL);
  if (v5)
  {
    v8 = v5;
    bytesAllocated = self->_bytesAllocated;
    bytes = self->_bytes;
    memcpy(v5, bytes, self->_bytesIndex);
    self->_bytesLength = v7;
    self->_bytes = v8;
    LOBYTE(v5) = 1;
    self->_bytesAllocated = 1;
    if (bytesAllocated)
    {
      free(bytes);
LABEL_3:
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (void)appendByte:(unsigned __int8)a3
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:](self, "_growBufferIfNeededToAccomodateByteCount:", 1))
  {
    self->_bytes[self->_bytesIndex++] = a3;
  }
}

- (void)appendByte1:(unsigned __int8)a3 byte2:(unsigned __int8)a4
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:](self, "_growBufferIfNeededToAccomodateByteCount:", 2))
  {
    self->_bytes[self->_bytesIndex] = a3;
    self->_bytes[self->_bytesIndex + 1] = a4;
    self->_bytesIndex += 2;
  }
}

- (void)appendByte1:(unsigned __int8)a3 byte2:(unsigned __int8)a4 byte3:(unsigned __int8)a5
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:](self, "_growBufferIfNeededToAccomodateByteCount:", 3))
  {
    self->_bytes[self->_bytesIndex] = a3;
    self->_bytes[self->_bytesIndex + 1] = a4;
    self->_bytes[self->_bytesIndex + 2] = a5;
    self->_bytesIndex += 3;
  }
}

- (void)appendUTF16Char:(unsigned __int16)a3
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:](self, "_growBufferIfNeededToAccomodateByteCount:", 2))
  {
    *(_WORD *)&self->_bytes[self->_bytesIndex] = a3;
    self->_bytesIndex += 2;
  }
}

- (void)appendUTF32Char:(unsigned int)a3
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:](self, "_growBufferIfNeededToAccomodateByteCount:", 4))
  {
    *(_DWORD *)&self->_bytes[self->_bytesIndex] = a3;
    self->_bytesIndex += 4;
  }
}

- (void)appendByte1:(unsigned __int8)a3 byte2:(unsigned __int8)a4 byte3:(unsigned __int8)a5 byte4:(unsigned __int8)a6
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:](self, "_growBufferIfNeededToAccomodateByteCount:", 4))
  {
    self->_bytes[self->_bytesIndex] = a3;
    self->_bytes[self->_bytesIndex + 1] = a4;
    self->_bytes[self->_bytesIndex + 2] = a5;
    self->_bytes[self->_bytesIndex + 3] = a6;
    self->_bytesIndex += 4;
  }
}

- (void)appendPlaceholder
{
  NSEncodingDetectionPlaceholder *placeholder;
  size_t v4;

  placeholder = self->_placeholder;
  if (placeholder)
  {
    v4 = -[NSEncodingDetectionPlaceholder bytesLength](placeholder, "bytesLength");
    if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:](self, "_growBufferIfNeededToAccomodateByteCount:", v4))
    {
      memcpy(&self->_bytes[self->_bytesIndex], -[NSEncodingDetectionPlaceholder bytes](self->_placeholder, "bytes"), v4);
      self->_bytesIndex += v4;
    }
  }
}

- (void)appendBytes:(const char *)a3 count:(unint64_t)a4
{
  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSEncodingDetectionBuffer.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromBytes != nil"));
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:](self, "_growBufferIfNeededToAccomodateByteCount:", a4))
  {
    memcpy(&self->_bytes[self->_bytesIndex], a3, a4);
    self->_bytesIndex += a4;
  }
}

- (id)stringWithLossySubsitutionString:(id)a3
{
  void *v5;
  NSString *v6;
  NSString *v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", self->_bytes, self->_bytesIndex);
  v6 = -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", v5, self->_nsEncoding);

  if (a3 && v6)
  {
    v7 = -[NSString stringByReplacingOccurrencesOfString:withString:](v6, "stringByReplacingOccurrencesOfString:withString:", -[NSEncodingDetectionPlaceholder string](self->_placeholder, "string"), a3);

    v6 = v7;
  }
  return v6;
}

@end
