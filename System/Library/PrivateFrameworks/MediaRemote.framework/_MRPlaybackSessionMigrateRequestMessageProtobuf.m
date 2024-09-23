@implementation _MRPlaybackSessionMigrateRequestMessageProtobuf

- (BOOL)hasPlaybackSession
{
  return self->_playbackSession != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
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
  v8.super_class = (Class)_MRPlaybackSessionMigrateRequestMessageProtobuf;
  -[_MRPlaybackSessionMigrateRequestMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionMigrateRequestMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRPlaybackSessionProtobuf *playbackSession;
  void *v5;
  _MRPlaybackSessionMigrateRequestProtobuf *request;
  void *v7;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  playbackSession = self->_playbackSession;
  if (playbackSession)
  {
    -[_MRPlaybackSessionProtobuf dictionaryRepresentation](playbackSession, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("playbackSession"));

  }
  request = self->_request;
  if (request)
  {
    -[_MRPlaybackSessionMigrateRequestProtobuf dictionaryRepresentation](request, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("request"));

  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("playerPath"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionMigrateRequestMessageProtobufReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_playbackSession)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_playbackSession)
  {
    objc_msgSend(v4, "setPlaybackSession:");
    v4 = v5;
  }
  if (self->_request)
  {
    objc_msgSend(v5, "setRequest:");
    v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRPlaybackSessionProtobuf copyWithZone:](self->_playbackSession, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[_MRPlaybackSessionMigrateRequestProtobuf copyWithZone:](self->_request, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRPlaybackSessionProtobuf *playbackSession;
  _MRPlaybackSessionMigrateRequestProtobuf *request;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((playbackSession = self->_playbackSession, !((unint64_t)playbackSession | v4[1]))
     || -[_MRPlaybackSessionProtobuf isEqual:](playbackSession, "isEqual:"))
    && ((request = self->_request, !((unint64_t)request | v4[3]))
     || -[_MRPlaybackSessionMigrateRequestProtobuf isEqual:](request, "isEqual:")))
  {
    playerPath = self->_playerPath;
    if ((unint64_t)playerPath | v4[2])
      v8 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_MRPlaybackSessionProtobuf hash](self->_playbackSession, "hash");
  v4 = -[_MRPlaybackSessionMigrateRequestProtobuf hash](self->_request, "hash") ^ v3;
  return v4 ^ -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRPlaybackSessionProtobuf *playbackSession;
  uint64_t v6;
  _MRPlaybackSessionMigrateRequestProtobuf *request;
  uint64_t v8;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  playbackSession = self->_playbackSession;
  v6 = v4[1];
  v11 = v4;
  if (playbackSession)
  {
    if (!v6)
      goto LABEL_7;
    -[_MRPlaybackSessionProtobuf mergeFrom:](playbackSession, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf setPlaybackSession:](self, "setPlaybackSession:");
  }
  v4 = v11;
LABEL_7:
  request = self->_request;
  v8 = v4[3];
  if (request)
  {
    if (!v8)
      goto LABEL_13;
    -[_MRPlaybackSessionMigrateRequestProtobuf mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf setRequest:](self, "setRequest:");
  }
  v4 = v11;
LABEL_13:
  playerPath = self->_playerPath;
  v10 = v4[2];
  if (playerPath)
  {
    if (v10)
    {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
    goto LABEL_18;
  }

}

- (_MRPlaybackSessionProtobuf)playbackSession
{
  return self->_playbackSession;
}

- (void)setPlaybackSession:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSession, a3);
}

- (_MRPlaybackSessionMigrateRequestProtobuf)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_playbackSession, 0);
}

@end
