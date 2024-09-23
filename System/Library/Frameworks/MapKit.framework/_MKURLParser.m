@implementation _MKURLParser

+ (BOOL)isValidMapURL:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D27230], "isValidMapURL:", a3);
}

+ (BOOL)isAppleMapsGuidesURL:(id)a3
{
  id v3;
  _MKURLParser *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  v4 = -[_MKURLParser initWithURL:]([_MKURLParser alloc], "initWithURL:", v3);

  v5 = 1;
  -[_MKURLParser parseIncludingCustomParameters:](v4, "parseIncludingCustomParameters:", 1);
  -[_MKURLParser collectionStorage](v4, "collectionStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && !-[_MKURLParser curatedCollectionMUID](v4, "curatedCollectionMUID"))
    v5 = -[_MKURLParser publisherMUID](v4, "publisherMUID") != 0;

  return v5;
}

- (_MKURLParser)initWithURL:(id)a3
{
  id v4;
  _MKURLParser *v5;
  uint64_t v6;
  GEOMapURLParser *parser;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKURLParser;
  v5 = -[_MKURLParser init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27230]), "initWithURL:", v4);
    parser = v5->parser;
    v5->parser = (GEOMapURLParser *)v6;

  }
  return v5;
}

- (BOOL)parseIncludingCustomParameters:(BOOL)a3
{
  return -[GEOMapURLParser parseIncludingCustomParameters:](self->parser, "parseIncludingCustomParameters:", a3);
}

- (unint64_t)mapType
{
  void *v3;
  void *v4;
  unsigned int v6;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isMuninEnabled") & 1) != 0)
  {
    -[_MKURLParser muninViewState](self, "muninViewState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return 107;
  }
  else
  {

  }
  v6 = -[GEOMapURLParser mapType](self->parser, "mapType");
  if (v6 > 4)
    return 103;
  else
    return qword_18B2A9530[v6];
}

- (MKMapCamera)mapCamera
{
  MKMapCamera *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;

  v3 = objc_alloc_init(MKMapCamera);
  -[_MKURLParser muninViewState](self, "muninViewState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_MKURLParser muninViewState](self, "muninViewState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "altitude");
    -[MKMapCamera setAltitude:](v3, "setAltitude:");
    objc_msgSend(v6, "latitude");
    v8 = v7;
    objc_msgSend(v6, "longitude");
    v10 = CLLocationCoordinate2DMake(v8, v9);
    -[MKMapCamera setCenterCoordinate:](v3, "setCenterCoordinate:", v10.latitude, v10.longitude);
    objc_msgSend(v6, "pitch");
    -[MKMapCamera setPitch:](v3, "setPitch:");
    objc_msgSend(v6, "yaw");
    -[MKMapCamera setHeading:](v3, "setHeading:");

  }
  else
  {
    -[_MKURLParser altitude](self, "altitude");
    -[MKMapCamera setAltitude:](v3, "setAltitude:");
    -[_MKURLParser centerCoordinate](self, "centerCoordinate");
    -[MKMapCamera setCenterCoordinate:](v3, "setCenterCoordinate:");
    -[_MKURLParser tilt](self, "tilt");
    -[MKMapCamera setPitch:](v3, "setPitch:");
    -[_MKURLParser rotation](self, "rotation");
    -[MKMapCamera setHeading:](v3, "setHeading:");
  }
  return v3;
}

- (unint64_t)transportType
{
  unsigned int v2;

  v2 = -[GEOMapURLParser transportType](self->parser, "transportType");
  if (v2 > 5)
    return 0xFFFFFFFLL;
  else
    return qword_18B2A9558[v2];
}

- (BOOL)trackingModeSpecified
{
  return -[GEOMapURLParser trackingModeSpecified](self->parser, "trackingModeSpecified");
}

- (int64_t)trackingMode
{
  int v2;

  v2 = -[GEOMapURLParser trackingMode](self->parser, "trackingMode");
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (BOOL)exactPositionSpecified
{
  return -[GEOMapURLParser exactPositionSpecified](self->parser, "exactPositionSpecified");
}

- (CLLocationCoordinate2D)centerCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  -[GEOMapURLParser centerCoordinate](self->parser, "centerCoordinate");
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)span
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOMapURLParser span](self->parser, "span");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (float)zoomLevel
{
  float result;

  -[GEOMapURLParser zoomLevel](self->parser, "zoomLevel");
  return result;
}

- (double)cameraCenterBasedAltitude
{
  float v3;
  float v4;
  float v5;
  double v6;
  double v7;

  -[GEOMapURLParser cameraDistance](self->parser, "cameraDistance");
  v4 = v3;
  -[GEOMapURLParser cameraDistance](self->parser, "cameraDistance");
  v6 = v5;
  if (v4 > 0.0)
  {
    -[_MKURLParser tilt](self, "tilt");
    return cos(v7 * 0.0174532925) * v6;
  }
  return v6;
}

- (NSString)addressString
{
  return (NSString *)-[GEOMapURLParser addressString](self->parser, "addressString");
}

- (NSString)directionsSourceAddressString
{
  return (NSString *)-[GEOMapURLParser directionsSourceAddressString](self->parser, "directionsSourceAddressString");
}

- (NSArray)directionsDestinationAddressStrings
{
  return (NSArray *)-[GEOMapURLParser directionsDestinationAddressStrings](self->parser, "directionsDestinationAddressStrings");
}

- (NSString)directionsDestinationAddressString
{
  return (NSString *)-[GEOMapURLParser directionsDestinationAddressString](self->parser, "directionsDestinationAddressString");
}

- (NSString)searchQuery
{
  return (NSString *)-[GEOMapURLParser searchQuery](self->parser, "searchQuery");
}

- (NSString)label
{
  return (NSString *)-[GEOMapURLParser label](self->parser, "label");
}

- (CLLocationCoordinate2D)searchCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  -[GEOMapURLParser searchCoordinate](self->parser, "searchCoordinate");
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- ($DC1C8D958DDC8D67D0023B74A9319680)searchRegion
{
  return ($DC1C8D958DDC8D67D0023B74A9319680 *)-[GEOMapURLParser searchRegion](self->parser, "searchRegion");
}

- (int)searchProviderID
{
  return -[GEOMapURLParser searchProviderID](self->parser, "searchProviderID");
}

- (unint64_t)searchUID
{
  return -[GEOMapURLParser searchUID](self->parser, "searchUID");
}

- (NSString)contentProvider
{
  return (NSString *)-[GEOMapURLParser contentProvider](self->parser, "contentProvider");
}

- (NSString)contentProviderID
{
  return (NSString *)-[GEOMapURLParser contentProviderID](self->parser, "contentProviderID");
}

- (NSString)abRecordID
{
  return (NSString *)-[GEOMapURLParser abRecordID](self->parser, "abRecordID");
}

- (NSString)abAddressID
{
  return (NSString *)-[GEOMapURLParser abAddressID](self->parser, "abAddressID");
}

- (NSString)cnContactIdentifier
{
  return (NSString *)-[GEOMapURLParser cnContactIdentifier](self->parser, "cnContactIdentifier");
}

- (NSString)cnAddressIdentifier
{
  return (NSString *)-[GEOMapURLParser cnAddressIdentifier](self->parser, "cnAddressIdentifier");
}

- (GEOUserSessionEntity)userSessionEntity
{
  return (GEOUserSessionEntity *)-[GEOMapURLParser userSessionEntity](self->parser, "userSessionEntity");
}

- (double)altitude
{
  double result;

  -[GEOMapURLParser altitude](self->parser, "altitude");
  return result;
}

- (double)rotation
{
  double result;

  -[GEOMapURLParser rotation](self->parser, "rotation");
  return result;
}

- (double)tilt
{
  double result;

  -[GEOMapURLParser tilt](self->parser, "tilt");
  return result;
}

- (double)roll
{
  double result;

  -[GEOMapURLParser roll](self->parser, "roll");
  return result;
}

- (unint64_t)lineMUID
{
  return -[GEOMapURLParser lineMUID](self->parser, "lineMUID");
}

- (NSString)lineName
{
  return (NSString *)-[GEOMapURLParser lineName](self->parser, "lineName");
}

- (int64_t)favoritesType
{
  return -[GEOMapURLParser favoritesType](self->parser, "favoritesType");
}

- (BOOL)tester
{
  return -[GEOMapURLParser tester](self->parser, "tester");
}

- (GEOURLCollectionStorage)collectionStorage
{
  return (GEOURLCollectionStorage *)-[GEOMapURLParser collectionStorage](self->parser, "collectionStorage");
}

- (GEOURLExtraStorage)extraStorage
{
  return (GEOURLExtraStorage *)-[GEOMapURLParser extraStorage](self->parser, "extraStorage");
}

- (GEOMuninViewState)muninViewState
{
  return (GEOMuninViewState *)-[GEOMapURLParser muninViewState](self->parser, "muninViewState");
}

- (GEOMapRegion)offlineDownloadRegion
{
  return (GEOMapRegion *)-[GEOMapURLParser offlineDownloadRegion](self->parser, "offlineDownloadRegion");
}

- (BOOL)showCarDestinations
{
  return -[GEOMapURLParser showCarDestinations](self->parser, "showCarDestinations");
}

- (unint64_t)curatedCollectionMUID
{
  return -[GEOMapURLParser curatedCollectionMUID](self->parser, "curatedCollectionMUID");
}

- (unint64_t)publisherMUID
{
  return -[GEOMapURLParser publisherMUID](self->parser, "publisherMUID");
}

- (BOOL)showAllCuratedCollections
{
  return -[GEOMapURLParser showAllCuratedCollections](self->parser, "showAllCuratedCollections");
}

- (GEOEnrichmentInfo)enrichmentInfo
{
  return (GEOEnrichmentInfo *)-[GEOMapURLParser enrichmentInfo](self->parser, "enrichmentInfo");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->parser, 0);
}

@end
