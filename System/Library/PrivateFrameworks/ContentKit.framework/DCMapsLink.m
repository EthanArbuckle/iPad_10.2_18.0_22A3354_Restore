@implementation DCMapsLink

- (id)regionCenteredAtLocation:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id result;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v22 = 0;
  v23 = (uint64_t)&v22;
  v24 = 0x2020000000;
  v6 = getCLLocationCoordinate2DIsValidSymbolLoc_ptr;
  v25 = getCLLocationCoordinate2DIsValidSymbolLoc_ptr;
  if (!getCLLocationCoordinate2DIsValidSymbolLoc_ptr)
  {
    v7 = CoreLocationLibrary_3921();
    v6 = dlsym(v7, "CLLocationCoordinate2DIsValid");
    *(_QWORD *)(v23 + 24) = v6;
    getCLLocationCoordinate2DIsValidSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v22, 8);
  if (v6)
  {
    if (((unsigned int (*)(double, double))v6)(latitude, longitude))
    {
      -[DCMapsLink coordinateSpanForMapSize:centeredAtLocation:](self, "coordinateSpanForMapSize:centeredAtLocation:", 256.0, 256.0, latitude, longitude);
      v9 = latitude - v8;
      v11 = longitude - v10;
      v12 = (void *)objc_msgSend(objc_alloc((Class)getCLLocationClass()), "initWithLatitude:longitude:", latitude, longitude);
      v13 = (void *)objc_msgSend(objc_alloc((Class)getCLLocationClass()), "initWithLatitude:longitude:", v9, v11);
      objc_msgSend(v13, "distanceFromLocation:", v12);
      v15 = v14;
      v27 = 0;
      v28 = &v27;
      v29 = 0x2050000000;
      v16 = (void *)getCLCircularRegionClass_softClass_3934;
      v30 = getCLCircularRegionClass_softClass_3934;
      if (!getCLCircularRegionClass_softClass_3934)
      {
        v22 = MEMORY[0x24BDAC760];
        v23 = 3221225472;
        v24 = (uint64_t)__getCLCircularRegionClass_block_invoke_3935;
        v25 = &unk_24C4E3118;
        v26 = &v27;
        __getCLCircularRegionClass_block_invoke_3935((uint64_t)&v22);
        v16 = (void *)v28[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v27, 8);
      v18 = (void *)objc_msgSend([v17 alloc], "initWithCenter:radius:identifier:", CFSTR("Region"), latitude, longitude, v15);

    }
    else
    {
      v18 = 0;
    }
    return v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL WFCLLocationCoordinate2DIsValid(CLLocationCoordinate2D)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("DCMapsLink+CLGeocoding.m"), 18, CFSTR("%s"), dlerror(), v22);

    __break(1u);
  }
  return result;
}

- (id)region
{
  -[DCMapsLink centerCoordinate](self, "centerCoordinate");
  return -[DCMapsLink regionCenteredAtLocation:](self, "regionCenteredAtLocation:");
}

- (void)geocodeAddressString:(id)a3 inRegionIfAvailable:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v10 = (void *)getCLGeocoderClass_softClass;
  v17 = getCLGeocoderClass_softClass;
  if (!getCLGeocoderClass_softClass)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __getCLGeocoderClass_block_invoke;
    v13[3] = &unk_24C4E3118;
    v13[4] = &v14;
    __getCLGeocoderClass_block_invoke((uint64_t)v13);
    v10 = (void *)v15[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v14, 8);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "geocodeAddressString:inRegion:completionHandler:", v7, v8, v9);

}

- (void)geocodeDirectionsEndpointsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  -[DCMapsLink region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__3917;
  v32[4] = __Block_byref_object_dispose__3918;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__3917;
  v30[4] = __Block_byref_object_dispose__3918;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3917;
  v28[4] = __Block_byref_object_dispose__3918;
  v29 = 0;
  -[DCMapsLink startAddress](self, "startAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    dispatch_group_enter(v6);
    -[DCMapsLink startAddress](self, "startAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke;
    v24[3] = &unk_24C4DCAB8;
    v26 = v32;
    v27 = v28;
    v25 = v6;
    -[DCMapsLink geocodeAddressString:inRegionIfAvailable:completionHandler:](self, "geocodeAddressString:inRegionIfAvailable:completionHandler:", v10, v5, v24);

  }
  dispatch_group_enter(v6);
  -[DCMapsLink destinationAddress](self, "destinationAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke_2;
  v20[3] = &unk_24C4DCAB8;
  v22 = v30;
  v23 = v28;
  v12 = v6;
  v21 = v12;
  -[DCMapsLink geocodeAddressString:inRegionIfAvailable:completionHandler:](self, "geocodeAddressString:inRegionIfAvailable:completionHandler:", v11, v5, v20);

  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke_3;
  v15[3] = &unk_24C4DCAE0;
  v16 = v4;
  v17 = v32;
  v18 = v30;
  v19 = v28;
  v14 = v4;
  dispatch_group_notify(v12, v13, v15);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
}

void __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __75__DCMapsLink_CLGeocoding__geocodeDirectionsEndpointsWithCompletionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[DCMapsLink searchQuery](self, "searchQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DCMapsLink searchQuery](self, "searchQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("searchQuery"));

  }
  -[DCMapsLink searchNearQuery](self, "searchNearQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DCMapsLink searchNearQuery](self, "searchNearQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("searchNearQuery"));

  }
  -[DCMapsLink searchLocation](self, "searchLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DCMapsLink searchLocation](self, "searchLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("searchLocation"));

  }
  -[DCMapsLink startAddress](self, "startAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DCMapsLink startAddress](self, "startAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("startAddress"));

  }
  -[DCMapsLink destinationAddress](self, "destinationAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DCMapsLink destinationAddress](self, "destinationAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("destinationAddress"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DCMapsLink directionsMode](self, "directionsMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("directionsMode"));

  -[DCMapsLink centerLocation](self, "centerLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[DCMapsLink centerLocation](self, "centerLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("centerLocation"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DCMapsLink zoomLevel](self, "zoomLevel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("zoomLevel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DCMapsLink mapType](self, "mapType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("mapType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DCMapsLink showsTraffic](self, "showsTraffic"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("showsTraffic"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DCMapsLink showsTransit](self, "showsTransit"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("showsTransit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DCMapsLink showsStreetView](self, "showsStreetView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("showsStreetView"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DCMapsLink showsBicycling](self, "showsBicycling"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("showsBicycling"));

  -[DCMapsLink streetViewLocation](self, "streetViewLocation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[DCMapsLink streetViewLocation](self, "streetViewLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("streetViewLocation"));

  }
  v27 = CFSTR("link.contentkit.dcmapslink");
  v28[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.dcmapslink"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchQuery"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchQuery:", v6);

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchNearQuery"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchNearQuery:", v7);

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchLocation:", v8);

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("startAddress"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartAddress:", v9);

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationAddress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDestinationAddress:", v10);

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("directionsMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDirectionsMode:", objc_msgSend(v11, "unsignedIntegerValue"));

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("centerLocation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCenterLocation:", v12);

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoomLevel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoomLevel:", objc_msgSend(v13, "integerValue"));

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMapType:", objc_msgSend(v14, "unsignedIntegerValue"));

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("showsTraffic"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsTraffic:", objc_msgSend(v15, "BOOLValue"));

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("showsTransit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsTransit:", objc_msgSend(v16, "BOOLValue"));

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("showsStreetView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsStreetView:", objc_msgSend(v17, "BOOLValue"));

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("showsBicycling"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsBicycling:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("streetViewLocation"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStreetViewLocation:", v19);

  return v5;
}

- (NSString)wfName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  WFLocalizedString(CFSTR("Unknown Maps Link"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DCMapsLink directionsMode](self, "directionsMode"))
  {
    -[DCMapsLink startAddress](self, "startAddress");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[DCMapsLink destinationAddress](self, "destinationAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("Directions from %@ to %@"));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        -[DCMapsLink startAddress](self, "startAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[DCMapsLink destinationAddress](self, "destinationAddress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringWithFormat:", v8, v9, v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
    }
    -[DCMapsLink startAddress](self, "startAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
LABEL_8:
      v8 = v12;
      v11 = v8;
      goto LABEL_14;
    }
    -[DCMapsLink destinationAddress](self, "destinationAddress");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DCMapsLink searchQuery](self, "searchQuery");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_8;
    -[DCMapsLink searchNearQuery](self, "searchNearQuery");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v3;
  v11 = v15;

  v8 = 0;
LABEL_14:

  return (NSString *)v11;
}

- (BOOL)canGetDirections
{
  void *v3;
  void *v4;
  BOOL v5;

  -[DCMapsLink startAddress](self, "startAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[DCMapsLink destinationAddress](self, "destinationAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)getDirectionsToPlacemark:(id)a3 withCompletionHandler:(id)a4
{
  -[DCMapsLink getDirectionsToPlacemark:fromPlacemark:withCompletionHandler:](self, "getDirectionsToPlacemark:fromPlacemark:withCompletionHandler:", a3, 0, a4);
}

- (void)getDirectionsToPlacemark:(id)a3 fromPlacemark:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *MKMapItemClass_8363;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (v9)
    v11 = (void *)objc_msgSend(objc_alloc((Class)getMKPlacemarkClass()), "initWithPlacemark:", v9);
  else
    v11 = 0;
  v12 = (void *)objc_msgSend(objc_alloc((Class)getMKPlacemarkClass()), "initWithPlacemark:", v8);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v13 = (void *)getMKDirectionsRequestClass_softClass;
  v31 = getMKDirectionsRequestClass_softClass;
  if (!getMKDirectionsRequestClass_softClass)
  {
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __getMKDirectionsRequestClass_block_invoke;
    v26 = &unk_24C4E3118;
    v27 = &v28;
    __getMKDirectionsRequestClass_block_invoke((uint64_t)&v23);
    v13 = (void *)v29[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v28, 8);
  v15 = (void *)objc_opt_new();
  MKMapItemClass_8363 = (objc_class *)getMKMapItemClass_8363();
  if (v11)
  {
    v17 = objc_msgSend([MKMapItemClass_8363 alloc], "initWithPlacemark:", v11);
  }
  else
  {
    -[objc_class mapItemForCurrentLocation](MKMapItemClass_8363, "mapItemForCurrentLocation");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  objc_msgSend(v15, "setSource:", v17);

  v19 = (void *)objc_msgSend(objc_alloc((Class)getMKMapItemClass_8363()), "initWithPlacemark:", v12);
  objc_msgSend(v15, "setDestination:", v19);

  objc_msgSend(v15, "setTransportType:", -[DCMapsLink directionsTransportType](self, "directionsTransportType"));
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v20 = (void *)getMKDirectionsClass_softClass;
  v31 = getMKDirectionsClass_softClass;
  if (!getMKDirectionsClass_softClass)
  {
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __getMKDirectionsClass_block_invoke;
    v26 = &unk_24C4E3118;
    v27 = &v28;
    __getMKDirectionsClass_block_invoke((uint64_t)&v23);
    v20 = (void *)v29[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v28, 8);
  v22 = (void *)objc_msgSend([v21 alloc], "initWithRequest:", v15);
  v10[2](v10, v22, 0);

}

- (void)getDirectionsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__DCMapsLink_MKDirections__getDirectionsWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C4DE8D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[DCMapsLink geocodeDirectionsEndpointsWithCompletionHandler:](self, "geocodeDirectionsEndpointsWithCompletionHandler:", v6);

}

- (unint64_t)directionsTransportType
{
  unint64_t v2;

  v2 = -[DCMapsLink directionsMode](self, "directionsMode");
  if (v2 - 1 > 3)
    return 0xFFFFFFFLL;
  else
    return qword_20BC9A410[v2 - 1];
}

- (NSString)mkDirectionsMode
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *result;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  switch(-[DCMapsLink directionsMode](self, "directionsMode"))
  {
    case 1uLL:
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v2 = (id *)getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr;
      v14 = getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr)
      {
        v3 = MapKitLibrary_8353();
        v2 = (id *)dlsym(v3, "MKLaunchOptionsDirectionsModeDriving");
        v12[3] = (uint64_t)v2;
        getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr = (uint64_t)v2;
      }
      _Block_object_dispose(&v11, 8);
      if (v2)
        return (NSString *)*v2;
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMKLaunchOptionsDirectionsModeDriving(void)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("DCMapsLink+MKDirections.m"), 27, CFSTR("%s"), dlerror());
      goto LABEL_23;
    case 2uLL:
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v2 = (id *)getMKLaunchOptionsDirectionsModeCyclingSymbolLoc_ptr;
      v14 = getMKLaunchOptionsDirectionsModeCyclingSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeCyclingSymbolLoc_ptr)
      {
        v7 = MapKitLibrary_8353();
        v2 = (id *)dlsym(v7, "MKLaunchOptionsDirectionsModeCycling");
        v12[3] = (uint64_t)v2;
        getMKLaunchOptionsDirectionsModeCyclingSymbolLoc_ptr = (uint64_t)v2;
      }
      _Block_object_dispose(&v11, 8);
      if (v2)
        return (NSString *)*v2;
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMKLaunchOptionsDirectionsModeCycling(void)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("DCMapsLink+MKDirections.m"), 28, CFSTR("%s"), dlerror());
      goto LABEL_23;
    case 3uLL:
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v2 = (id *)getMKLaunchOptionsDirectionsModeWalkingSymbolLoc_ptr;
      v14 = getMKLaunchOptionsDirectionsModeWalkingSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeWalkingSymbolLoc_ptr)
      {
        v8 = MapKitLibrary_8353();
        v2 = (id *)dlsym(v8, "MKLaunchOptionsDirectionsModeWalking");
        v12[3] = (uint64_t)v2;
        getMKLaunchOptionsDirectionsModeWalkingSymbolLoc_ptr = (uint64_t)v2;
      }
      _Block_object_dispose(&v11, 8);
      if (v2)
        return (NSString *)*v2;
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMKLaunchOptionsDirectionsModeWalking(void)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("DCMapsLink+MKDirections.m"), 25, CFSTR("%s"), dlerror());
      goto LABEL_23;
    case 4uLL:
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v2 = (id *)getMKLaunchOptionsDirectionsModeTransitSymbolLoc_ptr;
      v14 = getMKLaunchOptionsDirectionsModeTransitSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeTransitSymbolLoc_ptr)
      {
        v9 = MapKitLibrary_8353();
        v2 = (id *)dlsym(v9, "MKLaunchOptionsDirectionsModeTransit");
        v12[3] = (uint64_t)v2;
        getMKLaunchOptionsDirectionsModeTransitSymbolLoc_ptr = (uint64_t)v2;
      }
      _Block_object_dispose(&v11, 8);
      if (v2)
        return (NSString *)*v2;
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMKLaunchOptionsDirectionsModeTransit(void)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("DCMapsLink+MKDirections.m"), 26, CFSTR("%s"), dlerror());
      goto LABEL_23;
    default:
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v2 = (id *)getMKLaunchOptionsDirectionsModeDefaultSymbolLoc_ptr;
      v14 = getMKLaunchOptionsDirectionsModeDefaultSymbolLoc_ptr;
      if (!getMKLaunchOptionsDirectionsModeDefaultSymbolLoc_ptr)
      {
        v6 = MapKitLibrary_8353();
        v2 = (id *)dlsym(v6, "MKLaunchOptionsDirectionsModeDefault");
        v12[3] = (uint64_t)v2;
        getMKLaunchOptionsDirectionsModeDefaultSymbolLoc_ptr = (uint64_t)v2;
      }
      _Block_object_dispose(&v11, 8);
      if (v2)
        return (NSString *)*v2;
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMKLaunchOptionsDirectionsModeDefault(void)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("DCMapsLink+MKDirections.m"), 29, CFSTR("%s"), dlerror());
LABEL_23:

      __break(1u);
      return result;
  }
}

- (void)getAppleMapsDirectionsURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned int (*v18)(double, double);
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (-[DCMapsLink mapType](self, "mapType"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DCMapsLink mkMapType](self, "mkMapType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = (uint64_t)&v30;
    v32 = 0x2020000000;
    v7 = (_QWORD *)getMKLaunchOptionsMapTypeKeySymbolLoc_ptr;
    v33 = (void *)getMKLaunchOptionsMapTypeKeySymbolLoc_ptr;
    if (!getMKLaunchOptionsMapTypeKeySymbolLoc_ptr)
    {
      v8 = MapKitLibrary_8353();
      v7 = dlsym(v8, "MKLaunchOptionsMapTypeKey");
      *(_QWORD *)(v31 + 24) = v7;
      getMKLaunchOptionsMapTypeKeySymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v30, 8);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMKLaunchOptionsMapTypeKey(void)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("DCMapsLink+MKDirections.m"), 31, CFSTR("%s"), dlerror());
      goto LABEL_28;
    }
    objc_msgSend(v5, "setObject:forKey:", v6, *v7);

  }
  if (-[DCMapsLink showsTraffic](self, "showsTraffic"))
  {
    v30 = 0;
    v31 = (uint64_t)&v30;
    v32 = 0x2020000000;
    v9 = (_QWORD *)getMKLaunchOptionsShowsTrafficKeySymbolLoc_ptr;
    v33 = (void *)getMKLaunchOptionsShowsTrafficKeySymbolLoc_ptr;
    if (!getMKLaunchOptionsShowsTrafficKeySymbolLoc_ptr)
    {
      v10 = MapKitLibrary_8353();
      v9 = dlsym(v10, "MKLaunchOptionsShowsTrafficKey");
      *(_QWORD *)(v31 + 24) = v9;
      getMKLaunchOptionsShowsTrafficKeySymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v30, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMKLaunchOptionsShowsTrafficKey(void)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("DCMapsLink+MKDirections.m"), 32, CFSTR("%s"), dlerror());
      goto LABEL_28;
    }
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C8], *v9);
  }
  -[DCMapsLink mkDirectionsMode](self, "mkDirectionsMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = (uint64_t)&v30;
  v32 = 0x2020000000;
  v12 = (_QWORD *)getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr;
  v33 = (void *)getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr;
  if (!getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr)
  {
    v13 = MapKitLibrary_8353();
    v12 = dlsym(v13, "MKLaunchOptionsDirectionsModeKey");
    *(_QWORD *)(v31 + 24) = v12;
    getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v30, 8);
  if (v12)
  {
    objc_msgSend(v5, "setObject:forKey:", v11, *v12);

    -[DCMapsLink centerCoordinate](self, "centerCoordinate");
    v15 = v14;
    v17 = v16;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v18 = (unsigned int (*)(double, double))getCLLocationCoordinate2DIsValidSymbolLoc_ptr_8359;
    v38 = getCLLocationCoordinate2DIsValidSymbolLoc_ptr_8359;
    v19 = MEMORY[0x24BDAC760];
    if (!getCLLocationCoordinate2DIsValidSymbolLoc_ptr_8359)
    {
      v30 = MEMORY[0x24BDAC760];
      v31 = 3221225472;
      v32 = (uint64_t)__getCLLocationCoordinate2DIsValidSymbolLoc_block_invoke;
      v33 = &unk_24C4E3118;
      v34 = &v35;
      __getCLLocationCoordinate2DIsValidSymbolLoc_block_invoke(&v30);
      v18 = (unsigned int (*)(double, double))v36[3];
    }
    _Block_object_dispose(&v35, 8);
    if (v18)
    {
      if (!v18(v15, v17))
      {
LABEL_22:
        v27[0] = v19;
        v27[1] = 3221225472;
        v27[2] = __54__DCMapsLink_MKDirections__getAppleMapsDirectionsURL___block_invoke;
        v27[3] = &unk_24C4DE900;
        v28 = v5;
        v29 = v4;
        v27[4] = self;
        v23 = v5;
        v24 = v4;
        -[DCMapsLink geocodeDirectionsEndpointsWithCompletionHandler:](self, "geocodeDirectionsEndpointsWithCompletionHandler:", v27);

        return;
      }
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithMKCoordinate:", v15, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v31 = (uint64_t)&v30;
      v32 = 0x2020000000;
      v21 = (_QWORD *)getMKLaunchOptionsMapCenterKeySymbolLoc_ptr;
      v33 = (void *)getMKLaunchOptionsMapCenterKeySymbolLoc_ptr;
      if (!getMKLaunchOptionsMapCenterKeySymbolLoc_ptr)
      {
        v22 = MapKitLibrary_8353();
        v21 = dlsym(v22, "MKLaunchOptionsMapCenterKey");
        *(_QWORD *)(v31 + 24) = v21;
        getMKLaunchOptionsMapCenterKeySymbolLoc_ptr = (uint64_t)v21;
      }
      _Block_object_dispose(&v30, 8);
      if (v21)
      {
        objc_msgSend(v5, "setObject:forKey:", v20, *v21);

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMKLaunchOptionsMapCenterKey(void)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("DCMapsLink+MKDirections.m"), 34, CFSTR("%s"), dlerror());
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL WFCLLocationCoordinate2DIsValid(CLLocationCoordinate2D)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("DCMapsLink+MKDirections.m"), 40, CFSTR("%s"), dlerror());
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMKLaunchOptionsDirectionsModeKey(void)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("DCMapsLink+MKDirections.m"), 33, CFSTR("%s"), dlerror());
  }
LABEL_28:

  __break(1u);
}

void __54__DCMapsLink_MKDirections__getAppleMapsDirectionsURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    if (v16)
    {
      v7 = objc_alloc((Class)getMKMapItemClass_8363());
      v8 = (void *)objc_msgSend(objc_alloc((Class)getMKPlacemarkClass()), "initWithPlacemark:", v16);
      v9 = (void *)objc_msgSend(v7, "initWithPlacemark:", v8);
      objc_msgSend(v6, "addObject:", v9);

    }
    v10 = objc_alloc((Class)getMKMapItemClass_8363());
    v11 = (void *)objc_msgSend(objc_alloc((Class)getMKPlacemarkClass()), "initWithPlacemark:", v5);
    v12 = (void *)objc_msgSend(v10, "initWithPlacemark:", v11);
    objc_msgSend(v6, "addObject:", v12);

    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(getMKMapItemClass_8363(), "urlForMapItems:options:", v6, *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "mapsAppURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v6, 0);
  }

}

uint64_t __63__DCMapsLink_MKDirections__getDirectionsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(a1 + 32), "getDirectionsToPlacemark:fromPlacemark:withCompletionHandler:", a3, a2, *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)processLocation:(id)a3 shiftingIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  void (**v7)(id, id);
  id MKLocationShifterClass;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v7 = (void (**)(id, id))a5;
  MKLocationShifterClass = get_MKLocationShifterClass();
  if (v6
    && (v9 = MKLocationShifterClass) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v9, "instancesRespondToSelector:", sel_shiftLocation_withCompletionHandler_callbackQueue_)&& (objc_msgSend(v9, "isLocationShiftRequiredForLocation:", v13) & 1) != 0)
  {
    get_MKLocationShifterClass();
    v10 = (void *)objc_opt_new();
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
    {
      v11 = (void *)MEMORY[0x24BDAC9B8];
      v12 = MEMORY[0x24BDAC9B8];
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "shiftLocation:withCompletionHandler:callbackQueue:", v13, v7, v11);

  }
  else
  {
    v7[2](v7, v13);
  }

}

+ (void)createMapsLinkWithPlacemark:(id)a3 location:(id)a4 streetAddress:(id)a5 shiftingLocationIfNecessary:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v15 && !v13 && !v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DCMapsLink+WFLocationCoercions.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placemark || location || streetAddress"));

    goto LABEL_5;
  }
  if (!v14)
  {
LABEL_5:
    objc_msgSend(v13, "location");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v13 && !v15)
  {
    +[WFStreetAddress streetAddressWithPlacemark:label:](WFStreetAddress, "streetAddressWithPlacemark:label:", v13, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __132__DCMapsLink_WFLocationCoercions__createMapsLinkWithPlacemark_location_streetAddress_shiftingLocationIfNecessary_completionHandler___block_invoke;
  v20[3] = &unk_24C4DFC10;
  v21 = v15;
  v22 = v16;
  v17 = v16;
  v18 = v15;
  objc_msgSend(a1, "processLocation:shiftingIfNecessary:completionHandler:", v14, v8, v20);

}

void __132__DCMapsLink_WFLocationCoercions__createMapsLinkWithPlacemark_location_streetAddress_shiftingLocationIfNecessary_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  DCMutableMapsLink *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_alloc_init(DCMutableMapsLink);
  if (v11)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "coordinate");
    v6 = v5;
    objc_msgSend(v11, "coordinate");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%f,%f"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCMutableMapsLink setCenterLocation:](v3, "setCenterLocation:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "addressString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[DCMutableMapsLink setSearchQuery:](v3, "setSearchQuery:", v9);
  }
  else
  {
    -[DCMutableMapsLink centerLocation](v3, "centerLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCMutableMapsLink setSearchQuery:](v3, "setSearchQuery:", v10);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)mapsAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:](DCMapsURLGenerator, "URLWithMapsLink:", self);
}

- (id)googleMapsAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:](DCGoogleMapsURLGenerator, "URLWithMapsLink:", self);
}

- (id)transitAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:](DCTransitURLGenerator, "URLWithMapsLink:", self);
}

- (id)wazeAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:](DCWazeURLGenerator, "URLWithMapsLink:", self);
}

- (id)baiduMapsAppURL
{
  return +[DCMapsURLGenerator URLWithMapsLink:](DCBaiduMapsURLGenerator, "URLWithMapsLink:", self);
}

- (void)getCitymapperAppURL:(id)a3
{
  +[DCCityMapperURLGenerator generateURLWithMapsLink:completionHandler:](DCCityMapperURLGenerator, "generateURLWithMapsLink:completionHandler:", self, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;

  -[DCMapsLink startAddress](self, "startAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    v11.receiver = self;
    v11.super_class = (Class)DCMapsLink;
    -[DCMapsLink description](&v11, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCMapsLink startAddress](self, "startAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCMapsLink destinationAddress](self, "destinationAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: Directions from %@ to %@"), v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DCMapsLink;
    -[DCMapsLink description](&v10, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCMapsLink searchQuery](self, "searchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: %@"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSString)searchQuery
{
  return 0;
}

- (NSString)searchNearQuery
{
  return 0;
}

- (NSString)searchLocation
{
  return 0;
}

- (NSString)startAddress
{
  return 0;
}

- (NSString)destinationAddress
{
  return 0;
}

- (unint64_t)directionsMode
{
  return 0;
}

- (NSString)centerLocation
{
  return 0;
}

- (int64_t)zoomLevel
{
  return 0;
}

- (unint64_t)mapType
{
  return 0;
}

- (BOOL)showsTraffic
{
  return 0;
}

- (BOOL)showsTransit
{
  return 0;
}

- (BOOL)showsStreetView
{
  return 0;
}

- (BOOL)showsBicycling
{
  return 0;
}

- (NSString)streetViewLocation
{
  return 0;
}

+ (DCMapsLink)mapsLinkWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  +[DCNewGoogleMapsLink mapsLinkWithURL:](DCNewGoogleMapsLink, "mapsLinkWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[DCStandardMapsLink mapsLinkWithURL:](DCStandardMapsLink, "mapsLinkWithURL:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (DCMapsLink *)v7;
}

+ (BOOL)isMapsURL:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[DCNewGoogleMapsLink isMapsURL:](DCNewGoogleMapsLink, "isMapsURL:", v3)
    || +[DCStandardMapsLink isMapsURL:](DCStandardMapsLink, "isMapsURL:", v3);

  return v4;
}

- (CLLocationCoordinate2D)locationCoordinateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  CLLocationCoordinate2D result;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    objc_msgSend(v4, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v11 = getCLLocationCoordinate2DMakeSymbolLoc_ptr_15428;
    v25 = getCLLocationCoordinate2DMakeSymbolLoc_ptr_15428;
    if (!getCLLocationCoordinate2DMakeSymbolLoc_ptr_15428)
    {
      v12 = CoreLocationLibrary_15418();
      v11 = dlsym(v12, "CLLocationCoordinate2DMake");
      v23[3] = (uint64_t)v11;
      getCLLocationCoordinate2DMakeSymbolLoc_ptr_15428 = v11;
    }
    _Block_object_dispose(&v22, 8);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CLLocationCoordinate2D WFCLLocationCoordinate2DMake(CLLocationDegrees, CLLocationDegrees)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("DCMapsLink+MKGeometry.m"), 16, CFSTR("%s"), dlerror());

      __break(1u);
      goto LABEL_9;
    }
    v13 = ((double (*)(double, double))v11)(v7, v10);
    v15 = v14;

  }
  else
  {
    getkCLLocationCoordinate2DInvalid();
    v13 = v16;
    v15 = v17;
  }

  v18 = v13;
  v19 = v15;
LABEL_9:
  result.longitude = v19;
  result.latitude = v18;
  return result;
}

- (CLLocationCoordinate2D)searchLocationCoordinate
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CLLocationCoordinate2D result;

  -[DCMapsLink searchLocation](self, "searchLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsLink locationCoordinateFromString:](self, "locationCoordinateFromString:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (CLLocationCoordinate2D)centerLocationCoordinate
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CLLocationCoordinate2D result;

  -[DCMapsLink centerLocation](self, "centerLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsLink locationCoordinateFromString:](self, "locationCoordinateFromString:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (CLLocationCoordinate2D)streetViewLocationCoordinate
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CLLocationCoordinate2D result;

  -[DCMapsLink streetViewLocation](self, "streetViewLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsLink locationCoordinateFromString:](self, "locationCoordinateFromString:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  double v3;
  double v4;
  double v5;
  double v6;
  char v7;
  double v8;
  double v9;
  char v10;
  double v11;
  double v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CLLocationCoordinate2D result;

  -[DCMapsLink streetViewLocationCoordinate](self, "streetViewLocationCoordinate");
  v4 = v3;
  v6 = v5;
  WFCLLocationCoordinate2DIsValid(v3, v5);
  if ((v7 & 1) == 0)
  {
    -[DCMapsLink centerLocationCoordinate](self, "centerLocationCoordinate");
    v4 = v8;
    v6 = v9;
    WFCLLocationCoordinate2DIsValid(v8, v9);
    if ((v10 & 1) == 0)
    {
      -[DCMapsLink searchLocationCoordinate](self, "searchLocationCoordinate");
      v4 = v11;
      v6 = v12;
      WFCLLocationCoordinate2DIsValid(v11, v12);
      if ((v13 & 1) == 0)
      {
        getkCLLocationCoordinate2DInvalid();
        v4 = v14;
        v6 = v15;
      }
    }
  }
  v16 = v4;
  v17 = v6;
  result.longitude = v17;
  result.latitude = v16;
  return result;
}

- (unint64_t)mkMapType
{
  unint64_t v2;

  v2 = -[DCMapsLink mapType](self, "mapType");
  if (v2 == 2)
    return 1;
  else
    return 2 * (v2 == 3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateSpanForMapSize:(CGSize)a3 centeredAtLocation:(CLLocationCoordinate2D)a4
{
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  objc_msgSend((id)objc_opt_class(), "coordinateSpanForMapSize:centeredAtLocation:atZoomLevel:", -[DCMapsLink zoomLevel](self, "zoomLevel"), a3.width, a3.height, a4.latitude, a4.longitude);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- ($09EA97B0F8808A12B32A04110BD4DC5A)coordinateRegionForMapSize:(SEL)a3 centeredAtLocation:(CGSize)a4
{
  double longitude;
  double latitude;
  double v7;
  double v8;
  $09EA97B0F8808A12B32A04110BD4DC5A *result;

  longitude = a5.longitude;
  latitude = a5.latitude;
  -[DCMapsLink coordinateSpanForMapSize:centeredAtLocation:](self, "coordinateSpanForMapSize:centeredAtLocation:", a4.width, a4.height);
  WFMKCoordinateRegionMake(latitude, longitude, v7, v8);
  return result;
}

+ (double)longitudeToPixelSpaceX:(double)a3
{
  return round(a3 * 85445659.4 * 3.14159265 / 180.0 + 268435456.0);
}

+ (double)latitudeToPixelSpaceY:(double)a3
{
  float v3;
  float v4;

  v3 = a3 * 3.14159265 / 180.0;
  v4 = sinf(v3);
  return round(logf((float)(v4 + 1.0) / (float)(1.0 - v4)) * -85445659.4 * 0.5 + 268435456.0);
}

+ (double)pixelSpaceXToLongitude:(double)a3
{
  return (round(a3) + -268435456.0) / 85445659.4 * 180.0 / 3.14159265;
}

+ (double)pixelSpaceYToLatitude:(double)a3
{
  long double v3;

  v3 = exp((round(a3) + -268435456.0) / 85445659.4);
  return (atan(v3) * -2.0 + 1.57079633) * 180.0 / 3.14159265;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateSpanForMapSize:(CGSize)a3 centeredAtLocation:(CLLocationCoordinate2D)a4 atZoomLevel:(int64_t)a5
{
  double latitude;
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  long double v15;
  long double v16;
  long double v17;
  long double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = a4.latitude;
  height = a3.height;
  width = a3.width;
  objc_msgSend(a1, "longitudeToPixelSpaceX:", a4.longitude);
  v11 = v10;
  objc_msgSend(a1, "latitudeToPixelSpaceY:", latitude);
  v13 = v12;
  v14 = exp2((double)(23 - a5));
  v15 = width * v14;
  v16 = height * v14;
  v17 = v11 - v15 * 0.5;
  v18 = v13 - v16 * 0.5;
  objc_msgSend(a1, "pixelSpaceXToLongitude:", (double)v17);
  v20 = v19;
  objc_msgSend(a1, "pixelSpaceXToLongitude:", (double)(v15 + v17));
  v22 = v21;
  objc_msgSend(a1, "pixelSpaceYToLatitude:", (double)v18);
  v24 = v23;
  objc_msgSend(a1, "pixelSpaceYToLatitude:", (double)(v16 + v18));
  v26 = v25;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v27 = getMKCoordinateSpanMakeSymbolLoc_ptr;
  v36 = getMKCoordinateSpanMakeSymbolLoc_ptr;
  if (!getMKCoordinateSpanMakeSymbolLoc_ptr)
  {
    v28 = MapKitLibrary_15409();
    v27 = dlsym(v28, "MKCoordinateSpanMake");
    v34[3] = (uint64_t)v27;
    getMKCoordinateSpanMakeSymbolLoc_ptr = v27;
  }
  _Block_object_dispose(&v33, 8);
  if (v27)
  {
    ((void (*)(double, double))v27)(-(v26 - v24), v22 - v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MKCoordinateSpan WFMKCoordinateSpanMake(CLLocationDegrees, CLLocationDegrees)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("DCMapsLink+MKGeometry.m"), 21, CFSTR("%s"), dlerror());

    __break(1u);
  }
  result.var1 = v30;
  result.var0 = v29;
  return result;
}

+ ($4534325A8E135360BDA169C014250973)coordinateRegionForMapSize:(SEL)a3 centeredAtLocation:(CGSize)a4 atZoomLevel:(CLLocationCoordinate2D)a5
{
  double longitude;
  double latitude;
  double v8;
  double v9;
  $4534325A8E135360BDA169C014250973 *result;

  longitude = a5.longitude;
  latitude = a5.latitude;
  objc_msgSend(a2, "coordinateSpanForMapSize:centeredAtLocation:atZoomLevel:", a6, a4.width, a4.height);
  WFMKCoordinateRegionMake(latitude, longitude, v8, v9);
  return result;
}

@end
