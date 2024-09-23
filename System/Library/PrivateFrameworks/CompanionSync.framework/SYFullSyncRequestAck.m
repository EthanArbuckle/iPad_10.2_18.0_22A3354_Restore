@implementation SYFullSyncRequestAck

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasInProgressSyncID
{
  return self->_inProgressSyncID != 0;
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
  v8.super_class = (Class)SYFullSyncRequestAck;
  -[SYFullSyncRequestAck description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYFullSyncRequestAck dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *requestSyncID;
  void *v7;
  SYErrorInfo *error;
  void *v9;
  NSString *inProgressSyncID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    -[SYMessageHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("header"));

  }
  requestSyncID = self->_requestSyncID;
  if (requestSyncID)
    objc_msgSend(v3, "setObject:forKey:", requestSyncID, CFSTR("requestSyncID"));
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
  inProgressSyncID = self->_inProgressSyncID;
  if (inProgressSyncID)
    objc_msgSend(v3, "setObject:forKey:", inProgressSyncID, CFSTR("inProgressSyncID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYFullSyncRequestAckReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_header)
    -[SYFullSyncRequestAck writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_requestSyncID)
    -[SYFullSyncRequestAck writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (self->_error)
    PBDataWriterWriteSubmessage();
  if (self->_inProgressSyncID)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _BYTE *v5;

  v5 = a3;
  objc_msgSend(v5, "setHeader:", self->_header);
  objc_msgSend(v5, "setRequestSyncID:", self->_requestSyncID);
  v4 = v5;
  v5[40] = self->_accepted;
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    v4 = v5;
  }
  if (self->_inProgressSyncID)
  {
    objc_msgSend(v5, "setInProgressSyncID:");
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

  v8 = -[NSString copyWithZone:](self->_requestSyncID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  *(_BYTE *)(v5 + 40) = self->_accepted;
  v10 = -[SYErrorInfo copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NSString copyWithZone:](self->_inProgressSyncID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SYMessageHeader *header;
  NSString *requestSyncID;
  SYErrorInfo *error;
  NSString *inProgressSyncID;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:"))
      goto LABEL_14;
  }
  requestSyncID = self->_requestSyncID;
  if ((unint64_t)requestSyncID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](requestSyncID, "isEqual:"))
      goto LABEL_14;
  }
  if (self->_accepted)
  {
    if (!*((_BYTE *)v4 + 40))
      goto LABEL_14;
  }
  else if (*((_BYTE *)v4 + 40))
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1) && !-[SYErrorInfo isEqual:](error, "isEqual:"))
    goto LABEL_14;
  inProgressSyncID = self->_inProgressSyncID;
  if ((unint64_t)inProgressSyncID | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](inProgressSyncID, "isEqual:");
  else
    v9 = 1;
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_requestSyncID, "hash") ^ v3;
  v5 = 2654435761 * self->_accepted;
  v6 = v4 ^ -[SYErrorInfo hash](self->_error, "hash");
  return v6 ^ -[NSString hash](self->_inProgressSyncID, "hash") ^ v5;
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
    -[SYFullSyncRequestAck setHeader:](self, "setHeader:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 4))
  {
    -[SYFullSyncRequestAck setRequestSyncID:](self, "setRequestSyncID:");
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
    -[SYFullSyncRequestAck setError:](self, "setError:");
  }
  v4 = v9;
LABEL_15:
  if (*((_QWORD *)v4 + 3))
  {
    -[SYFullSyncRequestAck setInProgressSyncID:](self, "setInProgressSyncID:");
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

- (NSString)requestSyncID
{
  return self->_requestSyncID;
}

- (void)setRequestSyncID:(id)a3
{
  objc_storeStrong((id *)&self->_requestSyncID, a3);
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

- (NSString)inProgressSyncID
{
  return self->_inProgressSyncID;
}

- (void)setInProgressSyncID:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressSyncID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSyncID, 0);
  objc_storeStrong((id *)&self->_inProgressSyncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYFullSyncRequestAck writeTo:]", "SYFullSyncRequestAck.m", 147, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYFullSyncRequestAck writeTo:]", "SYFullSyncRequestAck.m", 152, "nil != self->_requestSyncID");
}

@end
