@implementation MobileCalUIDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDimmingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("LargeWeekViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDimmingView"), CFSTR("delegate"), "@", 0);

}

- (id)_accessibilityObscuredScreenAllowedViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MobileCalUIDimmingViewAccessibility;
  -[MobileCalUIDimmingViewAccessibility _accessibilityObscuredScreenAllowedViews](&v13, sel__accessibilityObscuredScreenAllowedViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MobileCalUIDimmingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("LargeWeekViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = objc_msgSend(v4, "count");
      if (v8 - 1 >= 0)
      {
        v9 = v8;
        do
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", --v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v11 = objc_opt_isKindOfClass();

          if ((v11 & 1) != 0)
            objc_msgSend(v4, "removeObjectAtIndex:", v9);
        }
        while (v9 > 0);
      }
    }
  }

  return v4;
}

@end
