@implementation MPModelTVShowCreator

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyTVShowCreatorArtwork");
}

+ (void)__MPModelPropertyTVShowCreatorArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVShowCreator.m"), 18, CFSTR("Translator was missing mapping for MPModelPropertyTVShowCreatorArtwork"));

}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelTVShowCreator artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelTVShowCreator *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
