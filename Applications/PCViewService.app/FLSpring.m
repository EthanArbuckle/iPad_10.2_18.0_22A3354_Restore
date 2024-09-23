@implementation FLSpring

+ (FLSpring)springWithValue:(double)a3
{
  return (FLSpring *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", a3);
}

- (FLSpring)initWithValue:(double)a3
{
  char *v4;
  FLSpring *v5;
  FLSpring *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FLSpring;
  v4 = -[FLSpring init](&v8, "init");
  v5 = (FLSpring *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 67) = 0x3FF0000000000000;
    *(_OWORD *)(v4 + 600) = xmmword_10007F698;
    *(_OWORD *)(v4 + 616) = unk_10007F6A8;
    *(_OWORD *)(v4 + 632) = xmmword_10007F6B8;
    *(_OWORD *)(v4 + 648) = unk_10007F6C8;
    *(_OWORD *)(v4 + 664) = xmmword_10007F698;
    *(_OWORD *)(v4 + 680) = unk_10007F6A8;
    *((_QWORD *)v4 + 72) = 0x3FE199999999999ALL;
    *((_QWORD *)v4 + 71) = 0x7FEFFFFFFFFFFFFFLL;
    *((_QWORD *)v4 + 73) = 0;
    *((_QWORD *)v4 + 74) = 0x3FEFD70A3D70A3D7;
    *((_QWORD *)v4 + 68) = 0;
    *((int64x2_t *)v4 + 32) = vdupq_n_s64(0x3F50624DD2F1A9FCuLL);
    objc_msgSend(v4, "resetImmediatelyToValue:", a3);
    v6 = v5;
  }

  return v5;
}

- (FLSpring)init
{
  return -[FLSpring initWithValue:](self, "initWithValue:", 0.0);
}

- (double)value
{
  return self->_s.state.position + self->_o.state.position;
}

- (void)setValue:(double)a3
{
  self->_s.state.position = a3;
}

- (double)target
{
  return self->_s.anchor.anchor + self->_o.anchor;
}

- (void)setTarget:(double)a3
{
  double v4;
  double rubberbandRange;
  double minimumTarget;
  double maximumTarget;

  v4 = a3 - self->_o.anchor;
  rubberbandRange = self->_rubberbandRange;
  if (rubberbandRange != 1.79769313e308)
  {
    minimumTarget = self->_minimumTarget;
    maximumTarget = self->_maximumTarget;
    if (v4 < maximumTarget)
      maximumTarget = v4;
    if (maximumTarget >= minimumTarget)
      minimumTarget = maximumTarget;
    v4 = sub_1000039F4(v4, minimumTarget, rubberbandRange, self->_rubberbandFactor);
  }
  if (self->_transitioningFromTracking && self->_retargetResponseFraction > 0.0)
    self->_s.anchor.anchor = v4;
  else
    sub_100002BA8((uint64_t)&self->_s, v4);
}

- (void)offsetBy:(double)a3
{
  self->_o.anchor = self->_o.anchor + a3;
}

- (void)offsetTo:(double)a3
{
  double v5;

  -[FLSpring target](self, "target");
  -[FLSpring offsetBy:](self, "offsetBy:", a3 - v5);
}

- (double)velocity
{
  return self->_s.state.velocity + self->_o.state.velocity;
}

- (void)setVelocity:(double)a3
{
  self->_s.state.velocity = a3;
}

- (BOOL)isStable
{
  _BOOL4 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[23];

  memcpy(v8, &self->_s, sizeof(v8));
  v3 = sub_100002F4C(v8);
  if (v3)
  {
    v4 = *(_OWORD *)&self->_o._beta;
    v8[4] = *(_OWORD *)&self->_o._previousStiffness;
    v8[5] = v4;
    v8[6] = *(_OWORD *)&self->_o._omega1;
    v5 = *(_OWORD *)&self->_o.mass;
    v8[0] = self->_o.state;
    v8[1] = v5;
    v6 = *(_OWORD *)&self->_o.stablePositionThreshold;
    v8[2] = *(_OWORD *)&self->_o.damping;
    v8[3] = v6;
    LOBYTE(v3) = sub_1000026DC((double *)v8);
  }
  return v3;
}

- (double)stableValueThreshold
{
  return self->_stableValueThreshold;
}

- (void)setStableValueThreshold:(double)a3
{
  self->_stableValueThreshold = a3;
  self->_s.stablePositionThreshold = a3;
  self->_o.stablePositionThreshold = a3;
}

- (double)stableVelocityThreshold
{
  return self->_stableVelocityThreshold;
}

- (void)setStableVelocityThreshold:(double)a3
{
  self->_stableVelocityThreshold = a3;
  self->_s.stableVelocityThreshold = a3;
  self->_o.stableVelocityThreshold = a3;
}

- (double)projectedTarget
{
  uint64_t v2;
  double result;

  if (self->_tracking)
  {
    v2 = 488;
  }
  else
  {
    v2 = 488;
    if (!self->_transitioningFromTracking)
      v2 = 16;
  }
  -[FLSpring _projectedTargetForVelocity:](self, "_projectedTargetForVelocity:", *(double *)((char *)&self->super.isa + v2) + self->_o.state.velocity);
  return result;
}

- (double)_projectedTargetForVelocity:(double)a3
{
  double v5;

  -[FLSpring value](self, "value");
  return sub_1000039D0(v5, a3, self->_projectionDeceleration);
}

- (void)resetImmediatelyToValue:(double)a3
{
  double *p_stablePositionThreshold;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[23];

  p_stablePositionThreshold = &self->_s.stablePositionThreshold;
  -[FLSpring _effectiveParameters](self, "_effectiveParameters");
  sub_100002A8C((uint64_t)v11, a3, 0.0, v6, v7);
  memcpy(&self->_s, v11, 0x160uLL);
  *(_OWORD *)p_stablePositionThreshold = *(_OWORD *)&self->_stableValueThreshold;
  sub_100002710((uint64_t)v11, 0.0, 0.0, 0.0, self->_offsetParameters.dampingRatio, self->_offsetParameters.response);
  v8 = v11[5];
  *(_OWORD *)&self->_o._previousStiffness = v11[4];
  *(_OWORD *)&self->_o._beta = v8;
  *(_OWORD *)&self->_o._omega1 = v11[6];
  v9 = v11[1];
  self->_o.state = (FLSimpleSpringState)v11[0];
  *(_OWORD *)&self->_o.mass = v9;
  v10 = v11[3];
  *(_OWORD *)&self->_o.damping = v11[2];
  *(_OWORD *)&self->_o.stablePositionThreshold = v10;
  *((_OWORD *)p_stablePositionThreshold + 4) = *(_OWORD *)&self->_stableValueThreshold;
  self->_previousTarget = a3;
  self->_targetVelocity = 0.0;
}

- (void)setParameters:(FLSpringParameters)a3
{
  if (self->_parameters.dampingRatio != a3.dampingRatio
    || self->_parameters.response != a3.response
    || self->_parameters.dampingRatioSmoothing != a3.dampingRatioSmoothing
    || self->_parameters.responseSmoothing != a3.responseSmoothing)
  {
    self->_parameters = a3;
    if (!self->_tracking)
      -[FLSpring _updateForEffectiveParameters](self, "_updateForEffectiveParameters");
  }
}

- (void)setTrackingParameters:(FLSpringParameters)a3
{
  if (self->_trackingParameters.dampingRatio != a3.dampingRatio
    || self->_trackingParameters.response != a3.response
    || self->_trackingParameters.dampingRatioSmoothing != a3.dampingRatioSmoothing
    || self->_trackingParameters.responseSmoothing != a3.responseSmoothing)
  {
    self->_trackingParameters = a3;
    if (self->_tracking)
      -[FLSpring _updateForEffectiveParameters](self, "_updateForEffectiveParameters");
  }
}

- (void)setTracking:(BOOL)a3
{
  _BOOL4 tracking;
  BOOL v5;
  BOOL v6;
  double v7;
  double v8;

  tracking = self->_tracking;
  if (tracking != a3)
  {
    v5 = !tracking;
    v6 = !a3;
    if (v5)
      v6 = 0;
    self->_transitioningFromTracking = v6;
    self->_tracking = a3;
    if (!a3)
    {
      v7 = self->_retargetResponseFraction * self->_parameters.response;
      -[FLSpring _projectedTargetForVelocity:](self, "_projectedTargetForVelocity:", self->_targetVelocity);
      sub_100002C20((uint64_t)&self->_s, self->_s.anchor.anchor, v8, v7);
    }
    -[FLSpring _updateForEffectiveParameters](self, "_updateForEffectiveParameters");
  }
}

- (double)timeFactor
{
  return self->_timeFactor;
}

- (void)setTimeFactor:(double)a3
{
  self->_timeFactor = fmax(a3, 0.0);
}

- (void)step:(double)a3
{
  double anchor;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[23];
  _OWORD __src[23];

  anchor = self->_s.anchor.anchor;
  v6 = anchor - self->_previousTarget;
  v7 = v6 / a3 * 0.25 + self->_targetVelocity * 0.75;
  self->_transitioningFromTracking = 0;
  self->_targetVelocity = v7;
  self->_previousTarget = anchor;
  if (self->_retargetImpulse > 0.0)
  {
    *(_QWORD *)&__src[0] = 0;
    -[FLSpring _effectiveParameters](self, "_effectiveParameters");
    sub_100002A10((double *)__src, 0, v8, v9);
    self->_s.state.velocity = self->_s.state.velocity + v6 * *(double *)__src * self->_retargetImpulse;
  }
  v10 = self->_timeFactor * a3;
  memcpy(v18, &self->_s, sizeof(v18));
  sub_100002D58(v18, (double *)__src, v10);
  memcpy(&self->_s, __src, sizeof(self->_s));
  v11 = self->_timeFactor * a3;
  v12 = *(_OWORD *)&self->_o._beta;
  v18[4] = *(_OWORD *)&self->_o._previousStiffness;
  v18[5] = v12;
  v18[6] = *(_OWORD *)&self->_o._omega1;
  v13 = *(_OWORD *)&self->_o.mass;
  v18[0] = self->_o.state;
  v18[1] = v13;
  v14 = *(_OWORD *)&self->_o.stablePositionThreshold;
  v18[2] = *(_OWORD *)&self->_o.damping;
  v18[3] = v14;
  sub_1000027D0((uint64_t)v18, (uint64_t)__src, v11);
  v15 = __src[5];
  *(_OWORD *)&self->_o._previousStiffness = __src[4];
  *(_OWORD *)&self->_o._beta = v15;
  *(_OWORD *)&self->_o._omega1 = __src[6];
  v16 = __src[1];
  self->_o.state = (FLSimpleSpringState)__src[0];
  *(_OWORD *)&self->_o.mass = v16;
  v17 = __src[3];
  *(_OWORD *)&self->_o.damping = __src[2];
  *(_OWORD *)&self->_o.stablePositionThreshold = v17;
}

- (FLSpringParameters)_effectiveParameters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  FLSpringParameters result;

  v2 = 632;
  if (!self->_tracking)
    v2 = 600;
  v3 = 640;
  if (!self->_tracking)
    v3 = 608;
  v4 = 648;
  if (!self->_tracking)
    v4 = 616;
  v5 = 656;
  if (!self->_tracking)
    v5 = 624;
  v6 = *(double *)((char *)&self->super.isa + v5);
  v7 = *(double *)((char *)&self->super.isa + v4);
  v8 = *(double *)((char *)&self->super.isa + v2);
  v9 = *(double *)((char *)&self->super.isa + v3);
  result.responseSmoothing = v6;
  result.response = v7;
  result.dampingRatioSmoothing = v9;
  result.dampingRatio = v8;
  return result;
}

- (void)_updateForEffectiveParameters
{
  FLSpring *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = self;
  -[FLSpring _effectiveParameters](self, "_effectiveParameters");
  v4 = v3;
  v6 = v5;
  v2 = (FLSpring *)((char *)v2 + 8);
  sub_100002C80((uint64_t)v2, v7, v8);
  sub_100002CF4((uint64_t)v2, v4, v6);
}

- (double)retargetImpulse
{
  return self->_retargetImpulse;
}

- (void)setRetargetImpulse:(double)a3
{
  self->_retargetImpulse = a3;
}

- (FLSpringParameters)parameters
{
  double dampingRatio;
  double dampingRatioSmoothing;
  double response;
  double responseSmoothing;
  FLSpringParameters result;

  dampingRatio = self->_parameters.dampingRatio;
  dampingRatioSmoothing = self->_parameters.dampingRatioSmoothing;
  response = self->_parameters.response;
  responseSmoothing = self->_parameters.responseSmoothing;
  result.responseSmoothing = responseSmoothing;
  result.response = response;
  result.dampingRatioSmoothing = dampingRatioSmoothing;
  result.dampingRatio = dampingRatio;
  return result;
}

- (FLSpringParameters)trackingParameters
{
  double dampingRatio;
  double dampingRatioSmoothing;
  double response;
  double responseSmoothing;
  FLSpringParameters result;

  dampingRatio = self->_trackingParameters.dampingRatio;
  dampingRatioSmoothing = self->_trackingParameters.dampingRatioSmoothing;
  response = self->_trackingParameters.response;
  responseSmoothing = self->_trackingParameters.responseSmoothing;
  result.responseSmoothing = responseSmoothing;
  result.response = response;
  result.dampingRatioSmoothing = dampingRatioSmoothing;
  result.dampingRatio = dampingRatio;
  return result;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (double)minimumTarget
{
  return self->_minimumTarget;
}

- (void)setMinimumTarget:(double)a3
{
  self->_minimumTarget = a3;
}

- (double)maximumTarget
{
  return self->_maximumTarget;
}

- (void)setMaximumTarget:(double)a3
{
  self->_maximumTarget = a3;
}

- (double)rubberbandRange
{
  return self->_rubberbandRange;
}

- (void)setRubberbandRange:(double)a3
{
  self->_rubberbandRange = a3;
}

- (double)rubberbandFactor
{
  return self->_rubberbandFactor;
}

- (void)setRubberbandFactor:(double)a3
{
  self->_rubberbandFactor = a3;
}

- (double)retargetResponseFraction
{
  return self->_retargetResponseFraction;
}

- (void)setRetargetResponseFraction:(double)a3
{
  self->_retargetResponseFraction = a3;
}

- (double)projectionDeceleration
{
  return self->_projectionDeceleration;
}

- (void)setProjectionDeceleration:(double)a3
{
  self->_projectionDeceleration = a3;
}

- (FLSpringParameters)offsetParameters
{
  double dampingRatio;
  double dampingRatioSmoothing;
  double response;
  double responseSmoothing;
  FLSpringParameters result;

  dampingRatio = self->_offsetParameters.dampingRatio;
  dampingRatioSmoothing = self->_offsetParameters.dampingRatioSmoothing;
  response = self->_offsetParameters.response;
  responseSmoothing = self->_offsetParameters.responseSmoothing;
  result.responseSmoothing = responseSmoothing;
  result.response = response;
  result.dampingRatioSmoothing = dampingRatioSmoothing;
  result.dampingRatio = dampingRatio;
  return result;
}

- (void)setOffsetParameters:(FLSpringParameters)a3
{
  self->_offsetParameters = a3;
}

@end
