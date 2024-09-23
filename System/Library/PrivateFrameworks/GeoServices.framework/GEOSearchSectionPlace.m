@implementation GEOSearchSectionPlace

- (GEOSearchSectionPlace)init
{
  GEOSearchSectionPlace *result;

  result = (GEOSearchSectionPlace *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSearchSectionPlace)initWithMapItemIds:(id)a3
{
  id v4;
  GEOSearchSectionPlace *v5;
  uint64_t v6;
  NSArray *mapItemIds;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSearchSectionPlace;
  v5 = -[GEOSearchSectionPlace init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mapItemIds = v5->_mapItemIds;
    v5->_mapItemIds = (NSArray *)v6;

  }
  return v5;
}

- (GEOSearchSectionPlace)initWithSearchSectionPlace:(id)a3
{
  void *v4;
  void *v5;
  GEOSearchSectionPlace *v6;

  -[GEOPDSearchSectionPlace placeIds]((id *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOSearchSectionPlace initWithMapItemIds:](self, "initWithMapItemIds:", v5);

  return v6;
}

- (NSArray)mapItemIds
{
  return self->_mapItemIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemIds, 0);
}

@end
