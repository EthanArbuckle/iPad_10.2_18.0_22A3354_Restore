@implementation ACCMediaLibraryUpdatePlaylistContentItem

- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 playlistPersistentID:(unint64_t)a5
{
  id v9;
  ACCMediaLibraryUpdatePlaylistContentItem *v10;
  ACCMediaLibraryUpdatePlaylistContentItem *v11;
  NSString *title;
  NSString *albumTitle;
  NSString *artist;
  NSString *albumArtist;
  NSString *genre;
  NSString *composer;
  objc_super v19;

  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ACCMediaLibraryUpdatePlaylistContentItem;
  v10 = -[ACCMediaLibraryUpdatePlaylistContentItem init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaLibraryUID, a3);
    v11->_playlistPersistentID = a5;
    v11->_validMask = 1;
    title = v11->_title;
    v11->_persistentID = a4;
    v11->_title = 0;

    albumTitle = v11->_albumTitle;
    v11->_albumTitle = 0;

    artist = v11->_artist;
    v11->_artist = 0;

    albumArtist = v11->_albumArtist;
    v11->_albumArtist = 0;

    genre = v11->_genre;
    v11->_genre = 0;

    composer = v11->_composer;
    v11->_composer = 0;

  }
  return v11;
}

- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 playlistPersistentID:(unint64_t)a4 dict:(id)a5
{
  id v9;
  id v10;
  ACCMediaLibraryUpdatePlaylistContentItem *v11;
  ACCMediaLibraryUpdatePlaylistContentItem *v12;
  NSString *title;
  NSString *albumTitle;
  NSString *artist;
  NSString *albumArtist;
  NSString *genre;
  NSString *composer;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  uint64_t v31;
  NSString *v32;
  void *v33;
  uint64_t v34;
  NSString *v35;
  void *v36;
  uint64_t v37;
  NSString *v38;
  objc_super v40;

  v9 = a3;
  v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)ACCMediaLibraryUpdatePlaylistContentItem;
  v11 = -[ACCMediaLibraryUpdatePlaylistContentItem init](&v40, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    v12->_playlistPersistentID = a4;
    title = v12->_title;
    v12->_persistentID = 0;
    v12->_title = 0;

    albumTitle = v12->_albumTitle;
    v12->_albumTitle = 0;

    artist = v12->_artist;
    v12->_artist = 0;

    albumArtist = v12->_albumArtist;
    v12->_albumArtist = 0;

    genre = v12->_genre;
    v12->_genre = 0;

    composer = v12->_composer;
    v12->_composer = 0;

    v12->_validMask = 0;
    objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemPersistentID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemPersistentID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_persistentID = objc_msgSend(v20, "unsignedLongLongValue");

      v12->_validMask |= 1uLL;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemTitle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemTitle"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v12->_title;
      v12->_title = (NSString *)v22;

      v12->_validMask |= 2uLL;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemAlbumTitle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemAlbumTitle"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v12->_albumTitle;
      v12->_albumTitle = (NSString *)v25;

      v12->_validMask |= 0x40uLL;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemArtist"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemArtist"));
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v12->_artist;
      v12->_artist = (NSString *)v28;

      v12->_validMask |= 0x1000uLL;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemAlbumArtist"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemAlbumArtist"));
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v12->_albumArtist;
      v12->_albumArtist = (NSString *)v31;

      v12->_validMask |= 0x4000uLL;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemGenre"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemGenre"));
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v12->_genre;
      v12->_genre = (NSString *)v34;

      v12->_validMask |= 0x10000uLL;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemComposer"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("ACCMediaLibraryPlaylistItemComposer"));
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v12->_composer;
      v12->_composer = (NSString *)v37;

      v12->_validMask |= 0x40000uLL;
    }
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCMediaLibraryUpdatePlaylistContentItem>[%@:%llu itemPersistentID=%llu '%@' validMask=%llxh]"), self->_mediaLibraryUID, self->_playlistPersistentID, self->_persistentID, self->_title, self->_validMask);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCMediaLibraryUpdatePlaylistContentItem description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACCMediaLibraryUpdatePlaylistContentItem copyNSRepresentation:](self, "copyNSRepresentation:", 3);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n    %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyNSRepresentation:(int)a3
{
  id v4;
  unint64_t validMask;
  void *v7;

  if (a3 != 1)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    validMask = self->_validMask;
    if ((validMask & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_persistentID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("ACCMediaLibraryPlaylistItemPersistentID"));

      validMask = self->_validMask;
      if ((validMask & 2) == 0)
      {
LABEL_5:
        if ((validMask & 0x40) == 0)
          goto LABEL_6;
        goto LABEL_14;
      }
    }
    else if ((validMask & 2) == 0)
    {
      goto LABEL_5;
    }
    objc_msgSend(v4, "setObject:forKey:", self->_title, CFSTR("ACCMediaLibraryPlaylistItemTitle"));
    validMask = self->_validMask;
    if ((validMask & 0x40) == 0)
    {
LABEL_6:
      if ((validMask & 0x1000) == 0)
        goto LABEL_7;
      goto LABEL_15;
    }
LABEL_14:
    objc_msgSend(v4, "setObject:forKey:", self->_albumTitle, CFSTR("ACCMediaLibraryPlaylistItemAlbumTitle"));
    validMask = self->_validMask;
    if ((validMask & 0x1000) == 0)
    {
LABEL_7:
      if ((validMask & 0x4000) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
LABEL_15:
    objc_msgSend(v4, "setObject:forKey:", self->_artist, CFSTR("ACCMediaLibraryPlaylistItemArtist"));
    validMask = self->_validMask;
    if ((validMask & 0x4000) == 0)
    {
LABEL_8:
      if ((validMask & 0x10000) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
LABEL_16:
    objc_msgSend(v4, "setObject:forKey:", self->_albumArtist, CFSTR("ACCMediaLibraryPlaylistItemAlbumArtist"));
    validMask = self->_validMask;
    if ((validMask & 0x10000) == 0)
    {
LABEL_9:
      if ((validMask & 0x40000) == 0)
        return v4;
LABEL_10:
      objc_msgSend(v4, "setObject:forKey:", self->_composer, CFSTR("ACCMediaLibraryPlaylistItemComposer"));
      return v4;
    }
LABEL_17:
    objc_msgSend(v4, "setObject:forKey:", self->_genre, CFSTR("ACCMediaLibraryPlaylistItemGenre"));
    if ((self->_validMask & 0x40000) == 0)
      return v4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_persistentID);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fillStruct:(id *)a3
{
  unint64_t validMask;
  NSString *title;
  NSString *albumTitle;
  NSString *artist;
  NSString *albumArtist;
  NSString *genre;
  NSString *composer;

  *(_OWORD *)&a3->var4 = 0u;
  *(_OWORD *)&a3->var6 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  validMask = self->_validMask;
  if ((validMask & 1) != 0)
  {
    a3->var1 = self->_persistentID;
    a3->var0 |= 1u;
    validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_3:
      if ((validMask & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((validMask & 2) == 0)
  {
    goto LABEL_3;
  }
  title = self->_title;
  if (title)
  {
    title = -[NSString UTF8String](title, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var2 = (char *)title;
  a3->var0 |= 2u;
  if ((validMask & 0x40) == 0)
  {
LABEL_4:
    if ((validMask & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_13:
  albumTitle = self->_albumTitle;
  if (albumTitle)
  {
    albumTitle = -[NSString UTF8String](albumTitle, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var3 = (char *)albumTitle;
  a3->var0 |= 0x40u;
  if ((validMask & 0x1000) == 0)
  {
LABEL_5:
    if ((validMask & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_16:
  artist = self->_artist;
  if (artist)
  {
    artist = -[NSString UTF8String](artist, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var4 = (char *)artist;
  a3->var0 |= 0x1000u;
  if ((validMask & 0x4000) == 0)
  {
LABEL_6:
    if ((validMask & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_19:
  albumArtist = self->_albumArtist;
  if (albumArtist)
  {
    albumArtist = -[NSString UTF8String](albumArtist, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var5 = (char *)albumArtist;
  a3->var0 |= 0x4000u;
  if ((validMask & 0x10000) == 0)
  {
LABEL_7:
    if ((validMask & 0x40000) == 0)
      return;
    goto LABEL_25;
  }
LABEL_22:
  genre = self->_genre;
  if (genre)
  {
    genre = -[NSString UTF8String](genre, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var6 = (char *)genre;
  a3->var0 |= 0x10000u;
  if ((validMask & 0x40000) != 0)
  {
LABEL_25:
    composer = self->_composer;
    if (composer)
      composer = -[NSString UTF8String](composer, "UTF8String");
    a3->var7 = (char *)composer;
    a3->var0 |= 0x40000u;
  }
}

- (void)setMediaLibraryUID:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryUID, a3);
}

- (void)setPlaylistPersistentID:(unint64_t)a3
{
  self->_playlistPersistentID = a3;
}

- (void)setPersistentID:(unint64_t)a3
{
  self->_validMask |= 1uLL;
  self->_persistentID = a3;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  self->_validMask |= 1uLL;
}

- (void)setAlbumTitle:(id)a3
{
  objc_storeStrong((id *)&self->_albumTitle, a3);
  self->_validMask |= 0x40uLL;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
  self->_validMask |= 0x1000uLL;
}

- (void)setAlbumArtist:(id)a3
{
  objc_storeStrong((id *)&self->_albumArtist, a3);
  self->_validMask |= 0x4000uLL;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
  self->_validMask |= 0x10000uLL;
}

- (void)setComposer:(id)a3
{
  objc_storeStrong((id *)&self->_composer, a3);
  self->_validMask |= 0x40000uLL;
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (unint64_t)playlistPersistentID
{
  return self->_playlistPersistentID;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)composer
{
  return self->_composer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_albumArtist, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

@end
