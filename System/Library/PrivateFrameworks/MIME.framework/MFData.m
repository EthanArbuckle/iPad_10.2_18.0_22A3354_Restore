@implementation MFData

+ (void)setDefaultMappingThresholdInBytes:(unint64_t)a3
{
  sDefaultThreshold = a3;
}

- (MFData)init
{
  return -[MFData initWithBytes:length:](self, "initWithBytes:length:", 0, 0);
}

- (id)_initWithFile:(id)a3
{
  MFData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFData;
  v4 = -[MFData init](&v6, sel_init);
  if (v4)
  {
    v4->_path = (NSString *)a3;
    v4->_internal = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v4->_path, 1, 0);
  }
  return v4;
}

- (MFData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  MFData *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  int v10;
  int v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MFData;
  v6 = -[MFData init](&v13, sel_init);
  if (v6)
  {
    if ((a4 & 0x8000000000000000) != 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem(), "length", a4, 0x7FFFFFFFFFFFFFFFLL);
    if (sDefaultThreshold <= a4)
    {
      pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (NSString *)(id)objc_msgSend(v8, "mf_makeUniqueFileInDirectory:", sMFDataPath);
      v6->_path = v9;
      v10 = open(-[NSString fileSystemRepresentation](v9, "fileSystemRepresentation"), 1537, 438);
      if (v10 == -1)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Could not create cache file at %@ (%d)."), sMFDataPath, *__error());
      }
      else
      {
        v11 = v10;
        MFProtectFileDescriptor(v10, 3);
        if (write(v11, a3, a4) == -1)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured in write: (%d)"), *__error());
        close(v11);
      }
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v6->_path, 1, 0);
    }
    else
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a4);
    }
    v6->_internal = (NSData *)v7;
    if (!v7)
    {

      return 0;
    }
  }
  return v6;
}

- (MFData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4
{
  return -[MFData initWithBytesNoCopy:length:freeWhenDone:](self, "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, 1);
}

- (MFData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL8 v5;
  MFData *v8;
  uint64_t v9;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MFData;
  v8 = -[MFData init](&v11, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, v5);
    v8->_internal = (NSData *)v9;
    if (!v9)
    {

      return 0;
    }
  }
  return v8;
}

- (MFData)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  MFData *v10;
  uint64_t v11;
  objc_super v12;

  if (objc_msgSend(a3, "isFileURL"))
    return -[MFData initWithContentsOfFile:options:error:](self, "initWithContentsOfFile:options:error:", objc_msgSend(a3, "path"), a4, a5);
  v12.receiver = self;
  v12.super_class = (Class)MFData;
  v10 = -[MFData init](&v12, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", a3, a4, a5);
    v10->_internal = (NSData *)v11;
    if (!v11)
    {

      return 0;
    }
  }
  return v10;
}

- (MFData)initWithContentsOfURL:(id)a3
{
  return -[MFData initWithContentsOfURL:options:error:](self, "initWithContentsOfURL:options:error:", a3, 0, 0);
}

- (MFData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  MFData *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  objc_super v18;

  pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
  v18.receiver = self;
  v18.super_class = (Class)MFData;
  v9 = -[MFData init](&v18, sel_init);
  if (!v9)
    return v9;
  if ((a4 & 1) != 0)
  {
    v13 = objc_alloc(MEMORY[0x1E0C99D50]);
  }
  else
  {
    v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", a3, a5);
    v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB2AF0]), "unsignedIntegerValue");
    v12 = sDefaultThreshold;
    v13 = objc_alloc(MEMORY[0x1E0C99D50]);
    if (v12 <= v11)
    {
      v14 = a4 | 1;
      v15 = a3;
      goto LABEL_7;
    }
  }
  v15 = a3;
  v14 = a4;
LABEL_7:
  v16 = objc_msgSend(v13, "initWithContentsOfFile:options:error:", v15, v14, a5);
  v9->_internal = (NSData *)v16;
  if (!v16)
  {

    return 0;
  }
  return v9;
}

- (MFData)initWithContentsOfFile:(id)a3
{
  void *v5;
  unint64_t v6;
  MFData *v7;
  uint64_t v8;
  objc_super v10;

  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB2AF0]), "unsignedIntegerValue");
  if (sDefaultThreshold <= v6)
    return -[MFData initWithContentsOfFile:options:error:](self, "initWithContentsOfFile:options:error:", a3, 0, 0);
  v10.receiver = self;
  v10.super_class = (Class)MFData;
  v7 = -[MFData init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", a3);
    v7->_internal = (NSData *)v8;
    if (!v8)
    {

      return 0;
    }
  }
  return v7;
}

- (id)_initWithData:(id)a3 maybeMutable:(BOOL)a4
{
  _BOOL4 v4;
  MFData *v6;
  unint64_t v7;
  NSData *v8;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MFData;
  v6 = -[MFData init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(a3, "length");
    if (v7 >= sDefaultThreshold)
    {
      if (!objc_msgSend(a3, "mf_immutable")
        && v4
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v8 = (NSData *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBytes:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
      }
      else
      {
        v8 = (NSData *)a3;
      }
    }
    else
    {
      v8 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", a3);
    }
    v6->_internal = v8;
    if (!v8)
    {

      return 0;
    }
  }
  return v6;
}

- (MFData)initWithData:(id)a3
{
  return (MFData *)-[MFData _initWithData:maybeMutable:](self, "_initWithData:maybeMutable:", a3, 1);
}

- (MFData)initWithImmutableData:(id)a3
{
  return (MFData *)-[MFData _initWithData:maybeMutable:](self, "_initWithData:maybeMutable:", a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithData:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MFMutableData initWithData:](+[MFMutableData allocWithZone:](MFMutableData, "allocWithZone:", a3), "initWithData:", self);
}

- (void)dealloc
{
  NSObject *v3;
  NSUInteger v4;
  NSString *path;
  objc_super v6;

  if (self->_subdata && !self->_parent)
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&sWaterMarkLock);
      v4 = -[NSData length](self->_internal, "length");
      _MergedGlobals -= v4;
      os_unfair_lock_unlock((os_unfair_lock_t)&sWaterMarkLock);
    }
  }

  path = self->_path;
  if (path)
  {
    MFRemoveItemAtPath(path);

  }
  v6.receiver = self;
  v6.super_class = (Class)MFData;
  -[MFData dealloc](&v6, sel_dealloc);
}

- (unint64_t)length
{
  return -[NSData length](self->_internal, "length");
}

- (const)bytes
{
  return -[NSData bytes](self->_internal, "bytes");
}

- (id)subdataWithRange:(_NSRange)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithRange:from:retainingParent:", a3.location, a3.length, self, sDefaultThreshold <= a3.length);
}

- (id)_initWithRange:(_NSRange)a3 from:(id)a4 retainingParent:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger v9;
  MFData *v10;
  NSObject *v11;
  double Current;
  uint64_t v13;
  NSObject *v14;
  uint8_t v16[40];
  uint64_t v17;

  v5 = a5;
  length = a3.length;
  v17 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a4, "bytes") + a3.location;
  if (v5)
  {
    v10 = -[MFData initWithBytesNoCopy:length:freeWhenDone:](self, "initWithBytesNoCopy:length:freeWhenDone:", v9, length, 0);
    if (!v10)
      return v10;
    v10->_parent = (NSData *)a4;
  }
  else
  {
    v10 = -[MFData initWithBytes:length:](self, "initWithBytes:length:", v9, length);
    if (!v10)
      return v10;
  }
  v10->_subdata = 1;
  if (!v10->_parent)
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&sWaterMarkLock);
      Current = CFAbsoluteTimeGetCurrent();
      v13 = -[NSData length](v10->_internal, "length");
      _MergedGlobals += v13;
      if (_MergedGlobals >= (unint64_t)qword_1EEC3F2E0)
      {
        qword_1EEC3F2E0 = _MergedGlobals;
      }
      else if (fabs(Current) < 5.0)
      {
LABEL_13:
        os_unfair_lock_unlock((os_unfair_lock_t)&sWaterMarkLock);
        return v10;
      }
      v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[MFData _initWithRange:from:retainingParent:].cold.1(v16, -[NSData length](v10->_internal, "length"), v14);
      goto LABEL_13;
    }
  }
  return v10;
}

- (id)data
{
  return self->_internal;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  return -[MFData writeToFile:options:error:](self, "writeToFile:options:error:", a3, a4, 0);
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4
{
  return -[MFData writeToURL:options:error:](self, "writeToURL:options:error:", a3, a4, 0);
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  unint64_t v10;
  objc_super v12;

  if (self->_path
    && (v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        MFRemoveItemAtPath(a3),
        objc_msgSend(v9, "moveItemAtPath:toPath:error:", self->_path, a3, 0)))
  {
    v10 = (a4 & 0xF0000000) - 0x10000000;
    if (!(v10 >> 30))
      objc_msgSend(v9, "mf_protectFileAtPath:withClass:error:", a3, *(_QWORD *)((char *)&unk_1ABB4D550 + (v10 >> 25)), 0);

    self->_path = 0;
    return 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MFData;
    return -[MFData writeToFile:options:error:](&v12, sel_writeToFile_options_error_, a3, a4, a5);
  }
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  objc_super v10;

  if (objc_msgSend(a3, "isFileURL"))
    return -[MFData writeToFile:options:error:](self, "writeToFile:options:error:", objc_msgSend(a3, "path"), a4, a5);
  v10.receiver = self;
  v10.super_class = (Class)MFData;
  return -[MFData writeToURL:options:error:](&v10, sel_writeToURL_options_error_, a3, a4, a5);
}

- (BOOL)mf_immutable
{
  return 1;
}

- (void)_initWithRange:(uint8_t *)buf from:(uint64_t)a2 retainingParent:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;

  v4 = _MergedGlobals;
  v3 = qword_1EEC3F2E0;
  *(_DWORD *)buf = 134218496;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = v4;
  *((_WORD *)buf + 11) = 2048;
  *((_QWORD *)buf + 3) = v3;
  _os_log_debug_impl(&dword_1ABB13000, log, OS_LOG_TYPE_DEBUG, "Small subdata allocation of %lu bytes.  Current watermark is %ld bytes.  High was %lu bytes.", buf, 0x20u);
}

@end
