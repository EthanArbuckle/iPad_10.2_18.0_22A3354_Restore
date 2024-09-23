@implementation __NSFrozenSetM

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  unint64_t var0;
  unint64_t v7;
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
    *(_QWORD *)(v15 + 4) = "-[__NSFrozenSetM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSFrozenSetM countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_20;
  }
  if (a5 >> 61)
  {
    v12 = _os_log_pack_size();
    v14 = (char *)v20 - ((MEMORY[0x1E0C80A78](v12, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315394;
    *(_QWORD *)(v18 + 4) = "-[__NSFrozenSetM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(_QWORD *)(v18 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSFrozenSetM countByEnumeratingWithState:objects:count:]", a5);
LABEL_20:
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v12);
    objc_exception_throw(v19);
  }
  p_storage = &self->storage;
  var0 = a3->var0;
  v7 = *(unsigned int *)((char *)__NSSetSizes_0
                       + (((unint64_t)*((unsigned int *)&self->storage.var0.var0 + 1) >> 23) & 0x1F8));
  if (!a3->var0)
    a3->var2 = (unint64_t *)&mset_countByEnumeratingWithStateObjectsCount_const_mu;
  if (var0 >= v7)
    return 0;
  a3->var1 = a4;
  result = 0;
  if (a5)
  {
    do
    {
      v9 = p_storage->objs[var0];
      if (v9)
        v10 = v9 == (state *)&___NSSetM_DeletedMarker;
      else
        v10 = 1;
      if (!v10)
        a4[result++] = v9;
      ++var0;
    }
    while (var0 < v7 && result < a5);
  }
  a3->var0 = var0;
  return result;
}

- (unint64_t)countForObject:(id)a3
{
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  unint64_t v4;
  unint64_t v6;
  state **objs;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  state *v11;
  unint64_t v12;
  state *v13;

  p_storage = &self->storage;
  v4 = *((unsigned int *)&self->storage.var0.var0 + 1);
  if (!(v4 >> 26))
    return 0;
  v6 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v4 >> 23) & 0x1F8));
  objs = p_storage->objs;
  v8 = objc_msgSend(a3, "hash") % v6;
  v9 = v6 <= 1 ? 1 : v6;
  v10 = v6;
  while (1)
  {
    v11 = objs[v8];
    if (!v11)
      break;
    if (v11 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v10 == v6)
        v10 = v8;
    }
    else if (v11 == a3 || (-[state isEqual:](v11, "isEqual:", a3) & 1) != 0)
    {
      v10 = v8;
      goto LABEL_21;
    }
    if (v8 + 1 >= v6)
      v12 = v6;
    else
      v12 = 0;
    v8 = v8 + 1 - v12;
    if (!--v9)
      goto LABEL_21;
  }
  if (v10 == v6)
    v10 = v8;
LABEL_21:
  if (v10 >= v6)
    return 0;
  v13 = p_storage->objs[v10];
  return v13 != (state *)&___NSSetM_DeletedMarker && v13 != 0;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  size_t v5;
  state **objs;
  size_t i;
  state *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  NSException *v15;
  _BYTE v16[8];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = _os_log_pack_size();
    v13 = &v16[-((MEMORY[0x1E0C80A78](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0)];
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[__NSFrozenSetM enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSFrozenSetM enumerateObjectsWithOptions:usingBlock:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v11);
    objc_exception_throw(v15);
  }
  v5 = *(unsigned int *)((char *)__NSSetSizes_0
                       + (((unint64_t)*((unsigned int *)&self->storage.var0.var0 + 1) >> 23) & 0x1F8));
  objs = self->storage.objs;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __mset_enumerateObjectsWithOptionsUsingBlock_block_invoke;
  v17[3] = &unk_1E1334610;
  v17[4] = a4;
  v17[5] = objs;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v5, (uint64_t)v17) & 1) == 0)
  {
    v16[7] = 0;
    if (v5)
    {
      for (i = 0; i < v5; ++i)
      {
        v8 = objs[i];
        if (v8)
          v9 = v8 == (state *)&___NSSetM_DeletedMarker;
        else
          v9 = 1;
        if (!v9)
        {
          v10 = (void *)_CFAutoreleasePoolPush();
          __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
        }
      }
    }
  }
}

- (void)dealloc
{
  _cow_failure(CFSTR("Attempting to over-release (immutable)"));
}

- (unint64_t)count
{
  return *((_DWORD *)&self->storage.var0.var0 + 1) & 0x3FFFFFF;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
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
  if (!a3 && a4)
  {
    v12 = _os_log_pack_size();
    v14 = (char *)v20 - ((MEMORY[0x1E0C80A78](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "mset_getObjectsCount";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "mset_getObjectsCount", a4);
    goto LABEL_21;
  }
  if (a4 >> 61)
  {
    v12 = _os_log_pack_size();
    v14 = (char *)v20 - ((MEMORY[0x1E0C80A78](v12, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315394;
    *(_QWORD *)(v18 + 4) = "mset_getObjectsCount";
    *(_WORD *)(v18 + 12) = 2048;
    *(_QWORD *)(v18 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "mset_getObjectsCount", a4);
LABEL_21:
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v12);
    objc_exception_throw(v19);
  }
  v4 = *((unsigned int *)&self->storage.var0.var0 + 1);
  v5 = v4 & 0x3FFFFFF;
  if ((v4 & 0x3FFFFFF) >= a4)
    v5 = a4;
  if (v5)
    v6 = v4 >> 26 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = 0;
    v8 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v4 >> 23) & 0x1F8));
    do
    {
      v9 = self->storage.objs[v7];
      if (v9)
        v10 = v9 == (state *)&___NSSetM_DeletedMarker;
      else
        v10 = 1;
      if (!v10)
      {
        *a3++ = v9;
        --v5;
      }
      if (!v5)
        break;
      ++v7;
    }
    while (v7 < v8);
  }
}

- (BOOL)containsObject:(id)a3
{
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  unint64_t v4;
  unint64_t v6;
  state **objs;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  state *v11;
  unint64_t v12;
  state *v13;

  p_storage = &self->storage;
  v4 = *((unsigned int *)&self->storage.var0.var0 + 1);
  if (!(v4 >> 26))
    return 0;
  v6 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v4 >> 23) & 0x1F8));
  objs = p_storage->objs;
  v8 = objc_msgSend(a3, "hash") % v6;
  v9 = v6 <= 1 ? 1 : v6;
  v10 = v6;
  while (1)
  {
    v11 = objs[v8];
    if (!v11)
      break;
    if (v11 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v10 == v6)
        v10 = v8;
    }
    else if (v11 == a3 || (-[state isEqual:](v11, "isEqual:", a3) & 1) != 0)
    {
      v10 = v8;
      goto LABEL_21;
    }
    if (v8 + 1 >= v6)
      v12 = v6;
    else
      v12 = 0;
    v8 = v8 + 1 - v12;
    if (!--v9)
      goto LABEL_21;
  }
  if (v10 == v6)
    v10 = v8;
LABEL_21:
  if (v10 >= v6)
    return 0;
  v13 = p_storage->objs[v10];
  return v13 != (state *)&___NSSetM_DeletedMarker && v13 != 0;
}

- (id)member:(id)a3
{
  $391FD37AAF9E3824F7148B7F9A30C887 *p_storage;
  unint64_t v4;
  unint64_t v6;
  state **objs;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  state *v11;
  unint64_t v12;

  p_storage = &self->storage;
  v4 = *((unsigned int *)&self->storage.var0.var0 + 1);
  if (!(v4 >> 26))
    return 0;
  v6 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v4 >> 23) & 0x1F8));
  objs = p_storage->objs;
  v8 = objc_msgSend(a3, "hash") % v6;
  v9 = v6 <= 1 ? 1 : v6;
  v10 = v6;
  while (1)
  {
    v11 = objs[v8];
    if (!v11)
      break;
    if (v11 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v10 == v6)
        v10 = v8;
    }
    else if (v11 == a3 || (-[state isEqual:](v11, "isEqual:", a3) & 1) != 0)
    {
      v10 = v8;
      goto LABEL_21;
    }
    if (v8 + 1 >= v6)
      v12 = v6;
    else
      v12 = 0;
    v8 = v8 + 1 - v12;
    if (!--v9)
      goto LABEL_21;
  }
  if (v10 == v6)
    v10 = v8;
LABEL_21:
  if (v10 >= v6)
    return 0;
  if ((_UNKNOWN *)p_storage->objs[v10] == &___NSSetM_DeletedMarker)
    return 0;
  return p_storage->objs[v10];
}

- (id)objectEnumerator
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSFastEnumerationEnumerator), "initWithObject:", self);
}

- (double)clumpingFactor
{
  int v3;
  size_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  double v12;
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
  v3 = *((_DWORD *)&self->storage.var0.var0 + 1);
  v4 = v3 & 0x3FFFFFF;
  if ((v3 & 0x3FFFFFF) != 0)
    v5 = v3 & 0x3FFFFFF;
  else
    v5 = 1;
  v6 = MEMORY[0x1E0C80A78](v5, a2);
  v8 = (char *)&v24 - v7;
  v10 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v9 >> 23) & 0x1F8));
  v24 = 0;
  if (v4 >= 0x101)
  {
    v8 = (char *)_CFCreateArrayStorage(v6, 0, &v24);
    v11 = v8;
  }
  else
  {
    v11 = 0;
  }
  -[__NSFrozenSetM getObjects:count:](self, "getObjects:count:", v8, v4, v24, v25);
  v12 = 0.0;
  if (v4 >= 2)
  {
    v13 = 8 * v4;
    v14 = (uint64_t *)malloc_type_malloc(8 * v4 + 8, 0xDD117B67uLL);
    v15 = 0;
    do
    {
      v14[v15 / 8] = objc_msgSend(*(id *)&v8[v15], "hash") % v10;
      v15 += 8;
    }
    while (v13 != v15);
    qsort(v14, v4, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_1);
    v16 = 0;
    v17 = *v14;
    v14[v4] = *v14 + v10;
    v18 = (double)v10 / (double)v4;
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
    v12 = v19
        * (double)v4
        * (double)v4
        / ((double)v10
         * (double)v10)
        / ((double)v4 + -1.0);
  }
  free(v11);
  return v12;
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

@end
