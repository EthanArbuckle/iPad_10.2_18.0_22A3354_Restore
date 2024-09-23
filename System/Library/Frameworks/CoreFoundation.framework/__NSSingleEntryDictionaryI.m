@implementation __NSSingleEntryDictionaryI

- (unint64_t)count
{
  return 1;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  __NSSingleEntryDictionaryI *v3;
  uint64_t v5;
  uint64_t v6;
  NSException *v7;
  _QWORD v9[2];

  v3 = self;
  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((_NSIsNSDictionary((uint64_t)a3) & 1) == 0)
    {
      v5 = _os_log_pack_size();
      v6 = _os_log_pack_fill();
      *(_DWORD *)v6 = 136315138;
      *(_QWORD *)(v6 + 4) = "-[__NSSingleEntryDictionaryI isEqualToDictionary:]";
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: dictionary argument is not an NSDictionary"), "-[__NSSingleEntryDictionaryI isEqualToDictionary:]");
      v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
      objc_exception_throw(v7);
    }
    if (a3 == v3)
    {
      LOBYTE(self) = 1;
    }
    else if (objc_msgSend(a3, "count") == 1)
    {
      self = (__NSSingleEntryDictionaryI *)objc_msgSend(a3, "objectForKey:", v3->_key);
      if (self)
        LOBYTE(self) = objc_msgSend(v3->_obj, "isEqual:", self);
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    LOBYTE(self) = self == 0;
  }
  return (char)self;
}

- (void)dealloc
{
  uint64_t obj;
  uint64_t key;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  obj = (uint64_t)self->_obj;
  if (obj >= 1)

  key = (uint64_t)self->_key;
  if (key >= 1)

  v5.receiver = self;
  v5.super_class = (Class)__NSSingleEntryDictionaryI;
  -[__NSSingleEntryDictionaryI dealloc](&v5, sel_dealloc);
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  uint64_t v4;
  NSException *v5;

  if (!a3)
  {
    v4 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: function pointer is NULL"), v4);
    v5 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v5);
  }
  ((void (*)(id, id, void *))a3)(self->_key, self->_obj, a4);
}

- (id)objectForKey:(id)a3
{
  id key;

  key = self->_key;
  if (key == a3 || objc_msgSend(key, "isEqual:"))
    return self->_obj;
  else
    return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;
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
    *(_QWORD *)(v9 + 4) = "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v9 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v11 + 4) = "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v7);
    objc_exception_throw(v12);
  }
  if (a3->var0)
    return 0;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_2;
  *a4 = self->_key;
  result = 1;
  a3->var0 = 1;
  return result;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
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
    *(_QWORD *)(v7 + 4) = "-[__NSSingleEntryDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSSingleEntryDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v6);
    objc_exception_throw(v8);
  }
  v9[7] = 0;
  v5 = (void *)_CFAutoreleasePoolPush();
  __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
  _CFAutoreleasePoolPop(v5);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSDictionaryM_new((uint64_t)&self->_key, (uint64_t)&self->_obj, 1uLL, 2uLL);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a5 >> 61;
  if (a3)
  {
    if (v5)
      goto LABEL_10;
    if (!a5)
      return;
    *a3 = self->_obj;
  }
  if (!a4)
    return;
  if (v5)
  {
LABEL_10:
    v7 = _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315394;
    *(_QWORD *)(v8 + 4) = "-[__NSSingleEntryDictionaryI getObjects:andKeys:count:]";
    *(_WORD *)(v8 + 12) = 2048;
    *(_QWORD *)(v8 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSSingleEntryDictionaryI getObjects:andKeys:count:]", a5);
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (a5)
    *a4 = self->_key;
}

- (id)keyEnumerator
{
  return -[__NSSingleObjectEnumerator initWithObject:collection:]([__NSSingleObjectEnumerator alloc], "initWithObject:collection:", self->_key, self);
}

- (id)objectEnumerator
{
  return -[__NSSingleObjectEnumerator initWithObject:collection:]([__NSSingleObjectEnumerator alloc], "initWithObject:collection:", self->_obj, self);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
