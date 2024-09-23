@implementation __NSPlaceholderDictionary

- (__NSPlaceholderDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSException *v10;
  uint64_t v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
    goto LABEL_24;
  if (a5 >> 61)
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]", a5);
    goto LABEL_21;
  }
  if (a5)
  {
    for (i = 0; i != a5; ++i)
    {
      if (!a4[i])
        goto LABEL_20;
    }
    if (a3)
    {
      i = 0;
      while (a3[i])
      {
        if (a5 == ++i)
          goto LABEL_12;
      }
LABEL_20:
      v6 = i;
      v7 = _os_log_pack_size();
      v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      v9 = _os_log_pack_fill();
      *(_DWORD *)v9 = 136315394;
      *(_QWORD *)(v9 + 4) = "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]";
      *(_WORD *)(v9 + 12) = 2048;
      *(_QWORD *)(v9 + 14) = v6;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]", v6);
LABEL_21:
      v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v7);
      objc_exception_throw(v10);
    }
LABEL_24:
    v7 = _os_log_pack_size();
    v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]", a5);
    goto LABEL_21;
  }
LABEL_12:
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
  {
    if (a5 == 1)
    {
      return (__NSPlaceholderDictionary *)__NSSingleEntryDictionaryI_new((unint64_t)*a4, (unint64_t)*a3, 1);
    }
    else if (a5)
    {
      return (__NSPlaceholderDictionary *)__NSDictionaryI_new((uint64_t *)a4, (uint64_t *)a3, 0, a5, 1);
    }
    else
    {
      return (__NSPlaceholderDictionary *)&__NSDictionary0__struct;
    }
  }
  else if (self == (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    return (__NSPlaceholderDictionary *)__NSDictionaryM_new((uint64_t)a4, (uint64_t)a3, a5, 3uLL);
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (__NSPlaceholderDictionary)init
{
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    return -[__NSPlaceholderDictionary initWithObjects:forKeys:count:](&___immutablePlaceholderDictionary, "initWithObjects:forKeys:count:", 0, 0, 0);
  if (self == (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
    return -[__NSPlaceholderDictionary initWithCapacity:](&___mutablePlaceholderDictionary, "initWithCapacity:", 0);
  __break(1u);
  return self;
}

- (__NSPlaceholderDictionary)initWithCapacity:(unint64_t)a3
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
    *(_QWORD *)(v6 + 4) = "-[__NSPlaceholderDictionary initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(_QWORD *)(v6 + 14) = a3;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: capacity (%lu) is ridiculous"), "-[__NSPlaceholderDictionary initWithCapacity:]", a3);
    v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    objc_exception_throw(v7);
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
  {
    -[NSObject doesNotRecognizeSelector:](&___immutablePlaceholderDictionary, "doesNotRecognizeSelector:", a2);
LABEL_7:
    __break(1u);
  }
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
    goto LABEL_7;
  return (__NSPlaceholderDictionary *)__NSDictionaryM_new(0, 0, a3, 3uLL);
}

- (__NSPlaceholderDictionary)initWithDictionary:(id)a3 copyItems:(BOOL)a4
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
  v8 = v7 == __NSDictionaryI || v7 == __NSDictionaryM;
  if (!v8 && v7 != __NSFrozenDictionaryM)
    goto LABEL_12;
  if (self == (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
    return (__NSPlaceholderDictionary *)objc_msgSend(a3, "mutableCopyWithZone:", 0);
  if (self != (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
  {
LABEL_12:
    v11.receiver = self;
    v11.super_class = (Class)__NSPlaceholderDictionary;
    return -[NSDictionary initWithDictionary:copyItems:](&v11, sel_initWithDictionary_copyItems_, a3, v4);
  }
  return (__NSPlaceholderDictionary *)objc_msgSend(a3, "copyWithZone:", 0);
}

- (__NSPlaceholderDictionary)initWithContentsOfFile:(id)a3
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
    *(_QWORD *)(v7 + 4) = "-[__NSPlaceholderDictionary initWithContentsOfFile:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: string argument is not an NSString"), "-[__NSPlaceholderDictionary initWithContentsOfFile:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:immutable:](NSDictionary, "newWithContentsOf:immutable:", a3, self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary);
}

- (__NSPlaceholderDictionary)initWithContentsOfURL:(id)a3
{
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (atomic_load(&initWithContentsOfURL____cls_NSURL_0))
  {
    if (!a3)
      return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:immutable:](NSDictionary, "newWithContentsOf:immutable:", a3, self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary);
  }
  else
  {
    atomic_store((unint64_t)objc_lookUpClass("NSURL"), &initWithContentsOfURL____cls_NSURL_0);
    if (!a3)
      return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:immutable:](NSDictionary, "newWithContentsOf:immutable:", a3, self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary);
  }
  atomic_load(&initWithContentsOfURL____cls_NSURL_0);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = "-[__NSPlaceholderDictionary initWithContentsOfURL:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: url argument is not an NSURL"), "-[__NSPlaceholderDictionary initWithContentsOfURL:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:immutable:](NSDictionary, "newWithContentsOf:immutable:", a3, self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary);
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
  v5 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v6 = "immutable";
  else
    v6 = v4;
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v7 = "NSDictionary";
  else
    v7 = v5;
  v8 = __CFLookUpClass(v7);
  v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s dictionary object"), v9, v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v10);
}

- (id)objectForKey:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_class *v9;
  uint64_t v10;
  NSException *v11;

  v5 = "mutable";
  v6 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v8 = "NSDictionary";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s dictionary object"), v10, v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v11);
}

- (id)keyEnumerator
{
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_class *v8;
  uint64_t v9;
  NSException *v10;

  v4 = "mutable";
  v5 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v6 = "immutable";
  else
    v6 = v4;
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v7 = "NSDictionary";
  else
    v7 = v5;
  v8 = __CFLookUpClass(v7);
  v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s dictionary object"), v9, v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v10);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_class *v10;
  uint64_t v11;
  NSException *v12;

  v6 = "mutable";
  v7 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v6 = "<unknown>";
    v7 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v8 = "immutable";
  else
    v8 = v6;
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v9 = "NSDictionary";
  else
    v9 = v7;
  v10 = __CFLookUpClass(v9);
  v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s dictionary object"), v11, v8);
  v12 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v12);
}

- (void)removeObjectForKey:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_class *v9;
  uint64_t v10;
  NSException *v11;

  v5 = "mutable";
  v6 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v7 = "immutable";
  else
    v7 = v5;
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
    v8 = "NSDictionary";
  else
    v8 = v6;
  v9 = __CFLookUpClass(v8);
  v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized %s dictionary object"), v10, v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v11);
}

- (unint64_t)retainCount
{
  return -1;
}

@end
