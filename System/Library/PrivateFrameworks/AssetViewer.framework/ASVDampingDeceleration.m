@implementation ASVDampingDeceleration

- (ASVDampingDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4 decelerationRate:(float)a5
{
  ASVDampingDeceleration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASVDampingDeceleration;
  result = -[ASVDeceleration initWithVelocity:minEndDelta:](&v7, sel_initWithVelocity_minEndDelta_);
  if (result)
    result->_decelerationRate = a5;
  return result;
}

- (float)decelerationDelta
{
  float v3;
  double v4;
  double v5;
  double v6;
  float v7;
  float v8;
  float v9;
  float v10;
  long double v11;
  float v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;

  v3 = 0.0;
  if (-[ASVDeceleration isDecelerating](self, "isDecelerating"))
  {
    -[ASVDeceleration setFrameCount:](self, "setFrameCount:", -[ASVDeceleration frameCount](self, "frameCount") + 1);
    -[ASVDeceleration currentTime](self, "currentTime");
    -[ASVDeceleration setPreviousTime:](self, "setPreviousTime:");
    -[ASVDeceleration setCurrentTime:](self, "setCurrentTime:", CACurrentMediaTime());
    -[ASVDeceleration currentTime](self, "currentTime");
    v5 = v4;
    -[ASVDeceleration previousTime](self, "previousTime");
    *(float *)&v6 = v5 - v6;
    v7 = *(float *)&v6 * 1000.0;
    -[ASVDeceleration velocity](self, "velocity");
    v9 = v8 / 1000.0;
    -[ASVDampingDeceleration decelerationRate](self, "decelerationRate");
    v11 = pow(v10, v7);
    v12 = v11;
    v13 = v9 * v12;
    *(float *)&v11 = v13 * 1000.0;
    -[ASVDeceleration setVelocity:](self, "setVelocity:", (double)v11);
    -[ASVDampingDeceleration decelerationRate](self, "decelerationRate");
    v15 = v14;
    -[ASVDampingDeceleration decelerationRate](self, "decelerationRate");
    v17 = (1.0 - v12) / (1.0 - v16) * v15;
    v3 = v13 * v17;
    if (-[ASVDeceleration frameCount](self, "frameCount"))
    {
      -[ASVDeceleration velocity](self, "velocity");
      v19 = fabsf(v18);
      -[ASVDeceleration minEndDelta](self, "minEndDelta");
      if (v19 <= v20)
      {
        -[ASVDeceleration setIsDecelerating:](self, "setIsDecelerating:", 0);
        return 0.0;
      }
    }
  }
  return v3;
}

- (float)decelerationRate
{
  return self->_decelerationRate;
}

- (void)setDecelerationRate:(float)a3
{
  self->_decelerationRate = a3;
}

@end
