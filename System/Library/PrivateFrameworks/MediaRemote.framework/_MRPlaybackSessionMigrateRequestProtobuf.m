@implementation _MRPlaybackSessionMigrateRequestProtobuf

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (int)playerOptions
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_playerOptions;
  else
    return 0;
}

- (void)setPlayerOptions:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_playerOptions = a3;
}

- (void)setHasPlayerOptions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPlayerOptions
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)playerOptionsAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("None");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("RestoreDestinationPlaybackState");
      return v3;
    case 2:
      return CFSTR("PlayDestination");
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 4:
      return CFSTR("PauseSource");
    case 8:
      return CFSTR("RestorePlaybackPosition");
    default:
      if (a3 == 16)
        return CFSTR("RestorePlaybackRate");
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsPlayerOptions:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RestoreDestinationPlaybackState")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlayDestination")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PauseSource")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RestorePlaybackPosition")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RestorePlaybackRate")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)endpointOptions
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_endpointOptions;
  else
    return 0;
}

- (void)setEndpointOptions:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_endpointOptions = a3;
}

- (void)setHasEndpointOptions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndpointOptions
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)endpointOptionsAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 9 && ((0x117u >> a3) & 1) != 0)
  {
    v3 = off_1E30CD0C0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsEndpointOptions:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpdateActiveEndpoint")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FallbackToAddOutputDevices")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AllowMigrateToGroup")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AllowMigrateFromGroup")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearEvents
{
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");
}

- (void)addEvents:(id)a3
{
  id v4;
  NSMutableArray *events;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  events = self->_events;
  v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_events;
    self->_events = v6;

    v4 = v8;
    events = self->_events;
  }
  -[NSMutableArray addObject:](events, "addObject:", v4);

}

- (unint64_t)eventsCount
{
  return -[NSMutableArray count](self->_events, "count");
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", a3);
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

- (void)setPlaybackPosition:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_playbackPosition = a3;
}

- (void)setHasPlaybackPosition:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaybackPosition
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasContentItem
{
  return self->_contentItem != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (int)playbackState
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_playbackState;
  else
    return 0;
}

- (void)setPlaybackState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_playbackState = a3;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPlaybackState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)playbackStateAsString:(int)a3
{
  if (a3 < 6)
    return off_1E30CD108[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaybackState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Playing")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Paused")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stopped")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Interrupted")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Seeking")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPlaybackRate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_playbackRate = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlaybackRate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasPlaybackSessionRequest
{
  return self->_playbackSessionRequest != 0;
}

- (void)setAllowFadeTransition:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_allowFadeTransition = a3;
}

- (void)setHasAllowFadeTransition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasAllowFadeTransition
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setOriginatorType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_originatorType = a3;
}

- (void)setHasOriginatorType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOriginatorType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDestinationTypes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_destinationTypes = a3;
}

- (void)setHasDestinationTypes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDestinationTypes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasInitiator
{
  return self->_initiator != 0;
}

- (BOOL)hasResolvedPlayerPath
{
  return self->_resolvedPlayerPath != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackSessionMigrateRequestProtobuf;
  -[_MRPlaybackSessionMigrateRequestProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionMigrateRequestProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestID;
  char has;
  int playerOptions;
  __CFString *v8;
  uint64_t endpointOptions;
  __CFString *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  _MRContentItemProtobuf *contentItem;
  void *v20;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v22;
  char v23;
  uint64_t playbackState;
  __CFString *v25;
  void *v26;
  _MRPlaybackSessionRequestProtobuf *playbackSessionRequest;
  void *v28;
  $2BD43C258D2BC111BAE16AB7AD328F7E v29;
  void *v30;
  void *v31;
  NSString *initiator;
  _MRNowPlayingPlayerPathProtobuf *resolvedPlayerPath;
  void *v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v3, "setObject:forKey:", requestID, CFSTR("requestID"));
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    playerOptions = self->_playerOptions;
    v8 = CFSTR("None");
    switch(playerOptions)
    {
      case 0:
        break;
      case 1:
        v8 = CFSTR("RestoreDestinationPlaybackState");
        break;
      case 2:
        v8 = CFSTR("PlayDestination");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_8;
      case 4:
        v8 = CFSTR("PauseSource");
        break;
      case 8:
        v8 = CFSTR("RestorePlaybackPosition");
        break;
      default:
        if (playerOptions == 16)
        {
          v8 = CFSTR("RestorePlaybackRate");
        }
        else
        {
LABEL_8:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_playerOptions);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("playerOptions"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    endpointOptions = self->_endpointOptions;
    if (endpointOptions < 9 && ((0x117u >> endpointOptions) & 1) != 0)
    {
      v10 = off_1E30CD0C0[endpointOptions];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_endpointOptions);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("endpointOptions"));

  }
  if (-[NSMutableArray count](self->_events, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v12 = self->_events;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("events"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_playbackPosition);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("playbackPosition"));

  }
  contentItem = self->_contentItem;
  if (contentItem)
  {
    -[_MRContentItemProtobuf dictionaryRepresentation](contentItem, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("contentItem"));

  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("playerPath"));

  }
  v23 = (char)self->_has;
  if ((v23 & 0x20) != 0)
  {
    playbackState = self->_playbackState;
    if (playbackState >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_playbackState);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E30CD108[playbackState];
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("playbackState"));

    v23 = (char)self->_has;
  }
  if ((v23 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_playbackRate);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("playbackRate"));

  }
  playbackSessionRequest = self->_playbackSessionRequest;
  if (playbackSessionRequest)
  {
    -[_MRPlaybackSessionRequestProtobuf dictionaryRepresentation](playbackSessionRequest, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("playbackSessionRequest"));

  }
  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v29 & 0x10) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowFadeTransition);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("allowFadeTransition"));

  *(_BYTE *)&v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x10) != 0)
  {
LABEL_45:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_originatorType);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("originatorType"));

    *(_BYTE *)&v29 = self->_has;
  }
LABEL_46:
  if ((*(_BYTE *)&v29 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_destinationTypes);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("destinationTypes"));

  }
  initiator = self->_initiator;
  if (initiator)
    objc_msgSend(v4, "setObject:forKey:", initiator, CFSTR("initiator"));
  resolvedPlayerPath = self->_resolvedPlayerPath;
  if (resolvedPlayerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](resolvedPlayerPath, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("resolvedPlayerPath"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionMigrateRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  $2BD43C258D2BC111BAE16AB7AD328F7E v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_requestID)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteInt32Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_events;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_contentItem)
    PBDataWriterWriteSubmessage();
  if (self->_playerPath)
    PBDataWriterWriteSubmessage();
  v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_playbackSessionRequest)
    PBDataWriterWriteSubmessage();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v12 & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  PBDataWriterWriteBOOLField();
  *(_BYTE *)&v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x10) != 0)
  {
LABEL_28:
    PBDataWriterWriteUint32Field();
    *(_BYTE *)&v12 = self->_has;
  }
LABEL_29:
  if ((*(_BYTE *)&v12 & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_initiator)
    PBDataWriterWriteStringField();
  if (self->_resolvedPlayerPath)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;
  char v11;
  $2BD43C258D2BC111BAE16AB7AD328F7E v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (self->_requestID)
  {
    objc_msgSend(v4, "setRequestID:");
    v4 = v13;
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_playerOptions;
    *((_BYTE *)v4 + 108) |= 0x40u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_endpointOptions;
    *((_BYTE *)v4 + 108) |= 8u;
  }
  if (-[_MRPlaybackSessionMigrateRequestProtobuf eventsCount](self, "eventsCount"))
  {
    objc_msgSend(v13, "clearEvents");
    v6 = -[_MRPlaybackSessionMigrateRequestProtobuf eventsCount](self, "eventsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[_MRPlaybackSessionMigrateRequestProtobuf eventsAtIndex:](self, "eventsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addEvents:", v9);

      }
    }
  }
  v10 = v13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v13 + 1) = *(_QWORD *)&self->_playbackPosition;
    *((_BYTE *)v13 + 108) |= 1u;
  }
  if (self->_contentItem)
  {
    objc_msgSend(v13, "setContentItem:");
    v10 = v13;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v13, "setPlayerPath:");
    v10 = v13;
  }
  v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    v10[18] = self->_playbackState;
    *((_BYTE *)v10 + 108) |= 0x20u;
    v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    *((_QWORD *)v10 + 2) = *(_QWORD *)&self->_playbackRate;
    *((_BYTE *)v10 + 108) |= 2u;
  }
  if (self->_playbackSessionRequest)
  {
    objc_msgSend(v13, "setPlaybackSessionRequest:");
    v10 = v13;
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v12 & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
  *((_BYTE *)v10 + 104) = self->_allowFadeTransition;
  *((_BYTE *)v10 + 108) |= 0x80u;
  *(_BYTE *)&v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x10) != 0)
  {
LABEL_25:
    v10[14] = self->_originatorType;
    *((_BYTE *)v10 + 108) |= 0x10u;
    *(_BYTE *)&v12 = self->_has;
  }
LABEL_26:
  if ((*(_BYTE *)&v12 & 4) != 0)
  {
    v10[8] = self->_destinationTypes;
    *((_BYTE *)v10 + 108) |= 4u;
  }
  if (self->_initiator)
  {
    objc_msgSend(v13, "setInitiator:");
    v10 = v13;
  }
  if (self->_resolvedPlayerPath)
  {
    objc_msgSend(v13, "setResolvedPlayerPath:");
    v10 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  $2BD43C258D2BC111BAE16AB7AD328F7E v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_playerOptions;
    *(_BYTE *)(v5 + 108) |= 0x40u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_endpointOptions;
    *(_BYTE *)(v5 + 108) |= 8u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = self->_events;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v5, "addEvents:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_playbackPosition;
    *(_BYTE *)(v5 + 108) |= 1u;
  }
  v15 = -[_MRContentItemProtobuf copyWithZone:](self->_contentItem, "copyWithZone:", a3, (_QWORD)v28);
  v16 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v15;

  v17 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v17;

  v19 = (char)self->_has;
  if ((v19 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_playbackState;
    *(_BYTE *)(v5 + 108) |= 0x20u;
    v19 = (char)self->_has;
  }
  if ((v19 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_playbackRate;
    *(_BYTE *)(v5 + 108) |= 2u;
  }
  v20 = -[_MRPlaybackSessionRequestProtobuf copyWithZone:](self->_playbackSessionRequest, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v22 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  *(_BYTE *)(v5 + 104) = self->_allowFadeTransition;
  *(_BYTE *)(v5 + 108) |= 0x80u;
  *(_BYTE *)&v22 = self->_has;
  if ((*(_BYTE *)&v22 & 0x10) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 56) = self->_originatorType;
    *(_BYTE *)(v5 + 108) |= 0x10u;
    *(_BYTE *)&v22 = self->_has;
  }
LABEL_21:
  if ((*(_BYTE *)&v22 & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_destinationTypes;
    *(_BYTE *)(v5 + 108) |= 4u;
  }
  v23 = -[NSString copyWithZone:](self->_initiator, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v23;

  v25 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_resolvedPlayerPath, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v25;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestID;
  char has;
  NSMutableArray *events;
  _MRContentItemProtobuf *contentItem;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  char v10;
  _MRPlaybackSessionRequestProtobuf *playbackSessionRequest;
  NSString *initiator;
  _MRNowPlayingPlayerPathProtobuf *resolvedPlayerPath;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_60;
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:"))
      goto LABEL_60;
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x40) == 0 || self->_playerOptions != *((_DWORD *)v4 + 19))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x40) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 8) == 0 || self->_endpointOptions != *((_DWORD *)v4 + 9))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 108) & 8) != 0)
  {
    goto LABEL_60;
  }
  events = self->_events;
  if ((unint64_t)events | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](events, "isEqual:"))
      goto LABEL_60;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_playbackPosition != *((double *)v4 + 1))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    goto LABEL_60;
  }
  contentItem = self->_contentItem;
  if ((unint64_t)contentItem | *((_QWORD *)v4 + 3)
    && !-[_MRContentItemProtobuf isEqual:](contentItem, "isEqual:"))
  {
    goto LABEL_60;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((_QWORD *)v4 + 10))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:"))
      goto LABEL_60;
  }
  v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x20) == 0 || self->_playbackState != *((_DWORD *)v4 + 18))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_playbackRate != *((double *)v4 + 2))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_60;
  }
  playbackSessionRequest = self->_playbackSessionRequest;
  if ((unint64_t)playbackSessionRequest | *((_QWORD *)v4 + 8))
  {
    if (!-[_MRPlaybackSessionRequestProtobuf isEqual:](playbackSessionRequest, "isEqual:"))
      goto LABEL_60;
    v10 = (char)self->_has;
  }
  if ((v10 & 0x80) == 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x80) == 0)
      goto LABEL_41;
LABEL_60:
    v14 = 0;
    goto LABEL_61;
  }
  if ((*((_BYTE *)v4 + 108) & 0x80) == 0)
    goto LABEL_60;
  if (self->_allowFadeTransition)
  {
    if (!*((_BYTE *)v4 + 104))
      goto LABEL_60;
  }
  else if (*((_BYTE *)v4 + 104))
  {
    goto LABEL_60;
  }
LABEL_41:
  if ((v10 & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x10) == 0 || self->_originatorType != *((_DWORD *)v4 + 14))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((v10 & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 4) == 0 || self->_destinationTypes != *((_DWORD *)v4 + 8))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 108) & 4) != 0)
  {
    goto LABEL_60;
  }
  initiator = self->_initiator;
  if ((unint64_t)initiator | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](initiator, "isEqual:"))
    goto LABEL_60;
  resolvedPlayerPath = self->_resolvedPlayerPath;
  if ((unint64_t)resolvedPlayerPath | *((_QWORD *)v4 + 12))
    v14 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](resolvedPlayerPath, "isEqual:");
  else
    v14 = 1;
LABEL_61:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double playbackPosition;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double playbackRate;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v25;
  uint64_t v26;
  NSUInteger v27;

  v27 = -[NSString hash](self->_requestID, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v25 = 2654435761 * self->_playerOptions;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v25 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_endpointOptions;
      goto LABEL_6;
    }
  }
  v3 = 0;
LABEL_6:
  v4 = -[NSMutableArray hash](self->_events, "hash", v25);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    playbackPosition = self->_playbackPosition;
    v7 = -playbackPosition;
    if (playbackPosition >= 0.0)
      v7 = self->_playbackPosition;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = -[_MRContentItemProtobuf hash](self->_contentItem, "hash");
  v11 = -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v12 = 2654435761 * self->_playbackState;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_16;
LABEL_21:
    v17 = 0;
    goto LABEL_24;
  }
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_21;
LABEL_16:
  playbackRate = self->_playbackRate;
  v14 = -playbackRate;
  if (playbackRate >= 0.0)
    v14 = self->_playbackRate;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_24:
  v18 = -[_MRPlaybackSessionRequestProtobuf hash](self->_playbackSessionRequest, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    v19 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_26;
LABEL_29:
    v20 = 2654435761 * self->_originatorType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_27;
LABEL_30:
    v21 = 0;
    goto LABEL_31;
  }
  v19 = 2654435761 * self->_allowFadeTransition;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_29;
LABEL_26:
  v20 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_30;
LABEL_27:
  v21 = 2654435761 * self->_destinationTypes;
LABEL_31:
  v22 = v26 ^ v27 ^ v3 ^ v4 ^ v5 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20;
  v23 = v21 ^ -[NSString hash](self->_initiator, "hash");
  return v22 ^ v23 ^ -[_MRNowPlayingPlayerPathProtobuf hash](self->_resolvedPlayerPath, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _MRContentItemProtobuf *contentItem;
  uint64_t v12;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v14;
  char v15;
  _MRPlaybackSessionRequestProtobuf *playbackSessionRequest;
  uint64_t v17;
  int v18;
  _MRNowPlayingPlayerPathProtobuf *resolvedPlayerPath;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 11))
    -[_MRPlaybackSessionMigrateRequestProtobuf setRequestID:](self, "setRequestID:");
  v5 = v4[108];
  if ((v5 & 0x40) != 0)
  {
    self->_playerOptions = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_has |= 0x40u;
    v5 = v4[108];
  }
  if ((v5 & 8) != 0)
  {
    self->_endpointOptions = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 8u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *((id *)v4 + 5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[_MRPlaybackSessionMigrateRequestProtobuf addEvents:](self, "addEvents:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  if ((v4[108] & 1) != 0)
  {
    self->_playbackPosition = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  contentItem = self->_contentItem;
  v12 = *((_QWORD *)v4 + 3);
  if (contentItem)
  {
    if (v12)
      -[_MRContentItemProtobuf mergeFrom:](contentItem, "mergeFrom:");
  }
  else if (v12)
  {
    -[_MRPlaybackSessionMigrateRequestProtobuf setContentItem:](self, "setContentItem:");
  }
  playerPath = self->_playerPath;
  v14 = *((_QWORD *)v4 + 10);
  if (playerPath)
  {
    if (v14)
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else if (v14)
  {
    -[_MRPlaybackSessionMigrateRequestProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  v15 = v4[108];
  if ((v15 & 0x20) != 0)
  {
    self->_playbackState = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 0x20u;
    v15 = v4[108];
  }
  if ((v15 & 2) != 0)
  {
    self->_playbackRate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  playbackSessionRequest = self->_playbackSessionRequest;
  v17 = *((_QWORD *)v4 + 8);
  if (playbackSessionRequest)
  {
    if (v17)
      -[_MRPlaybackSessionRequestProtobuf mergeFrom:](playbackSessionRequest, "mergeFrom:");
  }
  else if (v17)
  {
    -[_MRPlaybackSessionMigrateRequestProtobuf setPlaybackSessionRequest:](self, "setPlaybackSessionRequest:");
  }
  v18 = v4[108];
  if ((v18 & 0x80000000) == 0)
  {
    if ((v18 & 0x10) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
  self->_allowFadeTransition = v4[104];
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v18) = v4[108];
  if ((v18 & 0x10) != 0)
  {
LABEL_37:
    self->_originatorType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 0x10u;
    LOBYTE(v18) = v4[108];
  }
LABEL_38:
  if ((v18 & 4) != 0)
  {
    self->_destinationTypes = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 6))
    -[_MRPlaybackSessionMigrateRequestProtobuf setInitiator:](self, "setInitiator:");
  resolvedPlayerPath = self->_resolvedPlayerPath;
  v20 = *((_QWORD *)v4 + 12);
  if (resolvedPlayerPath)
  {
    if (v20)
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](resolvedPlayerPath, "mergeFrom:");
  }
  else if (v20)
  {
    -[_MRPlaybackSessionMigrateRequestProtobuf setResolvedPlayerPath:](self, "setResolvedPlayerPath:");
  }

}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (double)playbackPosition
{
  return self->_playbackPosition;
}

- (_MRContentItemProtobuf)contentItem
{
  return self->_contentItem;
}

- (void)setContentItem:(id)a3
{
  objc_storeStrong((id *)&self->_contentItem, a3);
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (double)playbackRate
{
  return self->_playbackRate;
}

- (_MRPlaybackSessionRequestProtobuf)playbackSessionRequest
{
  return self->_playbackSessionRequest;
}

- (void)setPlaybackSessionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionRequest, a3);
}

- (BOOL)allowFadeTransition
{
  return self->_allowFadeTransition;
}

- (unsigned)originatorType
{
  return self->_originatorType;
}

- (unsigned)destinationTypes
{
  return self->_destinationTypes;
}

- (NSString)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
  objc_storeStrong((id *)&self->_initiator, a3);
}

- (_MRNowPlayingPlayerPathProtobuf)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

- (void)setResolvedPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedPlayerPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_playbackSessionRequest, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end
