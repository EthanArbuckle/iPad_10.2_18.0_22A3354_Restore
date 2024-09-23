@implementation PSSubtitleSwitchTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSSubtitleSwitchTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PSSubtitleSwitchTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "isHidden") & 1) == 0
    && (objc_msgSend(v4, "window"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    -[PSSubtitleSwitchTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
