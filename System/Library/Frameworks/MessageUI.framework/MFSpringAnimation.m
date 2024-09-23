@implementation MFSpringAnimation

- (MFSpringAnimation)init
{
  MFSpringAnimation *v2;
  MFSpringAnimation *v3;
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  MFSpringAnimationDelegate *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MFSpringAnimation;
  v2 = -[MFSpringAnimation init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MFSpringAnimation setAdditive:](v2, "setAdditive:", 1);
    UIAnimationDragCoefficient();
    -[CASpringAnimation setMass:](v3, "setMass:", (float)(v4 + v4));
    UIAnimationDragCoefficient();
    -[CASpringAnimation setStiffness:](v3, "setStiffness:", (float)(300.0 / v5));
    -[CASpringAnimation setDamping:](v3, "setDamping:", 400.0);
    LODWORD(v6) = 1043925356;
    LODWORD(v7) = 1058273231;
    LODWORD(v8) = 1063980840;
    LODWORD(v9) = 0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v6, v9, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSpringAnimation setTimingFunction:](v3, "setTimingFunction:", v10);

    -[CASpringAnimation durationForEpsilon:](v3, "durationForEpsilon:", 0.001);
    -[MFSpringAnimation setDuration:](v3, "setDuration:");
    v11 = objc_alloc_init(MFSpringAnimationDelegate);
    -[MFSpringAnimation setDelegate:](v3, "setDelegate:", v11);

  }
  return v3;
}

- (void)addCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id aBlock;

  aBlock = a3;
  -[MFSpringAnimation delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "addObject:", v6);

}

+ (id)springAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  MFSpringAnimation *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MFSpringAnimation);
  -[MFSpringAnimation setKeyPath:](v10, "setKeyPath:", v7);
  -[MFSpringAnimation setFromValue:](v10, "setFromValue:", v8);
  -[MFSpringAnimation setToValue:](v10, "setToValue:", v9);

  return v10;
}

@end
