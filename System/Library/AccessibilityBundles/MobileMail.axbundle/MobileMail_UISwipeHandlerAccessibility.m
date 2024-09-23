@implementation MobileMail_UISwipeHandlerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISwipeHandler");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UISwipeHandler"), CFSTR("_swipeRecognizerEnded: wasCancelled:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UISwipeHandler"), CFSTR("swipeController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISwipeActionController"), CFSTR("swipeActionHost"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISwipeActionController"), CFSTR("swipedIndexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_accessibilityClearChildren"), "v", 0);

}

- (void)_swipeRecognizerEnded:(id)a3 wasCancelled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;
  char v14;

  v4 = a4;
  v6 = a3;
  -[MobileMail_UISwipeHandlerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("swipeController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("swipeActionHost"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "safeValueForKey:", CFSTR("swipedIndexPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v14 = 0;
      objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (id)objc_msgSend(v11, "safeValueForKey:", CFSTR("_accessibilityClearChildren"));
    }

  }
  v13.receiver = self;
  v13.super_class = (Class)MobileMail_UISwipeHandlerAccessibility;
  -[MobileMail_UISwipeHandlerAccessibility _swipeRecognizerEnded:wasCancelled:](&v13, sel__swipeRecognizerEnded_wasCancelled_, v6, v4);

}

@end
