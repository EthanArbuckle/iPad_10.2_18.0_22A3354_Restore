@implementation __NSSetM

- (void)removeObject:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  unsigned int muts;
  unsigned int v8;
  unint64_t v10;
  unint64_t v11;
  state **objs;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  state *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSException *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  v6 = atomic_load((unint64_t *)&self->cow);
  muts = self->storage.var0.var0.muts;
  if (muts >> 9 < 0x7D)
    v8 = muts + 1;
  else
    v8 = 0;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6))
      -[__NSSetM removeObject:].cold.1();
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
  }
  self->storage.var0.var0.muts = v8;
  if (!a3)
  {
    v23 = _os_log_pack_size();
    v25 = (char *)v28 - ((MEMORY[0x1E0C80A78](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    v26 = _os_log_pack_fill();
    *(_DWORD *)v26 = 136315138;
    *(_QWORD *)(v26 + 4) = "-[__NSSetM removeObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[__NSSetM removeObject:]");
    v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v25, v23);
    objc_exception_throw(v27);
  }
  v10 = *((unsigned int *)&self->storage.var0.var0 + 1);
  if (v10 >> 26)
  {
    v28[0] = v10 >> 26;
    v11 = __NSSetSizes_0[2 * (v10 >> 26)];
    objs = self->storage.objs;
    v13 = 0;
    v14 = objc_msgSend(a3, "hash") % v11;
    v15 = v11 <= 1 ? 1 : v11;
    v16 = v11;
    while (1)
    {
      v17 = objs[v14];
      if (!v17)
        break;
      if (v17 == (state *)&___NSSetM_DeletedMarker)
      {
        ++v13;
        if (v16 == v11)
          v16 = v14;
      }
      else if (v17 == a3 || (-[state isEqual:](v17, "isEqual:", a3) & 1) != 0)
      {
        v16 = v14;
        goto LABEL_35;
      }
      if (v14 + 1 >= v11)
        v18 = v11;
      else
        v18 = 0;
      v14 = v14 + 1 - v18;
      if (!--v15)
        goto LABEL_35;
    }
    if (v16 == v11)
      v16 = v14;
LABEL_35:
    if (v16 < v11)
    {
      v19 = (unint64_t)objs[v16];
      if (v19 && v19 != (_QWORD)&___NSSetM_DeletedMarker)
      {
        objs[v16] = (state *)&___NSSetM_DeletedMarker;
        *((_DWORD *)&self->storage.var0.var0 + 1) = *((_DWORD *)&self->storage.var0.var0 + 1) & 0xFC000000 | (*((_DWORD *)&self->storage.var0.var0 + 1) - 1) & 0x3FFFFFF;
        if (v13 > 0xF)
        {
          __rehashs((uint64_t)self, v28[0]);
          if ((v19 & 0x8000000000000000) != 0)
            return;
        }
        else
        {
          if (v16 + 1 < v11)
            v21 = v16 + 1;
          else
            v21 = 0;
          if (!objs[v21])
          {
            do
            {
              objs[v16] = 0;
              if (v16)
                v22 = v16;
              else
                v22 = v11;
              v16 = v22 - 1;
            }
            while (objs[v22 - 1] == (state *)&___NSSetM_DeletedMarker);
          }
          if ((v19 & 0x8000000000000000) != 0)
            return;
        }

      }
    }
  }
}

- (void)addObject:(id)a3
{
  uint64_t v3;
  __NSSetM *v5;
  uint64_t v6;
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  unsigned int muts;
  unsigned int v9;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  state **objs;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  state *v21;
  unint64_t v22;
  int v23;
  state *v24;
  unsigned int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  NSException *v32;
  uint64_t v33;
  uint64_t v34;
  __NSSetM *v35;
  uint64_t v36;

  v35 = self;
  v36 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(v35, v3, __CFTSANTagMutableSet);
    if (a3)
      goto LABEL_3;
LABEL_53:
    v28 = _os_log_pack_size();
    v30 = (char *)&v33 - ((MEMORY[0x1E0C80A78](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136315138;
    *(_QWORD *)(v31 + 4) = "-[__NSSetM addObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[__NSSetM addObject:]");
    v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v30, v28);
    objc_exception_throw(v32);
  }
  if (!a3)
    goto LABEL_53;
LABEL_3:
  v5 = v35;
  v6 = atomic_load((unint64_t *)&v35->cow);
  p_storage = &v5->storage;
  muts = v5->storage.var0.var0.muts;
  if (muts >> 9 < 0x7D)
    v9 = muts + 1;
  else
    v9 = 0;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6))
      -[__NSSetM addObject:].cold.1();
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)v35, v6, (uint64_t)__NSSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
  }
  p_storage->var0.var0.muts = v9;
  v11 = *((unsigned int *)&p_storage->var0.var0 + 1);
  if (v11 >> 29 >= 5)
    __break(1u);
  if (v11 >> 26)
  {
    v34 = *((unsigned int *)&p_storage->var0.var0 + 1);
    v12 = v11 >> 26;
    v13 = __NSSetSizes_0[2 * (v11 >> 26)];
  }
  else
  {
    *((_DWORD *)&p_storage->var0.var0 + 1) = v11 | 0x4000000;
    LODWORD(v12) = 1;
    p_storage->objs = (state **)malloc_type_calloc(1uLL, 0x18uLL, 0x80040B8603338uLL);
    v34 = *((unsigned int *)&p_storage->var0.var0 + 1);
    v13 = 3;
  }
  while (1)
  {
    objs = p_storage->objs;
    v15 = v13;
    v16 = objc_msgSend(a3, "hash");
    v17 = 0;
    if (v15)
    {
      v18 = v16 % v15;
      v19 = v15;
      v20 = v15;
      while (1)
      {
        v21 = objs[v18];
        if (!v21)
          break;
        if (v21 == (state *)&___NSSetM_DeletedMarker)
        {
          ++v17;
          if (v20 == v15)
            v20 = v18;
        }
        else if (v21 == a3 || (-[state isEqual:](v21, "isEqual:", a3) & 1) != 0)
        {
          v20 = v18;
          goto LABEL_36;
        }
        if (v18 + 1 >= v15)
          v22 = v15;
        else
          v22 = 0;
        v18 = v18 + 1 - v22;
        if (!--v19)
          goto LABEL_36;
      }
      if (v20 == v15)
        v20 = v18;
    }
    else
    {
      v20 = 0;
    }
LABEL_36:
    if (v20 < v15 && v17 <= 0xF)
      break;
    if (v20 < v15)
      v23 = v12;
    else
      v23 = v12 + 1;
    __rehashs((uint64_t)v35, v23);
    v12 = (unint64_t)*((unsigned int *)&p_storage->var0.var0 + 1) >> 26;
    v13 = __NSSetSizes_0[2 * v12];
  }
  v24 = objs[v20];
  if (v24 == (state *)&___NSSetM_DeletedMarker || v24 == 0)
  {
    v26 = v34 & 0x3FFFFFF;
    if (((unint64_t)a3 & 0x8000000000000000) == 0)
      v27 = a3;
    objs[v20] = (state *)a3;
    *((_DWORD *)&p_storage->var0.var0 + 1) = *((_DWORD *)&p_storage->var0.var0 + 1) & 0xFC000000 | (*((_DWORD *)&p_storage->var0.var0 + 1)
                                                                                                  + 1) & 0x3FFFFFF;
    if (__NSSetCapacities_0[v12] < (unint64_t)v26)
      __rehashs((uint64_t)v35, v12 + 1);
  }
}

- (void)_mutate
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v3;
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  unint64_t v7;
  unint64_t v8;
  state **objs;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  state *v13;
  unint64_t v14;
  state *v15;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  p_storage = &self->storage;
  v7 = *((unsigned int *)&p_storage->var0.var0 + 1);
  if (!(v7 >> 26))
    return 0;
  v8 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v7 >> 23) & 0x1F8));
  objs = p_storage->objs;
  v10 = objc_msgSend(a3, "hash") % v8;
  v11 = v8 <= 1 ? 1 : v8;
  v12 = v8;
  while (1)
  {
    v13 = objs[v10];
    if (!v13)
      break;
    if (v13 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v12 == v8)
        v12 = v10;
    }
    else if (v13 == a3 || (-[state isEqual:](v13, "isEqual:", a3) & 1) != 0)
    {
      v12 = v10;
      goto LABEL_23;
    }
    if (v10 + 1 >= v8)
      v14 = v8;
    else
      v14 = 0;
    v10 = v10 + 1 - v14;
    if (!--v11)
      goto LABEL_23;
  }
  if (v12 == v8)
    v12 = v10;
LABEL_23:
  if (v12 >= v8)
    return 0;
  v15 = p_storage->objs[v12];
  return v15 != (state *)&___NSSetM_DeletedMarker && v15 != 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  unint64_t var0;
  unint64_t v11;
  unint64_t result;
  state *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSException *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableSet);
    if (a4)
      goto LABEL_4;
  }
  else if (a4)
  {
    goto LABEL_4;
  }
  if (a5)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)v22 - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315394;
    *(_QWORD *)(v18 + 4) = "-[__NSSetM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(_QWORD *)(v18 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSSetM countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_23;
  }
LABEL_4:
  if (a5 >> 61)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)v22 - ((MEMORY[0x1E0C80A78](v15, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315394;
    *(_QWORD *)(v20 + 4) = "-[__NSSetM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(_QWORD *)(v20 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSSetM countByEnumeratingWithState:objects:count:]", a5);
LABEL_23:
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v21);
  }
  var0 = a3->var0;
  v11 = *(unsigned int *)((char *)__NSSetSizes_0
                        + (((unint64_t)*((unsigned int *)&self->storage.var0.var0 + 1) >> 23) & 0x1F8));
  if (!a3->var0)
    a3->var2 = &self->storage.var0.mutations;
  if (var0 >= v11)
    return 0;
  a3->var1 = a4;
  result = 0;
  if (a5)
  {
    do
    {
      v13 = self->storage.objs[var0];
      if (v13)
        v14 = v13 == (state *)&___NSSetM_DeletedMarker;
      else
        v14 = 1;
      if (!v14)
        a4[result++] = v13;
      ++var0;
    }
    while (var0 < v11 && result < a5);
  }
  a3->var0 = var0;
  return result;
}

- (unint64_t)count
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  return *((_DWORD *)&self->storage.var0.var0 + 1) & 0x3FFFFFF;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v3;
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  unint64_t v7;
  unint64_t v8;
  state **objs;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  state *v13;
  unint64_t v14;
  state *v15;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  p_storage = &self->storage;
  v7 = *((unsigned int *)&p_storage->var0.var0 + 1);
  if (!(v7 >> 26))
    return 0;
  v8 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v7 >> 23) & 0x1F8));
  objs = p_storage->objs;
  v10 = objc_msgSend(a3, "hash") % v8;
  v11 = v8 <= 1 ? 1 : v8;
  v12 = v8;
  while (1)
  {
    v13 = objs[v10];
    if (!v13)
      break;
    if (v13 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v12 == v8)
        v12 = v10;
    }
    else if (v13 == a3 || (-[state isEqual:](v13, "isEqual:", a3) & 1) != 0)
    {
      v12 = v10;
      goto LABEL_23;
    }
    if (v10 + 1 >= v8)
      v14 = v8;
    else
      v14 = 0;
    v10 = v10 + 1 - v14;
    if (!--v11)
      goto LABEL_23;
  }
  if (v12 == v8)
    v12 = v10;
LABEL_23:
  if (v12 >= v8)
    return 0;
  v15 = p_storage->objs[v12];
  return v15 != (state *)&___NSSetM_DeletedMarker && v15 != 0;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  uint64_t v4;
  unint64_t v8;
  int v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  state *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSException *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  if (!a3 && a4)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)v22 - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315394;
    *(_QWORD *)(v18 + 4) = "mset_getObjectsCount";
    *(_WORD *)(v18 + 12) = 2048;
    *(_QWORD *)(v18 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "mset_getObjectsCount", a4);
    goto LABEL_23;
  }
  if (a4 >> 61)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)v22 - ((MEMORY[0x1E0C80A78](v15, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315394;
    *(_QWORD *)(v20 + 4) = "mset_getObjectsCount";
    *(_WORD *)(v20 + 12) = 2048;
    *(_QWORD *)(v20 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "mset_getObjectsCount", a4);
LABEL_23:
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v21);
  }
  v8 = *((unsigned int *)&self->storage.var0.var0 + 1);
  v9 = v8 & 0x3FFFFFF;
  if ((v8 & 0x3FFFFFF) >= a4)
    v9 = a4;
  if (v9)
    v10 = v8 >> 26 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = 0;
    v12 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v8 >> 23) & 0x1F8));
    do
    {
      v13 = self->storage.objs[v11];
      if (v13)
        v14 = v13 == (state *)&___NSSetM_DeletedMarker;
      else
        v14 = 1;
      if (!v14)
      {
        *a3++ = v13;
        --v9;
      }
      if (!v9)
        break;
      ++v11;
    }
    while (v11 < v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  return (id)__NSSetM_copy((uint64_t)self, (uint64_t)a2);
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
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    if (__cf_tsanReadFunction)
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v7 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v7, p_cow))
        goto LABEL_8;
    }
    __clrex();
    free(v7);
  }
LABEL_8:
  v9 = (objc_class *)objc_opt_self();
  v10 = __CFAllocateObject(v9, 0);
  v11 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v11, (uint64_t)__NSSet_cowCallbacks, (uint64_t)v10, 1);
  return v10;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v4;
  char v6;
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  size_t v9;
  state **objs;
  size_t i;
  state *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  NSException *v19;
  _BYTE v20[8];
  _QWORD v21[7];

  v6 = a3;
  v21[6] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
    if (a4)
      goto LABEL_3;
LABEL_14:
    v15 = _os_log_pack_size();
    v17 = &v20[-((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0)];
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[__NSSetM enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSSetM enumerateObjectsWithOptions:usingBlock:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  if (!a4)
    goto LABEL_14;
LABEL_3:
  p_storage = &self->storage;
  v9 = *(unsigned int *)((char *)__NSSetSizes_0
                       + (((unint64_t)*((unsigned int *)&self->storage.var0.var0 + 1) >> 23) & 0x1F8));
  objs = p_storage->objs;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __mset_enumerateObjectsWithOptionsUsingBlock_block_invoke;
  v21[3] = &unk_1E1334610;
  v21[4] = a4;
  v21[5] = objs;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 0, v9, (uint64_t)v21) & 1) == 0)
  {
    v20[7] = 0;
    if (v9)
    {
      for (i = 0; i < v9; ++i)
      {
        v12 = objs[i];
        if (v12)
          v13 = v12 == (state *)&___NSSetM_DeletedMarker;
        else
          v13 = 1;
        if (!v13)
        {
          v14 = (void *)_CFAutoreleasePoolPush();
          __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v14);
        }
      }
    }
  }
}

- (id)copy
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  return (id)__NSSetM_copy((uint64_t)self, (uint64_t)a2);
}

- (void)dealloc
{
  _cow_failure(CFSTR("Attempting to over-release (mutable)"));
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
  {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
    if (__cf_tsanReadFunction)
      __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v6, p_cow))
        goto LABEL_8;
    }
    __clrex();
    free(v6);
  }
LABEL_8:
  v8 = (objc_class *)objc_opt_self();
  v9 = __CFAllocateObject(v8, 0);
  v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSSet_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (id)objectEnumerator
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSFastEnumerationEnumerator), "initWithObject:", self);
}

- (id)member:(id)a3
{
  uint64_t v3;
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  unint64_t v7;
  unint64_t v8;
  state **objs;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  state *v13;
  unint64_t v14;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  p_storage = &self->storage;
  v7 = *((unsigned int *)&p_storage->var0.var0 + 1);
  if (!(v7 >> 26))
    return 0;
  v8 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v7 >> 23) & 0x1F8));
  objs = p_storage->objs;
  v10 = objc_msgSend(a3, "hash") % v8;
  v11 = v8 <= 1 ? 1 : v8;
  v12 = v8;
  while (1)
  {
    v13 = objs[v10];
    if (!v13)
      break;
    if (v13 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v12 == v8)
        v12 = v10;
    }
    else if (v13 == a3 || (-[state isEqual:](v13, "isEqual:", a3) & 1) != 0)
    {
      v12 = v10;
      goto LABEL_23;
    }
    if (v10 + 1 >= v8)
      v14 = v8;
    else
      v14 = 0;
    v10 = v10 + 1 - v14;
    if (!--v11)
      goto LABEL_23;
  }
  if (v12 == v8)
    v12 = v10;
LABEL_23:
  if (v12 >= v8)
    return 0;
  if ((_UNKNOWN *)p_storage->objs[v12] == &___NSSetM_DeletedMarker)
    return 0;
  return p_storage->objs[v12];
}

- (void)removeAllObjects
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (double)clumpingFactor
{
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  int v4;
  size_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
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
  p_storage = &self->storage;
  v4 = *((_DWORD *)&self->storage.var0.var0 + 1);
  v5 = v4 & 0x3FFFFFF;
  if ((v4 & 0x3FFFFFF) != 0)
    v6 = v4 & 0x3FFFFFF;
  else
    v6 = 1;
  v7 = MEMORY[0x1E0C80A78](v6, a2);
  v9 = (char *)&v24 - v8;
  v24 = 0;
  if (v5 >= 0x101)
  {
    v9 = (char *)_CFCreateArrayStorage(v7, 0, &v24);
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  -[__NSSetM getObjects:count:](self, "getObjects:count:", v9, v5, v24, v25);
  v11 = 0.0;
  if (v5 >= 2)
  {
    v12 = *(unsigned int *)((char *)__NSSetSizes_0
                          + (((unint64_t)*((unsigned int *)&p_storage->var0.var0 + 1) >> 23) & 0x1F8));
    v13 = 8 * v5;
    v14 = (uint64_t *)malloc_type_malloc(8 * v5 + 8, 0xDD117B67uLL);
    v15 = 0;
    do
    {
      v14[v15 / 8] = objc_msgSend(*(id *)&v9[v15], "hash") % v12;
      v15 += 8;
    }
    while (v13 != v15);
    qsort(v14, v5, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_1);
    v16 = 0;
    v17 = *v14;
    v14[v5] = *v14 + v12;
    v18 = (double)v12 / (double)v5;
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
    v11 = v19
        * (double)v5
        * (double)v5
        / ((double)v12
         * (double)v12)
        / ((double)v5 + -1.0);
  }
  free(v10);
  return v11;
}

- (double)clumpingInterestingThreshold
{
  unint64_t v2;
  double v3;

  v2 = *((unsigned int *)&self->storage.var0.var0 + 1);
  v3 = (double)*(unsigned int *)((char *)&__NSSetSizes_0 + ((v2 >> 23) & 0x1F8));
  return 1.0
       - ((double)(v2 & 0x3FFFFFF) + (double)(v2 & 0x3FFFFFF)) / v3
       + (double)(v2 & 0x3FFFFFF) * (double)(v2 & 0x3FFFFFF) / v3 / v3;
}

- (void)addObject:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)removeObject:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

@end
