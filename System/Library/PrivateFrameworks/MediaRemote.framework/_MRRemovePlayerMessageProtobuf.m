@implementation _MRRemovePlayerMessageProtobuf

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
  v8.super_class = (Class)_MRRemovePlayerMessageProtobuf;
  -[_MRRemovePlayerMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRemovePlayerMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("playerPath"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRemovePlayerMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_playerPath)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRNowPlayingPlayerPathProtobuf *playerPath;

  playerPath = self->_playerPath;
  if (playerPath)
    objc_msgSend(a3, "setPlayerPath:", playerPath);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    playerPath = self->_playerPath;
    if ((unint64_t)playerPath | v4[1])
      v6 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  playerPath = self->_playerPath;
  v6 = v4[1];
  if (playerPath)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRRemovePlayerMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
    goto LABEL_6;
  }

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
  objc_storeStrong((id *)&self->_playerPath, 0);
}

@end
