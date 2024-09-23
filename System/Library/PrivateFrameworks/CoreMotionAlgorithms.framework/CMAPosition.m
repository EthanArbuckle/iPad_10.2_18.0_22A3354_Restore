@implementation CMAPosition

- (int64_t)convergenceStatus
{
  return self->convergenceStatus;
}

- (void)setConvergenceStatus:(int64_t)a3
{
  self->convergenceStatus = a3;
}

- (int64_t)revokeReason
{
  return self->revokeReason;
}

- (void)setRevokeReason:(int64_t)a3
{
  self->revokeReason = a3;
}

- (int64_t)verticalState
{
  return self->verticalState;
}

- (void)setVerticalState:(int64_t)a3
{
  self->verticalState = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (NSNumber)horizontalDistanceNumber
{
  return self->_horizontalDistanceNumber;
}

- (void)setHorizontalDistanceNumber:(id)a3
{
  self->_horizontalDistanceNumber = (NSNumber *)a3;
}

- (double)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setHorizontalAngle:(double)a3
{
  self->_horizontalAngle = a3;
}

- (NSNumber)horizontalAngleNumber
{
  return self->_horizontalAngleNumber;
}

- (void)setHorizontalAngleNumber:(id)a3
{
  self->_horizontalAngleNumber = (NSNumber *)a3;
}

- (double)horizontalAngleAccuracy
{
  return self->_horizontalAngleAccuracy;
}

- (void)setHorizontalAngleAccuracy:(double)a3
{
  self->_horizontalAngleAccuracy = a3;
}

- (NSNumber)horizontalAngleAccuracyNumber
{
  return self->_horizontalAngleAccuracyNumber;
}

- (void)setHorizontalAngleAccuracyNumber:(id)a3
{
  self->_horizontalAngleAccuracyNumber = (NSNumber *)a3;
}

- (NSNumber)horizontalAngleUncertaintyNumber
{
  return self->_horizontalAngleUncertaintyNumber;
}

- (void)setHorizontalAngleUncertaintyNumber:(id)a3
{
  self->_horizontalAngleUncertaintyNumber = (NSNumber *)a3;
}

@end
