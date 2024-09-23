@implementation MusicKit_SoftLinking_MPMusicPlayerItem

+ (id)playerItemForMediaItem:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMediaItem:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_initWithMediaItem:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPMusicPlayerItem *v5;
  MusicKit_SoftLinking_MPMusicPlayerItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerItem;
  v5 = -[MusicKit_SoftLinking_MPMusicPlayerItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MusicKit_SoftLinking_MPMusicPlayerItem _initializeBasicPropertiesWithMediaItem:](v5, "_initializeBasicPropertiesWithMediaItem:", v4);
    -[MusicKit_SoftLinking_MPMusicPlayerItem _initializeArtworkCatalogWithMediaItem:](v6, "_initializeArtworkCatalogWithMediaItem:", v4);
    -[MusicKit_SoftLinking_MPMusicPlayerItem _initializeAdditionalAttributesWithMediaItem:](v6, "_initializeAdditionalAttributesWithMediaItem:", v4);
  }

  return v6;
}

- (void)_initializeBasicPropertiesWithMediaItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *identifier;
  void *v11;
  NSString *v12;
  NSString *title;
  void *v14;
  NSString *v15;
  NSString *subtitle;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v5 = objc_opt_class();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v6 = (void *)get_MPMusicPlayerMediaItemProxyClass_softClass;
  v21 = get_MPMusicPlayerMediaItemProxyClass_softClass;
  if (!get_MPMusicPlayerMediaItemProxyClass_softClass)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __get_MPMusicPlayerMediaItemProxyClass_block_invoke;
    v17[3] = &unk_24CD1CC68;
    v17[4] = &v18;
    __get_MPMusicPlayerMediaItemProxyClass_block_invoke((uint64_t)v17);
    v6 = (void *)v19[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v18, 8);
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "itemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (NSString *)objc_msgSend(v8, "copy");
  identifier = self->_identifier;
  self->_identifier = v9;

  objc_msgSend(v4, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSString *)objc_msgSend(v11, "copy");
  title = self->_title;
  self->_title = v12;

  objc_msgSend(v4, "artist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSString *)objc_msgSend(v14, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v15;

}

- (void)_initializeArtworkCatalogWithMediaItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t v26;
  Class (*v27)(uint64_t);
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  objc_msgSend(v4, "artworkCatalog");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v5 = (void *)getMPModelObjectMediaItemClass_softClass;
  v33 = getMPModelObjectMediaItemClass_softClass;
  if (!getMPModelObjectMediaItemClass_softClass)
  {
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __getMPModelObjectMediaItemClass_block_invoke;
    v28 = &unk_24CD1CC68;
    v29 = &v30;
    __getMPModelObjectMediaItemClass_block_invoke((uint64_t)&v25);
    v5 = (void *)v31[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v30, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v4;
    objc_msgSend(v7, "modelObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v30 = 0;
      v31 = &v30;
      v32 = 0x2050000000;
      v9 = (void *)getMPModelObjectClass_softClass_0;
      v33 = getMPModelObjectClass_softClass_0;
      v10 = MEMORY[0x24BDAC760];
      if (!getMPModelObjectClass_softClass_0)
      {
        v25 = MEMORY[0x24BDAC760];
        v26 = 3221225472;
        v27 = __getMPModelObjectClass_block_invoke_0;
        v28 = &unk_24CD1CC68;
        v29 = &v30;
        __getMPModelObjectClass_block_invoke_0((uint64_t)&v25);
        v9 = (void *)v31[3];
      }
      v11 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v30, 8);
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __81__MusicKit_SoftLinking_MPMusicPlayerItem__initializeArtworkCatalogWithMediaItem___block_invoke;
      v16[3] = &unk_24CD1D370;
      v18 = &v19;
      v17 = v8;
      objc_msgSend(v11, "performWithoutEnforcement:", v16);

    }
    if (!v20[5])
    {
      objc_msgSend(v7, "fallbackArtworkCatalogBlock");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
      {
        (*(void (**)(uint64_t))(v12 + 16))(v12);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v20[5];
        v20[5] = v14;

      }
    }

  }
  objc_storeStrong((id *)&self->_artworkCatalog, (id)v20[5]);
  _Block_object_dispose(&v19, 8);

}

- (void)_initializeAdditionalAttributesWithMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  MusicKit_SoftLinking_CatalogID *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSString *v19;
  NSString *underlyingItemLibraryID;
  void *v21;
  void *v22;
  id v23;
  NSString *v24;
  NSString *albumTitle;
  void *v26;
  void *v27;
  id v28;
  NSString *v29;
  NSString *artistName;
  void *v31;
  void *v32;
  void *v33;
  NSString *v34;
  NSString *genreIdentifier;
  void *v36;
  void *v37;
  id v38;
  NSString *v39;
  NSString *genreName;
  void *v41;
  void *v42;
  id v43;
  NSNumber *v44;
  NSNumber *duration;
  void *v46;
  void *v47;
  id v48;
  id v49;
  NSNumber *v50;
  NSNumber *trackNumber;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  NSNumber *v56;
  NSNumber *discNumber;
  void *v58;
  void *v59;
  id v60;
  NSDate *v61;
  NSDate *releaseDate;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  NSNumber *v72;
  NSNumber *has4K;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  NSNumber *v78;
  NSNumber *hasHDR;
  uint64_t *v80;
  id *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  NSDictionary *v90;
  NSDictionary *playParametersDictionary;
  _Unwind_Exception *v92;
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
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  MusicKit_SoftLinking_CatalogID *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;

  v4 = a3;
  if (_initializeAdditionalAttributesWithMediaItem__sMediaItemPropertiesOnceToken != -1)
    dispatch_once(&_initializeAdditionalAttributesWithMediaItem__sMediaItemPropertiesOnceToken, &__block_literal_global_4);
  objc_msgSend(v4, "valuesForProperties:", _initializeAdditionalAttributesWithMediaItem__sMediaItemProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMediaItemPropertyStoreID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v111 = v4;
  if (_NSIsNSNumber())
  {
    v8 = objc_msgSend(v7, "unsignedLongLongValue");
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[MusicKit_SoftLinking_CatalogID initWithValue:kind:]([MusicKit_SoftLinking_CatalogID alloc], "initWithValue:kind:", v9, 0);

      if (v10)
        goto LABEL_9;
    }
  }
  getMPMediaItemPropertySubscriptionStoreItemID();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber() && (v13 = objc_msgSend(v12, "unsignedLongLongValue")) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MusicKit_SoftLinking_CatalogID initWithValue:kind:]([MusicKit_SoftLinking_CatalogID alloc], "initWithValue:kind:", v14, 6);

    if (v10)
    {
LABEL_9:
      v112 = 0;
      v15 = 0;
      goto LABEL_18;
    }
  }
  else
  {

  }
  getMPMediaItemPropertyStoreCloudUniversalLibraryID();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSString())
  {
    v18 = v17;
    if (objc_msgSend(v18, "length"))
      v15 = v18;
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  v10 = 0;
  v112 = 1;
LABEL_18:
  objc_storeStrong((id *)&self->_underlyingItemCatalogID, v10);
  v19 = (NSString *)objc_msgSend(v15, "copy");
  underlyingItemLibraryID = self->_underlyingItemLibraryID;
  self->_underlyingItemLibraryID = v19;

  getMPMediaItemPropertyAlbumTitle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v102 = v7;
  if (_NSIsNSString())
    v23 = v22;
  else
    v23 = 0;
  v109 = v23;
  v24 = (NSString *)objc_msgSend(v23, "copy");
  albumTitle = self->_albumTitle;
  self->_albumTitle = v24;

  getMPMediaItemPropertyArtist();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSString())
    v28 = v27;
  else
    v28 = 0;
  v107 = v28;
  v29 = (NSString *)objc_msgSend(v28, "copy");
  artistName = self->_artistName;
  self->_artistName = v29;

  getMPMediaItemPropertyStoreGenreID();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
  {
    v33 = (void *)objc_msgSend(v32, "unsignedLongLongValue");
    if (v33)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v33);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v33 = 0;
  }
  v105 = v33;
  v34 = (NSString *)objc_msgSend(v33, "copy");
  genreIdentifier = self->_genreIdentifier;
  self->_genreIdentifier = v34;

  getMPMediaItemPropertyGenre();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v104 = v37;
  if (_NSIsNSString())
    v38 = v37;
  else
    v38 = 0;
  v99 = v38;
  v39 = (NSString *)objc_msgSend(v38, "copy");
  genreName = self->_genreName;
  self->_genreName = v39;

  getMPMediaItemPropertyPlaybackDuration();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = v42;
  if (_NSIsNSNumber())
    v43 = v42;
  else
    v43 = 0;
  v97 = v43;
  v44 = (NSNumber *)objc_msgSend(v43, "copy");
  duration = self->_duration;
  self->_duration = v44;

  getMPMediaItemPropertyAlbumTrackNumber();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = v47;
  v48 = v15;
  if (_NSIsNSNumber())
    v49 = v47;
  else
    v49 = 0;
  v94 = v49;
  v50 = (NSNumber *)objc_msgSend(v49, "copy");
  trackNumber = self->_trackNumber;
  self->_trackNumber = v50;

  getMPMediaItemPropertyDiscNumber();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = v53;
  if (_NSIsNSNumber())
    v54 = v53;
  else
    v54 = 0;
  v55 = v48;
  v98 = v54;
  v56 = (NSNumber *)objc_msgSend(v54, "copy");
  discNumber = self->_discNumber;
  self->_discNumber = v56;

  getMPMediaItemPropertyReleaseDate();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSDate())
    v60 = v59;
  else
    v60 = 0;
  v96 = v60;
  v61 = (NSDate *)objc_msgSend(v60, "copy");
  releaseDate = self->_releaseDate;
  self->_releaseDate = v61;

  getMPMediaItemPropertyIsExplicit();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = _NSIsNSNumber();
  v95 = v64;
  if (v65)
    LOBYTE(v65) = objc_msgSend(v64, "BOOLValue");
  v113 = v55;
  self->_isExplicit = v65;
  getMPMediaItemPropertyIsMusicVideo();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = v27;
  v106 = v32;
  if (_NSIsNSNumber())
    v68 = objc_msgSend(v67, "BOOLValue");
  else
    v68 = 0;
  v114 = v10;
  self->_isMusicVideo = v68;
  getMPMediaItemPropertyVideoQuality();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = v22;
  if (_NSIsNSNumber())
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v70, "integerValue") == 3);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = 0;
  }
  v72 = (NSNumber *)objc_msgSend(v71, "copy");
  has4K = self->_has4K;
  self->_has4K = v72;

  getMPMediaItemPropertyColorCapability();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
  {
    v76 = objc_msgSend(v75, "integerValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v76 & 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v77 = 0;
  }
  v78 = (NSNumber *)objc_msgSend(v77, "copy");
  hasHDR = self->_hasHDR;
  self->_hasHDR = v78;

  v80 = &v115;
  if (!v68)
    goto LABEL_59;
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v81 = (id *)getMPStoreItemMetadataItemKindMusicVideoSymbolLoc_ptr;
  v118 = getMPStoreItemMetadataItemKindMusicVideoSymbolLoc_ptr;
  if (!getMPStoreItemMetadataItemKindMusicVideoSymbolLoc_ptr)
  {
    v82 = (void *)MediaPlayerLibrary_3();
    v81 = (id *)dlsym(v82, "MPStoreItemMetadataItemKindMusicVideo");
    v116[3] = (uint64_t)v81;
    getMPStoreItemMetadataItemKindMusicVideoSymbolLoc_ptr = (uint64_t)v81;
  }
  _Block_object_dispose(&v115, 8);
  if (!v81)
  {
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
LABEL_59:
    v115 = 0;
    v116 = v80;
    v117 = 0x2020000000;
    v81 = (id *)getMPStoreItemMetadataItemKindSongSymbolLoc_ptr;
    v118 = getMPStoreItemMetadataItemKindSongSymbolLoc_ptr;
    if (!getMPStoreItemMetadataItemKindSongSymbolLoc_ptr)
    {
      v83 = (void *)MediaPlayerLibrary_3();
      v81 = (id *)dlsym(v83, "MPStoreItemMetadataItemKindSong");
      v116[3] = (uint64_t)v81;
      getMPStoreItemMetadataItemKindSongSymbolLoc_ptr = (uint64_t)v81;
    }
    _Block_object_dispose(&v115, 8);
    if (!v81)
    {
      v92 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
      _Block_object_dispose(&v115, 8);
      _Unwind_Resume(v92);
    }
  }
  v93 = v5;
  v84 = v70;
  v85 = *v81;
  v86 = v67;
  if ((v112 & 1) != 0)
  {
    v87 = v113;
  }
  else
  {
    -[MusicKit_SoftLinking_CatalogID value](v114, "value");
    v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  v88 = v87;
  v89 = 0;
  if (v85)
  {
    if (v87)
    {
      v89 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v89, "setObject:forKey:", v85, CFSTR("kind"));
      objc_msgSend(v89, "setObject:forKey:", v88, CFSTR("id"));
      if (v112)
        objc_msgSend(v89, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("isLibrary"));
    }
  }
  v90 = (NSDictionary *)objc_msgSend(v89, "copy");
  playParametersDictionary = self->_playParametersDictionary;
  self->_playParametersDictionary = v90;

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSNumber *has4K;
  const __CFString *v8;
  NSNumber *hasHDR;
  const __CFString *v10;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (self->_identifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; identifier = \"%@\"), self->_identifier);
  if (self->_title)
    objc_msgSend(v6, "appendFormat:", CFSTR("; title = \"%@\"), self->_title);
  if (self->_subtitle)
    objc_msgSend(v6, "appendFormat:", CFSTR("; subtitle = \"%@\"), self->_subtitle);
  if (self->_artworkCatalog)
    objc_msgSend(v6, "appendFormat:", CFSTR("; artworkCatalog = %@"), self->_artworkCatalog);
  if (self->_underlyingItemCatalogID)
    objc_msgSend(v6, "appendFormat:", CFSTR("; underlyingItemCatalogID = %@"), self->_underlyingItemCatalogID);
  if (self->_underlyingItemLibraryID)
    objc_msgSend(v6, "appendFormat:", CFSTR("; underlyingItemLibraryID = \"%@\"), self->_underlyingItemLibraryID);
  if (self->_albumTitle)
    objc_msgSend(v6, "appendFormat:", CFSTR("; albumTitle = \"%@\"), self->_albumTitle);
  if (self->_artistName)
    objc_msgSend(v6, "appendFormat:", CFSTR("; artistName = \"%@\"), self->_artistName);
  if (self->_genreIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; genreIdentifier = \"%@\"), self->_genreIdentifier);
  if (self->_genreName)
    objc_msgSend(v6, "appendFormat:", CFSTR("; genreName = \"%@\"), self->_genreName);
  if (self->_duration)
    objc_msgSend(v6, "appendFormat:", CFSTR("; duration = \"%@\"), self->_duration);
  if (self->_trackNumber)
    objc_msgSend(v6, "appendFormat:", CFSTR("; trackNumber = %@"), self->_trackNumber);
  if (self->_discNumber)
    objc_msgSend(v6, "appendFormat:", CFSTR("; discNumber = %@"), self->_discNumber);
  if (self->_releaseDate)
    objc_msgSend(v6, "appendFormat:", CFSTR("; releaseDate = %@"), self->_releaseDate);
  if (self->_isExplicit)
    objc_msgSend(v6, "appendString:", CFSTR("; isExplicit = YES"));
  if (self->_isMusicVideo)
  {
    objc_msgSend(v6, "appendString:", CFSTR("; isMusicVideo = YES"));
    has4K = self->_has4K;
    if (has4K)
    {
      if (-[NSNumber BOOLValue](has4K, "BOOLValue"))
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      objc_msgSend(v6, "appendFormat:", CFSTR("; has4K = %@"), v8);
    }
    hasHDR = self->_hasHDR;
    if (hasHDR)
    {
      if (-[NSNumber BOOLValue](hasHDR, "BOOLValue"))
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      objc_msgSend(v6, "appendFormat:", CFSTR("; hasHDR = %@"), v10);
    }
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (MusicKit_SoftLinking_MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (MusicKit_SoftLinking_CatalogID)underlyingItemCatalogID
{
  return self->_underlyingItemCatalogID;
}

- (NSString)underlyingItemLibraryID
{
  return self->_underlyingItemLibraryID;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)genreIdentifier
{
  return self->_genreIdentifier;
}

- (NSString)genreName
{
  return self->_genreName;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSNumber)trackNumber
{
  return self->_trackNumber;
}

- (NSNumber)discNumber
{
  return self->_discNumber;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (BOOL)isMusicVideo
{
  return self->_isMusicVideo;
}

- (NSNumber)has4K
{
  return self->_has4K;
}

- (NSNumber)hasHDR
{
  return self->_hasHDR;
}

- (NSDictionary)playParametersDictionary
{
  return self->_playParametersDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playParametersDictionary, 0);
  objc_storeStrong((id *)&self->_hasHDR, 0);
  objc_storeStrong((id *)&self->_has4K, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_discNumber, 0);
  objc_storeStrong((id *)&self->_trackNumber, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_genreIdentifier, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_underlyingItemLibraryID, 0);
  objc_storeStrong((id *)&self->_underlyingItemCatalogID, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
