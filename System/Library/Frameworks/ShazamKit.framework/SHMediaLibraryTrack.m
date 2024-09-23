@implementation SHMediaLibraryTrack

- (SHMediaLibraryTrack)initWithIdentifier:(id)a3 builder:(id)a4
{
  id v6;
  SHMediaLibraryTrack *v7;

  v6 = a4;
  v7 = (SHMediaLibraryTrack *)-[SHMediaLibraryTrack _initWithIdentifier:metadata:labels:](self, "_initWithIdentifier:metadata:labels:", a3, 0, MEMORY[0x24BDBD1A8]);
  -[SHMediaLibraryTrack updateWithBuilderBlock:](v7, "updateWithBuilderBlock:", v6);

  return v7;
}

- (SHMediaLibraryTrack)initWithIdentifier:(id)a3 metadata:(id)a4 builder:(id)a5
{
  id v8;
  SHMediaLibraryTrack *v9;

  v8 = a5;
  v9 = (SHMediaLibraryTrack *)-[SHMediaLibraryTrack _initWithIdentifier:metadata:labels:](self, "_initWithIdentifier:metadata:labels:", a3, a4, MEMORY[0x24BDBD1A8]);
  -[SHMediaLibraryTrack updateWithBuilderBlock:](v9, "updateWithBuilderBlock:", v8);

  return v9;
}

- (SHMediaLibraryTrack)initWithMediaItem:(id)a3
{
  id v4;
  void *v5;
  SHShazamKey *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SHMediaLibraryTrack *v17;
  NSObject *v18;
  uint8_t v20[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "shazamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    sh_log_object();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218BF1000, v8, OS_LOG_TYPE_ERROR, "A media item must have a shazamID when creating a library track", buf, 2u);
    }
    goto LABEL_13;
  }
  v6 = [SHShazamKey alloc];
  objc_msgSend(v4, "shazamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SHShazamKey initWithKey:](v6, "initWithKey:", v7);

  if (!v8)
  {
    sh_log_object();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_218BF1000, v18, OS_LOG_TYPE_ERROR, "A media item must have a valid (numeric only) format when creating a library track", v20, 2u);
    }

LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self = (SHMediaLibraryTrack *)-[SHMediaLibraryTrack _initWithIdentifier:metadata:labels:](self, "_initWithIdentifier:metadata:labels:", v10, 0, MEMORY[0x24BDBD1A8]);

  -[SHMediaLibraryTrack setShazamKey:](self, "setShazamKey:", v8);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setRecognitionIdentifier:](self, "setRecognitionIdentifier:", v12);

  objc_msgSend(v4, "providerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setProviderIdentifier:](self, "setProviderIdentifier:", v13);

  objc_msgSend(v4, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHMediaLibraryTrack setCreationDate:](self, "setCreationDate:", v15);

  }
  -[SHMediaLibraryTrack updateWithMediaItem:](self, "updateWithMediaItem:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHMediaLibraryTrack setLastUpdatedDate:](self, "setLastUpdatedDate:", v16);

  }
  v17 = self;
LABEL_14:

  return v17;
}

- (SHMediaLibraryTrack)initWithManagedTrack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SHMediaLibraryItemMetadata *v7;
  void *v8;
  void *v9;
  SHMediaLibraryItemMetadata *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SHMediaLibraryLabel *v19;
  void *v20;
  void *v21;
  SHMediaLibraryTrack *v22;
  void *v23;
  SHShazamKey *v24;
  void *v25;
  SHShazamKey *v26;
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
  id v37;
  double v38;
  double v39;
  double v40;
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
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [SHMediaLibraryItemMetadata alloc];
    objc_msgSend(v4, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SHMediaLibraryItemMetadata initWithEncodedSystemData:](v7, "initWithEncodedSystemData:", v9);

  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "labels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v4, "labels", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v54;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v54 != v17)
          objc_enumerationMutation(v14);
        v19 = -[SHMediaLibraryLabel initWithName:]([SHMediaLibraryLabel alloc], "initWithName:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v18));
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v16);
  }

  objc_msgSend(v4, "syncID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v13, "copy");
  v22 = (SHMediaLibraryTrack *)-[SHMediaLibraryTrack _initWithIdentifier:metadata:labels:](self, "_initWithIdentifier:metadata:labels:", v20, v10, v21);

  objc_msgSend(v4, "shazamKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = [SHShazamKey alloc];
    objc_msgSend(v4, "shazamKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SHShazamKey initWithKey:](v24, "initWithKey:", v25);
    -[SHMediaLibraryTrack setShazamKey:](v22, "setShazamKey:", v26);

  }
  objc_msgSend(v4, "providerID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setProviderIdentifier:](v22, "setProviderIdentifier:", v27);

  objc_msgSend(v4, "providerName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setProviderName:](v22, "setProviderName:", v28);

  objc_msgSend(v4, "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setCreationDate:](v22, "setCreationDate:", v29);

  objc_msgSend(v4, "recognitionID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setRecognitionIdentifier:](v22, "setRecognitionIdentifier:", v30);

  objc_msgSend(v4, "title");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setTitle:](v22, "setTitle:", v31);

  objc_msgSend(v4, "subtitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setSubtitle:](v22, "setSubtitle:", v32);

  objc_msgSend(v4, "artworkURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setArtworkURL:](v22, "setArtworkURL:", v33);

  objc_msgSend(v4, "shazamURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setShazamURL:](v22, "setShazamURL:", v34);

  objc_msgSend(v4, "group");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "syncID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setAssociatedGroupIdentifier:](v22, "setAssociatedGroupIdentifier:", v36);

  v37 = objc_alloc(MEMORY[0x24BDBFA80]);
  objc_msgSend(v4, "latitude");
  v39 = v38;
  objc_msgSend(v4, "longitude");
  v41 = (void *)objc_msgSend(v37, "initWithLatitude:longitude:", v39, v40);
  -[SHMediaLibraryTrack setLocation:](v22, "setLocation:", v41);

  objc_msgSend(v4, "albumName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setAlbumName:](v22, "setAlbumName:", v42);

  objc_msgSend(v4, "appleMusicID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setAppleMusicID:](v22, "setAppleMusicID:", v43);

  objc_msgSend(v4, "appleMusicURL");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setAppleMusicURL:](v22, "setAppleMusicURL:", v44);

  -[SHMediaLibraryTrack setExplicitContent:](v22, "setExplicitContent:", objc_msgSend(v4, "explicit"));
  objc_msgSend(v4, "genres");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setGenres:](v22, "setGenres:", v45);

  objc_msgSend(v4, "isrc");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setIsrc:](v22, "setIsrc:", v46);

  objc_msgSend(v4, "rawSongResponse");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setRawSongResponse:](v22, "setRawSongResponse:", v47);

  objc_msgSend(v4, "releaseDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setReleaseDate:](v22, "setReleaseDate:", v48);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "shazamCount"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setShazamCount:](v22, "setShazamCount:", objc_msgSend(v49, "integerValue"));

  objc_msgSend(v4, "videoURL");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setVideoURL:](v22, "setVideoURL:", v50);

  objc_msgSend(v4, "modifiedDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setLastUpdatedDate:](v22, "setLastUpdatedDate:", v51);

  return v22;
}

- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5
{
  id v8;
  id v9;
  id v10;
  SHMediaLibraryTrack *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSDate *creationDate;
  uint64_t v16;
  NSMutableSet *labelSet;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SHMediaLibraryTrack;
  v11 = -[SHMediaLibraryTrack init](&v19, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "precomposedStringWithCanonicalMapping");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_metadata, a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v14;

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    labelSet = v11->_labelSet;
    v11->_labelSet = (NSMutableSet *)v16;

    -[SHMediaLibraryTrack addPlatformLabel](v11, "addPlatformLabel");
  }

  return v11;
}

- (void)updateWithBuilderBlock:(id)a3
{
  void (**v4)(id, id);
  SHMediaLibraryTrackBuilder *v5;
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
  SHMediaLibraryTrackBuilder *v20;

  v4 = (void (**)(id, id))a3;
  v5 = [SHMediaLibraryTrackBuilder alloc];
  -[SHMediaLibraryTrack creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SHMediaLibraryTrackBuilder initWithCreationDate:](v5, "initWithCreationDate:", v6);

  v4[2](v4, v20);
  -[SHMediaLibraryTrackBuilder creationDate](v20, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setCreationDate:](self, "setCreationDate:", v7);

  -[SHMediaLibraryTrackBuilder title](v20, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setTitle:](self, "setTitle:", v8);

  -[SHMediaLibraryTrackBuilder subtitle](v20, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setSubtitle:](self, "setSubtitle:", v9);

  -[SHMediaLibraryTrackBuilder providerName](v20, "providerName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setProviderName:](self, "setProviderName:", v10);

  -[SHMediaLibraryTrackBuilder providerIdentifier](v20, "providerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setProviderIdentifier:](self, "setProviderIdentifier:", v11);

  -[SHMediaLibraryTrackBuilder recognitionIdentifier](v20, "recognitionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setRecognitionIdentifier:](self, "setRecognitionIdentifier:", v12);

  -[SHMediaLibraryTrackBuilder shazamKey](v20, "shazamKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setShazamKey:](self, "setShazamKey:", v13);

  -[SHMediaLibraryTrackBuilder location](v20, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setLocation:](self, "setLocation:", v14);

  v15 = (void *)MEMORY[0x24BDBCEF0];
  -[SHMediaLibraryTrackBuilder labels](v20, "labels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setLabelSet:](self, "setLabelSet:", v17);

  -[SHMediaLibraryTrackBuilder artworkURL](v20, "artworkURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setArtworkURL:](self, "setArtworkURL:", v18);

  -[SHMediaLibraryTrackBuilder shazamURL](v20, "shazamURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setShazamURL:](self, "setShazamURL:", v19);

  -[SHMediaLibraryTrack addPlatformLabel](self, "addPlatformLabel");
}

- (void)updateWithMediaItem:(id)a3
{
  void *v4;
  SHShazamKey *v5;
  void *v6;
  SHShazamKey *v7;
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
  id v22;

  v22 = a3;
  objc_msgSend(v22, "shazamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [SHShazamKey alloc];
    objc_msgSend(v22, "shazamID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SHShazamKey initWithKey:](v5, "initWithKey:", v6);

    if (v7)
      -[SHMediaLibraryTrack setShazamKey:](self, "setShazamKey:", v7);

  }
  objc_msgSend(v22, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setTitle:](self, "setTitle:", v8);

  objc_msgSend(v22, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SHMediaLibraryTrack setSubtitle:](self, "setSubtitle:", v9);
  }
  else
  {
    objc_msgSend(v22, "artist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHMediaLibraryTrack setSubtitle:](self, "setSubtitle:", v10);

  }
  objc_msgSend(v22, "artworkURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setArtworkURL:](self, "setArtworkURL:", v11);

  objc_msgSend(v22, "webURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setShazamURL:](self, "setShazamURL:", v12);

  objc_msgSend(v22, "albumName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setAlbumName:](self, "setAlbumName:", v13);

  objc_msgSend(v22, "appleMusicID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setAppleMusicID:](self, "setAppleMusicID:", v14);

  objc_msgSend(v22, "appleMusicURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setAppleMusicURL:](self, "setAppleMusicURL:", v15);

  -[SHMediaLibraryTrack setExplicitContent:](self, "setExplicitContent:", objc_msgSend(v22, "explicitContent"));
  objc_msgSend(v22, "genres");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setGenres:](self, "setGenres:", v16);

  objc_msgSend(v22, "isrc");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setIsrc:](self, "setIsrc:", v17);

  objc_msgSend(v22, "_rawResponseSongs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setRawSongResponse:](self, "setRawSongResponse:", v18);

  objc_msgSend(v22, "releaseDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setReleaseDate:](self, "setReleaseDate:", v19);

  -[SHMediaLibraryTrack setShazamCount:](self, "setShazamCount:", objc_msgSend(v22, "shazamCount"));
  objc_msgSend(v22, "videoURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setVideoURL:](self, "setVideoURL:", v20);

  objc_msgSend(v22, "matchLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryTrack setLocation:](self, "setLocation:", v21);

}

- (NSSet)labels
{
  void *v2;
  void *v3;

  -[SHMediaLibraryTrack labelSet](self, "labelSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (SHMediaItem)mediaItemValue
{
  void *v3;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD1880]);
  -[SHMediaLibraryTrack identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("sh_identifier"));

  -[SHMediaLibraryTrack creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("sh_creationDate"));

  -[SHMediaLibraryTrack shazamKey](self, "shazamKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validatedKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("sh_shazamID"));

  -[SHMediaLibraryTrack title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("sh_title"));

  -[SHMediaLibraryTrack subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("sh_subtitle"));

  -[SHMediaLibraryTrack subtitle](self, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("sh_artist"));

  -[SHMediaLibraryTrack artworkURL](self, "artworkURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("sh_artworkURL"));

  -[SHMediaLibraryTrack shazamURL](self, "shazamURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v14, CFSTR("sh_webURL"));

  -[SHMediaLibraryTrack providerIdentifier](self, "providerIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("sh_providerIdentifier"));

  -[SHMediaLibraryTrack albumName](self, "albumName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("sh_albumName"));

  -[SHMediaLibraryTrack appleMusicID](self, "appleMusicID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("sh_appleMusicID"));

  -[SHMediaLibraryTrack appleMusicURL](self, "appleMusicURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v18, CFSTR("sh_appleMusicURL"));

  -[SHMediaLibraryTrack genres](self, "genres");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("sh_genres"));

  -[SHMediaLibraryTrack isrc](self, "isrc");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("sh_isrc"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SHMediaLibraryTrack explicitContent](self, "explicitContent"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v21, CFSTR("sh_explicitContent"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SHMediaLibraryTrack shazamCount](self, "shazamCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("sh_shazamCount"));

  -[SHMediaLibraryTrack releaseDate](self, "releaseDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v23, CFSTR("sh_releaseDate"));

  -[SHMediaLibraryTrack videoURL](self, "videoURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v24, CFSTR("sh_videoURL"));

  -[SHMediaLibraryTrack location](self, "location");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v25, CFSTR("sh_matchLocation"));

  v26 = (void *)objc_msgSend(v3, "copy");
  +[SHMediaItem mediaItemWithProperties:](SHMediaItem, "mediaItemWithProperties:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHMediaLibraryTrack rawSongResponse](self, "rawSongResponse");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "set_rawResponseSongs:", v28);

  return (SHMediaItem *)v27;
}

- (SHMediaLibraryTrack)initWithCoder:(id)a3
{
  id v4;
  SHMediaLibraryTrack *v5;
  void *v6;
  SHMediaLibraryItemMetadata *v7;
  SHMediaLibraryItemMetadata *metadata;
  void *v9;
  SHShazamKey *v10;
  SHShazamKey *shazamKey;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *recognitionIdentifier;
  uint64_t v16;
  NSString *providerIdentifier;
  uint64_t v18;
  NSString *providerName;
  uint64_t v20;
  NSDate *creationDate;
  uint64_t v22;
  NSString *title;
  uint64_t v24;
  NSString *subtitle;
  uint64_t v26;
  NSString *associatedGroupIdentifier;
  uint64_t v28;
  NSURL *artworkURL;
  uint64_t v30;
  NSURL *shazamURL;
  uint64_t v32;
  CLLocation *location;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSMutableSet *labelSet;
  uint64_t v40;
  NSString *albumName;
  uint64_t v42;
  NSURL *appleMusicURL;
  uint64_t v44;
  NSString *appleMusicID;
  uint64_t v46;
  NSString *isrc;
  uint64_t v48;
  NSDate *releaseDate;
  uint64_t v50;
  NSURL *videoURL;
  uint64_t v52;
  NSDate *lastUpdatedDate;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSDictionary *rawSongResponse;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSArray *genres;
  void *context;
  objc_super v66;
  _QWORD v67[5];

  v67[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)SHMediaLibraryTrack;
  v5 = -[SHMediaLibraryTrack init](&v66, sel_init);
  if (v5)
  {
    context = (void *)MEMORY[0x219A21784]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[SHMediaLibraryItemMetadata initWithEncodedSystemData:]([SHMediaLibraryItemMetadata alloc], "initWithEncodedSystemData:", v6);
      metadata = v5->_metadata;
      v5->_metadata = v7;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackShazamKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[SHShazamKey initWithKey:]([SHShazamKey alloc], "initWithKey:", v9);
      shazamKey = v5->_shazamKey;
      v5->_shazamKey = v10;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackRecognitionIdentifierKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    recognitionIdentifier = v5->_recognitionIdentifier;
    v5->_recognitionIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackProviderIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    providerIdentifier = v5->_providerIdentifier;
    v5->_providerIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackProviderName"));
    v18 = objc_claimAutoreleasedReturnValue();
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackTitle"));
    v22 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackSubtitle"));
    v24 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackAssociatedGroupIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    associatedGroupIdentifier = v5->_associatedGroupIdentifier;
    v5->_associatedGroupIdentifier = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackArtworkURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackShazamURL"));
    v30 = objc_claimAutoreleasedReturnValue();
    shazamURL = v5->_shazamURL;
    v5->_shazamURL = (NSURL *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryTrackLocation"));
    v32 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v32;

    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("SHLibraryTrackLibrarySet"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "mutableCopy");
    labelSet = v5->_labelSet;
    v5->_labelSet = (NSMutableSet *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryTrackAlbumName"));
    v40 = objc_claimAutoreleasedReturnValue();
    albumName = v5->_albumName;
    v5->_albumName = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryTrackAppleMusicURL"));
    v42 = objc_claimAutoreleasedReturnValue();
    appleMusicURL = v5->_appleMusicURL;
    v5->_appleMusicURL = (NSURL *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryTrackAppleMusicID"));
    v44 = objc_claimAutoreleasedReturnValue();
    appleMusicID = v5->_appleMusicID;
    v5->_appleMusicID = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryTrackISRC"));
    v46 = objc_claimAutoreleasedReturnValue();
    isrc = v5->_isrc;
    v5->_isrc = (NSString *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryTrackReleaseDate"));
    v48 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryTrackVideoURL"));
    v50 = objc_claimAutoreleasedReturnValue();
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v50;

    v5->_explicitContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SHMediaLibraryTrackExplicitContent"));
    v5->_shazamCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SHMediaLibraryTrackShazamCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryTrackLastUpdatedDate"));
    v52 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v52;

    v54 = (void *)MEMORY[0x24BDBCF20];
    v67[0] = objc_opt_class();
    v67[1] = objc_opt_class();
    v67[2] = objc_opt_class();
    v67[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 4);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setWithArray:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("SHMediaLibraryTrackRawSongResponse"));
    v57 = objc_claimAutoreleasedReturnValue();
    rawSongResponse = v5->_rawSongResponse;
    v5->_rawSongResponse = (NSDictionary *)v57;

    v59 = (void *)MEMORY[0x24BDBCF20];
    v60 = objc_opt_class();
    objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v61, CFSTR("SHMediaLibraryTrackGenres"));
    v62 = objc_claimAutoreleasedReturnValue();
    genres = v5->_genres;
    v5->_genres = (NSArray *)v62;

    objc_autoreleasePoolPop(context);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x219A21784]();
  objc_msgSend(v8, "encodeObject:forKey:", self->_identifier, CFSTR("SHLibraryTrackIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_recognitionIdentifier, CFSTR("SHLibraryTrackRecognitionIdentifierKey"));
  -[SHShazamKey validatedKey](self->_shazamKey, "validatedKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("SHLibraryTrackShazamKey"));

  -[SHMediaLibraryItemMetadata encodedSystemData](self->_metadata, "encodedSystemData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("SHLibraryTrackMetadata"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_providerIdentifier, CFSTR("SHLibraryTrackProviderIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_providerName, CFSTR("SHLibraryTrackProviderName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_creationDate, CFSTR("SHLibraryTrackDate"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_title, CFSTR("SHLibraryTrackTitle"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_subtitle, CFSTR("SHLibraryTrackSubtitle"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_associatedGroupIdentifier, CFSTR("SHLibraryTrackAssociatedGroupIdentifier"));
  v7 = (void *)-[NSMutableSet copy](self->_labelSet, "copy");
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("SHLibraryTrackLibrarySet"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_artworkURL, CFSTR("SHLibraryTrackArtworkURL"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_shazamURL, CFSTR("SHLibraryTrackShazamURL"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_location, CFSTR("SHLibraryTrackLocation"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_albumName, CFSTR("SHMediaLibraryTrackAlbumName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_appleMusicURL, CFSTR("SHMediaLibraryTrackAppleMusicURL"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_appleMusicID, CFSTR("SHMediaLibraryTrackAppleMusicID"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_genres, CFSTR("SHMediaLibraryTrackGenres"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_isrc, CFSTR("SHMediaLibraryTrackISRC"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_rawSongResponse, CFSTR("SHMediaLibraryTrackRawSongResponse"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_releaseDate, CFSTR("SHMediaLibraryTrackReleaseDate"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_videoURL, CFSTR("SHMediaLibraryTrackVideoURL"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_explicitContent, CFSTR("SHMediaLibraryTrackExplicitContent"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_shazamCount, CFSTR("SHMediaLibraryTrackShazamCount"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("SHMediaLibraryTrackLastUpdatedDate"));
  objc_autoreleasePoolPop(v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHMediaLibraryTrack *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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

  v5 = +[SHMediaLibraryTrack allocWithZone:](SHMediaLibraryTrack, "allocWithZone:");
  -[SHMediaLibraryTrack identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[SHMediaLibraryTrack metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[SHMediaLibraryTrack labels](self, "labels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  v13 = -[SHMediaLibraryTrack _initWithIdentifier:metadata:labels:](v5, "_initWithIdentifier:metadata:labels:", v7, v9, v12);

  -[SHMediaLibraryTrack recognitionIdentifier](self, "recognitionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v13, "setRecognitionIdentifier:", v15);

  -[SHMediaLibraryTrack shazamKey](self, "shazamKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v13, "setShazamKey:", v17);

  -[SHMediaLibraryTrack creationDate](self, "creationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v13, "setCreationDate:", v19);

  -[SHMediaLibraryTrack providerIdentifier](self, "providerIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v13, "setProviderIdentifier:", v21);

  -[SHMediaLibraryTrack providerName](self, "providerName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v13, "setProviderName:", v23);

  -[SHMediaLibraryTrack title](self, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v13, "setTitle:", v25);

  -[SHMediaLibraryTrack subtitle](self, "subtitle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
  objc_msgSend(v13, "setSubtitle:", v27);

  -[SHMediaLibraryTrack associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copyWithZone:", a3);
  objc_msgSend(v13, "setAssociatedGroupIdentifier:", v29);

  -[SHMediaLibraryTrack artworkURL](self, "artworkURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copyWithZone:", a3);
  objc_msgSend(v13, "setArtworkURL:", v31);

  -[SHMediaLibraryTrack shazamURL](self, "shazamURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copyWithZone:", a3);
  objc_msgSend(v13, "setShazamURL:", v33);

  -[SHMediaLibraryTrack location](self, "location");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "copyWithZone:", a3);
  objc_msgSend(v13, "setLocation:", v35);

  -[SHMediaLibraryTrack albumName](self, "albumName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copyWithZone:", a3);
  objc_msgSend(v13, "setAlbumName:", v37);

  -[SHMediaLibraryTrack appleMusicID](self, "appleMusicID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "copyWithZone:", a3);
  objc_msgSend(v13, "setAppleMusicID:", v39);

  -[SHMediaLibraryTrack appleMusicURL](self, "appleMusicURL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copyWithZone:", a3);
  objc_msgSend(v13, "setAppleMusicURL:", v41);

  objc_msgSend(v13, "setExplicitContent:", -[SHMediaLibraryTrack explicitContent](self, "explicitContent"));
  -[SHMediaLibraryTrack genres](self, "genres");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v42, "copyWithZone:", a3);
  objc_msgSend(v13, "setGenres:", v43);

  -[SHMediaLibraryTrack isrc](self, "isrc");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "copyWithZone:", a3);
  objc_msgSend(v13, "setIsrc:", v45);

  -[SHMediaLibraryTrack rawSongResponse](self, "rawSongResponse");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "copyWithZone:", a3);
  objc_msgSend(v13, "setRawSongResponse:", v47);

  -[SHMediaLibraryTrack releaseDate](self, "releaseDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v48, "copyWithZone:", a3);
  objc_msgSend(v13, "setReleaseDate:", v49);

  objc_msgSend(v13, "setShazamCount:", -[SHMediaLibraryTrack shazamCount](self, "shazamCount"));
  -[SHMediaLibraryTrack videoURL](self, "videoURL");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v50, "copyWithZone:", a3);
  objc_msgSend(v13, "setVideoURL:", v51);

  -[SHMediaLibraryTrack lastUpdatedDate](self, "lastUpdatedDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v52, "copyWithZone:", a3);
  objc_msgSend(v13, "setLastUpdatedDate:", v53);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  SHMediaLibraryTrack *v4;
  BOOL v5;

  v4 = (SHMediaLibraryTrack *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[SHMediaLibraryTrack isEqualTrack:](self, "isEqualTrack:", v4);
  }

  return v5;
}

- (BOOL)isEqualTrack:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SHMediaLibraryTrack identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SHMediaLibraryTrack identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)platformLabel
{
  SHMediaLibraryLabel *v2;
  void *v3;
  SHMediaLibraryLabel *v4;

  v2 = [SHMediaLibraryLabel alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_ios"), CFSTR("platform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SHMediaLibraryLabel initWithName:](v2, "initWithName:", v3);

  return v4;
}

- (void)addPlatformLabel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SHMediaLibraryTrack labels](self, "labels", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(v3);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "type"))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[SHMediaLibraryTrack platformLabel](self, "platformLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHMediaLibraryTrack addLabel:](self, "addLabel:", v3);
  }

}

- (void)addLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHMediaLibraryTrack labelSet](self, "labelSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (SHMediaLibraryItemMetadata)metadata
{
  return self->_metadata;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)recognitionIdentifier
{
  return self->_recognitionIdentifier;
}

- (void)setRecognitionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SHShazamKey)shazamKey
{
  return self->_shazamKey;
}

- (void)setShazamKey:(id)a3
{
  objc_storeStrong((id *)&self->_shazamKey, a3);
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (NSURL)shazamURL
{
  return self->_shazamURL;
}

- (void)setShazamURL:(id)a3
{
  objc_storeStrong((id *)&self->_shazamURL, a3);
}

- (NSString)associatedGroupIdentifier
{
  return self->_associatedGroupIdentifier;
}

- (void)setAssociatedGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSMutableSet)labelSet
{
  return self->_labelSet;
}

- (void)setLabelSet:(id)a3
{
  objc_storeStrong((id *)&self->_labelSet, a3);
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)appleMusicID
{
  return self->_appleMusicID;
}

- (void)setAppleMusicID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)isrc
{
  return self->_isrc;
}

- (void)setIsrc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSURL)appleMusicURL
{
  return self->_appleMusicURL;
}

- (void)setAppleMusicURL:(id)a3
{
  objc_storeStrong((id *)&self->_appleMusicURL, a3);
}

- (NSArray)genres
{
  return self->_genres;
}

- (void)setGenres:(id)a3
{
  objc_storeStrong((id *)&self->_genres, a3);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDate, a3);
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoURL, a3);
}

- (NSDictionary)rawSongResponse
{
  return self->_rawSongResponse;
}

- (void)setRawSongResponse:(id)a3
{
  objc_storeStrong((id *)&self->_rawSongResponse, a3);
}

- (BOOL)explicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (int64_t)shazamCount
{
  return self->_shazamCount;
}

- (void)setShazamCount:(int64_t)a3
{
  self->_shazamCount = a3;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_rawSongResponse, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_appleMusicURL, 0);
  objc_storeStrong((id *)&self->_isrc, 0);
  objc_storeStrong((id *)&self->_appleMusicID, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_labelSet, 0);
  objc_storeStrong((id *)&self->_associatedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_shazamURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_shazamKey, 0);
  objc_storeStrong((id *)&self->_recognitionIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
