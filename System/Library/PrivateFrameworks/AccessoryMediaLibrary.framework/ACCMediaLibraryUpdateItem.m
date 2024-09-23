@implementation ACCMediaLibraryUpdateItem

- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5
{
  id v9;
  id v10;
  ACCMediaLibraryUpdateItem *v11;
  ACCMediaLibraryUpdateItem *v12;
  NSString *title;
  NSString *albumTitle;
  NSString *artist;
  NSString *albumArtist;
  NSString *genre;
  NSString *composer;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ACCMediaLibraryUpdateItem;
  v11 = -[ACCMediaLibraryUpdateItem init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_revision, a5);
    v12->_persistentID = a4;
    v12->_validMask = 1;
    title = v12->_title;
    v12->_title = 0;

    *(_QWORD *)&v12->_type = 0x500000004;
    v12->_duration = 0;
    albumTitle = v12->_albumTitle;
    v12->_albumPersistentID = 0;
    v12->_albumTitle = 0;

    artist = v12->_artist;
    v12->_artistPersistentID = 0;
    v12->_artist = 0;
    *(_QWORD *)&v12->_albumTrackNumber = 0;

    albumArtist = v12->_albumArtist;
    v12->_albumArtistPersistentID = 0;
    v12->_albumArtist = 0;

    genre = v12->_genre;
    v12->_genrePersistentID = 0;
    v12->_genre = 0;

    composer = v12->_composer;
    v12->_composerPersistentID = 0;
    v12->_composer = 0;

    *(_WORD *)&v12->_partOfCompilation = 0;
    v12->_chapterCount = 0;
  }

  return v12;
}

- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 dict:(id)a4
{
  id v7;
  id v8;
  ACCMediaLibraryUpdateItem *v9;
  ACCMediaLibraryUpdateItem *v10;
  NSString *revision;
  NSString *title;
  NSString *albumTitle;
  NSString *artist;
  NSString *albumArtist;
  NSString *genre;
  NSString *composer;
  void *v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSString *v36;
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
  uint64_t v48;
  NSString *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSString *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSString *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_super v72;

  v7 = a3;
  v8 = a4;
  v72.receiver = self;
  v72.super_class = (Class)ACCMediaLibraryUpdateItem;
  v9 = -[ACCMediaLibraryUpdateItem init](&v72, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibraryUID, a3);
    revision = v10->_revision;
    v10->_revision = (NSString *)&stru_24DCCE030;

    v10->_persistentID = 0;
    title = v10->_title;
    v10->_title = 0;

    *(_QWORD *)&v10->_type = 0x500000004;
    v10->_duration = 0;
    albumTitle = v10->_albumTitle;
    v10->_albumPersistentID = 0;
    v10->_albumTitle = 0;

    artist = v10->_artist;
    v10->_artistPersistentID = 0;
    v10->_artist = 0;
    *(_QWORD *)&v10->_albumTrackNumber = 0;

    albumArtist = v10->_albumArtist;
    v10->_albumArtistPersistentID = 0;
    v10->_albumArtist = 0;

    genre = v10->_genre;
    v10->_genrePersistentID = 0;
    v10->_genre = 0;

    composer = v10->_composer;
    v10->_composerPersistentID = 0;
    v10->_composer = 0;

    *(_WORD *)&v10->_partOfCompilation = 0;
    v10->_chapterCount = 0;
    v10->_validMask = 0;
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateRevisionKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateRevisionKey"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v10->_revision;
      v10->_revision = (NSString *)v19;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemPersistentID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemPersistentID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_persistentID = objc_msgSend(v22, "unsignedLongLongValue");

      v10->_validMask |= 1uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemTitle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemTitle"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v10->_title;
      v10->_title = (NSString *)v24;

      v10->_validMask |= 2uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemType"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_type = objc_msgSend(v27, "unsignedCharValue");

      v10->_validMask |= 4uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemRating"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemRating"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_rating = objc_msgSend(v29, "unsignedCharValue");

      v10->_validMask |= 8uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemPlaybackDurationInMilliseconds"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemPlaybackDurationInMilliseconds"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_duration = objc_msgSend(v31, "unsignedLongValue");

      v10->_validMask |= 0x10uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumPersistentID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumPersistentID"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_albumPersistentID = objc_msgSend(v33, "unsignedLongLongValue");

      v10->_validMask |= 0x20uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumTitle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumTitle"));
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v10->_albumTitle;
      v10->_albumTitle = (NSString *)v35;

      v10->_validMask |= 0x40uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumTrackNumber"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumTrackNumber"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_albumTrackNumber = objc_msgSend(v38, "unsignedShortValue");

      v10->_validMask |= 0x80uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumTrackCount"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumTrackCount"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_albumTrackCount = objc_msgSend(v40, "unsignedShortValue");

      v10->_validMask |= 0x100uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumDiscNumber"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumDiscNumber"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_albumDiscNumber = objc_msgSend(v42, "unsignedShortValue");

      v10->_validMask |= 0x200uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumDiscCount"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumDiscCount"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_albumDiscCount = objc_msgSend(v44, "unsignedShortValue");

      v10->_validMask |= 0x400uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemArtistPersistentID"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemArtistPersistentID"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_artistPersistentID = objc_msgSend(v46, "unsignedLongLongValue");

      v10->_validMask |= 0x800uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemArtist"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemArtist"));
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = v10->_artist;
      v10->_artist = (NSString *)v48;

      v10->_validMask |= 0x1000uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumArtistPersistentID"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumArtistPersistentID"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_albumArtistPersistentID = objc_msgSend(v51, "unsignedLongLongValue");

      v10->_validMask |= 0x2000uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumArtist"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemAlbumArtist"));
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = v10->_albumArtist;
      v10->_albumArtist = (NSString *)v53;

      v10->_validMask |= 0x4000uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemGenrePersistentID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemGenrePersistentID"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_genrePersistentID = objc_msgSend(v56, "unsignedLongLongValue");

      v10->_validMask |= 0x8000uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemGenre"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemGenre"));
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = v10->_genre;
      v10->_genre = (NSString *)v58;

      v10->_validMask |= 0x10000uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemComposerPersistentID"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemComposerPersistentID"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_composerPersistentID = objc_msgSend(v61, "unsignedLongLongValue");

      v10->_validMask |= 0x20000uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemComposer"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemComposer"));
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = v10->_composer;
      v10->_composer = (NSString *)v63;

      v10->_validMask |= 0x40000uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemIsPartOfCompilation"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemIsPartOfCompilation"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_partOfCompilation = objc_msgSend(v66, "unsignedCharValue") != 0;

      v10->_validMask |= 0x80000uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemIsLocal"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemIsLocal"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_local = objc_msgSend(v68, "unsignedCharValue") != 0;

      v10->_validMask |= 0x2000000uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemChapterCount"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateItemChapterCount"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_chapterCount = objc_msgSend(v70, "unsignedShortValue");

      v10->_validMask |= 0x8000000uLL;
    }
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCMediaLibraryUpdateItem>[%@:%llu valid=%llxh '%@' mediaType=%d local=%d]"), self->_mediaLibraryUID, self->_persistentID, self->_validMask, self->_title, self->_type, self->_local);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCMediaLibraryUpdateItem description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACCMediaLibraryUpdateItem copyDict](self, "copyDict");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n    %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyDict
{
  id v3;
  unint64_t validMask;
  uint64_t *p_validMask;
  void *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
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
  id v25;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  p_validMask = (uint64_t *)&self->_validMask;
  validMask = self->_validMask;
  if ((validMask & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_persistentID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ACCMediaLibraryUpdateItemPersistentID"));

    validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_3:
      if ((validMask & 4) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((validMask & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", self->_title, CFSTR("ACCMediaLibraryUpdateItemTitle"));
  validMask = self->_validMask;
  if ((validMask & 4) == 0)
  {
LABEL_4:
    if ((validMask & 8) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", LOBYTE(self->_type));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ACCMediaLibraryUpdateItemType"));

  validMask = self->_validMask;
  if ((validMask & 8) == 0)
  {
LABEL_5:
    if ((validMask & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", LOBYTE(self->_rating));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ACCMediaLibraryUpdateItemRating"));

  validMask = self->_validMask;
  if ((validMask & 0x10) == 0)
  {
LABEL_6:
    if ((validMask & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_duration);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ACCMediaLibraryUpdateItemPlaybackDurationInMilliseconds"));

  validMask = self->_validMask;
  if ((validMask & 0x20) == 0)
  {
LABEL_7:
    if ((validMask & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_albumPersistentID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ACCMediaLibraryUpdateItemAlbumPersistentID"));

  validMask = self->_validMask;
  if ((validMask & 0x40) == 0)
  {
LABEL_8:
    if ((validMask & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", self->_albumTitle, CFSTR("ACCMediaLibraryUpdateItemAlbumTitle"));
  validMask = self->_validMask;
  if ((validMask & 0x80) == 0)
  {
LABEL_9:
    if ((validMask & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_albumTrackNumber);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ACCMediaLibraryUpdateItemAlbumTrackNumber"));

  validMask = self->_validMask;
  if ((validMask & 0x100) == 0)
  {
LABEL_10:
    if ((validMask & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_albumTrackCount);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("ACCMediaLibraryUpdateItemAlbumTrackCount"));

  validMask = self->_validMask;
  if ((validMask & 0x200) == 0)
  {
LABEL_11:
    if ((validMask & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_albumDiscNumber);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("ACCMediaLibraryUpdateItemAlbumDiscNumber"));

  validMask = self->_validMask;
  if ((validMask & 0x400) == 0)
  {
LABEL_12:
    if ((validMask & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_albumDiscCount);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("ACCMediaLibraryUpdateItemAlbumDiscCount"));

  validMask = self->_validMask;
  if ((validMask & 0x800) == 0)
  {
LABEL_13:
    if ((validMask & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_artistPersistentID);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("ACCMediaLibraryUpdateItemArtistPersistentID"));

  validMask = self->_validMask;
  if ((validMask & 0x1000) == 0)
  {
LABEL_14:
    if ((validMask & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", self->_artist, CFSTR("ACCMediaLibraryUpdateItemArtist"));
  validMask = self->_validMask;
  if ((validMask & 0x2000) == 0)
  {
LABEL_15:
    if ((validMask & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_albumArtistPersistentID);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ACCMediaLibraryUpdateItemAlbumArtistPersistentID"));

  validMask = self->_validMask;
  if ((validMask & 0x4000) == 0)
  {
LABEL_16:
    if ((validMask & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", self->_albumArtist, CFSTR("ACCMediaLibraryUpdateItemAlbumArtist"));
  validMask = self->_validMask;
  if ((validMask & 0x8000) == 0)
  {
LABEL_17:
    if ((validMask & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_genrePersistentID);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("ACCMediaLibraryUpdateItemGenrePersistentID"));

  validMask = self->_validMask;
  if ((validMask & 0x10000) == 0)
  {
LABEL_18:
    if ((validMask & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", self->_genre, CFSTR("ACCMediaLibraryUpdateItemGenre"));
  validMask = self->_validMask;
  if ((validMask & 0x20000) == 0)
  {
LABEL_19:
    if ((validMask & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_composerPersistentID);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("ACCMediaLibraryUpdateItemComposerPersistentID"));

  validMask = self->_validMask;
  if ((validMask & 0x40000) == 0)
  {
LABEL_20:
    if ((validMask & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", self->_composer, CFSTR("ACCMediaLibraryUpdateItemComposer"));
  validMask = self->_validMask;
  if ((validMask & 0x80000) == 0)
  {
LABEL_21:
    if ((validMask & 0x2000000) == 0)
      goto LABEL_22;
LABEL_47:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_local);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("ACCMediaLibraryUpdateItemIsLocal"));

    if ((self->_validMask & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_partOfCompilation);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("ACCMediaLibraryUpdateItemIsPartOfCompilation"));

  validMask = self->_validMask;
  if ((validMask & 0x2000000) != 0)
    goto LABEL_47;
LABEL_22:
  if ((validMask & 0x8000000) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_chapterCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ACCMediaLibraryUpdateItemChapterCount"));

  }
LABEL_24:
  v7 = gLogObjects;
  v8 = gNumLogObjects;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryUpdateItem copyDict].cold.2(v7, v8);
    v9 = MEMORY[0x24BDACB70];
    v25 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ACCMediaLibraryUpdateItem copyDict].cold.1(p_validMask, (uint64_t)v3, v9);

  return v3;
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

  *(_OWORD *)&a3->var17 = 0u;
  *(_OWORD *)&a3->var19 = 0u;
  *(_OWORD *)&a3->var13 = 0u;
  *(_OWORD *)&a3->var15 = 0u;
  *(_OWORD *)&a3->var6 = 0u;
  *(_OWORD *)&a3->var8 = 0u;
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
      if ((validMask & 4) == 0)
        goto LABEL_4;
      goto LABEL_29;
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
  if ((validMask & 4) == 0)
  {
LABEL_4:
    if ((validMask & 8) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  a3->var3 = self->_type;
  a3->var0 |= 4u;
  if ((validMask & 8) == 0)
  {
LABEL_5:
    if ((validMask & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  a3->var4 = self->_rating;
  a3->var0 |= 8u;
  if ((validMask & 0x10) == 0)
  {
LABEL_6:
    if ((validMask & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  a3->var5 = self->_duration;
  a3->var0 |= 0x10u;
  if ((validMask & 0x20) == 0)
  {
LABEL_7:
    if ((validMask & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  a3->var6 = self->_albumPersistentID;
  a3->var0 |= 0x20u;
  validMask = self->_validMask;
  if ((validMask & 0x40) == 0)
  {
LABEL_8:
    if ((validMask & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_33:
  albumTitle = self->_albumTitle;
  if (albumTitle)
  {
    albumTitle = -[NSString UTF8String](albumTitle, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var7 = (char *)albumTitle;
  a3->var0 |= 0x40u;
  if ((validMask & 0x80) == 0)
  {
LABEL_9:
    if ((validMask & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  a3->var8 = self->_albumTrackNumber;
  a3->var0 |= 0x80u;
  if ((validMask & 0x100) == 0)
  {
LABEL_10:
    if ((validMask & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  a3->var9 = self->_albumTrackCount;
  a3->var0 |= 0x100u;
  if ((validMask & 0x200) == 0)
  {
LABEL_11:
    if ((validMask & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  a3->var10 = self->_albumDiscNumber;
  a3->var0 |= 0x200u;
  if ((validMask & 0x400) == 0)
  {
LABEL_12:
    if ((validMask & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_39:
  a3->var11 = self->_albumDiscCount;
  a3->var0 |= 0x400u;
  if ((validMask & 0x800) == 0)
  {
LABEL_13:
    if ((validMask & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_41;
  }
LABEL_40:
  a3->var12 = self->_artistPersistentID;
  a3->var0 |= 0x800u;
  validMask = self->_validMask;
  if ((validMask & 0x1000) == 0)
  {
LABEL_14:
    if ((validMask & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_41:
  artist = self->_artist;
  if (artist)
  {
    artist = -[NSString UTF8String](artist, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var13 = (char *)artist;
  a3->var0 |= 0x1000u;
  if ((validMask & 0x2000) == 0)
  {
LABEL_15:
    if ((validMask & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  a3->var14 = self->_albumArtistPersistentID;
  a3->var0 |= 0x2000u;
  validMask = self->_validMask;
  if ((validMask & 0x4000) == 0)
  {
LABEL_16:
    if ((validMask & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_45:
  albumArtist = self->_albumArtist;
  if (albumArtist)
  {
    albumArtist = -[NSString UTF8String](albumArtist, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var15 = (char *)albumArtist;
  a3->var0 |= 0x4000u;
  if ((validMask & 0x8000) == 0)
  {
LABEL_17:
    if ((validMask & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  a3->var16 = self->_genrePersistentID;
  a3->var0 |= 0x8000u;
  validMask = self->_validMask;
  if ((validMask & 0x10000) == 0)
  {
LABEL_18:
    if ((validMask & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_49:
  genre = self->_genre;
  if (genre)
  {
    genre = -[NSString UTF8String](genre, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var17 = (char *)genre;
  a3->var0 |= 0x10000u;
  if ((validMask & 0x20000) == 0)
  {
LABEL_19:
    if ((validMask & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  a3->var18 = self->_composerPersistentID;
  a3->var0 |= 0x20000u;
  validMask = self->_validMask;
  if ((validMask & 0x40000) == 0)
  {
LABEL_20:
    if ((validMask & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_53:
  composer = self->_composer;
  if (composer)
  {
    composer = -[NSString UTF8String](composer, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var19 = (char *)composer;
  a3->var0 |= 0x40000u;
  if ((validMask & 0x80000) == 0)
  {
LABEL_21:
    if ((validMask & 0x2000000) == 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  a3->var20 = self->_partOfCompilation;
  a3->var0 |= 0x80000u;
  if ((validMask & 0x2000000) == 0)
  {
LABEL_22:
    if ((validMask & 0x8000000) == 0)
      return;
    goto LABEL_23;
  }
LABEL_57:
  a3->var21 = self->_local;
  a3->var0 |= 0x2000000u;
  if ((validMask & 0x8000000) == 0)
    return;
LABEL_23:
  a3->var22 = self->_chapterCount;
  a3->var0 |= 0x8000000u;
}

- (void)setMediaLibraryUID:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryUID, a3);
}

- (void)setRevision:(id)a3
{
  objc_storeStrong((id *)&self->_revision, a3);
}

- (void)setPersistentID:(unint64_t)a3
{
  unint64_t v3;

  v3 = self->_validMask | 1;
  self->_persistentID = a3;
  self->_validMask = v3;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  self->_validMask |= 2uLL;
}

- (void)setType:(int)a3
{
  self->_type = a3;
  self->_validMask |= 4uLL;
}

- (void)setRating:(int)a3
{
  self->_rating = a3;
  self->_validMask |= 8uLL;
}

- (void)setDuration:(unsigned int)a3
{
  self->_duration = a3;
  self->_validMask |= 0x10uLL;
}

- (void)setAlbumPersistentID:(unint64_t)a3
{
  self->_albumPersistentID = a3;
  self->_validMask |= 0x20uLL;
}

- (void)setAlbumTitle:(id)a3
{
  objc_storeStrong((id *)&self->_albumTitle, a3);
  self->_validMask |= 0x40uLL;
}

- (void)setAlbumTrackNumber:(unsigned __int16)a3
{
  self->_albumTrackNumber = a3;
  self->_validMask |= 0x80uLL;
}

- (void)setAlbumTrackCount:(unsigned __int16)a3
{
  self->_albumTrackCount = a3;
  self->_validMask |= 0x100uLL;
}

- (void)setAlbumDiscNumber:(unsigned __int16)a3
{
  self->_albumDiscNumber = a3;
  self->_validMask |= 0x200uLL;
}

- (void)setAlbumDiscCount:(unsigned __int16)a3
{
  self->_albumDiscCount = a3;
  self->_validMask |= 0x400uLL;
}

- (void)setArtistPersistentID:(unint64_t)a3
{
  self->_artistPersistentID = a3;
  self->_validMask |= 0x800uLL;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
  self->_validMask |= 0x1000uLL;
}

- (void)setAlbumArtistPersistentID:(unint64_t)a3
{
  self->_albumArtistPersistentID = a3;
  self->_validMask |= 0x2000uLL;
}

- (void)setAlbumArtist:(id)a3
{
  objc_storeStrong((id *)&self->_albumArtist, a3);
  self->_validMask |= 0x4000uLL;
}

- (void)setGenrePersistentID:(unint64_t)a3
{
  self->_genrePersistentID = a3;
  self->_validMask |= 0x8000uLL;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
  self->_validMask |= 0x10000uLL;
}

- (void)setComposerPersistentID:(unint64_t)a3
{
  self->_composerPersistentID = a3;
  self->_validMask |= 0x20000uLL;
}

- (void)setComposer:(id)a3
{
  objc_storeStrong((id *)&self->_composer, a3);
  self->_validMask |= 0x40000uLL;
}

- (void)setPartOfCompilation:(BOOL)a3
{
  self->_partOfCompilation = a3;
  self->_validMask |= 0x80000uLL;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
  self->_validMask |= 0x2000000uLL;
}

- (void)setChapterCount:(unsigned __int16)a3
{
  self->_chapterCount = a3;
  self->_validMask |= 0x8000000uLL;
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (NSString)title
{
  return self->_title;
}

- (int)type
{
  return self->_type;
}

- (int)rating
{
  return self->_rating;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unint64_t)albumPersistentID
{
  return self->_albumPersistentID;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (unsigned)albumTrackNumber
{
  return self->_albumTrackNumber;
}

- (unsigned)albumTrackCount
{
  return self->_albumTrackCount;
}

- (unsigned)albumDiscNumber
{
  return self->_albumDiscNumber;
}

- (unsigned)albumDiscCount
{
  return self->_albumDiscCount;
}

- (unint64_t)artistPersistentID
{
  return self->_artistPersistentID;
}

- (NSString)artist
{
  return self->_artist;
}

- (unint64_t)albumArtistPersistentID
{
  return self->_albumArtistPersistentID;
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (unint64_t)genrePersistentID
{
  return self->_genrePersistentID;
}

- (NSString)genre
{
  return self->_genre;
}

- (unint64_t)composerPersistentID
{
  return self->_composerPersistentID;
}

- (NSString)composer
{
  return self->_composer;
}

- (BOOL)partOfCompilation
{
  return self->_partOfCompilation;
}

- (BOOL)local
{
  return self->_local;
}

- (unsigned)chapterCount
{
  return self->_chapterCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_albumArtist, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

- (void)copyDict
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218240;
  v3 = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_21A4E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", (uint8_t *)&v2, 0x12u);
}

@end
