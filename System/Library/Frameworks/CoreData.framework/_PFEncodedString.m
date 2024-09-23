@implementation _PFEncodedString

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  const char *v8;
  const char *v9;
  unsigned __int16 v10;

  length = a4.length;
  location = a4.location;
  v7 = a4.location + a4.length;
  v8 = -[_PFEncodedString UTF8String](self, "UTF8String");
  if (location < v7)
  {
    v9 = &v8[location];
    do
    {
      v10 = *v9++;
      *a3++ = v10;
      --length;
    }
    while (length);
  }
}

- (unint64_t)hash
{
  -[_PFEncodedString UTF8String](self, "UTF8String");
  return CFStringHashCString();
}

- (unint64_t)length
{
  return self->_length;
}

- (const)UTF8String
{
  return (const char *)&self[1];
}

- (BOOL)isEqualToString:(id)a3
{
  if (self == a3)
    return 1;
  if (a3)
    return _compareUnknownStrings(self, (__CFString *)a3);
  return 0;
}

- (void)release
{

}

- (_PFEncodedString)retain
{
  id v3;

  v3 = self->_sourceData;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", -[_PFEncodedString UTF8String](self, "UTF8String"));
}

- (void)getCharacters:(unsigned __int16 *)a3
{
  uint64_t length;
  const char *v5;
  unsigned __int16 v6;

  length = self->_length;
  v5 = -[_PFEncodedString UTF8String](self, "UTF8String");
  if ((_DWORD)length)
  {
    do
    {
      v6 = *v5++;
      *a3++ = v6;
      --length;
    }
    while (length);
  }
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isNSString");
    if (v5)
      LOBYTE(v5) = _compareUnknownStrings(self, (__CFString *)a3);
  }
  return v5;
}

- (id)copy
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", -[_PFEncodedString UTF8String](self, "UTF8String"));
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[_PFEncodedString UTF8String](self, "UTF8String")[a3];
}

- (_PFEncodedString)init
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("You're doing it wrong"), CFSTR("Skanky class can only be used skankily."), 0));
}

- (unint64_t)retainCount
{
  return objc_msgSend(self->_sourceData, "retainCount");
}

- (BOOL)_isDeallocating
{
  return objc_msgSend(self->_sourceData, "_isDeallocating");
}

- (BOOL)_tryRetain
{
  return objc_msgSend(self->_sourceData, "_tryRetain");
}

- (BOOL)_isCString
{
  return 1;
}

- (void)getCString:(char *)a3
{
  memcpy(a3, -[_PFEncodedString UTF8String](self, "UTF8String"), self->_length + 1);
}

- (unint64_t)cStringLength
{
  return self->_length;
}

@end
