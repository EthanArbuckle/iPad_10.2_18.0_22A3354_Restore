@implementation UIView(FocusUI)

+ (uint64_t)fcui_animateWithAnimationType:()FocusUI actions:completion:
{
  double v3;

  if (a3 == 1)
    v3 = 50.0;
  else
    v3 = 38.0;
  return objc_msgSend(a1, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, dbl_214797490[a3 == 1], 0.0, 2.0, 300.0, v3, 0.0);
}

+ (uint64_t)fcui_animateWithDefaultParameters:()FocusUI completion:
{
  return objc_msgSend(a1, "fcui_animateWithAnimationType:actions:completion:", 0, a3, a4);
}

+ (uint64_t)fcui_animateWithSelectionParameters:()FocusUI completion:
{
  return objc_msgSend(a1, "fcui_animateWithAnimationType:actions:completion:", 0, a3, a4);
}

@end
