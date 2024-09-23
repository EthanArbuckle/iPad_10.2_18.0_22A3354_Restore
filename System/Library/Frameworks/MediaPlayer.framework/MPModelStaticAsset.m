@implementation MPModelStaticAsset

+ (id)__duration_KEY
{
  return CFSTR("MPModelPropertyStaticAssetDuration");
}

+ (void)__MPModelPropertyStaticAssetDuration__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStaticAsset.m"), 25, CFSTR("Translator was missing mapping for MPModelPropertyStaticAssetDuration"));

}

+ (id)__flavorType_KEY
{
  return CFSTR("MPModelPropertyStaticAssetFlavorType");
}

+ (void)__MPModelPropertyStaticAssetFlavorType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStaticAsset.m"), 26, CFSTR("Translator was missing mapping for MPModelPropertyStaticAssetFlavorType"));

}

+ (id)__mediaType_KEY
{
  return CFSTR("MPModelPropertyStaticAssetMediaType");
}

+ (void)__MPModelPropertyStaticAssetMediaType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStaticAsset.m"), 27, CFSTR("Translator was missing mapping for MPModelPropertyStaticAssetMediaType"));

}

+ (id)__url_KEY
{
  return CFSTR("MPModelPropertyStaticAssetURL");
}

+ (void)__MPModelPropertyStaticAssetURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStaticAsset.m"), 28, CFSTR("Translator was missing mapping for MPModelPropertyStaticAssetURL"));

}

@end
