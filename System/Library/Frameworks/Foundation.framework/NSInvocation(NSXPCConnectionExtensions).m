@implementation NSInvocation(NSXPCConnectionExtensions)

- (uint64_t)_hasBlockArgument
{
  void *v1;
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_msgSend(a1, "methodSignature");
  result = objc_msgSend(v1, "numberOfArguments");
  if (result)
  {
    v3 = result;
    if (*(__int16 *)(objc_msgSend(v1, "_argInfo:", 0) + 34) < 0)
    {
      return 1;
    }
    else
    {
      v4 = 1;
      do
      {
        v5 = v4;
        if (v3 == v4)
          break;
        v6 = objc_msgSend(v1, "_argInfo:", v4);
        v4 = v5 + 1;
      }
      while ((*(__int16 *)(v6 + 34) & 0x80000000) == 0);
      return v5 < v3;
    }
  }
  return result;
}

- (void)setUserInfo:()NSXPCConnectionExtensions
{
  objc_setAssociatedObject(a1, "_NSXPCConnectionNSInvocationKey", a3, (void *)0x301);
}

- (id)userInfo
{
  return objc_getAssociatedObject(a1, "_NSXPCConnectionNSInvocationKey");
}

@end
