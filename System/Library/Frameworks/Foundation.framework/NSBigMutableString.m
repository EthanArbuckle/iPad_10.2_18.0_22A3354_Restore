@implementation NSBigMutableString

- (unint64_t)length
{
  return self->length;
}

- (id)_newBigSubstringWithRange:(_NSRange)a3 wantsMutable:(BOOL)a4 zone:(_NSZone *)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v7;
  _BOOL4 v9;
  $12A8D912EA621CF5C78D0B17F79410D4 flags;
  id v12;
  void *v13;
  const void *v14;
  void *v15;
  NSBigMutableString *v16;
  NSBigMutableString *v17;

  length = a3.length;
  location = a3.location;
  v7 = self->length;
  if (a3.location + a3.length > v7)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      a3.location,
                      a3.length,
                      self->length),
                    0);
    objc_exception_throw(v15);
  }
  v9 = a4;
  flags = self->flags;
  if (!a3.location && a3.length == v7 && !a4 && (*(_BYTE *)&flags & 0x10) != 0)
    return self;
  if (!a3.length)
    return objc_alloc_init((Class)objc_opt_class());
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if (a4 || a3.length << ((*(_BYTE *)&flags & 2) != 0) >= 0x201)
    {
      v17 = self;
      v14 = (const void *)CFStorageCreateWithSubrange();
      v12 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStorage:length:isUnicode:", v14, length, (*(_DWORD *)&v17->flags >> 1) & 1);
      CFRelease(v14);
      goto LABEL_18;
    }
    return -[NSBigMutableString _newSmallImmutableSubstringWithRange:zone:](self, "_newSmallImmutableSubstringWithRange:zone:", location, length, a5);
  }
  if (a3.length <= 0x10 && !a4)
    return -[NSBigMutableString _newSmallImmutableSubstringWithRange:zone:](self, "_newSmallImmutableSubstringWithRange:zone:", location, length, a5);
  v16 = self;
  v12 = objc_alloc_init((Class)objc_opt_class());
  if (!objc_msgSend(v12, "_copyDataFrom:range:", v16, location, length))
  {

    if (v9)
    {
      v13 = NSZoneMalloc(a5, 2 * length);
      -[NSBigMutableString getCharacters:range:](v16, "getCharacters:range:", v13, location, length);
      return -[NSString initWithCharactersNoCopy:length:freeWhenDone:](+[NSMutableString allocWithZone:](NSMutableString, "allocWithZone:", a5), "initWithCharactersNoCopy:length:freeWhenDone:", v13, length, 1);
    }
    self = v16;
    return -[NSBigMutableString _newSmallImmutableSubstringWithRange:zone:](self, "_newSmallImmutableSubstringWithRange:zone:", location, length, a5);
  }
LABEL_18:
  if (!v9)
    objc_msgSend(v12, "_markAsImmutable");
  return v12;
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  BOOL v9;
  NSUInteger v10;
  NSString *v13;
  NSString *v14;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  void *v19;
  NSRange v20;

  length = a3.length;
  location = a3.location;
  v8 = self->length;
  v9 = v8 >= a3.length;
  v10 = v8 - a3.length;
  if (!v9 || a3.location > v10)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
                        _NSMethodExceptionProem((objc_class *)self, a2),
                        location,
                        length,
                        self->length),
                      0);
      objc_exception_throw(v19);
    }
    if ((_newSubstringWithRange_zone__warnonce & 1) == 0)
    {
      _newSubstringWithRange_zone__warnonce = 1;
      v13 = _NSMethodExceptionProem((objc_class *)self, a2);
      v20.location = location;
      v20.length = length;
      v14 = NSStringFromRange(v20);
      NSLog((NSString *)CFSTR("*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution."),
        v13,
        v14);
    }
    v15 = self->length;
    if (location <= v15)
      v16 = location;
    else
      v16 = 0;
    v9 = v15 >= location;
    v17 = v15 - location;
    if (v9)
      length = v17;
    else
      length = 0;
    location = v16;
  }
  return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:](self, "_newBigSubstringWithRange:wantsMutable:zone:", location, length, 0, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:](self, "_newBigSubstringWithRange:wantsMutable:zone:", 0, self->length, 0, a3);
}

- (id)_newSmallImmutableSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  size_t length;
  NSUInteger location;
  malloc_zone_t *v8;
  void *v9;
  void *v10;
  malloc_zone_t *v12;
  void *v13;
  NSString *v14;

  if (!a3.length)
    return &stru_1E0F56070;
  length = a3.length;
  location = a3.location;
  if ((*(_BYTE *)&self->flags & 2) != 0)
  {
    v12 = (malloc_zone_t *)a4;
    if (!a4)
      v12 = malloc_default_zone();
    v13 = malloc_type_zone_malloc(v12, 2 * length, 0x4A6F13AEuLL);
    -[NSBigMutableString getCharacters:range:](self, "getCharacters:range:", v13, location, length);
    return -[NSString initWithCharactersNoCopy:length:freeWhenDone:](+[NSString allocWithZone:](NSString, "allocWithZone:", a4), "initWithCharactersNoCopy:length:freeWhenDone:", v13, length, 1);
  }
  else
  {
    v8 = (malloc_zone_t *)a4;
    if (!a4)
      v8 = malloc_default_zone();
    v9 = malloc_type_zone_malloc(v8, length, 0x4A6F13AEuLL);
    v10 = v9;
    if ((*(_BYTE *)&self->flags & 1) != 0)
      CFStorageGetValues();
    else
      memmove(v9, &self->contents.d.dataBytes[location], length);
    v14 = +[NSString allocWithZone:](NSString, "allocWithZone:", a4);
    return -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:](v14, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v10, length, _NSCStringEncoding, 1);
  }
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  unsigned __int16 *v6;
  $12A8D912EA621CF5C78D0B17F79410D4 flags;
  char *dataBytes;
  char *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  unsigned int v14;
  void *v15;

  length = a4.length;
  if (a4.location + a4.length > self->length)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      a4.location,
                      a4.length,
                      self->length),
                    0);
    objc_exception_throw(v15);
  }
  v6 = a3;
  flags = self->flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    CFStorageGetValues();
    if ((*(_BYTE *)&self->flags & 2) == 0 && (uint64_t)(length - 1) >= 0)
    {
      v12 = _NSCStringCharToUnicharTable;
      do
      {
        v6[length - 1] = *(_WORD *)(v12 + 2 * *((unsigned __int8 *)v6 + length - 1));
        --length;
      }
      while (length);
    }
  }
  else
  {
    dataBytes = self->contents.d.dataBytes;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      v13 = &dataBytes[2 * a4.location];
      if ((*(_BYTE *)&flags & 8) != 0)
      {
        if (a4.length)
        {
          do
          {
            v14 = *(unsigned __int16 *)v13;
            v13 += 2;
            *v6++ = bswap32(v14) >> 16;
            --length;
          }
          while (length);
        }
      }
      else
      {
        memmove(a3, v13, 2 * a4.length);
      }
    }
    else if (a4.length)
    {
      v9 = &dataBytes[a4.location];
      v10 = _NSCStringCharToUnicharTable;
      do
      {
        v11 = *v9++;
        *v6++ = *(_WORD *)(v10 + 2 * v11);
        --length;
      }
      while (length);
    }
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSBigMutableString;
  -[NSBigMutableString dealloc](&v3, sel_dealloc);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  $12A8D912EA621CF5C78D0B17F79410D4 flags;
  _WORD *ConstValueAtIndex;
  unsigned int v5;
  unsigned int v6;
  void *v8;

  if (self->length <= a3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Index %lu out of bounds; string length %lu"),
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a3,
                     self->length),
                   0);
    objc_exception_throw(v8);
  }
  flags = self->flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    ConstValueAtIndex = (_WORD *)CFStorageGetConstValueAtIndex();
    if ((*(_BYTE *)&flags & 2) != 0)
    {
LABEL_7:
      LOWORD(v5) = *ConstValueAtIndex;
      return v5;
    }
LABEL_6:
    ConstValueAtIndex = (_WORD *)(_NSCStringCharToUnicharTable + 2 * *(unsigned __int8 *)ConstValueAtIndex);
    goto LABEL_7;
  }
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    ConstValueAtIndex = -[NSData bytes](self->contents.d.data, "bytes") + a3;
    goto LABEL_6;
  }
  v5 = *(unsigned __int16 *)&self->contents.d.dataBytes[2 * a3];
  v6 = bswap32(v5) >> 16;
  if ((*(_BYTE *)&flags & 8) != 0)
    LOWORD(v5) = v6;
  return v5;
}

- (NSBigMutableString)initWithString:(id)a3
{
  NSBigMutableString *v4;
  NSBigMutableString *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSBigMutableString;
  v4 = -[NSString init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[NSMutableString appendString:](v4, "appendString:", a3);
  return v5;
}

- (BOOL)_setData:(id)a3 encoding:(unint64_t)a4
{
  $4376AED9FB5848446BE0151A46803C1B *p_contents;
  NSData *data;
  unint64_t v9;
  NSData *v10;
  char *v11;
  int v12;
  $12A8D912EA621CF5C78D0B17F79410D4 v13;
  int v14;
  unint64_t v15;
  CFStringEncoding v16;
  unsigned __int16 *v17;
  size_t v18;
  malloc_zone_t *v19;
  int v20;
  id v21;
  unint64_t v22;
  BOOL v23;
  NSData *v24;
  id v25;
  NSData *v26;
  int v28;
  int v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  char v36;
  unint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  -[NSBigMutableString _checkForInvalidMutationWithSelector:](self, "_checkForInvalidMutationWithSelector:", a2);
  p_contents = &self->contents;
  data = self->contents.d.data;
  if ((*(_BYTE *)&self->flags & 1) == 0 && data == a3)
    v25 = a3;
  else

  p_contents->d.data = 0;
  if (a4 != 1 && _NSCStringEncoding != a4)
  {
    v16 = CFStringConvertNSStringEncodingToEncoding(a4);
    switch(BYTE1(v16))
    {
      case 0:
        if ((v16 > 0x22 || ((1 << v16) & 0x600000032) == 0) && v16 != 152)
          goto LABEL_46;
        goto LABEL_6;
      case 1:
        if (v16 == 134217984)
          goto LABEL_46;
        goto LABEL_6;
      case 2:
        if (v16 != 518)
          goto LABEL_46;
        goto LABEL_6;
      case 6:
        if (v16 == 1536)
          goto LABEL_46;
        goto LABEL_6;
      case 8:
      case 0xC:
        goto LABEL_6;
      case 0xA:
        if (v16 - 2561 > 0xF)
          goto LABEL_46;
        v28 = 1 << (v16 - 1);
        v29 = 32785;
        goto LABEL_45;
      case 0xB:
        if (v16 - 3059 > 0xC)
          goto LABEL_46;
        v28 = 1 << (v16 + 13);
        v29 = 4099;
LABEL_45:
        if ((v28 & v29) == 0)
          goto LABEL_46;
        goto LABEL_6;
      default:
        if ((v16 & 0xFF00) > 0xC00)
          goto LABEL_6;
LABEL_46:
        v30 = objc_msgSend(a3, "length");
        v31 = (uint64_t *)objc_msgSend(a3, "bytes");
        break;
    }
    while (v30 > 7)
    {
      v32 = *v31++;
      v30 -= 8;
      if ((v32 & 0x8080808080808080) != 0)
        goto LABEL_6;
    }
    while (v30 > 3)
    {
      v33 = *(_DWORD *)v31;
      v31 = (uint64_t *)((char *)v31 + 4);
      v30 -= 4;
      if ((v33 & 0x80808080) != 0)
        goto LABEL_6;
    }
    v34 = 0;
    while (v30 != v34)
    {
      v35 = *((char *)v31 + v34++);
      if (v35 < 0)
        goto LABEL_6;
    }
    a4 = 1;
  }
LABEL_6:
  *(_DWORD *)&self->flags &= 0xFFFFFFF0;
  self->length = 0;
  if (!a3 || a4 == 1 || a4 == _NSCStringEncoding)
  {
    if (a3)
      v15 = objc_msgSend(a3, "length");
    else
      v15 = 0;
    self->length = v15;
    v26 = (NSData *)objc_msgSend(a3, "copyWithZone:", 0);
    p_contents->d.data = v26;
    self->contents.d.dataBytes = (char *)-[NSData bytes](v26, "bytes");
LABEL_28:
    LOBYTE(v20) = 1;
    return v20;
  }
  if (a4 == 10)
  {
    v9 = objc_msgSend(a3, "length");
    v10 = (NSData *)objc_msgSend(a3, "copyWithZone:", 0);
    p_contents->d.data = v10;
    v11 = -[NSData bytes](v10, "bytes");
    self->contents.d.dataBytes = v11;
    if (v9 >= 2 && ((v12 = *(unsigned __int16 *)v11, v12 == 65279) || v12 == 65534))
    {
      v13 = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags | 4);
      self->flags = v13;
      if (*(__int16 *)self->contents.d.dataBytes == -257)
        v14 = 2;
      else
        v14 = 10;
    }
    else
    {
      v13 = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags & 0xFFFFFFFB);
      v14 = 2;
    }
    self->flags = ($12A8D912EA621CF5C78D0B17F79410D4)(v14 | *(_DWORD *)&v13 & 0xFFFFFFF5);
    self->length = (v9 >> 1) - ((*(unsigned int *)&v13 >> 2) & 1);
    if ((*(_BYTE *)&self->flags & 4) != 0)
      self->contents.d.dataBytes += 2;
    goto LABEL_28;
  }
  v37 = 0;
  v38[0] = 0;
  v36 = 0;
  v17 = (unsigned __int16 *)objc_msgSend(a3, "bytes");
  v18 = objc_msgSend(a3, "length");
  v19 = malloc_default_zone();
  v20 = _NSConvertToASCIIorUnicode(v17, v18, a4, v38, &v37, &v36, v19);
  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0C99D50]);
    v22 = v37;
    v23 = v36 == 0;
    v24 = (NSData *)objc_msgSend(v21, "initWithBytesNoCopy:length:freeWhenDone:", v38[0], v37 << (v36 == 0), 1);
    p_contents->d.data = v24;
    self->contents.d.dataBytes = (char *)-[NSData bytes](v24, "bytes");
    self->flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags & 0xFFFFFFFD | (2 * v23));
    self->length = v22;
  }
  return v20;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  unint64_t v14;
  $12A8D912EA621CF5C78D0B17F79410D4 flags;
  NSData *v16;
  int v17;
  NSString *v19;
  void *v20;
  _QWORD *v21;
  unint64_t v22;
  id v23;
  _QWORD v24[2];

  length = a3.length;
  location = a3.location;
  v24[1] = *MEMORY[0x1E0C80C00];
  -[NSBigMutableString _checkForInvalidMutationWithSelector:](self, "_checkForInvalidMutationWithSelector:", a2);
  if (!a4)
  {
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2));
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_35;
  }
  v9 = location + length;
  if (location + length > self->length)
  {
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
            _NSMethodExceptionProem((objc_class *)self, a2),
            location,
            length,
            self->length);
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = (_QWORD *)MEMORY[0x1E0C99858];
LABEL_35:
    objc_exception_throw((id)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", *v21, v19, 0));
  }
  v10 = objc_msgSend(a4, "length");
  v11 = self->length;
  if ((*(_BYTE *)&self->flags & 2) != 0)
  {
    v12 = 1;
  }
  else if ((objc_msgSend(a4, "_isCString") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = objc_msgSend(a4, "length");
    v12 = v13 != objc_msgSend(a4, "lengthOfBytesUsingEncoding:", _NSCStringEncoding);
  }
  if (length != v11)
    goto LABEL_11;
  if (object_getClass(a4) != (Class)NSBigMutableString)
  {
    if (!objc_msgSend(a4, "length"))
    {
      -[NSBigMutableString _setData:encoding:](self, "_setData:encoding:", 0, 1);
      return;
    }
LABEL_11:
    v14 = v10 - length + v11;
    flags = self->flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      if ((*(_BYTE *)&flags & 2) != 0 || !v12)
      {
        if (v14 <= v11)
          CFStorageDeleteValues();
        else
          CFStorageInsertValues();
        goto LABEL_24;
      }
      v22 = v10;
      v16 = (NSData *)CFStorageCreate();
      CFStorageInsertValues();
      copyFromStringToStorage((uint64_t)self, 0, location, (uint64_t)v16, 0, 1);
      copyFromStringToStorage((uint64_t)self, v9, v11 - v9, (uint64_t)v16, v22 + location, 1);
      *(_DWORD *)&self->flags |= 2u;

    }
    else
    {
      v22 = v10;
      v16 = (NSData *)CFStorageCreate();
      CFStorageInsertValues();
      if (self->contents.d.data)
      {
        copyFromStringToStorage((uint64_t)self, 0, location, (uint64_t)v16, 0, v12);
        copyFromStringToStorage((uint64_t)self, v9, v11 - v9, (uint64_t)v16, v22 + location, v12);

      }
      if (v12)
        v17 = 3;
      else
        v17 = 1;
      self->flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags & 0xFFFFFFFC | v17);
    }
    self->contents.d.data = v16;
    v10 = v22;
LABEL_24:
    copyFromStringToStorage((uint64_t)a4, 0, v10, (uint64_t)self->contents.d.data, location, v12);
    self->length = v14;
    return;
  }
  v23 = 0;
  v24[0] = 0;
  if (!-[NSBigMutableString _copyDataFrom:range:](self, "_copyDataFrom:range:", a4, 0, v10))
  {
    if (objc_msgSend(a4, "_copyStorage:encoding:", &v23, v24))
    {
      -[NSBigMutableString _setStorage:encoding:](self, "_setStorage:encoding:", v23, v24[0]);

      return;
    }
    goto LABEL_11;
  }
}

- (void)_checkForInvalidMutationWithSelector:(SEL)a3
{
  void *v3;

  if ((*(_BYTE *)&self->flags & 0x10) != 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to mutate immutable object with %s"), sel_getName(a3)), 0);
    objc_exception_throw(v3);
  }
}

- (NSBigMutableString)initWithStorage:(__CFStorage *)a3 length:(unint64_t)a4 isUnicode:(BOOL)a5
{
  _BOOL4 v5;
  NSBigMutableString *v8;
  NSBigMutableString *v9;
  int v10;
  objc_super v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSBigMutableString;
  v8 = -[NSString init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->length = a4;
    if (v5)
      v10 = 3;
    else
      v10 = 1;
    v8->flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&v8->flags & 0xFFFFFFFC | v10);
    v8->contents.d.data = (NSData *)a3;
  }
  return v9;
}

- (void)_markAsImmutable
{
  *(_DWORD *)&self->flags |= 0x10u;
}

- (BOOL)_isMarkedAsImmutable
{
  return (*(_BYTE *)&self->flags >> 4) & 1;
}

- (BOOL)_getData:(id *)a3 encoding:(unint64_t *)a4
{
  $12A8D912EA621CF5C78D0B17F79410D4 flags;
  unint64_t v5;

  flags = self->flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
    if (a3)
      *a3 = self->contents.d.data;
    if (a4)
    {
      v5 = 10;
      if ((*(_DWORD *)&self->flags & 2) == 0)
        v5 = _NSCStringEncoding;
      *a4 = v5;
    }
  }
  return (*(_BYTE *)&flags & 1) == 0;
}

- (BOOL)_copyStorage:(__CFStorage *)a3 encoding:(unint64_t *)a4
{
  NSData *data;
  unint64_t v7;

  if ((*(_BYTE *)&self->flags & 1) != 0)
  {
    data = self->contents.d.data;
    if (data)
    {
      if (a3)
        *a3 = (__CFStorage *)CFStorageCreateWithSubrange();
      if (a4)
      {
        v7 = 10;
        if ((*(_DWORD *)&self->flags & 2) == 0)
          v7 = _NSCStringEncoding;
        *a4 = v7;
      }
      LOBYTE(data) = 1;
    }
  }
  else
  {
    LOBYTE(data) = 0;
  }
  return (char)data;
}

- (BOOL)_setStorage:(__CFStorage *)a3 encoding:(unint64_t)a4
{
  int v8;
  void *v10;

  -[NSBigMutableString _checkForInvalidMutationWithSelector:](self, "_checkForInvalidMutationWithSelector:", a2);
  if (a4 != 1 && a4 != 10 && _NSCStringEncoding != a4)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s called with unsupported string encoding %lu"), sel_getName(a2), a4), 0);
    objc_exception_throw(v10);
  }

  self->contents.d.data = 0;
  if (a4 == 10)
    v8 = 3;
  else
    v8 = 1;
  self->flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags & 0xFFFFFFF0 | v8);
  self->contents.d.data = (NSData *)a3;
  self->length = CFStorageGetCount();
  return 1;
}

- (BOOL)_copyDataFrom:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  $12A8D912EA621CF5C78D0B17F79410D4 flags;
  $12A8D912EA621CF5C78D0B17F79410D4 v9;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  NSData *v14;
  char *v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSData *v21;

  length = a4.length;
  location = a4.location;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (*((_BYTE *)a3 + 8) & 1) != 0)
    return 0;
  flags = self->flags;

  self->contents.d.data = 0;
  if ((*(_BYTE *)&flags & 1) != 0)
    *(_DWORD *)&self->flags &= ~1u;
  if (location)
  {
    v9 = self->flags;
LABEL_10:
    v16 = *((unsigned int *)a3 + 2);
    v17 = *((_DWORD *)a3 + 2) & 2 | *(_DWORD *)&v9 & 0xFFFFFFFD;
    self->flags = ($12A8D912EA621CF5C78D0B17F79410D4)v17;
    self->flags = ($12A8D912EA621CF5C78D0B17F79410D4)(v17 & 0xFFFFFFF3 | *((_DWORD *)a3 + 2) & 8);
    v18 = (v16 >> 1) & 1;
    v19 = location << ((v16 & 2) != 0);
    if ((*((_DWORD *)a3 + 2) & 4) != 0)
      v20 = v19 + 2;
    else
      v20 = v19;
    v21 = (NSData *)(id)objc_msgSend(*((id *)a3 + 3), "subdataWithRange:", v20, length << v18);
    self->contents.d.data = v21;
    v15 = -[NSData bytes](v21, "bytes");
    goto LABEL_14;
  }
  v11 = objc_msgSend(a3, "length");
  v9 = self->flags;
  if (length != v11)
    goto LABEL_10;
  v12 = *(_DWORD *)&v9 & 0xFFFFFFFD | (2 * ((*((_DWORD *)a3 + 2) >> 1) & 1));
  self->flags = ($12A8D912EA621CF5C78D0B17F79410D4)v12;
  v13 = v12 & 0xFFFFFFF7 | (8 * ((*((_DWORD *)a3 + 2) >> 3) & 1));
  self->flags = ($12A8D912EA621CF5C78D0B17F79410D4)v13;
  self->flags = ($12A8D912EA621CF5C78D0B17F79410D4)(v13 & 0xFFFFFFFB | (4 * ((*((_DWORD *)a3 + 2) >> 2) & 1)));
  v14 = (NSData *)*((id *)a3 + 3);
  self->contents.d.data = v14;
  v15 = (char *)(-[NSData bytes](v14, "bytes") + (((unint64_t)self->flags >> 1) & 2));
LABEL_14:
  self->contents.d.dataBytes = v15;
  self->length = length;
  return 1;
}

- (BOOL)_isCString
{
  return (*(_BYTE *)&self->flags & 2) == 0;
}

- (id)_createSubstringWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  BOOL v7;
  NSUInteger v8;
  NSString *v11;
  NSString *v12;
  unint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v17;
  objc_super v18;
  uint64_t v19;
  NSRange v20;

  length = a3.length;
  location = a3.location;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = self->length;
  v7 = v6 >= a3.length;
  v8 = v6 - a3.length;
  if (!v7 || a3.location > v8)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
                        _NSMethodExceptionProem((objc_class *)self, a2),
                        location,
                        length,
                        self->length),
                      0);
      objc_exception_throw(v17);
    }
    if ((_createSubstringWithRange__warnonce & 1) == 0)
    {
      _createSubstringWithRange__warnonce = 1;
      v11 = _NSMethodExceptionProem((objc_class *)self, a2);
      v20.location = location;
      v20.length = length;
      v12 = NSStringFromRange(v20);
      NSLog((NSString *)CFSTR("*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution."),
        v11,
        v12);
    }
    v13 = self->length;
    if (location <= v13)
      v14 = location;
    else
      v14 = 0;
    v7 = v13 >= location;
    v15 = v13 - location;
    if (v7)
      length = v15;
    else
      length = 0;
    location = v14;
  }
  v18.receiver = self;
  v18.super_class = (Class)NSBigMutableString;
  return -[NSString _createSubstringWithRange:](&v18, sel__createSubstringWithRange_, location, length);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:](self, "_newBigSubstringWithRange:wantsMutable:zone:", 0, self->length, 1, a3);
}

@end
