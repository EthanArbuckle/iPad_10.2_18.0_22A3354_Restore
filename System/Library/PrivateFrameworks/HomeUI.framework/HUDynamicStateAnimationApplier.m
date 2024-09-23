@implementation HUDynamicStateAnimationApplier

- (HUDynamicStateAnimationApplier)initWithAnimationSettings:(id)a3 initialProgress:(double)a4 progressInputBlock:(id)a5
{
  id v8;
  HUDynamicStateAnimationApplier *v9;
  uint64_t v10;
  HUAnimationSettings *animationSettings;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUDynamicStateAnimationApplier;
  v9 = -[HUDisplayLinkApplier initWithProgressInputBlock:](&v13, sel_initWithProgressInputBlock_, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    animationSettings = v9->_animationSettings;
    v9->_animationSettings = (HUAnimationSettings *)v10;

    v9->_initialProgress = a4;
  }

  return v9;
}

- (HUAnimationSettings)animationSettings
{
  return (HUAnimationSettings *)(id)-[HUAnimationSettings copy](self->_animationSettings, "copy");
}

- (BOOL)start
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUDynamicStateAnimationApplier;
  v3 = -[HUDisplayLinkApplier start](&v5, sel_start);
  if (v3)
    -[HUDynamicStateAnimationApplier setLastTargetChangeTime:](self, "setLastTargetChangeTime:", CACurrentMediaTime());
  return v3;
}

- (void)updateProgress:(double)a3
{
  objc_super v5;

  -[HUDynamicStateAnimationApplier setHasUpdatedProgress:](self, "setHasUpdatedProgress:", 1);
  v5.receiver = self;
  v5.super_class = (Class)HUDynamicStateAnimationApplier;
  -[HUApplier updateProgress:](&v5, sel_updateProgress_, a3);
}

- (double)effectiveInputProgressForBlock:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void (**v8)(_QWORD, double);
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double result;
  _QWORD v19[6];

  v4 = (*((double (**)(id, SEL))a3 + 2))(a3, a2);
  if (-[HUDynamicStateAnimationApplier hasUpdatedProgress](self, "hasUpdatedProgress"))
  {
    -[HUDynamicStateAnimationApplier targetProgress](self, "targetProgress");
    if (vabdd_f64(v5, v4) > 0.00000011920929)
    {
      -[HUDynamicStateAnimationApplier preInterpolatedProgress](self, "preInterpolatedProgress");
      -[HUDynamicStateAnimationApplier setInitialProgress:](self, "setInitialProgress:");
      -[HUDynamicStateAnimationApplier setTargetProgress:](self, "setTargetProgress:", v4);
      -[HUDynamicStateAnimationApplier setLastTargetChangeTime:](self, "setLastTargetChangeTime:", CACurrentMediaTime());
    }
    -[HUDynamicStateAnimationApplier initialProgress](self, "initialProgress");
    v7 = vabdd_f64(v4, v6);
    if (v7 >= 0.001)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __65__HUDynamicStateAnimationApplier_effectiveInputProgressForBlock___block_invoke;
      v19[3] = &unk_1E6F52FC0;
      v19[4] = self;
      *(double *)&v19[5] = v4;
      v8 = (void (**)(_QWORD, double))_Block_copy(v19);
      -[HUDynamicStateAnimationApplier animationSettings](self, "animationSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "durationWithSpeed");
      v11 = v7 * v10;

      v12 = CACurrentMediaTime();
      -[HUDynamicStateAnimationApplier lastTargetChangeTime](self, "lastTargetChangeTime");
      v14 = (v12 - v13) / v11;
      v8[2](v8, v14);
      -[HUDynamicStateAnimationApplier setPreInterpolatedProgress:](self, "setPreInterpolatedProgress:");
      -[HUDynamicStateAnimationApplier animationSettings](self, "animationSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "interpolatedProgressForProgress:", v14);
      v17 = v16;

      v4 = ((double (*)(_QWORD, double))v8[2])(v8, v17);
    }
    return v4;
  }
  else
  {
    -[HUDynamicStateAnimationApplier setTargetProgress:](self, "setTargetProgress:", v4);
    -[HUDynamicStateAnimationApplier initialProgress](self, "initialProgress");
    -[HUDynamicStateAnimationApplier setPreInterpolatedProgress:](self, "setPreInterpolatedProgress:");
    -[HUDynamicStateAnimationApplier setLastTargetChangeTime:](self, "setLastTargetChangeTime:", CACurrentMediaTime());
    -[HUDynamicStateAnimationApplier initialProgress](self, "initialProgress");
  }
  return result;
}

double __65__HUDynamicStateAnimationApplier_effectiveInputProgressForBlock___block_invoke(uint64_t a1, double a2)
{
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "initialProgress");
  return v4 + (*(double *)(a1 + 40) - v4) * a2;
}

- (double)initialProgress
{
  return self->_initialProgress;
}

- (void)setInitialProgress:(double)a3
{
  self->_initialProgress = a3;
}

- (double)targetProgress
{
  return self->_targetProgress;
}

- (void)setTargetProgress:(double)a3
{
  self->_targetProgress = a3;
}

- (double)preInterpolatedProgress
{
  return self->_preInterpolatedProgress;
}

- (void)setPreInterpolatedProgress:(double)a3
{
  self->_preInterpolatedProgress = a3;
}

- (double)lastTargetChangeTime
{
  return self->_lastTargetChangeTime;
}

- (void)setLastTargetChangeTime:(double)a3
{
  self->_lastTargetChangeTime = a3;
}

- (BOOL)hasUpdatedProgress
{
  return self->_hasUpdatedProgress;
}

- (void)setHasUpdatedProgress:(BOOL)a3
{
  self->_hasUpdatedProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end
