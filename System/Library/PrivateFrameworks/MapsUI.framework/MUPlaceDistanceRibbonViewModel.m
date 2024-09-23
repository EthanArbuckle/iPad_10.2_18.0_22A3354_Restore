@implementation MUPlaceDistanceRibbonViewModel

- (MUPlaceDistanceRibbonViewModel)initWithMapItem:(id)a3 etaProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MUPlaceDistanceRibbonViewModel *v10;
  MUPlaceDistanceRibbonViewModel *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CLLocationDegrees v16;
  void *v17;
  CLLocationDegrees v18;
  CLLocationCoordinate2D v19;
  double latitude;
  double longitude;
  MUPlaceDistanceRibbonViewModel *v22;
  uint64_t v23;
  MUPlaceRibbonItemViewModel *crowsDistanceViewModel;
  void *v25;
  id v26;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isAuthorizedForPreciseLocation") && objc_msgSend(v9, "hasLocation"))
  {
    v28.receiver = self;
    v28.super_class = (Class)MUPlaceDistanceRibbonViewModel;
    v10 = -[MUPlaceDistanceRibbonViewModel init](&v28, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_mapItem, a3);
      objc_msgSend(v9, "currentLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "latLng");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lat");
        v16 = v15;
        objc_msgSend(v13, "latLng");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lng");
        v19 = CLLocationCoordinate2DMake(v16, v18);
        latitude = v19.latitude;
        longitude = v19.longitude;

      }
      else
      {
        latitude = *MEMORY[0x1E0C9E500];
        longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
      }
      +[MUPlaceRibbonItemViewModel distanceFromCurrentLocationItemViewModelForMapItem:currentLocationCoordinate:](MUPlaceRibbonItemViewModel, "distanceFromCurrentLocationItemViewModelForMapItem:currentLocationCoordinate:", v11->_mapItem, latitude, longitude);
      v23 = objc_claimAutoreleasedReturnValue();
      crowsDistanceViewModel = v11->_crowsDistanceViewModel;
      v11->_crowsDistanceViewModel = (MUPlaceRibbonItemViewModel *)v23;

      -[MUPlaceRibbonItemViewModel typeStringForAX](v11->_crowsDistanceViewModel, "typeStringForAX");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceRibbonItemViewModel setTypeStringForAX:](v11, "setTypeStringForAX:", v25);

      v26 = objc_storeWeak((id *)&v11->_etaProvider, v8);
      objc_msgSend(v8, "addObserver:", v11);

    }
    self = v11;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_etaProvider);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MUPlaceDistanceRibbonViewModel;
  -[MUPlaceDistanceRibbonViewModel dealloc](&v4, sel_dealloc);
}

- (void)ETAProviderUpdated:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  MUPlaceRibbonItemViewModel *v7;
  MUPlaceRibbonItemViewModel *crowsDistanceViewModel;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "distanceString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v11, "distanceString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceRibbonItemViewModel distanceFromCurrentLocationItemViewModelForDistanceString:](MUPlaceRibbonItemViewModel, "distanceFromCurrentLocationItemViewModelForDistanceString:", v6);
    v7 = (MUPlaceRibbonItemViewModel *)objc_claimAutoreleasedReturnValue();
    crowsDistanceViewModel = self->_crowsDistanceViewModel;
    self->_crowsDistanceViewModel = v7;

    -[MUPlaceRibbonItemViewModel typeStringForAX](self->_crowsDistanceViewModel, "typeStringForAX");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceRibbonItemViewModel setTypeStringForAX:](self, "setTypeStringForAX:", v9);

    -[MUPlaceRibbonItemViewModel updateDelegate](self, "updateDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ribbonItemViewModelDidUpdate:", self);

  }
}

- (id)titleStringProvider
{
  return -[MUPlaceRibbonItemViewModel titleStringProvider](self->_crowsDistanceViewModel, "titleStringProvider");
}

- (id)valueStringProvider
{
  return -[MUPlaceRibbonItemViewModel valueStringProvider](self->_crowsDistanceViewModel, "valueStringProvider");
}

- (id)typeStringForAX
{
  return CFSTR("Distance");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crowsDistanceViewModel, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_etaProvider);
}

@end
