@implementation _MRPlaybackSessionMigrateEndMessageProtobuf

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
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
  v8.super_class = (Class)_MRPlaybackSessionMigrateEndMessageProtobuf;
  -[_MRPlaybackSessionMigrateEndMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionMigrateEndMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRPlaybackSessionRequestProtobuf *request;
  void *v5;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v7;
  void *v8;
  NSString *errorDescription;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  request = self->_request;
  if (request)
  {
    -[_MRPlaybackSessionRequestProtobuf dictionaryRepresentation](request, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request"));

  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("playerPath"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_errorCode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("errorCode"));

  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v3, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionMigrateEndMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_request)
  {
    objc_msgSend(v4, "setRequest:");
    v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_errorCode;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRPlaybackSessionRequestProtobuf copyWithZone:](self->_request, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_errorCode;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRPlaybackSessionRequestProtobuf *request;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  NSString *errorDescription;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  request = self->_request;
  if ((unint64_t)request | *((_QWORD *)v4 + 4))
  {
    if (!-[_MRPlaybackSessionRequestProtobuf isEqual:](request, "isEqual:"))
      goto LABEL_13;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((_QWORD *)v4 + 3))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](errorDescription, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[_MRPlaybackSessionRequestProtobuf hash](self->_request, "hash");
  v4 = -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_errorCode;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_errorDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRPlaybackSessionRequestProtobuf *request;
  uint64_t v6;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  request = self->_request;
  v6 = v4[4];
  v9 = v4;
  if (request)
  {
    if (!v6)
      goto LABEL_7;
    -[_MRPlaybackSessionRequestProtobuf mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_MRPlaybackSessionMigrateEndMessageProtobuf setRequest:](self, "setRequest:");
  }
  v4 = v9;
LABEL_7:
  playerPath = self->_playerPath;
  v8 = v4[3];
  if (playerPath)
  {
    if (!v8)
      goto LABEL_13;
    -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[_MRPlaybackSessionMigrateEndMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  v4 = v9;
LABEL_13:
  if ((v4[5] & 1) != 0)
  {
    self->_errorCode = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[_MRPlaybackSessionMigrateEndMessageProtobuf setErrorDescription:](self, "setErrorDescription:");
    v4 = v9;
  }

}

- (_MRPlaybackSessionRequestProtobuf)request
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

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end
