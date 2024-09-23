@implementation __NSSingleObjectArrayI

- (unint64_t)count
{
  return 1;
}

- (id)firstObject
{
  return self->_object;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)(v9 + 4) = "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v9 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v11 + 4) = "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v7);
    objc_exception_throw(v12);
  }
  if (a3->var0)
    return 0;
  a3->var1 = &self->_object;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_7;
  a3->var0 = -1;
  return 1;
}

- (id)lastObject
{
  return self->_object;
}

- (BOOL)isEqualToArray:(id)a3
{
  __NSSingleObjectArrayI *v3;
  uint64_t v5;
  id object;
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v11[2];

  v3 = self;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
    {
      v7 = _os_log_pack_size();
      v8 = _os_log_pack_fill();
      *(_DWORD *)v8 = 136315138;
      *(_QWORD *)(v8 + 4) = "-[__NSSingleObjectArrayI isEqualToArray:]";
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[__NSSingleObjectArrayI isEqualToArray:]");
      v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
      objc_exception_throw(v9);
    }
    if (a3 == v3)
      goto LABEL_7;
    if (objc_msgSend(a3, "count") != 1)
    {
      LOBYTE(self) = 0;
      return (char)self;
    }
    v5 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    object = v3->_object;
    if (object == (id)v5 || (LODWORD(self) = objc_msgSend(object, "isEqual:"), (_DWORD)self))
LABEL_7:
      LOBYTE(self) = 1;
  }
  else
  {
    LOBYTE(self) = self == 0;
  }
  return (char)self;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = _os_log_pack_size();
    v6 = _os_log_pack_fill();
    v7 = __os_log_helper_1_2_3_8_32_8_0_8_0(v6, (uint64_t)"-[__NSSingleObjectArrayI objectAtIndex:]", a3, 0);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v7, "-[__NSSingleObjectArrayI objectAtIndex:]", a3, 0);
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    objc_exception_throw(v8);
  }
  return self->_object;
}

- (void)dealloc
{
  uint64_t object;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  object = (uint64_t)self->_object;
  if (object >= 1)

  v4.receiver = self;
  v4.super_class = (Class)__NSSingleObjectArrayI;
  -[__NSSingleObjectArrayI dealloc](&v4, sel_dealloc);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  double v8;
  NSException *v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSException *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if ((a4.location & 0x8000000000000000) != 0
    || (a4.length & 0x8000000000000000) != 0
    || a4.location + a4.length >= 2)
  {
    length = a4.length;
    location = a4.location;
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    v8 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v7, (uint64_t)"-[__NSSingleObjectArrayI getObjects:range:]", location, length, 0);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v8, "-[__NSSingleObjectArrayI getObjects:range:]", location, length, 0);
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v9);
  }
  if (!a3 && a4.length)
  {
    v10 = a4.length;
    v11 = _os_log_pack_size();
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[__NSSingleObjectArrayI getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = v10;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSSingleObjectArrayI getObjects:range:]", v10);
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    objc_exception_throw(v13);
  }
  if (a4.length)
    *a3 = self->_object;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSArrayM_new(&self->_object, 1uLL, 0);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _BYTE v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[__NSSingleObjectArrayI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSSingleObjectArrayI enumerateObjectsWithOptions:usingBlock:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v6);
    objc_exception_throw(v8);
  }
  v9[7] = 0;
  v5 = (void *)_CFAutoreleasePoolPush();
  __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
  _CFAutoreleasePoolPop(v5);
}

- (id)objectEnumerator
{
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSSingleObjectEnumerator), "initWithObject:collection:", self->_object, self);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
