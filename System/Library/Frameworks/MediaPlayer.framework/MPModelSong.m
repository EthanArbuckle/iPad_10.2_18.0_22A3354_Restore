@implementation MPModelSong

- (id)newKeepLocalStatusObserverConfiguration
{
  MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration);
  -[MPModelSong localFileAsset](self, "localFileAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setHasNonPurgeableAsset:](v3, "setHasNonPurgeableAsset:", objc_msgSend(v4, "isNonPurgeable"));
  -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v3, "setIdentifyingModelObject:", self);
  -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v3, "setEnableState:", -[MPModelSong keepLocalEnableState](self, "keepLocalEnableState"));
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setManagedStatus:](v3, "setManagedStatus:", -[MPModelSong keepLocalManagedStatus](self, "keepLocalManagedStatus"));
  -[MPModelSong storeAsset](self, "storeAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setStoreRedownloadable:](v3, "setStoreRedownloadable:", objc_msgSend(v5, "isRedownloadable"));

  return v3;
}

+ (id)__year_KEY
{
  return CFSTR("MPModelPropertySongYear");
}

+ (id)__volumeNormalization_KEY
{
  return CFSTR("MPModelPropertySongVolumeNormalization");
}

+ (id)__volumeAdjustment_KEY
{
  return CFSTR("MPModelPropertySongVolumeAdjustment");
}

+ (id)__userRating_KEY
{
  return CFSTR("MPModelPropertySongUserRating");
}

+ (id)__traits_KEY
{
  return CFSTR("MPModelPropertySongTraits");
}

+ (id)__trackNumber_KEY
{
  return CFSTR("MPModelPropertySongTrackNumber");
}

+ (id)__trackCount_KEY
{
  return CFSTR("_MPModelPropertySongTrackCount");
}

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertySongTitle");
}

+ (id)__supportsExtendedLyricsAttribute_KEY
{
  return CFSTR("MPModelPropertySongSupportsExtendedLyricsAttribute");
}

+ (id)__storeAsset_KEY
{
  return CFSTR("MPModelRelationshipSongStoreAsset");
}

+ (id)__skipCount_KEY
{
  return CFSTR("MPModelPropertySongSkipCount");
}

+ (id)__shouldShowComposer_KEY
{
  return CFSTR("MPModelPropertySongShouldShowComposer");
}

+ (id)__previewAsset_KEY
{
  return CFSTR("MPModelRelationshipSongPreviewAsset");
}

+ (id)__playbackPosition_KEY
{
  return CFSTR("MPModelRelationshipSongPlaybackPosition");
}

+ (id)__playCount_KEY
{
  return CFSTR("MPModelPropertySongPlayCount");
}

+ (id)__lyrics_KEY
{
  return CFSTR("MPModelRelationshipSongLyrics");
}

+ (id)__localFileAsset_KEY
{
  return CFSTR("MPModelRelationshipSongLocalFileAsset");
}

+ (id)__libraryAdded_KEY
{
  return CFSTR("MPModelPropertySongLibraryAdded");
}

+ (id)__libraryAddedDate_KEY
{
  return CFSTR("MPModelPropertySongLibraryAddedDate");
}

+ (id)__libraryAddEligible_KEY
{
  return CFSTR("MPModelPropertySongLibraryAddEligible");
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return CFSTR("MPModelPropertySongLastDevicePlaybackDate");
}

+ (id)__keepLocalManagedStatus_KEY
{
  return CFSTR("MPModelPropertySongKeepLocalManagedStatus");
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return CFSTR("MPModelPropertySongKeepLocalManagedStatusReason");
}

+ (id)__keepLocalEnableState_KEY
{
  return CFSTR("MPModelPropertySongKeepLocalEnableState");
}

+ (id)__keepLocalConstraints_KEY
{
  return CFSTR("MPModelPropertySongKeepLocalConstraints");
}

+ (id)__isFavorite_KEY
{
  return CFSTR("MPModelPropertySongIsFavorite");
}

+ (id)__isDisliked_KEY
{
  return CFSTR("MPModelPropertySongIsDisliked");
}

+ (id)__homeSharingAsset_KEY
{
  return CFSTR("MPModelRelationshipSongHomeSharingAsset");
}

+ (id)__hasVideo_KEY
{
  return CFSTR("MPModelPropertySongHasVideo");
}

+ (id)__hasCredits_KEY
{
  return CFSTR("MPModelPropertySongHasCredits");
}

+ (id)__hasCloudSyncSource_KEY
{
  return CFSTR("MPModelPropertySongHasCloudSyncSource");
}

+ (id)__grouping_KEY
{
  return CFSTR("MPModelPropertySongGrouping");
}

+ (id)__genre_KEY
{
  return CFSTR("MPModelRelationshipSongGenre");
}

+ (id)__gaplessInfo_KEY
{
  return CFSTR("MPModelPropertySongGaplessInfo");
}

+ (id)__explicitSong_KEY
{
  return CFSTR("MPModelPropertySongExplicit");
}

+ (id)__duration_KEY
{
  return CFSTR("MPModelPropertySongDuration");
}

+ (id)__downloadedDate_KEY
{
  return CFSTR("MPModelPropertySongDownloadedDate");
}

+ (id)__discNumber_KEY
{
  return CFSTR("MPModelPropertySongDiscNumber");
}

+ (id)__dateFavorited_KEY
{
  return CFSTR("MPModelPropertySongDateFavorited");
}

+ (id)__copyrightText_KEY
{
  return CFSTR("MPModelPropertySongCopyrightText");
}

+ (id)__composer_KEY
{
  return CFSTR("MPModelRelationshipSongComposer");
}

+ (id)__cloudStatus_KEY
{
  return CFSTR("MPModelPropertySongCloudStatus");
}

+ (id)__classicalWork_KEY
{
  return CFSTR("MPModelPropertySongClassicalWork");
}

+ (id)__classicalMovement_KEY
{
  return CFSTR("MPModelPropertySongClassicalMovement");
}

+ (id)__classicalMovementNumber_KEY
{
  return CFSTR("MPModelPropertySongClassicalMovementNumber");
}

+ (id)__classicalMovementCount_KEY
{
  return CFSTR("MPModelPropertySongClassicalMovementCount");
}

+ (id)__beatsPerMinute_KEY
{
  return CFSTR("MPModelPropertySongBeatsPerMinute");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertySongArtwork");
}

+ (id)__artist_KEY
{
  return CFSTR("MPModelRelationshipSongArtist");
}

+ (id)__artistUploadedContent_KEY
{
  return CFSTR("MPModelPropertySongArtistUploadedContent");
}

+ (id)__album_KEY
{
  return CFSTR("MPModelRelationshipSongAlbum");
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertySongExplicit");
  v5[1] = CFSTR("MPModelPropertySongArtistUploadedContent");
  v5[2] = CFSTR("MPModelPropertySongLibraryAdded");
  v5[3] = CFSTR("MPModelPropertySongLibraryAddEligible");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  v15[0] = CFSTR("MPModelPropertySongLibraryAdded");
  v15[1] = CFSTR("MPModelPropertySongKeepLocalManagedStatus");
  v15[2] = CFSTR("MPModelPropertySongKeepLocalManagedStatusReason");
  v15[3] = CFSTR("MPModelPropertySongKeepLocalConstraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("MPModelPropertyFileAssetNonPurgeable");
  v13[0] = CFSTR("MPModelRelationshipSongLocalFileAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("MPModelRelationshipSongStoreAsset");
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
  v15[0] = CFSTR("MPModelPropertySongKeepLocalEnableState");
  v15[1] = CFSTR("MPModelPropertySongKeepLocalManagedStatus");
  v15[2] = CFSTR("MPModelPropertySongKeepLocalManagedStatusReason");
  v15[3] = CFSTR("MPModelPropertySongKeepLocalConstraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("MPModelPropertyFileAssetNonPurgeable");
  v13[0] = CFSTR("MPModelRelationshipSongLocalFileAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("MPModelRelationshipSongStoreAsset");
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
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertySongLibraryAddEligible");
  v5[1] = CFSTR("MPModelPropertySongHasCloudSyncSource");
  v5[2] = CFSTR("MPModelPropertySongLibraryAdded");
  v5[3] = CFSTR("MPModelPropertySongIsFavorite");
  v5[4] = CFSTR("MPModelPropertySongIsDisliked");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
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

  -[MPModelSong artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelSong *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  int v3;
  char v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[MPModelSong isExplicitSong](self, "isExplicitSong");
  v4 = ~-[MPModelSong isArtistUploadedContent](self, "isArtistUploadedContent");
  v5 = -[MPModelSong isLibraryAdded](self, "isLibraryAdded");
  v6 = -[MPModelSong isLibraryAddEligible](self, "isLibraryAddEligible");
  v7 = 0x100000000;
  if (!v6)
    v7 = 0;
  v8 = 256;
  if (!v5)
    v8 = 0;
  v9 = 0x10000;
  if (v3)
    v9 = 0x1000000;
  return (MPLibraryAddStatusObserverConfiguration)(v9 & 0xFFFFFFFFFFFFFFFELL | v4 & 1 | v8 | v7);
}

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  return +[MPModelSongKind kindWithVariants:options:](MPModelSongKind, "kindWithVariants:options:", a3, a4);
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "kindWithVariants:options:", a3, 0);
}

- (id)humanDescription
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = CFSTR("song");
  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongHasVideo"))
    && -[MPModelSong hasVideo](self, "hasVideo"))
  {
    v3 = CFSTR("musicVideo");
  }
  v4 = (void *)MEMORY[0x1E0CB37A0];
  -[MPModelObject identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "humanDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongTitle")))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelSong title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("“%@” "), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "insertString:atIndex:", v10, 0);
  }
  return v7;
}

+ (void)__MPModelPropertySongTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 111, CFSTR("Translator was missing mapping for MPModelPropertySongTitle"));

}

+ (void)__MPModelRelationshipSongAlbum__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 112, CFSTR("Translator was missing mapping for MPModelRelationshipSongAlbum"));

}

+ (void)__MPModelRelationshipSongArtist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 113, CFSTR("Translator was missing mapping for MPModelRelationshipSongArtist"));

}

+ (void)__MPModelRelationshipSongGenre__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 114, CFSTR("Translator was missing mapping for MPModelRelationshipSongGenre"));

}

+ (void)__MPModelRelationshipSongComposer__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 115, CFSTR("Translator was missing mapping for MPModelRelationshipSongComposer"));

}

+ (void)__MPModelPropertySongGrouping__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 116, CFSTR("Translator was missing mapping for MPModelPropertySongGrouping"));

}

+ (void)__MPModelPropertySongCopyrightText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 117, CFSTR("Translator was missing mapping for MPModelPropertySongCopyrightText"));

}

+ (void)__MPModelPropertySongDuration__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 118, CFSTR("Translator was missing mapping for MPModelPropertySongDuration"));

}

+ (void)___MPModelPropertySongTrackCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 119, CFSTR("Translator was missing mapping for _MPModelPropertySongTrackCount"));

}

+ (void)__MPModelPropertySongTrackNumber__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 120, CFSTR("Translator was missing mapping for MPModelPropertySongTrackNumber"));

}

+ (void)__MPModelPropertySongDiscNumber__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 121, CFSTR("Translator was missing mapping for MPModelPropertySongDiscNumber"));

}

+ (void)__MPModelPropertySongPlayCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 122, CFSTR("Translator was missing mapping for MPModelPropertySongPlayCount"));

}

+ (void)__MPModelPropertySongSkipCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 123, CFSTR("Translator was missing mapping for MPModelPropertySongSkipCount"));

}

+ (void)__MPModelPropertySongExplicit__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 124, CFSTR("Translator was missing mapping for MPModelPropertySongExplicit"));

}

+ (void)__MPModelPropertySongArtistUploadedContent__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 125, CFSTR("Translator was missing mapping for MPModelPropertySongArtistUploadedContent"));

}

+ (void)__MPModelPropertySongHasVideo__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 126, CFSTR("Translator was missing mapping for MPModelPropertySongHasVideo"));

}

+ (void)__MPModelPropertySongBeatsPerMinute__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 127, CFSTR("Translator was missing mapping for MPModelPropertySongBeatsPerMinute"));

}

+ (void)__MPModelRelationshipSongLyrics__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 128, CFSTR("Translator was missing mapping for MPModelRelationshipSongLyrics"));

}

+ (void)__MPModelPropertySongShouldShowComposer__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 129, CFSTR("Translator was missing mapping for MPModelPropertySongShouldShowComposer"));

}

+ (void)__MPModelPropertySongVolumeNormalization__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 130, CFSTR("Translator was missing mapping for MPModelPropertySongVolumeNormalization"));

}

+ (void)__MPModelPropertySongArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 131, CFSTR("Translator was missing mapping for MPModelPropertySongArtwork"));

}

+ (void)__MPModelRelationshipSongLocalFileAsset__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 132, CFSTR("Translator was missing mapping for MPModelRelationshipSongLocalFileAsset"));

}

+ (void)__MPModelPropertySongKeepLocalEnableState__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 133, CFSTR("Translator was missing mapping for MPModelPropertySongKeepLocalEnableState"));

}

+ (void)__MPModelPropertySongKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 134, CFSTR("Translator was missing mapping for MPModelPropertySongKeepLocalManagedStatus"));

}

+ (void)__MPModelPropertySongKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 135, CFSTR("Translator was missing mapping for MPModelPropertySongKeepLocalManagedStatusReason"));

}

+ (void)__MPModelPropertySongKeepLocalConstraints__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 136, CFSTR("Translator was missing mapping for MPModelPropertySongKeepLocalConstraints"));

}

+ (void)__MPModelPropertySongLibraryAdded__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 137, CFSTR("Translator was missing mapping for MPModelPropertySongLibraryAdded"));

}

+ (void)__MPModelPropertySongLibraryAddedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 138, CFSTR("Translator was missing mapping for MPModelPropertySongLibraryAddedDate"));

}

+ (void)__MPModelPropertySongLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 139, CFSTR("Translator was missing mapping for MPModelPropertySongLastDevicePlaybackDate"));

}

+ (void)__MPModelPropertySongLibraryAddEligible__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 140, CFSTR("Translator was missing mapping for MPModelPropertySongLibraryAddEligible"));

}

+ (void)__MPModelPropertySongHasCloudSyncSource__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 141, CFSTR("Translator was missing mapping for MPModelPropertySongHasCloudSyncSource"));

}

+ (void)__MPModelPropertySongClassicalWork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 142, CFSTR("Translator was missing mapping for MPModelPropertySongClassicalWork"));

}

+ (void)__MPModelPropertySongClassicalMovement__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 143, CFSTR("Translator was missing mapping for MPModelPropertySongClassicalMovement"));

}

+ (void)__MPModelPropertySongClassicalMovementCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 144, CFSTR("Translator was missing mapping for MPModelPropertySongClassicalMovementCount"));

}

+ (void)__MPModelPropertySongClassicalMovementNumber__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 145, CFSTR("Translator was missing mapping for MPModelPropertySongClassicalMovementNumber"));

}

+ (void)__MPModelPropertySongYear__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 146, CFSTR("Translator was missing mapping for MPModelPropertySongYear"));

}

+ (void)__MPModelRelationshipSongHomeSharingAsset__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 147, CFSTR("Translator was missing mapping for MPModelRelationshipSongHomeSharingAsset"));

}

+ (void)__MPModelRelationshipSongStoreAsset__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 148, CFSTR("Translator was missing mapping for MPModelRelationshipSongStoreAsset"));

}

+ (void)__MPModelRelationshipSongPreviewAsset__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 149, CFSTR("Translator was missing mapping for MPModelRelationshipSongPreviewAsset"));

}

+ (void)__MPModelPropertySongUserRating__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 150, CFSTR("Translator was missing mapping for MPModelPropertySongUserRating"));

}

+ (void)__MPModelPropertySongCloudStatus__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 151, CFSTR("Translator was missing mapping for MPModelPropertySongCloudStatus"));

}

+ (void)__MPModelPropertySongGaplessInfo__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 152, CFSTR("Translator was missing mapping for MPModelPropertySongGaplessInfo"));

}

+ (void)__MPModelPropertySongVolumeAdjustment__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 153, CFSTR("Translator was missing mapping for MPModelPropertySongVolumeAdjustment"));

}

+ (void)__MPModelRelationshipSongPlaybackPosition__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 154, CFSTR("Translator was missing mapping for MPModelRelationshipSongPlaybackPosition"));

}

+ (void)__MPModelPropertySongDownloadedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 155, CFSTR("Translator was missing mapping for MPModelPropertySongDownloadedDate"));

}

+ (void)__MPModelPropertySongTraits__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 156, CFSTR("Translator was missing mapping for MPModelPropertySongTraits"));

}

+ (void)__MPModelPropertySongIsFavorite__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 157, CFSTR("Translator was missing mapping for MPModelPropertySongIsFavorite"));

}

+ (void)__MPModelPropertySongIsDisliked__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 158, CFSTR("Translator was missing mapping for MPModelPropertySongIsDisliked"));

}

+ (void)__MPModelPropertySongDateFavorited__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 159, CFSTR("Translator was missing mapping for MPModelPropertySongDateFavorited"));

}

+ (void)__MPModelPropertySongSupportsExtendedLyricsAttribute__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 160, CFSTR("Translator was missing mapping for MPModelPropertySongSupportsExtendedLyricsAttribute"));

}

+ (void)__MPModelPropertySongHasCredits__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSong.m"), 161, CFSTR("Translator was missing mapping for MPModelPropertySongHasCredits"));

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
  v8[2] = __62__MPModelSong_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke;
  v8[3] = &unk_1E31635F8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __62__MPModelSong_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "length"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v56, CFSTR("title"));
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
  objc_msgSend(*(id *)(a1 + 32), "artist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personalizedStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cloudID");

    if (v10)
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("storeArtistAdamID"));

    }
    objc_msgSend(v7, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v13, CFSTR("artist"));

  }
  objc_msgSend(*(id *)(a1 + 32), "album");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v16, CFSTR("albumTitle"));
    v17 = objc_msgSend(v15, "discCount");
    if (v17 >= 1)
    {
      v18 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("discCount"));

    }
    objc_msgSend(v15, "releaseDateComponents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateFromComponents:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v22, CFSTR("releaseDate"));

    }
    v23 = objc_msgSend(v15, "trackCount");
    if (v23 >= 1)
    {
      v24 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("albumTrackCount"));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "library");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "persistentID");

  if (v28)
  {
    v29 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v30, CFSTR("persistentID"));

  }
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "universalStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "subscriptionAdamID");

  if (v33)
  {
    v34 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKey:", v35, CFSTR("storeItemAdamID"));

    v36 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("subscriptionStoreItemAdamID"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lli"), v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v38, CFSTR("playbackStoreID"));

  }
  objc_msgSend(*(id *)(a1 + 32), "copyrightText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "length"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v39, CFSTR("copyright"));
  v40 = objc_msgSend(*(id *)(a1 + 32), "discNumber");
  if (v40 >= 1)
  {
    v41 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKey:", v42, CFSTR("discNumber"));

  }
  objc_msgSend(*(id *)(a1 + 32), "genre");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "name");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "length"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v44, CFSTR("genre"));
  if (objc_msgSend(*(id *)(a1 + 32), "hasVideo"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isMusicVideo"));
  if (objc_msgSend(*(id *)(a1 + 32), "isExplicitSong"))
  {
    v45 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKey:", v46, CFSTR("isExplicit"));

  }
  v47 = objc_msgSend(*(id *)(a1 + 32), "trackNumber");
  if (v47 >= 1)
  {
    v48 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setObject:forKey:", v49, CFSTR("albumTrackNumber"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "supportsExtendedLyricsAttribute"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("storeExtendedLyricsAttribute"));
  objc_msgSend(*(id *)(a1 + 32), "localFileAsset");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50 && !objc_msgSend(v50, "protectionType"))
  {
    objc_msgSend(v51, "filePath");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "pathExtension");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_msgSend(v53, "length");
    if (v28 && v54)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "msv_urlForMediaAssetWithPersistentID:pathExtension:", v28, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v55, CFSTR("assetURL"));

    }
  }

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

  v3 = -[MPModelSong keepLocalManagedStatus](self, "keepLocalManagedStatus");
  v4 = -[MPModelSong isLibraryAdded](self, "isLibraryAdded");
  -[MPModelSong localFileAsset](self, "localFileAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelSong storeAsset](self, "storeAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _MPModelLibraryRemovalSupportedOptionsForIndividualItemProperties(v3, v4, v5, v6);

  return v7;
}

+ (BOOL)supportsLibraryRemoval
{
  return 1;
}

+ (int64_t)genericObjectType
{
  return 1;
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
