@implementation UIButton(MKCrossPlatformOperations)

- (id)_mapkit_title
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "titleLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_mapkit_setAttributedTitle:()MKCrossPlatformOperations
{
  return objc_msgSend(a1, "setAttributedTitle:forState:", a3, 0);
}

- (uint64_t)_mapkit_setImage:()MKCrossPlatformOperations
{
  return objc_msgSend(a1, "setImage:forState:", a3, 0);
}

@end
