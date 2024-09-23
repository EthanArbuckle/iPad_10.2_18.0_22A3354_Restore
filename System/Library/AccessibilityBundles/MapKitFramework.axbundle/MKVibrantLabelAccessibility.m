@implementation MKVibrantLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKVibrantLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKVibrantLabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKVibrantLabel"), CFSTR("attributedText"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_opt_class();
  -[MKVibrantLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attributedText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "string");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKVibrantLabelAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

@end
