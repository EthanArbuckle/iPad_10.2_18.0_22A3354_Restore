@implementation PHVoicemailMessageTableViewCellScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHVoicemailMessageTableViewCellScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[PHVoicemailMessageTableViewCellScrollViewAccessibility subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
