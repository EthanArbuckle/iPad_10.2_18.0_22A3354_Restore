@implementation _INPBMessageLinkMetadata

- (void)setAlbumArtist:(id)a3
{
  NSString *v4;
  NSString *albumArtist;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  albumArtist = self->_albumArtist;
  self->_albumArtist = v4;

}

- (BOOL)hasAlbumArtist
{
  return self->_albumArtist != 0;
}

- (void)setAlbumName:(id)a3
{
  NSString *v4;
  NSString *albumName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  albumName = self->_albumName;
  self->_albumName = v4;

}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (void)setAppleTvSubtitle:(id)a3
{
  NSString *v4;
  NSString *appleTvSubtitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  appleTvSubtitle = self->_appleTvSubtitle;
  self->_appleTvSubtitle = v4;

}

- (BOOL)hasAppleTvSubtitle
{
  return self->_appleTvSubtitle != 0;
}

- (void)setAppleTvTitle:(id)a3
{
  NSString *v4;
  NSString *appleTvTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  appleTvTitle = self->_appleTvTitle;
  self->_appleTvTitle = v4;

}

- (BOOL)hasAppleTvTitle
{
  return self->_appleTvTitle != 0;
}

- (void)setArtistGenre:(id)a3
{
  NSString *v4;
  NSString *artistGenre;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  artistGenre = self->_artistGenre;
  self->_artistGenre = v4;

}

- (BOOL)hasArtistGenre
{
  return self->_artistGenre != 0;
}

- (void)setArtistName:(id)a3
{
  NSString *v4;
  NSString *artistName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  artistName = self->_artistName;
  self->_artistName = v4;

}

- (BOOL)hasArtistName
{
  return self->_artistName != 0;
}

- (void)setAudioBookAuthor:(id)a3
{
  NSString *v4;
  NSString *audioBookAuthor;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  audioBookAuthor = self->_audioBookAuthor;
  self->_audioBookAuthor = v4;

}

- (BOOL)hasAudioBookAuthor
{
  return self->_audioBookAuthor != 0;
}

- (void)setAudioBookName:(id)a3
{
  NSString *v4;
  NSString *audioBookName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  audioBookName = self->_audioBookName;
  self->_audioBookName = v4;

}

- (BOOL)hasAudioBookName
{
  return self->_audioBookName != 0;
}

- (void)setAudioBookNarrator:(id)a3
{
  NSString *v4;
  NSString *audioBookNarrator;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  audioBookNarrator = self->_audioBookNarrator;
  self->_audioBookNarrator = v4;

}

- (BOOL)hasAudioBookNarrator
{
  return self->_audioBookNarrator != 0;
}

- (void)setBookAuthor:(id)a3
{
  NSString *v4;
  NSString *bookAuthor;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bookAuthor = self->_bookAuthor;
  self->_bookAuthor = v4;

}

- (BOOL)hasBookAuthor
{
  return self->_bookAuthor != 0;
}

- (void)setBookName:(id)a3
{
  NSString *v4;
  NSString *bookName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bookName = self->_bookName;
  self->_bookName = v4;

}

- (BOOL)hasBookName
{
  return self->_bookName != 0;
}

- (void)setCreator:(id)a3
{
  NSString *v4;
  NSString *creator;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  creator = self->_creator;
  self->_creator = v4;

}

- (BOOL)hasCreator
{
  return self->_creator != 0;
}

- (void)setITunesStoreFrontIdentifier:(id)a3
{
  NSString *v4;
  NSString *iTunesStoreFrontIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  iTunesStoreFrontIdentifier = self->_iTunesStoreFrontIdentifier;
  self->_iTunesStoreFrontIdentifier = v4;

}

- (BOOL)hasITunesStoreFrontIdentifier
{
  return self->_iTunesStoreFrontIdentifier != 0;
}

- (void)setITunesStoreIdentifier:(id)a3
{
  NSString *v4;
  NSString *iTunesStoreIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
  self->_iTunesStoreIdentifier = v4;

}

- (BOOL)hasITunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier != 0;
}

- (void)setIconURLs:(id)a3
{
  NSArray *v4;
  NSArray *iconURLs;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  iconURLs = self->_iconURLs;
  self->_iconURLs = v4;

}

- (void)clearIconURLs
{
  -[NSArray removeAllObjects](self->_iconURLs, "removeAllObjects");
}

- (void)addIconURL:(id)a3
{
  id v4;
  NSArray *iconURLs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  iconURLs = self->_iconURLs;
  v8 = v4;
  if (!iconURLs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_iconURLs;
    self->_iconURLs = v6;

    v4 = v8;
    iconURLs = self->_iconURLs;
  }
  -[NSArray addObject:](iconURLs, "addObject:", v4);

}

- (unint64_t)iconURLsCount
{
  return -[NSArray count](self->_iconURLs, "count");
}

- (id)iconURLAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_iconURLs, "objectAtIndexedSubscript:", a3);
}

- (void)setImageURLs:(id)a3
{
  NSArray *v4;
  NSArray *imageURLs;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  imageURLs = self->_imageURLs;
  self->_imageURLs = v4;

}

- (void)clearImageURLs
{
  -[NSArray removeAllObjects](self->_imageURLs, "removeAllObjects");
}

- (void)addImageURL:(id)a3
{
  id v4;
  NSArray *imageURLs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  imageURLs = self->_imageURLs;
  v8 = v4;
  if (!imageURLs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_imageURLs;
    self->_imageURLs = v6;

    v4 = v8;
    imageURLs = self->_imageURLs;
  }
  -[NSArray addObject:](imageURLs, "addObject:", v4);

}

- (unint64_t)imageURLsCount
{
  return -[NSArray count](self->_imageURLs, "count");
}

- (id)imageURLAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_imageURLs, "objectAtIndexedSubscript:", a3);
}

- (void)setItemType:(id)a3
{
  NSString *v4;
  NSString *itemType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  itemType = self->_itemType;
  self->_itemType = v4;

}

- (BOOL)hasItemType
{
  return self->_itemType != 0;
}

- (void)setLinkMediaType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_linkMediaType = a3;
  }
}

- (BOOL)hasLinkMediaType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLinkMediaType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)linkMediaTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 99)
  {
    if (a3 <= 139)
    {
      if (a3 > 119)
      {
        if (a3 == 120)
          return CFSTR("PODCAST_EPISODE");
        if (a3 == 130)
          return CFSTR("TV_EPISODE");
      }
      else
      {
        if (a3 == 100)
          return CFSTR("AUDIO_BOOK");
        if (a3 == 110)
          return CFSTR("PODCAST");
      }
    }
    else if (a3 <= 159)
    {
      if (a3 == 140)
        return CFSTR("TV_SEASON");
      if (a3 == 150)
        return CFSTR("MOVIE");
    }
    else
    {
      switch(a3)
      {
        case 160:
          return CFSTR("TV_SHOW");
        case 170:
          return CFSTR("MOVIE_BUNDLE");
        case 180:
          return CFSTR("APPLE_TV");
      }
    }
    goto LABEL_46;
  }
  if (a3 <= 49)
  {
    if (a3 > 29)
    {
      if (a3 == 30)
        return CFSTR("ALBUM");
      if (a3 == 40)
        return CFSTR("MUSIC_VIDEO");
    }
    else
    {
      if (a3 == 10)
        return CFSTR("UNKNOWN_LINK_TYPE");
      if (a3 == 20)
        return CFSTR("SONG");
    }
    goto LABEL_46;
  }
  if (a3 <= 69)
  {
    if (a3 == 50)
      return CFSTR("ARTIST");
    if (a3 == 60)
      return CFSTR("PLAYLIST");
    goto LABEL_46;
  }
  if (a3 == 70)
    return CFSTR("RADIO");
  if (a3 == 80)
    return CFSTR("SOFTWARE");
  if (a3 != 90)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("BOOK");
  return v3;
}

- (int)StringAsLinkMediaType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_LINK_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SONG")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALBUM")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC_VIDEO")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTIST")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLAYLIST")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RADIO")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOFTWARE")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_BOOK")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST_EPISODE")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV_EPISODE")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV_SEASON")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOVIE")) & 1) != 0)
  {
    v4 = 150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV_SHOW")) & 1) != 0)
  {
    v4 = 160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOVIE_BUNDLE")) & 1) != 0)
  {
    v4 = 170;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_TV")))
  {
    v4 = 180;
  }
  else
  {
    v4 = 10;
  }

  return v4;
}

- (void)setLinkURL:(id)a3
{
  objc_storeStrong((id *)&self->_linkURL, a3);
}

- (BOOL)hasLinkURL
{
  return self->_linkURL != 0;
}

- (void)setMovieBundleGenre:(id)a3
{
  NSString *v4;
  NSString *movieBundleGenre;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  movieBundleGenre = self->_movieBundleGenre;
  self->_movieBundleGenre = v4;

}

- (BOOL)hasMovieBundleGenre
{
  return self->_movieBundleGenre != 0;
}

- (void)setMovieBundleName:(id)a3
{
  NSString *v4;
  NSString *movieBundleName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  movieBundleName = self->_movieBundleName;
  self->_movieBundleName = v4;

}

- (BOOL)hasMovieBundleName
{
  return self->_movieBundleName != 0;
}

- (void)setMovieGenre:(id)a3
{
  NSString *v4;
  NSString *movieGenre;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  movieGenre = self->_movieGenre;
  self->_movieGenre = v4;

}

- (BOOL)hasMovieGenre
{
  return self->_movieGenre != 0;
}

- (void)setMovieName:(id)a3
{
  NSString *v4;
  NSString *movieName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  movieName = self->_movieName;
  self->_movieName = v4;

}

- (BOOL)hasMovieName
{
  return self->_movieName != 0;
}

- (void)setMusicVideoArtist:(id)a3
{
  NSString *v4;
  NSString *musicVideoArtist;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  musicVideoArtist = self->_musicVideoArtist;
  self->_musicVideoArtist = v4;

}

- (BOOL)hasMusicVideoArtist
{
  return self->_musicVideoArtist != 0;
}

- (void)setMusicVideoName:(id)a3
{
  NSString *v4;
  NSString *musicVideoName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  musicVideoName = self->_musicVideoName;
  self->_musicVideoName = v4;

}

- (BOOL)hasMusicVideoName
{
  return self->_musicVideoName != 0;
}

- (void)setOpenGraphType:(id)a3
{
  NSString *v4;
  NSString *openGraphType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  openGraphType = self->_openGraphType;
  self->_openGraphType = v4;

}

- (BOOL)hasOpenGraphType
{
  return self->_openGraphType != 0;
}

- (void)setOriginalURL:(id)a3
{
  NSString *v4;
  NSString *originalURL;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  originalURL = self->_originalURL;
  self->_originalURL = v4;

}

- (BOOL)hasOriginalURL
{
  return self->_originalURL != 0;
}

- (void)setPlaylistCurator:(id)a3
{
  NSString *v4;
  NSString *playlistCurator;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  playlistCurator = self->_playlistCurator;
  self->_playlistCurator = v4;

}

- (BOOL)hasPlaylistCurator
{
  return self->_playlistCurator != 0;
}

- (void)setPlaylistName:(id)a3
{
  NSString *v4;
  NSString *playlistName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  playlistName = self->_playlistName;
  self->_playlistName = v4;

}

- (BOOL)hasPlaylistName
{
  return self->_playlistName != 0;
}

- (void)setPodcastArtist:(id)a3
{
  NSString *v4;
  NSString *podcastArtist;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  podcastArtist = self->_podcastArtist;
  self->_podcastArtist = v4;

}

- (BOOL)hasPodcastArtist
{
  return self->_podcastArtist != 0;
}

- (void)setPodcastEpisodeArtist:(id)a3
{
  NSString *v4;
  NSString *podcastEpisodeArtist;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  podcastEpisodeArtist = self->_podcastEpisodeArtist;
  self->_podcastEpisodeArtist = v4;

}

- (BOOL)hasPodcastEpisodeArtist
{
  return self->_podcastEpisodeArtist != 0;
}

- (void)setPodcastEpisodeName:(id)a3
{
  NSString *v4;
  NSString *podcastEpisodeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  podcastEpisodeName = self->_podcastEpisodeName;
  self->_podcastEpisodeName = v4;

}

- (BOOL)hasPodcastEpisodeName
{
  return self->_podcastEpisodeName != 0;
}

- (void)setPodcastEpisodePodcastName:(id)a3
{
  NSString *v4;
  NSString *podcastEpisodePodcastName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  podcastEpisodePodcastName = self->_podcastEpisodePodcastName;
  self->_podcastEpisodePodcastName = v4;

}

- (BOOL)hasPodcastEpisodePodcastName
{
  return self->_podcastEpisodePodcastName != 0;
}

- (void)setPodcastEpisodeReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_podcastEpisodeReleaseDate, a3);
}

- (BOOL)hasPodcastEpisodeReleaseDate
{
  return self->_podcastEpisodeReleaseDate != 0;
}

- (void)setPodcastName:(id)a3
{
  NSString *v4;
  NSString *podcastName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  podcastName = self->_podcastName;
  self->_podcastName = v4;

}

- (BOOL)hasPodcastName
{
  return self->_podcastName != 0;
}

- (void)setRadioCurator:(id)a3
{
  NSString *v4;
  NSString *radioCurator;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  radioCurator = self->_radioCurator;
  self->_radioCurator = v4;

}

- (BOOL)hasRadioCurator
{
  return self->_radioCurator != 0;
}

- (void)setRadioName:(id)a3
{
  NSString *v4;
  NSString *radioName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  radioName = self->_radioName;
  self->_radioName = v4;

}

- (BOOL)hasRadioName
{
  return self->_radioName != 0;
}

- (void)setSiteName:(id)a3
{
  NSString *v4;
  NSString *siteName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  siteName = self->_siteName;
  self->_siteName = v4;

}

- (BOOL)hasSiteName
{
  return self->_siteName != 0;
}

- (void)setSoftwareGenre:(id)a3
{
  NSString *v4;
  NSString *softwareGenre;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  softwareGenre = self->_softwareGenre;
  self->_softwareGenre = v4;

}

- (BOOL)hasSoftwareGenre
{
  return self->_softwareGenre != 0;
}

- (void)setSoftwareName:(id)a3
{
  NSString *v4;
  NSString *softwareName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  softwareName = self->_softwareName;
  self->_softwareName = v4;

}

- (BOOL)hasSoftwareName
{
  return self->_softwareName != 0;
}

- (void)setSoftwarePlatform:(id)a3
{
  NSString *v4;
  NSString *softwarePlatform;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  softwarePlatform = self->_softwarePlatform;
  self->_softwarePlatform = v4;

}

- (BOOL)hasSoftwarePlatform
{
  return self->_softwarePlatform != 0;
}

- (void)setSongAlbum:(id)a3
{
  NSString *v4;
  NSString *songAlbum;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  songAlbum = self->_songAlbum;
  self->_songAlbum = v4;

}

- (BOOL)hasSongAlbum
{
  return self->_songAlbum != 0;
}

- (void)setSongArtist:(id)a3
{
  NSString *v4;
  NSString *songArtist;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  songArtist = self->_songArtist;
  self->_songArtist = v4;

}

- (BOOL)hasSongArtist
{
  return self->_songArtist != 0;
}

- (void)setSongTitle:(id)a3
{
  NSString *v4;
  NSString *songTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  songTitle = self->_songTitle;
  self->_songTitle = v4;

}

- (BOOL)hasSongTitle
{
  return self->_songTitle != 0;
}

- (void)setSummary:(id)a3
{
  NSString *v4;
  NSString *summary;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  summary = self->_summary;
  self->_summary = v4;

}

- (BOOL)hasSummary
{
  return self->_summary != 0;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTvEpisodeEpisodeName:(id)a3
{
  NSString *v4;
  NSString *tvEpisodeEpisodeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tvEpisodeEpisodeName = self->_tvEpisodeEpisodeName;
  self->_tvEpisodeEpisodeName = v4;

}

- (BOOL)hasTvEpisodeEpisodeName
{
  return self->_tvEpisodeEpisodeName != 0;
}

- (void)setTvEpisodeGenre:(id)a3
{
  NSString *v4;
  NSString *tvEpisodeGenre;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tvEpisodeGenre = self->_tvEpisodeGenre;
  self->_tvEpisodeGenre = v4;

}

- (BOOL)hasTvEpisodeGenre
{
  return self->_tvEpisodeGenre != 0;
}

- (void)setTvEpisodeSeasonName:(id)a3
{
  NSString *v4;
  NSString *tvEpisodeSeasonName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tvEpisodeSeasonName = self->_tvEpisodeSeasonName;
  self->_tvEpisodeSeasonName = v4;

}

- (BOOL)hasTvEpisodeSeasonName
{
  return self->_tvEpisodeSeasonName != 0;
}

- (void)setTvSeasonGenre:(id)a3
{
  NSString *v4;
  NSString *tvSeasonGenre;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tvSeasonGenre = self->_tvSeasonGenre;
  self->_tvSeasonGenre = v4;

}

- (BOOL)hasTvSeasonGenre
{
  return self->_tvSeasonGenre != 0;
}

- (void)setTvSeasonName:(id)a3
{
  NSString *v4;
  NSString *tvSeasonName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tvSeasonName = self->_tvSeasonName;
  self->_tvSeasonName = v4;

}

- (BOOL)hasTvSeasonName
{
  return self->_tvSeasonName != 0;
}

- (void)setTvShowName:(id)a3
{
  NSString *v4;
  NSString *tvShowName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tvShowName = self->_tvShowName;
  self->_tvShowName = v4;

}

- (BOOL)hasTvShowName
{
  return self->_tvShowName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMessageLinkMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
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
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
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
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBMessageLinkMetadata albumArtist](self, "albumArtist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata albumName](self, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata appleTvSubtitle](self, "appleTvSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata appleTvTitle](self, "appleTvTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata artistGenre](self, "artistGenre");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata artistName](self, "artistName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata audioBookAuthor](self, "audioBookAuthor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata audioBookName](self, "audioBookName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata audioBookNarrator](self, "audioBookNarrator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata bookAuthor](self, "bookAuthor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata bookName](self, "bookName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata creator](self, "creator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata iTunesStoreFrontIdentifier](self, "iTunesStoreFrontIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteStringField();
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v19 = self->_iconURLs;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v71;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v71 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteStringField();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v21);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v24 = self->_imageURLs;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v67;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v67 != v27)
          objc_enumerationMutation(v24);
        PBDataWriterWriteStringField();
        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v26);
  }

  -[_INPBMessageLinkMetadata itemType](self, "itemType", v66);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    PBDataWriterWriteStringField();
  if (-[_INPBMessageLinkMetadata hasLinkMediaType](self, "hasLinkMediaType"))
    PBDataWriterWriteInt32Field();
  -[_INPBMessageLinkMetadata linkURL](self, "linkURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[_INPBMessageLinkMetadata linkURL](self, "linkURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessageLinkMetadata movieBundleGenre](self, "movieBundleGenre");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata movieBundleName](self, "movieBundleName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata movieGenre](self, "movieGenre");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata movieName](self, "movieName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata musicVideoArtist](self, "musicVideoArtist");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata musicVideoName](self, "musicVideoName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata openGraphType](self, "openGraphType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata originalURL](self, "originalURL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata playlistCurator](self, "playlistCurator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata playlistName](self, "playlistName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata podcastArtist](self, "podcastArtist");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata podcastEpisodeArtist](self, "podcastEpisodeArtist");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata podcastEpisodeName](self, "podcastEpisodeName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata podcastEpisodePodcastName](self, "podcastEpisodePodcastName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata podcastEpisodeReleaseDate](self, "podcastEpisodeReleaseDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[_INPBMessageLinkMetadata podcastEpisodeReleaseDate](self, "podcastEpisodeReleaseDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessageLinkMetadata podcastName](self, "podcastName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata radioCurator](self, "radioCurator");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata radioName](self, "radioName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata siteName](self, "siteName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata softwareGenre](self, "softwareGenre");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata softwareName](self, "softwareName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata softwarePlatform](self, "softwarePlatform");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata songAlbum](self, "songAlbum");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata songArtist](self, "songArtist");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata songTitle](self, "songTitle");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata summary](self, "summary");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata title](self, "title");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata tvEpisodeEpisodeName](self, "tvEpisodeEpisodeName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata tvEpisodeGenre](self, "tvEpisodeGenre");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata tvEpisodeSeasonName](self, "tvEpisodeSeasonName");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata tvSeasonGenre](self, "tvSeasonGenre");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata tvSeasonName](self, "tvSeasonName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
    PBDataWriterWriteStringField();
  -[_INPBMessageLinkMetadata tvShowName](self, "tvShowName");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
    PBDataWriterWriteStringField();

}

- (_INPBMessageLinkMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBMessageLinkMetadata *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBMessageLinkMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBMessageLinkMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBMessageLinkMetadata initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBMessageLinkMetadata data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBMessageLinkMetadata *v5;
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
  id v23;
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
  id v38;
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

  v5 = -[_INPBMessageLinkMetadata init](+[_INPBMessageLinkMetadata allocWithZone:](_INPBMessageLinkMetadata, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_albumArtist, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setAlbumArtist:](v5, "setAlbumArtist:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_albumName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setAlbumName:](v5, "setAlbumName:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_appleTvSubtitle, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setAppleTvSubtitle:](v5, "setAppleTvSubtitle:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_appleTvTitle, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setAppleTvTitle:](v5, "setAppleTvTitle:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_artistGenre, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setArtistGenre:](v5, "setArtistGenre:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_artistName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setArtistName:](v5, "setArtistName:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_audioBookAuthor, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setAudioBookAuthor:](v5, "setAudioBookAuthor:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_audioBookName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setAudioBookName:](v5, "setAudioBookName:", v13);

  v14 = (void *)-[NSString copyWithZone:](self->_audioBookNarrator, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setAudioBookNarrator:](v5, "setAudioBookNarrator:", v14);

  v15 = (void *)-[NSString copyWithZone:](self->_bookAuthor, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setBookAuthor:](v5, "setBookAuthor:", v15);

  v16 = (void *)-[NSString copyWithZone:](self->_bookName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setBookName:](v5, "setBookName:", v16);

  v17 = (void *)-[NSString copyWithZone:](self->_creator, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setCreator:](v5, "setCreator:", v17);

  v18 = (void *)-[NSString copyWithZone:](self->_iTunesStoreFrontIdentifier, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setITunesStoreFrontIdentifier:](v5, "setITunesStoreFrontIdentifier:", v18);

  v19 = (void *)-[NSString copyWithZone:](self->_iTunesStoreIdentifier, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setITunesStoreIdentifier:](v5, "setITunesStoreIdentifier:", v19);

  v20 = (void *)-[NSArray copyWithZone:](self->_iconURLs, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setIconURLs:](v5, "setIconURLs:", v20);

  v21 = (void *)-[NSArray copyWithZone:](self->_imageURLs, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setImageURLs:](v5, "setImageURLs:", v21);

  v22 = (void *)-[NSString copyWithZone:](self->_itemType, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setItemType:](v5, "setItemType:", v22);

  if (-[_INPBMessageLinkMetadata hasLinkMediaType](self, "hasLinkMediaType"))
    -[_INPBMessageLinkMetadata setLinkMediaType:](v5, "setLinkMediaType:", -[_INPBMessageLinkMetadata linkMediaType](self, "linkMediaType"));
  v23 = -[_INPBURLValue copyWithZone:](self->_linkURL, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setLinkURL:](v5, "setLinkURL:", v23);

  v24 = (void *)-[NSString copyWithZone:](self->_movieBundleGenre, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setMovieBundleGenre:](v5, "setMovieBundleGenre:", v24);

  v25 = (void *)-[NSString copyWithZone:](self->_movieBundleName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setMovieBundleName:](v5, "setMovieBundleName:", v25);

  v26 = (void *)-[NSString copyWithZone:](self->_movieGenre, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setMovieGenre:](v5, "setMovieGenre:", v26);

  v27 = (void *)-[NSString copyWithZone:](self->_movieName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setMovieName:](v5, "setMovieName:", v27);

  v28 = (void *)-[NSString copyWithZone:](self->_musicVideoArtist, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setMusicVideoArtist:](v5, "setMusicVideoArtist:", v28);

  v29 = (void *)-[NSString copyWithZone:](self->_musicVideoName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setMusicVideoName:](v5, "setMusicVideoName:", v29);

  v30 = (void *)-[NSString copyWithZone:](self->_openGraphType, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setOpenGraphType:](v5, "setOpenGraphType:", v30);

  v31 = (void *)-[NSString copyWithZone:](self->_originalURL, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setOriginalURL:](v5, "setOriginalURL:", v31);

  v32 = (void *)-[NSString copyWithZone:](self->_playlistCurator, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setPlaylistCurator:](v5, "setPlaylistCurator:", v32);

  v33 = (void *)-[NSString copyWithZone:](self->_playlistName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setPlaylistName:](v5, "setPlaylistName:", v33);

  v34 = (void *)-[NSString copyWithZone:](self->_podcastArtist, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setPodcastArtist:](v5, "setPodcastArtist:", v34);

  v35 = (void *)-[NSString copyWithZone:](self->_podcastEpisodeArtist, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setPodcastEpisodeArtist:](v5, "setPodcastEpisodeArtist:", v35);

  v36 = (void *)-[NSString copyWithZone:](self->_podcastEpisodeName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setPodcastEpisodeName:](v5, "setPodcastEpisodeName:", v36);

  v37 = (void *)-[NSString copyWithZone:](self->_podcastEpisodePodcastName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setPodcastEpisodePodcastName:](v5, "setPodcastEpisodePodcastName:", v37);

  v38 = -[_INPBDateTime copyWithZone:](self->_podcastEpisodeReleaseDate, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setPodcastEpisodeReleaseDate:](v5, "setPodcastEpisodeReleaseDate:", v38);

  v39 = (void *)-[NSString copyWithZone:](self->_podcastName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setPodcastName:](v5, "setPodcastName:", v39);

  v40 = (void *)-[NSString copyWithZone:](self->_radioCurator, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setRadioCurator:](v5, "setRadioCurator:", v40);

  v41 = (void *)-[NSString copyWithZone:](self->_radioName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setRadioName:](v5, "setRadioName:", v41);

  v42 = (void *)-[NSString copyWithZone:](self->_siteName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setSiteName:](v5, "setSiteName:", v42);

  v43 = (void *)-[NSString copyWithZone:](self->_softwareGenre, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setSoftwareGenre:](v5, "setSoftwareGenre:", v43);

  v44 = (void *)-[NSString copyWithZone:](self->_softwareName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setSoftwareName:](v5, "setSoftwareName:", v44);

  v45 = (void *)-[NSString copyWithZone:](self->_softwarePlatform, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setSoftwarePlatform:](v5, "setSoftwarePlatform:", v45);

  v46 = (void *)-[NSString copyWithZone:](self->_songAlbum, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setSongAlbum:](v5, "setSongAlbum:", v46);

  v47 = (void *)-[NSString copyWithZone:](self->_songArtist, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setSongArtist:](v5, "setSongArtist:", v47);

  v48 = (void *)-[NSString copyWithZone:](self->_songTitle, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setSongTitle:](v5, "setSongTitle:", v48);

  v49 = (void *)-[NSString copyWithZone:](self->_summary, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setSummary:](v5, "setSummary:", v49);

  v50 = (void *)-[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setTitle:](v5, "setTitle:", v50);

  v51 = (void *)-[NSString copyWithZone:](self->_tvEpisodeEpisodeName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setTvEpisodeEpisodeName:](v5, "setTvEpisodeEpisodeName:", v51);

  v52 = (void *)-[NSString copyWithZone:](self->_tvEpisodeGenre, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setTvEpisodeGenre:](v5, "setTvEpisodeGenre:", v52);

  v53 = (void *)-[NSString copyWithZone:](self->_tvEpisodeSeasonName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setTvEpisodeSeasonName:](v5, "setTvEpisodeSeasonName:", v53);

  v54 = (void *)-[NSString copyWithZone:](self->_tvSeasonGenre, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setTvSeasonGenre:](v5, "setTvSeasonGenre:", v54);

  v55 = (void *)-[NSString copyWithZone:](self->_tvSeasonName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setTvSeasonName:](v5, "setTvSeasonName:", v55);

  v56 = (void *)-[NSString copyWithZone:](self->_tvShowName, "copyWithZone:", a3);
  -[_INPBMessageLinkMetadata setTvShowName:](v5, "setTvShowName:", v56);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  int v92;
  int linkMediaType;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  int v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  int v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  int v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  int v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  int v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  int v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  int v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  int v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  int v183;
  uint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  int v188;
  uint64_t v189;
  void *v190;
  void *v191;
  void *v192;
  int v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  int v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  int v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  int v208;
  uint64_t v209;
  void *v210;
  void *v211;
  void *v212;
  int v213;
  uint64_t v214;
  void *v215;
  void *v216;
  void *v217;
  int v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  int v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  int v228;
  uint64_t v229;
  void *v230;
  void *v231;
  void *v232;
  int v233;
  uint64_t v234;
  void *v235;
  void *v236;
  void *v237;
  int v238;
  uint64_t v239;
  void *v240;
  void *v241;
  void *v242;
  int v243;
  uint64_t v244;
  void *v245;
  void *v246;
  void *v247;
  int v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  int v253;
  uint64_t v254;
  void *v255;
  void *v256;
  void *v257;
  int v258;
  uint64_t v259;
  void *v260;
  void *v261;
  void *v262;
  char v263;
  BOOL v264;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_261;
  -[_INPBMessageLinkMetadata albumArtist](self, "albumArtist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albumArtist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata albumArtist](self, "albumArtist");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBMessageLinkMetadata albumArtist](self, "albumArtist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumArtist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata albumName](self, "albumName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata albumName](self, "albumName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBMessageLinkMetadata albumName](self, "albumName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata appleTvSubtitle](self, "appleTvSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleTvSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata appleTvSubtitle](self, "appleTvSubtitle");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBMessageLinkMetadata appleTvSubtitle](self, "appleTvSubtitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleTvSubtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata appleTvTitle](self, "appleTvTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleTvTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata appleTvTitle](self, "appleTvTitle");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBMessageLinkMetadata appleTvTitle](self, "appleTvTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleTvTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata artistGenre](self, "artistGenre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artistGenre");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata artistGenre](self, "artistGenre");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBMessageLinkMetadata artistGenre](self, "artistGenre");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artistGenre");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata artistName](self, "artistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata artistName](self, "artistName");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBMessageLinkMetadata artistName](self, "artistName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artistName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata audioBookAuthor](self, "audioBookAuthor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioBookAuthor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata audioBookAuthor](self, "audioBookAuthor");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBMessageLinkMetadata audioBookAuthor](self, "audioBookAuthor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioBookAuthor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata audioBookName](self, "audioBookName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioBookName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata audioBookName](self, "audioBookName");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBMessageLinkMetadata audioBookName](self, "audioBookName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioBookName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata audioBookNarrator](self, "audioBookNarrator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioBookNarrator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata audioBookNarrator](self, "audioBookNarrator");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_INPBMessageLinkMetadata audioBookNarrator](self, "audioBookNarrator");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioBookNarrator");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata bookAuthor](self, "bookAuthor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookAuthor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata bookAuthor](self, "bookAuthor");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_INPBMessageLinkMetadata bookAuthor](self, "bookAuthor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bookAuthor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata bookName](self, "bookName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata bookName](self, "bookName");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_INPBMessageLinkMetadata bookName](self, "bookName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bookName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata creator](self, "creator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata creator](self, "creator");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[_INPBMessageLinkMetadata creator](self, "creator");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "creator");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata iTunesStoreFrontIdentifier](self, "iTunesStoreFrontIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesStoreFrontIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata iTunesStoreFrontIdentifier](self, "iTunesStoreFrontIdentifier");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    -[_INPBMessageLinkMetadata iTunesStoreFrontIdentifier](self, "iTunesStoreFrontIdentifier");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iTunesStoreFrontIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesStoreIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    -[_INPBMessageLinkMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iTunesStoreIdentifier");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "isEqual:", v75);

    if (!v76)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata iconURLs](self, "iconURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata iconURLs](self, "iconURLs");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    -[_INPBMessageLinkMetadata iconURLs](self, "iconURLs");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconURLs");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqual:", v80);

    if (!v81)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata imageURLs](self, "imageURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata imageURLs](self, "imageURLs");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    -[_INPBMessageLinkMetadata imageURLs](self, "imageURLs");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageURLs");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v84, "isEqual:", v85);

    if (!v86)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata itemType](self, "itemType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata itemType](self, "itemType");
  v87 = objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v88 = (void *)v87;
    -[_INPBMessageLinkMetadata itemType](self, "itemType");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemType");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "isEqual:", v90);

    if (!v91)
      goto LABEL_261;
  }
  else
  {

  }
  v92 = -[_INPBMessageLinkMetadata hasLinkMediaType](self, "hasLinkMediaType");
  if (v92 != objc_msgSend(v4, "hasLinkMediaType"))
    goto LABEL_261;
  if (-[_INPBMessageLinkMetadata hasLinkMediaType](self, "hasLinkMediaType"))
  {
    if (objc_msgSend(v4, "hasLinkMediaType"))
    {
      linkMediaType = self->_linkMediaType;
      if (linkMediaType != objc_msgSend(v4, "linkMediaType"))
        goto LABEL_261;
    }
  }
  -[_INPBMessageLinkMetadata linkURL](self, "linkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata linkURL](self, "linkURL");
  v94 = objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    v95 = (void *)v94;
    -[_INPBMessageLinkMetadata linkURL](self, "linkURL");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkURL");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v96, "isEqual:", v97);

    if (!v98)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata movieBundleGenre](self, "movieBundleGenre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "movieBundleGenre");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata movieBundleGenre](self, "movieBundleGenre");
  v99 = objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    v100 = (void *)v99;
    -[_INPBMessageLinkMetadata movieBundleGenre](self, "movieBundleGenre");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "movieBundleGenre");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v101, "isEqual:", v102);

    if (!v103)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata movieBundleName](self, "movieBundleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "movieBundleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata movieBundleName](self, "movieBundleName");
  v104 = objc_claimAutoreleasedReturnValue();
  if (v104)
  {
    v105 = (void *)v104;
    -[_INPBMessageLinkMetadata movieBundleName](self, "movieBundleName");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "movieBundleName");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v106, "isEqual:", v107);

    if (!v108)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata movieGenre](self, "movieGenre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "movieGenre");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata movieGenre](self, "movieGenre");
  v109 = objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    v110 = (void *)v109;
    -[_INPBMessageLinkMetadata movieGenre](self, "movieGenre");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "movieGenre");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v111, "isEqual:", v112);

    if (!v113)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata movieName](self, "movieName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "movieName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata movieName](self, "movieName");
  v114 = objc_claimAutoreleasedReturnValue();
  if (v114)
  {
    v115 = (void *)v114;
    -[_INPBMessageLinkMetadata movieName](self, "movieName");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "movieName");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v116, "isEqual:", v117);

    if (!v118)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata musicVideoArtist](self, "musicVideoArtist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "musicVideoArtist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata musicVideoArtist](self, "musicVideoArtist");
  v119 = objc_claimAutoreleasedReturnValue();
  if (v119)
  {
    v120 = (void *)v119;
    -[_INPBMessageLinkMetadata musicVideoArtist](self, "musicVideoArtist");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "musicVideoArtist");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v121, "isEqual:", v122);

    if (!v123)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata musicVideoName](self, "musicVideoName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "musicVideoName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata musicVideoName](self, "musicVideoName");
  v124 = objc_claimAutoreleasedReturnValue();
  if (v124)
  {
    v125 = (void *)v124;
    -[_INPBMessageLinkMetadata musicVideoName](self, "musicVideoName");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "musicVideoName");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v126, "isEqual:", v127);

    if (!v128)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata openGraphType](self, "openGraphType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openGraphType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata openGraphType](self, "openGraphType");
  v129 = objc_claimAutoreleasedReturnValue();
  if (v129)
  {
    v130 = (void *)v129;
    -[_INPBMessageLinkMetadata openGraphType](self, "openGraphType");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openGraphType");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v131, "isEqual:", v132);

    if (!v133)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata originalURL](self, "originalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata originalURL](self, "originalURL");
  v134 = objc_claimAutoreleasedReturnValue();
  if (v134)
  {
    v135 = (void *)v134;
    -[_INPBMessageLinkMetadata originalURL](self, "originalURL");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalURL");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v136, "isEqual:", v137);

    if (!v138)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata playlistCurator](self, "playlistCurator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playlistCurator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata playlistCurator](self, "playlistCurator");
  v139 = objc_claimAutoreleasedReturnValue();
  if (v139)
  {
    v140 = (void *)v139;
    -[_INPBMessageLinkMetadata playlistCurator](self, "playlistCurator");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playlistCurator");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v141, "isEqual:", v142);

    if (!v143)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata playlistName](self, "playlistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playlistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata playlistName](self, "playlistName");
  v144 = objc_claimAutoreleasedReturnValue();
  if (v144)
  {
    v145 = (void *)v144;
    -[_INPBMessageLinkMetadata playlistName](self, "playlistName");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playlistName");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = objc_msgSend(v146, "isEqual:", v147);

    if (!v148)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata podcastArtist](self, "podcastArtist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastArtist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata podcastArtist](self, "podcastArtist");
  v149 = objc_claimAutoreleasedReturnValue();
  if (v149)
  {
    v150 = (void *)v149;
    -[_INPBMessageLinkMetadata podcastArtist](self, "podcastArtist");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "podcastArtist");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v151, "isEqual:", v152);

    if (!v153)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata podcastEpisodeArtist](self, "podcastEpisodeArtist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastEpisodeArtist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata podcastEpisodeArtist](self, "podcastEpisodeArtist");
  v154 = objc_claimAutoreleasedReturnValue();
  if (v154)
  {
    v155 = (void *)v154;
    -[_INPBMessageLinkMetadata podcastEpisodeArtist](self, "podcastEpisodeArtist");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "podcastEpisodeArtist");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = objc_msgSend(v156, "isEqual:", v157);

    if (!v158)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata podcastEpisodeName](self, "podcastEpisodeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastEpisodeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata podcastEpisodeName](self, "podcastEpisodeName");
  v159 = objc_claimAutoreleasedReturnValue();
  if (v159)
  {
    v160 = (void *)v159;
    -[_INPBMessageLinkMetadata podcastEpisodeName](self, "podcastEpisodeName");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "podcastEpisodeName");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = objc_msgSend(v161, "isEqual:", v162);

    if (!v163)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata podcastEpisodePodcastName](self, "podcastEpisodePodcastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastEpisodePodcastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata podcastEpisodePodcastName](self, "podcastEpisodePodcastName");
  v164 = objc_claimAutoreleasedReturnValue();
  if (v164)
  {
    v165 = (void *)v164;
    -[_INPBMessageLinkMetadata podcastEpisodePodcastName](self, "podcastEpisodePodcastName");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "podcastEpisodePodcastName");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = objc_msgSend(v166, "isEqual:", v167);

    if (!v168)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata podcastEpisodeReleaseDate](self, "podcastEpisodeReleaseDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastEpisodeReleaseDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata podcastEpisodeReleaseDate](self, "podcastEpisodeReleaseDate");
  v169 = objc_claimAutoreleasedReturnValue();
  if (v169)
  {
    v170 = (void *)v169;
    -[_INPBMessageLinkMetadata podcastEpisodeReleaseDate](self, "podcastEpisodeReleaseDate");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "podcastEpisodeReleaseDate");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = objc_msgSend(v171, "isEqual:", v172);

    if (!v173)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata podcastName](self, "podcastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata podcastName](self, "podcastName");
  v174 = objc_claimAutoreleasedReturnValue();
  if (v174)
  {
    v175 = (void *)v174;
    -[_INPBMessageLinkMetadata podcastName](self, "podcastName");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "podcastName");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = objc_msgSend(v176, "isEqual:", v177);

    if (!v178)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata radioCurator](self, "radioCurator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "radioCurator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata radioCurator](self, "radioCurator");
  v179 = objc_claimAutoreleasedReturnValue();
  if (v179)
  {
    v180 = (void *)v179;
    -[_INPBMessageLinkMetadata radioCurator](self, "radioCurator");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "radioCurator");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = objc_msgSend(v181, "isEqual:", v182);

    if (!v183)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata radioName](self, "radioName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "radioName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata radioName](self, "radioName");
  v184 = objc_claimAutoreleasedReturnValue();
  if (v184)
  {
    v185 = (void *)v184;
    -[_INPBMessageLinkMetadata radioName](self, "radioName");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "radioName");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = objc_msgSend(v186, "isEqual:", v187);

    if (!v188)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata siteName](self, "siteName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siteName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata siteName](self, "siteName");
  v189 = objc_claimAutoreleasedReturnValue();
  if (v189)
  {
    v190 = (void *)v189;
    -[_INPBMessageLinkMetadata siteName](self, "siteName");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siteName");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = objc_msgSend(v191, "isEqual:", v192);

    if (!v193)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata softwareGenre](self, "softwareGenre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "softwareGenre");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata softwareGenre](self, "softwareGenre");
  v194 = objc_claimAutoreleasedReturnValue();
  if (v194)
  {
    v195 = (void *)v194;
    -[_INPBMessageLinkMetadata softwareGenre](self, "softwareGenre");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "softwareGenre");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = objc_msgSend(v196, "isEqual:", v197);

    if (!v198)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata softwareName](self, "softwareName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "softwareName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata softwareName](self, "softwareName");
  v199 = objc_claimAutoreleasedReturnValue();
  if (v199)
  {
    v200 = (void *)v199;
    -[_INPBMessageLinkMetadata softwareName](self, "softwareName");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "softwareName");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v203 = objc_msgSend(v201, "isEqual:", v202);

    if (!v203)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata softwarePlatform](self, "softwarePlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "softwarePlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata softwarePlatform](self, "softwarePlatform");
  v204 = objc_claimAutoreleasedReturnValue();
  if (v204)
  {
    v205 = (void *)v204;
    -[_INPBMessageLinkMetadata softwarePlatform](self, "softwarePlatform");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "softwarePlatform");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = objc_msgSend(v206, "isEqual:", v207);

    if (!v208)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata songAlbum](self, "songAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "songAlbum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata songAlbum](self, "songAlbum");
  v209 = objc_claimAutoreleasedReturnValue();
  if (v209)
  {
    v210 = (void *)v209;
    -[_INPBMessageLinkMetadata songAlbum](self, "songAlbum");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "songAlbum");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = objc_msgSend(v211, "isEqual:", v212);

    if (!v213)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata songArtist](self, "songArtist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "songArtist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata songArtist](self, "songArtist");
  v214 = objc_claimAutoreleasedReturnValue();
  if (v214)
  {
    v215 = (void *)v214;
    -[_INPBMessageLinkMetadata songArtist](self, "songArtist");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "songArtist");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = objc_msgSend(v216, "isEqual:", v217);

    if (!v218)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata songTitle](self, "songTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "songTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata songTitle](self, "songTitle");
  v219 = objc_claimAutoreleasedReturnValue();
  if (v219)
  {
    v220 = (void *)v219;
    -[_INPBMessageLinkMetadata songTitle](self, "songTitle");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "songTitle");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    v223 = objc_msgSend(v221, "isEqual:", v222);

    if (!v223)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata summary](self, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata summary](self, "summary");
  v224 = objc_claimAutoreleasedReturnValue();
  if (v224)
  {
    v225 = (void *)v224;
    -[_INPBMessageLinkMetadata summary](self, "summary");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "summary");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = objc_msgSend(v226, "isEqual:", v227);

    if (!v228)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata title](self, "title");
  v229 = objc_claimAutoreleasedReturnValue();
  if (v229)
  {
    v230 = (void *)v229;
    -[_INPBMessageLinkMetadata title](self, "title");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    v233 = objc_msgSend(v231, "isEqual:", v232);

    if (!v233)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata tvEpisodeEpisodeName](self, "tvEpisodeEpisodeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvEpisodeEpisodeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata tvEpisodeEpisodeName](self, "tvEpisodeEpisodeName");
  v234 = objc_claimAutoreleasedReturnValue();
  if (v234)
  {
    v235 = (void *)v234;
    -[_INPBMessageLinkMetadata tvEpisodeEpisodeName](self, "tvEpisodeEpisodeName");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvEpisodeEpisodeName");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    v238 = objc_msgSend(v236, "isEqual:", v237);

    if (!v238)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata tvEpisodeGenre](self, "tvEpisodeGenre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvEpisodeGenre");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata tvEpisodeGenre](self, "tvEpisodeGenre");
  v239 = objc_claimAutoreleasedReturnValue();
  if (v239)
  {
    v240 = (void *)v239;
    -[_INPBMessageLinkMetadata tvEpisodeGenre](self, "tvEpisodeGenre");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvEpisodeGenre");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    v243 = objc_msgSend(v241, "isEqual:", v242);

    if (!v243)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata tvEpisodeSeasonName](self, "tvEpisodeSeasonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvEpisodeSeasonName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata tvEpisodeSeasonName](self, "tvEpisodeSeasonName");
  v244 = objc_claimAutoreleasedReturnValue();
  if (v244)
  {
    v245 = (void *)v244;
    -[_INPBMessageLinkMetadata tvEpisodeSeasonName](self, "tvEpisodeSeasonName");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvEpisodeSeasonName");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    v248 = objc_msgSend(v246, "isEqual:", v247);

    if (!v248)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata tvSeasonGenre](self, "tvSeasonGenre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvSeasonGenre");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata tvSeasonGenre](self, "tvSeasonGenre");
  v249 = objc_claimAutoreleasedReturnValue();
  if (v249)
  {
    v250 = (void *)v249;
    -[_INPBMessageLinkMetadata tvSeasonGenre](self, "tvSeasonGenre");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvSeasonGenre");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    v253 = objc_msgSend(v251, "isEqual:", v252);

    if (!v253)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata tvSeasonName](self, "tvSeasonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvSeasonName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_260;
  -[_INPBMessageLinkMetadata tvSeasonName](self, "tvSeasonName");
  v254 = objc_claimAutoreleasedReturnValue();
  if (v254)
  {
    v255 = (void *)v254;
    -[_INPBMessageLinkMetadata tvSeasonName](self, "tvSeasonName");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvSeasonName");
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    v258 = objc_msgSend(v256, "isEqual:", v257);

    if (!v258)
      goto LABEL_261;
  }
  else
  {

  }
  -[_INPBMessageLinkMetadata tvShowName](self, "tvShowName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvShowName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBMessageLinkMetadata tvShowName](self, "tvShowName");
    v259 = objc_claimAutoreleasedReturnValue();
    if (!v259)
    {

LABEL_264:
      v264 = 1;
      goto LABEL_262;
    }
    v260 = (void *)v259;
    -[_INPBMessageLinkMetadata tvShowName](self, "tvShowName");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvShowName");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    v263 = objc_msgSend(v261, "isEqual:", v262);

    if ((v263 & 1) != 0)
      goto LABEL_264;
  }
  else
  {
LABEL_260:

  }
LABEL_261:
  v264 = 0;
LABEL_262:

  return v264;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  unint64_t v14;
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
  unint64_t v29;
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
  NSUInteger v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;

  v55 = -[NSString hash](self->_albumArtist, "hash");
  v54 = -[NSString hash](self->_albumName, "hash");
  v53 = -[NSString hash](self->_appleTvSubtitle, "hash");
  v52 = -[NSString hash](self->_appleTvTitle, "hash");
  v51 = -[NSString hash](self->_artistGenre, "hash");
  v50 = -[NSString hash](self->_artistName, "hash");
  v49 = -[NSString hash](self->_audioBookAuthor, "hash");
  v48 = -[NSString hash](self->_audioBookName, "hash");
  v3 = -[NSString hash](self->_audioBookNarrator, "hash");
  v4 = -[NSString hash](self->_bookAuthor, "hash");
  v5 = -[NSString hash](self->_bookName, "hash");
  v6 = -[NSString hash](self->_creator, "hash");
  v7 = -[NSString hash](self->_iTunesStoreFrontIdentifier, "hash");
  v8 = -[NSString hash](self->_iTunesStoreIdentifier, "hash");
  v9 = -[NSArray hash](self->_iconURLs, "hash");
  v10 = -[NSArray hash](self->_imageURLs, "hash");
  v11 = -[NSString hash](self->_itemType, "hash");
  if (-[_INPBMessageLinkMetadata hasLinkMediaType](self, "hasLinkMediaType"))
    v12 = 2654435761 * self->_linkMediaType;
  else
    v12 = 0;
  v13 = v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v14 = v11 ^ v12 ^ -[_INPBURLValue hash](self->_linkURL, "hash");
  v15 = v14 ^ -[NSString hash](self->_movieBundleGenre, "hash");
  v16 = v15 ^ -[NSString hash](self->_movieBundleName, "hash");
  v17 = v13 ^ v16 ^ -[NSString hash](self->_movieGenre, "hash");
  v18 = -[NSString hash](self->_movieName, "hash");
  v19 = v18 ^ -[NSString hash](self->_musicVideoArtist, "hash");
  v20 = v19 ^ -[NSString hash](self->_musicVideoName, "hash");
  v21 = v20 ^ -[NSString hash](self->_openGraphType, "hash");
  v22 = v21 ^ -[NSString hash](self->_originalURL, "hash");
  v23 = v22 ^ -[NSString hash](self->_playlistCurator, "hash");
  v24 = v17 ^ v23 ^ -[NSString hash](self->_playlistName, "hash");
  v25 = -[NSString hash](self->_podcastArtist, "hash");
  v26 = v25 ^ -[NSString hash](self->_podcastEpisodeArtist, "hash");
  v27 = v26 ^ -[NSString hash](self->_podcastEpisodeName, "hash");
  v28 = v27 ^ -[NSString hash](self->_podcastEpisodePodcastName, "hash");
  v29 = v28 ^ -[_INPBDateTime hash](self->_podcastEpisodeReleaseDate, "hash");
  v30 = v29 ^ -[NSString hash](self->_podcastName, "hash");
  v31 = v30 ^ -[NSString hash](self->_radioCurator, "hash");
  v32 = v24 ^ v31 ^ -[NSString hash](self->_radioName, "hash");
  v33 = -[NSString hash](self->_siteName, "hash");
  v34 = v33 ^ -[NSString hash](self->_softwareGenre, "hash");
  v35 = v34 ^ -[NSString hash](self->_softwareName, "hash");
  v36 = v35 ^ -[NSString hash](self->_softwarePlatform, "hash");
  v37 = v36 ^ -[NSString hash](self->_songAlbum, "hash");
  v38 = v37 ^ -[NSString hash](self->_songArtist, "hash");
  v39 = v38 ^ -[NSString hash](self->_songTitle, "hash");
  v40 = v39 ^ -[NSString hash](self->_summary, "hash");
  v41 = v32 ^ v40 ^ -[NSString hash](self->_title, "hash");
  v42 = -[NSString hash](self->_tvEpisodeEpisodeName, "hash");
  v43 = v42 ^ -[NSString hash](self->_tvEpisodeGenre, "hash");
  v44 = v43 ^ -[NSString hash](self->_tvEpisodeSeasonName, "hash");
  v45 = v44 ^ -[NSString hash](self->_tvSeasonGenre, "hash");
  v46 = v45 ^ -[NSString hash](self->_tvSeasonName, "hash");
  return v41 ^ v46 ^ -[NSString hash](self->_tvShowName, "hash");
}

- (id)dictionaryRepresentation
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __CFString *v39;
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
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_albumArtist)
  {
    -[_INPBMessageLinkMetadata albumArtist](self, "albumArtist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("albumArtist"));

  }
  if (self->_albumName)
  {
    -[_INPBMessageLinkMetadata albumName](self, "albumName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("albumName"));

  }
  if (self->_appleTvSubtitle)
  {
    -[_INPBMessageLinkMetadata appleTvSubtitle](self, "appleTvSubtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appleTvSubtitle"));

  }
  if (self->_appleTvTitle)
  {
    -[_INPBMessageLinkMetadata appleTvTitle](self, "appleTvTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appleTvTitle"));

  }
  if (self->_artistGenre)
  {
    -[_INPBMessageLinkMetadata artistGenre](self, "artistGenre");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("artistGenre"));

  }
  if (self->_artistName)
  {
    -[_INPBMessageLinkMetadata artistName](self, "artistName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("artistName"));

  }
  if (self->_audioBookAuthor)
  {
    -[_INPBMessageLinkMetadata audioBookAuthor](self, "audioBookAuthor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("audioBookAuthor"));

  }
  if (self->_audioBookName)
  {
    -[_INPBMessageLinkMetadata audioBookName](self, "audioBookName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("audioBookName"));

  }
  if (self->_audioBookNarrator)
  {
    -[_INPBMessageLinkMetadata audioBookNarrator](self, "audioBookNarrator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("audioBookNarrator"));

  }
  if (self->_bookAuthor)
  {
    -[_INPBMessageLinkMetadata bookAuthor](self, "bookAuthor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("bookAuthor"));

  }
  if (self->_bookName)
  {
    -[_INPBMessageLinkMetadata bookName](self, "bookName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("bookName"));

  }
  if (self->_creator)
  {
    -[_INPBMessageLinkMetadata creator](self, "creator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("creator"));

  }
  if (self->_iTunesStoreFrontIdentifier)
  {
    -[_INPBMessageLinkMetadata iTunesStoreFrontIdentifier](self, "iTunesStoreFrontIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("iTunesStoreFrontIdentifier"));

  }
  if (self->_iTunesStoreIdentifier)
  {
    -[_INPBMessageLinkMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("iTunesStoreIdentifier"));

  }
  if (self->_iconURLs)
  {
    -[_INPBMessageLinkMetadata iconURLs](self, "iconURLs");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("iconURL"));

  }
  if (self->_imageURLs)
  {
    -[_INPBMessageLinkMetadata imageURLs](self, "imageURLs");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("imageURL"));

  }
  if (self->_itemType)
  {
    -[_INPBMessageLinkMetadata itemType](self, "itemType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("itemType"));

  }
  if (-[_INPBMessageLinkMetadata hasLinkMediaType](self, "hasLinkMediaType"))
  {
    v38 = -[_INPBMessageLinkMetadata linkMediaType](self, "linkMediaType");
    if ((int)v38 > 99)
    {
      if ((int)v38 <= 139)
      {
        if ((int)v38 > 119)
        {
          if ((_DWORD)v38 == 120)
          {
            v39 = CFSTR("PODCAST_EPISODE");
            goto LABEL_80;
          }
          if ((_DWORD)v38 == 130)
          {
            v39 = CFSTR("TV_EPISODE");
            goto LABEL_80;
          }
        }
        else
        {
          if ((_DWORD)v38 == 100)
          {
            v39 = CFSTR("AUDIO_BOOK");
            goto LABEL_80;
          }
          if ((_DWORD)v38 == 110)
          {
            v39 = CFSTR("PODCAST");
            goto LABEL_80;
          }
        }
      }
      else if ((int)v38 <= 159)
      {
        if ((_DWORD)v38 == 140)
        {
          v39 = CFSTR("TV_SEASON");
          goto LABEL_80;
        }
        if ((_DWORD)v38 == 150)
        {
          v39 = CFSTR("MOVIE");
          goto LABEL_80;
        }
      }
      else
      {
        switch((_DWORD)v38)
        {
          case 0xA0:
            v39 = CFSTR("TV_SHOW");
            goto LABEL_80;
          case 0xAA:
            v39 = CFSTR("MOVIE_BUNDLE");
            goto LABEL_80;
          case 0xB4:
            v39 = CFSTR("APPLE_TV");
            goto LABEL_80;
        }
      }
    }
    else if ((int)v38 <= 49)
    {
      if ((int)v38 > 29)
      {
        if ((_DWORD)v38 == 30)
        {
          v39 = CFSTR("ALBUM");
          goto LABEL_80;
        }
        if ((_DWORD)v38 == 40)
        {
          v39 = CFSTR("MUSIC_VIDEO");
          goto LABEL_80;
        }
      }
      else
      {
        if ((_DWORD)v38 == 10)
        {
          v39 = CFSTR("UNKNOWN_LINK_TYPE");
          goto LABEL_80;
        }
        if ((_DWORD)v38 == 20)
        {
          v39 = CFSTR("SONG");
          goto LABEL_80;
        }
      }
    }
    else if ((int)v38 <= 69)
    {
      if ((_DWORD)v38 == 50)
      {
        v39 = CFSTR("ARTIST");
        goto LABEL_80;
      }
      if ((_DWORD)v38 == 60)
      {
        v39 = CFSTR("PLAYLIST");
        goto LABEL_80;
      }
    }
    else
    {
      switch((_DWORD)v38)
      {
        case 'F':
          v39 = CFSTR("RADIO");
          goto LABEL_80;
        case 'P':
          v39 = CFSTR("SOFTWARE");
          goto LABEL_80;
        case 'Z':
          v39 = CFSTR("BOOK");
LABEL_80:
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("linkMediaType"));

          goto LABEL_81;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v38);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_80;
  }
LABEL_81:
  -[_INPBMessageLinkMetadata linkURL](self, "linkURL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dictionaryRepresentation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("linkURL"));

  if (self->_movieBundleGenre)
  {
    -[_INPBMessageLinkMetadata movieBundleGenre](self, "movieBundleGenre");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("movieBundleGenre"));

  }
  if (self->_movieBundleName)
  {
    -[_INPBMessageLinkMetadata movieBundleName](self, "movieBundleName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("movieBundleName"));

  }
  if (self->_movieGenre)
  {
    -[_INPBMessageLinkMetadata movieGenre](self, "movieGenre");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("movieGenre"));

  }
  if (self->_movieName)
  {
    -[_INPBMessageLinkMetadata movieName](self, "movieName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("movieName"));

  }
  if (self->_musicVideoArtist)
  {
    -[_INPBMessageLinkMetadata musicVideoArtist](self, "musicVideoArtist");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("musicVideoArtist"));

  }
  if (self->_musicVideoName)
  {
    -[_INPBMessageLinkMetadata musicVideoName](self, "musicVideoName");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("musicVideoName"));

  }
  if (self->_openGraphType)
  {
    -[_INPBMessageLinkMetadata openGraphType](self, "openGraphType");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("openGraphType"));

  }
  if (self->_originalURL)
  {
    -[_INPBMessageLinkMetadata originalURL](self, "originalURL");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v56, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("originalURL"));

  }
  if (self->_playlistCurator)
  {
    -[_INPBMessageLinkMetadata playlistCurator](self, "playlistCurator");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v58, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("playlistCurator"));

  }
  if (self->_playlistName)
  {
    -[_INPBMessageLinkMetadata playlistName](self, "playlistName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v60, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("playlistName"));

  }
  if (self->_podcastArtist)
  {
    -[_INPBMessageLinkMetadata podcastArtist](self, "podcastArtist");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v62, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("podcastArtist"));

  }
  if (self->_podcastEpisodeArtist)
  {
    -[_INPBMessageLinkMetadata podcastEpisodeArtist](self, "podcastEpisodeArtist");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v64, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("podcastEpisodeArtist"));

  }
  if (self->_podcastEpisodeName)
  {
    -[_INPBMessageLinkMetadata podcastEpisodeName](self, "podcastEpisodeName");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v66, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("podcastEpisodeName"));

  }
  if (self->_podcastEpisodePodcastName)
  {
    -[_INPBMessageLinkMetadata podcastEpisodePodcastName](self, "podcastEpisodePodcastName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v68, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("podcastEpisodePodcastName"));

  }
  -[_INPBMessageLinkMetadata podcastEpisodeReleaseDate](self, "podcastEpisodeReleaseDate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "dictionaryRepresentation");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("podcastEpisodeReleaseDate"));

  if (self->_podcastName)
  {
    -[_INPBMessageLinkMetadata podcastName](self, "podcastName");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(v72, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("podcastName"));

  }
  if (self->_radioCurator)
  {
    -[_INPBMessageLinkMetadata radioCurator](self, "radioCurator");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v74, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("radioCurator"));

  }
  if (self->_radioName)
  {
    -[_INPBMessageLinkMetadata radioName](self, "radioName");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)objc_msgSend(v76, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("radioName"));

  }
  if (self->_siteName)
  {
    -[_INPBMessageLinkMetadata siteName](self, "siteName");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend(v78, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("siteName"));

  }
  if (self->_softwareGenre)
  {
    -[_INPBMessageLinkMetadata softwareGenre](self, "softwareGenre");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)objc_msgSend(v80, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("softwareGenre"));

  }
  if (self->_softwareName)
  {
    -[_INPBMessageLinkMetadata softwareName](self, "softwareName");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)objc_msgSend(v82, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("softwareName"));

  }
  if (self->_softwarePlatform)
  {
    -[_INPBMessageLinkMetadata softwarePlatform](self, "softwarePlatform");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (void *)objc_msgSend(v84, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v85, CFSTR("softwarePlatform"));

  }
  if (self->_songAlbum)
  {
    -[_INPBMessageLinkMetadata songAlbum](self, "songAlbum");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = (void *)objc_msgSend(v86, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("songAlbum"));

  }
  if (self->_songArtist)
  {
    -[_INPBMessageLinkMetadata songArtist](self, "songArtist");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)objc_msgSend(v88, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("songArtist"));

  }
  if (self->_songTitle)
  {
    -[_INPBMessageLinkMetadata songTitle](self, "songTitle");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)objc_msgSend(v90, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v91, CFSTR("songTitle"));

  }
  if (self->_summary)
  {
    -[_INPBMessageLinkMetadata summary](self, "summary");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_msgSend(v92, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("summary"));

  }
  if (self->_title)
  {
    -[_INPBMessageLinkMetadata title](self, "title");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = (void *)objc_msgSend(v94, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("title"));

  }
  if (self->_tvEpisodeEpisodeName)
  {
    -[_INPBMessageLinkMetadata tvEpisodeEpisodeName](self, "tvEpisodeEpisodeName");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = (void *)objc_msgSend(v96, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("tvEpisodeEpisodeName"));

  }
  if (self->_tvEpisodeGenre)
  {
    -[_INPBMessageLinkMetadata tvEpisodeGenre](self, "tvEpisodeGenre");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (void *)objc_msgSend(v98, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("tvEpisodeGenre"));

  }
  if (self->_tvEpisodeSeasonName)
  {
    -[_INPBMessageLinkMetadata tvEpisodeSeasonName](self, "tvEpisodeSeasonName");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = (void *)objc_msgSend(v100, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("tvEpisodeSeasonName"));

  }
  if (self->_tvSeasonGenre)
  {
    -[_INPBMessageLinkMetadata tvSeasonGenre](self, "tvSeasonGenre");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = (void *)objc_msgSend(v102, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v103, CFSTR("tvSeasonGenre"));

  }
  if (self->_tvSeasonName)
  {
    -[_INPBMessageLinkMetadata tvSeasonName](self, "tvSeasonName");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = (void *)objc_msgSend(v104, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("tvSeasonName"));

  }
  if (self->_tvShowName)
  {
    -[_INPBMessageLinkMetadata tvShowName](self, "tvShowName");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)objc_msgSend(v106, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("tvShowName"));

  }
  v108 = v3;

  return v108;
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSString)appleTvSubtitle
{
  return self->_appleTvSubtitle;
}

- (NSString)appleTvTitle
{
  return self->_appleTvTitle;
}

- (NSString)artistGenre
{
  return self->_artistGenre;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)audioBookAuthor
{
  return self->_audioBookAuthor;
}

- (NSString)audioBookName
{
  return self->_audioBookName;
}

- (NSString)audioBookNarrator
{
  return self->_audioBookNarrator;
}

- (NSString)bookAuthor
{
  return self->_bookAuthor;
}

- (NSString)bookName
{
  return self->_bookName;
}

- (NSString)creator
{
  return self->_creator;
}

- (NSString)iTunesStoreFrontIdentifier
{
  return self->_iTunesStoreFrontIdentifier;
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (NSArray)iconURLs
{
  return self->_iconURLs;
}

- (NSArray)imageURLs
{
  return self->_imageURLs;
}

- (NSString)itemType
{
  return self->_itemType;
}

- (int)linkMediaType
{
  return self->_linkMediaType;
}

- (_INPBURLValue)linkURL
{
  return self->_linkURL;
}

- (NSString)movieBundleGenre
{
  return self->_movieBundleGenre;
}

- (NSString)movieBundleName
{
  return self->_movieBundleName;
}

- (NSString)movieGenre
{
  return self->_movieGenre;
}

- (NSString)movieName
{
  return self->_movieName;
}

- (NSString)musicVideoArtist
{
  return self->_musicVideoArtist;
}

- (NSString)musicVideoName
{
  return self->_musicVideoName;
}

- (NSString)openGraphType
{
  return self->_openGraphType;
}

- (NSString)originalURL
{
  return self->_originalURL;
}

- (NSString)playlistCurator
{
  return self->_playlistCurator;
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (NSString)podcastArtist
{
  return self->_podcastArtist;
}

- (NSString)podcastEpisodeArtist
{
  return self->_podcastEpisodeArtist;
}

- (NSString)podcastEpisodeName
{
  return self->_podcastEpisodeName;
}

- (NSString)podcastEpisodePodcastName
{
  return self->_podcastEpisodePodcastName;
}

- (_INPBDateTime)podcastEpisodeReleaseDate
{
  return self->_podcastEpisodeReleaseDate;
}

- (NSString)podcastName
{
  return self->_podcastName;
}

- (NSString)radioCurator
{
  return self->_radioCurator;
}

- (NSString)radioName
{
  return self->_radioName;
}

- (NSString)siteName
{
  return self->_siteName;
}

- (NSString)softwareGenre
{
  return self->_softwareGenre;
}

- (NSString)softwareName
{
  return self->_softwareName;
}

- (NSString)softwarePlatform
{
  return self->_softwarePlatform;
}

- (NSString)songAlbum
{
  return self->_songAlbum;
}

- (NSString)songArtist
{
  return self->_songArtist;
}

- (NSString)songTitle
{
  return self->_songTitle;
}

- (NSString)summary
{
  return self->_summary;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)tvEpisodeEpisodeName
{
  return self->_tvEpisodeEpisodeName;
}

- (NSString)tvEpisodeGenre
{
  return self->_tvEpisodeGenre;
}

- (NSString)tvEpisodeSeasonName
{
  return self->_tvEpisodeSeasonName;
}

- (NSString)tvSeasonGenre
{
  return self->_tvSeasonGenre;
}

- (NSString)tvSeasonName
{
  return self->_tvSeasonName;
}

- (NSString)tvShowName
{
  return self->_tvShowName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvShowName, 0);
  objc_storeStrong((id *)&self->_tvSeasonName, 0);
  objc_storeStrong((id *)&self->_tvSeasonGenre, 0);
  objc_storeStrong((id *)&self->_tvEpisodeSeasonName, 0);
  objc_storeStrong((id *)&self->_tvEpisodeGenre, 0);
  objc_storeStrong((id *)&self->_tvEpisodeEpisodeName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_songTitle, 0);
  objc_storeStrong((id *)&self->_songArtist, 0);
  objc_storeStrong((id *)&self->_songAlbum, 0);
  objc_storeStrong((id *)&self->_softwarePlatform, 0);
  objc_storeStrong((id *)&self->_softwareName, 0);
  objc_storeStrong((id *)&self->_softwareGenre, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
  objc_storeStrong((id *)&self->_radioName, 0);
  objc_storeStrong((id *)&self->_radioCurator, 0);
  objc_storeStrong((id *)&self->_podcastName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeReleaseDate, 0);
  objc_storeStrong((id *)&self->_podcastEpisodePodcastName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeArtist, 0);
  objc_storeStrong((id *)&self->_podcastArtist, 0);
  objc_storeStrong((id *)&self->_playlistName, 0);
  objc_storeStrong((id *)&self->_playlistCurator, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_openGraphType, 0);
  objc_storeStrong((id *)&self->_musicVideoName, 0);
  objc_storeStrong((id *)&self->_musicVideoArtist, 0);
  objc_storeStrong((id *)&self->_movieName, 0);
  objc_storeStrong((id *)&self->_movieGenre, 0);
  objc_storeStrong((id *)&self->_movieBundleName, 0);
  objc_storeStrong((id *)&self->_movieBundleGenre, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_imageURLs, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_bookName, 0);
  objc_storeStrong((id *)&self->_bookAuthor, 0);
  objc_storeStrong((id *)&self->_audioBookNarrator, 0);
  objc_storeStrong((id *)&self->_audioBookName, 0);
  objc_storeStrong((id *)&self->_audioBookAuthor, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artistGenre, 0);
  objc_storeStrong((id *)&self->_appleTvTitle, 0);
  objc_storeStrong((id *)&self->_appleTvSubtitle, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumArtist, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
