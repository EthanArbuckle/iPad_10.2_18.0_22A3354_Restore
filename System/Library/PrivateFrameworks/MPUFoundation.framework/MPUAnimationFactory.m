@implementation MPUAnimationFactory

- (MPUAnimationFactory)init
{
  MPUAnimationFactory *v2;
  MPUAnimationFactory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPUAnimationFactory;
  v2 = -[MPUAnimationFactory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_fillMode, (id)*MEMORY[0x24BDE5980]);
    v3->_removedOnCompletion = 1;
  }
  return v3;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[MPUAnimationFactory allowedKeyPaths](self, "allowedKeyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "containsObject:", v5))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeOffset:", self->_timeOffset);
    objc_msgSend(v8, "setFillMode:", self->_fillMode);
    objc_msgSend(v8, "setRemovedOnCompletion:", self->_removedOnCompletion);
  }

  return v8;
}

- (id)_timingFunctionForAnimation
{
  return self->_timingFunction;
}

- (NSArray)allowedKeyPaths
{
  return self->_allowedKeyPaths;
}

- (void)setAllowedKeyPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)fillMode
{
  return self->_fillMode;
}

- (void)setFillMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isRemovedOnCompletion
{
  return self->_removedOnCompletion;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  self->_removedOnCompletion = a3;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_fillMode, 0);
  objc_storeStrong((id *)&self->_allowedKeyPaths, 0);
}

@end
