@implementation JTAnimation

+ (void)performAnimation:(id)a3 duration:(double)a4 completion:(id)a5
{
  +[JTAnimation performAnimation:curve:duration:completion:delay:userInteractionEnabled:](JTAnimation, "performAnimation:curve:duration:completion:delay:userInteractionEnabled:", a3, 0, a5, 0, a4, 0.0);
}

+ (void)performAnimation:(id)a3 curve:(int64_t)a4 duration:(double)a5 completion:(id)a6 delay:(double)a7 userInteractionEnabled:(BOOL)a8
{
  _BOOL8 v8;
  objc_class *v13;
  id v14;
  id v15;
  id v16;

  v8 = a8;
  v13 = (objc_class *)MEMORY[0x24BDF6FA8];
  v14 = a6;
  v15 = a3;
  v16 = (id)objc_msgSend([v13 alloc], "initWithDuration:curve:animations:", a4, v15, a5);
  +[JTAnimation performWithAnimator:animation:duration:completion:delay:userInteractionEnabled:](JTAnimation, "performWithAnimator:animation:duration:completion:delay:userInteractionEnabled:", v16, v15, v14, v8, a5, a7);

}

+ (void)performAnimation:(id)a3 timingParameters:(id)a4 duration:(double)a5 completion:(id)a6 delay:(double)a7
{
  +[JTAnimation performAnimation:timingParameters:duration:completion:delay:userInteractionEnabled:](JTAnimation, "performAnimation:timingParameters:duration:completion:delay:userInteractionEnabled:", a3, a4, a6, 0, a5, a7);
}

+ (void)performAnimation:(id)a3 timingParameters:(id)a4 duration:(double)a5 completion:(id)a6 delay:(double)a7 userInteractionEnabled:(BOOL)a8
{
  _BOOL8 v8;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v8 = a8;
  v13 = (objc_class *)MEMORY[0x24BDF6FA8];
  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = (id)objc_msgSend([v13 alloc], "initWithDuration:timingParameters:", v15, a5);

  +[JTAnimation performWithAnimator:animation:duration:completion:delay:userInteractionEnabled:](JTAnimation, "performWithAnimator:animation:duration:completion:delay:userInteractionEnabled:", v17, v16, v14, v8, a5, a7);
}

+ (void)performWithAnimator:(id)a3 animation:(id)a4 duration:(double)a5 completion:(id)a6 delay:(double)a7 userInteractionEnabled:(BOOL)a8
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;

  v8 = a8;
  v14 = a3;
  v12 = a4;
  v13 = a6;
  if (v12)
    objc_msgSend(v14, "addAnimations:", v12);
  if (v13)
    objc_msgSend(v14, "addCompletion:", v13);
  objc_msgSend(v14, "setUserInteractionEnabled:", v8);
  objc_msgSend(v14, "startAnimationAfterDelay:", a7);

}

@end
