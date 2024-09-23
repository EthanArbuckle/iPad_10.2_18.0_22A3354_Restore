@implementation __NSFrozenOrderedSetM

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  unint64_t Count;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSException *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  NSException *v25;
  _QWORD v26[2];

  length = a4.length;
  location = a4.location;
  v26[1] = *MEMORY[0x1E0C80C00];
  p_storage = &self->storage;
  Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || Count < location + length)
  {
    if (Count)
    {
      v21 = Count;
      v9 = _os_log_pack_size();
      v11 = (char *)v26 - ((MEMORY[0x1E0C80A78](v9, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = _os_log_pack_fill();
      v24 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v23, (uint64_t)"_oset_getObjectsRange", location, length, --v21);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v24, "_oset_getObjectsRange", location, length, v21);
    }
    else
    {
      v9 = _os_log_pack_size();
      v11 = (char *)v26 - ((MEMORY[0x1E0C80A78](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = _os_log_pack_fill();
      v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"_oset_getObjectsRange", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v13, "_oset_getObjectsRange", location, length);
    }
    v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v11, v9);
    objc_exception_throw(v25);
  }
  if (!a3 && length)
  {
    v14 = _os_log_pack_size();
    v16 = (char *)v26 - ((MEMORY[0x1E0C80A78](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315394;
    *(_QWORD *)(v17 + 4) = "_oset_getObjectsRange";
    *(_WORD *)(v17 + 12) = 2048;
    *(_QWORD *)(v17 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "_oset_getObjectsRange", length);
    goto LABEL_12;
  }
  if (length >> 61)
  {
    v14 = _os_log_pack_size();
    v16 = (char *)v26 - ((MEMORY[0x1E0C80A78](v14, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "_oset_getObjectsRange";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "_oset_getObjectsRange", length);
LABEL_12:
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v16, v14);
    objc_exception_throw(v20);
  }
  -[NSArray getObjects:range:](p_storage->array, "getObjects:range:", a3, location, length);
}

- (id)objectAtIndex:(unint64_t)a3
{
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  unint64_t Count;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  NSException *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  p_storage = &self->storage;
  Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  if (Count <= a3)
  {
    if (Count)
    {
      v11 = Count;
      v7 = _os_log_pack_size();
      v9 = (char *)v16 - ((MEMORY[0x1E0C80A78](v7, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"_oset_objectAtIndex", a3, --v11);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v14, "_oset_objectAtIndex", a3, v11);
    }
    else
    {
      v7 = _os_log_pack_size();
      v9 = (char *)v16 - ((MEMORY[0x1E0C80A78](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 136315394;
      *(_QWORD *)(v10 + 4) = "_oset_objectAtIndex";
      *(_WORD *)(v10 + 12) = 2048;
      *(_QWORD *)(v10 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "_oset_objectAtIndex", a3);
    }
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v9, v7);
    objc_exception_throw(v15);
  }
  return -[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a3);
}

- (unint64_t)count
{
  return CFBasicHashGetCount((uint64_t)self->storage.set);
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
    v6 = _cow_create((uint64_t)self, 0);
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
  _cow_copy((uint64_t)self, 0, v10, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (void)dealloc
{
  _cow_failure(CFSTR("Attempting to over-release (immutable)"));
}

- (unint64_t)countForObject:(id)a3
{
  unint64_t result;
  __CFBasicHash *set;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  result = 0;
  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    set = self->storage.set;
    if (set)
    {
      v6 = 0u;
      v7 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v6);
      return *((_QWORD *)&v7 + 1) != 0;
    }
  }
  return result;
}

- (unint64_t)indexOfObject:(id)a3
{
  unint64_t result;
  $A342FA53F7E4F7B60DCB2ECBD66E0CA0 *p_storage;
  __CFBasicHash *set;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    p_storage = &self->storage;
    set = self->storage.set;
    if (set)
    {
      v7 = 0u;
      v8 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v7);
      if (*((_QWORD *)&v8 + 1))
        return -[NSArray indexOfObjectIdenticalTo:](p_storage->array, "indexOfObjectIdenticalTo:", (_QWORD)v8);
      else
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (BOOL)containsObject:(id)a3
{
  BOOL result;
  __CFBasicHash *set;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  result = 0;
  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    set = self->storage.set;
    if (set)
    {
      v6 = 0u;
      v7 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v6);
      return *((_QWORD *)&v7 + 1) != 0;
    }
  }
  return result;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v4 = _os_log_pack_size();
    v6 = (char *)v9 - ((MEMORY[0x1E0C80A78](v4, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "_oset_enumerateObjectsWithOptionsUsingBlock";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "_oset_enumerateObjectsWithOptionsUsingBlock");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v6, v4);
    objc_exception_throw(v8);
  }
  -[NSArray enumerateObjectsWithOptions:usingBlock:](self->storage.array, "enumerateObjectsWithOptions:usingBlock:", a3);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
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
    v7 = _cow_create((uint64_t)self, 0);
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
  _cow_copy((uint64_t)self, 0, v11, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v10, 1);
  return v10;
}

@end
