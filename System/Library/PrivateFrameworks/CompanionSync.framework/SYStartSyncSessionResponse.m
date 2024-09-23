@implementation SYStartSyncSessionResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
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
  v8.super_class = (Class)SYStartSyncSessionResponse;
  -[SYStartSyncSessionResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYStartSyncSessionResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v10;
  void *v11;
  NSData *metadata;

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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsRollback);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("supportsRollback"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsRestart);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("supportsRestart"));

  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v3, "setObject:forKey:", metadata, CFSTR("metadata"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYStartSyncSessionResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_header)
    -[SYStartSyncSessionResponse writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (!self->_sessionID)
    -[SYStartSyncSessionResponse writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (self->_error)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  if (self->_metadata)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v5 = a3;
  objc_msgSend(v5, "setHeader:", self->_header);
  objc_msgSend(v5, "setSessionID:", self->_sessionID);
  v4 = v5;
  v5[40] = self->_accepted;
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    v4 = v5;
  }
  v4[42] = self->_supportsRollback;
  v4[41] = self->_supportsRestart;
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
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
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYMessageHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  *(_BYTE *)(v5 + 40) = self->_accepted;
  v10 = -[SYErrorInfo copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  *(_BYTE *)(v5 + 42) = self->_supportsRollback;
  *(_BYTE *)(v5 + 41) = self->_supportsRestart;
  v12 = -[NSData copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SYMessageHeader *header;
  NSString *sessionID;
  SYErrorInfo *error;
  NSData *metadata;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:"))
      goto LABEL_21;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:"))
      goto LABEL_21;
  }
  if (self->_accepted)
  {
    if (!*((_BYTE *)v4 + 40))
      goto LABEL_21;
  }
  else if (*((_BYTE *)v4 + 40))
  {
    goto LABEL_21;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1) && !-[SYErrorInfo isEqual:](error, "isEqual:"))
    goto LABEL_21;
  if (self->_supportsRollback)
  {
    if (!*((_BYTE *)v4 + 42))
      goto LABEL_21;
  }
  else if (*((_BYTE *)v4 + 42))
  {
    goto LABEL_21;
  }
  if (self->_supportsRestart)
  {
    if (*((_BYTE *)v4 + 41))
      goto LABEL_18;
LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  if (*((_BYTE *)v4 + 41))
    goto LABEL_21;
LABEL_18:
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 3))
    v9 = -[NSData isEqual:](metadata, "isEqual:");
  else
    v9 = 1;
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_sessionID, "hash") ^ v3;
  v5 = 2654435761 * self->_accepted;
  v6 = v4 ^ -[SYErrorInfo hash](self->_error, "hash") ^ v5 ^ (2654435761 * self->_supportsRollback) ^ (2654435761 * self->_supportsRestart);
  return v6 ^ -[NSData hash](self->_metadata, "hash");
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
    -[SYStartSyncSessionResponse setHeader:](self, "setHeader:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 4))
  {
    -[SYStartSyncSessionResponse setSessionID:](self, "setSessionID:");
    v4 = v9;
  }
  self->_accepted = *((_BYTE *)v4 + 40);
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
    -[SYStartSyncSessionResponse setError:](self, "setError:");
  }
  v4 = v9;
LABEL_15:
  self->_supportsRollback = *((_BYTE *)v4 + 42);
  self->_supportsRestart = *((_BYTE *)v4 + 41);
  if (*((_QWORD *)v4 + 3))
  {
    -[SYStartSyncSessionResponse setMetadata:](self, "setMetadata:");
    v4 = v9;
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

- (BOOL)supportsRollback
{
  return self->_supportsRollback;
}

- (void)setSupportsRollback:(BOOL)a3
{
  self->_supportsRollback = a3;
}

- (BOOL)supportsRestart
{
  return self->_supportsRestart;
}

- (void)setSupportsRestart:(BOOL)a3
{
  self->_supportsRestart = a3;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYStartSyncSessionResponse writeTo:]", "SYStartSyncSessionResponse.m", 161, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYStartSyncSessionResponse writeTo:]", "SYStartSyncSessionResponse.m", 166, "nil != self->_sessionID");
}

@end
