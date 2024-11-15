@implementation NSArchiver

+ (void)initialize
{
  if (NSArchiver == a1)
  {
    +[NSArchiver encodeClassName:intoClassName:](NSArchiver, "encodeClassName:intoClassName:", CFSTR("__NSLocalTimeZone"), CFSTR("NSLocalTimeZone"));
    +[NSArchiver encodeClassName:intoClassName:](NSArchiver, "encodeClassName:intoClassName:", CFSTR("__NSLocalTimeZoneI"), CFSTR("NSLocalTimeZone"));
  }
}

- (NSArchiver)initForWritingWithMutableData:(NSMutableData *)mdata
{
  const __CFAllocator *v4;
  void *v5;
  void *v6;
  CFDictionaryKeyCallBacks v8;
  __int16 v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = *(CFDictionaryKeyCallBacks *)byte_1E0F4C8F0;
  if (!mdata)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("*** -initForWritingWithMutableData: nil argument"), 0, *(_OWORD *)&v8.version, *(_OWORD *)&v8.release, *(_OWORD *)&v8.equal));
  }
  self->mdata = mdata;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
  self->stringTable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &v8, 0);
  self->pointerTable = CFDictionaryCreateMutable(v4, 0, 0, 0);
  v5 = self->mdata;
  LOBYTE(v9) = 4;
  objc_msgSend(v5, "appendBytes:length:", &v9, 1, *(_OWORD *)&v8.version, *(_OWORD *)&v8.release, *(_OWORD *)&v8.equal);
  _encodeCString(self->mdata, "streamtyped");
  v6 = self->mdata;
  v9 = 1000;
  v10 = -127;
  objc_msgSend(v6, "appendBytes:length:", &v10, 1);
  objc_msgSend(v6, "appendBytes:length:", &v9, 2);
  return self;
}

- (NSMutableData)archiverData
{
  return (NSMutableData *)self->mdata;
}

- (id)data
{
  return self->mdata;
}

- (void)dealloc
{
  void *replacementTable;
  void *pointerTable;
  void *stringTable;
  void *ids;
  void *map;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];

  replacementTable = self->replacementTable;
  if (replacementTable)
    CFRelease(replacementTable);
  pointerTable = self->pointerTable;
  if (pointerTable)
    CFRelease(pointerTable);
  stringTable = self->stringTable;
  if (stringTable)
    CFRelease(stringTable);
  ids = self->ids;
  if (ids)
    CFRelease(ids);
  map = self->map;
  if (map)
    CFRelease(map);
  v8.receiver = self;
  v8.super_class = (Class)NSArchiver;
  -[NSArchiver dealloc](&v8, sel_dealloc);
}

- (void)replaceObject:(id)object withObject:(id)newObject
{
  void *replacementTable;

  replacementTable = self->replacementTable;
  if (!replacementTable)
  {
    replacementTable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, 0);
    self->replacementTable = replacementTable;
  }
  CFDictionarySetValue((CFMutableDictionaryRef)replacementTable, object, (const void *)objc_msgSend(newObject, "replacementObjectForArchiver:", self));
}

+ (void)encodeClassName:(id)a3 intoClassName:(id)a4
{
  __CFDictionary *Mutable;

  Mutable = (__CFDictionary *)encodingMap;
  if (!encodingMap)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    encodingMap = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, a3, a4);
}

+ (id)classNameEncodedForTrueClassName:(id)a3
{
  id result;

  if (!a3)
    return 0;
  if (!encodingMap)
    return (id)objc_msgSend(a3, "copyWithZone:", 0);
  result = (id)CFDictionaryGetValue((CFDictionaryRef)encodingMap, a3);
  if (!result)
    return (id)objc_msgSend(a3, "copyWithZone:", 0);
  return result;
}

- (int64_t)versionForClassName:(id)a3
{
  objc_class *v3;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = NSClassFromString((NSString *)a3);
  if (v3)
    return class_getVersion(v3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  void *mdata;
  char v8;

  mdata = self->mdata;
  if (mdata)
    _encodeOrReuseCString(mdata, (char *)a3, (CFDictionaryRef)self->stringTable);
  v8 = *_encodeValueOfObjCType((uint64_t)self, (char *)a3, (SEL *)a4);
  if (v8)
    typeDescriptorError(v8, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
}

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  char *v3;
  void *mdata;
  SEL **v6;
  SEL **i;
  uint64_t v8;

  v3 = (char *)a3;
  mdata = self->mdata;
  if (mdata)
    _encodeOrReuseCString(mdata, (char *)a3, (CFDictionaryRef)self->stringTable);
  for (i = (SEL **)&v8; *v3; v3 = _encodeValueOfObjCType((uint64_t)self, v3, *v6))
    v6 = i++;
}

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  size_t v9;
  size_t v10;
  char *v11;
  int v12;
  const char *v13;
  size_t v14;
  size_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x1E0C80C00];
  v9 = strlen(a3);
  if (self->mdata)
  {
    v10 = v9 + 15;
    if (v9 + 15 < 0x201)
    {
      if (v9 == -15)
      {
        v11 = 0;
      }
      else
      {
        v11 = (char *)sizep - ((v9 + 30) & 0xFFFFFFFFFFFFFFF0);
        bzero(v11, v10);
      }
    }
    else
    {
      v11 = (char *)malloc_type_malloc(v9 + 15, 0x100004077774924uLL);
    }
    snprintf(v11, v10, "[%lu%s]", a4, a3);
    _encodeOrReuseCString(self->mdata, v11, (CFDictionaryRef)self->stringTable);
    if (v10 >= 0x201)
      free(v11);
  }
  v12 = *(unsigned __int8 *)a3;
  if (v12 == 99 && (v13 = a3 + 1, !a3[1]))
  {
    objc_msgSend(self->mdata, "appendBytes:length:", a5, a4);
  }
  else
  {
    sizep[0] = 0;
    v14 = strlen(a3);
    v15 = v14 + 3;
    if (v14 + 3 < 0x201)
    {
      if (v14 == -3)
      {
        v16 = 0;
      }
      else
      {
        v16 = (char *)sizep - ((v14 + 18) & 0xFFFFFFFFFFFFFFF0);
        bzero(v16, v15);
      }
    }
    else
    {
      v16 = (char *)malloc_type_malloc(v14 + 3, 0x100004077774924uLL);
      v12 = *(unsigned __int8 *)a3;
    }
    v17 = (char *)a3;
    if (v12)
    {
      v17 = (char *)a3;
      if (v12 != 123)
      {
        v17 = (char *)a3;
        if (a3[1])
        {
          strlcpy(v16, "{", v15);
          strlcat(v16, a3, v15);
          strlcat(v16, "}", v15);
          v17 = v16;
        }
      }
    }
    v13 = NSGetSizeAndAlignment(v17, sizep, 0);
    if (a4)
    {
      v18 = 0;
      do
        _encodeValueOfObjCType((uint64_t)self, v17, (SEL *)((char *)a5 + sizep[0] * v18++));
      while (a4 != v18);
    }
    if (v15 >= 0x201)
      free(v16);
  }
  if (*v13)
    typeDescriptorError(*v13, (uint64_t)a3, (uint64_t)"excess characters in type descriptor");
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  void *mdata;

  mdata = self->mdata;
  if (mdata)
  {
    _encodeOrReuseCString(mdata, "+", (CFDictionaryRef)self->stringTable);
    _encodeInt(self->mdata, a4);
    objc_msgSend(self->mdata, "appendBytes:length:", a3, a4);
  }
}

- (void)encodeObject:(id)a3
{
  void *mdata;

  mdata = self->mdata;
  if (mdata)
    _encodeOrReuseCString(mdata, "@", (CFDictionaryRef)self->stringTable);
  _encodeObject_old((uint64_t)self, a3);
}

- (void)encodeDataObject:(id)a3
{
  unint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "length");
  if (v6 >> 31)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: data length (%qd) makes data too large to fit in non-keyed archive"), _NSMethodExceptionProem((objc_class *)self, a2), v6), 0);
    objc_exception_throw(v7);
  }
  v8 = v6;
  -[NSArchiver encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "i", &v8);
  -[NSArchiver encodeArrayOfObjCType:count:at:](self, "encodeArrayOfObjCType:count:at:", "c", v8, objc_msgSend(a3, "bytes"));
}

- (void)encodeRootObject:(id)rootObject
{
  void *mdata;
  id v6;
  NSString *v7;

  mdata = self->mdata;
  if (!mdata)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -encodeRootObject: already done for %p"), rootObject);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
  }
  if (!self->ids)
  {
    self->ids = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0);
    mdata = self->mdata;
  }
  v6 = mdata;
  self->mdata = 0;
  -[NSArchiver encodeObject:](self, "encodeObject:", rootObject);
  self->mdata = v6;
  -[NSArchiver encodeObject:](self, "encodeObject:", rootObject);
}

- (void)encodeConditionalObject:(id)object
{
  const void *v5;
  id v6;
  NSString *v7;

  if (self->mdata)
  {
    if (!self->ids)
    {
      v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** encodeConditionalObject: -encodeRootObject: has not been previously done for %p"), object);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
    }
    v5 = _replacementObjectForObject((uint64_t)self, object);
    if (v5)
    {
      if (CFSetGetValue((CFSetRef)self->ids, v5))
        v6 = object;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    -[NSArchiver encodeObject:](self, "encodeObject:", v6);
  }
}

+ (NSData)archivedDataWithRootObject:(id)rootObject
{
  NSData *v5;
  int v6;

  v5 = (NSData *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v6 = _CFExecutableLinkedOnOrAfter();
  if (v6)
    _CFAutoreleasePoolPush();
  objc_msgSend((id)objc_msgSend(objc_allocWithZone((Class)a1), "initForWritingWithMutableData:", v5), "encodeRootObject:", rootObject);
  if (v6)
    _CFAutoreleasePoolPop();
  return v5;
}

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path
{
  return objc_msgSend((id)objc_msgSend(a1, "archivedDataWithRootObject:", rootObject), "writeToFile:atomically:", path, 1);
}

- (void)encodeClassName:(NSString *)trueName intoClassName:(NSString *)inArchiveName
{
  void *map;

  map = self->map;
  if (!map)
  {
    map = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    self->map = map;
  }
  CFDictionarySetValue((CFMutableDictionaryRef)map, trueName, inArchiveName);
}

- (NSString)classNameEncodedForTrueClassName:(NSString *)trueName
{
  const __CFDictionary *map;
  NSString *result;

  if (!trueName)
    return 0;
  map = (const __CFDictionary *)self->map;
  if (!map)
    return (NSString *)-[NSString copyWithZone:](trueName, "copyWithZone:", 0);
  result = (NSString *)CFDictionaryGetValue(map, trueName);
  if (!result)
    return (NSString *)-[NSString copyWithZone:](trueName, "copyWithZone:", 0);
  return result;
}

@end
