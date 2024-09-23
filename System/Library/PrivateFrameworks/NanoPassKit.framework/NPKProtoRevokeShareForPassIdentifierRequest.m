@implementation NPKProtoRevokeShareForPassIdentifierRequest

- (void)setShouldCascade:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldCascade = a3;
}

- (void)setHasShouldCascade:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldCascade
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NPKProtoRevokeShareForPassIdentifierRequest;
  -[NPKProtoRevokeShareForPassIdentifierRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRevokeShareForPassIdentifierRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passIdentifier = self->_passIdentifier;
  if (passIdentifier)
    objc_msgSend(v3, "setObject:forKey:", passIdentifier, CFSTR("passIdentifier"));
  shareData = self->_shareData;
  if (shareData)
    objc_msgSend(v4, "setObject:forKey:", shareData, CFSTR("shareData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldCascade);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("shouldCascade"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRevokeShareForPassIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_passIdentifier)
    -[NPKProtoRevokeShareForPassIdentifierRequest writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_shareData)
    -[NPKProtoRevokeShareForPassIdentifierRequest writeTo:].cold.2();
  PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;

  v4 = a3;
  objc_msgSend(v4, "setPassIdentifier:", self->_passIdentifier);
  objc_msgSend(v4, "setShareData:", self->_shareData);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_shouldCascade;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSData copyWithZone:](self->_shareData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_shouldCascade;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *passIdentifier;
  NSData *shareData;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  passIdentifier = self->_passIdentifier;
  if ((unint64_t)passIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](passIdentifier, "isEqual:"))
      goto LABEL_8;
  }
  shareData = self->_shareData;
  if ((unint64_t)shareData | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](shareData, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_shouldCascade)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_passIdentifier, "hash");
  v4 = -[NSData hash](self->_shareData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_shouldCascade;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoRevokeShareForPassIdentifierRequest setPassIdentifier:](self, "setPassIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoRevokeShareForPassIdentifierRequest setShareData:](self, "setShareData:");
    v4 = v5;
  }
  if (v4[28])
  {
    self->_shouldCascade = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }

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

- (BOOL)shouldCascade
{
  return self->_shouldCascade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareData, 0);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRevokeShareForPassIdentifierRequest writeTo:]", "NPKProtoRevokeShareForPassIdentifierRequest.m", 107, "nil != self->_passIdentifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoRevokeShareForPassIdentifierRequest writeTo:]", "NPKProtoRevokeShareForPassIdentifierRequest.m", 112, "nil != self->_shareData");
}

@end
