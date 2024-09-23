@implementation MTTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityElementCount
{
  void *v3;
  objc_super v5;

  objc_getAssociatedObject(self, &MTAXTableViewContainingSearchView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)MTTableViewAccessibility;
  return -[MTTableViewAccessibility accessibilityElementCount](&v5, sel_accessibilityElementCount);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  objc_getAssociatedObject(self, &MTAXTableViewContainingSearchView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_accessibleSubviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  if (objc_msgSend(v6, "count"))
  {
    v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MTTableViewAccessibility;
    -[MTTableViewAccessibility _accessibilitySupplementaryHeaderViews](&v10, sel__accessibilitySupplementaryHeaderViews);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

@end
