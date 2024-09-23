@implementation MPGaplessInfo

- (void)setLastPacketsResync:(unint64_t)a3
{
  self->_lastPacketsResync = a3;
}

- (void)setHeuristicInfo:(unsigned int)a3
{
  self->_heuristicInfo = a3;
}

- (void)setEncodingDrainInFrames:(unsigned int)a3
{
  self->_encodingDrainInFrames = a3;
}

- (void)setEncodingDelayInFrames:(unsigned int)a3
{
  self->_encodingDelayInFrames = a3;
}

- (void)setDurationInFrames:(unint64_t)a3
{
  self->_durationInFrames = a3;
}

- (unint64_t)durationInFrames
{
  return self->_durationInFrames;
}

- (unsigned)encodingDelayInFrames
{
  return self->_encodingDelayInFrames;
}

- (unsigned)encodingDrainInFrames
{
  return self->_encodingDrainInFrames;
}

- (unsigned)heuristicInfo
{
  return self->_heuristicInfo;
}

- (unint64_t)lastPacketsResync
{
  return self->_lastPacketsResync;
}

@end
