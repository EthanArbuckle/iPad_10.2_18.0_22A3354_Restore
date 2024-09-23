@implementation Plmn

- (BOOL)hasEncodedPlmn
{
  return self->_encodedPlmn != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)Plmn;
  v3 = -[Plmn description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Plmn dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encodedPlmn;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  encodedPlmn = self->_encodedPlmn;
  if (encodedPlmn)
    objc_msgSend(v3, "setObject:forKey:", encodedPlmn, CFSTR("encoded_plmn"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100077044((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *encodedPlmn;

  encodedPlmn = self->_encodedPlmn;
  if (encodedPlmn)
    PBDataWriterWriteDataField(a3, encodedPlmn, 1);
}

- (void)copyTo:(id)a3
{
  NSData *encodedPlmn;

  encodedPlmn = self->_encodedPlmn;
  if (encodedPlmn)
    objc_msgSend(a3, "setEncodedPlmn:", encodedPlmn);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_encodedPlmn, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  NSData *encodedPlmn;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    encodedPlmn = self->_encodedPlmn;
    if ((unint64_t)encodedPlmn | v4[1])
      v7 = -[NSData isEqual:](encodedPlmn, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSData hash](self->_encodedPlmn, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[Plmn setEncodedPlmn:](self, "setEncodedPlmn:");
}

- (NSData)encodedPlmn
{
  return self->_encodedPlmn;
}

- (void)setEncodedPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_encodedPlmn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedPlmn, 0);
}

@end
