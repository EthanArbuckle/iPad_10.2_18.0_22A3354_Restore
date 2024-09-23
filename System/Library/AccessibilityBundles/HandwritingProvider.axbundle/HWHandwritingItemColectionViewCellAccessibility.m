@implementation HWHandwritingItemColectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HWHandwritingItemColectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWHandwritingItemColectionViewCell"), CFSTR("editing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWHandwritingItemColectionViewCell"), CFSTR("deleteButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v6;

  accessibilityLocalizedString(CFSTR("handwritten.item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HWHandwritingItemColectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("editing")))
  {
    accessibilityLocalizedString(CFSTR("editing"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)accessibilityHint
{
  __CFString *v2;

  if (-[HWHandwritingItemColectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("editing")))v2 = CFSTR("handwritten.item.editing.hint");
  else
    v2 = CFSTR("handwritten.item.hint");
  accessibilityLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityCustomActions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HWHandwritingItemColectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("editing")))
  {
    v4 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("handwritten.item.delete.action"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithName:target:selector:", v5, self, sel__axDelete);

    objc_msgSend(v6, "setSortPriority:", *MEMORY[0x24BEBAD58]);
    objc_msgSend(v3, "addObject:", v6);

  }
  return v3;
}

- (void)_axDelete
{
  id v2;

  -[HWHandwritingItemColectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteButton"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivate");

}

@end
