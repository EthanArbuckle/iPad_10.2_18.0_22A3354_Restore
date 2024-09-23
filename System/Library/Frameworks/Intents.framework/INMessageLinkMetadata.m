@implementation INMessageLinkMetadata

- (INMessageLinkMetadata)initWithSiteName:(id)a3 summary:(id)a4 title:(id)a5 itemType:(id)a6 originalURL:(id)a7 imageURLs:(id)a8 iconURLs:(id)a9 creator:(id)a10 linkMediaType:(int64_t)a11 iTunesStoreIdentifier:(id)a12 iTunesStoreFrontIdentifier:(id)a13 songTitle:(id)a14 songArtist:(id)a15 songAlbum:(id)a16 albumName:(id)a17 albumArtist:(id)a18 musicVideoName:(id)a19 musicVideoArtist:(id)a20 artistName:(id)a21 artistGenre:(id)a22 playlistName:(id)a23 playlistCurator:(id)a24 radioName:(id)a25 radioCurator:(id)a26 softwareName:(id)a27 softwareGenre:(id)a28 softwarePlatform:(id)a29 bookName:(id)a30 bookAuthor:(id)a31 audioBookName:(id)a32 audioBookAuthor:(id)a33 audioBookNarrator:(id)a34 podcastName:(id)a35 podcastArtist:(id)a36 podcastEpisodeName:(id)a37 podcastEpisodePodcastName:(id)a38 podcastEpisodeArtist:(id)a39 podcastEpisodeReleaseDate:(id)a40 tvEpisodeEpisodeName:(id)a41 tvEpisodeSeasonName:(id)a42 tvEpisodeGenre:(id)a43 tvSeasonName:(id)a44 tvSeasonGenre:(id)a45 movieName:(id)a46 movieGenre:(id)a47 tvShowName:(id)a48 movieBundleName:(id)a49 movieBundleGenre:(id)a50 appleTvTitle:(id)a51 appleTvSubtitle:(id)a52
{
  return -[INMessageLinkMetadata initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:](self, "initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:", a3, a4, a5, 0, a6, 0, a7, a8, a9, a10, a11,
           a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52);
}

- (INMessageLinkMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INMessageLinkMetadata;
  return -[INMessageLinkMetadata init](&v3, sel_init);
}

- (INMessageLinkMetadata)initWithSiteName:(NSString *)siteName summary:(NSString *)summary title:(NSString *)title openGraphType:(NSString *)openGraphType linkURL:(NSURL *)linkURL
{
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSURL *v16;
  INMessageLinkMetadata *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v26;
  NSURL *v27;
  objc_super v29;

  v12 = siteName;
  v13 = summary;
  v14 = title;
  v15 = openGraphType;
  v16 = linkURL;
  v29.receiver = self;
  v29.super_class = (Class)INMessageLinkMetadata;
  v17 = -[INMessageLinkMetadata init](&v29, sel_init);
  if (v17)
  {
    v18 = -[NSString copy](v12, "copy");
    v19 = v17->_siteName;
    v17->_siteName = (NSString *)v18;

    v20 = -[NSString copy](v13, "copy");
    v21 = v17->_summary;
    v17->_summary = (NSString *)v20;

    v22 = -[NSString copy](v14, "copy");
    v23 = v17->_title;
    v17->_title = (NSString *)v22;

    v24 = -[NSString copy](v15, "copy");
    v25 = v17->_openGraphType;
    v17->_openGraphType = (NSString *)v24;

    v26 = -[NSURL copy](v16, "copy");
    v27 = v17->_linkURL;
    v17->_linkURL = (NSURL *)v26;

  }
  return v17;
}

- (INMessageLinkMetadata)initWithSiteName:(id)a3 summary:(id)a4 title:(id)a5 openGraphType:(id)a6 itemType:(id)a7 linkURL:(id)a8 originalURL:(id)a9 imageURLs:(id)a10 iconURLs:(id)a11 creator:(id)a12 linkMediaType:(int64_t)a13 iTunesStoreIdentifier:(id)a14 iTunesStoreFrontIdentifier:(id)a15 songTitle:(id)a16 songArtist:(id)a17 songAlbum:(id)a18 albumName:(id)a19 albumArtist:(id)a20 musicVideoName:(id)a21 musicVideoArtist:(id)a22 artistName:(id)a23 artistGenre:(id)a24 playlistName:(id)a25 playlistCurator:(id)a26 radioName:(id)a27 radioCurator:(id)a28 softwareName:(id)a29 softwareGenre:(id)a30 softwarePlatform:(id)a31 bookName:(id)a32 bookAuthor:(id)a33 audioBookName:(id)a34 audioBookAuthor:(id)a35 audioBookNarrator:(id)a36 podcastName:(id)a37 podcastArtist:(id)a38 podcastEpisodeName:(id)a39 podcastEpisodePodcastName:(id)a40 podcastEpisodeArtist:(id)a41 podcastEpisodeReleaseDate:(id)a42 tvEpisodeEpisodeName:(id)a43 tvEpisodeSeasonName:(id)a44 tvEpisodeGenre:(id)a45 tvSeasonName:(id)a46 tvSeasonGenre:(id)a47 movieName:(id)a48 movieGenre:(id)a49 tvShowName:(id)a50 movieBundleName:(id)a51 movieBundleGenre:(id)a52 appleTvTitle:(id)a53 appleTvSubtitle:(id)a54
{
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  INMessageLinkMetadata *v67;
  uint64_t v68;
  NSString *siteName;
  uint64_t v70;
  NSString *summary;
  uint64_t v72;
  NSString *title;
  uint64_t v74;
  NSString *openGraphType;
  uint64_t v76;
  NSString *itemType;
  uint64_t v78;
  NSURL *linkURL;
  uint64_t v80;
  NSString *originalURL;
  uint64_t v82;
  NSArray *imageURLs;
  uint64_t v84;
  NSArray *iconURLs;
  uint64_t v86;
  NSString *creator;
  uint64_t v88;
  NSString *iTunesStoreIdentifier;
  uint64_t v90;
  NSString *iTunesStoreFrontIdentifier;
  uint64_t v92;
  NSString *songTitle;
  uint64_t v94;
  NSString *songArtist;
  uint64_t v96;
  NSString *songAlbum;
  uint64_t v98;
  NSString *albumName;
  uint64_t v100;
  NSString *albumArtist;
  uint64_t v102;
  NSString *musicVideoName;
  uint64_t v104;
  NSString *musicVideoArtist;
  uint64_t v106;
  NSString *artistName;
  uint64_t v108;
  NSString *artistGenre;
  uint64_t v110;
  NSString *playlistName;
  uint64_t v112;
  NSString *playlistCurator;
  uint64_t v114;
  NSString *radioName;
  uint64_t v116;
  NSString *radioCurator;
  uint64_t v118;
  NSString *softwareName;
  uint64_t v120;
  NSString *softwareGenre;
  uint64_t v122;
  NSString *softwarePlatform;
  uint64_t v124;
  NSString *bookName;
  uint64_t v126;
  NSString *bookAuthor;
  uint64_t v128;
  NSString *audioBookName;
  uint64_t v130;
  NSString *audioBookAuthor;
  uint64_t v132;
  NSString *audioBookNarrator;
  uint64_t v134;
  NSString *podcastName;
  uint64_t v136;
  NSString *podcastArtist;
  uint64_t v138;
  NSString *podcastEpisodeName;
  uint64_t v140;
  NSString *podcastEpisodePodcastName;
  uint64_t v142;
  NSString *podcastEpisodeArtist;
  uint64_t v144;
  NSDateComponents *podcastEpisodeReleaseDate;
  uint64_t v146;
  NSString *tvEpisodeEpisodeName;
  uint64_t v148;
  NSString *tvEpisodeSeasonName;
  uint64_t v150;
  NSString *tvEpisodeGenre;
  uint64_t v152;
  NSString *tvSeasonName;
  uint64_t v154;
  NSString *tvSeasonGenre;
  uint64_t v156;
  NSString *movieName;
  uint64_t v158;
  NSString *movieGenre;
  uint64_t v160;
  NSString *tvShowName;
  uint64_t v162;
  NSString *movieBundleName;
  uint64_t v164;
  NSString *movieBundleGenre;
  uint64_t v166;
  NSString *appleTvTitle;
  uint64_t v168;
  NSString *appleTvSubtitle;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v212;
  id v213;
  id v214;
  objc_super v215;

  v204 = a3;
  v205 = a4;
  v214 = a5;
  v213 = a6;
  v212 = a7;
  v210 = a8;
  v209 = a9;
  v208 = a10;
  v207 = a11;
  v206 = a12;
  v58 = a14;
  v59 = a15;
  v60 = a16;
  v61 = a17;
  v62 = a18;
  v63 = a19;
  v64 = a20;
  v65 = a21;
  v66 = a22;
  v203 = a23;
  v202 = a24;
  v201 = a25;
  v200 = a26;
  v199 = a27;
  v198 = a28;
  v197 = a29;
  v196 = a30;
  v195 = a31;
  v194 = a32;
  v193 = a33;
  v192 = a34;
  v191 = a35;
  v190 = a36;
  v189 = a37;
  v188 = a38;
  v187 = a39;
  v186 = a40;
  v185 = a41;
  v184 = a42;
  v183 = a43;
  v182 = a44;
  v181 = a45;
  v180 = a46;
  v179 = a47;
  v178 = a48;
  v177 = a49;
  v176 = a50;
  v175 = a51;
  v174 = a52;
  v173 = a53;
  v172 = a54;
  v215.receiver = self;
  v215.super_class = (Class)INMessageLinkMetadata;
  v67 = -[INMessageLinkMetadata init](&v215, sel_init);
  if (v67)
  {
    v68 = objc_msgSend(v204, "copy");
    siteName = v67->_siteName;
    v67->_siteName = (NSString *)v68;

    v70 = objc_msgSend(v205, "copy");
    summary = v67->_summary;
    v67->_summary = (NSString *)v70;

    v72 = objc_msgSend(v214, "copy");
    title = v67->_title;
    v67->_title = (NSString *)v72;

    v74 = objc_msgSend(v213, "copy");
    openGraphType = v67->_openGraphType;
    v67->_openGraphType = (NSString *)v74;

    v76 = objc_msgSend(v212, "copy");
    itemType = v67->_itemType;
    v67->_itemType = (NSString *)v76;

    v78 = objc_msgSend(v210, "copy");
    linkURL = v67->_linkURL;
    v67->_linkURL = (NSURL *)v78;

    v80 = objc_msgSend(v209, "copy");
    originalURL = v67->_originalURL;
    v67->_originalURL = (NSString *)v80;

    v82 = objc_msgSend(v208, "copy");
    imageURLs = v67->_imageURLs;
    v67->_imageURLs = (NSArray *)v82;

    v84 = objc_msgSend(v207, "copy");
    iconURLs = v67->_iconURLs;
    v67->_iconURLs = (NSArray *)v84;

    v86 = objc_msgSend(v206, "copy");
    creator = v67->_creator;
    v67->_creator = (NSString *)v86;

    v67->_linkMediaType = a13;
    v88 = objc_msgSend(v58, "copy");
    iTunesStoreIdentifier = v67->_iTunesStoreIdentifier;
    v67->_iTunesStoreIdentifier = (NSString *)v88;

    v90 = objc_msgSend(v59, "copy");
    iTunesStoreFrontIdentifier = v67->_iTunesStoreFrontIdentifier;
    v67->_iTunesStoreFrontIdentifier = (NSString *)v90;

    v92 = objc_msgSend(v60, "copy");
    songTitle = v67->_songTitle;
    v67->_songTitle = (NSString *)v92;

    v94 = objc_msgSend(v61, "copy");
    songArtist = v67->_songArtist;
    v67->_songArtist = (NSString *)v94;

    v96 = objc_msgSend(v62, "copy");
    songAlbum = v67->_songAlbum;
    v67->_songAlbum = (NSString *)v96;

    v98 = objc_msgSend(v63, "copy");
    albumName = v67->_albumName;
    v67->_albumName = (NSString *)v98;

    v100 = objc_msgSend(v64, "copy");
    albumArtist = v67->_albumArtist;
    v67->_albumArtist = (NSString *)v100;

    v102 = objc_msgSend(v65, "copy");
    musicVideoName = v67->_musicVideoName;
    v67->_musicVideoName = (NSString *)v102;

    v104 = objc_msgSend(v66, "copy");
    musicVideoArtist = v67->_musicVideoArtist;
    v67->_musicVideoArtist = (NSString *)v104;

    v106 = objc_msgSend(v203, "copy");
    artistName = v67->_artistName;
    v67->_artistName = (NSString *)v106;

    v108 = objc_msgSend(v202, "copy");
    artistGenre = v67->_artistGenre;
    v67->_artistGenre = (NSString *)v108;

    v110 = objc_msgSend(v201, "copy");
    playlistName = v67->_playlistName;
    v67->_playlistName = (NSString *)v110;

    v112 = objc_msgSend(v200, "copy");
    playlistCurator = v67->_playlistCurator;
    v67->_playlistCurator = (NSString *)v112;

    v114 = objc_msgSend(v199, "copy");
    radioName = v67->_radioName;
    v67->_radioName = (NSString *)v114;

    v116 = objc_msgSend(v198, "copy");
    radioCurator = v67->_radioCurator;
    v67->_radioCurator = (NSString *)v116;

    v118 = objc_msgSend(v197, "copy");
    softwareName = v67->_softwareName;
    v67->_softwareName = (NSString *)v118;

    v120 = objc_msgSend(v196, "copy");
    softwareGenre = v67->_softwareGenre;
    v67->_softwareGenre = (NSString *)v120;

    v122 = objc_msgSend(v195, "copy");
    softwarePlatform = v67->_softwarePlatform;
    v67->_softwarePlatform = (NSString *)v122;

    v124 = objc_msgSend(v194, "copy");
    bookName = v67->_bookName;
    v67->_bookName = (NSString *)v124;

    v126 = objc_msgSend(v193, "copy");
    bookAuthor = v67->_bookAuthor;
    v67->_bookAuthor = (NSString *)v126;

    v128 = objc_msgSend(v192, "copy");
    audioBookName = v67->_audioBookName;
    v67->_audioBookName = (NSString *)v128;

    v130 = objc_msgSend(v191, "copy");
    audioBookAuthor = v67->_audioBookAuthor;
    v67->_audioBookAuthor = (NSString *)v130;

    v132 = objc_msgSend(v190, "copy");
    audioBookNarrator = v67->_audioBookNarrator;
    v67->_audioBookNarrator = (NSString *)v132;

    v134 = objc_msgSend(v189, "copy");
    podcastName = v67->_podcastName;
    v67->_podcastName = (NSString *)v134;

    v136 = objc_msgSend(v188, "copy");
    podcastArtist = v67->_podcastArtist;
    v67->_podcastArtist = (NSString *)v136;

    v138 = objc_msgSend(v187, "copy");
    podcastEpisodeName = v67->_podcastEpisodeName;
    v67->_podcastEpisodeName = (NSString *)v138;

    v140 = objc_msgSend(v186, "copy");
    podcastEpisodePodcastName = v67->_podcastEpisodePodcastName;
    v67->_podcastEpisodePodcastName = (NSString *)v140;

    v142 = objc_msgSend(v185, "copy");
    podcastEpisodeArtist = v67->_podcastEpisodeArtist;
    v67->_podcastEpisodeArtist = (NSString *)v142;

    v144 = objc_msgSend(v184, "copy");
    podcastEpisodeReleaseDate = v67->_podcastEpisodeReleaseDate;
    v67->_podcastEpisodeReleaseDate = (NSDateComponents *)v144;

    v146 = objc_msgSend(v183, "copy");
    tvEpisodeEpisodeName = v67->_tvEpisodeEpisodeName;
    v67->_tvEpisodeEpisodeName = (NSString *)v146;

    v148 = objc_msgSend(v182, "copy");
    tvEpisodeSeasonName = v67->_tvEpisodeSeasonName;
    v67->_tvEpisodeSeasonName = (NSString *)v148;

    v150 = objc_msgSend(v181, "copy");
    tvEpisodeGenre = v67->_tvEpisodeGenre;
    v67->_tvEpisodeGenre = (NSString *)v150;

    v152 = objc_msgSend(v180, "copy");
    tvSeasonName = v67->_tvSeasonName;
    v67->_tvSeasonName = (NSString *)v152;

    v154 = objc_msgSend(v179, "copy");
    tvSeasonGenre = v67->_tvSeasonGenre;
    v67->_tvSeasonGenre = (NSString *)v154;

    v156 = objc_msgSend(v178, "copy");
    movieName = v67->_movieName;
    v67->_movieName = (NSString *)v156;

    v158 = objc_msgSend(v177, "copy");
    movieGenre = v67->_movieGenre;
    v67->_movieGenre = (NSString *)v158;

    v160 = objc_msgSend(v176, "copy");
    tvShowName = v67->_tvShowName;
    v67->_tvShowName = (NSString *)v160;

    v162 = objc_msgSend(v175, "copy");
    movieBundleName = v67->_movieBundleName;
    v67->_movieBundleName = (NSString *)v162;

    v164 = objc_msgSend(v174, "copy");
    movieBundleGenre = v67->_movieBundleGenre;
    v67->_movieBundleGenre = (NSString *)v164;

    v166 = objc_msgSend(v173, "copy");
    appleTvTitle = v67->_appleTvTitle;
    v67->_appleTvTitle = (NSString *)v166;

    v168 = objc_msgSend(v172, "copy");
    appleTvSubtitle = v67->_appleTvSubtitle;
    v67->_appleTvSubtitle = (NSString *)v168;

  }
  return v67;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  uint64_t v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;

  v3 = -[NSString hash](self->_siteName, "hash");
  v4 = -[NSString hash](self->_summary, "hash") ^ v3;
  v5 = -[NSString hash](self->_title, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_openGraphType, "hash");
  v7 = -[NSString hash](self->_itemType, "hash");
  v8 = v7 ^ -[NSURL hash](self->_linkURL, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_originalURL, "hash");
  v10 = -[NSArray hash](self->_imageURLs, "hash");
  v11 = v10 ^ -[NSArray hash](self->_iconURLs, "hash");
  v12 = v11 ^ -[NSString hash](self->_creator, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_linkMediaType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9 ^ v12 ^ objc_msgSend(v13, "hash");
  v15 = -[NSString hash](self->_iTunesStoreIdentifier, "hash");
  v16 = v15 ^ -[NSString hash](self->_iTunesStoreFrontIdentifier, "hash");
  v17 = v16 ^ -[NSString hash](self->_songTitle, "hash");
  v18 = v17 ^ -[NSString hash](self->_songArtist, "hash");
  v19 = v14 ^ v18 ^ -[NSString hash](self->_songAlbum, "hash");
  v20 = -[NSString hash](self->_albumName, "hash");
  v21 = v20 ^ -[NSString hash](self->_albumArtist, "hash");
  v22 = v21 ^ -[NSString hash](self->_musicVideoName, "hash");
  v23 = v22 ^ -[NSString hash](self->_musicVideoArtist, "hash");
  v24 = v23 ^ -[NSString hash](self->_artistName, "hash");
  v25 = v19 ^ v24 ^ -[NSString hash](self->_artistGenre, "hash");
  v26 = -[NSString hash](self->_playlistName, "hash");
  v27 = v26 ^ -[NSString hash](self->_playlistCurator, "hash");
  v28 = v27 ^ -[NSString hash](self->_radioName, "hash");
  v29 = v28 ^ -[NSString hash](self->_radioCurator, "hash");
  v30 = v29 ^ -[NSString hash](self->_softwareName, "hash");
  v31 = v30 ^ -[NSString hash](self->_softwareGenre, "hash");
  v32 = v25 ^ v31 ^ -[NSString hash](self->_softwarePlatform, "hash");
  v33 = -[NSString hash](self->_bookName, "hash");
  v34 = v33 ^ -[NSString hash](self->_bookAuthor, "hash");
  v35 = v34 ^ -[NSString hash](self->_audioBookName, "hash");
  v36 = v35 ^ -[NSString hash](self->_audioBookAuthor, "hash");
  v37 = v36 ^ -[NSString hash](self->_audioBookNarrator, "hash");
  v38 = v37 ^ -[NSString hash](self->_podcastName, "hash");
  v39 = v38 ^ -[NSString hash](self->_podcastArtist, "hash");
  v40 = v32 ^ v39 ^ -[NSString hash](self->_podcastEpisodeName, "hash");
  v41 = -[NSString hash](self->_podcastEpisodePodcastName, "hash");
  v42 = v41 ^ -[NSString hash](self->_podcastEpisodeArtist, "hash");
  v43 = v42 ^ -[NSDateComponents hash](self->_podcastEpisodeReleaseDate, "hash");
  v44 = v43 ^ -[NSString hash](self->_tvEpisodeEpisodeName, "hash");
  v45 = v44 ^ -[NSString hash](self->_tvEpisodeSeasonName, "hash");
  v46 = v45 ^ -[NSString hash](self->_tvEpisodeGenre, "hash");
  v47 = v46 ^ -[NSString hash](self->_tvSeasonName, "hash");
  v48 = v47 ^ -[NSString hash](self->_tvSeasonGenre, "hash");
  v49 = v40 ^ v48 ^ -[NSString hash](self->_movieName, "hash");
  v50 = -[NSString hash](self->_movieGenre, "hash");
  v51 = v50 ^ -[NSString hash](self->_tvShowName, "hash");
  v52 = v51 ^ -[NSString hash](self->_movieBundleName, "hash");
  v53 = v52 ^ -[NSString hash](self->_movieBundleGenre, "hash");
  v54 = v53 ^ -[NSString hash](self->_appleTvTitle, "hash");
  v55 = v49 ^ v54 ^ -[NSString hash](self->_appleTvSubtitle, "hash");

  return v55;
}

- (BOOL)isEqual:(id)a3
{
  INMessageLinkMetadata *v4;
  INMessageLinkMetadata *v5;
  NSString *siteName;
  NSString *summary;
  NSString *title;
  NSString *openGraphType;
  NSString *itemType;
  NSURL *linkURL;
  NSString *originalURL;
  NSArray *imageURLs;
  NSArray *iconURLs;
  NSString *creator;
  NSString *iTunesStoreIdentifier;
  NSString *iTunesStoreFrontIdentifier;
  NSString *songTitle;
  NSString *songArtist;
  NSString *songAlbum;
  NSString *albumName;
  NSString *albumArtist;
  NSString *musicVideoName;
  NSString *musicVideoArtist;
  NSString *artistName;
  NSString *artistGenre;
  NSString *playlistName;
  NSString *playlistCurator;
  NSString *radioName;
  NSString *radioCurator;
  NSString *softwareName;
  NSString *softwareGenre;
  NSString *softwarePlatform;
  NSString *bookName;
  NSString *bookAuthor;
  NSString *audioBookName;
  NSString *audioBookAuthor;
  NSString *audioBookNarrator;
  NSString *podcastName;
  NSString *podcastArtist;
  NSString *podcastEpisodeName;
  NSString *podcastEpisodePodcastName;
  NSString *podcastEpisodeArtist;
  NSDateComponents *podcastEpisodeReleaseDate;
  NSString *tvEpisodeEpisodeName;
  NSString *tvEpisodeSeasonName;
  NSString *tvEpisodeGenre;
  NSString *tvSeasonName;
  NSString *tvSeasonGenre;
  NSString *movieName;
  NSString *movieGenre;
  NSString *tvShowName;
  NSString *movieBundleName;
  NSString *movieBundleGenre;
  NSString *appleTvTitle;
  NSString *appleTvSubtitle;
  BOOL v57;

  v4 = (INMessageLinkMetadata *)a3;
  if (v4 == self)
  {
    v57 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      siteName = self->_siteName;
      if (siteName != v5->_siteName && !-[NSString isEqual:](siteName, "isEqual:"))
        goto LABEL_109;
      summary = self->_summary;
      if (summary != v5->_summary && !-[NSString isEqual:](summary, "isEqual:"))
        goto LABEL_109;
      title = self->_title;
      if (title != v5->_title && !-[NSString isEqual:](title, "isEqual:"))
        goto LABEL_109;
      openGraphType = self->_openGraphType;
      if (openGraphType != v5->_openGraphType && !-[NSString isEqual:](openGraphType, "isEqual:"))
        goto LABEL_109;
      itemType = self->_itemType;
      if (itemType != v5->_itemType && !-[NSString isEqual:](itemType, "isEqual:"))
        goto LABEL_109;
      linkURL = self->_linkURL;
      if (linkURL != v5->_linkURL && !-[NSURL isEqual:](linkURL, "isEqual:"))
        goto LABEL_109;
      originalURL = self->_originalURL;
      if (originalURL != v5->_originalURL && !-[NSString isEqual:](originalURL, "isEqual:"))
        goto LABEL_109;
      imageURLs = self->_imageURLs;
      if (imageURLs != v5->_imageURLs && !-[NSArray isEqual:](imageURLs, "isEqual:"))
        goto LABEL_109;
      iconURLs = self->_iconURLs;
      if (iconURLs != v5->_iconURLs && !-[NSArray isEqual:](iconURLs, "isEqual:"))
        goto LABEL_109;
      creator = self->_creator;
      if (creator != v5->_creator && !-[NSString isEqual:](creator, "isEqual:"))
        goto LABEL_109;
      if (self->_linkMediaType != v5->_linkMediaType)
        goto LABEL_109;
      iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
      if (iTunesStoreIdentifier != v5->_iTunesStoreIdentifier
        && !-[NSString isEqual:](iTunesStoreIdentifier, "isEqual:"))
      {
        goto LABEL_109;
      }
      iTunesStoreFrontIdentifier = self->_iTunesStoreFrontIdentifier;
      if (iTunesStoreFrontIdentifier != v5->_iTunesStoreFrontIdentifier
        && !-[NSString isEqual:](iTunesStoreFrontIdentifier, "isEqual:"))
      {
        goto LABEL_109;
      }
      songTitle = self->_songTitle;
      if (songTitle != v5->_songTitle && !-[NSString isEqual:](songTitle, "isEqual:"))
        goto LABEL_109;
      songArtist = self->_songArtist;
      if (songArtist != v5->_songArtist && !-[NSString isEqual:](songArtist, "isEqual:"))
        goto LABEL_109;
      songAlbum = self->_songAlbum;
      if (songAlbum != v5->_songAlbum && !-[NSString isEqual:](songAlbum, "isEqual:"))
        goto LABEL_109;
      albumName = self->_albumName;
      if (albumName != v5->_albumName && !-[NSString isEqual:](albumName, "isEqual:"))
        goto LABEL_109;
      albumArtist = self->_albumArtist;
      if (albumArtist != v5->_albumArtist && !-[NSString isEqual:](albumArtist, "isEqual:"))
        goto LABEL_109;
      musicVideoName = self->_musicVideoName;
      if (musicVideoName != v5->_musicVideoName && !-[NSString isEqual:](musicVideoName, "isEqual:"))
        goto LABEL_109;
      musicVideoArtist = self->_musicVideoArtist;
      if (musicVideoArtist != v5->_musicVideoArtist
        && !-[NSString isEqual:](musicVideoArtist, "isEqual:"))
      {
        goto LABEL_109;
      }
      artistName = self->_artistName;
      if (artistName != v5->_artistName && !-[NSString isEqual:](artistName, "isEqual:"))
        goto LABEL_109;
      artistGenre = self->_artistGenre;
      if (artistGenre != v5->_artistGenre && !-[NSString isEqual:](artistGenre, "isEqual:"))
        goto LABEL_109;
      playlistName = self->_playlistName;
      if (playlistName != v5->_playlistName && !-[NSString isEqual:](playlistName, "isEqual:"))
        goto LABEL_109;
      playlistCurator = self->_playlistCurator;
      if (playlistCurator != v5->_playlistCurator && !-[NSString isEqual:](playlistCurator, "isEqual:"))
        goto LABEL_109;
      radioName = self->_radioName;
      if (radioName != v5->_radioName && !-[NSString isEqual:](radioName, "isEqual:"))
        goto LABEL_109;
      radioCurator = self->_radioCurator;
      if (radioCurator != v5->_radioCurator && !-[NSString isEqual:](radioCurator, "isEqual:"))
        goto LABEL_109;
      softwareName = self->_softwareName;
      if (softwareName != v5->_softwareName && !-[NSString isEqual:](softwareName, "isEqual:"))
        goto LABEL_109;
      softwareGenre = self->_softwareGenre;
      if (softwareGenre != v5->_softwareGenre && !-[NSString isEqual:](softwareGenre, "isEqual:"))
        goto LABEL_109;
      softwarePlatform = self->_softwarePlatform;
      if (softwarePlatform != v5->_softwarePlatform
        && !-[NSString isEqual:](softwarePlatform, "isEqual:"))
      {
        goto LABEL_109;
      }
      bookName = self->_bookName;
      if (bookName != v5->_bookName && !-[NSString isEqual:](bookName, "isEqual:"))
        goto LABEL_109;
      bookAuthor = self->_bookAuthor;
      if (bookAuthor != v5->_bookAuthor && !-[NSString isEqual:](bookAuthor, "isEqual:"))
        goto LABEL_109;
      audioBookName = self->_audioBookName;
      if (audioBookName != v5->_audioBookName && !-[NSString isEqual:](audioBookName, "isEqual:"))
        goto LABEL_109;
      audioBookAuthor = self->_audioBookAuthor;
      if (audioBookAuthor != v5->_audioBookAuthor && !-[NSString isEqual:](audioBookAuthor, "isEqual:"))
        goto LABEL_109;
      audioBookNarrator = self->_audioBookNarrator;
      if (audioBookNarrator != v5->_audioBookNarrator
        && !-[NSString isEqual:](audioBookNarrator, "isEqual:"))
      {
        goto LABEL_109;
      }
      podcastName = self->_podcastName;
      if (podcastName != v5->_podcastName && !-[NSString isEqual:](podcastName, "isEqual:"))
        goto LABEL_109;
      podcastArtist = self->_podcastArtist;
      if (podcastArtist != v5->_podcastArtist && !-[NSString isEqual:](podcastArtist, "isEqual:"))
        goto LABEL_109;
      podcastEpisodeName = self->_podcastEpisodeName;
      if (podcastEpisodeName != v5->_podcastEpisodeName
        && !-[NSString isEqual:](podcastEpisodeName, "isEqual:"))
      {
        goto LABEL_109;
      }
      podcastEpisodePodcastName = self->_podcastEpisodePodcastName;
      if (podcastEpisodePodcastName != v5->_podcastEpisodePodcastName
        && !-[NSString isEqual:](podcastEpisodePodcastName, "isEqual:"))
      {
        goto LABEL_109;
      }
      podcastEpisodeArtist = self->_podcastEpisodeArtist;
      if (podcastEpisodeArtist != v5->_podcastEpisodeArtist
        && !-[NSString isEqual:](podcastEpisodeArtist, "isEqual:"))
      {
        goto LABEL_109;
      }
      podcastEpisodeReleaseDate = self->_podcastEpisodeReleaseDate;
      if (podcastEpisodeReleaseDate != v5->_podcastEpisodeReleaseDate
        && !-[NSDateComponents isEqual:](podcastEpisodeReleaseDate, "isEqual:"))
      {
        goto LABEL_109;
      }
      tvEpisodeEpisodeName = self->_tvEpisodeEpisodeName;
      if (tvEpisodeEpisodeName != v5->_tvEpisodeEpisodeName
        && !-[NSString isEqual:](tvEpisodeEpisodeName, "isEqual:"))
      {
        goto LABEL_109;
      }
      tvEpisodeSeasonName = self->_tvEpisodeSeasonName;
      if (tvEpisodeSeasonName != v5->_tvEpisodeSeasonName
        && !-[NSString isEqual:](tvEpisodeSeasonName, "isEqual:"))
      {
        goto LABEL_109;
      }
      tvEpisodeGenre = self->_tvEpisodeGenre;
      if (tvEpisodeGenre != v5->_tvEpisodeGenre && !-[NSString isEqual:](tvEpisodeGenre, "isEqual:"))
        goto LABEL_109;
      tvSeasonName = self->_tvSeasonName;
      if (tvSeasonName != v5->_tvSeasonName && !-[NSString isEqual:](tvSeasonName, "isEqual:"))
        goto LABEL_109;
      tvSeasonGenre = self->_tvSeasonGenre;
      if (tvSeasonGenre != v5->_tvSeasonGenre && !-[NSString isEqual:](tvSeasonGenre, "isEqual:"))
        goto LABEL_109;
      if (((movieName = self->_movieName, movieName == v5->_movieName)
         || -[NSString isEqual:](movieName, "isEqual:"))
        && ((movieGenre = self->_movieGenre, movieGenre == v5->_movieGenre)
         || -[NSString isEqual:](movieGenre, "isEqual:"))
        && ((tvShowName = self->_tvShowName, tvShowName == v5->_tvShowName)
         || -[NSString isEqual:](tvShowName, "isEqual:"))
        && ((movieBundleName = self->_movieBundleName, movieBundleName == v5->_movieBundleName)
         || -[NSString isEqual:](movieBundleName, "isEqual:"))
        && ((movieBundleGenre = self->_movieBundleGenre, movieBundleGenre == v5->_movieBundleGenre)
         || -[NSString isEqual:](movieBundleGenre, "isEqual:"))
        && ((appleTvTitle = self->_appleTvTitle, appleTvTitle == v5->_appleTvTitle)
         || -[NSString isEqual:](appleTvTitle, "isEqual:"))
        && ((appleTvSubtitle = self->_appleTvSubtitle, appleTvSubtitle == v5->_appleTvSubtitle)
         || -[NSString isEqual:](appleTvSubtitle, "isEqual:")))
      {
        v57 = 1;
      }
      else
      {
LABEL_109:
        v57 = 0;
      }

    }
    else
    {
      v57 = 0;
    }
  }

  return v57;
}

- (INMessageLinkMetadata)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  INMessageLinkMetadata *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  _QWORD v206[3];
  _QWORD v207[5];

  v207[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("siteName"));
  v205 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("summary"));
  v204 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("title"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("openGraphType"));
  v202 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("itemType"));
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkURL"));
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("originalURL"));
  v199 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E60];
  v207[0] = objc_opt_class();
  v207[1] = objc_opt_class();
  v207[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v207, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("imageURLs"));
  v198 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0C99E60];
  v206[0] = objc_opt_class();
  v206[1] = objc_opt_class();
  v206[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v206, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("iconURLs"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("creator"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();

  v167 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("linkMediaType"));
  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("iTunesStoreIdentifier"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("iTunesStoreFrontIdentifier"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("songTitle"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x1E0C99E60];
  v41 = objc_opt_class();
  objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("songArtist"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)MEMORY[0x1E0C99E60];
  v44 = objc_opt_class();
  objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("songAlbum"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)MEMORY[0x1E0C99E60];
  v47 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("albumName"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)MEMORY[0x1E0C99E60];
  v50 = objc_opt_class();
  objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v51, CFSTR("albumArtist"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0C99E60];
  v53 = objc_opt_class();
  objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("musicVideoName"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (void *)MEMORY[0x1E0C99E60];
  v56 = objc_opt_class();
  objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, CFSTR("musicVideoArtist"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x1E0C99E60];
  v59 = objc_opt_class();
  objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v60, CFSTR("artistName"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)MEMORY[0x1E0C99E60];
  v62 = objc_opt_class();
  objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v63, CFSTR("artistGenre"));
  v185 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = (void *)MEMORY[0x1E0C99E60];
  v65 = objc_opt_class();
  objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v66, CFSTR("playlistName"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = (void *)MEMORY[0x1E0C99E60];
  v68 = objc_opt_class();
  objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v69, CFSTR("playlistCurator"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = (void *)MEMORY[0x1E0C99E60];
  v71 = objc_opt_class();
  objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v72, CFSTR("radioName"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = (void *)MEMORY[0x1E0C99E60];
  v74 = objc_opt_class();
  objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v75, CFSTR("radioCurator"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = (void *)MEMORY[0x1E0C99E60];
  v77 = objc_opt_class();
  objc_msgSend(v76, "setWithObjects:", v77, objc_opt_class(), 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v78, CFSTR("softwareName"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = (void *)MEMORY[0x1E0C99E60];
  v80 = objc_opt_class();
  objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v81, CFSTR("softwareGenre"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = (void *)MEMORY[0x1E0C99E60];
  v83 = objc_opt_class();
  objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v84, CFSTR("softwarePlatform"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = (void *)MEMORY[0x1E0C99E60];
  v86 = objc_opt_class();
  objc_msgSend(v85, "setWithObjects:", v86, objc_opt_class(), 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v87, CFSTR("bookName"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = (void *)MEMORY[0x1E0C99E60];
  v89 = objc_opt_class();
  objc_msgSend(v88, "setWithObjects:", v89, objc_opt_class(), 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v90, CFSTR("bookAuthor"));
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = (void *)MEMORY[0x1E0C99E60];
  v92 = objc_opt_class();
  objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v93, CFSTR("audioBookName"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = (void *)MEMORY[0x1E0C99E60];
  v95 = objc_opt_class();
  objc_msgSend(v94, "setWithObjects:", v95, objc_opt_class(), 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v96, CFSTR("audioBookAuthor"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = (void *)MEMORY[0x1E0C99E60];
  v98 = objc_opt_class();
  objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v99, CFSTR("audioBookNarrator"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = (void *)MEMORY[0x1E0C99E60];
  v101 = objc_opt_class();
  objc_msgSend(v100, "setWithObjects:", v101, objc_opt_class(), 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v102, CFSTR("podcastName"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = (void *)MEMORY[0x1E0C99E60];
  v104 = objc_opt_class();
  objc_msgSend(v103, "setWithObjects:", v104, objc_opt_class(), 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v105, CFSTR("podcastArtist"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  v106 = (void *)MEMORY[0x1E0C99E60];
  v107 = objc_opt_class();
  objc_msgSend(v106, "setWithObjects:", v107, objc_opt_class(), 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v108, CFSTR("podcastEpisodeName"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = (void *)MEMORY[0x1E0C99E60];
  v110 = objc_opt_class();
  objc_msgSend(v109, "setWithObjects:", v110, objc_opt_class(), 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v111, CFSTR("podcastEpisodePodcastName"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  v112 = (void *)MEMORY[0x1E0C99E60];
  v113 = objc_opt_class();
  objc_msgSend(v112, "setWithObjects:", v113, objc_opt_class(), 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v114, CFSTR("podcastEpisodeArtist"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("podcastEpisodeReleaseDate"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)MEMORY[0x1E0C99E60];
  v116 = objc_opt_class();
  objc_msgSend(v115, "setWithObjects:", v116, objc_opt_class(), 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v117, CFSTR("tvEpisodeEpisodeName"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = (void *)MEMORY[0x1E0C99E60];
  v119 = objc_opt_class();
  objc_msgSend(v118, "setWithObjects:", v119, objc_opt_class(), 0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v120, CFSTR("tvEpisodeSeasonName"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  v121 = (void *)MEMORY[0x1E0C99E60];
  v122 = objc_opt_class();
  objc_msgSend(v121, "setWithObjects:", v122, objc_opt_class(), 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v123, CFSTR("tvEpisodeGenre"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = (void *)MEMORY[0x1E0C99E60];
  v125 = objc_opt_class();
  objc_msgSend(v124, "setWithObjects:", v125, objc_opt_class(), 0);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v126, CFSTR("tvSeasonName"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  v127 = (void *)MEMORY[0x1E0C99E60];
  v128 = objc_opt_class();
  objc_msgSend(v127, "setWithObjects:", v128, objc_opt_class(), 0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v129, CFSTR("tvSeasonGenre"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  v130 = (void *)MEMORY[0x1E0C99E60];
  v131 = objc_opt_class();
  objc_msgSend(v130, "setWithObjects:", v131, objc_opt_class(), 0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v132, CFSTR("movieName"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = (void *)MEMORY[0x1E0C99E60];
  v134 = objc_opt_class();
  objc_msgSend(v133, "setWithObjects:", v134, objc_opt_class(), 0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v135, CFSTR("movieGenre"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  v136 = (void *)MEMORY[0x1E0C99E60];
  v137 = objc_opt_class();
  objc_msgSend(v136, "setWithObjects:", v137, objc_opt_class(), 0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v138, CFSTR("tvShowName"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  v139 = (void *)MEMORY[0x1E0C99E60];
  v140 = objc_opt_class();
  objc_msgSend(v139, "setWithObjects:", v140, objc_opt_class(), 0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v141, CFSTR("movieBundleName"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  v142 = (void *)MEMORY[0x1E0C99E60];
  v143 = objc_opt_class();
  objc_msgSend(v142, "setWithObjects:", v143, objc_opt_class(), 0);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v144, CFSTR("movieBundleGenre"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  v145 = (void *)MEMORY[0x1E0C99E60];
  v146 = objc_opt_class();
  objc_msgSend(v145, "setWithObjects:", v146, objc_opt_class(), 0);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v147, CFSTR("appleTvTitle"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  v148 = (void *)MEMORY[0x1E0C99E60];
  v149 = objc_opt_class();
  objc_msgSend(v148, "setWithObjects:", v149, objc_opt_class(), 0);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v150, CFSTR("appleTvSubtitle"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  v169 = -[INMessageLinkMetadata initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:](self, "initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:", v205, v204, v203, v202, v201, v200, v199, v198, v197, v196, v167,
           v195,
           v194,
           v193,
           v192,
           v191,
           v190,
           v189,
           v188,
           v187,
           v186,
           v185,
           v184,
           v183,
           v182,
           v181,
           v180,
           v179,
           v178,
           v177,
           v176,
           v175,
           v174,
           v173,
           v172,
           v171,
           v170,
           v166,
           v165,
           v164,
           v163,
           v162,
           v161,
           v160,
           v159,
           v158,
           v157,
           v156,
           v155,
           v154,
           v153,
           v151);

  return v169;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *siteName;
  id v5;

  siteName = self->_siteName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", siteName, CFSTR("siteName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_summary, CFSTR("summary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openGraphType, CFSTR("openGraphType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemType, CFSTR("itemType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linkURL, CFSTR("linkURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalURL, CFSTR("originalURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURLs, CFSTR("imageURLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURLs, CFSTR("iconURLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creator, CFSTR("creator"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_linkMediaType, CFSTR("linkMediaType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iTunesStoreIdentifier, CFSTR("iTunesStoreIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iTunesStoreFrontIdentifier, CFSTR("iTunesStoreFrontIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_songTitle, CFSTR("songTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_songArtist, CFSTR("songArtist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_songAlbum, CFSTR("songAlbum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_albumName, CFSTR("albumName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_albumArtist, CFSTR("albumArtist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_musicVideoName, CFSTR("musicVideoName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_musicVideoArtist, CFSTR("musicVideoArtist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artistName, CFSTR("artistName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artistGenre, CFSTR("artistGenre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playlistName, CFSTR("playlistName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playlistCurator, CFSTR("playlistCurator"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_radioName, CFSTR("radioName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_radioCurator, CFSTR("radioCurator"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_softwareName, CFSTR("softwareName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_softwareGenre, CFSTR("softwareGenre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_softwarePlatform, CFSTR("softwarePlatform"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookName, CFSTR("bookName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookAuthor, CFSTR("bookAuthor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioBookName, CFSTR("audioBookName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioBookAuthor, CFSTR("audioBookAuthor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioBookNarrator, CFSTR("audioBookNarrator"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_podcastName, CFSTR("podcastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_podcastArtist, CFSTR("podcastArtist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_podcastEpisodeName, CFSTR("podcastEpisodeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_podcastEpisodePodcastName, CFSTR("podcastEpisodePodcastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_podcastEpisodeArtist, CFSTR("podcastEpisodeArtist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_podcastEpisodeReleaseDate, CFSTR("podcastEpisodeReleaseDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tvEpisodeEpisodeName, CFSTR("tvEpisodeEpisodeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tvEpisodeSeasonName, CFSTR("tvEpisodeSeasonName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tvEpisodeGenre, CFSTR("tvEpisodeGenre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tvSeasonName, CFSTR("tvSeasonName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tvSeasonGenre, CFSTR("tvSeasonGenre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_movieName, CFSTR("movieName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_movieGenre, CFSTR("movieGenre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tvShowName, CFSTR("tvShowName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_movieBundleName, CFSTR("movieBundleName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_movieBundleGenre, CFSTR("movieBundleGenre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleTvTitle, CFSTR("appleTvTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleTvSubtitle, CFSTR("appleTvSubtitle"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
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
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_siteName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("siteName"));

  objc_msgSend(v6, "encodeObject:", self->_summary);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("summary"));

  objc_msgSend(v6, "encodeObject:", self->_title);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("title"));

  objc_msgSend(v6, "encodeObject:", self->_openGraphType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("openGraphType"));

  objc_msgSend(v6, "encodeObject:", self->_itemType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("itemType"));

  objc_msgSend(v6, "encodeObject:", self->_linkURL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("linkURL"));

  objc_msgSend(v6, "encodeObject:", self->_originalURL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("originalURL"));

  objc_msgSend(v6, "encodeObject:", self->_imageURLs);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("imageURLs"));

  objc_msgSend(v6, "encodeObject:", self->_iconURLs);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("iconURLs"));

  objc_msgSend(v6, "encodeObject:", self->_creator);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("creator"));

  v18 = self->_linkMediaType - 1;
  if (v18 > 0x10)
    v19 = CFSTR("unknown");
  else
    v19 = *(&off_1E2292D28 + v18);
  v20 = v19;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, CFSTR("linkMediaType"));

  objc_msgSend(v6, "encodeObject:", self->_iTunesStoreIdentifier);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, CFSTR("iTunesStoreIdentifier"));

  objc_msgSend(v6, "encodeObject:", self->_iTunesStoreFrontIdentifier);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, CFSTR("iTunesStoreFrontIdentifier"));

  objc_msgSend(v6, "encodeObject:", self->_songTitle);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, CFSTR("songTitle"));

  objc_msgSend(v6, "encodeObject:", self->_songArtist);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, CFSTR("songArtist"));

  objc_msgSend(v6, "encodeObject:", self->_songAlbum);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, CFSTR("songAlbum"));

  objc_msgSend(v6, "encodeObject:", self->_albumName);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v26, CFSTR("albumName"));

  objc_msgSend(v6, "encodeObject:", self->_albumArtist);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v27, CFSTR("albumArtist"));

  objc_msgSend(v6, "encodeObject:", self->_musicVideoName);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v28, CFSTR("musicVideoName"));

  objc_msgSend(v6, "encodeObject:", self->_musicVideoArtist);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v29, CFSTR("musicVideoArtist"));

  objc_msgSend(v6, "encodeObject:", self->_artistName);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v30, CFSTR("artistName"));

  objc_msgSend(v6, "encodeObject:", self->_artistGenre);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v31, CFSTR("artistGenre"));

  objc_msgSend(v6, "encodeObject:", self->_playlistName);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v32, CFSTR("playlistName"));

  objc_msgSend(v6, "encodeObject:", self->_playlistCurator);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v33, CFSTR("playlistCurator"));

  objc_msgSend(v6, "encodeObject:", self->_radioName);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v34, CFSTR("radioName"));

  objc_msgSend(v6, "encodeObject:", self->_radioCurator);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v35, CFSTR("radioCurator"));

  objc_msgSend(v6, "encodeObject:", self->_softwareName);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v36, CFSTR("softwareName"));

  objc_msgSend(v6, "encodeObject:", self->_softwareGenre);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v37, CFSTR("softwareGenre"));

  objc_msgSend(v6, "encodeObject:", self->_softwarePlatform);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v38, CFSTR("softwarePlatform"));

  objc_msgSend(v6, "encodeObject:", self->_bookName);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v39, CFSTR("bookName"));

  objc_msgSend(v6, "encodeObject:", self->_bookAuthor);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v40, CFSTR("bookAuthor"));

  objc_msgSend(v6, "encodeObject:", self->_audioBookName);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v41, CFSTR("audioBookName"));

  objc_msgSend(v6, "encodeObject:", self->_audioBookAuthor);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v42, CFSTR("audioBookAuthor"));

  objc_msgSend(v6, "encodeObject:", self->_audioBookNarrator);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v43, CFSTR("audioBookNarrator"));

  objc_msgSend(v6, "encodeObject:", self->_podcastName);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v44, CFSTR("podcastName"));

  objc_msgSend(v6, "encodeObject:", self->_podcastArtist);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v45, CFSTR("podcastArtist"));

  objc_msgSend(v6, "encodeObject:", self->_podcastEpisodeName);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v46, CFSTR("podcastEpisodeName"));

  objc_msgSend(v6, "encodeObject:", self->_podcastEpisodePodcastName);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v47, CFSTR("podcastEpisodePodcastName"));

  objc_msgSend(v6, "encodeObject:", self->_podcastEpisodeArtist);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v48, CFSTR("podcastEpisodeArtist"));

  objc_msgSend(v6, "encodeObject:", self->_podcastEpisodeReleaseDate);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v49, CFSTR("podcastEpisodeReleaseDate"));

  objc_msgSend(v6, "encodeObject:", self->_tvEpisodeEpisodeName);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v50, CFSTR("tvEpisodeEpisodeName"));

  objc_msgSend(v6, "encodeObject:", self->_tvEpisodeSeasonName);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v51, CFSTR("tvEpisodeSeasonName"));

  objc_msgSend(v6, "encodeObject:", self->_tvEpisodeGenre);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v52, CFSTR("tvEpisodeGenre"));

  objc_msgSend(v6, "encodeObject:", self->_tvSeasonName);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v53, CFSTR("tvSeasonName"));

  objc_msgSend(v6, "encodeObject:", self->_tvSeasonGenre);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v54, CFSTR("tvSeasonGenre"));

  objc_msgSend(v6, "encodeObject:", self->_movieName);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v55, CFSTR("movieName"));

  objc_msgSend(v6, "encodeObject:", self->_movieGenre);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v56, CFSTR("movieGenre"));

  objc_msgSend(v6, "encodeObject:", self->_tvShowName);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v57, CFSTR("tvShowName"));

  objc_msgSend(v6, "encodeObject:", self->_movieBundleName);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v58, CFSTR("movieBundleName"));

  objc_msgSend(v6, "encodeObject:", self->_movieBundleGenre);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v59, CFSTR("movieBundleGenre"));

  objc_msgSend(v6, "encodeObject:", self->_appleTvTitle);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v60, CFSTR("appleTvTitle"));

  objc_msgSend(v6, "encodeObject:", self->_appleTvSubtitle);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v61, CFSTR("appleTvSubtitle"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INMessageLinkMetadata descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INMessageLinkMetadata;
  -[INMessageLinkMetadata description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INMessageLinkMetadata _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t siteName;
  uint64_t summary;
  uint64_t title;
  uint64_t openGraphType;
  uint64_t itemType;
  uint64_t linkURL;
  uint64_t originalURL;
  uint64_t imageURLs;
  uint64_t iconURLs;
  uint64_t creator;
  uint64_t iTunesStoreIdentifier;
  uint64_t iTunesStoreFrontIdentifier;
  uint64_t songTitle;
  uint64_t songArtist;
  uint64_t songAlbum;
  uint64_t albumName;
  uint64_t albumArtist;
  uint64_t musicVideoName;
  uint64_t musicVideoArtist;
  uint64_t artistName;
  uint64_t artistGenre;
  uint64_t playlistName;
  uint64_t playlistCurator;
  uint64_t radioName;
  uint64_t radioCurator;
  uint64_t softwareName;
  uint64_t softwareGenre;
  uint64_t softwarePlatform;
  uint64_t bookName;
  uint64_t bookAuthor;
  uint64_t audioBookName;
  uint64_t audioBookAuthor;
  uint64_t audioBookNarrator;
  uint64_t podcastName;
  uint64_t podcastArtist;
  uint64_t podcastEpisodeName;
  uint64_t podcastEpisodePodcastName;
  uint64_t podcastEpisodeArtist;
  uint64_t podcastEpisodeReleaseDate;
  uint64_t tvEpisodeEpisodeName;
  uint64_t tvEpisodeSeasonName;
  uint64_t tvEpisodeGenre;
  uint64_t tvSeasonName;
  uint64_t tvSeasonGenre;
  uint64_t movieName;
  NSString *movieGenre;
  uint64_t v49;
  NSString *tvShowName;
  uint64_t v51;
  NSString *movieBundleName;
  uint64_t v53;
  NSString *movieBundleGenre;
  void *v55;
  void *v56;
  NSString *appleTvTitle;
  void *v58;
  NSString *appleTvSubtitle;
  void *v60;
  void *v61;
  uint64_t v63;
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  _QWORD v158[52];
  _QWORD v159[54];

  v159[52] = *MEMORY[0x1E0C80C00];
  v158[0] = CFSTR("siteName");
  siteName = (uint64_t)self->_siteName;
  v156 = siteName;
  if (!siteName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    siteName = objc_claimAutoreleasedReturnValue();
  }
  v100 = (void *)siteName;
  v159[0] = siteName;
  v158[1] = CFSTR("summary");
  summary = (uint64_t)self->_summary;
  v155 = summary;
  if (!summary)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    summary = objc_claimAutoreleasedReturnValue();
  }
  v99 = (void *)summary;
  v159[1] = summary;
  v158[2] = CFSTR("title");
  title = (uint64_t)self->_title;
  v154 = title;
  if (!title)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    title = objc_claimAutoreleasedReturnValue();
  }
  v98 = (void *)title;
  v159[2] = title;
  v158[3] = CFSTR("openGraphType");
  openGraphType = (uint64_t)self->_openGraphType;
  v153 = openGraphType;
  if (!openGraphType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    openGraphType = objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)openGraphType;
  v159[3] = openGraphType;
  v158[4] = CFSTR("itemType");
  itemType = (uint64_t)self->_itemType;
  v152 = itemType;
  if (!itemType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    itemType = objc_claimAutoreleasedReturnValue();
  }
  v96 = (void *)itemType;
  v159[4] = itemType;
  v158[5] = CFSTR("linkURL");
  linkURL = (uint64_t)self->_linkURL;
  v151 = linkURL;
  if (!linkURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    linkURL = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)linkURL;
  v159[5] = linkURL;
  v158[6] = CFSTR("originalURL");
  originalURL = (uint64_t)self->_originalURL;
  v150 = originalURL;
  if (!originalURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    originalURL = objc_claimAutoreleasedReturnValue();
  }
  v94 = (void *)originalURL;
  v159[6] = originalURL;
  v158[7] = CFSTR("imageURLs");
  imageURLs = (uint64_t)self->_imageURLs;
  v149 = imageURLs;
  if (!imageURLs)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    imageURLs = objc_claimAutoreleasedReturnValue();
  }
  v93 = (void *)imageURLs;
  v159[7] = imageURLs;
  v158[8] = CFSTR("iconURLs");
  iconURLs = (uint64_t)self->_iconURLs;
  v148 = iconURLs;
  if (!iconURLs)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    iconURLs = objc_claimAutoreleasedReturnValue();
  }
  v92 = (void *)iconURLs;
  v159[8] = iconURLs;
  v158[9] = CFSTR("creator");
  creator = (uint64_t)self->_creator;
  v147 = creator;
  if (!creator)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    creator = objc_claimAutoreleasedReturnValue();
  }
  v91 = (void *)creator;
  v159[9] = creator;
  v158[10] = CFSTR("linkMediaType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_linkMediaType);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v159[10] = v146;
  v158[11] = CFSTR("iTunesStoreIdentifier");
  iTunesStoreIdentifier = (uint64_t)self->_iTunesStoreIdentifier;
  v145 = iTunesStoreIdentifier;
  if (!iTunesStoreIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    iTunesStoreIdentifier = objc_claimAutoreleasedReturnValue();
  }
  v159[11] = iTunesStoreIdentifier;
  v158[12] = CFSTR("iTunesStoreFrontIdentifier");
  iTunesStoreFrontIdentifier = (uint64_t)self->_iTunesStoreFrontIdentifier;
  v143 = iTunesStoreFrontIdentifier;
  if (!iTunesStoreFrontIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    iTunesStoreFrontIdentifier = objc_claimAutoreleasedReturnValue();
  }
  v159[12] = iTunesStoreFrontIdentifier;
  v158[13] = CFSTR("songTitle");
  songTitle = (uint64_t)self->_songTitle;
  v141 = songTitle;
  if (!songTitle)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    songTitle = objc_claimAutoreleasedReturnValue();
  }
  v159[13] = songTitle;
  v158[14] = CFSTR("songArtist");
  songArtist = (uint64_t)self->_songArtist;
  v139 = songArtist;
  if (!songArtist)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    songArtist = objc_claimAutoreleasedReturnValue();
  }
  v159[14] = songArtist;
  v158[15] = CFSTR("songAlbum");
  songAlbum = (uint64_t)self->_songAlbum;
  v137 = songAlbum;
  if (!songAlbum)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    songAlbum = objc_claimAutoreleasedReturnValue();
  }
  v159[15] = songAlbum;
  v158[16] = CFSTR("albumName");
  albumName = (uint64_t)self->_albumName;
  v135 = albumName;
  if (!albumName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    albumName = objc_claimAutoreleasedReturnValue();
  }
  v159[16] = albumName;
  v158[17] = CFSTR("albumArtist");
  albumArtist = (uint64_t)self->_albumArtist;
  v133 = albumArtist;
  if (!albumArtist)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    albumArtist = objc_claimAutoreleasedReturnValue();
  }
  v159[17] = albumArtist;
  v158[18] = CFSTR("musicVideoName");
  musicVideoName = (uint64_t)self->_musicVideoName;
  v131 = musicVideoName;
  if (!musicVideoName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    musicVideoName = objc_claimAutoreleasedReturnValue();
  }
  v159[18] = musicVideoName;
  v158[19] = CFSTR("musicVideoArtist");
  musicVideoArtist = (uint64_t)self->_musicVideoArtist;
  v129 = musicVideoArtist;
  if (!musicVideoArtist)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    musicVideoArtist = objc_claimAutoreleasedReturnValue();
  }
  v159[19] = musicVideoArtist;
  v158[20] = CFSTR("artistName");
  artistName = (uint64_t)self->_artistName;
  v128 = artistName;
  if (!artistName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    artistName = objc_claimAutoreleasedReturnValue();
  }
  v127 = (void *)artistName;
  v159[20] = artistName;
  v158[21] = CFSTR("artistGenre");
  artistGenre = (uint64_t)self->_artistGenre;
  v126 = artistGenre;
  if (!artistGenre)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    artistGenre = objc_claimAutoreleasedReturnValue();
  }
  v157 = (void *)artistGenre;
  v159[21] = artistGenre;
  v158[22] = CFSTR("playlistName");
  playlistName = (uint64_t)self->_playlistName;
  v125 = playlistName;
  if (!playlistName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    playlistName = objc_claimAutoreleasedReturnValue();
  }
  v90 = (void *)playlistName;
  v159[22] = playlistName;
  v158[23] = CFSTR("playlistCurator");
  playlistCurator = (uint64_t)self->_playlistCurator;
  v124 = playlistCurator;
  if (!playlistCurator)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    playlistCurator = objc_claimAutoreleasedReturnValue();
  }
  v89 = (void *)playlistCurator;
  v159[23] = playlistCurator;
  v158[24] = CFSTR("radioName");
  radioName = (uint64_t)self->_radioName;
  v123 = radioName;
  if (!radioName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    radioName = objc_claimAutoreleasedReturnValue();
  }
  v88 = (void *)radioName;
  v159[24] = radioName;
  v158[25] = CFSTR("radioCurator");
  radioCurator = (uint64_t)self->_radioCurator;
  v122 = radioCurator;
  if (!radioCurator)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    radioCurator = objc_claimAutoreleasedReturnValue();
  }
  v87 = (void *)radioCurator;
  v159[25] = radioCurator;
  v158[26] = CFSTR("softwareName");
  softwareName = (uint64_t)self->_softwareName;
  v121 = softwareName;
  if (!softwareName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    softwareName = objc_claimAutoreleasedReturnValue();
  }
  v86 = (void *)softwareName;
  v159[26] = softwareName;
  v158[27] = CFSTR("softwareGenre");
  softwareGenre = (uint64_t)self->_softwareGenre;
  v120 = softwareGenre;
  if (!softwareGenre)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    softwareGenre = objc_claimAutoreleasedReturnValue();
  }
  v85 = (void *)softwareGenre;
  v159[27] = softwareGenre;
  v158[28] = CFSTR("softwarePlatform");
  softwarePlatform = (uint64_t)self->_softwarePlatform;
  v119 = softwarePlatform;
  if (!softwarePlatform)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    softwarePlatform = objc_claimAutoreleasedReturnValue();
  }
  v84 = (void *)softwarePlatform;
  v159[28] = softwarePlatform;
  v158[29] = CFSTR("bookName");
  bookName = (uint64_t)self->_bookName;
  v118 = bookName;
  if (!bookName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    bookName = objc_claimAutoreleasedReturnValue();
  }
  v83 = (void *)bookName;
  v159[29] = bookName;
  v158[30] = CFSTR("bookAuthor");
  bookAuthor = (uint64_t)self->_bookAuthor;
  v117 = bookAuthor;
  if (!bookAuthor)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    bookAuthor = objc_claimAutoreleasedReturnValue();
  }
  v82 = (void *)bookAuthor;
  v159[30] = bookAuthor;
  v158[31] = CFSTR("audioBookName");
  audioBookName = (uint64_t)self->_audioBookName;
  v116 = audioBookName;
  if (!audioBookName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    audioBookName = objc_claimAutoreleasedReturnValue();
  }
  v81 = (void *)audioBookName;
  v159[31] = audioBookName;
  v158[32] = CFSTR("audioBookAuthor");
  audioBookAuthor = (uint64_t)self->_audioBookAuthor;
  v115 = audioBookAuthor;
  if (!audioBookAuthor)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    audioBookAuthor = objc_claimAutoreleasedReturnValue();
  }
  v80 = (void *)audioBookAuthor;
  v159[32] = audioBookAuthor;
  v158[33] = CFSTR("audioBookNarrator");
  audioBookNarrator = (uint64_t)self->_audioBookNarrator;
  v114 = audioBookNarrator;
  if (!audioBookNarrator)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    audioBookNarrator = objc_claimAutoreleasedReturnValue();
  }
  v79 = (void *)audioBookNarrator;
  v159[33] = audioBookNarrator;
  v158[34] = CFSTR("podcastName");
  podcastName = (uint64_t)self->_podcastName;
  v113 = podcastName;
  if (!podcastName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    podcastName = objc_claimAutoreleasedReturnValue();
  }
  v78 = (void *)podcastName;
  v159[34] = podcastName;
  v158[35] = CFSTR("podcastArtist");
  podcastArtist = (uint64_t)self->_podcastArtist;
  v112 = podcastArtist;
  if (!podcastArtist)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    podcastArtist = objc_claimAutoreleasedReturnValue();
  }
  v77 = (void *)podcastArtist;
  v159[35] = podcastArtist;
  v158[36] = CFSTR("podcastEpisodeName");
  podcastEpisodeName = (uint64_t)self->_podcastEpisodeName;
  v111 = podcastEpisodeName;
  if (!podcastEpisodeName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    podcastEpisodeName = objc_claimAutoreleasedReturnValue();
  }
  v76 = (void *)podcastEpisodeName;
  v159[36] = podcastEpisodeName;
  v158[37] = CFSTR("podcastEpisodePodcastName");
  podcastEpisodePodcastName = (uint64_t)self->_podcastEpisodePodcastName;
  v110 = podcastEpisodePodcastName;
  if (!podcastEpisodePodcastName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    podcastEpisodePodcastName = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)podcastEpisodePodcastName;
  v159[37] = podcastEpisodePodcastName;
  v158[38] = CFSTR("podcastEpisodeArtist");
  podcastEpisodeArtist = (uint64_t)self->_podcastEpisodeArtist;
  v109 = podcastEpisodeArtist;
  if (!podcastEpisodeArtist)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    podcastEpisodeArtist = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)podcastEpisodeArtist;
  v159[38] = podcastEpisodeArtist;
  v158[39] = CFSTR("podcastEpisodeReleaseDate");
  podcastEpisodeReleaseDate = (uint64_t)self->_podcastEpisodeReleaseDate;
  v108 = podcastEpisodeReleaseDate;
  if (!podcastEpisodeReleaseDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    podcastEpisodeReleaseDate = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)podcastEpisodeReleaseDate;
  v159[39] = podcastEpisodeReleaseDate;
  v158[40] = CFSTR("tvEpisodeEpisodeName");
  tvEpisodeEpisodeName = (uint64_t)self->_tvEpisodeEpisodeName;
  v107 = tvEpisodeEpisodeName;
  if (!tvEpisodeEpisodeName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    tvEpisodeEpisodeName = objc_claimAutoreleasedReturnValue();
  }
  v72 = (void *)tvEpisodeEpisodeName;
  v159[40] = tvEpisodeEpisodeName;
  v158[41] = CFSTR("tvEpisodeSeasonName");
  tvEpisodeSeasonName = (uint64_t)self->_tvEpisodeSeasonName;
  v106 = tvEpisodeSeasonName;
  if (!tvEpisodeSeasonName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    tvEpisodeSeasonName = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)tvEpisodeSeasonName;
  v159[41] = tvEpisodeSeasonName;
  v158[42] = CFSTR("tvEpisodeGenre");
  tvEpisodeGenre = (uint64_t)self->_tvEpisodeGenre;
  v105 = tvEpisodeGenre;
  if (!tvEpisodeGenre)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    tvEpisodeGenre = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)tvEpisodeGenre;
  v159[42] = tvEpisodeGenre;
  v158[43] = CFSTR("tvSeasonName");
  tvSeasonName = (uint64_t)self->_tvSeasonName;
  v104 = tvSeasonName;
  if (!tvSeasonName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    tvSeasonName = objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)tvSeasonName;
  v159[43] = tvSeasonName;
  v158[44] = CFSTR("tvSeasonGenre");
  tvSeasonGenre = (uint64_t)self->_tvSeasonGenre;
  v103 = tvSeasonGenre;
  if (!tvSeasonGenre)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    tvSeasonGenre = objc_claimAutoreleasedReturnValue();
  }
  v142 = (void *)iTunesStoreFrontIdentifier;
  v68 = (void *)tvSeasonGenre;
  v159[44] = tvSeasonGenre;
  v158[45] = CFSTR("movieName");
  movieName = (uint64_t)self->_movieName;
  v102 = movieName;
  if (!movieName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    movieName = objc_claimAutoreleasedReturnValue();
  }
  v140 = (void *)songTitle;
  v67 = (void *)movieName;
  v159[45] = movieName;
  v158[46] = CFSTR("movieGenre");
  movieGenre = self->_movieGenre;
  v49 = (uint64_t)movieGenre;
  if (!movieGenre)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v132 = (void *)albumArtist;
  v138 = (void *)songArtist;
  v66 = (void *)v49;
  v159[46] = v49;
  v158[47] = CFSTR("tvShowName");
  tvShowName = self->_tvShowName;
  v51 = (uint64_t)tvShowName;
  if (!tvShowName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v134 = (void *)albumName;
  v144 = (void *)iTunesStoreIdentifier;
  v65 = (void *)v51;
  v159[47] = v51;
  v158[48] = CFSTR("movieBundleName");
  movieBundleName = self->_movieBundleName;
  v53 = (uint64_t)movieBundleName;
  if (!movieBundleName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = objc_claimAutoreleasedReturnValue();
  }
  v130 = (void *)musicVideoName;
  v136 = (void *)songAlbum;
  v63 = v53;
  v159[48] = v53;
  v158[49] = CFSTR("movieBundleGenre");
  movieBundleGenre = self->_movieBundleGenre;
  v55 = movieBundleGenre;
  if (!movieBundleGenre)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v53, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80,
      v81,
      v82,
      v83,
      v84,
      v85,
      v86,
      v87,
      v88,
      v89,
      v90);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)musicVideoArtist;
  v159[49] = v55;
  v158[50] = CFSTR("appleTvTitle");
  appleTvTitle = self->_appleTvTitle;
  v58 = appleTvTitle;
  if (!appleTvTitle)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v159[50] = v58;
  v158[51] = CFSTR("appleTvSubtitle");
  appleTvSubtitle = self->_appleTvSubtitle;
  v60 = appleTvSubtitle;
  if (!appleTvSubtitle)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v159[51] = v60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 52, v63);
  v101 = (id)objc_claimAutoreleasedReturnValue();
  if (!appleTvSubtitle)

  v61 = v157;
  if (!appleTvTitle)
  {

    v61 = v157;
  }
  if (!movieBundleGenre)
  {

    v61 = v157;
  }
  if (!movieBundleName)
  {

    v61 = v157;
  }
  if (!tvShowName)
  {

    v61 = v157;
  }
  if (!movieGenre)
  {

    v61 = v157;
  }
  if (!v102)
  {

    v61 = v157;
  }
  if (!v103)
  {

    v61 = v157;
  }
  if (!v104)
  {

    v61 = v157;
  }
  if (!v105)
  {

    v61 = v157;
  }
  if (!v106)
  {

    v61 = v157;
  }
  if (!v107)
  {

    v61 = v157;
  }
  if (!v108)
  {

    v61 = v157;
  }
  if (!v109)
  {

    v61 = v157;
  }
  if (!v110)
  {

    v61 = v157;
  }
  if (!v111)
  {

    v61 = v157;
  }
  if (!v112)
  {

    v61 = v157;
  }
  if (!v113)
  {

    v61 = v157;
  }
  if (!v114)
  {

    v61 = v157;
  }
  if (!v115)
  {

    v61 = v157;
  }
  if (!v116)
  {

    v61 = v157;
  }
  if (!v117)
  {

    v61 = v157;
  }
  if (!v118)
  {

    v61 = v157;
  }
  if (!v119)
  {

    v61 = v157;
  }
  if (!v120)
  {

    v61 = v157;
  }
  if (!v121)
  {

    v61 = v157;
  }
  if (!v122)
  {

    v61 = v157;
  }
  if (!v123)
  {

    v61 = v157;
  }
  if (!v124)
  {

    v61 = v157;
  }
  if (!v125)
  {

    v61 = v157;
  }
  if (!v126)

  if (!v128)
  if (!v129)

  if (!v131)
  if (!v133)

  if (!v135)
  if (!v137)

  if (!v139)
  if (!v141)

  if (!v143)
  if (!v145)

  if (!v147)
  if (!v148)

  if (!v149)
  if (!v150)

  if (!v151)
  if (!v152)

  if (!v153)
  if (!v154)

  if (!v155)
  if (!v156)

  return v101;
}

- (NSString)siteName
{
  return self->_siteName;
}

- (void)setSiteName:(NSString *)siteName
{
  objc_setProperty_nonatomic_copy(self, a2, siteName, 8);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(NSString *)summary
{
  objc_setProperty_nonatomic_copy(self, a2, summary, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 24);
}

- (NSString)openGraphType
{
  return self->_openGraphType;
}

- (void)setOpenGraphType:(NSString *)openGraphType
{
  objc_setProperty_nonatomic_copy(self, a2, openGraphType, 32);
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(NSURL *)linkURL
{
  objc_setProperty_nonatomic_copy(self, a2, linkURL, 40);
}

- (NSString)itemType
{
  return self->_itemType;
}

- (void)setItemType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)imageURLs
{
  return self->_imageURLs;
}

- (void)setImageURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)iconURLs
{
  return self->_iconURLs;
}

- (void)setIconURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)linkMediaType
{
  return self->_linkMediaType;
}

- (void)setLinkMediaType:(int64_t)a3
{
  self->_linkMediaType = a3;
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (void)setITunesStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)iTunesStoreFrontIdentifier
{
  return self->_iTunesStoreFrontIdentifier;
}

- (void)setITunesStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)songTitle
{
  return self->_songTitle;
}

- (void)setSongTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)songArtist
{
  return self->_songArtist;
}

- (void)setSongArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)songAlbum
{
  return self->_songAlbum;
}

- (void)setSongAlbum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (void)setAlbumArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)musicVideoName
{
  return self->_musicVideoName;
}

- (void)setMusicVideoName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)musicVideoArtist
{
  return self->_musicVideoArtist;
}

- (void)setMusicVideoArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)artistGenre
{
  return self->_artistGenre;
}

- (void)setArtistGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void)setPlaylistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)playlistCurator
{
  return self->_playlistCurator;
}

- (void)setPlaylistCurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)radioName
{
  return self->_radioName;
}

- (void)setRadioName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)radioCurator
{
  return self->_radioCurator;
}

- (void)setRadioCurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)softwareName
{
  return self->_softwareName;
}

- (void)setSoftwareName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)softwareGenre
{
  return self->_softwareGenre;
}

- (void)setSoftwareGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setSoftwarePlatform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)bookName
{
  return self->_bookName;
}

- (void)setBookName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)bookAuthor
{
  return self->_bookAuthor;
}

- (void)setBookAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)audioBookName
{
  return self->_audioBookName;
}

- (void)setAudioBookName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)audioBookAuthor
{
  return self->_audioBookAuthor;
}

- (void)setAudioBookAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)audioBookNarrator
{
  return self->_audioBookNarrator;
}

- (void)setAudioBookNarrator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)podcastName
{
  return self->_podcastName;
}

- (void)setPodcastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)podcastArtist
{
  return self->_podcastArtist;
}

- (void)setPodcastArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)podcastEpisodeName
{
  return self->_podcastEpisodeName;
}

- (void)setPodcastEpisodeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)podcastEpisodePodcastName
{
  return self->_podcastEpisodePodcastName;
}

- (void)setPodcastEpisodePodcastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSString)podcastEpisodeArtist
{
  return self->_podcastEpisodeArtist;
}

- (void)setPodcastEpisodeArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSDateComponents)podcastEpisodeReleaseDate
{
  return self->_podcastEpisodeReleaseDate;
}

- (void)setPodcastEpisodeReleaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)tvEpisodeEpisodeName
{
  return self->_tvEpisodeEpisodeName;
}

- (void)setTvEpisodeEpisodeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)tvEpisodeSeasonName
{
  return self->_tvEpisodeSeasonName;
}

- (void)setTvEpisodeSeasonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)tvEpisodeGenre
{
  return self->_tvEpisodeGenre;
}

- (void)setTvEpisodeGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)tvSeasonName
{
  return self->_tvSeasonName;
}

- (void)setTvSeasonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)tvSeasonGenre
{
  return self->_tvSeasonGenre;
}

- (void)setTvSeasonGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)movieName
{
  return self->_movieName;
}

- (void)setMovieName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSString)movieGenre
{
  return self->_movieGenre;
}

- (void)setMovieGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)tvShowName
{
  return self->_tvShowName;
}

- (void)setTvShowName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)movieBundleName
{
  return self->_movieBundleName;
}

- (void)setMovieBundleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSString)movieBundleGenre
{
  return self->_movieBundleGenre;
}

- (void)setMovieBundleGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSString)appleTvTitle
{
  return self->_appleTvTitle;
}

- (void)setAppleTvTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSString)appleTvSubtitle
{
  return self->_appleTvSubtitle;
}

- (void)setAppleTvSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleTvSubtitle, 0);
  objc_storeStrong((id *)&self->_appleTvTitle, 0);
  objc_storeStrong((id *)&self->_movieBundleGenre, 0);
  objc_storeStrong((id *)&self->_movieBundleName, 0);
  objc_storeStrong((id *)&self->_tvShowName, 0);
  objc_storeStrong((id *)&self->_movieGenre, 0);
  objc_storeStrong((id *)&self->_movieName, 0);
  objc_storeStrong((id *)&self->_tvSeasonGenre, 0);
  objc_storeStrong((id *)&self->_tvSeasonName, 0);
  objc_storeStrong((id *)&self->_tvEpisodeGenre, 0);
  objc_storeStrong((id *)&self->_tvEpisodeSeasonName, 0);
  objc_storeStrong((id *)&self->_tvEpisodeEpisodeName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeReleaseDate, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeArtist, 0);
  objc_storeStrong((id *)&self->_podcastEpisodePodcastName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeName, 0);
  objc_storeStrong((id *)&self->_podcastArtist, 0);
  objc_storeStrong((id *)&self->_podcastName, 0);
  objc_storeStrong((id *)&self->_audioBookNarrator, 0);
  objc_storeStrong((id *)&self->_audioBookAuthor, 0);
  objc_storeStrong((id *)&self->_audioBookName, 0);
  objc_storeStrong((id *)&self->_bookAuthor, 0);
  objc_storeStrong((id *)&self->_bookName, 0);
  objc_storeStrong((id *)&self->_softwarePlatform, 0);
  objc_storeStrong((id *)&self->_softwareGenre, 0);
  objc_storeStrong((id *)&self->_softwareName, 0);
  objc_storeStrong((id *)&self->_radioCurator, 0);
  objc_storeStrong((id *)&self->_radioName, 0);
  objc_storeStrong((id *)&self->_playlistCurator, 0);
  objc_storeStrong((id *)&self->_playlistName, 0);
  objc_storeStrong((id *)&self->_artistGenre, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_musicVideoArtist, 0);
  objc_storeStrong((id *)&self->_musicVideoName, 0);
  objc_storeStrong((id *)&self->_albumArtist, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_songAlbum, 0);
  objc_storeStrong((id *)&self->_songArtist, 0);
  objc_storeStrong((id *)&self->_songTitle, 0);
  objc_storeStrong((id *)&self->_iTunesStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_imageURLs, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_openGraphType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("siteName"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("summary"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("openGraphType"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("itemType"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("linkURL"));
    v29 = (objc_class *)a1;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("originalURL"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("imageURLs"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("iconURLs"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("creator"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("linkMediaType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = INMessageLinkMediaTypeWithString(v11);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("iTunesStoreIdentifier"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("iTunesStoreFrontIdentifier"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("songTitle"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("songArtist"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("songAlbum"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("albumName"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("albumArtist"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("musicVideoName"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("musicVideoArtist"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("artistName"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("artistGenre"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("playlistName"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("playlistCurator"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("radioName"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("radioCurator"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("softwareName"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("softwareGenre"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("softwarePlatform"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bookName"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bookAuthor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("audioBookName"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("audioBookAuthor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("audioBookNarrator"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("podcastName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("podcastArtist"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("podcastEpisodeName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("podcastEpisodePodcastName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("podcastEpisodeArtist"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("podcastEpisodeReleaseDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tvEpisodeEpisodeName"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tvEpisodeSeasonName"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tvEpisodeGenre"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tvSeasonName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tvSeasonGenre"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("movieName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("movieGenre"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tvShowName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("movieBundleName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("movieBundleGenre"));
    v30 = v7;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appleTvTitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appleTvSubtitle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend([v29 alloc], "initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:", v69, v68, v67, v66, v65, v64, v63, v62, v61, v60,
                    v28,
                    v59,
                    v58,
                    v57,
                    v56,
                    v55,
                    v54,
                    v53,
                    v52,
                    v51,
                    v50,
                    v49,
                    v48,
                    v47,
                    v44,
                    v46,
                    v43,
                    v45,
                    v40,
                    v42,
                    v39,
                    v38,
                    v41,
                    v37,
                    v27,
                    v36,
                    v26,
                    v25,
                    v35,
                    v34,
                    v33,
                    v32,
                    v31,
                    v14,
                    v24,
                    v15,
                    v23,
                    v16,
                    v22,
                    v21,
                    v17,
                    v18);

    v7 = v30;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
