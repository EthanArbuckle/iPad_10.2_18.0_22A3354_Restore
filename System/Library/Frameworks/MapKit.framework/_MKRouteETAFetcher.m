@implementation _MKRouteETAFetcher

- (_MKRouteETAFetcher)init
{
  _MKRouteETAFetcher *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *etaResults;
  double v5;
  double v6;
  uint64_t v7;
  MKMapItem *originMapItem;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MKRouteETAFetcher;
  v2 = -[_MKRouteETAFetcher init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    etaResults = v2->_etaResults;
    v2->_etaResults = v3;

    GEOConfigGetDouble();
    v2->_staleDistance = v5;
    GEOConfigGetDouble();
    v2->_staleTimeInterval = v6;
    +[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation");
    v7 = objc_claimAutoreleasedReturnValue();
    originMapItem = v2->_originMapItem;
    v2->_originMapItem = (MKMapItem *)v7;

    v2->_lastUpdatedETAOriginCoordinate = (CLLocationCoordinate2D)MKCoordinateInvalid;
  }
  return v2;
}

- (void)dealloc
{
  MKDirections *inProgressETAUpdate;
  objc_super v4;

  -[MKDirections cancel](self->_inProgressETAUpdate, "cancel");
  inProgressETAUpdate = self->_inProgressETAUpdate;
  self->_inProgressETAUpdate = 0;

  v4.receiver = self;
  v4.super_class = (Class)_MKRouteETAFetcher;
  -[_MKRouteETAFetcher dealloc](&v4, sel_dealloc);
}

- (void)setAutomobileOptions:(id)a3
{
  GEOAutomobileOptions *v4;
  GEOAutomobileOptions *automobileOptions;
  char v6;
  GEOAutomobileOptions *v7;
  GEOAutomobileOptions *v8;
  GEOAutomobileOptions *v9;

  v4 = (GEOAutomobileOptions *)a3;
  automobileOptions = self->_automobileOptions;
  if (automobileOptions != v4)
  {
    v9 = v4;
    v6 = -[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (GEOAutomobileOptions *)-[GEOAutomobileOptions copy](v9, "copy");
      v8 = self->_automobileOptions;
      self->_automobileOptions = v7;

      -[_MKRouteETAFetcher invalidateETAForTransportType:](self, "invalidateETAForTransportType:", 1);
      v4 = v9;
      self->_optionsHaveChangedSinceLastUpdate = 1;
    }
  }

}

- (void)setWalkingOptions:(id)a3
{
  GEOWalkingOptions *v4;
  GEOWalkingOptions *walkingOptions;
  char v6;
  GEOWalkingOptions *v7;
  GEOWalkingOptions *v8;
  GEOWalkingOptions *v9;

  v4 = (GEOWalkingOptions *)a3;
  walkingOptions = self->_walkingOptions;
  if (walkingOptions != v4)
  {
    v9 = v4;
    v6 = -[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (GEOWalkingOptions *)-[GEOWalkingOptions copy](v9, "copy");
      v8 = self->_walkingOptions;
      self->_walkingOptions = v7;

      -[_MKRouteETAFetcher invalidateETAForTransportType:](self, "invalidateETAForTransportType:", 2);
      v4 = v9;
      self->_optionsHaveChangedSinceLastUpdate = 1;
    }
  }

}

- (void)setTransitOptions:(id)a3
{
  GEOTransitOptions *v4;
  GEOTransitOptions *transitOptions;
  char v6;
  GEOTransitOptions *v7;
  GEOTransitOptions *v8;
  GEOTransitOptions *v9;

  v4 = (GEOTransitOptions *)a3;
  transitOptions = self->_transitOptions;
  if (transitOptions != v4)
  {
    v9 = v4;
    v6 = -[GEOTransitOptions isEqual:](transitOptions, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (GEOTransitOptions *)-[GEOTransitOptions copy](v9, "copy");
      v8 = self->_transitOptions;
      self->_transitOptions = v7;

      -[_MKRouteETAFetcher invalidateETAForTransportType:](self, "invalidateETAForTransportType:", 4);
      v4 = v9;
      self->_optionsHaveChangedSinceLastUpdate = 1;
    }
  }

}

- (void)setCyclingOptions:(id)a3
{
  GEOCyclingOptions *v4;
  GEOCyclingOptions *cyclingOptions;
  char v6;
  GEOCyclingOptions *v7;
  GEOCyclingOptions *v8;
  GEOCyclingOptions *v9;

  v4 = (GEOCyclingOptions *)a3;
  cyclingOptions = self->_cyclingOptions;
  if (cyclingOptions != v4)
  {
    v9 = v4;
    v6 = -[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (GEOCyclingOptions *)-[GEOCyclingOptions copy](v9, "copy");
      v8 = self->_cyclingOptions;
      self->_cyclingOptions = v7;

      -[_MKRouteETAFetcher invalidateETAForTransportType:](self, "invalidateETAForTransportType:", 8);
      v4 = v9;
      self->_optionsHaveChangedSinceLastUpdate = 1;
    }
  }

}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;

  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    -[_MKRouteETAFetcher _resetState](self, "_resetState");
    v5 = v6;
  }

}

- (void)setOriginMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;

  v5 = (MKMapItem *)a3;
  if (self->_originMapItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_originMapItem, a3);
    -[_MKRouteETAFetcher _resetState](self, "_resetState");
    v5 = v6;
  }

}

- (void)_resetState
{
  MKDirections *inProgressETAUpdate;

  self->_lastETAUpdateHadError = 0;
  -[NSMutableDictionary removeAllObjects](self->_etaResults, "removeAllObjects");
  -[MKDirections cancel](self->_inProgressETAUpdate, "cancel");
  inProgressETAUpdate = self->_inProgressETAUpdate;
  self->_inProgressETAUpdate = 0;

  self->_lastUpdatedETATime = 0.0;
  self->_lastRequestTime = 0.0;
  self->_lastUpdatedETAOriginCoordinate = (CLLocationCoordinate2D)MKCoordinateInvalid;
  self->_optionsHaveChangedSinceLastUpdate = 0;
}

- (id)routeETAForTransportType:(unint64_t)a3
{
  NSMutableDictionary *etaResults;
  void *v4;
  void *v5;

  etaResults = self->_etaResults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](etaResults, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)requestNewETAForTransportType:(unint64_t)a3 additionalTransportTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  MKDirectionsRequest *v10;
  MKMapItem *originMapItem;
  MKMapItem *mapItem;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  MKMapItem *v18;
  MKDirections *v19;
  MKDirections *inProgressETAUpdate;
  MKDirections *v21;
  MKMapItem *v22;
  uint64_t v23;
  _QWORD v24[5];
  MKMapItem *v25;
  id v26;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = [MKDirectionsRequest alloc];
    mapItem = self->_mapItem;
    originMapItem = self->_originMapItem;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v23) = 256;
    v14 = -[MKDirectionsRequest _mapkit_initWithSource:destination:transportType:departureDate:includeTravelTimes:includeTrafficIncidents:includeRoutePoints:resolveExtraAutomobileOptions:](v10, "_mapkit_initWithSource:destination:transportType:departureDate:includeTravelTimes:includeTrafficIncidents:includeRoutePoints:resolveExtraAutomobileOptions:", originMapItem, mapItem, a3, v13, 1, 0, v23);

    objc_msgSend(v14, "_setIncludeDistanceInETA:", 1);
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v14, "_setAdditionalTransportTypesRequested:", v8);
    if (a3 == 1 || objc_msgSend(v8, "containsObject:", &unk_1E2158D58))
    {
      -[_MKRouteETAFetcher automobileOptions](self, "automobileOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setAutomobileOptions:", v15);

    }
    if (a3 == 4 || objc_msgSend(v8, "containsObject:", &unk_1E2158D70))
    {
      -[_MKRouteETAFetcher transitOptions](self, "transitOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setTransitOptions:", v16);

    }
    if (a3 == 8 || objc_msgSend(v8, "containsObject:", &unk_1E2158D88))
    {
      -[_MKRouteETAFetcher cyclingOptions](self, "cyclingOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setCyclingOptions:", v17);

    }
    v18 = self->_mapItem;
    -[MKDirections cancel](self->_inProgressETAUpdate, "cancel");
    v19 = -[MKDirections initWithRequest:]([MKDirections alloc], "initWithRequest:", v14);
    inProgressETAUpdate = self->_inProgressETAUpdate;
    self->_inProgressETAUpdate = v19;

    self->_lastRequestTime = CFAbsoluteTimeGetCurrent();
    self->_optionsHaveChangedSinceLastUpdate = 0;
    v21 = self->_inProgressETAUpdate;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88___MKRouteETAFetcher_requestNewETAForTransportType_additionalTransportTypes_completion___block_invoke;
    v24[3] = &unk_1E20DC118;
    v24[4] = self;
    v25 = v18;
    v26 = v9;
    v22 = v18;
    -[MKDirections calculateETAWithCompletionHandler:](v21, "calculateETAWithCompletionHandler:", v24);

  }
}

- (BOOL)isUsingCurrentLocationForOrigin
{
  void *v2;
  char v3;

  -[_MKRouteETAFetcher originMapItem](self, "originMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentLocation");

  return v3;
}

- (CLLocationCoordinate2D)originCoordinate
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  CLLocationCoordinate2D result;

  if (-[_MKRouteETAFetcher isUsingCurrentLocationForOrigin](self, "isUsingCurrentLocationForOrigin"))
  {
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasLocation"))
    {
      +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastLocation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coordinate");
      v7 = v6;
      v9 = v8;

    }
    else
    {
      v9 = 0xC066800000000000;
      v7 = 0xC066800000000000;
    }

  }
  else
  {
    -[MKMapItem _coordinate](self->_originMapItem, "_coordinate");
    v7 = v10;
    v9 = v11;
  }
  v12 = *(double *)&v7;
  v13 = *(double *)&v9;
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (CLLocationCoordinate2D)destinationCoordinate
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  CLLocationCoordinate2D result;

  if (-[MKMapItem isCurrentLocation](self->_mapItem, "isCurrentLocation"))
  {
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasLocation"))
    {
      +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastLocation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coordinate");
      v7 = v6;
      v9 = v8;

    }
    else
    {
      v9 = 0xC066800000000000;
      v7 = 0xC066800000000000;
    }

  }
  else
  {
    -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
    v7 = v10;
    v9 = v11;
  }
  v12 = *(double *)&v7;
  v13 = *(double *)&v9;
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (BOOL)shouldUpdateEstimatedTravelTimeForNewOrigin:(CLLocationCoordinate2D)a3
{
  double latitude;
  BOOL result;
  double longitude;
  double v7;
  double v9;
  double v10;
  double v11;

  latitude = a3.latitude;
  result = 1;
  if (self->_lastRequestTime != 0.0 && !self->_optionsHaveChangedSinceLastUpdate)
  {
    longitude = a3.longitude;
    v7 = CFAbsoluteTimeGetCurrent() - self->_lastRequestTime;
    if (!(self->_lastETAUpdateHadError ? v7 >= 300.0 : v7 >= 60.0))
      return 0;
    if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
    {
      v9 = self->_lastUpdatedETAOriginCoordinate.longitude;
      if (v9 >= -180.0 && v9 <= 180.0)
      {
        v10 = self->_lastUpdatedETAOriginCoordinate.latitude;
        if (v10 >= -90.0 && v10 <= 90.0)
        {
          GEOCalculateDistance();
          if (v11 < 1.0)
            return 0;
        }
      }
    }
  }
  return result;
}

- (void)expireETAsIfNoLongerValid
{
  double v3;
  double v4;
  double longitude;
  double latitude;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_MKRouteETAFetcher originCoordinate](self, "originCoordinate");
  if (v4 < -180.0
    || v4 > 180.0
    || v3 < -90.0
    || v3 > 90.0
    || (longitude = self->_lastUpdatedETAOriginCoordinate.longitude, longitude < -180.0)
    || longitude > 180.0
    || (latitude = self->_lastUpdatedETAOriginCoordinate.latitude, latitude < -90.0)
    || latitude > 90.0
    || (GEOCalculateDistance(), v7 > self->_staleDistance))
  {
    -[NSMutableDictionary removeAllObjects](self->_etaResults, "removeAllObjects");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allKeys](self->_etaResults, "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_etaResults, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[_MKRouteETAFetcher isValidETA:](self, "isValidETA:", v14))
          -[NSMutableDictionary removeObjectForKey:](self->_etaResults, "removeObjectForKey:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (BOOL)isValidETA:(id)a3
{
  id v4;
  double Current;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v4, "responseTime");
  v10 = 0;
  if (Current - v6 <= self->_staleTimeInterval)
  {
    objc_msgSend(v4, "travelTime");
    if (v7 >= 1.0 || (v8 = CFAbsoluteTimeGetCurrent(), objc_msgSend(v4, "responseTime"), v8 - v9 <= 300.0))
      v10 = 1;
  }

  return v10;
}

- (void)invalidateETAForTransportType:(unint64_t)a3
{
  NSMutableDictionary *etaResults;
  id v4;

  etaResults = self->_etaResults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](etaResults, "removeObjectForKey:", v4);

}

- (void)_didUpdateETAResult
{
  CLLocationDegrees v3;
  CLLocationDegrees v4;
  double Current;

  -[_MKRouteETAFetcher originCoordinate](self, "originCoordinate");
  self->_lastUpdatedETAOriginCoordinate.latitude = v3;
  self->_lastUpdatedETAOriginCoordinate.longitude = v4;
  Current = CFAbsoluteTimeGetCurrent();
  self->_lastUpdatedETATime = Current;
  self->_lastRequestTime = Current;
}

- (NSMutableDictionary)etaResults
{
  return self->_etaResults;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MKMapItem)originMapItem
{
  return self->_originMapItem;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_originMapItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_inProgressETAUpdate, 0);
  objc_storeStrong((id *)&self->_etaResults, 0);
}

@end
