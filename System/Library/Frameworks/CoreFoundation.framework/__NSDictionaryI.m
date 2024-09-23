@implementation __NSDictionaryI

- (id)objectForKeyedSubscript:(id)a3
{
  unsigned int v3;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v18;

  v3 = self->_used[7];
  if (v3 < 4)
    return 0;
  v6 = *(_QWORD *)((char *)&__NSDictionarySizes + ((2 * v3) & 0x1F8));
  v7 = (char *)self + 16;
  v8 = objc_msgSend(a3, "hash") % v6;
  v9 = v6 <= 1 ? 1 : v6;
  v10 = 2 * v8;
  v11 = *(id *)&v7[16 * v8];
  if (!v11 || v11 == a3)
  {
    v14 = 1;
  }
  else
  {
    v13 = 1;
    v14 = 1;
    do
    {
      if ((objc_msgSend(v11, "isEqual:", a3) & 1) != 0)
        break;
      v14 = v13 < v6;
      if (v9 == v13)
        break;
      v15 = v8 + 1;
      v16 = v8 + 1 >= v6 ? v6 : 0;
      v8 = v15 - v16;
      v10 = 2 * (v15 - v16);
      v11 = *(id *)&v7[16 * (v15 - v16)];
      ++v13;
    }
    while (v11 && v11 != a3);
  }
  v18 = 2 * v6;
  if (v14)
    v18 = v10;
  if (v18 >= 2 * v6)
    return 0;
  else
    return *(id *)&self->_used[((8 * v18) | 8) + 8];
}

- (id)objectForKey:(id)a3
{
  unsigned int v3;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v18;

  v3 = self->_used[7];
  if (v3 < 4)
    return 0;
  v6 = *(_QWORD *)((char *)__NSDictionarySizes + ((2 * v3) & 0x1F8));
  v7 = (char *)self + 16;
  v8 = objc_msgSend(a3, "hash") % v6;
  v9 = v6 <= 1 ? 1 : v6;
  v10 = 2 * v8;
  v11 = *(id *)&v7[16 * v8];
  if (!v11 || v11 == a3)
  {
    v14 = 1;
  }
  else
  {
    v13 = 1;
    v14 = 1;
    do
    {
      if ((objc_msgSend(v11, "isEqual:", a3) & 1) != 0)
        break;
      v14 = v13 < v6;
      if (v9 == v13)
        break;
      v15 = v8 + 1;
      v16 = v8 + 1 >= v6 ? v6 : 0;
      v8 = v15 - v16;
      v10 = 2 * (v15 - v16);
      v11 = *(id *)&v7[16 * (v15 - v16)];
      ++v13;
    }
    while (v11 && v11 != a3);
  }
  v18 = 2 * v6;
  if (v14)
    v18 = v10;
  if (v18 >= 2 * v6)
    return 0;
  else
    return *(id *)&self->_used[((8 * v18) | 8) + 8];
}

- (unint64_t)count
{
  return *(_QWORD *)self->_used & 0x1FFFFFFFFFFFFFFLL;
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  unint64_t v4;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;

  if (!a3)
  {
    v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: function pointer is NULL"), v10);
    v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v11);
  }
  v4 = 2 * *(_QWORD *)((char *)__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8));
  if (v4)
  {
    v7 = 0;
    v8 = (char *)self + 16;
    do
    {
      v9 = *(_QWORD *)&v8[8 * v7];
      if (v9)
        ((void (*)(uint64_t, _QWORD, void *))a3)(v9, *(_QWORD *)&v8[8 * v7 + 8], a4);
      v7 += 2;
    }
    while (v7 < v4);
  }
}

- (void)dealloc
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (&__NSDictionary0__struct == (__objc2_class **)self)
    __break(1u);
  v3 = self->_used[7];
  v4 = __NSDictionarySizes[v3 >> 2];
  self->_used[7] = v3 & 3;
  *(_QWORD *)self->_used &= 0xFE00000000000000;
  v5 = 2 * v4;
  if (2 * v4)
  {
    v6 = (id *)((char *)self + 16);
    do
    {
      if ((uint64_t)*v6 >= 1)

      ++v6;
      --v5;
    }
    while (v5);
  }
  v7.receiver = self;
  v7.super_class = (Class)__NSDictionaryI;
  -[__NSDictionaryI dealloc](&v7, sel_dealloc);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v6;
  unint64_t var0;
  unint64_t result;
  char *v9;
  void *v10;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;
  NSException *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[__NSDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSDictionaryI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_18;
  }
  if (a5 >> 61)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "-[__NSDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSDictionaryI countByEnumeratingWithState:objects:count:]", a5);
LABEL_18:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v17);
  }
  v6 = *(_QWORD *)((char *)__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8));
  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_0;
  if (v6 <= var0)
    return 0;
  a3->var1 = a4;
  if (!a5)
    return 0;
  result = 0;
  v9 = (char *)self + 16;
  do
  {
    v10 = *(void **)&v9[16 * var0++];
    a3->var0 = var0;
    if (v10)
    {
      a4[result++] = v10;
      var0 = a3->var0;
    }
  }
  while (var0 < v6 && result < a5);
  return result;
}

- (id)keyEnumerator
{
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSFastEnumerationEnumerator), "initWithObject:", self);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  unsigned int v6;
  size_t v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  NSException *v14;
  _BYTE v15[8];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v10 = _os_log_pack_size();
    v12 = &v15[-((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0)];
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = "-[__NSDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]");
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v14);
  }
  v6 = self->_used[7];
  v7 = *(_QWORD *)((char *)__NSDictionarySizes + ((2 * v6) & 0x1F8));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65____NSDictionaryI_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke;
  v16[3] = &unk_1E12E1328;
  v16[4] = self;
  v16[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v16) & 1) == 0)
  {
    v15[7] = 0;
    if (v6 >= 4)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)&self->_used[16 * v8 + 8])
        {
          v9 = (void *)_CFAutoreleasePoolPush();
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
        }
        ++v8;
      }
      while (v8 < v7);
    }
  }
}

- (id)_cfMutableCopy
{
  id result;

  result = _NSDictionaryI_mutableCopyWithZone(self, (uint64_t)a2);
  *((_QWORD *)result + 2) = *((_QWORD *)result + 2) & 0xFFFFFFFF7FFFFFFFLL | ((((unint64_t)self->_used[7] >> 1) & 1) << 31);
  return result;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  char *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  NSException *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a5 >> 61;
  if (a3 && v5 || a4 && v5)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[__NSDictionaryI getObjects:andKeys:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSDictionaryI getObjects:andKeys:count:]", a5);
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
    objc_exception_throw(v15);
  }
  v6 = *(_QWORD *)self->_used & 0x1FFFFFFFFFFFFFFLL;
  if (v6 >= a5)
    v6 = a5;
  v7 = 2 * *(_QWORD *)((char *)__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8));
  if (v7)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = 0;
    v10 = (char *)self + 16;
    do
    {
      v11 = *(void **)&v10[8 * v9];
      if (v11)
      {
        if (a4)
          *a4++ = v11;
        if (a3)
          *a3++ = *(id *)&v10[8 * v9 + 8];
        --v6;
      }
      v9 += 2;
    }
    while (v9 < v7 && v6);
  }
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  char v5;
  unsigned int v7;
  size_t v8;
  NSSet *v9;
  size_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSException *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[8];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v16 = _os_log_pack_size();
    v18 = (char *)&v21 - ((MEMORY[0x1E0C80A78](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315138;
    *(_QWORD *)(v19 + 4) = "-[__NSDictionaryI keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[__NSDictionaryI keysOfEntriesWithOptions:passingTest:]");
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v16);
    objc_exception_throw(v20);
  }
  v5 = a3;
  v7 = self->_used[7];
  v8 = *(_QWORD *)((char *)__NSDictionarySizes + ((2 * v7) & 0x1F8));
  v9 = +[NSSet set](NSMutableSet, "set");
  v24 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56____NSDictionaryI_keysOfEntriesWithOptions_passingTest___block_invoke;
  v23[3] = &unk_1E12E1378;
  v23[6] = a4;
  v23[7] = &v24;
  v23[4] = self;
  v23[5] = v9;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 0, v8, (uint64_t)v23) & 1) == 0)
  {
    v22 = 0;
    if (v7 >= 4)
    {
      v10 = 0;
      v11 = (char *)self + 16;
      do
      {
        v12 = *(_QWORD *)&v11[16 * v10];
        if (v12)
        {
          v13 = *(_QWORD *)&v11[(16 * v10) | 8];
          v14 = (void *)_CFAutoreleasePoolPush();
          if ((*((unsigned int (**)(id, uint64_t, uint64_t, char *))a4 + 2))(a4, v12, v13, &v22))
            -[NSSet addObject:](v9, "addObject:", v12);
          _CFAutoreleasePoolPop(v14);
          if (v22)
            break;
        }
        ++v10;
      }
      while (v10 < v8);
    }
    return +[NSSet setWithSet:](NSSet, "setWithSet:", v9);
  }
  return v9;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  unsigned int v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  id *list;
  void *v11;
  id v12;
  void *v13;
  char v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = self->_used[7];
  v7 = *(_QWORD *)((char *)__NSDictionarySizes + ((2 * v6) & 0x1F8));
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53____NSDictionaryI_keyOfEntryWithOptions_passingTest___block_invoke;
  v16[3] = &unk_1E12E1350;
  v16[4] = self;
  v16[5] = a4;
  v16[6] = &v17;
  if (__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v16))
  {
    v8 = (void *)atomic_load((unint64_t *)v18 + 3);
  }
  else
  {
    v15 = 0;
    if (v6 >= 4)
    {
      v8 = 0;
      if (v7 <= 1)
        v9 = 1;
      else
        v9 = v7;
      list = self->_list;
      do
      {
        v11 = *(list - 1);
        if (v11)
        {
          v12 = *list;
          v13 = (void *)_CFAutoreleasePoolPush();
          if ((*((unsigned int (**)(id, void *, id, char *))a4 + 2))(a4, v11, v12, &v15))
          {
            v15 = 1;
            v8 = v11;
          }
          _CFAutoreleasePoolPop(v13);
          if (v15)
            break;
        }
        list += 2;
        --v9;
      }
      while (v9);
    }
    else
    {
      v8 = 0;
    }
  }
  _Block_object_dispose(&v17, 8);
  return v8;
}

- (double)_clumpingFactor
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  size_t v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  size_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)self->_used;
  if ((v3 & 0x1FFFFFFFFFFFFFELL) != 0)
    v4 = v3 & 0x1FFFFFFFFFFFFFFLL;
  else
    v4 = 1;
  v5 = MEMORY[0x1E0C80A78](v4, a2);
  v8 = (char *)&v24 - v7;
  v24 = 0;
  if (v6 >= 0x101)
  {
    v8 = (char *)_CFCreateArrayStorage(v5, 0, &v24);
    v6 = *(_QWORD *)self->_used & 0x1FFFFFFFFFFFFFFLL;
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  -[__NSDictionaryI getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0, v8, v6, v24, v25);
  v10 = *(_QWORD *)self->_used & 0x1FFFFFFFFFFFFFFLL;
  v11 = 0.0;
  if (v10 >= 2)
  {
    v12 = *(_QWORD *)((char *)__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8));
    v13 = 8 * v10;
    v14 = (uint64_t *)malloc_type_malloc(8 * v10 + 8, 0xDD117B67uLL);
    v15 = 0;
    do
    {
      v14[v15 / 8] = objc_msgSend(*(id *)&v8[v15], "hash") % v12;
      v15 += 8;
    }
    while (v13 != v15);
    qsort(v14, v10, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness);
    v16 = 0;
    v17 = *v14;
    v14[v10] = *v14 + v12;
    v18 = (double)v12 / (double)v10;
    v19 = 0.0;
    do
    {
      v20 = v14[v16 / 8 + 1];
      v21 = v20 - v17;
      if (v18 <= (double)v21)
        v22 = 0.0;
      else
        v22 = v18 - (double)v21;
      v19 = v19 + v22 * v22;
      v16 += 8;
      v17 = v20;
    }
    while (v13 != v16);
    free(v14);
    v11 = v19 * (double)v10 * (double)v10 / ((double)v12 * (double)v12) / ((double)v10 + -1.0);
  }
  free(v9);
  return v11;
}

- (double)_clumpingInterestingThreshold
{
  double v2;

  v2 = (double)*(unint64_t *)((char *)&__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8));
  return 1.0
       - ((double)(*(_QWORD *)self->_used & 0x1FFFFFFFFFFFFFFLL) + (double)(*(_QWORD *)self->_used & 0x1FFFFFFFFFFFFFFLL))
       / v2
       + (double)(*(_QWORD *)self->_used & 0x1FFFFFFFFFFFFFFLL)
       * (double)(*(_QWORD *)self->_used & 0x1FFFFFFFFFFFFFFLL)
       / v2
       / v2;
}

@end
