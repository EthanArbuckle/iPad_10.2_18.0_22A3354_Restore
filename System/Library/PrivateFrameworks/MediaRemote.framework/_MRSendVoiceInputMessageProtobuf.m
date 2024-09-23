@implementation _MRSendVoiceInputMessageProtobuf

- (BOOL)hasDataBlock
{
  return self->_dataBlock != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRSendVoiceInputMessageProtobuf;
  -[_MRSendVoiceInputMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendVoiceInputMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRAudioDataBlockProtobuf *dataBlock;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dataBlock = self->_dataBlock;
  if (dataBlock)
  {
    -[_MRAudioDataBlockProtobuf dictionaryRepresentation](dataBlock, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dataBlock"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendVoiceInputMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_dataBlock)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRAudioDataBlockProtobuf *dataBlock;

  dataBlock = self->_dataBlock;
  if (dataBlock)
    objc_msgSend(a3, "setDataBlock:", dataBlock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRAudioDataBlockProtobuf copyWithZone:](self->_dataBlock, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRAudioDataBlockProtobuf *dataBlock;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    dataBlock = self->_dataBlock;
    if ((unint64_t)dataBlock | v4[1])
      v6 = -[_MRAudioDataBlockProtobuf isEqual:](dataBlock, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[_MRAudioDataBlockProtobuf hash](self->_dataBlock, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRAudioDataBlockProtobuf *dataBlock;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  dataBlock = self->_dataBlock;
  v6 = v4[1];
  if (dataBlock)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRAudioDataBlockProtobuf mergeFrom:](dataBlock, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRSendVoiceInputMessageProtobuf setDataBlock:](self, "setDataBlock:");
    goto LABEL_6;
  }

}

- (_MRAudioDataBlockProtobuf)dataBlock
{
  return self->_dataBlock;
}

- (void)setDataBlock:(id)a3
{
  objc_storeStrong((id *)&self->_dataBlock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBlock, 0);
}

@end
