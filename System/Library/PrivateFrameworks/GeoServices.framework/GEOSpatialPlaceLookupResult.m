@implementation GEOSpatialPlaceLookupResult

- (GEOSpatialPlaceLookupResult)initWithMapItemMap:(id)a3 resultItemMap:(id)a4
{
  id v7;
  id v8;
  GEOSpatialPlaceLookupResult *v9;
  GEOSpatialPlaceLookupResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOSpatialPlaceLookupResult;
  v9 = -[GEOSpatialPlaceLookupResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parametersToMapItemsMap, a3);
    objc_storeStrong((id *)&v10->_parametersToResultItemMap, a4);
  }

  return v10;
}

- (GEOSpatialPlaceLookupResult)init
{
  GEOSpatialPlaceLookupResult *result;

  result = (GEOSpatialPlaceLookupResult *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (id)mapItemsForSpatialLookupParameters:(id)a3
{
  return -[NSMapTable objectForKey:](self->_parametersToMapItemsMap, "objectForKey:", a3);
}

- (id)resultItemForSpatialLookupParameters:(id)a3
{
  return -[NSMapTable objectForKey:](self->_parametersToResultItemMap, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parametersToResultItemMap, 0);
  objc_storeStrong((id *)&self->_parametersToMapItemsMap, 0);
}

@end
