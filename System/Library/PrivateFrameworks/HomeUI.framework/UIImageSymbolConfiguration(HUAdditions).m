@implementation UIImageSymbolConfiguration(HUAdditions)

- (uint64_t)hu_hasTextStyle
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "configurationWithoutTextStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithoutPointSizeAndWeight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(a1, "isEqualToConfiguration:", v3) ^ 1;
  return v4;
}

@end
