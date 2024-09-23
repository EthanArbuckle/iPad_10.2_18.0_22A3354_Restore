@implementation VKWalkAssistStatus

- (VKWalkAssistStatus)initWithArrivalRadius:(double)a3 delegate:(id)a4
{
  id v6;
  VKWalkAssistStatus *v7;
  VKWalkAssistStatus *v8;
  VKWalkAssistStatus *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VKWalkAssistStatus;
  v7 = -[VKWalkAssistStatus init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lastCurrentDistance = 0.0;
    v7->_arrivalRadius = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VKWalkAssistStatus;
  -[VKWalkAssistStatus dealloc](&v4, sel_dealloc);
}

- (void)updateAssistStatusWithCurrentDistance:(double)a3 startRouteRoadName:(id)a4 isFacingStartLocation:(BOOL)a5 isStationary:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double lastCurrentDistance;
  id v11;

  v6 = a6;
  v7 = a5;
  v11 = a4;
  -[VKWalkAssistStatus setCurrentDistance:](self, "setCurrentDistance:", a3);
  lastCurrentDistance = self->_lastCurrentDistance;
  if (lastCurrentDistance == 0.0)
    lastCurrentDistance = a3;
  -[VKWalkAssistStatus setLastCurrentDistance:](self, "setLastCurrentDistance:", lastCurrentDistance);
  -[VKWalkAssistStatus setIsFacingStartLocation:](self, "setIsFacingStartLocation:", v7);
  -[VKWalkAssistStatus setIsStationary:](self, "setIsStationary:", v6);
  -[VKWalkAssistStatus setStartRouteRoadName:](self, "setStartRouteRoadName:", v11);
  -[VKWalkAssistStatus _makeStatusAnnouncement](self, "_makeStatusAnnouncement");

}

- (void)_makeStatusAnnouncement
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[VKWalkAssistStatus currentDistance](self, "currentDistance");
  v4 = v3;
  -[VKWalkAssistStatus lastCurrentDistance](self, "lastCurrentDistance");
  v6 = v5;
  -[VKWalkAssistStatus startRouteRoadName](self, "startRouteRoadName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[VKWalkAssistStatus startRouteRoadName](self, "startRouteRoadName");
  else
    AXVectorKitLocString(CFSTR("START_OF_ROUTE"));
  v23 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[VKWalkAssistStatus isFacingStartLocation](self, "isFacingStartLocation");
  v9 = -[VKWalkAssistStatus isStationary](self, "isStationary");
  if (v4 <= self->_arrivalRadius)
  {
    -[VKWalkAssistStatus delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "didArrive:", 1);
LABEL_17:

    goto LABEL_18;
  }
  if (vabdd_f64(v6, v4) > 6.0)
  {
    v10 = v9;
    -[VKWalkAssistStatus setLastCurrentDistance:](self, "setLastCurrentDistance:", v4);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_navigation_distanceUsesMetricSystem");

    if (v8)
    {
      v13 = CFSTR("APPROACHING_LOCATION_METERS");
      if (v10)
        v13 = CFSTR("FACING_LOCATION_METERS");
      v14 = v13;
      if ((v12 & 1) == 0)
      {
        v15 = CFSTR("APPROACHING_LOCATION_FEET");
        if (v10)
          v15 = CFSTR("FACING_LOCATION_FEET");
        v16 = v15;

        v14 = v16;
      }
      v17 = (void *)MEMORY[0x24BDD17C8];
      AXVectorKitLocString(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AXFormatInteger();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v18, v23, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      AXVectorKitLocString(CFSTR("MOVING_AWAY"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringWithFormat:", v14, v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[VKWalkAssistStatus delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "didUpdateStatusWithAnnouncement:", v20);

    goto LABEL_17;
  }
LABEL_18:

}

- (VKWalkAssistStatusDelegate)delegate
{
  return (VKWalkAssistStatusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)startRouteRoadName
{
  return self->_startRouteRoadName;
}

- (void)setStartRouteRoadName:(id)a3
{
  objc_storeStrong((id *)&self->_startRouteRoadName, a3);
}

- (double)currentDistance
{
  return self->_currentDistance;
}

- (void)setCurrentDistance:(double)a3
{
  self->_currentDistance = a3;
}

- (double)lastCurrentDistance
{
  return self->_lastCurrentDistance;
}

- (void)setLastCurrentDistance:(double)a3
{
  self->_lastCurrentDistance = a3;
}

- (BOOL)isFacingStartLocation
{
  return self->_isFacingStartLocation;
}

- (void)setIsFacingStartLocation:(BOOL)a3
{
  self->_isFacingStartLocation = a3;
}

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (void)setIsStationary:(BOOL)a3
{
  self->_isStationary = a3;
}

- (double)arrivalRadius
{
  return self->_arrivalRadius;
}

- (void)setArrivalRadius:(double)a3
{
  self->_arrivalRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startRouteRoadName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
