@implementation BLHLSPlaylist

- (BLHLSPlaylist)initWithRequestedBitrates:(id)a3
{
  id v5;
  BLHLSPlaylist *v6;
  BLHLSPlaylist *v7;
  NSArray *groups;
  NSArray *v9;
  NSArray *segments;
  uint64_t v11;
  NSMutableSet *uniqueKeys;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLHLSPlaylist;
  v6 = -[BLHLSPlaylist init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    groups = v6->_groups;
    v9 = (NSArray *)MEMORY[0x24BDBD1A8];
    v6->_groups = (NSArray *)MEMORY[0x24BDBD1A8];

    segments = v7->_segments;
    v7->_segments = v9;

    objc_storeStrong((id *)&v7->_requestedBitrates, a3);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    uniqueKeys = v7->_uniqueKeys;
    v7->_uniqueKeys = (NSMutableSet *)v11;

  }
  return v7;
}

- (NSString)description
{
  void *v3;
  _BOOL4 v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = -[BLHLSPlaylist independentSegments](self, "independentSegments");
  v5 = CFSTR("NO");
  if (v4)
    v5 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ independentSegments: %@\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLHLSPlaylist groups](self, "groups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[BLHLSPlaylist groups](self, "groups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Groups: %@\n"), v10);

  }
  -[BLHLSPlaylist streamInfs](self, "streamInfs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[BLHLSPlaylist streamInfs](self, "streamInfs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("SegmentInfs: %@\n"), v14);

  }
  -[BLHLSPlaylist segments](self, "segments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[BLHLSPlaylist segments](self, "segments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "debugDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Segments: %@\n"), v18);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR("}"));
  v19 = (void *)objc_msgSend(v6, "copy");

  return (NSString *)v19;
}

- (NSSet)keys
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_uniqueKeys, "copy");
}

+ (BOOL)rewritePlaylistData:(id)a3 toURL:(id)a4 requestedBitrates:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BLM3U8Parser *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[BLM3U8Parser initWithData:]([BLM3U8Parser alloc], "initWithData:", v12);

  LOBYTE(a6) = objc_msgSend(a1, "_rewritePlaylistWithParser:toURL:requestedBitrates:error:", v13, v11, v10, a6);
  return (char)a6;
}

+ (BOOL)rewritePlaylistURL:(id)a3 toURL:(id)a4 requestedBitrates:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BLM3U8Parser *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[BLM3U8Parser initWithURL:]([BLM3U8Parser alloc], "initWithURL:", v12);

  LOBYTE(a6) = objc_msgSend(a1, "_rewritePlaylistWithParser:toURL:requestedBitrates:error:", v13, v11, v10, a6);
  return (char)a6;
}

+ (BOOL)_rewritePlaylistWithParser:(id)a3 toURL:(id)a4 requestedBitrates:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "setCollectForRewrite:", 1);
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestedBitrates:", v12);

  if (objc_msgSend(v13, "_parseUsingParser:error:", v10, a6))
    v14 = objc_msgSend(v10, "rewriteWithURL:", v11);
  else
    v14 = 0;

  return v14;
}

- (BOOL)_parseUsingParser:(id)a3 error:(id *)a4
{
  id v6;
  BLHLSPlaylistState *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id v26;

  v6 = a3;
  objc_msgSend(v6, "setDelegate:", self);
  v7 = objc_alloc_init(BLHLSPlaylistState);
  -[BLHLSPlaylist setState:](self, "setState:", v7);

  v26 = 0;
  v8 = objc_msgSend(v6, "parseWithError:", &v26);

  v9 = v26;
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    -[BLHLSPlaylist state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mutableGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = sub_212C89F9C;
    v24 = &unk_24CE8B348;
    v25 = v12;
    v14 = v12;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v21);

    v15 = (void *)objc_msgSend(v14, "copy", v21, v22, v23, v24);
    -[BLHLSPlaylist setGroups:](self, "setGroups:", v15);

    objc_msgSend(v11, "mutableStreamInfs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    -[BLHLSPlaylist setStreamInfs:](self, "setStreamInfs:", v17);

    objc_msgSend(v11, "mutableSegments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    -[BLHLSPlaylist setSegments:](self, "setSegments:", v19);

    -[BLHLSPlaylist setState:](self, "setState:", 0);
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

+ (id)_playlistUsingParser:(id)a3 ignoreSegments:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestedBitrates:", 0);
  objc_msgSend(v9, "setIgnoreSegments:", v6);
  LODWORD(a5) = objc_msgSend(v9, "_parseUsingParser:error:", v8, a5);

  if ((_DWORD)a5)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

+ (id)playlistParsingData:(id)a3 error:(id *)a4
{
  id v6;
  BLM3U8Parser *v7;
  void *v8;

  v6 = a3;
  v7 = -[BLM3U8Parser initWithData:]([BLM3U8Parser alloc], "initWithData:", v6);

  objc_msgSend(a1, "_playlistUsingParser:ignoreSegments:error:", v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)playlistParsingURL:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](a1, sel_playlistParsingURL_ignoreSegments_error_);
}

+ (id)playlistParsingURL:(id)a3 ignoreSegments:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  BLM3U8Parser *v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  v9 = -[BLM3U8Parser initWithURL:]([BLM3U8Parser alloc], "initWithURL:", v8);

  objc_msgSend(a1, "_playlistUsingParser:ignoreSegments:error:", v9, v6, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)parser:(id)a3 lineIsURL:(id)a4
{
  void *v5;
  void *v6;
  BLHLSSegment *v7;
  void *v8;
  void *v9;
  double v10;
  BLHLSSegment *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  -[BLHLSPlaylist state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStreamInf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "currentStreamInf");
    v7 = (BLHLSSegment *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCurrentStreamInf:", 0);
    -[BLHLSSegment setUrl:](v7, "setUrl:", v16);
    objc_msgSend(v5, "mutableStreamInfs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = v8;
    objc_msgSend(v8, "addObject:", v7);

    goto LABEL_4;
  }
  if (!-[BLHLSPlaylist ignoreSegments](self, "ignoreSegments"))
  {
    objc_msgSend(v5, "currentDuration");
    if (v10 != -1.0)
    {
      v11 = [BLHLSSegment alloc];
      objc_msgSend(v5, "currentDuration");
      v13 = v12;
      objc_msgSend(v5, "currentMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[BLHLSSegment initWithURL:duration:map:key:](v11, "initWithURL:duration:map:key:", v16, v14, v15, v13);

      objc_msgSend(v5, "setCurrentDuration:", -1.0);
      objc_msgSend(v5, "mutableSegments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
LABEL_4:

}

- (void)parser:(id)a3 lineIsTag:(id)a4 value:(id)a5 attributeList:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BLHLSStreamInf *v13;
  BLHLSMedia *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  BLHLSKey *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[BLHLSPlaylist state](self, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("#EXT-X-MEDIA")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GROUP-ID"));
    v13 = (BLHLSStreamInf *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(BLHLSMedia);
    -[BLHLSMedia setPropertiesFromAttributeList:](v14, "setPropertiesFromAttributeList:", v11);
    objc_msgSend(v12, "mutableGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mutableGroups");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v13);

    }
    objc_msgSend(v16, "addObject:", v14);

    goto LABEL_9;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("#EXT-X-MAP")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("#EXTINF")))
    {
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
      v13 = (BLHLSStreamInf *)objc_claimAutoreleasedReturnValue();
      -[BLHLSStreamInf objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      objc_msgSend(v12, "setCurrentDuration:", v20);
      goto LABEL_9;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("#EXT-X-INDEPENDENT-SEGMENTS")))
    {
      -[BLHLSPlaylist setIndependentSegments:](self, "setIndependentSegments:", 1);
      goto LABEL_10;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("#EXT-X-KEY")))
    {
      v21 = objc_alloc_init(BLHLSKey);
      -[BLHLSKey setPropertiesFromAttributeList:](v21, "setPropertiesFromAttributeList:", v11);
      if (-[BLHLSKey isFormatSupported](v21, "isFormatSupported"))
      {
        objc_msgSend(v12, "setCurrentKey:", v21);
        -[NSMutableSet addObject:](self->_uniqueKeys, "addObject:", v21);
LABEL_27:

        goto LABEL_10;
      }
      BLDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        -[BLHLSKey keyFormat](v21, "keyFormat");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v23;
        _os_log_impl(&dword_212C78000, v22, OS_LOG_TYPE_DEBUG, "Dropping unsupported key format %{public}@", (uint8_t *)&v27, 0xCu);

      }
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("#EXT-X-STREAM-INF")))
      {
        v13 = objc_alloc_init(BLHLSStreamInf);
        -[BLHLSStreamInf setPropertiesFromAttributeList:](v13, "setPropertiesFromAttributeList:", v11);
        objc_msgSend(v12, "setCurrentStreamInf:", v13);
        goto LABEL_9;
      }
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("#EXT-X-SESSION-DATA"))
        || (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DATA-ID")),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.audiobook.rapguid")),
            v24,
            !v25))
      {
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("#EXT-X-BITRATE")) & 1) != 0)
          goto LABEL_10;
        BLDefaultLog();
        v13 = (BLHLSStreamInf *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEBUG))
        {
          v27 = 138412290;
          v28 = v9;
          _os_log_impl(&dword_212C78000, &v13->super, OS_LOG_TYPE_DEBUG, "Ignoring tag %@", (uint8_t *)&v27, 0xCu);
        }
        goto LABEL_9;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VALUE"));
      v21 = (BLHLSKey *)objc_claimAutoreleasedReturnValue();
      if (-[BLHLSKey length](v21, "length"))
      {
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v21);
        -[BLHLSPlaylist setRacGUID:](self, "setRacGUID:", v26);

      }
      BLDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138412290;
        v28 = v11;
        _os_log_impl(&dword_212C78000, v22, OS_LOG_TYPE_DEFAULT, "Found rapguid attribute: %@", (uint8_t *)&v27, 0xCu);
      }
    }

    goto LABEL_27;
  }
  v13 = objc_alloc_init(BLHLSMap);
  -[BLHLSStreamInf setPropertiesFromAttributeList:](v13, "setPropertiesFromAttributeList:", v11);
  objc_msgSend(v12, "setCurrentMap:", v13);
LABEL_9:

LABEL_10:
}

- (BOOL)parserShouldCollectLine:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  -[BLHLSPlaylist state](self, "state", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStreamInf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  -[BLHLSPlaylist requestedBitrates](self, "requestedBitrates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[BLHLSPlaylist state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentStreamInf");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedLongLong:", objc_msgSend(v9, "averageBandwidthFallbackToPeak"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "containsObject:", v10);

  return v11;
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (NSArray)streamInfs
{
  return self->_streamInfs;
}

- (void)setStreamInfs:(id)a3
{
  objc_storeStrong((id *)&self->_streamInfs, a3);
}

- (BOOL)independentSegments
{
  return self->_independentSegments;
}

- (void)setIndependentSegments:(BOOL)a3
{
  self->_independentSegments = a3;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (BOOL)ignoreSegments
{
  return self->_ignoreSegments;
}

- (void)setIgnoreSegments:(BOOL)a3
{
  self->_ignoreSegments = a3;
}

- (NSUUID)racGUID
{
  return self->_racGUID;
}

- (void)setRacGUID:(id)a3
{
  objc_storeStrong((id *)&self->_racGUID, a3);
}

- (BLHLSPlaylistState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSMutableSet)uniqueKeys
{
  return self->_uniqueKeys;
}

- (void)setUniqueKeys:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueKeys, a3);
}

- (NSArray)requestedBitrates
{
  return self->_requestedBitrates;
}

- (void)setRequestedBitrates:(id)a3
{
  objc_storeStrong((id *)&self->_requestedBitrates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedBitrates, 0);
  objc_storeStrong((id *)&self->_uniqueKeys, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_racGUID, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_streamInfs, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end
