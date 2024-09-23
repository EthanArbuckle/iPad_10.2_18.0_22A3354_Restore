@implementation NSString(NTKMonogram)

- (uint64_t)ntk_isValidMonogram
{
  if (objc_msgSend(a1, "length") && (unint64_t)objc_msgSend(a1, "length") <= 5)
    return objc_msgSend(a1, "ntk_containsOnlyValidMonogramCharacters");
  else
    return 0;
}

- (uint64_t)ntk_containsOnlyValidMonogramCharacters
{
  return objc_msgSend(a1, "_containsEmoji") ^ 1;
}

@end
