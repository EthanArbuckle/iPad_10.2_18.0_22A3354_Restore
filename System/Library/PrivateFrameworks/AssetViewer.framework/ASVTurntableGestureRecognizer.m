@implementation ASVTurntableGestureRecognizer

- (ASVTurntableGestureRecognizer)initWithTurntableDelegate:(id)a3 feedbackGenerator:(id)a4
{
  id v6;
  ASVTurntableGestureRecognizer *v7;
  ASVTurntableGestureRecognizer *v8;
  ASVRubberBand *v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  ASVRubberBand *rubberBand;
  ASVVelocitySample2D *velocitySample;
  ASVVelocitySample2D *previousVelocitySample;
  uint64_t v23;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASVTurntableGestureRecognizer;
  v7 = -[ASVUnifiedGestureRecognizer initWithDelegate:feedbackGenerator:](&v24, sel_initWithDelegate_feedbackGenerator_, v6, a4);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_turntableDelegate, v6);
    *(_QWORD *)v8->_initialPanLocation = 0;
    *(_QWORD *)v8->_lastPanLocation = 0;
    v8->_lastPanTime = 0.0;
    v8->_lastOverallDeltaX = 0.0;
    v8->_lastRubberBandedPitch = 0.0;
    v23 = 0;
    -[ASVTurntableGestureRecognizer pitchRangeWithMinPitch:maxPitch:](v8, "pitchRangeWithMinPitch:maxPitch:", (char *)&v23 + 4, &v23);
    v9 = [ASVRubberBand alloc];
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchRubberBandFactor"));
    v11 = v10;
    v12 = v23;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchOvershoot"));
    LODWORD(v14) = v13;
    LODWORD(v15) = v11;
    LODWORD(v16) = HIDWORD(v12);
    LODWORD(v17) = v12;
    v18 = -[ASVRubberBand initWithRubberBandFactor:minOffset:maxOffset:overshoot:](v9, "initWithRubberBandFactor:minOffset:maxOffset:overshoot:", v15, v16, v17, v14);
    rubberBand = v8->_rubberBand;
    v8->_rubberBand = (ASVRubberBand *)v18;

    v8->_panThresholdPassed = 0;
    v8->_yawThresholdPassed = 0;
    v8->_pitchThresholdPassed = 0;
    velocitySample = v8->_velocitySample;
    v8->_velocitySample = 0;

    previousVelocitySample = v8->_previousVelocitySample;
    v8->_previousVelocitySample = 0;

  }
  return v8;
}

- (void)setEnabledGestureTypes:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASVTurntableGestureRecognizer;
  -[ASVUnifiedGestureRecognizer setEnabledGestureTypes:](&v4, sel_setEnabledGestureTypes_, a3);
  -[ASVTurntableGestureRecognizer cancelDeceleration](self, "cancelDeceleration");
}

- (id)singleFingerGestureForTouch:(id)a3 dataSource:(id)a4 enabledGestureTypes:(unint64_t)a5
{
  id v7;
  ASVTurntableSingleFingerGesture *v8;
  void *v9;
  ASVTurntableSingleFingerGesture *v10;

  v7 = a3;
  v8 = [ASVTurntableSingleFingerGesture alloc];
  -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASVTurntableSingleFingerGesture initWithTouch:dataSource:turntableDelegate:enabledGestureTypes:](v8, "initWithTouch:dataSource:turntableDelegate:enabledGestureTypes:", v7, v9, self, a5);

  return v10;
}

- (id)twoFingerGestureForFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  ASVTurntableTwoFingerGesture *v9;
  void *v10;
  ASVTurntableTwoFingerGesture *v11;

  v7 = a4;
  v8 = a3;
  v9 = [ASVTurntableTwoFingerGesture alloc];
  -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ASVTurntableTwoFingerGesture initWithFirstTouch:secondTouch:dataSource:turntableDelegate:](v9, "initWithFirstTouch:secondTouch:dataSource:turntableDelegate:", v8, v7, v10, self);

  return v11;
}

- (float)minimumObjectScale
{
  float result;

  if (-[ASVUnifiedGestureRecognizer allowObjectScaling](self, "allowObjectScaling"))
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumAssetTurntableScale"));
  else
    -[ASVUnifiedGestureRecognizer currentObjectScale](self, "currentObjectScale");
  return result;
}

- (float)maximumObjectScale
{
  float result;

  if (-[ASVUnifiedGestureRecognizer allowObjectScaling](self, "allowObjectScaling"))
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMaximumAssetTurntableScale"));
  else
    -[ASVUnifiedGestureRecognizer currentObjectScale](self, "currentObjectScale");
  return result;
}

- (void)startSpinningYawWithInitialVelocity:(float)a3
{
  float v5;
  float v6;
  ASVDampingDeceleration *v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  ASVDampingDeceleration *v14;

  v5 = fabsf(a3);
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumVelocityToBeginYawSpinDeceleration"));
  if (v5 > v6)
  {
    v7 = [ASVDampingDeceleration alloc];
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumDeltaToEndSpinDeceleration"));
    v9 = v8;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntableYawSpinDecelerationRate"));
    LODWORD(v11) = v10;
    *(float *)&v12 = a3;
    LODWORD(v13) = v9;
    v14 = -[ASVDampingDeceleration initWithVelocity:minEndDelta:decelerationRate:](v7, "initWithVelocity:minEndDelta:decelerationRate:", v12, v13, v11);
    -[ASVTurntableGestureRecognizer setYawDeceleration:](self, "setYawDeceleration:", v14);

  }
}

- (void)startSpinningPitchWithInitialVelocity:(float)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  ASVRubberBand *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  ASVRubberBandedSpinDeceleration *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  ASVRubberBandedSpinDeceleration *v33;
  ASVRubberBand *v34;

  v5 = fabsf(a3);
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumVelocityToBeginPitchSpinDeceleration"));
  if (v5 > v6)
  {
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchDecelerationRubberBandUndershoot"));
    v8 = v7;
    v9 = [ASVRubberBand alloc];
    -[ASVTurntableGestureRecognizer rubberBand](self, "rubberBand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rubberBandFactor");
    v12 = v11;
    -[ASVTurntableGestureRecognizer rubberBand](self, "rubberBand");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minOffset");
    v15 = v8 + v14;
    -[ASVTurntableGestureRecognizer rubberBand](self, "rubberBand");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "maxOffset");
    *(float *)&v18 = v17 - v8;
    LODWORD(v19) = v12;
    *(float *)&v20 = v15;
    *(float *)&v21 = v8;
    v34 = -[ASVRubberBand initWithRubberBandFactor:minOffset:maxOffset:overshoot:](v9, "initWithRubberBandFactor:minOffset:maxOffset:overshoot:", v19, v20, v18, v21);

    v22 = [ASVRubberBandedSpinDeceleration alloc];
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumDeltaToEndSpinDeceleration"));
    v24 = v23;
    -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "assetPitch");
    v27 = v26;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchSpinDecelerationRate"));
    LODWORD(v29) = v28;
    *(float *)&v30 = a3;
    LODWORD(v31) = v24;
    LODWORD(v32) = v27;
    v33 = -[ASVRubberBandedSpinDeceleration initWithVelocity:minEndDelta:startingOffset:decelerationRate:rubberBand:](v22, "initWithVelocity:minEndDelta:startingOffset:decelerationRate:rubberBand:", v34, v30, v31, v32, v29);
    -[ASVTurntableGestureRecognizer setPitchDeceleration:](self, "setPitchDeceleration:", v33);

  }
}

- (void)startSnappingPitch
{
  ASVSnapDeceleration *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  ASVSnapDeceleration *v18;
  id v19;

  v3 = [ASVSnapDeceleration alloc];
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumDeltaToEndSnapDeceleration"));
  v5 = v4;
  -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assetPitch");
  v7 = v6;
  -[ASVTurntableGestureRecognizer rubberBand](self, "rubberBand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minOffset");
  v10 = v9;
  -[ASVTurntableGestureRecognizer rubberBand](self, "rubberBand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maxOffset");
  LODWORD(v13) = v12;
  LODWORD(v14) = 0;
  LODWORD(v15) = v5;
  LODWORD(v16) = v7;
  LODWORD(v17) = v10;
  v18 = -[ASVSnapDeceleration initWithVelocity:minEndDelta:startingOffset:minOffset:maxOffset:](v3, "initWithVelocity:minEndDelta:startingOffset:minOffset:maxOffset:", v14, v15, v16, v17, v13);
  -[ASVTurntableGestureRecognizer setPitchDeceleration:](self, "setPitchDeceleration:", v18);

}

- (BOOL)isDecelerating
{
  void *v2;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[ASVTurntableGestureRecognizer yawDeceleration](self, "yawDeceleration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ASVTurntableGestureRecognizer yawDeceleration](self, "yawDeceleration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isDecelerating") & 1) != 0)
    {
      v5 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[ASVTurntableGestureRecognizer pitchDeceleration](self, "pitchDeceleration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ASVTurntableGestureRecognizer pitchDeceleration](self, "pitchDeceleration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isDecelerating");

  }
  else
  {
    v5 = 0;
  }

  if (v4)
    goto LABEL_8;
LABEL_9:

  return v5;
}

- (float)decelerationYawDelta
{
  void *v3;
  void *v4;
  float v5;
  float v6;

  -[ASVTurntableGestureRecognizer yawDeceleration](self, "yawDeceleration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[ASVTurntableGestureRecognizer yawDeceleration](self, "yawDeceleration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decelerationDelta");
  v6 = v5;

  return v6;
}

- (float)decelerationPitchDelta
{
  void *v3;
  void *v4;
  float v5;
  float v6;

  -[ASVTurntableGestureRecognizer pitchDeceleration](self, "pitchDeceleration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[ASVTurntableGestureRecognizer pitchDeceleration](self, "pitchDeceleration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decelerationDelta");
  v6 = v5;

  return v6;
}

- (void)cancelDeceleration
{
  -[ASVTurntableGestureRecognizer setYawDeceleration:](self, "setYawDeceleration:", 0);
  -[ASVTurntableGestureRecognizer setPitchDeceleration:](self, "setPitchDeceleration:", 0);
}

- (void)pitchRangeWithMinPitch:(float *)a3 maxPitch:(float *)a4
{
  float v6;

  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchLimit"));
  *a3 = -v6;
  *a4 = v6;
}

- (void)gesture:(id)a3 beganPanningAtScreenPoint:
{
  double v3;
  double v4;
  double v6;

  v4 = v3;
  -[ASVTurntableGestureRecognizer setInitialPanLocation:](self, "setInitialPanLocation:", a3);
  -[ASVTurntableGestureRecognizer setPanThresholdPassed:](self, "setPanThresholdPassed:", 0);
  -[ASVTurntableGestureRecognizer setYawThresholdPassed:](self, "setYawThresholdPassed:", 0);
  -[ASVTurntableGestureRecognizer setPitchThresholdPassed:](self, "setPitchThresholdPassed:", 0);
  -[ASVTurntableGestureRecognizer setLastPanTime:](self, "setLastPanTime:", 0.0);
  LODWORD(v6) = 0;
  -[ASVTurntableGestureRecognizer setLastOverallDeltaX:](self, "setLastOverallDeltaX:", v6);
  -[ASVTurntableGestureRecognizer setVelocitySample:](self, "setVelocitySample:", 0);
  -[ASVTurntableGestureRecognizer setPreviousVelocitySample:](self, "setPreviousVelocitySample:", 0);
  -[ASVTurntableGestureRecognizer setLastPanLocation:](self, "setLastPanLocation:", v4);
  -[ASVTurntableGestureRecognizer setLastPanTime:](self, "setLastPanTime:", CACurrentMediaTime());
}

- (void)gesture:(id)a3 pannedToScreenPoint:
{
  double v3;
  double v4;
  float32x2_t v6;
  float32x2_t v7;
  float v8;
  float v9;
  double v10;
  void *v11;
  ASVVelocitySample2D *v12;
  double v13;
  double v14;
  double v15;
  ASVVelocitySample2D *v16;
  float v17;
  float v18;
  float v19;
  float32x2_t v20;
  float v21;
  float32x2_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  BOOL v31;
  float v32;
  float v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  float32x2_t v39;
  float v40;
  float v41;
  float v42;
  float32x2_t v43;
  float v44;
  float v45;
  float v46;
  float v47;
  void *v48;
  double v49;
  float v50;
  float v51;
  float v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  float v57;
  double v58;
  double v59;
  float32x2_t v60;

  v4 = v3;
  if (!-[ASVTurntableGestureRecognizer panThresholdPassed](self, "panThresholdPassed", a3))
  {
    -[ASVTurntableGestureRecognizer initialPanLocation](self, "initialPanLocation");
    v7 = vsub_f32(*(float32x2_t *)&v4, v6);
    v8 = sqrtf(vaddv_f32(vmul_f32(v7, v7)));
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntableMinimumPanMoveDistance"));
    if (v8 < v9)
      return;
    -[ASVTurntableGestureRecognizer setPanThresholdPassed:](self, "setPanThresholdPassed:", 1);
  }
  v10 = CACurrentMediaTime();
  -[ASVTurntableGestureRecognizer velocitySample](self, "velocitySample");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVTurntableGestureRecognizer setPreviousVelocitySample:](self, "setPreviousVelocitySample:", v11);

  v12 = [ASVVelocitySample2D alloc];
  -[ASVTurntableGestureRecognizer lastPanLocation](self, "lastPanLocation");
  v14 = v13;
  -[ASVTurntableGestureRecognizer lastPanTime](self, "lastPanTime");
  v16 = -[ASVVelocitySample2D initWithStart:end:deltaTime:](v12, "initWithStart:end:deltaTime:", v14, v4, v10 - v15);
  -[ASVTurntableGestureRecognizer setVelocitySample:](self, "setVelocitySample:", v16);

  if (!-[ASVTurntableGestureRecognizer yawThresholdPassed](self, "yawThresholdPassed")
    || !-[ASVTurntableGestureRecognizer pitchThresholdPassed](self, "pitchThresholdPassed"))
  {
    v58 = v10;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntableSafeZoneAngle"));
    v18 = v17;
    v19 = 0.7854 - v17;
    -[ASVTurntableGestureRecognizer initialPanLocation](self, "initialPanLocation");
    v21 = fabsf(vsub_f32(*(float32x2_t *)&v4, v20).f32[0]);
    -[ASVTurntableGestureRecognizer initialPanLocation](self, "initialPanLocation");
    v23 = fabsf(COERCE_FLOAT(vsub_f32(*(float32x2_t *)&v4, v22).i32[1]));
    v24 = atanf(v23 / v21);
    if (!-[ASVTurntableGestureRecognizer yawThresholdPassed](self, "yawThresholdPassed"))
    {
      v57 = v23;
      v25 = 1.57079633 - v18;
      v26 = 1.0;
      if (v24 < v25)
      {
        v26 = 0.0;
        if (v24 >= 0.7854)
          v26 = 1.0 - (float)((float)(v25 - v24) / v19);
      }
      v27 = v19;
      +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchYawRotationThreshold"));
      v29 = v28;
      if (-[ASVTurntableGestureRecognizer pitchThresholdPassed](self, "pitchThresholdPassed"))
      {
        +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchYawRotationThresholdHarder"));
        v29 = v30;
      }
      v31 = v21 < (float)(v26 * v29);
      v19 = v27;
      v23 = v57;
      if (!v31)
      {
        -[ASVTurntableGestureRecognizer setYawThresholdPassed:](self, "setYawThresholdPassed:", 1);
        -[ASVTurntableGestureRecognizer setYawThresholdLocation:](self, "setYawThresholdLocation:", v4);
      }
    }
    v10 = v58;
    if (!-[ASVTurntableGestureRecognizer pitchThresholdPassed](self, "pitchThresholdPassed"))
    {
      v32 = 1.0;
      if (v24 > v18)
      {
        v32 = 0.0;
        if (v24 <= 0.7854)
          v32 = 1.0 - (float)((float)(v24 - v18) / v19);
      }
      +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchYawRotationThreshold"));
      v34 = v33;
      if (-[ASVTurntableGestureRecognizer yawThresholdPassed](self, "yawThresholdPassed"))
      {
        +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchYawRotationThresholdHarder"));
        v34 = v35;
      }
      if (v23 >= (float)(v32 * v34))
      {
        -[ASVTurntableGestureRecognizer setPitchThresholdPassed:](self, "setPitchThresholdPassed:", 1);
        -[ASVTurntableGestureRecognizer setPitchThresholdLocation:](self, "setPitchThresholdLocation:", v4);
        -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "assetPitch");
        -[ASVTurntableGestureRecognizer setInitialAssetPitch:](self, "setInitialAssetPitch:");

        -[ASVTurntableGestureRecognizer initialAssetPitch](self, "initialAssetPitch");
        -[ASVTurntableGestureRecognizer setLastRubberBandedPitch:](self, "setLastRubberBandedPitch:");
      }
    }
  }
  v37 = 0.0;
  v38 = 0.0;
  if (-[ASVTurntableGestureRecognizer yawThresholdPassed](self, "yawThresholdPassed"))
  {
    -[ASVTurntableGestureRecognizer yawThresholdLocation](self, "yawThresholdLocation");
    v59 = COERCE_DOUBLE(vsub_f32(*(float32x2_t *)&v4, v39));
    -[ASVTurntableGestureRecognizer lastOverallDeltaX](self, "lastOverallDeltaX");
    v41 = *(float *)&v59 - v40;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntableYawRadiansPerPoint"));
    v38 = v41 * v42;
    -[ASVTurntableGestureRecognizer setLastOverallDeltaX:](self, "setLastOverallDeltaX:", v59);
  }
  if (-[ASVTurntableGestureRecognizer pitchThresholdPassed](self, "pitchThresholdPassed"))
  {
    -[ASVTurntableGestureRecognizer pitchThresholdLocation](self, "pitchThresholdLocation");
    v60 = vsub_f32(*(float32x2_t *)&v4, v43);
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchRadiansPerPoint"));
    v45 = vmuls_lane_f32(v44, v60, 1);
    -[ASVTurntableGestureRecognizer initialAssetPitch](self, "initialAssetPitch");
    v47 = v46 + v45;
    -[ASVTurntableGestureRecognizer rubberBand](self, "rubberBand");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v49 = v47;
    objc_msgSend(v48, "rubberBandOffsetForOffset:", v49);
    v51 = v50;

    -[ASVTurntableGestureRecognizer lastRubberBandedPitch](self, "lastRubberBandedPitch");
    v37 = v51 - v52;
    *(float *)&v53 = v51;
    -[ASVTurntableGestureRecognizer setLastRubberBandedPitch:](self, "setLastRubberBandedPitch:", v53);
  }
  if (v38 != 0.0 || v37 != 0.0)
  {
    -[ASVTurntableGestureRecognizer turntableDelegate](self, "turntableDelegate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v55 = v38;
    *(float *)&v56 = v37;
    objc_msgSend(v54, "turntableGestureRecognizer:rotatedAssetByDeltaYaw:deltaPitch:", self, v55, v56);

  }
  -[ASVTurntableGestureRecognizer setLastPanLocation:](self, "setLastPanLocation:", v4);
  -[ASVTurntableGestureRecognizer setLastPanTime:](self, "setLastPanTime:", v10);
}

- (void)gestureEndedPanning:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  __int128 v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  double v18;
  int v19;
  double v20;
  __int128 v21;
  float32x2_t v22;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[ASVTurntableGestureRecognizer velocitySample](self, "velocitySample");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVTurntableGestureRecognizer previousVelocitySample](self, "previousVelocitySample");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calcFinalVelocityFromPreviousSample:", v7);
  v21 = v8;

  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntableYawRadiansPerPoint"));
  v10 = v9;
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntablePitchRadiansPerPoint"));
  v12 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    HIDWORD(v13) = DWORD1(v21);
    *(float *)&v13 = v10 * *(float *)&v21;
    -[ASVTurntableGestureRecognizer startSpinningYawWithInitialVelocity:](self, "startSpinningYawWithInitialVelocity:", v13);
  }
  -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetPitch");
  v16 = v15;

  -[ASVTurntableGestureRecognizer rubberBand](self, "rubberBand");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = v16;
  v19 = objc_msgSend(v17, "offsetIsWithinRubberBandedRange:", v18);

  if (v19)
  {
    -[ASVTurntableGestureRecognizer startSnappingPitch](self, "startSnappingPitch");
  }
  else if ((isKindOfClass & 1) != 0)
  {
    HIDWORD(v20) = v22.i32[1];
    *(float *)&v20 = vmuls_lane_f32(v12, v22, 1);
    -[ASVTurntableGestureRecognizer startSpinningPitchWithInitialVelocity:](self, "startSpinningPitchWithInitialVelocity:", v20);
  }
}

- (ASVTurntableGestureRecognizerDelegate)turntableDelegate
{
  return (ASVTurntableGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_turntableDelegate);
}

- (void)setTurntableDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_turntableDelegate, a3);
}

- (double)initialPanLocation
{
  return *(double *)(a1 + 136);
}

- (void)setInitialPanLocation:(ASVTurntableGestureRecognizer *)self
{
  uint64_t v2;

  *(_QWORD *)self->_initialPanLocation = v2;
}

- (double)lastPanLocation
{
  return *(double *)(a1 + 144);
}

- (void)setLastPanLocation:(ASVTurntableGestureRecognizer *)self
{
  uint64_t v2;

  *(_QWORD *)self->_lastPanLocation = v2;
}

- (double)lastPanTime
{
  return self->_lastPanTime;
}

- (void)setLastPanTime:(double)a3
{
  self->_lastPanTime = a3;
}

- (float)initialAssetPitch
{
  return self->_initialAssetPitch;
}

- (void)setInitialAssetPitch:(float)a3
{
  self->_initialAssetPitch = a3;
}

- (float)lastOverallDeltaX
{
  return self->_lastOverallDeltaX;
}

- (void)setLastOverallDeltaX:(float)a3
{
  self->_lastOverallDeltaX = a3;
}

- (float)lastRubberBandedPitch
{
  return self->_lastRubberBandedPitch;
}

- (void)setLastRubberBandedPitch:(float)a3
{
  self->_lastRubberBandedPitch = a3;
}

- (ASVRubberBand)rubberBand
{
  return self->_rubberBand;
}

- (void)setRubberBand:(id)a3
{
  objc_storeStrong((id *)&self->_rubberBand, a3);
}

- (BOOL)panThresholdPassed
{
  return self->_panThresholdPassed;
}

- (void)setPanThresholdPassed:(BOOL)a3
{
  self->_panThresholdPassed = a3;
}

- (BOOL)yawThresholdPassed
{
  return self->_yawThresholdPassed;
}

- (void)setYawThresholdPassed:(BOOL)a3
{
  self->_yawThresholdPassed = a3;
}

- (double)yawThresholdLocation
{
  return *(double *)(a1 + 168);
}

- (void)setYawThresholdLocation:(ASVTurntableGestureRecognizer *)self
{
  uint64_t v2;

  *(_QWORD *)self->_yawThresholdLocation = v2;
}

- (BOOL)pitchThresholdPassed
{
  return self->_pitchThresholdPassed;
}

- (void)setPitchThresholdPassed:(BOOL)a3
{
  self->_pitchThresholdPassed = a3;
}

- (double)pitchThresholdLocation
{
  return *(double *)(a1 + 176);
}

- (void)setPitchThresholdLocation:(ASVTurntableGestureRecognizer *)self
{
  uint64_t v2;

  *(_QWORD *)self->_pitchThresholdLocation = v2;
}

- (ASVVelocitySample2D)velocitySample
{
  return self->_velocitySample;
}

- (void)setVelocitySample:(id)a3
{
  objc_storeStrong((id *)&self->_velocitySample, a3);
}

- (ASVVelocitySample2D)previousVelocitySample
{
  return self->_previousVelocitySample;
}

- (void)setPreviousVelocitySample:(id)a3
{
  objc_storeStrong((id *)&self->_previousVelocitySample, a3);
}

- (ASVDeceleration)yawDeceleration
{
  return self->_yawDeceleration;
}

- (void)setYawDeceleration:(id)a3
{
  objc_storeStrong((id *)&self->_yawDeceleration, a3);
}

- (ASVDeceleration)pitchDeceleration
{
  return self->_pitchDeceleration;
}

- (void)setPitchDeceleration:(id)a3
{
  objc_storeStrong((id *)&self->_pitchDeceleration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pitchDeceleration, 0);
  objc_storeStrong((id *)&self->_yawDeceleration, 0);
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);
  objc_storeStrong((id *)&self->_velocitySample, 0);
  objc_storeStrong((id *)&self->_rubberBand, 0);
  objc_destroyWeak((id *)&self->_turntableDelegate);
}

@end
