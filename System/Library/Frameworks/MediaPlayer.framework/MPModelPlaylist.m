@implementation MPModelPlaylist

+ (id)__visiblePlaylist_KEY
{
  return CFSTR("MPModelPropertyPlaylistVisiblePlaylist");
}

+ (id)__versionHash_KEY
{
  return CFSTR("MPModelPropertyPlaylistVersionHash");
}

+ (id)__userEditableComponents_KEY
{
  return CFSTR("MPModelPropertyPlaylistUserEditableComponents");
}

+ (id)__type_KEY
{
  return CFSTR("MPModelPropertyPlaylistType");
}

+ (id)__traits_KEY
{
  return CFSTR("MPModelPropertyPlaylistTraits");
}

+ (id)__trackCount_KEY
{
  return CFSTR("MPModelPropertyPlaylistTrackCount");
}

+ (id)__tiledArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyPlaylistTracksTiledArtwork");
}

+ (id)__subscribed_KEY
{
  return CFSTR("MPModelPropertyPlaylistSubscribed");
}

+ (id)__shortEditorNotes_KEY
{
  return CFSTR("MPModelPropertyPlaylistShortEditorNotes");
}

+ (id)__shareURL_KEY
{
  return CFSTR("MPModelPropertyPlaylistShareURL");
}

+ (id)__shareShortURL_KEY
{
  return CFSTR("MPModelPropertyPlaylistShareShortURL");
}

+ (id)__releaseDateComponents_KEY
{
  return CFSTR("MPModelPropertyPlaylistReleaseDateComponents");
}

+ (id)__publicPlaylist_KEY
{
  return CFSTR("MPModelPropertyPlaylistPublicPlaylist");
}

+ (id)__parentPersistentID_KEY
{
  return CFSTR("MPModelPropertyPlaylistParentPersistentID");
}

+ (id)__owner_KEY
{
  return CFSTR("MPModelPropertyPlaylistIsOwner");
}

+ (id)__name_KEY
{
  return CFSTR("MPModelPropertyPlaylistName");
}

+ (id)__libraryAdded_KEY
{
  return CFSTR("MPModelPropertyPlaylistLibraryAdded");
}

+ (id)__libraryAddedDate_KEY
{
  return CFSTR("MPModelPropertyPlaylistLibraryAddedDate");
}

+ (id)__lastModifiedDateComponents_KEY
{
  return CFSTR("MPModelPropertyPlaylistLastModifiedDateComponents");
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return CFSTR("MPModelPropertyPlaylistLastDevicePlaybackDate");
}

+ (id)__keepLocalManagedStatus_KEY
{
  return CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatus");
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason");
}

+ (id)__keepLocalEnableState_KEY
{
  return CFSTR("MPModelPropertyPlaylistKeepLocalEnableState");
}

+ (id)__keepLocalConstraints_KEY
{
  return CFSTR("MPModelPropertyPlaylistKeepLocalConstraints");
}

+ (id)__isFavorite_KEY
{
  return CFSTR("MPModelPropertyPlaylistIsFavorite");
}

+ (id)__isDisliked_KEY
{
  return CFSTR("MPModelPropertyPlaylistIsDisliked");
}

+ (id)__hasExplicitContent_KEY
{
  return CFSTR("MPModelPropertyPlaylistHasExplicitContent");
}

+ (id)__hasCleanContent_KEY
{
  return CFSTR("MPModelPropertyPlaylistHasCleanContent");
}

+ (id)__favoriteSongsPlaylist_KEY
{
  return CFSTR("MPModelPropertyPlaylistIsFavoriteSongsPlaylist");
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyPlaylistEditorialArtwork");
}

+ (id)__editorNotes_KEY
{
  return CFSTR("MPModelPropertyPlaylistEditorNotes");
}

+ (id)__downloadedDate_KEY
{
  return CFSTR("MPModelPropertyPlaylistDownloadedDate");
}

+ (id)__descriptionText_KEY
{
  return CFSTR("MPModelPropertyPlaylistDescriptionText");
}

+ (id)__dateFavorited_KEY
{
  return CFSTR("MPModelPropertyPlaylistDateFavorited");
}

+ (id)__curator_KEY
{
  return CFSTR("MPModelRelationshipPlaylistCurator");
}

+ (id)__curatorPlaylist_KEY
{
  return CFSTR("MPModelPropertyPlaylistCuratorPlaylist");
}

+ (id)__coverArtworkRecipe_KEY
{
  return CFSTR("MPModelPropertyPlaylistCoverArtworkRecipe");
}

+ (id)__collaboratorStatus_KEY
{
  return CFSTR("MPModelPropertyPlaylistCollaboratorStatus");
}

+ (id)__collaboratorPermissions_KEY
{
  return CFSTR("MPModelPropertyPlaylistCollaboratorPermissions");
}

+ (id)__collaborative_KEY
{
  return CFSTR("MPModelPropertyPlaylistIsCollaborative");
}

+ (id)__collaborationSharingMode_KEY
{
  return CFSTR("MPModelPropertyPlaylistCollaborationSharingMode");
}

+ (id)__collaborationMode_KEY
{
  return CFSTR("MPModelPropertyPlaylistCollaborationMode");
}

+ (id)__collaborationJoinRequestIsPending_KEY
{
  return CFSTR("MPModelPropertyPlaylistCollaborationJoinRequestIsPending");
}

+ (id)__collaborationInvitationURL_KEY
{
  return CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL");
}

+ (id)__collaborationInvitationURLExpirationDate_KEY
{
  return CFSTR("MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate");
}

+ (id)__cloudVersionHash_KEY
{
  return CFSTR("MPModelPropertyPlaylistCloudVersionHash");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyPlaylistArtwork");
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyPlaylistIsFavorite");
  v5[1] = CFSTR("MPModelPropertyPlaylistIsDisliked");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelPlaylist artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelPlaylist *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)kindWithVariants:(unint64_t)a3 playlistEntryKind:(id)a4 options:(unint64_t)a5
{
  return +[MPModelPlaylistKind kindWithVariants:playlistEntryKind:options:](MPModelPlaylistKind, "kindWithVariants:playlistEntryKind:options:", a3, a4, a5);
}

+ (id)kindWithPlaylistEntryKind:(id)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "kindWithVariants:playlistEntryKind:options:", 223, a3, a4);
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyPlaylistLibraryAdded");
  v5[1] = CFSTR("MPModelPropertyPlaylistHasCleanContent");
  v5[2] = CFSTR("MPModelPropertyPlaylistHasExplicitContent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)requiredLibraryRemovalProperties
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyPlaylistLibraryAdded");
  v5[1] = CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatus");
  v5[2] = CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason");
  v5[3] = CFSTR("MPModelPropertyPlaylistKeepLocalConstraints");
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
  v5[0] = CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatus");
  v5[1] = CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason");
  v5[2] = CFSTR("MPModelPropertyPlaylistKeepLocalEnableState");
  v5[3] = CFSTR("MPModelPropertyPlaylistKeepLocalConstraints");
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
  objc_msgSend(v3, "setObject:forKey:", CFSTR("_MPNowPlayingCollectionInfoCollectionTypePlaylist"), CFSTR("_MPNowPlayingCollectionInfoKeyCollectionType"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MPModelPlaylist_MPContentItemAdditions__contentItemCollectionInfo__block_invoke;
  v8[3] = &unk_1E31635F8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __68__MPModelPlaylist_MPContentItemAdditions__contentItemCollectionInfo__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, CFSTR("_MPNowPlayingCollectionInfoKeyTitle"));
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "universalStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalPlaylistID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("_MPNowPlayingInfoPropertyPlaylistGlobalIdentifier"));
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, CFSTR("_MPNowPlayingCollectionInfoKeyIdentifiers"));

}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[MPModelPlaylist isLibraryAdded](self, "isLibraryAdded");
  v4 = -[MPModelPlaylist hasCleanContent](self, "hasCleanContent");
  v5 = -[MPModelPlaylist hasExplicitContent](self, "hasExplicitContent");
  v6 = 0x100000000;
  if (v5)
    v6 = 0x101000000;
  v7 = 0x10000;
  if (!v4)
    v7 = 0;
  v8 = 257;
  if (!v3)
    v8 = 1;
  return (MPLibraryAddStatusObserverConfiguration)(v8 | v7 | v6);
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  uint64_t v3;

  if (-[MPModelPlaylist isLibraryAdded](self, "isLibraryAdded"))
    v3 = 2 * (-[MPModelPlaylist type](self, "type") != 9);
  else
    v3 = 0;
  return v3 | (-[MPModelPlaylist keepLocalManagedStatus](self, "keepLocalManagedStatus") == 2);
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
  -[MPLibraryKeepLocalStatusObserverConfiguration setEnableState:](v3, "setEnableState:", -[MPModelPlaylist keepLocalEnableState](self, "keepLocalEnableState"));
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setManagedStatus:](v3, "setManagedStatus:", -[MPModelPlaylist keepLocalManagedStatus](self, "keepLocalManagedStatus"));
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setStoreRedownloadable:](v3, "setStoreRedownloadable:", 1);
  -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration setCollectionType:](v3, "setCollectionType:", 1);
  return v3;
}

+ (int64_t)genericObjectType
{
  return 4;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("playlist %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistName")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelPlaylist name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("“%@” "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertString:atIndex:", v9, 0);
  }
  return v6;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelPlaylist editorialArtworkCatalogBlock](self, "editorialArtworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelPlaylist *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tracksTiledArtworkCatalogWithRows:(unint64_t)a3 columns:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;

  -[MPModelPlaylist tiledArtworkCatalogBlock](self, "tiledArtworkCatalogBlock");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, MPModelPlaylist *, unint64_t, unint64_t))(v7 + 16))(v7, self, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isFavoriteSongsPlaylist
{
  return self->_isFavoriteSongsPlaylist;
}

- (void)setIsFavoriteSongsPlaylist:(BOOL)a3
{
  self->_isFavoriteSongsPlaylist = a3;
}

+ (void)__MPModelPropertyPlaylistName__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 136, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistName"));

}

+ (void)__MPModelPropertyPlaylistDescriptionText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 137, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistDescriptionText"));

}

+ (void)__MPModelRelationshipPlaylistCurator__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 138, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistCurator"));

}

+ (void)__MPModelPropertyPlaylistParentPersistentID__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 139, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistParentPersistentID"));

}

+ (void)__MPModelPropertyPlaylistHasCleanContent__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 140, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistHasCleanContent"));

}

+ (void)__MPModelPropertyPlaylistHasExplicitContent__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 141, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistHasExplicitContent"));

}

+ (void)__MPModelPropertyPlaylistCuratorPlaylist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 142, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCuratorPlaylist"));

}

+ (void)__MPModelPropertyPlaylistIsOwner__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 143, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistIsOwner"));

}

+ (void)__MPModelPropertyPlaylistPublicPlaylist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 144, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistPublicPlaylist"));

}

+ (void)__MPModelPropertyPlaylistVisiblePlaylist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 145, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistVisiblePlaylist"));

}

+ (void)__MPModelPropertyPlaylistSubscribed__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 146, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistSubscribed"));

}

+ (void)__MPModelPropertyPlaylistUserEditableComponents__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 147, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistUserEditableComponents"));

}

+ (void)__MPModelPropertyPlaylistType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 148, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistType"));

}

+ (void)__MPModelPropertyPlaylistTrackCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 149, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistTrackCount"));

}

+ (void)__MPModelPropertyPlaylistEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 150, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistEditorNotes"));

}

+ (void)__MPModelPropertyPlaylistShortEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 151, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistShortEditorNotes"));

}

+ (void)__MPModelPropertyPlaylistShareURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 152, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistShareURL"));

}

+ (void)__MPModelPropertyPlaylistShareShortURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 153, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistShareShortURL"));

}

+ (void)__MPModelPropertyPlaylistReleaseDateComponents__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 154, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistReleaseDateComponents"));

}

+ (void)__MPModelPropertyPlaylistLastModifiedDateComponents__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 155, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistLastModifiedDateComponents"));

}

+ (void)__MPModelPropertyPlaylistArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 156, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistArtwork"));

}

+ (void)__MPModelPropertyPlaylistEditorialArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 157, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistEditorialArtwork"));

}

+ (void)__MPModelPropertyPlaylistLibraryAdded__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 158, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistLibraryAdded"));

}

+ (void)__MPModelPropertyPlaylistLibraryAddedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 159, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistLibraryAddedDate"));

}

+ (void)__MPModelPropertyPlaylistTracksTiledArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 160, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistTracksTiledArtwork"));

}

+ (void)__MPModelPropertyPlaylistKeepLocalEnableState__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 161, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistKeepLocalEnableState"));

}

+ (void)__MPModelPropertyPlaylistKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 162, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistKeepLocalManagedStatus"));

}

+ (void)__MPModelPropertyPlaylistKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 163, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistKeepLocalManagedStatusReason"));

}

+ (void)__MPModelPropertyPlaylistKeepLocalConstraints__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 164, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistKeepLocalConstraints"));

}

+ (void)__MPModelPropertyPlaylistLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 165, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistLastDevicePlaybackDate"));

}

+ (void)__MPModelPropertyPlaylistCloudVersionHash__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 166, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCloudVersionHash"));

}

+ (void)__MPModelPropertyPlaylistVersionHash__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 167, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistVersionHash"));

}

+ (void)__MPModelPropertyPlaylistDownloadedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 168, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistDownloadedDate"));

}

+ (void)__MPModelPropertyPlaylistTraits__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 169, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistTraits"));

}

+ (void)__MPModelPropertyPlaylistIsFavorite__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 170, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistIsFavorite"));

}

+ (void)__MPModelPropertyPlaylistIsDisliked__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 171, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistIsDisliked"));

}

+ (void)__MPModelPropertyPlaylistDateFavorited__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 172, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistDateFavorited"));

}

+ (void)__MPModelPropertyPlaylistIsFavoriteSongsPlaylist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 173, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistIsFavoriteSongsPlaylist"));

}

+ (void)__MPModelPropertyPlaylistCoverArtworkRecipe__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 174, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCoverArtworkRecipe"));

}

+ (void)__MPModelPropertyPlaylistIsCollaborative__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 175, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistIsCollaborative"));

}

+ (void)__MPModelPropertyPlaylistCollaborationSharingMode__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 176, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCollaborationSharingMode"));

}

+ (void)__MPModelPropertyPlaylistCollaborationMode__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 177, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCollaborationMode"));

}

+ (void)__MPModelPropertyPlaylistCollaboratorPermissions__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 178, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCollaboratorPermissions"));

}

+ (void)__MPModelPropertyPlaylistCollaborationInvitationURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 179, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCollaborationInvitationURL"));

}

+ (void)__MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 180, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate"));

}

+ (void)__MPModelPropertyPlaylistCollaborationJoinRequestIsPending__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 181, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCollaborationJoinRequestIsPending"));

}

+ (void)__MPModelPropertyPlaylistCollaboratorStatus__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylist.m"), 182, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistCollaboratorStatus"));

}

@end
