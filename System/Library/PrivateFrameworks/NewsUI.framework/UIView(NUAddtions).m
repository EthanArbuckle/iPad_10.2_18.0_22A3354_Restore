@implementation UIView(NUAddtions)

+ (void)nu_animateWithDuration:()NUAddtions delay:timingFunction:options:animations:completion:
{
  id v13;
  NUAnimationFactory *v14;
  id v15;

  v15 = a7;
  v13 = a8;
  if (a5)
  {
    v14 = a5;
    a5 = -[NUAnimationFactory initWithMediaTimingFunction:]([NUAnimationFactory alloc], "initWithMediaTimingFunction:", v14);

    a6 |= 0x60000uLL;
  }
  objc_msgSend(MEMORY[0x24BDF6F90], "_animateWithDuration:delay:options:factory:animations:completion:", a6, a5, v15, v13, a1, a2);

}

@end
