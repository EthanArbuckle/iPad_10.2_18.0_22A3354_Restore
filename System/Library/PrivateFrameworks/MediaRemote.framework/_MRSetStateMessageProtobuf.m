@implementation _MRSetStateMessageProtobuf

- (BOOL)hasNowPlayingInfo
{
  return self->_nowPlayingInfo != 0;
}

- (BOOL)hasSupportedCommands
{
  return self->_supportedCommands != 0;
}

- (BOOL)hasPlaybackQueue
{
  return self->_playbackQueue != 0;
}

- (BOOL)hasDisplayID
{
  return self->_displayID != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (int)playbackState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_playbackState;
  else
    return 0;
}

- (void)setPlaybackState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_playbackState = a3;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlaybackState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)playbackStateAsString:(int)a3
{
  if (a3 < 6)
    return off_1E30C7100[a3];
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

- (BOOL)hasPlaybackQueueCapabilities
{
  return self->_playbackQueueCapabilities != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (void)setPlaybackStateTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_playbackStateTimestamp = a3;
}

- (void)setHasPlaybackStateTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaybackStateTimestamp
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)_MRSetStateMessageProtobuf;
  -[_MRSetStateMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSetStateMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRNowPlayingInfoProtobuf *nowPlayingInfo;
  void *v5;
  _MRSupportedCommandsProtobuf *supportedCommands;
  void *v7;
  _MRPlaybackQueueProtobuf *playbackQueue;
  void *v9;
  NSString *displayID;
  NSString *displayName;
  uint64_t playbackState;
  __CFString *v13;
  _MRPlaybackQueueCapabilitiesProtobuf *playbackQueueCapabilities;
  void *v15;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v17;
  _MRPlaybackQueueRequestProtobuf *request;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  nowPlayingInfo = self->_nowPlayingInfo;
  if (nowPlayingInfo)
  {
    -[_MRNowPlayingInfoProtobuf dictionaryRepresentation](nowPlayingInfo, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("nowPlayingInfo"));

  }
  supportedCommands = self->_supportedCommands;
  if (supportedCommands)
  {
    -[_MRSupportedCommandsProtobuf dictionaryRepresentation](supportedCommands, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("supportedCommands"));

  }
  playbackQueue = self->_playbackQueue;
  if (playbackQueue)
  {
    -[_MRPlaybackQueueProtobuf dictionaryRepresentation](playbackQueue, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("playbackQueue"));

  }
  displayID = self->_displayID;
  if (displayID)
    objc_msgSend(v3, "setObject:forKey:", displayID, CFSTR("displayID"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKey:", displayName, CFSTR("displayName"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    playbackState = self->_playbackState;
    if (playbackState >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_playbackState);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E30C7100[playbackState];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("playbackState"));

  }
  playbackQueueCapabilities = self->_playbackQueueCapabilities;
  if (playbackQueueCapabilities)
  {
    -[_MRPlaybackQueueCapabilitiesProtobuf dictionaryRepresentation](playbackQueueCapabilities, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("playbackQueueCapabilities"));

  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("playerPath"));

  }
  request = self->_request;
  if (request)
  {
    -[_MRPlaybackQueueRequestProtobuf dictionaryRepresentation](request, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("request"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_playbackStateTimestamp);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("playbackStateTimestamp"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSetStateMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_nowPlayingInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_supportedCommands)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playbackQueue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_displayID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_playbackQueueCapabilities)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_nowPlayingInfo)
  {
    objc_msgSend(v4, "setNowPlayingInfo:");
    v4 = v5;
  }
  if (self->_supportedCommands)
  {
    objc_msgSend(v5, "setSupportedCommands:");
    v4 = v5;
  }
  if (self->_playbackQueue)
  {
    objc_msgSend(v5, "setPlaybackQueue:");
    v4 = v5;
  }
  if (self->_displayID)
  {
    objc_msgSend(v5, "setDisplayID:");
    v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_playbackState;
    *((_BYTE *)v4 + 88) |= 2u;
  }
  if (self->_playbackQueueCapabilities)
  {
    objc_msgSend(v5, "setPlaybackQueueCapabilities:");
    v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    v4 = v5;
  }
  if (self->_request)
  {
    objc_msgSend(v5, "setRequest:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_playbackStateTimestamp;
    *((_BYTE *)v4 + 88) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRNowPlayingInfoProtobuf copyWithZone:](self->_nowPlayingInfo, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[_MRSupportedCommandsProtobuf copyWithZone:](self->_supportedCommands, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  v10 = -[_MRPlaybackQueueProtobuf copyWithZone:](self->_playbackQueue, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_displayID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_playbackState;
    *(_BYTE *)(v5 + 88) |= 2u;
  }
  v16 = -[_MRPlaybackQueueCapabilitiesProtobuf copyWithZone:](self->_playbackQueueCapabilities, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v18 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  v20 = -[_MRPlaybackQueueRequestProtobuf copyWithZone:](self->_request, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_playbackStateTimestamp;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRNowPlayingInfoProtobuf *nowPlayingInfo;
  _MRSupportedCommandsProtobuf *supportedCommands;
  _MRPlaybackQueueProtobuf *playbackQueue;
  NSString *displayID;
  NSString *displayName;
  _MRPlaybackQueueCapabilitiesProtobuf *playbackQueueCapabilities;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  _MRPlaybackQueueRequestProtobuf *request;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  nowPlayingInfo = self->_nowPlayingInfo;
  if ((unint64_t)nowPlayingInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[_MRNowPlayingInfoProtobuf isEqual:](nowPlayingInfo, "isEqual:"))
      goto LABEL_27;
  }
  supportedCommands = self->_supportedCommands;
  if ((unint64_t)supportedCommands | *((_QWORD *)v4 + 10))
  {
    if (!-[_MRSupportedCommandsProtobuf isEqual:](supportedCommands, "isEqual:"))
      goto LABEL_27;
  }
  playbackQueue = self->_playbackQueue;
  if ((unint64_t)playbackQueue | *((_QWORD *)v4 + 5))
  {
    if (!-[_MRPlaybackQueueProtobuf isEqual:](playbackQueue, "isEqual:"))
      goto LABEL_27;
  }
  displayID = self->_displayID;
  if ((unint64_t)displayID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayID, "isEqual:"))
      goto LABEL_27;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_playbackState != *((_DWORD *)v4 + 14))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  playbackQueueCapabilities = self->_playbackQueueCapabilities;
  if ((unint64_t)playbackQueueCapabilities | *((_QWORD *)v4 + 6)
    && !-[_MRPlaybackQueueCapabilitiesProtobuf isEqual:](playbackQueueCapabilities, "isEqual:"))
  {
    goto LABEL_27;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((_QWORD *)v4 + 8))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:"))
      goto LABEL_27;
  }
  request = self->_request;
  if ((unint64_t)request | *((_QWORD *)v4 + 9))
  {
    if (!-[_MRPlaybackQueueRequestProtobuf isEqual:](request, "isEqual:"))
      goto LABEL_27;
  }
  v13 = (*((_BYTE *)v4 + 88) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_playbackStateTimestamp != *((double *)v4 + 1))
      goto LABEL_27;
    v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double playbackStateTimestamp;
  double v12;
  long double v13;
  double v14;
  unint64_t v16;
  unint64_t v17;

  v17 = -[_MRNowPlayingInfoProtobuf hash](self->_nowPlayingInfo, "hash");
  v16 = -[_MRSupportedCommandsProtobuf hash](self->_supportedCommands, "hash");
  v3 = -[_MRPlaybackQueueProtobuf hash](self->_playbackQueue, "hash");
  v4 = -[NSString hash](self->_displayID, "hash");
  v5 = -[NSString hash](self->_displayName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_playbackState;
  else
    v6 = 0;
  v7 = -[_MRPlaybackQueueCapabilitiesProtobuf hash](self->_playbackQueueCapabilities, "hash");
  v8 = -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
  v9 = -[_MRPlaybackQueueRequestProtobuf hash](self->_request, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    playbackStateTimestamp = self->_playbackStateTimestamp;
    v12 = -playbackStateTimestamp;
    if (playbackStateTimestamp >= 0.0)
      v12 = self->_playbackStateTimestamp;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _MRNowPlayingInfoProtobuf *nowPlayingInfo;
  uint64_t v6;
  _MRSupportedCommandsProtobuf *supportedCommands;
  uint64_t v8;
  _MRPlaybackQueueProtobuf *playbackQueue;
  uint64_t v10;
  _MRPlaybackQueueCapabilitiesProtobuf *playbackQueueCapabilities;
  uint64_t v12;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v14;
  _MRPlaybackQueueRequestProtobuf *request;
  uint64_t v16;
  id v17;

  v4 = a3;
  nowPlayingInfo = self->_nowPlayingInfo;
  v6 = *((_QWORD *)v4 + 4);
  v17 = v4;
  if (nowPlayingInfo)
  {
    if (!v6)
      goto LABEL_7;
    -[_MRNowPlayingInfoProtobuf mergeFrom:](nowPlayingInfo, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_MRSetStateMessageProtobuf setNowPlayingInfo:](self, "setNowPlayingInfo:");
  }
  v4 = v17;
LABEL_7:
  supportedCommands = self->_supportedCommands;
  v8 = *((_QWORD *)v4 + 10);
  if (supportedCommands)
  {
    if (!v8)
      goto LABEL_13;
    -[_MRSupportedCommandsProtobuf mergeFrom:](supportedCommands, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[_MRSetStateMessageProtobuf setSupportedCommands:](self, "setSupportedCommands:");
  }
  v4 = v17;
LABEL_13:
  playbackQueue = self->_playbackQueue;
  v10 = *((_QWORD *)v4 + 5);
  if (playbackQueue)
  {
    if (!v10)
      goto LABEL_19;
    -[_MRPlaybackQueueProtobuf mergeFrom:](playbackQueue, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[_MRSetStateMessageProtobuf setPlaybackQueue:](self, "setPlaybackQueue:");
  }
  v4 = v17;
LABEL_19:
  if (*((_QWORD *)v4 + 2))
  {
    -[_MRSetStateMessageProtobuf setDisplayID:](self, "setDisplayID:");
    v4 = v17;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[_MRSetStateMessageProtobuf setDisplayName:](self, "setDisplayName:");
    v4 = v17;
  }
  if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    self->_playbackState = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 2u;
  }
  playbackQueueCapabilities = self->_playbackQueueCapabilities;
  v12 = *((_QWORD *)v4 + 6);
  if (playbackQueueCapabilities)
  {
    if (!v12)
      goto LABEL_31;
    -[_MRPlaybackQueueCapabilitiesProtobuf mergeFrom:](playbackQueueCapabilities, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_31;
    -[_MRSetStateMessageProtobuf setPlaybackQueueCapabilities:](self, "setPlaybackQueueCapabilities:");
  }
  v4 = v17;
LABEL_31:
  playerPath = self->_playerPath;
  v14 = *((_QWORD *)v4 + 8);
  if (playerPath)
  {
    if (!v14)
      goto LABEL_37;
    -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_37;
    -[_MRSetStateMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  v4 = v17;
LABEL_37:
  request = self->_request;
  v16 = *((_QWORD *)v4 + 9);
  if (request)
  {
    if (!v16)
      goto LABEL_43;
    -[_MRPlaybackQueueRequestProtobuf mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_43;
    -[_MRSetStateMessageProtobuf setRequest:](self, "setRequest:");
  }
  v4 = v17;
LABEL_43:
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    self->_playbackStateTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (_MRNowPlayingInfoProtobuf)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
}

- (_MRSupportedCommandsProtobuf)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCommands, a3);
}

- (_MRPlaybackQueueProtobuf)playbackQueue
{
  return self->_playbackQueue;
}

- (void)setPlaybackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueue, a3);
}

- (NSString)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_displayID, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (_MRPlaybackQueueCapabilitiesProtobuf)playbackQueueCapabilities
{
  return self->_playbackQueueCapabilities;
}

- (void)setPlaybackQueueCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueCapabilities, a3);
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (_MRPlaybackQueueRequestProtobuf)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (double)playbackStateTimestamp
{
  return self->_playbackStateTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_playbackQueueCapabilities, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
}

@end
