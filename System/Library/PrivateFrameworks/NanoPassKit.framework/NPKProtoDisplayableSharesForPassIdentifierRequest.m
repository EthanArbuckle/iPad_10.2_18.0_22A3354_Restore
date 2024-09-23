@implementation NPKProtoDisplayableSharesForPassIdentifierRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoDisplayableSharesForPassIdentifierRequest;
  -[NPKProtoDisplayableSharesForPassIdentifierRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoDisplayableSharesForPassIdentifierRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passIdentifier = self->_passIdentifier;
  if (passIdentifier)
    objc_msgSend(v3, "setObject:forKey:", passIdentifier, CFSTR("passIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoDisplayableSharesForPassIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_passIdentifier)
    -[NPKProtoDisplayableSharesForPassIdentifierRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setPassIdentifier:", self->_passIdentifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *passIdentifier;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    passIdentifier = self->_passIdentifier;
    if ((unint64_t)passIdentifier | v4[1])
      v6 = -[NSString isEqual:](passIdentifier, "isEqual:");
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
  return -[NSString hash](self->_passIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NPKProtoDisplayableSharesForPassIdentifierRequest setPassIdentifier:](self, "setPassIdentifier:");
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void)setPassIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoDisplayableSharesForPassIdentifierRequest writeTo:]", "NPKProtoDisplayableSharesForPassIdentifierRequest.m", 72, "nil != self->_passIdentifier");
}

@end
