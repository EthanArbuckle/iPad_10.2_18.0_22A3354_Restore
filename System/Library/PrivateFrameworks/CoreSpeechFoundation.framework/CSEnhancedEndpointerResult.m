@implementation CSEnhancedEndpointerResult

- (BOOL)didEndpointerFire
{
  return self->_didDefaultEndpointerFire || self->_didRelaxedEndpointerFire;
}

- (BOOL)didDefaultEndpointerFire
{
  return self->_didDefaultEndpointerFire;
}

- (void)setDidDefaultEndpointerFire:(BOOL)a3
{
  self->_didDefaultEndpointerFire = a3;
}

- (BOOL)didRelaxedEndpointerFire
{
  return self->_didRelaxedEndpointerFire;
}

- (void)setDidRelaxedEndpointerFire:(BOOL)a3
{
  self->_didRelaxedEndpointerFire = a3;
}

- (float)endpointPosterior
{
  return self->_endpointPosterior;
}

- (void)setEndpointPosterior:(float)a3
{
  self->_endpointPosterior = a3;
}

- (int)extraDelayMs
{
  return self->_extraDelayMs;
}

- (void)setExtraDelayMs:(int)a3
{
  self->_extraDelayMs = a3;
}

- (BOOL)speechArrivalDetected
{
  return self->_speechArrivalDetected;
}

- (void)setSpeechArrivalDetected:(BOOL)a3
{
  self->_speechArrivalDetected = a3;
}

- (BOOL)didForceEndpoint
{
  return self->_didForceEndpoint;
}

- (void)setDidForceEndpoint:(BOOL)a3
{
  self->_didForceEndpoint = a3;
}

- (float)partialScore
{
  return self->_partialScore;
}

- (void)setPartialScore:(float)a3
{
  self->_partialScore = a3;
}

- (float)rcScore
{
  return self->_rcScore;
}

- (void)setRcScore:(float)a3
{
  self->_rcScore = a3;
}

- (int64_t)endpointerType
{
  return self->_endpointerType;
}

- (void)setEndpointerType:(int64_t)a3
{
  self->_endpointerType = a3;
}

@end
