@implementation GEORouteBuilderOutput

- (GEOComposedRouteCoordinateArray)coordinatesArray
{
  return self->_coordinatesArray;
}

- (void)setCoordinatesArray:(id)a3
{
  objc_storeStrong((id *)&self->_coordinatesArray, a3);
}

- (NSArray)legs
{
  return self->_legs;
}

- (void)setLegs:(id)a3
{
  objc_storeStrong((id *)&self->_legs, a3);
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (NSArray)steps
{
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  objc_storeStrong((id *)&self->_steps, a3);
}

- (NSArray)guidanceEvents
{
  return self->_guidanceEvents;
}

- (void)setGuidanceEvents:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceEvents, a3);
}

- (NSArray)enrouteNotices
{
  return self->_enrouteNotices;
}

- (void)setEnrouteNotices:(id)a3
{
  objc_storeStrong((id *)&self->_enrouteNotices, a3);
}

- (NSArray)visualInfos
{
  return self->_visualInfos;
}

- (void)setVisualInfos:(id)a3
{
  objc_storeStrong((id *)&self->_visualInfos, a3);
}

- (NSArray)visualInfosForRouteNameLabels
{
  return self->_visualInfosForRouteNameLabels;
}

- (void)setVisualInfosForRouteNameLabels:(id)a3
{
  objc_storeStrong((id *)&self->_visualInfosForRouteNameLabels, a3);
}

- (NSArray)cameraInfos
{
  return self->_cameraInfos;
}

- (void)setCameraInfos:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfos, a3);
}

- (GEOComposedRouteCellularCoverage)cellularCoverage
{
  return self->_cellularCoverage;
}

- (void)setCellularCoverage:(id)a3
{
  objc_storeStrong((id *)&self->_cellularCoverage, a3);
}

- (BOOL)usesZilch
{
  return self->_usesZilch;
}

- (void)setUsesZilch:(BOOL)a3
{
  self->_usesZilch = a3;
}

- (NSArray)pointSections
{
  return self->_pointSections;
}

- (void)setPointSections:(id)a3
{
  objc_storeStrong((id *)&self->_pointSections, a3);
}

- (GEOMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (void)setBoundingMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_boundingMapRegion, a3);
}

- (GEOElevationProfile)elevationProfile
{
  return self->_elevationProfile;
}

- (void)setElevationProfile:(id)a3
{
  objc_storeStrong((id *)&self->_elevationProfile, a3);
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (int)elevationModel
{
  return self->_elevationModel;
}

- (void)setElevationModel:(int)a3
{
  self->_elevationModel = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraInfos, 0);
  objc_storeStrong((id *)&self->_elevationProfile, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_cellularCoverage, 0);
  objc_storeStrong((id *)&self->_pointSections, 0);
  objc_storeStrong((id *)&self->_visualInfosForRouteNameLabels, 0);
  objc_storeStrong((id *)&self->_visualInfos, 0);
  objc_storeStrong((id *)&self->_enrouteNotices, 0);
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_legs, 0);
  objc_storeStrong((id *)&self->_coordinatesArray, 0);
}

@end
