@implementation NSNumber(LNAdditions)

- (uint64_t)ln_numberType
{
  const char *v1;
  uint64_t v2;

  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "objCType");
  if (!strncmp(v1, "i", 2uLL) || !strncmp(v1, "s", 2uLL) || !strncmp(v1, "q", 2uLL))
    return 1;
  v2 = 2;
  if (strncmp(v1, "I", 2uLL))
  {
    v2 = 2;
    if (strncmp(v1, "S", 2uLL))
    {
      v2 = 2;
      if (strncmp(v1, "Q", 2uLL))
      {
        if (!strncmp(v1, "f", 2uLL))
          return 3;
        else
          return 4 * (strncmp(v1, "d", 2uLL) == 0);
      }
    }
  }
  return v2;
}

@end
