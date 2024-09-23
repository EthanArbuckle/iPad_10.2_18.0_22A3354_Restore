@implementation UIView(MPUAnimationFactory)

+ (uint64_t)MPU_animateWithDuration:()MPUAnimationFactory delay:options:animationFactory:animations:completion:
{
  return objc_msgSend(MEMORY[0x24BDF6F90], "_animateWithDuration:delay:options:factory:animations:completion:", a1, 0.0);
}

@end
