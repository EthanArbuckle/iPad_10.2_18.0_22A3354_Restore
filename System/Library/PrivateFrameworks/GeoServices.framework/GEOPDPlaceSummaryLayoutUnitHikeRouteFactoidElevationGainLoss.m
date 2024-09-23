@implementation GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss;
  -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLossIsValid((unsigned __int8 *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLossReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss readAll:](self, "readAll:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss readAll:](self, "readAll:", 1);
  return 0;
}

- (void)mergeFrom:(id)a3
{
  objc_msgSend(a3, "readAll:", 0);
}

@end
