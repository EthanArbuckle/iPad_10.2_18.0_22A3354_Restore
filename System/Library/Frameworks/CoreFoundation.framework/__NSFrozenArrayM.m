@implementation __NSFrozenArrayM

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  offset **v8;
  unsigned int size;
  uint64_t var0;
  BOOL v11;
  unint64_t v12;
  id *list;

  atomic_load((unint64_t *)&self->cow);
  result = a3->var0;
  if (a3->var0 == -1)
    return 0;
  p_storage = &self->storage;
  if (result)
  {
    list = (id *)p_storage->list;
    a3->var0 = -1;
    a3->var1 = list;
  }
  else
  {
    a3->var2 = (unint64_t *)&_deque_countByEnumeratingWithStateObjectsCount_const_mu;
    result = p_storage->state.var0.used;
    v8 = p_storage->list;
    var0 = p_storage->var0;
    size = p_storage->size;
    a3->var1 = (id *)&v8[var0];
    v11 = (int)var0 + (int)result >= size;
    v12 = (_DWORD)var0 + (_DWORD)result - size;
    if ((_DWORD)v12 != 0 && v11)
    {
      a3->var0 = v12;
      result -= v12;
    }
    else
    {
      a3->var0 = -1;
    }
  }
  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  unint64_t used;
  unsigned int size;
  unsigned int v5;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  NSException *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    v8 = _os_log_pack_size();
    v10 = (char *)v15 - ((MEMORY[0x1E0C80A78](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v12 = used - 1;
      v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v11, (uint64_t)"-[__NSFrozenArrayM objectAtIndexedSubscript:]", a3, v12);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v13, "-[__NSFrozenArrayM objectAtIndexedSubscript:]", a3, v12);
    }
    else
    {
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)(v11 + 4) = "-[__NSFrozenArrayM objectAtIndexedSubscript:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(_QWORD *)(v11 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSFrozenArrayM objectAtIndexedSubscript:]", a3);
    }
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v10, v8);
    objc_exception_throw(v14);
  }
  size = self->storage.size;
  v5 = self->storage.var0 + a3;
  if (size > v5)
    size = 0;
  return self->storage.list[v5 - size];
}

- (unint64_t)count
{
  return self->storage.state.var0.used;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  id *v5;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  NSUInteger used;
  offset **list;
  uint64_t size;
  unint64_t v10;
  offset **v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSException *v31;
  NSUInteger location;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  double v39;
  NSException *v40;
  _QWORD v41[2];

  length = a4.length;
  v5 = a3;
  v41[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4.length)
  {
    v25 = _os_log_pack_size();
    v27 = (char *)v41 - ((MEMORY[0x1E0C80A78](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    v28 = _os_log_pack_fill();
    *(_DWORD *)v28 = 136315394;
    *(_QWORD *)(v28 + 4) = "-[__NSFrozenArrayM getObjects:range:]";
    *(_WORD *)(v28 + 12) = 2048;
    *(_QWORD *)(v28 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSFrozenArrayM getObjects:range:]", length);
    goto LABEL_35;
  }
  if (a4.length >> 61)
  {
    v25 = _os_log_pack_size();
    v27 = (char *)v41 - ((MEMORY[0x1E0C80A78](v25, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    v30 = _os_log_pack_fill();
    *(_DWORD *)v30 = 136315394;
    *(_QWORD *)(v30 + 4) = "-[__NSFrozenArrayM getObjects:range:]";
    *(_WORD *)(v30 + 12) = 2048;
    *(_QWORD *)(v30 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSFrozenArrayM getObjects:range:]", length);
LABEL_35:
    v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v27, v25);
    objc_exception_throw(v31);
  }
  p_storage = &self->storage;
  used = self->storage.state.var0.used;
  if ((a4.location & 0x8000000000000000) != 0 || a4.location + a4.length > used)
  {
    location = a4.location;
    v33 = _os_log_pack_size();
    v35 = (char *)v41 - ((MEMORY[0x1E0C80A78](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    v36 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v38 = used - 1;
      v39 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v36, (uint64_t)"-[__NSFrozenArrayM getObjects:range:]", location, length, v38);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v39, "-[__NSFrozenArrayM getObjects:range:]", location, length, v38);
    }
    else
    {
      v37 = __os_log_helper_1_2_3_8_32_8_0_8_0(v36, (uint64_t)"-[__NSFrozenArrayM getObjects:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v37, "-[__NSFrozenArrayM getObjects:range:]", location, length);
    }
    v40 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v35, v33);
    objc_exception_throw(v40);
  }
  if (a3 && a4.length)
  {
    list = p_storage->list;
    size = self->storage.size;
    v10 = (unint64_t)&p_storage->list[size];
    v11 = &self->storage.list[self->storage.var0] + a4.location;
    v12 = -size;
    if (v10 <= (unint64_t)v11)
      v13 = -size;
    else
      v13 = 0;
    v14 = (void **)&v11[v13];
    switch(a4.length)
    {
      case 1uLL:
        goto LABEL_31;
      case 2uLL:
        goto LABEL_27;
      case 3uLL:
        goto LABEL_23;
      case 4uLL:
        goto LABEL_19;
      default:
        if ((uint64_t)(v10 - (_QWORD)v14) >> 3 >= a4.length)
          LODWORD(v15) = a4.length;
        else
          v15 = (uint64_t)(v10 - (_QWORD)v14) >> 3;
        if ((_DWORD)v15)
          memmove(a3, v14, 8 * v15);
        if ((_DWORD)length != (_DWORD)v15)
          memmove(&v5[v15], list, 8 * (length - v15));
LABEL_19:
        v17 = *v14;
        v16 = v14 + 1;
        *v5++ = v17;
        if (v10 <= (unint64_t)v16)
          v18 = v12;
        else
          v18 = 0;
        v14 = (void **)&v16[v18];
LABEL_23:
        v20 = *v14;
        v19 = v14 + 1;
        *v5++ = v20;
        if (v10 <= (unint64_t)v19)
          v21 = v12;
        else
          v21 = 0;
        v14 = (void **)&v19[v21];
LABEL_27:
        v23 = *v14;
        v22 = v14 + 1;
        *v5++ = v23;
        if (v10 <= (unint64_t)v22)
          v24 = v12;
        else
          v24 = 0;
        v14 = (void **)&v22[v24];
LABEL_31:
        *v5 = *v14;
        break;
    }
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t *p_cow;
  _WORD *v6;
  objc_class *v8;
  id v9;
  os_unfair_lock_s *v10;

  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 0);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v6, p_cow))
        goto LABEL_7;
    }
    __clrex();
    free(v6);
  }
LABEL_7:
  v8 = (objc_class *)objc_opt_self();
  v9 = __CFAllocateObject(v8, 0);
  v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 0, v10, (uint64_t)__NSArray_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t used;
  unsigned int size;
  unsigned int v5;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  NSException *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    v8 = _os_log_pack_size();
    v10 = (char *)v15 - ((MEMORY[0x1E0C80A78](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v12 = used - 1;
      v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v11, (uint64_t)"-[__NSFrozenArrayM objectAtIndex:]", a3, v12);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v13, "-[__NSFrozenArrayM objectAtIndex:]", a3, v12);
    }
    else
    {
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)(v11 + 4) = "-[__NSFrozenArrayM objectAtIndex:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(_QWORD *)(v11 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSFrozenArrayM objectAtIndex:]", a3);
    }
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v10, v8);
    objc_exception_throw(v14);
  }
  size = self->storage.size;
  v5 = self->storage.var0 + a3;
  if (size > v5)
    size = 0;
  return self->storage.list[v5 - size];
}

- (void)dealloc
{
  _cow_failure(CFSTR("Attempting to over-release (immutable)"));
}

- (id)mutableCopy
{
  unint64_t *p_cow;
  _WORD *v5;
  objc_class *v7;
  id v8;
  os_unfair_lock_s *v9;

  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v5 = _cow_create((uint64_t)self, 0);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v5, p_cow))
        goto LABEL_7;
    }
    __clrex();
    free(v5);
  }
LABEL_7:
  v7 = (objc_class *)objc_opt_self();
  v8 = __CFAllocateObject(v7, 0);
  v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 0, v9, (uint64_t)__NSArray_cowCallbacks, (uint64_t)v8, 1);
  return v8;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v5;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  unsigned int size;
  size_t used;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSException *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[6];
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v13 = _os_log_pack_size();
    v15 = (char *)&v18 - ((MEMORY[0x1E0C80A78](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[__NSFrozenArrayM enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSFrozenArrayM enumerateObjectsWithOptions:usingBlock:]");
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v13);
    objc_exception_throw(v17);
  }
  v5 = a3;
  p_storage = &self->storage;
  size = self->storage.size;
  used = self->storage.state.var0.used;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___deque_enumerateObjectsWithOptionsBlock_block_invoke;
  v20[3] = &unk_1E12E0EE0;
  v21 = size;
  v20[4] = a4;
  v20[5] = &self->storage;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, used, (uint64_t)v20) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      v19 = 0;
      v11 = p_storage->state.var0.used;
      while (v11)
      {
        --v11;
        v12 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v12);
      }
    }
    else
    {
      v19 = 0;
      if (p_storage->state.var0.used)
      {
        v9 = 0;
        do
        {
          v10 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
          ++v9;
        }
        while (v9 < p_storage->state.var0.used);
      }
    }
  }
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  offset **list;
  unsigned int used;
  uint64_t var0;
  unsigned int v6;
  uint64_t v7;
  unint64_t result;
  offset **v9;

  list = self->storage.list;
  used = self->storage.state.var0.used;
  var0 = self->storage.var0;
  v6 = self->storage.size - var0;
  if (used >= v6)
    v7 = v6;
  else
    v7 = used;
  if ((_DWORD)v7)
  {
    result = 0;
    v9 = &list[var0];
    while (v9[result] != a3)
    {
      if (v7 == ++result)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    if (used <= v6)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      while (*list != a3)
      {
        LODWORD(v7) = v7 + 1;
        ++list;
        if (used == (_DWORD)v7)
          return 0x7FFFFFFFFFFFFFFFLL;
      }
      return v7;
    }
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
