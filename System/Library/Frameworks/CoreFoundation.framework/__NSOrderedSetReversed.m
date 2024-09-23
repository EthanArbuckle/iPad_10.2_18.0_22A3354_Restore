@implementation __NSOrderedSetReversed

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
      v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSOrderedSetReversed objectAtIndex:]", a3, v8);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v9, "-[__NSOrderedSetReversed objectAtIndex:]", a3, v8);
    }
    else
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)(v7 + 4) = "-[__NSOrderedSetReversed objectAtIndex:]";
      *(_WORD *)(v7 + 12) = 2048;
      *(_QWORD *)(v7 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty ordered set"), "-[__NSOrderedSetReversed objectAtIndex:]", a3);
    }
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v10);
  }
  return (id)objc_msgSend(self->_orderedSet, "objectAtIndex:", cnt + ~a3);
}

- (unint64_t)count
{
  return self->_cnt;
}

- (__NSOrderedSetReversed)initWithOrderedSet:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  self->_orderedSet = v4;
  self->_cnt = objc_msgSend(v4, "count");
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSOrderedSetReversed;
  -[__NSOrderedSetReversed dealloc](&v3, sel_dealloc);
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v4;
  unint64_t v5;

  v4 = objc_msgSend(self->_orderedSet, "indexOfObject:", a3);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    return self->_cnt + ~v4;
  return v5;
}

@end
