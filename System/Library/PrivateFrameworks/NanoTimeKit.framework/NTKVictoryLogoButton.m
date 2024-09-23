@implementation NTKVictoryLogoButton

- (NTKVictoryLogoButton)initWithFrame:(CGRect)a3
{
  NTKVictoryLogoButton *v3;
  NTKVictoryLogoButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKVictoryLogoButton;
  v3 = -[NTKAdjustableTapTargetButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NTKAdjustableTapTargetButton setTouchEdgeInsets:](v3, "setTouchEdgeInsets:", -20.0, -20.0, -20.0, -20.0);
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKVictoryLogoButton;
  -[NTKVictoryLogoButton setHighlighted:](&v10, sel_setHighlighted_);
  v5 = (void *)MEMORY[0x1E0DC3F10];
  if (v3)
  {
    v9 = MEMORY[0x1E0C809B0];
    v6 = __39__NTKVictoryLogoButton_setHighlighted___block_invoke;
    v7 = &v9;
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v6 = __39__NTKVictoryLogoButton_setHighlighted___block_invoke_2;
    v7 = &v8;
  }
  v7[1] = 3221225472;
  v7[2] = (uint64_t)v6;
  v7[3] = (uint64_t)&unk_1E6BCD5F0;
  v7[4] = (uint64_t)self;
  objc_msgSend(v5, "animateWithDuration:animations:", 0.15, v8);
}

uint64_t __39__NTKVictoryLogoButton_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.6);
}

uint64_t __39__NTKVictoryLogoButton_setHighlighted___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

@end
