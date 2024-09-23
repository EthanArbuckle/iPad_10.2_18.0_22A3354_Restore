@implementation _MRPlaybackSessionResponseMessageProtobuf

- (BOOL)hasPlaybackSession
{
  return self->_playbackSession != 0;
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
  v8.super_class = (Class)_MRPlaybackSessionResponseMessageProtobuf;
  -[_MRPlaybackSessionResponseMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionResponseMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  playbackSession = self->_playbackSession;
  if (playbackSession)
  {
    -[_MRPlaybackSessionProtobuf dictionaryRepresentation](playbackSession, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("playbackSession"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionResponseMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_playbackSession)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRPlaybackSessionProtobuf *playbackSession;

  playbackSession = self->_playbackSession;
  if (playbackSession)
    objc_msgSend(a3, "setPlaybackSession:", playbackSession);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRPlaybackSessionProtobuf copyWithZone:](self->_playbackSession, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRPlaybackSessionProtobuf *playbackSession;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    playbackSession = self->_playbackSession;
    if ((unint64_t)playbackSession | v4[1])
      v6 = -[_MRPlaybackSessionProtobuf isEqual:](playbackSession, "isEqual:");
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
  return -[_MRPlaybackSessionProtobuf hash](self->_playbackSession, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRPlaybackSessionProtobuf *playbackSession;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  playbackSession = self->_playbackSession;
  v6 = v4[1];
  if (playbackSession)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRPlaybackSessionProtobuf mergeFrom:](playbackSession, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRPlaybackSessionResponseMessageProtobuf setPlaybackSession:](self, "setPlaybackSession:");
    goto LABEL_6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSession, 0);
}

@end
