@implementation CASpringAnimation(ClipServicesUIExtras)

+ (id)cps_animationForKeyPath:()ClipServicesUIExtras from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0CD2848], "cps_animationForKeyPath:from:to:beginAfter:duration:keepFinalFrame:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMass:", a3);
  objc_msgSend(v8, "setStiffness:", a4);
  objc_msgSend(v8, "setDamping:", a5);
  return v8;
}

@end
