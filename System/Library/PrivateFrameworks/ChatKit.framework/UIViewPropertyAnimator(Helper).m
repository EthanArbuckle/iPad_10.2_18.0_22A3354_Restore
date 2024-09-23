@implementation UIViewPropertyAnimator(Helper)

+ (id)ck_viewPropertyAnimatorWithMass:()Helper stiffness:damping:initialVelocity:
{
  void *v7;
  void *v8;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9D8]), "initWithMass:stiffness:damping:initialVelocity:", a2, a3, a4, a5, a6);
  v8 = (void *)objc_msgSend([a1 alloc], "initWithDuration:timingParameters:", v7, 0.0);

  return v8;
}

+ (uint64_t)ck_viewPropertyAnimatorWithMass:()Helper stiffness:damping:
{
  return objc_msgSend(a1, "ck_viewPropertyAnimatorWithMass:stiffness:damping:initialVelocity:", a3, a4, a5, 0.0, 0.0);
}

@end
