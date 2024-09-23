@implementation NSRTFD

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (NSRTFD)init
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
  return self;
}

- (NSRTFD)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithObjects:forKeys:count:", a3, a4, a5);
  return self;
}

- (NSRTFD)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", a3, a4);
  return self;
}

- (NSRTFD)initWithDictionary:(id)a3
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithDictionary:", a3);
  return self;
}

- (NSRTFD)initWithContentsOfFile:(id)a3
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", a3);
  return self;
}

- (NSRTFD)initWithCapacity:(unint64_t)a3
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSRTFD;
  -[NSRTFD dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->dict, "count");
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->dict, "objectForKey:", a3);
}

- (id)keyEnumerator
{
  return (id)-[NSMutableDictionary keyEnumerator](self->dict, "keyEnumerator");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSPageData *v7;

  if (_NSIsNSData() && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = -[NSPageData initWithData:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", objc_msgSend(a3, "zone")), "initWithData:", a3);
    -[NSMutableDictionary setObject:forKey:](self->dict, "setObject:forKey:", v7, a4);

  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->dict, "setObject:forKey:", a3, a4);
  }
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->dict, "removeObjectForKey:", a3);
}

- (BOOL)isPackage
{
  return -[NSRTFD objectForKey:](self, "objectForKey:", CFSTR("..")) == 0;
}

- (id)setPackage:(BOOL)a3
{
  _BOOL4 v3;
  NSPageData *v5;

  v3 = a3;
  if (-[NSRTFD isPackage](self, "isPackage") != a3)
  {
    if (v3)
    {
      -[NSRTFD removeObjectForKey:](self, "removeObjectForKey:", CFSTR(".."));
    }
    else
    {
      v5 = -[NSPageData init](+[NSData allocWithZone:](NSPageData, "allocWithZone:", -[NSRTFD zone](self, "zone")), "init");
      -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v5, CFSTR(".."));

    }
  }
  return self;
}

- (unint64_t)initUnixFile:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  -[NSRTFD initFromDocument:error:](self, "initFromDocument:error:", a3, v4);
  return v4[0];
}

- (id)initFromDocument:(id)a3 error:(unint64_t *)a4
{
  NSFileManager *v7;
  NSRTFD *v8;
  unint64_t v9;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v8 = -[NSRTFD init](self, "init");
  if (!objc_msgSend(a3, "length"))
    goto LABEL_8;
  if ((objc_msgSend(a3, "isAbsolutePath") & 1) == 0)
    a3 = -[NSString stringByAppendingPathComponent:](-[NSFileManager currentDirectoryPath](v7, "currentDirectoryPath"), "stringByAppendingPathComponent:", a3);
  v11 = 0;
  if (!-[NSFileManager fileExistsAtPath:isDirectory:](v7, "fileExistsAtPath:isDirectory:", a3, &v11))
  {
LABEL_8:
    if (a4)
      *a4 = 9;
    goto LABEL_13;
  }
  if (v11)
  {
    v9 = -[NSRTFD addDirNamed:](v8, "addDirNamed:", a3);
    if (!v9)
      return v8;
    goto LABEL_11;
  }
  v9 = -[NSRTFD addFileNamed:fileAttributes:](v8, "addFileNamed:fileAttributes:", a3, -[NSFileManager fileAttributesAtPath:traverseLink:](v7, "fileAttributesAtPath:traverseLink:", a3, 1));
  if (v9)
  {
LABEL_11:
    if (a4)
      *a4 = v9;
LABEL_13:

    return 0;
  }
  return v8;
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 markBusy:(BOOL)a7 hardLinkPath:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v14;
  uint64_t v15;
  id v16;
  NSFileManager *v17;
  NSNumber *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSString *v23;
  uint64_t v24;
  NSFileManager *v25;
  NSNumber *v26;
  void *v27;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;

  v9 = a7;
  v10 = a6;
  v14 = -[NSRTFD keyEnumerator](self, "keyEnumerator");
  if (a4)
    v15 = *((unsigned __int16 *)a4 + 8);
  else
    v15 = 511;
  v16 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0);
  v31 = v15 | 0x1C0;
  if (_NXMakeDirs(a3, (v15 | 0x1C0) & ~+[NSPageData _umask](NSPageData, "_umask")) < 0)
    return 4;
  v29 = v15;
  if (v9)
  {
    v17 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v18 = -[NSNumber initWithBool:]([NSNumber alloc], "initWithBool:", 1);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v18, CFSTR("NSFileBusy"), 0);

    -[NSFileManager changeFileAttributes:atPath:](v17, "changeFileAttributes:atPath:", v19, a3);
  }
  v20 = objc_msgSend(v14, "nextObject");
  v30 = v9;
  if (v20)
  {
    v21 = v20;
    do
    {
      v22 = -[NSRTFD objectForKey:](self, "objectForKey:", v21);
      if (v22)
      {
        v23 = -[NSString initWithFormat:](+[NSString allocWithZone:](NSString, "allocWithZone:", -[NSRTFD zone](self, "zone")), "initWithFormat:", CFSTR("%@/%@"), a3, v21);
        v22 = (id)objc_msgSend(v22, "writePath:docInfo:errorHandler:remapContents:hardLinkPath:", v23, objc_msgSend(v16, "objectForKey:", v21), a5, v10, objc_msgSend(a8, "stringByAppendingPathComponent:", v21));

      }
      v24 = objc_msgSend(v14, "nextObject");
      if (!v24)
        break;
      v21 = v24;
    }
    while (!v22);
  }
  else
  {
    v22 = 0;
  }
  if (v31 != v29)
    _NXChmodFile((uint64_t)a3, v29 & ~+[NSPageData _umask](NSPageData, "_umask"));
  if (v30)
  {
    v25 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v26 = -[NSNumber initWithBool:]([NSNumber alloc], "initWithBool:", 0);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v26, CFSTR("NSFileBusy"), 0);

    -[NSFileManager changeFileAttributes:atPath:](v25, "changeFileAttributes:atPath:", v27, a3);
  }
  return (unint64_t)v22;
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7
{
  return -[NSRTFD writePath:docInfo:errorHandler:remapContents:markBusy:hardLinkPath:](self, "writePath:docInfo:errorHandler:remapContents:markBusy:hardLinkPath:", a3, a4, a5, a6, 0, a7);
}

- (unint64_t)internalWritePath:(id)a3 errorHandler:(id)a4 remapContents:(BOOL)a5 hardLinkPath:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v11;
  id v13;
  uint64_t v14;

  v7 = a5;
  v11 = -[NSRTFD isPackage](self, "isPackage");
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", a3))
  {
    return 8;
  }
  if (v11)
    return -[NSRTFD writePath:docInfo:errorHandler:remapContents:markBusy:hardLinkPath:](self, "writePath:docInfo:errorHandler:remapContents:markBusy:hardLinkPath:", a3, 0, a4, v7, 1, a6);
  v13 = -[NSRTFD objectForKey:](self, "objectForKey:", CFSTR(".."));
  v14 = objc_msgSend(-[NSRTFD getDirInfo:](self, "getDirInfo:", 0), "objectForKey:", CFSTR(".."));
  if (v13)
    return objc_msgSend(v13, "writePath:docInfo:errorHandler:remapContents:hardLinkPath:", a3, v14, a4, v7, 0);
  else
    return 12;
}

- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5 temp:(id)a6 backup:(id)a7
{
  _BOOL8 v10;
  NSFileManager *v13;
  _BOOL4 v14;
  BOOL v15;
  _BOOL4 v16;
  id v17;
  unint64_t v18;
  unint64_t result;
  uint64_t v20;

  v10 = a4;
  v13 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v14 = -[NSFileManager fileExistsAtPath:](v13, "fileExistsAtPath:", a3);
  v15 = -[NSFileManager isWritableFileAtPath:](v13, "isWritableFileAtPath:", a3);
  v16 = -[NSFileManager isDeletableFileAtPath:](v13, "isDeletableFileAtPath:", a3);
  if (v14)
    v17 = a3;
  else
    v17 = 0;
  if (!v14 || v15)
    goto LABEL_9;
  if (!v16)
    return 11;
  v17 = a3;
  if (!objc_msgSend(a5, "attemptOverwrite:", a3))
    return 1;
LABEL_9:
  if (-[NSFileManager fileExistsAtPath:](v13, "fileExistsAtPath:", a6) && _NXRemoveDocument((uint64_t)a6) < 0)
    return 7;
  v18 = -[NSRTFD internalWritePath:errorHandler:remapContents:hardLinkPath:](self, "internalWritePath:errorHandler:remapContents:hardLinkPath:", a6, a5, v10, v17);
  if (v18)
  {
    a7 = a6;
LABEL_12:
    _NXRemoveDocument((uint64_t)a7);
    return v18;
  }
  if (_NXRemoveDocument((uint64_t)a7) < 0)
    return 6;
  if (v14 && _NXRenameFile((uint64_t)a3, (uint64_t)a7) < 0)
    return 5;
  v20 = _NXRenameFile((uint64_t)a6, (uint64_t)a3);
  if (v20 < 0)
    result = 5;
  else
    result = 0;
  if ((v20 & 0x8000000000000000) == 0 && v10)
    goto LABEL_12;
  return result;
}

- (id)nameFromPath:(id)a3 extra:(id)a4
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", a4);
}

- (id)tmpNameFromPath:(id)a3 extension:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend(CFSTR("."), "stringByAppendingString:", -[NSProcessInfo globallyUniqueString](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "globallyUniqueString"))), "stringByAppendingPathExtension:", a4);
}

- (id)tmpNameFromPath:(id)a3
{
  return -[NSRTFD tmpNameFromPath:extension:](self, "tmpNameFromPath:extension:", a3, CFSTR("tmp"));
}

- (unint64_t)internalSaveTo:(id)a3 removeBackup:(BOOL)a4 errorHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;

  v6 = a4;
  v9 = -[NSRTFD tmpNameFromPath:extension:](self, "tmpNameFromPath:extension:", a3, CFSTR("tmp"));
  if (v6)
    v10 = -[NSRTFD tmpNameFromPath:extension:](self, "tmpNameFromPath:extension:", a3, CFSTR("bak"));
  else
    v10 = -[NSRTFD nameFromPath:extra:](self, "nameFromPath:extra:", a3, CFSTR("~"));
  return -[NSRTFD internalSaveTo:removeBackup:errorHandler:temp:backup:](self, "internalSaveTo:removeBackup:errorHandler:temp:backup:", a3, v6, a5, v9, v10);
}

- (id)dataRepresentation
{
  uint64_t v3;
  NSAKSerializerStream *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSRTFD zone](self, "zone");
  v4 = -[NSAKSerializerStream init](+[NSAKSerializerStream allocWithZone:](NSAKSerializerStream, "allocWithZone:", v3), "init");
  v11[0] = 1684436082;
  -[NSAKSerializerStream writeData:length:](v4, "writeData:length:", v11, 8);
  v5 = -[NSAKSerializer initForSerializerStream:](+[NSDocumentSerializer allocWithZone:](NSDocumentSerializer, "allocWithZone:", v3), "initForSerializerStream:", v4);
  v6 = objc_msgSend(v5, "serializeObject:", self);
  v7 = v6 + 8;
  v8 = objc_allocWithZone(MEMORY[0x1E0C99DF0]);
  v9 = (void *)objc_msgSend(v8, "initWithLength:", (v6 + *MEMORY[0x1E0C85AD8] + 7) & -*MEMORY[0x1E0C85AD8]);
  -[NSAKSerializerStream copySerializationInto:](v4, "copySerializationInto:", objc_msgSend(v9, "mutableBytes"));
  objc_msgSend(v9, "setLength:", v7);

  return v9;
}

- (NSRTFD)initWithDataRepresentation:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  _DWORD *v8;
  NSRTFD *v9;
  id v10;

  v5 = objc_msgSend(a3, "length");
  v6 = v5 - 8;
  if (v5 < 8)
  {
    NSLog((NSString *)CFSTR("Unable to read RTFD from data:%p"), a3);
LABEL_3:

    return 0;
  }
  v8 = (_DWORD *)objc_msgSend(a3, "bytes");
  if (*v8 ^ 0x64667472 | *((unsigned __int8 *)v8 + 4))
  {
    v9 = self;
    v10 = a3;
  }
  else
  {
    if (v8[1])
    {
      NSLog((NSString *)CFSTR("Bad version in RTFD data:%p"), a3);
      goto LABEL_3;
    }
    v10 = (id)objc_msgSend(a3, "subdataWithRange:", 8, v6);
    v9 = self;
  }
  return -[NSRTFD initWithPasteboardDataRepresentation:](v9, "initWithPasteboardDataRepresentation:", v10);
}

- (id)createRandomKey:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;

  v5 = -[NSRTFD zone](self, "zone");
  if (!-[NSRTFD objectForKey:](self, "objectForKey:", a3))
    return a3;
  while (1)
  {
    v6 = mach_absolute_time();
    v7 = objc_msgSend(a3, "significantText");
    v9 = -[NSString initWithFormat:](+[NSString allocWithZone:](NSString, "allocWithZone:", v5), "initWithFormat:", CFSTR("%d_%@"), v6, objc_msgSend(a3, "substringWithRange:", v7, v8));
    if (!-[NSRTFD objectForKey:](self, "objectForKey:", v9))
      break;

  }
  return v9;
}

- (id)createUniqueKey:(id)a3
{
  id v5;

  do
    v5 = -[NSRTFD createRandomKey:](self, "createRandomKey:", a3);
  while (-[NSRTFD objectForKey:](self, "objectForKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.tiff"), v5)));
  return v5;
}

- (id)getDocument:(id)a3 docInfo:(id)a4
{
  uint64_t v6;
  __int16 v7;

  v6 = -[NSRTFD zone](self, "zone");
  v7 = *((_WORD *)a4 + 9);
  if ((v7 & 1) != 0)
    return -[NSRTFD initFromDocument:error:](+[NSRTFD allocWithZone:](NSRTFD, "allocWithZone:", v6), "initFromDocument:error:", a3, 0);
  else
    return newLeafDocument((uint64_t)a3, v7, v6);
}

- (id)replaceFile:(id)a3 data:(id)a4
{
  NSPageData *v6;

  v6 = -[NSPageData initWithData:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", -[NSRTFD zone](self, "zone")), "initWithData:", a4);
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v6, a3);

  return self;
}

- (id)replaceFile:(id)a3 path:(id)a4
{
  NSRTFD *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSDictionary *v10;
  uint64_t v11;
  void *v12;
  NSDocInfo *v13;
  uint64_t v14;

  v6 = self;
  v7 = -[NSRTFD zone](self, "zone");
  v8 = -[NSRTFD getDirInfo:](v6, "getDirInfo:", 1);
  v9 = (void *)objc_msgSend(v8, "objectForKey:", a3);
  v10 = -[NSFileManager fileAttributesAtPath:traverseLink:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileAttributesAtPath:traverseLink:", a4, 0);
  if (!v10)
    return 0;
  if (!v9)
  {
    v13 = -[NSDocInfo initWithFileAttributes:](+[NSDocInfo allocWithZone:](NSDocInfo, "allocWithZone:", v7), "initWithFileAttributes:", v10);
    v14 = -[NSRTFD getDocument:docInfo:](v6, "getDocument:docInfo:", a4, v13);
    if (!v14)
    {

      return v6;
    }
    v12 = (void *)v14;
    -[NSRTFD setObject:forKey:](v6, "setObject:forKey:", v14, a3);
    objc_msgSend(v8, "setObject:forKey:", v13, a3);

    goto LABEL_8;
  }
  objc_msgSend(v9, "setFileAttributes:", v10);
  v11 = -[NSRTFD getDocument:docInfo:](v6, "getDocument:docInfo:", a4, v9);
  if (v11)
  {
    v12 = (void *)v11;
    -[NSRTFD setObject:forKey:](v6, "setObject:forKey:", v11, a3);
LABEL_8:

  }
  return v6;
}

- (id)addCommon:(id)a3 docInfo:(id)a4 value:(id)a5 zone:(_NSZone *)a6
{
  id v10;
  id v11;

  v10 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 1, a4, a5, a6);
  v11 = -[NSRTFD uniqueKey:](self, "uniqueKey:", objc_msgSend(a3, "lastPathComponent"));
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", a5, v11);
  if (a4)
    objc_msgSend(v10, "setObject:forKey:", a4, v11);
  return v11;
}

- (id)_getDocInfoForKey:(id)a3
{
  return (id)objc_msgSend(-[NSRTFD getDirInfo:](self, "getDirInfo:", 0), "objectForKey:", a3);
}

- (id)addFile:(id)a3
{
  uint64_t v5;
  NSDictionary *v6;
  NSDocInfo *v7;
  id v8;
  void *v9;
  id v10;

  v5 = -[NSRTFD zone](self, "zone");
  v6 = -[NSFileManager fileAttributesAtPath:traverseLink:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileAttributesAtPath:traverseLink:", a3, 0);
  if (!v6)
    return 0;
  v7 = -[NSDocInfo initWithFileAttributes:](+[NSDocInfo allocWithZone:](NSDocInfo, "allocWithZone:", v5), "initWithFileAttributes:", v6);
  v8 = -[NSRTFD getDocument:docInfo:](self, "getDocument:docInfo:", a3, v7);
  if (v8)
  {
    v9 = v8;
    v10 = -[NSRTFD addCommon:docInfo:value:zone:](self, "addCommon:docInfo:value:zone:", a3, v7, v8, v5);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)addLink:(id)a3
{
  uint64_t v5;
  id result;
  NSDocInfo *v7;
  NSPageData *v8;
  id v9;

  v5 = -[NSRTFD zone](self, "zone");
  result = -[NSFileManager fileAttributesAtPath:traverseLink:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileAttributesAtPath:traverseLink:", a3, 1);
  if (result)
  {
    v7 = -[NSDocInfo initWithFileAttributes:](+[NSDocInfo allocWithZone:](NSDocInfo, "allocWithZone:", v5), "initWithFileAttributes:", result);
    *(&v7->mode + 1) |= 4u;
    v8 = -[NSPageData initWithData:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", v5), "initWithData:", objc_msgSend(a3, "dataUsingEncoding:allowLossyConversion:", 4, 1));
    v9 = -[NSRTFD addCommon:docInfo:value:zone:](self, "addCommon:docInfo:value:zone:", a3, v7, v8, v5);

    return v9;
  }
  return result;
}

- (id)dataForFile:(id)a3
{
  id v5;
  uint64_t v6;
  id v8;

  v5 = -[NSRTFD objectForKey:](self, "objectForKey:");
  if (!v5)
    return v5;
  v6 = objc_msgSend(-[NSRTFD getDirInfo:](self, "getDirInfo:", 0), "objectForKey:", a3);
  if (!v6 || (*(_WORD *)(v6 + 18) & 4) == 0)
    return v5;
  v8 = (id)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithData:encoding:", v5, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v8);
}

- (id)removeFile:(id)a3
{
  id v5;

  v5 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0);
  -[NSRTFD removeObjectForKey:](self, "removeObjectForKey:", a3);
  objc_msgSend(v5, "removeObjectForKey:", a3);
  return self;
}

- (id)copy:(id)a3 into:(id)a4
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = objc_msgSend(a4, "zone");
  v8 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0);
  v9 = (void *)objc_msgSend(a4, "uniqueKey:", a3);
  v10 = (void *)objc_msgSend(-[NSRTFD objectForKey:](self, "objectForKey:", a3), "copyWithZone:", v7);
  objc_msgSend(a4, "setObject:forKey:", v10, v9);

  v11 = objc_msgSend(v8, "objectForKey:", v9);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)objc_msgSend(a4, "getDirInfo:", 1);
    v14 = (void *)objc_msgSend(v12, "copyWithZone:", v7);
    objc_msgSend(v13, "setObject:forKey:", v14, v9);

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0);
  v7 = -[NSRTFD keyEnumerator](self, "keyEnumerator");
  v8 = 0;
  while (1)
  {
    v9 = objc_msgSend(v7, "nextObject");
    if (!v9)
      break;
    v10 = (void *)v9;
    v11 = -[NSRTFD objectForKey:](self, "objectForKey:", v9);
    if ((objc_msgSend(v10, "isEqual:", CFSTR(".")) & 1) == 0)
    {
      if (v6)
      {
        v12 = objc_msgSend(v6, "objectForKey:", v10);
        if (v12)
        {
          v13 = (void *)v12;
          if (!v8)
            v8 = (void *)objc_msgSend(v5, "getDirInfo:", 1);
          v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
          objc_msgSend(v8, "setObject:forKey:", v14, v10);

        }
      }
      v15 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
      objc_msgSend(v5, "setObject:forKey:", v15, v10);

    }
  }
  return v5;
}

- (id)copy
{
  return -[NSRTFD copyWithZone:](self, "copyWithZone:", 0);
}

- (id)addData:(id)a3 name:(id)a4
{
  NSPageData *v6;
  id v7;

  v6 = -[NSPageData initWithData:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", -[NSRTFD zone](self, "zone")), "initWithData:", a3);
  v7 = -[NSRTFD uniqueKey:](self, "uniqueKey:", objc_msgSend(a4, "lastPathComponent"));
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v6, v7);

  return v7;
}

- (int64_t)validatePath:(id)a3 ignore:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __objc2_class **v14;
  __objc2_class **v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSDictionary *v19;
  double v20;
  int64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  uint64_t v26;

  v7 = -[NSRTFD zone](self, "zone");
  v8 = -[NSRTFD keyEnumerator](self, "keyEnumerator");
  v9 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = objc_msgSend(v8, "nextObject");
  if (!v11)
    return 0;
  v12 = v11;
  v26 = v7;
  v13 = 0;
  v14 = __SCR_NSSelfExpression;
  do
  {
    if (-[NSRTFD objectForKey:](self, "objectForKey:", v12) && !objc_msgSend(a4, "objectForKey:", v12))
    {
      v15 = v14;
      v16 = (void *)objc_msgSend(objc_allocWithZone((Class)v14[18]), "initWithFormat:", CFSTR("%@/%@"), a3, v12);
      v17 = objc_msgSend(v10, "objectForKey:", v12);
      if (v17)
      {
        v18 = v17;
        v19 = -[NSFileManager fileAttributesAtPath:traverseLink:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileAttributesAtPath:traverseLink:", v16, 0);
        if (v19)
        {
          objc_msgSend(-[NSDictionary fileModificationDate](v19, "fileModificationDate"), "timeIntervalSince1970");
          if (*(_QWORD *)(v18 + 8) != (uint64_t)v20)
          {
            if (!v13)
              v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", v26), "init");
            objc_msgSend(v13, "addObject:", v12);
          }
        }
      }

      v14 = v15;
    }
    v12 = objc_msgSend(v8, "nextObject");
  }
  while (v12);
  if (!v13)
    return 0;
  v21 = objc_msgSend(v13, "count");
  if (v21 >= 1)
  {
    for (i = 0; i != v21; ++i)
    {
      v23 = objc_msgSend(v13, "objectAtIndex:", i);
      v24 = (void *)objc_msgSend(objc_allocWithZone((Class)v14[18]), "initWithFormat:", CFSTR("%@/%@"), a3, v23);
      -[NSRTFD replaceFile:path:](self, "replaceFile:path:", v23, v24);

    }
  }

  return v21;
}

- (id)initFromElement:(id)a3 ofDocument:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSRTFD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSDirInfo *v14;
  void *v15;
  void *v16;

  v7 = -[NSRTFD zone](self, "zone");
  v8 = objc_msgSend(a4, "objectForKey:", a3);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[NSRTFD init](self, "init");
    v11 = (void *)objc_msgSend(a4, "getDirInfo:", 0);
    if (v11)
    {
      v12 = objc_msgSend(v11, "objectForKey:", a3);
      if (v12)
      {
        v13 = (void *)v12;
        v14 = -[NSDirInfo init](+[NSDirInfo allocWithZone:](NSDirInfo, "allocWithZone:", v7), "init");
        v15 = (void *)objc_msgSend(v13, "copyWithZone:", v7);
        -[NSDirInfo setObject:forKey:](v14, "setObject:forKey:", v15, CFSTR(".."));
        -[NSRTFD setObject:forKey:](v10, "setObject:forKey:", v14, CFSTR("."));

      }
    }
    v16 = (void *)objc_msgSend(v9, "copyWithZone:", v7);
    -[NSRTFD setObject:forKey:](v10, "setObject:forKey:", v16, CFSTR(".."));

  }
  else
  {
    -[NSRTFD dealloc](self, "dealloc");
    return 0;
  }
  return v10;
}

- (id)getDirInfo:(BOOL)a3
{
  _BOOL4 v3;
  NSDirInfo *v5;
  BOOL v6;

  v3 = a3;
  v5 = -[NSRTFD objectForKey:](self, "objectForKey:", CFSTR("."));
  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    v5 = -[NSDirInfo init](+[NSDirInfo allocWithZone:](NSDirInfo, "allocWithZone:", -[NSRTFD zone](self, "zone")), "init");
    -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v5, CFSTR("."));

  }
  return v5;
}

- (unint64_t)addFileNamed:(id)a3 fileAttributes:(id)a4
{
  uint64_t v7;
  NSPageData *v8;
  NSPageData *v9;
  NSDirInfo *v10;
  NSDocInfo *v11;

  v7 = -[NSRTFD zone](self, "zone");
  v8 = -[NSPageData initWithContentsOfMappedFile:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", v7), "initWithContentsOfMappedFile:", a3);
  if (!v8)
    return 10;
  v9 = v8;
  v10 = -[NSDirInfo init](+[NSDirInfo allocWithZone:](NSDirInfo, "allocWithZone:", v7), "init");
  v11 = -[NSDocInfo initWithFileAttributes:](+[NSDocInfo allocWithZone:](NSDocInfo, "allocWithZone:", v7), "initWithFileAttributes:", a4);
  *(&v11->mode + 1) |= 2u;
  -[NSDirInfo setObject:forKey:](v10, "setObject:forKey:", v11, CFSTR(".."));

  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v9, CFSTR(".."));
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v10, CFSTR("."));

  return 0;
}

- (unint64_t)insertItem:(id)a3 path:(id)a4 dirInfo:(id)a5 zone:(_NSZone *)a6 plist:(id)a7
{
  _NSZone *v8;
  id v9;
  NSDictionary *v13;
  NSDocInfo *v14;
  __int16 v15;
  NSPageData *v16;
  NSRTFD *v17;
  unint64_t v18;

  v8 = a6;
  v9 = a5;
  if (a5)
  {
    if (a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0);
  if (!v8)
LABEL_3:
    v8 = (_NSZone *)-[NSRTFD zone](self, "zone");
LABEL_4:
  v13 = -[NSFileManager fileAttributesAtPath:traverseLink:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileAttributesAtPath:traverseLink:", a4, 0);
  if (v13)
  {
    v14 = -[NSDocInfo initWithFileAttributes:](+[NSDocInfo allocWithZone:](NSDocInfo, "allocWithZone:", v8), "initWithFileAttributes:", v13);
    v15 = *(&v14->mode + 1);
    if ((v15 & 1) != 0)
    {
      v17 = -[NSRTFD init](+[NSRTFD allocWithZone:](NSRTFD, "allocWithZone:", v8), "init");
      v18 = -[NSRTFD addDirNamed:](v17, "addDirNamed:", a4);
      if (!v17)
      {
LABEL_17:

        return v18;
      }
    }
    else
    {
      v16 = newLeafDocument((uint64_t)a4, v15, (uint64_t)v8);
      v17 = (NSRTFD *)v16;
      if (v16)
        v18 = 0;
      else
        v18 = 10;
      if (!v16)
        goto LABEL_17;
    }
    if (!v18)
    {
      objc_msgSend(a7, "setObject:forKey:", v17, a3);
      objc_msgSend(v9, "setObject:forKey:", v14, a3);
    }
    goto LABEL_17;
  }
  return 9;
}

- (unint64_t)addDirNamed:(id)a3
{
  uint64_t v5;
  NSDirInfo *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  v5 = -[NSRTFD zone](self, "zone");
  v6 = -[NSDirInfo init](+[NSDirInfo allocWithZone:](NSDirInfo, "allocWithZone:", v5), "init");
  v7 = -[NSFileManager directoryContentsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "directoryContentsAtPath:", a3);
  if (!v7)
    v7 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  -[NSRTFD setObject:forKey:](self, "setObject:forKey:", v6, CFSTR("."));
  v8 = -[NSArray count](v7, "count");
  if (v8 < 1)
  {
LABEL_7:
    v13 = 0;
  }
  else
  {
    v9 = v8;
    v10 = 0;
    while (1)
    {
      v11 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", v10);
      v12 = (void *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:", CFSTR("%@/%@"), a3, v11);
      v13 = -[NSRTFD insertItem:path:dirInfo:zone:plist:](self, "insertItem:path:dirInfo:zone:plist:", v11, v12, v6, v5, self);

      if (v13)
        break;
      if (v9 == ++v10)
        goto LABEL_7;
    }
  }

  return v13;
}

- (id)serialize:(void *)a3 length:(unint64_t *)a4
{
  uint64_t v7;
  NSAKSerializerStream *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;

  v7 = -[NSRTFD zone](self, "zone");
  v8 = -[NSAKSerializerStream init](+[NSAKSerializerStream allocWithZone:](NSAKSerializerStream, "allocWithZone:", v7), "init");
  v9 = -[NSAKSerializer initForSerializerStream:](+[NSDocumentSerializer allocWithZone:](NSDocumentSerializer, "allocWithZone:", v7), "initForSerializerStream:", v8);
  v10 = objc_msgSend(v9, "serializeObject:", self);
  *a4 = v10;
  *a3 = 0;
  v11 = vm_allocate(*MEMORY[0x1E0C83DA0], (vm_address_t *)a3, v10, 1);
  if ((_DWORD)v11)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSAppKitVirtualMemoryException"), CFSTR("vm_allocate() failed in NSRTFD serialize:length:"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11), CFSTR("NSErrorCodeExceptionInfo"), 0)), "raise");
  -[NSAKSerializerStream copySerializationInto:](v8, "copySerializationInto:", *a3);

  return self;
}

- (id)freeSerialized:(void *)a3 length:(unint64_t)a4
{
  uint64_t v5;

  v5 = mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)a3, a4);
  if ((_DWORD)v5)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSAppKitVirtualMemoryException"), CFSTR("vm_allocate() failed in NSRTFD freeSerialized:length:"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5), CFSTR("NSErrorCodeExceptionInfo"), 0)), "raise");
  return self;
}

- (id)pasteboardDataRepresentation
{
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6[0] = 0;
  -[NSRTFD serialize:length:](self, "serialize:length:", v6, &v5);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6[0], v5);
  -[NSRTFD freeSerialized:length:](self, "freeSerialized:length:", v6[0], v5);
  return v3;
}

- (NSRTFD)initWithPasteboardDataRepresentation:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  NSRTFD *v8;

  v5 = -[NSRTFD zone](self, "zone");
  v6 = -[NSAKDeserializerStream initFromMemoryNoCopy:length:freeWhenDone:](+[NSAKDeserializerStream allocWithZone:](NSAKDeserializerStream, "allocWithZone:", v5), "initFromMemoryNoCopy:length:freeWhenDone:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0);
  v7 = -[NSAKDeserializer initForDeserializerStream:](+[NSDocumentDeserializer allocWithZone:](NSDocumentDeserializer, "allocWithZone:", v5), "initForDeserializerStream:", v6);
  v8 = (NSRTFD *)objc_msgSend(v7, "deserializeNewObject");

  return v8;
}

- (BOOL)_isLink:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = -[NSRTFD getDirInfo:](self, "getDirInfo:", 0);
  if (v4)
  {
    v5 = objc_msgSend(v4, "objectForKey:", a3);
    LOBYTE(v4) = v5 && (*(_WORD *)(v5 + 18) & 4) != 0;
  }
  return (char)v4;
}

@end
