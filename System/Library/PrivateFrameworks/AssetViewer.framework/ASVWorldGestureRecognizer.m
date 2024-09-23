@implementation ASVWorldGestureRecognizer

- (ASVWorldGestureRecognizer)initWithWorldDelegate:(id)a3 feedbackGenerator:(id)a4
{
  id v6;
  ASVWorldGestureRecognizer *v7;
  ASVWorldGestureRecognizer *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  NSSet *snapScalesSet;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASVWorldGestureRecognizer;
  v7 = -[ASVUnifiedGestureRecognizer initWithDelegate:feedbackGenerator:](&v15, sel_initWithDelegate_feedbackGenerator_, v6, a4);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_worldDelegate, v6);
    v9 = (void *)MEMORY[0x1E0C99E60];
    LODWORD(v10) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithObjects:", v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    snapScalesSet = v8->_snapScalesSet;
    v8->_snapScalesSet = (NSSet *)v12;

  }
  return v8;
}

- (void)setEnabledGestureTypes:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASVWorldGestureRecognizer;
  -[ASVUnifiedGestureRecognizer setEnabledGestureTypes:](&v4, sel_setEnabledGestureTypes_, a3);
  -[ASVWorldGestureRecognizer cancelDeceleration](self, "cancelDeceleration");
}

- (id)singleFingerGestureForTouch:(id)a3 dataSource:(id)a4 enabledGestureTypes:(unint64_t)a5
{
  id v7;
  ASVWorldSingleFingerGesture *v8;
  void *v9;
  ASVWorldSingleFingerGesture *v10;

  v7 = a3;
  v8 = [ASVWorldSingleFingerGesture alloc];
  -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASVWorldSingleFingerGesture initWithTouch:dataSource:worldDelegate:enabledGestureTypes:](v8, "initWithTouch:dataSource:worldDelegate:enabledGestureTypes:", v7, v9, self, a5);

  return v10;
}

- (id)twoFingerGestureForFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  ASVWorldTwoFingerGesture *v9;
  void *v10;
  ASVWorldTwoFingerGesture *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = [ASVWorldTwoFingerGesture alloc];
  -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ASVWorldTwoFingerGesture initWithFirstTouch:secondTouch:dataSource:worldDelegate:](v9, "initWithFirstTouch:secondTouch:dataSource:worldDelegate:", v8, v7, v10, self);

  -[ASVWorldGestureRecognizer snapScalesSet](self, "snapScalesSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVTwoFingerGesture setSnapScalesSet:](v11, "setSnapScalesSet:", v12);

  return v11;
}

- (BOOL)isActive
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASVWorldGestureRecognizer;
  return -[ASVUnifiedGestureRecognizer isActive](&v4, sel_isActive)
      || -[ASVWorldGestureRecognizer isDecelerating](self, "isDecelerating");
}

- (void)update
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASVWorldGestureRecognizer;
  -[ASVUnifiedGestureRecognizer update](&v3, sel_update);
  if (-[ASVWorldGestureRecognizer isDecelerating](self, "isDecelerating"))
    -[ASVWorldGestureRecognizer updateDecelerationTranslation](self, "updateDecelerationTranslation");
}

- (float)minimumObjectScale
{
  float result;

  if (-[ASVUnifiedGestureRecognizer allowObjectScaling](self, "allowObjectScaling"))
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumAssetWorldScale"));
  else
    -[ASVUnifiedGestureRecognizer currentObjectScale](self, "currentObjectScale");
  return result;
}

- (float)maximumObjectScale
{
  float result;

  if (-[ASVUnifiedGestureRecognizer allowObjectScaling](self, "allowObjectScaling"))
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMaximumAssetWorldScale"));
  else
    -[ASVUnifiedGestureRecognizer currentObjectScale](self, "currentObjectScale");
  return result;
}

- (void)gestureBeganTranslation:(id)a3
{
  id v4;

  -[ASVWorldGestureRecognizer cancelDeceleration](self, "cancelDeceleration", a3);
  -[ASVWorldGestureRecognizer setTranslationVelocitySample:](self, "setTranslationVelocitySample:", 0);
  -[ASVWorldGestureRecognizer setTranslationLastVelocitySample:](self, "setTranslationLastVelocitySample:", 0);
  -[ASVWorldGestureRecognizer worldDelegate](self, "worldDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "worldGestureRecognizerBeganTranslation:", self);

}

- (void)gesture:(id)a3 translatedAssetToScreenPoint:
{
  double v3;
  double v4;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  ASVVelocitySample3D *v12;
  double v13;
  double v14;
  ASVVelocitySample3D *v15;
  double v16;
  id v17;
  double v18;

  v4 = v3;
  -[ASVWorldGestureRecognizer worldDelegate](self, "worldDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "worldGestureRecognizer:translatedAssetToScreenPoint:", self, v4);

  -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v17 = v7;
    objc_msgSend(v7, "assetWorldPosition");
    v18 = v8;
    v9 = CACurrentMediaTime();
    -[ASVWorldGestureRecognizer translationVelocitySample](self, "translationVelocitySample");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[ASVWorldGestureRecognizer setLastTranslationLocation:](self, "setLastTranslationLocation:", v18);
      -[ASVWorldGestureRecognizer setLastTranslationTime:](self, "setLastTranslationTime:", v9);
    }
    -[ASVWorldGestureRecognizer translationVelocitySample](self, "translationVelocitySample");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVWorldGestureRecognizer setTranslationLastVelocitySample:](self, "setTranslationLastVelocitySample:", v11);

    v12 = [ASVVelocitySample3D alloc];
    -[ASVWorldGestureRecognizer lastTranslationLocation](self, "lastTranslationLocation");
    v16 = v13;
    -[ASVWorldGestureRecognizer lastTranslationTime](self, "lastTranslationTime");
    v15 = -[ASVVelocitySample3D initWithStart:end:deltaTime:](v12, "initWithStart:end:deltaTime:", v16, v18, v9 - v14);
    -[ASVWorldGestureRecognizer setTranslationVelocitySample:](self, "setTranslationVelocitySample:", v15);

    -[ASVWorldGestureRecognizer setLastTranslationLocation:](self, "setLastTranslationLocation:", v18);
    -[ASVWorldGestureRecognizer setLastTranslationTime:](self, "setLastTranslationTime:", v9);
    v7 = v17;
  }

}

- (void)gestureEndedTranslation:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ASVWorldGestureRecognizer translationVelocitySample](self, "translationVelocitySample");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVWorldGestureRecognizer translationLastVelocitySample](self, "translationLastVelocitySample");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calcFinalVelocityFromPreviousSample:", v7);
    v9 = v8;

    -[ASVWorldGestureRecognizer startTranslationDecelerationWithInitialVelocity:](self, "startTranslationDecelerationWithInitialVelocity:", v9);
  }
  -[ASVWorldGestureRecognizer worldDelegate](self, "worldDelegate", *(_QWORD *)&v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "worldGestureRecognizerEndedTranslation:", self);

}

- (void)gestureBeganLevitation:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[ASVWorldGestureRecognizer worldDelegate](self, "worldDelegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "worldGestureRecognizerBeganLevitation:", self);
      v5 = v7;
    }
  }

}

- (void)gesture:(id)a3 levitatedAssetToScreenPoint:
{
  double v3;
  double v4;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v4 = v3;
  -[ASVWorldGestureRecognizer worldDelegate](self, "worldDelegate", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9 = (void *)v6;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "worldGestureRecognizer:levitatedAssetToScreenPoint:", self, v4);
      v7 = v9;
    }
  }

}

- (void)gestureEndedLevitation:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[ASVWorldGestureRecognizer worldDelegate](self, "worldDelegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "worldGestureRecognizerEndedLevitation:", self);
      v5 = v7;
    }
  }

}

- (void)startTranslationDecelerationWithInitialVelocity:(ASVWorldGestureRecognizer *)self
{
  float32x4_t v2;
  float32x4_t v4;
  float v5;
  float v6;
  ASVDampingDeceleration *v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  ASVDampingDeceleration *v13;
  float32x4_t v14;
  double v15;
  void *v16;

  v14 = v2;
  v4 = vmulq_f32(v2, v2);
  v4.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))).u64[0];
  v4.f32[0] = sqrtf(v4.f32[0]);
  v15 = *(double *)v4.i64;
  v5 = fabsf(v4.f32[0]);
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumVelocityToBeginTranslationDeceleration"));
  if (v5 > v6)
  {
    -[ASVWorldGestureRecognizer setNormalizedVelocity:](self, "setNormalizedVelocity:", *(double *)vdivq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v15, 0)).i64);
    v7 = [ASVDampingDeceleration alloc];
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumDeltaToEndTranslationDeceleration"));
    v9 = v8;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingWorldTranslationDecelerationRate"));
    LODWORD(v11) = v10;
    LODWORD(v12) = v9;
    v13 = -[ASVDampingDeceleration initWithVelocity:minEndDelta:decelerationRate:](v7, "initWithVelocity:minEndDelta:decelerationRate:", v15, v12, v11);
    -[ASVWorldGestureRecognizer setTranslationDeceleration:](self, "setTranslationDeceleration:", v13);

    -[ASVWorldGestureRecognizer worldDelegate](self, "worldDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "worldGestureRecognizerBeganTranslationDeceleration:", self);

  }
}

- (BOOL)isDecelerating
{
  void *v3;
  void *v4;
  char v5;

  -[ASVWorldGestureRecognizer translationDeceleration](self, "translationDeceleration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ASVWorldGestureRecognizer translationDeceleration](self, "translationDeceleration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDecelerating");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateDecelerationTranslation
{
  void *v3;
  void *v4;
  double v5;
  float32x4_t v6;
  double v7;
  id v8;

  -[ASVWorldGestureRecognizer translationDeceleration](self, "translationDeceleration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASVWorldGestureRecognizer worldDelegate](self, "worldDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ASVWorldGestureRecognizer translationDeceleration](self, "translationDeceleration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decelerationDelta");
    v7 = v5;

    if (*(float *)&v7 <= 0.0)
    {
      -[ASVWorldGestureRecognizer setTranslationDeceleration:](self, "setTranslationDeceleration:", 0, v7);
      objc_msgSend(v8, "worldGestureRecognizerEndedTranslationDeceleration:", self);
    }
    else
    {
      -[ASVWorldGestureRecognizer normalizedVelocity](self, "normalizedVelocity", v7);
      objc_msgSend(v8, "worldGestureRecognizer:decelerationTranslationDelta:", self, *(double *)vmulq_n_f32(v6, *(float *)&v7).i64);
    }

  }
}

- (void)cancelDeceleration
{
  -[ASVWorldGestureRecognizer setTranslationDeceleration:](self, "setTranslationDeceleration:", 0);
}

- (ASVWorldGestureRecognizerDelegate)worldDelegate
{
  return (ASVWorldGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_worldDelegate);
}

- (void)setWorldDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_worldDelegate, a3);
}

- (NSSet)snapScalesSet
{
  return self->_snapScalesSet;
}

- (void)setSnapScalesSet:(id)a3
{
  objc_storeStrong((id *)&self->_snapScalesSet, a3);
}

- (ASVDeceleration)translationDeceleration
{
  return self->_translationDeceleration;
}

- (void)setTranslationDeceleration:(id)a3
{
  objc_storeStrong((id *)&self->_translationDeceleration, a3);
}

- (ASVVelocitySample3D)translationVelocitySample
{
  return self->_translationVelocitySample;
}

- (void)setTranslationVelocitySample:(id)a3
{
  objc_storeStrong((id *)&self->_translationVelocitySample, a3);
}

- (ASVVelocitySample3D)translationLastVelocitySample
{
  return self->_translationLastVelocitySample;
}

- (void)setTranslationLastVelocitySample:(id)a3
{
  objc_storeStrong((id *)&self->_translationLastVelocitySample, a3);
}

- (__n128)normalizedVelocity
{
  return a1[11];
}

- (void)setNormalizedVelocity:(ASVWorldGestureRecognizer *)self
{
  __int128 v2;

  *(_OWORD *)self->_normalizedVelocity = v2;
}

- (__n128)lastTranslationLocation
{
  return a1[12];
}

- (void)setLastTranslationLocation:(ASVWorldGestureRecognizer *)self
{
  __int128 v2;

  *(_OWORD *)self->_lastTranslationLocation = v2;
}

- (double)lastTranslationTime
{
  return self->_lastTranslationTime;
}

- (void)setLastTranslationTime:(double)a3
{
  self->_lastTranslationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationLastVelocitySample, 0);
  objc_storeStrong((id *)&self->_translationVelocitySample, 0);
  objc_storeStrong((id *)&self->_translationDeceleration, 0);
  objc_storeStrong((id *)&self->_snapScalesSet, 0);
  objc_destroyWeak((id *)&self->_worldDelegate);
}

@end
