@implementation NUTranslationAnimationTimingFunction

void __NUTranslationAnimationTimingFunction_block_invoke(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  void *v5;

  LODWORD(a1) = 1046807010;
  LODWORD(a2) = 971075999;
  LODWORD(a3) = 1037082936;
  LODWORD(a4) = 1065254902;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", a1, a2, a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)NUTranslationAnimationTimingFunction_timingFunction;
  NUTranslationAnimationTimingFunction_timingFunction = v4;

}

@end
