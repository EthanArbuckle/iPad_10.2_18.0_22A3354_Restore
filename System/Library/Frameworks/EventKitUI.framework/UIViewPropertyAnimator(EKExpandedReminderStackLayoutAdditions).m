@implementation UIViewPropertyAnimator(EKExpandedReminderStackLayoutAdditions)

+ (id)expandingStackedRemindersSpringAnimator
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 365.074, 38.2138, 0.0, 0.0);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v0, 0.0);

  return v1;
}

+ (id)expandingLayoutAttributesStackedRemindersSpringAnimator
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 203.917, 19.992, 0.0, 0.0);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v0, 0.0);

  return v1;
}

+ (id)collapsingStackedRemindersSpringAnimator
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithMass:stiffness:damping:initialVelocity:", 1.8, 480.0, 60.0, 0.0, 0.0);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v0, 0.0);

  return v1;
}

@end
