@implementation HUDisplayLinkApplier

- (HUDisplayLinkApplier)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithProgressInputBlock_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDisplayLinkApplier.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUDisplayLinkApplier init]",
    v5);

  return 0;
}

- (HUDisplayLinkApplier)initWithProgressInputBlock:(id)a3
{
  id v5;
  HUDisplayLinkApplier *v6;
  HUDisplayLinkApplier *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDisplayLinkApplier.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progressInputBlock"));

  }
  v10.receiver = self;
  v10.super_class = (Class)HUDisplayLinkApplier;
  v6 = -[HUApplier init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[HUDisplayLinkApplier setProgressInputBlock:](v6, "setProgressInputBlock:", v5);
    v7->_applyOnlyOnProgressChanges = 1;
    v7->_completesWhenAtRest = 1;
  }

  return v7;
}

- (BOOL)start
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  CAFrameRateRange v11;

  v10.receiver = self;
  v10.super_class = (Class)HUDisplayLinkApplier;
  v3 = -[HUApplier start](&v10, sel_start);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkTick);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDisplayLinkApplier setDisplayLink:](self, "setDisplayLink:", v4);

    -[HUDisplayLinkApplier displayLink](self, "displayLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

    -[HUDisplayLinkApplier displayLink](self, "displayLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v7, "setPreferredFrameRateRange:", *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);

    -[HUDisplayLinkApplier displayLink](self, "displayLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighFrameRateReason:", 1769473);

    -[HUDisplayLinkApplier _updateProgressForInitialUpdate:](self, "_updateProgressForInitialUpdate:", 1);
  }
  return v3;
}

- (void)_displayLinkTick
{
  -[HUDisplayLinkApplier _updateProgressForInitialUpdate:](self, "_updateProgressForInitialUpdate:", 0);
}

- (void)_updateProgressForInitialUpdate:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[HUDisplayLinkApplier progressInputBlock](self, "progressInputBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDisplayLinkApplier effectiveInputProgressForBlock:](self, "effectiveInputProgressForBlock:", v5);
  v7 = v6;

  -[HUApplier progress](self, "progress");
  v9 = vabdd_f64(v7, v8);
  if (v9 > 0.001 || a3 || !-[HUDisplayLinkApplier applyOnlyOnProgressChanges](self, "applyOnlyOnProgressChanges"))
    -[HUApplier updateProgress:](self, "updateProgress:", v7);
  if (v9 <= 0.001)
  {
    -[HUDisplayLinkApplier setRestingFrameCount:](self, "setRestingFrameCount:", -[HUDisplayLinkApplier restingFrameCount](self, "restingFrameCount") + 1);
    if (-[HUDisplayLinkApplier restingFrameCount](self, "restingFrameCount") >= 3)
    {
      -[HUDisplayLinkApplier setAtRest:](self, "setAtRest:", 1);
      if (-[HUDisplayLinkApplier completesWhenAtRest](self, "completesWhenAtRest"))
        -[HUDisplayLinkApplier complete:](self, "complete:", 1);
    }
  }
  else
  {
    -[HUDisplayLinkApplier setAtRest:](self, "setAtRest:", 0);
    -[HUDisplayLinkApplier setRestingFrameCount:](self, "setRestingFrameCount:", 0);
  }
}

- (double)effectiveInputProgressForBlock:(id)a3
{
  double result;

  (*((void (**)(id))a3 + 2))(a3);
  return result;
}

- (void)setAtRest:(BOOL)a3
{
  if (self->_atRest != a3)
  {
    self->_atRest = a3;
    -[HUDisplayLinkApplier restingStateDidChange](self, "restingStateDidChange");
  }
}

- (void)_invalidateDisplayLinkIfNecessary
{
  void *v3;

  -[HUDisplayLinkApplier displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[HUDisplayLinkApplier setDisplayLink:](self, "setDisplayLink:", 0);
}

- (BOOL)complete:(BOOL)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUDisplayLinkApplier;
  v4 = -[HUApplier complete:](&v6, sel_complete_, a3);
  if (v4)
    -[HUDisplayLinkApplier _invalidateDisplayLinkIfNecessary](self, "_invalidateDisplayLinkIfNecessary");
  return v4;
}

- (BOOL)applyOnlyOnProgressChanges
{
  return self->_applyOnlyOnProgressChanges;
}

- (void)setApplyOnlyOnProgressChanges:(BOOL)a3
{
  self->_applyOnlyOnProgressChanges = a3;
}

- (BOOL)completesWhenAtRest
{
  return self->_completesWhenAtRest;
}

- (void)setCompletesWhenAtRest:(BOOL)a3
{
  self->_completesWhenAtRest = a3;
}

- (id)progressInputBlock
{
  return self->_progressInputBlock;
}

- (void)setProgressInputBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (BOOL)isAtRest
{
  return self->_atRest;
}

- (unint64_t)restingFrameCount
{
  return self->_restingFrameCount;
}

- (void)setRestingFrameCount:(unint64_t)a3
{
  self->_restingFrameCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_progressInputBlock, 0);
}

@end
