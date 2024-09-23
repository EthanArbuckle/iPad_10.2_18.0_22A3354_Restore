@implementation SBFloatyFolderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFloatyFolderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFloatyFolderView"), CFSTR("SBFolderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("currentPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("minimumPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderView"), CFSTR("_iconListViews"), "NSMutableArray");

}

- (void)_currentPageIndexDidChange
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBFloatyFolderViewAccessibility;
  -[SBFloatyFolderViewAccessibility _currentPageIndexDidChange](&v11, sel__currentPageIndexDidChange);
  v3 = -[SBFloatyFolderViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("minimumPageIndex"));
  v4 = -[SBFloatyFolderViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("currentPageIndex"));
  -[SBFloatyFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconListViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = v4 - v3;
    do
    {
      if (v7 == v6)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 0;
      }
      else
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 1;
      }
      objc_msgSend(v8, "setAccessibilityElementsHidden:", v10);

      ++v6;
    }
    while (objc_msgSend(v5, "count") > v6);
  }

}

@end
