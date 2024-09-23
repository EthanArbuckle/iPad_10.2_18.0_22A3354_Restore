@implementation NSObject(NSObject)

- (CFTypeRef)_copyDescription
{
  void *v2;
  const void *v3;
  CFTypeRef v4;

  v2 = (void *)MEMORY[0x186DB02F4]();
  v3 = (const void *)objc_msgSend(a1, "description");
  if (v3)
    v4 = CFRetain(v3);
  else
    v4 = 0;
  _CFAutoreleasePoolPop(v2);
  return v4;
}

- (uint64_t)description
{
  objc_class *v2;
  const char *Name;

  v2 = (objc_class *)objc_opt_class();
  Name = class_getName(v2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("<%s: %p>"), Name, a1);
  return _CFAutoreleasePoolAddObject();
}

+ (uint64_t)description
{
  const char *Name;

  Name = class_getName(a1);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%s"), Name);
  return _CFAutoreleasePoolAddObject();
}

+ (NSMethodSignature)methodSignatureForSelector:()NSObject
{
  objc_class *Class;
  uint64_t v5;

  if (a3 && (Class = object_getClass(a1), __methodDescriptionForSelector(Class, a3)))
    return +[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", v5);
  else
    return 0;
}

+ (NSMethodSignature)instanceMethodSignatureForSelector:()NSObject
{
  uint64_t v3;

  if (name && __methodDescriptionForSelector(a1, name))
    return +[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", v3);
  else
    return 0;
}

- (NSMethodSignature)methodSignatureForSelector:()NSObject
{
  objc_class *v4;
  uint64_t v5;

  if (a3 && (v4 = (objc_class *)objc_opt_class(), __methodDescriptionForSelector(v4, a3)))
    return +[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", v5);
  else
    return 0;
}

+ (uint64_t)load
{
  return _objc_setBadAllocHandler();
}

+ (void)doesNotRecognizeSelector:()NSObject
{
  const char *Name;
  const char *v6;
  uint64_t v7;
  int is_memory_immutable;
  int v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  NSException *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (cls)
  {
    Name = class_getName(cls);
    if (sel)
      goto LABEL_3;
  }
  else
  {
    Name = "(null class)";
    if (sel)
    {
LABEL_3:
      v6 = sel_getName(sel);
      goto LABEL_6;
    }
  }
  v6 = "(null selector)";
LABEL_6:
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("+[%s %s]: unrecognized selector sent to class %p"), Name, v6, cls);
  v7 = _CFAutoreleasePoolAddObject();
  strlen(Name);
  is_memory_immutable = _dyld_is_memory_immutable();
  strlen(v6);
  v9 = _dyld_is_memory_immutable();
  v10 = _os_log_pack_size();
  v11 = _os_log_pack_fill();
  if (is_memory_immutable)
    v12 = Name;
  else
    v12 = "(dynamic class)";
  if (v9)
    v13 = v6;
  else
    v13 = "(dynamic selector)";
  v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), v7, 0, (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v10, __os_log_helper_1_2_3_8_32_8_32_8_0(v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)cls));
  objc_exception_throw(v14);
}

- (void)doesNotRecognizeSelector:()NSObject
{
  objc_class *v5;
  const char *Name;
  const char *v7;
  uint64_t v8;
  int is_memory_immutable;
  int v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  NSException *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    Name = class_getName(v5);
    if (a3)
      goto LABEL_3;
  }
  else
  {
    Name = "(null class)";
    if (a3)
    {
LABEL_3:
      v7 = sel_getName(a3);
      goto LABEL_6;
    }
  }
  v7 = "(null selector)";
LABEL_6:
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("-[%s %s]: unrecognized selector sent to instance %p"), Name, v7, a1);
  v8 = _CFAutoreleasePoolAddObject();
  strlen(Name);
  is_memory_immutable = _dyld_is_memory_immutable();
  strlen(v7);
  v10 = _dyld_is_memory_immutable();
  v11 = _os_log_pack_size();
  v12 = _os_log_pack_fill();
  if (is_memory_immutable)
    v13 = Name;
  else
    v13 = "(dynamic class)";
  if (v10)
    v14 = v7;
  else
    v14 = "(dynamic selector)";
  v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), v8, 0, (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11, __os_log_helper_1_2_3_8_32_8_32_8_0(v12, (uint64_t)v13, (uint64_t)v14, a1));
  objc_exception_throw(v15);
}

+ (CFTypeRef)_copyDescription
{
  void *v2;
  const void *v3;
  CFTypeRef v4;

  v2 = (void *)MEMORY[0x186DB02F4]();
  v3 = (const void *)objc_msgSend(a1, "description");
  if (v3)
    v4 = CFRetain(v3);
  else
    v4 = 0;
  _CFAutoreleasePoolPop(v2);
  return v4;
}

- (uint64_t)__retain_OA
{
  uint64_t v0;

  v0 = _objc_rootRetain();
  __CFRecordAllocationEvent();
  return v0;
}

- (uint64_t)___tryRetain_OA
{
  uint64_t v0;

  v0 = _objc_rootTryRetain();
  if ((_DWORD)v0)
    __CFRecordAllocationEvent();
  return v0;
}

- (uint64_t)__release_OA
{
  __CFRecordAllocationEvent();
  return _objc_rootRelease();
}

- (uint64_t)__autorelease_OA
{
  return _CFAutoreleasePoolAddObject();
}

+ (void)__allocWithZone_OA:()NSObject
{
  void *v0;
  void *v1;

  v0 = (void *)_objc_rootAllocWithZone();
  v1 = v0;
  if (v0)
  {
    object_getClassName(v0);
    __CFSetLastAllocationEventName();
  }
  return v1;
}

- (void)__dealloc_zombie
{
  objc_class *Class;
  const char *v3;
  objc_class *v4;
  objc_class *v5;
  char *name[2];

  name[1] = *(char **)MEMORY[0x1E0C80C00];
  if ((a1 & 0x8000000000000000) == 0)
  {
    if (__CFZombieEnabled)
    {
      Class = object_getClass((id)a1);
      name[0] = 0;
      v3 = class_getName(Class);
      asprintf(name, "_NSZombie_%s", v3);
      v4 = objc_lookUpClass(name[0]);
      if (!v4)
      {
        v5 = objc_lookUpClass("_NSZombie_");
        v4 = objc_duplicateClass(v5, name[0], 0);
      }
      free(name[0]);
      objc_destructInstance((id)a1);
      object_setClass((id)a1, v4);
      if (__CFDeallocateZombies)
        free((void *)a1);
    }
    else
    {
      _objc_rootDealloc();
    }
  }
}

+ (objc_class)init
{
  const char *Name;
  NSException *v4;

  if (_CFExecutableLinkedOnOrAfter(6uLL))
  {
    Name = class_getName(a1);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** +[%s<%p> init]: cannot init a class object."), Name, a1);
    v4 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v4);
  }
  return a1;
}

+ (void)dealloc
{
  const char *Name;
  NSException *v3;

  Name = class_getName(a1);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** +[%s<%p> dealloc]: cannot dealloc a class object."), Name, a1);
  v3 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v3);
}

@end
