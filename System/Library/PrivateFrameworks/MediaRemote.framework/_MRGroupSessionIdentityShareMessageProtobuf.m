@implementation _MRGroupSessionIdentityShareMessageProtobuf

- (BOOL)hasIdentity
{
  return self->_identity != 0;
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
  v8.super_class = (Class)_MRGroupSessionIdentityShareMessageProtobuf;
  -[_MRGroupSessionIdentityShareMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionIdentityShareMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRUserIdentityProtobuf *identity;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identity = self->_identity;
  if (identity)
  {
    -[_MRUserIdentityProtobuf dictionaryRepresentation](identity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionIdentityShareMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identity)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRUserIdentityProtobuf *identity;

  identity = self->_identity;
  if (identity)
    objc_msgSend(a3, "setIdentity:", identity);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRUserIdentityProtobuf copyWithZone:](self->_identity, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRUserIdentityProtobuf *identity;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    identity = self->_identity;
    if ((unint64_t)identity | v4[1])
      v6 = -[_MRUserIdentityProtobuf isEqual:](identity, "isEqual:");
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
  return -[_MRUserIdentityProtobuf hash](self->_identity, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRUserIdentityProtobuf *identity;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  identity = self->_identity;
  v6 = v4[1];
  if (identity)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRUserIdentityProtobuf mergeFrom:](identity, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRGroupSessionIdentityShareMessageProtobuf setIdentity:](self, "setIdentity:");
    goto LABEL_6;
  }

}

- (_MRUserIdentityProtobuf)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
