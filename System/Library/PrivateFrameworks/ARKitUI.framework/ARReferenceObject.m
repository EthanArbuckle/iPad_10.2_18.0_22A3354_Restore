@implementation ARReferenceObject

void __47__ARReferenceObject_ARKitAdditions__initialize__block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  objc_method *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_writeToArchiveWithPreviewImage_error_);
  v2 = class_getInstanceMethod(v0, sel__writeToArchiveWithPreviewImage_error_);
  method_exchangeImplementations(v2, InstanceMethod);
}

@end
