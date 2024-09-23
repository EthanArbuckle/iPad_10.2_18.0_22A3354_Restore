@implementation _PFEncodedData

- (_PFEncodedData)retain
{
  NSData *v3;

  v3 = self->_aData;
  return self;
}

- (const)bytes
{
  return &self[1];
}

- (unint64_t)length
{
  return self->_byteCount;
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  memcpy(a3, &self[1], a4);
}

- (void)release
{

}

- (BOOL)isEqualToData:(id)a3
{
  uint64_t byteCount;
  const UInt8 *BytePtr;

  byteCount = self->_byteCount;
  if (objc_msgSend(a3, "length") != byteCount)
    return 0;
  BytePtr = CFDataGetBytePtr((CFDataRef)a3);
  return memcmp(&self[1], BytePtr, self->_byteCount) == 0;
}

- (_PFEncodedData)init
{
  self->_reserved = 0;

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("You're doing it wrong"), CFSTR("Class cannot be used this way."), 0));
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (unint64_t)retainCount
{
  return -[NSData retainCount](self->_aData, "retainCount");
}

- (BOOL)_isDeallocating
{
  return -[NSData _isDeallocating](self->_aData, "_isDeallocating");
}

- (BOOL)_tryRetain
{
  return -[NSData _tryRetain](self->_aData, "_tryRetain");
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &self[1], self->_byteCount);
  v3 = (void *)objc_msgSend(v2, "description");

  return v3;
}

- (id)mutableCopy
{
  return -[_PFEncodedData mutableCopyWithZone:](self, "mutableCopyWithZone:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DF0], "allocWithZone:", a3), "initWithBytes:length:", &self[1], self->_byteCount);
}

- (uint64_t)privateCopy
{
  if (result)
    return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", result + 24, *(unsigned int *)(result + 16));
  return result;
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  memcpy(a3, (char *)&self[1] + a4.location, a4.length);
}

- (id)subdataWithRange:(_NSRange)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)&self[1] + a3.location, a3.length);
}

- (_NSRange)rangeOfData:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Data may not be nil"), 0, a5.length));
  length = a5.length;
  location = a5.location;
  v9 = (void *)-[_PFEncodedData privateCopy]((uint64_t)self);
  v10 = objc_msgSend(v9, "rangeOfData:options:range:", a3, a4, location, length);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v8;

  v8 = (void *)-[_PFEncodedData privateCopy]((uint64_t)self);
  LOBYTE(a5) = objc_msgSend(v8, "writeToFile:options:error:", a3, a4, a5);

  return (char)a5;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  return -[_PFEncodedData writeToFile:options:error:](self, "writeToFile:options:error:", a3, 1, 0);
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v8;

  v8 = (void *)-[_PFEncodedData privateCopy]((uint64_t)self);
  LOBYTE(a5) = objc_msgSend(v8, "writeToURL:options:error:", a3, a4, a5);

  return (char)a5;
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4
{
  return -[_PFEncodedData writeToURL:options:error:](self, "writeToURL:options:error:", a3, 1, 0);
}

@end
