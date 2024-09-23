@implementation CLSLitePlacemarkTestData

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_thoroughfare, a3);
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (void)setSubThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_subThoroughfare, a3);
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_storeStrong((id *)&self->_locality, a3);
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setSubLocality:(id)a3
{
  objc_storeStrong((id *)&self->_subLocality, a3);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeArea, a3);
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_subAdministrativeArea, a3);
}

- (NSString)ISOcountryCode
{
  return self->_ISOcountryCode;
}

- (void)setISOcountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_ISOcountryCode, a3);
}

- (NSString)inlandWater
{
  return self->_inlandWater;
}

- (void)setInlandWater:(id)a3
{
  objc_storeStrong((id *)&self->_inlandWater, a3);
}

- (NSString)ocean
{
  return self->_ocean;
}

- (void)setOcean:(id)a3
{
  objc_storeStrong((id *)&self->_ocean, a3);
}

- (NSArray)areasOfInterest
{
  return self->_areasOfInterest;
}

- (void)setAreasOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_areasOfInterest, a3);
}

- (NSString)administrativeAreaCode
{
  return self->_administrativeAreaCode;
}

- (void)setAdministrativeAreaCode:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeAreaCode, a3);
}

- (BOOL)isIsland
{
  return self->_isIsland;
}

- (void)setIsIsland:(BOOL)a3
{
  self->_isIsland = a3;
}

- (NSArray)popularityScoresOrderedByAOI
{
  return self->_popularityScoresOrderedByAOI;
}

- (void)setPopularityScoresOrderedByAOI:(id)a3
{
  objc_storeStrong((id *)&self->_popularityScoresOrderedByAOI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popularityScoresOrderedByAOI, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_ISOcountryCode, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
