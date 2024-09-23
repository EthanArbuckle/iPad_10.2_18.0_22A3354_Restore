@implementation NSConstantDictionary

- (id)objectForKey:(id)a3
{
  unint64_t options;
  size_t count;
  const void **keys;
  const void **objects;
  id result;
  int (__cdecl *v9)(const void *, const void *);
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  options = self->_options;
  count = self->_count;
  keys = self->_keys;
  objects = self->_objects;
  v11 = a3;
  if (!count)
    return 0;
  if (count == 1 && *keys == a3)
    return (id)*objects;
  if ((options & 2) != 0)
  {
    if ((_NSIsNSNumber((uint64_t)a3) & 1) == 0)
      return 0;
    if (count == 1)
    {
      if ((objc_msgSend(a3, "isEqualToNumber:", *keys, v11, v12) & 1) != 0)
        return (id)*objects;
      return 0;
    }
    if ((options & 1) == 0)
    {
LABEL_22:
      while (1)
      {
        v10 = (void *)*keys;
        if (*keys == a3)
          break;
        if ((options & 2) != 0)
        {
          if ((objc_msgSend(v10, "isEqualToNumber:", a3, v11, v12) & 1) != 0)
            return (id)*objects;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", a3) & 1) != 0)
        {
          return (id)*objects;
        }
        result = 0;
        ++objects;
        ++keys;
        if (!--count)
          return result;
      }
      return (id)*objects;
    }
    v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForNumericKeys;
  }
  else
  {
    if ((_NSIsNSString((uint64_t)a3) & 1) == 0)
    {
      if (!options)
      {
        while (*keys != a3 && (objc_msgSend((id)*keys, "isEqual:", a3, v11, v12) & 1) == 0)
        {
          result = 0;
          ++objects;
          ++keys;
          if (!--count)
            return result;
        }
        return (id)*objects;
      }
      return 0;
    }
    if (count == 1)
    {
      if ((objc_msgSend(a3, "isEqualToString:", *keys, v11, v12) & 1) != 0)
        return (id)*objects;
      return 0;
    }
    if ((options & 1) == 0)
      goto LABEL_22;
    v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForStringKeys;
  }
  result = bsearch(&v11, keys, count, 8uLL, v9);
  if (!result)
    return result;
  objects = (const void **)((char *)objects + (_BYTE *)result - (_BYTE *)keys);
  return (id)*objects;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  unint64_t v7;
  uint64_t v8;
  NSException *v9;

  if (!a3)
  {
    v8 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: function pointer is NULL"), v8);
    v9 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v9);
  }
  if (self->_count)
  {
    v7 = 0;
    do
    {
      ((void (*)(const void *, const void *, void *))a3)(self->_keys[v7], self->_objects[v7], a4);
      ++v7;
    }
    while (v7 < self->_count);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t count;
  unint64_t var0;
  unint64_t v7;
  void *v8;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;
  NSException *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_18;
  }
  if (a5 >> 61)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]", a5);
LABEL_18:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v16);
  }
  count = self->_count;
  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_4;
  if (count <= var0)
    return 0;
  a3->var1 = a4;
  if (!a5)
    return 0;
  v7 = 0;
  do
  {
    v8 = (void *)self->_keys[var0++];
    a3->var0 = var0;
    if (v8)
    {
      a4[v7++] = v8;
      var0 = a3->var0;
    }
  }
  while (var0 < count && v7 < a5);
  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  unint64_t options;
  size_t count;
  const void **keys;
  const void **objects;
  id result;
  int (__cdecl *v9)(const void *, const void *);
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  options = self->_options;
  count = self->_count;
  keys = self->_keys;
  objects = self->_objects;
  v11 = a3;
  if (!count)
    return 0;
  if (count == 1 && *keys == a3)
    return (id)*objects;
  if ((options & 2) != 0)
  {
    if ((_NSIsNSNumber((uint64_t)a3) & 1) == 0)
      return 0;
    if (count == 1)
    {
      if ((objc_msgSend(a3, "isEqualToNumber:", *keys, v11, v12) & 1) != 0)
        return (id)*objects;
      return 0;
    }
    if ((options & 1) == 0)
    {
LABEL_22:
      while (1)
      {
        v10 = (void *)*keys;
        if (*keys == a3)
          break;
        if ((options & 2) != 0)
        {
          if ((objc_msgSend(v10, "isEqualToNumber:", a3, v11, v12) & 1) != 0)
            return (id)*objects;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", a3) & 1) != 0)
        {
          return (id)*objects;
        }
        result = 0;
        ++objects;
        ++keys;
        if (!--count)
          return result;
      }
      return (id)*objects;
    }
    v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForNumericKeys;
  }
  else
  {
    if ((_NSIsNSString((uint64_t)a3) & 1) == 0)
    {
      if (!options)
      {
        while (*keys != a3 && (objc_msgSend((id)*keys, "isEqual:", a3, v11, v12) & 1) == 0)
        {
          result = 0;
          ++objects;
          ++keys;
          if (!--count)
            return result;
        }
        return (id)*objects;
      }
      return 0;
    }
    if (count == 1)
    {
      if ((objc_msgSend(a3, "isEqualToString:", *keys, v11, v12) & 1) != 0)
        return (id)*objects;
      return 0;
    }
    if ((options & 1) == 0)
      goto LABEL_22;
    v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForStringKeys;
  }
  result = bsearch(&v11, keys, count, 8uLL, v9);
  if (!result)
    return result;
  objects = (const void **)((char *)objects + (_BYTE *)result - (_BYTE *)keys);
  return (id)*objects;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t v7;
  size_t v8;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a5 >> 61;
  if (a3 && v7 || a4 && v7)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v11 + 4) = "-[NSConstantDictionary getObjects:andKeys:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSConstantDictionary getObjects:andKeys:count:]", a5);
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
    objc_exception_throw(v12);
  }
  v8 = 8 * self->_count;
  if (a4)
    memmove(a4, self->_keys, v8);
  if (a3)
    memmove(a3, self->_objects, v8);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  unint64_t count;
  unint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;
  _BYTE v12[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v9 = _os_log_pack_size();
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSConstantDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSConstantDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)], v9);
    objc_exception_throw(v11);
  }
  count = self->_count;
  v12[7] = 0;
  if (count)
  {
    for (i = 0; i < count; ++i)
    {
      if (self->_keys[i])
      {
        v8 = (void *)_CFAutoreleasePoolPush();
        __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v8);
      }
    }
  }
}

- (id)mutableCopy
{
  return __NSDictionaryM_new((uint64_t)self->_keys, (uint64_t)self->_objects, self->_count, 2uLL);
}

- (id)allKeys
{
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", self->_keys, self->_count);
}

- (id)keyEnumerator
{
  return -[__NSConstantDictionaryEnumerator initWithConstantDictionary:enumerateKeys:]([__NSConstantDictionaryEnumerator alloc], "initWithConstantDictionary:enumerateKeys:", self, 1);
}

- (id)allValues
{
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", self->_objects, self->_count);
}

- (NSConstantDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  qword_1EDCD1038 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  unint64_t count;
  uint64_t v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  count = self->_count;
  v13 = 0;
  if (!count)
    return 0;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = (void *)self->_keys[v7];
    if (v9)
    {
      v10 = self->_objects[v7];
      v11 = (void *)_CFAutoreleasePoolPush();
      if ((*((unsigned int (**)(id, void *, const void *, char *))a4 + 2))(a4, v9, v10, &v13))
      {
        v13 = 1;
        v8 = v9;
      }
      _CFAutoreleasePoolPop(v11);
      if (v13)
        break;
    }
    ++v7;
  }
  while (count != v7);
  return v8;
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  unint64_t count;
  NSSet *v7;
  unint64_t i;
  const void *v9;
  const void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  NSException *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSConstantDictionary keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSConstantDictionary keysOfEntriesWithOptions:passingTest:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
    objc_exception_throw(v15);
  }
  count = self->_count;
  v7 = +[NSSet set](NSMutableSet, "set", a3);
  HIBYTE(v16) = 0;
  if (count)
  {
    for (i = 0; i < count; ++i)
    {
      v9 = self->_keys[i];
      if (v9)
      {
        v10 = self->_objects[i];
        v11 = (void *)_CFAutoreleasePoolPush();
        if ((*((unsigned int (**)(id, const void *, const void *, char *))a4 + 2))(a4, v9, v10, (char *)&v16 + 7))
        {
          -[NSSet addObject:](v7, "addObject:", v9);
        }
        _CFAutoreleasePoolPop(v11);
        if (HIBYTE(v16))
          break;
      }
    }
  }
  return +[NSSet setWithSet:](NSSet, "setWithSet:", v7);
}

- (id)objectEnumerator
{
  return -[__NSConstantDictionaryEnumerator initWithConstantDictionary:enumerateKeys:]([__NSConstantDictionaryEnumerator alloc], "initWithConstantDictionary:enumerateKeys:", self, 0);
}

+ (NSConstantDictionary)new
{
  return (NSConstantDictionary *)objc_opt_new();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSDictionaryM_new((uint64_t)self->_keys, (uint64_t)self->_objects, self->_count, 2uLL);
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
