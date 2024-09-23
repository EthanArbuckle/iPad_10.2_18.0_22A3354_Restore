@implementation NPKProtoRevokeShareForPassIdentifierResponse

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
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
  v8.super_class = (Class)NPKProtoRevokeShareForPassIdentifierResponse;
  -[NPKProtoRevokeShareForPassIdentifierResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRevokeShareForPassIdentifierResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *errorData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_success);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("success"));

  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRevokeShareForPassIdentifierResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteBOOLField();
  if (self->_errorData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSData *errorData;

  *((_BYTE *)a3 + 16) = self->_success;
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(a3, "setErrorData:", errorData);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 16) = self->_success;
  v6 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *errorData;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_7;
  if (self->_success)
  {
    if (*((_BYTE *)v4 + 16))
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if (*((_BYTE *)v4 + 16))
    goto LABEL_7;
LABEL_4:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 1))
    v6 = -[NSData isEqual:](errorData, "isEqual:");
  else
    v6 = 1;
LABEL_8:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_success;
  return -[NSData hash](self->_errorData, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_success = *((_BYTE *)a3 + 16);
  if (*((_QWORD *)a3 + 1))
    -[NPKProtoRevokeShareForPassIdentifierResponse setErrorData:](self, "setErrorData:");
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
