@implementation NSPageData

+ (void)initialize
{
  unsigned int v2;

  if (NSPageData == a1)
  {
    v2 = umask(0);
    _NSPageDataUmask = v2;
    umask(v2);
  }
}

+ (int64_t)_umask
{
  return _NSPageDataUmask;
}

- (unint64_t)length
{
  return -[NSData length](self->data, "length");
}

- (const)bytes
{
  return -[NSData bytes](self->data, "bytes");
}

- (NSPageData)init
{
  self->data = (NSData *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "init");
  return self;
}

- (NSPageData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4
{
  self->data = (NSData *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", a3, a4);
  return self;
}

- (NSPageData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  self->data = (NSData *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a4);
  return self;
}

- (NSPageData)initWithData:(id)a3
{
  self->data = (NSData *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithData:", a3);
  return self;
}

- (void)_setOriginalFileInfoFromFileAttributes:(id)a3
{
  void *v4;

  if (self->data)
  {
    v4 = (void *)objc_msgSend(a3, "fileModificationDate");

    self->_originalFileModDate = (NSDate *)objc_msgSend(v4, "copy");
  }
}

- (NSPageData)initWithContentsOfFile:(id)a3
{
  NSData *v5;

  v5 = (NSData *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", a3);
  self->data = v5;
  if (v5)
  {
    -[NSPageData _setOriginalFileInfoFromFileAttributes:](self, "_setOriginalFileInfoFromFileAttributes:", -[NSFileManager fileAttributesAtPath:traverseLink:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileAttributesAtPath:traverseLink:", a3, 1));
    self->_originalFilePath = (NSString *)objc_msgSend(a3, "copy");
  }
  return self;
}

- (NSPageData)initWithContentsOfMappedFile:(id)a3
{
  return -[NSPageData initWithContentsOfMappedFile:withFileAttributes:](self, "initWithContentsOfMappedFile:withFileAttributes:", a3, 0);
}

- (NSPageData)initWithContentsOfMappedFile:(id)a3 withFileAttributes:(id)a4
{
  NSDictionary *v4;
  NSData *v7;

  v4 = (NSDictionary *)a4;
  if (!a4)
  {
    v4 = -[NSFileManager fileAttributesAtPath:traverseLink:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileAttributesAtPath:traverseLink:", a3, 1);
    if (!v4)
    {
      if (self->data)
        goto LABEL_4;
LABEL_6:
      -[NSPageData dealloc](self, "dealloc");
      return 0;
    }
  }
  v7 = (NSData *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfMappedFile:", a3);
  self->data = v7;
  if (!v7)
    goto LABEL_6;
LABEL_4:
  -[NSPageData _setOriginalFileInfoFromFileAttributes:](self, "_setOriginalFileInfoFromFileAttributes:", v4);
  self->_originalFilePath = (NSString *)objc_msgSend(a3, "copy");
  return self;
}

- (id)_mappedFile
{
  return self->_originalFilePath;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSPageData;
  -[NSPageData dealloc](&v3, sel_dealloc);
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7
{
  _BOOL4 v8;
  uint64_t v11;
  uint64_t v12;
  NSFileManager *v13;
  NSDictionary *v14;
  BOOL v15;
  unint64_t result;
  id v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSDictionary *v22;
  NSString *v23;

  v8 = a6;
  if (a4)
  {
    if ((*((_WORD *)a4 + 9) & 4) != 0)
    {
      v19 = (void *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithData:encoding:", self, 4);
      v20 = -[NSFileManager createSymbolicLinkAtPath:pathContent:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createSymbolicLinkAtPath:pathContent:", a3, v19);

      if (v20)
        return 0;
      else
        return 2;
    }
    v11 = *((unsigned __int16 *)a4 + 8);
    v12 = *((_QWORD *)a4 + 1);
  }
  else
  {
    v12 = 0;
    v11 = 438;
  }
  if (!self->_originalFileModDate
    || !objc_msgSend(a7, "length")
    || (v13 = +[NSFileManager defaultManager](NSFileManager, "defaultManager"),
        (v14 = -[NSFileManager fileAttributesAtPath:traverseLink:](v13, "fileAttributesAtPath:traverseLink:", a7, 1)) == 0)
    || !-[NSDate isEqual:](self->_originalFileModDate, "isEqual:", -[NSDictionary fileModificationDate](v14, "fileModificationDate"))|| (v15 = -[NSFileManager linkItemAtPath:toPath:error:](v13, "linkItemAtPath:toPath:error:", a7, a3, 0), result = 0, !v15))
  {
    if (-[NSData writeToFile:atomically:](self, "writeToFile:atomically:", a3, 0, a5))
    {
      _NXChmodFile((uint64_t)a3, v11 & ~_NSPageDataUmask);
      if (v8)
      {

        self->data = (NSData *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D50], "allocWithZone:", -[NSPageData zone](self, "zone")), "initWithContentsOfMappedFile:", a3);
      }
      if (v12)
      {
        v17 = objc_allocWithZone(MEMORY[0x1E0C99D80]);
        v18 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v12), CFSTR("NSFileModificationDate"), 0);
      }
      else
      {
        v21 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), "init");
        v18 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v21, CFSTR("NSFileModificationDate"), 0);

      }
      -[NSFileManager changeFileAttributes:atPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "changeFileAttributes:atPath:", v18, a3);

      v22 = -[NSFileManager fileAttributesAtPath:traverseLink:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileAttributesAtPath:traverseLink:", a3, 1);
      result = 0;
      if (v22)
      {
        if (v8)
        {
          -[NSPageData _setOriginalFileInfoFromFileAttributes:](self, "_setOriginalFileInfoFromFileAttributes:");

          v23 = (NSString *)objc_msgSend(a3, "copy");
          result = 0;
          self->_originalFilePath = v23;
        }
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

- (id)initFromSerializerStream:(id)a3 length:(unint64_t)a4
{
  void *v7;

  v7 = NSAllocateMemoryPages(a4);
  objc_msgSend(a3, "copySerializationInto:", v7);
  -[NSPageData initWithBytes:length:](self, "initWithBytes:length:", v7, a4);
  NSDeallocateMemoryPages(v7, a4);
  return self;
}

- (id)deserializer
{
  return -[NSAKDeserializerStream initFromMemoryNoCopy:length:freeWhenDone:](+[NSAKDeserializerStream allocWithZone:](NSAKDeserializerStream, "allocWithZone:", -[NSPageData zone](self, "zone")), "initFromMemoryNoCopy:length:freeWhenDone:", -[NSPageData bytes](self, "bytes"), -[NSPageData length](self, "length"), 0);
}

- (NSPageData)initWithDataNoCopy:(id)a3
{
  self->data = (NSData *)a3;
  return self;
}

- (id)data
{
  return self->data;
}

- (unint64_t)writeFd:(int64_t)a3
{
  ssize_t v4;

  v4 = write(a3, -[NSPageData bytes](self, "bytes"), -[NSPageData length](self, "length"));
  return 2 * (v4 != -[NSPageData length](self, "length"));
}

- (unint64_t)writeFile:(id)a3
{
  if (!-[NSData writeToFile:atomically:](self, "writeToFile:atomically:", a3, 0))
    return 2;
  _NXChmodFile((uint64_t)a3, ~(_WORD)_NSPageDataUmask & 0x1B6);
  return 0;
}

@end
