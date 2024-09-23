@implementation NSString(NPK)

- (BOOL)npkHasContent
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (uint64_t)isAllCaps
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "isEqualToString:", &stru_24CFF06D8) & 1) != 0)
    return 0;
  objc_msgSend(a1, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", a1);

  return v4;
}

@end
