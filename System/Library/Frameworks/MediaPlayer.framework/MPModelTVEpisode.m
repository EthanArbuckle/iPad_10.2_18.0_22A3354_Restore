@implementation MPModelTVEpisode

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeTitle");
}

+ (id)__storeAsset_KEY
{
  return CFSTR("MPModelRelationshipTVEpisodeStoreAsset");
}

+ (id)__show_KEY
{
  return CFSTR("MPModelRelationshipTVEpisodeShow");
}

+ (id)__season_KEY
{
  return CFSTR("MPModelRelationshipTVEpisodeSeason");
}

+ (id)__releaseDate_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeReleaseDate");
}

+ (id)__playbackPosition_KEY
{
  return CFSTR("MPModelRelationshipTVEpisodePlaybackPosition");
}

+ (id)__musicShow_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeMusicShow");
}

+ (id)__localFileAsset_KEY
{
  return CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset");
}

+ (id)__libraryAdded_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeLibraryAdded");
}

+ (id)__libraryAddedDate_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeLibraryAddedDate");
}

+ (id)__libraryAddEligible_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible");
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeLastDevicePlaybackDate");
}

+ (id)__keepLocalManagedStatus_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus");
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason");
}

+ (id)__keepLocalEnableState_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeKeepLocalEnableState");
}

+ (id)__keepLocalConstraints_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints");
}

+ (id)__hasCloudSyncSource_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeHasCloudSyncSource");
}

+ (id)__explicitRating_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeExplicitRating");
}

+ (id)__episodeType_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeType");
}

+ (id)__episodeTypeDisplayName_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeTypeDisplayName");
}

+ (id)__episodeNumber_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeNumber");
}

+ (id)__duration_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeDuration");
}

+ (id)__downloadedDate_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeDownloadedDate");
}

+ (id)__descriptionText_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeDescriptionText");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyTVEpisodeArtwork");
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
  v15[0] = CFSTR("MPModelPropertyTVEpisodeLibraryAdded");
  v15[1] = CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus");
  v15[2] = CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason");
  v15[3] = CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("MPModelPropertyFileAssetNonPurgeable");
  v13[0] = CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("MPModelRelationshipTVEpisodeStoreAsset");
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
  v15[0] = CFSTR("MPModelPropertyTVEpisodeKeepLocalEnableState");
  v15[1] = CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus");
  v15[2] = CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason");
  v15[3] = CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("MPModelPropertyFileAssetNonPurgeable");
  v13[0] = CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("MPModelRelationshipTVEpisodeStoreAsset");
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
  v5[0] = CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible");
  v5[1] = CFSTR("MPModelPropertyTVEpisodeHasCloudSyncSource");
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
  v5[0] = CFSTR("MPModelPropertyTVEpisodeExplicitRating");
  v5[1] = CFSTR("MPModelPropertyTVEpisodeLibraryAdded");
  v5[2] = CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  return +[MPModelTVEpisodeKind kindWithVariants:options:](MPModelTVEpisodeKind, "kindWithVariants:options:", a3, a4);
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "kindWithVariants:options:", a3, 0);
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TV episode %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeTitle")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelTVEpisode title](self, "title");
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

  -[MPModelTVEpisode artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelTVEpisode *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyTVEpisodeTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 104, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeTitle"));

}

+ (void)__MPModelPropertyTVEpisodeDescriptionText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 105, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeDescriptionText"));

}

+ (void)__MPModelPropertyTVEpisodeDuration__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 106, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeDuration"));

}

+ (void)__MPModelPropertyTVEpisodeHasCloudSyncSource__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 107, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeHasCloudSyncSource"));

}

+ (void)__MPModelPropertyTVEpisodeMusicShow__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 108, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeMusicShow"));

}

+ (void)__MPModelPropertyTVEpisodeNumber__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 109, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeNumber"));

}

+ (void)__MPModelPropertyTVEpisodeExplicitRating__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 110, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeExplicitRating"));

}

+ (void)__MPModelRelationshipTVEpisodeLocalFileAsset__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 111, CFSTR("Translator was missing mapping for MPModelRelationshipTVEpisodeLocalFileAsset"));

}

+ (void)__MPModelRelationshipTVEpisodePlaybackPosition__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 112, CFSTR("Translator was missing mapping for MPModelRelationshipTVEpisodePlaybackPosition"));

}

+ (void)__MPModelRelationshipTVEpisodeStoreAsset__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 113, CFSTR("Translator was missing mapping for MPModelRelationshipTVEpisodeStoreAsset"));

}

+ (void)__MPModelRelationshipTVEpisodeSeason__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 114, CFSTR("Translator was missing mapping for MPModelRelationshipTVEpisodeSeason"));

}

+ (void)__MPModelRelationshipTVEpisodeShow__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 115, CFSTR("Translator was missing mapping for MPModelRelationshipTVEpisodeShow"));

}

+ (void)__MPModelPropertyTVEpisodeReleaseDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 117, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeReleaseDate"));

}

+ (void)__MPModelPropertyTVEpisodeType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 118, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeType"));

}

+ (void)__MPModelPropertyTVEpisodeTypeDisplayName__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 119, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeTypeDisplayName"));

}

+ (void)__MPModelPropertyTVEpisodeLibraryAdded__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 120, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeLibraryAdded"));

}

+ (void)__MPModelPropertyTVEpisodeLibraryAddedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 121, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeLibraryAddedDate"));

}

+ (void)__MPModelPropertyTVEpisodeLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 122, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeLastDevicePlaybackDate"));

}

+ (void)__MPModelPropertyTVEpisodeLibraryAddEligible__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 123, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeLibraryAddEligible"));

}

+ (void)__MPModelPropertyTVEpisodeKeepLocalEnableState__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 124, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeKeepLocalEnableState"));

}

+ (void)__MPModelPropertyTVEpisodeKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 125, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeKeepLocalManagedStatus"));

}

+ (void)__MPModelPropertyTVEpisodeKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 126, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeKeepLocalManagedStatusReason"));

}

+ (void)__MPModelPropertyTVEpisodeKeepLocalConstraints__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 127, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeKeepLocalConstraints"));

}

+ (void)__MPModelPropertyTVEpisodeArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 128, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeArtwork"));

}

+ (void)__MPModelPropertyTVEpisodeDownloadedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelTVEpisode.m"), 129, CFSTR("Translator was missing mapping for MPModelPropertyTVEpisodeDownloadedDate"));

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
  v8[2] = __67__MPModelTVEpisode_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke;
  v8[3] = &unk_1E31635F8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __67__MPModelTVEpisode_MPModelObjectMediaItem__mediaItemPropertyValues__block_invoke(uint64_t a1)
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "length"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v26, CFSTR("title"));
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
  objc_msgSend(*(id *)(a1 + 32), "show");
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
    objc_msgSend(v7, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v13, CFSTR("artist"));

  }
  objc_msgSend(*(id *)(a1 + 32), "season");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "number");
    if (v16)
    {
      v17 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("seasonNumber"));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "universalStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "subscriptionAdamID");

  if (v21)
  {
    v22 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("storeItemAdamID"));

  }
  if (MPModelTVEpisodeIsRestricted(*(void **)(a1 + 32)))
  {
    v24 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("isExplicit"));

  }
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  _BOOL4 IsRestricted;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  IsRestricted = MPModelTVEpisodeIsRestricted(self);
  v4 = -[MPModelTVEpisode isLibraryAdded](self, "isLibraryAdded");
  v5 = -[MPModelTVEpisode isLibraryAddEligible](self, "isLibraryAddEligible");
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

  v3 = -[MPModelTVEpisode keepLocalManagedStatus](self, "keepLocalManagedStatus");
  v4 = -[MPModelTVEpisode isLibraryAdded](self, "isLibraryAdded");
  -[MPModelTVEpisode localFileAsset](self, "localFileAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelTVEpisode storeAsset](self, "storeAsset");
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
  -[MPModelTVEpisode localFileAsset](self, "localFileAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setHasNonPurgeableAsset:](v3, "setHasNonPurgeableAsset:", objc_msgSend(v4, "isNonPurgeable"));
  -[MPLibraryKeepLocalStatusObserverConfiguration setIdentifyingModelObject:](v3, "setIdentifyingModelObject:", self);
  -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v3, "setEnableState:", -[MPModelTVEpisode keepLocalEnableState](self, "keepLocalEnableState"));
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setManagedStatus:](v3, "setManagedStatus:", -[MPModelTVEpisode keepLocalManagedStatus](self, "keepLocalManagedStatus"));
  -[MPModelTVEpisode storeAsset](self, "storeAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setStoreRedownloadable:](v3, "setStoreRedownloadable:", objc_msgSend(v5, "isRedownloadable"));

  return v3;
}

+ (int64_t)genericObjectType
{
  return 6;
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
