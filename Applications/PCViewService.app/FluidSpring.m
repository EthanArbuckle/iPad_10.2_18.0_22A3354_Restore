@implementation FluidSpring

- (FluidSpring)init
{
  FluidSpring *v2;
  FLSpring *v3;
  FLSpring *internalSpring;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FluidSpring;
  v2 = -[FluidSpring init](&v6, "init");
  if (v2)
  {
    v3 = -[FLSpring initWithValue:]([FLSpring alloc], "initWithValue:", 0.0);
    internalSpring = v2->_internalSpring;
    v2->_internalSpring = v3;

    nullsub_1(0.8425, 0.0625, 0.4, 0.125);
    -[FLSpring setTrackingParameters:](v2->_internalSpring, "setTrackingParameters:");
    -[FLSpring setTracking:](v2->_internalSpring, "setTracking:", 1);
    v2->_lastUpdate = 0.0;
  }
  return v2;
}

- (FluidSpring)initWithParameters:(FLSpringParameters)a3 retargetImpuse:(double)a4
{
  double responseSmoothing;
  double response;
  double dampingRatioSmoothing;
  double dampingRatio;
  FluidSpring *v9;
  FLSpring *v10;
  FLSpring *internalSpring;
  objc_super v13;

  responseSmoothing = a3.responseSmoothing;
  response = a3.response;
  dampingRatioSmoothing = a3.dampingRatioSmoothing;
  dampingRatio = a3.dampingRatio;
  v13.receiver = self;
  v13.super_class = (Class)FluidSpring;
  v9 = -[FluidSpring init](&v13, "init");
  if (v9)
  {
    v10 = -[FLSpring initWithValue:]([FLSpring alloc], "initWithValue:", 0.0);
    internalSpring = v9->_internalSpring;
    v9->_internalSpring = v10;

    -[FLSpring setRetargetImpulse:](v9->_internalSpring, "setRetargetImpulse:", a4);
    -[FLSpring setTrackingParameters:](v9->_internalSpring, "setTrackingParameters:", dampingRatio, dampingRatioSmoothing, response, responseSmoothing);
    -[FLSpring setTracking:](v9->_internalSpring, "setTracking:", 1);
    v9->_lastUpdate = 0.0;
  }
  return v9;
}

- (double)step:(double)a3 progress:(double)a4
{
  double v6;
  double result;

  -[FLSpring setTarget:](self->_internalSpring, "setTarget:", a4);
  v6 = a3 - self->_lastUpdate;
  self->_lastUpdate = a3;
  -[FLSpring step:](self->_internalSpring, "step:", v6);
  -[FLSpring value](self->_internalSpring, "value");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSpring, 0);
}

@end
