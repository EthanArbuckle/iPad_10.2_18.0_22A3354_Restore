@implementation CLSInputLocationClue

- (id)place
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return self->_place;
}

- (id)placemark
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return -[CLSPlace placemark](self->_place, "placemark");
}

- (id)region
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CLSClue value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CLSClue value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CLSInputLocationClue placemark](self, "placemark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)regionInPlacemark
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v3 = objc_alloc(MEMORY[0x1E0C9E368]);
  -[CLSInputLocationClue placemark](self, "placemark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  v9 = v8;
  -[CLSInputLocationClue placemark](self, "placemark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "radius");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "cls_generateUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "initWithCenter:radius:identifier:", v14, v7, v9, v13);

  return v15;
}

- (id)location
{
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  char v15;

  -[CLSClue value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[CLSClue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v5, "center");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v5, "clsHorizontalAccuracy");
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v6, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v13, v8, v10, 0.0, v12, 0.0);

LABEL_6:
    return v14;
  }
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) == 0)
  {
    -[CLSInputLocationClue placemark](self, "placemark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[CLSClue value](self, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (double)gpsHorizontalAccuracy
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  double v7;
  char v8;
  double v9;
  void *v10;
  double v11;

  -[CLSClue value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[CLSClue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "clsHorizontalAccuracy");
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
    {
      -[CLSInputLocationClue placemark](self, "placemark");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "horizontalAccuracy");
      v9 = v11;

      goto LABEL_7;
    }
    -[CLSClue value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "horizontalAccuracy");
  }
  v9 = v7;
LABEL_7:

  return v9;
}

- (id)projectedLocation
{
  void *v2;
  void *v3;

  -[CLSInputLocationClue placemark](self, "placemark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CLLocationCoordinate2D)closestCoordinates
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CLLocationCoordinate2D result;

  -[CLSInputLocationClue location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v7 = v6;

  -[CLSInputLocationClue projectedLocation](self, "projectedLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSInputLocationClue location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "distanceFromLocation:", v9);
  v11 = v10;

  if (v11 <= 15.0)
  {
    -[CLSInputLocationClue projectedLocation](self, "projectedLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinate");
    v5 = v13;
    v7 = v14;

  }
  v15 = v5;
  v16 = v7;
  result.longitude = v16;
  result.latitude = v15;
  return result;
}

- (BOOL)isDefinite
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  BOOL v12;

  -[CLSInputLocationClue region](self, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "radius");
  if (v4 <= 20.0)
  {
    v12 = 1;
  }
  else
  {
    -[CLSInputLocationClue location](self, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSInputLocationClue placemark](self, "placemark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "distanceFromLocation:", v7);
    if (v8 >= 0.01)
    {
      v12 = 0;
    }
    else
    {
      -[CLSInputLocationClue placemark](self, "placemark");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "region");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "radius");
      v12 = v11 <= 100.0;

    }
  }

  return v12;
}

- (id)description
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
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v29.receiver = self;
  v29.super_class = (Class)CLSInputLocationClue;
  -[CLSClue description](&v29, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLSClue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tvalue:[%@]"), v6);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tisDefinite:[%d]"), -[CLSInputLocationClue isDefinite](self, "isDefinite"));
  -[CLSInputLocationClue location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tlocation:[%@]"), v7);

  -[CLSInputLocationClue region](self, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tregion:[%@]"), v8);

  -[CLSInputLocationClue regionInPlacemark](self, "regionInPlacemark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tregionInPlacemark:[%@]"), v9);

  -[CLSInputLocationClue placemark](self, "placemark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "location");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "region");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "thoroughfare");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subThoroughfare");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locality");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subLocality");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "administrativeArea");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subAdministrativeArea");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ISOcountryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inlandWater");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ocean");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "areasOfInterest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "flattenWithSeparator:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSInputLocationClue location](self, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "distanceFromLocation:", v16);
    objc_msgSend(v5, "appendFormat:", CFSTR("\n\tplacemark:\n\t\tlocation:[%@]\n\t\tregion:[%@]\n\t\t thoroughfare:[%@] subThoroughfare:[%@] locality:[%@] subLocality:[%@]\n\t\tadministrativeArea:[%@] subAdministrativeArea:[%@] ISOcountryCode:[%@]\n\t\tinlandWater:[%@] ocean:[%@] areasOfInterest:[%@]\n\tdistanceDifference:[%lf]"), v25, v28, v24, v27, v23, v26, v21, v20, v12, v19, v13, v14, v17);

  }
  return v5;
}

- (void)_prepareWithProgressBlock:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  CLSPlace *v7;
  void *v8;
  CLSPlace *v9;
  void *place;
  void *v11;
  char v12;
  CLSLocationCache *locationCache;
  void *v14;
  CLSPlace *v15;
  CLSPlace *v16;
  void *v17;
  void *v18;
  void *v19;
  CLSPlace *v20;
  CLSPlace *v21;
  id v22;

  v4 = a3;
  if (!self->_locationCache)
    __assert_rtn("-[CLSInputLocationClue _prepareWithProgressBlock:]", "CLSClue.m", 870, "_locationCache != nil");
  v22 = v4;
  -[CLSClue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = [CLSPlace alloc];
    -[CLSClue value](self, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CLSPlace initWithPlacemark:](v7, "initWithPlacemark:", v8);
    place = self->_place;
    self->_place = v9;
  }
  else
  {
    -[CLSClue value](self, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) != 0)
    {
      locationCache = self->_locationCache;
      -[CLSClue value](self, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLSLocationCache placemarksForLocation:](locationCache, "placemarksForLocation:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "firstObject");
      place = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CLSPlace initWithPlacemark:]([CLSPlace alloc], "initWithPlacemark:", place);
      v16 = self->_place;
      self->_place = v15;

    }
    else
    {
      -[CLSClue value](self, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CLSCachedGeocoderOperation operationWithLocation:](CLSCachedGeocoderOperation, "operationWithLocation:", v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "performSynchronouslyWithLocationCache:error:", self->_locationCache, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      place = v18;
      if (v18)
      {
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[CLSPlace initWithPlacemark:]([CLSPlace alloc], "initWithPlacemark:", v19);
        v21 = self->_place;
        self->_place = v20;

      }
    }
  }

}

- (unint64_t)numberOfAssets
{
  return self->numberOfAssets;
}

- (void)setNumberOfAssets:(unint64_t)a3
{
  self->numberOfAssets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_place, 0);
}

+ (id)clueWithLocation:(id)a3 locationCache:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  double v10;

  v5 = a4;
  v6 = a3;
  +[CLSClue _clueWithValue:forKey:](CLSInputLocationClue, "_clueWithValue:forKey:", v6, CFSTR("Global Location"));
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7[14];
  v7[14] = v5;
  v9 = v5;

  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  v10 = 0.9;
  if ((v9 & 1) == 0)
    v10 = 1.0;
  objc_msgSend(v7, "setConfidence:", v10);
  return v7;
}

+ (id)cluesWithLocations:(id)a3 locationCache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend((id)objc_opt_class(), "clueWithLocation:locationCache:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v6, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

@end
