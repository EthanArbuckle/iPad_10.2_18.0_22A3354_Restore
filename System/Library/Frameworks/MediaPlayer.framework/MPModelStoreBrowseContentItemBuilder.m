@implementation MPModelStoreBrowseContentItemBuilder

void __104__MPModelStoreBrowseContentItemBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(_QWORD *a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(v4, "setItemType:", a1[20]);
    v3 = *(_DWORD *)(a1[4] + 24);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "setDetailedItemType:", a1[21]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v4, "setAlbum:", a1[5]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v4, "setArtist:", a1[6]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v4, "setCurator:", a1[7]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x80) == 0)
  {
LABEL_7:
    if ((v3 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v4, "setMovie:", a1[8]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x100) == 0)
  {
LABEL_8:
    if ((v3 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v4, "setPlaylist:", a1[9]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x200) == 0)
  {
LABEL_9:
    if ((v3 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v4, "setRadioStation:", a1[10]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x800) == 0)
  {
LABEL_10:
    if ((v3 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v4, "setSong:", a1[11]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x40) == 0)
  {
LABEL_11:
    if ((v3 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v4, "setEpisode:", a1[12]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x1000) == 0)
  {
LABEL_12:
    if ((v3 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v4, "setSeason:", a1[13]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x2000) == 0)
  {
LABEL_13:
    if ((v3 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v4, "setShow:", a1[14]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x4000) == 0)
  {
LABEL_14:
    if ((v3 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v4, "setShowCreator:", a1[15]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x400) == 0)
  {
LABEL_15:
    if ((v3 & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v4, "setSocialPerson:", a1[16]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x8000) == 0)
  {
LABEL_16:
    if ((v3 & 0x10000) == 0)
      goto LABEL_17;
LABEL_35:
    objc_msgSend(v4, "setRecordLabel:", a1[18]);
    if ((*(_DWORD *)(a1[4] + 24) & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  objc_msgSend(v4, "setArtistUploadedContentType:", a1[17]);
  v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x10000) != 0)
    goto LABEL_35;
LABEL_17:
  if ((v3 & 0x20000) != 0)
LABEL_18:
    objc_msgSend(v4, "setCreditsArtist:", a1[19]);
LABEL_19:

}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  MPStoreModelAlbumBuilder *v17;
  MPStoreModelAlbumBuilder *albumBuilder;
  uint64_t v19;
  MPStoreModelArtistBuilder *v20;
  MPStoreModelArtistBuilder *artistBuilder;
  uint64_t v22;
  MPStoreModelCuratorBuilder *v23;
  MPStoreModelCuratorBuilder *curatorBuilder;
  uint64_t v25;
  MPStoreModelMovieBuilder *v26;
  MPStoreModelMovieBuilder *movieBuilder;
  uint64_t v28;
  MPStoreModelPlaylistBuilder *v29;
  MPStoreModelPlaylistBuilder *playlistBuilder;
  uint64_t v31;
  MPStoreModelRadioStationBuilder *v32;
  MPStoreModelRadioStationBuilder *radioStationBuilder;
  uint64_t v34;
  MPStoreModelSongBuilder *v35;
  MPStoreModelSongBuilder *songBuilder;
  uint64_t v37;
  MPStoreModelTVEpisodeBuilder *v38;
  MPStoreModelTVEpisodeBuilder *episodeBuilder;
  void *v40;
  MPStoreModelTVSeasonBuilder *v41;
  MPStoreModelTVSeasonBuilder *seasonBuilder;
  void *v43;
  MPStoreModelTVShowBuilder *v44;
  MPStoreModelTVShowBuilder *showBuilder;
  void *v46;
  MPStoreModelTVShowCreatorBuilder *v47;
  MPStoreModelTVShowCreatorBuilder *showCreatorBuilder;
  void *v49;
  MPStoreModelSocialPersonBuilder *v50;
  MPStoreModelSocialPersonBuilder *socialPersonBuilder;
  void *v52;
  MPStoreModelRecordLabelBuilder *v53;
  MPStoreModelRecordLabelBuilder *recordLabelBuilder;
  void *v55;
  MPStoreModelCreditsArtistBuilder *v56;
  MPStoreModelCreditsArtistBuilder *creditsArtistBuilder;
  MPModelStoreBrowseContentItem *v58;
  MPStoreModelCuratorBuilder *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  MPStoreModelSongBuilder *v75;
  uint64_t v76;
  void *v77;
  MPStoreModelAlbumBuilder *v78;
  uint64_t v79;
  MPStoreModelArtistBuilder *v80;
  uint64_t v81;
  MPStoreModelPlaylistBuilder *v82;
  uint64_t v83;
  MPStoreModelRadioStationBuilder *v84;
  uint64_t v85;
  MPStoreModelTVEpisodeBuilder *v86;
  uint64_t v87;
  MPStoreModelTVSeasonBuilder *v88;
  uint64_t v89;
  MPStoreModelTVShowBuilder *v90;
  uint64_t v91;
  MPStoreModelTVShowCreatorBuilder *v92;
  uint64_t v93;
  MPStoreModelMovieBuilder *v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  MPStoreModelRecordLabelBuilder *v104;
  uint64_t v105;
  MPStoreModelCreditsArtistBuilder *v106;
  uint64_t v107;
  uint64_t v108;
  MPStoreModelSocialPersonBuilder *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  MPModelStoreBrowseContentItem *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  uint64_t v139;
  id v140;
  void *v141;
  int64_t v142;
  id v143;
  id v144;
  id v145;
  id v146;
  _QWORD v147[5];
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  uint64_t v163;
  int64_t v164;

  v8 = a3;
  v9 = a4;
  v145 = v8;
  v146 = a5;
  v144 = v9;
  if ((*(_BYTE *)&self->_requestedBrowseContentItemProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "containsObject:", CFSTR("MPModelStoreBrowseContentItemPropertyItemType")))
      v12 = 2;
    else
      v12 = 0;
    self->_requestedBrowseContentItemProperties = ($E6E5A8CF372118A12356E3EF60BC7B79)(*(_DWORD *)&self->_requestedBrowseContentItemProperties & 0xFFFFFFFD | v12);
    if (objc_msgSend(v11, "containsObject:", CFSTR("MPModelStoreBrowseContentItemPropertyDetailedItemType")))v13 = 4;
    else
      v13 = 0;
    self->_requestedBrowseContentItemProperties = ($E6E5A8CF372118A12356E3EF60BC7B79)(*(_DWORD *)&self->_requestedBrowseContentItemProperties & 0xFFFFFFFB | v13);
    v138 = v11;
    if (objc_msgSend(v11, "containsObject:", CFSTR("MPModelStoreBrowseContentItemPropertyArtistUploadedContentType")))v14 = 0x8000;
    else
      v14 = 0;
    self->_requestedBrowseContentItemProperties = ($E6E5A8CF372118A12356E3EF60BC7B79)(*(_DWORD *)&self->_requestedBrowseContentItemProperties & 0xFFFF7FFF | v14);
    v141 = v10;
    objc_msgSend(v10, "relationships");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipAlbum"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x10u;
    v135 = (void *)v16;
    v17 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelAlbumBuilder alloc], "initWithRequestedPropertySet:", v16);
    albumBuilder = self->_albumBuilder;
    self->_albumBuilder = v17;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_albumBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipArtist"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 8u;
    v133 = (void *)v19;
    v20 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelArtistBuilder alloc], "initWithRequestedPropertySet:", v19);
    artistBuilder = self->_artistBuilder;
    self->_artistBuilder = v20;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_artistBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipCurator"));
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x20u;
    v131 = (void *)v22;
    v23 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelCuratorBuilder alloc], "initWithRequestedPropertySet:", v22);
    curatorBuilder = self->_curatorBuilder;
    self->_curatorBuilder = v23;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_curatorBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipMovie"));
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x80u;
    v129 = (void *)v25;
    v26 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelMovieBuilder alloc], "initWithRequestedPropertySet:", v25);
    movieBuilder = self->_movieBuilder;
    self->_movieBuilder = v26;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_movieBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipPlaylist"));
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x100u;
    v127 = (void *)v28;
    v29 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelPlaylistBuilder alloc], "initWithRequestedPropertySet:", v28);
    playlistBuilder = self->_playlistBuilder;
    self->_playlistBuilder = v29;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_playlistBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipRadioStation"));
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x200u;
    v125 = (void *)v31;
    v32 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelRadioStationBuilder alloc], "initWithRequestedPropertySet:", v31);
    radioStationBuilder = self->_radioStationBuilder;
    self->_radioStationBuilder = v32;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_radioStationBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipSong"));
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x800u;
    v123 = (void *)v34;
    v35 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelSongBuilder alloc], "initWithRequestedPropertySet:", v34);
    songBuilder = self->_songBuilder;
    self->_songBuilder = v35;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_songBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipTVEpisode"));
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x40u;
    v121 = (void *)v37;
    v38 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelTVEpisodeBuilder alloc], "initWithRequestedPropertySet:", v37);
    episodeBuilder = self->_episodeBuilder;
    self->_episodeBuilder = v38;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_episodeBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipTVSeason"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x1000u;
    v41 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelTVSeasonBuilder alloc], "initWithRequestedPropertySet:", v40);
    seasonBuilder = self->_seasonBuilder;
    self->_seasonBuilder = v41;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_seasonBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipTVShow"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x2000u;
    v44 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelTVShowBuilder alloc], "initWithRequestedPropertySet:", v43);
    showBuilder = self->_showBuilder;
    self->_showBuilder = v44;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_showBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipTVShowCreator"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x4000u;
    v47 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelTVShowCreatorBuilder alloc], "initWithRequestedPropertySet:", v46);
    showCreatorBuilder = self->_showCreatorBuilder;
    self->_showCreatorBuilder = v47;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_showCreatorBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipSocialPerson"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x400u;
    v50 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelSocialPersonBuilder alloc], "initWithRequestedPropertySet:", v49);
    socialPersonBuilder = self->_socialPersonBuilder;
    self->_socialPersonBuilder = v50;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_socialPersonBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipRecordLabel"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x10000u;
    v53 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelRecordLabelBuilder alloc], "initWithRequestedPropertySet:", v52);
    recordLabelBuilder = self->_recordLabelBuilder;
    self->_recordLabelBuilder = v53;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_recordLabelBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 1u;
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipCreditsArtist"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x20000u;
    v56 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelCreditsArtistBuilder alloc], "initWithRequestedPropertySet:", v55);
    creditsArtistBuilder = self->_creditsArtistBuilder;
    self->_creditsArtistBuilder = v56;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_creditsArtistBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 1u;

    v9 = v144;
    v8 = v145;
  }
  v58 = 0;
  v142 = -[MPModelStoreBrowseContentItemBuilder contentItemTypeForStoreItemMetadata:](self, "contentItemTypeForStoreItemMetadata:", v8);
  switch(v142)
  {
    case 0:
      goto LABEL_90;
    case 1:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = self->_albumBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipAlbum")))
      {
        objc_msgSend(v9, "album");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelAlbumBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v78, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v79 = objc_claimAutoreleasedReturnValue();
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 1;
        v73 = (void *)v79;
        v61 = (void *)v79;
        goto LABEL_72;
      }
      -[MPStoreModelAlbumBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v78, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      v139 = 1;
      v61 = v77;
      break;
    case 2:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = self->_artistBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipArtist")))
      {
        objc_msgSend(v9, "artist");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelArtistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v80, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v81 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 2;
        v73 = (void *)v81;
        v62 = (void *)v81;
        goto LABEL_72;
      }
      -[MPStoreModelArtistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v80, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      v139 = 2;
      v62 = v77;
      break;
    case 3:
    case 4:
    case 5:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = self->_curatorBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipCurator")))
      {
        objc_msgSend(v9, "curator");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelCuratorBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v59, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 3;
        v73 = (void *)v60;
        v74 = (void *)v60;
        goto LABEL_72;
      }
      -[MPStoreModelCuratorBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v59, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      v139 = 3;
      v74 = v77;
      break;
    case 6:
    case 10:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = self->_songBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipSong")))
      {
        objc_msgSend(v9, "song");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelSongBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v75, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v76 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 7;
        v73 = (void *)v76;
        v67 = (void *)v76;
        goto LABEL_72;
      }
      -[MPStoreModelSongBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v75, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v120 = 0;
      v122 = 0;
      v118 = 0;
      v119 = 0;
      v117 = 0;
      v124 = v77;
      v126 = 0;
      v108 = 7;
      goto LABEL_85;
    case 7:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = self->_playlistBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipPlaylist")))
      {
        objc_msgSend(v9, "playlist");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelPlaylistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v82, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v83 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 4;
        v73 = (void *)v83;
        v65 = (void *)v83;
        goto LABEL_72;
      }
      -[MPStoreModelPlaylistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v82, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      v139 = 4;
      v65 = v77;
      break;
    case 8:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = self->_radioStationBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipRadioStation")))
      {
        objc_msgSend(v9, "radioStation");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelRadioStationBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v84, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v85 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 5;
        v73 = (void *)v85;
        v66 = (void *)v85;
        goto LABEL_72;
      }
      -[MPStoreModelRadioStationBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v84, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      v139 = 5;
      v66 = v77;
      break;
    case 9:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = self->_socialPersonBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipSocialPerson")))
      {
        objc_msgSend(v9, "socialPerson");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelSocialPersonBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v109, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v110 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 6;
        v73 = (void *)v110;
        v71 = (void *)v110;
        goto LABEL_72;
      }
      -[MPStoreModelSocialPersonBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v109, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = v77;
      v126 = 0;
      v108 = 6;
      goto LABEL_85;
    case 11:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = self->_episodeBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipTVEpisode")))
      {
        objc_msgSend(v9, "episode");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelTVEpisodeBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v86, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v87 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 8;
        v73 = (void *)v87;
        v63 = (void *)v87;
        goto LABEL_72;
      }
      -[MPStoreModelTVEpisodeBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v86, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      v139 = 8;
      v63 = v77;
      break;
    case 12:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = self->_seasonBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipTVSeason")))
      {
        objc_msgSend(v9, "season");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v88, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v89 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 10;
        v73 = (void *)v89;
        v68 = (void *)v89;
        goto LABEL_72;
      }
      -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v88, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v124 = 0;
      v126 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v139 = 10;
      v122 = v77;
      break;
    case 13:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = self->_showBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipTVShow")))
      {
        objc_msgSend(v9, "show");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelTVShowBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v90, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v91 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 9;
        v73 = (void *)v91;
        v69 = (void *)v91;
        goto LABEL_72;
      }
      -[MPStoreModelTVShowBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v90, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v118 = 0;
      v119 = 0;
      v117 = 0;
      v126 = 0;
      v139 = 9;
      v120 = v77;
      break;
    case 14:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = self->_showCreatorBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipTVShowCreator")))
      {
        objc_msgSend(v9, "showCreator");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v92, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v93 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 11;
        v73 = (void *)v93;
        v70 = (void *)v93;
        goto LABEL_72;
      }
      -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v92, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = v77;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      v108 = 11;
      goto LABEL_85;
    case 15:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = self->_movieBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipMovie")))
      {
        objc_msgSend(v9, "movie");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelMovieBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v94, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v95 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        v139 = 12;
        v73 = (void *)v95;
        v64 = (void *)v95;
        goto LABEL_72;
      }
      -[MPStoreModelMovieBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v94, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      v139 = 12;
      v64 = v77;
      break;
    case 17:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = self->_recordLabelBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipRecordLabel")))
      {
        objc_msgSend(v9, "recordLabel");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelRecordLabelBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v104, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v105 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v126 = 0;
        v139 = 14;
        v73 = (void *)v105;
        v72 = (void *)v105;
        goto LABEL_72;
      }
      -[MPStoreModelRecordLabelBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v104, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = v77;
      v118 = 0;
      v126 = 0;
      v108 = 14;
LABEL_85:
      v139 = v108;
      break;
    case 18:
      objc_msgSend(v8, "artistUploadedContentType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = self->_creditsArtistBuilder;
      if (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelStoreBrowseContentItemRelationshipCreditsArtist")))
      {
        objc_msgSend(v9, "creditsArtist");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPStoreModelCreditsArtistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v106, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v107 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v139 = 15;
        v73 = (void *)v107;
        v126 = (void *)v107;
LABEL_72:
        v117 = v72;
        v118 = v71;
        v119 = v70;
        v120 = v69;
        v122 = v68;
        v124 = v67;

        v77 = v73;
      }
      else
      {
        -[MPStoreModelCreditsArtistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v106, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, 0, v146);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v122 = 0;
        v124 = 0;
        v119 = 0;
        v120 = 0;
        v117 = 0;
        v118 = 0;
        v139 = 15;
        v126 = v77;
      }
      break;
    default:
      objc_msgSend(v8, "artistUploadedContentType");
      v96 = (id)objc_claimAutoreleasedReturnValue();
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v130 = 0;
      v132 = 0;
      v134 = 0;
      v137 = 0;
      v128 = 0;
      v140 = 0;
      v143 = 0;
      v58 = 0;
      goto LABEL_89;
  }
  v111 = v61;
  objc_msgSend(v77, "identifiers");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)v112;
    v114 = [MPModelStoreBrowseContentItem alloc];
    v147[0] = MEMORY[0x1E0C809B0];
    v147[1] = 3221225472;
    v147[2] = __104__MPModelStoreBrowseContentItemBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
    v147[3] = &unk_1E3152DC0;
    v147[4] = self;
    v163 = v139;
    v164 = v142;
    v143 = v111;
    v148 = v143;
    v140 = v62;
    v149 = v140;
    v137 = v74;
    v150 = v137;
    v134 = v64;
    v151 = v134;
    v132 = v65;
    v152 = v132;
    v130 = v66;
    v153 = v130;
    v103 = v124;
    v154 = v103;
    v128 = v63;
    v155 = v128;
    v102 = v122;
    v156 = v102;
    v101 = v120;
    v157 = v101;
    v100 = v119;
    v158 = v100;
    v99 = v118;
    v159 = v99;
    v96 = v116;
    v160 = v96;
    v98 = v117;
    v161 = v98;
    v97 = v126;
    v162 = v97;
    v58 = -[MPModelObject initWithIdentifiers:block:](v114, "initWithIdentifiers:block:", v113, v147);

    v9 = v144;
  }
  else
  {
    v58 = 0;
    v9 = v144;
    v140 = v62;
    v143 = v111;
    v134 = v64;
    v137 = v74;
    v128 = v63;
    v130 = v66;
    v132 = v65;
    v102 = v122;
    v103 = v124;
    v100 = v119;
    v101 = v120;
    v99 = v118;
    v96 = v116;
    v98 = v117;
    v97 = v126;
  }
LABEL_89:

  v8 = v145;
LABEL_90:

  return v58;
}

- (int64_t)contentItemTypeForStoreItemMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "itemKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("album")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("artist")) & 1) != 0)
  {
    v6 = 20;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("creditsArtist")) & 1) != 0)
  {
    v6 = 53;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("playlist")) & 1) != 0)
  {
    v6 = 46;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("movie")) & 1) != 0)
  {
    v6 = 10;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("song")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("tvEpisode")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("tvSeason")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("uploadedAudio")) & 1) != 0)
  {
    v6 = 50;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("musicVideo")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("uploadedVideo")) & 1) != 0)
  {
    v6 = 51;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("radioStation")) & 1) != 0)
  {
    v6 = 40;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("socialProfile")) & 1) != 0)
  {
    v6 = 27;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("activity")) & 1) != 0)
  {
    v6 = 47;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("brand")) & 1) != 0)
  {
    v6 = 48;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("iTunesBrand")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("showBrand")))
  {
    objc_msgSend(v4, "iTunesBrandType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && ((objc_msgSend(v7, "isEqualToString:", CFSTR("Linear")) & 1) != 0
       || (objc_msgSend(v8, "isEqualToString:", CFSTR("Non-Linear")) & 1) != 0
       || (objc_msgSend(v8, "isEqualToString:", CFSTR("Standalone")) & 1) != 0))
    {
      v9 = 8;
    }
    else
    {
      v9 = 49;
    }
    v12 = v9;

    v6 = v12;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("recordLabel")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("record-labels")))
  {
    v6 = 52;
  }
  else
  {
    v6 = 0;
  }
  v10 = -[MPModelStoreBrowseContentItemBuilder contentItemTypeForRawResponseKindIdentifierValue:](self, "contentItemTypeForRawResponseKindIdentifierValue:", v6);

  return v10;
}

- (int64_t)contentItemTypeForRawResponseKindIdentifierValue:(int64_t)a3
{
  int64_t result;
  BOOL v5;
  int64_t v6;

  result = 0;
  switch(a3)
  {
    case '(':
      result = 8 * self->_allowsRadioStations;
      break;
    case ')':
    case '*':
    case '+':
    case ',':
    case '-':
      return result;
    case '.':
      result = 7;
      break;
    case '/':
      result = 5;
      break;
    case '0':
      result = 4;
      break;
    case '1':
      result = 3;
      break;
    case '2':
LABEL_6:
      result = 10;
      break;
    case '3':
LABEL_19:
      v5 = !self->_allowsVideoContent;
      v6 = 10;
LABEL_24:
      if (v5)
        result = 0;
      else
        result = v6;
      break;
    case '4':
      result = 17;
      break;
    case '5':
      result = 18;
      break;
    default:
      switch(a3)
      {
        case 1:
          goto LABEL_6;
        case 2:
          result = 1;
          break;
        case 3:
        case 4:
        case 9:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
          return result;
        case 5:
          if (!self->_shouldFakeEpisodes || !self->_allowsVideoContent)
            goto LABEL_19;
          result = 11;
          break;
        case 6:
          v5 = !self->_allowsVideoContent;
          v6 = 11;
          goto LABEL_24;
        case 7:
          v5 = !self->_allowsVideoContent;
          v6 = 12;
          goto LABEL_24;
        case 8:
          v5 = !self->_allowsVideoContent;
          v6 = 13;
          goto LABEL_24;
        case 10:
          v5 = !self->_allowsVideoContent;
          v6 = 15;
          goto LABEL_24;
        case 20:
          result = 2;
          break;
        default:
          if (a3 == 27)
            result = 9;
          else
            result = 0;
          break;
      }
      break;
  }
  return result;
}

- (MPModelStoreBrowseContentItemBuilder)initWithRequestedPropertySet:(id)a3
{
  MPModelStoreBrowseContentItemBuilder *v3;
  MPModelStoreBrowseContentItemBuilder *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPModelStoreBrowseContentItemBuilder;
  v3 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:](&v7, sel_initWithRequestedPropertySet_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_allowsRadioStations = 1;
    v3->_allowsVideoContent = 1;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_shouldFakeEpisodes = objc_msgSend(v5, "BOOLForKey:", CFSTR("MusicShouldFakeTVEpisodes"));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creditsArtistBuilder, 0);
  objc_storeStrong((id *)&self->_recordLabelBuilder, 0);
  objc_storeStrong((id *)&self->_showCreatorBuilder, 0);
  objc_storeStrong((id *)&self->_showBuilder, 0);
  objc_storeStrong((id *)&self->_songBuilder, 0);
  objc_storeStrong((id *)&self->_seasonBuilder, 0);
  objc_storeStrong((id *)&self->_playlistBuilder, 0);
  objc_storeStrong((id *)&self->_socialPersonBuilder, 0);
  objc_storeStrong((id *)&self->_radioStationBuilder, 0);
  objc_storeStrong((id *)&self->_movieBuilder, 0);
  objc_storeStrong((id *)&self->_episodeBuilder, 0);
  objc_storeStrong((id *)&self->_curatorBuilder, 0);
  objc_storeStrong((id *)&self->_artistBuilder, 0);
  objc_storeStrong((id *)&self->_albumBuilder, 0);
}

- (void)setPreventStoreItemMetadataCaching:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPModelStoreBrowseContentItemBuilder;
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](&v5, sel_setPreventStoreItemMetadataCaching_);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_albumBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_artistBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_curatorBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_episodeBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_movieBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_radioStationBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_socialPersonBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_playlistBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_seasonBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_songBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_showBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_showCreatorBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_recordLabelBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_creditsArtistBuilder, "setPreventStoreItemMetadataCaching:", v3);
}

- (int64_t)contentItemTypeForRawResponseKindIdentifiers:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE2F9E88))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v11 = -[MPModelStoreBrowseContentItemBuilder contentItemTypeForRawResponseKindIdentifierValue:](self, "contentItemTypeForRawResponseKindIdentifierValue:", objc_msgSend(v10, "integerValue", (_QWORD)v14));
            if (v11)
            {
              v12 = v11;
              goto LABEL_14;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_14:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)contentItemTypeForMusicAPIType:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("albums")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("artists")) & 1) != 0)
  {
    v5 = 20;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("playlists")) & 1) != 0)
  {
    v5 = 46;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("music-videos")) & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("songs")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("stations")) & 1) != 0)
  {
    v5 = 40;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("shows")) & 1) != 0)
  {
    v5 = 8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tv-episodes")) & 1) != 0)
  {
    v5 = 6;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tv-seasons")) & 1) != 0)
  {
    v5 = 7;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("record-labels")) & 1) != 0)
  {
    v5 = 52;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("credits-artist")))
  {
    v5 = 53;
  }
  else
  {
    v5 = 0;
  }
  v6 = -[MPModelStoreBrowseContentItemBuilder contentItemTypeForRawResponseKindIdentifierValue:](self, "contentItemTypeForRawResponseKindIdentifierValue:", v5);

  return v6;
}

- (BOOL)allowsRadioStations
{
  return self->_allowsRadioStations;
}

- (void)setAllowsRadioStations:(BOOL)a3
{
  self->_allowsRadioStations = a3;
}

- (BOOL)allowsVideoContent
{
  return self->_allowsVideoContent;
}

- (void)setAllowsVideoContent:(BOOL)a3
{
  self->_allowsVideoContent = a3;
}

+ (id)allSupportedProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MPPropertySet *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[14];
  _QWORD v22[14];
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v23[0] = CFSTR("MPModelStoreBrowseContentItemPropertyItemType");
  v23[1] = CFSTR("MPModelStoreBrowseContentItemPropertyDetailedItemType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("MPModelStoreBrowseContentItemRelationshipAlbum");
  +[MPStoreModelAlbumBuilder allSupportedProperties](MPStoreModelAlbumBuilder, "allSupportedProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("MPModelStoreBrowseContentItemRelationshipArtist");
  +[MPStoreModelArtistBuilder allSupportedProperties](MPStoreModelArtistBuilder, "allSupportedProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = CFSTR("MPModelStoreBrowseContentItemRelationshipCreditsArtist");
  +[MPStoreModelCreditsArtistBuilder allSupportedProperties](MPStoreModelCreditsArtistBuilder, "allSupportedProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = CFSTR("MPModelStoreBrowseContentItemRelationshipCurator");
  +[MPStoreModelCuratorBuilder allSupportedProperties](MPStoreModelCuratorBuilder, "allSupportedProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = CFSTR("MPModelStoreBrowseContentItemRelationshipMovie");
  +[MPStoreModelMovieBuilder allSupportedProperties](MPStoreModelMovieBuilder, "allSupportedProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = CFSTR("MPModelStoreBrowseContentItemRelationshipPlaylist");
  +[MPStoreModelPlaylistBuilder allSupportedProperties](MPStoreModelPlaylistBuilder, "allSupportedProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = CFSTR("MPModelStoreBrowseContentItemRelationshipRadioStation");
  +[MPStoreModelRadioStationBuilder allSupportedProperties](MPStoreModelRadioStationBuilder, "allSupportedProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = CFSTR("MPModelStoreBrowseContentItemRelationshipSong");
  +[MPStoreModelSongBuilder allSupportedProperties](MPStoreModelSongBuilder, "allSupportedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v4;
  v21[8] = CFSTR("MPModelStoreBrowseContentItemRelationshipTVEpisode");
  +[MPStoreModelTVEpisodeBuilder allSupportedProperties](MPStoreModelTVEpisodeBuilder, "allSupportedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v5;
  v21[9] = CFSTR("MPModelStoreBrowseContentItemRelationshipTVSeason");
  +[MPStoreModelObjectBuilder allSupportedProperties](MPStoreModelTVSeasonBuilder, "allSupportedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v6;
  v21[10] = CFSTR("MPModelStoreBrowseContentItemRelationshipTVShow");
  +[MPStoreModelTVShowBuilder allSupportedProperties](MPStoreModelTVShowBuilder, "allSupportedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v7;
  v21[11] = CFSTR("MPModelStoreBrowseContentItemRelationshipTVShowCreator");
  +[MPStoreModelObjectBuilder allSupportedProperties](MPStoreModelTVShowCreatorBuilder, "allSupportedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v8;
  v21[12] = CFSTR("MPModelStoreBrowseContentItemRelationshipSocialPerson");
  +[MPStoreModelSocialPersonBuilder allSupportedProperties](MPStoreModelSocialPersonBuilder, "allSupportedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v9;
  v21[13] = CFSTR("MPModelStoreBrowseContentItemRelationshipRecordLabel");
  +[MPStoreModelRecordLabelBuilder allSupportedProperties](MPStoreModelRecordLabelBuilder, "allSupportedProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, v11);

  return v12;
}

@end
