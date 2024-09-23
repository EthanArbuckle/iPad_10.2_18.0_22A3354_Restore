@implementation MRNowPlayingState

- (MRNowPlayingState)initWithPlayerPath:(id)a3
{
  id v4;
  MRNowPlayingState *v5;
  uint64_t v6;
  MRPlayerPath *playerPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRNowPlayingState;
  v5 = -[MRNowPlayingState init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    playerPath = v5->_playerPath;
    v5->_playerPath = (MRPlayerPath *)v6;

  }
  return v5;
}

- (MRNowPlayingState)initWithProtobuf:(id)a3
{
  id v4;
  MRPlayerPath *v5;
  void *v6;
  MRPlayerPath *v7;
  MRNowPlayingState *v8;
  void *v9;
  uint64_t v10;
  NSString *displayID;
  void *v12;
  uint64_t v13;
  NSString *displayName;
  void *v15;
  MRPlaybackQueue *v16;
  void *v17;
  uint64_t v18;
  MRPlaybackQueue *playbackQueue;
  MRPlaybackQueueRequest *v20;
  void *v21;
  uint64_t v22;
  MRPlaybackQueueRequest *request;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *supportedCommands;
  unsigned int v28;
  unsigned int v29;
  double v30;
  MRNowPlayingState *v31;

  v4 = a3;
  if (v4)
  {
    v5 = [MRPlayerPath alloc];
    objc_msgSend(v4, "playerPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MRPlayerPath initWithProtobuf:](v5, "initWithProtobuf:", v6);

    v8 = -[MRNowPlayingState initWithPlayerPath:](self, "initWithPlayerPath:", v7);
    if (v8)
    {
      objc_msgSend(v4, "displayID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      displayID = v8->_displayID;
      v8->_displayID = (NSString *)v10;

      objc_msgSend(v4, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      displayName = v8->_displayName;
      v8->_displayName = (NSString *)v13;

      objc_msgSend(v4, "playbackQueueCapabilities");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_playbackQueueCapabilities = _MRPlaybackQueueCapabilitiesFromProto(v15);

      v16 = [MRPlaybackQueue alloc];
      objc_msgSend(v4, "playbackQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[MRPlaybackQueue initWithProtobuf:](v16, "initWithProtobuf:", v17);
      playbackQueue = v8->_playbackQueue;
      v8->_playbackQueue = (MRPlaybackQueue *)v18;

      v20 = [MRPlaybackQueueRequest alloc];
      objc_msgSend(v4, "request");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[MRPlaybackQueueRequest initWithProtobuf:](v20, "initWithProtobuf:", v21);
      request = v8->_request;
      v8->_request = (MRPlaybackQueueRequest *)v22;

      objc_msgSend(v4, "supportedCommands");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "supportedCommands");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "mr_map:", &__block_literal_global_32);
      v26 = objc_claimAutoreleasedReturnValue();
      supportedCommands = v8->_supportedCommands;
      v8->_supportedCommands = (NSArray *)v26;

      v8->_hasPlaybackState = objc_msgSend(v4, "hasPlaybackState");
      v28 = objc_msgSend(v4, "playbackState");
      if (v28 - 1 >= 5)
        v29 = 0;
      else
        v29 = v28;
      v8->_playbackState = v29;
      v8->_hasPlaybackStateTimestamp = objc_msgSend(v4, "hasPlaybackStateTimestamp");
      objc_msgSend(v4, "playbackStateTimestamp");
      v8->_playbackStateTimestamp = v30;
    }
    self = v8;

    v31 = self;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

MRCommandInfo *__38__MRNowPlayingState_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRCommandInfo *v3;

  v2 = a2;
  v3 = -[MRCommandInfo initWithProtobuf:]([MRCommandInfo alloc], "initWithProtobuf:", v2);

  return v3;
}

- (MRNowPlayingState)initWithData:(id)a3
{
  id v4;
  _MRSetStateMessageProtobuf *v5;
  MRNowPlayingState *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRSetStateMessageProtobuf initWithData:]([_MRSetStateMessageProtobuf alloc], "initWithData:", v4);

    self = -[MRNowPlayingState initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)protobufWithEncoding:(int64_t)a3
{
  _MRSetStateMessageProtobuf *v5;
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
  uint64_t v18;
  _MRSupportedCommandsProtobuf *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;

  v5 = objc_alloc_init(_MRSetStateMessageProtobuf);
  -[MRNowPlayingState displayID](self, "displayID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[_MRSetStateMessageProtobuf setDisplayID:](v5, "setDisplayID:", v7);

  -[MRNowPlayingState displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[_MRSetStateMessageProtobuf setDisplayName:](v5, "setDisplayName:", v9);

  _MRPlaybackQueueCapabilitiesCreateProtobuf(-[MRNowPlayingState playbackQueueCapabilities](self, "playbackQueueCapabilities"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSetStateMessageProtobuf setPlaybackQueueCapabilities:](v5, "setPlaybackQueueCapabilities:", v10);

  -[MRNowPlayingState playbackQueue](self, "playbackQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protobufWithEncoding:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSetStateMessageProtobuf setPlaybackQueue:](v5, "setPlaybackQueue:", v12);

  -[MRNowPlayingState playerPath](self, "playerPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "protobuf");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSetStateMessageProtobuf setPlayerPath:](v5, "setPlayerPath:", v14);

  -[MRNowPlayingState request](self, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "protobuf");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSetStateMessageProtobuf setRequest:](v5, "setRequest:", v16);

  -[MRNowPlayingState supportedCommands](self, "supportedCommands");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = objc_alloc_init(_MRSupportedCommandsProtobuf);
    -[MRNowPlayingState supportedCommands](self, "supportedCommands");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mr_map:", &__block_literal_global_7_0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");
    -[_MRSupportedCommandsProtobuf setSupportedCommands:](v19, "setSupportedCommands:", v22);

    -[_MRSetStateMessageProtobuf setSupportedCommands:](v5, "setSupportedCommands:", v19);
  }
  v23 = -[MRNowPlayingState playbackState](self, "playbackState");
  if (v23 - 1 >= 5)
    v24 = 0;
  else
    v24 = v23;
  -[_MRSetStateMessageProtobuf setPlaybackState:](v5, "setPlaybackState:", v24);
  -[_MRSetStateMessageProtobuf setHasPlaybackState:](v5, "setHasPlaybackState:", -[MRNowPlayingState hasPlaybackState](self, "hasPlaybackState"));
  -[MRNowPlayingState playbackStateTimestamp](self, "playbackStateTimestamp");
  -[_MRSetStateMessageProtobuf setPlaybackStateTimestamp:](v5, "setPlaybackStateTimestamp:");
  -[_MRSetStateMessageProtobuf setHasPlaybackStateTimestamp:](v5, "setHasPlaybackStateTimestamp:", -[MRNowPlayingState hasPlaybackStateTimestamp](self, "hasPlaybackStateTimestamp"));
  return v5;
}

uint64_t __42__MRNowPlayingState_protobufWithEncoding___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRNowPlayingState protobufWithEncoding:](self, "protobufWithEncoding:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)containsArtwork
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MRNowPlayingState playbackQueue](self, "playbackQueue", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "artwork");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {

LABEL_13:
          v12 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v8, "artworks");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
          goto LABEL_13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_14:

  return v12;
}

- (id)copyWithoutArtwork
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[MRNowPlayingState copy](self, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v2, "playbackQueue", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setArtwork:", 0);
        objc_msgSend(v9, "setArtworks:", 0);
        objc_msgSend(v9, "setRemoteArtworks:", 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v2;
}

- (NSDictionary)nowPlayingInfo
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[MRNowPlayingState playbackQueue](self, "playbackQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasLocation");

  if (v4)
  {
    -[MRNowPlayingState playbackQueue](self, "playbackQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nowPlayingInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSDictionary *)v6;
}

- (id)dictionaryRepresentation
{
  id v3;
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
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRNowPlayingState nowPlayingInfo](self, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("nowPlayingInfo"));

  -[MRNowPlayingState supportedCommands](self, "supportedCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mr_map:", &__block_literal_global_10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("supportedCommands"));

  -[MRNowPlayingState playbackQueue](self, "playbackQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("playbackQueue"));

  -[MRNowPlayingState displayID](self, "displayID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("displayID"));

  -[MRNowPlayingState displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("displayName"));

  -[MRNowPlayingState playerPath](self, "playerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("playerPath"));

  -[MRNowPlayingState request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("request"));

  v15 = -[MRNowPlayingState playbackState](self, "playbackState") - 1;
  if (v15 > 4)
    v16 = CFSTR("Unknown");
  else
    v16 = off_1E30C8B30[v15];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("playbackState"));
  if (-[MRNowPlayingState hasPlaybackStateTimestamp](self, "hasPlaybackStateTimestamp"))
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[MRNowPlayingState playbackStateTimestamp](self, "playbackStateTimestamp");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("playbackStateTimestamp"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("playbackStateTimestamp"));
  }
  return v3;
}

uint64_t __45__MRNowPlayingState_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (void)setPlaybackState:(unsigned int)a3
{
  self->_playbackState = a3;
  self->_hasPlaybackState = 1;
}

- (void)setPlaybackStateTimestamp:(double)a3
{
  self->_playbackStateTimestamp = a3;
  self->_hasPlaybackStateTimestamp = 1;
}

- (void)setNowPlayingInfo:(id)a3
{
  id v4;
  MRPlaybackQueue *v5;
  MRContentItem *v6;

  v4 = a3;
  v6 = -[MRContentItem initWithNowPlayingInfo:]([MRContentItem alloc], "initWithNowPlayingInfo:", v4);

  v5 = -[MRPlaybackQueue initWithContentItem:]([MRPlaybackQueue alloc], "initWithContentItem:", v6);
  -[MRNowPlayingState setPlaybackQueue:](self, "setPlaybackQueue:", v5);

}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRNowPlayingState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MRNowPlayingState displayID](self, "displayID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDisplayID:", v7);

  -[MRNowPlayingState displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setDisplayName:", v9);

  -[MRNowPlayingState nowPlayingInfo](self, "nowPlayingInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setNowPlayingInfo:", v11);

  objc_msgSend(v5, "setPlaybackQueueCapabilities:", -[MRNowPlayingState playbackQueueCapabilities](self, "playbackQueueCapabilities"));
  -[MRNowPlayingState playbackQueue](self, "playbackQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlaybackQueue:", v13);

  -[MRNowPlayingState playerPath](self, "playerPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlayerPath:", v15);

  -[MRNowPlayingState request](self, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setRequest:", v17);

  -[MRNowPlayingState supportedCommands](self, "supportedCommands");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setSupportedCommands:", v19);

  objc_msgSend(v5, "setPlaybackState:", -[MRNowPlayingState playbackState](self, "playbackState"));
  objc_msgSend(v5, "setHasPlaybackState:", -[MRNowPlayingState hasPlaybackState](self, "hasPlaybackState"));
  -[MRNowPlayingState playbackStateTimestamp](self, "playbackStateTimestamp");
  objc_msgSend(v5, "setPlaybackStateTimestamp:");
  objc_msgSend(v5, "setHasPlaybackStateTimestamp:", -[MRNowPlayingState hasPlaybackStateTimestamp](self, "hasPlaybackStateTimestamp"));
  return v5;
}

- (NSArray)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MRPlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (void)setPlaybackQueue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MRPlaybackQueueRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hasPlaybackState
{
  return self->_hasPlaybackState;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  self->_hasPlaybackState = a3;
}

- (unsigned)playbackState
{
  return self->_playbackState;
}

- (BOOL)hasPlaybackStateTimestamp
{
  return self->_hasPlaybackStateTimestamp;
}

- (void)setHasPlaybackStateTimestamp:(BOOL)a3
{
  self->_hasPlaybackStateTimestamp = a3;
}

- (double)playbackStateTimestamp
{
  return self->_playbackStateTimestamp;
}

- (unint64_t)playbackQueueCapabilities
{
  return self->_playbackQueueCapabilities;
}

- (void)setPlaybackQueueCapabilities:(unint64_t)a3
{
  self->_playbackQueueCapabilities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
}

@end
