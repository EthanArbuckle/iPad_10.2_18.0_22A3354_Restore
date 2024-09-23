@implementation MPModelMovie

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyMovieTitle");
}

+ (id)__tagline_KEY
{
  return CFSTR("MPModelPropertyMovieTagline");
}

+ (id)__storeAsset_KEY
{
  return CFSTR("MPModelRelationshipMovieStoreAsset");
}

+ (id)__releaseDate_KEY
{
  return CFSTR("MPModelPropertyMovieReleaseDate");
}

+ (id)__playbackPosition_KEY
{
  return CFSTR("MPModelRelationshipMoviePlaybackPosition");
}

+ (id)__movieInfoDictionary_KEY
{
  return CFSTR("MPModelPropertyMovieInfoDictionary");
}

+ (id)__localFileAsset_KEY
{
  return CFSTR("MPModelRelationshipMovieLocalFileAsset");
}

+ (id)__libraryAdded_KEY
{
  return CFSTR("MPModelPropertyMovieLibraryAdded");
}

+ (id)__libraryAddedDate_KEY
{
  return CFSTR("MPModelPropertyMovieLibraryAddedDate");
}

+ (id)__libraryAddEligible_KEY
{
  return CFSTR("MPModelPropertyMovieLibraryAddEligible");
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return CFSTR("MPModelPropertyMovieLastDevicePlaybackDate");
}

+ (id)__keepLocalManagedStatus_KEY
{
  return CFSTR("MPModelPropertyMovieKeepLocalManagedStatus");
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason");
}

+ (id)__keepLocalEnableState_KEY
{
  return CFSTR("MPModelPropertyMovieKeepLocalEnableState");
}

+ (id)__keepLocalConstraints_KEY
{
  return CFSTR("MPModelPropertyMovieKeepLocalConstraints");
}

+ (id)__hasCloudSyncSource_KEY
{
  return CFSTR("MPModelPropertyMovieHasCloudSyncSource");
}

+ (id)__explicitRating_KEY
{
  return CFSTR("MPModelPropertyMovieExplicitRating");
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyMovieEditorialArtwork");
}

+ (id)__duration_KEY
{
  return CFSTR("MPModelPropertyMovieDuration");
}

+ (id)__downloadedDate_KEY
{
  return CFSTR("MPModelPropertyMovieDownloadedDate");
}

+ (id)__descriptionText_KEY
{
  return CFSTR("MPModelPropertyMovieDescriptionText");
}

+ (id)__clips_KEY
{
  return CFSTR("MPModelRelationshipMovieClips");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyMovieArtwork");
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

+ (id)requiredLibraryRemovalProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MPPropertySet *v9;
  const __CFString *v11;
  const __CFString *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v15[0] = CFSTR("MPModelPropertyMovieLibraryAdded");
  v15[1] = CFSTR("MPModelPropertyMovieKeepLocalManagedStatus");
  v15[2] = CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason");
  v15[3] = CFSTR("MPModelPropertyMovieKeepLocalConstraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("MPModelPropertyFileAssetNonPurgeable");
  v13[0] = CFSTR("MPModelRelationshipMovieLocalFileAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("MPModelRelationshipMovieStoreAsset");
  v14[0] = v5;
  v11 = CFSTR("MPModelPropertyStoreAssetRedownloadable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, v8);

  return v9;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MPPropertySet *v9;
  const __CFString *v11;
  const __CFString *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v15[0] = CFSTR("MPModelPropertyMovieKeepLocalEnableState");
  v15[1] = CFSTR("MPModelPropertyMovieKeepLocalManagedStatus");
  v15[2] = CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason");
  v15[3] = CFSTR("MPModelPropertyMovieKeepLocalConstraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("MPModelPropertyFileAssetNonPurgeable");
  v13[0] = CFSTR("MPModelRelationshipMovieLocalFileAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("MPModelRelationshipMovieStoreAsset");
  v14[0] = v5;
  v11 = CFSTR("MPModelPropertyStoreAssetRedownloadable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, v8);

  return v9;
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyMovieLibraryAddEligible");
  v5[1] = CFSTR("MPModelPropertyMovieHasCloudSyncSource");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyMovieExplicitRating");
  v5[1] = CFSTR("MPModelPropertyMovieLibraryAdded");
  v5[2] = CFSTR("MPModelPropertyMovieLibraryAddEligible");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  return +[MPModelMovieKind kindWithVariants:options:](MPModelMovieKind, "kindWithVariants:options:", a3, a4);
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "kindWithVariants:options:", a3, 0);
}

- (id)mediaItemPropertyValues
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__MPModelMovie_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke;
  v8[3] = &unk_1E31635F8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __63__MPModelMovie_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v13, CFSTR("title"));
  objc_msgSend(*(id *)(a1 + 32), "duration");
  objc_msgSend(*(id *)(a1 + 32), "duration");
  if (v2 > 0.0)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "duration");
    objc_msgSend(v3, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("playbackDuration"));

  }
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "universalStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "subscriptionAdamID");

  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("storeItemAdamID"));

  }
  if (MPModelMovieIsRestricted(*(void **)(a1 + 32)))
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("isExplicit"));

  }
}

- (id)humanDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[MPModelObject identifiers](self, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("mediaClip %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieTitle")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelMovie title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("“%@” "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertString:atIndex:", v9, 0);
  }
  return v6;
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelMovie artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelMovie *))(v3 + 16))(v3, self);
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

  -[MPModelMovie editorialArtworkCatalogBlock](self, "editorialArtworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelMovie *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)classesForSecureCoding
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)__MPModelPropertyMovieTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 123, CFSTR("Translator was missing mapping for MPModelPropertyMovieTitle"));

}

+ (void)__MPModelPropertyMovieDescriptionText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 124, CFSTR("Translator was missing mapping for MPModelPropertyMovieDescriptionText"));

}

+ (void)__MPModelPropertyMovieExplicitRating__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 125, CFSTR("Translator was missing mapping for MPModelPropertyMovieExplicitRating"));

}

+ (void)__MPModelPropertyMovieTagline__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 126, CFSTR("Translator was missing mapping for MPModelPropertyMovieTagline"));

}

+ (void)__MPModelPropertyMovieInfoDictionary__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 127, CFSTR("Translator was missing mapping for MPModelPropertyMovieInfoDictionary"));

}

+ (void)__MPModelRelationshipMovieClips__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 128, CFSTR("Translator was missing mapping for MPModelRelationshipMovieClips"));

}

+ (void)__MPModelPropertyMovieReleaseDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 129, CFSTR("Translator was missing mapping for MPModelPropertyMovieReleaseDate"));

}

+ (void)__MPModelRelationshipMovieLocalFileAsset__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 130, CFSTR("Translator was missing mapping for MPModelRelationshipMovieLocalFileAsset"));

}

+ (void)__MPModelRelationshipMoviePlaybackPosition__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 131, CFSTR("Translator was missing mapping for MPModelRelationshipMoviePlaybackPosition"));

}

+ (void)__MPModelRelationshipMovieStoreAsset__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 132, CFSTR("Translator was missing mapping for MPModelRelationshipMovieStoreAsset"));

}

+ (void)__MPModelPropertyMovieArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 133, CFSTR("Translator was missing mapping for MPModelPropertyMovieArtwork"));

}

+ (void)__MPModelPropertyMovieEditorialArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 134, CFSTR("Translator was missing mapping for MPModelPropertyMovieEditorialArtwork"));

}

+ (void)__MPModelPropertyMovieDuration__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 135, CFSTR("Translator was missing mapping for MPModelPropertyMovieDuration"));

}

+ (void)__MPModelPropertyMovieHasCloudSyncSource__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 136, CFSTR("Translator was missing mapping for MPModelPropertyMovieHasCloudSyncSource"));

}

+ (void)__MPModelPropertyMovieLibraryAdded__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 137, CFSTR("Translator was missing mapping for MPModelPropertyMovieLibraryAdded"));

}

+ (void)__MPModelPropertyMovieLibraryAddedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 138, CFSTR("Translator was missing mapping for MPModelPropertyMovieLibraryAddedDate"));

}

+ (void)__MPModelPropertyMovieLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 139, CFSTR("Translator was missing mapping for MPModelPropertyMovieLastDevicePlaybackDate"));

}

+ (void)__MPModelPropertyMovieLibraryAddEligible__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 140, CFSTR("Translator was missing mapping for MPModelPropertyMovieLibraryAddEligible"));

}

+ (void)__MPModelPropertyMovieKeepLocalEnableState__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 141, CFSTR("Translator was missing mapping for MPModelPropertyMovieKeepLocalEnableState"));

}

+ (void)__MPModelPropertyMovieKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 142, CFSTR("Translator was missing mapping for MPModelPropertyMovieKeepLocalManagedStatus"));

}

+ (void)__MPModelPropertyMovieKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 143, CFSTR("Translator was missing mapping for MPModelPropertyMovieKeepLocalManagedStatusReason"));

}

+ (void)__MPModelPropertyMovieKeepLocalConstraints__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 144, CFSTR("Translator was missing mapping for MPModelPropertyMovieKeepLocalConstraints"));

}

+ (void)__MPModelPropertyMovieDownloadedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 145, CFSTR("Translator was missing mapping for MPModelPropertyMovieDownloadedDate"));

}

+ (id)__storeCanonicalID_KEY
{
  return CFSTR("MPModelPropertyMovieStoreCanonicalID");
}

+ (void)__MPModelPropertyMovieStoreCanonicalID__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMovie.m"), 146, CFSTR("Translator was missing mapping for MPModelPropertyMovieStoreCanonicalID"));

}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  _BOOL4 IsRestricted;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  IsRestricted = MPModelMovieIsRestricted(self);
  v4 = -[MPModelMovie isLibraryAdded](self, "isLibraryAdded");
  v5 = -[MPModelMovie isLibraryAddEligible](self, "isLibraryAddEligible");
  v6 = 0x100000000;
  if (!v5)
    v6 = 0;
  v7 = 256;
  if (!v4)
    v7 = 0;
  v8 = 65537;
  if (IsRestricted)
    v8 = 16777217;
  return (MPLibraryAddStatusObserverConfiguration)(v8 | v7 | v6);
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = -[MPModelMovie keepLocalManagedStatus](self, "keepLocalManagedStatus");
  v4 = -[MPModelMovie isLibraryAdded](self, "isLibraryAdded");
  -[MPModelMovie localFileAsset](self, "localFileAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelMovie storeAsset](self, "storeAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _MPModelLibraryRemovalSupportedOptionsForIndividualItemProperties(v3, v4, v5, v6);

  return v7;
}

+ (BOOL)supportsLibraryRemoval
{
  return 1;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration);
  -[MPModelMovie localFileAsset](self, "localFileAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setHasNonPurgeableAsset:](v3, "setHasNonPurgeableAsset:", objc_msgSend(v4, "isNonPurgeable"));
  -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v3, "setIdentifyingModelObject:", self);
  -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v3, "setEnableState:", -[MPModelMovie keepLocalEnableState](self, "keepLocalEnableState"));
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setManagedStatus:](v3, "setManagedStatus:", -[MPModelMovie keepLocalManagedStatus](self, "keepLocalManagedStatus"));
  -[MPModelMovie storeAsset](self, "storeAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setStoreRedownloadable:](v3, "setStoreRedownloadable:", objc_msgSend(v5, "isRedownloadable"));

  return v3;
}

+ (int64_t)genericObjectType
{
  return 9;
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
