@implementation SYSyncSessionRestartRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYSyncSessionRestartRequest;
  -[SYSyncSessionRestartRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSyncSessionRestartRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SYMessageHeader *header;
  void *v5;
  NSString *sessionID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    -[SYMessageHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("header"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYSyncSessionRestartRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_header)
    -[SYSyncSessionRestartRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_sessionID)
    -[SYSyncSessionRestartRequest writeTo:].cold.2();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  SYMessageHeader *header;
  id v5;

  header = self->_header;
  v5 = a3;
  objc_msgSend(v5, "setHeader:", header);
  objc_msgSend(v5, "setSessionID:", self->_sessionID);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYMessageHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SYMessageHeader *header;
  NSString *sessionID;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((header = self->_header, !((unint64_t)header | v4[1])) || -[SYMessageHeader isEqual:](header, "isEqual:")))
  {
    sessionID = self->_sessionID;
    if ((unint64_t)sessionID | v4[2])
      v7 = -[NSString isEqual:](sessionID, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  return -[NSString hash](self->_sessionID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SYMessageHeader *header;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  header = self->_header;
  v6 = v4[1];
  v7 = v4;
  if (header)
  {
    if (!v6)
      goto LABEL_7;
    -[SYMessageHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SYSyncSessionRestartRequest setHeader:](self, "setHeader:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[SYSyncSessionRestartRequest setSessionID:](self, "setSessionID:");
    v4 = v7;
  }

}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYSyncSessionRestartRequest writeTo:]", "SYSyncSessionRestartRequest.m", 97, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYSyncSessionRestartRequest writeTo:]", "SYSyncSessionRestartRequest.m", 102, "nil != self->_sessionID");
}

@end
