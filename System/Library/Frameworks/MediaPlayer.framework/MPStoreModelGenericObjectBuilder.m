@implementation MPStoreModelGenericObjectBuilder

- (void)setPreventStoreItemMetadataCaching:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPStoreModelGenericObjectBuilder;
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](&v5, sel_setPreventStoreItemMetadataCaching_);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_albumBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_artistBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_movieBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_playlistBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_songBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_tvEpisodeBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_tvSeasonBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_tvShowBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_recordLabelBuilder, "setPreventStoreItemMetadataCaching:", v3);
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_radioStationBuilder, "setPreventStoreItemMetadataCaching:", v3);
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  char IsArtistUploadedContent;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  MPStoreModelSongBuilder *v27;
  MPStoreModelSongBuilder *songBuilder;
  MPModelTVEpisode *v29;
  void *v30;
  uint64_t v31;
  MPModelSong *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  MPModelSong *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  MPModelGenericObject *v45;
  void *v46;
  id *v47;
  id v48;
  _QWORD *v49;
  MPModelGenericObject *v50;
  MPModelGenericObject *v51;
  MPModelGenericObject *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  MPStoreModelTVEpisodeBuilder *v61;
  MPStoreModelTVEpisodeBuilder *tvEpisodeBuilder;
  void *v63;
  uint64_t v64;
  MPModelTVEpisode *v65;
  void *v66;
  MPModelTVEpisode *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  MPStoreModelMovieBuilder *v79;
  MPStoreModelMovieBuilder *movieBuilder;
  void *v81;
  uint64_t v82;
  MPModelMovie *v83;
  void *v84;
  MPModelMovie *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  MPStoreModelAlbumBuilder *v98;
  MPStoreModelAlbumBuilder *albumBuilder;
  MPModelAlbum *v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  MPStoreModelPlaylistBuilder *v110;
  MPStoreModelPlaylistBuilder *playlistBuilder;
  MPModelPlaylist *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  MPStoreModelArtistBuilder *v122;
  MPStoreModelArtistBuilder *artistBuilder;
  MPModelArtist *v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  MPStoreModelRecordLabelBuilder *v134;
  MPStoreModelRecordLabelBuilder *recordLabelBuilder;
  MPModelRecordLabel *v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  MPStoreModelTVShowBuilder *v146;
  MPStoreModelTVShowBuilder *tvShowBuilder;
  MPModelTVShow *v148;
  void *v149;
  void *v150;
  int v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  MPStoreModelTVSeasonBuilder *v158;
  MPStoreModelTVSeasonBuilder *tvSeasonBuilder;
  MPModelTVSeason *v160;
  void *v161;
  void *v162;
  MPStoreModelRecordLabelBuilder *v163;
  MPStoreModelRecordLabelBuilder *v164;
  MPModelRecordLabel *v165;
  void *v166;
  void *v167;
  int v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  MPStoreModelRadioStationBuilder *v175;
  MPStoreModelRadioStationBuilder *radioStationBuilder;
  MPModelRadioStation *v177;
  void *v178;
  void *v179;
  _QWORD v180[4];
  id v181;
  _QWORD v182[4];
  id v183;
  _QWORD v184[4];
  id v185;
  _QWORD v186[4];
  id v187;
  _QWORD v188[4];
  id v189;
  _QWORD v190[4];
  id v191;
  _QWORD v192[4];
  id v193;
  _QWORD v194[4];
  id v195;
  _QWORD v196[4];
  void *v197;
  _QWORD v198[4];
  void *v199;
  _QWORD v200[4];
  void *v201;
  _QWORD v202[4];
  void *v203;
  _QWORD v204[4];
  void *v205;
  _QWORD v206[4];
  void *v207;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "itemKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("musicVideo"));
  v13 = objc_msgSend(v11, "isEqualToString:", CFSTR("tvEpisode"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("MusicShouldFakeTVEpisodes"));

  objc_msgSend(v9, "identifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "modelKind");
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  IsArtistUploadedContent = MPStoreItemMetadataItemKindIsArtistUploadedContent(v11);
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("song")) & 1) == 0)
  {
    v18 = v15 & v12;
    if ((v12 & ~(v15 & v12) & 1) == 0
      && (IsArtistUploadedContent & 1) == 0
      && objc_msgSend(v9, "type") != 1
      && objc_msgSend(v9, "type") != 5)
    {
      +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v179, "isEqual:", v19);

      if (!v20)
      {
        if (((v18 | v13) & 1) != 0
          || objc_msgSend(v9, "type") == 6
          || (+[MPModelTVEpisodeKind identityKind](MPModelTVEpisodeKind, "identityKind"),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              v35 = objc_msgSend(v179, "isEqual:", v34),
              v34,
              v35))
        {
          if (!self->_tvEpisodeBuilder)
          {
            -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "relationships");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKey:", CFSTR("MPModelRelationshipGenericTVEpisode"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            if (v38)
            {
              v40 = v38;
            }
            else
            {
              +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
              v40 = (id)objc_claimAutoreleasedReturnValue();
            }
            v60 = v40;

            v61 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelTVEpisodeBuilder alloc], "initWithRequestedPropertySet:", v60);
            tvEpisodeBuilder = self->_tvEpisodeBuilder;
            self->_tvEpisodeBuilder = v61;

            -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_tvEpisodeBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
          }
          if (v9)
          {
            if (objc_msgSend(v9, "type") == 6)
            {
              objc_msgSend(v9, "tvEpisode");
              v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
LABEL_59:
              -[MPStoreModelTVEpisodeBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_tvEpisodeBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
              v68 = objc_claimAutoreleasedReturnValue();
              if (!v68)
                goto LABEL_86;
              v69 = (void *)v68;
              if (self->_shouldUsePlaylistEntry)
              {
                -[MPStoreModelGenericObjectBuilder _modelObjectWithUniqueContainerIDForModelObject:](self, "_modelObjectWithUniqueContainerIDForModelObject:", v68);
                v70 = (void *)objc_claimAutoreleasedReturnValue();

                v45 = [MPModelGenericObject alloc];
                +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v202[0] = MEMORY[0x1E0C809B0];
                v202[1] = 3221225472;
                v202[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
                v202[3] = &unk_1E315CC98;
                v47 = &v203;
                v203 = v70;
                v48 = v70;
                v49 = v202;
                goto LABEL_34;
              }
              v51 = [MPModelGenericObject alloc];
              +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v200[0] = MEMORY[0x1E0C809B0];
              v200[1] = 3221225472;
              v200[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
              v200[3] = &unk_1E315CC98;
              v47 = &v201;
              v201 = v69;
              v48 = v69;
              v49 = v200;
LABEL_36:
              v50 = v51;
              goto LABEL_37;
            }
            if (objc_msgSend(v9, "type") == 5)
            {
              objc_msgSend(v9, "playlistEntry");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v63, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipPlaylistEntryTVEpisode")))
              {
                v65 = [MPModelTVEpisode alloc];
                objc_msgSend(v63, "identifiers");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = -[MPModelObject initWithIdentifiers:block:](v65, "initWithIdentifiers:block:", v66, &__block_literal_global_15_26300);

LABEL_58:
                goto LABEL_59;
              }
              objc_msgSend(v63, "tvEpisode");
              v64 = objc_claimAutoreleasedReturnValue();
LABEL_57:
              v29 = (MPModelTVEpisode *)v64;
              goto LABEL_58;
            }
            if (!objc_msgSend(v9, "type"))
            {
              v67 = [MPModelTVEpisode alloc];
              objc_msgSend(v9, "identifiers");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = -[MPModelObject initWithIdentifiers:block:](v67, "initWithIdentifiers:block:", v63, &__block_literal_global_16_26301);
              goto LABEL_57;
            }
          }
          v29 = 0;
          goto LABEL_59;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("movie")) & 1) != 0
          || objc_msgSend(v9, "type") == 9
          || (+[MPModelMovieKind identityKind](MPModelMovieKind, "identityKind"),
              v53 = (void *)objc_claimAutoreleasedReturnValue(),
              v54 = objc_msgSend(v179, "isEqual:", v53),
              v53,
              v54))
        {
          if (!self->_movieBuilder)
          {
            -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "relationships");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKey:", CFSTR("MPModelRelationshipGenericMovie"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v57;
            if (v57)
            {
              v59 = v57;
            }
            else
            {
              +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
              v59 = (id)objc_claimAutoreleasedReturnValue();
            }
            v78 = v59;

            v79 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelMovieBuilder alloc], "initWithRequestedPropertySet:", v78);
            movieBuilder = self->_movieBuilder;
            self->_movieBuilder = v79;

            -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_movieBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
          }
          if (v9)
          {
            if (objc_msgSend(v9, "type") == 9)
            {
              objc_msgSend(v9, "movie");
              v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
LABEL_83:
              -[MPStoreModelMovieBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_movieBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
              v86 = objc_claimAutoreleasedReturnValue();
              if (!v86)
                goto LABEL_86;
              v87 = (void *)v86;
              if (self->_shouldUsePlaylistEntry)
              {
                -[MPStoreModelGenericObjectBuilder _modelObjectWithUniqueContainerIDForModelObject:](self, "_modelObjectWithUniqueContainerIDForModelObject:", v86);
                v88 = (void *)objc_claimAutoreleasedReturnValue();

                v45 = [MPModelGenericObject alloc];
                +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v198[0] = MEMORY[0x1E0C809B0];
                v198[1] = 3221225472;
                v198[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13;
                v198[3] = &unk_1E315CC98;
                v47 = &v199;
                v199 = v88;
                v48 = v88;
                v49 = v198;
                goto LABEL_34;
              }
              v51 = [MPModelGenericObject alloc];
              +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v196[0] = MEMORY[0x1E0C809B0];
              v196[1] = 3221225472;
              v196[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_15;
              v196[3] = &unk_1E315CC98;
              v47 = &v197;
              v197 = v87;
              v48 = v87;
              v49 = v196;
              goto LABEL_36;
            }
            if (objc_msgSend(v9, "type") == 5)
            {
              objc_msgSend(v9, "playlistEntry");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v81, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipPlaylistEntryMovie")))
              {
                v83 = [MPModelMovie alloc];
                objc_msgSend(v81, "identifiers");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = -[MPModelObject initWithIdentifiers:block:](v83, "initWithIdentifiers:block:", v84, &__block_literal_global_20_26304);

LABEL_82:
                goto LABEL_83;
              }
              objc_msgSend(v81, "movie");
              v82 = objc_claimAutoreleasedReturnValue();
LABEL_81:
              v29 = (MPModelTVEpisode *)v82;
              goto LABEL_82;
            }
            if (!objc_msgSend(v9, "type"))
            {
              v85 = [MPModelMovie alloc];
              objc_msgSend(v9, "identifiers");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = -[MPModelObject initWithIdentifiers:block:](v85, "initWithIdentifiers:block:", v81, &__block_literal_global_21);
              goto LABEL_81;
            }
          }
          v29 = 0;
          goto LABEL_83;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("album")) & 1) != 0
          || objc_msgSend(v9, "type") == 2
          || (+[MPModelAlbumKind identityKind](MPModelAlbumKind, "identityKind"),
              v71 = (void *)objc_claimAutoreleasedReturnValue(),
              v72 = objc_msgSend(v179, "isEqual:", v71),
              v71,
              v72))
        {
          if (!self->_albumBuilder)
          {
            -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "relationships");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "objectForKey:", CFSTR("MPModelRelationshipGenericAlbum"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = v75;
            if (v75)
            {
              v77 = v75;
            }
            else
            {
              +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
              v77 = (id)objc_claimAutoreleasedReturnValue();
            }
            v97 = v77;

            v98 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelAlbumBuilder alloc], "initWithRequestedPropertySet:", v97);
            albumBuilder = self->_albumBuilder;
            self->_albumBuilder = v98;

            -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_albumBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
          }
          if (!v9)
            goto LABEL_102;
          if (objc_msgSend(v9, "type") == 2)
          {
            objc_msgSend(v9, "album");
            v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
            goto LABEL_103;
          }
          if (!objc_msgSend(v9, "type"))
          {
            v100 = [MPModelAlbum alloc];
            objc_msgSend(v9, "identifiers");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[MPModelObject initWithIdentifiers:block:](v100, "initWithIdentifiers:block:", v101, &__block_literal_global_25);

          }
          else
          {
LABEL_102:
            v29 = 0;
          }
LABEL_103:
          -[MPStoreModelAlbumBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_albumBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
          v48 = (id)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v51 = [MPModelGenericObject alloc];
            +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v194[0] = MEMORY[0x1E0C809B0];
            v194[1] = 3221225472;
            v194[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_17;
            v194[3] = &unk_1E315CC98;
            v47 = &v195;
            v48 = v48;
            v195 = v48;
            v49 = v194;
            goto LABEL_36;
          }
LABEL_213:
          v52 = 0;
          goto LABEL_38;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("playlist")) & 1) != 0
          || objc_msgSend(v9, "type") == 4
          || (+[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind"),
              v90 = (void *)objc_claimAutoreleasedReturnValue(),
              v91 = objc_msgSend(v179, "isEqual:", v90),
              v90,
              v91))
        {
          if (!self->_playlistBuilder)
          {
            -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "relationships");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "objectForKey:", CFSTR("MPModelRelationshipGenericPlaylist"));
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v94;
            if (v94)
            {
              v96 = v94;
            }
            else
            {
              +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
              v96 = (id)objc_claimAutoreleasedReturnValue();
            }
            v109 = v96;

            v110 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelPlaylistBuilder alloc], "initWithRequestedPropertySet:", v109);
            playlistBuilder = self->_playlistBuilder;
            self->_playlistBuilder = v110;

            -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_playlistBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
          }
          if (!v9)
            goto LABEL_118;
          if (objc_msgSend(v9, "type") == 4)
          {
            objc_msgSend(v9, "playlist");
            v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
            goto LABEL_119;
          }
          if (!objc_msgSend(v9, "type"))
          {
            v112 = [MPModelPlaylist alloc];
            objc_msgSend(v9, "identifiers");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[MPModelObject initWithIdentifiers:block:](v112, "initWithIdentifiers:block:", v113, &__block_literal_global_29_26311);

          }
          else
          {
LABEL_118:
            v29 = 0;
          }
LABEL_119:
          -[MPStoreModelPlaylistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_playlistBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
          v48 = (id)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v51 = [MPModelGenericObject alloc];
            +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v192[0] = MEMORY[0x1E0C809B0];
            v192[1] = 3221225472;
            v192[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_19;
            v192[3] = &unk_1E315CC98;
            v47 = &v193;
            v48 = v48;
            v193 = v48;
            v49 = v192;
            goto LABEL_36;
          }
          goto LABEL_213;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("artist")) & 1) != 0
          || objc_msgSend(v9, "type") == 3
          || (+[MPModelArtistKind identityKind](MPModelArtistKind, "identityKind"),
              v102 = (void *)objc_claimAutoreleasedReturnValue(),
              v103 = objc_msgSend(v179, "isEqual:", v102),
              v102,
              v103))
        {
          if (!self->_artistBuilder)
          {
            -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "relationships");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "objectForKey:", CFSTR("MPModelRelationshipGenericArtist"));
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = v106;
            if (v106)
            {
              v108 = v106;
            }
            else
            {
              +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
              v108 = (id)objc_claimAutoreleasedReturnValue();
            }
            v121 = v108;

            v122 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelArtistBuilder alloc], "initWithRequestedPropertySet:", v121);
            artistBuilder = self->_artistBuilder;
            self->_artistBuilder = v122;

            -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_artistBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
          }
          if (!v9)
            goto LABEL_134;
          if (objc_msgSend(v9, "type") == 3)
          {
            objc_msgSend(v9, "artist");
            v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
            goto LABEL_135;
          }
          if (!objc_msgSend(v9, "type"))
          {
            v124 = [MPModelArtist alloc];
            objc_msgSend(v9, "identifiers");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[MPModelObject initWithIdentifiers:block:](v124, "initWithIdentifiers:block:", v125, &__block_literal_global_33);

          }
          else
          {
LABEL_134:
            v29 = 0;
          }
LABEL_135:
          -[MPStoreModelArtistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_artistBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
          v48 = (id)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v51 = [MPModelGenericObject alloc];
            +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v190[0] = MEMORY[0x1E0C809B0];
            v190[1] = 3221225472;
            v190[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_21;
            v190[3] = &unk_1E315CC98;
            v47 = &v191;
            v48 = v48;
            v191 = v48;
            v49 = v190;
            goto LABEL_36;
          }
          goto LABEL_213;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("creditsArtist")) & 1) != 0
          || objc_msgSend(v9, "type") == 19
          || (+[MPModelRecordLabelKind identityKind](MPModelRecordLabelKind, "identityKind"),
              v114 = (void *)objc_claimAutoreleasedReturnValue(),
              v115 = objc_msgSend(v179, "isEqual:", v114),
              v114,
              v115))
        {
          if (!self->_recordLabelBuilder)
          {
            -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "relationships");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "objectForKey:", CFSTR("MPModelRelationshipGenericRecordLabel"));
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = v118;
            if (v118)
            {
              v120 = v118;
            }
            else
            {
              +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
              v120 = (id)objc_claimAutoreleasedReturnValue();
            }
            v133 = v120;

            v134 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelRecordLabelBuilder alloc], "initWithRequestedPropertySet:", v133);
            recordLabelBuilder = self->_recordLabelBuilder;
            self->_recordLabelBuilder = v134;

            -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_recordLabelBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
          }
          if (!v179)
            goto LABEL_150;
          if (objc_msgSend(v9, "type") == 19)
          {
            objc_msgSend(v9, "recordLabel");
            v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
            goto LABEL_151;
          }
          if (!objc_msgSend(v9, "type"))
          {
            v136 = [MPModelRecordLabel alloc];
            objc_msgSend(v9, "identifiers");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[MPModelObject initWithIdentifiers:block:](v136, "initWithIdentifiers:block:", v137, &__block_literal_global_37_26318);

          }
          else
          {
LABEL_150:
            v29 = 0;
          }
LABEL_151:
          -[MPStoreModelRecordLabelBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_recordLabelBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
          v48 = (id)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v51 = [MPModelGenericObject alloc];
            +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v188[0] = MEMORY[0x1E0C809B0];
            v188[1] = 3221225472;
            v188[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_23;
            v188[3] = &unk_1E315CC98;
            v47 = &v189;
            v48 = v48;
            v189 = v48;
            v49 = v188;
            goto LABEL_36;
          }
          goto LABEL_213;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("tvShow")) & 1) != 0
          || objc_msgSend(v9, "type") == 8
          || (+[MPModelTVShowKind identityKind](MPModelTVShowKind, "identityKind"),
              v126 = (void *)objc_claimAutoreleasedReturnValue(),
              v127 = objc_msgSend(v179, "isEqual:", v126),
              v126,
              v127))
        {
          if (!self->_tvShowBuilder)
          {
            -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "relationships");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "objectForKey:", CFSTR("MPModelRelationshipGenericTVShow"));
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = v130;
            if (v130)
            {
              v132 = v130;
            }
            else
            {
              +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
              v132 = (id)objc_claimAutoreleasedReturnValue();
            }
            v145 = v132;

            v146 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelTVShowBuilder alloc], "initWithRequestedPropertySet:", v145);
            tvShowBuilder = self->_tvShowBuilder;
            self->_tvShowBuilder = v146;

            -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_tvShowBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
          }
          if (!v9)
            goto LABEL_166;
          if (objc_msgSend(v9, "type") == 8)
          {
            objc_msgSend(v9, "show");
            v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
            goto LABEL_167;
          }
          if (!objc_msgSend(v9, "type"))
          {
            v148 = [MPModelTVShow alloc];
            objc_msgSend(v9, "identifiers");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[MPModelObject initWithIdentifiers:block:](v148, "initWithIdentifiers:block:", v149, &__block_literal_global_41);

          }
          else
          {
LABEL_166:
            v29 = 0;
          }
LABEL_167:
          -[MPStoreModelTVShowBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_tvShowBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
          v48 = (id)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v51 = [MPModelGenericObject alloc];
            +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v186[0] = MEMORY[0x1E0C809B0];
            v186[1] = 3221225472;
            v186[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_25;
            v186[3] = &unk_1E315CC98;
            v47 = &v187;
            v48 = v48;
            v187 = v48;
            v49 = v186;
            goto LABEL_36;
          }
          goto LABEL_213;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("tvSeason")) & 1) != 0
          || objc_msgSend(v9, "type") == 7
          || (+[MPModelTVSeasonKind identityKind](MPModelTVSeasonKind, "identityKind"),
              v138 = (void *)objc_claimAutoreleasedReturnValue(),
              v139 = objc_msgSend(v179, "isEqual:", v138),
              v138,
              v139))
        {
          if (!self->_tvSeasonBuilder)
          {
            -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "relationships");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "objectForKey:", CFSTR("MPModelRelationshipGenericTVSeason"));
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            v143 = v142;
            if (v142)
            {
              v144 = v142;
            }
            else
            {
              +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
              v144 = (id)objc_claimAutoreleasedReturnValue();
            }
            v157 = v144;

            v158 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelTVSeasonBuilder alloc], "initWithRequestedPropertySet:", v157);
            tvSeasonBuilder = self->_tvSeasonBuilder;
            self->_tvSeasonBuilder = v158;

            -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_tvSeasonBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
          }
          if (!v9)
            goto LABEL_183;
          if (objc_msgSend(v9, "type") == 7)
          {
            objc_msgSend(v9, "season");
            v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
            goto LABEL_184;
          }
          if (!objc_msgSend(v9, "type"))
          {
            v160 = [MPModelTVSeason alloc];
            objc_msgSend(v9, "identifiers");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[MPModelObject initWithIdentifiers:block:](v160, "initWithIdentifiers:block:", v161, &__block_literal_global_45);

          }
          else
          {
LABEL_183:
            v29 = 0;
          }
LABEL_184:
          -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_tvSeasonBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
          v48 = (id)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v51 = [MPModelGenericObject alloc];
            +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v184[0] = MEMORY[0x1E0C809B0];
            v184[1] = 3221225472;
            v184[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_27;
            v184[3] = &unk_1E315CC98;
            v47 = &v185;
            v48 = v48;
            v185 = v48;
            v49 = v184;
            goto LABEL_36;
          }
          goto LABEL_213;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("recordLabel")) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("record-labels")) & 1) != 0
          || objc_msgSend(v9, "type") == 19
          || (+[MPModelRecordLabelKind identityKind](MPModelRecordLabelKind, "identityKind"),
              v150 = (void *)objc_claimAutoreleasedReturnValue(),
              v151 = objc_msgSend(v179, "isEqual:", v150),
              v150,
              v151))
        {
          if (!self->_recordLabelBuilder)
          {
            -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "relationships");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "objectForKey:", CFSTR("MPModelRelationshipGenericRecordLabel"));
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            v155 = v154;
            if (v154)
            {
              v156 = v154;
            }
            else
            {
              +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
              v156 = (id)objc_claimAutoreleasedReturnValue();
            }
            v162 = v156;

            v163 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelRecordLabelBuilder alloc], "initWithRequestedPropertySet:", v162);
            v164 = self->_recordLabelBuilder;
            self->_recordLabelBuilder = v163;

            -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_recordLabelBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
          }
          if (!v179)
            goto LABEL_193;
          if (objc_msgSend(v9, "type") == 19)
          {
            objc_msgSend(v9, "recordLabel");
            v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
            goto LABEL_194;
          }
          if (!objc_msgSend(v9, "type"))
          {
            v165 = [MPModelRecordLabel alloc];
            objc_msgSend(v9, "identifiers");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[MPModelObject initWithIdentifiers:block:](v165, "initWithIdentifiers:block:", v166, &__block_literal_global_46);

          }
          else
          {
LABEL_193:
            v29 = 0;
          }
LABEL_194:
          -[MPStoreModelRecordLabelBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_recordLabelBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
          v48 = (id)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v51 = [MPModelGenericObject alloc];
            +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v182[0] = MEMORY[0x1E0C809B0];
            v182[1] = 3221225472;
            v182[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_29;
            v182[3] = &unk_1E315CC98;
            v47 = &v183;
            v48 = v48;
            v183 = v48;
            v49 = v182;
            goto LABEL_36;
          }
          goto LABEL_213;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("radioStation")) & 1) == 0 && objc_msgSend(v9, "type") != 13)
        {
          +[MPModelRadioStationKind identityKind](MPModelRadioStationKind, "identityKind");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = objc_msgSend(v179, "isEqual:", v167);

          if (!v168)
          {
            v52 = 0;
            goto LABEL_88;
          }
        }
        if (!self->_radioStationBuilder)
        {
          -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "relationships");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v170, "objectForKey:", CFSTR("MPModelRelationshipGenericRadioStation"));
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          v172 = v171;
          if (v171)
          {
            v173 = v171;
          }
          else
          {
            +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
            v173 = (id)objc_claimAutoreleasedReturnValue();
          }
          v174 = v173;

          v175 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelRadioStationBuilder alloc], "initWithRequestedPropertySet:", v174);
          radioStationBuilder = self->_radioStationBuilder;
          self->_radioStationBuilder = v175;

          -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_radioStationBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
        }
        if (!v179)
          goto LABEL_210;
        if (objc_msgSend(v9, "type") == 13)
        {
          objc_msgSend(v9, "radioStation");
          v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
          goto LABEL_211;
        }
        if (!objc_msgSend(v9, "type"))
        {
          v177 = [MPModelRadioStation alloc];
          objc_msgSend(v9, "identifiers");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[MPModelObject initWithIdentifiers:block:](v177, "initWithIdentifiers:block:", v178, &__block_literal_global_50_26328);

        }
        else
        {
LABEL_210:
          v29 = 0;
        }
LABEL_211:
        -[MPStoreModelRadioStationBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_radioStationBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
        v48 = (id)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          v51 = [MPModelGenericObject alloc];
          +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v180[0] = MEMORY[0x1E0C809B0];
          v180[1] = 3221225472;
          v180[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_31;
          v180[3] = &unk_1E315CC98;
          v47 = &v181;
          v48 = v48;
          v181 = v48;
          v49 = v180;
          goto LABEL_36;
        }
        goto LABEL_213;
      }
    }
  }
  if (self->_songBuilder)
  {
    if (!v9)
      goto LABEL_20;
  }
  else
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "relationships");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("MPModelRelationshipGenericSong"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;

    v27 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelSongBuilder alloc], "initWithRequestedPropertySet:", v26);
    songBuilder = self->_songBuilder;
    self->_songBuilder = v27;

    -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](self->_songBuilder, "setPreventStoreItemMetadataCaching:", -[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"));
    if (!v9)
      goto LABEL_20;
  }
  if (objc_msgSend(v9, "type", v179) == 1)
  {
    objc_msgSend(v9, "song");
    v29 = (MPModelTVEpisode *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v9, "type") != 5)
  {
    if (objc_msgSend(v9, "type"))
    {
LABEL_20:
      v29 = 0;
      goto LABEL_31;
    }
    v41 = [MPModelSong alloc];
    objc_msgSend(v9, "identifiers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[MPModelObject initWithIdentifiers:block:](v41, "initWithIdentifiers:block:", v30, &__block_literal_global_6);
    goto LABEL_29;
  }
  objc_msgSend(v9, "playlistEntry");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipPlaylistEntrySong")))
  {
    objc_msgSend(v30, "song");
    v31 = objc_claimAutoreleasedReturnValue();
LABEL_29:
    v29 = (MPModelTVEpisode *)v31;
    goto LABEL_30;
  }
  v32 = [MPModelSong alloc];
  objc_msgSend(v30, "identifiers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[MPModelObject initWithIdentifiers:block:](v32, "initWithIdentifiers:block:", v33, &__block_literal_global_26295);

LABEL_30:
LABEL_31:
  -[MPStoreModelSongBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_songBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
  v42 = objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
LABEL_86:
    v52 = 0;
    goto LABEL_87;
  }
  v43 = (void *)v42;
  if (!self->_shouldUsePlaylistEntry)
  {
    v51 = [MPModelGenericObject alloc];
    +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v204[0] = MEMORY[0x1E0C809B0];
    v204[1] = 3221225472;
    v204[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v204[3] = &unk_1E315CC98;
    v47 = &v205;
    v205 = v43;
    v48 = v43;
    v49 = v204;
    goto LABEL_36;
  }
  -[MPStoreModelGenericObjectBuilder _modelObjectWithUniqueContainerIDForModelObject:](self, "_modelObjectWithUniqueContainerIDForModelObject:", v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = [MPModelGenericObject alloc];
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v206[0] = MEMORY[0x1E0C809B0];
  v206[1] = 3221225472;
  v206[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
  v206[3] = &unk_1E315CC98;
  v47 = &v207;
  v207 = v44;
  v48 = v44;
  v49 = v206;
LABEL_34:
  v50 = v45;
LABEL_37:
  v52 = -[MPModelObject initWithIdentifiers:block:](v50, "initWithIdentifiers:block:", v46, v49);

LABEL_38:
LABEL_87:

LABEL_88:
  return v52;
}

- (id)_modelObjectWithUniqueContainerIDForModelObject:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  _QWORD v28[3];
  char v29;

  v4 = a3;
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = MEMORY[0x1E0C809B0];
  if ((isKindOfClass & 1) != 0)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke;
    v25[3] = &unk_1E3163580;
    v26 = v4;
    v27 = v28;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v25);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_2;
    v22[3] = &unk_1E3163580;
    v23 = v4;
    v24 = v28;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v22);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_3;
    v19[3] = &unk_1E3163580;
    v20 = v4;
    v21 = v28;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v19);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_4;
    v16[3] = &unk_1E3163580;
    v17 = v4;
    v18 = v28;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v16);

  }
  MPContainerUniqueIDPrefix(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet countForObject:](self->_baseContentItemIDToOccurrenceCount, "countForObject:", v8);
  ML3ContainerItemOccurrenceID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](self->_baseContentItemIDToOccurrenceCount, "addObject:", v8);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_5;
  v14[3] = &unk_1E3163A58;
  v10 = v9;
  v15 = v10;
  v11 = (void *)objc_msgSend(v5, "copyWithSource:block:", CFSTR("StorePlatform-ContainerUniqueID"), v14);
  v12 = (void *)objc_msgSend(v4, "copyWithIdentifiers:block:", v11, &__block_literal_global_56_26288);

  _Block_object_dispose(v28, 8);
  return v12;
}

- (BOOL)shouldUsePlaylistEntry
{
  return self->_shouldUsePlaylistEntry;
}

- (void)setShouldUsePlaylistEntry:(BOOL)a3
{
  self->_shouldUsePlaylistEntry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioStationBuilder, 0);
  objc_storeStrong((id *)&self->_recordLabelBuilder, 0);
  objc_storeStrong((id *)&self->_tvShowBuilder, 0);
  objc_storeStrong((id *)&self->_tvSeasonBuilder, 0);
  objc_storeStrong((id *)&self->_tvEpisodeBuilder, 0);
  objc_storeStrong((id *)&self->_songBuilder, 0);
  objc_storeStrong((id *)&self->_playlistBuilder, 0);
  objc_storeStrong((id *)&self->_movieBuilder, 0);
  objc_storeStrong((id *)&self->_artistBuilder, 0);
  objc_storeStrong((id *)&self->_albumBuilder, 0);
  objc_storeStrong((id *)&self->_baseContentItemIDToOccurrenceCount, 0);
}

void __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isLibraryAdded");

}

void __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isLibraryAdded");

}

void __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isLibraryAdded");

}

void __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v5 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v5, "type");
  switch(v2)
  {
    case 3:
      objc_msgSend(v5, "movie");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(v5, "tvEpisode");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(v5, "song");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = v3;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isLibraryAdded");

      break;
  }

}

uint64_t __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContainerUniqueID:", *(_QWORD *)(a1 + 32));
}

void __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  MPModelPlaylistEntry *v4;
  void *v5;
  MPModelPlaylistEntry *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = [MPModelPlaylistEntry alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v7[3] = &unk_1E315A788;
  v8 = *(id *)(a1 + 32);
  v6 = -[MPModelObject initWithIdentifiers:block:](v4, "initWithIdentifiers:block:", v5, v7);
  objc_msgSend(v3, "setPlaylistEntry:", v6);

}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSong:", *(_QWORD *)(a1 + 32));
}

void __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  MPModelPlaylistEntry *v4;
  void *v5;
  MPModelPlaylistEntry *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = [MPModelPlaylistEntry alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
  v7[3] = &unk_1E315A788;
  v8 = *(id *)(a1 + 32);
  v6 = -[MPModelObject initWithIdentifiers:block:](v4, "initWithIdentifiers:block:", v5, v7);
  objc_msgSend(v3, "setPlaylistEntry:", v6);

}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTvEpisode:", *(_QWORD *)(a1 + 32));
}

void __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  MPModelPlaylistEntry *v4;
  void *v5;
  MPModelPlaylistEntry *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = [MPModelPlaylistEntry alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14;
  v7[3] = &unk_1E315A788;
  v8 = *(id *)(a1 + 32);
  v6 = -[MPModelObject initWithIdentifiers:block:](v4, "initWithIdentifiers:block:", v5, v7);
  objc_msgSend(v3, "setPlaylistEntry:", v6);

}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMovie:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlbum:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_19(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlaylist:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_21(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setArtist:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_23(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRecordLabel:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_25(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShow:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_27(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSeason:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_29(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRecordLabel:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_31(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRadioStation:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMovie:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTvEpisode:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSong:", *(_QWORD *)(a1 + 32));
}

@end
