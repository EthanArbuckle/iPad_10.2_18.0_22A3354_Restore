@implementation __NSArrayReversed

- (unint64_t)count
{
  return self->_cnt;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t cnt;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  cnt = self->_cnt;
  if ((a3 & 0x8000000000000000) != 0 || cnt <= a3)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    if (cnt)
    {
      v8 = cnt - 1;
      v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayReversed objectAtIndex:]", a3, v8);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v9, "-[__NSArrayReversed objectAtIndex:]", a3, v8);
    }
    else
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v7 + 4) = "-[__NSArrayReversed objectAtIndex:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayReversed objectAtIndex:]", a3);
    }
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v10);
  }
  return (id)objc_msgSend(self->_array, "objectAtIndex:", cnt + ~a3);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id *v6;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSException *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  NSException *v22;
  _QWORD v23[2];

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v23[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4.length)
  {
    v10 = _os_log_pack_size();
    v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[__NSArrayReversed getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSArrayReversed getObjects:range:]", length);
    goto LABEL_12;
  }
  if (a4.length >> 61)
  {
    v10 = _os_log_pack_size();
    v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "-[__NSArrayReversed getObjects:range:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSArrayReversed getObjects:range:]", length);
LABEL_12:
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v14);
  }
  v8 = -[__NSArrayReversed count](self, "count");
  if ((location & 0x8000000000000000) != 0 || v8 < location + length)
  {
    if (v8)
    {
      v19 = v8;
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[__NSArrayReversed getObjects:range:]", location, length, --v19);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v21, "-[__NSArrayReversed getObjects:range:]", location, length, v19);
    }
    else
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[__NSArrayReversed getObjects:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v18, "-[__NSArrayReversed getObjects:range:]", location, length);
    }
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v16, v15);
    objc_exception_throw(v22);
  }
  if (length)
  {
    v9 = ~location;
    do
    {
      *v6++ = (id)objc_msgSend(self->_array, "objectAtIndex:", v9 + self->_cnt);
      --v9;
      --length;
    }
    while (length);
  }
}

- (__NSArrayReversed)initWithArray:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  self->_array = v4;
  self->_cnt = objc_msgSend(v4, "count");
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSArrayReversed;
  -[__NSArrayReversed dealloc](&v3, sel_dealloc);
}

@end
