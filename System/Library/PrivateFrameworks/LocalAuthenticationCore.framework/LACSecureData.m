@implementation LACSecureData

- (void)dealloc
{
  objc_super v3;

  -[LACSecureData reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)LACSecureData;
  -[LACSecureData dealloc](&v3, sel_dealloc);
}

- (void)prepareBuffer:(unint64_t)a3
{
  unint64_t allocatedLength;
  void *v6;
  void *v7;
  void *bytes;
  size_t bytesLength;
  id v10;

  allocatedLength = self->_allocatedLength;
  if (allocatedLength >= a3)
  {
    +[LACSecureData resetBytes:length:](LACSecureData, "resetBytes:length:", (char *)self->_bytes + a3, allocatedLength - a3);
  }
  else
  {
    v6 = malloc_type_malloc(a3, 0x91F2B9A8uLL);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    v7 = v6;
    +[LACSecureData resetBytes:length:](LACSecureData, "resetBytes:length:", v6, a3);
    bytes = self->_bytes;
    if (bytes)
    {
      bytesLength = self->_bytesLength;
      if (bytesLength)
      {
        memcpy(v7, bytes, bytesLength);
        -[LACSecureData reset](self, "reset");
      }
    }
    self->_allocatedLength = a3;
    self->_bytes = v7;
  }
  self->_bytesLength = a3;
}

- (LACSecureData)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-init is not a valid initializer for the class LACSecureData"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (LACSecureData)initWithString:(id)a3
{
  id v4;
  LACSecureData *v5;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LACSecureData;
  v5 = -[LACSecureData init](&v8, sel_init);
  if (v5)
  {
    v7 = 0;
    objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, 0, &v7, 4, 0, 0, objc_msgSend(v4, "length"), 0);
    -[LACSecureData prepareBuffer:](v5, "prepareBuffer:", v7);
    objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v5->_bytes, v5->_bytesLength, &v7, 4, 0, 0, objc_msgSend(v4, "length"), 0);
  }

  return v5;
}

- (LACSecureData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  LACSecureData *v6;
  LACSecureData *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LACSecureData;
  v6 = -[LACSecureData init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[LACSecureData prepareBuffer:](v6, "prepareBuffer:", a4);
    memcpy(v7->_bytes, a3, a4);
  }
  return v7;
}

- (LACSecureData)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return -[LACSecureData initWithBytes:length:](self, "initWithBytes:length:", v5, v6);
}

+ (id)secureDataWithBytes:(const void *)a3 length:(unint64_t)a4
{
  return -[LACSecureData initWithBytes:length:]([LACSecureData alloc], "initWithBytes:length:", a3, a4);
}

+ (id)secureDataWithString:(id)a3
{
  id v3;
  LACSecureData *v4;

  v3 = a3;
  v4 = -[LACSecureData initWithString:]([LACSecureData alloc], "initWithString:", v3);

  return v4;
}

+ (id)secureDataWithData:(id)a3
{
  id v3;
  LACSecureData *v4;

  v3 = a3;
  v4 = -[LACSecureData initWithData:]([LACSecureData alloc], "initWithData:", v3);

  return v4;
}

- (id)nullTerminatedCopy
{
  void *v2;
  char v4;

  +[LACSecureData secureDataWithBytes:length:](LACSecureData, "secureDataWithBytes:length:", -[LACSecureData bytes](self, "bytes"), -[LACSecureData length](self, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  objc_msgSend(v2, "appendBytes:length:", &v4, 1);
  return v2;
}

+ (void)resetBytes:(void *)a3 length:(unint64_t)a4
{
  bzero(a3, a4);
}

- (void)reset
{
  void *bytes;

  bytes = self->_bytes;
  if (bytes)
  {
    +[LACSecureData resetBytes:length:](LACSecureData, "resetBytes:length:", bytes, self->_bytesLength);
    free(self->_bytes);
    self->_allocatedLength = 0;
    self->_bytes = 0;
    self->_bytesLength = 0;
  }
}

- (const)bytes
{
  return self->_bytes;
}

- (unint64_t)length
{
  return self->_bytesLength;
}

- (id)data
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_bytes, self->_bytesLength);
}

- (void)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  unint64_t bytesLength;

  bytesLength = self->_bytesLength;
  -[LACSecureData prepareBuffer:](self, "prepareBuffer:", bytesLength + a4);
  memcpy((char *)self->_bytes + bytesLength, a3, a4);
}

- (void)appendData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  -[LACSecureData appendBytes:length:](self, "appendBytes:length:", v5, v6);
}

- (void)appendString:(id)a3
{
  id v4;

  +[LACSecureData secureDataWithString:](LACSecureData, "secureDataWithString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LACSecureData appendData:](self, "appendData:", v4);

}

- (BOOL)removeLastCharacter
{
  char *bytes;
  unint64_t bytesLength;
  unint64_t v4;
  char *v5;
  char *v6;

  bytes = (char *)self->_bytes;
  if (bytes)
  {
    bytesLength = self->_bytesLength;
    if (bytesLength)
    {
      if (bytesLength == 1)
      {
        v4 = 1;
LABEL_13:
        -[LACSecureData resize:](self, "resize:", bytesLength - v4);
        LOBYTE(bytes) = 1;
        return (char)bytes;
      }
      v5 = &bytes[bytesLength];
      v6 = bytes - 1;
      v4 = 1;
      while ((v6[bytesLength] & 0xC0) == 0x80)
      {
        --v6;
        if (bytesLength == ++v4)
        {
          v4 = self->_bytesLength;
          break;
        }
      }
      if (v4 < 2)
        goto LABEL_13;
      LOBYTE(bytes) = 0;
      if (v4 <= 6 && v5[-v4] >= 0xC0u)
        goto LABEL_13;
    }
    else
    {
      LOBYTE(bytes) = 0;
    }
  }
  return (char)bytes;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = -[LACSecureData length](self, "length");
  v6 = v5 == objc_msgSend(v4, "length")
    && timingsafe_bcmp(-[LACSecureData bytes](self, "bytes"), (const void *)objc_msgSend(v4, "bytes"), -[LACSecureData length](self, "length")) == 0;

  return v6;
}

@end
