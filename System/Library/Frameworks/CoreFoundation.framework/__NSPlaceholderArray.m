@implementation __NSPlaceholderArray

- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5
{
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    return __NSArrayI_transferNew(a3, a4);
  if (self == (__NSPlaceholderArray *)&___mutablePlaceholderArray)
    return __NSArrayM_transferNew(a3, a4, a5);
  return 0;
}

- (__NSPlaceholderArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
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
    *(_QWORD *)(v11 + 4) = "-[__NSPlaceholderArray initWithObjects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSPlaceholderArray initWithObjects:count:]", a4);
    goto LABEL_17;
  }
  if (a4 >> 61)
  {
    v6 = _os_log_pack_size();
    v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "-[__NSPlaceholderArray initWithObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSPlaceholderArray initWithObjects:count:]", a4);
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
    *(_QWORD *)(v8 + 4) = "-[__NSPlaceholderArray initWithObjects:count:]";
    *(_WORD *)(v8 + 12) = 2048;
    *(_QWORD *)(v8 + 14) = v5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[__NSPlaceholderArray initWithObjects:count:]", v5);
LABEL_17:
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v7, v6);
    objc_exception_throw(v9);
  }
LABEL_8:
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
  {
    if (a4 == 1)
    {
      return (__NSPlaceholderArray *)__NSSingleObjectArrayI_new((uint64_t)*a3, 0);
    }
    else if (a4)
    {
      return (__NSPlaceholderArray *)__NSArrayI_new((id *)a3, 0, a4, 0);
    }
    else
    {
      return (__NSPlaceholderArray *)&__NSArray0__struct;
    }
  }
  else if (self == (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    return (__NSPlaceholderArray *)__NSArrayM_new(a3, a4, 0);
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (__NSPlaceholderArray)init
{
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    return -[__NSPlaceholderArray initWithObjects:count:](&___immutablePlaceholderArray, "initWithObjects:count:", 0, 0);
  if (self == (__NSPlaceholderArray *)&___mutablePlaceholderArray)
    return -[__NSPlaceholderArray initWithCapacity:](&___mutablePlaceholderArray, "initWithCapacity:", 0);
  __break(1u);
  return self;
}

- (__NSPlaceholderArray)initWithCapacity:(unint64_t)a3
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
    *(_QWORD *)(v6 + 4) = "-[__NSPlaceholderArray initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(_QWORD *)(v6 + 14) = a3;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: capacity (%lu) is ridiculous"), "-[__NSPlaceholderArray initWithCapacity:]", a3);
    v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    objc_exception_throw(v7);
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
  {
    -[NSObject doesNotRecognizeSelector:](&___immutablePlaceholderArray, "doesNotRecognizeSelector:", a2);
LABEL_7:
    __break(1u);
  }
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
    goto LABEL_7;
  return (__NSPlaceholderArray *)__NSArrayM_new(0, a3, 0);
}

- (__NSPlaceholderArray)initWithArray:(id)a3 copyItems:(BOOL)a4
{
  _BOOL8 v4;
  __NSPlaceholderArray *result;
  objc_super v8;
  uint64_t v9;

  v4 = a4;
  v9 = *MEMORY[0x1E0C80C00];
  if (a4 || (result = (__NSPlaceholderArray *)__initWithArrayDontCopyItems((__objc2_class **)self, a3)) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)__NSPlaceholderArray;
    return -[NSArray initWithArray:copyItems:](&v8, sel_initWithArray_copyItems_, a3, v4);
  }
  return result;
}

- (__NSPlaceholderArray)initWithArray:(id)a3
{
  __NSPlaceholderArray *result;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = (__NSPlaceholderArray *)__initWithArrayDontCopyItems((__objc2_class **)self, a3);
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)__NSPlaceholderArray;
    return -[NSArray initWithArray:copyItems:](&v6, sel_initWithArray_copyItems_, a3, 0);
  }
  return result;
}

- (__NSPlaceholderArray)initWithContentsOfFile:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSString((uint64_t)a3) & 1) == 0)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[__NSPlaceholderArray initWithContentsOfFile:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: string argument is not an NSString"), "-[__NSPlaceholderArray initWithContentsOfFile:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:immutable:](NSArray, "newWithContentsOf:immutable:", a3, self == (__NSPlaceholderArray *)&___immutablePlaceholderArray);
}

- (__NSPlaceholderArray)initWithContentsOfURL:(id)a3
{
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (atomic_load(&initWithContentsOfURL____cls_NSURL))
  {
    if (!a3)
      return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:immutable:](NSArray, "newWithContentsOf:immutable:", a3, self == (__NSPlaceholderArray *)&___immutablePlaceholderArray);
  }
  else
  {
    atomic_store((unint64_t)objc_lookUpClass("NSURL"), &initWithContentsOfURL____cls_NSURL);
    if (!a3)
      return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:immutable:](NSArray, "newWithContentsOf:immutable:", a3, self == (__NSPlaceholderArray *)&___immutablePlaceholderArray);
  }
  atomic_load(&initWithContentsOfURL____cls_NSURL);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = "-[__NSPlaceholderArray initWithContentsOfURL:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: url argument is not an NSURL"), "-[__NSPlaceholderArray initWithContentsOfURL:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:immutable:](NSArray, "newWithContentsOf:immutable:", a3, self == (__NSPlaceholderArray *)&___immutablePlaceholderArray);
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
  v5 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v6 = "immutable";
  else
    v6 = v4;
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v7 = "NSArray";
  else
    v7 = v5;
  v8 = __CFLookUpClass(v7);
  v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s array object"), v9, v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v10);
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
  v6 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v8 = "NSArray";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s array object"), v10, v7);
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
  v7 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v6 = "<unknown>";
    v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v8 = "immutable";
  else
    v8 = v6;
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v9 = "NSArray";
  else
    v9 = v7;
  v10 = __CFLookUpClass(v9);
  v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s array object"), v11, v8);
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
  v6 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v8 = "NSArray";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s array object"), v10, v7);
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
  v7 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v6 = "<unknown>";
    v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v8 = "immutable";
  else
    v8 = v6;
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
    v9 = "NSArray";
  else
    v9 = v7;
  v10 = __CFLookUpClass(v9);
  v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s array object"), v11, v8);
  v12 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v12);
}

- (unint64_t)retainCount
{
  return -1;
}

@end
