@implementation _MRRequestGroupSessionMessageProtobuf

- (BOOL)hasDetails
{
  return self->_details != 0;
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
  v8.super_class = (Class)_MRRequestGroupSessionMessageProtobuf;
  -[_MRRequestGroupSessionMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRequestGroupSessionMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRRequestDetailsProtobuf *details;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  details = self->_details;
  if (details)
  {
    -[_MRRequestDetailsProtobuf dictionaryRepresentation](details, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("details"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRequestGroupSessionMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_details)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRRequestDetailsProtobuf *details;

  details = self->_details;
  if (details)
    objc_msgSend(a3, "setDetails:", details);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRRequestDetailsProtobuf copyWithZone:](self->_details, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRRequestDetailsProtobuf *details;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    details = self->_details;
    if ((unint64_t)details | v4[1])
      v6 = -[_MRRequestDetailsProtobuf isEqual:](details, "isEqual:");
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
  return -[_MRRequestDetailsProtobuf hash](self->_details, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRRequestDetailsProtobuf *details;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  details = self->_details;
  v6 = v4[1];
  if (details)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRRequestDetailsProtobuf mergeFrom:](details, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRRequestGroupSessionMessageProtobuf setDetails:](self, "setDetails:");
    goto LABEL_6;
  }

}

- (_MRRequestDetailsProtobuf)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
}

@end
