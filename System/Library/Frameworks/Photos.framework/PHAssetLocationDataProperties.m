@implementation PHAssetLocationDataProperties

- (PHAssetLocationDataProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetLocationDataProperties *v9;
  PHAssetLocationDataProperties *v10;
  void *v11;
  void *v12;
  void *v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PHAssetLocationDataProperties;
  v9 = -[PHAssetLocationDataProperties init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("locationData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dateCreated")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = (void *)objc_msgSend(MEMORY[0x1E0D71880], "newLocationFromLocationData:timestampIfMissing:", v11, v12),
          v12,
          v13))
    {
      objc_msgSend(v13, "coordinate");
      v10->_coordinate.latitude = v14;
      v10->_coordinate.longitude = v15;

    }
    else
    {
      v10->_coordinate = (CLLocationCoordinate2D)*MEMORY[0x1E0C9E500];
    }

  }
  return v10;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

+ (id)entityName
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetLocationData");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_75;
}

void __50__PHAssetLocationDataProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("locationData");
  v3[1] = CFSTR("dateCreated");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_75;
  propertiesToFetch_pl_once_object_75 = v1;

}

@end
