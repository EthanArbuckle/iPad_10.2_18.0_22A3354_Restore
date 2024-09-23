@implementation PHAssetPhotosOneUpProperties

- (PHAssetPhotosOneUpProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetPhotosOneUpProperties *v10;
  PHAssetPhotosOneUpProperties *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  NSData *reverseLocationData;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PHAssetPhotosOneUpProperties;
  v10 = -[PHAssetPhotosOneUpProperties init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.reverseLocationDataIsValid");
    else
      v12 = CFSTR("reverseLocationDataIsValid");
    if (v5)
      v13 = CFSTR("additionalAttributes.reverseLocationData");
    else
      v13 = CFSTR("reverseLocationData");
    if (v5)
      v14 = CFSTR("additionalAttributes.shiftedLocationIsValid");
    else
      v14 = CFSTR("shiftedLocationIsValid");
    if (v5)
      v15 = CFSTR("additionalAttributes.variationSuggestionStates");
    else
      v15 = CFSTR("variationSuggestionStates");
    if (v5)
      v16 = CFSTR("additionalAttributes.viewPresentation");
    else
      v16 = CFSTR("viewPresentation");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_reverseLocationDataIsValid = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
    reverseLocationData = v11->_reverseLocationData;
    v11->_reverseLocationData = (NSData *)v18;

    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_shiftedLocationIsValid = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_variationSuggestionStates = objc_msgSend(v21, "unsignedLongLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_viewPresentation = objc_msgSend(v22, "unsignedLongLongValue");

    if (v11->_viewPresentation >= 2)
      v11->_viewPresentation = 0;
  }

  return v11;
}

- (NSString)addressString
{
  void *v2;
  void *v3;

  -[PHAssetPhotosOneUpProperties _locationInfo](self, "_locationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_locationInfo
{
  void *v2;
  void *v3;

  if (self->_reverseLocationDataIsValid)
  {
    -[PHAssetPhotosOneUpProperties reverseLocationData](self, "reverseLocationData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71AA0], "infoFromPlistData:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)localizedGeoDescriptionIsHome:(BOOL *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PHAssetPhotosOneUpProperties _locationInfo](self, "_locationInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (a3)
      *a3 = objc_msgSend(v4, "isHome");
    objc_msgSend(v5, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)placeNamesForLocalizedDetailedDescriptionIsHome:(BOOL *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PHAssetPhotosOneUpProperties _locationInfo](self, "_locationInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (a3)
      *a3 = objc_msgSend(v4, "isHome");
    objc_msgSend(v5, "placeNamesForLocalizedDetailedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)reverseLocationDataIsValid
{
  return self->_reverseLocationDataIsValid;
}

- (NSData)reverseLocationData
{
  return self->_reverseLocationData;
}

- (BOOL)shiftedLocationIsValid
{
  return self->_shiftedLocationIsValid;
}

- (unint64_t)variationSuggestionStates
{
  return self->_variationSuggestionStates;
}

- (signed)viewPresentation
{
  return self->_viewPresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseLocationData, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetPhotosOneUp");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_42;
}

void __49__PHAssetPhotosOneUpProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("reverseLocationData");
  v3[1] = CFSTR("reverseLocationDataIsValid");
  v3[2] = CFSTR("variationSuggestionStates");
  v3[3] = CFSTR("shiftedLocationIsValid");
  v3[4] = CFSTR("viewPresentation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_42;
  propertiesToFetch_pl_once_object_42 = v1;

}

@end
