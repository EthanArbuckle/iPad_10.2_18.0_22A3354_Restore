@implementation _PFEvanescentData

- (_PFEvanescentData)initWithURL:(id)a3
{
  _PFEvanescentData *v4;
  id v5;
  int v6;
  objc_class *v7;
  const char *Name;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  stat v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_PFEvanescentData;
  v4 = -[_PFEvanescentData init](&v17, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v4->_openfd = -1;
    memset(&v16, 0, sizeof(v16));
    v6 = stat((const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation"), &v16);
    __error();
    if (v6)
    {
      v7 = (objc_class *)objc_opt_class();
      Name = class_getName(v7);
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to initialize %s.  stat() failed on '%s' with errno %d"), v9, v10, v11, v12, v13, v14, (uint64_t)Name);

      v4 = 0;
    }
    else
    {
      v4->_length = v16.st_size;
      v4->_fileURL = (NSURL *)a3;
    }
    objc_msgSend(v5, "drain");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[_PFEvanescentData _destroyMapping]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)_PFEvanescentData;
  -[_PFEvanescentData dealloc](&v3, sel_dealloc);
}

- (uint64_t)_destroyMapping
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 32);
    if (v2)
    {
      munmap(v2, *(_QWORD *)(v1 + 8));
      *(_QWORD *)(v1 + 32) = 0;
    }
    result = *(unsigned int *)(v1 + 24);
    if ((result & 0x80000000) == 0)
    {
      result = close(result);
      *(_DWORD *)(v1 + 24) = -1;
    }
  }
  return result;
}

- (_PFEvanescentData)initWithPath:(id)a3
{
  return -[_PFEvanescentData initWithURL:](self, "initWithURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *Name;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("NSData [%s] with address %p backed by file at '%@'"), Name, self, -[_PFEvanescentData url]((id *)&self->super.super.isa));
}

- (id)url
{
  if (result)
    return (id *)result[2];
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (uint64_t)_openMapping
{
  uint64_t v1;
  int v2;
  void *v3;
  int *v4;
  id v5;
  int v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 32))
      goto LABEL_8;
    v2 = *(_DWORD *)(result + 24);
    if (v2 < 0)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v6 = open((const char *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "path"), "fileSystemRepresentation"), 0);
      if (v6 < 0)
      {
        v20 = *__error();
        objc_msgSend(v5, "drain");
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v11 = (void *)*MEMORY[0x1E0CB2FE0];
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = objc_msgSend(*(id *)(v1 + 16), "path");
        v24 = objc_msgSend(v21, "errorWithDomain:code:userInfo:", v11, v20, objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, *MEMORY[0x1E0CB2AA0], 0));
        v25 = *MEMORY[0x1E0C99768];
        v16 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v24, CFSTR("NSCoreDataPrimaryError"));
        v17 = CFSTR("Could not open file.");
        v18 = v25;
        v19 = v20;
        goto LABEL_15;
      }
      *(_DWORD *)(v1 + 24) = v6;
      objc_msgSend(v5, "drain");
      if (*(_QWORD *)(v1 + 32))
      {
LABEL_8:
        v7 = (unsigned int *)(v1 + 40);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
        return *(_QWORD *)(v1 + 32);
      }
      v2 = *(_DWORD *)(v1 + 24);
    }
    v3 = mmap(0, *(_QWORD *)(v1 + 8), 1, 1, v2, 0);
    v4 = __error();
    if (v3)
    {
      *(_QWORD *)(v1 + 32) = v3;
      goto LABEL_8;
    }
    v9 = *v4;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = (void *)*MEMORY[0x1E0CB2FE0];
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = objc_msgSend(*(id *)(v1 + 16), "path");
    v14 = objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v9, objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E0CB2AA0], 0));
    v15 = *MEMORY[0x1E0C99768];
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v14, CFSTR("NSCoreDataPrimaryError"));
    v17 = CFSTR("Could not map file.");
    v18 = v15;
    v19 = v9;
LABEL_15:
    v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v18, v19, (uint64_t)v17, v16);
    -[_NSCoreDataException _setDomain:]((uint64_t)v26, v11);
    objc_exception_throw(v26);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  if (a3)
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
      return objc_msgSend(-[_PFEvanescentData url]((id *)&self->super.super.isa), "isEqual:", *((id *)a3 + 2));
  }
  return 0;
}

- (unint64_t)hash
{
  return objc_msgSend(-[_PFEvanescentData url]((id *)&self->super.super.isa), "hash");
}

- (void)enumerateByteRangesUsingBlock:(id)a3
{
  uint64_t v5;
  int *p_mapRefCount;
  unsigned int v7;
  BOOL v8;
  signed int v9;
  char v10;

  v10 = 0;
  v5 = -[_PFEvanescentData _openMapping]((uint64_t)self);
  if (v5)
    (*((void (**)(id, uint64_t, _QWORD, unint64_t, char *))a3 + 2))(a3, v5, 0, -[_PFEvanescentData length](self, "length"), &v10);
  if (self)
  {
    p_mapRefCount = &self->_mapRefCount;
    do
    {
      v7 = __ldxr((unsigned int *)p_mapRefCount);
      v8 = __OFSUB__(v7, 1);
      v9 = v7 - 1;
    }
    while (__stxr(v9, (unsigned int *)p_mapRefCount));
    if ((v9 < 0) ^ v8 | (v9 == 0))
      -[_PFEvanescentData _destroyMapping]((uint64_t)self);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int *p_mapRefCount;
  unsigned int v6;
  BOOL v7;
  signed int v8;

  v4 = (void *)-[_PFEvanescentData _openMapping]((uint64_t)self);
  if (v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v4, -[_PFEvanescentData length](self, "length"));
  if (self)
  {
    p_mapRefCount = &self->_mapRefCount;
    do
    {
      v6 = __ldxr((unsigned int *)p_mapRefCount);
      v7 = __OFSUB__(v6, 1);
      v8 = v6 - 1;
    }
    while (__stxr(v8, (unsigned int *)p_mapRefCount));
    if ((v8 < 0) ^ v7 | (v8 == 0))
      -[_PFEvanescentData _destroyMapping]((uint64_t)self);
  }
  return v4;
}

- (const)bytes
{
  id v2;
  const void *v3;
  id v4;

  v2 = -[_PFEvanescentData copyWithZone:](self, "copyWithZone:", 0);
  v3 = (const void *)objc_msgSend(v2, "bytes");
  v4 = v2;
  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)getBytes:(void *)a3
{
  -[_PFEvanescentData getBytes:length:](self, "getBytes:length:", a3, -[_PFEvanescentData length](self, "length"));
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  -[_PFEvanescentData getBytes:range:](self, "getBytes:range:", a3, 0, a4);
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  size_t length;
  NSUInteger location;
  uint64_t v8;
  int *p_mapRefCount;
  unsigned int v10;
  BOOL v11;
  signed int v12;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = -[_PFEvanescentData _openMapping]((uint64_t)self);
    if (v8)
      memmove(a3, (const void *)(v8 + location), length);
    if (self)
    {
      p_mapRefCount = &self->_mapRefCount;
      do
      {
        v10 = __ldxr((unsigned int *)p_mapRefCount);
        v11 = __OFSUB__(v10, 1);
        v12 = v10 - 1;
      }
      while (__stxr(v12, (unsigned int *)p_mapRefCount));
      if ((v12 < 0) ^ v11 | (v12 == 0))
        -[_PFEvanescentData _destroyMapping]((uint64_t)self);
    }
  }
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;

  if (!a3.length)
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3.location);
  length = a3.length;
  location = a3.location;
  v6 = malloc_type_malloc(a3.length, 0xB0167C6AuLL);
  -[_PFEvanescentData getBytes:range:](self, "getBytes:range:", v6, location, length);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v6, length, 1);
}

@end
