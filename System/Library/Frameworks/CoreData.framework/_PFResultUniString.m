@implementation _PFResultUniString

+ (void)initialize
{
  objc_class *v2;
  CFAllocatorContext v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (objc_class *)objc_opt_class();
    _MergedGlobals_70 = (class_getInstanceSize(v2) + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_OWORD *)&v3.reallocate = unk_1E1EDDA70;
    v3.preferredSize = 0;
    memset(&v3, 0, 48);
    qword_1ECD8D960 = (uint64_t)CFAllocatorCreate(0, &v3);
  }
}

+ (unint64_t)bufferOffset
{
  return _MergedGlobals_70;
}

+ (__CFAllocator)cfDeallocator
{
  return (__CFAllocator *)qword_1ECD8D960;
}

- (const)UTF8String
{
  return (char *)self + _MergedGlobals_70;
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[_PFResultUniString UTF8String](self, "UTF8String")[a3];
}

- (void)getCharacters:(unsigned __int16 *)a3
{
  uint64_t length;
  const char *v5;
  unsigned __int16 v6;

  length = self->_length;
  v5 = -[_PFResultUniString UTF8String](self, "UTF8String");
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
  v8 = -[_PFResultUniString UTF8String](self, "UTF8String");
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

- (BOOL)_isCString
{
  return 1;
}

- (void)getCString:(char *)a3
{
  memcpy(a3, -[_PFResultUniString UTF8String](self, "UTF8String"), self->_length + 1);
}

- (unint64_t)cStringLength
{
  return self->_length;
}

- (unint64_t)hash
{
  -[_PFResultUniString UTF8String](self, "UTF8String");
  return CFStringHashCString();
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

- (BOOL)isEqualToString:(id)a3
{
  if (self == a3)
    return 1;
  if (a3)
    return _compareUnknownStrings(self, (__CFString *)a3);
  return 0;
}

@end
