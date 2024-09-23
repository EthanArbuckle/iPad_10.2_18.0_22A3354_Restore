@implementation CPSTravelEstimatesStrings

- (NSString)arrivalTimeString
{
  return self->_arrivalTimeString;
}

- (void)setArrivalTimeString:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalTimeString, a3);
}

- (NSString)localizedArrivalString
{
  return self->_localizedArrivalString;
}

- (void)setLocalizedArrivalString:(id)a3
{
  objc_storeStrong((id *)&self->_localizedArrivalString, a3);
}

- (NSString)timeRemainingString
{
  return self->_timeRemainingString;
}

- (void)setTimeRemainingString:(id)a3
{
  objc_storeStrong((id *)&self->_timeRemainingString, a3);
}

- (NSString)localizedTimeRemainingUnit
{
  return self->_localizedTimeRemainingUnit;
}

- (void)setLocalizedTimeRemainingUnit:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTimeRemainingUnit, a3);
}

- (NSString)distanceRemainingString
{
  return self->_distanceRemainingString;
}

- (void)setDistanceRemainingString:(id)a3
{
  objc_storeStrong((id *)&self->_distanceRemainingString, a3);
}

- (NSString)localizedDistanceRemainingUnit
{
  return self->_localizedDistanceRemainingUnit;
}

- (void)setLocalizedDistanceRemainingUnit:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDistanceRemainingUnit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDistanceRemainingUnit, 0);
  objc_storeStrong((id *)&self->_distanceRemainingString, 0);
  objc_storeStrong((id *)&self->_localizedTimeRemainingUnit, 0);
  objc_storeStrong((id *)&self->_timeRemainingString, 0);
  objc_storeStrong((id *)&self->_localizedArrivalString, 0);
  objc_storeStrong((id *)&self->_arrivalTimeString, 0);
}

@end
