@implementation NSCheapMutableString

- (unint64_t)length
{
  return self->numCharacters;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if ((*(_BYTE *)&self->flags & 1) != 0)
  {
    memmove(a3, &self->contents.fat[a4.location], 2 * a4.length);
  }
  else
  {
    for (; a4.length; --a4.length)
      *a3++ = *((unsigned __int8 *)self->contents.fat + a4.location++);
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->flags & 2) != 0)
    free(self->contents.fat);
  v3.receiver = self;
  v3.super_class = (Class)NSCheapMutableString;
  -[NSCheapMutableString dealloc](&v3, sel_dealloc);
}

- (void)setContentsNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5 isUnicode:(BOOL)a6
{
  _BOOL4 v6;

  v6 = a6;
  if ((*(_BYTE *)&self->flags & 2) != 0)
    free(self->contents.fat);
  self->contents.fat = (unsigned __int16 *)a3;
  self->flags = ($992A3B757AA70BF52C20D879373DE9D6)(*(_DWORD *)&self->flags & 0xFFFFFFFE | v6);
  self->numCharacters = a4;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unsigned __int16 *fat;

  fat = self->contents.fat;
  if ((*(_BYTE *)&self->flags & 1) != 0)
    return fat[a3];
  else
    return *((unsigned __int8 *)fat + a3);
}

- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  unint64_t length;
  NSUInteger location;
  unint64_t v17;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->flags & 1) != 0
    || +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding") != a6)
  {
    v19.receiver = self;
    v19.super_class = (Class)NSCheapMutableString;
    return -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](&v19, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_, a3, a4, a5, a6, a7, a8.location, a8.length, a9);
  }
  else
  {
    if (a8.length >= a4)
      length = a4;
    else
      length = a8.length;
    if (a3 && length)
    {
      location = a8.location;
      v17 = length;
      do
      {
        *(_BYTE *)a3 = *((_BYTE *)self->contents.fat + location);
        a3 = (char *)a3 + 1;
        ++location;
        --v17;
      }
      while (v17);
    }
    if (a5)
      *a5 = length;
    if (a9)
    {
      a9->location = length + a8.location;
      a9->length = a8.length - length;
    }
    return 1;
  }
}

- (unint64_t)fastestEncoding
{
  if ((*(_BYTE *)&self->flags & 1) != 0)
    return 10;
  if (__NSDefaultStringEncodingFullyInited)
    return _NSDefaultStringEncoding;
  return _NSDefaultCStringEncoding();
}

- (const)cString
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->flags & 1) == 0)
    return self->contents.thin;
  v3.receiver = self;
  v3.super_class = (Class)NSCheapMutableString;
  return -[NSString cString](&v3, sel_cString);
}

- (const)lossyCString
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->flags & 1) == 0)
    return self->contents.thin;
  v3.receiver = self;
  v3.super_class = (Class)NSCheapMutableString;
  return -[NSString lossyCString](&v3, sel_lossyCString);
}

- (unint64_t)cStringLength
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->flags & 1) == 0)
    return self->numCharacters;
  v3.receiver = self;
  v3.super_class = (Class)NSCheapMutableString;
  return -[NSString cStringLength](&v3, sel_cStringLength);
}

@end
