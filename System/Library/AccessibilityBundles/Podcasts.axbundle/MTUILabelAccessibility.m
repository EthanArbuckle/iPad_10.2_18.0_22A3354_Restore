@implementation MTUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  -[MTUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TimeRemaining"));

  if (v4)
  {
    v5 = CFSTR("time.remaining");
  }
  else
  {
    -[MTUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("TimeElapsed"));

    if (!v7)
    {
      v10.receiver = self;
      v10.super_class = (Class)MTUILabelAccessibility;
      -[MTUILabelAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    v5 = CFSTR("time.elapsed");
  }
  accessibilityLocalizedString(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  int v5;
  char **v6;
  MTUILabelAccessibility **v7;
  MTUILabelAccessibility *v9;
  MTUILabelAccessibility *v10;

  -[MTUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("TimeRemaining")))
  {

  }
  else
  {
    -[MTUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("TimeElapsed"));

    if (!v5)
    {
      v9 = self;
      v6 = &selRef_accessibilityValue;
      v7 = &v9;
      goto LABEL_6;
    }
  }
  v10 = self;
  v6 = &selRef_accessibilityLabel;
  v7 = &v10;
LABEL_6:
  v7[1] = (MTUILabelAccessibility *)MTUILabelAccessibility;
  objc_msgSendSuper2((objc_super *)v7, *v6, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
