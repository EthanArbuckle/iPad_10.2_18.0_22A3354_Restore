@implementation SYSyncSessionRestartResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYSyncSessionRestartResponse;
  -[SYSyncSessionRestartResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSyncSessionRestartResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  SYErrorInfo *error;
  void *v9;

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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_accepted);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("accepted"));

  error = self->_error;
  if (error)
  {
    -[SYErrorInfo dictionaryRepresentation](error, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("error"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYSyncSessionRestartResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_header)
    -[SYSyncSessionRestartResponse writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (!self->_sessionID)
    -[SYSyncSessionRestartResponse writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (self->_error)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _BYTE *v5;

  v5 = a3;
  objc_msgSend(v5, "setHeader:", self->_header);
  objc_msgSend(v5, "setSessionID:", self->_sessionID);
  v4 = v5;
  v5[32] = self->_accepted;
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYMessageHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  *(_BYTE *)(v5 + 32) = self->_accepted;
  v10 = -[SYErrorInfo copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SYMessageHeader *header;
  NSString *sessionID;
  SYErrorInfo *error;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:"))
      goto LABEL_11;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:"))
      goto LABEL_11;
  }
  if (self->_accepted)
  {
    if (*((_BYTE *)v4 + 32))
      goto LABEL_8;
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if (*((_BYTE *)v4 + 32))
    goto LABEL_11;
LABEL_8:
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1))
    v8 = -[SYErrorInfo isEqual:](error, "isEqual:");
  else
    v8 = 1;
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_sessionID, "hash") ^ v3;
  v5 = 2654435761 * self->_accepted;
  return v4 ^ -[SYErrorInfo hash](self->_error, "hash") ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SYMessageHeader *header;
  uint64_t v6;
  SYErrorInfo *error;
  uint64_t v8;
  id v9;

  v4 = a3;
  header = self->_header;
  v6 = *((_QWORD *)v4 + 2);
  v9 = v4;
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
    -[SYSyncSessionRestartResponse setHeader:](self, "setHeader:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 3))
  {
    -[SYSyncSessionRestartResponse setSessionID:](self, "setSessionID:");
    v4 = v9;
  }
  self->_accepted = *((_BYTE *)v4 + 32);
  error = self->_error;
  v8 = *((_QWORD *)v4 + 1);
  if (error)
  {
    if (v8)
    {
      -[SYErrorInfo mergeFrom:](error, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SYSyncSessionRestartResponse setError:](self, "setError:");
    goto LABEL_14;
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

- (BOOL)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (SYErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYSyncSessionRestartResponse writeTo:]", "SYSyncSessionRestartResponse.m", 132, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYSyncSessionRestartResponse writeTo:]", "SYSyncSessionRestartResponse.m", 137, "nil != self->_sessionID");
}

@end
