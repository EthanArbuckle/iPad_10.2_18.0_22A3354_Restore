@implementation SYResetRequest

- (BOOL)hasCancelSessionID
{
  return self->_cancelSessionID != 0;
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
  v8.super_class = (Class)SYResetRequest;
  -[SYResetRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYResetRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *cancelSessionID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    -[SYMessageHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("header"));

  }
  cancelSessionID = self->_cancelSessionID;
  if (cancelSessionID)
    objc_msgSend(v3, "setObject:forKey:", cancelSessionID, CFSTR("cancelSessionID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYResetRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_header)
    -[SYResetRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_cancelSessionID)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setHeader:", self->_header);
  if (self->_cancelSessionID)
    objc_msgSend(v4, "setCancelSessionID:");

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
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_cancelSessionID, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SYMessageHeader *header;
  NSString *cancelSessionID;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((header = self->_header, !((unint64_t)header | v4[2])) || -[SYMessageHeader isEqual:](header, "isEqual:")))
  {
    cancelSessionID = self->_cancelSessionID;
    if ((unint64_t)cancelSessionID | v4[1])
      v7 = -[NSString isEqual:](cancelSessionID, "isEqual:");
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
  return -[NSString hash](self->_cancelSessionID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SYMessageHeader *header;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  header = self->_header;
  v6 = v4[2];
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
    -[SYResetRequest setHeader:](self, "setHeader:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[SYResetRequest setCancelSessionID:](self, "setCancelSessionID:");
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

- (NSString)cancelSessionID
{
  return self->_cancelSessionID;
}

- (void)setCancelSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_cancelSessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_cancelSessionID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYResetRequest writeTo:]", "SYResetRequest.m", 101, "self->_header != nil");
}

@end
