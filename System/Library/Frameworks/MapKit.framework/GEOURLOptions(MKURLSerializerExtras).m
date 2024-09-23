@implementation GEOURLOptions(MKURLSerializerExtras)

- (id)initWithLaunchOptions:()MKURLSerializerExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = a1;
  v32.super_class = (Class)&off_1EE0634C8;
  v5 = objc_msgSendSuper2(&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsMapType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "unsignedIntegerValue") - 1;
      if (v8 > 3)
        v9 = 0;
      else
        v9 = dword_18B2AF5C0[v8];
      objc_msgSend(v5, "setMapType:", v9);
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsMapCenter"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsMapSpan"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 | v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0D27650]);
      if (v10)
      {
        objc_msgSend((id)v10, "MKCoordinateValue");
        v14 = v13;
        objc_msgSend(v12, "setLatitude:");
        objc_msgSend(v12, "setLongitude:", v14);
      }
      if (v11)
      {
        objc_msgSend((id)v11, "MKCoordinateSpanValue");
        v16 = v15;
        objc_msgSend(v12, "setLatitudeDelta:");
        objc_msgSend(v12, "setLongitudeDelta:", v16);
      }
      objc_msgSend(v5, "setCenterSpan:", v12);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsCameraKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0D27648]);
      objc_msgSend(v17, "centerCoordinate");
      objc_msgSend(v18, "setLatitude:");
      objc_msgSend(v17, "centerCoordinate");
      objc_msgSend(v18, "setLongitude:", v19);
      objc_msgSend(v17, "heading");
      objc_msgSend(v18, "setHeading:");
      objc_msgSend(v17, "_precisePitch");
      objc_msgSend(v18, "setPitch:");
      objc_msgSend(v17, "altitude");
      objc_msgSend(v18, "setAltitude:");
      objc_msgSend(v5, "setCamera:", v18);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsShowsTraffic"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      objc_msgSend(v5, "setEnableTraffic:", objc_msgSend(v20, "BOOLValue"));
    v31 = (void *)v11;
    objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsReferralIdentifierKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v5, "setReferralIdentifier:", v22);
    v23 = (void *)v10;
    objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsRouteHandle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v5, "setRouteHandle:", v24);
    v25 = v7;
    objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsTimePointKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v5, "setTimePoint:", v26);
    objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsConnectedToCarKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      objc_msgSend(v5, "setConnectedToCar:", objc_msgSend(v27, "BOOLValue"));
    v29 = v5;

  }
  return v5;
}

- (id)launchOptions
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  NSString *const *v7;
  void *v8;
  MKMapCamera *v9;
  double v10;
  CLLocationDegrees v11;
  CLLocationDegrees v12;
  CLLocationCoordinate2D v13;
  NSString *const *v14;
  double v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  CLLocationCoordinate2D v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  if ((objc_msgSend(a1, "hasEnableTraffic") & 1) == 0
    && (objc_msgSend(a1, "hasMapType") & 1) == 0
    && (objc_msgSend(a1, "hasTransportType") & 1) == 0
    && (objc_msgSend(a1, "hasCenterSpan") & 1) == 0
    && (objc_msgSend(a1, "hasCamera") & 1) == 0
    && !objc_msgSend(a1, "hasReferralIdentifier"))
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "hasMapType"))
  {
    v3 = objc_msgSend(a1, "mapType");
    if (v3 == 1)
      v4 = 1;
    else
      v4 = 2 * (v3 == 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("MKLaunchOptionsMapType"));

  }
  if (objc_msgSend(a1, "hasTransportType"))
  {
    v6 = objc_msgSend(a1, "transportType");
    if (v6 > 3)
      v7 = &MKLaunchOptionsDirectionsModeDefault;
    else
      v7 = (NSString *const *)off_1E20DEEF8[v6];
    objc_msgSend(v2, "setObject:forKey:", *v7, CFSTR("MKLaunchOptionsDirectionsMode"));
  }
  if (objc_msgSend(a1, "hasCamera"))
  {
    objc_msgSend(a1, "camera");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MKMapCamera);
    objc_msgSend(v8, "latitude");
    v11 = v10;
    objc_msgSend(v8, "longitude");
    v13 = CLLocationCoordinate2DMake(v11, v12);
    -[MKMapCamera setCenterCoordinate:](v9, "setCenterCoordinate:", v13.latitude, v13.longitude);
    objc_msgSend(v8, "heading");
    -[MKMapCamera setHeading:](v9, "setHeading:");
    objc_msgSend(v8, "pitch");
    -[MKMapCamera _setPrecisePitch:](v9, "_setPrecisePitch:");
    objc_msgSend(v8, "altitude");
    -[MKMapCamera setAltitude:](v9, "setAltitude:");
    v14 = &MKLaunchOptionsCameraKey;
LABEL_19:
    objc_msgSend(v2, "setObject:forKey:", v9, *v14);

    goto LABEL_20;
  }
  if (!objc_msgSend(a1, "hasCenterSpan"))
    goto LABEL_28;
  objc_msgSend(a1, "centerSpan");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasLatitude") && objc_msgSend(v8, "hasLongitude"))
  {
    objc_msgSend(v8, "latitude");
    v16 = v15;
    objc_msgSend(v8, "longitude");
    v18 = CLLocationCoordinate2DMake(v16, v17);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithMKCoordinate:", v18.latitude, v18.longitude);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v19, CFSTR("MKLaunchOptionsMapCenter"));

  }
  if (objc_msgSend(v8, "hasLatitudeDelta") && objc_msgSend(v8, "hasLongitudeDelta"))
  {
    objc_msgSend(v8, "latitudeDelta");
    v21 = v20;
    objc_msgSend(v8, "longitudeDelta");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithMKCoordinateSpan:", v21, v22);
    v9 = (MKMapCamera *)objc_claimAutoreleasedReturnValue();
    v14 = &MKLaunchOptionsMapSpanKey;
    goto LABEL_19;
  }
LABEL_20:

LABEL_28:
  if (objc_msgSend(a1, "hasEnableTraffic"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "enableTraffic"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v23, CFSTR("MKLaunchOptionsShowsTraffic"));

  }
  if (objc_msgSend(a1, "hasReferralIdentifier"))
  {
    objc_msgSend(a1, "referralIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v24, CFSTR("MKLaunchOptionsReferralIdentifierKey"));

  }
  if (objc_msgSend(a1, "hasRouteHandle"))
  {
    objc_msgSend(a1, "routeHandle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v25, CFSTR("MKLaunchOptionsRouteHandle"));

  }
  if (objc_msgSend(a1, "hasTimePoint"))
  {
    objc_msgSend(a1, "timePoint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v26, CFSTR("MKLaunchOptionsTimePointKey"));

  }
  if (objc_msgSend(a1, "hasConnectedToCar"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "connectedToCar"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v27, CFSTR("MKLaunchOptionsConnectedToCarKey"));

  }
  return v2;
}

@end
