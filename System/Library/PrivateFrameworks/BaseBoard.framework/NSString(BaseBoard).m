@implementation NSString(BaseBoard)

+ (id)bs_stringWithUTF8String:()BaseBoard
{
  size_t v4;
  int is_memory_immutable;
  id v6;
  void *v7;

  if (__s)
  {
    v4 = strlen(__s);
    is_memory_immutable = _dyld_is_memory_immutable();
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (is_memory_immutable)
      v7 = (void *)objc_msgSend(v6, "initWithBytesNoCopy:length:encoding:freeWhenDone:", __s, v4, 4, 0);
    else
      v7 = (void *)objc_msgSend(v6, "initWithBytes:length:encoding:", __s, v4, 4);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (uint64_t)_initWithUTF8String:()BaseBoard maxLength:
{
  _BYTE *v7;
  size_t v8;

  v7 = memchr(__s, 0, __n);
  if (v7)
    v8 = v7 - (_BYTE *)__s;
  else
    v8 = __n;
  return objc_msgSend(a1, "initWithBytes:length:encoding:", __s, v8, 4);
}

@end
