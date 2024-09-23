@implementation ASVSnapDeceleration

- (ASVSnapDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4 startingOffset:(float)a5 minOffset:(float)a6 maxOffset:(float)a7
{
  ASVSnapDeceleration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ASVSnapDeceleration;
  result = -[ASVDeceleration initWithVelocity:minEndDelta:](&v11, sel_initWithVelocity_minEndDelta_);
  if (result)
  {
    result->_currentOffset = a5;
    result->_minOffset = a6;
    result->_maxOffset = a7;
  }
  return result;
}

- (void)calculateSnapFromStartingOffset:(float)a3 startingVelocity:(float)a4 deltaTime:(float)a5 outOffset:(float *)a6 outVelocity:(float *)a7
{
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;

  v12 = (float)(a4 / 1000.0) * powf(0.998, a5);
  -[ASVSnapDeceleration maxOffset](self, "maxOffset");
  if (v13 < a3)
  {
    -[ASVSnapDeceleration maxOffset](self, "maxOffset");
    v15 = v14;
    -[ASVSnapDeceleration maxOffset](self, "maxOffset");
    a3 = v15 + (float)((float)(a3 - v16) * powf(0.99, a5));
LABEL_5:
    v12 = pow(0.99, a5) * v12;
    goto LABEL_6;
  }
  -[ASVSnapDeceleration minOffset](self, "minOffset");
  if (v17 > a3)
  {
    -[ASVSnapDeceleration minOffset](self, "minOffset");
    v19 = v18;
    -[ASVSnapDeceleration minOffset](self, "minOffset");
    a3 = v19 - (float)((float)(v20 - a3) * powf(0.99, a5));
    goto LABEL_5;
  }
LABEL_6:
  *a6 = a3 + (float)(v12 * a5);
  *a7 = v12 * 1000.0;
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
  int v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v22;

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
    v7 = (v5 - v6) * 1000.0;
    -[ASVSnapDeceleration currentOffset](self, "currentOffset");
    v9 = v8;
    -[ASVDeceleration velocity](self, "velocity");
    LODWORD(v11) = v10;
    v22 = 0;
    *(float *)&v12 = v9;
    *(float *)&v13 = v7;
    -[ASVSnapDeceleration calculateSnapFromStartingOffset:startingVelocity:deltaTime:outOffset:outVelocity:](self, "calculateSnapFromStartingOffset:startingVelocity:deltaTime:outOffset:outVelocity:", (char *)&v22 + 4, &v22, v12, v11, v13);
    v3 = *((float *)&v22 + 1) - v9;
    -[ASVSnapDeceleration currentOffset](self, "currentOffset");
    *(float *)&v15 = v14 + v3;
    -[ASVSnapDeceleration setCurrentOffset:](self, "setCurrentOffset:", v15);
    LODWORD(v16) = v22;
    -[ASVDeceleration setVelocity:](self, "setVelocity:", v16);
    if (-[ASVDeceleration frameCount](self, "frameCount"))
    {
      -[ASVDeceleration minEndDelta](self, "minEndDelta");
      if (fabsf(v3) <= v17)
      {
        -[ASVDeceleration setIsDecelerating:](self, "setIsDecelerating:", 0);
        -[ASVSnapDeceleration maxOffset](self, "maxOffset");
        if (v9 > v18)
        {
          -[ASVSnapDeceleration maxOffset](self, "maxOffset");
          return v19 - v9;
        }
        -[ASVSnapDeceleration minOffset](self, "minOffset");
        v3 = 0.0;
        if (v9 < v20)
        {
          -[ASVSnapDeceleration minOffset](self, "minOffset");
          return v19 - v9;
        }
      }
    }
  }
  return v3;
}

- (float)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(float)a3
{
  self->_currentOffset = a3;
}

- (float)minOffset
{
  return self->_minOffset;
}

- (void)setMinOffset:(float)a3
{
  self->_minOffset = a3;
}

- (float)maxOffset
{
  return self->_maxOffset;
}

- (void)setMaxOffset:(float)a3
{
  self->_maxOffset = a3;
}

@end
