@implementation VNRegionOfInterestTilingOptions

- (void)setTileOverlapPercentage:(double)a3
{
  self->_tileOverlapPercentage = a3;
}

- (void)setTileOverflowCount:(int64_t)a3
{
  self->_tileOverflowCount = a3;
}

- (void)setRegionOfInterestAspectRatioThreshold:(double)a3
{
  self->_regionOfInterestAspectRatioThreshold = a3;
}

- (VNRegionOfInterestTilingOptions)init
{
  VNRegionOfInterestTilingOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRegionOfInterestTilingOptions;
  result = -[VNRegionOfInterestTilingOptions init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_tileOverlapPercentage = xmmword_1A15FB6D0;
    result->_tileOverflowCount = 16;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_tileOverlapPercentage;
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_regionOfInterestAspectRatioThreshold;
    *((_QWORD *)result + 3) = self->_tileOverflowCount;
  }
  return result;
}

- (double)tileOverlapPercentage
{
  return self->_tileOverlapPercentage;
}

- (double)regionOfInterestAspectRatioThreshold
{
  return self->_regionOfInterestAspectRatioThreshold;
}

- (int64_t)tileOverflowCount
{
  return self->_tileOverflowCount;
}

@end
