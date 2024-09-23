@implementation MPMediaRemoteEntityTranslator

uint64_t __60__MPMediaRemoteEntityTranslator_mapIdentifierCreationBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

MPIdentifierSet *__60__MPMediaRemoteEntityTranslator_mapIdentifierCreationBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MPIdentifierSet *v4;
  void *v5;
  id v6;
  id v7;
  MPIdentifierSet *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = [MPIdentifierSet alloc];
  +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_msgSend(*(id *)(a1 + 32), "MPModelClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__MPMediaRemoteEntityTranslator_mapIdentifierCreationBlock___block_invoke_2;
  v10[3] = &unk_1E3162B58;
  v6 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = v6;
  v7 = v3;
  v8 = -[MPIdentifierSet initWithSource:modelKind:block:](v4, "initWithSource:modelKind:block:", CFSTR("MediaRemote"), v5, v10);

  return v8;
}

- (id)objectForPropertySet:(id)a3 contentItem:(id)a4 context:(id)a5
{
  return -[MPBaseEntityTranslator objectForPropertySet:source:context:](self, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

id __55__MPMediaRemoteEntityTranslator_mapArtworkPropertyKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a2;
  objc_msgSend(a3, "artworkGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkCatalogBlockForContentItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __52__MPMediaRemoteEntityTranslator_buildSchemaIfNeeded__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "mapIdentifierCreationBlock:", &__block_literal_global_14768);
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericSong"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericAlbum"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericArtist"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericPlaylist"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericPlaylistEntry"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericTVEpisode"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericTVSeason"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericTVShow"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericMovie"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericPodcast"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericPodcastEpisode"), objc_opt_class());
  objc_msgSend(v0, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipGenericRadioStation"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mapIdentifierCreationBlock:", &__block_literal_global_14);
  objc_msgSend(v1, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertySongTitle"), &__block_literal_global_19);
  objc_msgSend(v1, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertySongHasCredits"), &__block_literal_global_26);
  objc_msgSend(v1, "mapPropertyKey:toMPContentItemSelector:", CFSTR("_MPModelPropertySongTrackCount"), sel_totalTrackCount);
  objc_msgSend(v1, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertySongTrackNumber"), sel_trackNumber);
  objc_msgSend(v1, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertySongDiscNumber"), sel_discNumber);
  objc_msgSend(v1, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertySongExplicit"));
  objc_msgSend(v1, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertySongDuration"), sel_duration);
  objc_msgSend(v1, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertySongHasVideo"), &__block_literal_global_35);
  objc_msgSend(v1, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertySongShouldShowComposer"), CFSTR("shComp"));
  objc_msgSend(v1, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertySongArtistUploadedContent"), CFSTR("arUp"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongHasCloudSyncSource"));
  objc_msgSend(v1, "mapArtworkPropertyKey:", CFSTR("MPModelPropertySongArtwork"));
  objc_msgSend(v1, "mapPropertyKey:toDeviceSpecificUserInfoKey:", CFSTR("MPModelPropertySongKeepLocalEnableState"), CFSTR("klEnable"));
  objc_msgSend(v1, "mapPropertyKey:toDeviceSpecificUserInfoKey:", CFSTR("MPModelPropertySongKeepLocalManagedStatus"), CFSTR("klStatus"));
  objc_msgSend(v1, "mapPropertyKey:toDeviceSpecificUserInfoKey:", CFSTR("MPModelPropertySongLibraryAdded"), CFSTR("libAdded"));
  objc_msgSend(v1, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertySongLibraryAddEligible"), &__block_literal_global_37);
  objc_msgSend(v1, "mapPropertyKey:toDeviceSpecificUserInfoKey:", CFSTR("MPModelPropertySongUserRating"), CFSTR("rating"));
  objc_msgSend(v1, "mapPropertyKey:toDeviceSpecificUserInfoKey:", CFSTR("MPModelPropertySongIsDisliked"), CFSTR("isDisliked"));
  objc_msgSend(v1, "mapPropertyKey:toDeviceSpecificUserInfoKey:", CFSTR("MPModelPropertySongIsFavorite"), CFSTR("isFav"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongCloudStatus"));
  objc_msgSend(v1, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertySongTraits"), sel_songTraits);
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalConstraints"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongKeepLocalManagedStatusReason"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongDateFavorited"));
  objc_msgSend(v1, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertySongSupportsExtendedLyricsAttribute"));
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipSongArtist"), objc_opt_class());
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipSongAlbum"), objc_opt_class());
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipSongComposer"), objc_opt_class());
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipSongGenre"), objc_opt_class());
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipSongLyrics"), objc_opt_class());
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipSongLocalFileAsset"), objc_opt_class());
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipSongStoreAsset"), objc_opt_class());
  objc_msgSend(v1, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipSongPlaybackPosition"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapIdentifierCreationBlock:", &__block_literal_global_47_14769);
  objc_msgSend(v2, "mapPropertyKey:toDeviceSpecificUserInfoKey:", CFSTR("MPModelPropertyFileAssetNonPurgeable"), CFSTR("nonPurge"));
  objc_msgSend(v2, "mapPropertyKey:toDeviceSpecificUserInfoKey:", CFSTR("MPModelPropertyFileAssetProtectionType"), CFSTR("procType"));

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapIdentifierCreationBlock:", &__block_literal_global_48);
  objc_msgSend(v3, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyStoreAssetRedownloadable"), CFSTR("rdwn"));
  objc_msgSend(v3, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyStoreAssetEndpointType"), &__block_literal_global_49);
  objc_msgSend(v3, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyStoreAssetSubscriptionRequired"), CFSTR("subReq"));

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapIdentifierCreationBlock:", &__block_literal_global_50);
  objc_msgSend(v4, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyLyricsHasStoreLyrics"), CFSTR("hsStLy"));
  objc_msgSend(v4, "mapPropertyKey:toDeviceSpecificUserInfoKey:", CFSTR("MPModelPropertyLyricsHasLibraryLyrics"), CFSTR("hsLibLy"));
  objc_msgSend(v4, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyLyricsHasTimeSyncedLyrics"), CFSTR("hsTSL"));
  objc_msgSend(v4, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyLyricsText"), &__block_literal_global_51);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapIdentifierCreationBlock:", &__block_literal_global_53);
  objc_msgSend(v5, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyAlbumTitle"), sel_albumName);
  objc_msgSend(v5, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyAlbumLibraryAdded"), &__block_literal_global_56);
  objc_msgSend(v5, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyAlbumLibraryAddEligible"), &__block_literal_global_57_14770);
  objc_msgSend(v5, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyAlbumTrackCount"), sel_totalTrackCount);
  objc_msgSend(v5, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyAlbumDiscCount"), sel_totalDiscCount);
  objc_msgSend(v5, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyAlbumYear"), sel_albumYear);
  objc_msgSend(v5, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyAlbumTraits"), sel_albumTraits);
  objc_msgSend(v5, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyAlbumReleaseDateComponents"), &__block_literal_global_64);
  objc_msgSend(v5, "mapArtworkPropertyKey:", CFSTR("MPModelPropertyAlbumArtwork"));
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumIsFavorite"));
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumIsDisliked"));
  objc_msgSend(v5, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyAlbumDateFavorited"));
  objc_msgSend(v5, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipAlbumGenre"), objc_opt_class());
  objc_msgSend(v5, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipAlbumArtist"), objc_opt_class());
  objc_msgSend(v5, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipAlbumRepresentativeSong"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapIdentifierCreationBlock:", &__block_literal_global_66);
  objc_msgSend(v6, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaylistName"), &__block_literal_global_67);
  objc_msgSend(v6, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaylistLibraryAdded"), &__block_literal_global_68);
  objc_msgSend(v6, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaylistType"), &__block_literal_global_69);
  objc_msgSend(v6, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPlaylistTraits"), sel_playlistTraits);
  objc_msgSend(v6, "mapArtworkPropertyKey:", CFSTR("MPModelPropertyPlaylistArtwork"));
  objc_msgSend(v6, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaylistIsCollaborative"), &__block_literal_global_74);
  objc_msgSend(v6, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaylistCollaboratorStatus"), &__block_literal_global_76_14771);
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsFavorite"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsDisliked"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistDateFavorited"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistIsFavoriteSongsPlaylist"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCoverArtworkRecipe"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationSharingMode"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationMode"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaboratorPermissions"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate"));
  objc_msgSend(v6, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyPlaylistCollaborationJoinRequestIsPending"));

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapIdentifierCreationBlock:", &__block_literal_global_77_14772);
  objc_msgSend(v7, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPersonName"), &__block_literal_global_78_14773);
  objc_msgSend(v7, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipArtistGenre"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mapIdentifierCreationBlock:", &__block_literal_global_79_14774);
  objc_msgSend(v8, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPersonName"), &__block_literal_global_80_14775);
  objc_msgSend(v8, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipArtistGenre"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapIdentifierCreationBlock:", &__block_literal_global_81_14776);
  objc_msgSend(v9, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPersonName"), sel_composerName);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapIdentifierCreationBlock:", &__block_literal_global_84);
  objc_msgSend(v10, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyGenreName"), sel_genreName);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapIdentifierCreationBlock:", &__block_literal_global_87_14777);
  objc_msgSend(v11, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipPlaylistEntrySong"), objc_opt_class());
  objc_msgSend(v11, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipPlaylistEntryTVEpisode"), objc_opt_class());
  objc_msgSend(v11, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipPlaylistEntryMovie"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mapIdentifierCreationBlock:", &__block_literal_global_88);
  objc_msgSend(v12, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyMovieTitle"), &__block_literal_global_89);
  objc_msgSend(v12, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyMovieDuration"), sel_duration);
  objc_msgSend(v12, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyMovieKeepLocalEnableState"), &__block_literal_global_90);
  objc_msgSend(v12, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatus"), &__block_literal_global_91);
  objc_msgSend(v12, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason"));
  objc_msgSend(v12, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieKeepLocalConstraints"));
  objc_msgSend(v12, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyMovieLibraryAdded"), &__block_literal_global_92);
  objc_msgSend(v12, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyMovieLibraryAddEligible"), &__block_literal_global_93);
  objc_msgSend(v12, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyMovieHasCloudSyncSource"), &__block_literal_global_94_14778);
  objc_msgSend(v12, "mapArtworkPropertyKey:", CFSTR("MPModelPropertyMovieArtwork"));
  objc_msgSend(v12, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyMovieStoreCanonicalID"));
  objc_msgSend(v12, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipMovieLocalFileAsset"), objc_opt_class());
  objc_msgSend(v12, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipMovieStoreAsset"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mapIdentifierCreationBlock:", &__block_literal_global_95_14779);
  objc_msgSend(v13, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyTVEpisodeTitle"), &__block_literal_global_96);
  objc_msgSend(v13, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyTVEpisodeNumber"), sel_episodeNumber);
  objc_msgSend(v13, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyTVEpisodeDuration"), sel_duration);
  objc_msgSend(v13, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyTVEpisodeType"), &__block_literal_global_99_14780);
  objc_msgSend(v13, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyTVEpisodeKeepLocalEnableState"), &__block_literal_global_100);
  objc_msgSend(v13, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus"), &__block_literal_global_101);
  objc_msgSend(v13, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason"));
  objc_msgSend(v13, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints"));
  objc_msgSend(v13, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyTVEpisodeLibraryAdded"), &__block_literal_global_102);
  objc_msgSend(v13, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible"), &__block_literal_global_103);
  objc_msgSend(v13, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyTVEpisodeHasCloudSyncSource"), &__block_literal_global_104);
  objc_msgSend(v13, "mapArtworkPropertyKey:", CFSTR("MPModelPropertyTVEpisodeArtwork"));
  objc_msgSend(v13, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipTVEpisodeSeason"), objc_opt_class());
  objc_msgSend(v13, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipTVEpisodeShow"), objc_opt_class());
  objc_msgSend(v13, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset"), objc_opt_class());
  objc_msgSend(v13, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipTVEpisodeStoreAsset"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mapIdentifierCreationBlock:", &__block_literal_global_105_14781);
  objc_msgSend(v14, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyTVSeasonNumber"), sel_seasonNumber);
  objc_msgSend(v14, "mapArtworkPropertyKey:", CFSTR("MPModelPropertyTVSeasonArtwork"));
  objc_msgSend(v14, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipTVSeasonShow"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mapIdentifierCreationBlock:", &__block_literal_global_108_14782);
  objc_msgSend(v15, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyTVShowTitle"), sel_trackArtistName);
  objc_msgSend(v15, "mapArtworkPropertyKey:", CFSTR("MPModelPropertyTVShowArtwork"));
  objc_msgSend(v15, "mapUnsupportedPropertyKey:", CFSTR("MPModelPropertyTVShowStoreCanonicalID"));

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mapIdentifierCreationBlock:", &__block_literal_global_111);
  objc_msgSend(v16, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyRadioStationName"), sel_radioStationName);
  objc_msgSend(v16, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyRadioStationAttributionLabel"), &__block_literal_global_115);
  objc_msgSend(v16, "mapArtworkPropertyKey:", CFSTR("MPModelPropertyRadioStationArtwork"));
  objc_msgSend(v16, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyRadioStationType"), &__block_literal_global_116);
  objc_msgSend(v16, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyRadioStationSubtype"), &__block_literal_global_117);
  objc_msgSend(v16, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyRadioStationProviderUniversalLink"), &__block_literal_global_118);
  objc_msgSend(v16, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyRadioStationProviderBundleIdentifier"), &__block_literal_global_120);
  objc_msgSend(v16, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyRadioStationProviderID"), &__block_literal_global_121);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mapIdentifierCreationBlock:", &__block_literal_global_122);
  objc_msgSend(v17, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaybackPositionShouldRememberBookmarkTime"), &__block_literal_global_123);
  objc_msgSend(v17, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaybackPositionHasBeenPlayed"), &__block_literal_global_124);
  objc_msgSend(v17, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaybackPositionStartTime"), &__block_literal_global_125);
  objc_msgSend(v17, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaybackPositionStopTime"), &__block_literal_global_127);
  objc_msgSend(v17, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier"), &__block_literal_global_129);
  objc_msgSend(v17, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPlaybackPositionUserPlayCount"), &__block_literal_global_131);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mapIdentifierCreationBlock:", &__block_literal_global_134_14783);
  objc_msgSend(v18, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPodcastTitle"), sel_albumName);
  objc_msgSend(v18, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastFeedURL"), &__block_literal_global_135);
  objc_msgSend(v18, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastShareURL"), &__block_literal_global_136);
  objc_msgSend(v18, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastSupportsSubscription"), &__block_literal_global_137);
  objc_msgSend(v18, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastSortType"), &__block_literal_global_138);
  objc_msgSend(v18, "mapArtworkPropertyKey:", CFSTR("MPModelPropertyPodcastArtwork"));
  objc_msgSend(v18, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipPodcastAuthor"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mapIdentifierCreationBlock:", &__block_literal_global_142_14784);
  objc_msgSend(v19, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPersonName"), sel_albumArtistName);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mapIdentifierCreationBlock:", &__block_literal_global_145);
  objc_msgSend(v20, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastEpisodeTitle"), &__block_literal_global_146_14785);
  objc_msgSend(v20, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPodcastEpisodeDuration"), sel_duration);
  objc_msgSend(v20, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPodcastEpisodeExplicit"), sel_isExplicitItem);
  objc_msgSend(v20, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPodcastEpisodeNumber"), sel_episodeNumber);
  objc_msgSend(v20, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPodcastEpisodeSeasonNumber"), sel_seasonNumber);
  objc_msgSend(v20, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPodcastEpisodeDescriptionText"), sel_info);
  objc_msgSend(v20, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastEpisodeTranscriptAlignments"), &__block_literal_global_149);
  objc_msgSend(v20, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastEpisodeReleaseDateComponents"), &__block_literal_global_152);
  objc_msgSend(v20, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastEpisodeHasVideo"), &__block_literal_global_153);
  objc_msgSend(v20, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastEpisodeUserRating"), &__block_literal_global_154);
  objc_msgSend(v20, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastEpisodeStreamURL"), &__block_literal_global_155);
  objc_msgSend(v20, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastEpisodeShareURL"), &__block_literal_global_156_14786);
  objc_msgSend(v20, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastEpisodeType"), &__block_literal_global_157);
  objc_msgSend(v20, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyPodcastEpisodeShowArtworkTemplateURL"), CFSTR("podArtURL"));
  objc_msgSend(v20, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyPodcastEpisodeArtworkInfo"), CFSTR("podArtInfo"));
  objc_msgSend(v20, "mapArtworkPropertyKey:", CFSTR("MPModelPropertyPodcastEpisodeArtwork"));
  objc_msgSend(v20, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyPodcastEpisodePriceType"), CFSTR("podEpPrTy"));
  objc_msgSend(v20, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyPodcastEpisodeTranscriptIdentifier"), CFSTR("podEpTrId"));
  objc_msgSend(v20, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyPodcastEpisodeTranscriptSource"), CFSTR("podEpTrSrc"));
  objc_msgSend(v20, "mapPropertyKey:toUserInfoKey:", CFSTR("MPModelPropertyPodcastEpisodeShouldShowChapterArtwork"), CFSTR("podShoChapArt"));
  objc_msgSend(v20, "mapPropertyKey:toValueTransformer:", CFSTR("MPModelPropertyPodcastEpisodeChapters"), &__block_literal_global_158);
  objc_msgSend(v20, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipPodcastEpisodeAuthor"), objc_opt_class());
  objc_msgSend(v20, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipPodcastEpisodePodcast"), objc_opt_class());
  objc_msgSend(v20, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipPodcastEpisodeLocalFileAsset"), objc_opt_class());
  objc_msgSend(v20, "mapRelationshipKey:toModelClass:", CFSTR("MPModelRelationshipPodcastEpisodePlaybackPosition"), objc_opt_class());

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mapIdentifierCreationBlock:", &__block_literal_global_164);
  objc_msgSend(v21, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPersonName"), sel_trackArtistName);

  +[MPBaseEntityTranslator createTranslatorForMPModelClass:](MPMediaRemoteEntityTranslator, "createTranslatorForMPModelClass:", objc_opt_class());
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mapIdentifierCreationBlock:", &__block_literal_global_165);
  objc_msgSend(v22, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPodcastChapterTitle"), sel_title);
  objc_msgSend(v22, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPodcastChapterDuration"), sel_duration);
  objc_msgSend(v22, "mapPropertyKey:toMPContentItemSelector:", CFSTR("MPModelPropertyPodcastChapterStartTime"), sel_startTime);

}

- (void)mapPropertyKey:(id)a3 toValueTransformer:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[_MPMediaRemoteEntityPropertyTranslator translatorWithBlock:](_MPMediaRemoteEntityPropertyTranslator, "translatorWithBlock:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v6, v7);

}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4
{
  id v6;
  _MPBaseEntityRelationshipTranslator *v7;

  v6 = a3;
  v7 = -[_MPBaseEntityRelationshipTranslator initWithRelatedMPModelClass:]([_MPBaseEntityRelationshipTranslator alloc], "initWithRelatedMPModelClass:", a4);
  -[MPBaseEntityTranslator mapRelationshipKey:ofModelClass:toRelationshipTranslator:]((uint64_t)self, v6, v7);

}

- (void)mapPropertyKey:(id)a3 toMPContentItemSelector:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  NSStringFromSelector(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaRemoteEntityTranslator _mapPropertyKey:toKeyPath:]((id *)&self->super.super.isa, v6, (uint64_t)v7);

}

- (void)_mapPropertyKey:(uint64_t)a3 toKeyPath:
{
  id v5;
  id v6;

  if (a1)
  {
    v5 = a2;
    +[_MPMediaRemoteEntityPropertyTranslator translatorWithKeyPath:](_MPMediaRemoteEntityPropertyTranslator, "translatorWithKeyPath:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:](a1, v5, v6);

  }
}

- (void)mapIdentifierCreationBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MPMediaRemoteEntityTranslator_mapIdentifierCreationBlock___block_invoke;
  v7[3] = &unk_1E3153BB8;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  +[_MPMediaRemoteEntityPropertyTranslator translatorWithBlock:](_MPMediaRemoteEntityPropertyTranslator, "translatorWithBlock:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPBaseEntityTranslator mapIdentifiersToPropertyTranslator:]((id *)&self->super.super.isa, v6);

}

+ (void)buildSchemaIfNeeded
{
  if (buildSchemaIfNeeded_onceToken != -1)
    dispatch_once(&buildSchemaIfNeeded_onceToken, &__block_literal_global_3569);
}

- (void)mapArtworkPropertyKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[_MPMediaRemoteEntityPropertyTranslator translatorWithBlock:](_MPMediaRemoteEntityPropertyTranslator, "translatorWithBlock:", &__block_literal_global_76);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v4, v5);

}

- (void)mapPropertyKey:(id)a3 toDeviceSpecificUserInfoKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(CFSTR("deviceSpecificUserInfo."), "stringByAppendingString:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaRemoteEntityTranslator _mapPropertyKey:toKeyPath:]((id *)&self->super.super.isa, v6, (uint64_t)v7);

}

- (void)mapPropertyKey:(id)a3 toUserInfoKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(CFSTR("userInfo."), "stringByAppendingString:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaRemoteEntityTranslator _mapPropertyKey:toKeyPath:]((id *)&self->super.super.isa, v6, (uint64_t)v7);

}

- (id)sectionObjectForPropertySet:(id)a3 contentItem:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  __CFString **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MPPropertySet *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MPPropertySet *v28;
  void *v29;
  id v31;
  MPMediaRemoteEntityTranslator *v32;
  id v33;
  __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v8;
  v11 = a3;
  if (self)
  {
    if (objc_msgSend(v10, "mediaType") == 2)
    {
      v12 = CFSTR("MPModelRelationshipGenericPodcast");
      v13 = CFSTR("MPModelRelationshipGenericPodcast");
    }
    else
    {
      objc_msgSend(v10, "collectionInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_MPNowPlayingCollectionInfoKeyCollectionType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("_MPNowPlayingCollectionInfoCollectionTypePlaylist")) & 1) != 0)
      {
        v16 = MPModelRelationshipGenericPlaylist;
      }
      else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("_MPNowPlayingCollectionInfoCollectionTypeAlbum")) & 1) != 0)
      {
        v16 = MPModelRelationshipGenericAlbum;
      }
      else
      {
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("_MPNowPlayingCollectionInfoCollectionTypeRadio")) & 1) == 0)
        {

          v12 = 0;
          goto LABEL_18;
        }
        v16 = MPModelRelationshipGenericRadioStation;
      }
      v12 = *v16;

      if (!v12)
      {
LABEL_18:
        v28 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    objc_msgSend(v11, "relationships");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v32 = self;
      v33 = v9;
      v31 = v11;
      objc_msgSend(v11, "relationships");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      +[MPModelGenericObject requiredStoreLibraryPersonalizationProperties](MPModelGenericObject, "requiredStoreLibraryPersonalizationProperties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = [MPPropertySet alloc];
      v34 = v12;
      objc_msgSend(v21, "relationships");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (!v24)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "propertySetByCombiningWithPropertySet:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[MPPropertySet initWithProperties:relationships:](v22, "initWithProperties:relationships:", 0, v27);

      if (!v24)
      self = v32;
      v9 = v33;
      v11 = v31;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v28 = 0;
LABEL_20:

  if (v28)
  {
    -[MPMediaRemoteEntityTranslator objectForPropertySet:contentItem:context:](self, "objectForPropertySet:contentItem:context:", v28, v10, v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)identifiersForContentItem:(id)a3
{
  return -[MPBaseEntityTranslator identifiersForSource:context:](self, (uint64_t)a3, 0);
}

@end
