@implementation CLSLocationCache

- (CLSLocationCache)initWithURL:(id)a3 dataModelName:(id)a4
{
  CLSLocationCache *v4;
  uint64_t v5;
  NSPredicate *entryPredicateWithContactsPostalAddressTemplate;
  uint64_t v7;
  NSPredicate *entryPredicateWithAddressBookDictionaryTemplate;
  uint64_t v9;
  NSPredicate *entryPredicateWithAddressTemplate;
  uint64_t v11;
  NSPredicate *entryPredicateWithCoordinateTemplate;
  uint64_t v13;
  NSPredicate *entryPredicateWithMUID;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLSLocationCache;
  v4 = -[CLSDBCache initWithURL:dataModelName:](&v16, sel_initWithURL_dataModelName_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(postalAddress = $postalAddress)"));
    v5 = objc_claimAutoreleasedReturnValue();
    entryPredicateWithContactsPostalAddressTemplate = v4->_entryPredicateWithContactsPostalAddressTemplate;
    v4->_entryPredicateWithContactsPostalAddressTemplate = (NSPredicate *)v5;

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(addressDictionaryString = $addressDictionaryString)"));
    v7 = objc_claimAutoreleasedReturnValue();
    entryPredicateWithAddressBookDictionaryTemplate = v4->_entryPredicateWithAddressBookDictionaryTemplate;
    v4->_entryPredicateWithAddressBookDictionaryTemplate = (NSPredicate *)v7;

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(address = $address)"));
    v9 = objc_claimAutoreleasedReturnValue();
    entryPredicateWithAddressTemplate = v4->_entryPredicateWithAddressTemplate;
    v4->_entryPredicateWithAddressTemplate = (NSPredicate *)v9;

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(latitude = $latitude) && (longitude = $longitude) && (coarse = $coarse)"));
    v11 = objc_claimAutoreleasedReturnValue();
    entryPredicateWithCoordinateTemplate = v4->_entryPredicateWithCoordinateTemplate;
    v4->_entryPredicateWithCoordinateTemplate = (NSPredicate *)v11;

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(muid = $muid)"));
    v13 = objc_claimAutoreleasedReturnValue();
    entryPredicateWithMUID = v4->_entryPredicateWithMUID;
    v4->_entryPredicateWithMUID = (NSPredicate *)v13;

  }
  return v4;
}

- (void)invalidateCacheForLocationCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  CLLocationDegrees v12;
  CLLocationDegrees v13;
  char v14;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = objc_msgSend(MEMORY[0x1E0D71860], "horizontalAccuracyIsCoarse:", a4);
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__CLSLocationCache_invalidateCacheForLocationCoordinate_withHorizontalAccuracy___block_invoke;
  v10[3] = &unk_1E84F73F0;
  v12 = latitude;
  v13 = longitude;
  v14 = v7;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v9, "performBlockAndWait:", v10);

}

- (id)dataModelName
{
  return CFSTR("CLSLocationCacheModel");
}

- (id)predicateForCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4
{
  return -[CLSLocationCache predicateForCoordinate:withHorizontalAccuracy:queryAccuracy:](self, "predicateForCoordinate:withHorizontalAccuracy:queryAccuracy:", a3.latitude, a3.longitude, a4, *MEMORY[0x1E0C9E490]);
}

- (id)predicateForCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4 queryAccuracy:(double)a5
{
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3.latitude * 0.0174532925;
  v7 = a3.longitude * 0.0174532925;
  v8 = a5 / 6378137.0;
  v9 = (v6 + a5 / 6378137.0) * 57.2957795;
  v10 = (v7 - v8) * 57.2957795;
  v11 = (v6 - v8) * 57.2957795;
  v12 = (v7 + v8) * 57.2957795;
  if (v11 <= v9)
    v13 = v11;
  else
    v13 = v9;
  if (v11 <= v9)
    v11 = v9;
  if (v12 <= v10)
    v14 = v12;
  else
    v14 = v10;
  if (v12 <= v10)
    v12 = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%f <= latitude && latitude <= %f && %f <= longitude && longitude <= %f"), *(_QWORD *)&v13, *(_QWORD *)&v11, *(_QWORD *)&v14, *(_QWORD *)&v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(MEMORY[0x1E0D71860], "horizontalAccuracyIsCoarse:", a4);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("coarse == %d"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3528];
  v22[0] = v15;
  v22[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)nearestEntryForCoordinate:(CLLocationCoordinate2D)a3 entries:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  CLLocationCoordinate2D v15;
  double v16;
  double v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CLLocationCoordinate2D v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v4 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v21;
    v9 = 1.79769313e308;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "latitude", 0, 0);
        v13 = v12;
        objc_msgSend(v11, "longitude");
        v15 = CLLocationCoordinate2DMake(v13, v14);
        CLLocationCoordinate2DGetDistanceFrom();
        if (v16 < v9)
        {
          v17 = v16;
          v18 = v11;

          v7 = v18;
          v9 = v17;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16, *(_QWORD *)&v15.latitude, *(_QWORD *)&v15.longitude);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasRegion:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "center");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "clsHorizontalAccuracy");
  v10 = v9;

  return -[CLSLocationCache hasCoordinate:withHorizontalAccuracy:](self, "hasCoordinate:withHorizontalAccuracy:", v6, v8, v10);
}

- (BOOL)hasCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  CLLocationDegrees v15;
  CLLocationDegrees v16;
  double v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__CLSLocationCache_hasCoordinate_withHorizontalAccuracy___block_invoke;
  v12[3] = &unk_1E84F7418;
  v12[4] = self;
  v15 = latitude;
  v16 = longitude;
  v17 = a4;
  v9 = v8;
  v13 = v9;
  v14 = &v18;
  objc_msgSend(v9, "performBlockAndWait:", v12);
  v10 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (void)setPlacemarks:(id)a3 forLocation:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CLSLocationCache setPlacemarks:forCLLocation:](self, "setPlacemarks:forCLLocation:", v15, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "center");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v7, "clsHorizontalAccuracy");
      v13 = v12;

      -[CLSLocationCache setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:](self, "setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:", v15, v9, v11, v13);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CLSLocationCache setPlacemarks:forAddressDictionary:](self, "setPlacemarks:forAddressDictionary:", v15, v6);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CLSLocationCache setPlacemarks:forLocationAddress:](self, "setPlacemarks:forLocationAddress:", v15, v6);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v6, "location");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[CLSLocationCache setPlacemarks:forCLLocation:](self, "setPlacemarks:forCLLocation:", v15, v14);

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[CLSLocationCache setPlacemarks:forPostalAddress:](self, "setPlacemarks:forPostalAddress:", v15, v6);
          }
        }
      }
    }
  }

}

- (void)insertBatchesOfPlacemarks:(id)a3 forLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  CLSLocationCache *v16;

  v6 = a3;
  v7 = a4;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__CLSLocationCache_insertBatchesOfPlacemarks_forLocations___block_invoke;
  v12[3] = &unk_1E84F7950;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  v16 = self;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "performBlockAndWait:", v12);

}

- (void)setPlacemarks:(id)a3 forCLLocation:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v6 = a4;
  v13 = a3;
  objc_msgSend(v6, "coordinate");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "horizontalAccuracy");
  v12 = v11;

  -[CLSLocationCache setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:](self, "setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:", v13, v8, v10, v12);
}

- (void)setPlacemarks:(id)a3 forLocationCoordinate:(CLLocationCoordinate2D)a4 withHorizontalAccuracy:(double)a5
{
  double longitude;
  double latitude;
  id v9;
  uint64_t v10;
  NSPredicate *entryPredicateWithCoordinateTemplate;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  char v18;
  _QWORD v19[3];
  _QWORD v20[4];
  CLLocationCoordinate2D v21;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v20[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v21.latitude = latitude;
  v21.longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v21))
  {
    v10 = objc_msgSend(MEMORY[0x1E0D71860], "horizontalAccuracyIsCoarse:", a5);
    entryPredicateWithCoordinateTemplate = self->_entryPredicateWithCoordinateTemplate;
    v19[0] = CFSTR("latitude");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", latitude);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v19[1] = CFSTR("longitude");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", longitude);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v13;
    v19[2] = CFSTR("coarse");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPredicate predicateWithSubstitutionVariables:](entryPredicateWithCoordinateTemplate, "predicateWithSubstitutionVariables:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__CLSLocationCache_setPlacemarks_forLocationCoordinate_withHorizontalAccuracy___block_invoke;
    v17[3] = &__block_descriptor_49_e31_v16__0__CLSLocationCacheEntry_8l;
    *(double *)&v17[4] = latitude;
    *(double *)&v17[5] = longitude;
    v18 = v10;
    -[CLSLocationCache _setPlacemarks:forEntryWithPredicate:entrySetupBlock:](self, "_setPlacemarks:forEntryWithPredicate:entrySetupBlock:", v9, v16, v17);

  }
}

- (id)placemarksForLocationCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4
{
  return -[CLSLocationCache placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:](self, "placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:", a3.latitude, a3.longitude, a4, *MEMORY[0x1E0C9E490]);
}

- (id)placemarksForLocationCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4 queryAccuracy:(double)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  CLLocationDegrees v17;
  CLLocationDegrees v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__807;
  v25 = __Block_byref_object_dispose__808;
  v26 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__CLSLocationCache_placemarksForLocationCoordinate_withHorizontalAccuracy_queryAccuracy___block_invoke;
  v14[3] = &unk_1E84F7460;
  v14[4] = self;
  v17 = latitude;
  v18 = longitude;
  v19 = a4;
  v20 = a5;
  v11 = v10;
  v15 = v11;
  v16 = &v21;
  objc_msgSend(v11, "performBlockAndWait:", v14);
  v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (void)setPlacemarks:(id)a3 forLocationAddress:(id)a4
{
  id v6;
  id v7;
  NSPredicate *entryPredicateWithAddressTemplate;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  entryPredicateWithAddressTemplate = self->_entryPredicateWithAddressTemplate;
  v16 = CFSTR("address");
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPredicate predicateWithSubstitutionVariables:](entryPredicateWithAddressTemplate, "predicateWithSubstitutionVariables:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__CLSLocationCache_setPlacemarks_forLocationAddress___block_invoke;
  v13[3] = &unk_1E84F7488;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[CLSLocationCache _setPlacemarks:forEntryWithPredicate:entrySetupBlock:](self, "_setPlacemarks:forEntryWithPredicate:entrySetupBlock:", v12, v10, v13);

}

- (id)placemarksForLocationAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__807;
  v18 = __Block_byref_object_dispose__808;
  v19 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__CLSLocationCache_placemarksForLocationAddress___block_invoke;
  v10[3] = &unk_1E84F9380;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)setPlacemarks:(id)a3 forAddressDictionary:(id)a4
{
  id v6;
  void *v7;
  NSPredicate *entryPredicateWithAddressBookDictionaryTemplate;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CLSLocationCache _stringifyAddressDictionaryValues:](self, "_stringifyAddressDictionaryValues:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  entryPredicateWithAddressBookDictionaryTemplate = self->_entryPredicateWithAddressBookDictionaryTemplate;
  v16 = CFSTR("addressDictionaryString");
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPredicate predicateWithSubstitutionVariables:](entryPredicateWithAddressBookDictionaryTemplate, "predicateWithSubstitutionVariables:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__CLSLocationCache_setPlacemarks_forAddressDictionary___block_invoke;
  v13[3] = &unk_1E84F7488;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[CLSLocationCache _setPlacemarks:forEntryWithPredicate:entrySetupBlock:](self, "_setPlacemarks:forEntryWithPredicate:entrySetupBlock:", v12, v10, v13);

}

- (id)placemarksForAddressDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__807;
  v18 = __Block_byref_object_dispose__808;
  v19 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__CLSLocationCache_placemarksForAddressDictionary___block_invoke;
  v10[3] = &unk_1E84F9380;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)setPlacemarks:(id)a3 forPostalAddress:(id)a4
{
  id v6;
  void *v7;
  NSPredicate *entryPredicateWithContactsPostalAddressTemplate;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CLSLocationCache _stringifyPostalAddress:](self, "_stringifyPostalAddress:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  entryPredicateWithContactsPostalAddressTemplate = self->_entryPredicateWithContactsPostalAddressTemplate;
  v16 = CFSTR("postalAddress");
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPredicate predicateWithSubstitutionVariables:](entryPredicateWithContactsPostalAddressTemplate, "predicateWithSubstitutionVariables:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__CLSLocationCache_setPlacemarks_forPostalAddress___block_invoke;
  v13[3] = &unk_1E84F7488;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[CLSLocationCache _setPlacemarks:forEntryWithPredicate:entrySetupBlock:](self, "_setPlacemarks:forEntryWithPredicate:entrySetupBlock:", v12, v10, v13);

}

- (id)placemarksForPostalAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__807;
  v18 = __Block_byref_object_dispose__808;
  v19 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__CLSLocationCache_placemarksForPostalAddress___block_invoke;
  v10[3] = &unk_1E84F9380;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)placemarksForLocation:(id)a3
{
  return -[CLSLocationCache placemarksForLocation:withQueryAccuracy:](self, "placemarksForLocation:withQueryAccuracy:", a3, *MEMORY[0x1E0C9E490]);
}

- (id)placemarksForLocation:(id)a3 withQueryAccuracy:(double)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v19;
  CLSLitePlacemark *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "center");
      v9 = v13;
      v11 = v14;
      objc_msgSend(v7, "clsHorizontalAccuracy");
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CLSLocationCache placemarksForAddressDictionary:](self, "placemarksForAddressDictionary:", v6);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CLSLocationCache placemarksForLocationAddress:](self, "placemarksForLocationAddress:", v6);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = *MEMORY[0x1E0C9E490];
      if (*MEMORY[0x1E0C9E490] == a4)
      {
        v20 = -[CLSLitePlacemark initWithCLPlacemark:]([CLSLitePlacemark alloc], "initWithCLPlacemark:", v6);
        v28[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v17 = (void *)v21;

        goto LABEL_7;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = 0;
          goto LABEL_7;
        }
        -[CLSLocationCache placemarksForPostalAddress:](self, "placemarksForPostalAddress:", v6);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      v19 = *MEMORY[0x1E0C9E490];
      if (*MEMORY[0x1E0C9E490] == a4)
      {
        v27 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1, v19);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
    }
    objc_msgSend(v6, "location", v19);
    v20 = (CLSLitePlacemark *)objc_claimAutoreleasedReturnValue();
    -[CLSLitePlacemark coordinate](v20, "coordinate");
    v23 = v22;
    v25 = v24;
    -[CLSLitePlacemark horizontalAccuracy](v20, "horizontalAccuracy");
    -[CLSLocationCache placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:](self, "placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:", v23, v25, v26, a4);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v7 = v6;
  objc_msgSend(v7, "coordinate");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "horizontalAccuracy");
LABEL_5:
  v15 = v12;

  -[CLSLocationCache placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:](self, "placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:", v9, v11, v15, a4);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v17 = (void *)v16;
LABEL_7:

  return v17;
}

- (id)_stringifyAddressDictionaryValues:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "appendFormat:", CFSTR("%@_"), v12);
      v13 = objc_msgSend(v6, "length");

      if (v13 > 0xFF)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  return v6;
}

- (id)_stringifyCircularRegionValue:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v7 = v6;
  objc_msgSend(v4, "center");
  v9 = v8;
  objc_msgSend(v4, "radius");
  v11 = v10;

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%.5lf_%.5lf_%.2lf"), v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_stringifyPostalAddress:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPlacemark:(id)a3 forMUID:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  NSPredicate *entryPredicateWithMUID;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  const __CFString *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v16[0] = a3;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = a3;
    objc_msgSend(v6, "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    entryPredicateWithMUID = self->_entryPredicateWithMUID;
    v14 = CFSTR("muid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPredicate predicateWithSubstitutionVariables:](entryPredicateWithMUID, "predicateWithSubstitutionVariables:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__CLSLocationCache_setPlacemark_forMUID___block_invoke;
    v13[3] = &__block_descriptor_40_e31_v16__0__CLSLocationCacheEntry_8l;
    v13[4] = a4;
    -[CLSLocationCache _setPlacemarks:forEntryWithPredicate:entrySetupBlock:](self, "_setPlacemarks:forEntryWithPredicate:entrySetupBlock:", v8, v12, v13);

  }
}

- (id)placemarkForMUID:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__807;
  v17 = __Block_byref_object_dispose__808;
  v18 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__CLSLocationCache_placemarkForMUID___block_invoke;
  v9[3] = &unk_1E84F79A0;
  v9[4] = self;
  v12 = a3;
  v6 = v5;
  v10 = v6;
  v11 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)invalidateCacheForMUID:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  unint64_t v9;

  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CLSLocationCache_invalidateCacheForMUID___block_invoke;
  v7[3] = &unk_1E84F9308;
  v8 = v5;
  v9 = a3;
  v7[4] = self;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CLSLocationCache *v9;
  double v10;

  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CLSLocationCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke;
  v7[3] = &unk_1E84F9308;
  v10 = a3;
  v8 = v5;
  v9 = self;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

- (id)fetchPlacemarkForLocation:(id)a3 withQueryAccuracy:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CLSLocationCache placemarksForLocation:withQueryAccuracy:](self, "placemarksForLocation:withQueryAccuracy:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[CLSCachedGeocoderOperation operationForceGeocoderWithLocation:](CLSCachedGeocoderOperation, "operationForceGeocoderWithLocation:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v9, "performSynchronouslyWithLocationCache:error:", self, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    if (v10)
    {
      objc_msgSend(v6, "coordinate");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v6, "horizontalAccuracy");
      -[CLSLocationCache setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:](self, "setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:", v10, v13, v15, v16);
      objc_msgSend(v10, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CLSLocationCache fetchPlacemarkForLocation:withQueryAccuracy:]";
        v23 = 2112;
        v24 = v11;
        _os_log_error_impl(&dword_1CAB79000, v18, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
      }

      v8 = 0;
    }

  }
  return v8;
}

- (void)_setPlacemarks:(id)a3 forEntryWithPredicate:(id)a4 entrySetupBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  CLSLocationCache *v16;
  id v17;
  id v18;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (v12 && objc_msgSend(v12, "count"))
  {
    -[CLSDBCache managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__CLSLocationCache__setPlacemarks_forEntryWithPredicate_entrySetupBlock___block_invoke;
    v13[3] = &unk_1E84F74D0;
    v14 = v8;
    v15 = v10;
    v18 = v9;
    v16 = self;
    v17 = v12;
    v11 = v10;
    objc_msgSend(v11, "performBlockAndWait:", v13);

  }
}

- (id)_litePlacemarksFromManagedPlacemarks:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[CLSLocationCache _litePlacemarkFromManagedPlacemark:](self, "_litePlacemarkFromManagedPlacemark:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_insertManagedPlacemarksForLitePlacemarks:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[CLSLocationCache _insertManagedPlacemarkForLitePlacemark:inContext:](self, "_insertManagedPlacemarkForLitePlacemark:inContext:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)_insertManagedPlacemarkForLitePlacemark:(id)a3 inContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B20];
  v7 = a4;
  +[CLSManagedPlacemark entityName](CLSManagedPlacemark, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "coordinate");
    v14 = v13;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9E500];
    v14 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  objc_msgSend(v9, "setLatitude:", v12);
  objc_msgSend(v9, "setLongitude:", v14);
  objc_msgSend(v5, "region");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "center");
    v19 = v18;
  }
  else
  {
    v17 = *MEMORY[0x1E0C9E500];
    v19 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  objc_msgSend(v9, "setRegionLatitude:", v17);
  objc_msgSend(v9, "setRegionLongitude:", v19);
  objc_msgSend(v16, "radius");
  objc_msgSend(v9, "setRegionRadius:");
  objc_msgSend(v16, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRegionIdentifier:", v20);

  objc_msgSend(v5, "thoroughfare");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThoroughfare:", v21);

  objc_msgSend(v5, "subThoroughfare");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSubThoroughfare:", v22);

  objc_msgSend(v5, "locality");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocality:", v23);

  objc_msgSend(v5, "subLocality");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSubLocality:", v24);

  objc_msgSend(v5, "administrativeArea");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdministrativeArea:", v25);

  objc_msgSend(v5, "administrativeAreaCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdministrativeAreaCode:", v26);

  objc_msgSend(v5, "subAdministrativeArea");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSubAdministrativeArea:", v27);

  objc_msgSend(v5, "ISOcountryCode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsoCountryCode:", v28);

  objc_msgSend(v5, "inlandWater");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInlandWater:", v29);

  objc_msgSend(v5, "ocean");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOcean:", v30);

  objc_msgSend(v9, "setIsIsland:", objc_msgSend(v5, "isIsland"));
  objc_msgSend(v5, "areasOfInterest");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(v31, "componentsJoinedByString:", CFSTR("_#_"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v9, "setAreasOfInterest:", v32);

  objc_msgSend(v5, "revGeoLocationData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRevGeoLocationData:", v33);

  objc_msgSend(v5, "geoServiceProvider");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGeoServiceProvider:", v34);

  objc_msgSend(v5, "popularityScoresOrderedByAOI");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(v35, "componentsJoinedByString:", CFSTR("_#_"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  objc_msgSend(v9, "setPopularityScoresOrderedByAOI:", v36);

  return v9;
}

- (id)_litePlacemarkFromManagedPlacemark:(id)a3
{
  id v3;
  CLSLitePlacemark *v4;
  double v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  double latitude;
  double longitude;
  void *v10;
  double v11;
  CLLocationDegrees v12;
  CLLocationDegrees v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  id v52;
  unint64_t v53;
  CLSLitePlacemark *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  _BYTE v62[128];
  uint64_t v63;
  CLLocationCoordinate2D v64;
  CLLocationCoordinate2D v65;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(CLSLitePlacemark);
  objc_msgSend(v3, "latitude");
  v6 = v5;
  objc_msgSend(v3, "longitude");
  v64 = CLLocationCoordinate2DMake(v6, v7);
  latitude = v64.latitude;
  longitude = v64.longitude;
  if (CLLocationCoordinate2DIsValid(v64))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
    -[CLSLitePlacemark setLocation:](v4, "setLocation:", v10);

  }
  else
  {
    -[CLSLitePlacemark setLocation:](v4, "setLocation:", 0);
  }
  objc_msgSend(v3, "regionLatitude");
  v12 = v11;
  objc_msgSend(v3, "regionLongitude");
  v65 = CLLocationCoordinate2DMake(v12, v13);
  v14 = v65.latitude;
  v15 = v65.longitude;
  if (CLLocationCoordinate2DIsValid(v65))
  {
    v16 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(v3, "regionRadius");
    v18 = v17;
    objc_msgSend(v3, "regionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithCenter:radius:identifier:", v19, v14, v15, v18);

    -[CLSLitePlacemark setRegion:](v4, "setRegion:", v20);
  }
  objc_msgSend(v3, "thoroughfare");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setThoroughfare:](v4, "setThoroughfare:", v21);

  objc_msgSend(v3, "subThoroughfare");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setSubThoroughfare:](v4, "setSubThoroughfare:", v22);

  objc_msgSend(v3, "locality");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setLocality:](v4, "setLocality:", v23);

  objc_msgSend(v3, "subLocality");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setSubLocality:](v4, "setSubLocality:", v24);

  objc_msgSend(v3, "administrativeArea");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setAdministrativeArea:](v4, "setAdministrativeArea:", v25);

  objc_msgSend(v3, "administrativeAreaCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setAdministrativeAreaCode:](v4, "setAdministrativeAreaCode:", v26);

  objc_msgSend(v3, "subAdministrativeArea");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setSubAdministrativeArea:](v4, "setSubAdministrativeArea:", v27);

  objc_msgSend(v3, "isoCountryCode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setISOcountryCode:](v4, "setISOcountryCode:", v28);

  objc_msgSend(v3, "inlandWater");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setInlandWater:](v4, "setInlandWater:", v29);

  objc_msgSend(v3, "ocean");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setOcean:](v4, "setOcean:", v30);

  -[CLSLitePlacemark setIsIsland:](v4, "setIsIsland:", objc_msgSend(v3, "isIsland"));
  objc_msgSend(v3, "areasOfInterest");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    objc_msgSend(v31, "componentsSeparatedByString:", CFSTR("_#_"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  -[CLSLitePlacemark setAreasOfInterest:](v4, "setAreasOfInterest:", v33);

  objc_msgSend(v3, "revGeoLocationData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setRevGeoLocationData:](v4, "setRevGeoLocationData:", v34);

  objc_msgSend(v3, "geoServiceProvider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setGeoServiceProvider:](v4, "setGeoServiceProvider:", v35);

  objc_msgSend(v3, "popularityScoresOrderedByAOI");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    v55 = v4;
    objc_msgSend(v36, "componentsSeparatedByString:", CFSTR("_#_"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v40 = v38;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v57;
      v44 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v57 != v43)
            objc_enumerationMutation(v40);
          v46 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "doubleValue");
          objc_msgSend(v46, "numberWithDouble:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (!v47)
          {
            v49 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
            v48 = &unk_1E8511BD8;
            if (v49)
            {
              *(_DWORD *)buf = 138412290;
              v61 = v37;
              _os_log_error_impl(&dword_1CAB79000, v44, OS_LOG_TYPE_ERROR, "[CLSLocationCache] Could not convert deserialize AOI string %@ to NSNumbers", buf, 0xCu);
              v48 = &unk_1E8511BD8;
            }
          }
          objc_msgSend(v39, "addObject:", v48);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v42);
    }

    v4 = v55;
  }
  else
  {
    v39 = 0;
  }

  -[CLSLitePlacemark setPopularityScoresOrderedByAOI:](v4, "setPopularityScoresOrderedByAOI:", v39);
  -[CLSLitePlacemark areasOfInterest](v4, "areasOfInterest");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    -[CLSLitePlacemark popularityScoresOrderedByAOI](v4, "popularityScoresOrderedByAOI");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v51)
    {
      v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v50, "count"))
      {
        v53 = 0;
        do
          objc_msgSend(v52, "setObject:atIndexedSubscript:", &unk_1E8511BD8, v53++);
        while (v53 < objc_msgSend(v50, "count"));
      }
      -[CLSLitePlacemark setPopularityScoresOrderedByAOI:](v4, "setPopularityScoresOrderedByAOI:", v52);

    }
  }

  return v4;
}

- (void)invalidateCacheForGeoServiceProviderChangeToProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  CLSLocationCache *v11;

  v4 = a3;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__CLSLocationCache_invalidateCacheForGeoServiceProviderChangeToProvider___block_invoke;
  v8[3] = &unk_1E84F8ED0;
  v9 = v4;
  v10 = v5;
  v11 = self;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPredicateWithMUID, 0);
  objc_storeStrong((id *)&self->_entryPredicateWithAddressTemplate, 0);
  objc_storeStrong((id *)&self->_entryPredicateWithCoordinateTemplate, 0);
  objc_storeStrong((id *)&self->_entryPredicateWithAddressBookDictionaryTemplate, 0);
  objc_storeStrong((id *)&self->_entryPredicateWithContactsPostalAddressTemplate, 0);
}

void __73__CLSLocationCache_invalidateCacheForGeoServiceProviderChangeToProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  uint64_t v60;
  _QWORD v61[5];

  v61[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSManagedPlacemark entityName](CLSManagedPlacemark, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("geoServiceProvider != %@"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71A98], "autoNaviCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D71A98], "isAutoNaviRevGeoProvider:", *(_QWORD *)(a1 + 32)))
    v7 = CFSTR("isoCountryCode == %@");
  else
    v7 = CFSTR("isoCountryCode != %@");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v7, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v61[0] = v5;
  v61[1] = v8;
  v48 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v11);
  v12 = *(void **)(a1 + 40);
  v55 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v4, &v55);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v55;
  if (objc_msgSend(v13, "count"))
  {
    v46 = v6;
    v15 = (void *)MEMORY[0x1E0C97B48];
    +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchRequestWithEntityName:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY placemarks IN %@"), v13);
    v18 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v18;
    objc_msgSend(v17, "setPredicate:", v18);
    v45 = v17;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v17);
    objc_msgSend(v19, "setResultType:", 2);
    v20 = *(void **)(a1 + 40);
    v54 = v14;
    v43 = v19;
    objc_msgSend(v20, "executeRequest:error:", v19, &v54);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v54;

    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "loggingConnection");
    v24 = objc_claimAutoreleasedReturnValue();

    v47 = v5;
    v42 = v4;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v22;
        _os_log_error_impl(&dword_1CAB79000, v24, OS_LOG_TYPE_ERROR, "Failed to batch location cache entries: Error: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v21, "result");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v58 = v25;
      v59 = 2112;
      v60 = v26;
      _os_log_impl(&dword_1CAB79000, v24, OS_LOG_TYPE_INFO, "Batch deleted %@ location cache entries, for provider %@", buf, 0x16u);

    }
    v27 = v21;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v29 = v13;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v51 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "objectID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v31);
    }

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithObjectIDs:", v28);
    v36 = *(void **)(a1 + 40);
    v49 = v22;
    objc_msgSend(v36, "executeRequest:error:", v35, &v49);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v49;

    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "loggingConnection");
    v39 = objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v5 = v47;
      v4 = v42;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v14;
        _os_log_error_impl(&dword_1CAB79000, v39, OS_LOG_TYPE_ERROR, "Failed to batch location cache entries: Error: %@", buf, 0xCu);
      }
    }
    else
    {
      v5 = v47;
      v4 = v42;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v37, "result");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138478083;
        v58 = v40;
        v59 = 2112;
        v60 = v41;
        _os_log_impl(&dword_1CAB79000, v39, OS_LOG_TYPE_INFO, "Batch deleted %{private}@ location cache placemarks, for provider %@", buf, 0x16u);

      }
    }

    objc_msgSend(*(id *)(a1 + 48), "_save");
    v11 = v44;
    v6 = v46;
  }

}

void __73__CLSLocationCache__setPlacemarks_forEntryWithPredicate_entrySetupBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(a1 + 40);
  v22 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if (v6 && objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v8, "placemarks", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(a1 + 40), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C97B20];
    +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertNewObjectForEntityForName:inManagedObjectContext:", v15, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 48), "_insertManagedPlacemarksForLitePlacemarks:inContext:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlacemarks:", v16);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  objc_msgSend(v8, "setUpdateTimestamp:");

  objc_msgSend(*(id *)(a1 + 48), "_save");
}

void __64__CLSLocationCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("updateTimestamp <= %f"), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  v6 = *(void **)(a1 + 32);
  v24 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;
  v9 = v8;
  if (v7)
  {
    v18 = v8;
    v19 = v5;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
          v17 = (void *)MEMORY[0x1D1796094]();
          objc_msgSend(*(id *)(a1 + 32), "deleteObject:", v16);
          if (v13 >= 0x13)
          {
            objc_msgSend(*(id *)(a1 + 40), "_save");
            v13 = 0;
          }
          else
          {
            ++v13;
          }
          objc_autoreleasePoolPop(v17);
          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }

    objc_msgSend(*(id *)(a1 + 40), "_save");
    v9 = v18;
    v5 = v19;
  }

}

void __43__CLSLocationCache_invalidateCacheForMUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v6 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, CFSTR("muid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithSubstitutionVariables:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v9);
  objc_msgSend(v4, "setFetchLimit:", 1);
  v10 = *(void **)(a1 + 40);
  v15 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v4, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (objc_msgSend(v11, "count") == 1)
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deleteObject:", v14);

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }

}

void __37__CLSLocationCache_placemarkForMUID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1[4] + 88);
  v22 = CFSTR("muid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithSubstitutionVariables:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setPredicate:", v8);
  v9 = (void *)a1[5];
  v19 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v4, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10 && objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "placemarks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)a1[4];
    objc_msgSend(v13, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_litePlacemarkFromManagedPlacemark:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[6] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not unarchive litePlacemark, error %@", buf, 0xCu);
    }

  }
}

uint64_t __41__CLSLocationCache_setPlacemark_forMUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMuid:", *(_QWORD *)(a1 + 32));
}

void __47__CLSLocationCache_placemarksForPostalAddress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)v5[7];
  v22 = CFSTR("postalAddress");
  objc_msgSend(v5, "_stringifyPostalAddress:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithSubstitutionVariables:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setPredicate:", v10);
  v11 = *(void **)(a1 + 48);
  v19 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v4, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (v12 && objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "placemarks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_litePlacemarksFromManagedPlacemarks:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not unarchive litePlacemarks, error %@", buf, 0xCu);
    }

  }
}

void __51__CLSLocationCache_setPlacemarks_forPostalAddress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    objc_msgSend(v7, "setLatitude:");
    objc_msgSend(v7, "setLongitude:", v6);
    objc_msgSend(v7, "setCoarse:", 0);
  }
  objc_msgSend(v7, "setPostalAddress:", *(_QWORD *)(a1 + 40));

}

void __51__CLSLocationCache_placemarksForAddressDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)v5[8];
  v22 = CFSTR("addressDictionaryString");
  objc_msgSend(v5, "_stringifyAddressDictionaryValues:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithSubstitutionVariables:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setPredicate:", v10);
  v11 = *(void **)(a1 + 48);
  v19 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v4, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (v12 && objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "placemarks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_litePlacemarksFromManagedPlacemarks:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not unarchive litePlacemarks, error %@", buf, 0xCu);
    }

  }
}

void __55__CLSLocationCache_setPlacemarks_forAddressDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    objc_msgSend(v7, "setLatitude:");
    objc_msgSend(v7, "setLongitude:", v6);
    objc_msgSend(v7, "setCoarse:", 0);
  }
  objc_msgSend(v7, "setAddressDictionaryString:", *(_QWORD *)(a1 + 40));

}

void __49__CLSLocationCache_placemarksForLocationAddress___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = a1[5];
  v6 = *(void **)(a1[4] + 80);
  v21 = CFSTR("address");
  v22[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithSubstitutionVariables:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setPredicate:", v8);
  v9 = (void *)a1[6];
  v18 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v4, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v10 && objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)a1[4];
    objc_msgSend(v12, "placemarks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_litePlacemarksFromManagedPlacemarks:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1[7] + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not unarchive litePlacemarks, error %@", buf, 0xCu);
    }

  }
}

void __53__CLSLocationCache_setPlacemarks_forLocationAddress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    objc_msgSend(v7, "setLatitude:");
    objc_msgSend(v7, "setLongitude:", v6);
    objc_msgSend(v7, "setCoarse:", 0);
  }
  objc_msgSend(v7, "setAddress:", *(_QWORD *)(a1 + 40));

}

void __89__CLSLocationCache_placemarksForLocationCoordinate_withHorizontalAccuracy_queryAccuracy___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "predicateForCoordinate:withHorizontalAccuracy:queryAccuracy:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  v6 = *(void **)(a1 + 40);
  v15 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "nearestEntryForCoordinate:entries:", v7, *(double *)(a1 + 56), *(double *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v9, "placemarks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_litePlacemarksFromManagedPlacemarks:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

void __79__CLSLocationCache_setPlacemarks_forLocationCoordinate_withHorizontalAccuracy___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLatitude:", v3);
  objc_msgSend(v4, "setLongitude:", *(double *)(a1 + 40));
  objc_msgSend(v4, "setCoarse:", *(unsigned __int8 *)(a1 + 48));

}

uint64_t __59__CLSLocationCache_insertBatchesOfPlacemarks_forLocations___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CLLocationCoordinate2D v28;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8 + v10, (_QWORD)v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "coordinate");
        if (v11)
        {
          v15 = v13;
          v16 = v14;
          if (objc_msgSend(v11, "count"))
          {
            v28.latitude = v15;
            v28.longitude = v16;
            if (CLLocationCoordinate2DIsValid(v28))
            {
              v17 = (void *)MEMORY[0x1E0C97B20];
              +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "insertNewObjectForEntityForName:inManagedObjectContext:", v18, *(_QWORD *)(a1 + 48));
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "setLatitude:", v15);
              objc_msgSend(v19, "setLongitude:", v16);
              objc_msgSend(v19, "setCoarse:", objc_msgSend(MEMORY[0x1E0D71860], "locationIsCoarse:", v12));
              objc_msgSend(v19, "setUpdateTimestamp:", v4);
              objc_msgSend(*(id *)(a1 + 56), "_insertManagedPlacemarksForLitePlacemarks:inContext:", v11, *(_QWORD *)(a1 + 48));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setPlacemarks:", v20);

            }
          }
        }

        ++v10;
      }
      while (v7 != v10);
      v8 += v10;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  return objc_msgSend(*(id *)(a1 + 56), "_save");
}

void __57__CLSLocationCache_hasCoordinate_withHorizontalAccuracy___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "predicateForCoordinate:withHorizontalAccuracy:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  v6 = *(void **)(a1 + 40);
  v9 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  if (v7 && objc_msgSend(v7, "count"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __80__CLSLocationCache_invalidateCacheForLocationCoordinate_withHorizontalAccuracy___block_invoke(uint64_t a1)
{
  void *v2;
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
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSLocationCacheEntry entityName](CLSLocationCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v17[0] = CFSTR("latitude");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v17[1] = CFSTR("longitude");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  v17[2] = CFSTR("coarse");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithSubstitutionVariables:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setPredicate:", v10);
  v11 = *(void **)(a1 + 40);
  v16 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v4, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  if (objc_msgSend(v12, "count") == 1)
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteObject:", v15);

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }

}

+ (id)defaultCacheName
{
  return CFSTR("CLSLocationCache");
}

+ (BOOL)cachedRegion:(id)a3 isMatchingOtherRegion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D71860];
  objc_msgSend(v5, "clsHorizontalAccuracy");
  LODWORD(v7) = objc_msgSend(v7, "horizontalAccuracyIsCoarse:");
  v8 = (void *)MEMORY[0x1E0D71860];
  objc_msgSend(v6, "clsHorizontalAccuracy");
  if ((_DWORD)v7 == objc_msgSend(v8, "horizontalAccuracyIsCoarse:"))
  {
    v10 = *MEMORY[0x1E0C9E490];
    objc_msgSend(v5, "center");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "center");
    v17 = (v12 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    v18 = (v14 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    v19 = (v12 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    v20 = (v14 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    if (v19 <= v17)
      v21 = (v12 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    else
      v21 = (v12 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    if (v19 <= v17)
      v19 = (v12 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    if (v20 <= v18)
      v22 = (v14 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    else
      v22 = (v14 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    if (v20 <= v18)
      v20 = (v14 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    v23 = v21 <= v15;
    if (v15 > v19)
      v23 = 0;
    if (v22 > v16)
      v23 = 0;
    v9 = v16 <= v20 && v23;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
