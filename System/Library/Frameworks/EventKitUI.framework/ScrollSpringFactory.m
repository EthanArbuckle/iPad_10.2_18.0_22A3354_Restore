@implementation ScrollSpringFactory

+ (id)sharedFactory
{
  return 0;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  void *v5;
  id v6;
  double v7;
  double v8;

  _createSpringOfBasicAnimationDependingOnDebugState(a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[ScrollSpringFactory initialVelocity](self, "initialVelocity");
    objc_msgSend(v6, "setVelocity:");
    -[ScrollSpringFactory initialVelocity](self, "initialVelocity");
    v8 = -v7;
    if (v7 >= 0.0)
      v8 = v7;
    if (v8 > 20.0)
      objc_msgSend(v6, "setVelocity:");

  }
  return v5;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (void)setInitialVelocity:(double)a3
{
  self->_initialVelocity = a3;
}

@end
