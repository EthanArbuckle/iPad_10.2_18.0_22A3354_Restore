@implementation TLKImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKImageView"), CFSTR("tlkImage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKImage"), CFSTR("uiImage"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[TLKImageViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("tlkImage.uiImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TLKImageViewAccessibility;
    -[TLKImageViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
