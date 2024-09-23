@implementation PHAssetPhotoAnalysisWallpaperProperties

- (PHAssetPhotoAnalysisWallpaperProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetPhotoAnalysisWallpaperProperties *v10;
  PHAssetPhotoAnalysisWallpaperProperties *v11;
  BOOL v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  NSDate *wallpaperPropertiesTimestamp;
  void *v18;
  uint64_t v19;
  NSData *wallpaperPropertiesData;
  objc_super v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHAssetPhotoAnalysisWallpaperProperties;
  v10 = -[PHAssetPhotoAnalysisWallpaperProperties init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    v12 = !v5;
    if (v5)
      v13 = CFSTR("photoAnalysisAttributes.wallpaperPropertiesTimestamp");
    else
      v13 = CFSTR("wallpaperPropertiesTimestamp");
    if (v5)
      v14 = CFSTR("photoAnalysisAttributes.wallpaperPropertiesVersion");
    else
      v14 = CFSTR("wallpaperPropertiesVersion");
    if (v12)
      v15 = CFSTR("wallpaperPropertiesData");
    else
      v15 = CFSTR("photoAnalysisAttributes.wallpaperPropertiesData");
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    wallpaperPropertiesTimestamp = v11->_wallpaperPropertiesTimestamp;
    v11->_wallpaperPropertiesTimestamp = (NSDate *)v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_wallpaperPropertiesVersion = objc_msgSend(v18, "unsignedLongLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v19 = objc_claimAutoreleasedReturnValue();
    wallpaperPropertiesData = v11->_wallpaperPropertiesData;
    v11->_wallpaperPropertiesData = (NSData *)v19;

  }
  return v11;
}

- (NSData)wallpaperPropertiesData
{
  return self->_wallpaperPropertiesData;
}

- (NSDate)wallpaperPropertiesTimestamp
{
  return self->_wallpaperPropertiesTimestamp;
}

- (unint64_t)wallpaperPropertiesVersion
{
  return self->_wallpaperPropertiesVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperPropertiesTimestamp, 0);
  objc_storeStrong((id *)&self->_wallpaperPropertiesData, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetPhotoAnalysisWallpaperProperties");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("photoAnalysisAttributes");
}

+ (id)keyPathToPrimaryObject
{
  return CFSTR("asset");
}

+ (id)entityName
{
  return CFSTR("PhotoAnalysisAssetAttributes");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_58;
}

void __60__PHAssetPhotoAnalysisWallpaperProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("wallpaperPropertiesData");
  v3[1] = CFSTR("wallpaperPropertiesTimestamp");
  v3[2] = CFSTR("wallpaperPropertiesVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_58;
  propertiesToFetch_pl_once_object_58 = v1;

}

@end
