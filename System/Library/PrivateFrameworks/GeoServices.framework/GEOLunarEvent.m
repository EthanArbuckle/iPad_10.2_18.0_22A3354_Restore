@implementation GEOLunarEvent

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSDate)date
{
  return self->_date;
}

- (double)bearing
{
  return self->_bearing;
}

- (double)altitude
{
  return self->_altitude;
}

- (BOOL)isAboveHorizon
{
  return self->_isAboveHorizon;
}

@end
