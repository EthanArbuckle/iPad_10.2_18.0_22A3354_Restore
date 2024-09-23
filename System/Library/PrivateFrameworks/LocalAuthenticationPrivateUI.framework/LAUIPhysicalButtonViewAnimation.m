@implementation LAUIPhysicalButtonViewAnimation

- (LAUIPhysicalButtonViewAnimation)initWith:(id)a3 layer:(id)a4
{
  id v6;
  id v7;
  LAUIPhysicalButtonViewAnimation *v8;
  LAUIPhysicalButtonViewAnimation *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LAUIPhysicalButtonViewAnimation;
  v8 = -[LAUIPhysicalButtonViewAnimation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_physicalButtonView, v6);
    objc_storeWeak((id *)&v9->_layer, v7);
  }

  return v9;
}

- (BOOL)isRunning
{
  return self->_animationKey != 0;
}

- (void)begin
{
  -[LAUIPhysicalButtonViewAnimation beginWithDelay:](self, "beginWithDelay:", 0.0);
}

- (void)endImmediately
{
  id WeakRetained;
  NSString *animationKey;

  if (-[LAUIPhysicalButtonViewAnimation isRunning](self, "isRunning"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layer);
    objc_msgSend(WeakRetained, "removeAnimationForKey:", self->_animationKey);

    animationKey = self->_animationKey;
    self->_animationKey = 0;

  }
}

- (void)end
{
  NSString *v3;
  NSString *animationKey;
  CALayer *WeakRetained;
  long double v6;
  double v7;
  double v8;
  long double v9;
  long double v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v13[5];
  NSString *v14;

  if (-[LAUIPhysicalButtonViewAnimation isRunning](self, "isRunning"))
  {
    v3 = self->_animationKey;
    animationKey = self->_animationKey;
    self->_animationKey = 0;

    WeakRetained = (CALayer *)objc_loadWeakRetained((id *)&self->_layer);
    v6 = LAUILayerAnimationElapsedDuration(WeakRetained, v3);

    if (v6 <= 0.0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_layer);
      objc_msgSend(v12, "removeAnimationForKey:", v3);

    }
    else
    {
      -[LAUIPhysicalButtonViewAnimation duration](self, "duration");
      v8 = v7;
      -[LAUIPhysicalButtonViewAnimation duration](self, "duration");
      v10 = fmod(v6, v9);
      v11 = dispatch_time(0, (uint64_t)((v8 - v10) * 1000000000.0));
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __38__LAUIPhysicalButtonViewAnimation_end__block_invoke;
      v13[3] = &unk_24C27EDD0;
      v13[4] = self;
      v14 = v3;
      dispatch_after(v11, MEMORY[0x24BDAC9B8], v13);

    }
  }
}

void __38__LAUIPhysicalButtonViewAnimation_end__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "removeAnimationForKey:", *(_QWORD *)(a1 + 40));

}

- (double)duration
{
  return 0.0;
}

- (void)addAdditiveAnimation:(id)a3 to:(id)a4 keyPath:(id)a5
{
  CALayer *v8;
  NSString *v9;
  NSString *v10;
  NSString *animationKey;
  CAAnimation *v12;

  v12 = (CAAnimation *)a3;
  v8 = (CALayer *)a4;
  v9 = (NSString *)a5;
  LAUILayerAddAdditiveAnimation(v8, v9, v12);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  animationKey = self->_animationKey;
  self->_animationKey = v10;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationKey, 0);
  objc_destroyWeak((id *)&self->_layer);
  objc_destroyWeak((id *)&self->_physicalButtonView);
}

@end
