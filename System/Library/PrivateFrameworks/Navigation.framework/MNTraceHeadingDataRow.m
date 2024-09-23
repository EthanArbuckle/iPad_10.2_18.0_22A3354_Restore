@implementation MNTraceHeadingDataRow

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)trueHeading
{
  return self->_trueHeading;
}

- (void)setTrueHeading:(double)a3
{
  self->_trueHeading = a3;
}

- (double)magneticHeading
{
  return self->_magneticHeading;
}

- (void)setMagneticHeading:(double)a3
{
  self->_magneticHeading = a3;
}

- (double)headingAccuracy
{
  return self->_headingAccuracy;
}

- (void)setHeadingAccuracy:(double)a3
{
  self->_headingAccuracy = a3;
}

@end
