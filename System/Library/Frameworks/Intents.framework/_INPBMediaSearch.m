@implementation _INPBMediaSearch

- (void)setAlbumName:(id)a3
{
  objc_storeStrong((id *)&self->_albumName, a3);
}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (void)setArtistName:(id)a3
{
  objc_storeStrong((id *)&self->_artistName, a3);
}

- (BOOL)hasArtistName
{
  return self->_artistName != 0;
}

- (void)setGenreNames:(id)a3
{
  NSArray *v4;
  NSArray *genreNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  genreNames = self->_genreNames;
  self->_genreNames = v4;

}

- (void)clearGenreNames
{
  -[NSArray removeAllObjects](self->_genreNames, "removeAllObjects");
}

- (void)addGenreNames:(id)a3
{
  id v4;
  NSArray *genreNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  genreNames = self->_genreNames;
  v8 = v4;
  if (!genreNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_genreNames;
    self->_genreNames = v6;

    v4 = v8;
    genreNames = self->_genreNames;
  }
  -[NSArray addObject:](genreNames, "addObject:", v4);

}

- (unint64_t)genreNamesCount
{
  return -[NSArray count](self->_genreNames, "count");
}

- (id)genreNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_genreNames, "objectAtIndexedSubscript:", a3);
}

- (void)setMediaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaIdentifier, a3);
}

- (BOOL)hasMediaIdentifier
{
  return self->_mediaIdentifier != 0;
}

- (void)setMediaName:(id)a3
{
  objc_storeStrong((id *)&self->_mediaName, a3);
}

- (BOOL)hasMediaName
{
  return self->_mediaName != 0;
}

- (void)setMediaType:(int)a3
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
    self->_mediaType = a3;
  }
}

- (BOOL)hasMediaType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMediaType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 < 0x15)
    return off_1E22930D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMediaType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SONG")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALBUM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTIST")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENRE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLAYLIST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST_SHOW")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST_EPISODE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST_PLAYLIST")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC_STATION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_BOOK")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOVIE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV_SHOW")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV_SHOW_EPISODE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC_VIDEO")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PODCAST_STATION")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RADIO_STATION")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATION")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGORITHMIC_RADIO_STATION")) & 1) != 0)
  {
    v4 = 19;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS")))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMoodNames:(id)a3
{
  NSArray *v4;
  NSArray *moodNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  moodNames = self->_moodNames;
  self->_moodNames = v4;

}

- (void)clearMoodNames
{
  -[NSArray removeAllObjects](self->_moodNames, "removeAllObjects");
}

- (void)addMoodNames:(id)a3
{
  id v4;
  NSArray *moodNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  moodNames = self->_moodNames;
  v8 = v4;
  if (!moodNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_moodNames;
    self->_moodNames = v6;

    v4 = v8;
    moodNames = self->_moodNames;
  }
  -[NSArray addObject:](moodNames, "addObject:", v4);

}

- (unint64_t)moodNamesCount
{
  return -[NSArray count](self->_moodNames, "count");
}

- (id)moodNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_moodNames, "objectAtIndexedSubscript:", a3);
}

- (void)setReference:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_reference = a3;
  }
}

- (BOOL)hasReference
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasReference:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)referenceAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2293180[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReference:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_REFERENCE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENTLY_PLAYING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDate, a3);
}

- (BOOL)hasReleaseDate
{
  return self->_releaseDate != 0;
}

- (void)setSortOrder:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_sortOrder = a3;
  }
}

- (BOOL)hasSortOrder
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSortOrder:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)sortOrderAsString:(int)a3
{
  if (a3 < 9)
    return off_1E2293198[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSortOrder:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SORT_ORDER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWEST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OLDEST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BEST")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WORST")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POPULAR")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNPOPULAR")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDED")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMediaSearchReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBMediaSearch albumName](self, "albumName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBMediaSearch albumName](self, "albumName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMediaSearch artistName](self, "artistName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBMediaSearch artistName](self, "artistName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_genreNames;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  -[_INPBMediaSearch mediaIdentifier](self, "mediaIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBMediaSearch mediaIdentifier](self, "mediaIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMediaSearch mediaName](self, "mediaName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBMediaSearch mediaName](self, "mediaName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBMediaSearch hasMediaType](self, "hasMediaType"))
    PBDataWriterWriteInt32Field();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_moodNames;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  if (-[_INPBMediaSearch hasReference](self, "hasReference", v25))
    PBDataWriterWriteInt32Field();
  -[_INPBMediaSearch releaseDate](self, "releaseDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[_INPBMediaSearch releaseDate](self, "releaseDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBMediaSearch hasSortOrder](self, "hasSortOrder"))
    PBDataWriterWriteInt32Field();

}

- (_INPBMediaSearch)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBMediaSearch *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBMediaSearch *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBMediaSearch *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBMediaSearch initWithData:](self, "initWithData:", v6);

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
  -[_INPBMediaSearch data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBMediaSearch *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v5 = -[_INPBMediaSearch init](+[_INPBMediaSearch allocWithZone:](_INPBMediaSearch, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_albumName, "copyWithZone:", a3);
  -[_INPBMediaSearch setAlbumName:](v5, "setAlbumName:", v6);

  v7 = -[_INPBString copyWithZone:](self->_artistName, "copyWithZone:", a3);
  -[_INPBMediaSearch setArtistName:](v5, "setArtistName:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_genreNames, "copyWithZone:", a3);
  -[_INPBMediaSearch setGenreNames:](v5, "setGenreNames:", v8);

  v9 = -[_INPBString copyWithZone:](self->_mediaIdentifier, "copyWithZone:", a3);
  -[_INPBMediaSearch setMediaIdentifier:](v5, "setMediaIdentifier:", v9);

  v10 = -[_INPBString copyWithZone:](self->_mediaName, "copyWithZone:", a3);
  -[_INPBMediaSearch setMediaName:](v5, "setMediaName:", v10);

  if (-[_INPBMediaSearch hasMediaType](self, "hasMediaType"))
    -[_INPBMediaSearch setMediaType:](v5, "setMediaType:", -[_INPBMediaSearch mediaType](self, "mediaType"));
  v11 = (void *)-[NSArray copyWithZone:](self->_moodNames, "copyWithZone:", a3);
  -[_INPBMediaSearch setMoodNames:](v5, "setMoodNames:", v11);

  if (-[_INPBMediaSearch hasReference](self, "hasReference"))
    -[_INPBMediaSearch setReference:](v5, "setReference:", -[_INPBMediaSearch reference](self, "reference"));
  v12 = -[_INPBDateTimeRange copyWithZone:](self->_releaseDate, "copyWithZone:", a3);
  -[_INPBMediaSearch setReleaseDate:](v5, "setReleaseDate:", v12);

  if (-[_INPBMediaSearch hasSortOrder](self, "hasSortOrder"))
    -[_INPBMediaSearch setSortOrder:](v5, "setSortOrder:", -[_INPBMediaSearch sortOrder](self, "sortOrder"));
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
  int v32;
  int mediaType;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  int reference;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  BOOL v46;
  int v48;
  int sortOrder;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  -[_INPBMediaSearch albumName](self, "albumName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBMediaSearch albumName](self, "albumName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBMediaSearch albumName](self, "albumName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_45;
  }
  else
  {

  }
  -[_INPBMediaSearch artistName](self, "artistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBMediaSearch artistName](self, "artistName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBMediaSearch artistName](self, "artistName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artistName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_45;
  }
  else
  {

  }
  -[_INPBMediaSearch genreNames](self, "genreNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "genreNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBMediaSearch genreNames](self, "genreNames");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBMediaSearch genreNames](self, "genreNames");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "genreNames");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_45;
  }
  else
  {

  }
  -[_INPBMediaSearch mediaIdentifier](self, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBMediaSearch mediaIdentifier](self, "mediaIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBMediaSearch mediaIdentifier](self, "mediaIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_45;
  }
  else
  {

  }
  -[_INPBMediaSearch mediaName](self, "mediaName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBMediaSearch mediaName](self, "mediaName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBMediaSearch mediaName](self, "mediaName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_45;
  }
  else
  {

  }
  v32 = -[_INPBMediaSearch hasMediaType](self, "hasMediaType");
  if (v32 != objc_msgSend(v4, "hasMediaType"))
    goto LABEL_45;
  if (-[_INPBMediaSearch hasMediaType](self, "hasMediaType"))
  {
    if (objc_msgSend(v4, "hasMediaType"))
    {
      mediaType = self->_mediaType;
      if (mediaType != objc_msgSend(v4, "mediaType"))
        goto LABEL_45;
    }
  }
  -[_INPBMediaSearch moodNames](self, "moodNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moodNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBMediaSearch moodNames](self, "moodNames");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_INPBMediaSearch moodNames](self, "moodNames");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moodNames");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_45;
  }
  else
  {

  }
  v39 = -[_INPBMediaSearch hasReference](self, "hasReference");
  if (v39 != objc_msgSend(v4, "hasReference"))
    goto LABEL_45;
  if (-[_INPBMediaSearch hasReference](self, "hasReference"))
  {
    if (objc_msgSend(v4, "hasReference"))
    {
      reference = self->_reference;
      if (reference != objc_msgSend(v4, "reference"))
        goto LABEL_45;
    }
  }
  -[_INPBMediaSearch releaseDate](self, "releaseDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "releaseDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_44:

    goto LABEL_45;
  }
  -[_INPBMediaSearch releaseDate](self, "releaseDate");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_INPBMediaSearch releaseDate](self, "releaseDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "releaseDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_45;
  }
  else
  {

  }
  v48 = -[_INPBMediaSearch hasSortOrder](self, "hasSortOrder");
  if (v48 == objc_msgSend(v4, "hasSortOrder"))
  {
    if (!-[_INPBMediaSearch hasSortOrder](self, "hasSortOrder")
      || !objc_msgSend(v4, "hasSortOrder")
      || (sortOrder = self->_sortOrder, sortOrder == objc_msgSend(v4, "sortOrder")))
    {
      v46 = 1;
      goto LABEL_46;
    }
  }
LABEL_45:
  v46 = 0;
LABEL_46:

  return v46;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;

  v13 = -[_INPBString hash](self->_albumName, "hash");
  v3 = -[_INPBString hash](self->_artistName, "hash");
  v4 = -[NSArray hash](self->_genreNames, "hash");
  v5 = -[_INPBString hash](self->_mediaIdentifier, "hash");
  v6 = -[_INPBString hash](self->_mediaName, "hash");
  if (-[_INPBMediaSearch hasMediaType](self, "hasMediaType"))
    v7 = 2654435761 * self->_mediaType;
  else
    v7 = 0;
  v8 = -[NSArray hash](self->_moodNames, "hash");
  if (-[_INPBMediaSearch hasReference](self, "hasReference"))
    v9 = 2654435761 * self->_reference;
  else
    v9 = 0;
  v10 = -[_INPBDateTimeRange hash](self->_releaseDate, "hash");
  if (-[_INPBMediaSearch hasSortOrder](self, "hasSortOrder"))
    v11 = 2654435761 * self->_sortOrder;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBMediaSearch albumName](self, "albumName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("albumName"));

  -[_INPBMediaSearch artistName](self, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("artistName"));

  if (-[NSArray count](self->_genreNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = self->_genreNames;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v13), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("genreNames"));
  }
  -[_INPBMediaSearch mediaIdentifier](self, "mediaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mediaIdentifier"));

  -[_INPBMediaSearch mediaName](self, "mediaName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("mediaName"));

  if (-[_INPBMediaSearch hasMediaType](self, "hasMediaType"))
  {
    v19 = -[_INPBMediaSearch mediaType](self, "mediaType");
    if (v19 >= 0x15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E22930D8[v19];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("mediaType"));

  }
  if (-[NSArray count](self->_moodNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v22 = self->_moodNames;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v36;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v26), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("moodNames"));
  }
  if (-[_INPBMediaSearch hasReference](self, "hasReference"))
  {
    v28 = -[_INPBMediaSearch reference](self, "reference");
    if (v28 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v28);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E2293180[v28];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("reference"));

  }
  -[_INPBMediaSearch releaseDate](self, "releaseDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictionaryRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("releaseDate"));

  if (-[_INPBMediaSearch hasSortOrder](self, "hasSortOrder"))
  {
    v32 = -[_INPBMediaSearch sortOrder](self, "sortOrder");
    if (v32 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_1E2293198[v32];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("sortOrder"));

  }
  return v3;
}

- (_INPBString)albumName
{
  return self->_albumName;
}

- (_INPBString)artistName
{
  return self->_artistName;
}

- (NSArray)genreNames
{
  return self->_genreNames;
}

- (_INPBString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (_INPBString)mediaName
{
  return self->_mediaName;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (NSArray)moodNames
{
  return self->_moodNames;
}

- (int)reference
{
  return self->_reference;
}

- (_INPBDateTimeRange)releaseDate
{
  return self->_releaseDate;
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_moodNames, 0);
  objc_storeStrong((id *)&self->_mediaName, 0);
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_genreNames, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
}

+ (Class)genreNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)moodNamesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
