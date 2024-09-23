@implementation _GEOPlaceDataTransitLineItem

- (_GEOPlaceDataTransitLineItem)initWithMapItem:(id)a3
{
  id v4;
  _GEOPlaceDataTransitLineItem *v5;
  uint64_t v6;
  GEOMapRegion *mapRegion;
  uint64_t v8;
  GEOTransitAttribution *attribution;
  uint64_t v10;
  GEOMapItemTransitInfo *transitInfo;
  void *v12;
  uint64_t v13;
  GEOTransitLine *line;
  uint64_t v15;
  GEOEncyclopedicInfo *encyclopedicInfo;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_GEOPlaceDataTransitLineItem;
  v5 = -[_GEOPlaceDataTransitLineItem init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "displayMapRegion");
    v6 = objc_claimAutoreleasedReturnValue();
    mapRegion = v5->_mapRegion;
    v5->_mapRegion = (GEOMapRegion *)v6;

    objc_msgSend(v4, "_transitAttribution");
    v8 = objc_claimAutoreleasedReturnValue();
    attribution = v5->_attribution;
    v5->_attribution = (GEOTransitAttribution *)v8;

    objc_msgSend(v4, "_transitInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    transitInfo = v5->_transitInfo;
    v5->_transitInfo = (GEOMapItemTransitInfo *)v10;

    -[GEOMapItemTransitInfo lines](v5->_transitInfo, "lines");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    line = v5->_line;
    v5->_line = (GEOTransitLine *)v13;

    v5->_hasEncyclopedicInfo = objc_msgSend(v4, "_hasEncyclopedicInfo");
    objc_msgSend(v4, "_encyclopedicInfo");
    v15 = objc_claimAutoreleasedReturnValue();
    encyclopedicInfo = v5->_encyclopedicInfo;
    v5->_encyclopedicInfo = (GEOEncyclopedicInfo *)v15;

  }
  return v5;
}

- (unint64_t)muid
{
  return -[GEOTransitLine muid](self->_line, "muid");
}

- (GEOMapItemIdentifier)identifier
{
  return (GEOMapItemIdentifier *)-[GEOTransitLine identifier](self->_line, "identifier");
}

- (NSString)name
{
  return (NSString *)-[GEOTransitLine name](self->_line, "name");
}

- (GEOTransitSystem)system
{
  return (GEOTransitSystem *)-[GEOTransitLine system](self->_line, "system");
}

- (unint64_t)departureTimeDisplayStyle
{
  return -[GEOTransitLine departureTimeDisplayStyle](self->_line, "departureTimeDisplayStyle");
}

- (BOOL)departuresAreVehicleSpecific
{
  return -[GEOTransitLine departuresAreVehicleSpecific](self->_line, "departuresAreVehicleSpecific");
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)-[GEOTransitLine artwork](self->_line, "artwork");
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  return (GEOTransitArtworkDataSource *)-[GEOTransitLine modeArtwork](self->_line, "modeArtwork");
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  return (GEOTransitArtworkDataSource *)-[GEOTransitLine alternateArtwork](self->_line, "alternateArtwork");
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  return (GEOTransitArtworkDataSource *)-[GEOTransitLine headerArtwork](self->_line, "headerArtwork");
}

- (BOOL)hasLineColorString
{
  return -[GEOTransitLine hasLineColorString](self->_line, "hasLineColorString");
}

- (NSString)lineColorString
{
  return (NSString *)-[GEOTransitLine lineColorString](self->_line, "lineColorString");
}

- (BOOL)showVehicleNumber
{
  return -[GEOTransitLine showVehicleNumber](self->_line, "showVehicleNumber");
}

- (NSArray)operatingHours
{
  return (NSArray *)-[GEOTransitLine operatingHours](self->_line, "operatingHours");
}

- (NSArray)labelItems
{
  return (NSArray *)-[GEOMapItemTransitInfo labelItems](self->_transitInfo, "labelItems");
}

- (GEOTransitAttribution)attribution
{
  return self->_attribution;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (NSArray)incidents
{
  return (NSArray *)-[GEOMapItemTransitInfo incidents](self->_transitInfo, "incidents");
}

- (BOOL)hasIncidentComponent
{
  return -[GEOMapItemTransitInfo hasTransitIncidentComponent](self->_transitInfo, "hasTransitIncidentComponent");
}

- (BOOL)isIncidentsTTLExpired
{
  return -[GEOMapItemTransitInfo isTransitIncidentsTTLExpired](self->_transitInfo, "isTransitIncidentsTTLExpired");
}

- (BOOL)hasEncyclopedicInfo
{
  return self->_hasEncyclopedicInfo;
}

- (GEOEncyclopedicInfo)encyclopedicInfo
{
  if (self->_hasEncyclopedicInfo)
    return self->_encyclopedicInfo;
  else
    return (GEOEncyclopedicInfo *)0;
}

- (BOOL)isBus
{
  return -[GEOTransitLine isBus](self->_line, "isBus");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encyclopedicInfo, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_transitInfo, 0);
  objc_storeStrong((id *)&self->_line, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

@end
