@implementation NPKProtoRemoveExpressPassWithUniqueIdentifierRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
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
  v8.super_class = (Class)NPKProtoRemoveExpressPassWithUniqueIdentifierRequest;
  -[NPKProtoRemoveExpressPassWithUniqueIdentifierRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemoveExpressPassWithUniqueIdentifierRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v3, "setObject:forKey:", uniqueID, CFSTR("uniqueID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemoveExpressPassWithUniqueIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *uniqueID;

  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(a3, "setUniqueID:", uniqueID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uniqueID;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    uniqueID = self->_uniqueID;
    if ((unint64_t)uniqueID | v4[1])
      v6 = -[NSString isEqual:](uniqueID, "isEqual:");
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
  return -[NSString hash](self->_uniqueID, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NPKProtoRemoveExpressPassWithUniqueIdentifierRequest setUniqueID:](self, "setUniqueID:");
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
