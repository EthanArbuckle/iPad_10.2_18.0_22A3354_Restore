@implementation MPStoreLibraryPersonalizationContentDescriptor

- (MPModelObject)model
{
  return self->_model;
}

- (int64_t)personalizationStyle
{
  return self->_personalizationStyle;
}

+ (id)requiredLightweightPersonalizationPropertiesForModelClass:(Class)a3 requestedProperties:(id)a4
{
  id v5;
  void *v6;
  const __CFString **v7;
  uint64_t v8;
  void *v9;
  MPPropertySet *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MPPropertySet *v19;
  void *v20;
  const __CFString **v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  _QWORD v34[7];
  _QWORD v35[7];
  _QWORD v36[9];

  v36[8] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v36[0] = CFSTR("MPModelPropertySongHasCloudSyncSource");
    v36[1] = CFSTR("MPModelPropertySongKeepLocalEnableState");
    v36[2] = CFSTR("MPModelPropertySongKeepLocalManagedStatus");
    v36[3] = CFSTR("MPModelPropertySongKeepLocalManagedStatusReason");
    v36[4] = CFSTR("MPModelPropertySongKeepLocalConstraints");
    v36[5] = CFSTR("MPModelPropertySongLibraryAdded");
    v36[6] = CFSTR("MPModelPropertySongIsFavorite");
    v36[7] = CFSTR("MPModelPropertySongIsDisliked");
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = (const __CFString **)v36;
    v8 = 8;
  }
  else
  {
    if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    {
      v35[0] = CFSTR("MPModelPropertyAlbumKeepLocalEnableState");
      v35[1] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus");
      v35[2] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason");
      v35[3] = CFSTR("MPModelPropertyAlbumKeepLocalConstraints");
      v35[4] = CFSTR("MPModelPropertyAlbumLibraryAdded");
      v35[5] = CFSTR("MPModelPropertyAlbumIsFavorite");
      v35[6] = CFSTR("MPModelPropertyAlbumIsDisliked");
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = (const __CFString **)v35;
    }
    else
    {
      if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
      {
        if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
        {
          objc_msgSend(v5, "relationships");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("MPModelRelationshipTVEpisodePlaybackPosition"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v32 = CFSTR("MPModelRelationshipTVEpisodePlaybackPosition");
            v31 = CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v9 = 0;
          }
          v19 = [MPPropertySet alloc];
          v30 = CFSTR("MPModelPropertyTVEpisodeHasCloudSyncSource");
          v20 = (void *)MEMORY[0x1E0C99D20];
          v21 = &v30;
        }
        else
        {
          if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
          {
            if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
            {
              v10 = 0;
              goto LABEL_10;
            }
            v23 = CFSTR("MPModelPropertyArtistIsFavorite");
            v24 = CFSTR("MPModelPropertyArtistIsDisliked");
            v25 = CFSTR("MPModelPropertyArtistLibraryAdded");
            v6 = (void *)MEMORY[0x1E0C99D20];
            v7 = &v23;
            v8 = 3;
            goto LABEL_8;
          }
          objc_msgSend(v5, "relationships");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("MPModelRelationshipMoviePlaybackPosition"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v28 = CFSTR("MPModelRelationshipMoviePlaybackPosition");
            v27 = CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v9 = 0;
          }
          v19 = [MPPropertySet alloc];
          v26 = CFSTR("MPModelPropertyMovieHasCloudSyncSource");
          v20 = (void *)MEMORY[0x1E0C99D20];
          v21 = &v26;
        }
        objc_msgSend(v20, "arrayWithObjects:count:", v21, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[MPPropertySet initWithProperties:relationships:](v19, "initWithProperties:relationships:", v22, v9);

        goto LABEL_9;
      }
      v34[0] = CFSTR("MPModelPropertyPlaylistKeepLocalEnableState");
      v34[1] = CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatus");
      v34[2] = CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason");
      v34[3] = CFSTR("MPModelPropertyPlaylistKeepLocalConstraints");
      v34[4] = CFSTR("MPModelPropertyPlaylistLibraryAdded");
      v34[5] = CFSTR("MPModelPropertyPlaylistIsFavorite");
      v34[6] = CFSTR("MPModelPropertyPlaylistIsDisliked");
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = (const __CFString **)v34;
    }
    v8 = 7;
  }
LABEL_8:
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v23, v24, v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v9);
  v10 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_10:
  return v10;
}

+ (id)lightweightPersonalizationPropertiesForModelClass:(Class)a3
{
  MPPropertySet *v4;
  MPPropertySet *v5;
  MPPropertySet *v6;
  MPPropertySet *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  MPPropertySet *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MPPropertySet *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MPPropertySet *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[3];
  _QWORD v45[2];
  _QWORD v46[7];
  _QWORD v47[8];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[7];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[7];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[11];
  _QWORD v57[7];
  _QWORD v58[9];

  v58[7] = *MEMORY[0x1E0C80C00];
  v57[0] = CFSTR("MPModelRelationshipGenericSong");
  v4 = [MPPropertySet alloc];
  v56[0] = CFSTR("MPModelPropertySongLibraryAdded");
  v56[1] = CFSTR("MPModelPropertySongKeepLocalEnableState");
  v56[2] = CFSTR("MPModelPropertySongKeepLocalManagedStatus");
  v56[3] = CFSTR("MPModelPropertySongKeepLocalManagedStatusReason");
  v56[4] = CFSTR("MPModelPropertySongKeepLocalConstraints");
  v56[5] = CFSTR("MPModelPropertySongLibraryAddEligible");
  v56[6] = CFSTR("MPModelPropertySongHasCloudSyncSource");
  v56[7] = CFSTR("MPModelPropertySongUserRating");
  v56[8] = CFSTR("MPModelPropertySongCloudStatus");
  v56[9] = CFSTR("MPModelPropertySongIsFavorite");
  v56[10] = CFSTR("MPModelPropertySongIsDisliked");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = CFSTR("MPModelRelationshipSongLocalFileAsset");
  +[MPModelFileAsset allSupportedProperties](MPModelFileAsset, "allSupportedProperties");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v43;
  v54[1] = CFSTR("MPModelRelationshipSongStoreAsset");
  objc_msgSend(a1, "_lightweightPersonalizationPropertiesForStoreAsset");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v42;
  v54[2] = CFSTR("MPModelRelationshipSongPlaybackPosition");
  objc_msgSend(a1, "_lightweightPersonalizationPropertiesForPlaybackPosition");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v41;
  v54[3] = CFSTR("MPModelRelationshipSongLyrics");
  objc_msgSend(a1, "_lightweightPersonalizationPropertiesForLyrics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[MPPropertySet initWithProperties:relationships:](v4, "initWithProperties:relationships:", v39, v37);
  v58[0] = v36;
  v57[1] = CFSTR("MPModelRelationshipGenericTVEpisode");
  v5 = [MPPropertySet alloc];
  v53[0] = CFSTR("MPModelPropertyTVEpisodeLibraryAdded");
  v53[1] = CFSTR("MPModelPropertyTVEpisodeKeepLocalEnableState");
  v53[2] = CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus");
  v53[3] = CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason");
  v53[4] = CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints");
  v53[5] = CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible");
  v53[6] = CFSTR("MPModelPropertyTVEpisodeHasCloudSyncSource");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset");
  +[MPModelFileAsset allSupportedProperties](MPModelFileAsset, "allSupportedProperties");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v35;
  v51[1] = CFSTR("MPModelRelationshipTVEpisodeStoreAsset");
  objc_msgSend(a1, "_lightweightPersonalizationPropertiesForStoreAsset");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v34;
  v51[2] = CFSTR("MPModelRelationshipTVEpisodePlaybackPosition");
  objc_msgSend(a1, "_lightweightPersonalizationPropertiesForPlaybackPosition");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[MPPropertySet initWithProperties:relationships:](v5, "initWithProperties:relationships:", v32, v31);
  v58[1] = v30;
  v57[2] = CFSTR("MPModelRelationshipGenericMovie");
  v6 = [MPPropertySet alloc];
  v50[0] = CFSTR("MPModelPropertyMovieLibraryAdded");
  v50[1] = CFSTR("MPModelPropertyMovieKeepLocalEnableState");
  v50[2] = CFSTR("MPModelPropertyMovieKeepLocalManagedStatus");
  v50[3] = CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason");
  v50[4] = CFSTR("MPModelPropertyMovieKeepLocalConstraints");
  v50[5] = CFSTR("MPModelPropertyMovieLibraryAddEligible");
  v50[6] = CFSTR("MPModelPropertyMovieHasCloudSyncSource");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = CFSTR("MPModelRelationshipMovieLocalFileAsset");
  +[MPModelFileAsset allSupportedProperties](MPModelFileAsset, "allSupportedProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v29;
  v48[1] = CFSTR("MPModelRelationshipMovieStoreAsset");
  objc_msgSend(a1, "_lightweightPersonalizationPropertiesForStoreAsset");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v28;
  v48[2] = CFSTR("MPModelRelationshipMoviePlaybackPosition");
  v24 = a1;
  objc_msgSend(a1, "_lightweightPersonalizationPropertiesForPlaybackPosition");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPPropertySet initWithProperties:relationships:](v6, "initWithProperties:relationships:", v26, v25);
  v58[2] = v7;
  v57[3] = CFSTR("MPModelRelationshipGenericAlbum");
  v47[0] = CFSTR("MPModelPropertyAlbumLibraryAdded");
  v47[1] = CFSTR("MPModelPropertyAlbumKeepLocalEnableState");
  v47[2] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus");
  v47[3] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason");
  v47[4] = CFSTR("MPModelPropertyAlbumKeepLocalConstraints");
  v47[5] = CFSTR("MPModelPropertyAlbumLibraryAddEligible");
  v47[6] = CFSTR("MPModelPropertyAlbumIsFavorite");
  v47[7] = CFSTR("MPModelPropertyAlbumIsDisliked");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v9;
  v57[4] = CFSTR("MPModelRelationshipGenericPlaylist");
  v46[0] = CFSTR("MPModelPropertyPlaylistLibraryAdded");
  v46[1] = CFSTR("MPModelPropertyPlaylistKeepLocalEnableState");
  v46[2] = CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatus");
  v46[3] = CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason");
  v46[4] = CFSTR("MPModelPropertyPlaylistKeepLocalConstraints");
  v46[5] = CFSTR("MPModelPropertyPlaylistIsFavorite");
  v46[6] = CFSTR("MPModelPropertyPlaylistIsDisliked");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v11;
  v57[5] = CFSTR("MPModelRelationshipGenericTVSeason");
  v45[0] = CFSTR("MPModelPropertyTVSeasonLibraryAdded");
  v45[1] = CFSTR("MPModelPropertyTVSeasonLibraryAddEligible");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v13;
  v57[6] = CFSTR("MPModelRelationshipGenericArtist");
  v44[0] = CFSTR("MPModelPropertyArtistIsFavorite");
  v44[1] = CFSTR("MPModelPropertyArtistIsDisliked");
  v44[2] = CFSTR("MPModelPropertyArtistLibraryAdded");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v17 = CFSTR("MPModelRelationshipGenericSong");
LABEL_17:
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v17 = CFSTR("MPModelRelationshipGenericTVEpisode");
    goto LABEL_17;
  }
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v17 = CFSTR("MPModelRelationshipGenericMovie");
    goto LABEL_17;
  }
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v17 = CFSTR("MPModelRelationshipGenericAlbum");
    goto LABEL_17;
  }
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v17 = CFSTR("MPModelRelationshipGenericPlaylist");
    goto LABEL_17;
  }
  if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    {
      v17 = CFSTR("MPModelRelationshipGenericTVSeason");
    }
    else
    {
      if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v24, CFSTR("MPStoreLibraryPersonalizationContentDescriptor.m"), 115, CFSTR("No personalization properties for modelClass: %@"), a3);

        v20 = 0;
        goto LABEL_19;
      }
      v17 = CFSTR("MPModelRelationshipGenericArtist");
    }
    goto LABEL_17;
  }
  v18 = [MPPropertySet alloc];
  v19 = -[MPPropertySet initWithProperties:relationships:](v18, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], v16);
LABEL_18:
  v20 = (void *)v19;
LABEL_19:

  return v20;
}

+ (id)_lightweightPersonalizationPropertiesForStoreAsset
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyStoreAssetEndpointType");
  v5[1] = CFSTR("MPModelPropertyStoreAssetRedownloadParameters");
  v5[2] = CFSTR("MPModelPropertyStoreAssetRedownloadable");
  v5[3] = CFSTR("MPModelPropertyStoreAssetAccountIdentifier");
  v5[4] = CFSTR("MPModelPropertyStoreAssetShouldReportPlayEvents");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_lightweightPersonalizationPropertiesForPlaybackPosition
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyPlaybackPositionBookmarkTime");
  v5[1] = CFSTR("MPModelPropertyPlaybackPositionHasBeenPlayed");
  v5[2] = CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier");
  v5[3] = CFSTR("MPModelPropertyPlaybackPositionUserPlayCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_lightweightPersonalizationPropertiesForLyrics
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyLyricsHasLibraryLyrics");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MPStoreLibraryPersonalizationContentDescriptor)initWithModel:(id)a3 personalizationStyle:(int64_t)a4
{
  id v7;
  MPStoreLibraryPersonalizationContentDescriptor *v8;
  MPStoreLibraryPersonalizationContentDescriptor *v9;

  v7 = a3;
  v8 = -[MPStoreLibraryPersonalizationContentDescriptor init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, a3);
    v9->_personalizationStyle = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MPModelObject identifiers](self->_model, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MPStoreLibraryPersonalizationContentDescriptor %p modelObject.identifiers=%@>"), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
