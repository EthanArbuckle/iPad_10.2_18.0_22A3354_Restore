@implementation ICStyleSelectorView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 380.0;
  v3 = 256.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Format Menu"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
