@implementation MPModelAlbum

+ (id)__year_KEY
{
  return CFSTR("MPModelPropertyAlbumYear");
}

+ (id)__volumeNormalization_KEY
{
  return CFSTR("MPModelPropertyAlbumVolumeNormalization");
}

+ (id)__versionHash_KEY
{
  return CFSTR("MPModelPropertyAlbumVersionHash");
}

+ (id)__traits_KEY
{
  return CFSTR("MPModelPropertyAlbumTraits");
}

+ (id)__trackCount_KEY
{
  return CFSTR("MPModelPropertyAlbumTrackCount");
}

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyAlbumTitle");
}

+ (id)__songPopularityBlock_KEY
{
  return CFSTR("MPModelPropertyAlbumSongPopularity");
}

+ (id)__shortEditorNotes_KEY
{
  return CFSTR("MPModelPropertyAlbumShortEditorNotes");
}

+ (id)__representativeSong_KEY
{
  return CFSTR("MPModelRelationshipAlbumRepresentativeSong");
}

+ (id)__releaseDateComponents_KEY
{
  return CFSTR("MPModelPropertyAlbumReleaseDateComponents");
}

+ (id)__preorder_KEY
{
  return CFSTR("MPModelPropertyAlbumPreorder");
}

+ (id)__maximumItemTrackNumber_KEY
{
  return CFSTR("MPModelPropertyAlbumMaximumItemTrackNumber");
}

+ (id)__libraryAdded_KEY
{
  return CFSTR("MPModelPropertyAlbumLibraryAdded");
}

+ (id)__libraryAddedDate_KEY
{
  return CFSTR("MPModelPropertyAlbumLibraryAddedDate");
}

+ (id)__libraryAddEligible_KEY
{
  return CFSTR("MPModelPropertyAlbumLibraryAddEligible");
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return CFSTR("MPModelPropertyAlbumLastDevicePlaybackDate");
}

+ (id)__keepLocalManagedStatus_KEY
{
  return CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus");
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason");
}

+ (id)__keepLocalEnableState_KEY
{
  return CFSTR("MPModelPropertyAlbumKeepLocalEnableState");
}

+ (id)__keepLocalConstraints_KEY
{
  return CFSTR("MPModelPropertyAlbumKeepLocalConstraints");
}

+ (id)__isFavorite_KEY
{
  return CFSTR("MPModelPropertyAlbumIsFavorite");
}

+ (id)__isDisliked_KEY
{
  return CFSTR("MPModelPropertyAlbumIsDisliked");
}

+ (id)__hasExplicitContent_KEY
{
  return CFSTR("MPModelPropertyAlbumHasExplicitContent");
}

+ (id)__hasCleanContent_KEY
{
  return CFSTR("MPModelPropertyAlbumHasCleanContent");
}

+ (id)__genre_KEY
{
  return CFSTR("MPModelRelationshipAlbumGenre");
}

+ (id)__editorNotes_KEY
{
  return CFSTR("MPModelPropertyAlbumEditorNotes");
}

+ (id)__downloadedDate_KEY
{
  return CFSTR("MPModelPropertyAlbumDownloadedDate");
}

+ (id)__discCount_KEY
{
  return CFSTR("MPModelPropertyAlbumDiscCount");
}

+ (id)__dateFavorited_KEY
{
  return CFSTR("MPModelPropertyAlbumDateFavorited");
}

+ (id)__copyrightText_KEY
{
  return CFSTR("MPModelPropertyAlbumCopyrightText");
}

+ (id)__compilation_KEY
{
  return CFSTR("MPModelPropertyAlbumIsCompilation");
}

+ (id)__classical_KEY
{
  return CFSTR("MPModelPropertyAlbumIsClassical");
}

+ (id)__classicalExperienceAvailable_KEY
{
  return CFSTR("MPModelPropertyAlbumClassicalExperienceAvailable");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyAlbumArtwork");
}

+ (id)__artist_KEY
{
  return CFSTR("MPModelRelationshipAlbumArtist");
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyAlbumLibraryAddEligible");
  v5[1] = CFSTR("MPModelPropertyAlbumIsFavorite");
  v5[2] = CFSTR("MPModelPropertyAlbumIsDisliked");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelAlbum artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelAlbum *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

+ (id)kindWithVariants:(unint64_t)a3 songKind:(id)a4 options:(unint64_t)a5
{
  return +[MPModelAlbumKind kindWithVariants:songKind:options:](MPModelAlbumKind, "kindWithVariants:songKind:options:", a3, a4, a5);
}

+ (id)kindWithSongKind:(id)a3
{
  return (id)objc_msgSend(a1, "kindWithVariants:songKind:options:", 3, a3, 0);
}

+ (id)kindWithVariants:(unint64_t)a3 songKind:(id)a4
{
  return (id)objc_msgSend(a1, "kindWithVariants:songKind:options:", a3, a4, 0);
}

+ (id)requiredLibraryRemovalProperties
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyAlbumLibraryAdded");
  v5[1] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus");
  v5[2] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason");
  v5[3] = CFSTR("MPModelPropertyAlbumKeepLocalConstraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus");
  v5[1] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason");
  v5[2] = CFSTR("MPModelPropertyAlbumKeepLocalEnableState");
  v5[3] = CFSTR("MPModelPropertyAlbumKeepLocalConstraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyAlbumHasCleanContent");
  v5[1] = CFSTR("MPModelPropertyAlbumHasExplicitContent");
  v5[2] = CFSTR("MPModelPropertyAlbumLibraryAddEligible");
  v5[3] = CFSTR("MPModelPropertyAlbumLibraryAdded");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contentItemCollectionInfo
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", CFSTR("_MPNowPlayingCollectionInfoCollectionTypeAlbum"), CFSTR("_MPNowPlayingCollectionInfoKeyCollectionType"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__MPModelAlbum_MPContentItemAdditions__contentItemCollectionInfo__block_invoke;
  v8[3] = &unk_1E31635F8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __65__MPModelAlbum_MPContentItemAdditions__contentItemCollectionInfo__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v2, CFSTR("_MPNowPlayingCollectionInfoKeyTitle"));
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "universalStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "adamID");

  if (v5)
    goto LABEL_6;
  objc_msgSend(v9, "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "purchasedAdamID");

  if (v5
    || (objc_msgSend(v9, "universalStore"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v7, "subscriptionAdamID"),
        v7,
        v5))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("_MPNowPlayingInfoPropertyAlbumiTunesStoreAdamIdentifier"));

  }
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, CFSTR("_MPNowPlayingCollectionInfoKeyIdentifiers"));

}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[MPModelAlbum isLibraryAdded](self, "isLibraryAdded");
  v4 = -[MPModelAlbum hasCleanContent](self, "hasCleanContent");
  v5 = -[MPModelAlbum hasExplicitContent](self, "hasExplicitContent");
  v6 = -[MPModelAlbum isLibraryAddEligible](self, "isLibraryAddEligible");
  v7 = 0x100000000;
  if (!v6)
    v7 = 0;
  v8 = 0x1000000;
  if (!v5)
    v8 = 0;
  v9 = 0x10000;
  if (!v4)
    v9 = 0;
  v10 = 257;
  if (!v3)
    v10 = 1;
  return (MPLibraryAddStatusObserverConfiguration)(v10 | v9 | v8 | v7);
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  uint64_t v3;

  if (-[MPModelAlbum isLibraryAdded](self, "isLibraryAdded"))
    v3 = 2;
  else
    v3 = 0;
  return v3 | (-[MPModelAlbum keepLocalManagedStatus](self, "keepLocalManagedStatus") == 2);
}

+ (BOOL)supportsLibraryRemoval
{
  return 1;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *v3;

  v3 = objc_alloc_init(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration);
  -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v3, "setIdentifyingModelObject:", self);
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setManagedStatus:](v3, "setManagedStatus:", -[MPModelAlbum keepLocalManagedStatus](self, "keepLocalManagedStatus"));
  -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v3, "setEnableState:", -[MPModelAlbum keepLocalEnableState](self, "keepLocalEnableState"));
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setCollectionType:](v3, "setCollectionType:", 1);
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setStoreRedownloadable:](v3, "setStoreRedownloadable:", 1);
  return v3;
}

+ (int64_t)genericObjectType
{
  return 2;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  return a3;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  return a3;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("album %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumTitle")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelAlbum title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("“%@” "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertString:atIndex:", v9, 0);
  }
  return v6;
}

- (id)songPopularityForIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MPModelAlbum songPopularityBlock](self, "songPopularityBlock");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, MPModelAlbum *, id))(v5 + 16))(v5, self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)kindWithSongKind:(id)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "kindWithVariants:songKind:options:", 3, a3, a4);
}

+ (void)__MPModelPropertyAlbumTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 120, CFSTR("Translator was missing mapping for MPModelPropertyAlbumTitle"));

}

+ (void)__MPModelRelationshipAlbumArtist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 121, CFSTR("Translator was missing mapping for MPModelRelationshipAlbumArtist"));

}

+ (void)__MPModelRelationshipAlbumGenre__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 122, CFSTR("Translator was missing mapping for MPModelRelationshipAlbumGenre"));

}

+ (void)__MPModelRelationshipAlbumRepresentativeSong__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 123, CFSTR("Translator was missing mapping for MPModelRelationshipAlbumRepresentativeSong"));

}

+ (void)__MPModelPropertyAlbumTrackCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 124, CFSTR("Translator was missing mapping for MPModelPropertyAlbumTrackCount"));

}

+ (void)__MPModelPropertyAlbumMaximumItemTrackNumber__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 125, CFSTR("Translator was missing mapping for MPModelPropertyAlbumMaximumItemTrackNumber"));

}

+ (void)__MPModelPropertyAlbumDiscCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 126, CFSTR("Translator was missing mapping for MPModelPropertyAlbumDiscCount"));

}

+ (void)__MPModelPropertyAlbumHasCleanContent__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 127, CFSTR("Translator was missing mapping for MPModelPropertyAlbumHasCleanContent"));

}

+ (void)__MPModelPropertyAlbumHasExplicitContent__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 128, CFSTR("Translator was missing mapping for MPModelPropertyAlbumHasExplicitContent"));

}

+ (void)__MPModelPropertyAlbumIsCompilation__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 129, CFSTR("Translator was missing mapping for MPModelPropertyAlbumIsCompilation"));

}

+ (void)__MPModelPropertyAlbumIsClassical__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 130, CFSTR("Translator was missing mapping for MPModelPropertyAlbumIsClassical"));

}

+ (void)__MPModelPropertyAlbumReleaseDateComponents__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 131, CFSTR("Translator was missing mapping for MPModelPropertyAlbumReleaseDateComponents"));

}

+ (void)__MPModelPropertyAlbumArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 132, CFSTR("Translator was missing mapping for MPModelPropertyAlbumArtwork"));

}

+ (void)__MPModelPropertyAlbumCopyrightText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 133, CFSTR("Translator was missing mapping for MPModelPropertyAlbumCopyrightText"));

}

+ (void)__MPModelPropertyAlbumLibraryAddedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 134, CFSTR("Translator was missing mapping for MPModelPropertyAlbumLibraryAddedDate"));

}

+ (void)__MPModelPropertyAlbumYear__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 135, CFSTR("Translator was missing mapping for MPModelPropertyAlbumYear"));

}

+ (void)__MPModelPropertyAlbumLibraryAdded__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 136, CFSTR("Translator was missing mapping for MPModelPropertyAlbumLibraryAdded"));

}

+ (void)__MPModelPropertyAlbumVolumeNormalization__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 137, CFSTR("Translator was missing mapping for MPModelPropertyAlbumVolumeNormalization"));

}

+ (void)__MPModelPropertyAlbumKeepLocalEnableState__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 138, CFSTR("Translator was missing mapping for MPModelPropertyAlbumKeepLocalEnableState"));

}

+ (void)__MPModelPropertyAlbumKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 139, CFSTR("Translator was missing mapping for MPModelPropertyAlbumKeepLocalManagedStatus"));

}

+ (void)__MPModelPropertyAlbumKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 140, CFSTR("Translator was missing mapping for MPModelPropertyAlbumKeepLocalManagedStatusReason"));

}

+ (void)__MPModelPropertyAlbumKeepLocalConstraints__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 141, CFSTR("Translator was missing mapping for MPModelPropertyAlbumKeepLocalConstraints"));

}

+ (void)__MPModelPropertyAlbumLibraryAddEligible__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 142, CFSTR("Translator was missing mapping for MPModelPropertyAlbumLibraryAddEligible"));

}

+ (void)__MPModelPropertyAlbumLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 143, CFSTR("Translator was missing mapping for MPModelPropertyAlbumLastDevicePlaybackDate"));

}

+ (void)__MPModelPropertyAlbumPreorder__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 144, CFSTR("Translator was missing mapping for MPModelPropertyAlbumPreorder"));

}

+ (void)__MPModelPropertyAlbumEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 145, CFSTR("Translator was missing mapping for MPModelPropertyAlbumEditorNotes"));

}

+ (void)__MPModelPropertyAlbumShortEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 146, CFSTR("Translator was missing mapping for MPModelPropertyAlbumShortEditorNotes"));

}

+ (void)__MPModelPropertyAlbumSongPopularity__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 147, CFSTR("Translator was missing mapping for MPModelPropertyAlbumSongPopularity"));

}

+ (void)__MPModelPropertyAlbumDownloadedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 148, CFSTR("Translator was missing mapping for MPModelPropertyAlbumDownloadedDate"));

}

+ (void)__MPModelPropertyAlbumTraits__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 149, CFSTR("Translator was missing mapping for MPModelPropertyAlbumTraits"));

}

+ (void)__MPModelPropertyAlbumClassicalExperienceAvailable__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 150, CFSTR("Translator was missing mapping for MPModelPropertyAlbumClassicalExperienceAvailable"));

}

+ (void)__MPModelPropertyAlbumVersionHash__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 151, CFSTR("Translator was missing mapping for MPModelPropertyAlbumVersionHash"));

}

+ (void)__MPModelPropertyAlbumIsFavorite__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 152, CFSTR("Translator was missing mapping for MPModelPropertyAlbumIsFavorite"));

}

+ (void)__MPModelPropertyAlbumIsDisliked__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 153, CFSTR("Translator was missing mapping for MPModelPropertyAlbumIsDisliked"));

}

+ (void)__MPModelPropertyAlbumDateFavorited__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelAlbum.m"), 154, CFSTR("Translator was missing mapping for MPModelPropertyAlbumDateFavorited"));

}

@end
