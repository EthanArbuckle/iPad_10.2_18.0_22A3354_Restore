@implementation ARFLSpring

+ (id)springWithValue:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", a3);
}

- (ARFLSpring)initWithValue:(double)a3
{
  char *v4;
  ARFLSpring *v5;
  ARFLSpring *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARFLSpring;
  v4 = -[ARFLSpring init](&v8, sel_init);
  v5 = (ARFLSpring *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 424) = ARFLSpringParametersBouncy;
    *(_OWORD *)(v4 + 440) = unk_1DCCA0FF0;
    *(_OWORD *)(v4 + 456) = ARFLSpringParametersTight;
    *(_OWORD *)(v4 + 472) = unk_1DCCA1010;
    *((_QWORD *)v4 + 50) = 0x3FE199999999999ALL;
    *((_QWORD *)v4 + 49) = 0x7FEFFFFFFFFFFFFFLL;
    *((_QWORD *)v4 + 51) = 0x3FC3333333333333;
    *((_QWORD *)v4 + 52) = 0x3FEFD70A3D70A3D7;
    objc_msgSend(v4, "resetImmediatelyToValue:", a3);
    v6 = v5;
  }

  return v5;
}

- (ARFLSpring)init
{
  return -[ARFLSpring initWithValue:](self, "initWithValue:", 0.0);
}

- (double)value
{
  return self->_s.state.position;
}

- (void)setValue:(double)a3
{
  self->_s.state.position = a3;
}

- (double)target
{
  return self->_s.anchor.anchor;
}

- (void)setTarget:(double)a3
{
  double rubberbandRange;
  double maximumTarget;

  rubberbandRange = self->_rubberbandRange;
  if (rubberbandRange != 1.79769313e308)
  {
    maximumTarget = self->_maximumTarget;
    if (maximumTarget > a3)
      maximumTarget = a3;
    if (maximumTarget < self->_minimumTarget)
      maximumTarget = self->_minimumTarget;
    a3 = ARFLRubberbandValue(a3, maximumTarget, rubberbandRange, self->_rubberbandFactor);
  }
  if (self->_transitioningFromTracking && self->_retargetResponseFraction > 0.0)
    self->_s.anchor.anchor = a3;
  else
    ARFLCompoundSpringSetAnchorImmediately((uint64_t)&self->_s, a3);
}

- (double)velocity
{
  return self->_s.state.velocity;
}

- (void)setVelocity:(double)a3
{
  self->_s.state.velocity = a3;
}

- (double)projectedTarget
{
  uint64_t v2;
  double result;

  if (self->_tracking)
  {
    v2 = 352;
  }
  else
  {
    v2 = 352;
    if (!self->_transitioningFromTracking)
      v2 = 16;
  }
  -[ARFLSpring _projectedTargetForVelocity:](self, "_projectedTargetForVelocity:", *(double *)((char *)&self->super.isa + v2));
  return result;
}

- (double)_projectedTargetForVelocity:(double)a3
{
  double v5;

  -[ARFLSpring value](self, "value");
  return ARFLDeceleratedRestPosition(v5, a3, self->_projectionDeceleration);
}

- (void)resetImmediatelyToValue:(double)a3
{
  double v5;
  double v6;
  _BYTE __src[344];

  -[ARFLSpring _effectiveParameters](self, "_effectiveParameters");
  ARFLCompoundSpringMakeWithDampingRatioResponse((uint64_t)__src, a3, 0.0, v5, v6);
  memcpy(&self->_s, __src, sizeof(self->_s));
  self->_previousTarget = a3;
  self->_targetVelocity = 0.0;
}

- (void)setParameters:(ARFLSpringParameters)a3
{
  if (self->_parameters.dampingRatio != a3.dampingRatio
    || self->_parameters.response != a3.response
    || self->_parameters.dampingRatioSmoothing != a3.dampingRatioSmoothing
    || self->_parameters.responseSmoothing != a3.responseSmoothing)
  {
    self->_parameters = a3;
    if (!self->_tracking)
      -[ARFLSpring _updateForEffectiveParameters](self, "_updateForEffectiveParameters");
  }
}

- (void)setTrackingParameters:(ARFLSpringParameters)a3
{
  if (self->_trackingParameters.dampingRatio != a3.dampingRatio
    || self->_trackingParameters.response != a3.response
    || self->_trackingParameters.dampingRatioSmoothing != a3.dampingRatioSmoothing
    || self->_trackingParameters.responseSmoothing != a3.responseSmoothing)
  {
    self->_trackingParameters = a3;
    if (self->_tracking)
      -[ARFLSpring _updateForEffectiveParameters](self, "_updateForEffectiveParameters");
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
      -[ARFLSpring _projectedTargetForVelocity:](self, "_projectedTargetForVelocity:", self->_targetVelocity);
      ARFLCompoundSpringSetAnchorWithIntermediatePositionAndResponse((uint64_t)&self->_s, self->_s.anchor.anchor, v8, v7);
    }
    -[ARFLSpring _updateForEffectiveParameters](self, "_updateForEffectiveParameters");
  }
}

- (BOOL)usesDampingRatioResponseForSmoothing
{
  return self->_s.usesDampingRatioResponse;
}

- (void)setUsesDampingRatioResponseForSmoothing:(BOOL)a3
{
  self->_s.usesDampingRatioResponse = a3;
}

- (void)step:(double)a3
{
  ARFLCompoundSpring *p_s;
  double anchor;
  _BYTE v7[344];
  _BYTE __src[344];

  p_s = &self->_s;
  memcpy(v7, &self->_s, sizeof(v7));
  ARFLCompoundSpringStep(v7, __src, a3);
  memcpy(p_s, __src, sizeof(ARFLCompoundSpring));
  anchor = self->_s.anchor.anchor;
  self->_targetVelocity = (anchor - self->_previousTarget) / a3 * 0.25 + self->_targetVelocity * 0.75;
  self->_previousTarget = anchor;
  self->_transitioningFromTracking = 0;
}

- (ARFLSpringParameters)_effectiveParameters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  ARFLSpringParameters result;

  v2 = 456;
  if (!self->_tracking)
    v2 = 424;
  v3 = 464;
  if (!self->_tracking)
    v3 = 432;
  v4 = 472;
  if (!self->_tracking)
    v4 = 440;
  v5 = 480;
  if (!self->_tracking)
    v5 = 448;
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
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 usesDampingRatioResponse;
  ARFLCompoundSpring *p_s;
  double v12;
  double v13;

  -[ARFLSpring _effectiveParameters](self, "_effectiveParameters");
  v6 = v4;
  v7 = v5;
  v9 = v8;
  usesDampingRatioResponse = self->_s.usesDampingRatioResponse;
  p_s = &self->_s;
  if (usesDampingRatioResponse)
  {
    ARFLCompoundSpringSetDampingRatioSmoothly((uint64_t)p_s, v3, v4);
    ARFLCompoundSpringSetResponseSmoothly((uint64_t)p_s, v7, v9);
  }
  else
  {
    v12 = 0.0;
    v13 = 0.0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v13, &v12, v3, v5);
    ARFLCompoundSpringSetStiffnessWithResponse((uint64_t)p_s, v13, v9);
    ARFLCompoundSpringSetDampingWithResponse((uint64_t)p_s, v12, v6);
  }
}

- (ARFLSpringParameters)parameters
{
  double dampingRatio;
  double dampingRatioSmoothing;
  double response;
  double responseSmoothing;
  ARFLSpringParameters result;

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

- (ARFLSpringParameters)trackingParameters
{
  double dampingRatio;
  double dampingRatioSmoothing;
  double response;
  double responseSmoothing;
  ARFLSpringParameters result;

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

@end
