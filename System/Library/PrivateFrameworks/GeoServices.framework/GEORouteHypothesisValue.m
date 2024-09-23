@implementation GEORouteHypothesisValue

- (GEORouteHypothesisValue)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 expirationDate:(id)a6 traceName:(id)a7 traits:(id)a8 routeAttributes:(id)a9 clientInfo:(id)a10
{
  id v17;
  id v18;
  GEORouteHypothesisValue *v19;
  GEORouteHypothesisValue *v20;
  uint64_t v21;
  GEORouteHypothesisMonitor *monitor;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v29 = a7;
  v24 = a8;
  v17 = a9;
  v18 = a10;
  v30.receiver = self;
  v30.super_class = (Class)GEORouteHypothesisValue;
  v19 = -[GEORouteHypothesisValue init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    -[GEORouteHypothesisValue commonInit](v19, "commonInit", v24, v25, v26, v27, v28);
    v20->_updatedTimeStamp = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v20->_origin, a3);
    objc_storeStrong((id *)&v20->_destination, a4);
    v20->_transportType = objc_msgSend(v17, "mainTransportType");
    objc_storeStrong((id *)&v20->_routeAttributes, a9);
    objc_storeStrong((id *)&v20->_arrivalDate, a5);
    objc_storeStrong((id *)&v20->_expirationDate, a6);
    objc_storeStrong((id *)&v20->_traits, a8);
    +[GEORouteHypothesisMonitor monitorWithSource:toDestination:traceName:traits:routeAttributes:clientInfo:](GEORouteHypothesisMonitor, "monitorWithSource:toDestination:traceName:traits:routeAttributes:clientInfo:", v20->_origin, v20->_destination, v29, v20->_traits, v20->_routeAttributes, v18);
    v21 = objc_claimAutoreleasedReturnValue();
    monitor = v20->_monitor;
    v20->_monitor = (GEORouteHypothesisMonitor *)v21;

    v20->_prediction = 0;
  }

  return v20;
}

- (GEORouteHypothesisValue)initWithCoder:(id)a3
{
  id v4;
  GEORouteHypothesisValue *v5;
  GEORouteHypothesisValue *v6;
  double v7;
  uint64_t v8;
  GEOComposedWaypoint *origin;
  uint64_t v10;
  GEOComposedWaypoint *destination;
  uint64_t v12;
  NSDate *arrivalDate;
  uint64_t v14;
  NSDate *expirationDate;
  uint64_t v16;
  GEOMapServiceTraits *traits;
  uint64_t v18;
  GEORouteHypothesisMonitor *monitor;
  uint64_t v20;
  GEORouteHypothesis *currentHypothesis;
  double v22;
  uint64_t v23;
  GEORouteAttributes *routeAttributes;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GEORouteHypothesisValue;
  v5 = -[GEORouteHypothesisValue init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEORouteHypothesisValue commonInit](v5, "commonInit");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UpdatedTimeStampKey"));
    v6->_updatedTimeStamp = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OriginKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    origin = v6->_origin;
    v6->_origin = (GEOComposedWaypoint *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DestinationKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    destination = v6->_destination;
    v6->_destination = (GEOComposedWaypoint *)v10;

    v6->_transportType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TransportTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ArrivalDateKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    arrivalDate = v6->_arrivalDate;
    v6->_arrivalDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExpirationDateKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v14;

    v6->_prediction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PredictionKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TraitsKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    traits = v6->_traits;
    v6->_traits = (GEOMapServiceTraits *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MonitorKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    monitor = v6->_monitor;
    v6->_monitor = (GEORouteHypothesisMonitor *)v18;

    -[GEORouteHypothesisMonitor hypothesis](v6->_monitor, "hypothesis");
    v20 = objc_claimAutoreleasedReturnValue();
    currentHypothesis = v6->_currentHypothesis;
    v6->_currentHypothesis = (GEORouteHypothesis *)v20;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ValueRefreshTimeStampKey"));
    v6->_valueRefreshTimeStamp = v22;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RouteAttributes"));
    v23 = objc_claimAutoreleasedReturnValue();
    routeAttributes = v6->_routeAttributes;
    v6->_routeAttributes = (GEORouteAttributes *)v23;

  }
  return v6;
}

- (void)commonInit
{
  self->_rowId = -1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UpdatedTimeStampKey"), self->_updatedTimeStamp);
  objc_msgSend(v4, "encodeObject:forKey:", self->_origin, CFSTR("OriginKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_destination, CFSTR("DestinationKey"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[GEORouteHypothesisValue transportType](self, "transportType"), CFSTR("TransportTypeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_arrivalDate, CFSTR("ArrivalDateKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("ExpirationDateKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_prediction, CFSTR("PredictionKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_traits, CFSTR("TraitsKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_monitor, CFSTR("MonitorKey"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ValueRefreshTimeStampKey"), self->_valueRefreshTimeStamp);
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeAttributes, CFSTR("RouteAttributes"));

}

- (BOOL)aggresiveArrivalIsAfterExpiration
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!self->_expirationDate)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D68];
  -[GEORouteHypothesis aggressiveTravelTime](self->_currentHypothesis, "aggressiveTravelTime");
  objc_msgSend(v3, "dateWithTimeIntervalSinceNow:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", self->_expirationDate) == 1;

  return v5;
}

- (BOOL)isStaleToRefresh
{
  double Current;
  double updatedTimeStamp;
  void *v5;
  double v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  GEORouteHypothesisValue *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_currentHypothesis)
  {
    Current = CFAbsoluteTimeGetCurrent();
    updatedTimeStamp = self->_updatedTimeStamp;
    +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hypothesisResponseStaleToRefreshThresholdInSeconds");
    v7 = Current - updatedTimeStamp > v6;

  }
  else
  {
    v7 = 1;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("no");
    if (v7)
      v9 = CFSTR("yes");
    v11 = 138478083;
    v12 = v9;
    v13 = 2113;
    v14 = self;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "isStaleToRefresh: %{private}@ value: %{private}@", (uint8_t *)&v11, 0x16u);
  }

  return v7;
}

- (BOOL)isStaleToPurgeFromDisk
{
  double Current;
  double updatedTimeStamp;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  double v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  GEORouteHypothesisValue *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  updatedTimeStamp = self->_updatedTimeStamp;
  +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hypothesisResponseStaleToPurgeFromDiskThresholdInSeconds");
  v7 = v6;

  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = Current - updatedTimeStamp;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = CFSTR("no");
    if (v9 > v7)
      v10 = CFSTR("yes");
    v12 = 138478083;
    v13 = v10;
    v14 = 2113;
    v15 = self;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "isStaleToPurgeFromDisk: %{private}@ value: %{private}@", (uint8_t *)&v12, 0x16u);
  }

  return v9 > v7;
}

- (BOOL)canBePersistedToDisk
{
  NSObject *v3;
  _BOOL4 v4;
  NSDate *arrivalDate;
  double v6;
  double v7;
  double Current;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  const __CFString *v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  GEORouteHypothesisValue *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_prediction)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138478083;
      v19 = CFSTR("no");
      v20 = 2113;
      v21 = self;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "canBePersistedToDisk: %{private}@ value: %{private}@", (uint8_t *)&v18, 0x16u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    arrivalDate = self->_arrivalDate;
    if (arrivalDate)
    {
      -[NSDate timeIntervalSinceReferenceDate](arrivalDate, "timeIntervalSinceReferenceDate");
      v7 = v6;
      Current = CFAbsoluteTimeGetCurrent();
      -[NSDate timeIntervalSinceReferenceDate](self->_arrivalDate, "timeIntervalSinceReferenceDate");
      v10 = v9;
      v11 = CFAbsoluteTimeGetCurrent();
      +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hypothesisShouldPersistThresholdInSeconds");
      if (v7 - Current >= 0.0)
        v14 = v10 - v11;
      else
        v14 = -(v10 - v11);
      v4 = v14 < v13;

    }
    else
    {
      v4 = 0;
    }
    if (-[GEORouteHypothesisValue aggresiveArrivalIsAfterExpiration](self, "aggresiveArrivalIsAfterExpiration"))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Arrival is after expiration, so we will no longer persist this entry.", (uint8_t *)&v18, 2u);
      }

      v4 = 0;
    }
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v16 = CFSTR("no");
      if (v4)
        v16 = CFSTR("yes");
      v18 = 138478083;
      v19 = v16;
      v20 = 2113;
      v21 = self;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "canBePersistedToDisk: %{private}@ value: %{private}@", (uint8_t *)&v18, 0x16u);
    }
  }

  return v4;
}

- (int)transportType
{
  GEORouteAttributes *routeAttributes;

  routeAttributes = self->_routeAttributes;
  if (routeAttributes)
    return -[GEORouteAttributes mainTransportType](routeAttributes, "mainTransportType");
  else
    return self->_transportType;
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
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOComposedWaypoint latLng](self->_destination, "latLng");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lat");
  v6 = v5;
  -[GEOComposedWaypoint latLng](self->_destination, "latLng");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lng");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", self->_arrivalDate, 1, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GEORouteHypothesisValue transportType](self, "transportType");
  if (v11 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E1C11FC0[(int)v11];
  }
  v13 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_updatedTimeStamp);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringFromDate:dateStyle:timeStyle:", v14, 1, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteHypothesis description](self->_currentHypothesis, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[ Destination: (%f,%f) | Arrival Date: %@ | TransportType: %@ | Updated TimeStamp: %@ | Hypothesis: %@ ]"), v6, v9, v10, v12, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteHypothesisMonitor)monitor
{
  return self->_monitor;
}

- (GEORouteHypothesis)currentHypothesis
{
  return self->_currentHypothesis;
}

- (void)setCurrentHypothesis:(id)a3
{
  objc_storeStrong((id *)&self->_currentHypothesis, a3);
}

- (BOOL)prediction
{
  return self->_prediction;
}

- (void)setPrediction:(BOOL)a3
{
  self->_prediction = a3;
}

- (double)updatedTimeStamp
{
  return self->_updatedTimeStamp;
}

- (void)setUpdatedTimeStamp:(double)a3
{
  self->_updatedTimeStamp = a3;
}

- (GEOComposedWaypoint)origin
{
  return self->_origin;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)valueRefreshTimeStamp
{
  return self->_valueRefreshTimeStamp;
}

- (void)setValueRefreshTimeStamp:(double)a3
{
  self->_valueRefreshTimeStamp = a3;
}

- (int64_t)rowId
{
  return self->_rowId;
}

- (void)setRowId:(int64_t)a3
{
  self->_rowId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_currentHypothesis, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
