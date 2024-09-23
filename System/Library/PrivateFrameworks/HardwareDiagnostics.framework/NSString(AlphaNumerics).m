@implementation NSString(AlphaNumerics)

- (BOOL)isAlphaNumeric
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3) == 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

@end
