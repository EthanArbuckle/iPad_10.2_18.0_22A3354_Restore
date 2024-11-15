@implementation HDMirroredWorkoutAnalyticEvent

- (int64_t)timeTakenToStartMirroring
{
  return self->_timeTakenToStartMirroring;
}

- (void)setTimeTakenToStartMirroring:(int64_t)a3
{
  self->_timeTakenToStartMirroring = a3;
}

- (int64_t)timeTakenToStopMirroring
{
  return self->_timeTakenToStopMirroring;
}

- (void)setTimeTakenToStopMirroring:(int64_t)a3
{
  self->_timeTakenToStopMirroring = a3;
}

- (int64_t)mirroringDuration
{
  return self->_mirroringDuration;
}

- (void)setMirroringDuration:(int64_t)a3
{
  self->_mirroringDuration = a3;
}

- (int64_t)timeTakenToSendData
{
  return self->_timeTakenToSendData;
}

- (void)setTimeTakenToSendData:(int64_t)a3
{
  self->_timeTakenToSendData = a3;
}

- (int64_t)numberOfSendRequests
{
  return self->_numberOfSendRequests;
}

- (void)setNumberOfSendRequests:(int64_t)a3
{
  self->_numberOfSendRequests = a3;
}

- (int64_t)maxTimeTakenToSendData
{
  return self->_maxTimeTakenToSendData;
}

- (void)setMaxTimeTakenToSendData:(int64_t)a3
{
  self->_maxTimeTakenToSendData = a3;
}

- (int64_t)minTimeTakenToSendData
{
  return self->_minTimeTakenToSendData;
}

- (void)setMinTimeTakenToSendData:(int64_t)a3
{
  self->_minTimeTakenToSendData = a3;
}

@end
