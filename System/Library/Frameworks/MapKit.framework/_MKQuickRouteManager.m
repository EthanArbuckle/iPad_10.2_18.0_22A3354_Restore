@implementation _MKQuickRouteManager

- (_MKQuickRouteManager)init
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _MKRouteETAFetcher *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKQuickRouteManager;
  v2 = -[_MKQuickRouteManager init](&v8, sel_init);
  if (v2)
  {
    GEOConfigGetDouble();
    *((_QWORD *)v2 + 5) = v3;
    GEOConfigGetDouble();
    *((_QWORD *)v2 + 6) = v4;
    *(_OWORD *)(v2 + 88) = MKCoordinateInvalid;
    v5 = objc_alloc_init(_MKRouteETAFetcher);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

  }
  return (_MKQuickRouteManager *)v2;
}

- (double)_maxDistanceToRequestETA
{
  double result;

  if (self->_allowsDistantETA)
    return 0.0;
  objc_msgSend((id)objc_opt_class(), "_maxDistanceToRequestLikelyETA");
  return result;
}

+ (double)_maxDistanceToRequestLikelyETA
{
  double result;

  GEOConfigGetDouble();
  return result;
}

+ (BOOL)isLikelyToReturnETAForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "_maxDistanceToRequestLikelyETA");
    v8 = v7;
    objc_msgSend(v6, "coordinate");
    objc_msgSend(v4, "_coordinate");
    GEOCalculateDistance();
    v10 = v9 < v8 && v9 > 1.0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_MKQuickRouteManager mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: name=%@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_performWithTransportType:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  MKQuickRouteManagerDelegate **p_delegate;
  id WeakRetained;
  char v15;
  id v16;
  void (**v17)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v17 = v4;
    -[_MKQuickRouteManager transportTypeFinder](self, "transportTypeFinder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_MKQuickRouteManager transportTypeFinder](self, "transportTypeFinder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKQuickRouteManager originCoordinate](self, "originCoordinate");
      v8 = v7;
      v10 = v9;
      -[_MKQuickRouteManager destinationCoordinate](self, "destinationCoordinate");
      objc_msgSend(v6, "findDirectionsTypeForOriginCoordinate:destinationCoordinate:handler:", v17, v8, v10, v11, v12);

    }
    else
    {
      p_delegate = &self->_delegate;
      WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v16 = objc_loadWeakRetained((id *)p_delegate);
        v17[2](v17, objc_msgSend(v16, "preferredDirectionsTypeForQuickRoute"));

      }
      else
      {
        v17[2](v17, 1);
      }
    }
    v4 = v17;
  }

}

- (BOOL)_transportTypeShouldBeSmart
{
  void *v2;
  BOOL v3;

  -[_MKQuickRouteManager transportTypeFinder](self, "transportTypeFinder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (GEOAutomobileOptions)automobileOptions
{
  return -[_MKRouteETAFetcher automobileOptions](self->_etaFetcher, "automobileOptions");
}

- (void)setAutomobileOptions:(id)a3
{
  -[_MKRouteETAFetcher setAutomobileOptions:](self->_etaFetcher, "setAutomobileOptions:", a3);
}

- (GEOWalkingOptions)walkingOptions
{
  return -[_MKRouteETAFetcher walkingOptions](self->_etaFetcher, "walkingOptions");
}

- (void)setWalkingOptions:(id)a3
{
  -[_MKRouteETAFetcher setWalkingOptions:](self->_etaFetcher, "setWalkingOptions:", a3);
}

- (GEOTransitOptions)transitOptions
{
  return -[_MKRouteETAFetcher transitOptions](self->_etaFetcher, "transitOptions");
}

- (void)setTransitOptions:(id)a3
{
  -[_MKRouteETAFetcher setTransitOptions:](self->_etaFetcher, "setTransitOptions:", a3);
}

- (GEOCyclingOptions)cyclingOptions
{
  return -[_MKRouteETAFetcher cyclingOptions](self->_etaFetcher, "cyclingOptions");
}

- (void)setCyclingOptions:(id)a3
{
  -[_MKRouteETAFetcher setCyclingOptions:](self->_etaFetcher, "setCyclingOptions:", a3);
}

- (MKMapItem)mapItem
{
  return -[_MKRouteETAFetcher mapItem](self->_etaFetcher, "mapItem");
}

- (void)setMapItem:(id)a3
{
  id v4;
  void *v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  id v8;

  v8 = a3;
  -[_MKRouteETAFetcher mapItem](self->_etaFetcher, "mapItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    -[_MKRouteETAFetcher setMapItem:](self->_etaFetcher, "setMapItem:", v8);
    if (v8)
    {
      objc_msgSend(v8, "_coordinate");
      self->_coordinate.latitude = v6;
      self->_coordinate.longitude = v7;
    }
    else
    {
      self->_coordinate = (CLLocationCoordinate2D)MKCoordinateInvalid;
    }
    -[_MKQuickRouteManager _resetState](self, "_resetState");
    v5 = v8;
  }

}

- (void)setFetchAllTransportTypes:(BOOL)a3
{
  if (self->_fetchAllTransportTypes != a3)
  {
    self->_fetchAllTransportTypes = a3;
    -[_MKQuickRouteManager _resetState](self, "_resetState");
  }
}

- (void)setAllowsDistantETA:(BOOL)a3
{
  if (self->_allowsDistantETA != a3)
  {
    self->_allowsDistantETA = a3;
    -[_MKQuickRouteManager _resetState](self, "_resetState");
  }
}

- (void)setView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_view, obj);
    v5 = obj;
    self->_viewHasChangedSinceLastUpdate = 1;
  }

}

- (MKMapItem)originMapItem
{
  return -[_MKRouteETAFetcher originMapItem](self->_etaFetcher, "originMapItem");
}

- (void)setOriginMapItem:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[_MKRouteETAFetcher originMapItem](self->_etaFetcher, "originMapItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[_MKQuickRouteManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("usingCurrentLocationForOrigin"));
    -[_MKRouteETAFetcher setOriginMapItem:](self->_etaFetcher, "setOriginMapItem:", v5);
    -[_MKQuickRouteManager _resetState](self, "_resetState");
    -[_MKQuickRouteManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("usingCurrentLocationForOrigin"));
  }

}

- (void)_resetState
{
  _MKRouteETA *lastETA;

  lastETA = self->_lastETA;
  self->_lastETA = 0;

  self->_lastPreferredDirectionsType = 0;
  -[_MKRouteETAFetcher _resetState](self->_etaFetcher, "_resetState");
}

- (id)routeETAForTransportType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateETA
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33___MKQuickRouteManager_updateETA__block_invoke;
  v2[3] = &unk_1E20DC168;
  v2[4] = self;
  -[_MKQuickRouteManager _performWithTransportType:](self, "_performWithTransportType:", v2);
}

- (void)requestNewETAForPreferredTransportType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _MKRouteETAFetcher *etaFetcher;
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = v7;
  if (self->_fetchAllTransportTypes)
  {
    if (a3 != 1)
    {
      objc_msgSend(v7, "addObject:", &unk_1E2158D58);
      if (a3 == 4)
      {
        objc_msgSend(v8, "addObject:", &unk_1E2158DA0);
LABEL_9:
        v11 = &unk_1E2158D88;
LABEL_16:
        objc_msgSend(v8, "addObject:", v11);
        goto LABEL_17;
      }
    }
    -[_MKQuickRouteManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "quickRouteShouldIncludeTransitWhenNotPreferredTransportType");

    if (v10)
      objc_msgSend(v8, "addObject:", &unk_1E2158D70);
    if (a3 == 2)
      goto LABEL_9;
    objc_msgSend(v8, "addObject:", &unk_1E2158DA0);
    if (a3 != 8)
      goto LABEL_9;
  }
  else
  {
    if (a3 == 4)
      goto LABEL_14;
    if (a3 == 2)
    {
      v11 = &unk_1E2158D58;
      goto LABEL_16;
    }
    if (a3 == 1 && !-[_MKQuickRouteManager isOnlyDriving](self, "isOnlyDriving"))
    {
LABEL_14:
      v11 = &unk_1E2158DA0;
      goto LABEL_16;
    }
  }
LABEL_17:
  etaFetcher = self->_etaFetcher;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74___MKQuickRouteManager_requestNewETAForPreferredTransportType_completion___block_invoke;
  v14[3] = &unk_1E20DC190;
  v15 = v6;
  v16 = a3;
  v14[4] = self;
  v13 = v6;
  -[_MKRouteETAFetcher requestNewETAForTransportType:additionalTransportTypes:completion:](etaFetcher, "requestNewETAForTransportType:additionalTransportTypes:completion:", a3, v8, v14);

}

- (BOOL)isUsingCurrentLocationForOrigin
{
  void *v2;
  char v3;

  -[_MKQuickRouteManager originMapItem](self, "originMapItem");
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

  if (-[_MKQuickRouteManager isUsingCurrentLocationForOrigin](self, "isUsingCurrentLocationForOrigin"))
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
    -[_MKQuickRouteManager originMapItem](self, "originMapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_coordinate");
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
  double v5;
  CLLocationDegrees latitude;
  double v7;
  CLLocationDegrees longitude;
  double v9;
  double v10;
  CLLocationCoordinate2D result;

  -[_MKQuickRouteManager mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_MKQuickRouteManager mapItem](self, "mapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_coordinate");
    latitude = v5;
    longitude = v7;

  }
  else
  {
    latitude = self->_coordinate.latitude;
    longitude = self->_coordinate.longitude;
  }
  v9 = latitude;
  v10 = longitude;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (id)bestETAForPreferredDirectionsType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;

  -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    if (-[_MKQuickRouteManager isOnlyDriving](self, "isOnlyDriving"))
    {
LABEL_3:
      -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = &unk_1E2158DB8;
LABEL_4:
      objc_msgSend(v7, "objectForKeyedSubscript:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = 0;
    }
    else
    {
      v8 = 0;
      v13 = a3 - 1;
      v11 = 0;
      switch(v13)
      {
        case 0uLL:
          -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E2158DB8);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!-[_MKQuickRouteManager _transportTypeShouldBeSmart](self, "_transportTypeShouldBeSmart"))
            goto LABEL_23;
          -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", &unk_1E2158DD0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
            goto LABEL_27;
          goto LABEL_25;
        case 1uLL:
          -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", &unk_1E2158DD0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!-[_MKQuickRouteManager _transportTypeShouldBeSmart](self, "_transportTypeShouldBeSmart"))
            goto LABEL_23;
          if (!v8)
            goto LABEL_3;
          objc_msgSend(v8, "distance");
          if (v17 > self->_maxWalkingDistance)
          {
            -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E2158DB8);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = v19;
              goto LABEL_28;
            }
          }
LABEL_23:
          v11 = 0;
          goto LABEL_6;
        case 2uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
          goto LABEL_6;
        case 3uLL:
          -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", &unk_1E2158DE8);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!-[_MKQuickRouteManager _transportTypeShouldBeSmart](self, "_transportTypeShouldBeSmart"))
            goto LABEL_23;
          -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", &unk_1E2158DD0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8 || !v11)
          {
LABEL_25:
            if (!v11)
              goto LABEL_6;
          }
          else
          {
            objc_msgSend(v11, "distance");
            if (v23 <= self->_maxWalkingDistance)
              goto LABEL_27;
          }
          objc_msgSend(v11, "travelTime");
          if (v24 >= self->_closeWalkTravelTime)
            goto LABEL_6;
LABEL_27:
          v20 = v11;
LABEL_28:
          v10 = (uint64_t)v20;
          v11 = v20;
          break;
        case 7uLL:
          -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v9 = &unk_1E2158E00;
          goto LABEL_4;
        default:
          v11 = 0;
          goto LABEL_6;
      }
    }

    v8 = (void *)v10;
LABEL_6:

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (unint64_t)directionsTypeForMapType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[_MKQuickRouteManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preferredDirectionsTypeForQuickRoute");

  if (a3 == 104)
    return 4;
  -[_MKQuickRouteManager originCoordinate](self, "originCoordinate");
  v9 = v8;
  v11 = v10;
  -[_MKQuickRouteManager destinationCoordinate](self, "destinationCoordinate");
  return -[_MKQuickRouteManager directionsTypeForOriginCoordinate:destinationCoordinate:preferredDirectionsType:](self, "directionsTypeForOriginCoordinate:destinationCoordinate:preferredDirectionsType:", v6, v9, v11, v12, v13);
}

- (unint64_t)directionsTypeForOriginCoordinate:(CLLocationCoordinate2D)a3 destinationCoordinate:(CLLocationCoordinate2D)a4 preferredDirectionsType:(unint64_t)a5
{
  if (a3.longitude < -180.0
    || a3.longitude > 180.0
    || a3.latitude < -90.0
    || a3.latitude > 90.0
    || a4.longitude < -180.0
    || a4.longitude > 180.0
    || a4.latitude < -90.0
    || a4.latitude > 90.0)
  {
    return a5;
  }
  GEOCalculateDistance();
  return -[_MKQuickRouteManager guessTransportTypeForDistance:preferredDirectionsType:](self, "guessTransportTypeForDistance:preferredDirectionsType:", a5);
}

- (unint64_t)guessTransportTypeForDistance:(double)a3 preferredDirectionsType:(unint64_t)a4
{
  double maxWalkingDistance;
  double closeWalkTravelTime;
  double v9;

  closeWalkTravelTime = self->_closeWalkTravelTime;
  maxWalkingDistance = self->_maxWalkingDistance;
  if (-[_MKQuickRouteManager isOnlyDriving](self, "isOnlyDriving"))
    return 1;
  v9 = closeWalkTravelTime * 1.25;
  if (a4 == 4)
  {
    if (v9 <= a3)
      return 4;
    return 2;
  }
  if (a4 != 2)
  {
    if (a4 != 1)
      return a4;
    if (v9 <= a3)
      return 1;
    return 2;
  }
  if (maxWalkingDistance < a3)
    return 1;
  else
    return 2;
}

- (BOOL)haveETAsForPreferredTransportType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  v8 = objc_msgSend((id)objc_opt_class(), "counterpartForTransportType:", a3);
  -[_MKRouteETAFetcher etaResults](self->_etaFetcher, "etaResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 != 0;

  return v12;
}

+ (unint64_t)counterpartForTransportType:(unint64_t)a3
{
  if ((a3 - 1) > 7)
    return 1;
  else
    return qword_18B2AA2E8[(int)a3 - 1];
}

- (BOOL)isOnlyDriving
{
  void *v2;
  char v3;

  -[_MKQuickRouteManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "quickRouteShouldOnlyUseAutomobile");

  return v3;
}

+ (unint64_t)directionsTypeForMapItem:(id)a3 delegate:(id)a4 mapType:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setMapItem:", v9);

  objc_msgSend(v10, "setDelegate:", v8);
  v11 = objc_msgSend(v10, "directionsTypeForMapType:", a5);

  return v11;
}

- (MKQuickRouteManagerDelegate)delegate
{
  return (MKQuickRouteManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKQuickRouteTransportTypeFinding)transportTypeFinder
{
  return (MKQuickRouteTransportTypeFinding *)objc_loadWeakRetained((id *)&self->_transportTypeFinder);
}

- (void)setTransportTypeFinder:(id)a3
{
  objc_storeWeak((id *)&self->_transportTypeFinder, a3);
}

- (MKQuickRouteConfigurableView)view
{
  return (MKQuickRouteConfigurableView *)objc_loadWeakRetained((id *)&self->_view);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (BOOL)fetchAllTransportTypes
{
  return self->_fetchAllTransportTypes;
}

- (BOOL)allowsDistantETA
{
  return self->_allowsDistantETA;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_transportTypeFinder);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastETA, 0);
  objc_storeStrong((id *)&self->_etaFetcher, 0);
}

@end
