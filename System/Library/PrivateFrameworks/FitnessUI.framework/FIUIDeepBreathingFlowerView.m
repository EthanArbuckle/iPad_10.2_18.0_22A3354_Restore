@implementation FIUIDeepBreathingFlowerView

- (FIUIDeepBreathingFlowerView)initWithFrame:(CGRect)a3 petalColor:(int64_t)a4 congratulationsText:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  FIUIDeepBreathingFlowerView *v13;
  FIUIDeepBreathingFlowerView *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *petalRingsByNumberOfPetals;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FIUIDeepBreathingFlowerView;
  v13 = -[FIUIDeepBreathingFlowerView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_petalColor = a4;
    -[FIUIDeepBreathingFlowerView layer](v13, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupOpacity:", 0);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    petalRingsByNumberOfPetals = v14->_petalRingsByNumberOfPetals;
    v14->_petalRingsByNumberOfPetals = (NSMutableDictionary *)v16;

    -[FIUIDeepBreathingFlowerView _preloadPetalRings](v14, "_preloadPetalRings");
    objc_storeStrong((id *)&v14->_congratulationsText, a5);
  }

  return v14;
}

- (FIUIDeepBreathingFlowerView)initWithFrame:(CGRect)a3 congratulationsText:(id)a4
{
  return -[FIUIDeepBreathingFlowerView initWithFrame:petalColor:congratulationsText:](self, "initWithFrame:petalColor:congratulationsText:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    self->_stateStartTime = CFAbsoluteTimeGetCurrent();
  }
}

- (id)_currentPetalRing
{
  return self->_currentPetalRing;
}

- (void)_preloadPetalRings
{
  id v3;
  id v4;
  uint64_t i;
  id v6;

  if (FIUIDeepBreathingShouldOptimizePetalCount())
  {
    v3 = -[FIUIDeepBreathingFlowerView _petalRingWithNumberOfShaderPetals:showBlurTrails:](self, "_petalRingWithNumberOfShaderPetals:showBlurTrails:", 6, 0);
    v4 = -[FIUIDeepBreathingFlowerView _petalRingWithNumberOfShaderPetals:showBlurTrails:](self, "_petalRingWithNumberOfShaderPetals:showBlurTrails:", 10, 0);
    for (i = 1; i != 6; ++i)
    {
      if (((uint64_t)FIUIDeepBreathingPetalCountForMinutesRemaining((double)i) & 1) == 0)
        v6 = -[FIUIDeepBreathingFlowerView _petalRingWithNumberOfShaderPetals:showBlurTrails:](self, "_petalRingWithNumberOfShaderPetals:showBlurTrails:");
    }
  }
  -[FIUIDeepBreathingFlowerView _updateShaderForNumberOfPetals:showBlurTrails:](self, "_updateShaderForNumberOfPetals:showBlurTrails:", 10, 0);
  -[FIUIDeepBreathingFlowerView _setNumberOfVisiblePetals:showBlurTrails:](self, "_setNumberOfVisiblePetals:showBlurTrails:", 10, 0);
}

- (id)_petalRingWithNumberOfShaderPetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  void *v8;
  FIUIBreathingPetalRingMetalView *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  FIUIBreathingPetalRingMetalView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int64_t petalColor;
  double v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = 100;
  if (!a4)
    v7 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7 + a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_petalRingsByNumberOfPetals, "objectForKeyedSubscript:", v8);
  v9 = (FIUIBreathingPetalRingMetalView *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD2FE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = v10;
      objc_msgSend(v11, "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_21307C000, v12, OS_LOG_TYPE_DEFAULT, "creating petal ring with %@ petals (blur trails = %@)", (uint8_t *)&v27, 0x16u);

    }
    v15 = [FIUIBreathingPetalRingMetalView alloc];
    -[FIUIDeepBreathingFlowerView bounds](self, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    petalColor = self->_petalColor;
    if (_defaultMetalDevice_onceToken != -1)
      dispatch_once(&_defaultMetalDevice_onceToken, &__block_literal_global_311);
    v9 = -[FIUIBreathingPetalRingMetalView initWithFrame:petalColor:numberOfPetals:showBlurTrails:device:](v15, "initWithFrame:petalColor:numberOfPetals:showBlurTrails:device:", petalColor, a3, v4, _defaultMetalDevice_metalDevice, v17, v19, v21, v23);
    if (FIUIDeepBreathingShouldOptimizePetalCount())
    {
      LODWORD(v25) = 30.0;
      -[FIUIBreathingPetalRingMetalView setPreferredFramesPerSecond:](v9, "setPreferredFramesPerSecond:", v25);
    }
    -[FIUIBreathingPetalRingMetalView setPetalRingDelegate:](v9, "setPetalRingDelegate:", self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_petalRingsByNumberOfPetals, "setObject:forKeyedSubscript:", v9, v8);
  }

  return v9;
}

- (void)_setNumberOfVisiblePetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
  NSMutableArray *v5;
  NSMutableArray *trailAlphaKeyFrames;
  NSMutableArray *v7;
  NSMutableArray *trailAlphaKeyValues;
  int64_t v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  if (self->_numberOfVisiblePetals != a3 || self->_showBlurTrails != a4)
  {
    self->_numberOfVisiblePetals = a3;
    self->_showBlurTrails = a4;
    v15 = a4;
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      trailAlphaKeyFrames = self->_trailAlphaKeyFrames;
      self->_trailAlphaKeyFrames = v5;

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      trailAlphaKeyValues = self->_trailAlphaKeyValues;
      self->_trailAlphaKeyValues = v7;

      if (self->_numberOfVisiblePetals >= 1)
      {
        v9 = 0;
        do
        {
          v10 = self->_trailAlphaKeyFrames;
          v17[0] = &unk_24CF4F9E0;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)FIUIRandomInteger(59, 95) / 306.0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v17[1] = v11;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)FIUIRandomInteger(154, 267) / 306.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17[2] = v12;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v10, "addObject:", v13);

          -[NSMutableArray addObject:](self->_trailAlphaKeyValues, "addObject:", &unk_24CF4EE88);
          ++v9;
        }
        while (v9 < self->_numberOfVisiblePetals);
      }
    }
    -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfVisiblePetals:showBlurTrails:", a3, v15);

  }
}

- (void)_updateShaderForNumberOfPetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
  _BOOL4 v4;
  int ShouldOptimizePetalCount;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  FIUIBreathingPetalRingViewDrawable *v17;
  FIUIBreathingPetalRingViewDrawable *currentPetalRing;
  FIUIBreathingPetalRingViewDrawable *v19;
  FIUIBreathingPetalRingViewDrawable *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  ShouldOptimizePetalCount = FIUIDeepBreathingShouldOptimizePetalCount();
  v8 = 6;
  if (a3 > 6)
    v8 = a3;
  v9 = (v8 & 1) + v8;
  if (ShouldOptimizePetalCount)
    v10 = v9;
  else
    v10 = 10;
  v11 = ShouldOptimizePetalCount ^ 1 | v4;
  if (-[FIUIBreathingPetalRingViewDrawable numberOfPetals](self->_currentPetalRing, "numberOfPetals") != v10
    || (_DWORD)v11 != -[FIUIBreathingPetalRingViewDrawable showBlurTrails](self->_currentPetalRing, "showBlurTrails"))
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x24BDD2FE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)MEMORY[0x24BDD16E0];
      v14 = v12;
      objc_msgSend(v13, "numberWithInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_21307C000, v14, OS_LOG_TYPE_DEFAULT, "update to shader with %@ petals, showBlurTrails = %@", (uint8_t *)&v23, 0x16u);

    }
    -[FIUIDeepBreathingFlowerView _petalRingWithNumberOfShaderPetals:showBlurTrails:](self, "_petalRingWithNumberOfShaderPetals:showBlurTrails:", v10, v11);
    v17 = (FIUIBreathingPetalRingViewDrawable *)objc_claimAutoreleasedReturnValue();
    currentPetalRing = self->_currentPetalRing;
    self->_currentPetalRing = v17;
    v19 = v17;
    v20 = currentPetalRing;

    -[FIUIBreathingPetalRingViewDrawable view](self->_currentPetalRing, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIDeepBreathingFlowerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v21, 0);

    -[FIUIBreathingPetalRingViewDrawable importDataFromPetalRing:](self->_currentPetalRing, "importDataFromPetalRing:", v20);
    -[FIUIBreathingPetalRingViewDrawable view](v20, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "removeFromSuperview");
  }
}

- (void)petalRingViewDisplayLinkDidFire:(id)a3
{
  double v4;
  _BOOL4 v5;
  int64_t state;
  _BOOL4 v8;
  BOOL v9;
  int64_t v10;
  uint64_t v11;

  v4 = (CFAbsoluteTimeGetCurrent() - self->_stateStartTime) / (self->_stateEndTime - self->_stateStartTime);
  v5 = v4 >= 1.0;
  state = self->_state;
  v8 = state == 8 || state == 3;
  v9 = v5 && v8;
  if (v5 && v8)
    v4 = 1.0;
  switch(state)
  {
    case 3:
      -[FIUIDeepBreathingFlowerView _updateForShrinkToOnRampWithFractionComplete:](self, "_updateForShrinkToOnRampWithFractionComplete:", v4);
      if (v9)
        goto LABEL_20;
      return;
    case 4:
      -[FIUIDeepBreathingFlowerView _updateForOnRampWithTimeInState:](self, "_updateForOnRampWithTimeInState:");
      if (v9)
        goto LABEL_20;
      return;
    case 5:
      -[FIUIDeepBreathingFlowerView _updateForGuidingWithTimeInState:](self, "_updateForGuidingWithTimeInState:");
      if (v9)
        goto LABEL_20;
      return;
    case 6:
      -[FIUIDeepBreathingFlowerView _updateForCongratulationsWithTimeInState:fractionComplete:](self, "_updateForCongratulationsWithTimeInState:fractionComplete:");
      if (v9)
        goto LABEL_20;
      return;
    case 7:
      -[FIUIDeepBreathingFlowerView _updateForUnwindToCompletedWithFractionComplete:](self, "_updateForUnwindToCompletedWithFractionComplete:", v4);
      goto LABEL_19;
    case 8:
      -[FIUIDeepBreathingFlowerView _updateForWindToConfigurationWithFractionComplete:](self, "_updateForWindToConfigurationWithFractionComplete:", v4);
      if (!v9)
        return;
      goto LABEL_20;
    default:
LABEL_19:
      if (v9)
      {
LABEL_20:
        v10 = self->_state;
        if (v10 == 8)
          v11 = 2;
        else
          v11 = 4 * (v10 == 3);
        -[FIUIDeepBreathingFlowerView _setState:](self, "_setState:", v11);
      }
      return;
  }
}

- (void)setWelcomeWindFraction:(double)a3
{
  double v5;
  double v6;
  double v7;
  FIUIDeepBreathingFlowerView *v8;

  if (self->_state != 1)
    -[FIUIDeepBreathingFlowerView _setState:](self, "_setState:", 1);
  if (a3 >= 2.22044605e-16)
  {
    v7 = 38.75;
    v6 = 16.0;
    v8 = self;
    v5 = a3;
  }
  else
  {
    v5 = 0.0;
    v6 = 16.0;
    v7 = 16.0;
    v8 = self;
  }
  -[FIUIDeepBreathingFlowerView _setWindFraction:smallRadius:largeRadius:windType:showBlurTrails:](v8, "_setWindFraction:smallRadius:largeRadius:windType:showBlurTrails:", 1, 0, v5, v6, v7);
}

- (void)transitionToConfigurationAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;

  v3 = a3;
  -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1078530011;
  objc_msgSend(v5, "setGradientRotationAngle:", v6);

  -[FIUIDeepBreathingFlowerView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIDeepBreathingFlowerView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "center");
  v10 = v9;
  v12 = v11;
  -[FIUIDeepBreathingFlowerView superview](self, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:fromView:", v14, v10, v12);
  v16 = v15;

  -[FIUIDeepBreathingFlowerView center](self, "center");
  self->_centerVerticalOffsetBeforeTransitionToConfiguration = v16 - v17;
  if (v3)
  {
    -[FIUIDeepBreathingFlowerView _setState:](self, "_setState:", 8);
    self->_stateEndTime = self->_stateStartTime + 0.5;
  }
  else
  {
    -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIDeepBreathingFlowerView bounds](self, "bounds");
    objc_msgSend(v18, "setRingCenter:", FIUIMidpointOfBounds(v19, v20, v21));

    -[FIUIDeepBreathingFlowerView _setState:](self, "_setState:", 2);
  }
  -[UILabel setAlpha:](self->_congratulationsLabel, "setAlpha:", 0.0);
}

- (void)setNumberOfConfigurationPetals:(double)a3
{
  long double v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v4 = FIUIRoundToNearest(a3, 0.01);
  -[FIUIDeepBreathingFlowerView _updateShaderForNumberOfPetals:showBlurTrails:](self, "_updateShaderForNumberOfPetals:showBlurTrails:", 10, 0);
  v5 = ceil(v4);
  -[FIUIDeepBreathingFlowerView _setNumberOfVisiblePetals:showBlurTrails:](self, "_setNumberOfVisiblePetals:showBlurTrails:", (uint64_t)fmin(v5, 10.0), 0);
  if (self->_numberOfVisiblePetals >= 1)
  {
    v6 = v5 + -1.0;
    v7 = fmod(v4, 1.0);
    v8 = 0;
    do
    {
      v9 = FIUIDeepBreathingPetalCenter(v8, 1, v4, 38.75, -0.523598776);
      v11 = v10;
      v12 = 1.0;
      if (v6 == (double)v8)
      {
        if (FIUIIsEqual(v4, (double)self->_numberOfVisiblePetals))
          v12 = 1.0;
        else
          v12 = v7;
      }
      -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v14 = v12;
      LODWORD(v15) = 1109065728;
      objc_msgSend(v13, "setPetalAtIndex:center:radius:alpha:", v8, v9, v11, v15, v14);

      ++v8;
    }
    while (v8 < self->_numberOfVisiblePetals);
  }
  -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1117454336;
  objc_msgSend(v17, "setRingRadius:", v16);

}

- (void)startOnRampAtDate:(id)a3 sessionDuration:(double)a4
{
  double v5;

  self->_sessionDuration = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  self->_stateEndTime = v5;
  -[FIUIDeepBreathingFlowerView _createCongratulationsLabelIfNeeded](self, "_createCongratulationsLabelIfNeeded");
  -[FIUIDeepBreathingFlowerView _setState:](self, "_setState:", 3);
}

- (void)_updateForShrinkToOnRampWithFractionComplete:(double)a3
{
  double v3;

  LODWORD(v3) = 1.0;
  -[FIUIDeepBreathingFlowerView _updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:](self, "_updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:", 0, self->_numberOfVisiblePetals, 1, a3 * -26.25 + 38.75, a3 * -38.75 + 38.75, -0.523598776, v3);
}

- (void)_updateForOnRampWithTimeInState:(double)a3
{
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;

  v5 = (double)FIUIDeepBreathingOnRampNumberOfBreaths();
  v6 = fmin(fmax(a3, 0.0), FIUIDeepBreathingOnRampFullBreathDuration() * v5);
  -[FIUIDeepBreathingFlowerView _petalCountForMinutesRemaining:](self, "_petalCountForMinutesRemaining:", ceil(self->_sessionDuration / 60.0));
  v8 = (uint64_t)v7;
  v9 = FIUIDeepBreathingOnRampInhaleDuration();
  v10 = FIUIDeepBreathingOnRampExhaleDuration();
  -[FIUIDeepBreathingFlowerView _updateForBreathWithPetalCount:petalRadius:inhaleDuration:exhaleDuration:timeInCurrentBreath:showBlurTrails:shouldSpin:](self, "_updateForBreathWithPetalCount:petalRadius:inhaleDuration:exhaleDuration:timeInCurrentBreath:showBlurTrails:shouldSpin:", v8, 0, 1, 16.0, v9, v10, v6 - floor(v6 / (v9 + v10)) * (v9 + v10));
}

- (void)startGuidingAtDate:(id)a3 breathsPerMinute:(double)a4
{
  self->_breathsPerMinute = a4;
  -[FIUIDeepBreathingFlowerView _setState:](self, "_setState:", 5);
}

- (void)_updateForGuidingWithTimeInState:(double)a3
{
  double sessionDuration;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;

  sessionDuration = self->_sessionDuration;
  v5 = fmin(fmax(a3, 0.0), sessionDuration);
  -[FIUIDeepBreathingFlowerView _petalCountForMinutesRemaining:](self, "_petalCountForMinutesRemaining:", ceil((sessionDuration - v5) / 60.0));
  v7 = (uint64_t)v6;
  v8 = FIUIDeepBreathingInhaleDuration(self->_breathsPerMinute);
  v9 = FIUIDeepBreathingExhaleDuration(self->_breathsPerMinute);
  -[FIUIDeepBreathingFlowerView _updateForBreathWithPetalCount:petalRadius:inhaleDuration:exhaleDuration:timeInCurrentBreath:showBlurTrails:shouldSpin:](self, "_updateForBreathWithPetalCount:petalRadius:inhaleDuration:exhaleDuration:timeInCurrentBreath:showBlurTrails:shouldSpin:", v7, v5 - floor(v5 / (v8 + v9)) * (v8 + v9) > v8, 1, 38.75, v8, v9);
}

- (void)transitionToCongratulations
{
  -[FIUIDeepBreathingFlowerView _setState:](self, "_setState:", 6);
  self->_stateEndTime = self->_stateStartTime + 2.0;
}

- (void)_updateForCongratulationsWithTimeInState:(double)a3 fractionComplete:(double)a4
{
  double v5;

  v5 = fmin(fmax(a3, 0.0), self->_stateEndTime - self->_stateStartTime);
  -[UILabel setAlpha:](self->_congratulationsLabel, "setAlpha:", a4);
  -[FIUIDeepBreathingFlowerView _updateForBreathWithPetalCount:petalRadius:inhaleDuration:exhaleDuration:timeInCurrentBreath:showBlurTrails:shouldSpin:](self, "_updateForBreathWithPetalCount:petalRadius:inhaleDuration:exhaleDuration:timeInCurrentBreath:showBlurTrails:shouldSpin:", 6, 0, 0, 24.0, self->_stateEndTime - self->_stateStartTime, 0.0, v5);
}

- (void)_createCongratulationsLabelIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *congratulationsLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  if (!self->_congratulationsLabel)
  {
    -[FIUIDeepBreathingFlowerView frame](self, "frame");
    v4 = v3;
    v6 = v5;
    v9 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v7, v8, v3, v5);
    congratulationsLabel = self->_congratulationsLabel;
    self->_congratulationsLabel = v9;

    v11 = self->_congratulationsLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = self->_congratulationsLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    v15 = self->_congratulationsLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel setTextAlignment:](self->_congratulationsLabel, "setTextAlignment:", 1);
    -[UILabel setText:](self->_congratulationsLabel, "setText:", self->_congratulationsText);
    -[UILabel setNumberOfLines:](self->_congratulationsLabel, "setNumberOfLines:", 0);
    -[UILabel setAlpha:](self->_congratulationsLabel, "setAlpha:", 0.0);
    -[FIUIDeepBreathingFlowerView addSubview:](self, "addSubview:", self->_congratulationsLabel);
    -[UILabel sizeToFit](self->_congratulationsLabel, "sizeToFit");
    -[UILabel frame](self->_congratulationsLabel, "frame");
    v18 = v17;
    -[UILabel _lastLineBaseline](self->_congratulationsLabel, "_lastLineBaseline");
    -[UILabel setFrame:](self->_congratulationsLabel, "setFrame:", 0.0, v6 + -20.0 - v19, v4, v18);
    -[UILabel _setLastLineBaselineFrameOriginY:](self->_congratulationsLabel, "_setLastLineBaselineFrameOriginY:", v6 + -19.5);
  }
}

- (void)transitionToCompletedWithDuration:(double)a3
{
  -[FIUIDeepBreathingFlowerView _setState:](self, "_setState:", 7);
  self->_stateEndTime = self->_stateStartTime + a3;
}

- (CGPoint)_originalRingCenterForWindType:(int64_t)a3
{
  double Height;
  double Width;
  double v7;
  double v8;
  _BOOL4 IsRightToLeft;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;
  CGRect v16;
  CGRect v17;

  -[FIUIDeepBreathingFlowerView bounds](self, "bounds");
  Height = CGRectGetHeight(v16);
  -[FIUIDeepBreathingFlowerView bounds](self, "bounds");
  Width = CGRectGetWidth(v17);
  if (a3)
  {
    if (a3 == 1)
    {
      -[FIUIDeepBreathingFlowerView bounds](self, "bounds");
      v10 = FIUIMidpointOfBounds(v11, v12, v13);
      v8 = Height + -7.0 + -55.0;
      goto LABEL_11;
    }
    if (a3 != 2)
    {
      v10 = *MEMORY[0x24BDBEFB0];
      v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      goto LABEL_11;
    }
    v7 = self->_centerVerticalOffsetBeforeTransitionToConfiguration + -14.0;
  }
  else
  {
    v7 = -14.0;
  }
  v8 = Height + v7 + -40.0;
  IsRightToLeft = FIUILocaleIsRightToLeft();
  v10 = Width + -44.0;
  if (!IsRightToLeft)
    v10 = 44.0;
LABEL_11:
  v14 = v8;
  result.y = v14;
  result.x = v10;
  return result;
}

- (void)_updateForUnwindToCompletedWithFractionComplete:(double)a3
{
  -[UILabel setAlpha:](self->_congratulationsLabel, "setAlpha:", fmin(fmax(a3 * -2.0 + 1.0, 0.0), 1.0));
  -[FIUIDeepBreathingFlowerView _setWindFraction:smallRadius:largeRadius:windType:showBlurTrails:](self, "_setWindFraction:smallRadius:largeRadius:windType:showBlurTrails:", 0, 1, 1.0 - a3, 8.0, 24.0);
}

- (void)_updateForWindToConfigurationWithFractionComplete:(double)a3
{
  -[FIUIDeepBreathingFlowerView _setWindFraction:smallRadius:largeRadius:windType:showBlurTrails:](self, "_setWindFraction:smallRadius:largeRadius:windType:showBlurTrails:", 2, 0, a3, 8.0, 38.75);
}

- (double)_curveEaseInValue:(double)a3
{
  double v3;
  float v4;

  v3 = a3;
  if (_curveEaseInValue__onceToken != -1)
    dispatch_once(&_curveEaseInValue__onceToken, &__block_literal_global_1);
  *(float *)&a3 = v3;
  objc_msgSend((id)_curveEaseInValue____timingFunction, "_solveForInput:", a3);
  return v4;
}

void __49__FIUIDeepBreathingFlowerView__curveEaseInValue___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_curveEaseInValue____timingFunction;
  _curveEaseInValue____timingFunction = v0;

}

- (void)_setWindFraction:(double)a3 smallRadius:(double)a4 largeRadius:(double)a5 windType:(int64_t)a6 showBlurTrails:(BOOL)a7
{
  _BOOL8 v7;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  id v38;

  v7 = a7;
  v12 = fmin(fmax(a3, 0.0), 1.0);
  -[FIUIDeepBreathingFlowerView _curveEaseInValue:](self, "_curveEaseInValue:", v12);
  v14 = v13;
  if (a6)
  {
    v15 = v13 * -2.0943951 + 1.57079633;
    -[FIUIDeepBreathingFlowerView _curveEaseInValue:](self, "_curveEaseInValue:", v12);
    v17 = v16;
    if ((unint64_t)a6 <= 2)
    {
      v18 = FIUIDeepBreathingSessionMinutesDefault();
      v19 = (uint64_t)FIUIDeepBreathingPetalCountForMinutesRemaining((double)v18);
      goto LABEL_9;
    }
  }
  else
  {
    v15 = v12 * -2.0943951 + 1.57079633;
    if (v12 <= 1.0 - 0.33)
      v12 = v12 / (1.0 - 0.33);
    else
      v12 = 1.0;
    -[FIUIDeepBreathingFlowerView _curveEaseInValue:](self, "_curveEaseInValue:", v12);
    v17 = v20;
  }
  v19 = 6;
LABEL_9:
  v21 = a4 + v14 * (a5 - a4);
  v22 = v21;
  -[FIUIDeepBreathingFlowerView _updateShaderForNumberOfPetals:showBlurTrails:](self, "_updateShaderForNumberOfPetals:showBlurTrails:", v19, 0);
  -[FIUIDeepBreathingFlowerView _setNumberOfVisiblePetals:showBlurTrails:](self, "_setNumberOfVisiblePetals:showBlurTrails:", v19, v7);
  -[FIUIDeepBreathingFlowerView _originalRingCenterForWindType:](self, "_originalRingCenterForWindType:", a6);
  v24 = v23;
  v26 = v25;
  -[FIUIDeepBreathingFlowerView bounds](self, "bounds");
  v30 = FIUIMidpointOfBounds(v27, v28, v29);
  if (a6 == 2)
    v32 = v12;
  else
    v32 = v17;
  v33 = v24 + v32 * (v30 - v24);
  v34 = v26 + v17 * (v31 - v26);
  -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setRingCenter:", v33, v34);

  LODWORD(v36) = 1.0;
  -[FIUIDeepBreathingFlowerView _updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:](self, "_updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:", 0, self->_numberOfVisiblePetals, 1, v22, v21, v15, v36);
  -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v37 = v21 + v22;
  *(float *)&v37 = v37;
  objc_msgSend(v38, "setRingRadius:", v37);

}

- (double)_petalCountForMinutesRemaining:(double)a3
{
  if (self->_petalCountOverride == 0.0)
    return FIUIDeepBreathingPetalCountForMinutesRemaining(a3);
  else
    return self->_petalCountOverride;
}

- (void)_updateForBreathWithPetalCount:(int64_t)a3 petalRadius:(double)a4 inhaleDuration:(double)a5 exhaleDuration:(double)a6 timeInCurrentBreath:(double)a7 showBlurTrails:(BOOL)a8 shouldSpin:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  float v27;
  int64_t v28;
  double v29;
  double v30;
  float v31;
  void *v32;
  void *v33;
  float v34;
  float v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  id v57;

  v9 = a9;
  v10 = a8;
  -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIDeepBreathingFlowerView bounds](self, "bounds");
  objc_msgSend(v17, "setRingCenter:", FIUIMidpointOfBounds(v18, v19, v20));

  -[FIUIDeepBreathingFlowerView _updateShaderForNumberOfPetals:showBlurTrails:](self, "_updateShaderForNumberOfPetals:showBlurTrails:", a3, 1);
  -[FIUIDeepBreathingFlowerView _setNumberOfVisiblePetals:showBlurTrails:](self, "_setNumberOfVisiblePetals:showBlurTrails:", a3, v10);
  if (a7 <= a5)
  {
    v21 = 1.0;
    if (a5 + -0.5 >= a7)
      v21 = (a5 + -0.5) * (a7 / (a5 + -0.5) * (a7 / (a5 + -0.5) * (a7 / (a5 + -0.5) * -2.0 + 3.0))) / (a5 + -0.5);
  }
  else
  {
    v21 = 0.0;
    if (a6 + -0.5 + a5 >= a7)
      v21 = 1.0
          - (a6 + -0.5)
          * ((a7 - a5)
           / (a6 + -0.5)
           * ((a7 - a5)
            / (a6 + -0.5)
            * ((a7 - a5) / (a6 + -0.5) * -2.0 + 3.0)))
          / (a6 + -0.5);
  }
  v22 = v21 * 0.5 + 0.5;
  v23 = v21 * 1.57079633;
  if (!v9)
    v23 = -0.523598776;
  v24 = v21 * a4 + 0.0 + v21 * (a4 + -12.5) + 12.5;
  v53 = v23;
  -[FIUIDeepBreathingFlowerView _updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:](self, "_updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:", 0, self->_numberOfVisiblePetals, 0);
  if (v10)
  {
    v54 = v21;
    if (_BlurrinessKeyFrames_onceToken != -1)
      dispatch_once(&_BlurrinessKeyFrames_onceToken, &__block_literal_global_312);
    v25 = _BlurrinessKeyValues_onceToken;
    v26 = (id)_BlurrinessKeyFrames___blurrinessKeyFrames;
    if (v25 != -1)
      dispatch_once(&_BlurrinessKeyValues_onceToken, &__block_literal_global_316);
    v52 = 1.0 - v21;
    v27 = 1.0 - v21;
    v56 = _InterpolateWithKeyFrames(v26, (void *)_BlurrinessKeyValues___blurrinessKeyValues, v27);

    if (self->_numberOfVisiblePetals >= 1)
    {
      v50 = a5;
      v51 = a7;
      v28 = 0;
      v29 = v22 * (a4 + -12.5) + 12.5;
      v55 = v22 * a4 + 0.0;
      v30 = v55 + v29 + v56 * 0.05;
      v31 = v29;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_trailAlphaKeyFrames, "objectAtIndexedSubscript:", v28, *(_QWORD *)&v50, *(_QWORD *)&v51);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_trailAlphaKeyValues, "objectAtIndexedSubscript:", v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = _InterpolateWithKeyFrames(v32, v33, v27);

        if (v24 < v30 && v34 > 0.05)
          v24 = v30;
        v36 = v27;
        v37 = FIUIDeepBreathingPetalCenter(v28, 0, (double)self->_numberOfVisiblePetals, v55, v53);
        v39 = v38;
        -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v37;
        v27 = v36;
        *(float *)&v42 = v31;
        *(float *)&v43 = v56;
        *(float *)&v44 = v34;
        objc_msgSend(v40, "setBlurTrailAtIndex:center:radius:blurriness:alpha:", v28, v41, v39, v42, v43, v44);

        ++v28;
      }
      while (v28 < self->_numberOfVisiblePetals);
      a5 = v50;
      a7 = v51;
    }
    v21 = v54;
    v45 = v52;
  }
  else
  {
    v45 = 1.0 - v21;
  }
  -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v47 = v24;
  objc_msgSend(v46, "setRingRadius:", v47);

  if (a7 >= a5)
    v48 = v45 * 3.14159265 + 3.14159265;
  else
    v48 = v21 * 3.14159265;
  -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v49 = v48;
  objc_msgSend(v57, "setGradientRotationAngle:", v49);

}

- (void)_updatePetalsInRange:(_NSRange)a3 radius:(double)a4 radialDistance:(double)a5 angleOffset:(double)a6 clockwise:(BOOL)a7 alpha:(float)a8
{
  _BOOL4 v12;
  NSUInteger length;
  NSUInteger location;
  float v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v24;

  if (a3.location < a3.location + a3.length)
  {
    v12 = a7;
    length = a3.length;
    location = a3.location;
    do
    {
      v17 = FIUIDeepBreathingPetalCenter(location, v12, (double)self->_numberOfVisiblePetals, a5, a6);
      v19 = v18;
      -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a4;
      *(float *)&v21 = v16;
      *(float *)&v22 = a8;
      objc_msgSend(v20, "setPetalAtIndex:center:radius:alpha:", location, v17, v19, v21, v22);

      ++location;
      --length;
    }
    while (length);
  }
  -[FIUIDeepBreathingFlowerView _currentPetalRing](self, "_currentPetalRing", a4, a5, a6);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v23 = a4 + a5;
  *(float *)&v23 = a4 + a5;
  objc_msgSend(v24, "setRingRadius:", v23);

}

- (float)_interpolateWithKeyFrames:(id)a3 keyValues:(id)a4 value:(float)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  float v21;
  float v22;

  v7 = a3;
  v8 = a4;
  v9 = 0;
  while (1)
  {
    v10 = v9;
    if (v9 >= objc_msgSend(v7, "count") - 1)
      break;
    ++v9;
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    if (v13 > a5 || v10 == objc_msgSend(v7, "count") - 2)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v16 = v15;

      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v19 = v18;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v19 + (float)((float)(a5 - v16) / (float)(v13 - v16)) * (v21 - v19);

      goto LABEL_7;
    }
  }
  v22 = 0.0;
LABEL_7:

  return v22;
}

- (void)_ppt_setPetalCountOverride:(int64_t)a3
{
  self->_petalCountOverride = (double)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailAlphaKeyValues, 0);
  objc_storeStrong((id *)&self->_trailAlphaKeyFrames, 0);
  objc_storeStrong((id *)&self->_congratulationsText, 0);
  objc_storeStrong((id *)&self->_congratulationsLabel, 0);
  objc_storeStrong((id *)&self->_currentPetalRing, 0);
  objc_storeStrong((id *)&self->_petalRingsByNumberOfPetals, 0);
}

@end
