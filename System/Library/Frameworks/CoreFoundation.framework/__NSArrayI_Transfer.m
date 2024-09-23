@implementation __NSArrayI_Transfer

- (unint64_t)count
{
  return self->_used;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  unint64_t used;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  NSUInteger length;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  NSException *v15;
  NSUInteger location;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  NSException *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4.length)
  {
    length = a4.length;
    v10 = _os_log_pack_size();
    v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[__NSArrayI_Transfer getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSArrayI_Transfer getObjects:range:]", length);
    goto LABEL_15;
  }
  if (a4.length >> 61)
  {
    v13 = a4.length;
    v10 = _os_log_pack_size();
    v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[__NSArrayI_Transfer getObjects:range:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = v13;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSArrayI_Transfer getObjects:range:]", v13);
LABEL_15:
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v15);
  }
  used = self->_used;
  if ((a4.location & 0x8000000000000000) != 0 || used < a4.location + a4.length)
  {
    location = a4.location;
    v17 = a4.length;
    v18 = _os_log_pack_size();
    v19 = _os_log_pack_fill();
    if (used)
    {
      v21 = used - 1;
      v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[__NSArrayI_Transfer getObjects:range:]", location, v17, v21);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v22, "-[__NSArrayI_Transfer getObjects:range:]", location, v17, v21);
    }
    else
    {
      v20 = __os_log_helper_1_2_3_8_32_8_0_8_0(v19, (uint64_t)"-[__NSArrayI_Transfer getObjects:range:]", location, v17);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v20, "-[__NSArrayI_Transfer getObjects:range:]", location, v17);
    }
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    objc_exception_throw(v23);
  }
  v5 = &self->_list[a4.location];
  if (a4.length > 4)
  {
    memmove(a3, v5, 8 * a4.length);
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
        v6 = *v5++;
        *a3++ = v6;
LABEL_9:
        v7 = *v5++;
        *a3++ = v7;
LABEL_10:
        v8 = *v5++;
        *a3++ = v8;
LABEL_11:
        *a3 = *v5;
        break;
      default:
        return;
    }
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t used;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  used = self->_used;
  if (used <= a3)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    if (used)
    {
      v8 = used - 1;
      v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayI_Transfer objectAtIndex:]", a3, v8);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v9, "-[__NSArrayI_Transfer objectAtIndex:]", a3, v8);
    }
    else
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v7 + 4) = "-[__NSArrayI_Transfer objectAtIndex:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayI_Transfer objectAtIndex:]", a3);
    }
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v10);
  }
  return self->_list[a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
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
    *(_QWORD *)(v10 + 4) = "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(_QWORD *)(v10 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v8);
    objc_exception_throw(v13);
  }
  if (a3->var0)
    return 0;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_37;
  list = self->_list;
  a3->var0 = -1;
  a3->var1 = list;
  return self->_used;
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
  used = self->_used;
  if (used <= a3)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    if (used)
    {
      v8 = used - 1;
      v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayI_Transfer objectAtIndexedSubscript:]", a3, v8);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v9, "-[__NSArrayI_Transfer objectAtIndexedSubscript:]", a3, v8);
    }
    else
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v7 + 4) = "-[__NSArrayI_Transfer objectAtIndexedSubscript:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayI_Transfer objectAtIndexedSubscript:]", a3);
    }
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v10);
  }
  return self->_list[a3];
}

- (void)dealloc
{
  id *list;
  unint64_t used;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  list = self->_list;
  used = self->_used;
  if (used)
  {
    do
    {
      if (((unint64_t)*list & 0x8000000000000000) == 0)

      ++list;
      --used;
    }
    while (used);
    list = self->_list;
  }
  free(list);
  v5.receiver = self;
  v5.super_class = (Class)__NSArrayI_Transfer;
  -[__NSArrayI_Transfer dealloc](&v5, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSArrayM_new(self->_list, self->_used, 0);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v5;
  size_t used;
  unint64_t v8;
  void *v9;
  unint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSException *v16;
  uint64_t v17;
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v12 = _os_log_pack_size();
    v14 = (char *)&v18[-1] - ((MEMORY[0x1E0C80A78](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[__NSArrayI_Transfer enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSArrayI_Transfer enumerateObjectsWithOptions:usingBlock:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v12);
    objc_exception_throw(v16);
  }
  v5 = a3;
  used = self->_used;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62____NSArrayI_Transfer_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v18[3] = &unk_1E1079310;
  v18[4] = self;
  v18[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, used, (uint64_t)v18) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      HIBYTE(v17) = 0;
      for (i = self->_used - 1; i != -1; --i)
      {
        v11 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v11);
      }
    }
    else
    {
      HIBYTE(v17) = 0;
      if (self->_used)
      {
        v8 = 0;
        do
        {
          v9 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
          ++v8;
        }
        while (v8 < self->_used);
      }
    }
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
