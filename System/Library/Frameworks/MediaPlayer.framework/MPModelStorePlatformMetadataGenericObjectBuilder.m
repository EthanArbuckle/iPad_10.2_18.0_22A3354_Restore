@implementation MPModelStorePlatformMetadataGenericObjectBuilder

- (MPModelStorePlatformMetadataGenericObjectBuilder)initWithRequestedProperties:(id)a3
{
  id v4;
  MPModelStorePlatformMetadataGenericObjectBuilder *v5;
  uint64_t v6;
  MPPropertySet *requestedProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelStorePlatformMetadataGenericObjectBuilder;
  v5 = -[MPModelStorePlatformMetadataGenericObjectBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestedProperties = v5->_requestedProperties;
    v5->_requestedProperties = (MPPropertySet *)v6;

  }
  return v5;
}

- (id)genericObjectForStorePlatformMetadata:(id)a3 radioStationContainsVideo:(BOOL)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  char v87;
  char v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  char v107;
  char v108;
  char v109;
  void *v110;
  MPPropertySet *v111;
  MPPropertySet *storeAssetProperties;
  void *v113;
  MPStoreModelPlaybackPositionBuilder *v114;
  MPStoreModelPlaybackPositionBuilder *playbackPositionBuilder;
  MPModelGenericObject *v116;
  void *v117;
  id v118;
  id v119;
  MPModelGenericObject *v120;
  void *v122;
  void *v123;
  id v124;
  id v125;
  BOOL v126;
  _QWORD v127[4];
  id v128;
  MPModelStorePlatformMetadataGenericObjectBuilder *v129;
  id v130;
  BOOL v131;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if ((*(_BYTE *)&self->_requestedSongProperties & 1) == 0)
  {
    v124 = v9;
    v125 = v8;
    v126 = a4;
    -[MPModelStorePlatformMetadataGenericObjectBuilder requestedProperties](self, "requestedProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "relationships");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("MPModelRelationshipGenericSong"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongTitle")))
      v15 = 2;
    else
      v15 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFFDLL | v15;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongDuration")))
      v16 = 4;
    else
      v16 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFFBLL | v16;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongTrackNumber")))
      v17 = 8;
    else
      v17 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFF7 | v17;
    v18 = objc_msgSend(v14, "containsObject:", CFSTR("_MPModelPropertySongTrackCount"));
    v19 = 16;
    if (!v18)
      v19 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFEFLL | v19;
    v20 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongDiscNumber"));
    v21 = 32;
    if (!v20)
      v21 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFDFLL | v21;
    v22 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongExplicit"));
    v23 = 128;
    if (!v22)
      v23 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFF7FLL | v23;
    v24 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongArtistUploadedContent"));
    v25 = 256;
    if (!v24)
      v25 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFEFFLL | v25;
    v26 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongHasVideo"));
    v27 = 512;
    if (!v26)
      v27 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFDFFLL | v27;
    v28 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongArtwork"));
    v29 = 1024;
    if (!v28)
      v29 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFBFFLL | v29;
    v30 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongCopyrightText"));
    v31 = 2048;
    if (!v30)
      v31 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFF7FFLL | v31;
    v32 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongLibraryAdded"));
    v33 = 0x40000;
    if (!v32)
      v33 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFBFFFFLL | v33;
    v34 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongShouldShowComposer"));
    v35 = 0x100000;
    if (!v34)
      v35 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFEFFFFFLL | v35;
    v36 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongVolumeNormalization"));
    v37 = 0x200000;
    if (!v36)
      v37 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFDFFFFFLL | v37;
    v38 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongKeepLocalEnableState"));
    v39 = 4096;
    if (!v38)
      v39 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFEFFFLL | v39;
    v40 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongKeepLocalManagedStatus"));
    v41 = 0x2000;
    if (!v40)
      v41 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFDFFFLL | v41;
    v42 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongKeepLocalManagedStatusReason"));
    v43 = 0x4000;
    if (!v42)
      v43 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFBFFFLL | v43;
    v44 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongKeepLocalConstraints"));
    v45 = 0x8000;
    if (!v44)
      v45 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFF7FFFLL | v45;
    v46 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongLibraryAddEligible"));
    v47 = 0x80000;
    if (!v46)
      v47 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFF7FFFFLL | v47;
    v48 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongGrouping"));
    v49 = 64;
    if (!v48)
      v49 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFBFLL | v49;
    v50 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongHasCloudSyncSource"));
    v51 = 0x10000;
    if (!v50)
      v51 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFFEFFFFLL | v51;
    v52 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongYear"));
    v53 = 0x400000;
    if (!v52)
      v53 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFFBFFFFFLL | v53;
    v54 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongUserRating"));
    v55 = 0x800000;
    if (!v54)
      v55 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFF7FFFFFLL | v55;
    v56 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongCloudStatus"));
    v57 = 0x1000000;
    if (!v56)
      v57 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFEFFFFFFLL | v57;
    v58 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongGaplessInfo"));
    v59 = 0x2000000;
    if (!v58)
      v59 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFDFFFFFFLL | v59;
    v60 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongVolumeAdjustment"));
    v61 = 0x4000000;
    if (!v60)
      v61 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFFBFFFFFFLL | v61;
    v62 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongTraits"));
    v63 = 0x8000000;
    if (!v62)
      v63 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFF7FFFFFFLL | v63;
    v64 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongSupportsExtendedLyricsAttribute"));
    v65 = 0x10000000;
    if (!v64)
      v65 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFEFFFFFFFLL | v65;
    v66 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongIsFavorite"));
    v67 = 0x20000000;
    if (!v66)
      v67 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFDFFFFFFFLL | v67;
    v68 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongIsDisliked"));
    v69 = 0x40000000;
    if (!v68)
      v69 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFFBFFFFFFFLL | v69;
    v70 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongDateFavorited"));
    v71 = 0x80000000;
    if (!v70)
      v71 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFF7FFFFFFFLL | v71;
    v72 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongHasCredits"));
    v73 = 0x100000000;
    if (!v72)
      v73 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFEFFFFFFFFLL | v73;
    v74 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongClassicalWork"));
    v75 = 0x200000000;
    if (!v74)
      v75 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFDFFFFFFFFLL | v75;
    v76 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongClassicalMovement"));
    v77 = 0x400000000;
    if (!v76)
      v77 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFFBFFFFFFFFLL | v77;
    v78 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongClassicalMovementCount"));
    v79 = 0x800000000;
    if (!v78)
      v79 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFF7FFFFFFFFLL | v79;
    v80 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongClassicalMovementNumber"));
    v81 = 0x1000000000;
    if (!v80)
      v81 = 0;
    *(_QWORD *)&self->_requestedSongProperties = *(_QWORD *)&self->_requestedSongProperties & 0xFFFFFFEFFFFFFFFFLL | v81;
    v123 = v13;
    objc_msgSend(v13, "relationships");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "objectForKey:", CFSTR("MPModelRelationshipSongAlbum"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v83;
    if (v83)
    {
      objc_msgSend(v83, "properties");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.album |= 1u;
      if (objc_msgSend(v85, "containsObject:", CFSTR("MPModelPropertyAlbumTitle")))
        v86 = 2;
      else
        v86 = 0;
      *(_BYTE *)&self->_requestedSongProperties.album = *(_BYTE *)&self->_requestedSongProperties.album & 0xFD | v86;
      if (objc_msgSend(v85, "containsObject:", CFSTR("MPModelPropertyAlbumReleaseDateComponents")))
        v87 = 4;
      else
        v87 = 0;
      *(_BYTE *)&self->_requestedSongProperties.album = *(_BYTE *)&self->_requestedSongProperties.album & 0xFB | v87;
      if (objc_msgSend(v85, "containsObject:", CFSTR("MPModelPropertyAlbumYear")))
        v88 = 8;
      else
        v88 = 0;
      *(_BYTE *)&self->_requestedSongProperties.album = *(_BYTE *)&self->_requestedSongProperties.album & 0xF7 | v88;
      objc_msgSend(v84, "relationships");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "objectForKey:", CFSTR("MPModelRelationshipAlbumArtist"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.album = *(_BYTE *)&self->_requestedSongProperties.album & 0xEF | (16 * (v90 != 0));

    }
    objc_msgSend(v82, "objectForKey:", CFSTR("MPModelRelationshipSongArtist"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v91;
    if (v91)
    {
      objc_msgSend(v91, "properties");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.artist |= 1u;
      if (objc_msgSend(v93, "containsObject:", CFSTR("MPModelPropertyPersonName")))
        v94 = 2;
      else
        v94 = 0;
      *(_BYTE *)&self->_requestedSongProperties.artist = *(_BYTE *)&self->_requestedSongProperties.artist & 0xFD | v94;

    }
    v122 = v92;
    objc_msgSend(v82, "objectForKey:", CFSTR("MPModelRelationshipSongComposer"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95;
    if (v95)
    {
      objc_msgSend(v95, "properties");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.composer |= 1u;
      if (objc_msgSend(v97, "containsObject:", CFSTR("MPModelPropertyPersonName")))
        v98 = 2;
      else
        v98 = 0;
      *(_BYTE *)&self->_requestedSongProperties.composer = *(_BYTE *)&self->_requestedSongProperties.composer & 0xFD | v98;

    }
    objc_msgSend(v82, "objectForKey:", CFSTR("MPModelRelationshipSongGenre"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v99;
    if (v99)
    {
      objc_msgSend(v99, "properties");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.genre |= 1u;
      if (objc_msgSend(v101, "containsObject:", CFSTR("MPModelPropertyGenreName")))
        v102 = 2;
      else
        v102 = 0;
      *(_BYTE *)&self->_requestedSongProperties.genre = *(_BYTE *)&self->_requestedSongProperties.genre & 0xFD | v102;

    }
    objc_msgSend(v82, "objectForKey:", CFSTR("MPModelRelationshipSongHomeSharingAsset"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
      *(_BYTE *)&self->_requestedSongProperties.homeSharingAsset |= 1u;
    objc_msgSend(v82, "objectForKey:", CFSTR("MPModelRelationshipSongLyrics"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v104;
    if (v104)
    {
      objc_msgSend(v104, "properties");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.lyrics |= 1u;
      if (objc_msgSend(v106, "containsObject:", CFSTR("MPModelPropertyLyricsText")))
        v107 = 2;
      else
        v107 = 0;
      *(_BYTE *)&self->_requestedSongProperties.lyrics = *(_BYTE *)&self->_requestedSongProperties.lyrics & 0xFD | v107;
      if (objc_msgSend(v106, "containsObject:", CFSTR("MPModelPropertyLyricsHasStoreLyrics")))
        v108 = 4;
      else
        v108 = 0;
      *(_BYTE *)&self->_requestedSongProperties.lyrics = *(_BYTE *)&self->_requestedSongProperties.lyrics & 0xFB | v108;
      if (objc_msgSend(v106, "containsObject:", CFSTR("MPModelPropertyLyricsHasTimeSyncedLyrics")))
        v109 = 8;
      else
        v109 = 0;
      *(_BYTE *)&self->_requestedSongProperties.lyrics = *(_BYTE *)&self->_requestedSongProperties.lyrics & 0xF7 | v109;

    }
    objc_msgSend(v82, "objectForKey:", CFSTR("MPModelRelationshipSongLocalFileAsset"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
      *(_QWORD *)&self->_requestedSongProperties |= 0x20000uLL;
    objc_msgSend(v82, "objectForKey:", CFSTR("MPModelRelationshipSongStoreAsset"));
    v111 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();
    storeAssetProperties = self->_storeAssetProperties;
    self->_storeAssetProperties = v111;

    objc_msgSend(v82, "objectForKey:", CFSTR("MPModelRelationshipSongPlaybackPosition"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      v114 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelPlaybackPositionBuilder alloc], "initWithRequestedPropertySet:", v113);
      playbackPositionBuilder = self->_playbackPositionBuilder;
      self->_playbackPositionBuilder = v114;

    }
    *(_QWORD *)&self->_requestedSongProperties |= 1uLL;

    a4 = v126;
    v10 = v124;
    v8 = v125;
  }
  v116 = [MPModelGenericObject alloc];
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = MEMORY[0x1E0C809B0];
  v127[1] = 3221225472;
  v127[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke;
  v127[3] = &unk_1E3161D20;
  v128 = v8;
  v129 = self;
  v130 = v10;
  v131 = a4;
  v118 = v10;
  v119 = v8;
  v120 = -[MPModelObject initWithIdentifiers:block:](v116, "initWithIdentifiers:block:", v117, v127);

  return v120;
}

- (MPPropertySet)requestedProperties
{
  return self->_requestedProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedProperties, 0);
  objc_storeStrong((id *)&self->_storeAssetBuilder, 0);
  objc_storeStrong((id *)&self->_storeAssetProperties, 0);
  objc_storeStrong((id *)&self->_playbackPositionBuilder, 0);
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  MPModelSong *v7;
  MPIdentifierSet *v8;
  void *v9;
  uint64_t v10;
  MPIdentifierSet *v11;
  id v12;
  MPModelSong *v13;
  int8x16_t v14;
  id v15;
  _QWORD v16[4];
  int8x16_t v17;
  id v18;
  char v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0DDBE38];
  v5 = a2;
  objc_msgSend(v3, "offerWithType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [MPModelSong alloc];
  v8 = [MPIdentifierSet alloc];
  +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_2;
  v20[3] = &unk_1E3162A70;
  v21 = *(id *)(a1 + 32);
  v22 = v6;
  v15 = v6;
  v11 = -[MPIdentifierSet initWithSource:modelKind:block:](v8, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v9, v20);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_4;
  v16[3] = &unk_1E3161CF8;
  v14 = *(int8x16_t *)(a1 + 32);
  v12 = (id)v14.i64[0];
  v17 = vextq_s8(v14, v14, 8uLL);
  v18 = *(id *)(a1 + 48);
  v19 = *(_BYTE *)(a1 + 56);
  v13 = -[MPModelObject initWithIdentifiers:block:](v7, "initWithIdentifiers:block:", v11, v16);

  objc_msgSend(v5, "setSong:", v13);
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "storeAdamID");
  objc_msgSend(*(id *)(a1 + 32), "cloudUniversalLibraryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_3;
  v8[3] = &unk_1E3161B90;
  v12 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "setUniversalStoreIdentifiersWithBlock:", v8);

}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  MPStoreModelStoreAssetBuilder *v16;
  uint64_t v17;
  void *v18;
  MPStoreItemMetadata *v19;
  void *v20;
  void *v21;
  MPStoreItemMetadata *v22;
  void *v23;
  uint64_t IsArtistUploadedContent;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  MPModelAlbum *v30;
  MPIdentifierSet *v31;
  void *v32;
  MPIdentifierSet *v33;
  MPModelAlbum *v34;
  void *v35;
  MPModelArtist *v36;
  MPIdentifierSet *v37;
  void *v38;
  MPIdentifierSet *v39;
  MPModelArtist *v40;
  void *v41;
  MPModelComposer *v42;
  void *v43;
  void *v44;
  MPModelComposer *v45;
  MPModelGenre *v46;
  void *v47;
  void *v48;
  MPModelGenre *v49;
  MPModelLyrics *v50;
  void *v51;
  void *v52;
  MPModelLyrics *v53;
  MPStoreItemMetadata *v54;
  void *v55;
  void *v56;
  MPStoreItemMetadata *v57;
  void *v58;
  void *v59;
  MPStoreItemMetadata *v60;
  void *v61;
  void *v62;
  MPStoreItemMetadata *v63;
  MPStoreItemMetadata *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  int v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, void *);
  void *v77;
  uint64_t v78;
  id v79;
  _QWORD v80[5];
  id v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[5];
  id v85;
  _QWORD v86[5];
  _QWORD v87[5];
  id v88;
  _QWORD v89[5];
  _QWORD v90[4];
  MPStoreItemMetadata *v91;
  _QWORD v92[3];

  v92[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 32);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setTitle:", v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitle:", v11);

    }
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 40), "duration");
  objc_msgSend(v3, "setDuration:");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setTrackNumber:", objc_msgSend(*(id *)(a1 + 40), "trackNumber"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
LABEL_22:
    objc_msgSend(v3, "setDiscNumber:", objc_msgSend(*(id *)(a1 + 40), "discNumber"));
    v4 = *(_QWORD *)(a1 + 32);
    if ((*(_QWORD *)(v4 + 32) & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  objc_msgSend(v3, "setTrackCount:", objc_msgSend(*(id *)(a1 + 40), "trackCount"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 32);
  if ((v5 & 0x20) != 0)
    goto LABEL_22;
LABEL_6:
  if ((v5 & 0x80) != 0)
  {
LABEL_7:
    objc_msgSend(v3, "setExplicitSong:", objc_msgSend(*(id *)(a1 + 40), "explicitRating") > 500);
    v4 = *(_QWORD *)(a1 + 32);
  }
LABEL_8:
  v6 = *(void **)(v4 + 16);
  if (!v6 && (*(_BYTE *)(v4 + 34) & 8) == 0)
  {
    v7 = 0;
    goto LABEL_34;
  }
  if (!*(_QWORD *)(v4 + 24))
  {
    if ((*(_BYTE *)(v4 + 34) & 8) != 0)
    {
      v92[0] = CFSTR("MPModelPropertyStoreAssetRedownloadable");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v13 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
      if (v13)
      {
        v14 = v13;
        if (v9)
        {
          objc_msgSend(v13, "propertySetByCombiningWithPropertySet:", v9);
          v15 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v15;
        }
        goto LABEL_29;
      }
    }
    else
    {
      v8 = v6;
      v9 = 0;
      if (v6)
      {
LABEL_28:
        v14 = v8;
LABEL_29:
        v16 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelStoreAssetBuilder alloc], "initWithRequestedPropertySet:", v14);
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 24);
        *(_QWORD *)(v17 + 24) = v16;

        goto LABEL_30;
      }
    }
    v8 = v9;
    v9 = v8;
    goto LABEL_28;
  }
LABEL_30:
  v19 = [MPStoreItemMetadata alloc];
  objc_msgSend(*(id *)(a1 + 40), "metadataDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "expirationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MPStoreItemMetadata initWithStorePlatformDictionary:expirationDate:](v19, "initWithStorePlatformDictionary:expirationDate:", v20, v21);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "modelObjectWithStoreItemMetadata:userIdentity:", v22, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    objc_msgSend(v3, "setStoreAsset:", v7);

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) & 8) != 0)
    objc_msgSend(v3, "setLibraryAddEligible:", objc_msgSend(v7, "isRedownloadable"));
LABEL_34:
  objc_msgSend(*(id *)(a1 + 40), "kind");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  IsArtistUploadedContent = MPStoreItemMetadataItemKindIsArtistUploadedContent(v23);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) & 1) != 0)
    objc_msgSend(v3, "setArtistUploadedContent:", IsArtistUploadedContent);
  if (!v23 && *(_BYTE *)(a1 + 56) || (objc_msgSend(v23, "isEqualToString:", CFSTR("musicVideo")) & 1) != 0)
    v26 = 1;
  else
    v26 = objc_msgSend(v23, "isEqualToString:", CFSTR("uploadedVideo"));
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x200) != 0)
  {
    objc_msgSend(v3, "setHasVideo:", v26);
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(_QWORD *)(v27 + 32);
    if ((v28 & 0x800) == 0)
    {
LABEL_43:
      if ((v28 & 0x40000) == 0)
        goto LABEL_44;
      goto LABEL_91;
    }
  }
  else if ((v28 & 0x800) == 0)
  {
    goto LABEL_43;
  }
  objc_msgSend(*(id *)(a1 + 40), "copyrightText", v26);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCopyrightText:", v59);

  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x40000) == 0)
  {
LABEL_44:
    if ((v28 & 0x10000) == 0)
      goto LABEL_45;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(v3, "setLibraryAdded:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x10000) == 0)
  {
LABEL_45:
    if ((v28 & 0x1000) == 0)
      goto LABEL_46;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(v3, "setHasCloudSyncSource:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x1000) == 0)
  {
LABEL_46:
    if ((v28 & 0x2000) == 0)
      goto LABEL_47;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(v3, "setKeepLocalEnableState:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x2000) == 0)
  {
LABEL_47:
    if ((v28 & 0x4000) == 0)
      goto LABEL_48;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(v3, "setKeepLocalManagedStatus:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x4000) == 0)
  {
LABEL_48:
    if ((v28 & 0x8000) == 0)
      goto LABEL_49;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(v3, "setKeepLocalManagedStatusReason:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x8000) == 0)
  {
LABEL_49:
    if ((v28 & 0x100000) == 0)
      goto LABEL_50;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(v3, "setKeepLocalConstraints:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x100000) == 0)
  {
LABEL_50:
    if ((v28 & 0x200000) == 0)
      goto LABEL_51;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v3, "setShouldShowComposer:", objc_msgSend(*(id *)(a1 + 40), "shouldShowComposer", v26));
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x200000) == 0)
  {
LABEL_51:
    if ((v28 & 0x20000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_98:
  LODWORD(v25) = 0;
  objc_msgSend(v3, "setVolumeNormalization:", v26, v25);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x20000) != 0)
  {
LABEL_52:
    objc_msgSend(v3, "setLocalFileAsset:", 0);
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(_QWORD *)(v27 + 32);
  }
LABEL_53:
  v29 = MEMORY[0x1E0C809B0];
  if ((v28 & 0x400) != 0)
  {
    v60 = [MPStoreItemMetadata alloc];
    objc_msgSend(*(id *)(a1 + 40), "metadataDictionary");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "expirationDate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[MPStoreItemMetadata initWithStorePlatformDictionary:expirationDate:](v60, "initWithStorePlatformDictionary:expirationDate:", v61, v62);

    v90[0] = v29;
    v90[1] = 3221225472;
    v90[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_5;
    v90[3] = &unk_1E3161BC8;
    v64 = v63;
    v91 = v64;
    objc_msgSend(v3, "setArtworkCatalogBlock:", v90);

    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(_QWORD *)(v27 + 32);
    if ((v28 & 0x400000) == 0)
    {
LABEL_55:
      if ((v28 & 0x800000) == 0)
        goto LABEL_56;
      goto LABEL_105;
    }
  }
  else if ((v28 & 0x400000) == 0)
  {
    goto LABEL_55;
  }
  objc_msgSend(*(id *)(a1 + 40), "releaseDate", v26);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    objc_msgSend(MEMORY[0x1E0DDC090], "storeServerCalendar");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "component:fromDate:", 4, v65);

  }
  else
  {
    v67 = 0;
  }
  objc_msgSend(v3, "setYear:", v67);

  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x800000) == 0)
  {
LABEL_56:
    if ((v28 & 0x1000000) == 0)
      goto LABEL_57;
    goto LABEL_106;
  }
LABEL_105:
  LODWORD(v25) = 0;
  objc_msgSend(v3, "setUserRating:", v26, v25);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x1000000) == 0)
  {
LABEL_57:
    if ((v28 & 0x2000000) == 0)
      goto LABEL_58;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(v3, "setCloudStatus:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x2000000) == 0)
  {
LABEL_58:
    if ((v28 & 0x4000000) == 0)
      goto LABEL_59;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(v3, "setGaplessInfo:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x4000000) == 0)
  {
LABEL_59:
    if ((v28 & 0x8000000) == 0)
      goto LABEL_60;
    goto LABEL_109;
  }
LABEL_108:
  LODWORD(v25) = 1.0;
  objc_msgSend(v3, "setVolumeAdjustment:", v26, v25);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x8000000) == 0)
  {
LABEL_60:
    if ((v28 & 0x10000000) == 0)
      goto LABEL_61;
    goto LABEL_124;
  }
LABEL_109:
  +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController", v26);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "isEnhancedAudioAvailable");

  if (v69)
  {
    objc_msgSend(*(id *)(a1 + 40), "audioTraits");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v70, "containsObject:", CFSTR("spatial")))
      v71 = 8;
    else
      v71 = 0;
    if (objc_msgSend(v70, "containsObject:", CFSTR("atmos")))
      v71 |= 0x10uLL;
    if (objc_msgSend(v70, "containsObject:", CFSTR("surround")))
      v71 |= 0x20uLL;
    if (objc_msgSend(v70, "containsObject:", CFSTR("lossless")))
      v71 |= 2uLL;
    if (objc_msgSend(v70, "containsObject:", CFSTR("hi-res-lossless")))
      v71 |= 4uLL;

  }
  else
  {
    v71 = 0;
  }
  objc_msgSend(v3, "setTraits:", v71);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x10000000) == 0)
  {
LABEL_61:
    if ((v28 & 0x40) == 0)
      goto LABEL_62;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(v3, "setSupportsExtendedLyricsAttribute:", objc_msgSend(*(id *)(a1 + 40), "supportsVocalAttenuation", v26));
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x40) == 0)
  {
LABEL_62:
    if ((v28 & 0x200000000) == 0)
      goto LABEL_63;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(v3, "setGrouping:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x200000000) == 0)
  {
LABEL_63:
    if ((v28 & 0x400000000) == 0)
      goto LABEL_64;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(*(id *)(a1 + 40), "workName", v26);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClassicalWork:", v72);

  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x400000000) == 0)
  {
LABEL_64:
    if ((v28 & 0x800000000) == 0)
      goto LABEL_65;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(*(id *)(a1 + 40), "movementName", v26);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClassicalMovement:", v73);

  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x800000000) == 0)
  {
LABEL_65:
    if ((v28 & 0x1000000000) == 0)
      goto LABEL_66;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(v3, "setClassicalMovementCount:", objc_msgSend(*(id *)(a1 + 40), "movementCount", v26));
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x1000000000) == 0)
  {
LABEL_66:
    if ((v28 & 0x20000000) == 0)
      goto LABEL_67;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(v3, "setClassicalMovementNumber:", objc_msgSend(*(id *)(a1 + 40), "movementNumber", v26));
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x20000000) == 0)
  {
LABEL_67:
    if ((v28 & 0x40000000) == 0)
      goto LABEL_68;
    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(v3, "setIsFavorite:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(v27 + 32);
  if ((v28 & 0x40000000) == 0)
  {
LABEL_68:
    if ((v28 & 0x80000000) == 0)
      goto LABEL_70;
    goto LABEL_69;
  }
LABEL_131:
  objc_msgSend(v3, "setIsDisliked:", 0);
  v27 = *(_QWORD *)(a1 + 32);
  if ((*(_QWORD *)(v27 + 32) & 0x80000000) != 0)
  {
LABEL_69:
    objc_msgSend(v3, "setDateFavorited:", 0);
    v27 = *(_QWORD *)(a1 + 32);
  }
LABEL_70:
  if ((*(_BYTE *)(v27 + 40) & 1) != 0)
  {
    v30 = (MPModelAlbum *)objc_msgSend(*(id *)(a1 + 40), "collectionStoreAdamID", v26);
    if (v30)
    {
      v31 = [MPIdentifierSet alloc];
      +[MPModelAlbumKind identityKind](MPModelAlbumKind, "identityKind");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = v29;
      v89[1] = 3221225472;
      v89[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_6;
      v89[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
      v89[4] = v30;
      v33 = -[MPIdentifierSet initWithSource:modelKind:block:](v31, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v32, v89);

      v34 = [MPModelAlbum alloc];
      v87[0] = v29;
      v87[1] = 3221225472;
      v87[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_8;
      v87[3] = &unk_1E3161C30;
      v35 = *(void **)(a1 + 40);
      v87[4] = *(_QWORD *)(a1 + 32);
      v88 = v35;
      v30 = -[MPModelObject initWithIdentifiers:block:](v34, "initWithIdentifiers:block:", v33, v87);

    }
    objc_msgSend(v3, "setAlbum:", v30);

    v27 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v27 + 44) & 1) != 0)
  {
    v36 = (MPModelArtist *)objc_msgSend(*(id *)(a1 + 40), "artistStoreAdamID", v26);
    if (v36)
    {
      v37 = [MPIdentifierSet alloc];
      +[MPModelArtistKind identityKind](MPModelArtistKind, "identityKind");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = v29;
      v86[1] = 3221225472;
      v86[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_9;
      v86[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
      v86[4] = v36;
      v39 = -[MPIdentifierSet initWithSource:modelKind:block:](v37, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v38, v86);

      v40 = [MPModelArtist alloc];
      v84[0] = v29;
      v84[1] = 3221225472;
      v84[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_11;
      v84[3] = &unk_1E3161C58;
      v41 = *(void **)(a1 + 40);
      v84[4] = *(_QWORD *)(a1 + 32);
      v85 = v41;
      v36 = -[MPModelObject initWithIdentifiers:block:](v40, "initWithIdentifiers:block:", v39, v84);

    }
    objc_msgSend(v3, "setArtist:", v36);

    v27 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v27 + 48) & 1) != 0)
  {
    v42 = [MPModelComposer alloc];
    +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v29;
    v82[1] = 3221225472;
    v82[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_12;
    v82[3] = &unk_1E3161C80;
    v44 = *(void **)(a1 + 40);
    v82[4] = *(_QWORD *)(a1 + 32);
    v83 = v44;
    v45 = -[MPModelObject initWithIdentifiers:block:](v42, "initWithIdentifiers:block:", v43, v82);

    objc_msgSend(v3, "setComposer:", v45);
    v27 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v27 + 52) & 1) != 0)
  {
    v46 = [MPModelGenre alloc];
    +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v29;
    v80[1] = 3221225472;
    v80[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_13;
    v80[3] = &unk_1E3161CA8;
    v48 = *(void **)(a1 + 40);
    v80[4] = *(_QWORD *)(a1 + 32);
    v81 = v48;
    v49 = -[MPModelObject initWithIdentifiers:block:](v46, "initWithIdentifiers:block:", v47, v80);

    objc_msgSend(v3, "setGenre:", v49);
    v27 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v27 + 56) & 1) != 0)
  {
    objc_msgSend(v3, "setHomeSharingAsset:", 0);
    v27 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v27 + 60) & 1) != 0)
  {
    v50 = [MPModelLyrics alloc];
    +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v29;
    v75 = 3221225472;
    v76 = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_14;
    v77 = &unk_1E3161CD0;
    v52 = *(void **)(a1 + 40);
    v78 = *(_QWORD *)(a1 + 32);
    v79 = v52;
    v53 = -[MPModelObject initWithIdentifiers:block:](v50, "initWithIdentifiers:block:", v51, &v74);

    objc_msgSend(v3, "setLyrics:", v53, v74, v75, v76, v77, v78);
    v27 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v27 + 8))
  {
    v54 = [MPStoreItemMetadata alloc];
    objc_msgSend(*(id *)(a1 + 40), "metadataDictionary");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "expirationDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[MPStoreItemMetadata initWithStorePlatformDictionary:expirationDate:](v54, "initWithStorePlatformDictionary:expirationDate:", v55, v56);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "modelObjectWithStoreItemMetadata:userIdentity:", v57, *(_QWORD *)(a1 + 48));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlaybackPosition:", v58);

  }
}

MPArtworkCatalog *__129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_5(uint64_t a1)
{
  void *v1;
  MPArtworkCatalog *v2;
  void *v3;
  MPArtworkCatalog *v4;

  objc_msgSend(*(id *)(a1 + 32), "artworkRequestToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = [MPArtworkCatalog alloc];
    +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MPArtworkCatalog initWithToken:dataSource:](v2, "initWithToken:dataSource:", v1, v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_7;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "collectionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v4);

    v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
LABEL_12:
      objc_msgSend(*(id *)(a1 + 40), "releaseDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0DDC090], "storeServerCalendar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "component:fromDate:", 4, v8);

      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(v11, "setYear:", v10);

      if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) & 0x10) != 0)
        goto LABEL_5;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 40), "releaseDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 1048604, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setReleaseDateComponents:", v7);

  }
  else
  {
    objc_msgSend(v11, "setReleaseDateComponents:", 0);
  }

  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40);
  if ((v3 & 8) != 0)
    goto LABEL_12;
LABEL_4:
  if ((v3 & 0x10) != 0)
LABEL_5:
    objc_msgSend(v11, "setArtist:", 0);
LABEL_6:

}

uint64_t __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_10;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) & 2) != 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = a2;
    objc_msgSend(v2, "artistName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", v4);

  }
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 2) != 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = a2;
    objc_msgSend(v2, "composerName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", v4);

  }
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) & 2) != 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = a2;
    objc_msgSend(v2, "genreNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v3, "setName:", v6);

  }
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_14(uint64_t a1, void *a2)
{
  char v3;
  id v4;

  v4 = a2;
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 60);
  if ((v3 & 2) == 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 60) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v4, "setHasStoreLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasLyrics"));
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 60) & 8) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v4, "setText:", 0);
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 60);
  if ((v3 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v3 & 8) != 0)
LABEL_4:
    objc_msgSend(v4, "setHasTimeSyncedLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasTimeSyncedLyrics"));
LABEL_5:

}

uint64_t __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAdamID:", *(_QWORD *)(a1 + 32));
}

uint64_t __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAdamID:", *(_QWORD *)(a1 + 32));
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setAdamID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "formerStoreAdamIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFormerAdamIDs:", v3);

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v4, "setSubscriptionAdamID:", *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 48), "length"))
    objc_msgSend(v4, "setUniversalCloudLibraryID:", *(_QWORD *)(a1 + 48));

}

@end
