@implementation NSNumber(Intents)

- (BOOL)_intents_isInteger
{
  const char *v1;

  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "objCType");
  return !strcmp(v1, "i")
      || !strcmp(v1, "I")
      || !strcmp(v1, "s")
      || !strcmp(v1, "S")
      || !strcmp(v1, "q")
      || strcmp(v1, "Q") == 0;
}

- (BOOL)_intents_isDouble
{
  const char *v1;

  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "objCType");
  return !strcmp(v1, "f") || strcmp(v1, "d") == 0;
}

@end
