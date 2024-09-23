@implementation NSConstantString

- (NSConstantString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4
{
  -[NSConstantString doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  void *v4;

  if (self->super.numBytes <= a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Index %lu out of bounds; string length %lu"),
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a3,
                     self->super.numBytes),
                   0);
    objc_exception_throw(v4);
  }
  return *(_WORD *)(_NSCStringCharToUnicharTable + 2 * self->super.bytes[a3]);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  uint64_t v4;
  char *v5;
  unsigned int v6;
  void *v7;

  if (a4.location + a4.length > self->super.numBytes)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a4.location,
                     a4.length,
                     self->super.numBytes),
                   0);
    objc_exception_throw(v7);
  }
  if (a4.length)
  {
    v4 = _NSCStringCharToUnicharTable;
    v5 = &self->super.bytes[a4.location];
    do
    {
      v6 = *v5++;
      *a3++ = *(_WORD *)(v4 + 2 * v6);
      --a4.length;
    }
    while (a4.length);
  }
}

- (unint64_t)length
{
  return self->super.numBytes;
}

- (unint64_t)cStringLength
{
  return self->super.numBytes;
}

- (unint64_t)fastestEncoding
{
  return _NSCStringEncoding;
}

- (unint64_t)smallestEncoding
{
  return _NSCStringEncoding;
}

- (BOOL)canBeConvertedToEncoding:(unint64_t)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (_NSCStringEncoding == a3)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)NSConstantString;
  return -[NSSimpleCString canBeConvertedToEncoding:](&v4, sel_canBeConvertedToEncoding_);
}

- (const)_fastCStringContents:(BOOL)a3
{
  if (a3)
    return 0;
  else
    return self->super.bytes;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  uint64_t v6;
  const void *v7;
  uint64_t numBytes;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    if (!a3)
      goto LABEL_8;
    v5 = _NSIsNSString();
    if (!v5)
      return v5;
    v6 = objc_msgSend(a3, "_fastCStringContents:", 0);
    if (!v6)
    {
      v10.receiver = self;
      v10.super_class = (Class)NSConstantString;
      LOBYTE(v5) = -[NSSimpleCString isEqual:](&v10, sel_isEqual_, a3);
      return v5;
    }
    v7 = (const void *)v6;
    numBytes = self->super.numBytes;
    if (objc_msgSend(a3, "length") != numBytes)
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = memcmp(self->super.bytes, v7, self->super.numBytes) == 0;
  }
  return v5;
}

- (BOOL)isEqualToString:(id)a3
{
  uint64_t v5;
  const void *v6;
  uint64_t numBytes;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 1;
  if (!a3)
    return 0;
  v5 = objc_msgSend(a3, "_fastCStringContents:", 0);
  if (v5)
  {
    v6 = (const void *)v5;
    numBytes = self->super.numBytes;
    if (objc_msgSend(a3, "length") == numBytes)
      return memcmp(self->super.bytes, v6, self->super.numBytes) == 0;
    return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)NSConstantString;
  return -[NSSimpleCString isEqualToString:](&v9, sel_isEqualToString_, a3);
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 0;
  if (!a3)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)NSConstantString;
  return -[NSSimpleCString compare:options:range:](&v6, sel_compare_options_range_, a3, a4, a5.location, a5.length);
}

- (unint64_t)hash
{
  return CFStringHashCString();
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  uint64_t v2;

  v2 = objc_opt_class();
  NSLog((NSString *)CFSTR("*** dealloc called for %@"), v2);
}

- (const)cString
{
  return self->super.bytes;
}

- (const)lossyCString
{
  return self->super.bytes;
}

@end
