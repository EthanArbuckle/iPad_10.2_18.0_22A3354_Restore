@implementation ML3Track

+ (id)predisambiguatedProperties
{
  return (id)ML3TrackPredisambiguatedPropertyForProperties;
}

+ (id)subselectStatementForProperty:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend((id)ML3TrackSubSelectProperties, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("subselect"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)initialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _QWORD v140[232];
  const __CFString *v141;
  _BYTE __dst[8544];
  void *v143;
  void *v144;
  void *v145;
  _QWORD v146[4];
  _QWORD v147[5];
  _QWORD v148[3];
  _QWORD v149[2];
  _QWORD v150[4];
  _QWORD v151[3];
  _QWORD v152[4];
  _QWORD v153[5];
  _QWORD v154[3];
  _QWORD v155[8];
  _QWORD v156[6];
  _QWORD v157[8];

  v157[6] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v134 = a1;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("title_order"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v157[0] = v3;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("item_artist_order"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v157[1] = v4;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_order"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v157[2] = v5;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_pid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v157[3] = v6;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("disc_number"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v157[4] = v7;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("track_number"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v157[5] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)ML3TrackDefaultOrderingTerms;
    ML3TrackDefaultOrderingTerms = v9;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_order = 0"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v156[0] = v11;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_order"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v156[1] = v12;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_pid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v156[2] = v13;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("disc_number"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v156[3] = v14;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("track_number"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v156[4] = v15;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v156[5] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 6);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)ML3TrackAlbumsDefaultOrderingTerms;
    ML3TrackAlbumsDefaultOrderingTerms = v17;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_artist_order = 0"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v155[0] = v19;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_artist_order"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v155[1] = v20;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_artist_pid"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v155[2] = v21;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_order"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v155[3] = v22;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_pid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v155[4] = v23;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("disc_number"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v155[5] = v24;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("track_number"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v155[6] = v25;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("title_order"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v155[7] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 8);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)ML3TrackAlbumByAlbumArtistDefaultOrderingTerms;
    ML3TrackAlbumByAlbumArtistDefaultOrderingTerms = v27;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("item_artist_order"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v154[0] = v29;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("item_artist_pid"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v154[1] = v30;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_pid"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v154[2] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 3);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)ML3TrackArtistsDefaultOrderingTerms;
    ML3TrackArtistsDefaultOrderingTerms = v32;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("title_order"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v153[0] = v34;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_order"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v153[1] = v35;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_pid"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v153[2] = v36;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("disc_number"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v153[3] = v37;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("track_number"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v153[4] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 5);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)ML3TrackArtistAllAlbumsDefaultOrderingTerms;
    ML3TrackArtistAllAlbumsDefaultOrderingTerms = v39;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("disc_number"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v152[0] = v41;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("track_number"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v152[1] = v42;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("title_order"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v152[2] = v43;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("item_artist_order"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v152[3] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 4);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)ML3TrackAlbumAllArtistsDefaultOrderingTerms;
    ML3TrackAlbumAllArtistsDefaultOrderingTerms = v45;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("disc_number"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v151[0] = v47;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("track_number"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v151[1] = v48;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("title_order"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v151[2] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 3);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)ML3TrackAlbumAndArtistDefaultOrderingTerms;
    ML3TrackAlbumAndArtistDefaultOrderingTerms = v50;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("composer_order"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v150[0] = v52;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("composer_pid"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v150[1] = v53;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_order"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v150[2] = v54;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("title_order"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v150[3] = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 4);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)ML3TrackComposersDefaultOrderingTerms;
    ML3TrackComposersDefaultOrderingTerms = v56;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("genre_order"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v149[0] = v58;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("genre_id"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v149[1] = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 2);
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)ML3TrackGenresDefaultOrderingTerms;
    ML3TrackGenresDefaultOrderingTerms = v60;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("item_store.date_released"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v148[0] = v62;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("track_number"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v148[1] = v63;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("title_order"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v148[2] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 3);
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)ML3TrackPodcastEpisodesDefaultOrderingTerms;
    ML3TrackPodcastEpisodesDefaultOrderingTerms = v65;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_order"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v147[0] = v67;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_pid"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v147[1] = v68;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("item_store.date_released"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v147[2] = v69;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("track_number"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v147[3] = v70;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("title_order"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v147[4] = v71;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 5);
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = (void *)ML3TrackPodcastsDefaultOrderingTerms;
    ML3TrackPodcastsDefaultOrderingTerms = v72;

    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("series_name_order"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v74;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("item_artist_pid"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = v75;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("item_video.season_number"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v76;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_order"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v146[0] = v77;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("episode_sort_id"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v146[1] = v78;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("track_number"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v146[2] = v79;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("title_order"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v146[3] = v80;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 7);
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)ML3TrackTVShowEpisodesDefaultOrderingTerms;
    ML3TrackTVShowEpisodesDefaultOrderingTerms = v81;

    v133 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("genre_id"), CFSTR("property"), CFSTR("SELECT genre.genre_id FROM genre WHERE genre.genre"), CFSTR("subselect"), 0);
    v83 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v133, CFSTR("genre.genre"), 0);
    v84 = (void *)ML3TrackSubSelectProperties;
    ML3TrackSubSelectProperties = v83;

    memcpy(__dst, &unk_1E5B5D408, sizeof(__dst));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 267);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 267);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 267);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0x1FFFFFFFFFFFFBD4;
    do
    {
      v89 = *(void **)&__dst[v88 * 8 + 8544];
      v90 = *(void **)((char *)&v144 + v88 * 8);
      v91 = (void *)v146[v88 - 1];
      v92 = (id)v146[v88];
      v93 = v91;
      v94 = v90;
      v95 = v89;
      objc_msgSend(v85, "setObject:forKeyedSubscript:", v95, v94);
      objc_msgSend(v86, "setObject:forKeyedSubscript:", v93, v94);
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v92, v94);

      v88 += 4;
    }
    while (v88 * 8);
    v96 = objc_msgSend(v85, "copy");
    v97 = (void *)ML3TrackJoinsForProperties;
    ML3TrackJoinsForProperties = v96;

    v98 = objc_msgSend(v86, "copy");
    v99 = (void *)ML3TrackForeignDatabaseTableForProperties;
    ML3TrackForeignDatabaseTableForProperties = v98;

    v100 = objc_msgSend(v87, "copy");
    v101 = (void *)ML3TrackForeignColumnForProperties;
    ML3TrackForeignColumnForProperties = v100;

    v102 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("item_extra.title"), CFSTR("title_order_section"), CFSTR("title_order"), CFSTR("title_order_section"), CFSTR("item_extra.sort_title"), CFSTR("item_artist_order_section"), CFSTR("item_artist.item_artist"), CFSTR("item_artist_order_section"), CFSTR("item_artist_order"), CFSTR("item_artist_order_section"), CFSTR("item_artist.sort_item_artist"), CFSTR("album_order_section"), CFSTR("album.album"), CFSTR("album_order_section"), CFSTR("album_order = 0"), CFSTR("album_order_section"), CFSTR("album_order"),
             CFSTR("album_order_section"),
             CFSTR("album.sort_album"),
             CFSTR("series_name_order_section"),
             CFSTR("item_artist.series_name"),
             CFSTR("series_name_order_section"),
             CFSTR("series_name_order"),
             CFSTR("series_name_order_section"),
             CFSTR("item_artist.sort_series_name"),
             CFSTR("album_artist_order_section"),
             CFSTR("album_artist_order = 0"),
             CFSTR("album_artist_order_section"),
             CFSTR("album_artist.album_artist"),
             CFSTR("album_artist_order_section"),
             CFSTR("album_artist_order"),
             CFSTR("album_artist_order_section"),
             CFSTR("album_artist.sort_album_artist"),
             CFSTR("composer_order_section"),
             CFSTR("composer.composer"),
             CFSTR("composer_order_section"),
             CFSTR("composer_order"),
             CFSTR("composer_order_section"),
             CFSTR("composer.sort_composer"),
             CFSTR("genre_order_section"),
             CFSTR("genre.genre"),
             CFSTR("genre_order_section"),
             CFSTR("genre_order"),
             0);
    v103 = (void *)ML3TrackSectionPropertyForProperties;
    ML3TrackSectionPropertyForProperties = v102;

    v104 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("item_extra"), CFSTR("item_stats"), CFSTR("item_store"), CFSTR("item_playback"), CFSTR("item_search"), CFSTR("item_video"), CFSTR("item_kvs"), CFSTR("chapter"), CFSTR("lyrics"), CFSTR("booklet"), 0);
    v105 = (void *)ML3TrackExtraTablesToDelete;
    ML3TrackExtraTablesToDelete = v104;

    v106 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("item_extra"), CFSTR("item_stats"), CFSTR("item_store"), CFSTR("item_playback"), CFSTR("item_video"), CFSTR("chapter"), 0);
    v107 = (void *)ML3TrackExtraTablesToInsert;
    ML3TrackExtraTablesToInsert = v106;

    v108 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("item_extra"), CFSTR("item_pid"), CFSTR("item_playback"), CFSTR("item_pid"), CFSTR("item_stats"), CFSTR("item_pid"), CFSTR("item_search"), CFSTR("item_pid"), CFSTR("item_store"), CFSTR("item_pid"), CFSTR("item_video"), CFSTR("item_pid"), CFSTR("item_kvs"), CFSTR("item_pid"), CFSTR("lyrics"), CFSTR("item_pid"), CFSTR("chapter"),
             CFSTR("item_pid"),
             CFSTR("booklet"),
             0);
    v109 = (void *)ML3TrackPersistentIDForTable;
    ML3TrackPersistentIDForTable = v108;

    v140[0] = CFSTR("item_extra.genius_id");
    v140[1] = CFSTR("item_extra.content_rating_level");
    v140[2] = CFSTR("item_extra.title");
    v140[3] = CFSTR("title_order");
    v140[4] = CFSTR("title_order_section");
    v140[5] = CFSTR("item_extra.sort_title");
    v140[6] = CFSTR("item_artist_pid");
    v140[7] = CFSTR("item_artist.item_artist");
    v140[8] = CFSTR("item_artist_order");
    v140[9] = CFSTR("item_artist_order_section");
    v140[10] = CFSTR("item_artist.sort_item_artist");
    v140[11] = CFSTR("album_pid");
    v140[12] = CFSTR("album.album");
    v140[13] = CFSTR("album_order");
    v140[14] = CFSTR("album_order_section");
    v140[15] = CFSTR("album.sort_album");
    v140[16] = CFSTR("album_artist_pid");
    v140[17] = CFSTR("album_artist.album_artist");
    v140[18] = CFSTR("album_artist_order");
    v140[19] = CFSTR("album_artist_order_section");
    v140[20] = CFSTR("album_artist.sort_album_artist");
    v140[21] = CFSTR("album_artist.liked_state");
    v140[22] = CFSTR("composer_pid");
    v140[23] = CFSTR("composer.composer");
    v140[24] = CFSTR("composer_order");
    v140[25] = CFSTR("composer_order_section");
    v140[26] = CFSTR("composer.sort_composer");
    v140[27] = CFSTR("genre_id");
    v140[28] = CFSTR("genre.genre");
    v140[29] = CFSTR("genre_order");
    v140[30] = CFSTR("genre_order_section");
    v140[31] = CFSTR("disc_number");
    v140[32] = CFSTR("item_extra.disc_count");
    v140[33] = CFSTR("track_number");
    v140[34] = CFSTR("item_extra.track_count");
    v140[35] = CFSTR("item_artist.series_name");
    v140[36] = CFSTR("item_artist.sort_series_name");
    v140[37] = CFSTR("item_video.season_number");
    v140[38] = CFSTR("item_video.episode_id");
    v140[39] = CFSTR("item_store.feed_url");
    v140[40] = CFSTR("item_store.date_released");
    v140[41] = CFSTR("item_store.external_guid");
    v140[42] = CFSTR("item_extra.description");
    v140[43] = CFSTR("item_extra.comment");
    v140[44] = CFSTR("item_extra.location");
    v140[45] = CFSTR("item_extra.grouping");
    v140[46] = CFSTR("IFNULL(item_artist.series_name, item_artist.item_artist)");
    v140[47] = CFSTR("IFNULL(ML3SeasonDisplayName(item_video.season_number), album.album)");
    v140[48] = CFSTR("exclude_from_shuffle");
    v140[49] = CFSTR("(item.exclude_from_shuffle = 0)");
    v140[50] = CFSTR("media_type");
    v140[51] = CFSTR("(((item.media_type & ~65280) = 0) OR (item.media_type = 1032))");
    v140[52] = CFSTR("((item.media_type & 4128)!=0)");
    v140[53] = CFSTR("((item.media_type & 260)!=0)");
    v140[54] = CFSTR("category.category");
    v140[55] = CFSTR("item_extra.description_long");
    v140[56] = CFSTR("item_extra.collection_description");
    v140[57] = CFSTR("item_extra.location_kind_id");
    v140[58] = CFSTR("item_extra.comment");
    v140[59] = CFSTR("item_playback.eq_preset");
    v140[60] = CFSTR("item_extra.file_size");
    v140[61] = CFSTR("item_extra.total_time_ms");
    v140[62] = CFSTR("item_playback.start_time_ms");
    v140[63] = CFSTR("item_playback.stop_time_ms");
    v140[64] = CFSTR("item_extra.year");
    v140[65] = CFSTR("item_playback.bit_rate");
    v140[66] = CFSTR("item_playback.sample_rate");
    v140[67] = CFSTR("item_playback.audio_format");
    v140[68] = CFSTR("item_playback.duration");
    v140[69] = CFSTR("item_playback.gapless_heuristic_info");
    v140[70] = CFSTR("item_playback.gapless_encoding_delay");
    v140[71] = CFSTR("item_playback.gapless_encoding_drain");
    v140[72] = CFSTR("item_playback.gapless_last_frame_resynch");
    v140[73] = CFSTR("item_playback.volume_normalization_energy");
    v140[74] = CFSTR("item_extra.date_modified");
    v140[75] = CFSTR("date_added");
    v140[76] = CFSTR("item_extra.bpm");
    v140[77] = CFSTR("item_store.store_item_id");
    v140[78] = CFSTR("item_store.store_playlist_id");
    v140[79] = CFSTR("item_store.store_composer_id");
    v140[80] = CFSTR("item_store.store_genre_id");
    v140[81] = CFSTR("item_store.account_id");
    v140[82] = CFSTR("item_store.downloader_account_id");
    v140[83] = CFSTR("item_store.family_account_id");
    v140[84] = CFSTR("item_store.is_protected");
    v140[85] = CFSTR("item_store.key_id");
    v140[86] = CFSTR("item_store.date_released");
    v140[87] = CFSTR("item_video.audio_language");
    v140[88] = CFSTR("item_video.audio_track_index");
    v140[89] = CFSTR("item_video.audio_track_id");
    v140[90] = CFSTR("item_video.audio_track_locale");
    v140[91] = CFSTR("item_video.subtitle_language");
    v140[92] = CFSTR("item_video.subtitle_track_index");
    v140[93] = CFSTR("episode_sort_id");
    v140[94] = CFSTR("item_video.has_alternate_audio");
    v140[95] = CFSTR("item_video.has_subtitles");
    v140[96] = CFSTR("item_extra.content_rating");
    v140[97] = CFSTR("item_video.movie_info");
    v140[98] = CFSTR("item_extra.media_kind");
    v140[99] = CFSTR("item_extra.is_user_disabled");
    v140[100] = CFSTR("item_stats.play_count_user");
    v140[101] = CFSTR("item_stats.play_count_recent");
    v140[102] = CFSTR("item_stats.date_played");
    v140[103] = CFSTR("item_stats.date_accessed");
    v140[104] = CFSTR("item_stats.skip_count_user");
    v140[105] = CFSTR("item_stats.skip_count_recent");
    v140[106] = CFSTR("item_stats.date_skipped");
    v140[107] = CFSTR("item_stats.user_rating");
    v140[108] = CFSTR("item_stats.user_rating_is_derived");
    v140[109] = CFSTR("album.user_rating");
    v140[110] = CFSTR("album.user_rating_is_derived");
    v140[111] = CFSTR("item_stats.bookmark_time_ms");
    v140[112] = CFSTR("item_stats.remember_bookmark");
    v140[113] = CFSTR("item_stats.has_been_played");
    v140[114] = CFSTR("item_stats.hidden");
    v140[115] = CFSTR("item_stats.liked_state");
    v140[116] = CFSTR("item_stats.liked_state_changed");
    v140[117] = CFSTR("item_extra.copyright");
    v140[118] = CFSTR("lyrics.lyrics");
    v140[119] = CFSTR("lyrics.checksum");
    v140[120] = CFSTR("lyrics.pending_checksum");
    v140[121] = CFSTR("lyrics.store_lyrics_available");
    v140[122] = CFSTR("lyrics.time_synced_lyrics_available");
    v140[123] = CFSTR("item_playback.relative_volume");
    v140[124] = CFSTR("item_video.is_rental");
    v140[125] = CFSTR("item_video.is_demo");
    v140[126] = CFSTR("item_video.has_hls");
    v140[127] = CFSTR("item_store.is_ota_purchased");
    v140[128] = CFSTR("chapter.chapter_data");
    v140[129] = CFSTR("(CASE WHEN LENGTH(IFNULL(chapter.chapter_data,'')) > 0 THEN 1 ELSE 0 END)");
    v140[130] = CFSTR("container_item.container_pid");
    v140[131] = CFSTR("container_item.container_item_pid");
    v140[132] = CFSTR("container_item.position");
    v140[133] = CFSTR("ML3IsCurrentlyRestrictedMedia(item.media_type, item_extra.content_rating, item_extra.content_rating_level, (SELECT value FROM _MLDatabaseProperties WHERE key='MPExplicitContentAllowedBoolean'))");
    v140[134] = CFSTR("item_kvs.key");
    v140[135] = CFSTR("ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)");
    v140[136] = CFSTR("cloud_kvs.bookmark_sync_timestamp");
    v140[137] = CFSTR("cloud_kvs.bookmark_sync_revision");
    v140[138] = CFSTR("item_store.date_purchased");
    v140[139] = CFSTR("item_store.key_platform_id");
    v140[140] = CFSTR("item_store.storefront_id");
    v140[141] = CFSTR("item_store.store_kind");
    v140[142] = CFSTR("item_store.key_versions");
    v140[143] = CFSTR("item_store.purchase_history_token");
    v140[144] = CFSTR("item_playback.codec_type");
    v140[145] = CFSTR("item_playback.codec_subtype");
    v140[146] = CFSTR("item_playback.format");
    v140[147] = CFSTR("item_playback.data_kind");
    v140[148] = CFSTR("item_playback.data_url");
    v140[149] = CFSTR("item_playback.has_video");
    v140[150] = CFSTR("item_store.key_id_2");
    v140[151] = CFSTR("item_video.has_chapter_data");
    v140[152] = CFSTR("item_video.show_sort_type");
    v140[153] = CFSTR("item_video.episode_type");
    v140[154] = CFSTR("item_video.episode_type_display_name");
    v140[155] = CFSTR("item_video.episode_sub_sort_order");
    v140[156] = CFSTR("item_store.purchase_history_id");
    v140[157] = CFSTR("item_store.sync_id");
    v140[158] = CFSTR("item_store.home_sharing_id");
    v140[159] = CFSTR("item_store.purchase_history_redownload_params");
    v140[160] = CFSTR("item_store.match_redownload_params");
    v140[174] = CFSTR("item_store.extras_url");
    v140[175] = CFSTR("item_store.vpp_is_licensed");
    v140[176] = CFSTR("item_store.vpp_org_id");
    v140[177] = CFSTR("item_store.vpp_org_name");
    v140[178] = CFSTR("item_store.sync_redownload_params");
    v140[179] = CFSTR("needs_reporting");
    v140[180] = CFSTR("item_store.subscription_store_item_id");
    v140[184] = CFSTR("album.liked_state");
    v140[185] = CFSTR("album.sync_id");
    v140[186] = CFSTR("album.album_year");
    v140[187] = CFSTR("album.liked_state_changed_date");
    v140[189] = CFSTR("item_extra.version");
    v140[190] = CFSTR("item_extra.display_version");
    v140[191] = CFSTR("item_extra.classical_work");
    v140[192] = CFSTR("item_extra.classical_movement");
    v140[193] = CFSTR("item_extra.classical_movement_count");
    v140[194] = CFSTR("item_extra.classical_movement_number");
    v140[195] = CFSTR("item_playback.progression_direction");
    v140[196] = CFSTR("item_artist.store_id");
    v140[197] = CFSTR("album_artist.store_id");
    v140[204] = CFSTR("item_store.sync_in_my_library");
    v140[205] = CFSTR("item_store.cloud_in_my_library");
    v140[206] = CFSTR("item_store.cloud_album_id");
    v140[207] = CFSTR("item_store.cloud_playback_endpoint_type");
    v140[208] = CFSTR("item_store.cloud_universal_library_id");
    v140[209] = CFSTR("item_store.asset_store_item_id");
    v140[210] = CFSTR("item_store.reporting_store_item_id");
    v140[211] = CFSTR("item.show_composer");
    v140[213] = CFSTR("item.is_music_show");
    v140[214] = CFSTR("item_video.hls_offline_playback_keys");
    v140[215] = CFSTR("item_video.is_premium");
    v140[216] = CFSTR("item_video.color_capability");
    v140[217] = CFSTR("item_video.hls_color_capability");
    v140[218] = CFSTR("item_video.video_quality");
    v140[219] = CFSTR("item_video.hls_video_quality");
    v140[220] = CFSTR("item_video.hls_playlist_url");
    v140[221] = CFSTR("item_video.audio_capability");
    v140[222] = CFSTR("item_video.hls_audio_capability");
    v140[224] = CFSTR("album_artist.cloud_universal_library_id");
    v140[226] = CFSTR("item_extra.is_preorder");
    v140[227] = CFSTR("item_video.hls_asset_traits");
    v140[228] = CFSTR("item_video.hls_key_server_url");
    v140[229] = CFSTR("item_video.hls_key_cert_url");
    v140[230] = CFSTR("item_video.hls_key_server_protocol");
    v140[231] = CFSTR("item_store.extended_playback_attribute");
    v140[161] = CFSTR("item_store.cloud_status");
    v141 = CFSTR("item_store.extended_lyrics_attribute");
    v140[162] = CFSTR("remote_location_id");
    v140[163] = CFSTR("(item.base_location_id == 0 AND item.remote_location_id == 0 AND item_store.sync_id != 0)");
    v140[164] = CFSTR("(item_store.is_protected > 0)");
    v140[165] = CFSTR("( (item.base_location_id = 0 AND item_store.playback_endpoint_type = 3) OR item_store.is_protected = 2)");
    v140[166] = CFSTR("(item.base_location_id > 0)");
    v140[167] = CFSTR("(item.base_location_id = 100)");
    v140[168] = CFSTR("(item.base_location_id > 200)");
    v140[169] = CFSTR("(item.base_location_id BETWEEN 100 AND 200)");
    v140[170] = CFSTR("(item.base_location_id >= 250)");
    v140[171] = CFSTR("(item.remote_location_id >= 50 AND item.remote_location_id < 300)");
    v140[172] = CFSTR("(item.remote_location_id >= 50 AND item.base_location_id < 250)");
    v140[173] = CFSTR("(CASE WHEN LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 THEN item_store.match_redownload_params ELSE item_store.purchase_history_redownload_params END)");
    v140[181] = CFSTR("(item.base_location_id OR item.remote_location_id)");
    v140[182] = CFSTR("(item_extra.content_rating == 1)");
    v140[183] = CFSTR("(item_extra.content_rating == 2)");
    v140[188] = CFSTR("(LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 OR LENGTH(IFNULL(item_store.purchase_history_redownload_params, '')) > 0)");
    v140[198] = CFSTR("best_artwork_token.available_artwork_token AS available_item_artwork_token");
    v140[199] = CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token");
    v140[200] = CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type");
    v140[201] = CFSTR("best_artwork_token.available_artwork_token AS available_item_screenshot_token");
    v140[202] = CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_screenshot_token");
    v140[203] = CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_screenshot_source_type");
    v140[212] = CFSTR("(CASE WHEN item.show_composer = 1 THEN composer.composer ELSE album_artist.album_artist END)");
    v140[223] = CFSTR("date_downloaded");
    v140[225] = CFSTR("item_stats.liked_state_changed_date");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 233);
    v110 = objc_claimAutoreleasedReturnValue();
    v111 = (void *)ML3TrackAllProperties;
    ML3TrackAllProperties = v110;

    v112 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("ML3IsCurrentlyRestrictedMedia(item.media_type, item_extra.content_rating, item_extra.content_rating_level, (SELECT value FROM _MLDatabaseProperties WHERE key='MPExplicitContentAllowedBoolean'))"), CFSTR("ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)"), 0);
    v113 = (void *)ML3TrackFunctionsProperties;
    ML3TrackFunctionsProperties = v112;

    v114 = objc_alloc(MEMORY[0x1E0C99E08]);
    +[ML3Entity predisambiguatedProperties](ML3Entity, "predisambiguatedProperties");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = (void *)objc_msgSend(v114, "initWithDictionary:", v115);

    objc_msgSend(v134, "predisambiguateProperties:toDictionary:", ML3TrackAllProperties, v116);
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v117 = (id)ML3TrackFunctionsProperties;
    v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
    if (v118)
    {
      v119 = v118;
      v120 = *(_QWORD *)v136;
      do
      {
        v121 = 0;
        do
        {
          if (*(_QWORD *)v136 != v120)
            objc_enumerationMutation(v117);
          objc_msgSend(v116, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * v121), *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * v121));
          ++v121;
        }
        while (v119 != v121);
        v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
      }
      while (v119);
    }

    v122 = objc_msgSend(v116, "copy");
    v123 = (void *)ML3TrackPredisambiguatedPropertyForProperties;
    ML3TrackPredisambiguatedPropertyForProperties = v122;

    v124 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("item_video.audio_track_id"), CFSTR("item_video.audio_track_locale"), CFSTR("base_location_id"), CFSTR("item_stats.bookmark_time_ms"), CFSTR("date_added"), CFSTR("item_stats.date_accessed"), CFSTR("item_stats.date_played"), CFSTR("item_store.date_released"), CFSTR("item_stats.date_skipped"), CFSTR("item_stats.download_identifier"), CFSTR("item_stats.has_been_played"), CFSTR("item_extra.location_kind_id"), CFSTR("item_stats.liked_state"), CFSTR("item_stats.liked_state_changed"), CFSTR("item_stats.liked_state_changed_date"), CFSTR("item_extra.location"), CFSTR("lyrics.lyrics"),
             CFSTR("lyrics.checksum"),
             CFSTR("lyrics.pending_checksum"),
             CFSTR("item_stats.play_count_recent"),
             CFSTR("item_stats.play_count_user"),
             CFSTR("item_stats.skip_count_recent"),
             CFSTR("item_stats.skip_count_user"),
             CFSTR("album.user_rating"),
             CFSTR("album.user_rating_is_derived"),
             CFSTR("item_stats.user_rating"),
             CFSTR("item_stats.user_rating_is_derived"),
             CFSTR("cloud_kvs.bookmark_sync_timestamp"),
             CFSTR("cloud_kvs.bookmark_sync_revision"),
             CFSTR("item_extra.file_size"),
             CFSTR("keep_local"),
             CFSTR("keep_local_status"),
             CFSTR("keep_local_status_reason"),
             CFSTR("keep_local_constraints"),
             0);
    v125 = (void *)ML3TrackContentsUnchangingProperties;
    ML3TrackContentsUnchangingProperties = v124;

    v126 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("chapter.chapter_data"), CFSTR("(CASE WHEN LENGTH(IFNULL(chapter.chapter_data,'')) > 0 THEN 1 ELSE 0 END)"), CFSTR("item_stats.chosen_by_auto_fill"), 0);
    v127 = (void *)ML3TrackInvisibleProperties;
    ML3TrackInvisibleProperties = v126;

    v128 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("item_stats.play_count_user"), CFSTR("item_stats.play_count_recent"), CFSTR("item_store.is_protected"), CFSTR("keep_local"), CFSTR("item_store.cloud_status"), CFSTR("item_stats.needs_restore"), CFSTR("date_downloaded"), 0);
    v129 = (void *)ML3TrackNoAssistantSyncProperties;
    ML3TrackNoAssistantSyncProperties = v128;

    v130 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("item_artist.item_artist"), CFSTR("item_artist.sort_item_artist"), CFSTR("album.album"), CFSTR("album.sort_album"), CFSTR("composer.composer"), CFSTR("composer.sort_composer"), CFSTR("album_artist.album_artist"), CFSTR("album_artist.sort_album_artist"), CFSTR("item_artist.series_name"), CFSTR("item_artist.sort_series_name"), CFSTR("genre.genre"), CFSTR("ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)"), CFSTR("(item.base_location_id > 0)"), CFSTR("(item.base_location_id = 100)"), CFSTR("(item.base_location_id > 200)"), CFSTR("(item.base_location_id BETWEEN 100 AND 200)"), CFSTR("(item.remote_location_id >= 50 AND item.remote_location_id < 300)"),
             CFSTR("(item.remote_location_id >= 50 AND item.base_location_id < 250)"),
             CFSTR("(CASE WHEN LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 THEN item_store.match_redownload_params ELSE item_store.purchase_history_redownload_params END)"),
             CFSTR("remote_location_id"),
             CFSTR("(item.base_location_id == 0 AND item.remote_location_id == 0 AND item_store.sync_id != 0)"),
             CFSTR("(item_store.is_protected > 0)"),
             CFSTR("( (item.base_location_id = 0 AND item_store.playback_endpoint_type = 3) OR item_store.is_protected = 2)"),
             CFSTR("(item.base_location_id OR item.remote_location_id)"),
             CFSTR("(item.base_location_id >= 250)"),
             CFSTR("(item_extra.content_rating == 1)"),
             CFSTR("(item_extra.content_rating == 2)"),
             CFSTR("((item_extra.total_time_ms - item_stats.bookmark_time_ms < 30000 AND item_extra.total_time_ms > 60000) OR (item_stats.bookmark_time_ms >= .95 * item_extra.total_time_ms))"),
             CFSTR("(item.remote_location_id != 100)"),
             CFSTR("(NOT item.in_my_library)"),
             CFSTR("(LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 OR LENGTH(IFNULL(item_store.purchase_history_redownload_params, '')) > 0)"),
             CFSTR("best_artwork_token.available_artwork_token AS available_item_artwork_token"),
             CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token"),
             CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type"),
             CFSTR("best_artwork_token.available_artwork_token AS available_item_screenshot_token"),
             CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_screenshot_token"),
             CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_screenshot_source_type"),
             CFSTR("(CASE WHEN item.show_composer = 1 THEN composer.composer ELSE album_artist.album_artist END)"),
             CFSTR("cloud_kvs.bookmark_sync_timestamp"),
             CFSTR("cloud_kvs.bookmark_sync_revision"),
             CFSTR("CASE WHEN rental_playback_date_started != 0 THEN MIN(rental_playback_date_started + rental_playback_duration, rental_date_started + rental_duration) ELSE rental_date_started + rental_duration END"),
             CFSTR("(rental_date_started + rental_duration)"),
             0);
    v131 = (void *)ML3TrackUnsettableProperties;
    ML3TrackUnsettableProperties = v130;

    v132 = 8544;
    do
    {

      v132 -= 8;
    }
    while (v132);

  }
}

+ (BOOL)trackWithPersistentID:(int64_t)a3 visibleInLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity queryWithLibrary:predicate:](ML3Track, "queryWithLibrary:predicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "hasEntities");
  return v8;
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend((id)ML3TrackContentsUnchangingProperties, "containsObject:", v3) & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend((id)ML3TrackInvisibleProperties, "containsObject:", v3) ^ 1;

  return v4;
}

+ (id)defaultOrderingTerms
{
  return (id)ML3TrackDefaultOrderingTerms;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)ML3TrackJoinsForProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___ML3Track;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databaseTable
{
  return CFSTR("item");
}

+ (id)albumsDefaultOrderingTerms
{
  return (id)ML3TrackAlbumsDefaultOrderingTerms;
}

+ (BOOL)registerBookmarkMetadataIdentifierFunctionOnConnection:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__ML3Track_registerBookmarkMetadataIdentifierFunctionOnConnection___block_invoke;
  v6[3] = &unk_1E5B5F7C0;
  v7 = v3;
  v4 = v3;
  objc_msgSend(v4, "registerFunctionName:argumentCount:block:", CFSTR("ML3TrackPropertyStoreBookmarkMetadataIdentifierFn"), 8, v6);

  return 1;
}

+ (id)sectionPropertyForProperty:(id)a3
{
  return (id)objc_msgSend((id)ML3TrackSectionPropertyForProperties, "objectForKey:", a3);
}

+ (id)albumAllArtistsDefaultOrderingTerms
{
  return (id)ML3TrackAlbumAllArtistsDefaultOrderingTerms;
}

+ (id)TVShowEpisodesDefaultOrderingTerms
{
  return (id)ML3TrackTVShowEpisodesDefaultOrderingTerms;
}

+ (id)genresDefaultOrderingTerms
{
  return (id)ML3TrackGenresDefaultOrderingTerms;
}

- (BOOL)needsVideoSnapshot
{
  void *v3;
  BOOL v4;
  void *v5;
  int v6;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("best_artwork_token.available_artwork_token AS available_item_screenshot_token"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
  }
  else
  {
    -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("media_type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntValue");

    v4 = v6 == 512 || v6 == 0x2000;
  }

  return v4;
}

- (void)createVideoSnapshotAtTime:(double)a3
{
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  int64_t v26;
  CGImageDestination *DataImageDestination;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[4];
  NSObject *v36;
  __int128 *p_buf;
  CMTime v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t v42[4];
  double v43;
  __int128 buf;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("item_video.is_rental"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("(item.base_location_id > 0)"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("(IFNULL(base_location.path, '') || '/' || item_extra.location)"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
        objc_msgSend(WeakRetained, "mediaFolderPathByAppendingPathComponent:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0C8B3C0];
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLAssetWithURL:options:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v14, "hasProtectedContent") & 1) == 0)
        {
          if (a3 <= 0.0)
            a3 = 105.0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          if (v14)
          {
            objc_msgSend(v14, "duration");
            v15 = v39;
            v16 = v40;
          }
          else
          {
            v16 = 0;
            v15 = 0;
          }
          v17 = v15 / v16;
          if (a3 > (double)v17)
            a3 = (double)v17 * 0.5;
          v18 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(double *)((char *)&buf + 4) = a3;
            _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "Generating video snapshot at time offset %g", (uint8_t *)&buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&v38, 0, sizeof(v38));
          CMTimeMakeWithSeconds(&v38, a3, 1);
          objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v38, "{?=qiIq}");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v45 = 0x2020000000;
          v46 = 0;
          v22 = dispatch_semaphore_create(0);
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __53__ML3Track_VideoSnapshot__createVideoSnapshotAtTime___block_invoke;
          v35[3] = &unk_1E5B5C400;
          p_buf = &buf;
          v23 = v22;
          v36 = v23;
          objc_msgSend(v19, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v21, v35);
          v24 = dispatch_time(0, 5000000000);
          if (dispatch_semaphore_wait(v23, v24))
          {
            v25 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v42 = 134217984;
              v43 = a3;
              _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "Timed out waiting for generateCGImagesAsynchronouslyForTimes: %g", v42, 0xCu);
            }

            objc_msgSend(v19, "cancelAllCGImageGeneration");
          }
          else if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24))
          {
            v26 = +[ML3MusicLibrary devicePreferredImageFormat](ML3MusicLibrary, "devicePreferredImageFormat");
            objc_msgSend(MEMORY[0x1E0C99DF0], "data");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            DataImageDestination = (CGImageDestination *)MSVImageUtilitiesCreateDataImageDestination();
            if (v26)
              MSVImageUtilitiesAddImageToDestination();
            else
              MSVImageUtilitiesAddJPEGToDestination();
            v28 = CGImageDestinationFinalize(DataImageDestination);
            CFRelease(DataImageDestination);
            CFRelease(*(CFTypeRef *)(*((_QWORD *)&buf + 1) + 24));
            if (v28)
            {
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "UUIDString");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              -[ML3Entity library](self, "library");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:", -[ML3Entity persistentID](self, "persistentID"), 0, v30, 2, 300);
              -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("media_type"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "unsignedIntValue");

              objc_msgSend(v31, "importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:", v34, v30, 2, 300, v33);
            }

          }
          _Block_object_dispose(&buf, 8);

        }
      }

    }
  }
}

intptr_t __53__ML3Track_VideoSnapshot__createVideoSnapshotAtTime___block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  if (cf)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFRetain(cf);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)absoluteFilePath
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("(IFNULL(base_location.path, '') || '/' || item_extra.location)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "length") >= 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
    objc_msgSend(WeakRetained, "mediaFolderPathByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ML3Track)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  ML3Track *v15;
  objc_super v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v13, "objectForKey:", CFSTR("ROWID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", ML3CreateIntegerUUID());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("ROWID"));
  }
  objc_msgSend((id)objc_opt_class(), "populateSortOrdersOfPropertyValues:inLibrary:cachedNameOrders:", v13, v12, v11);
  v17.receiver = self;
  v17.super_class = (Class)ML3Track;
  v15 = -[ML3Entity initWithDictionary:inLibrary:cachedNameOrders:usingConnection:](&v17, sel_initWithDictionary_inLibrary_cachedNameOrders_usingConnection_, v13, v12, v11, v10);

  return v15;
}

- (BOOL)updateIntegrity
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  ML3Track *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("ML3TrackIntegrityCompute(item.item_pid, item.media_type, item_extra.location, item_extra.file_size)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __27__ML3Track_updateIntegrity__block_invoke;
  v11[3] = &unk_1E5B62DC0;
  v14 = &v15;
  v8 = v6;
  v12 = v8;
  v13 = self;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 1, v11);

  v9 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)rawIntegrity
{
  id WeakRetained;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3086;
  v11 = __Block_byref_object_dispose__3087;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__ML3Track_rawIntegrity__block_invoke;
  v6[3] = &unk_1E5B64FE0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 0, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)chapterTOC
{
  void *v3;
  ML3ChapterTOC *v4;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("chapter.chapter_data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (ML3ChapterTOC *)objc_msgSend(v3, "length");
  if (v4)
  {
    objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v4 = 0;
    if (!ChapterData_CreateWithFlattenedData())
      v4 = -[ML3ChapterTOC initWithChapterDataRef:track:]([ML3ChapterTOC alloc], "initWithChapterDataRef:track:", 0, self);
  }

  return v4;
}

- (id)artworkTokenAtPlaybackTime:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (a3 < 0.0
    || (-[ML3Track chapterTOC](self, "chapterTOC"), (v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v6 = (void *)v5,
        +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", -[ML3Entity persistentID](self, "persistentID"), a3), v7 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("best_artwork_token.available_artwork_token AS available_item_artwork_token"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)updateCollectionCloudStatus
{
  uint64_t v3;
  ML3MusicLibrary **p_library;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t i;
  _OWORD v11[2];
  uint64_t v12;
  _QWORD v13[5];
  _OWORD v14[2];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14[0] = xmmword_1E5B5F768;
  v14[1] = *(_OWORD *)off_1E5B5F778;
  v15 = CFSTR("genre_id");
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  -[ML3Entity getValues:forProperties:count:](self, "getValues:forProperties:count:", v11, v14, 5);
  v3 = 0;
  p_library = &self->super._library;
  do
  {
    v5 = objc_msgSend(*(id *)((char *)v11 + v3 * 8), "longLongValue");
    if (v5)
    {
      v6 = v5;
      v7 = (void *)v13[v3];
      WeakRetained = objc_loadWeakRetained((id *)p_library);
      v9 = (void *)objc_msgSend(v7, "newWithPersistentID:inLibrary:", v6, WeakRetained);

      objc_msgSend(v9, "updateCloudStatus");
    }
    ++v3;
  }
  while (v3 != 5);
  for (i = 32; i != -8; i -= 8)

}

- (void)updateStoreBookmarkMetadataIdentifier
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v4 = objc_msgSend(WeakRetained, "supportsUbiquitousPlaybackPositions");

  if (v4)
  {
    -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("item_kvs.key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("item_stats.remember_bookmark"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "BOOLValue")
      && ((-[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)")), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "length"))? (v10 = v9): (v10 = 0), v11 = v10, v9, v11))
    {
      if (v7)
        v12 = v7;
      else
        v12 = &stru_1E5B66908;
      if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) == 0)
        -[ML3Entity setValue:forProperty:](self, "setValue:forProperty:", v11, CFSTR("item_kvs.key"));
    }
    else
    {
      if (v7)
      {
        -[ML3Entity library](self, "library");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __49__ML3Track_updateStoreBookmarkMetadataIdentifier__block_invoke;
        v14[3] = &unk_1E5B65580;
        v14[4] = self;
        objc_msgSend(v13, "performDatabaseTransactionWithBlock:", v14);

      }
      v9 = 0;
    }

  }
}

uint64_t __49__ML3Track_updateStoreBookmarkMetadataIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "persistentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM item_kvs WHERE item_pid = ?"), v6, 0);

  return 1;
}

void __24__ML3Track_rawIntegrity__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:withParameters:", CFSTR("SELECT integrity FROM item_extra WHERE item_pid = ?"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForFirstRowAndColumn");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __27__ML3Track_updateIntegrity__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a1[5];
  v10[0] = a1[4];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(_QWORD *)(v3 + 16);
  v6 = a2;
  objc_msgSend(v4, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "executeUpdate:withParameters:error:", CFSTR("UPDATE item_extra SET integrity = ? WHERE item_pid = ?"), v8, 0);

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
}

+ (int64_t)revisionTrackingCode
{
  return 0;
}

+ (id)albumsByAlbumArtistDefaultOrderingTerms
{
  return (id)ML3TrackAlbumByAlbumArtistDefaultOrderingTerms;
}

+ (id)podcastsDefaultOrderingTerms
{
  return (id)ML3TrackPodcastsDefaultOrderingTerms;
}

+ (id)artistAllAlbumsDefaultOrderingTerms
{
  return (id)ML3TrackArtistAllAlbumsDefaultOrderingTerms;
}

+ (id)artistsDefaultOrderingTerms
{
  return (id)ML3TrackArtistsDefaultOrderingTerms;
}

+ (id)albumAndArtistDefaultOrderingTerms
{
  return (id)ML3TrackAlbumAndArtistDefaultOrderingTerms;
}

+ (id)composersDefaultOrderingTerms
{
  return (id)ML3TrackComposersDefaultOrderingTerms;
}

+ (id)podcastsEpisodesDefaultOrderingTerms
{
  return (id)ML3TrackPodcastEpisodesDefaultOrderingTerms;
}

+ (id)subselectPropertyForProperty:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend((id)ML3TrackSubSelectProperties, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("property"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allProperties
{
  return (id)ML3TrackAllProperties;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend((id)ML3TrackForeignDatabaseTableForProperties, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)foreignColumnForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend((id)ML3TrackForeignColumnForProperties, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)extraTablesToDelete
{
  return (id)ML3TrackExtraTablesToDelete;
}

+ (id)extraTablesToInsert
{
  return (id)ML3TrackExtraTablesToInsert;
}

+ (id)persistentIDColumnForTable:(id)a3
{
  return (id)objc_msgSend((id)ML3TrackPersistentIDForTable, "objectForKey:", a3);
}

+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3
{
  return objc_msgSend((id)ML3TrackNoAssistantSyncProperties, "containsObject:", a3) ^ 1;
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return objc_msgSend((id)ML3TrackContentsUnchangingProperties, "containsObject:", a3);
}

+ (BOOL)_writeSyncDeletesToPlistWithLibrary:(id)a3 forPersistentIDs:(id)a4
{
  id v5;
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CFAbsoluteTime v22;
  void *v23;
  CFAbsoluteTime v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t i;
  void *v36;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _OWORD v65[6];
  const __CFString *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = 1;
  objc_msgSend(v5, "pathForResourceFileOrFolder:basePath:relativeToBase:createParentFolderIfNecessary:", 1, 0, 0, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
  if (v9)
  {
    v10 = v9;
    v40 = 0;
    v11 = 0x1E5B4A000uLL;
    v47 = *(_QWORD *)v49;
    v39 = v5;
    v44 = v8;
    do
    {
      v12 = 0;
      v46 = v10;
      do
      {
        if (*(_QWORD *)v49 != v47)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
        v14 = (void *)objc_msgSend(*(id *)(v11 + 3472), "newWithPersistentID:inLibrary:", objc_msgSend(v13, "unsignedLongLongValue"), v5);
        if (objc_msgSend(v14, "existsInLibrary"))
        {
          v65[4] = xmmword_1E5B5F5A8;
          v65[5] = *(_OWORD *)off_1E5B5F5B8;
          v66 = CFSTR("base_location_id");
          v65[0] = xmmword_1E5B5F568;
          v65[1] = *(_OWORD *)&off_1E5B5F578;
          v65[2] = xmmword_1E5B5F588;
          v65[3] = *(_OWORD *)&off_1E5B5F598;
          v64 = 0;
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          objc_msgSend(v14, "getValues:forProperties:count:", &v58, v65, 13);
          v15 = (id)v58;
          v16 = v64;
          if (objc_msgSend(v15, "unsignedLongLongValue")
            && (objc_msgSend(v16, "longLongValue") > 249 || !objc_msgSend(v16, "longLongValue")))
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v17 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*((id *)&v61 + 1), "longLongValue"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)v60, "doubleValue");
            objc_msgSend(v21, "numberWithUnsignedInt:", ML3UInt32MacTimeFromCFAbsoluteTime(v22));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*((id *)&v60 + 1), "doubleValue");
            objc_msgSend(v23, "numberWithUnsignedInt:", ML3UInt32MacTimeFromCFAbsoluteTime(v24));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*((id *)&v62 + 1), "longLongValue"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend((id)v63, "longLongValue"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setValue:forKey:](v17, "setValue:forKey:", (_QWORD)v58, CFSTR("persistentID"));
            -[NSObject setValue:forKey:](v17, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("deleted"));
            if (!objc_msgSend(*((id *)&v58 + 1), "longLongValue"))
            {
              if (objc_msgSend((id)v59, "intValue"))
              {
                -[NSObject setValue:forKey:](v17, "setValue:forKey:", (_QWORD)v59, CFSTR("playCount"));
                -[NSObject setObject:forKey:](v17, "setObject:forKey:", v43, CFSTR("playMacOSDate"));
                -[NSObject setValue:forKey:](v17, "setValue:forKey:", (_QWORD)v61, CFSTR("playedState"));
              }
              if (objc_msgSend(*((id *)&v59 + 1), "intValue"))
              {
                -[NSObject setValue:forKey:](v17, "setValue:forKey:", *((_QWORD *)&v59 + 1), CFSTR("skipCount"));
                -[NSObject setObject:forKey:](v17, "setObject:forKey:", v42, CFSTR("skipMacOSDate"));
              }
              -[NSObject setValue:forKey:](v17, "setValue:forKey:", v45, CFSTR("bookmarkTimeInMS"));
              -[NSObject setValue:forKey:](v17, "setValue:forKey:", (_QWORD)v62, CFSTR("audioTrackID"));
              -[NSObject setValue:forKey:](v17, "setValue:forKey:", v25, CFSTR("userRating"));
              -[NSObject setValue:forKey:](v17, "setValue:forKey:", v26, CFSTR("likedState"));
              -[NSObject setValue:forKey:](v17, "setValue:forKey:", *((_QWORD *)&v63 + 1), CFSTR("albumLikedState"));
            }
            v27 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = objc_msgSend(v13, "longLongValue");
              *(_DWORD *)buf = 134218242;
              v53 = v28;
              v54 = 2114;
              v55 = (uint64_t)v17;
              _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_DEFAULT, "Writing tombstone for track with persistent ID %lld: %{public}@", buf, 0x16u);
            }

            v29 = v40;
            if (!v40)
            {
              v41 = v25;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v38);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)objc_msgSend(v30, "mutableCopy");
              v32 = v31;
              if (v31)
              {
                v33 = v31;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v33 = (id)objc_claimAutoreleasedReturnValue();
              }
              v34 = v33;

              v29 = v34;
              v25 = v41;
            }
            v40 = v29;
            objc_msgSend(v29, "addObject:", v17);

            v5 = v39;
          }
          else
          {
            v17 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = objc_msgSend(v13, "longLongValue");
              v19 = objc_msgSend(v15, "longLongValue");
              v20 = objc_msgSend(v16, "longLongValue");
              *(_DWORD *)buf = 134218496;
              v53 = v18;
              v54 = 2048;
              v55 = v19;
              v5 = v39;
              v56 = 2048;
              v57 = v20;
              _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEFAULT, "Skipping writing tombstone for track with persistent ID %lld (sync_id = %lld, base_location_id = %lld)", buf, 0x20u);
            }
          }

          for (i = 96; i != -8; i -= 8)
          v8 = v44;
          v11 = 0x1E5B4A000;
          v10 = v46;
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
    }
    while (v10);

    if (!v40)
    {
      v7 = 1;
      goto LABEL_36;
    }
    v7 = objc_msgSend(v40, "writeToFile:atomically:", v38, 1);
    v36 = v40;
  }
  else
  {
    v36 = v8;
  }

LABEL_36:
  return v7;
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id v16;
  const int64_t *v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v10 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__ML3Track_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke;
  v13[3] = &unk_1E5B61E80;
  v15 = &v20;
  v16 = a1;
  v11 = v10;
  v19 = a4;
  v14 = v11;
  v17 = a5;
  v18 = a6;
  objc_msgSend(v11, "performDatabaseTransactionWithBlock:", v13);
  LOBYTE(a6) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return a6;
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 canonicalizeCollections:(BOOL)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7
{
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  const int64_t *v19;
  unint64_t v20;
  int v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v12 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count___block_invoke;
  v15[3] = &unk_1E5B5F5D8;
  v17 = &v23;
  v18 = a1;
  v13 = v12;
  v21 = a4;
  v22 = a5;
  v16 = v13;
  v19 = a6;
  v20 = a7;
  objc_msgSend(v13, "performDatabaseTransactionWithBlock:", v15);
  LOBYTE(a7) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return a7;
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7
{
  return objc_msgSend(a1, "deleteFromLibrary:deletionType:canonicalizeCollections:persistentIDs:count:usingConnection:", a3, *(_QWORD *)&a4, 1, a5, a6, a7);
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 canonicalizeCollections:(BOOL)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7 usingConnection:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  unsigned __int8 v23;
  NSObject *v24;
  uint64_t v25;
  const __CFString *v26;
  dispatch_time_t v27;
  NSObject *v28;
  unsigned int v30;
  id v31;
  _QWORD block[4];
  id v33;
  objc_super v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v11 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a8;
  v16 = v15;
  if (a7)
  {
    v30 = a4;
    v31 = v15;
    v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a6[v19]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v20);

      ++v19;
    }
    while (a7 != v19);
    v21 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __103__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke;
    v35[3] = &unk_1E5B63928;
    v22 = v17;
    v36 = v22;
    objc_msgSend(a1, "enumeratePathsToDeleteFromLibrary:persistentIDs:usingBlock:", v14, v18, v35);
    v34.receiver = a1;
    v34.super_class = (Class)&OBJC_METACLASS___ML3Track;
    v16 = v31;
    v23 = objc_msgSendSuper2(&v34, sel_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection_, v14, v30, v11, a6, a7, v31);
    if ((v23 & 1) != 0)
    {
      v24 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_msgSend(v22, "count");
        v26 = CFSTR("user action");
        if (v30 == 2)
          v26 = CFSTR("automated action");
        *(_DWORD *)buf = 134218242;
        v38 = v25;
        v39 = 2114;
        v40 = v26;
        _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_DEFAULT, "Deleting %ld assets due to %{public}@", buf, 0x16u);
      }

      v27 = dispatch_time(0, 5000000000);
      dispatch_get_global_queue(0, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      block[0] = v21;
      block[1] = 3221225472;
      block[2] = __103__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke_1660;
      block[3] = &unk_1E5B65D80;
      v33 = v22;
      dispatch_after(v27, v28, block);

    }
  }
  else
  {
    v23 = 1;
  }

  return v23;
}

+ (BOOL)removeFromMyLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  id v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a6);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a6; --a6)
  {
    v10 = *a5++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v11);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__ML3Track_removeFromMyLibrary_deletionType_persistentIDs_count___block_invoke;
  v15[3] = &unk_1E5B62EB8;
  v16 = v8;
  v17 = i;
  v12 = i;
  v13 = v8;
  objc_msgSend(v13, "performDatabaseTransactionWithBlock:", v15);

  return 1;
}

+ (BOOL)trackWithPersistentID:(int64_t)a3 existsInLibrary:(id)a4
{
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v6 = a4;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__ML3Track_trackWithPersistentID_existsInLibrary___block_invoke;
  v8[3] = &unk_1E5B5F600;
  v8[4] = &v9;
  v8[5] = a1;
  v8[6] = a3;
  objc_msgSend(v6, "databaseConnectionAllowingWrites:withBlock:", 0, v8);
  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a3;
}

+ (BOOL)trackWithPersistentID:(int64_t)a3 existsInLibraryWithConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend(v5, "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", CFSTR("SELECT 1 FROM item WHERE ROWID = ?"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v9, "hasAtLeastOneRow");
  return (char)v7;
}

+ (void)populateSortOrdersOfPropertyValues:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  int v15;
  __int128 *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  __int128 v26;
  uint64_t v27;
  _OWORD v28[2];
  uint64_t v29;
  _QWORD v30[2];
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__ML3Track_populateSortOrdersOfPropertyValues_inLibrary_cachedNameOrders___block_invoke;
  v17[3] = &unk_1E5B5F628;
  v10 = v7;
  v18 = v10;
  v19 = v9;
  v20 = v8;
  v11 = v8;
  v12 = v9;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1AF43CDE0](v17);
  objc_msgSend(v10, "objectForKey:", CFSTR("is_compilation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  if (v15)
  {
    v38 = xmmword_1E5B5F648;
    v39 = 0;
    v16 = &v38;
  }
  else
  {
    v36[0] = xmmword_1E5B5F660;
    v36[1] = *(_OWORD *)off_1E5B5F670;
    v37 = 0;
    v16 = v36;
  }
  ((void (**)(_QWORD, const __CFString *, const __CFString *, __int128 *))v13)[2](v13, CFSTR("album_artist_order"), CFSTR("album_artist_order_section"), v16);
  v35[0] = xmmword_1E5B5F688;
  v35[1] = *(_OWORD *)&off_1E5B5F698;
  ((void (**)(_QWORD, const __CFString *, const __CFString *, _OWORD *))v13)[2](v13, CFSTR("album_order"), CFSTR("album_order_section"), v35);
  v34 = 0;
  v33 = xmmword_1E5B5F6A8;
  ((void (**)(_QWORD, const __CFString *, const __CFString *, __int128 *))v13)[2](v13, CFSTR("item_artist_order"), CFSTR("item_artist_order_section"), &v33);
  v32 = 0;
  v31 = xmmword_1E5B5F6C0;
  ((void (**)(_QWORD, const __CFString *, const __CFString *, __int128 *))v13)[2](v13, CFSTR("composer_order"), CFSTR("composer_order_section"), &v31);
  v30[0] = CFSTR("genre.genre");
  v30[1] = 0;
  ((void (**)(_QWORD, const __CFString *, const __CFString *, _QWORD *))v13)[2](v13, CFSTR("genre_order"), CFSTR("genre_order_section"), v30);
  v29 = 0;
  v28[0] = xmmword_1E5B5F6D8;
  v28[1] = *(_OWORD *)off_1E5B5F6E8;
  ((void (**)(_QWORD, const __CFString *, const __CFString *, _OWORD *))v13)[2](v13, CFSTR("series_name_order"), CFSTR("series_name_order_section"), v28);
  v27 = 0;
  v26 = xmmword_1E5B5F700;
  ((void (**)(_QWORD, const __CFString *, const __CFString *, __int128 *))v13)[2](v13, CFSTR("title_order"), CFSTR("title_order_section"), &v26);
  v25[0] = CFSTR("item_extra.title");
  v25[1] = 0;
  ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD *))v13)[2](v13, CFSTR("item_search.search_title"), 0, v25);
  v24[0] = CFSTR("album.album");
  v24[1] = 0;
  ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD *))v13)[2](v13, CFSTR("item_search.search_album"), 0, v24);
  v23[0] = CFSTR("item_artist.item_artist");
  v23[1] = 0;
  ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD *))v13)[2](v13, CFSTR("item_search.search_artist"), 0, v23);
  v22[0] = CFSTR("composer.composer");
  v22[1] = 0;
  ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD *))v13)[2](v13, CFSTR("item_search.search_composer"), 0, v22);
  v21[0] = CFSTR("album_artist.album_artist");
  v21[1] = 0;
  ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD *))v13)[2](v13, CFSTR("item_search.search_album_artist"), 0, v21);

}

+ (id)unsettableProperties
{
  return (id)ML3TrackUnsettableProperties;
}

+ (id)collectionClassesToUpdateBeforeDelete
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4
{
  return objc_msgSend(a1, "unlinkRedownloadableAssetsFromLibrary:persistentIDs:deletedFileSize:", a3, a4, 0);
}

+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4 deletedFileSize:(int64_t *)a5
{
  return objc_msgSend(a1, "unlinkRedownloadableAssetsFromLibrary:persistentIDs:deletionType:deletedFileSize:", a3, a4, 1, a5);
}

+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4 deletionType:(int)a5 deletedFileSize:(int64_t *)a6
{
  return objc_msgSend(a1, "unlinkRedownloadableAssetsFromLibrary:persistentIDs:deletionType:disableKeepLocal:deletedFileSize:", a3, a4, *(_QWORD *)&a5, 1, a6);
}

+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4 deletionType:(int)a5 disableKeepLocal:(BOOL)a6 deletedFileSize:(int64_t *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  const __CFString *v21;
  NSObject *v22;
  BOOL v23;
  _QWORD block[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  id v33;
  int64_t *v34;
  int v35;
  BOOL v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (v13 && objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke;
    v27[3] = &unk_1E5B5F748;
    v28 = v14;
    v33 = a1;
    v29 = v12;
    v17 = v16;
    v30 = v17;
    v32 = &v37;
    v36 = a6;
    v35 = a5;
    v34 = a7;
    v18 = v15;
    v31 = v18;
    objc_msgSend(v29, "performDatabaseTransactionWithBlock:", v27);
    if (*((_BYTE *)v38 + 24))
    {
      v19 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v17, "count");
        v21 = CFSTR("user action");
        if (a5 == 2)
          v21 = CFSTR("automated action");
        *(_DWORD *)buf = 134218242;
        v42 = v20;
        v43 = 2114;
        v44 = v21;
        _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "Unlinking %ld assets due to %{public}@", buf, 0x16u);
      }

      dispatch_get_global_queue(0, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_1692;
      block[3] = &unk_1E5B65D80;
      v26 = v17;
      dispatch_async(v22, block);

      v23 = *((_BYTE *)v38 + 24) != 0;
    }
    else
    {
      v23 = 0;
    }

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    v23 = 1;
  }

  return v23;
}

+ (BOOL)trackValueAreInTheCloud:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("(item.base_location_id BETWEEN 100 AND 200)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0
    || (objc_msgSend(v3, "objectForKey:", CFSTR("(item.base_location_id = 100)")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "BOOLValue"),
        v6,
        (v7 & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("(CASE WHEN LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 THEN item_store.match_redownload_params ELSE item_store.purchase_history_redownload_params END)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    objc_msgSend(v3, "objectForKey:", CFSTR("item_extra.location"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v10)
      v13 = v12 == 0;
    else
      v13 = 0;
    v8 = v13;
  }

  return v8;
}

+ (void)updateAllBookmarkableStoreBookmarkMetadataIdentifiersOnConnection:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t i;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = CFSTR("ROWID");
  v14[0] = CFSTR("ROWID");
  v14[1] = CFSTR("ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)");
  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("item_stats.remember_bookmark"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:caseInsensitive:treatNullAsString:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:caseInsensitive:treatNullAsString:", CFSTR("ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)"), &stru_1E5B66908, 2, 1, &stru_1E5B66908);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[ML3Entity newSelectAllEntitiesSQLForProperties:count:predicate:](ML3Track, "newSelectAllEntitiesSQLForProperties:count:predicate:", v14, 2, v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO item_upp (item_pid, bookkeeper_identifier) %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseStatementParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeUpdate:withParameters:error:", v10, v11, 0);

  for (i = 1; i != -1; --i)
}

+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4
{
  return objc_msgSend(a1, "clearLocationFromLibrary:persistentIDs:disableKeepLocal:", a3, a4, 1);
}

+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4 disableKeepLocal:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__ML3Track_clearLocationFromLibrary_persistentIDs_disableKeepLocal___block_invoke;
  v14[3] = &unk_1E5B5F7E8;
  v17 = &v20;
  v18 = a1;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v19 = a5;
  objc_msgSend(v10, "databaseConnectionAllowingWrites:withBlock:", 1, v14);
  v12 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4 usingConnection:(id)a5
{
  return objc_msgSend(a1, "clearLocationFromLibrary:persistentIDs:disableKeepLocal:usingConnection:", a3, a4, 1, a5);
}

+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4 disableKeepLocal:(BOOL)a5 usingConnection:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  int v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  id v34;
  void *v35;
  id v36;
  const __CFString *v37;
  uint8_t v38[16];
  uint8_t v39[16];
  uint8_t buf[16];
  uint8_t v41[16];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v35 = v10;
  if (v11 && objc_msgSend(v11, "count"))
  {
    v13 = objc_msgSend(v11, "count");
    v14 = CFSTR("UPDATE item SET base_location_id=0, date_downloaded=0, download_source_container_pid=0 WHERE item.item_pid");
    if (v7)
      v14 = CFSTR("UPDATE item SET base_location_id=0, date_downloaded=0, download_source_container_pid=0, keep_local=-1, keep_local_constraints=0, keep_local_status=0, keep_local_status_reason=0 WHERE item.item_pid");
    v37 = v14;
    if (v13)
    {
      v15 = v13;
      v34 = a1;
      v16 = 0;
      v17 = 0x1E5B4A000uLL;
      v36 = v11;
      while (1)
      {
        if (v15 - v16 >= 0x1F4)
          v18 = 500;
        else
          v18 = v15 - v16;
        objc_msgSend(v11, "subarrayWithRange:", v16, v18, v34, v35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v17 + 3008), "defaultRenderer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "statementWithPrefix:inParameterCount:", v37, objc_msgSend(v19, "count"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v12, "executeUpdate:withParameters:error:", v21, v19, 0) & 1) == 0)
        {
          v32 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v41 = 0;
            _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_ERROR, "Failed to clear download properties of tracks", v41, 2u);
          }

          goto LABEL_32;
        }
        objc_msgSend(*(id *)(v17 + 3008), "defaultRenderer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "statementWithPrefix:inParameterCount:", CFSTR("UPDATE item_extra SET location = '' WHERE item_extra.item_pid"), objc_msgSend(v19, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v12, "executeUpdate:withParameters:error:", v23, v19, 0) & 1) != 0)
          break;
        v26 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v26, OS_LOG_TYPE_ERROR, "Failed to clear location properties of tracks", buf, 2u);
        }
        v30 = 0;
        v29 = 1;
LABEL_25:

        if (v29)
        {
          v30 = 0;
          v11 = v36;
          goto LABEL_34;
        }
        v11 = v36;
        v17 = 0x1E5B4A000;
        if (v16 >= v15)
          goto LABEL_34;
      }
      objc_msgSend(*(id *)(v17 + 3008), "defaultRenderer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "statementWithPrefix:inParameterCount:", CFSTR("UPDATE item_store SET sync_id = 0, downloader_account_id = 0, family_account_id = 0, is_protected = 0, is_ota_purchased = 0 WHERE item_store.item_pid"), objc_msgSend(v19, "count"));
      v25 = v17;
      v26 = objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v12, "executeUpdate:withParameters:error:", v26, v19, 0) & 1) != 0)
      {
        objc_msgSend(*(id *)(v25 + 3008), "defaultRenderer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "statementWithPrefix:inParameterCount:", CFSTR("UPDATE item_video SET hls_asset_traits = 0 WHERE item_video.item_pid"), objc_msgSend(v19, "count"));
        v28 = objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v12, "executeUpdate:withParameters:error:", v28, v19, 0) & 1) != 0)
        {
          objc_msgSend(v34, "incrementRevisionForRevisionTypeContentWithConnection:deletionType:persistentIDs:", v12, 0, v19);
          v29 = 0;
          v16 += v18;
          v30 = 1;
LABEL_24:

          goto LABEL_25;
        }
        v31 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_ERROR, "Failed to clear video traits properties of tracks", v38, 2u);
        }

      }
      else
      {
        v28 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_ERROR, "Failed to clear store properties of tracks", v39, 2u);
        }
      }
      v30 = 0;
      v29 = 1;
      goto LABEL_24;
    }
LABEL_32:
    v30 = 0;
  }
  else
  {
    v30 = 1;
  }
LABEL_34:

  return v30;
}

+ (BOOL)clearPlaybackKeysFromLibrary:(id)a3 persistentIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__ML3Track_clearPlaybackKeysFromLibrary_persistentIDs___block_invoke;
    v10[3] = &unk_1E5B64FE0;
    v11 = v7;
    v12 = &v13;
    objc_msgSend(v5, "databaseConnectionAllowingWrites:withBlock:", 1, v10);
    v8 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (void)enumeratePathsToDeleteFromLibrary:(id)a3 persistentIDs:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__ML3Track_enumeratePathsToDeleteFromLibrary_persistentIDs_usingBlock___block_invoke;
  v13[3] = &unk_1E5B63BC8;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v12, "databaseConnectionAllowingWrites:withBlock:", 0, v13);

}

+ (void)enumeratePathsToDeleteFromLibrary:(id)a3 persistentIDs:(id)a4 usingConnection:(id)a5 usingBlock:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v18 = a4;
  v8 = a5;
  v9 = a6;
  v10 = objc_msgSend(v18, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    do
    {
      if (v11 - v12 >= 0x1F4)
        v13 = 500;
      else
        v13 = v11 - v12;
      objc_msgSend(v18, "subarrayWithRange:", v12, v13, v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "statementWithPrefix:inParameterCount:", CFSTR("SELECT item_extra.location, base_location.path, item.item_pid, item.base_location_id, item_store.store_saga_id, item_store.purchase_history_id, item_store.is_subscription FROM item JOIN item_extra USING (item_pid) JOIN item_store USING(item_pid) LEFT OUTER JOIN base_location USING (base_location_id) WHERE item.item_pid"), objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "executeQuery:withParameters:", v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __87__ML3Track_enumeratePathsToDeleteFromLibrary_persistentIDs_usingConnection_usingBlock___block_invoke;
      v19[3] = &unk_1E5B5F810;
      v20 = v9;
      objc_msgSend(v17, "enumerateRowsWithBlock:", v19);
      v12 += v13;

    }
    while (v12 < v11);
  }

}

void __87__ML3Track_enumeratePathsToDeleteFromLibrary_persistentIDs_usingConnection_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "stringForColumnIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v7;
      v10[1] = v5;
      v10[2] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathWithComponents:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v3, "int64ForColumnIndex:", 2);
  objc_msgSend(v3, "int64ForColumnIndex:", 3);
  objc_msgSend(v3, "int64ForColumnIndex:", 4);
  objc_msgSend(v3, "int64ForColumnIndex:", 5);
  objc_msgSend(v3, "int64ForColumnIndex:", 6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __71__ML3Track_enumeratePathsToDeleteFromLibrary_persistentIDs_usingBlock___block_invoke(_QWORD *a1, uint64_t a2)
{
  return +[ML3Track enumeratePathsToDeleteFromLibrary:persistentIDs:usingConnection:usingBlock:](ML3Track, "enumeratePathsToDeleteFromLibrary:persistentIDs:usingConnection:usingBlock:", a1[4], a1[5], a2, a1[6]);
}

void __55__ML3Track_clearPlaybackKeysFromLibrary_persistentIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statementWithPrefix:inParameterCount:", CFSTR("UPDATE item_video SET hls_offline_playback_keys = NULL WHERE item_video.item_pid"), objc_msgSend(*(id *)(a1 + 32), "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  LOBYTE(v4) = objc_msgSend(v3, "executeUpdate:withParameters:error:", v5, v6, &v10);

  v7 = v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v4;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "Failed to clear playback keys. %{public}@", buf, 0xCu);

    }
  }

}

uint64_t __68__ML3Track_clearLocationFromLibrary_persistentIDs_disableKeepLocal___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 56), "clearLocationFromLibrary:persistentIDs:disableKeepLocal:usingConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __67__ML3Track_registerBookmarkMetadataIdentifierFunctionOnConnection___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  __int16 v7;
  sqlite3_int64 v8;
  BOOL v9;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  UInt8 *v16;
  UInt8 *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  UInt8 *v29;
  _QWORD v30[4];
  __CFString *v31;
  sqlite3_value **v32;
  _QWORD v33[3];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v7 = sqlite3_value_int(*a4);
  v8 = sqlite3_value_int64(a4[1]);
  if (!v8)
    v8 = sqlite3_value_int64(a4[2]);
  if (v8)
    v9 = (v7 & 0x104) == 0;
  else
    v9 = 0;
  if (v9 && (v7 & 0x1020) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = ML3CopyUTF8StringFromCFString(v11);
    sqlite3_result_text(a2, (const char *)v17, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  }
  else
  {
    MLDBArgumentAsString((uint64_t)a4, 3u);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    MLDBArgumentAsString((uint64_t)a4, 4u);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v11, "length") && objc_msgSend(v12, "length"))
    {
      v34[0] = v11;
      v34[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", &stru_1E5B66908);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SBKIdentifierStringByMD5HashingString(v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v16 = ML3CopyUTF8StringFromCFString(v15);
      sqlite3_result_text(a2, (const char *)v16, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
    }
    else
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __67__ML3Track_registerBookmarkMetadataIdentifierFunctionOnConnection___block_invoke_2;
      v30[3] = &unk_1E5B5F798;
      v32 = a4;
      v31 = (__CFString *)*(id *)(a1 + 32);
      v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1AF43CDE0](v30);
      ((void (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v18)[2](v18, CFSTR("item_extra.title"), CFSTR("item_pid"), 5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "length"))
      {
        ((void (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v18)[2](v18, CFSTR("item_artist.item_artist"), CFSTR("item_artist_pid"), 6);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v18)[2](v18, CFSTR("album.album"), CFSTR("album_pid"), 7);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!-[__CFString length](v20, "length") || !-[__CFString length](v21, "length"))
        {
          if (v21)
            v22 = v21;
          else
            v22 = &stru_1E5B66908;
          v23 = v22;

          if (v20)
            v24 = v20;
          else
            v24 = &stru_1E5B66908;
          v25 = v24;

          v20 = v25;
          v21 = v23;
        }
        v33[0] = v19;
        v33[1] = v20;
        v33[2] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", &stru_1E5B66908);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        SBKIdentifierStringByMD5HashingString(v27);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28 = 0;
      }
      if (-[__CFString length](v28, "length"))
      {
        v29 = ML3CopyUTF8StringFromCFString(v28);
        sqlite3_result_text(a2, (const char *)v29, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
      }
      else
      {
        sqlite3_result_null(a2);
      }

      v15 = v31;
    }

  }
}

id __67__ML3Track_registerBookmarkMetadataIdentifierFunctionOnConnection___block_invoke_2(uint64_t a1, void *a2, void *a3, int a4)
{
  sqlite3_value *v6;
  id v7;
  id v8;
  sqlite3_int64 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = *(sqlite3_value **)(*(_QWORD *)(a1 + 40) + 8 * a4);
  v7 = a3;
  v8 = a2;
  v9 = sqlite3_value_int64(v6);
  objc_msgSend(v8, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@.%@ FROM %@ WHERE %@ = ?"), v10, v11, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "executeQuery:withParameters:", v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringValueForFirstRowAndColumn");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

BOOL __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  _BOOL8 v27;
  void (**v29)(void);
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v54 = malloc_type_malloc(8 * objc_msgSend(*(id *)(a1 + 32), "count"), 0x100004000313F17uLL);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2;
  v46[3] = &unk_1E5B64C48;
  v46[4] = &v51;
  v29 = (void (**)(void))MEMORY[0x1AF43CDE0](v46);
  v4 = *(void **)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 32);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_3;
  v41[3] = &unk_1E5B5F720;
  v6 = *(_QWORD *)(a1 + 40);
  v42 = *(id *)(a1 + 48);
  v7 = v3;
  v43 = v7;
  v44 = &v51;
  v45 = &v47;
  objc_msgSend(v4, "enumeratePathsToDeleteFromLibrary:persistentIDs:usingBlock:", v6, v5, v41);
  +[ML3Track _writeSyncDeletesToPlistWithLibrary:forPersistentIDs:](ML3Track, "_writeSyncDeletesToPlistWithLibrary:forPersistentIDs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 72), "clearLocationFromLibrary:persistentIDs:disableKeepLocal:usingConnection:", *(_QWORD *)(a1 + 40), v7, *(unsigned __int8 *)(a1 + 92), v30);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    goto LABEL_24;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 72), "clearPlaybackKeysFromLibrary:persistentIDs:", *(_QWORD *)(a1 + 40), v7);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    goto LABEL_24;
  v8 = 0;
  do
  {
    if (ML3TrackRulesShouldSetRemovalPropertiesOnAssetDeleteForSource(v8))
    {
      ML3TrackRulesRemovalPropertiesForSource(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_1686;
        v38[3] = &unk_1E5B65250;
        v12 = v10;
        v39 = v12;
        v13 = v11;
        v40 = v13;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v38);
        +[ML3Entity setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:](ML3Track, "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", v13, v12, v7, *(_QWORD *)(a1 + 40), v30);

      }
    }
    v8 = (v8 + 1);
  }
  while ((_DWORD)v8 != 7);
  if (!v48[3]
    || (v14 = *(_QWORD *)(a1 + 40),
        v15 = *(unsigned int *)(a1 + 88),
        v16 = v52[3],
        v37.receiver = *(id *)(a1 + 72),
        v37.super_class = (Class)&OBJC_METACLASS___ML3Track,
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSendSuper2(&v37, sel_deleteFromLibrary_deletionType_persistentIDs_count_, v14, v15, v16)) != 0))
  {
    v17 = *(_QWORD **)(a1 + 80);
    if (v17)
      *v17 = 0;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = *(id *)(a1 + 48);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v55, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v34;
      v21 = *MEMORY[0x1E0CB2AF0];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v18);
          if (*(_QWORD *)(a1 + 80))
          {
            objc_msgSend(*(id *)(a1 + 56), "attributesOfItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKey:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "longLongValue");

            v26 = *(_QWORD **)(a1 + 80);
            if (v26)
              *v26 += v25;
          }
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v55, 16);
      }
      while (v19);
    }

    v29[2]();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2_1690;
    v31[3] = &unk_1E5B64F90;
    v32 = *(id *)(a1 + 40);
    objc_msgSend(v30, "enqueueBlockForTransactionCommit:", v31);
    v27 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0;

  }
  else
  {
LABEL_24:
    v29[2]();
    v27 = 0;
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v27;
}

void __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_1692(uint64_t a1)
{
  ML3DeleteAssetsAtPaths(*(void **)(a1 + 32));
}

void __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5)
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  if (a4)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  else
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = a5;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "Deleting track that is not from the cloud with persistent-id: %lld", (uint8_t *)&v12, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
              + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))++) = a5;
  }

}

void __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_1686(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

uint64_t __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2_1690(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyNonContentsPropertyDidChange");
}

void __74__ML3Track_populateSortOrdersOfPropertyValues_inLibrary_cachedNameOrders___block_invoke(id *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(a1[4], "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && *a4)
  {
    v10 = a4 + 1;
    while (1)
    {
      objc_msgSend(a1[4], "objectForKey:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "integerValue") >= 1)
      {
        objc_msgSend(v11, "stringValue");
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
        break;
      }

      if (!*v10++)
        goto LABEL_2;
    }
    if (v11)
    {
      objc_msgSend(a1[5], "objectForKey:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        v16 = objc_msgSend(v14, "ML3NameOrderValue");
      else
        v16 = objc_msgSend(a1[6], "nameOrderForString:", v11);
      v18 = v17;
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138543618;
          v25 = v7;
          v26 = 2114;
          v27 = v11;
          _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "Could not find sort order for %{public}@ of %{public}@", (uint8_t *)&v24, 0x16u);
        }

      }
      else
      {
        v20 = a1[4];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v21, v7);

        if (v8)
        {
          v22 = a1[4];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v23, v8);

        }
      }

    }
  }
LABEL_2:

}

uint64_t __50__ML3Track_trackWithPersistentID_existsInLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "trackWithPersistentID:existsInLibraryWithConnection:", *(_QWORD *)(a1 + 48), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __65__ML3Track_removeFromMyLibrary_deletionType_persistentIDs_count___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v11[4];
  NSObject *v12;

  v3 = a2;
  v4 = dispatch_semaphore_create(0);
  +[ML3Track _writeSyncDeletesToPlistWithLibrary:forPersistentIDs:](ML3Track, "_writeSyncDeletesToPlistWithLibrary:forPersistentIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = 2;
  v6 = MEMORY[0x1E0C809B0];
  do
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __65__ML3Track_removeFromMyLibrary_deletionType_persistentIDs_count___block_invoke_2;
    v11[3] = &unk_1E5B65E90;
    v9 = v4;
    v12 = v9;
    objc_msgSend(v7, "removeTracksWithPersistentIDs:fromSource:usingConnection:withCompletionHandler:", v8, v5, v3, v11);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

    v5 = (v5 + 1);
  }
  while ((_DWORD)v5 != 6);

  return 1;
}

intptr_t __65__ML3Track_removeFromMyLibrary_deletionType_persistentIDs_count___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __103__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

void __103__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke_1660(uint64_t a1)
{
  ML3DeleteAssetsAtPaths(*(void **)(a1 + 32));
}

uint64_t __87__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "deleteFromLibrary:deletionType:canonicalizeCollections:persistentIDs:count:usingConnection:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 72), *(unsigned __int8 *)(a1 + 76), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a2);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __63__ML3Track_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "deleteFromLibrary:deletionType:canonicalizeCollections:persistentIDs:count:usingConnection:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 72), 1, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a2);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

+ (id)predicateByOptimizingComparisonPredicate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  objc_msgSend(v4, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("((item.media_type & 1024) = 1024)"));

  v7 = v4;
  if (!v6)
  {
    objc_msgSend(v4, "property");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("((item.media_type & 260)!=0)"));

    v7 = v4;
    if (v10)
    {
      v8 = 260;
      goto LABEL_9;
    }
    objc_msgSend(v4, "property");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("((item.media_type & 4128)!=0)"));

    v7 = v4;
    if (v12)
    {
      v8 = 4128;
      goto LABEL_9;
    }
    objc_msgSend(v4, "property");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("(((item.media_type & ~65280) = 0) OR (item.media_type = 1032))"));

    v7 = v4;
    if (v14)
    {
      v8 = 65280;
      goto LABEL_9;
    }
    objc_msgSend(v4, "property");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("media_type"));

    if (!v19)
    {
LABEL_22:
      v29.receiver = a1;
      v29.super_class = (Class)&OBJC_METACLASS___ML3Track;
      objc_msgSendSuper2(&v29, sel_predicateByOptimizingComparisonPredicate_, v4);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v20 = objc_msgSend(v4, "comparison");
    objc_msgSend(v4, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    if (v20 == 2)
    {
      objc_msgSend(v4, "property");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", v23, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "predicateByOptimizingComparisonPredicate:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3UnaryPredicate predicateWithPredicate:](ML3NegationPredicate, "predicateWithPredicate:", v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    if (!(_DWORD)v22)
    {
      +[ML3TruthPredicate falsePredicate](ML3TruthPredicate, "falsePredicate");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if ((_DWORD)v22 == 0xFFFFFF)
    {
      +[ML3TruthPredicate truePredicate](ML3TruthPredicate, "truePredicate");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v20 != 10)
    {
      if (v20 == 1)
      {
        v15 = v4;
        goto LABEL_10;
      }
      goto LABEL_22;
    }
    if ((_DWORD)v22 == 32)
    {
      v26 = &unk_1E5BAA548;
    }
    else if ((v22 & 0xFFFFF7FF) == 0x1000)
    {
      v26 = &unk_1E5BAA560;
    }
    else if ((_DWORD)v22 == 4128)
    {
      v26 = &unk_1E5BAA578;
    }
    else if ((_DWORD)v22 == 4)
    {
      v26 = &unk_1E5BAA590;
    }
    else if ((v22 & 0xFFFFF7FF) == 0x100)
    {
      v26 = &unk_1E5BAA5A8;
    }
    else
    {
      if ((_DWORD)v22 != 260)
      {
LABEL_37:
        _containmentMediaTypeMasksPredicateForMediaTypeMask(v22);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v26 = &unk_1E5BAA5C0;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      +[ML3ContainmentPredicate predicateWithProperty:values:](ML3ContainmentPredicate, "predicateWithProperty:values:", CFSTR("media_type"), v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    goto LABEL_37;
  }
  v8 = 1024;
LABEL_9:
  _containmentPredicateForIsMediaTypePredicate(v7, v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v16 = v15;
LABEL_11:

  return v16;
}

+ (id)orderingTermsForITTGTrackOrder:(unsigned int)a3 descending:(BOOL)a4
{
  _BOOL4 v5;
  void *v6;
  ML3OrderingTerm *v7;
  uint64_t v8;
  NSObject *v9;
  ML3OrderingTerm *v10;
  ML3OrderingTerm *v11;
  ML3OrderingTerm *v12;
  ML3OrderingTerm *v13;
  ML3OrderingTerm *v14;
  void *v15;
  _QWORD *v16;
  ML3OrderingTerm *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  ML3OrderingTerm *v21;
  uint64_t v22;
  ML3OrderingTerm *v23;
  uint64_t v24;
  ML3OrderingTerm *v25;
  uint64_t v26;
  void *v27;
  NSObject **v28;
  const char *v29;
  ML3OrderingTerm *v30;
  uint64_t v31;
  ML3OrderingTerm *v32;
  ML3OrderingTerm *v33;
  ML3OrderingTerm *v34;
  ML3OrderingTerm *v35;
  ML3OrderingTerm *v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  ML3OrderingTerm *v40;
  uint64_t v41;
  ML3OrderingTerm *v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;
  ML3OrderingTerm *v46;
  uint64_t v47;
  ML3OrderingTerm *v48;
  uint64_t v49;
  ML3OrderingTerm *v50;
  uint64_t v51;
  ML3OrderingTerm *v52;
  uint64_t v53;
  ML3OrderingTerm *v54;
  uint64_t v55;
  ML3OrderingTerm *v56;
  uint64_t v57;
  ML3OrderingTerm *v58;
  uint64_t v59;
  ML3OrderingTerm *v60;
  uint64_t v61;
  uint64_t v62;
  ML3OrderingTerm *v63;
  uint64_t v64;
  ML3OrderingTerm *v65;
  uint64_t v66;
  uint64_t v67;
  ML3OrderingTerm *v68;
  uint64_t v69;
  uint64_t v70;
  ML3OrderingTerm *v71;
  uint64_t v72;
  uint64_t v73;
  ML3OrderingTerm *v74;
  uint64_t v75;
  ML3OrderingTerm *v76;
  uint64_t v77;
  uint64_t v78;
  ML3OrderingTerm *v79;
  uint64_t v80;
  uint64_t v81;
  ML3OrderingTerm *v82;
  uint64_t v83;
  uint64_t v84;
  ML3OrderingTerm *v85;
  uint64_t v86;
  uint64_t v87;
  ML3OrderingTerm *v88;
  uint64_t v89;
  uint64_t v90;
  ML3OrderingTerm *v91;
  uint64_t v92;
  ML3OrderingTerm *v93;
  void *v94;
  _QWORD *v95;
  ML3OrderingTerm *v96;
  uint64_t v97;
  ML3OrderingTerm *v98;
  uint64_t v99;
  ML3OrderingTerm *v100;
  uint64_t v101;
  ML3OrderingTerm *v102;
  uint64_t v103;
  ML3OrderingTerm *v104;
  uint64_t v105;
  uint64_t v106;
  ML3OrderingTerm *v107;
  uint64_t v108;
  uint64_t v109;
  ML3OrderingTerm *v110;
  uint64_t v111;
  ML3OrderingTerm *v112;
  uint64_t v113;
  ML3OrderingTerm *v114;
  uint64_t v115;
  ML3OrderingTerm *v116;
  uint64_t v117;
  uint64_t v118;
  ML3OrderingTerm *v119;
  uint64_t v120;
  uint64_t v121;
  ML3OrderingTerm *v122;
  uint64_t v123;
  uint64_t v124;
  ML3OrderingTerm *v125;
  ML3OrderingTerm *v126;
  ML3OrderingTerm *v127;
  ML3OrderingTerm *v128;
  ML3OrderingTerm *v129;
  ML3OrderingTerm *v130;
  ML3OrderingTerm *v131;
  ML3OrderingTerm *v132;
  void *v133;
  _QWORD *v134;
  ML3OrderingTerm *v135;
  uint64_t v136;
  uint64_t v137;
  ML3OrderingTerm *v138;
  uint64_t v139;
  uint64_t v140;
  ML3OrderingTerm *v141;
  ML3OrderingTerm *v142;
  ML3OrderingTerm *v143;
  ML3OrderingTerm *v144;
  ML3OrderingTerm *v145;
  uint64_t v146;
  ML3OrderingTerm *v147;
  uint64_t v148;
  uint64_t v149;
  ML3OrderingTerm *v150;
  uint64_t v151;
  ML3OrderingTerm *v152;
  uint64_t v153;
  ML3OrderingTerm *v154;
  uint64_t v155;
  ML3OrderingTerm *v156;
  uint64_t v157;
  ML3OrderingTerm *v158;
  uint64_t v159;
  uint64_t v160;
  ML3OrderingTerm *v162;
  uint64_t v163;
  ML3OrderingTerm *v164;
  ML3OrderingTerm *v165;
  ML3OrderingTerm *v166;
  uint8_t buf[4];
  unsigned int v168;
  NSObject *v169;
  _QWORD v170[6];
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[2];
  NSObject *v174;
  _QWORD v175[2];
  _QWORD v176[7];
  _QWORD v177[12];
  _QWORD v178[12];
  _QWORD v179[12];
  _QWORD v180[7];
  _QWORD v181[6];
  _QWORD v182[2];
  _QWORD v183[5];
  _QWORD v184[6];
  _QWORD v185[5];
  _QWORD v186[6];
  _QWORD v187[2];
  NSObject *v188;
  _QWORD v189[6];
  _QWORD v190[6];
  _QWORD v191[2];
  _QWORD v192[2];
  _QWORD v193[4];
  _QWORD v194[4];
  _QWORD v195[2];
  _QWORD v196[2];
  _QWORD v197[2];
  _QWORD v198[6];
  _QWORD v199[6];
  _QWORD v200[6];
  _QWORD v201[6];
  _QWORD v202[5];
  _QWORD v203[2];
  _QWORD v204[6];
  _QWORD v205[6];
  _QWORD v206[6];
  _QWORD v207[2];
  _QWORD v208[3];
  _QWORD v209[2];
  _QWORD v210[5];
  _QWORD v211[2];
  _QWORD v212[7];
  _QWORD v213[6];
  _QWORD v214[5];
  _QWORD v215[5];
  _QWORD v216[5];
  _QWORD v217[6];
  _QWORD v218[8];

  v218[6] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = 0;
  switch(a3)
  {
    case 0u:
    case 1u:
    case 2u:
      return v6;
    case 3u:
      v25 = [ML3OrderingTerm alloc];
      if (v5)
        v26 = 2;
      else
        v26 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v25, "initWithProperty:direction:", CFSTR("ROWID"), v26);
      v188 = v9;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = &v188;
      goto LABEL_275;
    case 5u:
      v30 = [ML3OrderingTerm alloc];
      if (v5)
        v31 = 2;
      else
        v31 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v30, "initWithProperty:direction:", CFSTR("title_order"), v31);
      v218[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v31);
      v218[1] = v10;
      v32 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v31);
      v218[2] = v32;
      v33 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v31);
      v218[3] = v33;
      v34 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v31);
      v218[4] = v34;
      v35 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v31);
      v218[5] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v218, 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_268;
    case 6u:
    case 0x22u:
      v7 = [ML3OrderingTerm alloc];
      if (v5)
        v8 = 2;
      else
        v8 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v7, "initWithProperty:direction:", CFSTR("album_order"), v8);
      v217[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_artist_order"), v8);
      v217[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v8);
      v217[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v8);
      v217[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v8);
      v217[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v8);
      v217[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v217;
      goto LABEL_263;
    case 7u:
    case 0x20u:
      v17 = [ML3OrderingTerm alloc];
      if (v5)
        v18 = 2;
      else
        v18 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v17, "initWithProperty:direction:", CFSTR("item_artist_order"), v18);
      v216[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v18);
      v216[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v18);
      v216[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v18);
      v216[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v18);
      v216[4] = v13;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = v216;
      goto LABEL_178;
    case 8u:
      v36 = [ML3OrderingTerm alloc];
      if (v5)
        v37 = 2;
      else
        v37 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v36, "initWithProperty:direction:", CFSTR("item_playback.bit_rate"), v37);
      v197[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v37);
      v197[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v197;
      goto LABEL_255;
    case 9u:
    case 0x23u:
      v21 = [ML3OrderingTerm alloc];
      if (v5)
        v22 = 2;
      else
        v22 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v21, "initWithProperty:direction:", CFSTR("genre_order"), v22);
      v213[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v22);
      v213[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v22);
      v213[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v22);
      v213[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v22);
      v213[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v22);
      v213[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v213;
      goto LABEL_263;
    case 0xAu:
      v40 = [ML3OrderingTerm alloc];
      if (v5)
        v41 = 2;
      else
        v41 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v40, "initWithProperty:direction:", CFSTR("item_extra.media_kind"), v41);
      v195[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v41);
      v195[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v195;
      goto LABEL_255;
    case 0xCu:
      v42 = [ML3OrderingTerm alloc];
      if (v5)
        v43 = 2;
      else
        v43 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v42, "initWithProperty:direction:", CFSTR("track_number"), v43);
      v194[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v43);
      v194[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v43);
      v194[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v43);
      v194[3] = v12;
      v44 = (void *)MEMORY[0x1E0C99D20];
      v45 = v194;
      goto LABEL_104;
    case 0xDu:
      v46 = [ML3OrderingTerm alloc];
      if (v5)
        v47 = 2;
      else
        v47 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v46, "initWithProperty:direction:", CFSTR("item_extra.file_size"), v47);
      v192[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v47);
      v192[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v192;
      goto LABEL_255;
    case 0xEu:
      v48 = [ML3OrderingTerm alloc];
      if (v5)
        v49 = 2;
      else
        v49 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v48, "initWithProperty:direction:", CFSTR("item_extra.file_size"), v49);
      v191[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v49);
      v191[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v191;
      goto LABEL_255;
    case 0xFu:
      v50 = [ML3OrderingTerm alloc];
      if (v5)
        v51 = 2;
      else
        v51 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v50, "initWithProperty:direction:", CFSTR("item_extra.year"), v51);
      v190[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v51);
      v190[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v51);
      v190[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v51);
      v190[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v51);
      v190[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v51);
      v190[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v190;
      goto LABEL_263;
    case 0x10u:
      v52 = [ML3OrderingTerm alloc];
      if (v5)
        v53 = 2;
      else
        v53 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v52, "initWithProperty:direction:", CFSTR("item_playback.sample_rate"), v53);
      v196[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v53);
      v196[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v196;
      goto LABEL_255;
    case 0x11u:
      v54 = [ML3OrderingTerm alloc];
      if (v5)
        v55 = 2;
      else
        v55 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v54, "initWithProperty:direction:", CFSTR("category.category"), v55);
      v187[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v55);
      v187[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v187;
      goto LABEL_255;
    case 0x14u:
      v56 = [ML3OrderingTerm alloc];
      if (v5)
        v57 = 2;
      else
        v57 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v56, "initWithProperty:direction:", CFSTR("item_extra.description"), v57);
      v182[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v57);
      v182[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v182;
      goto LABEL_255;
    case 0x15u:
      v58 = [ML3OrderingTerm alloc];
      if (v5)
        v59 = 2;
      else
        v59 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v58, "initWithProperty:direction:", CFSTR("item_extra.comment"), v59);
      v211[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v59);
      v211[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v211;
      goto LABEL_255;
    case 0x16u:
      v60 = [ML3OrderingTerm alloc];
      if (v5)
        v61 = 2;
      else
        v61 = 1;
      if (v5)
        v62 = 1;
      else
        v62 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v60, "initWithProperty:direction:", CFSTR("date_added"), v61);
      v203[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v62);
      v203[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v203;
      goto LABEL_255;
    case 0x17u:
      v63 = [ML3OrderingTerm alloc];
      if (v5)
        v64 = 2;
      else
        v64 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v63, "initWithProperty:direction:", CFSTR("item_playback.eq_preset"), v64);
      v207[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v64);
      v207[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v207;
      goto LABEL_255;
    case 0x18u:
    case 0x24u:
      v23 = [ML3OrderingTerm alloc];
      if (v5)
        v24 = 2;
      else
        v24 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v23, "initWithProperty:direction:", CFSTR("composer_order"), v24);
      v214[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v24);
      v214[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v24);
      v214[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v24);
      v214[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v24);
      v214[4] = v13;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = v214;
      goto LABEL_178;
    case 0x19u:
      v65 = [ML3OrderingTerm alloc];
      if (v5)
        v66 = 2;
      else
        v66 = 1;
      if (v5)
        v67 = 1;
      else
        v67 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v65, "initWithProperty:direction:", CFSTR("item_playback.volume_normalization_energy"), v66);
      v189[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v67);
      v189[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v67);
      v189[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v67);
      v189[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v67);
      v189[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v67);
      v189[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v189;
      goto LABEL_263;
    case 0x1Au:
      v68 = [ML3OrderingTerm alloc];
      if (v5)
        v69 = 2;
      else
        v69 = 1;
      if (v5)
        v70 = 1;
      else
        v70 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v68, "initWithProperty:direction:", CFSTR("item_stats.play_count_user"), v69);
      v204[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v70);
      v204[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v70);
      v204[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v70);
      v204[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v70);
      v204[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v70);
      v204[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v204;
      goto LABEL_263;
    case 0x1Bu:
      v71 = [ML3OrderingTerm alloc];
      if (v5)
        v72 = 2;
      else
        v72 = 1;
      if (v5)
        v73 = 1;
      else
        v73 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v71, "initWithProperty:direction:", CFSTR("item_stats.date_played"), v72);
      v205[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v73);
      v205[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v73);
      v205[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v73);
      v205[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v73);
      v205[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v73);
      v205[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v205;
      goto LABEL_263;
    case 0x1Cu:
      v74 = [ML3OrderingTerm alloc];
      if (v5)
        v75 = 2;
      else
        v75 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v74, "initWithProperty:direction:", CFSTR("disc_number"), v75);
      v193[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v75);
      v193[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v75);
      v193[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v75);
      v193[3] = v12;
      v44 = (void *)MEMORY[0x1E0C99D20];
      v45 = v193;
LABEL_104:
      objc_msgSend(v44, "arrayWithObjects:count:", v45, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_266;
    case 0x1Du:
      v76 = [ML3OrderingTerm alloc];
      if (v5)
        v77 = 2;
      else
        v77 = 1;
      if (v5)
        v78 = 1;
      else
        v78 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v76, "initWithProperty:direction:", CFSTR("item_stats.user_rating"), v77);
      v206[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v78);
      v206[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v78);
      v206[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v78);
      v206[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v78);
      v206[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v78);
      v206[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v206;
      goto LABEL_263;
    case 0x1Eu:
      v79 = [ML3OrderingTerm alloc];
      if (v5)
        v80 = 2;
      else
        v80 = 1;
      if (v5)
        v81 = 1;
      else
        v81 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v79, "initWithProperty:direction:", CFSTR("is_compilation"), v80);
      v185[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v81);
      v185[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v81);
      v185[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v81);
      v185[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v81);
      v185[4] = v13;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = v185;
      goto LABEL_178;
    case 0x1Fu:
      v82 = [ML3OrderingTerm alloc];
      if (v5)
        v83 = 2;
      else
        v83 = 1;
      if (v5)
        v84 = 1;
      else
        v84 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v82, "initWithProperty:direction:", CFSTR("genre_order"), v83);
      v184[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("is_compilation"), v83);
      v184[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v84);
      v184[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v84);
      v184[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v84);
      v184[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v84);
      v184[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v184;
      goto LABEL_263;
    case 0x28u:
      v85 = [ML3OrderingTerm alloc];
      if (v5)
        v86 = 2;
      else
        v86 = 1;
      if (v5)
        v87 = 1;
      else
        v87 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v85, "initWithProperty:direction:", CFSTR("item_store.date_released"), v86);
      v183[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v87);
      v183[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v87);
      v183[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v87);
      v183[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v87);
      v183[4] = v13;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = v183;
      goto LABEL_178;
    case 0x29u:
      v88 = [ML3OrderingTerm alloc];
      if (v5)
        v89 = 2;
      else
        v89 = 1;
      if (v5)
        v90 = 1;
      else
        v90 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v88, "initWithProperty:direction:", CFSTR("item_extra.bpm"), v89);
      v186[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v90);
      v186[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v90);
      v186[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v90);
      v186[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v90);
      v186[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v90);
      v186[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v186;
      goto LABEL_263;
    case 0x2Bu:
      v91 = [ML3OrderingTerm alloc];
      if (v5)
        v92 = 2;
      else
        v92 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v91, "initWithProperty:direction:", CFSTR("item_extra.grouping"), v92);
      v212[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v92);
      v212[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_artist_order"), v92);
      v212[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v92);
      v212[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v92);
      v212[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v92);
      v212[5] = v14;
      v93 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v92);
      v212[6] = v93;
      v94 = (void *)MEMORY[0x1E0C99D20];
      v95 = v212;
      goto LABEL_205;
    case 0x2Cu:
      v96 = [ML3OrderingTerm alloc];
      if (v5)
        v97 = 2;
      else
        v97 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v96, "initWithProperty:direction:", CFSTR("series_name_order"), v97);
      v210[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_video.season_number"), v97);
      v210[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("episode_sort_id"), v97);
      v210[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_video.episode_id"), v97);
      v210[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v97);
      v210[4] = v13;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = v210;
      goto LABEL_178;
    case 0x2Du:
      v98 = [ML3OrderingTerm alloc];
      if (v5)
        v99 = 2;
      else
        v99 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v98, "initWithProperty:direction:", CFSTR("item_video.season_number"), v99);
      v202[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("series_name_order"), v99);
      v202[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("episode_sort_id"), v99);
      v202[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_video.episode_id"), v99);
      v202[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v99);
      v202[4] = v13;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = v202;
      goto LABEL_178;
    case 0x2Eu:
      v100 = [ML3OrderingTerm alloc];
      if (v5)
        v101 = 2;
      else
        v101 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v100, "initWithProperty:direction:", CFSTR("item_video.episode_id"), v101);
      v209[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v101);
      v209[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v209;
      goto LABEL_255;
    case 0x2Fu:
      v102 = [ML3OrderingTerm alloc];
      if (v5)
        v103 = 2;
      else
        v103 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v102, "initWithProperty:direction:", CFSTR("episode_sort_id"), v103);
      v208[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_video.episode_id"), v103);
      v208[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v103);
      v208[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v208, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_267;
    case 0x31u:
      v104 = [ML3OrderingTerm alloc];
      if (v5)
        v105 = 2;
      else
        v105 = 1;
      if (v5)
        v106 = 1;
      else
        v106 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v104, "initWithProperty:direction:", CFSTR("item_stats.skip_count_user"), v105);
      v201[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v106);
      v201[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v106);
      v201[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v106);
      v201[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v106);
      v201[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v106);
      v201[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v201;
      goto LABEL_263;
    case 0x32u:
      v107 = [ML3OrderingTerm alloc];
      if (v5)
        v108 = 2;
      else
        v108 = 1;
      if (v5)
        v109 = 1;
      else
        v109 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v107, "initWithProperty:direction:", CFSTR("item_stats.date_skipped"), v108);
      v200[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v109);
      v200[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v109);
      v200[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v109);
      v200[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v109);
      v200[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v109);
      v200[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v200;
      goto LABEL_263;
    case 0x33u:
      v110 = [ML3OrderingTerm alloc];
      if (v5)
        v111 = 2;
      else
        v111 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v110, "initWithProperty:direction:", CFSTR("album_artist_order"), v111);
      v215[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v111);
      v215[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v111);
      v215[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v111);
      v215[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v111);
      v215[4] = v13;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = v215;
LABEL_178:
      objc_msgSend(v19, "arrayWithObjects:count:", v20, 5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_265;
    case 0x34u:
      v112 = [ML3OrderingTerm alloc];
      if (v5)
        v113 = 2;
      else
        v113 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v112, "initWithProperty:direction:", CFSTR("item_artist_order"), v113);
      v198[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_extra.year"), v113);
      v198[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v113);
      v198[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v113);
      v198[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v113);
      v198[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v113);
      v198[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v198;
      goto LABEL_263;
    case 0x35u:
      v114 = [ML3OrderingTerm alloc];
      if (v5)
        v115 = 2;
      else
        v115 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v114, "initWithProperty:direction:", CFSTR("item_artist_order"), v115);
      v199[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v115);
      v199[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v115);
      v199[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v115);
      v199[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v115);
      v199[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v115);
      v199[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v199;
      goto LABEL_263;
    case 0x36u:
      v116 = [ML3OrderingTerm alloc];
      if (v5)
        v117 = 2;
      else
        v117 = 1;
      if (v5)
        v118 = 1;
      else
        v118 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v116, "initWithProperty:direction:", CFSTR("album.user_rating"), v117);
      v181[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v118);
      v181[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v118);
      v181[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v118);
      v181[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v118);
      v181[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v118);
      v181[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v181;
      goto LABEL_263;
    case 0x37u:
      _ML3LogCategoryDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_197;
      *(_DWORD *)buf = 67109120;
      v168 = 55;
      v29 = "Unsupported order type: %u";
      goto LABEL_196;
    case 0x38u:
      v119 = [ML3OrderingTerm alloc];
      if (v5)
        v120 = 2;
      else
        v120 = 1;
      if (v5)
        v121 = 1;
      else
        v121 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v119, "initWithProperty:direction:", CFSTR("composer_order"), v120);
      v180[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v121);
      v180[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_artist_order"), v121);
      v180[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v121);
      v180[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v121);
      v180[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v121);
      v180[5] = v14;
      v93 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v121);
      v180[6] = v93;
      v94 = (void *)MEMORY[0x1E0C99D20];
      v95 = v180;
LABEL_205:
      objc_msgSend(v94, "arrayWithObjects:count:", v95, 7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_264;
    case 0x39u:
      v122 = [ML3OrderingTerm alloc];
      if (v5)
        v123 = 2;
      else
        v123 = 1;
      if (v5)
        v124 = 1;
      else
        v124 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v122, "initWithProperty:direction:", CFSTR("category.category"), v123);
      v179[0] = v9;
      v166 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v124);
      v179[1] = v166;
      v165 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_artist_order"), v124);
      v179[2] = v165;
      v164 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v124);
      v179[3] = v164;
      v125 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v124);
      v179[4] = v125;
      v126 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v124);
      v179[5] = v126;
      v127 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v124);
      v179[6] = v127;
      v128 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v124);
      v179[7] = v128;
      v129 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v124);
      v179[8] = v129;
      v130 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v124);
      v179[9] = v130;
      v131 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v124);
      v179[10] = v131;
      v132 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v124);
      v179[11] = v132;
      v133 = (void *)MEMORY[0x1E0C99D20];
      v134 = v179;
      goto LABEL_238;
    case 0x3Au:
      v135 = [ML3OrderingTerm alloc];
      if (v5)
        v136 = 2;
      else
        v136 = 1;
      if (v5)
        v137 = 1;
      else
        v137 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v135, "initWithProperty:direction:", CFSTR("genre_order"), v136);
      v177[0] = v9;
      v166 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v137);
      v177[1] = v166;
      v165 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_artist_order"), v137);
      v177[2] = v165;
      v164 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v137);
      v177[3] = v164;
      v125 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v137);
      v177[4] = v125;
      v126 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v137);
      v177[5] = v126;
      v127 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v137);
      v177[6] = v127;
      v128 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v137);
      v177[7] = v128;
      v129 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v137);
      v177[8] = v129;
      v130 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v137);
      v177[9] = v130;
      v131 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v137);
      v177[10] = v131;
      v132 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v137);
      v177[11] = v132;
      v133 = (void *)MEMORY[0x1E0C99D20];
      v134 = v177;
      goto LABEL_238;
    case 0x3Bu:
      v138 = [ML3OrderingTerm alloc];
      if (v5)
        v139 = 2;
      else
        v139 = 1;
      if (v5)
        v140 = 1;
      else
        v140 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v138, "initWithProperty:direction:", CFSTR("genre_order"), v139);
      v176[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v139);
      v176[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v140);
      v176[2] = v11;
      v141 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v140);
      v176[3] = v141;
      v142 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v140);
      v176[4] = v142;
      v143 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v140);
      v176[5] = v143;
      v144 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v140);
      v176[6] = v144;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_267;
    case 0x3Cu:
      v145 = [ML3OrderingTerm alloc];
      if (v5)
        v146 = 2;
      else
        v146 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v145, "initWithProperty:direction:", CFSTR("item_extra.genius_id"), v146);
      v175[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v146);
      v175[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v175;
      goto LABEL_255;
    case 0x3Du:
      v147 = [ML3OrderingTerm alloc];
      if (v5)
        v148 = 2;
      else
        v148 = 1;
      if (v5)
        v149 = 1;
      else
        v149 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v147, "initWithProperty:direction:", CFSTR("item_store.feed_url"), v148);
      v178[0] = v9;
      v166 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v149);
      v178[1] = v166;
      v165 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_artist_order"), v149);
      v178[2] = v165;
      v164 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v149);
      v178[3] = v164;
      v125 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v149);
      v178[4] = v125;
      v126 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v149);
      v178[5] = v126;
      v127 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v149);
      v178[6] = v127;
      v128 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v149);
      v178[7] = v128;
      v129 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v149);
      v178[8] = v129;
      v130 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v149);
      v178[9] = v130;
      v131 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v149);
      v178[10] = v131;
      v132 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v149);
      v178[11] = v132;
      v133 = (void *)MEMORY[0x1E0C99D20];
      v134 = v178;
LABEL_238:
      objc_msgSend(v133, "arrayWithObjects:count:", v134, 12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 0x3Eu:
      v150 = [ML3OrderingTerm alloc];
      if (v5)
        v151 = 2;
      else
        v151 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v150, "initWithProperty:direction:", CFSTR("item_store.store_item_id"), v151);
      v174 = v9;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = &v174;
      goto LABEL_275;
    case 0x43u:
      v152 = [ML3OrderingTerm alloc];
      if (v5)
        v153 = 2;
      else
        v153 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v152, "initWithProperty:direction:", CFSTR("item_extra.is_user_disabled"), v153);
      v171[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v153);
      v171[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v171;
      goto LABEL_255;
    case 0x46u:
      v154 = [ML3OrderingTerm alloc];
      if (v5)
        v155 = 2;
      else
        v155 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v154, "initWithProperty:direction:", CFSTR("item_store.store_saga_id"), v155);
      v173[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v155);
      v173[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v173;
      goto LABEL_255;
    case 0x47u:
      v156 = [ML3OrderingTerm alloc];
      if (v5)
        v157 = 2;
      else
        v157 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v156, "initWithProperty:direction:", CFSTR("item_store.account_id"), v157);
      v172[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v157);
      v172[1] = v10;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v172;
LABEL_255:
      objc_msgSend(v38, "arrayWithObjects:count:", v39, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_268;
    case 0x48u:
      v158 = [ML3OrderingTerm alloc];
      if (v5)
        v159 = 2;
      else
        v159 = 1;
      if (v5)
        v160 = 1;
      else
        v160 = 2;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v158, "initWithProperty:direction:", CFSTR("item_store.cloud_status"), v159);
      v170[0] = v9;
      v10 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("item_artist_order"), v160);
      v170[1] = v10;
      v11 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("album_order"), v160);
      v170[2] = v11;
      v12 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("disc_number"), v160);
      v170[3] = v12;
      v13 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("track_number"), v160);
      v170[4] = v13;
      v14 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", CFSTR("title_order"), v160);
      v170[5] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v170;
LABEL_263:
      objc_msgSend(v15, "arrayWithObjects:count:", v16, 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_264:

LABEL_265:
LABEL_266:

LABEL_267:
LABEL_268:

      break;
    case 0x70u:
      v162 = [ML3OrderingTerm alloc];
      if (v5)
        v163 = 2;
      else
        v163 = 1;
      v9 = -[ML3OrderingTerm initWithProperty:direction:](v162, "initWithProperty:direction:", CFSTR("item_stats.liked_state_changed_date"), v163);
      v169 = v9;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = &v169;
LABEL_275:
      objc_msgSend(v27, "arrayWithObjects:count:", v28, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      _ML3LogCategoryDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v168 = a3;
        v29 = "Unexpected order type: %u";
LABEL_196:
        _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, v29, buf, 8u);
      }
LABEL_197:
      v6 = 0;
      break;
  }

  return v6;
}

+ (id)containerQueryWithContainer:(id)a3
{
  id v4;
  ML3ContainerQuery *v5;

  v4 = a3;
  v5 = -[ML3ContainerQuery initWithEntityClass:container:predicate:orderingTerms:]([ML3ContainerQuery alloc], "initWithEntityClass:container:predicate:orderingTerms:", a1, v4, 0, 0);

  return v5;
}

+ (id)containerQueryWithContainer:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  ML3ContainerQuery *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[ML3ContainerQuery initWithEntityClass:container:predicate:orderingTerms:]([ML3ContainerQuery alloc], "initWithEntityClass:container:predicate:orderingTerms:", a1, v7, v6, 0);

  return v8;
}

+ (id)containerQueryWithContainer:(id)a3 predicate:(id)a4 orderingTerms:(id)a5
{
  id v8;
  id v9;
  id v10;
  ML3ContainerQuery *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[ML3ContainerQuery initWithEntityClass:container:predicate:orderingTerms:]([ML3ContainerQuery alloc], "initWithEntityClass:container:predicate:orderingTerms:", a1, v10, v9, v8);

  return v11;
}

- (BOOL)populateArtworkCacheWithArtworkData:(id)a3
{
  id v4;
  ML3ArtworkTokenSet *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  char v10;
  NSObject *v11;
  int v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[ML3ArtworkTokenSet initWithEntity:artworkType:]([ML3ArtworkTokenSet alloc], "initWithEntity:artworkType:", self, 1);
    -[ML3ArtworkTokenSet artworkTokenForSource:](v5, "artworkTokenForSource:", 500);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("media_type"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
      v10 = objc_msgSend(WeakRetained, "importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:", v4, v6, 1, 500, v8);

    }
    else
    {
      v11 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = 134217984;
        v14 = -[ML3Entity persistentID](self, "persistentID");
        _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "Attempting to import store item artwork with invalid artwork token for item pid %lld", (uint8_t *)&v13, 0xCu);
      }

      v10 = 0;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)populateChapterDataWithImportChapters:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ML3Track_ML3TrackImporter__populateChapterDataWithImportChapters___block_invoke;
  v7[3] = &unk_1E5B62EB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "performDatabaseTransactionWithBlock:", v7);

}

- (void)populateLocationPropertiesWithPath:(id)a3
{
  -[ML3Track populateLocationPropertiesWithPath:protectionType:](self, "populateLocationPropertiesWithPath:protectionType:", a3, 0);
}

- (void)populateLocationPropertiesWithPath:(id)a3 isProtected:(BOOL)a4
{
  -[ML3Track populateLocationPropertiesWithPath:protectionType:](self, "populateLocationPropertiesWithPath:protectionType:", a3, a4);
}

- (void)populateLocationPropertiesWithPath:(id)a3 protectionType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  int64_t v13;

  v6 = a3;
  -[ML3Entity library](self, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__ML3Track_ML3TrackImporter__populateLocationPropertiesWithPath_protectionType___block_invoke;
  v10[3] = &unk_1E5B62EE0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v13 = a4;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "performDatabaseTransactionWithBlock:", v10);

}

- (void)populateLocationPropertiesWithPath:(id)a3 protectionType:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[ML3Entity library](self, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__ML3Track_ML3TrackImporter__populateLocationPropertiesWithPath_protectionType_completionBlock___block_invoke;
  v13[3] = &unk_1E5B62EE0;
  v13[4] = self;
  v14 = v8;
  v15 = v10;
  v16 = a4;
  v11 = v10;
  v12 = v8;
  objc_msgSend(v11, "performAsyncDatabaseWriteTransactionWithBlock:completionBlock:", v13, v9);

}

- (BOOL)_populateLocationPropertiesWithPath:(id)a3 protectionType:(int64_t)a4 fromLibrary:(id)a5 usingConnection:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  BOOL (*v22)(uint64_t);
  void *v23;
  ML3Track *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  SEL v29;
  int64_t v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v11, "length"))
    v15 = objc_msgSend(v14, "fileExistsAtPath:", v11) ^ 1;
  else
    v15 = 1;
  if (objc_msgSend(v11, "length") && v15)
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v11;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "populateLocationPropertiesWithPath called with invalid path '%{public}@'", buf, 0xCu);
    }

  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ML3Entity persistentID](self, "persistentID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Track clearLocationFromLibrary:persistentIDs:](ML3Track, "clearLocationFromLibrary:persistentIDs:", v12, v18);

  }
  else
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __109__ML3Track_ML3TrackImporter___populateLocationPropertiesWithPath_protectionType_fromLibrary_usingConnection___block_invoke;
    v23 = &unk_1E5B62F40;
    v24 = self;
    v25 = v14;
    v26 = v11;
    v29 = a2;
    v27 = v12;
    v30 = a4;
    v28 = v13;
    objc_msgSend(v28, "performTransactionWithBlock:", &v20);

  }
  -[ML3Track updateCollectionCloudStatus](self, "updateCollectionCloudStatus", v20, v21, v22, v23, v24);
  -[ML3Track updateIntegrity](self, "updateIntegrity");

  return 1;
}

BOOL __109__ML3Track_ML3TrackImporter___populateLocationPropertiesWithPath_protectionType_fromLibrary_usingConnection___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  uint64_t v58;
  int v59;
  char v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  void *v81;
  NSObject *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  _QWORD v88[2];
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  void *v98;
  _QWORD v99[11];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id v103;
  _QWORD v104[9];

  v104[7] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("keep_local");
  v104[0] = CFSTR("keep_local");
  v3 = CFSTR("keep_local_status");
  v104[1] = CFSTR("keep_local_status");
  v4 = CFSTR("keep_local_status_reason");
  v104[2] = CFSTR("keep_local_status_reason");
  v5 = CFSTR("(IFNULL(base_location.path, '') || '/' || item_extra.location)");
  v104[3] = CFSTR("(IFNULL(base_location.path, '') || '/' || item_extra.location)");
  v6 = CFSTR("item_store.key_id");
  v104[4] = CFSTR("item_store.key_id");
  v7 = CFSTR("media_type");
  v104[5] = CFSTR("media_type");
  v8 = CFSTR("(CASE WHEN LENGTH(IFNULL(chapter.chapter_data,'')) > 0 THEN 1 ELSE 0 END)");
  v104[6] = CFSTR("(CASE WHEN LENGTH(IFNULL(chapter.chapter_data,'')) > 0 THEN 1 ELSE 0 END)");
  v103 = 0;
  v101 = 0u;
  v102 = 0u;
  v100 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "getValues:forProperties:count:", &v100, v104, 7);
  v9 = CFSTR("base_location_id");
  v99[0] = CFSTR("base_location_id");
  v10 = CFSTR("item_extra.location");
  v99[1] = CFSTR("item_extra.location");
  v11 = CFSTR("item_extra.file_size");
  v99[2] = CFSTR("item_extra.file_size");
  v12 = CFSTR("item_stats.needs_restore");
  v99[3] = CFSTR("item_stats.needs_restore");
  v13 = CFSTR("keep_local");
  v99[4] = CFSTR("keep_local");
  v14 = CFSTR("keep_local_status");
  v99[5] = CFSTR("keep_local_status");
  v15 = CFSTR("keep_local_status_reason");
  v99[6] = CFSTR("keep_local_status_reason");
  v16 = CFSTR("item_store.is_protected");
  v99[7] = CFSTR("item_store.is_protected");
  v17 = CFSTR("item_stats.download_identifier");
  v99[8] = CFSTR("item_stats.download_identifier");
  v18 = CFSTR("item_stats.date_accessed");
  v99[9] = CFSTR("item_stats.date_accessed");
  v19 = CFSTR("date_downloaded");
  v99[10] = CFSTR("date_downloaded");
  v98 = 0;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v93 = 0u;
  v20 = *(void **)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 48);
  v87 = 0;
  objc_msgSend(v20, "attributesOfItemAtPath:error:", v21, &v87);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v87;
  if (v22)
  {
    objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0CB2B18]);
    v24 = objc_claimAutoreleasedReturnValue();
    v84 = v23;
    if (-[NSObject isEqualToString:](v24, "isEqualToString:", *MEMORY[0x1E0CB2B20]))
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", MSVGetDiskUsageForPath());
    else
      objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v25 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v94;
    *(_QWORD *)&v94 = v25;

    objc_msgSend(*(id *)(a1 + 48), "lastPathComponent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v28, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("ML3TrackImporter.m"), 460, CFSTR("populateLocationPropertiesWithPath passed file with invalid name '%@'"), v28);

    }
    v83 = v28;
    objc_storeStrong((id *)&v93 + 1, v28);
    v29 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "stringByDeletingLastPathComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "mediaFolderRelativePath:", v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v32 = *(_QWORD *)(a1 + 56);
    v85 = (void *)v31;
    +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("path"), v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity anyInLibrary:predicate:](ML3BaseLocation, "anyInLibrary:predicate:", v32, v33);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v85, CFSTR("path"), 0);
      v34 = +[ML3BaseLocation newWithDictionary:inLibrary:](ML3BaseLocation, "newWithDictionary:inLibrary:", v35, *(_QWORD *)(a1 + 56));

    }
    objc_msgSend(v34, "valueForProperty:", CFSTR("ROWID"));
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v93;
    *(_QWORD *)&v93 = v36;

    v38 = (void *)*((_QWORD *)&v94 + 1);
    *((_QWORD *)&v94 + 1) = MEMORY[0x1E0C9AAA0];

    v39 = (void *)v97;
    *(_QWORD *)&v97 = 0;

    if ((int)objc_msgSend((id)v93, "intValue") >= 250 && objc_msgSend((id)v100, "integerValue") <= 0)
    {
      if (objc_msgSend(*((id *)&v100 + 1), "integerValue") == 1 || (MSVDeviceIsWatch() & 1) != 0)
      {
        v41 = (void *)v95;
        *(_QWORD *)&v95 = &unk_1E5BAB4D8;
      }
      else
      {
        v41 = (void *)v95;
        *(_QWORD *)&v95 = &unk_1E5BAB4C0;
      }
    }
    else
    {
      v40 = (id)v100;
      v41 = (void *)v95;
      *(_QWORD *)&v95 = v40;
    }

    if ((int)objc_msgSend((id)v93, "intValue") <= 249)
      v42 = &unk_1E5BAB4D8;
    else
      v42 = &unk_1E5BAB4F0;
    objc_storeStrong((id *)&v95 + 1, v42);
    v43 = (void *)v96;
    *(_QWORD *)&v96 = &unk_1E5BAB508;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 80));
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)*((_QWORD *)&v96 + 1);
    *((_QWORD *)&v96 + 1) = v44;

    if (!*(_QWORD *)(a1 + 80))
    {
      v46 = (id)v102;
      if (objc_msgSend(v46, "integerValue"))
      {
        v47 = (void *)*((_QWORD *)&v96 + 1);
        *((_QWORD *)&v96 + 1) = &unk_1E5BAB520;

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)*((_QWORD *)&v97 + 1);
    *((_QWORD *)&v97 + 1) = v48;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v98;
    v98 = (void *)v50;

    objc_msgSend(*(id *)(a1 + 32), "setValues:forProperties:count:", &v93, v99, 11);
    v52 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v53;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0;
    objc_msgSend(v52, "executeUpdate:withParameters:error:", CFSTR("update container set date_downloaded=? where container_pid in (select DISTINCT container_pid from (select container_pid from container_item join container using(container_pid) where keep_local > 0 AND item_pid=?))"), v55, &v86);
    v56 = v86;

    if (v56)
    {
      v57 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
        *(_DWORD *)buf = 134218242;
        v90 = v58;
        v91 = 2114;
        v92 = v56;
        _os_log_impl(&dword_1AC149000, v57, OS_LOG_TYPE_ERROR, "updating container for item_pid=%lld finished with error=%{public}@", buf, 0x16u);
      }

    }
    v59 = objc_msgSend(*((id *)&v102 + 1), "integerValue");
    v60 = objc_msgSend(v103, "BOOLValue");
    if (v59 == 2 && (v60 & 1) == 0)
    {
      v61 = objc_alloc(MEMORY[0x1E0C8B3C0]);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 48));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(v61, "initWithURL:options:", v62, 0);

      if (v63)
      {
        +[ML3Track importChaptersByParsingAsset:](ML3Track, "importChaptersByParsingAsset:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64)
        {
          v65 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC149000, v65, OS_LOG_TYPE_DEFAULT, "updating chapter data from asset file", buf, 2u);
          }

          objc_msgSend(*(id *)(a1 + 32), "populateChapterDataWithImportChapters:", v64);
        }

      }
    }
    v66 = *((id *)&v101 + 1);
    if (v66)
    {
      v67 = *(_QWORD *)(a1 + 56);
      +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("(IFNULL(base_location.path, '') || '/' || item_extra.location)"), v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3Entity anyInLibrary:predicate:options:](ML3Track, "anyInLibrary:predicate:options:", v67, v68, 7);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v69)
      {
        v82 = v24;
        objc_msgSend(*(id *)(a1 + 56), "mediaFolderPathByAppendingPathComponent:", v66);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "pathExtension");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v71
          && (objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("movpkg"), CFSTR("m4bpkg"), 0),
              v72 = (void *)objc_claimAutoreleasedReturnValue(),
              v73 = objc_msgSend(v72, "containsObject:", v71),
              v72,
              v73))
        {
          v74 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v90 = (uint64_t)v70;
            _os_log_impl(&dword_1AC149000, v74, OS_LOG_TYPE_DEFAULT, "Marking orphan asset purgeable at path: %{public}@", buf, 0xCu);
          }

          MSVEnableDirStatsForDirectory();
          objc_msgSend(*(id *)(a1 + 56), "markSystemPurgeableMusicPath:forUrgency:", v70, 0);
        }
        else
        {
          v75 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v90 = (uint64_t)v70;
            _os_log_impl(&dword_1AC149000, v75, OS_LOG_TYPE_DEFAULT, "Deleting orphan asset at path: %{public}@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v70);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          ML3DeleteAssetsAtPaths(v76);

        }
        v24 = v82;
      }

    }
    v23 = v84;
  }
  else
  {
    v24 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v90 = v26;
      v91 = 2114;
      v92 = v23;
      _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_ERROR, "failed to obtain file attributes for %{public}@. err=%{public}@", buf, 0x16u);
    }
  }

  for (i = 80; i != -8; i -= 8)
  for (j = 10; j != -1; --j)

  for (k = 6; k != -1; --k)
  return v22 != 0;
}

uint64_t __96__ML3Track_ML3TrackImporter__populateLocationPropertiesWithPath_protectionType_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_populateLocationPropertiesWithPath:protectionType:fromLibrary:usingConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __80__ML3Track_ML3TrackImporter__populateLocationPropertiesWithPath_protectionType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_populateLocationPropertiesWithPath:protectionType:fromLibrary:usingConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __68__ML3Track_ML3TrackImporter__populateChapterDataWithImportChapters___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v2, "flattenedChapterDataWithImportChapters:library:trackPersistentID:", v3, WeakRetained, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "setValue:forProperty:", v5, CFSTR("chapter.chapter_data"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forProperty:", v7, CFSTR("chapter.chapter_data"));

  }
  return 1;
}

+ (id)_normalizedImportChapters:(id)a3 trackPersistentID:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sortedArrayUsingSelector:", sel_compare_);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "normalizeProperties", (_QWORD)v14);
        if (a4)
        {
          objc_msgSend(v10, "imageCacheKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            objc_msgSend(v10, "imageData");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
              continue;
            +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", a4, (double)(unint64_t)objc_msgSend(v10, "startTimeInMilliseconds") / 1000.0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setImageCacheKey:", v11);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)flattenedChapterDataWithImportChapters:(id)a3 library:(id)a4 trackPersistentID:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  int64_t v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;

  v8 = a4;
  objc_msgSend(a1, "_normalizedImportChapters:trackPersistentID:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v21 = 0;
    ChapterData_Create();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__10867;
    v19[4] = __Block_byref_object_dispose__10868;
    v20 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __95__ML3Track_ML3TrackImporter__flattenedChapterDataWithImportChapters_library_trackPersistentID___block_invoke;
    v13[3] = &unk_1E5B62E40;
    v11 = v10;
    v16 = v19;
    v17 = v21;
    v14 = v11;
    v15 = v8;
    v18 = a5;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);
    ChapterData_ExportFlattenedData();
    ChapterData_Release();

    _Block_object_dispose(v19, 8);
  }

  return 0;
}

+ (id)flattenedChapterDataFromSyncInfoDictionaries:(id)a3 trackPersistentID:(int64_t)a4
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v9 = 0;
    v6 = ChapterData_Create();
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v6;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "Could not create chapter data: %ld", buf, 0xCu);
    }

  }
  return 0;
}

+ (id)flattenedChapterDataFromDAAPInfoDictionary:(id)a3 trackPersistentID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v42;
  int64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  char v48;
  _QWORD v49[4];
  id v50;
  id v51;
  int64_t v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("chapters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("time-format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v8, "isEqualToString:", CFSTR("decimal-seconds")) & 1) == 0)
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v8;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "Unknown time format in chapter data: %{public}@, returning nil", buf, 0xCu);
    }
    v28 = 0;
    goto LABEL_29;
  }
  v43 = a4;
  v44 = v8;
  v9 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", a1);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v6;
  objc_msgSend(v6, "objectForKey:", CFSTR("chapters"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("locales"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  v14 = *MEMORY[0x1E0C997E8];
  if (!v13)
    goto LABEL_17;
  v15 = 0;
  v46 = *MEMORY[0x1E0C997B0];
  while (1)
  {
    v16 = objc_alloc(*(Class *)(v9 + 3528));
    objc_msgSend(v12, "objectAtIndex:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithLocaleIdentifier:", v17);

    objc_msgSend(v18, "objectForKey:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v10, "objectForKey:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", v20) & 1) == 0)
    {

      if (!v18)
        goto LABEL_9;
LABEL_8:
      objc_msgSend(v18, "objectForKey:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v27);

      goto LABEL_9;
    }
    objc_msgSend(v18, "objectForKey:", v46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v10, "objectForKey:", v46);
    v22 = v14;
    v23 = v9;
    v24 = v12;
    v25 = v10;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v21, "isEqualToString:", v26);

    v10 = v25;
    v12 = v24;
    v9 = v23;
    v14 = v22;

    if ((v48 & 1) != 0)
      break;
    if (v18)
      goto LABEL_8;
LABEL_9:

    if (objc_msgSend(v12, "count") <= (unint64_t)++v15)
      goto LABEL_17;
  }
  objc_msgSend(v12, "objectAtIndex:", v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
LABEL_17:
    -[NSObject objectForKey:](v10, "objectForKey:", v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v47, "indexOfObject:", v30);
    if (v31 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_22;
    if (objc_msgSend(v47, "count"))
    {
      v32 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject localeIdentifier](v10, "localeIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v33;
        v55 = 2114;
        v56 = v34;
        _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ not found in locales, using %{public}@ instead", buf, 0x16u);

      }
      v31 = 0;
LABEL_22:
      objc_msgSend(v12, "objectAtIndex:", v31);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }

  }
  v6 = v45;
  objc_msgSend(v45, "objectForKey:", CFSTR("chapters"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKey:", CFSTR("chapter-list"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __91__ML3Track_ML3TrackImporter__flattenedChapterDataFromDAAPInfoDictionary_trackPersistentID___block_invoke;
  v49[3] = &unk_1E5B62E90;
  v50 = v29;
  v52 = v43;
  v38 = v37;
  v51 = v38;
  v39 = v29;
  objc_msgSend(v36, "enumerateObjectsUsingBlock:", v49);
  objc_msgSend(v42, "flattenedChapterDataWithImportChapters:library:trackPersistentID:", v38, 0, v43);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    v40 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v54 = 0;
      _os_log_impl(&dword_1AC149000, v40, OS_LOG_TYPE_ERROR, "Could not create flattened item chapters: %ld", buf, 0xCu);
    }

  }
  v8 = v44;
LABEL_29:

  return v28;
}

+ (id)importChaptersByParsingAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MLTrackImportChapter *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  CMTime time;
  _QWORD v46[4];
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "availableChapterLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v32 = a1;
    objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v5;
    if ((objc_msgSend(v5, "containsObject:", v6) & 1) == 0)
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v43 = *MEMORY[0x1E0C8A888];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v4;
    v31 = v6;
    objc_msgSend(v4, "chapterMetadataGroupsWithTitleLocale:containingItemsWithCommonKeys:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v9;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v37)
    {
      v36 = *(_QWORD *)v53;
      v39 = *MEMORY[0x1E0C8A8E0];
      v40 = *MEMORY[0x1E0C8A8C0];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v53 != v36)
            objc_enumerationMutation(obj);
          v38 = v10;
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v10), "items");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v41 = v11;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v12)
          {
            v13 = v12;
            v44 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v49 != v44)
                  objc_enumerationMutation(v41);
                v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                v16 = dispatch_semaphore_create(0);
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("commonKey"), CFSTR("extraAttributes"), CFSTR("time"), CFSTR("value"), 0);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v46[0] = MEMORY[0x1E0C809B0];
                v46[1] = 3221225472;
                v46[2] = __59__ML3Track_ML3TrackImporter__importChaptersByParsingAsset___block_invoke;
                v46[3] = &unk_1E5B65D80;
                v18 = v16;
                v47 = v18;
                objc_msgSend(v15, "loadValuesAsynchronouslyForKeys:completionHandler:", v17, v46);

                dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
                if (v15)
                  objc_msgSend(v15, "time");
                else
                  memset(&time, 0, sizeof(time));
                v19 = (unint64_t)(floor(CMTimeGetSeconds(&time)) * 1000.0);
                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v19);
                objc_msgSend(v15, "commonKey");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "isEqualToString:", v43))
                {
                  objc_msgSend(v15, "dataValue");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (objc_msgSend(v21, "isEqualToString:", v40))
                  {
                    objc_msgSend(v15, "stringValue");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "extraAttributes");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "objectForKey:", v39);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    v22 = 0;
                    goto LABEL_23;
                  }
                  v22 = 0;
                }
                v23 = 0;
                v25 = 0;
                if (v22)
                  goto LABEL_25;
LABEL_23:
                if (v23 || v25)
                {
LABEL_25:
                  objc_msgSend(v42, "objectForKey:", v20);
                  v26 = (MLTrackImportChapter *)objc_claimAutoreleasedReturnValue();
                  if (v26)
                  {
                    if (v22)
                      goto LABEL_27;
LABEL_29:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v25);
                      -[MLTrackImportChapter setURL:](v26, "setURL:", v27);
                      -[MLTrackImportChapter setURLTitle:](v26, "setURLTitle:", v23);

                    }
                    else if (v23)
                    {
                      -[MLTrackImportChapter setTitle:](v26, "setTitle:", v23);
                    }
                  }
                  else
                  {
                    v26 = objc_alloc_init(MLTrackImportChapter);
                    -[MLTrackImportChapter setStartTimeInMilliseconds:](v26, "setStartTimeInMilliseconds:", v19);
                    objc_msgSend(v42, "setObject:forKey:", v26, v20);
                    if (!v22)
                      goto LABEL_29;
LABEL_27:
                    -[MLTrackImportChapter setImageData:](v26, "setImageData:", v22);
                  }

                }
              }
              v13 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            }
            while (v13);
          }

          v10 = v38 + 1;
        }
        while (v38 + 1 != v37);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v37);
    }

    objc_msgSend(v42, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_normalizedImportChapters:trackPersistentID:", v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v33;
    v4 = v34;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

intptr_t __59__ML3Track_ML3TrackImporter__importChaptersByParsingAsset___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __91__ML3Track_ML3TrackImporter__flattenedChapterDataFromDAAPInfoDictionary_trackPersistentID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  float v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MLTrackImportChapter *v10;

  v3 = a2;
  v10 = objc_alloc_init(MLTrackImportChapter);
  objc_msgSend(v3, "objectForKey:", CFSTR("start"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = (float)(v5 * 1000.0);

  -[MLTrackImportChapter setStartTimeInMilliseconds:](v10, "setStartTimeInMilliseconds:", v6);
  objc_msgSend(v3, "objectForKey:", CFSTR("titles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTrackImportChapter setTitle:](v10, "setTitle:", v8);

  +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", *(_QWORD *)(a1 + 48), (double)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTrackImportChapter setImageCacheKey:](v10, "setImageCacheKey:", v9);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
}

void __93__ML3Track_ML3TrackImporter__flattenedChapterDataFromSyncInfoDictionaries_trackPersistentID___block_invoke(uint64_t a1, void *a2)
{
  MLTrackImportChapter *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v17 = a2;
  v3 = objc_alloc_init(MLTrackImportChapter);
  objc_msgSend(v17, "objectForKey:", CFSTR("start_time_ms"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[MLTrackImportChapter setStartTimeInMilliseconds:](v3, "setStartTimeInMilliseconds:", v5);
  objc_msgSend(v17, "objectForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTrackImportChapter setTitle:](v3, "setTitle:", v6);

  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v17, "objectForKey:", CFSTR("url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTrackImportChapter setURL:](v3, "setURL:", v9);

  objc_msgSend(v17, "objectForKey:", CFSTR("url_title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLTrackImportChapter setURLTitle:](v3, "setURLTitle:", v12);
  objc_msgSend(v17, "objectForKey:", CFSTR("artwork_start_time_ms"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v17, "objectForKey:", CFSTR("artwork_start_time_ms"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if ((v15 & 0x80000000) == 0)
    {
      +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", *(_QWORD *)(a1 + 40), (double)v15 / 1000.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLTrackImportChapter setImageCacheKey:](v3, "setImageCacheKey:", v16);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __95__ML3Track_ML3TrackImporter__flattenedChapterDataWithImportChapters_library_trackPersistentID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void (**v43)(void);
  uint64_t v44;
  id v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[6];
  _QWORD v51[4];
  void (**v52)(void);
  _QWORD v53[7];
  _QWORD v54[3];
  char v55;

  v5 = a2;
  v6 = a3 + 1;
  if (v6 >= objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  v39 = *(_QWORD *)(a1 + 64);
  v45 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v10 = v5;
  v41 = v7;
  v42 = v8;
  v11 = objc_msgSend(v10, "startTimeInMilliseconds");
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v55 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __MLChapterDataAddImportChapter_block_invoke;
  v53[3] = &unk_1E5B62F68;
  v53[4] = v54;
  v53[5] = v9;
  v44 = v11;
  v53[6] = v11;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __MLChapterDataAddImportChapter_block_invoke_2;
  v51[3] = &unk_1E5B62F90;
  v43 = (void (**)(void))(id)MEMORY[0x1AF43CDE0](v53);
  v52 = v43;
  v13 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1AF43CDE0](v51);
  objc_msgSend(v10, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v12;
  v50[1] = 3221225472;
  v50[2] = __MLChapterDataAddImportChapter_block_invoke_3;
  v50[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
  v50[4] = v9;
  v50[5] = v44;
  LOBYTE(v8) = ((uint64_t (**)(_QWORD, void *, void *, _QWORD *))v13)[2](v13, v14, v15, v50);

  if ((v8 & 1) == 0)
  {
    v16 = v45;
    if (!v45)
      v16 = v10;
    v17 = v16;
    v18 = v41;
    if (!v41)
      v18 = v10;
    v19 = v18;
    objc_msgSend(v17, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "length"))
    {
      objc_msgSend(v19, "title");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "length"))
      {
        v38 = objc_msgSend(v17, "isEqualIgnoringTimesAndTitle:", v19);

        if (v38)
        {
          v43[2]();
          MLChapterDataSetUTF16Value(v9, &stru_1E5B66908);
        }
        goto LABEL_13;
      }

    }
LABEL_13:

  }
  objc_msgSend(v10, "URL", v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "absoluteString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "absoluteString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v12;
  v46[1] = 3221225472;
  v46[2] = __MLChapterDataAddImportChapter_block_invoke_4;
  v46[3] = &unk_1E5B62FD8;
  v48 = v9;
  v49 = v44;
  v26 = v10;
  v47 = v26;
  ((uint64_t (**)(_QWORD, void *, void *, _QWORD *))v13)[2](v13, v23, v25, v46);

  objc_msgSend(v26, "imageData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v43[2]();
    objc_msgSend(v26, "imageCacheKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27;
    v30 = v42;
    MLChapterDataSetChapterArtworkCacheKey(v9, v44, v28);
    if (objc_msgSend(v29, "length"))
    {
      v31 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", v40, v30);
      objc_msgSend(v31, "valueForProperty:", CFSTR("media_type"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "unsignedIntValue");

      +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", v40, (double)(unint64_t)v44);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:", v29, v34, 3, 300, v33);

    }
    goto LABEL_20;
  }
  objc_msgSend(v26, "imageCacheKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v43[2]();
    objc_msgSend(v26, "imageCacheKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    MLChapterDataSetChapterArtworkCacheKey(v9, v44, v28);
LABEL_20:

  }
  _Block_object_dispose(v54, 8);

  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v37 = *(void **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = v26;

}

- (id)multiverseIdentifier
{
  return -[ML3Track multiverseIdentifierLibraryOnly:](self, "multiverseIdentifierLibraryOnly:", 0);
}

- (id)multiverseIdentifierLibraryOnly:(BOOL)a3
{
  _BOOL4 v3;
  MIPMultiverseIdentifier *v5;
  id WeakRetained;
  MIPLibraryIdentifier *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  MIPMultiverseIdentifier *v11;
  __CFString *v12;
  MIPMultiverseIdentifier *v13;
  MIPMultiverseIdentifier *v14;
  _QWORD v16[4];
  __CFString *v17;
  ML3Track *v18;
  MIPMultiverseIdentifier *v19;
  BOOL v20;

  v3 = a3;
  v5 = objc_alloc_init(MIPMultiverseIdentifier);
  -[MIPMultiverseIdentifier setMediaObjectType:](v5, "setMediaObjectType:", 6);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v7 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v7, "setLibraryId:", self->super._persistentID);
  objc_msgSend(WeakRetained, "libraryUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPLibraryIdentifier setLibraryName:](v7, "setLibraryName:", v8);

  -[MIPMultiverseIdentifier addLibraryIdentifiers:](v5, "addLibraryIdentifiers:", v7);
  v9 = CFSTR("SELECT item_store.sync_id, item_extra.title, item.media_type, item_store.account_id, item_store.store_item_id, item_store.store_saga_id, item_store.purchase_history_id, item_store.cloud_universal_library_id FROM item JOIN item_store USING (item_pid) JOIN item_extra USING (item_pid) WHERE item.ROWID = ?");
  if (v3)
    v9 = CFSTR("SELECT item_store.sync_id FROM item JOIN item_store USING (item_pid) WHERE item.ROWID = ?");
  v10 = v9;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__ML3Track_MLProtocol__multiverseIdentifierLibraryOnly___block_invoke;
  v16[3] = &unk_1E5B63E80;
  v17 = v10;
  v18 = self;
  v11 = v5;
  v19 = v11;
  v20 = v3;
  v12 = v10;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 0, v16);
  v13 = v19;
  v14 = v11;

  return v14;
}

- (id)protocolItem
{
  MIPMediaItem *v3;
  uint64_t v4;
  id WeakRetained;
  MIPMediaItem *v6;
  id v7;
  void *v8;
  MIPMediaItem *v9;
  _QWORD v11[5];
  MIPMediaItem *v12;
  id v13;
  _QWORD block[5];

  v3 = objc_alloc_init(MIPMediaItem);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ML3Track_MLProtocol__protocolItem__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  if (protocolItem_onceToken != -1)
    dispatch_once(&protocolItem_onceToken, block);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __36__ML3Track_MLProtocol__protocolItem__block_invoke_2;
  v11[3] = &unk_1E5B642B8;
  v11[4] = self;
  v6 = v3;
  v12 = v6;
  v13 = WeakRetained;
  v7 = WeakRetained;
  objc_msgSend(v7, "databaseConnectionAllowingWrites:withBlock:", 0, v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)protocolItemForDynamicUpdate
{
  MIPMediaItem *v3;
  uint64_t v4;
  id WeakRetained;
  MIPMediaItem *v6;
  MIPMediaItem *v7;
  MIPMediaItem *v8;
  _QWORD v10[5];
  MIPMediaItem *v11;
  _QWORD block[5];

  v3 = objc_alloc_init(MIPMediaItem);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  if (protocolItemForDynamicUpdate_onceToken != -1)
    dispatch_once(&protocolItemForDynamicUpdate_onceToken, block);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke_2;
  v10[3] = &unk_1E5B642E8;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 0, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  _QWORD v25[15];

  v25[14] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("media_type");
  v25[0] = CFSTR("media_type");
  v3 = CFSTR("item_stats.date_played");
  v25[1] = CFSTR("item_stats.date_played");
  v4 = CFSTR("item_store.date_released");
  v25[2] = CFSTR("item_store.date_released");
  v5 = CFSTR("item_stats.date_skipped");
  v25[3] = CFSTR("item_stats.date_skipped");
  v6 = CFSTR("(item.base_location_id > 0)");
  v25[4] = CFSTR("(item.base_location_id > 0)");
  v7 = CFSTR("item_stats.liked_state");
  v25[5] = CFSTR("item_stats.liked_state");
  v8 = CFSTR("item_stats.liked_state_changed");
  v25[6] = CFSTR("item_stats.liked_state_changed");
  v9 = CFSTR("item_stats.play_count_recent");
  v25[7] = CFSTR("item_stats.play_count_recent");
  v10 = CFSTR("item_stats.play_count_user");
  v25[8] = CFSTR("item_stats.play_count_user");
  v11 = CFSTR("item_stats.skip_count_recent");
  v25[9] = CFSTR("item_stats.skip_count_recent");
  v12 = CFSTR("item_stats.skip_count_user");
  v25[10] = CFSTR("item_stats.skip_count_user");
  v13 = CFSTR("album.user_rating");
  v25[11] = CFSTR("album.user_rating");
  v14 = CFSTR("item_stats.user_rating");
  v25[12] = CFSTR("item_stats.user_rating");
  v15 = CFSTR("item_stats.liked_state_changed_date");
  v25[13] = CFSTR("item_stats.liked_state_changed_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 14);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)protocolItemForDynamicUpdate___trackProperties;
  protocolItemForDynamicUpdate___trackProperties = v16;

  v18 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", WeakRetained, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "selectPersistentIDsSQLAndProperties:ordered:", protocolItemForDynamicUpdate___trackProperties, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)protocolItemForDynamicUpdate___sqlQueryStr;
  protocolItemForDynamicUpdate___sqlQueryStr = v22;

  for (i = 13; i != -1; --i)
}

void __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = protocolItemForDynamicUpdate___sqlQueryStr;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a2;
  objc_msgSend(v4, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke_3;
  v10[3] = &unk_1E5B65EE0;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v9, "enumerateRowsWithBlock:", v10);

}

void __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  MIPSong *v6;
  MIPAlbum *v7;
  id v8;

  v8 = a2;
  *a4 = 1;
  LOWORD(a4) = objc_msgSend(v8, "intForColumnIndex:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setLastPlayedDateTime:", objc_msgSend(v8, "int64ForColumnIndex:", 2));
  objc_msgSend(*(id *)(a1 + 32), "setReleaseDateTime:", objc_msgSend(v8, "int64ForColumnIndex:", 3));
  objc_msgSend(*(id *)(a1 + 32), "setLastSkippedDateTime:", objc_msgSend(v8, "int64ForColumnIndex:", 4));
  objc_msgSend(*(id *)(a1 + 32), "setHasLocalAsset:", objc_msgSend(v8, "int64ForColumnIndex:", 5) != 0);
  objc_msgSend(*(id *)(a1 + 32), "setLikedState:", objc_msgSend(v8, "intForColumnIndex:", 6));
  objc_msgSend(*(id *)(a1 + 32), "setLikedStateChanged:", objc_msgSend(v8, "intForColumnIndex:", 7) != 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlayCount:", objc_msgSend(v8, "intForColumnIndex:", 9));
  objc_msgSend(*(id *)(a1 + 32), "setPlayCountDelta:", objc_msgSend(v8, "intForColumnIndex:", 8));
  objc_msgSend(*(id *)(a1 + 32), "setSkipCount:", objc_msgSend(v8, "intForColumnIndex:", 11));
  objc_msgSend(*(id *)(a1 + 32), "setSkipCountDelta:", objc_msgSend(v8, "intForColumnIndex:", 10));
  objc_msgSend(*(id *)(a1 + 32), "setLikedStateChangedDate:", objc_msgSend(v8, "int64ForColumnIndex:", 14));
  if (((unsigned __int16)a4 & 0x408) != 0)
  {
    v6 = objc_alloc_init(MIPSong);
    -[MIPSong setUserRating:](v6, "setUserRating:", objc_msgSend(v8, "intForColumnIndex:", 13));
    v7 = objc_alloc_init(MIPAlbum);
    -[MIPAlbum setUserRating:](v7, "setUserRating:", objc_msgSend(v8, "intForColumnIndex:", 12));
    -[MIPSong setAlbum:](v6, "setAlbum:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setSong:", v6);

  }
}

void __36__ML3Track_MLProtocol__protocolItem__block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  __CFString *v69;
  __CFString *v70;
  __CFString *v71;
  __CFString *v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  __CFString *v76;
  __CFString *v77;
  __CFString *v78;
  __CFString *v79;
  __CFString *v80;
  __CFString *v81;
  __CFString *v82;
  __CFString *v83;
  __CFString *v84;
  __CFString *v85;
  __CFString *v86;
  __CFString *v87;
  __CFString *v88;
  __CFString *v89;
  __CFString *v90;
  __CFString *v91;
  __CFString *v92;
  __CFString *v93;
  __CFString *v94;
  __CFString *v95;
  __CFString *v96;
  __CFString *v97;
  __CFString *v98;
  __CFString *v99;
  __CFString *v100;
  __CFString *v101;
  __CFString *v102;
  __CFString *v103;
  __CFString *v104;
  __CFString *v105;
  __CFString *v106;
  __CFString *v107;
  __CFString *v108;
  __CFString *v109;
  __CFString *v110;
  __CFString *v111;
  __CFString *v112;
  __CFString *v113;
  __CFString *v114;
  __CFString *v115;
  __CFString *v116;
  __CFString *v117;
  __CFString *v118;
  __CFString *v119;
  __CFString *v120;
  __CFString *v121;
  __CFString *v122;
  __CFString *v123;
  __CFString *v124;
  __CFString *v125;
  __CFString *v126;
  __CFString *v127;
  __CFString *v128;
  __CFString *v129;
  __CFString *v130;
  __CFString *v131;
  __CFString *v132;
  __CFString *v133;
  __CFString *v134;
  __CFString *v135;
  __CFString *v136;
  __CFString *v137;
  __CFString *v138;
  __CFString *v139;
  __CFString *v140;
  __CFString *v141;
  __CFString *v142;
  __CFString *v143;
  __CFString *v144;
  __CFString *v145;
  __CFString *v146;
  __CFString *v147;
  __CFString *v148;
  __CFString *v149;
  __CFString *v150;
  __CFString *v151;
  __CFString *v152;
  __CFString *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  id WeakRetained;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t i;
  _QWORD v163[153];

  v163[152] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("item_extra.title");
  v163[0] = CFSTR("item_extra.title");
  v3 = CFSTR("media_type");
  v163[1] = CFSTR("media_type");
  v4 = CFSTR("item_extra.sort_title");
  v163[2] = CFSTR("item_extra.sort_title");
  v5 = CFSTR("item_store.date_released");
  v163[3] = CFSTR("item_store.date_released");
  v6 = CFSTR("date_added");
  v163[4] = CFSTR("date_added");
  v7 = CFSTR("item_extra.date_modified");
  v163[5] = CFSTR("item_extra.date_modified");
  v8 = CFSTR("item_extra.file_size");
  v163[6] = CFSTR("item_extra.file_size");
  v9 = CFSTR("item_extra.total_time_ms");
  v163[7] = CFSTR("item_extra.total_time_ms");
  v10 = CFSTR("item_extra.content_rating");
  v163[8] = CFSTR("item_extra.content_rating");
  v11 = CFSTR("(item_extra.content_rating == 1)");
  v163[9] = CFSTR("(item_extra.content_rating == 1)");
  v12 = CFSTR("item_extra.description");
  v163[10] = CFSTR("item_extra.description");
  v13 = CFSTR("item_extra.description_long");
  v163[11] = CFSTR("item_extra.description_long");
  v14 = CFSTR("item_extra.copyright");
  v163[12] = CFSTR("item_extra.copyright");
  v15 = CFSTR("best_artwork_token.available_artwork_token AS available_item_artwork_token");
  v163[13] = CFSTR("best_artwork_token.available_artwork_token AS available_item_artwork_token");
  v16 = CFSTR("item_store.store_item_id");
  v163[14] = CFSTR("item_store.store_item_id");
  v17 = CFSTR("item_store.storefront_id");
  v163[15] = CFSTR("item_store.storefront_id");
  v18 = CFSTR("item_store.account_id");
  v163[16] = CFSTR("item_store.account_id");
  v19 = CFSTR("item_store.purchase_history_id");
  v163[17] = CFSTR("item_store.purchase_history_id");
  v20 = CFSTR("item_store.purchase_history_token");
  v163[18] = CFSTR("item_store.purchase_history_token");
  v21 = CFSTR("item_store.purchase_history_redownload_params");
  v163[19] = CFSTR("item_store.purchase_history_redownload_params");
  v22 = CFSTR("item_store.store_saga_id");
  v163[20] = CFSTR("item_store.store_saga_id");
  v23 = CFSTR("item_store.match_redownload_params");
  v163[21] = CFSTR("item_store.match_redownload_params");
  v24 = CFSTR("item_store.sync_id");
  v163[22] = CFSTR("item_store.sync_id");
  v25 = CFSTR("item_playback.audio_format");
  v163[23] = CFSTR("item_playback.audio_format");
  v26 = CFSTR("disc_number");
  v163[24] = CFSTR("disc_number");
  v27 = CFSTR("item_extra.genius_id");
  v163[25] = CFSTR("item_extra.genius_id");
  v28 = CFSTR("lyrics.lyrics");
  v163[26] = CFSTR("lyrics.lyrics");
  v29 = CFSTR("lyrics.checksum");
  v163[27] = CFSTR("lyrics.checksum");
  v30 = CFSTR("track_number");
  v163[28] = CFSTR("track_number");
  v31 = CFSTR("item_stats.user_rating");
  v163[29] = CFSTR("item_stats.user_rating");
  v32 = CFSTR("exclude_from_shuffle");
  v163[30] = CFSTR("exclude_from_shuffle");
  v33 = CFSTR("item_playback.has_video");
  v163[31] = CFSTR("item_playback.has_video");
  v34 = CFSTR("item_video.rental_duration");
  v163[32] = CFSTR("item_video.rental_duration");
  v35 = CFSTR("item_video.rental_playback_duration");
  v163[33] = CFSTR("item_video.rental_playback_duration");
  v36 = CFSTR("item_video.rental_playback_date_started");
  v163[34] = CFSTR("item_video.rental_playback_date_started");
  v37 = CFSTR("item_video.rental_date_started");
  v163[35] = CFSTR("item_video.rental_date_started");
  v38 = CFSTR("item_video.audio_language");
  v163[36] = CFSTR("item_video.audio_language");
  v39 = CFSTR("item_video.audio_track_id");
  v163[37] = CFSTR("item_video.audio_track_id");
  v40 = CFSTR("item_video.audio_track_index");
  v163[38] = CFSTR("item_video.audio_track_index");
  v41 = CFSTR("item_video.extended_content_rating");
  v163[39] = CFSTR("item_video.extended_content_rating");
  v42 = CFSTR("item_video.movie_info");
  v163[40] = CFSTR("item_video.movie_info");
  v43 = CFSTR("item_video.subtitle_language");
  v163[41] = CFSTR("item_video.subtitle_language");
  v44 = CFSTR("item_video.subtitle_track_index");
  v163[42] = CFSTR("item_video.subtitle_track_index");
  v45 = CFSTR("(item_video.video_quality != 0)");
  v163[43] = CFSTR("(item_video.video_quality != 0)");
  v46 = CFSTR("item_video.has_alternate_audio");
  v163[44] = CFSTR("item_video.has_alternate_audio");
  v47 = CFSTR("item_video.has_chapter_data");
  v163[45] = CFSTR("item_video.has_chapter_data");
  v48 = CFSTR("item_video.has_subtitles");
  v163[46] = CFSTR("item_video.has_subtitles");
  v49 = CFSTR("item_video.is_rental");
  v163[47] = CFSTR("item_video.is_rental");
  v50 = CFSTR("item_video.episode_id");
  v163[48] = CFSTR("item_video.episode_id");
  v51 = CFSTR("episode_sort_id");
  v163[49] = CFSTR("episode_sort_id");
  v52 = CFSTR("item_video.network_name");
  v163[50] = CFSTR("item_video.network_name");
  v53 = CFSTR("item_video.season_number");
  v163[51] = CFSTR("item_video.season_number");
  v54 = CFSTR("item_store.external_guid");
  v163[52] = CFSTR("item_store.external_guid");
  v55 = CFSTR("item_extra.disc_count");
  v163[53] = CFSTR("item_extra.disc_count");
  v56 = CFSTR("item_extra.track_count");
  v163[54] = CFSTR("item_extra.track_count");
  v57 = CFSTR("album.album");
  v163[55] = CFSTR("album.album");
  v58 = CFSTR("album.sort_album");
  v163[56] = CFSTR("album.sort_album");
  v59 = CFSTR("album.user_rating");
  v163[57] = CFSTR("album.user_rating");
  v60 = CFSTR("is_compilation");
  v163[58] = CFSTR("is_compilation");
  v61 = CFSTR("item_artist.store_id");
  v163[59] = CFSTR("item_artist.store_id");
  v62 = CFSTR("item_artist.item_artist");
  v163[60] = CFSTR("item_artist.item_artist");
  v63 = CFSTR("item_artist.sort_item_artist");
  v163[61] = CFSTR("item_artist.sort_item_artist");
  v64 = CFSTR("album_artist.album_artist");
  v163[62] = CFSTR("album_artist.album_artist");
  v65 = CFSTR("album_artist.sort_album_artist");
  v163[63] = CFSTR("album_artist.sort_album_artist");
  v66 = CFSTR("composer.composer");
  v163[64] = CFSTR("composer.composer");
  v67 = CFSTR("composer.sort_composer");
  v163[65] = CFSTR("composer.sort_composer");
  v68 = CFSTR("genre.genre");
  v163[66] = CFSTR("genre.genre");
  v69 = CFSTR("item_playback.gapless_encoding_drain");
  v163[67] = CFSTR("item_playback.gapless_encoding_drain");
  v70 = CFSTR("item_playback.gapless_last_frame_resynch");
  v163[68] = CFSTR("item_playback.gapless_last_frame_resynch");
  v71 = CFSTR("item_playback.gapless_heuristic_info");
  v163[69] = CFSTR("item_playback.gapless_heuristic_info");
  v72 = CFSTR("item_playback.gapless_encoding_delay");
  v163[70] = CFSTR("item_playback.gapless_encoding_delay");
  v73 = CFSTR("item_playback.start_time_ms");
  v163[71] = CFSTR("item_playback.start_time_ms");
  v74 = CFSTR("item_playback.stop_time_ms");
  v163[72] = CFSTR("item_playback.stop_time_ms");
  v75 = CFSTR("item_playback.volume_normalization_energy");
  v163[73] = CFSTR("item_playback.volume_normalization_energy");
  v76 = CFSTR("item_extra.bpm");
  v163[74] = CFSTR("item_extra.bpm");
  v77 = CFSTR("item_playback.bit_rate");
  v163[75] = CFSTR("item_playback.bit_rate");
  v78 = CFSTR("item_playback.codec_subtype");
  v163[76] = CFSTR("item_playback.codec_subtype");
  v79 = CFSTR("item_playback.codec_type");
  v163[77] = CFSTR("item_playback.codec_type");
  v80 = CFSTR("item_playback.data_kind");
  v163[78] = CFSTR("item_playback.data_kind");
  v81 = CFSTR("item_playback.data_url");
  v163[79] = CFSTR("item_playback.data_url");
  v82 = CFSTR("item_playback.eq_preset");
  v163[80] = CFSTR("item_playback.eq_preset");
  v83 = CFSTR("item_playback.format");
  v163[81] = CFSTR("item_playback.format");
  v84 = CFSTR("item_playback.relative_volume");
  v163[82] = CFSTR("item_playback.relative_volume");
  v85 = CFSTR("item_playback.sample_rate");
  v163[83] = CFSTR("item_playback.sample_rate");
  v86 = CFSTR("item_extra.year");
  v163[84] = CFSTR("item_extra.year");
  v87 = CFSTR("item_extra.content_rating_level");
  v163[85] = CFSTR("item_extra.content_rating_level");
  v88 = CFSTR("item_extra.comment");
  v163[86] = CFSTR("item_extra.comment");
  v89 = CFSTR("item_extra.location_kind_id");
  v163[87] = CFSTR("item_extra.location_kind_id");
  v90 = CFSTR("item_store.key_versions");
  v163[88] = CFSTR("item_store.key_versions");
  v91 = CFSTR("item_store.key_platform_id");
  v163[89] = CFSTR("item_store.key_platform_id");
  v92 = CFSTR("item_store.key_id");
  v163[90] = CFSTR("item_store.key_id");
  v93 = CFSTR("item_store.key_id_2");
  v163[91] = CFSTR("item_store.key_id_2");
  v94 = CFSTR("item_store.artwork_url");
  v163[92] = CFSTR("item_store.artwork_url");
  v95 = CFSTR("item_store.store_xid");
  v163[93] = CFSTR("item_store.store_xid");
  v96 = CFSTR("item_store.extras_url");
  v163[94] = CFSTR("item_store.extras_url");
  v97 = CFSTR("album_pid");
  v163[95] = CFSTR("album_pid");
  v98 = CFSTR("item_artist_pid");
  v163[96] = CFSTR("item_artist_pid");
  v99 = CFSTR("album_artist_pid");
  v163[97] = CFSTR("album_artist_pid");
  v100 = CFSTR("genre_id");
  v163[98] = CFSTR("genre_id");
  v101 = CFSTR("item_store.cloud_status");
  v163[99] = CFSTR("item_store.cloud_status");
  v102 = CFSTR("item_playback.progression_direction");
  v163[100] = CFSTR("item_playback.progression_direction");
  v103 = CFSTR("item_stats.play_count_user");
  v163[101] = CFSTR("item_stats.play_count_user");
  v104 = CFSTR("item_stats.play_count_recent");
  v163[102] = CFSTR("item_stats.play_count_recent");
  v105 = CFSTR("item_stats.date_played");
  v163[103] = CFSTR("item_stats.date_played");
  v106 = CFSTR("item_stats.skip_count_user");
  v163[104] = CFSTR("item_stats.skip_count_user");
  v107 = CFSTR("item_stats.skip_count_recent");
  v163[105] = CFSTR("item_stats.skip_count_recent");
  v108 = CFSTR("item_stats.date_skipped");
  v163[106] = CFSTR("item_stats.date_skipped");
  v109 = CFSTR("item_stats.remember_bookmark");
  v163[107] = CFSTR("item_stats.remember_bookmark");
  v110 = CFSTR("item_stats.bookmark_time_ms");
  v163[108] = CFSTR("item_stats.bookmark_time_ms");
  v111 = CFSTR("item_stats.hidden");
  v163[109] = CFSTR("item_stats.hidden");
  v112 = CFSTR("chapter.chapter_data");
  v163[110] = CFSTR("chapter.chapter_data");
  v113 = CFSTR("(item.base_location_id > 200)");
  v163[111] = CFSTR("(item.base_location_id > 200)");
  v114 = CFSTR("item_playback.duration");
  v163[112] = CFSTR("item_playback.duration");
  v115 = CFSTR("item_extra.grouping");
  v163[113] = CFSTR("item_extra.grouping");
  v116 = CFSTR("item_store.store_playlist_id");
  v163[114] = CFSTR("item_store.store_playlist_id");
  v117 = CFSTR("item_store.store_composer_id");
  v163[115] = CFSTR("item_store.store_composer_id");
  v118 = CFSTR("item_store.store_genre_id");
  v163[116] = CFSTR("item_store.store_genre_id");
  v119 = CFSTR("composer_pid");
  v163[117] = CFSTR("composer_pid");
  v120 = CFSTR("item_stats.liked_state");
  v163[118] = CFSTR("item_stats.liked_state");
  v121 = CFSTR("item_stats.liked_state_changed");
  v163[119] = CFSTR("item_stats.liked_state_changed");
  v122 = CFSTR("needs_reporting");
  v163[120] = CFSTR("needs_reporting");
  v123 = CFSTR("item_store.subscription_store_item_id");
  v163[121] = CFSTR("item_store.subscription_store_item_id");
  v124 = CFSTR("in_my_library");
  v163[122] = CFSTR("in_my_library");
  v125 = CFSTR("item_store.cloud_asset_available");
  v163[123] = CFSTR("item_store.cloud_asset_available");
  v126 = CFSTR("item_store.is_protected");
  v163[124] = CFSTR("item_store.is_protected");
  v127 = CFSTR("item_store.cloud_album_id");
  v163[125] = CFSTR("item_store.cloud_album_id");
  v128 = CFSTR("item_extra.is_user_disabled");
  v163[126] = CFSTR("item_extra.is_user_disabled");
  v129 = CFSTR("item_store.feed_url");
  v163[127] = CFSTR("item_store.feed_url");
  v130 = CFSTR("item_artist.series_name");
  v163[128] = CFSTR("item_artist.series_name");
  v131 = CFSTR("item_store.cloud_playback_endpoint_type");
  v163[129] = CFSTR("item_store.cloud_playback_endpoint_type");
  v132 = CFSTR("item_store.playback_endpoint_type");
  v163[130] = CFSTR("item_store.playback_endpoint_type");
  v133 = CFSTR("item_store.store_matched_status");
  v163[131] = CFSTR("item_store.store_matched_status");
  v134 = CFSTR("item_store.cloud_in_my_library");
  v163[132] = CFSTR("item_store.cloud_in_my_library");
  v135 = CFSTR("album_artist.store_id");
  v163[133] = CFSTR("album_artist.store_id");
  v136 = CFSTR("item_store.cloud_universal_library_id");
  v163[134] = CFSTR("item_store.cloud_universal_library_id");
  v137 = CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type");
  v163[135] = CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type");
  v138 = CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token");
  v163[136] = CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token");
  v139 = CFSTR("item_video.hls_playlist_url");
  v163[137] = CFSTR("item_video.hls_playlist_url");
  v140 = CFSTR("album_artist.cloud_universal_library_id");
  v163[138] = CFSTR("album_artist.cloud_universal_library_id");
  v141 = CFSTR("item_extra.is_preorder");
  v163[139] = CFSTR("item_extra.is_preorder");
  v142 = CFSTR("item_stats.liked_state_changed_date");
  v163[140] = CFSTR("item_stats.liked_state_changed_date");
  v143 = CFSTR("item_store.reporting_store_item_id");
  v163[141] = CFSTR("item_store.reporting_store_item_id");
  v144 = CFSTR("item_store.asset_store_item_id");
  v163[142] = CFSTR("item_store.asset_store_item_id");
  v145 = CFSTR("album.liked_state");
  v163[143] = CFSTR("album.liked_state");
  v146 = CFSTR("album.liked_state_changed_date");
  v163[144] = CFSTR("album.liked_state_changed_date");
  v147 = CFSTR("album_artist.liked_state");
  v163[145] = CFSTR("album_artist.liked_state");
  v148 = CFSTR("album_artist.liked_state_changed_date");
  v163[146] = CFSTR("album_artist.liked_state_changed_date");
  v149 = CFSTR("album_artist.sync_id");
  v163[147] = CFSTR("album_artist.sync_id");
  v150 = CFSTR("album.sync_id");
  v163[148] = CFSTR("album.sync_id");
  v151 = CFSTR("item_artist.sync_id");
  v163[149] = CFSTR("item_artist.sync_id");
  v152 = CFSTR("album_artist_order");
  v163[150] = CFSTR("album_artist_order");
  v153 = CFSTR("album_artist_order_section");
  v163[151] = CFSTR("album_artist_order_section");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 152);
  v154 = objc_claimAutoreleasedReturnValue();
  v155 = (void *)protocolItem___trackProperties;
  protocolItem___trackProperties = v154;

  v156 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", WeakRetained, v158, 0);
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v159, "selectPersistentIDsSQLAndProperties:ordered:", protocolItem___trackProperties, 0);
  v160 = objc_claimAutoreleasedReturnValue();
  v161 = (void *)protocolItem___sqlQueryStr;
  protocolItem___sqlQueryStr = v160;

  for (i = 151; i != -1; --i)
}

void __36__ML3Track_MLProtocol__protocolItem__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = protocolItem___sqlQueryStr;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a2;
  objc_msgSend(v4, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__ML3Track_MLProtocol__protocolItem__block_invoke_3;
  v12[3] = &unk_1E5B64290;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v13 = v10;
  v14 = v11;
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v9, "enumerateRowsWithBlock:", v12);

}

void __36__ML3Track_MLProtocol__protocolItem__block_invoke_3(id *a1, void *a2, uint64_t a3, _BYTE *a4)
{
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  MIPLibraryIdentifier *v26;
  void *v27;
  MIPLibraryIdentifier *v28;
  uint64_t v29;
  void *v30;
  MIPArtist *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  MIPLibraryIdentifier *v36;
  MIPLibraryIdentifier *v37;
  MIPAlbum *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  MIPLibraryIdentifier *v45;
  MIPLibraryIdentifier *v46;
  MIPArtist *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  MIPLibraryIdentifier *v54;
  MIPLibraryIdentifier *v55;
  MIPArtist *v56;
  void *v57;
  void *v58;
  MIPGenre *v59;
  void *v60;
  MIPPlaybackInfo *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  MIPSeries *v66;
  void *v67;
  void *v68;
  MIPSong *v69;
  MIPTVShow *v70;
  void *v71;
  void *v72;
  MIPAudiobook *v73;
  void *v74;
  MIPMovie *v75;
  void *v76;
  void *v77;
  MIPPodcast *v78;
  void *v79;
  void *v80;
  MIPLibraryIdentifier *v81;
  void *v82;
  MIPLibraryIdentifier *v83;
  MIPLibraryIdentifier *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  void *v91;
  __int16 v92;
  id v93;

  v93 = a2;
  objc_msgSend(a1[4], "setMediaType:", ML3ProtocolMediaTypeForMLMediaType(objc_msgSend(v93, "intForColumnIndex:", 2)));
  objc_msgSend(v93, "stringForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setTitle:", v5);

  objc_msgSend(v93, "stringForColumnIndex:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setSortTitle:", v6);

  objc_msgSend(a1[4], "setReleaseDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 4));
  objc_msgSend(a1[4], "setCreationDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 5));
  objc_msgSend(a1[4], "setModificationDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 6));
  objc_msgSend(a1[4], "setFileSize:", objc_msgSend(v93, "int64ForColumnIndex:", 7));
  objc_msgSend(a1[4], "setDuration:", objc_msgSend(v93, "int64ForColumnIndex:", 8));
  objc_msgSend(a1[4], "setContentRating:", objc_msgSend(v93, "intForColumnIndex:", 9));
  objc_msgSend(a1[4], "setExplicitContent:", objc_msgSend(v93, "intForColumnIndex:", 10) != 0);
  objc_msgSend(v93, "stringForColumnIndex:", 11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setShortDescription:", v7);

  objc_msgSend(v93, "stringForColumnIndex:", 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setLongDescription:", v8);

  objc_msgSend(v93, "stringForColumnIndex:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setCopyright:", v9);

  objc_msgSend(a1[4], "setStoreId:", objc_msgSend(v93, "int64ForColumnIndex:", 15));
  objc_msgSend(a1[4], "setStorefrontId:", objc_msgSend(v93, "int64ForColumnIndex:", 16));
  objc_msgSend(a1[4], "setAccountId:", objc_msgSend(v93, "int64ForColumnIndex:", 17));
  objc_msgSend(a1[4], "setPurchaseHistoryId:", objc_msgSend(v93, "int64ForColumnIndex:", 18));
  objc_msgSend(a1[4], "setPurchaseHistoryToken:", objc_msgSend(v93, "int64ForColumnIndex:", 19));
  objc_msgSend(v93, "stringForColumnIndex:", 20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setPurchaseHistoryRedownloadParams:", v10);

  objc_msgSend(a1[4], "setSagaId:", objc_msgSend(v93, "int64ForColumnIndex:", 21));
  objc_msgSend(a1[4], "setYear:", objc_msgSend(v93, "intForColumnIndex:", 85));
  objc_msgSend(a1[4], "setContentRatingLevel:", objc_msgSend(v93, "intForColumnIndex:", 86));
  objc_msgSend(v93, "stringForColumnIndex:", 22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setSagaRedownloadParams:", v11);

  objc_msgSend(v93, "stringForColumnIndex:", 87);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setComment:", v12);

  objc_msgSend(a1[4], "setFileKind:", objc_msgSend(v93, "intForColumnIndex:", 88));
  objc_msgSend(a1[4], "setDrmVersionsCode:", objc_msgSend(v93, "int64ForColumnIndex:", 89));
  objc_msgSend(a1[4], "setDrmPlatformIdCode:", objc_msgSend(v93, "int64ForColumnIndex:", 90));
  objc_msgSend(a1[4], "setDrmKey1IdCode:", objc_msgSend(v93, "int64ForColumnIndex:", 91));
  objc_msgSend(a1[4], "setDrmKey2IdCode:", objc_msgSend(v93, "int64ForColumnIndex:", 92));
  objc_msgSend(v93, "stringForColumnIndex:", 93);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setChapterMetadataUrl:", v13);

  objc_msgSend(v93, "stringForColumnIndex:", 94);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setStoreXID:", v14);

  objc_msgSend(v93, "stringForColumnIndex:", 95);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setExtrasUrl:", v15);

  objc_msgSend(a1[4], "setCloudStatus:", objc_msgSend(v93, "intForColumnIndex:", 100));
  objc_msgSend(a1[4], "setPlayCount:", objc_msgSend(v93, "intForColumnIndex:", 102));
  objc_msgSend(a1[4], "setPlayCountDelta:", objc_msgSend(v93, "intForColumnIndex:", 103));
  objc_msgSend(a1[4], "setLastPlayedDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 104));
  objc_msgSend(a1[4], "setSkipCount:", objc_msgSend(v93, "intForColumnIndex:", 105));
  objc_msgSend(a1[4], "setSkipCountDelta:", objc_msgSend(v93, "intForColumnIndex:", 106));
  objc_msgSend(a1[4], "setLastSkippedDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 107));
  objc_msgSend(a1[4], "setRememberBookmark:", objc_msgSend(v93, "intForColumnIndex:", 108) != 0);
  objc_msgSend(a1[4], "setBookmarkTimeMilliseconds:", objc_msgSend(v93, "int64ForColumnIndex:", 109));
  objc_msgSend(a1[4], "setHidden:", objc_msgSend(v93, "intForColumnIndex:", 110) != 0);
  objc_msgSend(a1[4], "setHasLocalAsset:", objc_msgSend(v93, "intForColumnIndex:", 112) != 0);
  objc_msgSend(v93, "stringForColumnIndex:", 14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setArtworkId:", v16);

  objc_msgSend(v93, "stringForColumnIndex:", 114);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setGrouping:", v17);

  objc_msgSend(a1[4], "setStorePlaylistId:", objc_msgSend(v93, "int64ForColumnIndex:", 115));
  objc_msgSend(a1[4], "setLikedState:", objc_msgSend(v93, "intForColumnIndex:", 119));
  objc_msgSend(a1[4], "setLikedStateChanged:", objc_msgSend(v93, "intForColumnIndex:", 120) != 0);
  objc_msgSend(a1[4], "setNeedsReporting:", objc_msgSend(v93, "intForColumnIndex:", 121) != 0);
  objc_msgSend(a1[4], "setSubscriptionStoreItemId:", objc_msgSend(v93, "int64ForColumnIndex:", 122));
  objc_msgSend(a1[4], "setIsInUsersLibrary:", objc_msgSend(v93, "intForColumnIndex:", 123) != 0);
  objc_msgSend(a1[4], "setCloudAssetAvailable:", objc_msgSend(v93, "intForColumnIndex:", 124) != 0);
  objc_msgSend(a1[4], "setStoreProtectionType:", objc_msgSend(v93, "intForColumnIndex:", 125));
  objc_msgSend(a1[4], "setUserDisabled:", objc_msgSend(v93, "intForColumnIndex:", 127) != 0);
  objc_msgSend(a1[4], "setCloudPlaybackEndpointType:", objc_msgSend(v93, "intForColumnIndex:", 130));
  objc_msgSend(a1[4], "setPlaybackEndpointType:", objc_msgSend(v93, "intForColumnIndex:", 131));
  objc_msgSend(a1[4], "setCloudMatchedStatus:", objc_msgSend(v93, "intForColumnIndex:", 132));
  objc_msgSend(a1[4], "setInUsersCloudLibrary:", objc_msgSend(v93, "intForColumnIndex:", 133) != 0);
  objc_msgSend(v93, "stringForColumnIndex:", 135);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setCloudUniversalLibraryId:", v18);

  objc_msgSend(v93, "stringForColumnIndex:", 46);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setHasChapterData:", v19 != 0);

  objc_msgSend(v93, "dataForColumnIndex:", 111);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setFlattenedChapterData:", v20);

  objc_msgSend(a1[4], "setIsPreorder:", objc_msgSend(v93, "intForColumnIndex:", 140) != 0);
  objc_msgSend(a1[4], "setLikedStateChangedDate:", objc_msgSend(v93, "int64ForColumnIndex:", 141));
  objc_msgSend(a1[4], "setReportingStoreItemId:", objc_msgSend(v93, "int64ForColumnIndex:", 142));
  objc_msgSend(a1[4], "setAssetStoreItemId:", objc_msgSend(v93, "int64ForColumnIndex:", 143));
  v21 = objc_msgSend(v93, "intForColumnIndex:", 136);
  if ((_DWORD)v21)
    objc_msgSend(a1[4], "setSecondaryArtworkSourceType:", v21);
  objc_msgSend(v93, "stringForColumnIndex:", 137);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
    objc_msgSend(a1[4], "setSecondaryArtworkId:", v22);
  v88 = v22;
  v23 = objc_msgSend(v93, "int64ForColumnIndex:", 23);
  v24 = objc_msgSend(a1[5], "persistentID");
  objc_msgSend(a1[6], "syncLibraryID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v26 = objc_alloc_init(MIPLibraryIdentifier);
    -[MIPLibraryIdentifier setLibraryId:](v26, "setLibraryId:", v24);
    objc_msgSend(a1[6], "libraryUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPLibraryIdentifier setLibraryName:](v26, "setLibraryName:", v27);

    objc_msgSend(a1[4], "addLibraryIdentifiers:", v26);
  }
  if (v23 >= 1 && objc_msgSend(v25, "length"))
  {
    v28 = objc_alloc_init(MIPLibraryIdentifier);
    -[MIPLibraryIdentifier setLibraryId:](v28, "setLibraryId:", v23);
    -[MIPLibraryIdentifier setLibraryName:](v28, "setLibraryName:", v25);
    objc_msgSend(a1[4], "addLibraryIdentifiers:", v28);

  }
  v87 = v25;
  v92 = objc_msgSend(v93, "intForColumnIndex:", 2);
  objc_msgSend(a1[6], "libraryUID");
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "syncLibraryID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MIPArtist);
  -[MIPArtist setStoreId:](v31, "setStoreId:", objc_msgSend(v93, "int64ForColumnIndex:", 60));
  -[MIPArtist setArtworkId:](v31, "setArtworkId:", 0);
  objc_msgSend(v93, "stringForColumnIndex:", 61);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPArtist setName:](v31, "setName:", v32);

  objc_msgSend(v93, "stringForColumnIndex:", 62);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPArtist setSortName:](v31, "setSortName:", v33);

  -[MIPArtist setPersistentId:](v31, "setPersistentId:", objc_msgSend(v93, "int64ForColumnIndex:", 97));
  v34 = objc_msgSend(v93, "int64ForColumnIndex:", 150);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v36, "setLibraryId:", -[MIPArtist persistentId](v31, "persistentId"));
  -[MIPLibraryIdentifier setLibraryName:](v36, "setLibraryName:", v29);
  v84 = v36;
  objc_msgSend(v35, "addObject:", v36);
  if (v34 >= 1 && objc_msgSend(v30, "length"))
  {
    v37 = objc_alloc_init(MIPLibraryIdentifier);
    -[MIPLibraryIdentifier setLibraryId:](v37, "setLibraryId:", v34);
    -[MIPLibraryIdentifier setLibraryName:](v37, "setLibraryName:", v30);
    objc_msgSend(v35, "addObject:", v37);

  }
  v85 = v35;
  -[MIPArtist setLibraryIdentifiers:](v31, "setLibraryIdentifiers:", v35);
  v38 = objc_alloc_init(MIPAlbum);
  -[MIPAlbum setStoreId:](v38, "setStoreId:", objc_msgSend(v93, "int64ForColumnIndex:", 115));
  objc_msgSend(v93, "stringForColumnIndex:", 14);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPAlbum setArtworkId:](v38, "setArtworkId:", v39);

  objc_msgSend(v93, "stringForColumnIndex:", 56);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPAlbum setName:](v38, "setName:", v40);

  -[MIPAlbum setNumDiscs:](v38, "setNumDiscs:", objc_msgSend(v93, "intForColumnIndex:", 54));
  -[MIPAlbum setNumTracks:](v38, "setNumTracks:", objc_msgSend(v93, "intForColumnIndex:", 55));
  objc_msgSend(v93, "stringForColumnIndex:", 57);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPAlbum setSortName:](v38, "setSortName:", v41);

  -[MIPAlbum setUserRating:](v38, "setUserRating:", objc_msgSend(v93, "intForColumnIndex:", 58));
  -[MIPAlbum setCompilation:](v38, "setCompilation:", objc_msgSend(v93, "intForColumnIndex:", 59) != 0);
  -[MIPAlbum setPersistentId:](v38, "setPersistentId:", objc_msgSend(v93, "int64ForColumnIndex:", 96));
  objc_msgSend(v93, "stringForColumnIndex:", 126);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPAlbum setCloudId:](v38, "setCloudId:", v42);

  -[MIPAlbum setLikedState:](v38, "setLikedState:", objc_msgSend(v93, "intForColumnIndex:", 144));
  -[MIPAlbum setLikedStateChangedDate:](v38, "setLikedStateChangedDate:", objc_msgSend(v93, "int64ForColumnIndex:", 145));
  v43 = objc_msgSend(v93, "int64ForColumnIndex:", 149);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v45, "setLibraryId:", -[MIPAlbum persistentId](v38, "persistentId"));
  -[MIPLibraryIdentifier setLibraryName:](v45, "setLibraryName:", v29);
  v83 = v45;
  objc_msgSend(v44, "addObject:", v45);
  v91 = v44;
  if (v43 >= 1 && objc_msgSend(v30, "length"))
  {
    v46 = objc_alloc_init(MIPLibraryIdentifier);
    -[MIPLibraryIdentifier setLibraryId:](v46, "setLibraryId:", v43);
    -[MIPLibraryIdentifier setLibraryName:](v46, "setLibraryName:", v30);
    objc_msgSend(v91, "addObject:", v46);

    v44 = v91;
  }
  v90 = v30;
  -[MIPAlbum setLibraryIdentifiers:](v38, "setLibraryIdentifiers:", v44);
  v47 = objc_alloc_init(MIPArtist);
  -[MIPArtist setStoreId:](v47, "setStoreId:", objc_msgSend(v93, "int64ForColumnIndex:", 134));
  objc_msgSend(v93, "stringForColumnIndex:", 14);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPArtist setArtworkId:](v47, "setArtworkId:", v48);

  objc_msgSend(v93, "stringForColumnIndex:", 63);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPArtist setName:](v47, "setName:", v49);

  objc_msgSend(v93, "stringForColumnIndex:", 64);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPArtist setSortName:](v47, "setSortName:", v50);

  -[MIPArtist setPersistentId:](v47, "setPersistentId:", objc_msgSend(v93, "int64ForColumnIndex:", 98));
  objc_msgSend(v93, "stringForColumnIndex:", 139);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPArtist setCloudUniversalLibraryId:](v47, "setCloudUniversalLibraryId:", v51);

  -[MIPArtist setLikedState:](v47, "setLikedState:", objc_msgSend(v93, "intForColumnIndex:", 146));
  -[MIPArtist setLikedStateChangedDate:](v47, "setLikedStateChangedDate:", objc_msgSend(v93, "int64ForColumnIndex:", 147));
  -[MIPArtist setSortOrder:](v47, "setSortOrder:", objc_msgSend(v93, "int64ForColumnIndex:", 151));
  -[MIPArtist setSortOrderSection:](v47, "setSortOrderSection:", objc_msgSend(v93, "int64ForColumnIndex:", 152));
  v52 = objc_msgSend(v93, "int64ForColumnIndex:", 148);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v54, "setLibraryId:", -[MIPArtist persistentId](v47, "persistentId"));
  v86 = (void *)v29;
  -[MIPLibraryIdentifier setLibraryName:](v54, "setLibraryName:", v29);
  v81 = v54;
  objc_msgSend(v53, "addObject:", v54);
  if (v52 >= 1 && objc_msgSend(v90, "length"))
  {
    v55 = objc_alloc_init(MIPLibraryIdentifier);
    -[MIPLibraryIdentifier setLibraryId:](v55, "setLibraryId:", v52);
    -[MIPLibraryIdentifier setLibraryName:](v55, "setLibraryName:", v90);
    objc_msgSend(v91, "addObject:", v55);

  }
  v82 = v53;
  -[MIPArtist setLibraryIdentifiers:](v47, "setLibraryIdentifiers:", v53);
  -[MIPAlbum setArtist:](v38, "setArtist:", v47);
  v56 = objc_alloc_init(MIPArtist);
  -[MIPArtist setStoreId:](v56, "setStoreId:", objc_msgSend(v93, "int64ForColumnIndex:", 116));
  -[MIPArtist setArtworkId:](v56, "setArtworkId:", 0);
  objc_msgSend(v93, "stringForColumnIndex:", 65);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPArtist setName:](v56, "setName:", v57);

  objc_msgSend(v93, "stringForColumnIndex:", 66);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPArtist setSortName:](v56, "setSortName:", v58);

  -[MIPArtist setPersistentId:](v56, "setPersistentId:", objc_msgSend(v93, "int64ForColumnIndex:", 118));
  v59 = objc_alloc_init(MIPGenre);
  -[MIPGenre setStoreId:](v59, "setStoreId:", objc_msgSend(v93, "int64ForColumnIndex:", 117));
  objc_msgSend(v93, "stringForColumnIndex:", 67);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPGenre setName:](v59, "setName:", v60);

  -[MIPGenre setPersistentId:](v59, "setPersistentId:", objc_msgSend(v93, "int64ForColumnIndex:", 99));
  v61 = objc_alloc_init(MIPPlaybackInfo);
  -[MIPPlaybackInfo setGaplessEncodingDrainCode:](v61, "setGaplessEncodingDrainCode:", objc_msgSend(v93, "int64ForColumnIndex:", 68));
  -[MIPPlaybackInfo setGaplessFrameResyncCode:](v61, "setGaplessFrameResyncCode:", objc_msgSend(v93, "int64ForColumnIndex:", 69));
  -[MIPPlaybackInfo setGaplessHeuristicCode:](v61, "setGaplessHeuristicCode:", objc_msgSend(v93, "int64ForColumnIndex:", 70));
  -[MIPPlaybackInfo setGaplessHeuristicDelayCode:](v61, "setGaplessHeuristicDelayCode:", objc_msgSend(v93, "int64ForColumnIndex:", 71));
  -[MIPPlaybackInfo setStartTime:](v61, "setStartTime:", objc_msgSend(v93, "int64ForColumnIndex:", 72));
  -[MIPPlaybackInfo setStopTime:](v61, "setStopTime:", objc_msgSend(v93, "int64ForColumnIndex:", 73));
  -[MIPPlaybackInfo setVolumeNormalizationEnergy:](v61, "setVolumeNormalizationEnergy:", objc_msgSend(v93, "int64ForColumnIndex:", 74));
  -[MIPPlaybackInfo setBeatsPerMinute:](v61, "setBeatsPerMinute:", objc_msgSend(v93, "int64ForColumnIndex:", 75));
  -[MIPPlaybackInfo setBitRate:](v61, "setBitRate:", objc_msgSend(v93, "int64ForColumnIndex:", 76));
  -[MIPPlaybackInfo setCodecSubType:](v61, "setCodecSubType:", objc_msgSend(v93, "int64ForColumnIndex:", 77));
  -[MIPPlaybackInfo setCodecType:](v61, "setCodecType:", objc_msgSend(v93, "int64ForColumnIndex:", 78));
  -[MIPPlaybackInfo setDataKind:](v61, "setDataKind:", objc_msgSend(v93, "int64ForColumnIndex:", 79));
  objc_msgSend(v93, "stringForColumnIndex:", 80);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPPlaybackInfo setDataUrl:](v61, "setDataUrl:", v62);

  objc_msgSend(v93, "stringForColumnIndex:", 81);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPPlaybackInfo setEqPreset:](v61, "setEqPreset:", v63);

  objc_msgSend(v93, "stringForColumnIndex:", 82);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPPlaybackInfo setPlaybackFormat:](v61, "setPlaybackFormat:", v64);

  -[MIPPlaybackInfo setRelativeVolume:](v61, "setRelativeVolume:", objc_msgSend(v93, "intForColumnIndex:", 83));
  -[MIPPlaybackInfo setSampleRate:](v61, "setSampleRate:", objc_msgSend(v93, "intForColumnIndex:", 84));
  -[MIPPlaybackInfo setProgressionDirection:](v61, "setProgressionDirection:", objc_msgSend(v93, "intForColumnIndex:", 101));
  -[MIPPlaybackInfo setDurationInSamples:](v61, "setDurationInSamples:", objc_msgSend(v93, "int64ForColumnIndex:", 113));
  LOWORD(v65) = v92;
  if ((v92 & 0x404) != 0)
  {
    v66 = objc_alloc_init(MIPSeries);
    objc_msgSend(v93, "stringForColumnIndex:", 56);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPSeries setName:](v66, "setName:", v67);

    objc_msgSend(v93, "stringForColumnIndex:", 57);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPSeries setSortName:](v66, "setSortName:", v68);

    -[MIPSeries setStoreId:](v66, "setStoreId:", objc_msgSend(v93, "int64ForColumnIndex:", 115));
  }
  else
  {
    v66 = 0;
  }
  if ((v92 & 0x408) != 0)
  {
    v69 = objc_alloc_init(MIPSong);
    -[MIPSong setAudioFormat:](v69, "setAudioFormat:", objc_msgSend(v93, "intForColumnIndex:", 24));
    -[MIPSong setDiscNumber:](v69, "setDiscNumber:", objc_msgSend(v93, "intForColumnIndex:", 25));
    -[MIPSong setGeniusId:](v69, "setGeniusId:", objc_msgSend(v93, "int64ForColumnIndex:", 26));
    -[MIPSong setLyricsChecksum:](v69, "setLyricsChecksum:", objc_msgSend(v93, "int64ForColumnIndex:", 28));
    -[MIPSong setTrackNumber:](v69, "setTrackNumber:", objc_msgSend(v93, "intForColumnIndex:", 29));
    -[MIPSong setUserRating:](v69, "setUserRating:", objc_msgSend(v93, "intForColumnIndex:", 30));
    -[MIPSong setExcludeFromShuffle:](v69, "setExcludeFromShuffle:", objc_msgSend(v93, "intForColumnIndex:", 31) != 0);
    -[MIPSong setHasVideo:](v69, "setHasVideo:", objc_msgSend(v93, "intForColumnIndex:", 32) != 0);
    objc_msgSend(v93, "stringForColumnIndex:", 138);
    v65 = objc_claimAutoreleasedReturnValue();
    -[MIPSong setHlsPlaylistURL:](v69, "setHlsPlaylistURL:", v65);

    LOWORD(v65) = v92;
    -[MIPSong setArtist:](v69, "setArtist:", v31);
    -[MIPSong setAlbum:](v69, "setAlbum:", v38);
    -[MIPSong setComposer:](v69, "setComposer:", v56);
    -[MIPSong setGenre:](v69, "setGenre:", v59);
    -[MIPSong setPlaybackInfo:](v69, "setPlaybackInfo:", v61);
    objc_msgSend(a1[4], "setSong:", v69);

    if ((v92 & 0x400) != 0)
    {
      v70 = objc_alloc_init(MIPTVShow);
      -[MIPTVShow setArtist:](v70, "setArtist:", v31);
      -[MIPTVShow setSeries:](v70, "setSeries:", v66);
      objc_msgSend(v93, "stringForColumnIndex:", 49);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIPTVShow setEpisodeId:](v70, "setEpisodeId:", v71);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v93, "intForColumnIndex:", 50));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIPTVShow setEpisodeSortId:](v70, "setEpisodeSortId:", v72);

      objc_msgSend(v93, "stringForColumnIndex:", 51);
      v65 = objc_claimAutoreleasedReturnValue();
      -[MIPTVShow setNetworkName:](v70, "setNetworkName:", v65);

      LOWORD(v65) = v92;
      -[MIPTVShow setSeasonNumber:](v70, "setSeasonNumber:", objc_msgSend(v93, "intForColumnIndex:", 52));
      -[MIPTVShow setVideoQuality:](v70, "setVideoQuality:", objc_msgSend(v93, "intForColumnIndex:", 44));
      objc_msgSend(a1[4], "setTvShow:", v70);

    }
  }
  if ((v65 & 0x800) == 0)
  {
    if ((v65 & 4) == 0)
      goto LABEL_27;
LABEL_31:
    v78 = objc_alloc_init(MIPPodcast);
    -[MIPPodcast setArtist:](v78, "setArtist:", v31);
    -[MIPPodcast setSeries:](v78, "setSeries:", v66);
    objc_msgSend(v93, "stringForColumnIndex:", 53);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPPodcast setExternalGuid:](v78, "setExternalGuid:", v79);

    objc_msgSend(v93, "stringForColumnIndex:", 128);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPPodcast setFeedUrl:](v78, "setFeedUrl:", v80);

    objc_msgSend(a1[4], "setPodcast:", v78);
    if ((v92 & 2) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  v75 = objc_alloc_init(MIPMovie);
  -[MIPMovie setArtist:](v75, "setArtist:", v31);
  -[MIPMovie setRentalDuration:](v75, "setRentalDuration:", (int)objc_msgSend(v93, "intForColumnIndex:", 33));
  -[MIPMovie setRentalPlaybackDuration:](v75, "setRentalPlaybackDuration:", (int)objc_msgSend(v93, "intForColumnIndex:", 34));
  -[MIPMovie setRentalPlaybackStartedDateTime:](v75, "setRentalPlaybackStartedDateTime:", (int)objc_msgSend(v93, "intForColumnIndex:", 35));
  -[MIPMovie setRentalStartedDateTime:](v75, "setRentalStartedDateTime:", (int)objc_msgSend(v93, "intForColumnIndex:", 36));
  -[MIPMovie setAudioLanguage:](v75, "setAudioLanguage:", objc_msgSend(v93, "intForColumnIndex:", 37));
  -[MIPMovie setAudioTrackId:](v75, "setAudioTrackId:", objc_msgSend(v93, "intForColumnIndex:", 38));
  -[MIPMovie setAudioTrackIndex:](v75, "setAudioTrackIndex:", objc_msgSend(v93, "intForColumnIndex:", 39));
  objc_msgSend(v93, "stringForColumnIndex:", 40);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMovie setExtendedContentName:](v75, "setExtendedContentName:", v76);

  objc_msgSend(v93, "stringForColumnIndex:", 41);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMovie setMovieInfo:](v75, "setMovieInfo:", v77);

  -[MIPMovie setSubtitleLanguage:](v75, "setSubtitleLanguage:", objc_msgSend(v93, "intForColumnIndex:", 42));
  -[MIPMovie setSubtitleTrackIndex:](v75, "setSubtitleTrackIndex:", objc_msgSend(v93, "intForColumnIndex:", 43));
  -[MIPMovie setVideoQuality:](v75, "setVideoQuality:", objc_msgSend(v93, "intForColumnIndex:", 44));
  -[MIPMovie setHasAlternateAudio:](v75, "setHasAlternateAudio:", objc_msgSend(v93, "intForColumnIndex:", 45) != 0);
  -[MIPMovie setHasChapterData:](v75, "setHasChapterData:", objc_msgSend(v93, "intForColumnIndex:", 46) != 0);
  -[MIPMovie setHasSubtitles:](v75, "setHasSubtitles:", objc_msgSend(v93, "intForColumnIndex:", 47) != 0);
  -[MIPMovie setRental:](v75, "setRental:", objc_msgSend(v93, "intForColumnIndex:", 48) != 0);
  objc_msgSend(v93, "dataForColumnIndex:", 111);
  v65 = objc_claimAutoreleasedReturnValue();
  -[MIPMovie setFlattenedChapterData:](v75, "setFlattenedChapterData:", v65);

  LOBYTE(v65) = v92;
  objc_msgSend(a1[4], "setMovie:", v75);

  if ((v92 & 4) != 0)
    goto LABEL_31;
LABEL_27:
  if ((v65 & 2) != 0)
  {
LABEL_28:
    v73 = objc_alloc_init(MIPAudiobook);
    -[MIPAudiobook setAudioFormat:](v73, "setAudioFormat:", objc_msgSend(v93, "intForColumnIndex:", 24));
    -[MIPAudiobook setDiscNumber:](v73, "setDiscNumber:", objc_msgSend(v93, "intForColumnIndex:", 25));
    -[MIPAudiobook setTrackNumber:](v73, "setTrackNumber:", objc_msgSend(v93, "intForColumnIndex:", 29));
    -[MIPAudiobook setUserRating:](v73, "setUserRating:", objc_msgSend(v93, "intForColumnIndex:", 30));
    -[MIPAudiobook setExcludeFromShuffle:](v73, "setExcludeFromShuffle:", objc_msgSend(v93, "intForColumnIndex:", 31) != 0);
    -[MIPAudiobook setHasVideo:](v73, "setHasVideo:", objc_msgSend(v93, "intForColumnIndex:", 32) != 0);
    objc_msgSend(v93, "stringForColumnIndex:", 138);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPAudiobook setHlsPlaylistURL:](v73, "setHlsPlaylistURL:", v74);

    -[MIPAudiobook setArtist:](v73, "setArtist:", v31);
    -[MIPAudiobook setAlbum:](v73, "setAlbum:", v38);
    -[MIPAudiobook setComposer:](v73, "setComposer:", v56);
    -[MIPAudiobook setGenre:](v73, "setGenre:", v59);
    -[MIPAudiobook setPlaybackInfo:](v73, "setPlaybackInfo:", v61);
    objc_msgSend(a1[4], "setAudiobook:", v73);

  }
LABEL_29:
  *a4 = 1;

}

void __56__ML3Track_MLProtocol__multiverseIdentifierLibraryOnly___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  char v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  v6 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__ML3Track_MLProtocol__multiverseIdentifierLibraryOnly___block_invoke_2;
  v11[3] = &unk_1E5B63E58;
  v10 = *(void **)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v10;
  v13 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v9, "enumerateRowsWithBlock:", v11);

}

void __56__ML3Track_MLProtocol__multiverseIdentifierLibraryOnly___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  MIPLibraryIdentifier *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v3 = objc_msgSend(v14, "int64ForColumnIndex:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "syncLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 >= 1 && objc_msgSend(v5, "length"))
  {
    v6 = objc_alloc_init(MIPLibraryIdentifier);
    -[MIPLibraryIdentifier setLibraryId:](v6, "setLibraryId:", v3);
    -[MIPLibraryIdentifier setLibraryName:](v6, "setLibraryName:", v5);
    objc_msgSend(*(id *)(a1 + 40), "addLibraryIdentifiers:", v6);

  }
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v14, "stringForColumnIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v14, "intForColumnIndex:", 2);
    v9 = objc_msgSend(v14, "int64ForColumnIndex:", 3);
    v10 = objc_msgSend(v14, "int64ForColumnIndex:", 4);
    v11 = objc_msgSend(v14, "int64ForColumnIndex:", 5);
    v12 = objc_msgSend(v14, "int64ForColumnIndex:", 6);
    objc_msgSend(v14, "stringForColumnIndex:", 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      objc_msgSend(*(id *)(a1 + 40), "setName:", v7);
    if (v8 >= 1)
      objc_msgSend(*(id *)(a1 + 40), "setMediaType:", ML3ProtocolMediaTypeForMLMediaType(v8));
    if (v9 >= 1)
      objc_msgSend(*(id *)(a1 + 40), "setAccountId:", v9);
    if (v10 >= 1)
      objc_msgSend(*(id *)(a1 + 40), "setStoreId:", v10);
    if (v11 >= 1)
      objc_msgSend(*(id *)(a1 + 40), "setSagaId:", v11);
    if (v12 >= 1)
      objc_msgSend(*(id *)(a1 + 40), "setPurchaseHistoryId:", v12);
    if (objc_msgSend(v13, "length"))
      objc_msgSend(*(id *)(a1 + 40), "setCloudUniversalLibraryId:", v13);

  }
}

@end
