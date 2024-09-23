@implementation VideosUITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityShouldBypassScrollToVisibleWithChild
{
  void *v2;
  BOOL v3;

  -[VideosUITableViewCellAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __88__VideosUITableViewCellAccessibility__accessibilityShouldBypassScrollToVisibleWithChild__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234921AE4](CFSTR("VideosDetailViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityScrollToVisible
{
  objc_super v4;

  if (-[VideosUITableViewCellAccessibility _accessibilityShouldBypassScrollToVisibleWithChild](self, "_accessibilityShouldBypassScrollToVisibleWithChild"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VideosUITableViewCellAccessibility;
  return -[VideosUITableViewCellAccessibility _accessibilityScrollToVisible](&v4, sel__accessibilityScrollToVisible);
}

@end
