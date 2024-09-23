@implementation __NSSetI

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
    *(_QWORD *)(v14 + 4) = "-[__NSSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSSetI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_18;
  }
  if (a5 >> 61)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "-[__NSSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSSetI countByEnumeratingWithState:objects:count:]", a5);
LABEL_18:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v17);
  }
  v6 = *(_QWORD *)((char *)&__NSSetSizes + ((2 * self->_used[7]) & 0x1F8));
  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_3;
  if (v6 <= var0)
    return 0;
  a3->var1 = a4;
  if (!a5)
    return 0;
  result = 0;
  v9 = (char *)self + 16;
  do
  {
    v10 = *(void **)&v9[8 * var0++];
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

- (unint64_t)count
{
  return *(_QWORD *)self->_used & 0x3FFFFFFFFFFFFFFLL;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t *v3;
  unsigned int v4;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = &v16;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v4 = self->_used[7];
  if (v4 < 4)
    goto LABEL_17;
  v6 = *(_QWORD *)((char *)&__NSSetSizes + ((2 * v4) & 0x1F8));
  v7 = (char *)self + 16;
  v8 = objc_msgSend(a3, "hash") % v6;
  v9 = v6 <= 1 ? 1 : v6;
  while (1)
  {
    v10 = *(id *)&v7[8 * v8];
    v11 = !v10 || v10 == a3;
    if (v11 || (objc_msgSend(v10, "isEqual:", a3) & 1) != 0)
      break;
    if (v8 + 1 >= v6)
      v12 = v6;
    else
      v12 = 0;
    v8 = v8 + 1 - v12;
    if (!--v9)
    {
      v3 = v17;
      goto LABEL_17;
    }
  }
  v3 = v17;
  if (v8 >= v6)
  {
LABEL_17:
    v13 = (unint64_t *)(v3 + 3);
  }
  else
  {
    v17[3] = *(_QWORD *)&v7[8 * v8] != 0;
    v13 = (unint64_t *)(v3 + 3);
  }
  v14 = *v13;
  _Block_object_dispose(&v16, 8);
  return v14;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  unsigned int v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;
  NSException *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "-[__NSSetI getObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSSetI getObjects:count:]", a4);
    goto LABEL_18;
  }
  if (a4 >> 61)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[__NSSetI getObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSSetI getObjects:count:]", a4);
LABEL_18:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v16);
  }
  v4 = self->_used[7];
  v5 = *(_QWORD *)self->_used & 0x3FFFFFFFFFFFFFFLL;
  if (v5 >= a4)
    v5 = a4;
  if (v4 >= 4 && v5 != 0)
  {
    v7 = 0;
    v8 = *(_QWORD *)((char *)&__NSSetSizes + ((2 * v4) & 0x1F8));
    do
    {
      v9 = *(void **)&self->_used[8 * v7 + 8];
      if (v9)
      {
        *a3++ = v9;
        --v5;
      }
      ++v7;
    }
    while (v7 < v8 && v5);
  }
}

- (void)dealloc
{
  unsigned int v3;
  unint64_t v4;
  id *v5;
  uint64_t v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((__NSSetI *)__NSSet0__ == self)
    __break(1u);
  v3 = self->_used[7];
  v4 = *(_QWORD *)((char *)__NSSetSizes + ((2 * v3) & 0x1F8));
  self->_used[7] = v3 & 3;
  *(_QWORD *)self->_used &= 0xFC00000000000000;
  if (v3 >= 4)
  {
    v5 = (id *)((char *)self + 16);
    if (v4 <= 1)
      v6 = 1;
    else
      v6 = v4;
    do
    {
      if ((uint64_t)*v5 >= 1)

      ++v5;
      --v6;
    }
    while (v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)__NSSetI;
  -[__NSSetI dealloc](&v7, sel_dealloc);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v5;
  unsigned int v7;
  size_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSException *v13;
  _QWORD block[7];
  _QWORD v15[3];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = _os_log_pack_size();
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[__NSSetI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSSetI enumerateObjectsWithOptions:usingBlock:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)block - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    objc_exception_throw(v13);
  }
  v5 = a3;
  v7 = self->_used[7];
  v8 = *(_QWORD *)((char *)__NSSetSizes + ((2 * v7) & 0x1F8));
  if ((a3 & 1) != 0 && __CFActiveProcessorCount() < 2)
    v5 = 0;
  if ((v5 & 1) != 0)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51____NSSetI_enumerateObjectsWithOptions_usingBlock___block_invoke;
    block[3] = &unk_1E12E62D0;
    block[5] = a4;
    block[6] = v15;
    block[4] = self;
    dispatch_apply(v8, 0, block);
    _Block_object_dispose(v15, 8);
  }
  else
  {
    LOBYTE(v15[0]) = 0;
    if (v7 >= 4)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)&self->_used[8 * v9 + 8])
        {
          v10 = (void *)_CFAutoreleasePoolPush();
          __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
        }
        ++v9;
      }
      while (v9 < v8);
    }
  }
}

- (BOOL)containsObject:(id)a3
{
  uint64_t *v3;
  unsigned int v4;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  unint64_t v12;
  char *v13;
  char v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = &v16;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v4 = self->_used[7];
  if (v4 < 4)
    goto LABEL_17;
  v6 = *(_QWORD *)((char *)__NSSetSizes + ((2 * v4) & 0x1F8));
  v7 = (char *)self + 16;
  v8 = objc_msgSend(a3, "hash") % v6;
  v9 = v6 <= 1 ? 1 : v6;
  while (1)
  {
    v10 = *(id *)&v7[8 * v8];
    v11 = !v10 || v10 == a3;
    if (v11 || (objc_msgSend(v10, "isEqual:", a3) & 1) != 0)
      break;
    if (v8 + 1 >= v6)
      v12 = v6;
    else
      v12 = 0;
    v8 = v8 + 1 - v12;
    if (!--v9)
    {
      v3 = v17;
      goto LABEL_17;
    }
  }
  v3 = v17;
  if (v8 >= v6)
  {
LABEL_17:
    v13 = (char *)(v3 + 3);
  }
  else
  {
    *((_BYTE *)v17 + 24) = *(_QWORD *)&v7[8 * v8] != 0;
    v13 = (char *)(v3 + 3);
  }
  v14 = *v13;
  _Block_object_dispose(&v16, 8);
  return v14;
}

- (id)member:(id)a3
{
  uint64_t *v3;
  unsigned int v4;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  unint64_t v12;
  void **v13;
  void *v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = &v16;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v4 = self->_used[7];
  if (v4 < 4)
    goto LABEL_17;
  v6 = *(_QWORD *)((char *)__NSSetSizes + ((2 * v4) & 0x1F8));
  v7 = (char *)self + 16;
  v8 = objc_msgSend(a3, "hash") % v6;
  v9 = v6 <= 1 ? 1 : v6;
  while (1)
  {
    v10 = *(id *)&v7[8 * v8];
    v11 = !v10 || v10 == a3;
    if (v11 || (objc_msgSend(v10, "isEqual:", a3) & 1) != 0)
      break;
    if (v8 + 1 >= v6)
      v12 = v6;
    else
      v12 = 0;
    v8 = v8 + 1 - v12;
    if (!--v9)
    {
      v3 = v17;
      goto LABEL_17;
    }
  }
  v3 = v17;
  if (v8 >= v6)
  {
LABEL_17:
    v13 = (void **)(v3 + 5);
  }
  else
  {
    v17[5] = *(_QWORD *)&v7[8 * v8];
    v13 = (void **)(v3 + 5);
  }
  v14 = *v13;
  _Block_object_dispose(&v16, 8);
  return v14;
}

- (id)objectEnumerator
{
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSFastEnumerationEnumerator), "initWithObject:", self);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (double)clumpingFactor
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
  if ((v3 & 0x3FFFFFFFFFFFFFELL) != 0)
    v4 = v3 & 0x3FFFFFFFFFFFFFFLL;
  else
    v4 = 1;
  v5 = MEMORY[0x1E0C80A78](v4, a2);
  v8 = (char *)&v24 - v7;
  v24 = 0;
  if (v6 >= 0x101)
  {
    v8 = (char *)_CFCreateArrayStorage(v5, 0, &v24);
    v6 = *(_QWORD *)self->_used & 0x3FFFFFFFFFFFFFFLL;
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  -[__NSSetI getObjects:count:](self, "getObjects:count:", v8, v6, v24, v25);
  v10 = *(_QWORD *)self->_used & 0x3FFFFFFFFFFFFFFLL;
  v11 = 0.0;
  if (v10 >= 2)
  {
    v12 = *(_QWORD *)((char *)__NSSetSizes + ((2 * self->_used[7]) & 0x1F8));
    v13 = 8 * v10;
    v14 = (uint64_t *)malloc_type_malloc(8 * v10 + 8, 0xDD117B67uLL);
    v15 = 0;
    do
    {
      v14[v15 / 8] = objc_msgSend(*(id *)&v8[v15], "hash") % v12;
      v15 += 8;
    }
    while (v13 != v15);
    qsort(v14, v10, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_0);
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

- (double)clumpingInterestingThreshold
{
  double v2;

  v2 = (double)*(unint64_t *)((char *)&__NSSetSizes + ((2 * self->_used[7]) & 0x1F8));
  return 1.0
       - ((double)(*(_QWORD *)self->_used & 0x3FFFFFFFFFFFFFFLL) + (double)(*(_QWORD *)self->_used & 0x3FFFFFFFFFFFFFFLL))
       / v2
       + (double)(*(_QWORD *)self->_used & 0x3FFFFFFFFFFFFFFLL)
       * (double)(*(_QWORD *)self->_used & 0x3FFFFFFFFFFFFFFLL)
       / v2
       / v2;
}

@end
