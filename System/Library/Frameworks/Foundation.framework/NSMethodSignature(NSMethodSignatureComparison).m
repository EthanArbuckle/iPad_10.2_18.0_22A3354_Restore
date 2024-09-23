@implementation NSMethodSignature(NSMethodSignatureComparison)

- (uint64_t)_isCompatibleWithMethodSignature:()NSMethodSignatureComparison
{
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;

  if ((objc_msgSend(a1, "isEqual:") & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6 = objc_msgSend(a1, "numberOfArguments");
  if (v6 != objc_msgSend(a3, "numberOfArguments"))
    return 0;
  result = encodingsAreCompatible((const char *)objc_msgSend(a1, "methodReturnType"), (const char *)objc_msgSend(a3, "methodReturnType"));
  if (!(_DWORD)result)
    return result;
  v7 = objc_msgSend(a1, "_isBlock");
  if (v7 != objc_msgSend(a3, "_isBlock"))
    return 0;
  if (!v6)
    return 1;
  v8 = 0;
  do
  {
    result = encodingsAreCompatible((const char *)objc_msgSend(a1, "getArgumentTypeAtIndex:", v8), (const char *)objc_msgSend(a3, "getArgumentTypeAtIndex:", v8));
    if (!(_DWORD)result)
      break;
  }
  while (v6 - 1 != v8++);
  return result;
}

@end
