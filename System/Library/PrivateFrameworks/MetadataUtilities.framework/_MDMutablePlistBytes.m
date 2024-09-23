@implementation _MDMutablePlistBytes

- (_MDMutablePlistBytes)initWithCapacity:(unint64_t)a3 useMalloc:(BOOL)a4
{
  return -[_MDMutablePlistBytes initWithCapacity:useMalloc:zone:](self, "initWithCapacity:useMalloc:zone:", a3, a4, malloc_default_zone());
}

- (_MDMutablePlistBytes)initWithCapacity:(unint64_t)a3 useMalloc:(BOOL)a4 zone:(_malloc_zone_t *)a5
{
  _MDMutablePlistBytes *v8;
  _MDMutablePlistBytes *v9;
  unint64_t v10;
  size_t v11;
  char v12;
  int v13;
  int v14;
  NSObject *v15;
  unint64_t *byteVector;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_MDMutablePlistBytes;
  v8 = -[_MDMutablePlistBytes init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->super._zone = a5;
    v10 = (a3 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8];
    if (!a3)
      v10 = 2 * *MEMORY[0x1E0C85AD8];
    if (v10 >= 0x70000000)
      v11 = 1879048192;
    else
      v11 = v10;
    v8->super._byteVectorCapacity = v11;
    if (a4)
    {
      v8->super._byteVector = (unint64_t)malloc_type_zone_malloc(a5, v11, 0x34F65F98uLL);
      v12 = 8;
LABEL_14:
      *((_BYTE *)&v9->super + 34) = *((_BYTE *)&v9->super + 34) & 0xF7 | v12;
      v9->super._deallocator = &__block_literal_global_98;
      v9->super._uidCapacity = 256;
      v9->super._uidVector = (unint64_t *)malloc_type_valloc(0x800uLL, 0x100004000313F17uLL);
      v9->_currentUID = -1;
      byteVector = (unint64_t *)v9->super._byteVector;
      v9->_fillPtr = byteVector;
      v9->_limitPtr = (unint64_t *)((char *)byteVector + v9->super._byteVectorCapacity);
      v9->_rleTagPtr = 0;
      *((_BYTE *)&v9->super + 34) |= 1u;
      return v9;
    }
    v13 = _fast_vm_allocate(&v8->super._byteVector, v11, -251658239);
    if (!v13)
    {
      v12 = 0;
      goto LABEL_14;
    }
    v14 = v13;
    v15 = _MDLogForCategoryDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_MDMutablePlistBytes initWithCapacity:useMalloc:zone:].cold.1(v14, v15);

    return 0;
  }
  return v9;
}

+ (__MDPlistBytes)createArrayPlistBytesUsingBlock:(id)a3
{
  _MDMutablePlistBytes *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = -[_MDMutablePlistBytes initWithCapacity:useMalloc:]([_MDMutablePlistBytes alloc], "initWithCapacity:useMalloc:", 0, 0);
  if (!v4)
    +[_MDPlistBytes createPlistBytes:].cold.1(0, v5, v6);
  v7 = (uint64_t)v4;
  CFRetain(v4);

  _MDPlistBytesBeginPlist(v7);
  _MDPlistBytesBeginContainer(v7, 10);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v7);
  _MDPlistBytesEndContainer(v7);
  _MDPlistBytesEndPlist(v7);
  if (*(_WORD *)(v7 + 32))
  {
    CFRelease((CFTypeRef)v7);
    return 0;
  }
  return (__MDPlistBytes *)v7;
}

+ (__MDPlistBytes)createDictionaryPlistBytesUsingBlock:(id)a3
{
  _MDMutablePlistBytes *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = -[_MDMutablePlistBytes initWithCapacity:useMalloc:]([_MDMutablePlistBytes alloc], "initWithCapacity:useMalloc:", 0, 0);
  if (!v4)
    +[_MDPlistBytes createPlistBytes:].cold.1(0, v5, v6);
  v7 = (uint64_t)v4;
  CFRetain(v4);

  _MDPlistBytesBeginPlist(v7);
  _MDPlistBytesBeginContainer(v7, 13);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v7);
  _MDPlistBytesEndContainer(v7);
  _MDPlistBytesEndPlist(v7);
  if (*(_WORD *)(v7 + 32))
  {
    CFRelease((CFTypeRef)v7);
    return 0;
  }
  return (__MDPlistBytes *)v7;
}

- (_MDMutablePlistBytes)initWithCapacity:(unint64_t)a3
{
  return -[_MDMutablePlistBytes initWithCapacity:useMalloc:zone:](self, "initWithCapacity:useMalloc:zone:", a3, 0, malloc_default_zone());
}

- (void)initWithCapacity:(int)a1 useMalloc:(NSObject *)a2 zone:.cold.1(int a1, NSObject *a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5[0] = 67109376;
  v5[1] = v4;
  v6 = 1024;
  v7 = a1;
  _os_log_error_impl(&dword_1A09DA000, a2, OS_LOG_TYPE_ERROR, "PlistBytes initWithCapacity mmap err:%d kr:%d", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_3_2();
}

@end
