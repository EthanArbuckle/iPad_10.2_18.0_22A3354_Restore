@implementation FUFLightTrack

- (MKGeodesicPolyline)polyline
{
  return (MKGeodesicPolyline *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPolyline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FUFlightLeg)leg
{
  return (FUFlightLeg *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLeg:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leg, 0);
  objc_storeStrong((id *)&self->_polyline, 0);
}

@end
