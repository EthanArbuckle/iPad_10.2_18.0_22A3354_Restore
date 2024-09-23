@implementation MPModelArtist

+ (id)__songCount_KEY
{
  return CFSTR("MPModelPropertyArtistSongCount");
}

+ (id)__libraryAdded_KEY
{
  return CFSTR("MPModelPropertyArtistLibraryAdded");
}

+ (id)__libraryAddedDate_KEY
{
  return CFSTR("MPModelPropertyArtistLibraryAddedDate");
}

+ (id)__isFavorite_KEY
{
  return CFSTR("MPModelPropertyArtistIsFavorite");
}

+ (id)__isDisliked_KEY
{
  return CFSTR("MPModelPropertyArtistIsDisliked");
}

+ (id)__hasBiography_KEY
{
  return CFSTR("MPModelPropertyArtistHasBiography");
}

+ (id)__genre_KEY
{
  return CFSTR("MPModelRelationshipArtistGenre");
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyArtistEditorialArtwork");
}

+ (id)__dateFavorited_KEY
{
  return CFSTR("MPModelPropertyArtistDateFavorited");
}

+ (id)__classicalExperienceAvailable_KEY
{
  return CFSTR("MPModelPropertyArtistClassicalExperienceAvailable");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyArtistArtwork");
}

+ (id)__albumCount_KEY
{
  return CFSTR("MPModelPropertyArtistAlbumCount");
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyArtistIsFavorite");
  v5[1] = CFSTR("MPModelPropertyArtistIsDisliked");
  v5[2] = CFSTR("MPModelPropertyArtistLibraryAdded");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)kindWithAlbumKind:(id)a3
{
  return +[MPModelArtistKind kindWithAlbumKind:](MPModelArtistKind, "kindWithAlbumKind:", a3);
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelArtist artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelArtist *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelArtist editorialArtworkCatalogBlock](self, "editorialArtworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelArtist *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyArtistHasBiography__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 73, CFSTR("Translator was missing mapping for MPModelPropertyArtistHasBiography"));

}

+ (void)__MPModelPropertyArtistArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 74, CFSTR("Translator was missing mapping for MPModelPropertyArtistArtwork"));

}

+ (void)__MPModelPropertyArtistEditorialArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 75, CFSTR("Translator was missing mapping for MPModelPropertyArtistEditorialArtwork"));

}

+ (void)__MPModelRelationshipArtistGenre__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 76, CFSTR("Translator was missing mapping for MPModelRelationshipArtistGenre"));

}

+ (void)__MPModelPropertyArtistSongCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 77, CFSTR("Translator was missing mapping for MPModelPropertyArtistSongCount"));

}

+ (void)__MPModelPropertyArtistAlbumCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 78, CFSTR("Translator was missing mapping for MPModelPropertyArtistAlbumCount"));

}

+ (void)__MPModelPropertyArtistLibraryAddedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 79, CFSTR("Translator was missing mapping for MPModelPropertyArtistLibraryAddedDate"));

}

+ (void)__MPModelPropertyArtistClassicalExperienceAvailable__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 80, CFSTR("Translator was missing mapping for MPModelPropertyArtistClassicalExperienceAvailable"));

}

+ (void)__MPModelPropertyArtistIsFavorite__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 81, CFSTR("Translator was missing mapping for MPModelPropertyArtistIsFavorite"));

}

+ (void)__MPModelPropertyArtistIsDisliked__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 82, CFSTR("Translator was missing mapping for MPModelPropertyArtistIsDisliked"));

}

+ (void)__MPModelPropertyArtistDateFavorited__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 83, CFSTR("Translator was missing mapping for MPModelPropertyArtistDateFavorited"));

}

+ (void)__MPModelPropertyArtistLibraryAdded__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelArtist.m"), 84, CFSTR("Translator was missing mapping for MPModelPropertyArtistLibraryAdded"));

}

+ (int64_t)genericObjectType
{
  return 3;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  return a3;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  return a3;
}

@end
