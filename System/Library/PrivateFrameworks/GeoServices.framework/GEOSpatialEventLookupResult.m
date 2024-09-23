@implementation GEOSpatialEventLookupResult

- (GEOSpatialEventLookupResult)initWithMapTable:(id)a3
{
  id v5;
  GEOSpatialEventLookupResult *v6;
  GEOSpatialEventLookupResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSpatialEventLookupResult;
  v6 = -[GEOSpatialEventLookupResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_parametersToEventsMap, a3);

  return v7;
}

- (GEOSpatialEventLookupResult)init
{
  GEOSpatialEventLookupResult *result;

  result = (GEOSpatialEventLookupResult *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (id)poiEventsForSpatialLookupParameters:(id)a3
{
  return -[NSMapTable objectForKey:](self->_parametersToEventsMap, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parametersToEventsMap, 0);
}

@end
