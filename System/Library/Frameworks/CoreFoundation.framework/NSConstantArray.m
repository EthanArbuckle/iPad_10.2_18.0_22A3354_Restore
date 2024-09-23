@implementation NSConstantArray

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t count;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  count = self->_count;
  if ((a3 & 0x8000000000000000) != 0 || count <= a3)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    if (count)
    {
      v8 = count - 1;
      v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[NSConstantArray objectAtIndex:]", a3, v8);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v9, "-[NSConstantArray objectAtIndex:]", a3, v8);
    }
    else
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v7 + 4) = "-[NSConstantArray objectAtIndex:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSConstantArray objectAtIndex:]", a3);
    }
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v10);
  }
  return (id)self->_objects[a3];
}

- (unint64_t)count
{
  return self->_count;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  unint64_t count;
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
    *(_QWORD *)(v12 + 4) = "-[NSConstantArray getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSConstantArray getObjects:range:]", length);
    goto LABEL_15;
  }
  if (a4.length >> 61)
  {
    v13 = a4.length;
    v10 = _os_log_pack_size();
    v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[NSConstantArray getObjects:range:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = v13;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSConstantArray getObjects:range:]", v13);
LABEL_15:
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v15);
  }
  count = self->_count;
  if ((a4.location & 0x8000000000000000) != 0 || count < a4.location + a4.length)
  {
    location = a4.location;
    v17 = a4.length;
    v18 = _os_log_pack_size();
    v19 = _os_log_pack_fill();
    if (count)
    {
      v21 = count - 1;
      v22 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[NSConstantArray getObjects:range:]", location, v17, v21);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v22, "-[NSConstantArray getObjects:range:]", location, v17, v21);
    }
    else
    {
      v20 = __os_log_helper_1_2_3_8_32_8_0_8_0(v19, (uint64_t)"-[NSConstantArray getObjects:range:]", location, v17);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v20, "-[NSConstantArray getObjects:range:]", location, v17);
    }
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    objc_exception_throw(v23);
  }
  v5 = (void **)&self->_objects[a4.location];
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

- (id)mutableCopy
{
  return __NSArrayM_new(self->_objects, self->_count, 0);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  unint64_t count;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  count = self->_count;
  if ((a3 & 0x8000000000000000) != 0 || count <= a3)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    if (count)
    {
      v8 = count - 1;
      v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[NSConstantArray objectAtIndexedSubscript:]", a3, v8);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v9, "-[NSConstantArray objectAtIndexedSubscript:]", a3, v8);
    }
    else
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v7 + 4) = "-[NSConstantArray objectAtIndexedSubscript:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[NSConstantArray objectAtIndexedSubscript:]", a3);
    }
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v10);
  }
  return (id)self->_objects[a3];
}

- (NSConstantArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  qword_1EDCD1038 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (id)objectEnumerator
{
  return -[__NSConstantArrayEnumerator initWithConstantArray:]([__NSConstantArrayEnumerator alloc], "initWithConstantArray:", self);
}

+ (NSConstantArray)new
{
  return (NSConstantArray *)objc_opt_new();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return __NSArrayM_new(self->_objects, self->_count, 0);
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
