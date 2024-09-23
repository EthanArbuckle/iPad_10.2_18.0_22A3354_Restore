@implementation EKStructuredLocation

- (BOOL)isPrediction
{
  void *v2;
  BOOL v3;

  -[EKStructuredLocation predictedLOI](self, "predictedLOI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (EKPredictedLocationOfInterest)predictedLOI
{
  return self->_predictedLOI;
}

- (NSString)title
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B7A0]);
}

- (NSString)address
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B748]);
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_11 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_11, &__block_literal_global_70);
  return (id)knownIdentityKeysForComparison_keys_11;
}

void __54__EKStructuredLocation_knownIdentityKeysForComparison__block_invoke()
{
  void *v0;

  v0 = (void *)knownIdentityKeysForComparison_keys_11;
  knownIdentityKeysForComparison_keys_11 = (uint64_t)&unk_1E47B5C38;

}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_10 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_10, &__block_literal_global_14_0);
  return (id)knownSingleValueKeysForComparison_keys_10;
}

void __57__EKStructuredLocation_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[11];

  v7[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B760];
  v7[0] = *MEMORY[0x1E0D0B748];
  v7[1] = v0;
  v1 = *MEMORY[0x1E0D0B770];
  v7[2] = *MEMORY[0x1E0D0B768];
  v7[3] = v1;
  v2 = *MEMORY[0x1E0D0B780];
  v7[4] = *MEMORY[0x1E0D0B778];
  v7[5] = v2;
  v3 = *MEMORY[0x1E0D0B790];
  v7[6] = *MEMORY[0x1E0D0B788];
  v7[7] = v3;
  v4 = *MEMORY[0x1E0D0B7A0];
  v7[8] = *MEMORY[0x1E0D0B798];
  v7[9] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)knownSingleValueKeysForComparison_keys_10;
  knownSingleValueKeysForComparison_keys_10 = v5;

}

+ (id)knownSingleValueKeysToSkipForUIComparison
{
  if (knownSingleValueKeysToSkipForUIComparison_onceToken != -1)
    dispatch_once(&knownSingleValueKeysToSkipForUIComparison_onceToken, &__block_literal_global_16_1);
  return (id)knownSingleValueKeysToSkipForUIComparison_keys;
}

void __65__EKStructuredLocation_knownSingleValueKeysToSkipForUIComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B790];
  v3[0] = *MEMORY[0x1E0D0B768];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownSingleValueKeysToSkipForUIComparison_keys;
  knownSingleValueKeysToSkipForUIComparison_keys = v1;

}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_6 != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken_6, &__block_literal_global_17_0);
  return (id)knownRelationshipWeakKeys_keys_6;
}

void __49__EKStructuredLocation_knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B750];
  v3[0] = *MEMORY[0x1E0D0B758];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownRelationshipWeakKeys_keys_6;
  knownRelationshipWeakKeys_keys_6 = v1;

}

+ (EKStructuredLocation)locationWithTitle:(NSString *)title
{
  NSString *v3;
  id v4;

  v3 = title;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTitle:", v3);

  return (EKStructuredLocation *)v4;
}

+ (id)_stringByStrippingControlCharactersFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = _stringByStrippingControlCharactersFromString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_stringByStrippingControlCharactersFromString__onceToken, &__block_literal_global_18_3);
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", _stringByStrippingControlCharactersFromString__s_charSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsJoinedByString:", &stru_1E4789A58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __70__EKStructuredLocation__stringByStrippingControlCharactersFromString___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)_stringByStrippingControlCharactersFromString__s_charSet;
  _stringByStrippingControlCharactersFromString__s_charSet = v1;

  objc_msgSend((id)_stringByStrippingControlCharactersFromString__s_charSet, "invert");
  v3 = (void *)_stringByStrippingControlCharactersFromString__s_charSet;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v4);

  return objc_msgSend((id)_stringByStrippingControlCharactersFromString__s_charSet, "invert");
}

+ (EKStructuredLocation)locationWithPlacemark:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v3, "postalAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedAddressString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAddress:", v7);

  objc_msgSend(v3, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGeoLocation:", v8);

  objc_msgSend(v3, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "radius");
  objc_msgSend(v4, "setRadius:");

  return (EKStructuredLocation *)v4;
}

+ (EKStructuredLocation)locationWithMapItem:(MKMapItem *)mapItem
{
  MKMapItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = mapItem;
  v5 = (void *)objc_opt_class();
  -[MKMapItem placemark](v4, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationWithPlacemark:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKMapItem name](v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_stringByStrippingControlCharactersFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);

  -[MKMapItem _handle](v4, "_handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setMapKitHandle:", v10);
  return (EKStructuredLocation *)v7;
}

+ (EKStructuredLocation)locationWithGEOMapItem:(id)a3
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

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C9E3F0], "placemarkWithGEOMapItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationWithPlacemark:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_place");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "setTitle:", v8);
  }
  else
  {
    objc_msgSend(v3, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v9);

  }
  objc_msgSend((id)EKWeakLinkClass(), "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleForMapItem:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMapKitHandle:", v11);

  return (EKStructuredLocation *)v6;
}

+ (EKStructuredLocation)locationWithCalLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationWithTitle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddress:", v7);

  objc_msgSend(v4, "radius");
  objc_msgSend(v6, "setRadius:");
  objc_msgSend(v4, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGeoLocation:", v8);

  objc_msgSend(v4, "mapKitHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMapKitHandle:", v9);
  return (EKStructuredLocation *)v6;
}

- (EKStructuredLocation)initWithPersistentObject:(id)a3 objectForCopy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  EKStructuredLocation *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Trying to initialize an EKStructuredLocation as a copy of an object that is not an EKStructuredLocation"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise");

  }
  v12.receiver = self;
  v12.super_class = (Class)EKStructuredLocation;
  v9 = -[EKObject initWithPersistentObject:objectForCopy:](&v12, sel_initWithPersistentObject_objectForCopy_, v6, v7);
  if (v9)
  {
    objc_msgSend(v7, "predictedLOI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKStructuredLocation setPredictedLOI:](v9, "setPredictedLOI:", v10);

  }
  return v9;
}

- (BOOL)isStructured
{
  void *v3;
  BOOL v4;
  void *v5;

  -[EKStructuredLocation geoLocation](self, "geoLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[EKStructuredLocation contactLabel](self, "contactLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)hasKnownSpatialData
{
  void *v3;
  BOOL v4;
  void *v5;

  -[EKStructuredLocation geoLocation](self, "geoLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[EKStructuredLocation mapKitHandle](self, "mapKitHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)setTitle:(NSString *)title
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", title, *MEMORY[0x1E0D0B7A0]);
}

- (void)setAddress:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B748]);
}

- (id)referenceFrame
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B790]);
}

- (void)setReferenceFrame:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B790]);
  -[EKStructuredLocation _clearGeoLocationCache](self, "_clearGeoLocationCache");
}

- (id)latitude
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B770]);
}

- (void)setLatitude:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B770]);
  -[EKStructuredLocation _clearGeoLocationCache](self, "_clearGeoLocationCache");
}

- (id)longitude
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B778]);
}

- (void)setLongitude:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B778]);
  -[EKStructuredLocation _clearGeoLocationCache](self, "_clearGeoLocationCache");
}

- (void)_clearGeoLocationCache
{
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("geoLocation"));
}

- (CLLocation)geoLocation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__EKStructuredLocation_geoLocation__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("geoLocation"), v3);
  return (CLLocation *)(id)objc_claimAutoreleasedReturnValue();
}

id __35__EKStructuredLocation_geoLocation__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  double v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  id v12;
  void *v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 32), "latitude");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "longitude");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "referenceFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v2, "doubleValue");
    v9 = v8;
    objc_msgSend(v4, "doubleValue");
    v11 = CLLocationCoordinate2DMake(v9, v10);
    v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v13, v7, v11.latitude, v11.longitude, 0.0, 0.0, -1.0);

  }
  return v14;
}

- (void)setGeoLocation:(CLLocation *)geoLocation
{
  void *v4;
  CLLocation *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  if (geoLocation)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = geoLocation;
    -[CLLocation coordinate](v5, "coordinate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKStructuredLocation setLatitude:](self, "setLatitude:", v6);

    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[CLLocation coordinate](v5, "coordinate");
    objc_msgSend(v7, "numberWithDouble:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKStructuredLocation setLongitude:](self, "setLongitude:", v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CLLocation referenceFrame](v5, "referenceFrame"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKStructuredLocation setReferenceFrame:](self, "setReferenceFrame:", v10);

  }
  else
  {
    v11 = 0;
    -[EKStructuredLocation setLatitude:](self, "setLatitude:", 0);
    -[EKStructuredLocation setLongitude:](self, "setLongitude:", 0);
    -[EKStructuredLocation setReferenceFrame:](self, "setReferenceFrame:", 0);
  }
  -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", geoLocation, CFSTR("geoLocation"));

}

- (id)cacheKey
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EKStructuredLocation latitude](self, "latitude");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;
  -[EKStructuredLocation longitude](self, "longitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%4f, %4f"), *(_QWORD *)&v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)radiusRaw
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B788]);
}

- (void)setRadiusRaw:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B788]);
}

- (double)radius
{
  void *v2;
  double v3;
  double v4;

  -[EKStructuredLocation radiusRaw](self, "radiusRaw");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setRadius:(double)radius
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", radius);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation setRadiusRaw:](self, "setRadiusRaw:", v4);

}

- (NSString)contactLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B760]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ab://"), &stru_1E4789A58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ab\\://"), &stru_1E4789A58);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByRemovingPercentEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = v2;
  v7 = v6;

  return v7;
}

- (void)setContactLabel:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B760]);
}

- (NSData)mapKitHandle
{
  return (NSData *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B780]);
}

- (void)setMapKitHandle:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B780]);
}

- (BOOL)_reset
{
  _BOOL4 v3;
  uint64_t v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKStructuredLocation;
  v3 = -[EKObject _reset](&v7, sel__reset);
  if (v3)
  {
    v4 = objc_opt_class();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__EKStructuredLocation__reset__block_invoke;
    v6[3] = &unk_1E47864F0;
    v6[4] = self;
    LOBYTE(v3) = -[EKObject _resetIfBackingObjectIsOfClass:fetchResetFrozenObjectBlock:](self, "_resetIfBackingObjectIsOfClass:fetchResetFrozenObjectBlock:", v4, v6);
  }
  return v3;
}

id __30__EKStructuredLocation__reset__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reminderStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetBackingLocationWithBackingLocation:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKStructuredLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E30901FFFFFFFFLL))
  {
    v17.receiver = self;
    v17.super_class = (Class)EKStructuredLocation;
    return -[EKObject copyWithZone:](&v17, sel_copyWithZone_, a3);
  }
  else
  {
    v5 = objc_alloc_init(EKStructuredLocation);
    -[EKStructuredLocation title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKStructuredLocation setTitle:](v5, "setTitle:", v6);

    -[EKStructuredLocation geoLocation](self, "geoLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKStructuredLocation setGeoLocation:](v5, "setGeoLocation:", v7);

    -[EKStructuredLocation mapKitHandle](self, "mapKitHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKStructuredLocation setMapKitHandle:](v5, "setMapKitHandle:", v8);

    -[EKStructuredLocation radius](self, "radius");
    -[EKStructuredLocation setRadius:](v5, "setRadius:");
    -[EKObject backingObject](self, "backingObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[EKStructuredLocation address](self, "address");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKStructuredLocation setAddress:](v5, "setAddress:", v11);

      -[EKStructuredLocation contactLabel](self, "contactLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKStructuredLocation setContactLabel:](v5, "setContactLabel:", v12);

      -[EKStructuredLocation routing](self, "routing");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKStructuredLocation setRouting:](v5, "setRouting:", v13);

      -[EKStructuredLocation derivedFrom](self, "derivedFrom");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKStructuredLocation setDerivedFrom:](v5, "setDerivedFrom:", v14);

      -[EKStructuredLocation predictedLOI](self, "predictedLOI");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKStructuredLocation setPredictedLOI:](v5, "setPredictedLOI:", v15);

      -[EKStructuredLocation setImprecise:](v5, "setImprecise:", -[EKStructuredLocation isImprecise](self, "isImprecise"));
    }
  }
  return v5;
}

- (BOOL)isEqualToLocation:(id)a3
{
  id v4;
  int isKindOfClass;
  void *v6;
  BOOL v7;
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
  double v22;
  double v23;
  void *v24;
  double v25;
  _BOOL4 v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[EKStructuredLocation title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      objc_msgSend(v4, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_7;
    }
    -[EKStructuredLocation title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass &= objc_msgSend(v9, "isEqualToString:", v10);

LABEL_7:
    -[EKStructuredLocation address](self, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      objc_msgSend(v4, "address");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_11;
    }
    -[EKStructuredLocation address](self, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass &= objc_msgSend(v13, "isEqualToString:", v14);

LABEL_11:
    -[EKStructuredLocation contactLabel](self, "contactLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

    }
    else
    {
      objc_msgSend(v4, "contactLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_15;
    }
    -[EKStructuredLocation contactLabel](self, "contactLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass &= objc_msgSend(v17, "isEqualToString:", v18);

LABEL_15:
    -[EKStructuredLocation geoLocation](self, "geoLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {

    }
    else
    {
      objc_msgSend(v4, "geoLocation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_22;
    }
    -[EKStructuredLocation geoLocation](self, "geoLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "coordinate");
    v23 = v22;
    objc_msgSend(v4, "geoLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "coordinate");
    v26 = vabdd_f64(v23, v25) < 2.22044605e-16;

    -[EKStructuredLocation geoLocation](self, "geoLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "coordinate");
    v29 = v28;
    objc_msgSend(v4, "geoLocation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "coordinate");
    v32 = vabdd_f64(v29, v31) < 2.22044605e-16 && v26;
    isKindOfClass &= v32;

LABEL_22:
    -[EKStructuredLocation mapKitHandle](self, "mapKitHandle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {

    }
    else
    {
      objc_msgSend(v4, "mapKitHandle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
LABEL_26:
        -[EKStructuredLocation radius](self, "radius");
        v38 = v37;
        objc_msgSend(v4, "radius");
        v7 = isKindOfClass & (vabdd_f64(v38, v39) < 2.22044605e-16);
        goto LABEL_27;
      }
    }
    -[EKStructuredLocation mapKitHandle](self, "mapKitHandle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapKitHandle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass &= objc_msgSend(v35, "isEqualToData:", v36);

    goto LABEL_26;
  }
  v7 = 0;
LABEL_27:

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKStructuredLocation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation geoLocation](self, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation contactLabel](self, "contactLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation routing](self, "routing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation radius](self, "radius");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {title = %@; address = %@; geo = %@; abID = %@; routing = %@; radius = %f;}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)routing
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B798]);
}

- (void)setRouting:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B798]);
}

- (id)calLocation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0D0C328]);
  -[EKStructuredLocation title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[EKStructuredLocation address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAddress:", v5);

  -[EKStructuredLocation title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayName:", v6);

  objc_msgSend(v3, "setType:", 1);
  -[EKStructuredLocation radius](self, "radius");
  objc_msgSend(v3, "setRadius:");
  -[EKStructuredLocation geoLocation](self, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocation:", v7);

  -[EKStructuredLocation routing](self, "routing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRouteType:", v8);

  -[EKStructuredLocation mapKitHandle](self, "mapKitHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMapKitHandle:", v9);

  return v3;
}

- (id)geoURLString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EKStructuredLocation geoLocation](self, "geoLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  -[EKStructuredLocation geoLocation](self, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("geo:%f,%f"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateFromMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "placemark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation setGeoLocation:](self, "setGeoLocation:", v6);

  objc_msgSend(v4, "placemark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "radius");
  -[EKStructuredLocation setRadius:](self, "setRadius:");

  objc_msgSend(v4, "_handle");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[EKStructuredLocation setMapKitHandle:](self, "setMapKitHandle:", v9);
}

- (NSString)derivedFrom
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B768]);
}

- (void)setDerivedFrom:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B768]);
}

+ (id)displayLabelForContact:(id)a3 unlocalizedLabel:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97218];
  v7 = a4;
  objc_msgSend(v6, "stringFromContact:style:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "capitalizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "contactType") == 1)
    goto LABEL_2;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "contactIdentifierIsMe:", v13);

    if (!v14 && v8)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      EKBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@’s %@"), &stru_1E4789A58, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v17, v8, v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v11 = v10;
    goto LABEL_8;
  }
  if (v8)
  {
LABEL_2:
    v11 = v8;
LABEL_8:
    v18 = v11;
    goto LABEL_9;
  }
  v18 = 0;
LABEL_9:
  if (objc_msgSend(v18, "length"))
    v19 = v18;
  else
    v19 = 0;

  return v19;
}

- (id)semanticIdentifier
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

  -[EKStructuredLocation title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation mapKitHandle](self, "mapKitHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation contactLabel](self, "contactLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation latitude](self, "latitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKStructuredLocation longitude](self, "longitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[EKStructuredLocation radius](self, "radius");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKStructuredLocationSemanticIdentifierGenerator semanticIdentifierForLocationWithTitle:address:mapKitHandle:contactLabel:latitude:longitude:radius:](EKStructuredLocationSemanticIdentifierGenerator, "semanticIdentifierForLocationWithTitle:address:mapKitHandle:contactLabel:latitude:longitude:radius:", v3, v4, v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isImprecise
{
  return self->_imprecise;
}

- (void)setImprecise:(BOOL)a3
{
  self->_imprecise = a3;
}

- (void)setPredictedLOI:(id)a3
{
  objc_storeStrong((id *)&self->_predictedLOI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedLOI, 0);
}

@end
