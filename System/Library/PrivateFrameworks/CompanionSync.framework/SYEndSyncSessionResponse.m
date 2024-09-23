@implementation SYEndSyncSessionResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setDidRollback:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_didRollback = a3;
}

- (void)setHasDidRollback:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDidRollback
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYEndSyncSessionResponse;
  -[SYEndSyncSessionResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYEndSyncSessionResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  SYErrorInfo *error;
  void *v8;
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
  error = self->_error;
  if (error)
  {
    -[SYErrorInfo dictionaryRepresentation](error, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("error"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didRollback);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("didRollback"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYEndSyncSessionResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_header)
    -[SYEndSyncSessionResponse writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_sessionID)
    -[SYEndSyncSessionResponse writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if (self->_error)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;

  v4 = a3;
  objc_msgSend(v4, "setHeader:", self->_header);
  objc_msgSend(v4, "setSessionID:", self->_sessionID);
  if (self->_error)
    objc_msgSend(v4, "setError:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_didRollback;
    v4[36] |= 1u;
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

  v10 = -[SYErrorInfo copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_didRollback;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SYMessageHeader *header;
  NSString *sessionID;
  SYErrorInfo *error;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:"))
      goto LABEL_10;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:"))
      goto LABEL_10;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1))
  {
    if (!-[SYErrorInfo isEqual:](error, "isEqual:"))
      goto LABEL_10;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
    if (self->_didRollback)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_10;
    }
    v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_sessionID, "hash");
  v5 = -[SYErrorInfo hash](self->_error, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_didRollback;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
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
    -[SYEndSyncSessionResponse setHeader:](self, "setHeader:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 3))
  {
    -[SYEndSyncSessionResponse setSessionID:](self, "setSessionID:");
    v4 = v9;
  }
  error = self->_error;
  v8 = *((_QWORD *)v4 + 1);
  if (error)
  {
    if (!v8)
      goto LABEL_15;
    -[SYErrorInfo mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[SYEndSyncSessionResponse setError:](self, "setError:");
  }
  v4 = v9;
LABEL_15:
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_didRollback = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 1u;
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

- (SYErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)didRollback
{
  return self->_didRollback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYEndSyncSessionResponse writeTo:]", "SYEndSyncSessionResponse.m", 149, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYEndSyncSessionResponse writeTo:]", "SYEndSyncSessionResponse.m", 154, "nil != self->_sessionID");
}

@end
