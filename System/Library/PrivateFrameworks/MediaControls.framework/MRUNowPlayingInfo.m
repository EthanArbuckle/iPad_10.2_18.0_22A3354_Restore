@implementation MRUNowPlayingInfo

- (MRUNowPlayingInfo)initWithMPCResponse:(id)a3 placeholder:(id)a4
{
  id v5;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  MRUNowPlayingInfo *v47;
  id v48;
  void *v49;

  v5 = a3;
  v48 = a4;
  objc_msgSend(v5, "tracklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playingItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "metadataObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "song");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tracklist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadataObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "type") == 13)
  {
    objc_msgSend(v13, "radioStation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "metadataObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "universalStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v18, "adamID"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "vendorID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length") && objc_msgSend(v9, "isExplicitSong"))
  {
    objc_msgSend(v7, "explicitBadge");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
    {
      +[MRUStringsProvider explicitBadge](MRUStringsProvider, "explicitBadge");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" %@"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    if (!v21)
    v20 = (void *)v23;
  }
  if (objc_msgSend(v9, "shouldShowComposer")
    && (objc_msgSend(v9, "composer"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v24, "name"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        v25))
  {
    objc_msgSend(v9, "composer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRUStringsProvider composedBy:](MRUStringsProvider, "composedBy:", v27);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = 0;
  }
  v49 = v13;
  v42 = v5;
  v43 = v20;
  v28 = objc_msgSend(v5, "state") == 2 || objc_msgSend(v5, "state") == 5;
  v29 = (v7 == 0) & ~v28;
  objc_msgSend(v7, "contentItemIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "artist");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "album");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "title");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributionLabel");
  v41 = v7;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributionLabel");
  v40 = v14;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v36) = v28;
  LOBYTE(v36) = v29;
  v47 = -[MRUNowPlayingInfo initWithIdentifier:title:artist:album:radio:composer:attribution:placeholder:showPlaceholder:isPlaying:adamID:internationalStandardRecordingCode:](self, "initWithIdentifier:title:artist:album:radio:composer:attribution:placeholder:showPlaceholder:isPlaying:adamID:internationalStandardRecordingCode:", v38, v43, v30, v32, v33, v37, v34, v48, v36, v45, v44);

  return v47;
}

- (MRUNowPlayingInfo)initWithMRResponse:(id)a3 placeholder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  MRUNowPlayingInfo *v29;
  MRUNowPlayingInfo *v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "playbackQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "iTunesStoreIdentifier"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "internationalStandardRecordingCode");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length") && objc_msgSend(v11, "isExplicitItem"))
  {
    +[MRUStringsProvider explicitBadge](MRUStringsProvider, "explicitBadge");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(" %@"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  v29 = self;
  v31 = v7;
  v27 = (void *)v13;
  v28 = (void *)v12;
  v17 = objc_msgSend(v6, "playbackState") == 1 || objc_msgSend(v6, "playbackState") == 5;
  if (v11)
    v18 = 0;
  else
    v18 = !v17;
  objc_msgSend(v10, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackArtistName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "albumName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "radioStationName");
  v26 = v10;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v25) = v17;
  LOBYTE(v25) = v18;
  v30 = -[MRUNowPlayingInfo initWithIdentifier:title:artist:album:radio:composer:attribution:placeholder:showPlaceholder:isPlaying:adamID:internationalStandardRecordingCode:](v29, "initWithIdentifier:title:artist:album:radio:composer:attribution:placeholder:showPlaceholder:isPlaying:adamID:internationalStandardRecordingCode:", v19, v14, v20, v21, v22, v23, 0, v31, v25, v28, v27);

  return v30;
}

- (MRUNowPlayingInfo)initWithIdentifier:(id)a3 title:(id)a4 artist:(id)a5 album:(id)a6 radio:(id)a7 composer:(id)a8 attribution:(id)a9 placeholder:(id)a10 showPlaceholder:(BOOL)a11 isPlaying:(BOOL)a12 adamID:(id)a13 internationalStandardRecordingCode:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  MRUNowPlayingInfo *v28;
  uint64_t v29;
  NSString *identifier;
  uint64_t v31;
  NSString *title;
  uint64_t v33;
  NSString *artist;
  uint64_t v35;
  NSString *album;
  uint64_t v37;
  NSString *radio;
  uint64_t v39;
  NSString *composer;
  uint64_t v41;
  NSString *attribution;
  uint64_t v43;
  NSString *placeholder;
  id v47;
  objc_super v48;

  v19 = a3;
  v20 = a4;
  v47 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a13;
  v27 = a14;
  v48.receiver = self;
  v48.super_class = (Class)MRUNowPlayingInfo;
  v28 = -[MRUNowPlayingInfo init](&v48, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v19, "copy");
    identifier = v28->_identifier;
    v28->_identifier = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    title = v28->_title;
    v28->_title = (NSString *)v31;

    v33 = objc_msgSend(v47, "copy");
    artist = v28->_artist;
    v28->_artist = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    album = v28->_album;
    v28->_album = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    radio = v28->_radio;
    v28->_radio = (NSString *)v37;

    v39 = objc_msgSend(v23, "copy");
    composer = v28->_composer;
    v28->_composer = (NSString *)v39;

    v41 = objc_msgSend(v24, "copy");
    attribution = v28->_attribution;
    v28->_attribution = (NSString *)v41;

    v43 = objc_msgSend(v25, "copy");
    placeholder = v28->_placeholder;
    v28->_placeholder = (NSString *)v43;

    v28->_showPlaceholder = a11;
    v28->_isPlaying = a12;
    objc_storeStrong((id *)&v28->_adamID, a13);
    objc_storeStrong((id *)&v28->_internationalStandardRecordingCode, a14);
  }

  return v28;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("Yes");
  if (self->_showPlaceholder)
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  if (!self->_isPlaying)
    v5 = CFSTR("No");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ title: %@ | artist: %@ | album: %@ | radio: %@ | composer: %@ | placeholder: %@ - %@ | playing: %@ | adamID: %@ | ISRC: %@"), v4, *(_OWORD *)&self->_title, *(_OWORD *)&self->_album, self->_composer, self->_placeholder, v6, v5, self->_adamID, self->_internationalStandardRecordingCode);
}

- (BOOL)isEqual:(id)a3
{
  MRUNowPlayingInfo *v4;
  MRUNowPlayingInfo *v5;
  NSString *v6;
  NSString *v7;
  char v8;
  char v9;
  NSString *v10;
  NSString *v11;
  char v12;
  char v13;
  NSString *v14;
  NSString *v15;
  char v16;
  char v17;
  NSString *v18;
  NSString *v19;
  char v20;
  char v21;
  NSString *v22;
  NSString *v23;
  char v24;
  char v25;
  NSString *v26;
  NSString *v27;
  char v28;
  char v29;
  NSString *v30;
  NSString *v31;
  char v32;
  char v33;
  NSString *v34;
  NSString *v35;
  char v36;
  char v37;
  char v38;
  char v39;
  NSString *v40;
  NSString *v41;
  char v42;
  char v43;
  NSNumber *v44;
  NSNumber *v45;
  char v46;

  v4 = (MRUNowPlayingInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRUNowPlayingInfo identifier](v5, "identifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 == self->_identifier)
        v8 = 1;
      else
        v8 = -[NSString isEqual:](v6, "isEqual:");

      -[MRUNowPlayingInfo title](v5, "title");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 == self->_title)
        v12 = 1;
      else
        v12 = -[NSString isEqual:](v10, "isEqual:");
      v13 = v8 & v12;

      -[MRUNowPlayingInfo artist](v5, "artist");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 == self->_artist)
        v16 = 1;
      else
        v16 = -[NSString isEqual:](v14, "isEqual:");
      v17 = v13 & v16;

      -[MRUNowPlayingInfo album](v5, "album");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 == self->_album)
        v20 = 1;
      else
        v20 = -[NSString isEqual:](v18, "isEqual:");
      v21 = v17 & v20;

      -[MRUNowPlayingInfo radio](v5, "radio");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22 == self->_radio)
        v24 = 1;
      else
        v24 = -[NSString isEqual:](v22, "isEqual:");
      v25 = v21 & v24;

      -[MRUNowPlayingInfo composer](v5, "composer");
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26 == self->_composer)
        v28 = 1;
      else
        v28 = -[NSString isEqual:](v26, "isEqual:");
      v29 = v25 & v28;

      -[MRUNowPlayingInfo attribution](v5, "attribution");
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30 == self->_attribution)
        v32 = 1;
      else
        v32 = -[NSString isEqual:](v30, "isEqual:");
      v33 = v29 & v32;

      -[MRUNowPlayingInfo placeholder](v5, "placeholder");
      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34 == self->_placeholder)
        v36 = 1;
      else
        v36 = -[NSString isEqual:](v34, "isEqual:");
      v37 = v33 & v36;

      if (self->_showPlaceholder == -[MRUNowPlayingInfo showPlaceholder](v5, "showPlaceholder"))
        v38 = v37;
      else
        v38 = 0;
      if (self->_isPlaying == -[MRUNowPlayingInfo isPlaying](v5, "isPlaying"))
        v39 = v38;
      else
        v39 = 0;
      -[MRUNowPlayingInfo internationalStandardRecordingCode](v5, "internationalStandardRecordingCode");
      v40 = (NSString *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v40 == self->_internationalStandardRecordingCode)
        v42 = 1;
      else
        v42 = -[NSString isEqual:](v40, "isEqual:");
      v43 = v39 & v42;

      -[MRUNowPlayingInfo adamID](v5, "adamID");
      v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44 == self->_adamID)
        v46 = 1;
      else
        v46 = -[NSNumber isEqual:](v44, "isEqual:");
      v9 = v43 & v46;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)stringForComponents:(unint64_t)a3
{
  return -[MRUNowPlayingInfo stringForComponents:separator:](self, "stringForComponents:separator:", a3, CFSTR(" — "));
}

- (id)stringForComponents:(unint64_t)a3 separator:(id)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0 && -[NSString length](self->_title, "length"))
    objc_msgSend(v7, "addObject:", self->_title);
  if ((v4 & 2) != 0 && -[NSString length](self->_artist, "length"))
    objc_msgSend(v7, "addObject:", self->_artist);
  if ((v4 & 4) != 0 && -[NSString length](self->_album, "length"))
    objc_msgSend(v7, "addObject:", self->_album);
  if ((v4 & 8) != 0 && -[NSString length](self->_radio, "length"))
    objc_msgSend(v7, "addObject:", self->_radio);
  if ((v4 & 0x10) != 0 && -[NSString length](self->_composer, "length"))
    objc_msgSend(v7, "addObject:", self->_composer);
  if ((v4 & 0x20) != 0 && -[NSString length](self->_attribution, "length"))
    objc_msgSend(v7, "addObject:", self->_attribution);
  if ((v4 & 0x40) != 0)
    objc_msgSend(v7, "firstObject");
  else
    objc_msgSend(v7, "componentsJoinedByString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (NSString)internationalStandardRecordingCode
{
  return self->_internationalStandardRecordingCode;
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (NSString)radio
{
  return self->_radio;
}

- (void)setRadio:(id)a3
{
  objc_storeStrong((id *)&self->_radio, a3);
}

- (NSString)composer
{
  return self->_composer;
}

- (void)setComposer:(id)a3
{
  objc_storeStrong((id *)&self->_composer, a3);
}

- (NSString)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_attribution, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_radio, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_internationalStandardRecordingCode, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
