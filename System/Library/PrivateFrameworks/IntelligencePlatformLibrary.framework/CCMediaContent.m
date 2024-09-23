@implementation CCMediaContent

- (CCMediaContent)initWithEntity:(id)a3 entityType:(unsigned int)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int IsInstanceOfExpectedClass;
  id v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  CCMediaContent *v25;
  uint64_t v27;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  if (v8 && a4 == 1)
  {
    objc_opt_class();
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (IsInstanceOfExpectedClass)
      goto LABEL_48;
LABEL_50:
    CCSetError();
    v25 = 0;
    goto LABEL_51;
  }
  if (v8 && a4 == 2)
  {
    objc_opt_class();
    v12 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v12)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v8 && a4 == 3)
  {
    objc_opt_class();
    v13 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v13)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v8 && a4 == 4)
  {
    objc_opt_class();
    v14 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v14)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v8 && a4 == 5)
  {
    objc_opt_class();
    v15 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v15)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v8 && a4 == 6)
  {
    objc_opt_class();
    v16 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v16)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v8 && a4 == 7)
  {
    objc_opt_class();
    v17 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v17)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v8 && a4 == 8)
  {
    objc_opt_class();
    v18 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v18)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v8 && a4 == 9)
  {
    objc_opt_class();
    v19 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v19)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v8 && a4 == 10)
  {
    objc_opt_class();
    v20 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v20)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v8 && a4 == 11)
  {
    objc_opt_class();
    v21 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v21)
      goto LABEL_48;
    goto LABEL_50;
  }
  v11 = 0;
  if (!v8 || a4 != 12)
    goto LABEL_49;
  objc_opt_class();
  v27 = 0;
  v22 = CCValidateIsInstanceOfExpectedClass();
  v11 = 0;
  if (!v22)
    goto LABEL_50;
LABEL_48:
  objc_msgSend(v8, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField();

LABEL_49:
  objc_msgSend(v9, "immutableData", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v24, a5);

  v25 = self;
LABEL_51:

  return v25;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  int *v9;
  id v10;
  int *v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  CCMediaAlbumArtist *v20;
  void *v21;
  CCMediaAlbumArtist *v22;
  CCMediaAlbumArtist *albumArtist;
  CCMediaSongArtist *songArtist;
  CCMediaSongArtist *v25;
  void *v26;
  CCMediaSongArtist *v27;
  CCMediaSongArtist *v28;
  CCMediaAlbumArtist *v29;
  CCMediaAlbum *album;
  CCMediaAlbum *v31;
  void *v32;
  CCMediaAlbum *v33;
  CCMediaAlbum *v34;
  CCMediaAlbumArtist *v35;
  CCMediaSongArtist *v36;
  CCMediaGenre *genre;
  CCMediaGenre *v38;
  void *v39;
  CCMediaGenre *v40;
  CCMediaGenre *v41;
  CCMediaAlbumArtist *v42;
  CCMediaSongArtist *v43;
  CCMediaAlbum *v44;
  CCMediaSong *song;
  CCMediaSong *v46;
  void *v47;
  CCMediaSong *v48;
  CCMediaSong *v49;
  CCMediaAlbumArtist *v50;
  CCMediaSongArtist *v51;
  CCMediaAlbum *v52;
  CCMediaGenre *v53;
  CCMediaPlaylist *playlist;
  CCMediaMusicVideo *musicVideo;
  CCMediaTVShow *TVShow;
  CCMediaTVEpisode *TVEpisode;
  CCMediaMovie *movie;
  CCMediaAudiobookArtist *audiobookArtist;
  CCMediaAudiobook *audiobook;
  CCMediaPlaylist *v61;
  void *v62;
  CCMediaPlaylist *v63;
  CCMediaPlaylist *v64;
  CCMediaAlbumArtist *v65;
  CCMediaSongArtist *v66;
  CCMediaAlbum *v67;
  CCMediaGenre *v68;
  CCMediaSong *v69;
  CCMediaMusicVideo *v70;
  void *v71;
  CCMediaMusicVideo *v72;
  CCMediaMusicVideo *v73;
  CCMediaAlbumArtist *v74;
  CCMediaSongArtist *v75;
  CCMediaAlbum *v76;
  CCMediaGenre *v77;
  CCMediaSong *v78;
  CCMediaPlaylist *v79;
  CCMediaTVShow *v80;
  void *v81;
  CCMediaTVShow *v82;
  CCMediaTVShow *v83;
  CCMediaAlbumArtist *v84;
  CCMediaSongArtist *v85;
  CCMediaAlbum *v86;
  CCMediaGenre *v87;
  CCMediaSong *v88;
  CCMediaPlaylist *v89;
  CCMediaMusicVideo *v90;
  CCMediaTVEpisode *v91;
  void *v92;
  CCMediaTVEpisode *v93;
  CCMediaTVEpisode *v94;
  CCMediaAlbumArtist *v95;
  CCMediaSongArtist *v96;
  CCMediaAlbum *v97;
  CCMediaGenre *v98;
  CCMediaSong *v99;
  CCMediaPlaylist *v100;
  CCMediaMusicVideo *v101;
  CCMediaTVShow *v102;
  CCMediaMovie *v103;
  void *v104;
  CCMediaMovie *v105;
  CCMediaMovie *v106;
  CCMediaAlbumArtist *v107;
  CCMediaSongArtist *v108;
  CCMediaAlbum *v109;
  CCMediaGenre *v110;
  CCMediaSong *v111;
  CCMediaPlaylist *v112;
  CCMediaMusicVideo *v113;
  CCMediaTVShow *v114;
  CCMediaTVEpisode *v115;
  CCMediaAudiobookArtist *v116;
  void *v117;
  CCMediaAudiobookArtist *v118;
  CCMediaAudiobookArtist *v119;
  CCMediaAlbumArtist *v120;
  CCMediaSongArtist *v121;
  CCMediaAlbum *v122;
  CCMediaGenre *v123;
  CCMediaSong *v124;
  CCMediaPlaylist *v125;
  CCMediaMusicVideo *v126;
  CCMediaTVShow *v127;
  CCMediaTVEpisode *v128;
  CCMediaMovie *v129;
  CCMediaAudiobook *v130;
  void *v131;
  CCMediaAudiobook *v132;
  CCMediaAudiobook *v133;
  CCMediaAlbumArtist *v134;
  CCMediaSongArtist *v135;
  CCMediaAlbum *v136;
  CCMediaGenre *v137;
  CCMediaSong *v138;
  CCMediaPlaylist *v139;
  CCMediaMusicVideo *v140;
  CCMediaTVShow *v141;
  CCMediaTVEpisode *v142;
  CCMediaMovie *v143;
  CCMediaAudiobookArtist *v144;
  objc_class *v145;
  void *v146;
  objc_class *v147;
  void *v148;
  void *v149;
  BOOL v150;
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
  id v163;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
    goto LABEL_60;
  v10 = 0;
  v11 = (int *)MEMORY[0x24BE15710];
  do
  {
    if (*(_QWORD *)&v6[*v9])
      v12 = 0;
    else
      v12 = v10 == 0;
    if (!v12)
      break;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v7;
      v17 = *(_QWORD *)&v6[v16];
      if (v17 == -1 || v17 >= *(_QWORD *)&v6[*v8])
        break;
      v18 = *(_BYTE *)(*(_QWORD *)&v6[*v11] + v17);
      *(_QWORD *)&v6[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0)
        goto LABEL_17;
      v13 += 7;
      if (v14++ >= 9)
      {
        v15 = 0;
        if (*(_QWORD *)&v6[*v9])
          goto LABEL_61;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    if (*(_QWORD *)&v6[*v9])
      goto LABEL_61;
LABEL_18:
    switch((v15 >> 3))
    {
      case 1u:
        v20 = [CCMediaAlbumArtist alloc];
        CCPBReaderReadDataNoCopy();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = 0;
        v22 = -[CCItemMessage initWithData:error:](v20, "initWithData:error:", v21, &v163);
        v10 = v163;
        albumArtist = self->_albumArtist;
        self->_albumArtist = v22;

        if (!v10)
        {
          self->_entityType = 1;
          songArtist = self->_songArtist;
          self->_songArtist = 0;

          goto LABEL_25;
        }
        break;
      case 2u:
        v25 = [CCMediaSongArtist alloc];
        CCPBReaderReadDataNoCopy();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = 0;
        v27 = -[CCItemMessage initWithData:error:](v25, "initWithData:error:", v26, &v162);
        v10 = v162;
        v28 = self->_songArtist;
        self->_songArtist = v27;

        if (!v10)
        {
          v29 = self->_albumArtist;
          self->_albumArtist = 0;

          self->_entityType = 2;
LABEL_25:
          album = self->_album;
          self->_album = 0;

          goto LABEL_28;
        }
        break;
      case 3u:
        v31 = [CCMediaAlbum alloc];
        CCPBReaderReadDataNoCopy();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = 0;
        v33 = -[CCItemMessage initWithData:error:](v31, "initWithData:error:", v32, &v161);
        v10 = v161;
        v34 = self->_album;
        self->_album = v33;

        if (!v10)
        {
          v35 = self->_albumArtist;
          self->_albumArtist = 0;

          v36 = self->_songArtist;
          self->_songArtist = 0;

          self->_entityType = 3;
LABEL_28:
          genre = self->_genre;
          self->_genre = 0;

          goto LABEL_31;
        }
        break;
      case 4u:
        v38 = [CCMediaGenre alloc];
        CCPBReaderReadDataNoCopy();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = 0;
        v40 = -[CCItemMessage initWithData:error:](v38, "initWithData:error:", v39, &v160);
        v10 = v160;
        v41 = self->_genre;
        self->_genre = v40;

        if (!v10)
        {
          v42 = self->_albumArtist;
          self->_albumArtist = 0;

          v43 = self->_songArtist;
          self->_songArtist = 0;

          v44 = self->_album;
          self->_album = 0;

          self->_entityType = 4;
LABEL_31:
          song = self->_song;
          self->_song = 0;

          goto LABEL_34;
        }
        break;
      case 5u:
        v46 = [CCMediaSong alloc];
        CCPBReaderReadDataNoCopy();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = 0;
        v48 = -[CCItemMessage initWithData:error:](v46, "initWithData:error:", v47, &v159);
        v10 = v159;
        v49 = self->_song;
        self->_song = v48;

        if (!v10)
        {
          v50 = self->_albumArtist;
          self->_albumArtist = 0;

          v51 = self->_songArtist;
          self->_songArtist = 0;

          v52 = self->_album;
          self->_album = 0;

          v53 = self->_genre;
          self->_genre = 0;

          self->_entityType = 5;
LABEL_34:
          playlist = self->_playlist;
          self->_playlist = 0;

          goto LABEL_35;
        }
        break;
      case 6u:
        v61 = [CCMediaPlaylist alloc];
        CCPBReaderReadDataNoCopy();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = 0;
        v63 = -[CCItemMessage initWithData:error:](v61, "initWithData:error:", v62, &v158);
        v10 = v158;
        v64 = self->_playlist;
        self->_playlist = v63;

        if (!v10)
        {
          v65 = self->_albumArtist;
          self->_albumArtist = 0;

          v66 = self->_songArtist;
          self->_songArtist = 0;

          v67 = self->_album;
          self->_album = 0;

          v68 = self->_genre;
          self->_genre = 0;

          v69 = self->_song;
          self->_song = 0;

          self->_entityType = 6;
LABEL_35:
          musicVideo = self->_musicVideo;
          self->_musicVideo = 0;

          goto LABEL_36;
        }
        break;
      case 7u:
        v70 = [CCMediaMusicVideo alloc];
        CCPBReaderReadDataNoCopy();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = 0;
        v72 = -[CCItemMessage initWithData:error:](v70, "initWithData:error:", v71, &v157);
        v10 = v157;
        v73 = self->_musicVideo;
        self->_musicVideo = v72;

        if (!v10)
        {
          v74 = self->_albumArtist;
          self->_albumArtist = 0;

          v75 = self->_songArtist;
          self->_songArtist = 0;

          v76 = self->_album;
          self->_album = 0;

          v77 = self->_genre;
          self->_genre = 0;

          v78 = self->_song;
          self->_song = 0;

          v79 = self->_playlist;
          self->_playlist = 0;

          self->_entityType = 7;
LABEL_36:
          TVShow = self->_TVShow;
          self->_TVShow = 0;

          goto LABEL_37;
        }
        break;
      case 8u:
        v80 = [CCMediaTVShow alloc];
        CCPBReaderReadDataNoCopy();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = 0;
        v82 = -[CCItemMessage initWithData:error:](v80, "initWithData:error:", v81, &v156);
        v10 = v156;
        v83 = self->_TVShow;
        self->_TVShow = v82;

        if (!v10)
        {
          v84 = self->_albumArtist;
          self->_albumArtist = 0;

          v85 = self->_songArtist;
          self->_songArtist = 0;

          v86 = self->_album;
          self->_album = 0;

          v87 = self->_genre;
          self->_genre = 0;

          v88 = self->_song;
          self->_song = 0;

          v89 = self->_playlist;
          self->_playlist = 0;

          v90 = self->_musicVideo;
          self->_musicVideo = 0;

          self->_entityType = 8;
LABEL_37:
          TVEpisode = self->_TVEpisode;
          self->_TVEpisode = 0;

          goto LABEL_38;
        }
        break;
      case 9u:
        v91 = [CCMediaTVEpisode alloc];
        CCPBReaderReadDataNoCopy();
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = 0;
        v93 = -[CCItemMessage initWithData:error:](v91, "initWithData:error:", v92, &v155);
        v10 = v155;
        v94 = self->_TVEpisode;
        self->_TVEpisode = v93;

        if (!v10)
        {
          v95 = self->_albumArtist;
          self->_albumArtist = 0;

          v96 = self->_songArtist;
          self->_songArtist = 0;

          v97 = self->_album;
          self->_album = 0;

          v98 = self->_genre;
          self->_genre = 0;

          v99 = self->_song;
          self->_song = 0;

          v100 = self->_playlist;
          self->_playlist = 0;

          v101 = self->_musicVideo;
          self->_musicVideo = 0;

          v102 = self->_TVShow;
          self->_TVShow = 0;

          self->_entityType = 9;
LABEL_38:
          movie = self->_movie;
          self->_movie = 0;

          goto LABEL_39;
        }
        break;
      case 0xAu:
        v103 = [CCMediaMovie alloc];
        CCPBReaderReadDataNoCopy();
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = 0;
        v105 = -[CCItemMessage initWithData:error:](v103, "initWithData:error:", v104, &v154);
        v10 = v154;
        v106 = self->_movie;
        self->_movie = v105;

        if (!v10)
        {
          v107 = self->_albumArtist;
          self->_albumArtist = 0;

          v108 = self->_songArtist;
          self->_songArtist = 0;

          v109 = self->_album;
          self->_album = 0;

          v110 = self->_genre;
          self->_genre = 0;

          v111 = self->_song;
          self->_song = 0;

          v112 = self->_playlist;
          self->_playlist = 0;

          v113 = self->_musicVideo;
          self->_musicVideo = 0;

          v114 = self->_TVShow;
          self->_TVShow = 0;

          v115 = self->_TVEpisode;
          self->_TVEpisode = 0;

          self->_entityType = 10;
LABEL_39:
          audiobookArtist = self->_audiobookArtist;
          self->_audiobookArtist = 0;

          goto LABEL_40;
        }
        break;
      case 0xBu:
        v116 = [CCMediaAudiobookArtist alloc];
        CCPBReaderReadDataNoCopy();
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = 0;
        v118 = -[CCItemMessage initWithData:error:](v116, "initWithData:error:", v117, &v153);
        v10 = v153;
        v119 = self->_audiobookArtist;
        self->_audiobookArtist = v118;

        if (!v10)
        {
          v120 = self->_albumArtist;
          self->_albumArtist = 0;

          v121 = self->_songArtist;
          self->_songArtist = 0;

          v122 = self->_album;
          self->_album = 0;

          v123 = self->_genre;
          self->_genre = 0;

          v124 = self->_song;
          self->_song = 0;

          v125 = self->_playlist;
          self->_playlist = 0;

          v126 = self->_musicVideo;
          self->_musicVideo = 0;

          v127 = self->_TVShow;
          self->_TVShow = 0;

          v128 = self->_TVEpisode;
          self->_TVEpisode = 0;

          v129 = self->_movie;
          self->_movie = 0;

          self->_entityType = 11;
LABEL_40:
          audiobook = self->_audiobook;
          self->_audiobook = 0;

        }
        break;
      case 0xCu:
        v130 = [CCMediaAudiobook alloc];
        CCPBReaderReadDataNoCopy();
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = 0;
        v132 = -[CCItemMessage initWithData:error:](v130, "initWithData:error:", v131, &v152);
        v10 = v152;
        v133 = self->_audiobook;
        self->_audiobook = v132;

        if (!v10)
        {
          v134 = self->_albumArtist;
          self->_albumArtist = 0;

          v135 = self->_songArtist;
          self->_songArtist = 0;

          v136 = self->_album;
          self->_album = 0;

          v137 = self->_genre;
          self->_genre = 0;

          v138 = self->_song;
          self->_song = 0;

          v139 = self->_playlist;
          self->_playlist = 0;

          v140 = self->_musicVideo;
          self->_musicVideo = 0;

          v141 = self->_TVShow;
          self->_TVShow = 0;

          v142 = self->_TVEpisode;
          self->_TVEpisode = 0;

          v143 = self->_movie;
          self->_movie = 0;

          v144 = self->_audiobookArtist;
          self->_audiobookArtist = 0;

          self->_entityType = 12;
        }
        break;
      default:
        if ((CCPBReaderSkipValueWithTag() & 1) != 0)
        {
          v10 = 0;
        }
        else
        {
          v145 = (objc_class *)objc_opt_class();
          NSStringFromClass(v145);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          CCSkipFieldErrorForMessage();
          v10 = (id)objc_claimAutoreleasedReturnValue();

        }
        break;
    }
  }
  while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
  }
  else
  {
LABEL_60:
    if (!*(_QWORD *)&v6[*v9])
    {
      v10 = 0;
      v150 = 1;
      goto LABEL_64;
    }
LABEL_61:
    v147 = (objc_class *)objc_opt_class();
    NSStringFromClass(v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

    v10 = 0;
  }
  v150 = 0;
LABEL_64:

  return v150;
}

- (CCMediaAlbumArtist)albumArtist
{
  return (CCMediaAlbumArtist *)(id)-[CCMediaAlbumArtist copy](self->_albumArtist, "copy");
}

- (CCMediaSongArtist)songArtist
{
  return (CCMediaSongArtist *)(id)-[CCMediaSongArtist copy](self->_songArtist, "copy");
}

- (CCMediaAlbum)album
{
  return (CCMediaAlbum *)(id)-[CCMediaAlbum copy](self->_album, "copy");
}

- (CCMediaGenre)genre
{
  return (CCMediaGenre *)(id)-[CCMediaGenre copy](self->_genre, "copy");
}

- (CCMediaSong)song
{
  return (CCMediaSong *)(id)-[CCMediaSong copy](self->_song, "copy");
}

- (CCMediaPlaylist)playlist
{
  return (CCMediaPlaylist *)(id)-[CCMediaPlaylist copy](self->_playlist, "copy");
}

- (CCMediaMusicVideo)musicVideo
{
  return (CCMediaMusicVideo *)(id)-[CCMediaMusicVideo copy](self->_musicVideo, "copy");
}

- (CCMediaTVShow)TVShow
{
  return (CCMediaTVShow *)(id)-[CCMediaTVShow copy](self->_TVShow, "copy");
}

- (CCMediaTVEpisode)TVEpisode
{
  return (CCMediaTVEpisode *)(id)-[CCMediaTVEpisode copy](self->_TVEpisode, "copy");
}

- (CCMediaMovie)movie
{
  return (CCMediaMovie *)(id)-[CCMediaMovie copy](self->_movie, "copy");
}

- (CCMediaAudiobookArtist)audiobookArtist
{
  return (CCMediaAudiobookArtist *)(id)-[CCMediaAudiobookArtist copy](self->_audiobookArtist, "copy");
}

- (CCMediaAudiobook)audiobook
{
  return (CCMediaAudiobook *)(id)-[CCMediaAudiobook copy](self->_audiobook, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
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
  void (**v17)(id, void *);

  v17 = (void (**)(id, void *))a3;
  if (self->_albumArtist)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18541, self->_albumArtist);
    v17[2](v17, v5);

  }
  if (self->_songArtist)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18542, self->_songArtist);
    v17[2](v17, v6);

  }
  if (self->_album)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18543, self->_album);
    v17[2](v17, v7);

  }
  if (self->_genre)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18544, self->_genre);
    v17[2](v17, v8);

  }
  if (self->_song)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18545, self->_song);
    v17[2](v17, v9);

  }
  if (self->_playlist)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18546, self->_playlist);
    v17[2](v17, v10);

  }
  if (self->_musicVideo)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18547, self->_musicVideo);
    v17[2](v17, v11);

  }
  if (self->_TVShow)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18548, self->_TVShow);
    v17[2](v17, v12);

  }
  if (self->_TVEpisode)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18549, self->_TVEpisode);
    v17[2](v17, v13);

  }
  if (self->_movie)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18550, self->_movie);
    v17[2](v17, v14);

  }
  if (self->_audiobookArtist)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18551, self->_audiobookArtist);
    v17[2](v17, v15);

  }
  if (self->_audiobook)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 18552, self->_audiobook);
    v17[2](v17, v16);

  }
}

- (id)jsonDictionary
{
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = (void *)objc_opt_new();
  if (self->_albumArtist)
  {
    -[CCMediaContent albumArtist](self, "albumArtist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("albumArtist"));

  }
  if (self->_songArtist)
  {
    -[CCMediaContent songArtist](self, "songArtist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jsonDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("songArtist"));

  }
  if (self->_album)
  {
    -[CCMediaContent album](self, "album");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jsonDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("album"));

  }
  if (self->_genre)
  {
    -[CCMediaContent genre](self, "genre");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jsonDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("genre"));

  }
  if (self->_song)
  {
    -[CCMediaContent song](self, "song");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "jsonDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("song"));

  }
  if (self->_playlist)
  {
    -[CCMediaContent playlist](self, "playlist");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "jsonDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("playlist"));

  }
  if (self->_musicVideo)
  {
    -[CCMediaContent musicVideo](self, "musicVideo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "jsonDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("musicVideo"));

  }
  if (self->_TVShow)
  {
    -[CCMediaContent TVShow](self, "TVShow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "jsonDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("TVShow"));

  }
  if (self->_TVEpisode)
  {
    -[CCMediaContent TVEpisode](self, "TVEpisode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "jsonDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("TVEpisode"));

  }
  if (self->_movie)
  {
    -[CCMediaContent movie](self, "movie");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "jsonDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("movie"));

  }
  if (self->_audiobookArtist)
  {
    -[CCMediaContent audiobookArtist](self, "audiobookArtist");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "jsonDictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("audiobookArtist"));

  }
  if (self->_audiobook)
  {
    -[CCMediaContent audiobook](self, "audiobook");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "jsonDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("audiobook"));

  }
  v28 = (void *)objc_msgSend(v3, "copy");

  return v28;
}

- (CCMediaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  CCMediaAlbumArtist *v9;
  CCMediaAlbumArtist *v10;
  id v11;
  void *v12;
  CCMediaSongArtist *v13;
  CCMediaSongArtist *v14;
  CCMediaAlbumArtist *v15;
  CCMediaAlbum *v16;
  CCMediaAlbum *v17;
  CCMediaSongArtist *v18;
  CCMediaGenre *v19;
  CCMediaGenre *v20;
  CCMediaAlbum *v21;
  CCMediaContent *v22;
  CCMediaSong *v23;
  CCMediaAlbum *v24;
  uint64_t v25;
  CCMediaGenre *v26;
  CCMediaGenre *v27;
  uint64_t v28;
  CCMediaPlaylist *v29;
  CCMediaGenre *v30;
  id v31;
  uint64_t v32;
  CCMediaGenre *v33;
  void *v34;
  CCMediaMusicVideo *v35;
  uint64_t v36;
  id v37;
  CCMediaContent *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  CCMediaTVShow *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  CCMediaTVEpisode *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  CCMediaMovie *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  CCMediaAudiobookArtist *v56;
  id v57;
  uint64_t v58;
  void *v59;
  CCMediaAudiobook *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  CCMediaAlbumArtist *v65;
  int v66;
  id v67;
  CCMediaContent *v68;
  CCMediaAlbumArtist *v70;
  CCMediaAlbumArtist *v71;
  CCMediaSongArtist *v72;
  CCMediaAlbum *v73;
  CCMediaGenre *v74;
  CCMediaAlbumArtist *v75;
  CCMediaAlbumArtist *v76;
  CCMediaAlbumArtist *v77;
  CCMediaAlbumArtist *v78;
  CCMediaAlbumArtist *v79;
  unsigned int v80;
  void *v81;
  CCMediaGenre *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  CCMediaAlbumArtist *v88;
  void *v89;
  void *v90;
  CCMediaAlbum *v91;
  void *v92;
  CCMediaSongArtist *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106[3];

  v6 = a3;
  objc_opt_class();
  v106[1] = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("albumArtist"));
    v9 = (CCMediaAlbumArtist *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v106[0] = 0;
      v10 = -[CCMediaAlbumArtist initWithJSONDictionary:error:]([CCMediaAlbumArtist alloc], "initWithJSONDictionary:error:", v9, v106);
      v11 = v106[0];
      v12 = v11;
      if (!v10 || v11)
      {
        CCSetError();
        v38 = 0;
LABEL_106:

        goto LABEL_107;
      }

      v9 = v10;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("songArtist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = [CCMediaSongArtist alloc];
      v105 = 0;
      v14 = -[CCMediaSongArtist initWithJSONDictionary:error:](v13, "initWithJSONDictionary:error:", v12, &v105);
      v15 = (CCMediaAlbumArtist *)v105;
      v10 = v15;
      if (!v14 || v15)
      {
        CCSetError();
        v38 = 0;
LABEL_105:

        goto LABEL_106;
      }

      v12 = v14;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("album"));
    v10 = (CCMediaAlbumArtist *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v16 = [CCMediaAlbum alloc];
      v104 = 0;
      v17 = -[CCMediaAlbum initWithJSONDictionary:error:](v16, "initWithJSONDictionary:error:", v10, &v104);
      v18 = (CCMediaSongArtist *)v104;
      v14 = v18;
      if (!v17 || v18)
      {
        CCSetError();
        v38 = 0;
LABEL_104:

        goto LABEL_105;
      }

      v10 = (CCMediaAlbumArtist *)v17;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("genre"));
    v14 = (CCMediaSongArtist *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v19 = [CCMediaGenre alloc];
      v103 = 0;
      v20 = -[CCMediaGenre initWithJSONDictionary:error:](v19, "initWithJSONDictionary:error:", v14, &v103);
      v21 = (CCMediaAlbum *)v103;
      v17 = v21;
      if (!v20 || v21)
      {
        CCSetError();
        v38 = 0;
LABEL_103:

        goto LABEL_104;
      }

      v14 = (CCMediaSongArtist *)v20;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("song"));
    v17 = (CCMediaAlbum *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v93 = v14;
      v22 = self;
      v23 = [CCMediaSong alloc];
      v102 = 0;
      v24 = v17;
      v25 = -[CCMediaSong initWithJSONDictionary:error:](v23, "initWithJSONDictionary:error:", v17, &v102);
      v26 = (CCMediaGenre *)v102;
      v27 = v26;
      if (!v25 || v26)
      {
        CCSetError();
        v39 = (void *)v25;
        v38 = 0;
        v20 = v27;
        v17 = v24;
        self = v22;
        v14 = v93;
LABEL_102:

        goto LABEL_103;
      }
      v17 = (CCMediaAlbum *)v25;

      self = v22;
      v14 = v93;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playlist"));
    v28 = objc_claimAutoreleasedReturnValue();
    v91 = v17;
    if (v28)
    {
      v29 = [CCMediaPlaylist alloc];
      v101 = 0;
      v30 = (CCMediaGenre *)v28;
      v28 = -[CCMediaPlaylist initWithJSONDictionary:error:](v29, "initWithJSONDictionary:error:", v28, &v101);
      v31 = v101;
      v94 = (void *)v28;
      if (!v28 || v31)
      {
        v92 = v31;
        CCSetError();
        v38 = 0;
        v20 = v30;
        v17 = v91;
        goto LABEL_101;
      }

      v17 = v91;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("musicVideo"));
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      v92 = 0;
LABEL_38:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TVShow"));
      v40 = objc_claimAutoreleasedReturnValue();
      v82 = (CCMediaGenre *)v28;
      if (v40)
      {
        v41 = (void *)v40;
        v42 = [CCMediaTVShow alloc];
        v99 = 0;
        v94 = v41;
        v43 = -[CCMediaTVShow initWithJSONDictionary:error:](v42, "initWithJSONDictionary:error:", v41, &v99);
        v44 = v99;
        if (!v43 || v44)
        {
          v84 = (void *)v43;
          v90 = v44;
          CCSetError();
          v38 = 0;
          v20 = v82;

LABEL_100:
          goto LABEL_101;
        }

        v94 = (void *)v43;
      }
      else
      {
        v94 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TVEpisode"));
      v45 = objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v46 = (void *)v45;
        v47 = [CCMediaTVEpisode alloc];
        v98 = 0;
        v90 = v46;
        v48 = -[CCMediaTVEpisode initWithJSONDictionary:error:](v47, "initWithJSONDictionary:error:", v46, &v98);
        v49 = v98;
        v83 = (void *)v48;
        if (!v48 || v49)
        {
          v85 = v49;
          CCSetError();
          v38 = 0;
          v20 = v82;
          goto LABEL_98;
        }

        v90 = (void *)v48;
      }
      else
      {
        v90 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("movie"));
      v50 = objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        v51 = (void *)v50;
        v52 = [CCMediaMovie alloc];
        v97 = 0;
        v85 = v51;
        v53 = -[CCMediaMovie initWithJSONDictionary:error:](v52, "initWithJSONDictionary:error:", v51, &v97);
        v54 = v97;
        v81 = (void *)v53;
        if (!v53 || v54)
        {
          v83 = v54;
          CCSetError();
          v38 = 0;
          v20 = v82;
LABEL_97:

LABEL_98:
          goto LABEL_100;
        }

        v85 = (void *)v53;
      }
      else
      {
        v85 = 0;
      }
      v20 = v82;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("audiobookArtist"));
      v55 = objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        v83 = (void *)v55;
        v56 = [CCMediaAudiobookArtist alloc];
        v96 = 0;
        v86 = -[CCMediaAudiobookArtist initWithJSONDictionary:error:](v56, "initWithJSONDictionary:error:", v83, &v96);
        v57 = v96;
        if (!v86 || v57)
        {
          v81 = v57;
          CCSetError();
          v38 = 0;
          v64 = (void *)v86;
          goto LABEL_96;
        }

        v83 = (void *)v86;
      }
      else
      {
        v83 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("audiobook"));
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
      {
        v63 = 0;
        goto LABEL_68;
      }
      v59 = (void *)v58;
      v60 = [CCMediaAudiobook alloc];
      v95 = 0;
      v81 = v59;
      v61 = -[CCMediaAudiobook initWithJSONDictionary:error:](v60, "initWithJSONDictionary:error:", v59, &v95);
      v62 = v95;
      v87 = (void *)v61;
      if (v61 && !v62)
      {

        v63 = (void *)v61;
        v20 = v82;
LABEL_68:
        v81 = v63;
        if (v9)
        {
          v65 = v9;
          v66 = 1;
        }
        else
        {
          v66 = 0;
        }
        v88 = v9;
        if (v12)
        {
          v88 = v12;

          v66 = 2;
        }
        if (v10)
        {
          v71 = v10;

          v66 = 3;
          v88 = v71;
        }
        if (v14)
        {
          v72 = v14;

          v66 = 4;
          v88 = (CCMediaAlbumArtist *)v72;
        }
        if (v17)
        {
          v73 = v17;

          v66 = 5;
          v88 = (CCMediaAlbumArtist *)v73;
        }
        if (v20)
        {
          v74 = v20;

          v66 = 6;
          v88 = (CCMediaAlbumArtist *)v74;
        }
        if (v92)
        {
          v75 = v92;

          v66 = 7;
          v88 = v75;
        }
        if (v94)
        {
          v76 = v94;

          v66 = 8;
          v88 = v76;
        }
        if (v90)
        {
          v77 = v90;

          v66 = 9;
          v88 = v77;
        }
        if (v85)
        {
          v78 = v85;

          v66 = 10;
          v88 = v78;
        }
        if (v83)
        {
          v79 = v83;

          v66 = 11;
          v88 = v79;
        }
        if (v81)
        {
          v70 = v81;

          v80 = 12;
          v88 = v70;
        }
        else
        {
          v80 = v66;
        }
        v68 = -[CCMediaContent initWithEntity:entityType:error:]([CCMediaContent alloc], "initWithEntity:entityType:error:", v88, v80, a4);
        v64 = v88;
        v38 = v68;
        goto LABEL_96;
      }
      v67 = v62;
      CCSetError();

      v38 = 0;
      v64 = v67;
      v20 = v82;
LABEL_96:

      goto LABEL_97;
    }
    v33 = (CCMediaGenre *)v28;
    v34 = (void *)v32;
    v35 = [CCMediaMusicVideo alloc];
    v100 = 0;
    v92 = v34;
    v36 = -[CCMediaMusicVideo initWithJSONDictionary:error:](v35, "initWithJSONDictionary:error:", v34, &v100);
    v37 = v100;
    if (v36 && !v37)
    {

      v92 = (void *)v36;
      v28 = (uint64_t)v33;
      v17 = v91;
      goto LABEL_38;
    }
    v89 = (void *)v36;
    v94 = v37;
    CCSetError();
    v38 = 0;
    v20 = v33;
    v17 = v91;

LABEL_101:
    v39 = v92;
    goto LABEL_102;
  }
  CCSetError();
  v38 = 0;
LABEL_107:

  return v38;
}

- (unsigned)entityType
{
  return self->_entityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiobook, 0);
  objc_storeStrong((id *)&self->_audiobookArtist, 0);
  objc_storeStrong((id *)&self->_movie, 0);
  objc_storeStrong((id *)&self->_TVEpisode, 0);
  objc_storeStrong((id *)&self->_TVShow, 0);
  objc_storeStrong((id *)&self->_musicVideo, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_songArtist, 0);
  objc_storeStrong((id *)&self->_albumArtist, 0);
}

+ (unsigned)itemType
{
  return 18540;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 18540) > 0x1A)
    return 0;
  else
    return off_251030570[(unsigned __int16)(a3 - 18540)];
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
