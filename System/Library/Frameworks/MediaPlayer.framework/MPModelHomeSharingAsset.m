@implementation MPModelHomeSharingAsset

+ (id)__protectedContentSupportStorageFileURL_KEY
{
  return CFSTR("MPModelPropertyHomeSharingAssetProtectedContentSupportStorageFileURL");
}

+ (id)__available_KEY
{
  return CFSTR("MPModelPropertyHomeSharingAssetAvailable");
}

+ (id)__URL_KEY
{
  return CFSTR("MPModelPropertyHomeSharingAssetURL");
}

+ (void)__MPModelPropertyHomeSharingAssetAvailable__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelHomeSharingAsset.m"), 18, CFSTR("Translator was missing mapping for MPModelPropertyHomeSharingAssetAvailable"));

}

+ (void)__MPModelPropertyHomeSharingAssetProtectedContentSupportStorageFileURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelHomeSharingAsset.m"), 19, CFSTR("Translator was missing mapping for MPModelPropertyHomeSharingAssetProtectedContentSupportStorageFileURL"));

}

+ (void)__MPModelPropertyHomeSharingAssetURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelHomeSharingAsset.m"), 20, CFSTR("Translator was missing mapping for MPModelPropertyHomeSharingAssetURL"));

}

@end
