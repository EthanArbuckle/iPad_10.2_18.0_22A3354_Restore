@implementation CKInvisibleInkEffectView

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("DebugInvisibleInkUpdateInterval"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "doubleValue");
    else
      v3 = 0x3FA0842108421084;
    updateInterval = v3;

  }
}

+ (double)updateInterval
{
  return *(double *)&updateInterval;
}

- (CKInvisibleInkEffectView)initWithFrame:(CGRect)a3
{
  CKInvisibleInkEffectView *v3;
  CKInvisibleInkEffectCoverageTracker *v4;
  double v5;
  double v6;
  CKInvisibleInkEffectCoverageTracker *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKInvisibleInkEffectView;
  v3 = -[CKInvisibleInkEffectView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKInvisibleInkEffectCoverageTracker alloc];
    -[CKInvisibleInkEffectView bounds](v3, "bounds");
    v7 = -[CKInvisibleInkEffectCoverageTracker initWithSize:touchLifetime:](v4, "initWithSize:touchLifetime:", v5, v6, 3.0);
    -[CKInvisibleInkEffectView setCoverageTracker:](v3, "setCoverageTracker:", v7);

    -[CKInvisibleInkEffectView coverageTracker](v3, "coverageTracker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v3);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKInvisibleInkEffectView;
  -[CKInvisibleInkEffectView layoutSubviews](&v6, sel_layoutSubviews);
  -[CKInvisibleInkEffectView coverageTracker](self, "coverageTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEffectView bounds](self, "bounds");
  objc_msgSend(v3, "setSize:", v4, v5);

}

- (void)reset
{
  id v2;

  -[CKInvisibleInkEffectView coverageTracker](self, "coverageTracker");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (void)invisibleInkEffectCoverageTrackerDidUncover:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKInvisibleInkEffectView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKInvisibleInkEffectView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invisibleInkEffectViewWasUncovered:", self);

  }
}

- (CKInvisibleInkEffectViewDelegate)delegate
{
  return (CKInvisibleInkEffectViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (CKInvisibleInkEffectCoverageTracker)coverageTracker
{
  return self->_coverageTracker;
}

- (void)setCoverageTracker:(id)a3
{
  objc_storeStrong((id *)&self->_coverageTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverageTracker, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
