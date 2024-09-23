@implementation NSSharedKeyDictionary

- (unint64_t)count
{
  unint64_t count;
  NSMutableDictionary *sideDic;

  count = self->_count;
  sideDic = self->_sideDic;
  if (sideDic)
    sideDic = -[NSDictionary count](sideDic, "count");
  return (unint64_t)sideDic + count;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v5;
  unint64_t var0;
  unint64_t count;
  NSMutableDictionary *sideDic;
  unint64_t v12;
  unint64_t v13;
  id *v14;
  uint64_t v15;
  id v16;
  NSArray *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSException *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  NSException *v32;
  CFStringRef v33;
  NSException *v34;
  size_t v35[2];

  v5 = a5;
  v35[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v23 = _os_log_pack_size();
    v25 = (char *)v35 - ((MEMORY[0x1E0C80A78](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    v26 = _os_log_pack_fill();
    *(_DWORD *)v26 = 136315394;
    *(_QWORD *)(v26 + 4) = "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v26 + 12) = 2048;
    *(_QWORD *)(v26 + 14) = v5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]", v5);
    v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v25, v23);
    objc_exception_throw(v27);
  }
  if (a5 >> 61)
  {
    v28 = _os_log_pack_size();
    v30 = (char *)v35 - ((MEMORY[0x1E0C80A78](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136315394;
    *(_QWORD *)(v31 + 4) = "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v31 + 12) = 2048;
    *(_QWORD *)(v31 + 14) = v5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]", v5);
    v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v30, v28);
    objc_exception_throw(v32);
  }
  var0 = a3->var0;
  if (!a3->var0)
  {
    a3->var2 = &self->_mutations;
    count = self->_count;
    sideDic = self->_sideDic;
    if (sideDic)
    {
      sideDic = -[NSDictionary count](sideDic, "count");
      v12 = a3->var0;
    }
    else
    {
      v12 = 0;
    }
    v13 = (unint64_t)sideDic + count;
    a3->var3[0] = v13;
    if (v13 <= v12)
    {
      v5 = 0;
      v18 = -1;
LABEL_22:
      a3->var0 = v18;
      return v5;
    }
    if (v13 >> 60)
    {
      v33 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v13);
      v34 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v33, 0);
      CFRelease(v33);
      objc_exception_throw(v34);
    }
    v35[0] = 0;
    v14 = (id *)_CFCreateArrayStorage(v13, 0, v35);
    -[NSSharedKeyDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0, v14, v13);
    if (v14)
    {
      v15 = 0;
      do
        v16 = v14[v15++];
      while (v13 != v15);
      v17 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v14, v13, v13);
    }
    else
    {
      v17 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, v13);
    }
    a3->var3[1] = (unint64_t)v17;
    var0 = a3->var0;
  }
  v19 = a3->var3[0];
  v20 = v19 > var0;
  v21 = v19 - var0;
  if (v20)
  {
    if (v21 < v5)
      v5 = v21;
    objc_msgSend((id)a3->var3[1], "getObjects:range:", a4);
    a3->var1 = a4;
    v18 = a3->var0 + v5;
    goto LABEL_22;
  }
  return 0;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSSharedKeySet *keyMap;
  uint64_t v8;
  NSMutableDictionary *sideDic;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSException *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSException *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  ++self->_mutations;
  if (!a4)
  {
    v12 = _os_log_pack_size();
    v14 = (char *)v22 - ((MEMORY[0x1E0C80A78](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSSharedKeyDictionary setObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[NSSharedKeyDictionary setObject:forKey:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v12);
    objc_exception_throw(v16);
  }
  if (!a3)
  {
    v17 = _os_log_pack_size();
    v19 = (char *)v22 - ((MEMORY[0x1E0C80A78](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315394;
    *(_QWORD *)(v20 + 4) = "-[NSSharedKeyDictionary setObject:forKey:]";
    *(_WORD *)(v20 + 12) = 2112;
    *(_QWORD *)(v20 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil (key: %@)"), "-[NSSharedKeyDictionary setObject:forKey:]", a4);
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v19, v17);
    objc_exception_throw(v21);
  }
  keyMap = self->_keyMap;
  if (keyMap)
    v8 = ((uint64_t (*)(NSSharedKeySet *, char *, id))self->_ifkIMP)(keyMap, sel_indexForKey_, a4);
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_doKVO)
    -[NSSharedKeyDictionary willChangeValueForKey:](self, "willChangeValueForKey:", a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sideDic = self->_sideDic;
    if (!sideDic)
    {
      sideDic = (NSMutableDictionary *)objc_opt_new();
      self->_sideDic = sideDic;
    }
    -[NSMutableDictionary setObject:forKey:](sideDic, "setObject:forKey:", a3, a4);
  }
  else
  {
    v10 = (uint64_t)self->_values[v8];
    if ((id)v10 != a3)
    {
      if (((unint64_t)a3 & 0x8000000000000000) == 0)
        v11 = a3;
      if (v10)
      {
        self->_values[v8] = a3;
        if (v10 >= 1)

      }
      else
      {
        ++self->_count;
        self->_values[v8] = a3;
      }
    }
  }
  if (self->_doKVO)
    -[NSSharedKeyDictionary didChangeValueForKey:](self, "didChangeValueForKey:", a4);
}

- (id)objectForKey:(id)a3
{
  NSSharedKeySet *keyMap;
  uint64_t v6;

  if (a3
    && (keyMap = self->_keyMap) != 0
    && (v6 = ((uint64_t (*)(NSSharedKeySet *, char *, id))self->_ifkIMP)(keyMap, sel_indexForKey_, a3),
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    return self->_values[v6];
  }
  else
  {
    return -[NSDictionary objectForKey:](self->_sideDic, "objectForKey:", a3);
  }
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  size_t v7;
  unsigned __int8 v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  NSException *v15;
  _BYTE v16[16];
  _QWORD v17[7];
  uint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = _os_log_pack_size();
    v13 = &v16[-((MEMORY[0x1E0C80A78](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0)];
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSSharedKeyDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSSharedKeyDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v11);
    objc_exception_throw(v15);
  }
  v7 = -[NSSharedKeySet count](self->_keyMap, "count");
  v18 = 0;
  v19 = (unsigned __int8 *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__NSSharedKeyDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke;
  v17[3] = &unk_1E12E1350;
  v17[4] = self;
  v17[5] = a4;
  v17[6] = &v18;
  if (!__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v17))
  {
    v16[15] = 0;
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        if (self->_values[i])
        {
          v10 = (void *)_CFAutoreleasePoolPush();
          -[NSSharedKeySet keyAtIndex:](self->_keyMap, "keyAtIndex:", i);
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
        }
      }
    }
    goto LABEL_10;
  }
  v8 = atomic_load(v19 + 24);
  if ((v8 & 1) == 0)
LABEL_10:
    -[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self->_sideDic, "enumerateKeysAndObjectsWithOptions:usingBlock:", a3, a4);
  _Block_object_dispose(&v18, 8);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t v9;
  NSMutableDictionary *sideDic;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id *v15;
  id *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSException *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a5 >> 61;
  if (a3 && v9 || a4 && v9)
  {
    v18 = _os_log_pack_size();
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "-[NSSharedKeyDictionary getObjects:andKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSSharedKeyDictionary getObjects:andKeys:count:]", a5);
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    objc_exception_throw(v20);
  }
  sideDic = self->_sideDic;
  if (sideDic)
  {
    v11 = -[NSDictionary count](sideDic, "count");
    sideDic = self->_sideDic;
  }
  else
  {
    v11 = 0;
  }
  if (v11 >= a5)
    v12 = a5;
  else
    v12 = v11;
  -[NSDictionary getObjects:andKeys:count:](sideDic, "getObjects:andKeys:count:", a3, a4, v12);
  v13 = a5 - v12;
  if (a5 != v12)
  {
    v14 = -[NSSharedKeySet count](self->_keyMap, "count");
    if (v14)
    {
      if (a4)
        v15 = &a4[v12];
      else
        v15 = 0;
      if (a3)
        v16 = &a3[v12];
      else
        v16 = 0;
      v17 = v14 - 1;
      do
      {
        if (self->_values[v17])
        {
          if (v15)
            *v15++ = -[NSSharedKeySet keyAtIndex:](self->_keyMap, "keyAtIndex:", v17);
          if (v16)
            *v16++ = self->_values[v17];
          if (!--v13)
            break;
        }
        --v17;
      }
      while (v17 != -1);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithKeySet:", self->_keyMap);
  v5[2] = self->_count;
  v6 = -[NSSharedKeySet count](self->_keyMap, "count");
  if (v6)
  {
    v7 = v6 - 1;
    do
    {
      v8 = (uint64_t)self->_values[v7];
      if (v8 >= 1)
      {
        v9 = (id)v8;
        v8 = (uint64_t)self->_values[v7];
      }
      *(_QWORD *)(v5[3] + 8 * v7--) = v8;
    }
    while (v7 != -1);
  }
  v5[5] = -[NSDictionary mutableCopyWithZone:](self->_sideDic, "mutableCopyWithZone:", a3);
  return v5;
}

- (void)dealloc
{
  id *values;
  unint64_t v4;
  unint64_t v5;
  NSSharedKeySet *keyMap;
  NSMutableDictionary *sideDic;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  values = self->_values;
  if (values)
  {
    v4 = -[NSSharedKeySet count](self->_keyMap, "count");
    if (v4)
    {
      v5 = v4;
      do
      {
        if (((unint64_t)*values & 0x8000000000000000) == 0)

        ++values;
        --v5;
      }
      while (v5);
    }
    free(self->_values);
  }
  keyMap = self->_keyMap;
  if ((uint64_t)keyMap >= 1)

  sideDic = self->_sideDic;
  if ((uint64_t)sideDic >= 1)

  v8.receiver = self;
  v8.super_class = (Class)NSSharedKeyDictionary;
  -[NSSharedKeyDictionary dealloc](&v8, sel_dealloc);
}

+ (id)sharedKeyDictionaryWithKeySet:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKeySet:", a3);
}

- (NSSharedKeyDictionary)initWithKeySet:(id)a3
{
  id v6;
  id *v7;
  uint64_t v9;
  uint64_t v10;

  if (a3)
  {
    if (((unint64_t)a3 & 0x8000000000000000) == 0)
      v6 = a3;
    self->_keyMap = (NSSharedKeySet *)a3;
    self->_ifkIMP = (void *)objc_msgSend(a3, "methodForSelector:", sel_indexForKey_);
    v7 = (id *)malloc_type_calloc(-[NSSharedKeySet count](self->_keyMap, "count"), 8uLL, 0x80040B8603338uLL);
    self->_values = v7;
    if (!v7)
    {
      v9 = __CFExceptionProem((objc_class *)self, a2);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: unable to unarchive - memory failure"), v9);
      v10 = _CFAutoreleasePoolAddObject();

      objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSMallocException"), v10, 0));
    }
  }
  return self;
}

- (id)keyEnumerator
{
  unint64_t count;
  NSMutableDictionary *sideDic;
  unint64_t v5;
  unint64_t v6;
  id *v7;
  id *v8;
  unint64_t v9;
  id v10;
  NSArray *v11;
  NSArray *v12;
  NSEnumerator *v13;
  CFStringRef v15;
  NSException *v16;
  size_t v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  count = self->_count;
  sideDic = self->_sideDic;
  if (sideDic)
    sideDic = -[NSDictionary count](sideDic, "count");
  v5 = (unint64_t)sideDic + count;
  if (v5 >> 60)
  {
    v15 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
    v16 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v15, 0);
    CFRelease(v15);
    objc_exception_throw(v16);
  }
  v17[0] = 0;
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = v5;
  v7 = (id *)_CFCreateArrayStorage(v6, 0, v17);
  -[NSSharedKeyDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0, v7, v5);
  if (v7)
  {
    if (v5)
    {
      v8 = v7;
      v9 = v5;
      do
      {
        v10 = *v8++;
        --v9;
      }
      while (v9);
    }
    v11 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v7, v5, v5);
  }
  else
  {
    v11 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, v5);
  }
  v12 = v11;
  v13 = -[NSArray objectEnumerator](v11, "objectEnumerator");

  return v13;
}

_QWORD *__71__NSSharedKeyDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;

  if (*(_QWORD *)(*(_QWORD *)(result[4] + 24) + 8 * a2))
  {
    v3 = result;
    v4 = (void *)_CFAutoreleasePoolPush();
    v5 = v3[5];
    objc_msgSend(*(id *)(v3[4] + 8), "keyAtIndex:", a2);
    __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__(v5);
    return _CFAutoreleasePoolPop(v4);
  }
  return result;
}

- (void)removeObjectForKey:(id)a3
{
  NSSharedKeySet *keyMap;
  uint64_t v6;
  NSMutableDictionary *sideDic;
  id *values;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSException *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  ++self->_mutations;
  if (!a3)
  {
    v10 = _os_log_pack_size();
    v12 = (char *)v15 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = "-[NSSharedKeyDictionary removeObjectForKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[NSSharedKeyDictionary removeObjectForKey:]");
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v14);
  }
  keyMap = self->_keyMap;
  if (keyMap)
    v6 = ((uint64_t (*)(NSSharedKeySet *, char *, id))self->_ifkIMP)(keyMap, sel_indexForKey_, a3);
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_doKVO)
    -[NSSharedKeyDictionary willChangeValueForKey:](self, "willChangeValueForKey:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sideDic = self->_sideDic;
    if (sideDic)
      -[NSMutableDictionary removeObjectForKey:](sideDic, "removeObjectForKey:", a3);
  }
  else
  {
    values = self->_values;
    v9 = (unint64_t)values[v6];
    values[v6] = 0;
    if (v9)
    {
      --self->_count;
      if ((v9 & 0x8000000000000000) == 0)

    }
  }
  if (self->_doKVO)
    -[NSSharedKeyDictionary didChangeValueForKey:](self, "didChangeValueForKey:", a3);
}

- (id)keySet
{
  return self->_keyMap;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *v6;
  NSArray *v7;
  NSSharedKeySet *keyMap;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  NSException *v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v16 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: this object can only be encoded by a keyed coder"), v16);
    v17 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v17);
  }
  objc_msgSend(a3, "encodeObject:forKey:", self->_keyMap, CFSTR("NS.skkeyset"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sideDic, CFSTR("NS.sideDic"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_count, CFSTR("NS.count"));
  if (self->_count)
  {
    v6 = +[NSArray array](NSMutableArray, "array");
    v7 = +[NSArray array](NSMutableArray, "array");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    keyMap = self->_keyMap;
    v9 = -[NSSharedKeySet countByEnumeratingWithState:objects:count:](keyMap, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(keyMap);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v14 = -[NSSharedKeyDictionary objectForKey:](self, "objectForKey:", v13);
          if (v14)
          {
            v15 = v14;
            -[NSArray addObject:](v6, "addObject:", v13);
            -[NSArray addObject:](v7, "addObject:", v15);
          }
        }
        v10 = -[NSSharedKeySet countByEnumeratingWithState:objects:count:](keyMap, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v10);
    }
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NS.keys"));
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("NS.values"));
  }
}

- (NSSharedKeyDictionary)initWithCoder:(id)a3
{
  uint64_t v6;
  char isKindOfClass;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  id *v19;
  uint64_t v20;
  Class v21;
  Class v22;
  Class v23;
  void *v24;
  void *v25;
  uint64_t sideDic;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  id v79;
  void *v80;
  char *v81;
  uint64_t *v82;
  uint64_t v83;
  size_t v84;
  size_t v85;
  _QWORD block[5];
  id v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v15 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: this object can only be decoded by a keyed coder"), v15);
    v16 = _CFAutoreleasePoolAddObject();

    objc_msgSend(a3, "failWithError:", __archiveIsCorrupt(v16));
    return 0;
  }
  v6 = objc_opt_class();
  objc_getClass("NSKeyedUnarchiver");
  isKindOfClass = objc_opt_isKindOfClass();
  v91 = 0;
  v92 = 0;
  if ((isKindOfClass & 1) != 0)
    v8 = a3;
  else
    v8 = 0;
  v89 = 0;
  v90 = v8;
  v87 = v8;
  v88 = 0;
  v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", v6, CFSTR("NS.skkeyset"));
  v10 = v9;
  v91 = v9;
  v83 = 8;
  self->_keyMap = (NSSharedKeySet *)v9;
  if (v9 >= 1)
    v11 = (id)v9;
  v12 = objc_opt_class();
  if (v12 == v6)
  {
    v18 = *(Class *)((char *)&self->super.super.super.isa + v83);
    if (v18)
    {
      self->_ifkIMP = (void *)objc_msgSend(v18, "methodForSelector:", sel_indexForKey_);
      v19 = (id *)malloc_type_calloc(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v83), "count"), 8uLL, 0x80040B8603338uLL);
      self->_values = v19;
      if (!v19)
      {
        v31 = __CFExceptionProem((objc_class *)self, a2);
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: unable to unarchive - memory failure"), v31);
        v14 = _CFAutoreleasePoolAddObject();
        if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

        goto LABEL_10;
      }
      if ((isKindOfClass & 1) != 0)
      {
        v20 = objc_opt_new();
        v92 = v20;
        if (!v20)
        {
          v38 = __CFExceptionProem((objc_class *)self, a2);
          CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: unable to unarchive - memory failure"), v38);
          v14 = _CFAutoreleasePoolAddObject();
          if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

          goto LABEL_10;
        }
        if (v10)
          objc_msgSend(a3, "replaceObject:withObject:", v10, v20);
      }
    }
    v21 = objc_lookUpClass("NSArray");
    objc_lookUpClass("NSDictionary");
    v22 = objc_lookUpClass("NSMutableDictionary");
    v23 = objc_lookUpClass("NSString");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__NSSharedKeyDictionary_initWithCoder___block_invoke;
    block[3] = &unk_1E12E5C68;
    block[4] = v23;
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, block);
    v24 = (void *)objc_msgSend(a3, "allowedClasses");
    v25 = (void *)objc_msgSend(v24, "setByAddingObjectsFromSet:", initWithCoder__oPlistClasses);
    sideDic = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v25, "setByAddingObject:", v22), CFSTR("NS.sideDic"));
    v27 = sideDic;
    v88 = sideDic;
    self->_sideDic = (NSMutableDictionary *)sideDic;
    if (sideDic >= 1)
    {
      v28 = (id)sideDic;
      sideDic = (uint64_t)self->_sideDic;
    }
    if (sideDic)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v32 = __CFExceptionProem((objc_class *)self, a2);
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: invalid archive (must be mutable)"), v32);
        v30 = _CFAutoreleasePoolAddObject();
        if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

        goto LABEL_82;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = __CFExceptionProem((objc_class *)self, a2);
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: invalid archive (invalid dictionary)"), v29);
        v30 = _CFAutoreleasePoolAddObject();
        if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

LABEL_82:
        objc_msgSend(a3, "failWithError:", __archiveIsCorrupt(v30));
        goto LABEL_11;
      }
      if ((isKindOfClass & 1) != 0)
      {
        v33 = objc_opt_new();
        v89 = v33;
        if (!v33)
        {
          v62 = __CFExceptionProem((objc_class *)self, a2);
          CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: unable to unarchive - memory failure"), v62);
          v30 = _CFAutoreleasePoolAddObject();
          if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

          goto LABEL_82;
        }
        if (v27)
          objc_msgSend(a3, "replaceObject:withObject:", v27, v33);
      }
      v34 = -[NSDictionary count](self->_sideDic, "count");
      v36 = v34;
      if (v34 >= 1)
      {
        if ((unint64_t)v34 >= 0x1000001)
        {
          v37 = __CFExceptionProem((objc_class *)self, a2);
          CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: unreasonably sized collection"), v37);
          v30 = _CFAutoreleasePoolAddObject();
          if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

          goto LABEL_82;
        }
        v82 = &v77;
        MEMORY[0x1E0C80A78](v34, v35);
        v40 = (char *)&v77 - v39;
        v41 = 0;
        v85 = 0;
        if (v36 >= 0x101)
        {
          v41 = (char *)_CFCreateArrayStorage(v36, 0, &v85);
          v40 = v41;
        }
        -[NSDictionary getObjects:andKeys:count:](self->_sideDic, "getObjects:andKeys:count:", 0, v40, v36);
        while ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          v40 += 8;
          if (!--v36)
          {
            free(v41);
            goto LABEL_56;
          }
        }
        v63 = objc_opt_class();
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("unexpected recursive keys (%@)"), v63);
        v64 = _CFAutoreleasePoolAddObject();
        if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

        objc_msgSend(a3, "failWithError:", __archiveIsCorrupt(v64));
        v65 = v41;
LABEL_86:
        free(v65);
        self = 0;
        goto LABEL_12;
      }
    }
LABEL_56:
    v42 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NS.count"));
    v43 = v42;
    if ((v42 & 0x8000000000000000) != 0)
    {
      v46 = __CFExceptionProem((objc_class *)self, a2);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: negative count"), v46);
      v45 = _CFAutoreleasePoolAddObject();
      if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

    }
    else
    {
      if (!v42)
        goto LABEL_12;
      if (v42 < 0x1000001)
      {
        if (*(Class *)((char *)&self->super.super.super.isa + v83))
        {
          v47 = objc_msgSend(v25, "setByAddingObject:", v21);
          v48 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v47, CFSTR("NS.keys"));
          v49 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v47, CFSTR("NS.values"));
          if (!_NSIsNSArray((uint64_t)v48))
            v48 = 0;
          if (_NSIsNSArray(v49))
            v50 = (void *)v49;
          else
            v50 = 0;
          v51 = objc_msgSend(v48, "count");
          v52 = objc_msgSend(v50, "count");
          if (v51 && v52)
          {
            if (v51 == v52)
            {
              if (v51 == v43)
              {
                v82 = &v77;
                v54 = MEMORY[0x1E0C80A78](v52, v53);
                v57 = (char *)&v77 - v56;
                v85 = 0;
                if (v43 > 0x100)
                {
                  v57 = (char *)_CFCreateArrayStorage(v43, 0, &v85);
                  MEMORY[0x1E0C80A78](v57, v69);
                  v59 = &v76;
                  v84 = 0;
                  v60 = _CFCreateArrayStorage(v43, 0, &v84);
                  v81 = v57;
                }
                else
                {
                  MEMORY[0x1E0C80A78](v54, v55);
                  v59 = (uint64_t *)((char *)&v77 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
                  v81 = 0;
                  v60 = 0;
                  v84 = 0;
                }
                v79 = v50;
                v80 = v60;
                if (v43 >= 0x101)
                  v59 = (uint64_t *)v60;
                objc_msgSend(v48, "getObjects:range:", v57, 0, v43);
                v78 = v57;
                v70 = v43;
                do
                {
                  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v73 = objc_opt_class();
                    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("unexpected recursive keys (%@)"), v73);
                    v74 = _CFAutoreleasePoolAddObject();
                    if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

                    goto LABEL_109;
                  }
                  v57 += 8;
                  --v70;
                }
                while (v70);
                objc_msgSend(v79, "getObjects:range:", v59, 0, v43);
                v71 = v78;
                while (1)
                {
                  v72 = *(_QWORD *)v71;
                  if (((uint64_t (*)(_QWORD, char *, _QWORD))self->_ifkIMP)(*(Class *)((char *)&self->super.super.super.isa + v83), sel_indexForKey_, *(_QWORD *)v71) == 0x7FFFFFFFFFFFFFFFLL)break;
                  -[NSSharedKeyDictionary setObject:forKey:](self, "setObject:forKey:", *v59++, v72);
                  v71 += 8;
                  if (!--v43)
                  {
                    free(v80);
                    free(v81);
                    goto LABEL_12;
                  }
                }
                v75 = __CFExceptionProem((objc_class *)self, a2);
                CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: encoded key not present in keyset"), v75);
                v74 = _CFAutoreleasePoolAddObject();
                if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

LABEL_109:
                objc_msgSend(a3, "failWithError:", __archiveIsCorrupt(v74));
                free(v80);
                v65 = v81;
                goto LABEL_86;
              }
              v68 = __CFExceptionProem((objc_class *)self, a2);
              CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: more entries than expected"), v68);
              v45 = _CFAutoreleasePoolAddObject();
              if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

            }
            else
            {
              v67 = __CFExceptionProem((objc_class *)self, a2);
              CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: encoded keys/values length does not match"), v67);
              v45 = _CFAutoreleasePoolAddObject();
              if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

            }
          }
          else
          {
            v66 = __CFExceptionProem((objc_class *)self, a2);
            CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: encoded keys/values are empty"), v66);
            v45 = _CFAutoreleasePoolAddObject();
            if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

          }
        }
        else
        {
          v61 = __CFExceptionProem((objc_class *)self, a2);
          CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: invalid archive (encoded count but missing keyset)"), v61);
          v45 = _CFAutoreleasePoolAddObject();
          if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

        }
      }
      else
      {
        v44 = __CFExceptionProem((objc_class *)self, a2);
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: unreasonably sized collection"), v44);
        v45 = _CFAutoreleasePoolAddObject();
        if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

      }
    }
    objc_msgSend(a3, "failWithError:", __archiveIsCorrupt(v45));
    goto LABEL_11;
  }
  v13 = __CFExceptionProem((objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: invalid archive (unexpected keyset: %@)"), v13, v12);
  v14 = _CFAutoreleasePoolAddObject();
  if (objc_msgSend(a3, "decodingFailurePolicy") == 1)

LABEL_10:
  objc_msgSend(a3, "failWithError:", __archiveIsCorrupt(v14));
LABEL_11:
  self = 0;
LABEL_12:
  cleanup_sentinel_pair((uint64_t)&v87);
  cleanup_sentinel_pair((uint64_t)&v90);
  return self;
}

id __39__NSSharedKeyDictionary_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v1;
  Class v2;
  Class v3;
  Class v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_lookUpClass("NSNumber");
  v3 = objc_lookUpClass("NSDate");
  v4 = objc_lookUpClass("NSURL");
  initWithCoder__oPlistClasses = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, objc_lookUpClass("NSData"), 0);
  return (id)initWithCoder__oPlistClasses;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (void)setObservationInfo:(void *)a3
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  self->_doKVO = a3 != 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSharedKeyDictionary;
  -[NSSharedKeyDictionary setObservationInfo:](&v3, sel_setObservationInfo_);
}

@end
