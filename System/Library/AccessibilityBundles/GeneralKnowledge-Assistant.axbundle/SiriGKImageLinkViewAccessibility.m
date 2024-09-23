@implementation SiriGKImageLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriGKImageLinkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SiriGKImageLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageLinkedAnswer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
