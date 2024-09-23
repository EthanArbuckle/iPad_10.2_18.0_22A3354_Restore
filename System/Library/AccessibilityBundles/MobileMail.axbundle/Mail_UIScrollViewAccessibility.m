@implementation Mail_UIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  UIEdgeInsets result;

  v17.receiver = self;
  v17.super_class = (Class)Mail_UIScrollViewAccessibility;
  -[Mail_UIScrollViewAccessibility _accessibilityVisibleContentInset](&v17, sel__accessibilityVisibleContentInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[Mail_UIScrollViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("kAXMailContentViewWebViewIdentifier"));

  v13 = 0.0;
  if (!v12)
    v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

@end
