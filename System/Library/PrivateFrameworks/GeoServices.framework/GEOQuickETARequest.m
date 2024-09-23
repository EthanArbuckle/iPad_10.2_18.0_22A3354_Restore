@implementation GEOQuickETARequest

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7
{
  return -[GEOQuickETARequest initWithSource:toDestination:departureDate:transportType:currentLocation:includeDistance:](self, "initWithSource:toDestination:departureDate:transportType:currentLocation:includeDistance:", a3, a4, a5, *(_QWORD *)&a6, a7, 0);
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  GEOQuickETARequest *v18;
  GEOQuickETARequest *v19;
  uint64_t v20;
  NSString *requestingAppIdentifier;
  GEOQuickETARequest *v22;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)GEOQuickETARequest;
  v18 = -[GEOQuickETARequest init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    -[GEOQuickETARequest _defaultRequestingAppIdentifier](v18, "_defaultRequestingAppIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_departureDate, a5);
    v19->_transportType = a6;
    objc_storeStrong((id *)&v19->_currentLocation, a7);
    v19->_includeDistance = a8;
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7
{
  return -[GEOQuickETARequest initWithSource:toDestination:arrivalDate:transportType:currentLocation:includeDistance:](self, "initWithSource:toDestination:arrivalDate:transportType:currentLocation:includeDistance:", a3, a4, a5, *(_QWORD *)&a6, a7, 0);
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  GEOQuickETARequest *v18;
  GEOQuickETARequest *v19;
  uint64_t v20;
  NSString *requestingAppIdentifier;
  GEOQuickETARequest *v22;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)GEOQuickETARequest;
  v18 = -[GEOQuickETARequest init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    -[GEOQuickETARequest _defaultRequestingAppIdentifier](v18, "_defaultRequestingAppIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_arrivalDate, a5);
    v19->_transportType = a6;
    objc_storeStrong((id *)&v19->_currentLocation, a7);
    v19->_includeDistance = a8;
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 currentLocation:(id)a6 includeDistance:(BOOL)a7 automobileOptions:(id)a8 transitOptions:(id)a9 walkingOptions:(id)a10 cyclingOptions:(id)a11
{
  id v17;
  GEOQuickETARequest *v18;
  GEOQuickETARequest *v19;
  uint64_t v20;
  NSString *requestingAppIdentifier;
  GEOQuickETARequest *v22;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v17 = a11;
  v32.receiver = self;
  v32.super_class = (Class)GEOQuickETARequest;
  v18 = -[GEOQuickETARequest init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    -[GEOQuickETARequest _defaultRequestingAppIdentifier](v18, "_defaultRequestingAppIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_departureDate, a5);
    objc_storeStrong((id *)&v19->_currentLocation, a6);
    v19->_includeDistance = a7;
    objc_storeStrong((id *)&v19->_automobileOptions, a8);
    objc_storeStrong((id *)&v19->_transitOptions, a9);
    objc_storeStrong((id *)&v19->_walkingOptions, a10);
    objc_storeStrong((id *)&v19->_cyclingOptions, a11);
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 currentLocation:(id)a6 includeDistance:(BOOL)a7 automobileOptions:(id)a8 transitOptions:(id)a9 walkingOptions:(id)a10 cyclingOptions:(id)a11
{
  id v17;
  GEOQuickETARequest *v18;
  GEOQuickETARequest *v19;
  uint64_t v20;
  NSString *requestingAppIdentifier;
  GEOQuickETARequest *v22;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v17 = a11;
  v32.receiver = self;
  v32.super_class = (Class)GEOQuickETARequest;
  v18 = -[GEOQuickETARequest init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    -[GEOQuickETARequest _defaultRequestingAppIdentifier](v18, "_defaultRequestingAppIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_arrivalDate, a5);
    objc_storeStrong((id *)&v19->_currentLocation, a6);
    v19->_includeDistance = a7;
    objc_storeStrong((id *)&v19->_automobileOptions, a8);
    objc_storeStrong((id *)&v19->_transitOptions, a9);
    objc_storeStrong((id *)&v19->_walkingOptions, a10);
    objc_storeStrong((id *)&v19->_cyclingOptions, a11);
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  GEOQuickETARequest *v18;
  GEOQuickETARequest *v19;
  uint64_t v20;
  NSString *requestingAppIdentifier;
  GEOQuickETARequest *v22;
  id v26;
  objc_super v27;

  v26 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)GEOQuickETARequest;
  v18 = -[GEOQuickETARequest init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    -[GEOQuickETARequest _defaultRequestingAppIdentifier](v18, "_defaultRequestingAppIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_departureDate, a5);
    v19->_transportType = a6;
    objc_storeStrong((id *)&v19->_currentLocation, a7);
    v19->_includeDistance = a8;
    objc_storeStrong((id *)&v19->_additionalTransportTypesRequested, a9);
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  GEOQuickETARequest *v18;
  GEOQuickETARequest *v19;
  uint64_t v20;
  NSString *requestingAppIdentifier;
  GEOQuickETARequest *v22;
  id v26;
  objc_super v27;

  v26 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)GEOQuickETARequest;
  v18 = -[GEOQuickETARequest init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    -[GEOQuickETARequest _defaultRequestingAppIdentifier](v18, "_defaultRequestingAppIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_arrivalDate, a5);
    v19->_transportType = a6;
    objc_storeStrong((id *)&v19->_currentLocation, a7);
    v19->_includeDistance = a8;
    objc_storeStrong((id *)&v19->_additionalTransportTypesRequested, a9);
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9 automobileOptions:(id)a10 transitOptions:(id)a11 walkingOptions:(id)a12 cyclingOptions:(id)a13
{
  id v18;
  GEOQuickETARequest *v19;
  GEOQuickETARequest *v20;
  uint64_t v21;
  NSString *requestingAppIdentifier;
  GEOQuickETARequest *v23;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a7;
  v30 = a9;
  v29 = a10;
  v28 = a11;
  v27 = a12;
  v18 = a13;
  v35.receiver = self;
  v35.super_class = (Class)GEOQuickETARequest;
  v19 = -[GEOQuickETARequest init](&v35, sel_init);
  v20 = v19;
  if (v19)
  {
    -[GEOQuickETARequest _defaultRequestingAppIdentifier](v19, "_defaultRequestingAppIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v20->_requestingAppIdentifier;
    v20->_requestingAppIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v20->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v20->_departureDate, a5);
    v20->_transportType = a6;
    objc_storeStrong((id *)&v20->_currentLocation, a7);
    v20->_includeDistance = a8;
    objc_storeStrong((id *)&v20->_additionalTransportTypesRequested, a9);
    objc_storeStrong((id *)&v20->_automobileOptions, a10);
    objc_storeStrong((id *)&v20->_transitOptions, a11);
    objc_storeStrong((id *)&v20->_walkingOptions, a12);
    objc_storeStrong((id *)&v20->_cyclingOptions, a13);
    v23 = v20;
  }

  return v20;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9 automobileOptions:(id)a10 transitOptions:(id)a11 walkingOptions:(id)a12 cyclingOptions:(id)a13
{
  id v18;
  GEOQuickETARequest *v19;
  GEOQuickETARequest *v20;
  uint64_t v21;
  NSString *requestingAppIdentifier;
  GEOQuickETARequest *v23;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a7;
  v30 = a9;
  v29 = a10;
  v28 = a11;
  v27 = a12;
  v18 = a13;
  v35.receiver = self;
  v35.super_class = (Class)GEOQuickETARequest;
  v19 = -[GEOQuickETARequest init](&v35, sel_init);
  v20 = v19;
  if (v19)
  {
    -[GEOQuickETARequest _defaultRequestingAppIdentifier](v19, "_defaultRequestingAppIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v20->_requestingAppIdentifier;
    v20->_requestingAppIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v20->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v20->_arrivalDate, a5);
    v20->_transportType = a6;
    objc_storeStrong((id *)&v20->_currentLocation, a7);
    v20->_includeDistance = a8;
    objc_storeStrong((id *)&v20->_additionalTransportTypesRequested, a9);
    objc_storeStrong((id *)&v20->_automobileOptions, a10);
    objc_storeStrong((id *)&v20->_transitOptions, a11);
    objc_storeStrong((id *)&v20->_walkingOptions, a12);
    objc_storeStrong((id *)&v20->_cyclingOptions, a13);
    v23 = v20;
  }

  return v20;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("source: %@\ndestination: %@\ndepartureDate: %@\narrivalDate: %@\transportType: %d\ncurrentLocation:%@"), self->_sourceWaypoint, self->_destinationWaypoint, self->_departureDate, self->_arrivalDate, self->_transportType, self->_currentLocation);
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestingAppIdentifier, a3);
}

- (GEOComposedWaypoint)sourceWaypoint
{
  return self->_sourceWaypoint;
}

- (GEOComposedWaypoint)destinationWaypoint
{
  return self->_destinationWaypoint;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (int)transportType
{
  return self->_transportType;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (BOOL)includeDistance
{
  return self->_includeDistance;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (NSArray)additionalTransportTypesRequested
{
  return self->_additionalTransportTypesRequested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTransportTypesRequested, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_destinationWaypoint, 0);
  objc_storeStrong((id *)&self->_sourceWaypoint, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
}

@end
