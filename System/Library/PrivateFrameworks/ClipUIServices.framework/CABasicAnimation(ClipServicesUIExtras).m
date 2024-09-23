@implementation CABasicAnimation(ClipServicesUIExtras)

+ (id)cps_animationForKeyPath:()ClipServicesUIExtras from:to:beginAfter:duration:keepFinalFrame:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD *v17;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  objc_msgSend((id)objc_opt_class(), "animationWithKeyPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setFromValue:", v14);
  objc_msgSend(v16, "setToValue:", v13);

  objc_msgSend(v16, "setAdditive:", 0);
  objc_msgSend(v16, "setRemovedOnCompletion:", 0);
  v17 = (_QWORD *)MEMORY[0x1E0CD2B60];
  if (!a8)
    v17 = (_QWORD *)MEMORY[0x1E0CD2B50];
  objc_msgSend(v16, "setFillMode:", *v17);
  objc_msgSend(v16, "setBeginTime:", CACurrentMediaTime() + a1);
  objc_msgSend(v16, "setDuration:", a2);
  return v16;
}

+ (uint64_t)cps_nullAnimationWithDuration:()ClipServicesUIExtras
{
  return objc_msgSend(a1, "cps_animationForKeyPath:from:to:beginAfter:duration:keepFinalFrame:", &stru_1E8E8B5E8, 0, 0, 1, 0.0, a3);
}

@end
