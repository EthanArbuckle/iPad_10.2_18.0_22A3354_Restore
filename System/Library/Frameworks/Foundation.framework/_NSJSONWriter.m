@implementation _NSJSONWriter

- (_NSJSONWriter)init
{
  _NSJSONWriter *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSJSONWriter;
  result = -[_NSJSONWriter init](&v3, sel_init);
  if (result)
  {
    result->tempBuffer = 0;
    result->tempBufferLen = 0;
    result->totalDataWritten = 0;
  }
  return result;
}

- (id)dataWithRootObject:(id)a3 options:(unint64_t)a4
{
  self->dataBuffer = (char *)malloc_type_malloc(0x1000uLL, 0x46665749uLL);
  *(_OWORD *)&self->dataBufferLen = xmmword_1822CD210;
  self->freeDataBuffer = 1;
  self->kind = 1;
  if (!_writeJSONValue(self, (__CFString *)a3, 0, a4))
    return 0;
  self->freeDataBuffer = 0;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->dataBuffer, self->dataLen, 1);
}

- (_QWORD)resizeTemporaryBuffer:(_QWORD *)result
{
  _QWORD *v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  unint64_t v7;
  size_t v8;
  void *v9;

  if (result)
  {
    v2 = result;
    v3 = result[8];
    v4 = v3 >= a2;
    v5 = v3 >> 13;
    if (!v4 && v5 == 0)
    {
      v7 = 0x2000;
      if (a2 < 0x2000)
        v7 = a2;
      if (v7 <= 0x100)
        v8 = 256;
      else
        v8 = v7;
      v9 = (void *)result[7];
      if (v9)
        free(v9);
      result = malloc_type_malloc(v8, 0x3FF0B290uLL);
      v2[7] = result;
      v2[8] = v8;
    }
  }
  return result;
}

- (BOOL)appendString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  char v8;
  int appended;
  uint64_t v10;
  char v11;
  size_t __n;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  length = a4.length;
  location = a4.location;
  v16 = *MEMORY[0x1E0C80C00];
  -[_NSJSONWriter resizeTemporaryBuffer:](self, a4.length);
  v14 = 0;
  v15 = 0;
  __n = 0;
  objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", self->tempBuffer, self->tempBufferLen, &__n, 4, 0, location, length, &v14);
  appended = _appendBytes(self->tempBuffer, __n, (uint64_t)self, v8);
  if (appended)
  {
    v10 = v15;
    if (v15)
    {
      do
      {
        objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", self->tempBuffer, self->tempBufferLen, &__n, 4, 0, v14, v10, &v14);
        LOBYTE(appended) = _appendBytes(self->tempBuffer, __n, (uint64_t)self, v11);
        v10 = v15;
      }
      while (v15 && (appended & 1) != 0);
    }
    else
    {
      LOBYTE(appended) = 1;
    }
  }
  return appended;
}

- (void)dealloc
{
  char *tempBuffer;
  char *dataBuffer;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];

  tempBuffer = self->tempBuffer;
  if (tempBuffer)
    free(tempBuffer);
  dataBuffer = self->dataBuffer;
  if (dataBuffer && self->freeDataBuffer)
    free(dataBuffer);
  v5.receiver = self;
  v5.super_class = (Class)_NSJSONWriter;
  -[_NSJSONWriter dealloc](&v5, sel_dealloc);
}

- (int64_t)writeRootObject:(id)a3 toStream:(id)a4 options:(unint64_t)a5
{
  self->outputStream = (NSOutputStream *)a4;
  self->kind = 2;
  self->dataBuffer = (char *)malloc_type_malloc(0x100uLL, 0xDA139C64uLL);
  self->dataBufferLen = 256;
  self->freeDataBuffer = 1;
  if (_writeJSONValue(self, (__CFString *)a3, 0, a5))
    return self->totalDataWritten;
  else
    return -1;
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFailure:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

@end
