@implementation SYSyncEndResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (int)errorResolution
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_errorResolution;
  else
    return 0;
}

- (void)setErrorResolution:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorResolution = a3;
}

- (void)setHasErrorResolution:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorResolution
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)errorResolutionAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Ignore");
  if (a3 == 1)
  {
    v3 = CFSTR("Retry");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsErrorResolution:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Ignore")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Retry"));

  return v4;
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
  v8.super_class = (Class)SYSyncEndResponse;
  -[SYSyncEndResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSyncEndResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  SYErrorInfo *error;
  void *v8;
  int errorResolution;
  __CFString *v10;

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
  error = self->_error;
  if (error)
  {
    -[SYErrorInfo dictionaryRepresentation](error, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("error"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    errorResolution = self->_errorResolution;
    if (errorResolution)
    {
      if (errorResolution == 1)
      {
        v10 = CFSTR("Retry");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_errorResolution);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = CFSTR("Ignore");
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("errorResolution"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYSyncEndResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_header)
    -[SYSyncEndResponse writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_syncID)
    -[SYSyncEndResponse writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if (self->_error)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setHeader:", self->_header);
  objc_msgSend(v4, "setSyncID:", self->_syncID);
  if (self->_error)
    objc_msgSend(v4, "setError:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_errorResolution;
    *((_BYTE *)v4 + 40) |= 1u;
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

  v10 = -[SYErrorInfo copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_errorResolution;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SYMessageHeader *header;
  NSString *syncID;
  SYErrorInfo *error;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 3))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:"))
      goto LABEL_12;
  }
  syncID = self->_syncID;
  if ((unint64_t)syncID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](syncID, "isEqual:"))
      goto LABEL_12;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1))
  {
    if (!-[SYErrorInfo isEqual:](error, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_errorResolution == *((_DWORD *)v4 + 4))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_syncID, "hash");
  v5 = -[SYErrorInfo hash](self->_error, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_errorResolution;
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
    -[SYSyncEndResponse setHeader:](self, "setHeader:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 4))
  {
    -[SYSyncEndResponse setSyncID:](self, "setSyncID:");
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
    -[SYSyncEndResponse setError:](self, "setError:");
  }
  v4 = v9;
LABEL_15:
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_errorResolution = *((_DWORD *)v4 + 4);
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
  __assert_rtn("-[SYSyncEndResponse writeTo:]", "SYSyncEndResponse.m", 161, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYSyncEndResponse writeTo:]", "SYSyncEndResponse.m", 166, "nil != self->_syncID");
}

@end
