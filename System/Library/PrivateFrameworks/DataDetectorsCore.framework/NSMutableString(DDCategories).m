@implementation NSMutableString(DDCategories)

- (uint64_t)dd_appendSpaces:()DDCategories
{
  int v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)result;
    do
    {
      result = objc_msgSend(v4, "appendString:", CFSTR(" "));
      --v3;
    }
    while (v3);
  }
  return result;
}

@end
