@implementation __NSFrozenDictionaryM

- (id)objectForKey:(id)a3
{
  unint64_t mutations;
  unint64_t v5;
  state **buffer;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  state *v10;
  unint64_t v11;

  mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58))
    return 0;
  v5 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = self->storage.buffer;
  v7 = objc_msgSend(a3, "hash") % v5;
  v8 = v5 <= 1 ? 1 : v5;
  v9 = v5;
  while (1)
  {
    v10 = buffer[v7];
    if (!v10)
      break;
    if (v10 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v9 == v5)
        v9 = v7;
    }
    else if (v10 == a3 || (-[state isEqual:](v10, "isEqual:", a3) & 1) != 0)
    {
      v9 = v7;
      goto LABEL_21;
    }
    if (v7 + 1 >= v5)
      v11 = v5;
    else
      v11 = 0;
    v7 = v7 + 1 - v11;
    if (!--v8)
      goto LABEL_21;
  }
  if (v9 == v5)
    v9 = v7;
LABEL_21:
  if (v9 < v5)
    return *(&buffer[v5] + v9);
  else
    return 0;
}

- (unint64_t)count
{
  return self->storage.var0.var1.other & 0x1FFFFFF;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t v5;
  unint64_t mutations;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  state **buffer;
  state *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSException *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a5 >> 61;
  if (a3 && v5 || a4 && v5)
  {
    v16 = _os_log_pack_size();
    v18 = (char *)v21 - ((MEMORY[0x1E0C80A78](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "-[__NSFrozenDictionaryM getObjects:andKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSFrozenDictionaryM getObjects:andKeys:count:]", a5);
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v16);
    objc_exception_throw(v20);
  }
  mutations = self->storage.var0.var0.mutations;
  v7 = mutations >> 58;
  v8 = HIDWORD(mutations) & 0x1FFFFFF;
  if (v8 >= a5)
    v8 = a5;
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = 0;
    v11 = LODWORD(__NSDictionarySizes_0[v7]);
    buffer = self->storage.buffer;
    do
    {
      v13 = buffer[v10];
      if (v13)
        v14 = v13 == (state *)&___NSDictionaryM_DeletedMarker;
      else
        v14 = 1;
      if (!v14)
      {
        if (a4)
          *a4++ = v13;
        if (a3)
          *a3++ = *(&buffer[v11] + v10);
        --v8;
      }
      ++v10;
    }
    while (v10 < v11 && v8);
  }
}

- (void)dealloc
{
  _cow_failure(CFSTR("Attempting to over-release (immutable)"));
}

- (id)objectForKeyedSubscript:(id)a3
{
  unint64_t mutations;
  unint64_t v5;
  state **buffer;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  state *v10;
  unint64_t v11;

  mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58))
    return 0;
  v5 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = self->storage.buffer;
  v7 = objc_msgSend(a3, "hash") % v5;
  v8 = v5 <= 1 ? 1 : v5;
  v9 = v5;
  while (1)
  {
    v10 = buffer[v7];
    if (!v10)
      break;
    if (v10 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v9 == v5)
        v9 = v7;
    }
    else if (v10 == a3 || (-[state isEqual:](v10, "isEqual:", a3) & 1) != 0)
    {
      v9 = v7;
      goto LABEL_21;
    }
    if (v7 + 1 >= v5)
      v11 = v5;
    else
      v11 = 0;
    v7 = v7 + 1 - v11;
    if (!--v8)
      goto LABEL_21;
  }
  if (v9 == v5)
    v9 = v7;
LABEL_21:
  if (v9 < v5)
    return *(&buffer[v5] + v9);
  else
    return 0;
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  unint64_t v4;
  unint64_t v6;
  state **buffer;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  NSException *v11;

  if (!a3)
  {
    v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: function pointer is NULL"), v10);
    v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v11);
  }
  v4 = self->storage.var0.var0.mutations >> 58;
  if (v4)
  {
    v6 = v4;
    buffer = self->storage.buffer;
    if (LODWORD(__NSDictionarySizes_0[v6]) <= 1uLL)
      v8 = 1;
    else
      v8 = LODWORD(__NSDictionarySizes_0[v6]);
    do
    {
      if (*buffer)
        v9 = *buffer == (state *)&___NSDictionaryM_DeletedMarker;
      else
        v9 = 1;
      if (!v9)
        ((void (*)(void))a3)();
      ++buffer;
      --v8;
    }
    while (v8);
  }
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
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
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
  _cow_copy((uint64_t)self, 0, v10, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t v6;
  state **buffer;
  unint64_t result;
  state *v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  NSException *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v12 = _os_log_pack_size();
    v14 = (char *)v20 - ((MEMORY[0x1E0C80A78](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_20;
  }
  if (a5 >> 61)
  {
    v12 = _os_log_pack_size();
    v14 = (char *)v20 - ((MEMORY[0x1E0C80A78](v12, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315394;
    *(_QWORD *)(v18 + 4) = "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(_QWORD *)(v18 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]", a5);
LABEL_20:
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v12);
    objc_exception_throw(v19);
  }
  var0 = a3->var0;
  v6 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((self->storage.var0.var0.mutations >> 55) & 0x1F8));
  if (!a3->var0)
    a3->var2 = (unint64_t *)&mdict_countByEnumeratingWithStateObjectsCount_const_mu;
  if (var0 >= v6)
    return 0;
  buffer = self->storage.buffer;
  a3->var1 = a4;
  result = 0;
  if (a5)
  {
    do
    {
      v9 = buffer[var0];
      if (v9)
        v10 = v9 == (state *)&___NSDictionaryM_DeletedMarker;
      else
        v10 = 1;
      if (!v10)
        a4[result++] = v9;
      ++var0;
    }
    while (var0 < v6 && result < a5);
  }
  a3->var0 = var0;
  return result;
}

- (id)keyEnumerator
{
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSFastEnumerationEnumerator), "initWithObject:", self);
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
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
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
  _cow_copy((uint64_t)self, 0, v11, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v10, 1);
  return v10;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  unint64_t mutations;
  state **buffer;
  size_t v7;
  size_t v8;
  state *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  NSException *v16;
  _BYTE v17[16];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v12 = _os_log_pack_size();
    v14 = &v17[-((MEMORY[0x1E0C80A78](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0)];
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[__NSFrozenDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSFrozenDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v12);
    objc_exception_throw(v16);
  }
  buffer = self->storage.buffer;
  mutations = self->storage.var0.var0.mutations;
  v7 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __mdict_enumerateKeysAndObjectsWithOptionsUsingBlock_block_invoke;
  v18[3] = &unk_1E1337580;
  v18[4] = a4;
  v18[5] = buffer;
  v18[6] = &buffer[v7];
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v18) & 1) == 0)
  {
    v17[15] = 0;
    if (mutations >> 58)
    {
      v8 = 0;
      do
      {
        v9 = buffer[v8];
        if (v9)
          v10 = v9 == (state *)&___NSDictionaryM_DeletedMarker;
        else
          v10 = 1;
        if (!v10)
        {
          v11 = (void *)_CFAutoreleasePoolPush();
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v11);
        }
        ++v8;
      }
      while (v8 < v7);
    }
  }
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  NSException *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v5 = _os_log_pack_size();
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v6 + 4) = "-[__NSFrozenDictionaryM keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[__NSFrozenDictionaryM keysOfEntriesWithOptions:passingTest:]");
    v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    objc_exception_throw(v7);
  }
  return mdict_keysOfEntriesWithOptionsPassingTest((uint64_t *)&self->storage, a3, (uint64_t)a4);
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  unint64_t mutations;
  state **buffer;
  size_t v7;
  state *v8;
  uint64_t v9;
  state *v10;
  BOOL v11;
  state *v12;
  void *v13;
  char v15;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  buffer = self->storage.buffer;
  mutations = self->storage.var0.var0.mutations;
  v7 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __mdict_keyOfEntryWithOptionsPassingTest_block_invoke;
  v16[3] = &unk_1E13375A8;
  v16[6] = buffer;
  v16[7] = &buffer[v7];
  v16[4] = a4;
  v16[5] = &v17;
  if (__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v16))
  {
    v8 = (state *)atomic_load((unint64_t *)v18 + 3);
  }
  else
  {
    v15 = 0;
    if (mutations >> 58)
    {
      v8 = 0;
      if (v7 <= 1)
        v9 = 1;
      else
        v9 = v7;
      do
      {
        v10 = *buffer;
        if (*buffer)
          v11 = v10 == (state *)&___NSDictionaryM_DeletedMarker;
        else
          v11 = 1;
        if (!v11)
        {
          v12 = buffer[v7];
          v13 = (void *)_CFAutoreleasePoolPush();
          if ((*((unsigned int (**)(id, state *, state *, char *))a4 + 2))(a4, v10, v12, &v15))
          {
            v15 = 1;
            v8 = v10;
          }
          _CFAutoreleasePoolPop(v13);
          if (v15)
            break;
        }
        ++buffer;
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

@end
