@implementation GEOComposedWaypoint(MKGeoServicesExtras)

+ (void)composedWaypointForMapItem:()MKGeoServicesExtras useAsLocation:forQuickETA:traits:completionHandler:networkActivityHandler:
{
  id v14;
  void (**v15)(id, _QWORD, void *);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  id v35;
  id v36;
  id v37;

  v37 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("mapItem cannot be nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v20);
    goto LABEL_23;
  }
  if (!v14)
  {
    +[MKMapService sharedService](MKMapService, "sharedService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "defaultTraits");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v17 = v37;
  }
  if (objc_msgSend(v17, "isCurrentLocation"))
  {
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      if (v15)
      {
        v21 = (void *)objc_msgSend([a1 alloc], "initWithLocation:isCurrentLocation:", v20, 1);
        ((void (**)(id, void *, void *))v15)[2](v15, v21, 0);

      }
    }
    else
    {
      v26 = (id)-[objc_class composedWaypointForCurrentLocation:traits:completionHandler:networkActivityHandler:](a1, "composedWaypointForCurrentLocation:traits:completionHandler:networkActivityHandler:", v20, v14, v15, v16);
    }
    goto LABEL_23;
  }
  if (objc_msgSend(v37, "_hasCorrectedHomeWorkCoordinate"))
  {
    v22 = objc_alloc(MEMORY[0x1E0D27168]);
    objc_msgSend(v37, "_coordinate");
    v24 = v23;
    objc_msgSend(v37, "_coordinate");
    v20 = (void *)objc_msgSend(v22, "initWithLatitude:longitude:", v24);
    if (a5)
    {
      if (v15)
      {
        v25 = (void *)objc_msgSend([a1 alloc], "initWithLocation:isCurrentLocation:", v20, 0);
        ((void (**)(id, void *, void *))v15)[2](v15, v25, 0);
LABEL_22:

      }
LABEL_23:

      goto LABEL_24;
    }
LABEL_21:
    objc_msgSend(v37, "_geoMapItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)-[objc_class composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:](a1, "composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:", v20, v25, v14, v15, v16);
    goto LABEL_22;
  }
  objc_msgSend(v37, "place");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27 || (a4 & 1) != 0)
  {
    v30 = objc_alloc(MEMORY[0x1E0D27168]);
    objc_msgSend(v37, "placemark");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "location");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v30, "initWithCLLocation:", v32);

    goto LABEL_21;
  }
  if (!a5)
  {
    v34 = objc_msgSend(v37, "isPlaceHolder");
    objc_msgSend(v37, "_geoMapItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      v35 = (id)-[objc_class composedWaypointForIncompleteMapItem:traits:clientAttributes:completionHandler:networkActivityHandler:](a1, "composedWaypointForIncompleteMapItem:traits:clientAttributes:completionHandler:networkActivityHandler:", v20, v14, 0, v15, v16);
    else
      v36 = (id)-[objc_class composedWaypointForMapItem:traits:clientAttributes:completionHandler:networkActivityHandler:](a1, "composedWaypointForMapItem:traits:clientAttributes:completionHandler:networkActivityHandler:", v20, v14, 0, v15, v16);
    goto LABEL_23;
  }
  if (v15)
  {
    v28 = objc_alloc(MEMORY[0x1E0D26FF8]);
    objc_msgSend(v37, "_geoMapItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v28, "initWithMapItem:", v29);

    ((void (**)(id, void *, void *))v15)[2](v15, v20, 0);
    goto LABEL_23;
  }
LABEL_24:

}

@end
