@implementation SYFileTransferInfo

- (BOOL)hasStartAnchor
{
  return self->_startAnchor != 0;
}

- (BOOL)hasEndAnchor
{
  return self->_endAnchor != 0;
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
  v8.super_class = (Class)SYFileTransferInfo;
  -[SYFileTransferInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYFileTransferInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *startAnchor;
  NSString *endAnchor;
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
  startAnchor = self->_startAnchor;
  if (startAnchor)
    objc_msgSend(v3, "setObject:forKey:", startAnchor, CFSTR("startAnchor"));
  endAnchor = self->_endAnchor;
  if (endAnchor)
    objc_msgSend(v3, "setObject:forKey:", endAnchor, CFSTR("endAnchor"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_decompressedFileSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("decompressedFileSize"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYFileTransferInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_header)
    -[SYFileTransferInfo writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_startAnchor)
    PBDataWriterWriteStringField();
  if (self->_endAnchor)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "setHeader:", self->_header);
  if (self->_startAnchor)
    objc_msgSend(v4, "setStartAnchor:");
  if (self->_endAnchor)
    objc_msgSend(v4, "setEndAnchor:");
  v4[1] = self->_decompressedFileSize;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYMessageHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_startAnchor, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_endAnchor, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v5[1] = self->_decompressedFileSize;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SYMessageHeader *header;
  NSString *startAnchor;
  NSString *endAnchor;
  BOOL v8;

  v4 = a3;
  v8 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((header = self->_header, !((unint64_t)header | v4[3])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((startAnchor = self->_startAnchor, !((unint64_t)startAnchor | v4[4]))
     || -[NSString isEqual:](startAnchor, "isEqual:"))
    && ((endAnchor = self->_endAnchor, !((unint64_t)endAnchor | v4[2]))
     || -[NSString isEqual:](endAnchor, "isEqual:"))
    && self->_decompressedFileSize == v4[1];

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_startAnchor, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_endAnchor, "hash") ^ (2654435761u * self->_decompressedFileSize);
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  SYMessageHeader *header;
  unint64_t v6;
  unint64_t *v7;

  v4 = (unint64_t *)a3;
  header = self->_header;
  v6 = v4[3];
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
    -[SYFileTransferInfo setHeader:](self, "setHeader:");
  }
  v4 = v7;
LABEL_7:
  if (v4[4])
  {
    -[SYFileTransferInfo setStartAnchor:](self, "setStartAnchor:");
    v4 = v7;
  }
  if (v4[2])
  {
    -[SYFileTransferInfo setEndAnchor:](self, "setEndAnchor:");
    v4 = v7;
  }
  self->_decompressedFileSize = v4[1];

}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSString)startAnchor
{
  return self->_startAnchor;
}

- (void)setStartAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_startAnchor, a3);
}

- (NSString)endAnchor
{
  return self->_endAnchor;
}

- (void)setEndAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_endAnchor, a3);
}

- (unint64_t)decompressedFileSize
{
  return self->_decompressedFileSize;
}

- (void)setDecompressedFileSize:(unint64_t)a3
{
  self->_decompressedFileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startAnchor, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_endAnchor, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYFileTransferInfo writeTo:]", "SYFileTransferInfo.m", 123, "self->_header != nil");
}

@end
