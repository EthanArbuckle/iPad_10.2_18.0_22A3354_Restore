@implementation SearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchInfo"), CFSTR("results"), "@", 0);
}

- (void)_dropPinsForSearchResults:(id)a3 forSearchType:(int64_t)a4 scrollToResults:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;

  v5 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SearchControllerAccessibility;
  v7 = a3;
  -[SearchControllerAccessibility _dropPinsForSearchResults:forSearchType:scrollToResults:](&v16, sel__dropPinsForSearchResults_forSearchType_scrollToResults_, v7, a4, v5);
  objc_msgSend(v7, "safeValueForKey:", CFSTR("results"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "count");
    if (v9 >= 1)
    {
      v10 = v9;
      v11 = (void *)MEMORY[0x24BDD17C8];
      if (v9 == 1)
      {
        AXMapsLocString(CFSTR("DROPPED_PINS_ANNOUNCEMENT_SINGULAR"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 1;
      }
      else
      {
        AXMapsLocString(CFSTR("DROPPED_PINS_ANNOUNCEMENT_PLURAL"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v10;
      }
      MEMORY[0x2349135D0](v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v15);
    }
  }

}

@end
