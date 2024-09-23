@implementation _GEOTransitTripStop

+ (id)transitTripStopsForPlaceData:(id)a3
{
  id v3;
  id *v4;
  id *v5;
  BOOL v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _GEOTransitTripStop *v26;
  uint64_t v27;
  void *v28;
  id *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GEOPDTransitTripStopTime transitTripStopTimeForPlaceData:](GEOPDTransitTripStopTime, "transitTripStopTimeForPlaceData:", v3);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  +[GEOPDTransitTripStop transitTripStopForPlaceData:](GEOPDTransitTripStop, "transitTripStopForPlaceData:", v3);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_opt_new();
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v31 = v3;
    v7 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = v5;
    v8 = v5[2];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v12);
          if (v13)
            v14 = *(_QWORD *)(v13 + 80);
          else
            v14 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14, v30);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v15);

          ++v12;
        }
        while (v10 != v12);
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        v10 = v16;
      }
      while (v16);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v4[2];
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v21);
          if (v22)
            v23 = *(_QWORD *)(v22 + 136);
          else
            v23 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23, v30);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = -[_GEOTransitTripStop initWithTransitSnippet:departureSequence:]([_GEOTransitTripStop alloc], "initWithTransitSnippet:departureSequence:", v25, v22);
            objc_msgSend(v32, "addObject:", v26);

          }
          ++v21;
        }
        while (v19 != v21);
        v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        v19 = v27;
      }
      while (v27);
    }

    v3 = v31;
    v5 = v30;
  }
  v28 = (void *)objc_msgSend(v32, "copy", v30);

  return v28;
}

- (_GEOTransitTripStop)initWithTransitSnippet:(id)a3 departureSequence:(id)a4
{
  id *v6;
  id *v7;
  _GEOTransitTripStop *v8;
  _GEOTransitTripStop *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  GEOTransitDeparture *departure;
  void *v14;
  uint64_t v15;
  NSString *transitName;
  id *v17;
  void *v18;
  uint64_t v19;
  NSTimeZone *timeZone;
  _GEOMapItemTransitInfoSnippet *v21;
  void *v22;
  uint64_t v23;
  NSArray *labelItems;
  void *v25;
  uint64_t v26;
  GEOLatLng *location;
  void *v28;
  uint64_t v29;
  GEOStyleAttributes *styleAttributes;
  BOOL v31;
  objc_super v33;

  v6 = (id *)a3;
  v7 = (id *)a4;
  v33.receiver = self;
  v33.super_class = (Class)_GEOTransitTripStop;
  v8 = -[_GEOTransitTripStop init](&v33, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
      v10 = (unint64_t)v6[10];
    else
      v10 = 0;
    v8->_stationIdentifier = v10;
    -[GEOPDDepartureSequence departures](v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();
    departure = v9->_departure;
    v9->_departure = (GEOTransitDeparture *)v12;

    -[GEOPDTransitInfoSnippet transitName](v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    transitName = v9->_transitName;
    v9->_transitName = (NSString *)v15;

    -[GEOPDTransitInfoSnippet timezone](v6);
    v17 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOTimezone identifier](v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", v18);
    timeZone = v9->_timeZone;
    v9->_timeZone = (NSTimeZone *)v19;

    v21 = -[_GEOMapItemTransitInfoSnippet initWithTransitInfoSnippet:]([_GEOMapItemTransitInfoSnippet alloc], "initWithTransitInfoSnippet:", v6);
    -[_GEOMapItemTransitInfoSnippet labelItems](v21, "labelItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    labelItems = v9->_labelItems;
    v9->_labelItems = (NSArray *)v23;

    -[GEOPDTransitInfoSnippet stopLocationForTrip](v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    location = v9->_location;
    v9->_location = (GEOLatLng *)v26;

    -[GEOPDTransitInfoSnippet styleAttributesForTrip](v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    styleAttributes = v9->_styleAttributes;
    v9->_styleAttributes = (GEOStyleAttributes *)v29;

    if (v6)
      v31 = *((_BYTE *)v6 + 108) != 0;
    else
      v31 = 0;
    v9->_isHidden = v31;

  }
  return v9;
}

- (unint64_t)stationIdentifier
{
  return self->_stationIdentifier;
}

- (NSString)displayName
{
  return self->_transitName;
}

- (NSArray)labelItems
{
  return self->_labelItems;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (GEOLatLng)location
{
  return self->_location;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_GEOTransitTripStop displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (GEOTransitDeparture)departure
{
  return self->_departure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departure, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_labelItems, 0);
  objc_storeStrong((id *)&self->_transitName, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
