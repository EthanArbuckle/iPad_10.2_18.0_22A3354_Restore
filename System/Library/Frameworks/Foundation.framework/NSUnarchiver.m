@implementation NSUnarchiver

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  _BYTE *v5;
  NSUInteger **v6;
  NSUInteger **i;
  uint64_t v8;

  v5 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
  checkExpected((uint64_t)v5, (char *)a3);
  for (i = (NSUInteger **)&v8; *a3; a3 = _decodeValueOfObjCType((uint64_t)self, (char *)a3, *v6))
    v6 = i++;
}

- (id)decodeObject
{
  _BYTE *v3;

  if (self->streamerVersion >= 4)
  {
    v3 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
    checkExpected((uint64_t)v3, "@");
  }
  return (id)_decodeObject_old((uint64_t)self);
}

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  _BYTE *v5;
  _QWORD *datax;
  unint64_t *p_cursor;
  _BOOL4 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  int64_t v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
  void *result;
  BOOL v19;
  unint64_t v20;
  BOOL v21;
  BOOL v22;
  char *v23;
  BOOL v24;
  NSString *v25;

  if (self->streamerVersion > 3)
  {
    v5 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
    checkExpected((uint64_t)v5, "+");
  }
  datax = self->datax;
  p_cursor = &self->cursor;
  v8 = self->swap != 0;
  v9 = _decodeCharAtCursor(datax[1], datax[2], &self->cursor);
  v10 = _decodeIntStartingWithChar((uint64_t)datax, v9, &self->cursor, v8);
  v11 = v10;
  *a3 = v10;
  if (v10 < 0)
    goto LABEL_35;
  v12 = self->datax;
  v13 = v12[1];
  v14 = *p_cursor;
  v15 = !__CFADD__(*p_cursor, v13) || v14 <= 0;
  v16 = !v15;
  if (v14 == 0x8000000000000000)
    goto LABEL_35;
  if (v16)
    goto LABEL_35;
  v17 = v12[2];
  if (v14 < 0 && v13 < -v14)
    goto LABEL_35;
  if (!v17
    || ((result = (void *)(v14 + v13), -v17 < v13) ? (v19 = v17 == 1) : (v19 = 1),
        (v20 = v17 - 1 + v13, v19) ? (v21 = (unint64_t)result >= v13) : (v21 = 0),
        v21 ? (v22 = v20 >= (unint64_t)result) : (v22 = 0),
        !v22
     || v11
     && (v11 != 1 && (unint64_t)result > -v11
      || ((v23 = (char *)result + v11 - 1, (unint64_t)v23 >= v13)
        ? (v24 = v20 >= (unint64_t)v23)
        : (v24 = 0),
          !v24))))
  {
LABEL_35:
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** End of archive encountered prematurely at %ld"), *p_cursor);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSArchiverArchiveInconsistency"), v25, 0));
  }
  *p_cursor = v14 + v11;
  return result;
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  _BYTE *v7;
  char v8;

  v7 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
  checkExpected((uint64_t)v7, (char *)a3);
  v8 = *_decodeValueOfObjCType((uint64_t)self, (char *)a3, (NSUInteger *)a4);
  if (v8)
    typeDescriptorError(v8, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
}

- (int64_t)versionForClassName:(id)a3
{
  int64_t result;
  const __CFDictionary *classVersions;
  const void *v6[2];

  v6[1] = *(const void **)MEMORY[0x1E0C80C00];
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    classVersions = (const __CFDictionary *)self->classVersions;
    if (classVersions)
    {
      v6[0] = 0;
      if (CFDictionaryGetValueIfPresent(classVersions, a3, v6))
        return (int64_t)v6[0];
      else
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (void)_setAllowedClasses:(id)a3
{
  id reserved;

  reserved = self->reserved;
  if (reserved != a3)
  {

    self->reserved = (id)objc_msgSend(a3, "copy");
  }
}

- (void)dealloc
{
  CFTypeRef *datax;
  void *pointerTable;
  void *stringTable;
  unint64_t v6;
  id classVersions;
  uint64_t *allUnarchivedObjects;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  datax = (CFTypeRef *)self->datax;
  if (!*datax || (CFRelease(*datax), (datax = (CFTypeRef *)self->datax) != 0))
    free(datax);
  pointerTable = self->pointerTable;
  if (pointerTable)
    CFRelease(pointerTable);
  stringTable = self->stringTable;
  if (stringTable)
  {
    if (*(_QWORD *)stringTable)
    {
      v6 = 0;
      do
        free(*(void **)(*((_QWORD *)stringTable + 3) + 8 * v6++));
      while (v6 < *(_QWORD *)stringTable);
    }
    free(*((void **)stringTable + 3));
    free(stringTable);
  }
  classVersions = self->classVersions;
  if (classVersions)

  allUnarchivedObjects = (uint64_t *)self->allUnarchivedObjects;
  if (allUnarchivedObjects)
  {
    v9 = *allUnarchivedObjects;
    v10 = (id *)allUnarchivedObjects[2];
    if (*allUnarchivedObjects)
    {
      do
      {
        v11 = v9 - 1;

        v9 = v11;
      }
      while (v11);
    }
    free(v10);
    free(self->allUnarchivedObjects);
  }
  v12.receiver = self;
  v12.super_class = (Class)NSUnarchiver;
  -[NSUnarchiver dealloc](&v12, sel_dealloc);
}

+ (void)initialize
{
  if (NSUnarchiver == a1)
  {
    +[NSUnarchiver decodeClassName:asClassName:](NSUnarchiver, "decodeClassName:asClassName:", CFSTR("NSAbsoluteURL"), CFSTR("NSURL"));
    +[NSUnarchiver decodeClassName:asClassName:](NSUnarchiver, "decodeClassName:asClassName:", CFSTR("NSLocalTimeZone"), CFSTR("__NSLocalTimeZone"));
  }
}

+ (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName
{
  __CFDictionary *Mutable;

  Mutable = (__CFDictionary *)decodingMap;
  if (!decodingMap)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    decodingMap = (uint64_t)Mutable;
    if (!Mutable)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("*** memory allocation failed"), 0));
  }
  CFDictionarySetValue(Mutable, inArchiveName, trueName);
}

- (NSUnarchiver)initForReadingWithData:(NSData *)data
{
  NSUnarchiver *v3;
  _QWORD *v5;
  _QWORD *v6;
  CFIndex Length;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char v13;
  _BYTE *v14;
  char v16;
  uint64_t datax;
  _BOOL4 v18;
  uint64_t v19;
  CFMutableDictionaryRef Mutable;
  _QWORD *v21;
  _QWORD *v22;
  void *v23;
  CFMutableDictionaryRef v24;
  _OWORD *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;

  v3 = self;
  if (!data)
  {

    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    v28 = CFSTR("*** -initForReadingWithData: nil argument");
LABEL_31:
    objc_exception_throw((id)objc_msgSend(v26, "exceptionWithName:reason:userInfo:", v27, v28, 0));
  }
  v5 = malloc_type_malloc(0x18uLL, 0x1070040B3A6EEE0uLL);
  v3->datax = v5;
  if (!v5)
  {
LABEL_29:
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99850];
    v28 = CFSTR("*** memory allocation failed");
    goto LABEL_31;
  }
  v6 = v5;
  *v5 = CFRetain(data);
  v6[1] = CFDataGetBytePtr((CFDataRef)data);
  Length = CFDataGetLength((CFDataRef)data);
  v6[2] = Length;
  if (Length < 13)
    goto LABEL_18;
  v8 = v6[1];
  if (*(_BYTE *)(v8 + 1) != 11)
    goto LABEL_18;
  if (*(_QWORD *)(v8 + 2) != 0x7274736465707974 || *(_QWORD *)(v8 + 5) != 0x6D61657274736465)
  {
    v10 = *(_QWORD *)(v8 + 2);
    v11 = *(_QWORD *)(v8 + 5);
    if (v10 != 0x79746D6165727473 || v11 != 0x64657079746D6165)
      goto LABEL_18;
  }
  v13 = _decodeCharAtCursor(*((_QWORD *)v3->datax + 1), *((_QWORD *)v3->datax + 2), &v3->cursor);
  v3->streamerVersion = v13;
  if ((v13 - 5) < 0xFEu)
    goto LABEL_18;
  v14 = _decodeCStringAtCursor((uint64_t)v3->datax, &v3->cursor, v3->swap != 0);
  if (!strcmp(v14, "typedstream"))
  {
    v16 = 1;
  }
  else
  {
    if (strcmp(v14, "streamtyped"))
    {
      free(v14);
LABEL_18:

      return 0;
    }
    v16 = 0;
  }
  v3->swap = v16;
  free(v14);
  datax = (uint64_t)v3->datax;
  v18 = v3->swap != 0;
  v19 = _decodeCharAtCursor(*(_QWORD *)(datax + 8), *(_QWORD *)(datax + 16), &v3->cursor);
  v3->systemVersion = (int)_decodeIntStartingWithChar(datax, v19, &v3->cursor, v18);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, &_NSUnarchiverCreatePointerTable__NSUnarchiverPointerTableValueCallbacks);
  v3->pointerTable = Mutable;
  if (!Mutable)
    goto LABEL_28;
  v21 = malloc_type_malloc(0x20uLL, 0x108004019856BD9uLL);
  if (!v21)
    goto LABEL_29;
  v22 = v21;
  *(_OWORD *)v21 = xmmword_18218C0C0;
  v21[2] = 100;
  v23 = malloc_type_malloc(0x320uLL, 0x10040436913F5uLL);
  v22[3] = v23;
  if (!v23)
    goto LABEL_29;
  v3->stringTable = v22;
  v24 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
  v3->classVersions = v24;
  if (!v24
    || (v3->objectZone = 0,
        v3->lastLabel = -111,
        v3->reserved = 0,
        v25 = malloc_type_malloc(0x18uLL, 0x108004098BBCF0FuLL),
        (v3->allUnarchivedObjects = v25) == 0)
    || (*v25 = xmmword_18218C0D0, (*((_QWORD *)v3->allUnarchivedObjects + 2) = NSAllocateObjectArray(0x200uLL)) == 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  return v3;
}

- (id)decodeDataObject
{
  void *v3;
  void *v4;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  -[NSCoder decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "i", &v6, 4);
  if (v6 < 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSArchiverArchiveInconsistency"), CFSTR("attempt to decode NSData bytes with a negative byte count"), 0));
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "allocWithZone:", self->objectZone);
  v4 = (void *)objc_msgSend(v3, "initWithLength:", v6);
  -[NSUnarchiver decodeArrayOfObjCType:count:at:](self, "decodeArrayOfObjCType:count:at:", "c", v6, objc_msgSend(v4, "mutableBytes"));
  return v4;
}

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  size_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  _BYTE *v13;
  const char *v14;
  size_t v15;
  size_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  NSUInteger v20;
  NSString *v21;
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x1E0C80C00];
  v9 = strlen(a3);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)sizep - ((v10 + 30) & 0xFFFFFFFFFFFFFFF0);
  snprintf(v11, v12, "[%lu%s]", a4, a3);
  v13 = _decodeReusedCStringUsingTable((uint64_t)self->datax, (unint64_t *)self->stringTable, &self->cursor, self->swap != 0);
  checkExpected((uint64_t)v13, v11);
  if (*a3 == 99 && (v14 = a3 + 1, !a3[1]))
  {
    _deserializeBytes(a5, *((_QWORD *)self->datax + 1), *((_QWORD *)self->datax + 2), &self->cursor, a4);
  }
  else
  {
    sizep[0] = 0;
    v15 = strlen(a3);
    v16 = v15 + 3;
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)sizep - ((v17 + 18) & 0xFFFFFFFFFFFFFFF0);
    v19 = (char *)a3;
    if (*a3)
    {
      v19 = (char *)a3;
      if (*a3 != 123)
      {
        v19 = (char *)a3;
        if (a3[1])
        {
          strlcpy((char *)sizep - ((v17 + 18) & 0xFFFFFFFFFFFFFFF0), "{", v16);
          strlcat(v18, a3, v16);
          strlcat(v18, "}", v16);
          v19 = v18;
        }
      }
    }
    v14 = NSGetSizeAndAlignment(v19, sizep, 0);
    if (a4)
    {
      v20 = 0;
      do
      {
        if (v20 > 0x7FFFFFFFFFFFFFFFLL / sizep[0])
        {
          v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** value %lu too large (may have wrapped)"), v20);
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v21, 0));
        }
        _decodeValueOfObjCType((uint64_t)self, v19, (NSUInteger *)((char *)a5 + sizep[0] * v20++));
      }
      while (a4 != v20);
    }
  }
  if (*v14)
    typeDescriptorError(*v14, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
}

- (void)replaceObject:(id)object withObject:(id)newObject
{
  uint64_t v7;
  uint64_t v8;
  unint64_t Count;
  unint64_t v10;
  const void **v11;
  const void **v12;
  uint64_t i;
  _BYTE *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[130];

  v50[129] = *MEMORY[0x1E0C80C00];
  if (object == newObject)
    return;
  MEMORY[0x1E0C80A78](self);
  MEMORY[0x1E0C80A78](v7);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v8 + 48));
  if (!Count)
    return;
  v10 = Count;
  if (Count >> 60)
  {
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** value %lu too large (may have wrapped)"), Count);
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99750];
    goto LABEL_20;
  }
  if (Count >= 0x81)
  {
    v11 = (const void **)malloc_type_malloc(8 * Count, 0x100004000313F17uLL);
    v12 = (const void **)malloc_type_malloc(8 * v10, 0x2004093837F09uLL);
  }
  else
  {
    v11 = (const void **)v50;
    v12 = (const void **)&v18;
  }
  if (!v11 || !v12)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99850];
    v15 = (NSString *)CFSTR("*** memory allocation failed");
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v15, 0, (_QWORD)v18, *((_QWORD *)&v18 + 1), (_QWORD)v19, *((_QWORD *)&v19 + 1), (_QWORD)v20, *((_QWORD *)&v20 + 1), (_QWORD)v21, *((_QWORD *)&v21 + 1), (_QWORD)v22, *((_QWORD *)&v22 + 1), (_QWORD)v23, *((_QWORD *)&v23 + 1), (_QWORD)v24, *((_QWORD *)&v24 + 1),
                               (_QWORD)v25,
                               *((_QWORD *)&v25 + 1),
                               (_QWORD)v26,
                               *((_QWORD *)&v26 + 1),
                               (_QWORD)v27,
                               *((_QWORD *)&v27 + 1),
                               (_QWORD)v28,
                               *((_QWORD *)&v28 + 1),
                               (_QWORD)v29,
                               *((_QWORD *)&v29 + 1),
                               (_QWORD)v30,
                               *((_QWORD *)&v30 + 1),
                               (_QWORD)v31,
                               *((_QWORD *)&v31 + 1),
                               (_QWORD)v32,
                               *((_QWORD *)&v32 + 1),
                               (_QWORD)v33,
                               *((_QWORD *)&v33 + 1),
                               (_QWORD)v34,
                               *((_QWORD *)&v34 + 1),
                               (_QWORD)v35,
                               *((_QWORD *)&v35 + 1),
                               (_QWORD)v36,
                               *((_QWORD *)&v36 + 1),
                               (_QWORD)v37,
                               *((_QWORD *)&v37 + 1),
                               (_QWORD)v38,
                               *((_QWORD *)&v38 + 1),
                               (_QWORD)v39,
                               *((_QWORD *)&v39 + 1),
                               (_QWORD)v40,
                               *((_QWORD *)&v40 + 1),
                               (_QWORD)v41,
                               *((_QWORD *)&v41 + 1),
                               (_QWORD)v42,
                               *((_QWORD *)&v42 + 1),
                               (_QWORD)v43,
                               *((_QWORD *)&v43 + 1),
                               (_QWORD)v44,
                               *((_QWORD *)&v44 + 1),
                               (_QWORD)v45,
                               *((_QWORD *)&v45 + 1),
                               (_QWORD)v46,
                               *((_QWORD *)&v46 + 1)));
  }
  CFDictionaryGetKeysAndValues((CFDictionaryRef)self->pointerTable, v11, v12);
  for (i = 0; i != v10; ++i)
  {
    v14 = v12[i];
    if (*(id *)v14 == object)
    {
      *(_QWORD *)v14 = newObject;
      v14[8] = 2;
    }
  }
  if (v11 != v50)
    free(v11);
  if (v12 != (const void **)&v18)
    free(v12);
}

- (void)setObjectZone:(NSZone *)zone
{
  self->objectZone = zone;
}

- (NSZone)objectZone
{
  return self->objectZone;
}

- (BOOL)isAtEnd
{
  CFIndex cursor;

  cursor = self->cursor;
  return cursor >= CFDataGetLength(*(CFDataRef *)self->datax);
}

- (unsigned)systemVersion
{
  return self->systemVersion;
}

- (id)data
{
  return *(id *)self->datax;
}

+ (id)unarchiveObjectWithData:(NSData *)data
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_msgSend(objc_allocWithZone((Class)a1), "initForReadingWithData:", data);
  v4 = (void *)objc_msgSend(v3, "decodeObject");
  if ((objc_msgSend(v3, "isAtEnd") & 1) == 0 && v4)
    NSLog((NSString *)CFSTR("*** +[NSUnarchiver unarchiveObjectWithData:]: extra data discarded"));
  v5 = v4;

  return v4;
}

+ (id)unarchiveObjectWithFile:(NSString *)path
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", path);
  if (result)
    return (id)objc_msgSend(a1, "unarchiveObjectWithData:", result);
  return result;
}

- (void)decodeClassName:(NSString *)inArchiveName asClassName:(NSString *)trueName
{
  void *map;

  map = self->map;
  if (!map)
  {
    map = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    self->map = map;
    if (!map)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("*** memory allocation failed"), 0));
  }
  CFDictionarySetValue((CFMutableDictionaryRef)map, inArchiveName, trueName);
}

+ (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName
{
  NSString *result;

  if (!inArchiveName)
    return 0;
  if (!decodingMap)
    return (NSString *)-[NSString copyWithZone:](inArchiveName, "copyWithZone:", 0);
  result = (NSString *)CFDictionaryGetValue((CFDictionaryRef)decodingMap, inArchiveName);
  if (!result)
    return (NSString *)-[NSString copyWithZone:](inArchiveName, "copyWithZone:", 0);
  return result;
}

- (NSString)classNameDecodedForArchiveClassName:(NSString *)inArchiveName
{
  const __CFDictionary *map;
  NSString *result;

  if (!inArchiveName)
    return 0;
  map = (const __CFDictionary *)self->map;
  if (!map)
    return (NSString *)-[NSString copyWithZone:](inArchiveName, "copyWithZone:", 0);
  result = (NSString *)CFDictionaryGetValue(map, inArchiveName);
  if (!result)
    return (NSString *)-[NSString copyWithZone:](inArchiveName, "copyWithZone:", 0);
  return result;
}

@end
