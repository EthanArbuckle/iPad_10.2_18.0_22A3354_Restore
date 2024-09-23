@implementation _MNArrivalUpdaterState_Arrived

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_departureTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_MNArrivalUpdaterState_Arrived;
  -[_MNArrivalUpdaterState_Arrived dealloc](&v3, sel_dealloc);
}

- (int64_t)state
{
  return 4;
}

- (void)onEnterState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSTimer *v13;
  NSTimer *departureTimer;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19[2];
  id location;

  v4 = a3;
  -[_MNArrivalUpdaterState sendArrivalInfo](self, "sendArrivalInfo");
  -[_MNArrivalUpdaterState targetLeg](self, "targetLeg");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "legIndex");

  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrivalUpdater:didArriveAtEndOfLegIndex:", v9, v6);

  GEOConfigGetDouble();
  v11 = v10 * 60.0;
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E0C99E88];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47___MNArrivalUpdaterState_Arrived_onEnterState___block_invoke;
  v18[3] = &unk_1E61D1BE0;
  objc_copyWeak(v19, &location);
  v19[1] = v6;
  objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", 0, v18, v11);
  v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  departureTimer = self->_departureTimer;
  self->_departureTimer = v13;

  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startMonitoringForEV");

  -[_MNArrivalUpdaterState details](self, "details");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "evChargingStateMonitor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateForArrival");

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

- (void)updateForLocation
{
  if (!-[_MNArrivalUpdaterState_Arrived _updateForDeparture](self, "_updateForDeparture")
    && !-[_MNArrivalUpdaterState _checkForArrival](self, "_checkForArrival"))
  {
    -[_MNArrivalUpdaterState _updateForSearchingForParking](self, "_updateForSearchingForParking");
  }
}

- (void)updateForEVChargingState:(BOOL)a3
{
  _MNArrivalUpdaterState_None *v3;
  id v4;

  if (!a3)
  {
    -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[_MNArrivalUpdaterState_None initWithDepartureReason:]([_MNArrivalUpdaterState_None alloc], "initWithDepartureReason:", 2);
    objc_msgSend(v4, "changeState:", v3);

  }
}

- (void)updateForEVReachedTargetBatteryCharge
{
  _MNArrivalUpdaterState_None *v2;
  id v3;

  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[_MNArrivalUpdaterState_None initWithDepartureReason:]([_MNArrivalUpdaterState_None alloc], "initWithDepartureReason:", 2);
  objc_msgSend(v3, "changeState:", v2);

}

- (double)parkingDetectionExcludeRadius
{
  void *v2;
  double v3;
  double v4;

  -[_MNArrivalUpdaterState location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "horizontalAccuracy");
  v4 = v3 + 10.0;

  return v4;
}

- (BOOL)_updateForDeparture
{
  _BOOL4 v3;
  void *v4;
  _MNArrivalUpdaterState_None *v5;

  v3 = -[_MNArrivalUpdaterState_Arrived _checkForDeparture](self, "_checkForDeparture");
  if (v3)
  {
    -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_MNArrivalUpdaterState_None initWithDepartureReason:]([_MNArrivalUpdaterState_None alloc], "initWithDepartureReason:", 1);
    objc_msgSend(v4, "changeState:", v5);

  }
  return v3;
}

- (BOOL)_checkForDeparture
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  char v11;
  char v12;
  NSObject *v13;
  MNDepartureUpdater *departureUpdater;
  MNDepartureUpdater *v15;
  MNDepartureUpdater *v16;
  void *v17;
  _DWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_MNArrivalUpdaterState targetLeg](self, "targetLeg");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "legIndex");

  -[_MNArrivalUpdaterState route](self, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") - 1;

  if (v4 == v7)
    goto LABEL_4;
  objc_msgSend(v5, "legs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v4 >= v9)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 67109120;
      v19[1] = v4;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "Checking departure when target leg index is not valid (%d). Allowing departure", (uint8_t *)v19, 8u);
    }

    v12 = 1;
  }
  else
  {
    -[_MNArrivalUpdaterState details](self, "details");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEVCharging");

    if ((v11 & 1) != 0)
    {
LABEL_4:
      v12 = 0;
      goto LABEL_11;
    }
    departureUpdater = self->_departureUpdater;
    if (!departureUpdater)
    {
      v15 = -[MNDepartureUpdater initWithRoute:arrivalLegIndex:]([MNDepartureUpdater alloc], "initWithRoute:arrivalLegIndex:", v5, v4);
      v16 = self->_departureUpdater;
      self->_departureUpdater = v15;

      departureUpdater = self->_departureUpdater;
    }
    -[_MNArrivalUpdaterState location](self, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MNDepartureUpdater allowDepartureForLocation:](departureUpdater, "allowDepartureForLocation:", v17);

  }
LABEL_11:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureTimer, 0);
  objc_storeStrong((id *)&self->_departureUpdater, 0);
}

@end
