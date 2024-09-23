@implementation _NSBPlistMappedData

- (BOOL)_getBPlistMarker:(char *)a3 offset:(unint64_t *)a4 trailer:(id *)a5
{
  __int128 v5;

  if (a3)
    *a3 = self->bplistMarker;
  if (a4)
    *a4 = self->bplistOffset;
  if (a5)
  {
    v5 = *(_OWORD *)&self->bplistTrailer._topObject;
    *(_OWORD *)a5->var0 = *(_OWORD *)self->bplistTrailer._unused;
    *(_OWORD *)&a5->var5 = v5;
  }
  return 1;
}

- (const)bytes
{
  return self->ptr;
}

- (unint64_t)length
{
  return self->size;
}

- (int64_t)mappingIndex
{
  return self->mappingIndex;
}

- (unint64_t)_bplistObjectsRangeEnd
{
  return self->bplistTrailer._offsetTableOffset - 1;
}

- (_NSBPlistMappedData)initWithFileURL:(id)a3 error:(id *)a4
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = 0;
  v8 = 0;
  LOBYTE(v7) = 0;
  if ((objc_msgSend(MEMORY[0x1E0C99D50], "_readBytesFromPath:maxLength:bytes:length:didMap:options:reportProgress:error:", objc_msgSend(a3, "path"), 0x7FFFFFFFFFFFFFFFLL, &v10, &v9, &v8, 8, v7, a4) & 1) == 0)
  {
LABEL_7:

    return 0;
  }
  v12 = 0u;
  v13 = 0u;
  if ((__CFBinaryPlistGetTopLevelInfo() & 1) == 0)
  {
    if (a4)
    {
      v14 = CFSTR("NSDebugDescription");
      v15[0] = CFSTR("File is not binary plist");
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 256, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
    }
    goto LABEL_7;
  }
  if (!v8)
    __assert_rtn("-[_NSBPlistMappedData initWithFileURL:error:]", "NSBPlistMappedClasses.m", 94, "mapped");
  v11[0] = v12;
  v11[1] = v13;
  return -[_NSBPlistMappedData initWithBinaryPlistData:size:trailer:offset:marker:](self, "initWithBinaryPlistData:size:trailer:offset:marker:", v10, v9, v11, 0, 0);
}

- (void)setMappingIndex:(int64_t)a3
{
  self->mappingIndex = a3;
}

- (_NSBPlistMappedData)initWithBinaryPlistData:(void *)a3 size:(unint64_t)a4 trailer:(id *)a5 offset:(unint64_t)a6 marker:(unsigned __int8)a7
{
  _NSBPlistMappedData *result;
  __int128 v13;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_NSBPlistMappedData;
  result = -[_NSBPlistMappedData init](&v14, sel_init);
  if (result)
  {
    result->ptr = a3;
    result->size = a4;
    result->mappingIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13 = *(_OWORD *)&a5->var5;
    *(_OWORD *)result->bplistTrailer._unused = *(_OWORD *)a5->var0;
    *(_OWORD *)&result->bplistTrailer._topObject = v13;
    result->bplistOffset = a6;
    result->bplistMarker = a7;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)_NSBPlistMappedData;
  -[_NSBPlistMappedData dealloc](&v2, sel_dealloc);
}

@end
