@implementation CAAnimation(AuthKit)

+ (id)ak_jiggleAnimation
{
  void *v0;
  double v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CD2848], "animation");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setMass:", 1.20000005);
  objc_msgSend(v0, "setStiffness:", 1200.0);
  objc_msgSend(v0, "setDamping:", 12.0);
  objc_msgSend(v0, "setDuration:", 1.39999998);
  objc_msgSend(v0, "setVelocity:", 0.0);
  objc_msgSend(v0, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  LODWORD(v1) = 30.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFromValue:", v2);

  LODWORD(v3) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setToValue:", v4);

  objc_msgSend(MEMORY[0x1E0CD28D8], "functionWithName:", *MEMORY[0x1E0CD31F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setValueFunction:", v5);

  LODWORD(v6) = 1028389654;
  LODWORD(v7) = 990057071;
  LODWORD(v8) = 1059712716;
  LODWORD(v9) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTimingFunction:", v10);

  objc_msgSend(v0, "setKeyPath:", CFSTR("transform"));
  return v0;
}

@end
