@implementation GEORouteHypothesisMonitorTransit

- (void)_recalculateETAWithRouteMatch:(id)a3
{
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSDate *arrivalDate;
  void *v13;
  NSObject *v14;
  int v15;
  NSDate *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[GEOComposedRoute startDate](self->super._route, "startDate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDate timeIntervalSinceDate:](self->super._arrivalDate, "timeIntervalSinceDate:", v4);
    v6 = v5;
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      -[GEOComposedRoute startDate](self->super._route, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-[GEOComposedRoute expectedTime](self->super._route, "expectedTime"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        arrivalDate = self->super._arrivalDate;
        _navd_debugDurationAsString(v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138478595;
        v16 = arrivalDate;
        v17 = 2113;
        v18 = v4;
        v19 = 2113;
        v20 = v13;
        v21 = 2113;
        v22 = v10;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Updating transit ETA. Event Date: %{private}@, Start Date: %{private}@, Travel time: %{private}@, Arrival Date: %{private}@", (uint8_t *)&v15, 0x2Au);

      }
    }
    -[GEORouteHypothesis _setError:](self->super._hypothesis, "_setError:", 0);
    -[GEORouteHypothesis _updateDepartureAndArrivalSuggestionsForArrivalDate:travelTimeWithTraffic:conservativeTravelTime:aggressiveTravelTime:transportType:](self->super._hypothesis, "_updateDepartureAndArrivalSuggestionsForArrivalDate:travelTimeWithTraffic:conservativeTravelTime:aggressiveTravelTime:transportType:", self->super._arrivalDate, -[GEOComposedRoute transportType](self->super._route, "transportType"), v6, v6, v6);
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Updating transit ETA but we did not get a start date for the route.", (uint8_t *)&v15, 2u);
    }

    -[GEORouteHypothesis _clearHypothesisAndSetErrorWithCode:](self->super._hypothesis, "_clearHypothesisAndSetErrorWithCode:", -11);
  }

}

- (void)checkRouteForLocation:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->super._route)
  {
    self->super._needReroute = 1;
    v6 = v5;
    objc_storeStrong((id *)&self->super._lastMatchedLocation, a3);
    v5 = v6;
  }

}

- (id)routeName
{
  GEOComposedRoute *route;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  route = self->super._route;
  if (route)
  {
    if (-[GEOComposedRoute isWalkingOnlyTransitRoute](route, "isWalkingOnlyTransitRoute"))
    {
      -[GEOComposedRoute name](self->super._route, "name");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (serverFormattedStringFormatter
           && (-[GEOComposedRoute transitDescriptionFormatString](self->super._route, "transitDescriptionFormatString"),
               v5 = (void *)objc_claimAutoreleasedReturnValue(),
               v5,
               v5))
    {
      v6 = (void *)serverFormattedStringFormatter;
      -[GEOComposedRoute transitDescriptionFormatString](self->super._route, "transitDescriptionFormatString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringForServerFormattedString:", v7);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = CFSTR("by transit");
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
