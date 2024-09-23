@implementation NFCISO15693ReadMultipleBlocksConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NFCISO15693ReadMultipleBlocksConfiguration;
  v4 = -[NFCTagCommandConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRange:", self->_range.location, self->_range.length);
    objc_msgSend(v5, "setChunkSize:", self->_chunkSize);
  }
  return v5;
}

- (NFCISO15693ReadMultipleBlocksConfiguration)initWithRange:(NSRange)range chunkSize:(NSUInteger)chunkSize maximumRetries:(NSUInteger)maximumRetries retryInterval:(NSTimeInterval)retryInterval
{
  NSUInteger length;
  NSUInteger location;
  NFCISO15693ReadMultipleBlocksConfiguration *v11;
  NFCISO15693ReadMultipleBlocksConfiguration *v12;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  length = range.length;
  location = range.location;
  v16.receiver = self;
  v16.super_class = (Class)NFCISO15693ReadMultipleBlocksConfiguration;
  v11 = -[NFCISO15693ReadMultipleBlocksConfiguration init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_range.location = location;
    v11->_range.length = length;
    v11->_chunkSize = chunkSize;
    v15.receiver = v11;
    v15.super_class = (Class)NFCISO15693ReadMultipleBlocksConfiguration;
    -[NFCTagCommandConfiguration setMaximumRetries:](&v15, sel_setMaximumRetries_, maximumRetries);
    v14.receiver = v12;
    v14.super_class = (Class)NFCISO15693ReadMultipleBlocksConfiguration;
    -[NFCTagCommandConfiguration setRetryInterval:](&v14, sel_setRetryInterval_, retryInterval);
    v12->_flags = 34;
  }
  return v12;
}

- (NFCISO15693ReadMultipleBlocksConfiguration)initWithRange:(NSRange)range chunkSize:(NSUInteger)chunkSize
{
  return -[NFCISO15693ReadMultipleBlocksConfiguration initWithRange:chunkSize:maximumRetries:retryInterval:](self, "initWithRange:chunkSize:maximumRetries:retryInterval:", range.location, range.length, chunkSize, 0, 0.0);
}

- (id)asNSDataArrayWithUID:(id)a3 error:(id *)a4
{
  id v6;
  _NSRange *p_range;
  NSUInteger v8;
  void *v9;
  NSUInteger length;
  NSUInteger location;
  void *v12;
  unint64_t chunkSize;
  unint64_t v14;
  BOOL v15;
  char v16;
  unsigned __int8 flags;

  v6 = a3;
  if (self->_chunkSize
    && (p_range = &self->_range, (v8 = self->_range.length) != 0)
    && p_range->location <= 0xFF
    && p_range->location + v8 < 0x101)
  {
    v9 = (void *)objc_opt_new();
    length = self->_range.length;
    if (length)
    {
      location = p_range->location;
      do
      {
        v12 = (void *)objc_opt_new();
        flags = self->_flags;
        objc_msgSend(v12, "appendBytes:length:", &flags, 1);
        flags = 35;
        objc_msgSend(v12, "appendBytes:length:", &flags, 1);
        objc_msgSend(v12, "appendData:", v6);
        flags = location;
        objc_msgSend(v12, "appendBytes:length:", &flags, 1);
        chunkSize = self->_chunkSize;
        if (length >= chunkSize)
          v14 = self->_chunkSize;
        else
          LOBYTE(v14) = length;
        flags = v14 - 1;
        objc_msgSend(v12, "appendBytes:length:", &flags, 1);
        objc_msgSend(v9, "addObject:", v12);

        v15 = length > chunkSize;
        if (length <= chunkSize)
          v16 = 0;
        else
          v16 = chunkSize;
        LOBYTE(location) = location + v16;
        if (length >= chunkSize)
          length -= chunkSize;
        else
          length = 0;
      }
      while (v15);
    }
  }
  else if (a4)
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 300);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(NSRange)range
{
  self->_range = range;
}

- (NSUInteger)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(NSUInteger)chunkSize
{
  self->_chunkSize = chunkSize;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_flags = a3;
}

@end
