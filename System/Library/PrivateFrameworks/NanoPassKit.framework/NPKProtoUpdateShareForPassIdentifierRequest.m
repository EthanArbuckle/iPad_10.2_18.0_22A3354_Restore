@implementation NPKProtoUpdateShareForPassIdentifierRequest

- (BOOL)hasAuthorization
{
  return self->_authorization != 0;
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
  v8.super_class = (Class)NPKProtoUpdateShareForPassIdentifierRequest;
  -[NPKProtoUpdateShareForPassIdentifierRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoUpdateShareForPassIdentifierRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *shareData;
  NSData *authorization;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passIdentifier = self->_passIdentifier;
  if (passIdentifier)
    objc_msgSend(v3, "setObject:forKey:", passIdentifier, CFSTR("passIdentifier"));
  shareData = self->_shareData;
  if (shareData)
    objc_msgSend(v4, "setObject:forKey:", shareData, CFSTR("shareData"));
  authorization = self->_authorization;
  if (authorization)
    objc_msgSend(v4, "setObject:forKey:", authorization, CFSTR("authorization"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdateShareForPassIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_passIdentifier)
    -[NPKProtoUpdateShareForPassIdentifierRequest writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_shareData)
    -[NPKProtoUpdateShareForPassIdentifierRequest writeTo:].cold.2();
  PBDataWriterWriteDataField();
  if (self->_authorization)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setPassIdentifier:", self->_passIdentifier);
  objc_msgSend(v4, "setShareData:", self->_shareData);
  if (self->_authorization)
    objc_msgSend(v4, "setAuthorization:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_shareData, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_authorization, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *passIdentifier;
  NSData *shareData;
  NSData *authorization;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((passIdentifier = self->_passIdentifier, !((unint64_t)passIdentifier | v4[2]))
     || -[NSString isEqual:](passIdentifier, "isEqual:"))
    && ((shareData = self->_shareData, !((unint64_t)shareData | v4[3]))
     || -[NSData isEqual:](shareData, "isEqual:")))
  {
    authorization = self->_authorization;
    if ((unint64_t)authorization | v4[1])
      v8 = -[NSData isEqual:](authorization, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_passIdentifier, "hash");
  v4 = -[NSData hash](self->_shareData, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_authorization, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[NPKProtoUpdateShareForPassIdentifierRequest setPassIdentifier:](self, "setPassIdentifier:");
  if (v4[3])
    -[NPKProtoUpdateShareForPassIdentifierRequest setShareData:](self, "setShareData:");
  if (v4[1])
    -[NPKProtoUpdateShareForPassIdentifierRequest setAuthorization:](self, "setAuthorization:");

}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void)setPassIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passIdentifier, a3);
}

- (NSData)shareData
{
  return self->_shareData;
}

- (void)setShareData:(id)a3
{
  objc_storeStrong((id *)&self->_shareData, a3);
}

- (NSData)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_authorization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareData, 0);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoUpdateShareForPassIdentifierRequest writeTo:]", "NPKProtoUpdateShareForPassIdentifierRequest.m", 98, "nil != self->_passIdentifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoUpdateShareForPassIdentifierRequest writeTo:]", "NPKProtoUpdateShareForPassIdentifierRequest.m", 103, "nil != self->_shareData");
}

@end
