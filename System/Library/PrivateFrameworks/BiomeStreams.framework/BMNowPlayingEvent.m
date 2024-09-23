@implementation BMNowPlayingEvent

- (BMNowPlayingEvent)initWithUniqueID:(id)a3 bundleID:(id)a4 absoluteTimestamp:(double)a5 playbackState:(unint64_t)a6 album:(id)a7 artist:(id)a8 duration:(unsigned int)a9 genre:(id)a10 title:(id)a11 elapsed:(unsigned int)a12 mediaType:(id)a13 iTunesStoreIdentifier:(id)a14 iTunesSubscriptionIdentifier:(id)a15 isAirPlayVideo:(BOOL)a16 outputDevices:(id)a17
{
  uint64_t v18;
  uint64_t v19;

  LOBYTE(v19) = a16;
  LODWORD(v18) = a12;
  return -[BMNowPlayingEvent initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:isAirPlayVideo:outputDevices:](self, "initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:isAirPlayVideo:outputDevices:", a3, a4, a6, a7, a8, *(_QWORD *)&a9, a5, a10, a11, v18, a13, a14, a15, 0, 0,
           v19,
           a17);
}

- (BMNowPlayingEvent)initWithUniqueID:(id)a3 bundleID:(id)a4 absoluteTimestamp:(double)a5 playbackState:(unint64_t)a6 album:(id)a7 artist:(id)a8 duration:(unsigned int)a9 genre:(id)a10 title:(id)a11 elapsed:(unsigned int)a12 mediaType:(id)a13 iTunesStoreIdentifier:(id)a14 iTunesSubscriptionIdentifier:(id)a15 iTunesArtistIdentifier:(id)a16 iTunesAlbumIdentifier:(id)a17 isAirPlayVideo:(BOOL)a18 outputDevices:(id)a19
{
  uint64_t v20;
  uint64_t v21;

  LOWORD(v21) = a18;
  LODWORD(v20) = a12;
  return -[BMNowPlayingEvent initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:itemMediaType:itemMediaSubtype:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isAirPlayVideo:isRemoteControl:outputDevices:](self, "initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:itemMediaType:itemMediaSubtype:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isAirPlayVideo:isRemoteControl:outputDevices:", a3, a4, a6, a7, a8, *(_QWORD *)&a9, a5, a10, a11, v20, a13, 0, a14, a15, a16,
           a17,
           0,
           v21,
           a19);
}

- (BMNowPlayingEvent)initWithUniqueID:(id)a3 bundleID:(id)a4 absoluteTimestamp:(double)a5 playbackState:(unint64_t)a6 album:(id)a7 artist:(id)a8 duration:(unsigned int)a9 genre:(id)a10 title:(id)a11 elapsed:(unsigned int)a12 mediaType:(id)a13 itemMediaType:(int)a14 itemMediaSubtype:(int)a15 iTunesStoreIdentifier:(id)a16 iTunesSubscriptionIdentifier:(id)a17 iTunesArtistIdentifier:(id)a18 iTunesAlbumIdentifier:(id)a19 groupIdentifier:(id)a20 isAirPlayVideo:(BOOL)a21 isRemoteControl:(BOOL)a22 outputDevices:(id)a23
{
  id v27;
  id v28;
  id v29;
  id v30;
  BMNowPlayingEvent *v31;
  BMNowPlayingEvent *v32;
  id v35;
  id v37;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v47 = a3;
  v35 = a4;
  v45 = a4;
  v42 = a7;
  v37 = a8;
  v40 = a8;
  v48 = a10;
  v46 = a11;
  v44 = a13;
  v43 = a16;
  v41 = a17;
  v27 = a18;
  v28 = a19;
  v29 = a20;
  v30 = a23;
  v49.receiver = self;
  v49.super_class = (Class)BMNowPlayingEvent;
  v31 = -[BMEventBase init](&v49, sel_init);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_uniqueID, a3);
    objc_storeStrong((id *)&v32->_bundleID, v35);
    v32->_absoluteTimestamp = a5;
    v32->_playbackState = a6;
    objc_storeStrong((id *)&v32->_album, a7);
    objc_storeStrong((id *)&v32->_artist, v37);
    v32->_duration = a9;
    objc_storeStrong((id *)&v32->_genre, a10);
    objc_storeStrong((id *)&v32->_title, a11);
    v32->_elapsed = a12;
    objc_storeStrong((id *)&v32->_mediaType, a13);
    v32->_itemMediaType = a14;
    v32->_itemMediaSubtype = a15;
    objc_storeStrong((id *)&v32->_iTunesStoreIdentifier, a16);
    objc_storeStrong((id *)&v32->_iTunesSubscriptionIdentifier, a17);
    objc_storeStrong((id *)&v32->_iTunesArtistIdentifier, a18);
    objc_storeStrong((id *)&v32->_iTunesAlbumIdentifier, a19);
    objc_storeStrong((id *)&v32->_groupIdentifier, a20);
    v32->_isAirPlayVideo = a21;
    v32->_isRemoteControl = a22;
    objc_storeStrong((id *)&v32->_outputDevices, a23);
  }

  return v32;
}

- (BMNowPlayingEvent)initWithDKEvent:(id)a3 outputDevices:(id)a4
{
  return -[BMNowPlayingEvent initWithDKEvent:outputDevices:iTunesArtistIdentifier:iTunesAlbumIdentifier:](self, "initWithDKEvent:outputDevices:iTunesArtistIdentifier:iTunesAlbumIdentifier:", a3, a4, 0, 0);
}

- (BMNowPlayingEvent)initWithDKEvent:(id)a3 outputDevices:(id)a4 iTunesArtistIdentifier:(id)a5 iTunesAlbumIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  BMNowPlayingOutputDevice *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  NSObject *v49;
  void *v50;
  BMNowPlayingOutputDevice *v51;
  uint64_t v53;
  uint64_t v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
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
  BMNowPlayingEvent *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t v106[128];
  uint8_t buf[4];
  unint64_t v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "iTunesStoreIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "iTunesSubscriptionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "source");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "itemID");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "stringValue");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "timeIntervalSinceReferenceDate");
  v20 = v19;
  objc_msgSend(v9, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "playing");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v21;
  objc_msgSend(v21, "objectForKeyedSubscript:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v87, "integerValue");
  v23 = v22;
  if (v22 >= 6)
  {
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[BMNowPlayingEvent initWithDKEvent:outputDevices:iTunesArtistIdentifier:iTunesAlbumIdentifier:].cold.1(v23);

    v77 = 0;
  }
  else
  {
    v77 = v22;
  }
  objc_msgSend(v9, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "album");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v25;
  objc_msgSend(v25, "objectForKeyedSubscript:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "artist");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v26;
  objc_msgSend(v26, "objectForKeyedSubscript:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "duration");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v27;
  objc_msgSend(v27, "objectForKeyedSubscript:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v78, "unsignedLongValue");
  objc_msgSend(v9, "metadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "genre");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v28;
  objc_msgSend(v28, "objectForKeyedSubscript:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "title");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v29;
  objc_msgSend(v29, "objectForKeyedSubscript:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "elapsed");
  v70 = v30;
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v67, "unsignedLongValue");
  objc_msgSend(v9, "metadata");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "mediaType");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v31;
  objc_msgSend(v31, "objectForKeyedSubscript:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v15;
  objc_msgSend(v15, "stringValue");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v18;
  objc_msgSend(v18, "stringValue");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v11;
  objc_msgSend(v11, "stringValue");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v12;
  objc_msgSend(v12, "stringValue");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v9;
  objc_msgSend(v9, "metadata");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKNowPlayingMetadataKeyClass(), "isAirPlayVideo");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v32;
  objc_msgSend(v32, "objectForKeyedSubscript:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v56, "BOOLValue");
  v33 = v10;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v33, "count"));
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v35 = v33;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v103;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v103 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v39);
        v41 = [BMNowPlayingOutputDevice alloc];
        v42 = objc_msgSend(v40, "deviceType");
        v43 = v42;
        if (v42 >= 5)
        {
          __biome_log_for_category();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v108 = v43;
            _os_log_fault_impl(&dword_18D810000, v45, OS_LOG_TYPE_FAULT, "BMNowPlayingAVOutputDeviceType: Unrecognized value for outputDevice: %ld", buf, 0xCu);
          }

          v44 = 0;
        }
        else
        {
          v44 = v42 + 1;
        }
        v46 = objc_msgSend(v40, "deviceSubType");
        v47 = v46;
        if (v46 >= 0x14)
        {
          __biome_log_for_category();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v108 = v47;
            _os_log_fault_impl(&dword_18D810000, v49, OS_LOG_TYPE_FAULT, "BMNowPlayingAVOutputDeviceSubType: Unrecognized value for outputSubtype: %ld", buf, 0xCu);
          }

          v48 = 0;
        }
        else
        {
          v48 = v46 + 1;
        }
        objc_msgSend(v40, "deviceID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = -[BMNowPlayingOutputDevice initWithDeviceType:deviceSubType:deviceId:](v41, "initWithDeviceType:deviceSubType:deviceId:", v44, v48, v50);
        objc_msgSend(v34, "addObject:", v51);

        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
    }
    while (v37);
  }

  LOBYTE(v54) = v55;
  LODWORD(v53) = v61;
  v101 = -[BMNowPlayingEvent initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:isAirPlayVideo:outputDevices:](self, "initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:isAirPlayVideo:outputDevices:", v100, v99, v77, v84, v81, v69, v20, v74, v71, v53, v64, v63, v62, v60, v59,
           v54,
           v34);

  return v101;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NowPlaying event with uniqueId:%@"), self->_uniqueID);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMNowPlayingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMNowPlayingEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BMNowPlayingOutputDevice *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BMNowPlayingOutputDevice *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  BMNowPlayingEvent *v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  unsigned int v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  BMNowPlayingEvent *v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = self;
      v45 = v4;
      v5 = v4;
      v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[NSObject outputDevices](v5, "outputDevices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[NSObject outputDevices](v5, "outputDevices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v48 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            v15 = [BMNowPlayingOutputDevice alloc];
            v16 = (int)objc_msgSend(v14, "outputDeviceType");
            v17 = (int)objc_msgSend(v14, "outputDeviceSubType");
            objc_msgSend(v14, "outputDeviceId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[BMNowPlayingOutputDevice initWithDeviceType:deviceSubType:deviceId:](v15, "initWithDeviceType:deviceSubType:deviceId:", v16, v17, v18);
            objc_msgSend(v8, "addObject:", v19);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v11);
      }

      v43 = (int)-[NSObject playbackState](v5, "playbackState");
      v42 = -[NSObject itemMediaType](v5, "itemMediaType");
      v39 = -[NSObject itemMediaSubtype](v5, "itemMediaSubtype");
      -[NSObject uniqueId](v5, "uniqueId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject bundleId](v5, "bundleId");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
      v21 = v20;
      -[NSObject album](v5, "album");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject artist](v5, "artist");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[NSObject duration](v5, "duration");
      -[NSObject genre](v5, "genre");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject title](v5, "title");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[NSObject elapsed](v5, "elapsed");
      -[NSObject mediaType](v5, "mediaType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject iTunesStoreIdentifier](v5, "iTunesStoreIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject iTunesSubscriptionIdentifier](v5, "iTunesSubscriptionIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject iTunesArtistIdentifier](v5, "iTunesArtistIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject iTunesAlbumIdentifier](v5, "iTunesAlbumIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject groupIdentifier](v5, "groupIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[NSObject isAirPlayVideo](v5, "isAirPlayVideo");
      BYTE1(v30) = -[NSObject isRemoteControl](v5, "isRemoteControl");
      LOBYTE(v30) = v25;
      LODWORD(v29) = v35;
      self = objc_retain(-[BMNowPlayingEvent initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:itemMediaType:itemMediaSubtype:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isAirPlayVideo:isRemoteControl:outputDevices:](v44, "initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:itemMediaType:itemMediaSubtype:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isAirPlayVideo:isRemoteControl:outputDevices:", v41, v40, v43, v38, v37, v36, v21, v46, v34, v29, v33, __PAIR64__(v39, v42), v32, v31,
                 v22,
                 v23,
                 v24,
                 v30,
                 v8));

      v26 = v5;
      v27 = self;
      v4 = v45;
    }
    else
    {
      __biome_log_for_category();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[BMNowPlayingEvent initWithProto:].cold.1((uint64_t)self, v26);
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BMNowPlayingEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBNowPlayingEvent *v5;
  BMNowPlayingEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBNowPlayingEvent initWithData:]([BMPBNowPlayingEvent alloc], "initWithData:", v4);

    self = -[BMNowPlayingEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  unint64_t playbackState;
  uint64_t itemMediaType;
  uint64_t itemMediaSubtype;
  id v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_outputDevices, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_outputDevices;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "proto", (_QWORD)v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setUniqueId:", self->_uniqueID);
  objc_msgSend(v10, "setBundleId:", self->_bundleID);
  objc_msgSend(v10, "setAbsoluteTimestamp:", self->_absoluteTimestamp);
  playbackState = self->_playbackState;
  if (playbackState >= 6)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMNowPlayingEvent proto].cold.3(playbackState);
    goto LABEL_18;
  }
  itemMediaType = self->_itemMediaType;
  if (itemMediaType >= 3)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMNowPlayingEvent proto].cold.2(itemMediaType);
    goto LABEL_18;
  }
  itemMediaSubtype = self->_itemMediaSubtype;
  if (itemMediaSubtype >= 8)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMNowPlayingEvent proto].cold.1(itemMediaSubtype);
LABEL_18:

    v14 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v10, "setPlaybackState:", self->_playbackState);
  objc_msgSend(v10, "setAlbum:", self->_album);
  objc_msgSend(v10, "setArtist:", self->_artist);
  objc_msgSend(v10, "setDuration:", self->_duration);
  objc_msgSend(v10, "setGenre:", self->_genre);
  objc_msgSend(v10, "setTitle:", self->_title);
  objc_msgSend(v10, "setElapsed:", self->_elapsed);
  objc_msgSend(v10, "setMediaType:", self->_mediaType);
  objc_msgSend(v10, "setItemMediaType:", itemMediaType);
  objc_msgSend(v10, "setItemMediaSubtype:", itemMediaSubtype);
  objc_msgSend(v10, "setITunesStoreIdentifier:", self->_iTunesStoreIdentifier);
  objc_msgSend(v10, "setITunesSubscriptionIdentifier:", self->_iTunesSubscriptionIdentifier);
  objc_msgSend(v10, "setITunesArtistIdentifier:", self->_iTunesArtistIdentifier);
  objc_msgSend(v10, "setITunesAlbumIdentifier:", self->_iTunesAlbumIdentifier);
  objc_msgSend(v10, "setGroupIdentifier:", self->_groupIdentifier);
  objc_msgSend(v10, "setIsAirPlayVideo:", self->_isAirPlayVideo);
  objc_msgSend(v10, "setIsRemoteControl:", self->_isRemoteControl);
  objc_msgSend(v10, "setOutputDevices:", v3);
  v14 = v10;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  double v19;

  v3 = (double)self->_playbackState
     + (self->_absoluteTimestamp + (double)(31 * -[NSString hash](self->_uniqueID, "hash"))) * 31.0;
  v4 = (double)-[NSString hash](self->_album, "hash") + v3 * 31.0;
  v5 = -[NSString hash](self->_artist, "hash");
  LODWORD(v6) = self->_duration;
  v7 = (double)-[NSString hash](self->_genre, "hash") + ((double)v6 + ((double)v5 + v4 * 31.0) * 31.0) * 31.0;
  v8 = -[NSString hash](self->_title, "hash");
  LODWORD(v9) = self->_elapsed;
  v10 = (double)self->_itemMediaSubtype
      + ((double)self->_itemMediaType
       + ((double)-[NSString hash](self->_mediaType, "hash") + ((double)v9 + ((double)v8 + v7 * 31.0) * 31.0) * 31.0)
       * 31.0)
      * 31.0;
  v11 = (double)-[NSString hash](self->_iTunesStoreIdentifier, "hash") + v10 * 31.0;
  v12 = (double)-[NSString hash](self->_iTunesSubscriptionIdentifier, "hash") + v11 * 31.0;
  v13 = (double)-[NSString hash](self->_iTunesArtistIdentifier, "hash") + v12 * 31.0;
  v14 = (double)-[NSString hash](self->_iTunesAlbumIdentifier, "hash") + v13 * 31.0;
  v15 = -[NSString hash](self->_groupIdentifier, "hash");
  LOBYTE(v16) = self->_isAirPlayVideo;
  *(double *)&v17 = (double)v16;
  v18 = *(double *)&v17 + ((double)v15 + v14 * 31.0) * 31.0;
  LOBYTE(v17) = self->_isRemoteControl;
  v19 = (double)(unint64_t)-[NSArray hash](self->_outputDevices, "hash") + ((double)v17 + v18 * 31.0) * 31.0;
  return (unint64_t)(v19 + (double)-[NSString hash](self->_bundleID, "hash"));
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  NSString *uniqueID;
  NSString *v11;
  void *v12;
  char v13;
  NSString *bundleID;
  NSString *v15;
  void *v16;
  NSString *album;
  NSString *v18;
  void *v19;
  NSString *artist;
  NSString *v21;
  void *v22;
  NSString *genre;
  NSString *v24;
  void *v25;
  NSString *title;
  NSString *v27;
  void *v28;
  NSString *mediaType;
  void *v30;
  void *v31;
  uint64_t v32;
  NSString *iTunesStoreIdentifier;
  NSString *v34;
  uint64_t v35;
  NSString *iTunesSubscriptionIdentifier;
  NSString *v37;
  NSString *iTunesArtistIdentifier;
  NSString *v39;
  char v40;
  NSString *iTunesAlbumIdentifier;
  NSString *v42;
  NSString *groupIdentifier;
  NSString *v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  BOOL v57;
  double absoluteTimestamp;
  double v59;
  unint64_t playbackState;
  unsigned int duration;
  unsigned int elapsed;
  int itemMediaType;
  int itemMediaSubtype;
  int isAirPlayVideo;
  int isRemoteControl;
  int v67;
  char v68;
  char v70;
  id v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_110;
  }
  v8 = v7;
  v9 = v8;
  uniqueID = self->_uniqueID;
  v11 = uniqueID;
  if (uniqueID)
  {
LABEL_5:
    objc_msgSend(v9, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = -[NSString isEqual:](v11, "isEqual:", v12);

    if (uniqueID)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v8, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = self->_uniqueID;
    goto LABEL_5;
  }
  v81 = 1;
LABEL_9:

LABEL_10:
  bundleID = self->_bundleID;
  v15 = bundleID;
  if (bundleID)
    goto LABEL_13;
  objc_msgSend(v9, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = self->_bundleID;
LABEL_13:
    objc_msgSend(v9, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = -[NSString isEqual:](v15, "isEqual:", v16);

    if (bundleID)
      goto LABEL_17;
    goto LABEL_16;
  }
  v80 = 1;
LABEL_16:

LABEL_17:
  album = self->_album;
  v18 = album;
  if (album)
    goto LABEL_20;
  objc_msgSend(v9, "album");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v18 = self->_album;
LABEL_20:
    objc_msgSend(v9, "album");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = -[NSString isEqual:](v18, "isEqual:", v19);

    if (album)
      goto LABEL_24;
    goto LABEL_23;
  }
  v79 = 1;
LABEL_23:

LABEL_24:
  artist = self->_artist;
  v21 = artist;
  if (artist)
    goto LABEL_27;
  objc_msgSend(v9, "artist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v21 = self->_artist;
LABEL_27:
    objc_msgSend(v9, "artist");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = -[NSString isEqual:](v21, "isEqual:", v22);

    if (artist)
      goto LABEL_31;
    goto LABEL_30;
  }
  v78 = 1;
LABEL_30:

LABEL_31:
  genre = self->_genre;
  v24 = genre;
  if (genre)
    goto LABEL_34;
  objc_msgSend(v9, "genre");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v24 = self->_genre;
LABEL_34:
    objc_msgSend(v9, "genre");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[NSString isEqual:](v24, "isEqual:", v25);

    if (genre)
      goto LABEL_38;
    goto LABEL_37;
  }
  v77 = 1;
LABEL_37:

LABEL_38:
  title = self->_title;
  v27 = title;
  if (title)
    goto LABEL_41;
  objc_msgSend(v9, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v27 = self->_title;
LABEL_41:
    objc_msgSend(v9, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = -[NSString isEqual:](v27, "isEqual:", v28);

    if (title)
      goto LABEL_45;
    goto LABEL_44;
  }
  v76 = 1;
LABEL_44:

LABEL_45:
  mediaType = self->_mediaType;
  v30 = mediaType;
  if (mediaType)
    goto LABEL_48;
  objc_msgSend(v9, "mediaType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v30 = self->_mediaType;
LABEL_48:
    objc_msgSend(v9, "mediaType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v30, "isEqual:", v31);

    if (mediaType)
      goto LABEL_52;
    goto LABEL_51;
  }
  v75 = 1;
LABEL_51:

LABEL_52:
  v32 = 112;
  iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
  v34 = iTunesStoreIdentifier;
  if (iTunesStoreIdentifier)
    goto LABEL_55;
  objc_msgSend(v9, "iTunesStoreIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v34 = self->_iTunesStoreIdentifier;
LABEL_55:
    objc_msgSend(v9, "iTunesStoreIdentifier");
    v32 = objc_claimAutoreleasedReturnValue();
    v74 = -[NSString isEqual:](v34, "isEqual:", v32);

    if (iTunesStoreIdentifier)
      goto LABEL_59;
    goto LABEL_58;
  }
  v74 = 1;
LABEL_58:

LABEL_59:
  v35 = 120;
  iTunesSubscriptionIdentifier = self->_iTunesSubscriptionIdentifier;
  v37 = iTunesSubscriptionIdentifier;
  if (iTunesSubscriptionIdentifier)
    goto LABEL_62;
  objc_msgSend(v9, "iTunesSubscriptionIdentifier");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v37 = self->_iTunesSubscriptionIdentifier;
LABEL_62:
    objc_msgSend(v9, "iTunesSubscriptionIdentifier");
    v35 = objc_claimAutoreleasedReturnValue();
    v73 = -[NSString isEqual:](v37, "isEqual:", v35);

    if (iTunesSubscriptionIdentifier)
      goto LABEL_66;
    goto LABEL_65;
  }
  v73 = 1;
LABEL_65:

LABEL_66:
  iTunesArtistIdentifier = self->_iTunesArtistIdentifier;
  v39 = iTunesArtistIdentifier;
  if (iTunesArtistIdentifier)
    goto LABEL_69;
  objc_msgSend(v9, "iTunesArtistIdentifier");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v39 = self->_iTunesArtistIdentifier;
LABEL_69:
    objc_msgSend(v9, "iTunesArtistIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[NSString isEqual:](v39, "isEqual:", v4);

    if (iTunesArtistIdentifier)
      goto LABEL_73;
    goto LABEL_72;
  }
  v40 = 1;
LABEL_72:

LABEL_73:
  iTunesAlbumIdentifier = self->_iTunesAlbumIdentifier;
  v42 = iTunesAlbumIdentifier;
  if (iTunesAlbumIdentifier)
    goto LABEL_76;
  objc_msgSend(v9, "iTunesAlbumIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v42 = self->_iTunesAlbumIdentifier;
LABEL_76:
    objc_msgSend(v9, "iTunesAlbumIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[NSString isEqual:](v42, "isEqual:", v5);

    if (iTunesAlbumIdentifier)
      goto LABEL_80;
    goto LABEL_79;
  }
  v72 = 1;
LABEL_79:

LABEL_80:
  groupIdentifier = self->_groupIdentifier;
  v44 = groupIdentifier;
  if (!groupIdentifier)
  {
    objc_msgSend(v9, "groupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v46 = 1;
LABEL_86:

      goto LABEL_87;
    }
    v44 = self->_groupIdentifier;
  }
  objc_msgSend(v9, "groupIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[NSString isEqual:](v44, "isEqual:", v45);

  if (!groupIdentifier)
    goto LABEL_86;
LABEL_87:
  v47 = -[NSArray count](self->_outputDevices, "count");
  objc_msgSend(v9, "outputDevices");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "count");

  if (v47 == v49)
  {
    v50 = v47 - 1;
    if (v47 < 1)
    {
      LOBYTE(v56) = 1;
    }
    else
    {
      v70 = v46;
      v71 = v7;
      v51 = v40;
      v52 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_outputDevices, "objectAtIndexedSubscript:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "outputDevices");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectAtIndexedSubscript:", v52);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v53, "isEqual:", v55);

        if (v56)
          v57 = v50 == v52;
        else
          v57 = 1;
        ++v52;
      }
      while (!v57);
      v40 = v51;
      v7 = v71;
      v46 = v70;
    }
  }
  else
  {
    LOBYTE(v56) = 0;
  }
  absoluteTimestamp = self->_absoluteTimestamp;
  objc_msgSend(v9, "absoluteTimestamp");
  if (absoluteTimestamp == v59
    && (playbackState = self->_playbackState, playbackState == objc_msgSend(v9, "playbackState"))
    && (duration = self->_duration, duration == objc_msgSend(v9, "duration"))
    && (elapsed = self->_elapsed, elapsed == objc_msgSend(v9, "elapsed"))
    && (itemMediaType = self->_itemMediaType, itemMediaType == objc_msgSend(v9, "itemMediaType"))
    && (itemMediaSubtype = self->_itemMediaSubtype,
        itemMediaSubtype == objc_msgSend(v9, "itemMediaSubtype"))
    && (isAirPlayVideo = self->_isAirPlayVideo, isAirPlayVideo == objc_msgSend(v9, "isAirPlayVideo")))
  {
    isRemoteControl = self->_isRemoteControl;
    v67 = objc_msgSend(v9, "isRemoteControl");
    v68 = v81;
    if (isRemoteControl != v67)
      v68 = 0;
    v13 = v68 & v80 & v79 & v78 & v77 & v76 & v75 & v74 & v73 & v40 & v72 & v46 & v56;
  }
  else
  {
    v13 = 0;
  }

LABEL_110:
  return v13;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (NSString)album
{
  return self->_album;
}

- (NSString)artist
{
  return self->_artist;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)title
{
  return self->_title;
}

- (unsigned)elapsed
{
  return self->_elapsed;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (int)itemMediaType
{
  return self->_itemMediaType;
}

- (int)itemMediaSubtype
{
  return self->_itemMediaSubtype;
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (NSString)iTunesSubscriptionIdentifier
{
  return self->_iTunesSubscriptionIdentifier;
}

- (NSString)iTunesArtistIdentifier
{
  return self->_iTunesArtistIdentifier;
}

- (NSString)iTunesAlbumIdentifier
{
  return self->_iTunesAlbumIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)isAirPlayVideo
{
  return self->_isAirPlayVideo;
}

- (BOOL)isRemoteControl
{
  return self->_isRemoteControl;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesAlbumIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesArtistIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)initWithDKEvent:(uint64_t)a1 outputDevices:iTunesArtistIdentifier:iTunesAlbumIdentifier:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMNowPlayingEvent: unable to convert MRPlaybackState enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBNowPlayingEvent proto", v5, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMNowPlayingEvent: unable to convert BMNowPlayingPlaybackState enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
