@implementation CASpringAnimation(LPExtras)

+ (id)_lp_springWithMass:()LPExtras stiffness:damping:
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CD2848]);
  objc_msgSend(v6, "setMass:", a1);
  objc_msgSend(v6, "setStiffness:", a2);
  objc_msgSend(v6, "setDamping:", a3);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v6, "settlingDuration");
  objc_msgSend(v6, "setDuration:");
  return v6;
}

@end
