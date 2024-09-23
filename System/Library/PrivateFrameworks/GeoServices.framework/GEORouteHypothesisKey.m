@implementation GEORouteHypothesisKey

- (GEORouteHypothesisKey)initWithRouteHypothesisRequest:(id)a3
{
  id v5;
  GEORouteHypothesisKey *v6;
  GEORouteHypothesisKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORouteHypothesisKey;
  v6 = -[GEORouteHypothesisKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  GEOMapItemHandle *v6;
  void *v7;
  unint64_t v8;

  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteHypothesisRequest destinationLocation](self->_request, "destinationLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleForMapItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GEOMapItemHandle initWithData:]([GEOMapItemHandle alloc], "initWithData:", v5);
  -[GEOMapItemHandle placeRefinementParameters](v6, "placeRefinementParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_routeHypothesisPlaceRefinementParametersHash");

  return v8;
}

- (BOOL)_isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  GEOMapItemHandle *v8;
  void *v9;
  void *v10;
  GEOMapItemHandle *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteHypothesisRequest destinationLocation](self->_request, "destinationLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleForMapItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[GEOMapItemHandle initWithData:]([GEOMapItemHandle alloc], "initWithData:", v7);
  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleForMapItem:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[GEOMapItemHandle initWithData:]([GEOMapItemHandle alloc], "initWithData:", v10);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[GEOMapItemHandle placeRefinementParameters](v8, "placeRefinementParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOMapItemHandle placeRefinementParameters](v11, "placeRefinementParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138478083;
    v22 = v13;
    v23 = 2113;
    v24 = v14;
    _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "isAlmostEqual: place refinement parameters for myhandle:%{private}@, otherHandle:%{private}@", (uint8_t *)&v21, 0x16u);

  }
  -[GEOMapItemHandle placeRefinementParameters](v8, "placeRefinementParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "_hasRequiredFields"))
  {
    -[GEOMapItemHandle placeRefinementParameters](v11, "placeRefinementParameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "_hasRequiredFields");

    if ((v17 & 1) == 0)
    {
      v19 = 0;
      goto LABEL_9;
    }
    -[GEOMapItemHandle placeRefinementParameters](v8, "placeRefinementParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOMapItemHandle placeRefinementParameters](v11, "placeRefinementParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "_routeHypothesisPlaceRefinementParametersIsEqual:", v18);

  }
  else
  {
    v19 = 0;
  }

LABEL_9:
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORouteHypothesisKey request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrivalDate");
    v8 = v7;
    objc_msgSend(v5, "arrivalDate");
    if (v8 == v9)
    {
      -[GEORouteHypothesisKey request](self, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "transportType");
      if (v11 == objc_msgSend(v5, "transportType"))
      {
        objc_msgSend(v5, "destinationLocation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[GEORouteHypothesisKey _isEqual:](self, "_isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (GEORouteHypothesisKey)initWithCoder:(id)a3
{
  id v4;
  GEORouteHypothesisKey *v5;
  uint64_t v6;
  GEORouteHypothesisRequest *request;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORouteHypothesisKey;
  v5 = -[GEORouteHypothesisKey init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HypothesisRequestKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (GEORouteHypothesisRequest *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_request, CFSTR("HypothesisRequestKey"));
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEORouteHypothesisRequest destinationLocation](self->_request, "destinationLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  -[GEORouteHypothesisRequest destinationLocation](self->_request, "destinationLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinate");
  v9 = v8;
  v10 = (void *)MEMORY[0x1E0CB3578];
  v11 = (void *)MEMORY[0x1E0C99D68];
  -[GEORouteHypothesisRequest arrivalDate](self->_request, "arrivalDate");
  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringFromDate:dateStyle:timeStyle:", v12, 1, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[GEORouteHypothesisRequest transportType](self->_request, "transportType");
  if (v14 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E1C11FC0[(int)v14];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[ Destination: (%f, %f)| Arrival Date: %@ | Transport Type: %@"), v6, v9, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteHypothesisRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
