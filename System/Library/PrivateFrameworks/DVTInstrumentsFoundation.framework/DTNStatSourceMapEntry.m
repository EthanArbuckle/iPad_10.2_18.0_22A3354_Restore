@implementation DTNStatSourceMapEntry

- (int64_t)serialNumber
{
  return self->_serialNumber;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (XRNetworkingServiceObservationTuple)lastStats
{
  return self->_lastStats;
}

- (void)setLastStats:(id)a3
{
  objc_storeStrong((id *)&self->_lastStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStats, 0);
}

@end
