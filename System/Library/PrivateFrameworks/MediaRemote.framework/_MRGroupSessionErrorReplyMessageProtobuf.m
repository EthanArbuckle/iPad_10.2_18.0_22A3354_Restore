@implementation _MRGroupSessionErrorReplyMessageProtobuf

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
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
  v8.super_class = (Class)_MRGroupSessionErrorReplyMessageProtobuf;
  -[_MRGroupSessionErrorReplyMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionErrorReplyMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *errorMessage;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  errorMessage = self->_errorMessage;
  if (errorMessage)
    objc_msgSend(v3, "setObject:forKey:", errorMessage, CFSTR("errorMessage"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionErrorReplyMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_errorMessage)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *errorMessage;

  errorMessage = self->_errorMessage;
  if (errorMessage)
    objc_msgSend(a3, "setErrorMessage:", errorMessage);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_errorMessage, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *errorMessage;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    errorMessage = self->_errorMessage;
    if ((unint64_t)errorMessage | v4[1])
      v6 = -[NSString isEqual:](errorMessage, "isEqual:");
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
  return -[NSString hash](self->_errorMessage, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[_MRGroupSessionErrorReplyMessageProtobuf setErrorMessage:](self, "setErrorMessage:");
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end
