@implementation DCMutableMapsLink

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)searchNearQuery
{
  return self->_searchNearQuery;
}

- (void)setSearchNearQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)searchLocation
{
  return self->_searchLocation;
}

- (void)setSearchLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)startAddress
{
  return self->_startAddress;
}

- (void)setStartAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (void)setDestinationAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)directionsMode
{
  return self->_directionsMode;
}

- (void)setDirectionsMode:(unint64_t)a3
{
  self->_directionsMode = a3;
}

- (NSString)centerLocation
{
  return self->_centerLocation;
}

- (void)setCenterLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(int64_t)a3
{
  self->_zoomLevel = a3;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (BOOL)showsTraffic
{
  return self->_showsTraffic;
}

- (void)setShowsTraffic:(BOOL)a3
{
  self->_showsTraffic = a3;
}

- (BOOL)showsTransit
{
  return self->_showsTransit;
}

- (void)setShowsTransit:(BOOL)a3
{
  self->_showsTransit = a3;
}

- (BOOL)showsStreetView
{
  return self->_showsStreetView;
}

- (void)setShowsStreetView:(BOOL)a3
{
  self->_showsStreetView = a3;
}

- (BOOL)showsBicycling
{
  return self->_showsBicycling;
}

- (void)setShowsBicycling:(BOOL)a3
{
  self->_showsBicycling = a3;
}

- (NSString)streetViewLocation
{
  return self->_streetViewLocation;
}

- (void)setStreetViewLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streetViewLocation, 0);
  objc_storeStrong((id *)&self->_centerLocation, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_startAddress, 0);
  objc_storeStrong((id *)&self->_searchLocation, 0);
  objc_storeStrong((id *)&self->_searchNearQuery, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end
