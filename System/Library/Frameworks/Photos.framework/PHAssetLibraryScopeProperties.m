@implementation PHAssetLibraryScopeProperties

- (PHAssetLibraryScopeProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetLibraryScopeProperties *v9;
  PHAssetLibraryScopeProperties *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHAssetLibraryScopeProperties;
  v9 = -[PHAssetLibraryScopeProperties init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("libraryScopeShareState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_pl_shareState = objc_msgSend(v11, "integerValue");

  }
  return v10;
}

- (signed)suggestedByClientType
{
  return PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue();
}

- (BOOL)assetIsInOnboardingPreviewState
{
  id WeakRetained;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._asset);
  v4 = objc_msgSend(WeakRetained, "participatesInLibraryScope")
    && !-[PHAssetLibraryScopeProperties assetManuallyRejectedByUser](self, "assetManuallyRejectedByUser")
    && (PLLibraryScopeAssetGetAddToSharedZoneStateFromShareStateValue() & 1) == 0
    && -[PHAssetLibraryScopeProperties suggestedByClientType](self, "suggestedByClientType") == 0;

  return v4;
}

- (BOOL)assetIsInPhotosSuggestedPreviewState
{
  id WeakRetained;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._asset);
  v4 = (objc_msgSend(WeakRetained, "participatesInLibraryScope") & 1) == 0
    && !-[PHAssetLibraryScopeProperties assetManuallyRejectedByUser](self, "assetManuallyRejectedByUser")
    && (-[PHAssetLibraryScopeProperties suggestedByClientType](self, "suggestedByClientType") == 1
     || -[PHAssetLibraryScopeProperties suggestedByClientType](self, "suggestedByClientType") == 4);

  return v4;
}

- (BOOL)assetIsPublishedToLibraryScope
{
  id WeakRetained;
  char AddToSharedZoneStateFromShareStateValue;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._asset);
  if (objc_msgSend(WeakRetained, "participatesInLibraryScope"))
    AddToSharedZoneStateFromShareStateValue = PLLibraryScopeAssetGetAddToSharedZoneStateFromShareStateValue();
  else
    AddToSharedZoneStateFromShareStateValue = 0;

  return AddToSharedZoneStateFromShareStateValue;
}

- (BOOL)assetManuallyAddedByUser
{
  return PLLibraryScopeAssetGetUserManuallyAddedStateFromShareStateValue();
}

- (BOOL)assetManuallyRejectedByUser
{
  return PLLibraryScopeAssetGetUserManuallyRejectedStateFromShareStateValue();
}

- (BOOL)assetRejectedByCamera
{
  return PLLibraryScopeAssetGetRejectedByCameraStateFromShareStateValue();
}

- (BOOL)assetRejectedByPhotosSuggester
{
  return PLLibraryScopeAssetGetRejectedByPhotosSuggesterFromShareStateValue();
}

- (int64_t)pl_shareState
{
  return self->_pl_shareState;
}

- (void)setPl_shareState:(int64_t)a3
{
  self->_pl_shareState = a3;
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
  return CFSTR("PHAssetPropertySetLibraryScope");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_67;
}

void __50__PHAssetLibraryScopeProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("libraryScopeShareState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_67;
  propertiesToFetch_pl_once_object_67 = v1;

}

@end
