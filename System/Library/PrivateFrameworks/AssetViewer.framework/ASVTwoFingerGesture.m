@implementation ASVTwoFingerGesture

- (ASVTwoFingerGesture)initWithFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  ASVTwoFingerGesture *v14;
  ASVTwoFingerGesture *v15;
  uint64_t v16;
  NSSet *snapScalesSet;
  uint64_t v18;
  float32x2_t v19;
  void *v20;
  float v21;
  float32x2_t v22;
  float32x2_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)ASVTwoFingerGesture;
  v14 = -[ASVGesture initWithDataSource:](&v30, sel_initWithDataSource_, a5);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v13);
    v15->_panThresholdPassed = 0;
    v15->_rotationThresholdPassed = 0;
    v15->_scaleThresholdPassed = 0;
    v15->_levitationThresholdPassed = 0;
    v15->_initialDistanceBetweenFingers = 0.0;
    v15->_baseDistanceBetweenFingers = 0.0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    snapScalesSet = v15->_snapScalesSet;
    v15->_snapScalesSet = (NSSet *)v16;

    objc_storeStrong((id *)&v15->_firstTouch, a3);
    objc_storeStrong((id *)&v15->_secondTouch, a4);
    -[ASVTouch location](v15->_firstTouch, "location");
    *(_QWORD *)v15->_initialFirstTouchLocation = v18;
    -[ASVTouch location](v15->_secondTouch, "location");
    *(float32x2_t *)v15->_initialSecondTouchLocation = v19;
    *(float32x2_t *)v15->_initialMidPoint = vmul_f32(vadd_f32(v19, *(float32x2_t *)v15->_initialFirstTouchLocation), (float32x2_t)0x3F0000003F000000);
    -[ASVGesture dataSource](v15, "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVGesture setFirstTouchWasOnAsset:](v15, "setFirstTouchWasOnAsset:", objc_msgSend(v20, "screenPointIsOnAsset:", *(double *)v15->_initialFirstTouchLocation) | objc_msgSend(v20, "screenPointIsOnAsset:", *(double *)v15->_initialMidPoint) | objc_msgSend(v20, "screenPointIsOnAsset:", *(double *)v15->_initialSecondTouchLocation));
    objc_msgSend(v20, "assetScale");
    v15->_assetBaseScale = v21;
    v15->_lastAssetScale = v21;
    v22 = vsub_f32(*(float32x2_t *)v15->_initialFirstTouchLocation, *(float32x2_t *)v15->_initialSecondTouchLocation);
    v15->_initialDistanceBetweenFingers = sqrtf(vaddv_f32(vmul_f32(v22, v22)));
    v23 = vmul_f32(v22, (float32x2_t)0x3F0000003F000000);
    v24 = atan2f(v23.f32[0], v23.f32[1]);
    v15->_initialFingerAngle = v24;
    v15->_lastFingerAngle = v24;
    objc_msgSend(v13, "minimumObjectScale");
    v15->_minScale = v25;
    objc_msgSend(v13, "maximumObjectScale");
    v15->_maxScale = v26;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingScaleOvershoot"));
    v15->_scaleOvershoot = v27;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingScaleRubberBandFactor"));
    v15->_scaleFactor = v28;
    -[ASVTwoFingerGesture updateRubberBand](v15, "updateRubberBand");

  }
  return v15;
}

- (void)updateRubberBand
{
  ASVRubberBand *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  ASVRubberBand *v15;
  ASVRubberBand *rubberBand;

  v3 = [ASVRubberBand alloc];
  -[ASVTwoFingerGesture scaleFactor](self, "scaleFactor");
  v5 = v4;
  -[ASVTwoFingerGesture minScale](self, "minScale");
  v7 = v6;
  -[ASVTwoFingerGesture maxScale](self, "maxScale");
  v9 = v8;
  -[ASVTwoFingerGesture scaleOvershoot](self, "scaleOvershoot");
  LODWORD(v11) = v10;
  LODWORD(v12) = v5;
  LODWORD(v13) = v7;
  LODWORD(v14) = v9;
  v15 = -[ASVRubberBand initWithRubberBandFactor:minOffset:maxOffset:overshoot:](v3, "initWithRubberBandFactor:minOffset:maxOffset:overshoot:", v12, v13, v14, v11);
  rubberBand = self->_rubberBand;
  self->_rubberBand = v15;

}

- (void)updateGesture
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[ASVTwoFingerGesture firstTouch](self, "firstTouch");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "phase") == 3)
    goto LABEL_6;
  -[ASVTwoFingerGesture firstTouch](self, "firstTouch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "phase") == 4)
  {
LABEL_5:

LABEL_6:
    return;
  }
  -[ASVTwoFingerGesture secondTouch](self, "secondTouch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 3)
  {

    goto LABEL_5;
  }
  -[ASVTwoFingerGesture secondTouch](self, "secondTouch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "phase");

  if (v6 != 4)
  {
    -[ASVGesture dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetScreenPosition");
    -[ASVGesture setLatestAssetLocationOnScreen:](self, "setLatestAssetLocationOnScreen:");

    -[ASVTwoFingerGesture firstTouch](self, "firstTouch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v10 = v9;

    -[ASVTwoFingerGesture secondTouch](self, "secondTouch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "location");
    v13 = v12;

    -[ASVTwoFingerGesture updatePanWithFirstTouchLocation:secondTouchLocation:midPoint:](self, "updatePanWithFirstTouchLocation:secondTouchLocation:midPoint:", v10, v13, COERCE_DOUBLE(vmul_f32(vadd_f32(*(float32x2_t *)&v10, *(float32x2_t *)&v13), (float32x2_t)0x3F0000003F000000)));
    v14 = COERCE_DOUBLE(vsub_f32(*(float32x2_t *)&v10, *(float32x2_t *)&v13));
    -[ASVTwoFingerGesture updateRotationWithSpan:](self, "updateRotationWithSpan:", v14);
    -[ASVTwoFingerGesture updateScalingWithSpan:](self, "updateScalingWithSpan:", v14);
  }
}

- (void)updateRotationWithSpan:(ASVTwoFingerGesture *)self
{
  float32x2_t v2;
  float32x2_t v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  int v17;
  int v18;
  void *v19;
  double v20;
  double v21;

  v4 = vmul_f32(v2, (float32x2_t)0x3F0000003F000000);
  v5 = atan2f(v4.f32[0], v4.f32[1]);
  if (!-[ASVTwoFingerGesture rotationThresholdPassed](self, "rotationThresholdPassed")
    && !-[ASVTwoFingerGesture levitationThresholdPassed](self, "levitationThresholdPassed"))
  {
    -[ASVTwoFingerGesture initialFingerAngle](self, "initialFingerAngle");
    normalizeRotation(v6 - v5);
    v8 = v7;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingRotationThreshold"));
    v10 = v9;
    if (-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed")
      || -[ASVTwoFingerGesture scaleThresholdPassed](self, "scaleThresholdPassed"))
    {
      +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingRotationThresholdHarder"));
      v10 = v11;
    }
    v12 = -v8;
    if (v8 >= 0.0)
      v12 = v8;
    if (v12 >= v10)
    {
      -[ASVTwoFingerGesture setRotationThresholdPassed:](self, "setRotationThresholdPassed:", 1);
      -[ASVTwoFingerGesture initialFingerAngle](self, "initialFingerAngle");
      v14 = -v10;
      if (v8 <= 0.0)
        v14 = v10;
      normalizeRotation(v13 + v14);
      -[ASVTwoFingerGesture setLastFingerAngle:](self, "setLastFingerAngle:");
      -[ASVTwoFingerGesture delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "gestureBeganRotation:", self);

    }
  }
  if (-[ASVTwoFingerGesture rotationThresholdPassed](self, "rotationThresholdPassed"))
  {
    -[ASVTwoFingerGesture lastFingerAngle](self, "lastFingerAngle");
    normalizeRotation(v5 - v16);
    v18 = v17;
    -[ASVTwoFingerGesture delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = v18;
    objc_msgSend(v19, "gesture:rotatedAssetByDeltaYaw:", self, v20);

    *(float *)&v21 = v5;
    -[ASVTwoFingerGesture setLastFingerAngle:](self, "setLastFingerAngle:", v21);
  }
}

- (BOOL)scaleIsWithinSnapRange:(float)a3 snapTarget:(float)a4
{
  float v6;

  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingScaleSnapThreshold"));
  return (float)(v6 + a4) >= a3 && (float)(a4 - v6) <= a3;
}

- (void)updateScalingWithSpan:(ASVTwoFingerGesture *)self
{
  float32x2_t v2;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t i;
  float v27;
  float v28;
  double v29;
  double v30;
  _BOOL4 v31;
  BOOL v32;
  void *v33;
  double v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = sqrtf(vaddv_f32(vmul_f32(v2, v2)));
  if (!-[ASVTwoFingerGesture scaleThresholdPassed](self, "scaleThresholdPassed")
    && !-[ASVTwoFingerGesture levitationThresholdPassed](self, "levitationThresholdPassed"))
  {
    -[ASVTwoFingerGesture initialDistanceBetweenFingers](self, "initialDistanceBetweenFingers");
    v6 = v4 - v5;
    if (v6 >= 0.0)
      v7 = v6;
    else
      v7 = -v6;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingScaleThreshold"));
    v9 = v8;
    if (-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed")
      || -[ASVTwoFingerGesture rotationThresholdPassed](self, "rotationThresholdPassed"))
    {
      +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingScaleThresholdHarder"));
      v9 = v10;
    }
    if (v7 >= v9)
    {
      -[ASVTwoFingerGesture setScaleThresholdPassed:](self, "setScaleThresholdPassed:", 1);
      *(float *)&v11 = v4;
      -[ASVTwoFingerGesture setBaseDistanceBetweenFingers:](self, "setBaseDistanceBetweenFingers:", v11);
      -[ASVTwoFingerGesture delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "gestureBeganScaling:", self);

    }
  }
  if (-[ASVTwoFingerGesture scaleThresholdPassed](self, "scaleThresholdPassed"))
  {
    -[ASVTwoFingerGesture baseDistanceBetweenFingers](self, "baseDistanceBetweenFingers");
    if (v13 != 0.0)
    {
      -[ASVTwoFingerGesture baseDistanceBetweenFingers](self, "baseDistanceBetweenFingers");
      v15 = v4 / v14;
      -[ASVTwoFingerGesture assetBaseScale](self, "assetBaseScale");
      v17 = v16 * v15;
      -[ASVTwoFingerGesture snapScalesSet](self, "snapScalesSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v21)
      {
        v22 = v21;
        v23 = 0;
        v24 = 0;
        v25 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v43 != v25)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "floatValue", (_QWORD)v42);
            v28 = v27;
            *(float *)&v29 = v17;
            *(float *)&v30 = v28;
            v31 = -[ASVTwoFingerGesture scaleIsWithinSnapRange:snapTarget:](self, "scaleIsWithinSnapRange:snapTarget:", v29, v30);
            -[ASVTwoFingerGesture lastAssetScale](self, "lastAssetScale");
            v32 = -[ASVTwoFingerGesture scaleIsWithinSnapRange:snapTarget:](self, "scaleIsWithinSnapRange:snapTarget:");
            if (v31)
              v17 = v28;
            v23 |= v31 && !v32;
            if (!v31)
              v24 |= v32;
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        }
        while (v22);
      }
      else
      {
        v23 = 0;
        v24 = 0;
      }

      -[ASVTwoFingerGesture rubberBand](self, "rubberBand");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v34 = v17;
      objc_msgSend(v33, "rubberBandOffsetForOffset:", v34);
      v36 = v35;

      -[ASVTwoFingerGesture delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "gestureStopScaleAnimation");

      -[ASVTwoFingerGesture delegate](self, "delegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v39) = v36;
      objc_msgSend(v38, "gesture:scaledAssetToScale:", self, v39);

      LODWORD(v40) = v36;
      -[ASVTwoFingerGesture setLastAssetScale:](self, "setLastAssetScale:", v40);
      if ((v23 & 1) != 0)
      {
        -[ASVTwoFingerGesture delegate](self, "delegate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "gestureDidSnapToScale:", self);
      }
      else
      {
        if ((v24 & 1) == 0)
        {
LABEL_31:

          return;
        }
        -[ASVTwoFingerGesture delegate](self, "delegate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "gestureDidSnapAwayFromScale:", self);
      }

      goto LABEL_31;
    }
  }
}

- (void)finishGesture
{
  void *v3;
  void *v4;
  float lastAssetScale;
  float *p_maxScale;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[ASVTwoFingerGesture delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gestureStopScaleAnimation");

  if (-[ASVTwoFingerGesture scaleThresholdPassed](self, "scaleThresholdPassed"))
  {
    -[ASVTwoFingerGesture delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gestureEndedScaling:", self);

    lastAssetScale = self->_lastAssetScale;
    p_maxScale = &self->_maxScale;
    if (lastAssetScale > self->_maxScale || (p_maxScale = &self->_minScale, lastAssetScale < self->_minScale))
    {
      -[ASVTwoFingerGesture delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v8 = self->_lastAssetScale;
      *(float *)&v9 = *p_maxScale;
      objc_msgSend(v7, "gestureStartScaleAnimationFrom:to:", v8, v9);

    }
  }
  if (-[ASVTwoFingerGesture rotationThresholdPassed](self, "rotationThresholdPassed"))
  {
    -[ASVTwoFingerGesture delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gestureEndedRotation:", self);

  }
}

- (ASVTouch)firstTouch
{
  return self->_firstTouch;
}

- (void)setFirstTouch:(id)a3
{
  objc_storeStrong((id *)&self->_firstTouch, a3);
}

- (ASVTouch)secondTouch
{
  return self->_secondTouch;
}

- (void)setSecondTouch:(id)a3
{
  objc_storeStrong((id *)&self->_secondTouch, a3);
}

- (double)initialFirstTouchLocation
{
  return *(double *)(a1 + 104);
}

- (void)setInitialFirstTouchLocation:(ASVTwoFingerGesture *)self
{
  uint64_t v2;

  *(_QWORD *)self->_initialFirstTouchLocation = v2;
}

- (double)initialSecondTouchLocation
{
  return *(double *)(a1 + 112);
}

- (void)setInitialSecondTouchLocation:(ASVTwoFingerGesture *)self
{
  uint64_t v2;

  *(_QWORD *)self->_initialSecondTouchLocation = v2;
}

- (double)initialMidPoint
{
  return *(double *)(a1 + 120);
}

- (void)setInitialMidPoint:(ASVTwoFingerGesture *)self
{
  uint64_t v2;

  *(_QWORD *)self->_initialMidPoint = v2;
}

- (BOOL)panThresholdPassed
{
  return self->_panThresholdPassed;
}

- (void)setPanThresholdPassed:(BOOL)a3
{
  self->_panThresholdPassed = a3;
}

- (BOOL)rotationThresholdPassed
{
  return self->_rotationThresholdPassed;
}

- (void)setRotationThresholdPassed:(BOOL)a3
{
  self->_rotationThresholdPassed = a3;
}

- (BOOL)levitationThresholdPassed
{
  return self->_levitationThresholdPassed;
}

- (void)setLevitationThresholdPassed:(BOOL)a3
{
  self->_levitationThresholdPassed = a3;
}

- (float)initialFingerAngle
{
  return self->_initialFingerAngle;
}

- (void)setInitialFingerAngle:(float)a3
{
  self->_initialFingerAngle = a3;
}

- (float)lastFingerAngle
{
  return self->_lastFingerAngle;
}

- (void)setLastFingerAngle:(float)a3
{
  self->_lastFingerAngle = a3;
}

- (BOOL)scaleThresholdPassed
{
  return self->_scaleThresholdPassed;
}

- (void)setScaleThresholdPassed:(BOOL)a3
{
  self->_scaleThresholdPassed = a3;
}

- (float)initialDistanceBetweenFingers
{
  return self->_initialDistanceBetweenFingers;
}

- (void)setInitialDistanceBetweenFingers:(float)a3
{
  self->_initialDistanceBetweenFingers = a3;
}

- (float)baseDistanceBetweenFingers
{
  return self->_baseDistanceBetweenFingers;
}

- (void)setBaseDistanceBetweenFingers:(float)a3
{
  self->_baseDistanceBetweenFingers = a3;
}

- (float)assetBaseScale
{
  return self->_assetBaseScale;
}

- (void)setAssetBaseScale:(float)a3
{
  self->_assetBaseScale = a3;
}

- (float)lastAssetScale
{
  return self->_lastAssetScale;
}

- (void)setLastAssetScale:(float)a3
{
  self->_lastAssetScale = a3;
}

- (float)minScale
{
  return self->_minScale;
}

- (void)setMinScale:(float)a3
{
  self->_minScale = a3;
}

- (float)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(float)a3
{
  self->_maxScale = a3;
}

- (NSSet)snapScalesSet
{
  return self->_snapScalesSet;
}

- (void)setSnapScalesSet:(id)a3
{
  objc_storeStrong((id *)&self->_snapScalesSet, a3);
}

- (ASVTwoFingerGestureDelegate)delegate
{
  return (ASVTwoFingerGestureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ASVRubberBand)rubberBand
{
  return self->_rubberBand;
}

- (void)setRubberBand:(id)a3
{
  objc_storeStrong((id *)&self->_rubberBand, a3);
}

- (float)scaleOvershoot
{
  return self->_scaleOvershoot;
}

- (void)setScaleOvershoot:(float)a3
{
  self->_scaleOvershoot = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(float)a3
{
  self->_scaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rubberBand, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapScalesSet, 0);
  objc_storeStrong((id *)&self->_secondTouch, 0);
  objc_storeStrong((id *)&self->_firstTouch, 0);
}

@end
