@implementation CMCameraBodyMetrics

- (double)localMachtime
{
  return self->_localMachtime;
}

- (void)setLocalMachtime:(double)a3
{
  self->_localMachtime = a3;
}

- (double)globalMachtime
{
  return self->_globalMachtime;
}

- (void)setGlobalMachtime:(double)a3
{
  self->_globalMachtime = a3;
}

- (double)heightMeters
{
  return self->_heightMeters;
}

- (void)setHeightMeters:(double)a3
{
  self->_heightMeters = a3;
}

- (double)weightKG
{
  return self->_weightKG;
}

- (void)setWeightKG:(double)a3
{
  self->_weightKG = a3;
}

- (double)vo2max
{
  return self->_vo2max;
}

- (void)setVo2max:(double)a3
{
  self->_vo2max = a3;
}

- (int)age
{
  return self->_age;
}

- (void)setAge:(int)a3
{
  self->_age = a3;
}

- (int)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int)a3
{
  self->_biologicalSex = a3;
}

- (BOOL)betaBlockerUse
{
  return self->_betaBlockerUse;
}

- (void)setBetaBlockerUse:(BOOL)a3
{
  self->_betaBlockerUse = a3;
}

@end
