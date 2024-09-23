@implementation SYResetResponse

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
  v8.super_class = (Class)SYResetResponse;
  -[SYResetResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYResetResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  SYErrorInfo *error;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    -[SYMessageHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("header"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_accepted);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("accepted"));

  error = self->_error;
  if (error)
  {
    -[SYErrorInfo dictionaryRepresentation](error, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("error"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYResetResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_header)
    -[SYResetResponse writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
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
  v4 = v5;
  v5[24] = self->_accepted;
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
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYMessageHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_BYTE *)(v5 + 24) = self->_accepted;
  v8 = -[SYErrorInfo copyWithZone:](self->_error, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SYMessageHeader *header;
  SYErrorInfo *error;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:"))
      goto LABEL_9;
  }
  if (self->_accepted)
  {
    if (*((_BYTE *)v4 + 24))
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  if (*((_BYTE *)v4 + 24))
    goto LABEL_9;
LABEL_6:
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1))
    v7 = -[SYErrorInfo isEqual:](error, "isEqual:");
  else
    v7 = 1;
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = 2654435761 * self->_accepted;
  return v4 ^ v3 ^ -[SYErrorInfo hash](self->_error, "hash");
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
    -[SYResetResponse setHeader:](self, "setHeader:");
  }
  v4 = v9;
LABEL_7:
  self->_accepted = *((_BYTE *)v4 + 24);
  error = self->_error;
  v8 = *((_QWORD *)v4 + 1);
  if (error)
  {
    if (v8)
    {
      -[SYErrorInfo mergeFrom:](error, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SYResetResponse setError:](self, "setError:");
    goto LABEL_12;
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
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYResetResponse writeTo:]", "SYResetResponse.m", 121, "self->_header != nil");
}

@end
