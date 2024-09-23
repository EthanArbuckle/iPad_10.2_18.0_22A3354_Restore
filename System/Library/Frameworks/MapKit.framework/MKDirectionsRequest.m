@implementation MKDirectionsRequest

- (unint64_t)_transportType
{
  return self->_transportType;
}

- (MKDirectionsTransportType)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(MKDirectionsTransportType)transportType
{
  self->_transportType = transportType;
}

- (BOOL)requestsAlternateRoutes
{
  return self->_requestsAlternateRoutes;
}

- (void)setRequestsAlternateRoutes:(BOOL)requestsAlternateRoutes
{
  self->_requestsAlternateRoutes = requestsAlternateRoutes;
}

- (id)_departureDate
{
  return self->_departureDate;
}

- (id)_arrivalDate
{
  return self->_arrivalDate;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (void)setDepartureDate:(NSDate *)departureDate
{
  NSDate *v4;
  NSDate *v5;

  v4 = (NSDate *)-[NSDate copy](departureDate, "copy");
  v5 = self->_departureDate;
  self->_departureDate = v4;

}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (void)setArrivalDate:(NSDate *)arrivalDate
{
  NSDate *v4;
  NSDate *v5;

  v4 = (NSDate *)-[NSDate copy](arrivalDate, "copy");
  v5 = self->_arrivalDate;
  self->_arrivalDate = v4;

}

- (void)setTollPreference:(MKDirectionsRoutePreference)tollPreference
{
  self->_tollPreference = tollPreference;
}

- (MKDirectionsRoutePreference)tollPreference
{
  return self->_tollPreference;
}

- (void)setHighwayPreference:(MKDirectionsRoutePreference)highwayPreference
{
  self->_highwayPreference = highwayPreference;
}

- (MKDirectionsRoutePreference)highwayPreference
{
  return self->_highwayPreference;
}

- (MKDirectionsRequest)init
{
  MKDirectionsRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKDirectionsRequest;
  result = -[MKDirectionsRequest init](&v3, sel_init);
  if (result)
  {
    result->_transportType = 0xFFFFFFFLL;
    *(_WORD *)&result->_requestsAlternateRoutes = 256;
    result->_includeDistanceInETA = 1;
    result->_includeRoutePoints = 1;
    result->_tollPreference = 0;
    result->_highwayPreference = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MKDirectionsRequest *v4;
  uint64_t v5;
  MKMapItem *source;
  uint64_t v7;
  MKMapItem *destination;
  void *v9;
  void *v10;
  uint64_t v11;
  GEOAutomobileOptions *automobileOptions;
  uint64_t v13;
  GEOTransitOptions *transitOptions;
  uint64_t v15;
  GEOWalkingOptions *walkingOptions;
  uint64_t v17;
  GEOCyclingOptions *cyclingOptions;

  v4 = -[MKDirectionsRequest init](+[MKDirectionsRequest allocWithZone:](MKDirectionsRequest, "allocWithZone:", a3), "init");
  -[MKDirectionsRequest source](self, "source");
  v5 = objc_claimAutoreleasedReturnValue();
  source = v4->_source;
  v4->_source = (MKMapItem *)v5;

  -[MKDirectionsRequest destination](self, "destination");
  v7 = objc_claimAutoreleasedReturnValue();
  destination = v4->_destination;
  v4->_destination = (MKMapItem *)v7;

  -[MKDirectionsRequest setTransportType:](v4, "setTransportType:", -[MKDirectionsRequest transportType](self, "transportType"));
  -[MKDirectionsRequest setRequestsAlternateRoutes:](v4, "setRequestsAlternateRoutes:", -[MKDirectionsRequest requestsAlternateRoutes](self, "requestsAlternateRoutes"));
  v4->_includeTravelTimes = self->_includeTravelTimes;
  v4->_includeTrafficIncidents = self->_includeTrafficIncidents;
  v4->_includeRoutePoints = self->_includeRoutePoints;
  v4->_includeDistanceInETA = self->_includeDistanceInETA;
  v4->_resolveExtraAutomobileOptions = self->_resolveExtraAutomobileOptions;
  objc_storeStrong((id *)&v4->_additionalTransportTypesRequested, self->_additionalTransportTypesRequested);
  v4->_useBackgroundURL = self->_useBackgroundURL;
  -[MKDirectionsRequest departureDate](self, "departureDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKDirectionsRequest setDepartureDate:](v4, "setDepartureDate:", v9);

  -[MKDirectionsRequest arrivalDate](self, "arrivalDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKDirectionsRequest setArrivalDate:](v4, "setArrivalDate:", v10);

  v11 = -[GEOAutomobileOptions copy](self->_automobileOptions, "copy");
  automobileOptions = v4->_automobileOptions;
  v4->_automobileOptions = (GEOAutomobileOptions *)v11;

  v13 = -[GEOTransitOptions copy](self->_transitOptions, "copy");
  transitOptions = v4->_transitOptions;
  v4->_transitOptions = (GEOTransitOptions *)v13;

  v15 = -[GEOWalkingOptions copy](self->_walkingOptions, "copy");
  walkingOptions = v4->_walkingOptions;
  v4->_walkingOptions = (GEOWalkingOptions *)v15;

  v17 = -[GEOCyclingOptions copy](self->_cyclingOptions, "copy");
  cyclingOptions = v4->_cyclingOptions;
  v4->_cyclingOptions = (GEOCyclingOptions *)v17;

  -[MKDirectionsRequest setTollPreference:](v4, "setTollPreference:", -[MKDirectionsRequest tollPreference](self, "tollPreference"));
  -[MKDirectionsRequest setHighwayPreference:](v4, "setHighwayPreference:", -[MKDirectionsRequest highwayPreference](self, "highwayPreference"));
  return v4;
}

- (id)_mapkit_initWithSource:(id)a3 destination:(id)a4 transportType:(unint64_t)a5 departureDate:(id)a6 includeTravelTimes:(BOOL)a7 includeTrafficIncidents:(BOOL)a8 includeRoutePoints:(BOOL)a9 resolveExtraAutomobileOptions:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  MKDirectionsRequest *v20;
  MKDirectionsRequest *v21;
  MKDirectionsRequest *v22;
  objc_super v24;

  v17 = a3;
  v18 = a4;
  v19 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MKDirectionsRequest;
  v20 = -[MKDirectionsRequest init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_source, a3);
    objc_storeStrong((id *)&v21->_destination, a4);
    v21->_transportType = a5;
    objc_storeStrong((id *)&v21->_departureDate, a6);
    v21->_includeTravelTimes = a7;
    v21->_includeTrafficIncidents = a8;
    v21->_includeRoutePoints = a9;
    v21->_resolveExtraAutomobileOptions = a10;
    v22 = v21;
  }

  return v21;
}

- (id)_mapkit_initWithSource:(id)a3 destination:(id)a4 transportType:(unint64_t)a5 arrivalDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  MKDirectionsRequest *v14;
  MKDirectionsRequest *v15;
  MKDirectionsRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MKDirectionsRequest;
  v14 = -[MKDirectionsRequest init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a3);
    objc_storeStrong((id *)&v15->_destination, a4);
    v15->_transportType = a5;
    objc_storeStrong((id *)&v15->_arrivalDate, a6);
    v16 = v15;
  }

  return v15;
}

+ (BOOL)isDirectionsRequestURL:(NSURL *)url
{
  NSURL *v3;
  void *v4;
  void *v5;
  char v6;

  v3 = url;
  if (-[NSURL isFileURL](v3, "isFileURL"))
  {
    -[NSURL lastPathComponent](v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("mkdirectionsrequest"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MKDirectionsRequest)initWithContentsOfURL:(NSURL *)url
{
  NSURL *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  MKDirectionsRequest *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v4 = url;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v4);
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (!v6)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not read directions request from %@"), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  v8 = v7;
  v9 = -[MKDirectionsRequest _mapkit_initWithDictionaryRepresentation:](self, "_mapkit_initWithDictionaryRepresentation:", v6);

  return v9;
}

- (id)_mapkit_initWithDictionaryRepresentation:(id)a3
{
  id v4;
  MKDirectionsRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MKDirectionsRequest *v10;

  v4 = a3;
  v5 = -[MKDirectionsRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("MKDirectionsRequestSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MKDirectionsRequestDestination"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[MKMapItem mapItemWithDictionary:](MKMapItem, "mapItemWithDictionary:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKDirectionsRequest setSource:](v5, "setSource:", v8);

    }
    if (v7)
    {
      +[MKMapItem mapItemWithDictionary:](MKMapItem, "mapItemWithDictionary:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKDirectionsRequest setDestination:](v5, "setDestination:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MKDirectionsRequest;
  -[MKDirectionsRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ source:%@ destination:%@ transportType:%lu>"), v4, self->_source, self->_destination, self->_transportType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKDirectionsRequest source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MKDirectionsRequest source](self, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("MKDirectionsRequestSource"));

  }
  -[MKDirectionsRequest destination](self, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MKDirectionsRequest destination](self, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("MKDirectionsRequestDestination"));

  }
  return v3;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[MKDirectionsRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v6, 0, a4);
  else
    v10 = 0;

  return v10;
}

- (MKMapItem)source
{
  return self->_source;
}

- (void)setSource:(MKMapItem *)source
{
  objc_storeStrong((id *)&self->_source, source);
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (void)setDestination:(MKMapItem *)destination
{
  objc_storeStrong((id *)&self->_destination, destination);
}

- (BOOL)_includeTravelTimes
{
  return self->_includeTravelTimes;
}

- (BOOL)_includeTrafficIncidents
{
  return self->_includeTrafficIncidents;
}

- (BOOL)_includeRoutePoints
{
  return self->_includeRoutePoints;
}

- (BOOL)_resolveExtraAutomobileOptions
{
  return self->_resolveExtraAutomobileOptions;
}

- (BOOL)_useBackgroundURL
{
  return self->_useBackgroundURL;
}

- (void)_setUseBackgroundURL:(BOOL)a3
{
  self->_useBackgroundURL = a3;
}

- (BOOL)_includeDistanceInETA
{
  return self->_includeDistanceInETA;
}

- (void)_setIncludeDistanceInETA:(BOOL)a3
{
  self->_includeDistanceInETA = a3;
}

- (NSArray)_additionalTransportTypesRequested
{
  return self->_additionalTransportTypesRequested;
}

- (void)_setAdditionalTransportTypesRequested:(id)a3
{
  objc_storeStrong((id *)&self->_additionalTransportTypesRequested, a3);
}

- (GEOAutomobileOptions)_automobileOptions
{
  return self->_automobileOptions;
}

- (void)_setAutomobileOptions:(id)a3
{
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (GEOTransitOptions)_transitOptions
{
  return self->_transitOptions;
}

- (void)_setTransitOptions:(id)a3
{
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (GEOWalkingOptions)_walkingOptions
{
  return self->_walkingOptions;
}

- (void)_setWalkingOptions:(id)a3
{
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (GEOCyclingOptions)_cyclingOptions
{
  return self->_cyclingOptions;
}

- (void)_setCyclingOptions:(id)a3
{
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_additionalTransportTypesRequested, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
