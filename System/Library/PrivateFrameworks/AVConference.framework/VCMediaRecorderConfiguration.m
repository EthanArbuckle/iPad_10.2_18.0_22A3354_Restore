@implementation VCMediaRecorderConfiguration

- (void)setMediaAvailability:(unsigned int)a3
{
  self->_mediaAvailability = a3;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (unsigned)mediaAvailability
{
  return self->_mediaAvailability;
}

- (int)clientPid
{
  return self->_clientPid;
}

@end
