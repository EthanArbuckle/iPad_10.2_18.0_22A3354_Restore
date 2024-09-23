@implementation _GEORouteMatchUpdater_Arrival

- (_GEORouteMatchUpdater_Arrival)initWithRoute:(id)a3 arrivalStep:(id)a4
{
  id v6;
  id v7;
  _GEORouteMatchUpdater_Arrival *v8;
  _GEORouteMatchUpdater_Arrival *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _GEORouteMatchUpdater_Arrival *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_GEORouteMatchUpdater_Arrival;
  v8 = -[_GEORouteMatchUpdater_Arrival init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_arrivalStep, a4);
    v9->_arrivalRouteCoordinate = (PolylineCoordinate)0xBF80000000000000;
    -[GEOComposedRouteStep getPreviousStep](v9->_arrivalStep, "getPreviousStep");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "routeSegmentType") == 2)
    {
      objc_msgSend(v10, "endGeoCoordinate");
      v9->_destinationLocationCoordinate.latitude = v11;
      v9->_destinationLocationCoordinate.longitude = v12;
      objc_msgSend(v10, "transitStep");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasWalkingIndex");

      if (v14)
        v9->_arrivalRouteCoordinate = (PolylineCoordinate)objc_msgSend(v6, "routeCoordinateAtDistance:beforeRouteCoordinate:", objc_msgSend(v10, "endPointIndex"), 50.0);
      objc_msgSend(v6, "segmentForStepIndex:", objc_msgSend(v10, "stepIndex"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "steps");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "getPreviousStep");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "routeSegmentType") == 5)
        objc_storeStrong((id *)&v9->_previousExitStationStep, v18);

    }
    v19 = v9;

  }
  return v9;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  double v12;
  PolylineCoordinate *p_arrivalRouteCoordinate;
  uint64_t v14;
  double latitude;
  double longitude;
  double v17;
  double v18;
  BOOL v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    if (self->_previousExitStationStep)
    {
      v11 = objc_msgSend(v9, "stepIndex");
      if (v11 <= -[GEOComposedRouteStep stepIndex](self->_previousExitStationStep, "stepIndex"))
      {
        objc_msgSend(v8, "distanceFromRoute");
        if (v12 < 50.0)
          goto LABEL_11;
      }
    }
  }
  p_arrivalRouteCoordinate = &self->_arrivalRouteCoordinate;
  if ((self->_arrivalRouteCoordinate.index || fabsf(self->_arrivalRouteCoordinate.offset + 1.0) >= 0.00000011921)
    && objc_msgSend(v8, "isGoodMatch"))
  {
    v14 = objc_msgSend(v8, "routeCoordinate");
    if ((_DWORD)v14 == p_arrivalRouteCoordinate->index)
    {
      if (*((float *)&v14 + 1) > COERCE_FLOAT(HIDWORD(*(unint64_t *)p_arrivalRouteCoordinate)))
      {
LABEL_13:
        objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_arrivalStep, "stepIndex"));
        v19 = 1;
        goto LABEL_14;
      }
    }
    else if (v14 >= p_arrivalRouteCoordinate->index)
    {
      goto LABEL_13;
    }
  }
  latitude = self->_destinationLocationCoordinate.latitude;
  longitude = self->_destinationLocationCoordinate.longitude;
  objc_msgSend(v10, "coordinate");
  if (GEOCalculateDistanceRadius(latitude, longitude, v17, v18, 6367000.0) < 50.0)
    goto LABEL_13;
LABEL_11:
  v19 = 0;
LABEL_14:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousExitStationStep, 0);
  objc_storeStrong((id *)&self->_arrivalStep, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0xBF80000000000000;
  return self;
}

@end
