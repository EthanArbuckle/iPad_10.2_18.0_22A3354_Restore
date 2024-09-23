@implementation VKImageAnalysisBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKImageAnalysisBarButtonItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("VKImageAnalysisBarButtonItem"), CFSTR("imageForMode:"), "@", "Q", 0);
}

+ (id)imageForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VKImageAnalysisBarButtonItemAccessibility;
  objc_msgSendSuper2(&v7, sel_imageForMode_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXImageAnalysisLabel(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setAccessibilityLabel:", v5);

  return v4;
}

@end
