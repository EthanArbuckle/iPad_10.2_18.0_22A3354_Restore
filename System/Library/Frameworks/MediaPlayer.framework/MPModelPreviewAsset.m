@implementation MPModelPreviewAsset

+ (id)__assetURL_KEY
{
  return CFSTR("MPModelPropertyPreviewAssetURL");
}

+ (void)__MPModelPropertyPreviewAssetURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPreviewAsset.m"), 17, CFSTR("Translator was missing mapping for MPModelPropertyPreviewAssetURL"));

}

@end
