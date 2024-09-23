@implementation VNDetectTrajectoriesRequestConfiguration

- (VNDetectTrajectoriesRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectTrajectoriesRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNDetectTrajectoriesRequestConfiguration;
  result = -[VNStatefulRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_objectMinimumNormalizedRadius = 0.0;
    result->_objectMaximumNormalizedRadius = 1.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  __int128 v9;
  int64_t epoch;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNDetectTrajectoriesRequestConfiguration;
  v4 = -[VNStatefulRequestConfiguration copyWithZone:](&v11, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setTrajectoryLength:", self->_trajectoryLength);
    *(float *)&v6 = self->_objectMinimumNormalizedRadius;
    objc_msgSend(v5, "setObjectMinimumNormalizedRadius:", v6);
    *(float *)&v7 = self->_objectMaximumNormalizedRadius;
    objc_msgSend(v5, "setObjectMaximumNormalizedRadius:", v7);
    v9 = *(_OWORD *)&self->_targetFrameTime.value;
    epoch = self->_targetFrameTime.epoch;
    objc_msgSend(v5, "setTargetFrameTime:", &v9);
  }
  return v5;
}

- (int64_t)trajectoryLength
{
  return self->_trajectoryLength;
}

- (void)setTrajectoryLength:(int64_t)a3
{
  self->_trajectoryLength = a3;
}

- (float)objectMinimumNormalizedRadius
{
  return self->_objectMinimumNormalizedRadius;
}

- (void)setObjectMinimumNormalizedRadius:(float)a3
{
  self->_objectMinimumNormalizedRadius = a3;
}

- (float)objectMaximumNormalizedRadius
{
  return self->_objectMaximumNormalizedRadius;
}

- (void)setObjectMaximumNormalizedRadius:(float)a3
{
  self->_objectMaximumNormalizedRadius = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[8];
  return self;
}

- (void)setTargetFrameTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_targetFrameTime.value = *(_OWORD *)&a3->var0;
  self->_targetFrameTime.epoch = var3;
}

@end
