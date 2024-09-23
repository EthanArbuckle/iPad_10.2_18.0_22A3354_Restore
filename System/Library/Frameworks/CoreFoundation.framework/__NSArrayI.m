@implementation __NSArrayI

- (unint64_t)count
{
  return self->storage.used;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t used;

  used = self->storage.used;
  if (used <= a3)
    __boundsFail(a3, used);
  return self->storage.list[a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;
  id *list;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  NSException *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315394;
    *(_QWORD *)(v10 + 4) = "-[__NSArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(_QWORD *)(v10 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSArrayI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[__NSArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSArrayI countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v8);
    objc_exception_throw(v13);
  }
  if (a3->var0)
    return 0;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_6;
  list = self->storage.list;
  result = self->storage.used;
  a3->var0 = -1;
  a3->var1 = list;
  return result;
}

- (id)mutableCopy
{
  return __NSArrayM_new(self->storage.list, self->storage.used, 0);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  $F68B6A909A042D7B3C4113851D99BFF8 *p_storage;
  unint64_t used;
  void **v6;
  void *v7;
  void *v8;
  void *v9;
  NSUInteger length;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  NSException *v16;
  NSUInteger location;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  NSException *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4.length)
  {
    length = a4.length;
    v11 = _os_log_pack_size();
    v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "-[__NSArrayI getObjects:range:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSArrayI getObjects:range:]", length);
    goto LABEL_15;
  }
  if (a4.length >> 61)
  {
    v14 = a4.length;
    v11 = _os_log_pack_size();
    v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[__NSArrayI getObjects:range:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = v14;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSArrayI getObjects:range:]", v14);
LABEL_15:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v16);
  }
  p_storage = &self->storage;
  used = self->storage.used;
  if ((a4.location & 0x8000000000000000) != 0 || used < a4.location + a4.length)
  {
    location = a4.location;
    v18 = a4.length;
    v19 = _os_log_pack_size();
    v20 = _os_log_pack_fill();
    if (used)
    {
      v22 = used - 1;
      v23 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[__NSArrayI getObjects:range:]", location, v18, v22);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v23, "-[__NSArrayI getObjects:range:]", location, v18, v22);
    }
    else
    {
      v21 = __os_log_helper_1_2_3_8_32_8_0_8_0(v20, (uint64_t)"-[__NSArrayI getObjects:range:]", location, v18);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v21, "-[__NSArrayI getObjects:range:]", location, v18);
    }
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v19);
    objc_exception_throw(v24);
  }
  v6 = &p_storage->list[a4.location];
  if (a4.length > 4)
  {
    memmove(a3, v6, 8 * a4.length);
  }
  else
  {
    switch(a4.length)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        goto LABEL_10;
      case 3uLL:
        goto LABEL_9;
      case 4uLL:
        v7 = *v6;
        v6 = &p_storage->list[a4.location + 1];
        *a3++ = v7;
LABEL_9:
        v8 = *v6++;
        *a3++ = v8;
LABEL_10:
        v9 = *v6++;
        *a3++ = v9;
LABEL_11:
        *a3 = *v6;
        break;
      default:
        return;
    }
  }
}

- (void)dealloc
{
  id *list;
  unint64_t i;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  list = self->storage.list;
  for (i = self->storage.used; i; --i)
  {
    if (((unint64_t)*list & 0x8000000000000000) == 0)

    ++list;
  }
  v5.receiver = self;
  v5.super_class = (Class)__NSArrayI;
  -[__NSArrayI dealloc](&v5, sel_dealloc);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  unint64_t used;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  used = self->storage.used;
  if (used <= a3)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    if (used)
    {
      v8 = used - 1;
      v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayI objectAtIndexedSubscript:]", a3, v8);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v9, "-[__NSArrayI objectAtIndexedSubscript:]", a3, v8);
    }
    else
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v7 + 4) = "-[__NSArrayI objectAtIndexedSubscript:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayI objectAtIndexedSubscript:]", a3);
    }
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v10);
  }
  return self->storage.list[a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSArrayM_new(self->storage.list, self->storage.used, 0);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v5;
  $F68B6A909A042D7B3C4113851D99BFF8 *p_storage;
  size_t used;
  unint64_t v8;
  void *v9;
  unint64_t i;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSException *v17;
  uint64_t v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v13 = _os_log_pack_size();
    v15 = (char *)&v19[-1] - ((MEMORY[0x1E0C80A78](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[__NSArrayI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSArrayI enumerateObjectsWithOptions:usingBlock:]");
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v13);
    objc_exception_throw(v17);
  }
  v5 = a3;
  p_storage = &self->storage;
  used = self->storage.used;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53____NSArrayI_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v19[3] = &unk_1E1079310;
  v19[4] = self;
  v19[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, used, (uint64_t)v19) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      HIBYTE(v18) = 0;
      for (i = p_storage->used; i; i = v11)
      {
        v11 = i - 1;
        v12 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v12);
      }
    }
    else
    {
      HIBYTE(v18) = 0;
      if (p_storage->used)
      {
        v8 = 0;
        do
        {
          v9 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
          ++v8;
        }
        while (v8 < p_storage->used);
      }
    }
  }
}

- (id)nothingAtIndex:(unint64_t)a3
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
