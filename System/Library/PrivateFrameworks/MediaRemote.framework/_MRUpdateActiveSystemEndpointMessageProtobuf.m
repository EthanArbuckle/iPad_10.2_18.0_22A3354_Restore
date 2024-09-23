@implementation _MRUpdateActiveSystemEndpointMessageProtobuf

- (BOOL)hasRequest
{
  return self->_request != 0;
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
  v8.super_class = (Class)_MRUpdateActiveSystemEndpointMessageProtobuf;
  -[_MRUpdateActiveSystemEndpointMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRUpdateActiveSystemEndpointMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRUpdateActiveSystemEndpointRequestProtobuf *request;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  request = self->_request;
  if (request)
  {
    -[_MRUpdateActiveSystemEndpointRequestProtobuf dictionaryRepresentation](request, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRUpdateActiveSystemEndpointMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_request)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRUpdateActiveSystemEndpointRequestProtobuf *request;

  request = self->_request;
  if (request)
    objc_msgSend(a3, "setRequest:", request);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRUpdateActiveSystemEndpointRequestProtobuf copyWithZone:](self->_request, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRUpdateActiveSystemEndpointRequestProtobuf *request;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    request = self->_request;
    if ((unint64_t)request | v4[1])
      v6 = -[_MRUpdateActiveSystemEndpointRequestProtobuf isEqual:](request, "isEqual:");
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
  return -[_MRUpdateActiveSystemEndpointRequestProtobuf hash](self->_request, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRUpdateActiveSystemEndpointRequestProtobuf *request;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  request = self->_request;
  v6 = v4[1];
  if (request)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRUpdateActiveSystemEndpointRequestProtobuf mergeFrom:](request, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRUpdateActiveSystemEndpointMessageProtobuf setRequest:](self, "setRequest:");
    goto LABEL_6;
  }

}

- (_MRUpdateActiveSystemEndpointRequestProtobuf)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
