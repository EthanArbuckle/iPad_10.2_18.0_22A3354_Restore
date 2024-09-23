@implementation UITraitCollection(ClipServicesUIExtras)

- (NSString)cps_invocationCardPreferredContentSizeCategory
{
  NSString *v2;
  NSString *v3;
  NSString *v4;
  NSString *v5;

  v2 = (NSString *)(id)*MEMORY[0x1E0CEB3D8];
  objc_msgSend(a1, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryCompareToCategory(v2, v3) == NSOrderedAscending)
    v4 = v2;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

@end
