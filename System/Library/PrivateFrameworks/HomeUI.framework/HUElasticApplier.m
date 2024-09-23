@implementation HUElasticApplier

- (HUElasticApplier)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithProgressInputBlock_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUElasticApplier.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUElasticApplier init]",
    v5);

  return 0;
}

- (HUElasticApplier)initWithProgressInputBlock:(id)a3
{
  id v5;
  HUElasticApplier *v6;
  HUElasticApplier *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUElasticApplier.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progressInputBlock"));

  }
  v10.receiver = self;
  v10.super_class = (Class)HUElasticApplier;
  v6 = -[HUApplier init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[HUElasticApplier setProgressInputBlock:](v6, "setProgressInputBlock:", v5);
    v7->_applyOnlyOnProgressChanges = 1;
    v7->_completesWhenAtRest = 1;
    v7->_tension = 200.0;
    v7->_friction = 8.0;
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
  v10.super_class = (Class)HUElasticApplier;
  v3 = -[HUApplier start](&v10, sel_start);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkTick);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUElasticApplier setDisplayLink:](self, "setDisplayLink:", v4);

    -[HUElasticApplier displayLink](self, "displayLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

    -[HUElasticApplier displayLink](self, "displayLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v7, "setPreferredFrameRateRange:", *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);

    -[HUElasticApplier displayLink](self, "displayLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighFrameRateReason:", 1769473);

    -[HUElasticApplier _updateProgressForInitialUpdate:](self, "_updateProgressForInitialUpdate:", 1);
  }
  return v3;
}

- (void)_displayLinkTick
{
  -[HUElasticApplier _updateProgressForInitialUpdate:](self, "_updateProgressForInitialUpdate:", 0);
}

- (void)_updateProgressForInitialUpdate:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double (**v6)(double);
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v3 = a3;
  v5 = (double)-[HUElasticApplier frameCount](self, "frameCount") * 0.0166666667;
  -[HUElasticApplier progressInputBlock](self, "progressInputBlock");
  v6 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  v7 = v6[2](v5);

  if (!v3
    || (v8 = v7,
        !-[HUElasticApplier progressBeginsFromInitialInputProgress](self, "progressBeginsFromInitialInputProgress")))
  {
    -[HUApplier progress](self, "progress");
    v8 = v9;
  }
  -[HUElasticApplier tension](self, "tension");
  v11 = v10 * (v7 - v8);
  if (v3)
    v12 = 0.0;
  else
    v12 = 0.0166666667;
  v13 = v8 + v12 * v11 * v12;
  -[HUElasticApplier friction](self, "friction");
  v15 = fmax(1.0 - v12 * v14, 0.0);
  -[HUElasticApplier previousForce](self, "previousForce");
  v17 = v15 * (v13 - v16) / 0.0166666667;
  v18 = v13 + v17 * v12;
  v19 = vabdd_f64(v18, v8);
  -[HUElasticApplier setPreviousForce:](self, "setPreviousForce:", v13);
  -[HUElasticApplier setCurrentVelocity:](self, "setCurrentVelocity:", v17);
  -[HUElasticApplier setFrameCount:](self, "setFrameCount:", -[HUElasticApplier frameCount](self, "frameCount") + 1);
  if (v19 > 0.001 || v3 || !-[HUElasticApplier applyOnlyOnProgressChanges](self, "applyOnlyOnProgressChanges"))
    -[HUApplier updateProgress:](self, "updateProgress:", v18);
  if (v19 <= 0.001 && -[HUElasticApplier completesWhenAtRest](self, "completesWhenAtRest"))
  {
    -[HUElasticApplier setRestingFrameCount:](self, "setRestingFrameCount:", -[HUElasticApplier restingFrameCount](self, "restingFrameCount") + 1);
    if (-[HUElasticApplier restingFrameCount](self, "restingFrameCount") >= 3)
      -[HUElasticApplier complete:](self, "complete:", 1);
  }
  else
  {
    -[HUElasticApplier setRestingFrameCount:](self, "setRestingFrameCount:", 0);
  }
}

- (void)_invalidateDisplayLinkIfNecessary
{
  void *v3;

  -[HUElasticApplier displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[HUElasticApplier setDisplayLink:](self, "setDisplayLink:", 0);
}

- (BOOL)complete:(BOOL)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUElasticApplier;
  v4 = -[HUApplier complete:](&v6, sel_complete_, a3);
  if (v4)
    -[HUElasticApplier _invalidateDisplayLinkIfNecessary](self, "_invalidateDisplayLinkIfNecessary");
  return v4;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (BOOL)completesWhenAtRest
{
  return self->_completesWhenAtRest;
}

- (void)setCompletesWhenAtRest:(BOOL)a3
{
  self->_completesWhenAtRest = a3;
}

- (BOOL)progressBeginsFromInitialInputProgress
{
  return self->_progressBeginsFromInitialInputProgress;
}

- (void)setProgressBeginsFromInitialInputProgress:(BOOL)a3
{
  self->_progressBeginsFromInitialInputProgress = a3;
}

- (BOOL)applyOnlyOnProgressChanges
{
  return self->_applyOnlyOnProgressChanges;
}

- (void)setApplyOnlyOnProgressChanges:(BOOL)a3
{
  self->_applyOnlyOnProgressChanges = a3;
}

- (double)currentVelocity
{
  return self->_currentVelocity;
}

- (void)setCurrentVelocity:(double)a3
{
  self->_currentVelocity = a3;
}

- (id)progressInputBlock
{
  return self->_progressInputBlock;
}

- (void)setProgressInputBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(unint64_t)a3
{
  self->_frameCount = a3;
}

- (unint64_t)restingFrameCount
{
  return self->_restingFrameCount;
}

- (void)setRestingFrameCount:(unint64_t)a3
{
  self->_restingFrameCount = a3;
}

- (double)previousForce
{
  return self->_previousForce;
}

- (void)setPreviousForce:(double)a3
{
  self->_previousForce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_progressInputBlock, 0);
}

@end
