@implementation __NSPlaceholderSet

- (__NSPlaceholderSet)init
{
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    return -[__NSPlaceholderSet initWithObjects:count:](&___immutablePlaceholderSet, "initWithObjects:count:", 0, 0);
  if (self == (__NSPlaceholderSet *)&___mutablePlaceholderSet)
    return -[__NSPlaceholderSet initWithCapacity:](&___mutablePlaceholderSet, "initWithCapacity:", 0);
  __break(1u);
  return self;
}

- (__NSPlaceholderSet)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  _BOOL8 v4;
  __objc2_class *v7;
  BOOL v8;
  objc_super v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  if (a4)
    goto LABEL_12;
  v7 = (__objc2_class *)objc_opt_class();
  v8 = v7 == __NSSetI || v7 == __NSSetM;
  if (!v8 && v7 != __NSFrozenSetM)
    goto LABEL_12;
  if (self == (__NSPlaceholderSet *)&___mutablePlaceholderSet)
    return (__NSPlaceholderSet *)objc_msgSend(a3, "mutableCopyWithZone:", 0);
  if (self != (__NSPlaceholderSet *)&___immutablePlaceholderSet)
  {
LABEL_12:
    v11.receiver = self;
    v11.super_class = (Class)__NSPlaceholderSet;
    return -[NSSet initWithSet:copyItems:](&v11, sel_initWithSet_copyItems_, a3, v4);
  }
  return (__NSPlaceholderSet *)objc_msgSend(a3, "copyWithZone:", 0);
}

- (__NSPlaceholderSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSException *v9;
  uint64_t v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4)
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v11 + 4) = "-[__NSPlaceholderSet initWithObjects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSPlaceholderSet initWithObjects:count:]", a4);
    goto LABEL_17;
  }
  if (a4 >> 61)
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "-[__NSPlaceholderSet initWithObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSPlaceholderSet initWithObjects:count:]", a4);
    goto LABEL_17;
  }
  if (a4)
  {
    v4 = 0;
    while (a3[v4])
    {
      if (a4 == ++v4)
        goto LABEL_8;
    }
    v5 = v4;
    v6 = _os_log_pack_size();
    v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315394;
    *(_QWORD *)(v8 + 4) = "-[__NSPlaceholderSet initWithObjects:count:]";
    *(_WORD *)(v8 + 12) = 2048;
    *(_QWORD *)(v8 + 14) = v5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[__NSPlaceholderSet initWithObjects:count:]", v5);
LABEL_17:
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v7, v6);
    objc_exception_throw(v9);
  }
LABEL_8:
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
  {
    if (a4 == 1)
    {
      return (__NSPlaceholderSet *)__NSSingleObjectSetI_new((uint64_t)*a3, 0);
    }
    else if (a4)
    {
      return (__NSPlaceholderSet *)__NSSetI_new((uint64_t *)a3, 0, a4, 0);
    }
    else
    {
      return (__NSPlaceholderSet *)(id)__NSSet0__;
    }
  }
  else if (self == (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    return (__NSPlaceholderSet *)__NSSetM_new((uint64_t)a3, a4, 0);
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (__NSPlaceholderSet)initWithCapacity:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  NSException *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3 >> 61)
  {
    v5 = _os_log_pack_size();
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136315394;
    *(_QWORD *)(v6 + 4) = "-[__NSPlaceholderSet initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(_QWORD *)(v6 + 14) = a3;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: capacity (%lu) is ridiculous"), "-[__NSPlaceholderSet initWithCapacity:]", a3);
    v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    objc_exception_throw(v7);
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
  {
    -[NSObject doesNotRecognizeSelector:](&___immutablePlaceholderSet, "doesNotRecognizeSelector:", a2);
LABEL_7:
    __break(1u);
  }
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
    goto LABEL_7;
  return (__NSPlaceholderSet *)__NSSetM_new(0, a3, 0);
}

+ (void)initialize
{
  if (__NSPlaceholderSet == a1)
    __NSSet0__ = (uint64_t)__NSSetI_new(0, 0, 0, 0);
}

- (unint64_t)count
{
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_class *v8;
  uint64_t v9;
  NSException *v10;

  v4 = "mutable";
  v5 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v6 = "immutable";
  else
    v6 = v4;
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v7 = "NSSet";
  else
    v7 = v5;
  v8 = __CFLookUpClass(v7);
  v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s set object"), v9, v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v10);
}

- (id)member:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_class *v9;
  uint64_t v10;
  NSException *v11;

  v5 = "mutable";
  v6 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v8 = "NSSet";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s set object"), v10, v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v11);
}

- (id)objectEnumerator
{
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_class *v8;
  uint64_t v9;
  NSException *v10;

  v4 = "mutable";
  v5 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v6 = "immutable";
  else
    v6 = v4;
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v7 = "NSSet";
  else
    v7 = v5;
  v8 = __CFLookUpClass(v7);
  v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s set object"), v9, v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v10);
}

- (void)addObject:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_class *v9;
  uint64_t v10;
  NSException *v11;

  v5 = "mutable";
  v6 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v8 = "NSSet";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s set object"), v10, v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v11);
}

- (void)removeObject:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_class *v9;
  uint64_t v10;
  NSException *v11;

  v5 = "mutable";
  v6 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
    v8 = "NSSet";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s set object"), v10, v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v11);
}

- (unint64_t)retainCount
{
  return -1;
}

@end
