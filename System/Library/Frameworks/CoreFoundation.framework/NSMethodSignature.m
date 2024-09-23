@implementation NSMethodSignature

- (Class)_classForObjectAtArgumentIndex:(int64_t)a3
{
  NSMethodFrameArgInfo *v5;
  NSMethodFrameArgInfo *var0;

  if (a3 >= -1
    && (a3 < 0 || -[NSMethodSignature numberOfArguments](self, "numberOfArguments") > a3)
    && (v5 = -[NSMethodSignature _argInfo:](self, "_argInfo:", a3)) != 0
    && (*((_WORD *)v5 + 17) & 0x2000) != 0
    && (var0 = v5->var0) != 0
    && (*((_WORD *)var0 + 17) & 0x2000) != 0)
  {
    return objc_getClass(var0->var25);
  }
  else
  {
    return 0;
  }
}

- (NSUInteger)frameLength
{
  return *(unsigned int *)(_getFrameDescriptor((uint64_t)self) + 20);
}

- (NSMethodFrameArgInfo)_argInfo:(int64_t)a3
{
  NSMethodFrameArgInfo **FrameDescriptor;
  NSMethodFrameArgInfo *result;
  unint64_t v6;

  FrameDescriptor = (NSMethodFrameArgInfo **)_getFrameDescriptor((uint64_t)self);
  if (a3 == -1)
    return *FrameDescriptor;
  result = FrameDescriptor[1];
  if (a3 >= 1)
  {
    v6 = a3 + 1;
    do
    {
      result = result->var1;
      --v6;
    }
    while (v6 > 1);
  }
  return result;
}

- (NSUInteger)numberOfArguments
{
  return *(unsigned int *)(_getFrameDescriptor((uint64_t)self) + 16);
}

- (const)methodReturnType
{
  NSMethodFrameArgInfo *v2;

  v2 = -[NSMethodSignature _argInfo:](self, "_argInfo:", -1);
  if ((*((_WORD *)v2 + 17) & 0x80) != 0)
    v2 = v2->var0;
  return v2->var25;
}

- (NSUInteger)methodReturnLength
{
  NSMethodFrameArgInfo *v2;

  v2 = -[NSMethodSignature _argInfo:](self, "_argInfo:", -1);
  if ((*((_WORD *)v2 + 17) & 0x80) != 0)
    v2 = v2->var0;
  return v2->var2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *FrameDescriptor;
  uint64_t *v6;
  int v7;

  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    FrameDescriptor = (uint64_t *)_getFrameDescriptor((uint64_t)self);
    v6 = (uint64_t *)_getFrameDescriptor((uint64_t)a3);
    v7 = __NSMS6(*FrameDescriptor, *v6);
    if (v7)
      LOBYTE(v7) = __NSMS6(FrameDescriptor[1], v6[1]);
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)_isAllObjects
{
  return ((unint64_t)_getFlags((uint64_t)self) >> 1) & 1;
}

- (id)_protocolsForObjectAtArgumentIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  uint64_t v10;
  NSArray *v11;
  Protocol *Protocol;
  uint64_t v13;
  uint64_t v14;

  if (a3 < -1)
    return 0;
  v13 = v4;
  v14 = v3;
  if ((a3 & 0x8000000000000000) == 0 && -[NSMethodSignature numberOfArguments](self, "numberOfArguments") <= a3)
    return 0;
  result = -[NSMethodSignature _argInfo:](self, "_argInfo:", a3, v13, v14, v5, v6);
  if (!result)
    return result;
  if ((*((_WORD *)result + 17) & 0x2000) == 0)
    return 0;
  v10 = *(_QWORD *)result;
  if (!*(_QWORD *)result)
    return 0;
  if ((*(_WORD *)(v10 + 34) & 0x2000) != 0)
  {
    v10 = *(_QWORD *)(v10 + 8);
    if (!v10)
      return 0;
  }
  v11 = +[NSArray array](NSMutableArray, "array");
  do
  {
    Protocol = objc_getProtocol((const char *)(v10 + 37));
    if (Protocol)
      -[NSArray addObject:](v11, "addObject:", Protocol);
    v10 = *(_QWORD *)(v10 + 8);
  }
  while (v10);
  if (-[NSArray count](v11, "count"))
    return v11;
  else
    return 0;
}

- (id)_signatureForBlockAtArgumentIndex:(int64_t)a3
{
  id result;
  size_t v4;
  size_t v5;
  _BYTE v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = -[NSMethodSignature _argInfo:](self, "_argInfo:", a3);
  if (result)
  {
    if ((~*((unsigned __int16 *)result + 17) & 0xA000) != 0 || !*(_QWORD *)result)
    {
      return 0;
    }
    else
    {
      v4 = strnlen((const char *)result + 37, 0x400uLL);
      result = 0;
      if (v4 >= 7 && v4 != 1024)
      {
        v5 = v4 - 4;
        __strncpy_chk();
        v6[v5] = 0;
        return +[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", v6);
      }
    }
  }
  return result;
}

+ (NSMethodSignature)signatureWithObjCTypes:(const char *)types
{
  size_t v5;
  uint64_t v6;
  unint64_t Value;
  unint64_t v8;
  CFMutableDictionaryRef Mutable;
  NSObject *v12;
  _DWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD *v20;
  char is_memory_immutable;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  BOOL v26;
  unsigned int v27;
  __int16 v28;
  size_t v29;
  _OWORD *v30;
  size_t v31;
  NSException *v32;
  NSException *v33;
  const char *v34;
  uint64_t v35;
  char v36;
  uint64_t *v37;
  _BYTE keyCallBacks[56];
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
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!types)
    return 0;
  v5 = strlen(types);
  if (!v5)
    return 0;
  v6 = __CFSearchSignatureROM((unsigned __int8 *)types, v5);
  if (v6 != -1)
  {
    Value = (8 * (v6 & 0xFFFFFFFFFFFFFLL)) | 0x8600000000000007;
    v8 = *MEMORY[0x1E0DE7C58] ^ Value;
    if ((~v8 & 0xC000000000000007) != 0)
      return (NSMethodSignature *)(v8 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v8 & 7)));
    return (NSMethodSignature *)Value;
  }
  if (!signatureWithObjCTypes__cache)
  {
    *(_OWORD *)keyCallBacks = xmmword_1E1334478;
    *(_OWORD *)&keyCallBacks[16] = *(_OWORD *)&off_1E1334488;
    *(_OWORD *)&keyCallBacks[32] = xmmword_1E1334498;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, (const CFDictionaryKeyCallBacks *)keyCallBacks, &kCFTypeDictionaryValueCallBacks);
    while (!__ldaxr((unint64_t *)&signatureWithObjCTypes__cache))
    {
      if (!__stlxr((unint64_t)Mutable, (unint64_t *)&signatureWithObjCTypes__cache))
        goto LABEL_14;
    }
    __clrex();
    CFRelease(Mutable);
  }
LABEL_14:
  os_unfair_lock_lock_with_options();
  Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)signatureWithObjCTypes__cache, types);
  os_unfair_lock_unlock((os_unfair_lock_t)&signatureWithObjCTypes__lock);
  if (!Value)
  {
    if (_os_feature_enabled_impl())
    {
      v12 = _CFMethodSignatureROMLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)keyCallBacks = 136315138;
        *(_QWORD *)&keyCallBacks[4] = types;
        _os_log_impl(&dword_182A8C000, v12, OS_LOG_TYPE_DEFAULT, "MISS: %s", keyCallBacks, 0xCu);
      }
    }
    v34 = types;
    v51 = 0;
    v50 = 0u;
    v49 = 0u;
    v48 = 0u;
    v47 = 0u;
    v46 = 0u;
    v45 = 0u;
    v44 = 0u;
    v43 = 0u;
    v42 = 0u;
    v41 = 0u;
    v40 = 0u;
    v39 = 0u;
    memset(&keyCallBacks[24], 0, 32);
    v13 = malloc_type_calloc(1uLL, 0x18uLL, 0x102004062D53EE8uLL);
    v14 = parseFrameArgumentInfo((uint64_t *)&v34, 0, 0, 0);
    v15 = (uint64_t)v14;
    *(_QWORD *)v13 = v14;
    if (!v14)
    {
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("+[NSMethodSignature signatureWithObjCTypes:]: unsupported type encoding spec '%s'"), types);
      v32 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
      objc_exception_throw(v32);
    }
    *(_OWORD *)keyCallBacks = xmmword_182DC6F60;
    *(_QWORD *)&keyCallBacks[16] = 224;
    v16 = *((unsigned __int8 *)v14 + 36);
    v17 = (v16 - 35);
    if (v17 <= 0x31)
    {
      if (((1 << (v16 - 35)) & 0x34241A0800081) != 0)
        goto LABEL_28;
      if (v17 == 33)
      {
LABEL_52:
        v14[3] = 0x5000000010;
        v28 = -2048;
LABEL_54:
        *((_WORD *)v14 + 16) = v28;
        goto LABEL_29;
      }
    }
    if ((v16 - 105) > 0x12)
      goto LABEL_27;
    if (((1 << (v16 - 105)) & 0xD09) == 0)
    {
      if (v16 == 123)
      {
        v37 = 0;
        v36 = 0;
        if (__NSMFAIsHFA_arm64((uint64_t)v14, &v36, (unint64_t *)&v37))
        {
          v35 = 0;
          __NSMFASetRegisterOffsetsForHFA_arm64(v15, 80, &v35);
        }
        else if (*(_DWORD *)(v15 + 16) < 0x11u)
        {
          copyMemStateToFrameState(v15);
        }
        else
        {
          v29 = strlen((const char *)(v15 + 37));
          v30 = malloc_type_calloc(1uLL, v29 + 42, 0xDC283349uLL);
          *(_QWORD *)v30 = v15;
          v30[1] = xmmword_182DC6F70;
          *((_WORD *)v30 + 17) |= 0x1082u;
          *((_WORD *)v30 + 18) = 24158;
          v31 = strlen((const char *)(v15 + 37));
          memmove((char *)v30 + 38, (const void *)(v15 + 37), v31 + 1);
          copyMemStateToFrameState(*(_QWORD *)v15);
          *(_QWORD *)v13 = v30;
        }
        goto LABEL_29;
      }
LABEL_27:
      switch(*((_BYTE *)v14 + 36))
      {
        case '[':
          CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("+[NSMethodSignature signatureWithObjCTypes:]: unsupported return type encoding spec '%s'"), (char *)v14 + 37);
          v33 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
          objc_exception_throw(v33);
        case '^':
        case 'c':
          break;
        case 'd':
          goto LABEL_52;
        case 'f':
          v14[3] = 0x5000000010;
          v28 = -3072;
          goto LABEL_54;
        default:
          goto LABEL_29;
      }
    }
LABEL_28:
    v14[3] = 8;
    *((_BYTE *)v14 + 32) = 0;
    *((_BYTE *)v14 + 33) = *((_BYTE *)v14 + 16) - 8;
LABEL_29:
    if (*v34)
    {
      v18 = 0;
      do
      {
        v37 = parseFrameArgumentInfo((uint64_t *)&v34, 0, 0, 0);
        if (!v37)
          break;
        ++v13[4];
        v13[5] = computeReturnFrameExtent((uint64_t *)&v37, (uint64_t *)keyCallBacks);
        v19 = v37;
        if (!*((_QWORD *)v13 + 1))
          *((_QWORD *)v13 + 1) = v37;
        if (v18)
          v18[1] = (uint64_t)v19;
        v18 = v19;
      }
      while (*v34);
    }
    v20 = objc_alloc((Class)a1);
    v20[1] = v13;
    is_memory_immutable = _dyld_is_memory_immutable();
    v22 = (void *)types;
    if ((is_memory_immutable & 1) == 0)
      v22 = strdup(types);
    v20[2] = v22;
    v23 = v13[4];
    if (v23)
    {
      v24 = *(_QWORD *)(*((_QWORD *)v13 + 1) + 8);
      if (v23 == 1 || *(_BYTE *)(v24 + 36) != 58)
      {
        v25 = 1;
      }
      else
      {
        v24 = *(_QWORD *)(v24 + 8);
        v25 = 2;
      }
      v26 = v23 >= v25;
      v27 = v23 - v25;
      if (v27 != 0 && v26)
      {
        while ((*(_WORD *)(v24 + 34) & 0x2000) != 0)
        {
          v24 = *(_QWORD *)(v24 + 8);
          if (!--v27)
            goto LABEL_48;
        }
      }
      else
      {
LABEL_48:
        v20[3] |= 2uLL;
      }
    }
    os_unfair_lock_lock_with_options();
    Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)signatureWithObjCTypes__cache, types);
    if (!Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)signatureWithObjCTypes__cache, types, v20);
      Value = (unint64_t)v20;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&signatureWithObjCTypes__lock);

  }
  return (NSMethodSignature *)Value;
}

- (const)_cTypeString
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  char **p_typeString;

  if (((unint64_t)self & 0x8000000000000000) == 0)
    goto LABEL_12;
  v2 = 0;
  v3 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v3 = 0;
  v4 = v3 ^ (unint64_t)self;
  v5 = v4 & 7;
  do
  {
    if (v5 == *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + v2))
      break;
    ++v2;
  }
  while (v2 != 7);
  if ((~(_BYTE)v2 & 7) == 0 && ((v2 | v4) & 0x7F80000000000000) == 0x600000000000000)
  {
    v6 = v5 == 7;
    v7 = 0xFFFFFFFFFFFFFFFLL;
    if (v6)
      v7 = 0xFFFFFFFFFFFFFLL;
    p_typeString = (char **)(__CFGetSignatureROMEntryAtIndex(v7 & (v4 >> 3)) + 1);
  }
  else
  {
LABEL_12:
    p_typeString = &self->_typeString;
  }
  return *p_typeString;
}

- (const)getArgumentTypeAtIndex:(NSUInteger)idx
{
  uint64_t FrameDescriptor;
  NSMethodFrameArgInfo *v7;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;

  FrameDescriptor = _getFrameDescriptor((uint64_t)self);
  if (*(unsigned int *)(FrameDescriptor + 16) <= idx)
  {
    v9 = FrameDescriptor;
    v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: index (%lu) out of bounds [0, %ld]"), v10, idx, *(unsigned int *)(v9 + 16) - 1);
    v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v11);
  }
  v7 = -[NSMethodSignature _argInfo:](self, "_argInfo:", idx);
  if ((*((_WORD *)v7 + 17) & 0x80) != 0)
    v7 = v7->var0;
  return v7->var25;
}

- (id)_typeString
{
  uint64_t FrameDescriptor;
  const char *v3;
  const char *v4;
  size_t v5;
  const char *i;
  const char *v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  FrameDescriptor = _getFrameDescriptor((uint64_t)self);
  v3 = *(const char **)FrameDescriptor;
  if ((*(_WORD *)(*(_QWORD *)FrameDescriptor + 34) & 0x80) != 0)
    v3 = *(const char **)v3;
  v4 = v3 + 37;
  v5 = strlen(v3 + 37);
  for (i = *(const char **)(FrameDescriptor + 8); i; i = (const char *)*((_QWORD *)i + 1))
  {
    v7 = i;
    if ((*((_WORD *)i + 17) & 0x80) != 0)
      v7 = *(const char **)i;
    v5 += strlen(v7 + 37);
  }
  v8 = v5 + 1;
  if (v8 < 0x401)
  {
    if (v8)
    {
      v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v9, v8);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  strlcpy(v9, v4, v8);
  while (1)
  {
    FrameDescriptor = *(_QWORD *)(FrameDescriptor + 8);
    if (!FrameDescriptor)
      break;
    v10 = FrameDescriptor;
    if ((*(_WORD *)(FrameDescriptor + 34) & 0x80) != 0)
      v10 = *(_QWORD *)FrameDescriptor;
    strlcat(v9, (const char *)(v10 + 37), v8);
  }
  CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, 0x8000100u);
  v11 = (void *)_CFAutoreleasePoolAddObject();
  if (v8 >= 0x401)
    free(v9);
  return v11;
}

+ (void)initialize
{
  if (NSMethodSignature == a1 && *MEMORY[0x1E0DE7C50] != 0)
    _objc_registerTaggedPointerClass();
}

- (id)_initWithROMEntry:(const CFMethodSignatureROMEntry *)a3
{
  id result;
  unint64_t var2;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSMethodSignature;
  result = -[NSMethodSignature init](&v6, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a3->var0;
    var2 = a3->var2;
    *((_QWORD *)result + 2) = a3->var1;
    *((_QWORD *)result + 3) = var2;
  }
  return result;
}

- (NSMethodSignature)init
{

  return 0;
}

- (void)dealloc
{
  NSMethodFrameDescriptor *frameDescriptor;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if ((self->_flags & 4) == 0)
  {
    frameDescriptor = self->_frameDescriptor;
    if (frameDescriptor)
    {
      __NSMethodFrameArgInfoDestroy(&frameDescriptor->var0->var0);
      __NSMethodFrameArgInfoDestroy(&self->_frameDescriptor->var1->var0);
      free(self->_frameDescriptor);
    }
    if (self->_typeString)
    {
      strlen(self->_typeString);
      if ((_dyld_is_memory_immutable() & 1) == 0)
        free(self->_typeString);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSMethodSignature;
  -[NSMethodSignature dealloc](&v4, sel_dealloc);
}

- (BOOL)isOneway
{
  return ((unsigned __int16)-[NSMethodSignature _argInfo:](self, "_argInfo:", -1)[34] >> 5) & 1;
}

- (BOOL)_isHiddenStructRet
{
  return ((unsigned __int16)-[NSMethodSignature _argInfo:](self, "_argInfo:", -1)[34] >> 6) & 1;
}

- (BOOL)_isBlock
{
  return (int64_t)-[NSMethodSignature numberOfArguments](self, "numberOfArguments") >= 1
      && (__int16)-[NSMethodSignature _argInfo:](self, "_argInfo:", 0)[34] < 0;
}

- (unint64_t)hash
{
  _QWORD **FrameDescriptor;
  _QWORD *v3;

  FrameDescriptor = (_QWORD **)_getFrameDescriptor((uint64_t)self);
  v3 = __NSMS5(*FrameDescriptor);
  return (unint64_t)v3 + (_QWORD)__NSMS5(FrameDescriptor[1]);
}

- (id)debugDescription
{
  uint64_t FrameDescriptor;
  CFMutableStringRef Mutable;
  id v5;
  const char *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  FrameDescriptor = _getFrameDescriptor((uint64_t)self);
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  v11.receiver = self;
  v11.super_class = (Class)NSMethodSignature;
  v5 = -[NSObject description](&v11, sel_description);
  if ((*(_WORD *)(*(_QWORD *)FrameDescriptor + 34) & 0x40) != 0)
    v6 = "YES";
  else
    v6 = "NO";
  -[__CFString appendFormat:](Mutable, "appendFormat:", CFSTR("%@\n    number of arguments = %d\n    frame size = %d\n    is special struct return? %s\n"), v5, *(unsigned int *)(FrameDescriptor + 16), *(unsigned int *)(FrameDescriptor + 20), v6);
  -[__CFString appendFormat:](Mutable, "appendFormat:", CFSTR("    return value: -------- -------- -------- --------\n"));
  v7 = *(uint64_t **)FrameDescriptor;
  if ((*(_WORD *)(*(_QWORD *)FrameDescriptor + 34) & 0x80) != 0)
    v7 = (uint64_t *)*v7;
  __NSMS7(Mutable, v7, 2);
  v8 = *(uint64_t **)(FrameDescriptor + 8);
  if (v8)
  {
    v9 = 0;
    do
    {
      -[__CFString appendFormat:](Mutable, "appendFormat:", CFSTR("    argument %ld: -------- -------- -------- --------\n"), v9);
      __NSMS7(Mutable, v8, 2);
      ++v9;
      v8 = (uint64_t *)v8[1];
    }
    while (v8);
  }
  return Mutable;
}

@end
