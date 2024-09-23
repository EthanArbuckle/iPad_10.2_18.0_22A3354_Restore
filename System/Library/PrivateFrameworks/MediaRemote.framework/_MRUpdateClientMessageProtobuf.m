@implementation _MRUpdateClientMessageProtobuf

- (BOOL)hasClient
{
  return self->_client != 0;
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
  v8.super_class = (Class)_MRUpdateClientMessageProtobuf;
  -[_MRUpdateClientMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRUpdateClientMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRNowPlayingClientProtobuf *client;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  client = self->_client;
  if (client)
  {
    -[_MRNowPlayingClientProtobuf dictionaryRepresentation](client, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("client"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRUpdateClientMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_client)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRNowPlayingClientProtobuf *client;

  client = self->_client;
  if (client)
    objc_msgSend(a3, "setClient:", client);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRNowPlayingClientProtobuf copyWithZone:](self->_client, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRNowPlayingClientProtobuf *client;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    client = self->_client;
    if ((unint64_t)client | v4[1])
      v6 = -[_MRNowPlayingClientProtobuf isEqual:](client, "isEqual:");
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
  return -[_MRNowPlayingClientProtobuf hash](self->_client, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRNowPlayingClientProtobuf *client;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  client = self->_client;
  v6 = v4[1];
  if (client)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRNowPlayingClientProtobuf mergeFrom:](client, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRUpdateClientMessageProtobuf setClient:](self, "setClient:");
    goto LABEL_6;
  }

}

- (_MRNowPlayingClientProtobuf)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
