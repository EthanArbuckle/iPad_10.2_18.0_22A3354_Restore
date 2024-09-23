@implementation _MRTransactionMessageProtobuf

- (void)setName:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_name = a3;
}

- (void)setHasName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasName
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPackets
{
  return self->_packets != 0;
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
  v8.super_class = (Class)_MRTransactionMessageProtobuf;
  -[_MRTransactionMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRTransactionMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _MRTransactionPacketsProtobuf *packets;
  void *v6;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_name);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("name"));

  }
  packets = self->_packets;
  if (packets)
  {
    -[_MRTransactionPacketsProtobuf dictionaryRepresentation](packets, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("packets"));

  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("playerPath"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTransactionMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_packets)
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
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_name;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_packets)
  {
    objc_msgSend(v4, "setPackets:");
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
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_name;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[_MRTransactionPacketsProtobuf copyWithZone:](self->_packets, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRTransactionPacketsProtobuf *packets;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_name != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((_QWORD *)v4 + 2)
    && !-[_MRTransactionPacketsProtobuf isEqual:](packets, "isEqual:"))
  {
    goto LABEL_11;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((_QWORD *)v4 + 3))
    v7 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_name;
  else
    v3 = 0;
  v4 = -[_MRTransactionPacketsProtobuf hash](self->_packets, "hash") ^ v3;
  return v4 ^ -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _MRTransactionPacketsProtobuf *packets;
  uint64_t v7;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((v4[4] & 1) != 0)
  {
    self->_name = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  packets = self->_packets;
  v7 = v5[2];
  v10 = v5;
  if (packets)
  {
    if (!v7)
      goto LABEL_9;
    -[_MRTransactionPacketsProtobuf mergeFrom:](packets, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[_MRTransactionMessageProtobuf setPackets:](self, "setPackets:");
  }
  v5 = v10;
LABEL_9:
  playerPath = self->_playerPath;
  v9 = v5[3];
  if (playerPath)
  {
    if (v9)
    {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
LABEL_14:
      v5 = v10;
    }
  }
  else if (v9)
  {
    -[_MRTransactionMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
    goto LABEL_14;
  }

}

- (unint64_t)name
{
  return self->_name;
}

- (_MRTransactionPacketsProtobuf)packets
{
  return self->_packets;
}

- (void)setPackets:(id)a3
{
  objc_storeStrong((id *)&self->_packets, a3);
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
  objc_storeStrong((id *)&self->_packets, 0);
}

@end
