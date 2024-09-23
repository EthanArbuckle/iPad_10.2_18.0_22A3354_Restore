@implementation MPModelCreditsArtist

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyCreditsArtistArtwork");
}

+ (id)__artist_KEY
{
  return CFSTR("MPModelRelationshipCreditsArtistRelatedArtist");
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelCreditsArtist artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelCreditsArtist *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelRelationshipCreditsArtistRelatedArtist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCreditsArtist.m"), 29, CFSTR("Translator was missing mapping for MPModelRelationshipCreditsArtistRelatedArtist"));

}

+ (void)__MPModelPropertyCreditsArtistArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCreditsArtist.m"), 30, CFSTR("Translator was missing mapping for MPModelPropertyCreditsArtistArtwork"));

}

+ (int64_t)genericObjectType
{
  return 20;
}

@end
