@implementation __NSOrderedSetM

- (void)removeObjectAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  unint64_t Count;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  NSException *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  v6 = atomic_load((unint64_t *)&self->cow);
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6))
      -[__NSOrderedSetM removeObjectAtIndex:].cold.1();
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSOrderedSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
  }
  p_storage = &self->storage;
  Count = CFBasicHashGetCount((uint64_t)p_storage->set);
  if ((a3 & 0x8000000000000000) != 0 || Count <= a3)
  {
    if (Count)
    {
      v14 = Count;
      v10 = _os_log_pack_size();
      v12 = (char *)v19 - ((MEMORY[0x1E0C80A78](v10, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[__NSOrderedSetM removeObjectAtIndex:]", a3, --v14);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v17, "-[__NSOrderedSetM removeObjectAtIndex:]", a3, v14);
    }
    else
    {
      v10 = _os_log_pack_size();
      v12 = (char *)v19 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)(v13 + 4) = "-[__NSOrderedSetM removeObjectAtIndex:]";
      *(_WORD *)(v13 + 12) = 2048;
      *(_QWORD *)(v13 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[__NSOrderedSetM removeObjectAtIndex:]", a3);
    }
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v18);
  }
  CFBasicHashRemoveValue((uint64_t)p_storage->set, (unint64_t)-[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a3));
  -[NSMutableArray removeObjectAtIndex:](p_storage->array, "removeObjectAtIndex:", a3);
}

- (void)_mutate
{
  uint64_t v2;
  NSMutableArray *array;

  array = self->storage.array;
  -[NSMutableArray _mutate](array, "_mutate");
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(array, v2, __CFTSANTagMutableOrderedSet);
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v3;
  unint64_t result;
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  uint64_t set;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    p_storage = &self->storage;
    set = (uint64_t)p_storage->set;
    if (p_storage->set)
    {
      v9 = 0u;
      v10 = 0u;
      CFBasicHashFindBucket(set, (unint64_t)a3, (uint64_t *)&v9);
      if (*((_QWORD *)&v10 + 1))
        return -[NSArray indexOfObjectIdenticalTo:](p_storage->array, "indexOfObjectIdenticalTo:", (_QWORD)v10);
      else
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (unint64_t)count
{
  return CFBasicHashGetCount((uint64_t)self->storage.set);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  unint64_t Count;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSException *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  NSException *v27;
  _QWORD v28[2];

  length = a4.length;
  location = a4.location;
  v28[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  p_storage = &self->storage;
  Count = CFBasicHashGetCount((uint64_t)p_storage->set);
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || Count < location + length)
  {
    if (Count)
    {
      v23 = Count;
      v11 = _os_log_pack_size();
      v13 = (char *)v28 - ((MEMORY[0x1E0C80A78](v11, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      v25 = _os_log_pack_fill();
      v26 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"_oset_getObjectsRange", location, length, --v23);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v26, "_oset_getObjectsRange", location, length, v23);
    }
    else
    {
      v11 = _os_log_pack_size();
      v13 = (char *)v28 - ((MEMORY[0x1E0C80A78](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      v14 = _os_log_pack_fill();
      v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"_oset_getObjectsRange", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v15, "_oset_getObjectsRange", location, length);
    }
    v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v13, v11);
    objc_exception_throw(v27);
  }
  if (!a3 && length)
  {
    v16 = _os_log_pack_size();
    v18 = (char *)v28 - ((MEMORY[0x1E0C80A78](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "_oset_getObjectsRange";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "_oset_getObjectsRange", length);
    goto LABEL_14;
  }
  if (length >> 61)
  {
    v16 = _os_log_pack_size();
    v18 = (char *)v28 - ((MEMORY[0x1E0C80A78](v16, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315394;
    *(_QWORD *)(v21 + 4) = "_oset_getObjectsRange";
    *(_WORD *)(v21 + 12) = 2048;
    *(_QWORD *)(v21 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "_oset_getObjectsRange", length);
LABEL_14:
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v16);
    objc_exception_throw(v22);
  }
  -[NSArray getObjects:range:](p_storage->array, "getObjects:range:", a3, location, length);
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v3;
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  unint64_t Count;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  NSException *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  p_storage = &self->storage;
  Count = CFBasicHashGetCount((uint64_t)p_storage->set);
  if (Count <= a3)
  {
    if (Count)
    {
      v13 = Count;
      v9 = _os_log_pack_size();
      v11 = (char *)v18 - ((MEMORY[0x1E0C80A78](v9, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
      v15 = _os_log_pack_fill();
      v16 = __os_log_helper_1_2_3_8_32_8_0_8_0(v15, (uint64_t)"_oset_objectAtIndex", a3, --v13);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v16, "_oset_objectAtIndex", a3, v13);
    }
    else
    {
      v9 = _os_log_pack_size();
      v11 = (char *)v18 - ((MEMORY[0x1E0C80A78](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = _os_log_pack_fill();
      *(_DWORD *)v12 = 136315394;
      *(_QWORD *)(v12 + 4) = "_oset_objectAtIndex";
      *(_WORD *)(v12 + 12) = 2048;
      *(_QWORD *)(v12 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "_oset_objectAtIndex", a3);
    }
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v11, v9);
    objc_exception_throw(v17);
  }
  return -[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a3);
}

- (id)mutableCopy
{
  uint64_t v2;
  unint64_t *p_cow;
  _WORD *v6;
  objc_class *v8;
  id v9;
  os_unfair_lock_s *v10;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v6, p_cow))
        goto LABEL_9;
    }
    __clrex();
    free(v6);
  }
LABEL_9:
  v8 = (objc_class *)objc_opt_self();
  v9 = __CFAllocateObject(v8, 0);
  v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (id)copy
{
  uint64_t v2;
  unint64_t *p_cow;
  _WORD *v6;
  objc_class *v8;
  id v9;
  os_unfair_lock_s *v10;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v6, p_cow))
        goto LABEL_9;
    }
    __clrex();
    free(v6);
  }
LABEL_9:
  v8 = (objc_class *)objc_opt_self();
  v9 = __CFAllocateObject(v8, 0);
  v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v9, 0);
  return v9;
}

- (void)removeAllObjects
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)dealloc
{
  _cow_failure(CFSTR("Attempting to over-release (mutable)"));
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v3;
  BOOL result;
  __CFBasicHash *set;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  result = 0;
  if (a3)
  {
    set = self->storage.set;
    if (set)
    {
      v8 = 0u;
      v9 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v8);
      return *((_QWORD *)&v9 + 1) != 0;
    }
  }
  return result;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v8;
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  unint64_t Count;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSException *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v8 = atomic_load((unint64_t *)&self->cow);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSOrderedSetM insertObject:atIndex:].cold.1();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSOrderedSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  if (!a3)
  {
    v13 = _os_log_pack_size();
    v15 = (char *)v29 - ((MEMORY[0x1E0C80A78](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[__NSOrderedSetM insertObject:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[__NSOrderedSetM insertObject:atIndex:]");
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v13);
    objc_exception_throw(v17);
  }
  p_storage = &self->storage;
  Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  v12 = Count;
  if ((a4 & 0x8000000000000000) != 0 || Count < a4)
  {
    if (Count)
    {
      v18 = _os_log_pack_size();
      v25 = (char *)v29 - ((MEMORY[0x1E0C80A78](v18, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      v26 = _os_log_pack_fill();
      v27 = v12 - 1;
      v28 = __os_log_helper_1_2_3_8_32_8_0_8_0(v26, (uint64_t)"-[__NSOrderedSetM insertObject:atIndex:]", a4, v27);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v28, "-[__NSOrderedSetM insertObject:atIndex:]", a4, v27);
      v22 = _CFAutoreleasePoolAddObject();
      v23 = v25;
    }
    else
    {
      v18 = _os_log_pack_size();
      v20 = (char *)v29 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = _os_log_pack_fill();
      *(_DWORD *)v21 = 136315394;
      *(_QWORD *)(v21 + 4) = "-[__NSOrderedSetM insertObject:atIndex:]";
      *(_WORD *)(v21 + 12) = 2048;
      *(_QWORD *)(v21 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[__NSOrderedSetM insertObject:atIndex:]", a4);
      v22 = _CFAutoreleasePoolAddObject();
      v23 = v20;
    }
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v22, 0, v23, v18));
  }
  if (CFBasicHashAddValue((uint64_t)p_storage->set, (unint64_t)a3, (uint64_t)a3))
    -[NSMutableArray insertObject:atIndex:](p_storage->array, "insertObject:atIndex:", a3, a4);
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v3;
  unint64_t result;
  __CFBasicHash *set;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  result = 0;
  if (a3)
  {
    set = self->storage.set;
    if (set)
    {
      v8 = 0u;
      v9 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v8);
      return *((_QWORD *)&v9 + 1) != 0;
    }
  }
  return result;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = _os_log_pack_size();
    v10 = (char *)v13 - ((MEMORY[0x1E0C80A78](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "_oset_enumerateObjectsWithOptionsUsingBlock";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "_oset_enumerateObjectsWithOptionsUsingBlock");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v10, v8);
    objc_exception_throw(v12);
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  -[NSArray enumerateObjectsWithOptions:usingBlock:](self->storage.array, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  unint64_t *p_cow;
  _WORD *v7;
  objc_class *v9;
  id v10;
  os_unfair_lock_s *v11;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v7 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v7, p_cow))
        goto LABEL_9;
    }
    __clrex();
    free(v7);
  }
LABEL_9:
  v9 = (objc_class *)objc_opt_self();
  v10 = __CFAllocateObject(v9, 0);
  v11 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v11, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v10, 1);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  unint64_t *p_cow;
  _WORD *v7;
  objc_class *v9;
  id v10;
  os_unfair_lock_s *v11;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v7 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v7, p_cow))
        goto LABEL_9;
    }
    __clrex();
    free(v7);
  }
LABEL_9:
  v9 = (objc_class *)objc_opt_self();
  v10 = __CFAllocateObject(v9, 0);
  v11 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v11, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v10, 0);
  return v10;
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  unint64_t Count;
  unint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSException *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v8 = atomic_load((unint64_t *)&self->cow);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSOrderedSetM replaceObjectAtIndex:withObject:].cold.1();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSOrderedSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  if (!a4)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)&v32[-1] - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  p_storage = &self->storage;
  Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  v12 = Count;
  if ((a3 & 0x8000000000000000) != 0 || Count <= a3)
  {
    if (Count)
    {
      v20 = _os_log_pack_size();
      v27 = (char *)&v32[-1] - ((MEMORY[0x1E0C80A78](v20, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
      v28 = _os_log_pack_fill();
      v29 = v12 - 1;
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v28, (uint64_t)"-[__NSOrderedSetM replaceObjectAtIndex:withObject:]", a3, v29);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v30, "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]", a3, v29);
      v24 = _CFAutoreleasePoolAddObject();
      v25 = v27;
    }
    else
    {
      v20 = _os_log_pack_size();
      v22 = (char *)&v32[-1] - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = _os_log_pack_fill();
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)(v23 + 4) = "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]";
      *(_WORD *)(v23 + 12) = 2048;
      *(_QWORD *)(v23 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]", a3);
      v24 = _CFAutoreleasePoolAddObject();
      v25 = v22;
    }
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v24, 0, v25, v20));
  }
  v13 = -[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a3);
  v14 = (unint64_t)v13;
  if (v13 != a4 && objc_msgSend(v13, "isEqual:", a4)
    || (CFBasicHashFindBucket((uint64_t)p_storage->set, (unint64_t)a4, v32), !v32[3]))
  {
    CFBasicHashRemoveValue((uint64_t)p_storage->set, v14);
    CFBasicHashAddValue((uint64_t)p_storage->set, (unint64_t)a4, (uint64_t)a4);
    -[NSMutableArray replaceObjectAtIndex:withObject:](p_storage->array, "replaceObjectAtIndex:withObject:", a3, a4);
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v8;
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  unint64_t Count;
  unint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSException *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v8 = atomic_load((unint64_t *)&self->cow);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSOrderedSetM setObject:atIndex:].cold.1();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSOrderedSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  if (!a3)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)&v32[-1] - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[__NSOrderedSetM setObject:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[__NSOrderedSetM setObject:atIndex:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  p_storage = &self->storage;
  Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  v12 = Count;
  if ((a4 & 0x8000000000000000) != 0 || Count < a4)
  {
    if (Count)
    {
      v20 = _os_log_pack_size();
      v27 = (char *)&v32[-1] - ((MEMORY[0x1E0C80A78](v20, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
      v28 = _os_log_pack_fill();
      v29 = v12 - 1;
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v28, (uint64_t)"-[__NSOrderedSetM setObject:atIndex:]", a4, v29);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v30, "-[__NSOrderedSetM setObject:atIndex:]", a4, v29);
      v24 = _CFAutoreleasePoolAddObject();
      v25 = v27;
    }
    else
    {
      v20 = _os_log_pack_size();
      v22 = (char *)&v32[-1] - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = _os_log_pack_fill();
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)(v23 + 4) = "-[__NSOrderedSetM setObject:atIndex:]";
      *(_WORD *)(v23 + 12) = 2048;
      *(_QWORD *)(v23 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[__NSOrderedSetM setObject:atIndex:]", a4);
      v24 = _CFAutoreleasePoolAddObject();
      v25 = v22;
    }
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v24, 0, v25, v20));
  }
  if (Count == a4)
  {
    if (CFBasicHashAddValue((uint64_t)p_storage->set, (unint64_t)a3, (uint64_t)a3))
      -[NSMutableArray insertObject:atIndex:](p_storage->array, "insertObject:atIndex:", a3, a4);
  }
  else
  {
    v13 = -[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a4);
    v14 = (unint64_t)v13;
    if (v13 != a3 && objc_msgSend(v13, "isEqual:", a3)
      || (CFBasicHashFindBucket((uint64_t)p_storage->set, (unint64_t)a3, v32), !v32[3]))
    {
      CFBasicHashRemoveValue((uint64_t)p_storage->set, v14);
      CFBasicHashAddValue((uint64_t)p_storage->set, (unint64_t)a3, (uint64_t)a3);
      -[NSMutableArray replaceObjectAtIndex:withObject:](p_storage->array, "replaceObjectAtIndex:withObject:", a4, a3);
    }
  }
}

- (void)insertObject:atIndex:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)removeObjectAtIndex:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)replaceObjectAtIndex:withObject:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)setObject:atIndex:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

@end
