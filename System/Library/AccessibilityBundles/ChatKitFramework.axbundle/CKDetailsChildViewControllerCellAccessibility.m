@implementation CKDetailsChildViewControllerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsChildViewControllerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsChildViewControllerCell"), CFSTR("childViewControllerView"), "@", 0);
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;

  objc_msgSend(a3, "_accessibilityParentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKAttachmentCell"));
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    -[CKDetailsChildViewControllerCellAccessibility _accessibilityScrollParent](self, "_accessibilityScrollParent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityFrameForScrolling");
    objc_msgSend(v6, "_accessibilityScrollToFrame:forView:", v4);

  }
  return isKindOfClass & 1;
}

@end
