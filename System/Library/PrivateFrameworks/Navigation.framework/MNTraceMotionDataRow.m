@implementation MNTraceMotionDataRow

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(unint64_t)a3
{
  self->_motionType = a3;
}

- (unint64_t)exitType
{
  return self->_exitType;
}

- (void)setExitType:(unint64_t)a3
{
  self->_exitType = a3;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
}

@end
