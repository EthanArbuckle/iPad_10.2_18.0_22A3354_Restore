@implementation STStorageButtonHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageButtonHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStorageButtonHeaderAccessibility;
  -[STStorageButtonHeaderAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXRequestingClient() == 3)
  {
    objc_msgSend(v2, "lowercaseString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

@end
