@implementation __NSSingleObjectSetI

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  NSException *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315394;
    *(_QWORD *)(v10 + 4) = "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(_QWORD *)(v10 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_12;
  }
  if (a5 >> 61)
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]", a5);
LABEL_12:
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v8);
    objc_exception_throw(v13);
  }
  var0 = a3->var0;
  if (a3->var0)
    return 0;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_1;
  if (a4 && a5)
  {
    *a4 = self->element;
    var0 = 1;
    a3->var0 = 1;
  }
  return var0;
}

- (unint64_t)countForObject:(id)a3
{
  id element;

  element = self->element;
  return (element == a3 || objc_msgSend(a3, "isEqual:", element)) && element != 0;
}

- (void)dealloc
{
  uint64_t element;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  element = (uint64_t)self->element;
  if (element >= 1)

  v4.receiver = self;
  v4.super_class = (Class)__NSSingleObjectSetI;
  -[__NSSingleObjectSetI dealloc](&v4, sel_dealloc);
}

- (unint64_t)count
{
  return 1;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4)
  {
    v5 = _os_log_pack_size();
    v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v7 + 4) = "-[__NSSingleObjectSetI getObjects:count:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(_QWORD *)(v7 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSSingleObjectSetI getObjects:count:]", a4);
    goto LABEL_9;
  }
  if (a4 >> 61)
  {
    v5 = _os_log_pack_size();
    v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)(v9 + 4) = "-[__NSSingleObjectSetI getObjects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v9 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSSingleObjectSetI getObjects:count:]", a4);
LABEL_9:
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v6, v5);
    objc_exception_throw(v10);
  }
  if (a4)
    *a3 = self->element;
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
    *(_QWORD *)(v7 + 4) = "-[__NSSingleObjectSetI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSSingleObjectSetI enumerateObjectsWithOptions:usingBlock:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v6);
    objc_exception_throw(v8);
  }
  v9[7] = 0;
  v5 = (void *)_CFAutoreleasePoolPush();
  __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
  _CFAutoreleasePoolPop(v5);
}

- (BOOL)containsObject:(id)a3
{
  id element;
  int v4;

  element = self->element;
  if (element == a3 || (v4 = objc_msgSend(a3, "isEqual:", element)) != 0)
    LOBYTE(v4) = element != 0;
  return v4;
}

- (id)member:(id)a3
{
  id element;

  element = self->element;
  if (element != a3 && !objc_msgSend(a3, "isEqual:", element))
    return 0;
  return element;
}

- (id)objectEnumerator
{
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSSingleObjectEnumerator), "initWithObject:collection:", self->element, self);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
