@implementation SYBatchChunkAck

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
  v8.super_class = (Class)SYBatchChunkAck;
  -[SYBatchChunkAck description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYBatchChunkAck dictionaryRepresentation](self, "dictionaryRepresentation");
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
  syncID = self->_syncID;
  if (syncID)
    objc_msgSend(v3, "setObject:forKey:", syncID, CFSTR("syncID"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chunkIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("chunkIndex"));

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
  return SYBatchChunkAckReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_header)
    -[SYBatchChunkAck writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (!self->_syncID)
    -[SYBatchChunkAck writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_error)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _DWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "setHeader:", self->_header);
  objc_msgSend(v5, "setSyncID:", self->_syncID);
  v4 = v5;
  v5[2] = self->_chunkIndex;
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
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_syncID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  *(_DWORD *)(v5 + 8) = self->_chunkIndex;
  v10 = -[SYErrorInfo copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SYMessageHeader *header;
  NSString *syncID;
  SYErrorInfo *error;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((header = self->_header, !((unint64_t)header | v4[3])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((syncID = self->_syncID, !((unint64_t)syncID | v4[4]))
     || -[NSString isEqual:](syncID, "isEqual:"))
    && self->_chunkIndex == *((_DWORD *)v4 + 2))
  {
    error = self->_error;
    if ((unint64_t)error | v4[2])
      v8 = -[SYErrorInfo isEqual:](error, "isEqual:");
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
  NSUInteger v4;
  uint64_t v5;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_syncID, "hash") ^ v3;
  v5 = 2654435761 * self->_chunkIndex;
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
  v6 = *((_QWORD *)v4 + 3);
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
    -[SYBatchChunkAck setHeader:](self, "setHeader:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 4))
  {
    -[SYBatchChunkAck setSyncID:](self, "setSyncID:");
    v4 = v9;
  }
  self->_chunkIndex = *((_DWORD *)v4 + 2);
  error = self->_error;
  v8 = *((_QWORD *)v4 + 2);
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
    -[SYBatchChunkAck setError:](self, "setError:");
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

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
  objc_storeStrong((id *)&self->_syncID, a3);
}

- (unsigned)chunkIndex
{
  return self->_chunkIndex;
}

- (void)setChunkIndex:(unsigned int)a3
{
  self->_chunkIndex = a3;
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
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYBatchChunkAck writeTo:]", "SYBatchChunkAck.m", 132, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYBatchChunkAck writeTo:]", "SYBatchChunkAck.m", 137, "nil != self->_syncID");
}

@end
