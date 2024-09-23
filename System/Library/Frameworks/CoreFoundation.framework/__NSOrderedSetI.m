@implementation __NSOrderedSetI

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v5;
  size_t v7;
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
    *(_QWORD *)(v15 + 4) = "-[__NSOrderedSetI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSOrderedSetI enumerateObjectsWithOptions:usingBlock:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v12);
    objc_exception_throw(v16);
  }
  v5 = a3;
  v7 = *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58____NSOrderedSetI_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v18[3] = &unk_1E1079310;
  v18[4] = self;
  v18[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, v7, (uint64_t)v18) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      HIBYTE(v17) = 0;
      for (i = (*(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32))
              - 1; i != -1; --i)
      {
        v11 = (void *)_CFAutoreleasePoolPush();
        __NSORDEREDSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v11);
      }
    }
    else
    {
      HIBYTE(v17) = 0;
      if (*(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32))
      {
        v8 = 0;
        do
        {
          v9 = (void *)_CFAutoreleasePoolPush();
          __NSORDEREDSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
          ++v8;
        }
        while (v8 < (*(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32)));
      }
    }
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
  if (v3 <= a3)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    if (v3)
    {
      v8 = v3 - 1;
      v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSOrderedSetI objectAtIndex:]", a3, v8);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v9, "-[__NSOrderedSetI objectAtIndex:]", a3, v8);
    }
    else
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v7 + 4) = "-[__NSOrderedSetI objectAtIndex:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[__NSOrderedSetI objectAtIndex:]", a3);
    }
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v10);
  }
  return *(id *)&self->_used[8 * a3 + 8];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)(v9 + 4) = "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v9 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_10;
  }
  if (a5 >> 61)
  {
    v7 = _os_log_pack_size();
    v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v11 + 4) = "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]", a5);
LABEL_10:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v8, v7);
    objc_exception_throw(v12);
  }
  if (a3->var0)
    return 0;
  a3->var0 = -1;
  a3->var1 = (id *)((char *)self + 16);
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  return *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
}

- (void)dealloc
{
  unsigned __int8 *used;
  unint64_t v4;
  unint64_t i;
  uint64_t v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  used = self->_used;
  v4 = *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
  if (v4)
  {
    for (i = 0; i < v4; ++i)
    {
      v6 = *(_QWORD *)&self->_used[8 * i + 8];
      if (v6 >= 1)
      {

        v4 = *(unsigned int *)used | ((unint64_t)(*((unsigned __int16 *)used + 2) | (used[6] << 16)) << 32);
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)__NSOrderedSetI;
  -[__NSOrderedSetI dealloc](&v7, sel_dealloc);
}

- (unint64_t)indexOfObject:(id)a3
{
  unint64_t v4;
  unint64_t v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v14;
  char *v16;
  unsigned __int8 *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  unint64_t v22;

  if (a3)
  {
    v4 = self->_used[7];
    if (v4 >= 4)
    {
      v6 = v4 >> 2;
      v7 = self->_used[6];
      v8 = *(unsigned __int16 *)&self->_used[4];
      v9 = __NSOrderedSetSizes[v4 >> 2];
      v10 = *(unsigned int *)self->_used;
      v11 = self->_used[7] & 3;
      v12 = objc_msgSend(a3, "hash");
      if ((_DWORD)v6 != 63 && v11 != 3)
      {
        v16 = (char *)self + 16;
        v17 = &self->_used[((8 * v10) | ((unint64_t)(v8 | (v7 << 16)) << 35)) + 8];
        v18 = v12 % v9;
        if (v9 <= 1)
          v19 = 1;
        else
          v19 = v9;
        do
        {
          if (v11 == 1)
          {
            v20 = *(unsigned __int16 *)&v17[2 * v18];
          }
          else if (v11)
          {
            v20 = *(unsigned int *)&v17[4 * v18];
          }
          else
          {
            v20 = v17[v18];
          }
          if (!v20)
            break;
          v14 = v20 - 1;
          v21 = *(id *)&v16[8 * v20 - 8];
          if (v21 == a3 || (objc_msgSend(v21, "isEqual:", a3) & 1) != 0)
            return v14;
          v22 = v18 + 1 >= v9 ? v9 : 0;
          v18 = v18 + 1 - v22;
          --v19;
        }
        while (v19);
      }
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  NSException *v21;
  _QWORD v22[2];

  length = a4.length;
  location = a4.location;
  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = -[__NSOrderedSetI count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      v18 = v8;
      v9 = _os_log_pack_size();
      v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[__NSOrderedSetI getObjects:range:]", location, length, --v18);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v20, "-[__NSOrderedSetI getObjects:range:]", location, length, v18);
    }
    else
    {
      v9 = _os_log_pack_size();
      v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      v11 = _os_log_pack_fill();
      v12 = __os_log_helper_1_2_3_8_32_8_0_8_0(v11, (uint64_t)"-[__NSOrderedSetI getObjects:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v12, "-[__NSOrderedSetI getObjects:range:]", location, length);
    }
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v10, v9);
    objc_exception_throw(v21);
  }
  if (!a3 && length)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[__NSOrderedSetI getObjects:range:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSOrderedSetI getObjects:range:]", length);
    goto LABEL_12;
  }
  if (length >> 61)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "-[__NSOrderedSetI getObjects:range:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSOrderedSetI getObjects:range:]", length);
LABEL_12:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v13);
    objc_exception_throw(v17);
  }
  memmove(a3, &self->_used[8 * location + 8], 8 * length);
}

- (unint64_t)count
{
  return *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
