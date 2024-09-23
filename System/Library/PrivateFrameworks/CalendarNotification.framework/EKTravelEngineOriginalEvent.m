@implementation EKTravelEngineOriginalEvent

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc(MEMORY[0x24BE13F90]);
  v12.receiver = self;
  v12.super_class = (Class)EKTravelEngineOriginalEvent;
  -[EKTravelEngineOriginalEvent description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  -[EKTravelEngineOriginalEvent eventExternalURL](self, "eventExternalURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("eventExternalURL"), v6);

  -[EKTravelEngineOriginalEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withDate:", CFSTR("startDate"), v7);

  -[EKTravelEngineOriginalEvent endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withDate:", CFSTR("endDate"), v8);

  -[EKTravelEngineOriginalEvent locationString](self, "locationString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("locationString"), v9);

  objc_msgSend(v5, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqualToOriginalEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  _BOOL4 v30;
  int v31;

  v4 = a3;
  if (!v4)
    goto LABEL_25;
  -[EKTravelEngineOriginalEvent geoLocation](self, "geoLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geoLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = __54__EKTravelEngineOriginalEvent_isEqualToOriginalEvent___block_invoke_3((uint64_t)v6, v5, v6);

  if (v7)
    goto LABEL_25;
  v8 = -[EKTravelEngineOriginalEvent transportTypeOverride](self, "transportTypeOverride");
  if (v8 != objc_msgSend(v4, "transportTypeOverride"))
    goto LABEL_25;
  -[EKTravelEngineOriginalEvent endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    v12 = objc_msgSend(v9, "isEqualToDate:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_25;
  }
  else
  {

    if (v11)
      goto LABEL_25;
  }
  -[EKTravelEngineOriginalEvent locationString](self, "locationString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    v16 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_25;
  }
  else
  {

    if (v15)
      goto LABEL_25;
  }
  -[EKTravelEngineOriginalEvent locationMapKitHandle](self, "locationMapKitHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationMapKitHandle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    v20 = objc_msgSend(v17, "isEqualToData:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_25;
  }
  else
  {

    if (v19)
      goto LABEL_25;
  }
  -[EKTravelEngineOriginalEvent startDate](self, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21)
  {
    v24 = objc_msgSend(v21, "isEqualToDate:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_25;
  }
  else
  {

    if (v23)
      goto LABEL_25;
  }
  v25 = -[EKTravelEngineOriginalEvent locationIsAConferenceRoom](self, "locationIsAConferenceRoom");
  if (v25 != objc_msgSend(v4, "locationIsAConferenceRoom"))
    goto LABEL_25;
  -[EKTravelEngineOriginalEvent eventExternalURL](self, "eventExternalURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventExternalURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v26)
  {

    if (!v28)
      goto LABEL_23;
LABEL_25:
    LOBYTE(v31) = 0;
    goto LABEL_26;
  }
  v29 = objc_msgSend(v26, "isEqualToString:", v27);

  if ((v29 & 1) == 0)
    goto LABEL_25;
LABEL_23:
  v30 = -[EKTravelEngineOriginalEvent automaticGeocodingAllowed](self, "automaticGeocodingAllowed");
  v31 = v30 ^ objc_msgSend(v4, "automaticGeocodingAllowed") ^ 1;
LABEL_26:

  return v31;
}

BOOL __54__EKTravelEngineOriginalEvent_isEqualToOriginalEvent___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4 || !v5)
  {
    if (v4)
      v8 = v5 == 0;
    else
      v8 = 0;
    v7 = v8;
    if (v5 && v4)
    {
      objc_msgSend(v5, "distanceFromLocation:", v4);
      if (v9 >= 0.5)
      {
        objc_msgSend(v4, "altitude");
        v11 = v10;
        objc_msgSend(v6, "altitude");
        v7 = vabdd_f64(v11, v12) >= 0.5;
      }
      else
      {
        v7 = 0;
      }
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSString)eventExternalURL
{
  return self->_eventExternalURL;
}

- (void)setEventExternalURL:(id)a3
{
  objc_storeStrong((id *)&self->_eventExternalURL, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (int)transportTypeOverride
{
  return self->_transportTypeOverride;
}

- (void)setTransportTypeOverride:(int)a3
{
  self->_transportTypeOverride = a3;
}

- (NSString)locationString
{
  return self->_locationString;
}

- (void)setLocationString:(id)a3
{
  objc_storeStrong((id *)&self->_locationString, a3);
}

- (CLLocation)geoLocation
{
  return self->_geoLocation;
}

- (void)setGeoLocation:(id)a3
{
  objc_storeStrong((id *)&self->_geoLocation, a3);
}

- (NSData)locationMapKitHandle
{
  return self->_locationMapKitHandle;
}

- (void)setLocationMapKitHandle:(id)a3
{
  objc_storeStrong((id *)&self->_locationMapKitHandle, a3);
}

- (BOOL)locationIsAConferenceRoom
{
  return self->_locationIsAConferenceRoom;
}

- (void)setLocationIsAConferenceRoom:(BOOL)a3
{
  self->_locationIsAConferenceRoom = a3;
}

- (BOOL)automaticGeocodingAllowed
{
  return self->_automaticGeocodingAllowed;
}

- (void)setAutomaticGeocodingAllowed:(BOOL)a3
{
  self->_automaticGeocodingAllowed = a3;
}

- (BOOL)hasPredictedLocation
{
  return self->_hasPredictedLocation;
}

- (void)setHasPredictedLocation:(BOOL)a3
{
  self->_hasPredictedLocation = a3;
}

- (BOOL)isOnSharedCalendar
{
  return self->_isOnSharedCalendar;
}

- (void)setIsOnSharedCalendar:(BOOL)a3
{
  self->_isOnSharedCalendar = a3;
}

- (NSString)locationStringWithoutPrediction
{
  return self->_locationStringWithoutPrediction;
}

- (void)setLocationStringWithoutPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_locationStringWithoutPrediction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationStringWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_locationMapKitHandle, 0);
  objc_storeStrong((id *)&self->_geoLocation, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventExternalURL, 0);
}

@end
