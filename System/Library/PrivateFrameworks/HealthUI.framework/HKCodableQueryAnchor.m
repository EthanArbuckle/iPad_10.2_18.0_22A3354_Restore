@implementation HKCodableQueryAnchor

- (NSData)encodedQueryAnchorData
{
  return self->_encodedQueryAnchorData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedQueryAnchorData, 0);
}

- (BOOL)hasEncodedQueryAnchorData
{
  return self->_encodedQueryAnchorData != 0;
}

- (void)setEncodedQueryAnchorData:(id)a3
{
  objc_storeStrong((id *)&self->_encodedQueryAnchorData, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_encodedQueryAnchorData)
    PBDataWriterWriteDataField();
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
  v8.super_class = (Class)HKCodableQueryAnchor;
  -[HKCodableQueryAnchor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableQueryAnchor dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encodedQueryAnchorData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  encodedQueryAnchorData = self->_encodedQueryAnchorData;
  if (encodedQueryAnchorData)
    objc_msgSend(v3, "setObject:forKey:", encodedQueryAnchorData, CFSTR("encodedQueryAnchorData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableQueryAnchorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  NSData *encodedQueryAnchorData;

  encodedQueryAnchorData = self->_encodedQueryAnchorData;
  if (encodedQueryAnchorData)
    objc_msgSend(a3, "setEncodedQueryAnchorData:", encodedQueryAnchorData);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_encodedQueryAnchorData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *encodedQueryAnchorData;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    encodedQueryAnchorData = self->_encodedQueryAnchorData;
    if ((unint64_t)encodedQueryAnchorData | v4[1])
      v6 = -[NSData isEqual:](encodedQueryAnchorData, "isEqual:");
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
  return -[NSData hash](self->_encodedQueryAnchorData, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[HKCodableQueryAnchor setEncodedQueryAnchorData:](self, "setEncodedQueryAnchorData:");
}

@end
