@implementation CAKeyframeAnimation(SCNAddition)

- (uint64_t)SCN_evaluateAtTime:()SCNAddition reverse:to:
{
  uint64_t v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v9 = objc_msgSend(a1, "c3dAnimation")) != 0)
    return C3DKeyframedAnimationEvaluate(v9, a4, a5, a2);
  else
    return 0;
}

@end
