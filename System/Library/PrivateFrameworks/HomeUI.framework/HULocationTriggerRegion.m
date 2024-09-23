@implementation HULocationTriggerRegion

+ (id)homeRegionWithHome:(id)a3 eventType:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegionType:home:circularRegion:eventType:", 0, v6, 0, a4);

  return v7;
}

+ (id)customRegionWithCircularRegion:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(v5, "initWithRegionType:home:circularRegion:eventType:", 1, 0, v4, objc_msgSend(MEMORY[0x1E0CBA5E8], "hf_locationEventTypeForRegion:", v4));

  return v6;
}

- (HULocationTriggerRegion)initWithRegionType:(unint64_t)a3 home:(id)a4 circularRegion:(id)a5 eventType:(unint64_t)a6
{
  id v11;
  id v12;
  HULocationTriggerRegion *v13;
  HULocationTriggerRegion *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HULocationTriggerRegion;
  v13 = -[HULocationTriggerRegion init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_regionType = a3;
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_circularRegion, a5);
    v14->_eventType = a6;
  }

  return v14;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CLLocationCoordinate2D result;

  -[HULocationTriggerRegion home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HULocationTriggerRegion home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HULocationTriggerRegion home](self, "home");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "coordinate");
      v9 = v8;
      v11 = v10;

    }
    else
    {
      v9 = *MEMORY[0x1E0C9E500];
      v11 = *(double *)(MEMORY[0x1E0C9E500] + 8);
    }

  }
  else
  {
    -[HULocationTriggerRegion circularRegion](self, "circularRegion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      NSLog(CFSTR("Region %@ does not have a home or a circular region!"), self);
      v9 = *MEMORY[0x1E0C9E500];
      v11 = *(double *)(MEMORY[0x1E0C9E500] + 8);
      goto LABEL_9;
    }
    -[HULocationTriggerRegion circularRegion](self, "circularRegion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "center");
    v9 = v13;
    v11 = v14;
  }

LABEL_9:
  v15 = v9;
  v16 = v11;
  result.longitude = v16;
  result.latitude = v15;
  return result;
}

- (CLLocation)location
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  -[HULocationTriggerRegion home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HULocationTriggerRegion home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HULocationTriggerRegion circularRegion](self, "circularRegion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      -[HULocationTriggerRegion circularRegion](self, "circularRegion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "center");
      v10 = v9;
      v12 = v11;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULocationTriggerRegion circularRegion](self, "circularRegion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v7, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v13, objc_msgSend(v14, "referenceFrame"), v10, v12, 0.0, 0.0, -1.0);

    }
    else
    {
      NSLog(CFSTR("Region %@ does not have a home or a circular region!"), self);
      v5 = 0;
    }
  }
  return (CLLocation *)v5;
}

- (NSString)identifier
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[HULocationTriggerRegion regionType](self, "regionType");
  if (v3 == 1)
  {
    -[HULocationTriggerRegion circularRegion](self, "circularRegion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerEditorOptionHome"), CFSTR("HULocationTriggerEditorOptionHome"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (CLCircularRegion)defaultCircularRegionForCoordinate
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C9E368]);
  -[HULocationTriggerRegion coordinate](self, "coordinate");
  v5 = v4;
  v7 = v6;
  v8 = *MEMORY[0x1E0C9E4A8];
  -[HULocationTriggerRegion identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithCenter:radius:identifier:", v9, v5, v7, v8);

  objc_msgSend(v10, "setNotifyOnEntry:", -[HULocationTriggerRegion eventType](self, "eventType") == 1);
  objc_msgSend(v10, "setNotifyOnExit:", -[HULocationTriggerRegion eventType](self, "eventType") == 2);
  return (CLCircularRegion *)v10;
}

- (unint64_t)regionType
{
  return self->_regionType;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (HMHome)home
{
  return self->_home;
}

- (CLCircularRegion)circularRegion
{
  return self->_circularRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularRegion, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
