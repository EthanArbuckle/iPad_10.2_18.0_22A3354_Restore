@implementation SYBatchSyncStart

- (void)setEstimatedChangeCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_estimatedChangeCount = a3;
}

- (void)setHasEstimatedChangeCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEstimatedChangeCount
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
  v8.super_class = (Class)SYBatchSyncStart;
  -[SYBatchSyncStart description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYBatchSyncStart dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *syncID;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    -[SYMessageHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("header"));

  }
  syncID = self->_syncID;
  if (syncID)
    objc_msgSend(v3, "setObject:forKey:", syncID, CFSTR("syncID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_estimatedChangeCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("estimatedChangeCount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYBatchSyncStartReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_header)
    -[SYBatchSyncStart writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (!self->_syncID)
    -[SYBatchSyncStart writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setHeader:", self->_header);
  objc_msgSend(v4, "setSyncID:", self->_syncID);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_estimatedChangeCount;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYMessageHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_syncID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_estimatedChangeCount;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SYMessageHeader *header;
  NSString *syncID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:"))
      goto LABEL_10;
  }
  syncID = self->_syncID;
  if ((unint64_t)syncID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](syncID, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_estimatedChangeCount == *((_DWORD *)v4 + 2))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_syncID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_estimatedChangeCount;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
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
    -[SYBatchSyncStart setHeader:](self, "setHeader:");
  }
  v4 = v7;
LABEL_7:
  if (*((_QWORD *)v4 + 3))
  {
    -[SYBatchSyncStart setSyncID:](self, "setSyncID:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_estimatedChangeCount = *((_DWORD *)v4 + 2);
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

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
  objc_storeStrong((id *)&self->_syncID, a3);
}

- (unsigned)estimatedChangeCount
{
  return self->_estimatedChangeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYBatchSyncStart writeTo:]", "SYBatchSyncStart.m", 121, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYBatchSyncStart writeTo:]", "SYBatchSyncStart.m", 126, "nil != self->_syncID");
}

@end
