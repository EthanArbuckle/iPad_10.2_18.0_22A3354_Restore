@implementation NSFileHandle

- (NSFileHandle)initWithCoder:(NSCoder *)coder
{
  void *v5;

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("This object may only be decoded by an NSXPCCoder."), 0));
  }
  v5 = (void *)-[NSCoder decodeXPCObjectOfType:forKey:](coder, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81318], CFSTR("NS.fd"));
  if (v5)
    return -[NSFileHandle initWithFileDescriptor:closeOnDealloc:](self, "initWithFileDescriptor:closeOnDealloc:", xpc_fd_dup(v5), 1);

  return 0;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSFileHandle)fileHandleForReadingAtPath:(NSString *)path
{
  return (NSFileHandle *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithPath:flags:createMode:", path, 0, 0);
}

+ (NSFileHandle)allocWithZone:(_NSZone *)a3
{
  if (NSFileHandle == a1)
    a1 = (id)objc_opt_self();
  return (NSFileHandle *)NSAllocateObject((Class)a1, 0, a3);
}

+ (NSFileHandle)fileHandleWithNullDevice
{
  if (qword_1ECD09770 != -1)
    dispatch_once(&qword_1ECD09770, &__block_literal_global_9);
  return (NSFileHandle *)qword_1ECD09768;
}

+ (NSFileHandle)fileHandleForUpdatingAtPath:(NSString *)path
{
  return (NSFileHandle *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithPath:flags:createMode:", path, 2, 0);
}

+ (NSFileHandle)fileHandleForWritingToURL:(NSURL *)url error:(NSError *)error
{
  return (NSFileHandle *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithURL:flags:createMode:error:", url, 1, 0, error);
}

+ (NSFileHandle)fileHandleForWritingAtPath:(NSString *)path
{
  return (NSFileHandle *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithPath:flags:createMode:", path, 1, 0);
}

+ (NSFileHandle)fileHandleForReadingFromURL:(NSURL *)url error:(NSError *)error
{
  return (NSFileHandle *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithURL:flags:createMode:error:", url, 0, 0, error);
}

+ (NSFileHandle)fileHandleForUpdatingURL:(NSURL *)url error:(NSError *)error
{
  return (NSFileHandle *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithURL:flags:createMode:error:", url, 2, 0, error);
}

+ (void)initialize
{
  int v2;
  rlim_t v3;
  rlimit v4;
  size_t v5;
  int rlim_max;
  rlimit v7;
  int v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v7.rlim_cur = 0;
    v7.rlim_max = 0;
    v2 = getrlimit(8, &v7);
    *(_QWORD *)v8 = 0x1D00000001;
    rlim_max = 0;
    v5 = 4;
    if (sysctl(v8, 2u, &rlim_max, &v5, 0, 0) | v2)
    {
      if (v2)
        return;
      LODWORD(v3) = rlim_max;
    }
    else
    {
      LODWORD(v3) = rlim_max;
      if (v7.rlim_max < rlim_max)
      {
        rlim_max = v7.rlim_max;
        LODWORD(v3) = v7.rlim_max;
      }
    }
    if (v7.rlim_cur < (int)v3)
    {
      v3 = (int)v3;
      v4 = v7;
      if (v7.rlim_cur + 2304 < (int)v3)
        v3 = v7.rlim_cur + 2304;
      v4.rlim_cur = v3;
      setrlimit(8, &v4);
    }
  }
}

uint64_t __40__NSFileHandle_fileHandleWithNullDevice__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_allocWithZone((Class)NSNullFileHandle), "init");
  qword_1ECD09768 = result;
  return result;
}

+ (NSFileHandle)fileHandleWithStandardInput
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NSFileHandle_fileHandleWithStandardInput__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD09740 != -1)
    dispatch_once(&qword_1ECD09740, v3);
  return (NSFileHandle *)_MergedGlobals_25;
}

uint64_t __43__NSFileHandle_fileHandleWithStandardInput__block_invoke(uint64_t a1)
{
  uint64_t result;
  unsigned __int16 *v3;
  unsigned __int16 v4;

  result = objc_msgSend(objc_allocWithZone((Class)_NSStdIOFileHandle), "initWithFileDescriptor:closeOnDealloc:", 0, 0);
  _MergedGlobals_25 = result;
  if (result)
  {
    v3 = (unsigned __int16 *)(result + 100);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 | 0x8000, v3));
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "fileHandleWithNullDevice");
    _MergedGlobals_25 = result;
  }
  return result;
}

+ (NSFileHandle)fileHandleWithStandardOutput
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__NSFileHandle_fileHandleWithStandardOutput__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD09750 != -1)
    dispatch_once(&qword_1ECD09750, v3);
  return (NSFileHandle *)qword_1ECD09748;
}

uint64_t __44__NSFileHandle_fileHandleWithStandardOutput__block_invoke(uint64_t a1)
{
  uint64_t result;
  unsigned __int16 *v3;
  unsigned __int16 v4;

  result = objc_msgSend(objc_allocWithZone((Class)_NSStdIOFileHandle), "initWithFileDescriptor:closeOnDealloc:", 1, 0);
  qword_1ECD09748 = result;
  if (result)
  {
    v3 = (unsigned __int16 *)(result + 100);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 | 0x4000, v3));
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "fileHandleWithNullDevice");
    qword_1ECD09748 = result;
  }
  return result;
}

+ (NSFileHandle)fileHandleWithStandardError
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NSFileHandle_fileHandleWithStandardError__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD09760 != -1)
    dispatch_once(&qword_1ECD09760, v3);
  return (NSFileHandle *)qword_1ECD09758;
}

uint64_t __43__NSFileHandle_fileHandleWithStandardError__block_invoke(uint64_t a1)
{
  uint64_t result;
  unsigned __int16 *v3;
  unsigned __int16 v4;

  result = objc_msgSend(objc_allocWithZone((Class)_NSStdIOFileHandle), "initWithFileDescriptor:closeOnDealloc:", 2, 0);
  qword_1ECD09758 = result;
  if (result)
  {
    v3 = (unsigned __int16 *)(result + 100);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 | 0x2000, v3));
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "fileHandleWithNullDevice");
    qword_1ECD09758 = result;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5
{
  objc_class *v7;

  v7 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (NSFileHandle)initWithFileDescriptor:(int)fd closeOnDealloc:(BOOL)closeopt
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSFileHandle)initWithFileDescriptor:(int)fd
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  uint64_t v11;

  if (objc_msgSend(a3, "isFileURL"))
    v11 = objc_msgSend(a3, "path");
  else
    v11 = 0;
  return -[NSFileHandle initWithPath:flags:createMode:error:](self, "initWithPath:flags:createMode:error:", v11, a4, a5, a6);
}

- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  objc_class *v8;

  -[NSFileHandle init](self, "init", a3, a4, a5, a6);
  v8 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

+ (id)fileHandleForReadingFromURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithURL:flags:createMode:error:", a3, 512, a4, a5);
}

+ (id)fileHandleForWritingToURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithURL:flags:createMode:error:", a3, 513, a4, a5);
}

+ (id)fileHandleForUpdatingURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithURL:flags:createMode:error:", a3, 514, a4, a5);
}

- (NSData)availableData
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSData)readDataToEndOfFile
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSData)readDataToEndOfFileAndReturnError:(NSError *)error
{
  uint64_t v6;
  objc_class *v8;

  v6 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_readDataToEndOfFile);
  if (v6 == +[NSFileHandle instanceMethodForSelector:](NSFileHandle, "instanceMethodForSelector:", sel_readDataToEndOfFile))
  {
    v8 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }
  if (error)
    *error = 0;
  return -[NSFileHandle readDataToEndOfFile](self, "readDataToEndOfFile");
}

- (NSData)readDataOfLength:(NSUInteger)length
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSData)readDataUpToLength:(NSUInteger)length error:(NSError *)error
{
  uint64_t v8;
  objc_class *v10;

  v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_readDataOfLength_);
  if (v8 == +[NSFileHandle instanceMethodForSelector:](NSFileHandle, "instanceMethodForSelector:", sel_readDataOfLength_))
  {
    v10 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }
  if (error)
    *error = 0;
  return -[NSFileHandle readDataOfLength:](self, "readDataOfLength:", length);
}

- (void)writeData:(NSData *)data
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)writeData:(NSData *)data error:(NSError *)error
{
  uint64_t v8;
  objc_class *v10;

  v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_writeData_);
  if (v8 == +[NSFileHandle instanceMethodForSelector:](NSFileHandle, "instanceMethodForSelector:", sel_writeData_))
  {
    v10 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }
  if (error)
    *error = 0;
  -[NSFileHandle writeData:](self, "writeData:", data);
  return 1;
}

- (unint64_t)offsetInFile
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)getOffset:(unint64_t *)offsetInFile error:(NSError *)error
{
  uint64_t v8;
  unint64_t v9;
  objc_class *v11;

  v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_offsetInFile);
  if (v8 == +[NSFileHandle instanceMethodForSelector:](NSFileHandle, "instanceMethodForSelector:", sel_offsetInFile))
  {
    v11 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v11);
  }
  if (error)
    *error = 0;
  v9 = -[NSFileHandle offsetInFile](self, "offsetInFile");
  if (offsetInFile)
    *offsetInFile = v9;
  return 1;
}

- (unint64_t)seekToEndOfFile
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)seekToEndReturningOffset:(unint64_t *)offsetInFile error:(NSError *)error
{
  uint64_t v8;
  unint64_t v9;
  objc_class *v11;

  v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_seekToEndOfFile);
  if (v8 == +[NSFileHandle instanceMethodForSelector:](NSFileHandle, "instanceMethodForSelector:", sel_seekToEndOfFile))
  {
    v11 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v11);
  }
  if (error)
    *error = 0;
  v9 = -[NSFileHandle seekToEndOfFile](self, "seekToEndOfFile");
  if (offsetInFile)
    *offsetInFile = v9;
  return 1;
}

- (void)seekToFileOffset:(unint64_t)offset
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)seekToOffset:(unint64_t)offset error:(NSError *)error
{
  uint64_t v8;
  objc_class *v10;

  v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_seekToFileOffset_);
  if (v8 == +[NSFileHandle instanceMethodForSelector:](NSFileHandle, "instanceMethodForSelector:", sel_seekToFileOffset_))
  {
    v10 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }
  if (error)
    *error = 0;
  -[NSFileHandle seekToFileOffset:](self, "seekToFileOffset:", offset);
  return 1;
}

- (void)truncateFileAtOffset:(unint64_t)offset
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)truncateAtOffset:(unint64_t)offset error:(NSError *)error
{
  uint64_t v8;
  objc_class *v10;

  v8 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_truncateFileAtOffset_);
  if (v8 == +[NSFileHandle instanceMethodForSelector:](NSFileHandle, "instanceMethodForSelector:", sel_truncateFileAtOffset_))
  {
    v10 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }
  if (error)
    *error = 0;
  -[NSFileHandle truncateFileAtOffset:](self, "truncateFileAtOffset:", offset);
  return 1;
}

- (void)synchronizeFile
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)synchronizeAndReturnError:(NSError *)error
{
  uint64_t v6;
  objc_class *v8;

  v6 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_synchronizeFile);
  if (v6 == +[NSFileHandle instanceMethodForSelector:](NSFileHandle, "instanceMethodForSelector:", sel_synchronizeFile))
  {
    v8 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }
  if (error)
    *error = 0;
  -[NSFileHandle synchronizeFile](self, "synchronizeFile");
  return 1;
}

- (void)closeFile
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)closeAndReturnError:(NSError *)error
{
  uint64_t v6;
  objc_class *v8;

  v6 = -[NSFileHandle methodForSelector:](self, "methodForSelector:", sel_closeFile);
  if (v6 == +[NSFileHandle instanceMethodForSelector:](NSFileHandle, "instanceMethodForSelector:", sel_closeFile))
  {
    v8 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }
  if (error)
    *error = 0;
  -[NSFileHandle closeFile](self, "closeFile");
  return 1;
}

- (int)fileDescriptor
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)writeabilityHandler
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setWriteabilityHandler:(void *)writeabilityHandler
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)readabilityHandler
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setReadabilityHandler:(void *)readabilityHandler
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSFileHandle"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end
