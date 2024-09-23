@implementation __NSArray0

- (unint64_t)count
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (id)objectEnumerator
{
  objc_opt_class();
  return &__NSEnumerator0__struct;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  NSException *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = _os_log_pack_size();
  v5 = _os_log_pack_fill();
  *(_DWORD *)v5 = 136315394;
  *(_QWORD *)(v5 + 4) = "-[__NSArray0 objectAtIndex:]";
  *(_WORD *)(v5 + 12) = 2048;
  *(_QWORD *)(v5 + 14) = a3;
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArray0 objectAtIndex:]", a3);
  v6 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  objc_exception_throw(v6);
}

@end
