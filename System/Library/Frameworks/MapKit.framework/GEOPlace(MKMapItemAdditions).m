@implementation GEOPlace(MKMapItemAdditions)

- (void)initWithCLLocation:()MKMapItemAdditions
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v5 = (void *)objc_msgSend(a1, "initWithLatitude:longitude:");
  if (v5)
  {
    v6 = objc_msgSend(v4, "referenceFrame");
    if (v6 == 1)
      v7 = 1;
    else
      v7 = 2 * (v6 == 2);
    objc_msgSend(v5, "setReferenceFrame:", v7);
    v8 = v5;
  }

  return v5;
}

- (void)initWithPlacemark:()MKMapItemAdditions
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "mkPostalAddressDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(a1, "initWithLatitude:longitude:addressDictionary:", v9, v6, v8);
  if (v10)
  {
    objc_msgSend(v4, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "referenceFrame");
    if (v12 == 1)
      v13 = 1;
    else
      v13 = 2 * (v12 == 2);
    objc_msgSend(v10, "setReferenceFrame:", v13);

    objc_msgSend(v4, "region");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        objc_msgSend(v15, "center");
        v17 = v16;
        objc_msgSend(v15, "center");
        v19 = v18;
        objc_msgSend(v15, "radius");
        v21 = v20;

        v22 = MKMapRectMakeWithRadialDistance(v17, v19, v21);
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithMapRect:", v22, v23, v24, v25);
        objc_msgSend(v10, "setMapRegion:", v26);

      }
    }
    v27 = v10;

  }
  return v10;
}

- (id)clLocation
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  if (objc_msgSend(a1, "hasCenter"))
  {
    v2 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(a1, "center");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coordinate");
    v5 = v4;
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1, "referenceFrame");
    if (v9 == 1)
      v10 = 1;
    else
      v10 = 2 * (v9 == 2);
    v11 = (void *)objc_msgSend(v2, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v8, v10, v5, v7, 0.0, 0.0, -1.0);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)clRegion
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  if (objc_msgSend(a1, "hasMapRegion"))
  {
    v2 = (void *)MEMORY[0x1E0C9E368];
    objc_msgSend(a1, "mapRegion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "circularRegionFromMapRegion:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(a1, "referenceFrame");
    if (v5 == 1)
      v6 = 1;
    else
      v6 = 2 * (v5 == 2);
    objc_msgSend(v4, "setGeoReferenceFrame:", v6);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
