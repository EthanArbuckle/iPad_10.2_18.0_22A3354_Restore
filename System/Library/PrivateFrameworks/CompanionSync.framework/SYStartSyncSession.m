@implementation SYStartSyncSession

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
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
  v8.super_class = (Class)SYStartSyncSession;
  -[SYStartSyncSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYStartSyncSession dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *sessionID;
  void *v8;
  void *v9;
  void *v10;
  NSData *metadata;
  NSString *reason;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    -[SYMessageHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("header"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isResetSync);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isResetSync"));

  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_expectsRollbackSupport);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("expectsRollbackSupport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_expectsRestartSupport);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("expectsRestartSupport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_sessionTimeout);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sessionTimeout"));

  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v3, "setObject:forKey:", metadata, CFSTR("metadata"));
  reason = self->_reason;
  if (reason)
    objc_msgSend(v3, "setObject:forKey:", reason, CFSTR("reason"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYStartSyncSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_header)
    -[SYStartSyncSession writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  if (!self->_sessionID)
    -[SYStartSyncSession writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteDoubleField();
  if (self->_metadata)
    PBDataWriterWriteDataField();
  if (self->_reason)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setHeader:", self->_header);
  *((_BYTE *)v5 + 50) = self->_isResetSync;
  objc_msgSend(v5, "setSessionID:", self->_sessionID);
  v4 = v5;
  *((_BYTE *)v5 + 49) = self->_expectsRollbackSupport;
  *((_BYTE *)v5 + 48) = self->_expectsRestartSupport;
  *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_sessionTimeout;
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    v4 = v5;
  }
  if (self->_reason)
  {
    objc_msgSend(v5, "setReason:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYMessageHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_BYTE *)(v5 + 50) = self->_isResetSync;
  v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  *(_BYTE *)(v5 + 49) = self->_expectsRollbackSupport;
  *(_BYTE *)(v5 + 48) = self->_expectsRestartSupport;
  *(double *)(v5 + 8) = self->_sessionTimeout;
  v10 = -[NSData copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SYMessageHeader *header;
  NSString *sessionID;
  NSData *metadata;
  NSString *reason;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:"))
      goto LABEL_23;
  }
  if (self->_isResetSync)
  {
    if (!*((_BYTE *)v4 + 50))
      goto LABEL_23;
  }
  else if (*((_BYTE *)v4 + 50))
  {
    goto LABEL_23;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](sessionID, "isEqual:"))
    goto LABEL_23;
  if (self->_expectsRollbackSupport)
  {
    if (!*((_BYTE *)v4 + 49))
      goto LABEL_23;
  }
  else if (*((_BYTE *)v4 + 49))
  {
    goto LABEL_23;
  }
  if (!self->_expectsRestartSupport)
  {
    if (!*((_BYTE *)v4 + 48))
      goto LABEL_18;
LABEL_23:
    v9 = 0;
    goto LABEL_24;
  }
  if (!*((_BYTE *)v4 + 48))
    goto LABEL_23;
LABEL_18:
  if (self->_sessionTimeout != *((double *)v4 + 1))
    goto LABEL_23;
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](metadata, "isEqual:"))
      goto LABEL_23;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((_QWORD *)v4 + 4))
    v9 = -[NSString isEqual:](reason, "isEqual:");
  else
    v9 = 1;
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  _BOOL4 isResetSync;
  NSUInteger v5;
  _BOOL4 expectsRollbackSupport;
  _BOOL4 expectsRestartSupport;
  double sessionTimeout;
  double v9;
  long double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  isResetSync = self->_isResetSync;
  v5 = -[NSString hash](self->_sessionID, "hash");
  expectsRollbackSupport = self->_expectsRollbackSupport;
  expectsRestartSupport = self->_expectsRestartSupport;
  sessionTimeout = self->_sessionTimeout;
  v9 = -sessionTimeout;
  if (sessionTimeout >= 0.0)
    v9 = self->_sessionTimeout;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = fmod(v10, 1.84467441e19);
  v13 = 2654435761u * (unint64_t)v12;
  v14 = v13 + (unint64_t)v11;
  if (v11 <= 0.0)
    v14 = 2654435761u * (unint64_t)v12;
  v15 = v13 - (unint64_t)fabs(v11);
  if (v11 >= 0.0)
    v15 = v14;
  v16 = (2654435761 * isResetSync) ^ v3 ^ v5;
  v17 = (2654435761 * expectsRollbackSupport) ^ (2654435761 * expectsRestartSupport) ^ v15;
  v18 = v16 ^ -[NSData hash](self->_metadata, "hash");
  return v18 ^ -[NSString hash](self->_reason, "hash") ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SYMessageHeader *header;
  uint64_t v6;
  id v7;

  v4 = a3;
  header = self->_header;
  v6 = *((_QWORD *)v4 + 2);
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
    -[SYStartSyncSession setHeader:](self, "setHeader:");
  }
  v4 = v7;
LABEL_7:
  self->_isResetSync = *((_BYTE *)v4 + 50);
  if (*((_QWORD *)v4 + 5))
  {
    -[SYStartSyncSession setSessionID:](self, "setSessionID:");
    v4 = v7;
  }
  self->_expectsRollbackSupport = *((_BYTE *)v4 + 49);
  self->_expectsRestartSupport = *((_BYTE *)v4 + 48);
  self->_sessionTimeout = *((double *)v4 + 1);
  if (*((_QWORD *)v4 + 3))
  {
    -[SYStartSyncSession setMetadata:](self, "setMetadata:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SYStartSyncSession setReason:](self, "setReason:");
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

- (BOOL)isResetSync
{
  return self->_isResetSync;
}

- (void)setIsResetSync:(BOOL)a3
{
  self->_isResetSync = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (BOOL)expectsRollbackSupport
{
  return self->_expectsRollbackSupport;
}

- (void)setExpectsRollbackSupport:(BOOL)a3
{
  self->_expectsRollbackSupport = a3;
}

- (BOOL)expectsRestartSupport
{
  return self->_expectsRestartSupport;
}

- (void)setExpectsRestartSupport:(BOOL)a3
{
  self->_expectsRestartSupport = a3;
}

- (double)sessionTimeout
{
  return self->_sessionTimeout;
}

- (void)setSessionTimeout:(double)a3
{
  self->_sessionTimeout = a3;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYStartSyncSession writeTo:]", "SYStartSyncSession.m", 155, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYStartSyncSession writeTo:]", "SYStartSyncSession.m", 164, "nil != self->_sessionID");
}

@end
