@implementation FCHLSPlaylist

- (NSString)description
{
  const __CFString *v3;
  void *v4;
  NSArray *groups;
  NSArray *v6;
  void *v7;
  NSArray *streamInfs;
  NSArray *v9;
  void *v10;
  NSArray *segments;
  NSArray *v12;
  void *v13;
  void *v14;

  if (self)
  {
    if (self->_independentSegments)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("{ independentSegments: %@\n"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    groups = self->_groups;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("{ independentSegments: %@\n"), CFSTR("NO"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    groups = 0;
  }
  if (-[NSArray count](groups, "count"))
  {
    if (self)
      v6 = self->_groups;
    else
      v6 = 0;
    -[NSArray debugDescription](v6, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Groups: %@\n"), v7);

  }
  if (self)
    streamInfs = self->_streamInfs;
  else
    streamInfs = 0;
  if (-[NSArray count](streamInfs, "count"))
  {
    if (self)
      v9 = self->_streamInfs;
    else
      v9 = 0;
    -[NSArray debugDescription](v9, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("SegmentInfs: %@\n"), v10);

  }
  if (self)
    segments = self->_segments;
  else
    segments = 0;
  if (-[NSArray count](segments, "count"))
  {
    if (self)
      v12 = self->_segments;
    else
      v12 = 0;
    -[NSArray debugDescription](v12, "debugDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Segments: %@\n"), v13);

  }
  objc_msgSend(v4, "appendFormat:", CFSTR("}"));
  v14 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v14;
}

void __41__FCHLSPlaylist__parseUsingParser_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCHLSGroup *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  objc_super v15;

  v5 = a3;
  v6 = a2;
  v7 = [FCHLSGroup alloc];
  v8 = v6;
  v9 = v5;
  if (v7
    && (v15.receiver = v7,
        v15.super_class = (Class)FCHLSGroup,
        (v14 = objc_msgSendSuper2(&v15, sel_init)) != 0))
  {
    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)v14[1];
    v14[1] = v10;

    v12 = objc_msgSend(v9, "copy");
    v13 = (void *)v14[2];
    v14[2] = v12;

  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
}

+ (id)playlistParsingData:(_QWORD *)a3 error:
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  FCHLSPlaylist *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  id *v16;
  FCHLSPlaylistState *v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v43;
  void *v44;
  objc_super v45;
  void (*v46)(uint64_t, void *, void *);
  void *v47;
  id v48;
  id v49;

  v4 = a2;
  objc_opt_self();
  v5 = -[FCM3U8Parser initWithData:]([FCM3U8Parser alloc], v4);

  v6 = v5;
  objc_opt_self();
  v7 = [FCHLSPlaylist alloc];
  if (!v7
    || (v45.receiver = v7,
        v45.super_class = (Class)FCHLSPlaylist,
        (v8 = objc_msgSendSuper2(&v45, sel_init)) == 0))
  {
    v9 = 0;
LABEL_17:
    v40 = 0;
    goto LABEL_18;
  }
  v9 = v8;
  v10 = (void *)v8[2];
  v11 = MEMORY[0x1E0C9AA60];
  v8[2] = MEMORY[0x1E0C9AA60];

  v12 = (void *)*((_QWORD *)v9 + 4);
  *((_QWORD *)v9 + 4) = v11;

  objc_storeStrong((id *)v9 + 8, 0);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)v9 + 7);
  *((_QWORD *)v9 + 7) = v13;

  v15 = v6;
  v16 = v15;
  if (v15)
    objc_storeWeak(v15 + 2, v9);
  v17 = objc_alloc_init(FCHLSPlaylistState);
  v18 = (void *)*((_QWORD *)v9 + 6);
  *((_QWORD *)v9 + 6) = v17;

  v49 = 0;
  v19 = -[FCM3U8Parser parseWithError:]((uint64_t)v16, &v49);

  v20 = v49;
  v21 = v20;
  if (!v19)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v20);

    goto LABEL_17;
  }
  v22 = *((id *)v9 + 6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    v24 = (void *)*((_QWORD *)v22 + 1);
  else
    v24 = 0;
  v45.receiver = (id)MEMORY[0x1E0C809B0];
  v45.super_class = (Class)3221225472;
  v46 = __41__FCHLSPlaylist__parseUsingParser_error___block_invoke;
  v47 = &unk_1E4644608;
  v25 = v23;
  v48 = v25;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", &v45);
  v26 = objc_msgSend(v25, "copy");
  v27 = (void *)*((_QWORD *)v9 + 2);
  *((_QWORD *)v9 + 2) = v26;

  if (v22)
  {
    v28 = *((id *)v22 + 6);
    v29 = objc_msgSend(v28, "copy");
    v30 = (void *)*((_QWORD *)v9 + 3);
    *((_QWORD *)v9 + 3) = v29;

    v31 = (void *)*((_QWORD *)v22 + 4);
  }
  else
  {
    v43 = objc_msgSend(0, "copy");
    v44 = (void *)*((_QWORD *)v9 + 3);
    *((_QWORD *)v9 + 3) = v43;

    v31 = 0;
  }
  v32 = v31;
  v33 = objc_msgSend(v32, "copy");
  v34 = (void *)*((_QWORD *)v9 + 4);
  *((_QWORD *)v9 + 4) = v33;

  if (v22)
    v35 = (void *)*((_QWORD *)v22 + 8);
  else
    v35 = 0;
  v36 = v35;
  v37 = objc_msgSend(v36, "copy");
  v38 = (void *)*((_QWORD *)v9 + 5);
  *((_QWORD *)v9 + 5) = v37;

  v39 = (void *)*((_QWORD *)v9 + 6);
  *((_QWORD *)v9 + 6) = 0;

  v40 = v9;
LABEL_18:

  v41 = v40;
  return v41;
}

- (void)parser:(id)a3 lineIsURL:(id)a4
{
  FCHLSPlaylistState *v6;
  uint64_t v7;
  FCHLSStreamInf *currentStreamInf;
  FCHLSSegment *v9;
  void *v10;
  double v11;
  id v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  FCHLSPlaylist *v18;
  id v19;
  objc_super v20;

  v19 = a4;
  if (!self || (v6 = self->_state) == 0)
  {
    v9 = [FCHLSSegment alloc];
    v7 = 0;
    v12 = 0;
    v14 = 0;
    v11 = 0.0;
    v13 = 1;
LABEL_7:
    v15 = v19;
    v16 = v12;
    v17 = v14;
    if (v9)
    {
      v20.receiver = v9;
      v20.super_class = (Class)FCHLSSegment;
      v18 = -[FCHLSPlaylist init](&v20, sel_init);
      v9 = (FCHLSSegment *)v18;
      if (v18)
      {
        objc_storeStrong((id *)&v18->_groups, a4);
        v9->_duration = v11;
        objc_storeStrong((id *)&v9->_map, v12);
        objc_storeStrong((id *)&v9->_key, v14);
      }
    }

    if ((v13 & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      *(_QWORD *)(v7 + 24) = 0xBFF0000000000000;
      v10 = *(void **)(v7 + 32);
    }
    goto LABEL_12;
  }
  v7 = (uint64_t)v6;
  currentStreamInf = v6->_currentStreamInf;
  if (currentStreamInf)
  {
    v9 = currentStreamInf;
    -[FCHLSPlaylistState setCurrentStreamInf:](v7, 0);
    objc_storeStrong((id *)&v9->_map, a4);
    v10 = *(void **)(v7 + 48);
LABEL_12:
    objc_msgSend(v10, "addObject:", v9);

    goto LABEL_13;
  }
  if (v6->_currentDuration != -1.0)
  {
    v9 = [FCHLSSegment alloc];
    v11 = *(double *)(v7 + 24);
    v12 = *(id *)(v7 + 16);
    v13 = 0;
    v14 = *(void **)(v7 + 56);
    goto LABEL_7;
  }
LABEL_13:

}

- (void)parser:(id)a3 lineIsTag:(id)a4 value:(id)a5 attributeList:(id)a6
{
  id v9;
  id v10;
  FCHLSPlaylistState *state;
  FCHLSPlaylistState *v12;
  FCHLSMap *v13;
  FCHLSMedia *v14;
  id v15;
  uint64_t v16;
  NSString *type;
  uint64_t v18;
  NSURL *url;
  uint64_t v20;
  NSString *name;
  NSMutableDictionary *mutableGroups;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  uint64_t v26;
  NSURL *v27;
  void *v28;
  double v29;
  double v30;
  FCHLSKey *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *mutableSessionData;
  void *v37;
  uint64_t v38;
  NSURL *v39;
  uint64_t v40;
  NSString *keyFormat;
  uint64_t v42;
  NSString *keyFormatVersions;
  uint64_t v44;
  NSString *iv;
  id v46;

  v46 = a4;
  v9 = a5;
  v10 = a6;
  if (self)
    state = self->_state;
  else
    state = 0;
  v12 = state;
  if (objc_msgSend(v46, "isEqualToString:", CFSTR("#EXT-X-MEDIA")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("GROUP-ID"));
    v13 = (FCHLSMap *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(FCHLSMedia);
    if (v14)
    {
      v15 = v10;
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("TYPE"));
      v16 = objc_claimAutoreleasedReturnValue();
      type = v14->_type;
      v14->_type = (NSString *)v16;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("URI"));
      v18 = objc_claimAutoreleasedReturnValue();
      url = v14->_url;
      v14->_url = (NSURL *)v18;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NAME"));
      v20 = objc_claimAutoreleasedReturnValue();

      name = v14->_name;
      v14->_name = (NSString *)v20;

    }
    if (v12)
      mutableGroups = v12->_mutableGroups;
    else
      mutableGroups = 0;
    -[NSMutableDictionary objectForKeyedSubscript:](mutableGroups, "objectForKeyedSubscript:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v24 = v12->_mutableGroups;
      else
        v24 = 0;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v23, v13);
    }
    objc_msgSend(v23, "addObject:", v14);

LABEL_13:
LABEL_22:

    goto LABEL_23;
  }
  if (objc_msgSend(v46, "isEqualToString:", CFSTR("#EXT-X-MAP")))
  {
    v13 = objc_alloc_init(FCHLSMap);
    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("URI"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v13->_url;
      v13->_url = (NSURL *)v26;

    }
    if (v12)
      objc_storeStrong((id *)&v12->_currentMap, v13);
    goto LABEL_22;
  }
  if (objc_msgSend(v46, "isEqualToString:", CFSTR("#EXTINF")))
  {
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(","));
    v13 = (FCHLSMap *)objc_claimAutoreleasedReturnValue();
    -[FCHLSMap objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    if (v12)
      v12->_currentDuration = v30;
    goto LABEL_22;
  }
  if (objc_msgSend(v46, "isEqualToString:", CFSTR("#EXT-X-INDEPENDENT-SEGMENTS")))
  {
    if (self)
      self->_independentSegments = 1;
    goto LABEL_23;
  }
  if (objc_msgSend(v46, "isEqualToString:", CFSTR("#EXT-X-KEY")))
  {
    v31 = objc_alloc_init(FCHLSKey);
    if (!v31)
    {
LABEL_47:

      goto LABEL_23;
    }
    v32 = v10;
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("METHOD"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("NONE"), "isEqualToString:", v33))
    {
      v34 = 1;
    }
    else if (objc_msgSend(CFSTR("AES-128"), "isEqualToString:", v33))
    {
      v34 = 2;
    }
    else
    {
      if (!objc_msgSend(CFSTR("SAMPLE-AES"), "isEqualToString:", v33))
      {
        v31->_method = 0;
LABEL_45:
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("URI"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v37);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v31->_url;
        v31->_url = (NSURL *)v38;

        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("KEYFORMAT"));
        v40 = objc_claimAutoreleasedReturnValue();
        keyFormat = v31->_keyFormat;
        v31->_keyFormat = (NSString *)v40;

        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("KEYFORMATVERSIONS"));
        v42 = objc_claimAutoreleasedReturnValue();
        keyFormatVersions = v31->_keyFormatVersions;
        v31->_keyFormatVersions = (NSString *)v42;

        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("IV"));
        v44 = objc_claimAutoreleasedReturnValue();

        iv = v31->_iv;
        v31->_iv = (NSString *)v44;

        if (-[NSString isEqualToString:](v31->_keyFormat, "isEqualToString:", CFSTR("com.apple.streamingkeydelivery")))
        {
          -[FCPurchaseLookupResult setIntroOffer:]((uint64_t)v12, v31);
          -[NSMutableSet addObject:](self->_uniqueKeys, "addObject:", v31);
        }
        goto LABEL_47;
      }
      v34 = 3;
    }
    v31->_method = v34;
    goto LABEL_45;
  }
  if (objc_msgSend(v46, "isEqualToString:", CFSTR("#EXT-X-STREAM-INF")))
  {
    v13 = objc_alloc_init(FCHLSStreamInf);
    -[FCHLSStreamInf setPropertiesFromAttributeList:](v13, v10);
    -[FCHLSPlaylistState setCurrentStreamInf:]((uint64_t)v12, v13);
    goto LABEL_22;
  }
  if ((objc_msgSend(v46, "isEqualToString:", CFSTR("#EXT-X-BITRATE")) & 1) == 0
    && objc_msgSend(v46, "isEqualToString:", CFSTR("#EXT-X-SESSION-DATA")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DATA-ID"));
    v13 = (FCHLSMap *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VALUE"));
    v35 = objc_claimAutoreleasedReturnValue();
    v14 = (FCHLSMedia *)v35;
    if (v13 && v35)
    {
      if (v12)
        mutableSessionData = v12->_mutableSessionData;
      else
        mutableSessionData = 0;
      -[NSMutableDictionary setObject:forKey:](mutableSessionData, "setObject:forKey:", v14, v13);
    }
    goto LABEL_13;
  }
LABEL_23:

}

- (BOOL)parserShouldCollectLine:(id)a3
{
  FCHLSPlaylistState *v4;
  FCHLSStreamInf *currentStreamInf;
  NSArray *v6;
  void *v7;
  FCHLSPlaylistState *v8;
  FCHLSPlaylistState *v9;
  FCHLSStreamInf *v10;
  FCHLSStreamInf *v11;
  unint64_t averageBandwidth;
  void *v13;
  char v14;

  if (!self || (v4 = self->_state) == 0)
  {
    v6 = 0;
    v14 = 1;
    goto LABEL_9;
  }
  currentStreamInf = v4->_currentStreamInf;

  if (!currentStreamInf)
    return 1;
  v6 = self->_requestedBitrates;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = self->_state;
  v9 = v8;
  if (v8)
  {
    v10 = v8->_currentStreamInf;
    v11 = v10;
    if (v10)
    {
      averageBandwidth = v10->_averageBandwidth;
      if (!averageBandwidth)
        averageBandwidth = v10->_bandwidth;
      goto LABEL_8;
    }
  }
  else
  {
    v11 = 0;
  }
  averageBandwidth = 0;
LABEL_8:
  objc_msgSend(v7, "numberWithUnsignedLongLong:", averageBandwidth);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSArray containsObject:](v6, "containsObject:", v13);

LABEL_9:
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedBitrates, 0);
  objc_storeStrong((id *)&self->_uniqueKeys, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_streamInfs, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end
