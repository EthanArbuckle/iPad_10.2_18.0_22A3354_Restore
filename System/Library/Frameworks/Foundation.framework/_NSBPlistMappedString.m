@implementation _NSBPlistMappedString

- (unint64_t)length
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t payload;

  if (self)
  {
    if (((unint64_t)self & 0x8000000000000000) == 0 || (enableTaggedPointerBPlistMappedStrings & 1) != 0)
    {
      payload = self->payload;
    }
    else
    {
      v2 = *MEMORY[0x1E0DE7C58];
      if ((~(unint64_t)self & 0xC000000000000007) == 0)
        v2 = 0;
      v3 = v2 ^ (unint64_t)self;
      v4 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v3 & 7) == 0)
        v4 = 0xFFFFFFFFFFFFFLL;
      payload = v4 & (v3 >> 3);
    }
  }
  else
  {
    payload = 0;
  }
  return (payload >> 1) & 0x1FFF;
}

- (unint64_t)fastestEncoding
{
  if (-[_NSBPlistMappedString isUTF16BE]((uint64_t)self))
    return 2415919360;
  else
    return 1;
}

- (uint64_t)isUTF16BE
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    if ((result & 0x8000000000000000) == 0 || (enableTaggedPointerBPlistMappedStrings & 1) != 0)
    {
      v4 = *(_QWORD *)(result + 8);
    }
    else
    {
      v1 = *MEMORY[0x1E0DE7C58];
      if ((~result & 0xC000000000000007) == 0)
        v1 = 0;
      v2 = v1 ^ result;
      v3 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v2 & 7) == 0)
        v3 = 0xFFFFFFFFFFFFFLL;
      v4 = v3 & (v2 >> 3);
    }
    return v4 & 1;
  }
  return result;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unsigned __int16 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  -[_NSBPlistMappedString getCharacters:range:](self, "getCharacters:range:", &v4, a3, 1);
  return v4;
}

+ (id)createStringWithOffset:(int64_t)a3 intoMappingData:(id)a4
{
  id result;
  uint64_t v7;
  int v8;
  char v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((__objc2_class *)objc_opt_class() != _NSBPlistMappedData)
    return 0;
  v7 = objc_msgSend(a4, "mappingIndex");
  result = 0;
  if (a3 <= 0xFFFFFFF && v7 != -1 && v7 <= 1023)
  {
    v8 = *(_BYTE *)(objc_msgSend(a4, "bytes") + a3) & 0xF0;
    objc_msgSend(a4, "bytes");
    objc_msgSend(a4, "_bplistObjectsRangeEnd");
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v13 = MEMORY[0x1E0C809B0];
    if (v8 == 96)
    {
      v14 = ___getStringLength_block_invoke_2;
      v15 = &unk_1E0F4E4F8;
      v9 = __CFBinaryPlistParseUnicode16String();
    }
    else
    {
      v14 = ___getStringLength_block_invoke;
      v15 = &unk_1E0F4E4D0;
      v9 = __CFBinaryPlistParseASCIIString();
    }
    if ((v9 & 1) == 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Plist data is corrupt!"), 0, v13, 3221225472, v14, v15, &v16, v16));
    v10 = v17[3];
    _Block_object_dispose(&v16, 8);
    if (v10 >> 13)
      return 0;
    v11 = (v7 << 14) | (a3 << 24) | (v8 == 96) | (2 * v10);
    if ((enableTaggedPointerBPlistMappedStrings & 1) != 0)
    {
      result = objc_alloc_init(_NSBPlistMappedString);
      if (result)
        *((_QWORD *)result + 1) = v11;
    }
    else
    {
      result = (id)((8 * (v11 & 0xFFFFFFFFFFFFFLL)) | 0x8700000000000007);
      v12 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
      if ((~v12 & 0xC000000000000007) != 0)
        return (id)(v12 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v12 & 7)));
    }
  }
  return result;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  const UInt8 *v20;
  unsigned __int8 v21;
  uint64_t v22;
  NSRange v23;

  length = a4.length;
  location = a4.location;
  v22 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v19 = 0;
  v20 = 0;
  v18 = 0;
  -[_NSBPlistMappedString getBPlistPtr:bplistSize:stringPtr:isUTF16BE:]((CFIndex)self, &v20, &v19, &v18, &v21);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7 = v21;
  if (v21)
    v8 = __CFBinaryPlistParseUnicode16String();
  else
    v8 = __CFBinaryPlistParseASCIIString();
  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Plist data is corrupt!"), 0);
    goto LABEL_8;
  }
  if (*((_BYTE *)v11 + 24))
  {
    v23.location = location;
    v23.length = length;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Out of range. Requested range: %@, reported length: %ld, encoded length: %ld, isUTF16BE: %d"), NSStringFromRange(v23), v15[3], -[_NSBPlistMappedString length](self, "length"), v7), 0);
LABEL_8:
    objc_exception_throw(v9);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

- (const)_fastCStringContents:(BOOL)a3
{
  const char *v3;
  uint64_t v5;
  uint64_t v6;
  CFIndex v7;
  const UInt8 *v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = 0;
  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (!a3)
  {
    v9 = 0;
    v7 = 0;
    v8 = 0;
    v6 = 0;
    -[_NSBPlistMappedString getBPlistPtr:bplistSize:stringPtr:isUTF16BE:]((CFIndex)self, &v8, &v7, &v6, &v9);
    if (!v9)
    {
      v5 = MEMORY[0x1E0C809B0];
      if ((__CFBinaryPlistParseASCIIString() & 1) == 0)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Plist data is corrupt!"), 0, v5, 3221225472, __46___NSBPlistMappedString__fastCStringContents___block_invoke, &unk_1E0F4E4D0, &v10));
    }
    v3 = (const char *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (CFIndex)getBPlistPtr:(CFIndex *)a3 bplistSize:(_QWORD *)a4 stringPtr:(_BYTE *)a5 isUTF16BE:
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const __CFData *MappedStringsFile;
  const __CFData *v13;

  if (result)
  {
    if ((result & 0x8000000000000000) == 0 || (enableTaggedPointerBPlistMappedStrings & 1) != 0)
    {
      v11 = *(_QWORD *)(result + 8);
    }
    else
    {
      v8 = *MEMORY[0x1E0DE7C58];
      if ((~result & 0xC000000000000007) == 0)
        v8 = 0;
      v9 = v8 ^ result;
      v10 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v9 & 7) == 0)
        v10 = 0xFFFFFFFFFFFFFLL;
      v11 = v10 & (v9 >> 3);
    }
    *a5 = v11 & 1;
    MappedStringsFile = (const __CFData *)_CFBundleGetMappedStringsFile();
    if (!MappedStringsFile)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid tagged pointer reference"), 0));
    v13 = MappedStringsFile;
    *a2 = CFDataGetBytePtr(MappedStringsFile);
    result = CFDataGetLength(v13);
    *a3 = result;
    *a4 = &(*a2)[(v11 >> 24) & 0xFFFFFFF];
  }
  return result;
}

+ (void)initialize
{
  if (_NSBPlistMappedString == a1)
  {
    if (*MEMORY[0x1E0DE7C50] && dyld_program_sdk_at_least())
      _objc_registerTaggedPointerClass();
    else
      enableTaggedPointerBPlistMappedStrings = 1;
  }
}

- (unint64_t)smallestEncoding
{
  if (-[_NSBPlistMappedString isUTF16BE]((uint64_t)self))
    return 2415919360;
  else
    return 1;
}

@end
