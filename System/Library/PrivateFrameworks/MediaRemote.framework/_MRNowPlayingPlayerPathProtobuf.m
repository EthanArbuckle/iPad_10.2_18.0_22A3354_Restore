@implementation _MRNowPlayingPlayerPathProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRNowPlayingPlayerPathProtobufReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (_MROriginProtobuf)origin
{
  return self->_origin;
}

- (_MRNowPlayingClientProtobuf)client
{
  return self->_client;
}

- (_MRNowPlayingPlayerProtobuf)player
{
  return self->_player;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_origin)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_client)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_player)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (BOOL)hasClient
{
  return self->_client != 0;
}

- (BOOL)hasPlayer
{
  return self->_player != 0;
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
  v8.super_class = (Class)_MRNowPlayingPlayerPathProtobuf;
  -[_MRNowPlayingPlayerPathProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MROriginProtobuf *origin;
  void *v5;
  _MRNowPlayingClientProtobuf *client;
  void *v7;
  _MRNowPlayingPlayerProtobuf *player;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  origin = self->_origin;
  if (origin)
  {
    -[_MROriginProtobuf dictionaryRepresentation](origin, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("origin"));

  }
  client = self->_client;
  if (client)
  {
    -[_MRNowPlayingClientProtobuf dictionaryRepresentation](client, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("client"));

  }
  player = self->_player;
  if (player)
  {
    -[_MRNowPlayingPlayerProtobuf dictionaryRepresentation](player, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("player"));

  }
  return v3;
}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_origin)
  {
    objc_msgSend(v4, "setOrigin:");
    v4 = v5;
  }
  if (self->_client)
  {
    objc_msgSend(v5, "setClient:");
    v4 = v5;
  }
  if (self->_player)
  {
    objc_msgSend(v5, "setPlayer:");
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
  v6 = -[_MROriginProtobuf copyWithZone:](self->_origin, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[_MRNowPlayingClientProtobuf copyWithZone:](self->_client, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[_MRNowPlayingPlayerProtobuf copyWithZone:](self->_player, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MROriginProtobuf *origin;
  _MRNowPlayingClientProtobuf *client;
  _MRNowPlayingPlayerProtobuf *player;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((origin = self->_origin, !((unint64_t)origin | v4[2]))
     || -[_MROriginProtobuf isEqual:](origin, "isEqual:"))
    && ((client = self->_client, !((unint64_t)client | v4[1]))
     || -[_MRNowPlayingClientProtobuf isEqual:](client, "isEqual:")))
  {
    player = self->_player;
    if ((unint64_t)player | v4[3])
      v8 = -[_MRNowPlayingPlayerProtobuf isEqual:](player, "isEqual:");
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

  v3 = -[_MROriginProtobuf hash](self->_origin, "hash");
  v4 = -[_MRNowPlayingClientProtobuf hash](self->_client, "hash") ^ v3;
  return v4 ^ -[_MRNowPlayingPlayerProtobuf hash](self->_player, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MROriginProtobuf *origin;
  uint64_t v6;
  _MRNowPlayingClientProtobuf *client;
  uint64_t v8;
  _MRNowPlayingPlayerProtobuf *player;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  origin = self->_origin;
  v6 = v4[2];
  v11 = v4;
  if (origin)
  {
    if (!v6)
      goto LABEL_7;
    -[_MROriginProtobuf mergeFrom:](origin, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_MRNowPlayingPlayerPathProtobuf setOrigin:](self, "setOrigin:");
  }
  v4 = v11;
LABEL_7:
  client = self->_client;
  v8 = v4[1];
  if (client)
  {
    if (!v8)
      goto LABEL_13;
    -[_MRNowPlayingClientProtobuf mergeFrom:](client, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[_MRNowPlayingPlayerPathProtobuf setClient:](self, "setClient:");
  }
  v4 = v11;
LABEL_13:
  player = self->_player;
  v10 = v4[3];
  if (player)
  {
    if (v10)
    {
      -[_MRNowPlayingPlayerProtobuf mergeFrom:](player, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[_MRNowPlayingPlayerPathProtobuf setPlayer:](self, "setPlayer:");
    goto LABEL_18;
  }

}

@end
