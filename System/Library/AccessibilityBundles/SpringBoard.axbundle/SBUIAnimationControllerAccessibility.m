@implementation SBUIAnimationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIAnimationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)beginAnimation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIAnimationControllerAccessibility;
  -[SBUIAnimationControllerAccessibility beginAnimation](&v4, sel_beginAnimation);
  -[SBUIAnimationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_transitionContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetAllowsSiblingsWhenOvergrown:", 1);

}

@end
