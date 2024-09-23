@implementation __NSPlaceholderOrderedSet

- (__NSPlaceholderOrderedSet)init
{
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    return -[__NSPlaceholderOrderedSet initWithObjects:count:](&___immutablePlaceholderOrderedSet, "initWithObjects:count:", 0, 0);
  if (self == (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
    return -[__NSPlaceholderOrderedSet initWithCapacity:](&___mutablePlaceholderOrderedSet, "initWithCapacity:", 0);
  __break(1u);
  return self;
}

- (__NSPlaceholderOrderedSet)initWithCapacity:(unint64_t)a3
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
    *(_QWORD *)(v6 + 4) = "-[__NSPlaceholderOrderedSet initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(_QWORD *)(v6 + 14) = a3;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: capacity (%lu) is ridiculous"), "-[__NSPlaceholderOrderedSet initWithCapacity:]", a3);
    v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    objc_exception_throw(v7);
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
  {
    -[NSObject doesNotRecognizeSelector:](&___immutablePlaceholderOrderedSet, "doesNotRecognizeSelector:", a2);
LABEL_7:
    __break(1u);
  }
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
    goto LABEL_7;
  return (__NSPlaceholderOrderedSet *)__NSOrderedSetM_new(0, a3, 0);
}

- (__NSPlaceholderOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSException *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4)
  {
    v6 = _os_log_pack_size();
    v8 = (char *)v17 - ((MEMORY[0x1E0C80A78](v6, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "-[__NSPlaceholderOrderedSet initWithObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSPlaceholderOrderedSet initWithObjects:count:]", a4);
    goto LABEL_17;
  }
  if (a4 >> 61)
  {
    v6 = _os_log_pack_size();
    v8 = (char *)v17 - ((MEMORY[0x1E0C80A78](v6, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "-[__NSPlaceholderOrderedSet initWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSPlaceholderOrderedSet initWithObjects:count:]", a4);
    goto LABEL_17;
  }
  if (a4)
  {
    v4 = 0;
    while (a3[v4])
    {
      if (a4 == ++v4)
      {
        if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
          return (__NSPlaceholderOrderedSet *)__NSOrderedSetI_new((uint64_t)a3, a4, 0);
LABEL_11:
        if (self == (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
          return (__NSPlaceholderOrderedSet *)__NSOrderedSetM_new((id *)a3, a4, 0);
        __break(1u);
        return self;
      }
    }
    v5 = v4;
    v6 = _os_log_pack_size();
    v8 = (char *)v17 - ((MEMORY[0x1E0C80A78](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)(v9 + 4) = "-[__NSPlaceholderOrderedSet initWithObjects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v9 + 14) = v5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[__NSPlaceholderOrderedSet initWithObjects:count:]", v5);
LABEL_17:
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v6);
    objc_exception_throw(v10);
  }
  if (self != (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    goto LABEL_11;
  if (initWithObjects_count__static_init != -1)
    dispatch_once(&initWithObjects_count__static_init, &__block_literal_global_37);
  return (__NSPlaceholderOrderedSet *)(id)initWithObjects_count____NSOrderedSet0__;
}

- (unint64_t)retainCount
{
  return -1;
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
  v5 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v6 = "immutable";
  else
    v6 = v4;
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v7 = "NSOrderedSet";
  else
    v7 = v5;
  v8 = __CFLookUpClass(v7);
  v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s ordered set object"), v9, v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v10);
}

- (unint64_t)indexOfObject:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_class *v9;
  uint64_t v10;
  NSException *v11;

  v5 = "mutable";
  v6 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v8 = "NSOrderedSet";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s ordered set object"), v10, v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v11);
}

- (id)objectAtIndex:(unint64_t)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_class *v9;
  uint64_t v10;
  NSException *v11;

  v5 = "mutable";
  v6 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v8 = "NSOrderedSet";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s ordered set object"), v10, v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v11);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_class *v10;
  uint64_t v11;
  NSException *v12;

  v6 = "mutable";
  v7 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    v6 = "<unknown>";
    v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v8 = "immutable";
  else
    v8 = v6;
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v9 = "NSOrderedSet";
  else
    v9 = v7;
  v10 = __CFLookUpClass(v9);
  v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s ordered set object"), v11, v8);
  v12 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v12);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_class *v9;
  uint64_t v10;
  NSException *v11;

  v5 = "mutable";
  v6 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v8 = "NSOrderedSet";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s ordered set object"), v10, v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v11);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_class *v10;
  uint64_t v11;
  NSException *v12;

  v6 = "mutable";
  v7 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    v6 = "<unknown>";
    v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v8 = "immutable";
  else
    v8 = v6;
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
    v9 = "NSOrderedSet";
  else
    v9 = v7;
  v10 = __CFLookUpClass(v9);
  v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s ordered set object"), v11, v8);
  v12 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v12);
}

@end
