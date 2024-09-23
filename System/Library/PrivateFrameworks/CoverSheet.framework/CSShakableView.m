@implementation CSShakableView

- (CSShakableView)initWithFrame:(CGRect)a3
{
  CSShakableView *v3;
  SBFTouchPassThroughView *v4;
  SBFTouchPassThroughView *containerView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSShakableView;
  v3 = -[CSShakableView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (SBFTouchPassThroughView *)objc_alloc_init(MEMORY[0x1E0DA9F28]);
    containerView = v3->_containerView;
    v3->_containerView = v4;

    -[SBFTouchPassThroughView setAutoresizingMask:](v3->_containerView, "setAutoresizingMask:", 2);
    -[CSShakableView setShakeDistance:](v3, "setShakeDistance:", 75.0);
    -[CSShakableView _defaultSpringAnimations](v3, "_defaultSpringAnimations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSShakableView setPrototypeSpringAnimations:](v3, "setPrototypeSpringAnimations:", v6);

    -[CSShakableView addSubview:](v3, "addSubview:", v3->_containerView);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)MEMORY[0x1D17E144C](self, a2);
  -[CSShakableView _invokeCompletionBlockIfNecessary](self, "_invokeCompletionBlockIfNecessary");
  objc_autoreleasePoolPop(v3);
  v4.receiver = self;
  v4.super_class = (Class)CSShakableView;
  -[CSShakableView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  SBFTouchPassThroughView *containerView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSShakableView;
  -[CSShakableView layoutSubviews](&v4, sel_layoutSubviews);
  containerView = self->_containerView;
  -[CSShakableView bounds](self, "bounds");
  -[SBFTouchPassThroughView setFrame:](containerView, "setFrame:");
}

- (id)_defaultSpringAnimations
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 1.20000005);
  objc_msgSend(v4, "setStiffness:", 1200.0);
  objc_msgSend(v4, "setDamping:", 12.0);
  LODWORD(v5) = 1028389654;
  LODWORD(v6) = 990057071;
  LODWORD(v7) = 1059712716;
  LODWORD(v8) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v9);

  objc_msgSend(v4, "setDuration:", 0.860000014);
  objc_msgSend(v4, "setVelocity:", 0.0);
  v10 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.x"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1036831949;
  LODWORD(v13) = 0.25;
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v13, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v16);

  objc_msgSend(v11, "setDuration:", 0.0700000003);
  objc_msgSend(v11, "setFillMode:", v10);
  objc_msgSend(v3, "addObject:", v11);

  return v3;
}

- (void)_invokeCompletionBlockIfNecessary
{
  void (**shakeCompletionBlock)(id, SEL);
  id v4;

  shakeCompletionBlock = (void (**)(id, SEL))self->_shakeCompletionBlock;
  if (shakeCompletionBlock)
  {
    shakeCompletionBlock[2](shakeCompletionBlock, a2);
    v4 = self->_shakeCompletionBlock;
    self->_shakeCompletionBlock = 0;

  }
}

- (void)beginShakingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id shakeCompletionBlock;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[7];

  v4 = a3;
  -[CSShakableView _invokeCompletionBlockIfNecessary](self, "_invokeCompletionBlockIfNecessary");
  v5 = (void *)MEMORY[0x1D17E1614](v4);

  shakeCompletionBlock = self->_shakeCompletionBlock;
  self->_shakeCompletionBlock = v5;

  -[CSShakableView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "position");
  v9 = v8;
  v11 = v10;

  -[CSShakableView prototypeSpringAnimations](self, "prototypeSpringAnimations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__CSShakableView_beginShakingWithCompletion___block_invoke;
  v13[3] = &unk_1E8E30310;
  v13[5] = v9;
  v13[6] = v11;
  v13[4] = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

}

void __45__CSShakableView_beginShakingWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_msgSend(a2, "copy");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "shakeDistance");
  objc_msgSend(v5, "numberWithDouble:", v6 - v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", v8);

  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringAnimation-%lu"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v11, v10);

}

- (SBFTouchPassThroughView)containerView
{
  return self->_containerView;
}

- (NSArray)prototypeSpringAnimations
{
  return self->_prototypeSpringAnimations;
}

- (void)setPrototypeSpringAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_prototypeSpringAnimations, a3);
}

- (double)shakeDistance
{
  return self->_shakeDistance;
}

- (void)setShakeDistance:(double)a3
{
  self->_shakeDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeSpringAnimations, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_shakeCompletionBlock, 0);
}

@end
