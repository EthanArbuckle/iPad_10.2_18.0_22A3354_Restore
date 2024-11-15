@implementation UIScreen(SwiftUITesting_Swizzles)

+ (void)_performSwiftUITestingOverrides
{
  objc_class *v0;
  objc_class *v1;

  v0 = (objc_class *)objc_opt_class();
  _SwizzleMethods(v0, sel_scale, sel__SwiftUITesting_currentScreenScale);
  v1 = (objc_class *)objc_opt_class();
  _SwizzleMethods(v1, sel__wantsWideContentMargins, sel__SwiftUITesting_wantsWideContentMargins);
}

- (double)_SwiftUITesting_currentScreenScale
{
  return 2.0;
}

- (uint64_t)_SwiftUITesting_wantsWideContentMargins
{
  return 0;
}

@end
