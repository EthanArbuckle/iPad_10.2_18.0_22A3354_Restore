@implementation UIDocumentBrowserActionBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SaveToFiles.UIDocumentBrowserActionBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.UIDocumentBrowserActionBarButton"), CFSTR("docAction"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  -[UIDocumentBrowserActionBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("docAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "localizedTitle");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDocumentBrowserActionBarButtonAccessibility;
    -[UIDocumentBrowserActionBarButtonAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

@end
